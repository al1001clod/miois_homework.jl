export getdigits, touppercase, firstnorm, secondnorm, infnorm, isleap, chesscolor

function getdigits(a)
    digits = [] 
    while a > 0 
        push!(digits, a % 10) 
        a = div(a, 10) 
    end
end

function touppercase(str_)
    return uppercase(str_)
end

function firstnorm(vec_::AbstractVector{<:Number})
    norm = 0.0
    for v in vec_
        norm += abs(v)
    end
    return norm
end
println(firstnorm([2, -3, 6])) 

    
    
function secondnorm(vec_::AbstractVector{<:Number})
    sum_of_squares = 0.0 
    for v in vec_ 
        sum_of_squares += v^2 
    end 
    return sqrt(sum_of_squares)
end
println(secondnorm([2, -3, 6])) 


function infnorm(vec_::AbstractVector{<:Number})
    max_abs_value = 0.0 
    for v in vec_ 
        max_abs_value = max(max_abs_value, abs(v)) 
    end 
    return max_abs_value
end
println(infnorm([2, -3, 6])) 

function firstnorm(mat_::AbstractMatrix{<:Number})
    max_row_sum = 0.0
    for row in eachrow(mat_)
        row_sum = sum(abs.(row))
        max_row_sum = max(max_row_sum, row_sum)
    end
    return max_row_sum
end

matrix = [4 -6 7; -2 3 -1; 9 6 -3] 
println(firstnorm(matrix)) 


function infnorm(mat_::AbstractMatrix{<:Number})
    max_col_sum = 0.0
    for col in 1:size(mat_, 2)
        col_sum = sum(abs.(mat_[:, col]))
        max_col_sum = max(max_col_sum, col_sum)
    end
    return max_col_sum
end

matrix = [4 -6 7; -2 3 -1; 9 6 -3] 
println(infnorm(matrix)) 


function isleap(year)
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
end
println(isleap(2024))


function chesscolor(cell1::String, cell2::String)
    col1 = Int(cell1[1]) - Int('a') + 1
    col2 = Int(cell2[1]) - Int('a') + 1

    row1 = parse(Int, cell1[2])
    row2 = parse(Int, cell2[2])

    color1 = (col1 + row1) % 2
    color2 = (col2 + row2) % 2

    return color1 == color2  
end

println(chesscolor("a3", "c4"))  
