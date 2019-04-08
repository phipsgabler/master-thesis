t = @macroexpand1 (@model gdemo(x) = begin
                       # Set priors.
                       s ~ InverseGamma(2,3)
                       m ~ Normal(0,sqrt(s))
                       # Observe each value of x.
                       [x ~ Normal(m, sqrt(s))]
                   end)

# open("extracted.txt", "w") do io
    # print(io, t |> MacroTools.striplines |> MacroTools.flatten |> MacroTools.gensym_ids)
# end


begin
    gdemo(; x=nothing) = gdemo(x)
    
    function gdemo(x=nothing)
        (pvars_1, dvars_2) = Turing.get_vars(Tuple{:s,:m}, (x = x,))
        data_3 = Turing.get_data(dvars_2, (x = x,))
        defaults_4 = Turing.get_default_values((x = x,), (x = :nothing,))
        
        function inner_function_5(sampler_6::Turing.AbstractSampler, model_7)
            return inner_function_5(model_7)
        end
        
        function inner_function_5(model_7)
            return inner_function_5(Turing.VarInfo(), Turing.SampleFromPrior(), model_7)
        end
        
        function inner_function_5(vi_8::Turing.VarInfo, model_7)
            return inner_function_5(vi_8, Turing.SampleFromPrior(), model_7)
        end
        
        function inner_function_5(vi_8::Turing.VarInfo, sampler_6::Turing.AbstractSampler, model_7)
            local x
            if isdefined(model_7.data, :x)
                x = (model_7.data).x
            else
                x = (model_7.defaults).x
            end
            
            vi_8.logp = zero(Real)
            
            (sym_9, idcs_10, csym_11) = Turing.@VarName(s)
            csym_11 = Symbol(:gdemo, csym_11)
            syms_12 = Symbol[csym_11, :s]
            varname_13 = Turing.VarName(vi_8, syms_12, "")

            isdist = if InverseGamma(2, 3) isa AbstractVector
                all((d->d isa Distribution), InverseGamma(2, 3))
            else
                InverseGamma(2, 3) isa Distribution
            end

            @assert isdist @error("Right-hand side of a ~ must be subtype of Distribution or a vector of Distributions on line 97.")

            
            (s, lp_14) = if InverseGamma(2, 3) isa AbstractVector
                Turing.assume(sampler_6, InverseGamma(2, 3), varname_13, s, vi_8)
            else
                Turing.assume(sampler_6, InverseGamma(2, 3), varname_13, vi_8)
            end
            vi_8.logp += lp_14

            (sym_15, idcs_16, csym_17) = Turing.@VarName(m)
            csym_17 = Symbol(:gdemo, csym_17)
            syms_18 = Symbol[csym_17, :m]
            varname_19 = Turing.VarName(vi_8, syms_18, "")
            isdist = if Normal(0, sqrt(s)) isa AbstractVector
                all((d->d isa Distribution), Normal(0, sqrt(s)))
            else
                Normal(0, sqrt(s)) isa Distribution
            end
            
            @assert isdist  @error("Right-hand side of a ~ must be subtype of Distribution or a vector of Distributions on line 97.")


            (m, lp_20) = if Normal(0, sqrt(s)) isa AbstractVector
                    Turing.assume(sampler_6, Normal(0, sqrt(s)), varname_19, m, vi_8)
                else
                    Turing.assume(sampler_6, Normal(0, sqrt(s)), varname_19, vi_8)
                end
            vi_8.logp += lp_20
            
            r = if Turing.in_pvars(Val{:x}(), model_7)
                (sym_21, idcs_22, csym_23) = Turing.@VarName(x)
                csym_23 = Symbol(:gdemo, csym_23)
                syms_24 = Symbol[csym_23, :x]
                varname_25 = Turing.VarName(vi_8, syms_24, "")
                isdist = if Normal(m, sqrt(s)) isa AbstractVector
                    all((d->d isa Distribution), Normal(m, sqrt(s)))
                else
                    Normal(m, sqrt(s)) isa Distribution
                end
                @assert isdist @error("Right-hand side of a ~ must be subtype of Distribution or a vector of Distributions on line 97.")
                (x, lp_26) = if Normal(m, sqrt(s)) isa AbstractVector
                    Turing.assume(sampler_6, Normal(m, sqrt(s)), varname_25, x, vi_8)
                else
                    Turing.assume(sampler_6, Normal(m, sqrt(s)), varname_25, vi_8)
                end
                vi_8.logp += lp_26
            else
                isdist = if Normal(m, sqrt(s)) isa AbstractVector
                    all((d->d isa Distribution), Normal(m, sqrt(s)))
                else
                    Normal(m, sqrt(s)) isa Distribution
                end
                @assert isdist @error("Right-hand side of a ~ must be subtype of Distribution or a vector of Distributions on line 51.")
                vi_8.logp += Turing.observe(sampler_6, Normal(m, sqrt(s)), x, vi_8)
            end

            [r]
        end
        model_7 = Turing.Model{pvars_1, dvars_2}(inner_function_5, data_3, defaults_4)

        return model_7
    end
end





begin
    gdemo(; x=nothing) = begin
        gdemo(x)
    end
    
    function gdemo(x=nothing)
        (pvars_1, dvars_2) = Turing.get_vars(Tuple{:s,:m}, (x = x,))
        data_3 = Turing.get_data(dvars_2, (x = x,))
        defaults_4 = Turing.get_default_values((x = x,), (x = :nothing,))
        
        function mf(sampler_6::Turing.AbstractSampler, model_7)
            return mf(model_7)
        end
        
        function mf(model_7)
            return mf(Turing.VarInfo(), Turing.SampleFromPrior(), model_7)
        end
        
        function mf(vi_8::Turing.VarInfo, model_7)
            return mf(vi_8, Turing.SampleFromPrior(), model_7)
        end
        
        function mf(vi_8::Turing.VarInfo, sampler_6::Turing.AbstractSampler, model_7)
            local x
            if isdefined(model_7.data, :x)
                x = (model_7.data).x
            else
                x = (model_7.defaults).x
            end
            
            p = zero(Real)
            
            begin
                csym_11 = Symbol(:gdemo, csym_11)
                syms_12 = Symbol[csym_11, :s]
                varname_13 = Turing.VarName(vi_8, syms_12, "")
                
                isdist = if InverseGamma(2, 3) isa AbstractVector
                    all((d->d isa Distribution), InverseGamma(2, 3))
                else
                    InverseGamma(2, 3) isa Distribution
                end
                
                (s, lp_14) = if InverseGamma(2, 3) isa AbstractVector
                     Turing.assume(sampler_6, InverseGamma(2, 3), varname_13, s, vi_8)
                else
                     Turing.assume(sampler_6, InverseGamma(2, 3), varname_13, vi_8)
                end
                
                vi_8.logp += lp_14
            end
            
            begin
                csym_17 = Symbol(:gdemo, csym_17)
                syms_18 = Symbol[csym_17, :m]
                varname_19 = Turing.VarName(vi_8, syms_18, "")
                
                isdist = if Normal(0, sqrt(s)) isa AbstractVector
                    all((d->d isa Distribution), Normal(0, sqrt(s)))
                else
                    Normal(0, sqrt(s)) isa Distribution
                end
                
                (m, lp_20) = if Normal(0, sqrt(s)) isa AbstractVector
                    Turing.assume(sampler_6, Normal(0, sqrt(s)), varname_19, m, vi_8)
                else
                    Turing.assume(sampler_6, Normal(0, sqrt(s)), varname_19, vi_8)
                end
                
                vi_8.logp += lp_20
            end
            
            [begin
                    if Turing.in_pvars(Val{:x}(), model_7)
                        begin
                            begin
                                csym_23 = Symbol(:gdemo, csym_23)
                                syms_24 = Symbol[csym_23, :x]
                                varname_25 = Turing.VarName(vi_8, syms_24, "")
                            end
                            isdist = if Normal(m, sqrt(s)) isa AbstractVector
                                    all((d->begin
                                                d isa Distribution
                                            end), Normal(m, sqrt(s)))
                                else
                                    Normal(m, sqrt(s)) isa Distribution
                                end
                            (x, lp_26) = if Normal(m, sqrt(s)) isa AbstractVector
                                    Turing.assume(sampler_6, Normal(m, sqrt(s)), varname_25, x, vi_8)
                                else
                                    Turing.assume(sampler_6, Normal(m, sqrt(s)), varname_25, vi_8)
                                end
                            vi_8.logp += lp_26
                        end
                    else
                        begin
                            isdist = if Normal(m, sqrt(s)) isa AbstractVector
                                    all((d->begin
                                                d isa Distribution
                                            end), Normal(m, sqrt(s)))
                                else
                                    Normal(m, sqrt(s)) isa Distribution
                                end
                            vi_8.logp += Turing.observe(sampler_6, Normal(m, sqrt(s)), x, vi_8)
                        end
                    end
                end]
        end
        model_7 = Turing.Model{pvars_1, dvars_2}(mf, data_3, defaults_4)
        return model_7
    end
end
