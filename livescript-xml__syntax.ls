@xml=(o={tag:\div self:false})->(opts,...inner)~> switch
	| !o.self*opts.length => "<#{o.tag}>#opts #{inner*' '}</#{o.tag}>"
	| !o.self*!opts.length=> '<'+o.tag+[" #{i}=\"#{opts[i]}\"" for i of opts]+">#{inner*' '}</#{o.tag}>"		 
	| _=> '<'+o.tag+[" #i=\"#{opts[i]}\"" for i of opts]+\/>
		
