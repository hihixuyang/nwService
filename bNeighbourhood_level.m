function bNeighbourhood_level(base)

global numCells gridpoints_x gridpoints_y gridCells d_max;

d_max = p_poly_dist(gridpoints_x(numCells),gridpoints_y(numCells),base.xpoly,base.ypoly);
upperL = round(d_max);
d_max = upperL;

indices = cell(1,upperL);


for i = 1:upperL-1
   
    nIndices = get_neighbours_in_range(base.indices,i+0.5);
    nIndices(nIndices == 0) = [];
    indices{1,i} = nIndices;
    
    if i ==1
        processedIndices = nIndices;    
%     elseif i == 2
%        indices{1,i} = setdiff(indices{1,i},processedIndices);        
    elseif i>1 && i<upperL       
       indices{1,i} = setdiff(indices{1,i},processedIndices); 
       processedIndices = [processedIndices indices{1,i}];
    end
    
end

cells = setdiff((1:numCells),base.indices);
indices{1,upperL} = setdiff(cells,processedIndices);

for i = 1:upperL
   [gridCells(indices{1,i}).bNeighL] = deal(i); 
end
