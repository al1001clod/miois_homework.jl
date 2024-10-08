export getdigits, touppercase, firstnorm, secondnorm, infnorm, isleap, chesscolor

function getdigits(a)
    digits = [] 
    while a > 0 
        push!(digits, a % 10) 
        a = div(a, 10) 
    end
    return digits[end:-1:1]
end

function touppercase(str_)
    return uppercase(str_)
end

function firstnorm(vec_::AbstractVector{<:Number})
    norm=0
    for i in vec_ 
         norm=norm+abs(i)
    end
    return norm;
end

function secondnorm(vec_::AbstractVector{<:Number})
    norm=0
    for i in vec_ 
         norm=norm+i^2
    end
    return sqrt(norm);
end

function infnorm(vec_::AbstractVector{<:Number})
    norm=0
    for i in vec_
        if i>norm
            norm=i
        end
    end
    return norm;
end

function firstnorm(vec_::AbstractMatrix{<:Number})
    rows, cols = size(vec_)
    max=0
    for j in 1:cols
        s=0
        for i in 1:rows
            s=s+vec_[i,j]
        end
        if s>max
            max=s
        end
    end
    return max;
end

function infnorm(vec_::AbstractMatrix{<:Number})
    max=0
    rows, cols = size(vec_)
    for i in 1:rows
        s=0
        for j in 1:cols
            s=s+vec_[i,j]
        end
        if s>max
            max=s
        end
    end
    return max;
end


function isleap(year)
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
end
println(isleap(2024))


function chesscolor(cell1,cell2)
    x=Int(cell1[1])
    y=Int(cell2[1])
    if (cell1[2]+x)%2 == (cell2[2]+y)%2 == 0 
        return true;
    elseif (cell1[2]+x)%2 == (cell2[2]+y)%2 == 1
        return true;
    else return false;
    end
end
