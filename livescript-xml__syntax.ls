@xml=(o={tag:\div self:false})->(opts,...inner)~> switch
	| !o.self*opts.length => "<#{o.tag}>#opts #{inner*' '}</#{o.tag}>"
	| !o.self*!opts.length=> '<'+o.tag+[" #{i}=\"#{opts[i]}\"" for i of opts]+">#{inner*' '}</#{o.tag}>"		 
	| _=> '<'+o.tag+[" #i=\"#{opts[i]}\"" for i of opts]+\/>

@xml__init=(self)~>(tag)~>this[tag]=xml {tag, self}
prelude.each xml__init(false), <[ div span a p h4 h3 h2 h1 button table thead tr th tbody td small ul ol li span label select option textarea form output i sub time section html head body title script footer header article link nav figure figcaption tfoot video source type iframe ]>
prelude.each xml__init(true), <[ input link img meta source br hr ]>



#######————————————————————————————————————————————— EXAMPLE 1
header class:\header,
	div class:\container,
		div class:\header__social,
			a href:\# class:\header__social__oldsite, 'прежний сайт'
			a href:\# title:\ВКонтакте class:\header__social__vk
			a href:\# title:\Facebook class:\header__social__fb
			a href:\# title:\Twitter class:\header__social__twitter
			a href:\# title:\Youtube class:\header__social__youtube

			
#######————————————————————————————————————————————— EXAMPLE 2			
head {},
	meta name:\robots      content:"#index, #follow"
	meta name:\Description content:desc
	meta name:\Keywords    content:keywords
	meta charset:\utf-8
	meta name:\viewport content:"width=device-width, initial-scale=1, shrink-to-fit=no"
	meta http-equiv:\x-ua-compatible content:\ie=edge 
	link rel:\stylesheet type:\text/css href:\/css/style.css 
	link rel:\stylesheet type:\text/css href:\/css/style_plus.css
	
	
#######————————————————————————————————————————————— EXAMPLE 3
newImage:(cell)-> div class:'input-group img__container' style:'margin-bottom:2px; margin-top:2px',      
	span class:'input-group-addon input-group-addon-image sortable-handle',      
		span type:'button' class:'close label label-default label-on-image' onclick:"$(this).parents('.img__container').remove()" toggle:'tooltip'  data-placement:'bottom' title:'Удалить изображение', i style:'color:white' class:'fa fa-times fa-fw'
		span type:'button' class:'close label label-default label-on-image fileUpload'  toggle:'tooltip'  data-placement:'bottom' title:'Заменить изображение', i style:'color:white' class:'fa fa-refresh fa-fw',
			form class:'editor-file-upload' enctype:'multipartform-data',         
				input type:'file' class:'upload img__reload' name:'upload[]' accept:'image*' value:'images'
				input type:'hidden' class:\img__reload name:'type' value:'image'
		img {class:'images-in-galery close' style:'z-index:1', src:cell?src||'', trueSrc:cell.trueSrc||''}
	div class:'form-control form-control-cell img__text' contenteditable:\true placeholder:'Описание изображения', cell?alt||''
	div class:'form-control form-control-cell img__comment' contenteditable:\true placeholder:'Дополнительная информация', cell?com||''

	
#######————————————————————————————————————————————— EXAMPLE 4	
CellWrap:~> div class:'input-group input-group-sm',
	div class:'input-group-addon' style:\padding:3px,
		a class:\btn-default toggle:\tooltip data-placement:\top title:"#{@Tools!bot} (скопировать)", i class:"fa fa-fw #{@Tools!ico}"
		a class:\btn-default toggle:\tooltip data-placement:\bottom title:'Удалить ячейку', i class: 'fa fa-remove'
	div class:\cont, div class:\form-control, it	

#######————————————————————————————————————————————— EXAMPLE 5	
class @HeaderCellClass extends CellClass
	Tools:-> name:\HeaderCell top:\Заголовок bot:\Заголовок ico:\fa-header
	H_BTN:(lvl,N)-> span name:String(N), class:"btn btn-#{if lvl==N=> 'default' else 'neutral'} btn__header" toggle:\tooltip data-placement:\top title:"Заголовок #N уровня", i class:'fa fa-header' name:String(N), sub style:'font-weight:bold' name:String(N), N
	panel:(N=\1,T='')-> div unwords(@H_BTN(N, _)`map`<[ 1 2 3 4 ]>)+input class:\form-control style:"font-size:#{40-5*(+N)}px;height:#{55-5*(+N)}px" value:T

#######————————————————————————————————————————————— EXAMPLE 6	
F_BTN:->span class:\btn-neutral toggle:\tooltip name:it[0]; title:it[1], i class:"fa #{it[2]}"		
	
