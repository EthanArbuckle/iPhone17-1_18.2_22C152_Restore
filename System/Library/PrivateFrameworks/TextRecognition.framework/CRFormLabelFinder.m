@interface CRFormLabelFinder
+ (double)_labelMatchingCostForRegion:(id)a3 field:(id)a4 position:(unint64_t *)a5;
+ (id)labelRegionForField:(id)a3 inRegions:(id)a4;
+ (id)parseAndAssignLabelForField:(id)a3 regions:(id)a4 associatedLabels:(id)a5 labelRegions:(void *)a6;
+ (vector<std::tuple<double,)labelRegionsForField:(CROutputRegion *)> inRegions:()std:()CRFormFieldLabelPosition :(CROutputRegion *>>> *__return_ptr)retstr allocator<std:(id)a2 :(SEL)a3 tuple<double;
@end

@implementation CRFormLabelFinder

+ (double)_labelMatchingCostForRegion:(id)a3 field:(id)a4 position:(unint64_t *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7 != v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v14 = 0;
        goto LABEL_12;
      }
      id v9 = v7;
      id v10 = [v9 text];
      v11 = v10;
      if (qword_1EB58CAD8 == -1)
      {
        if (!v10) {
          goto LABEL_55;
        }
      }
      else
      {
        dispatch_once(&qword_1EB58CAD8, &__block_literal_global_12);
        if (!v11) {
          goto LABEL_55;
        }
      }
      if ([v11 length])
      {
        uint64_t v12 = [v11 characterAtIndex:0];
        if (([(id)_MergedGlobals_17 characterIsMember:v12] & 1) != 0
          || (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_1DD8CE5A0, (uint32x4_t)vaddq_s32(vdupq_n_s32(v12), (int32x4_t)xmmword_1DD8CE590)))) & 1) != 0|| (v12 - 44032) >> 2 < 0xAE9|| ublock_getCode(v12) == UBLOCK_CURRENCY_SYMBOLS)
        {
          goto LABEL_8;
        }
        if ([v11 length] == 1) {
          goto LABEL_55;
        }
        if ((unint64_t)[v11 length] > 3)
        {
LABEL_8:
        }
        else
        {
          v51 = [v11 _crStringByReplacingCharactersInSet:qword_1EB58CAD0 withString:&stru_1F38EED68];
          uint64_t v52 = [v51 length];

          if (!v52)
          {
            double v15 = 1.79769313e308;
            goto LABEL_58;
          }
        }
        v13 = [v9 text];
        BOOL v14 = +[CRFormUtilities stringEndsWithColon:v13];

LABEL_12:
        id v9 = [v7 boundingQuad];
        v11 = [v8 boundingQuad];
        [v9 midPoint];
        double v54 = v16;
        double v18 = v17;
        [v11 midPoint];
        double v53 = v19;
        double v21 = v20;
        [v11 size];
        double v23 = v22;
        [v11 topLeft];
        double v25 = v24;
        [v9 topRight];
        if (v18 < v21)
        {
          double v27 = v25 - v26;
          double v28 = 9.6386522;
          if (!v14) {
            double v28 = 8.0;
          }
          if (v27 < v28 * v23 && v27 > v23 * -3.1956241 && vabdd_f64(v54, v53) < v23 * 0.637716056)
          {
            double v29 = 1.03271618;
            if (v14) {
              double v29 = 1.18845813;
            }
            if (a5) {
              *a5 = 3;
            }
            double v30 = fmax(v27, 0.0);
LABEL_33:
            double v15 = v29 * v30;
LABEL_57:

LABEL_58:
            goto LABEL_59;
          }
        }
        [v9 topRight];
        double v32 = v31;
        [v11 topRight];
        double v34 = v33;
        [v9 topLeft];
        double v36 = v35;
        [v11 topLeft];
        double v38 = v37;
        [v11 size];
        double v40 = v39;
        [v11 size];
        double v41 = fmax(fmin(v32, v34) - fmax(v36, v38), 0.0);
        if (v41 > fmin(v40 * 0.2, v42 * 2.5) || ([v9 size], v41 > v43 * 0.8))
        {
          double v30 = v53 - v54;
          if (v53 - v54 > v23 * 0.403263008)
          {
            double v44 = 2.2217905;
            if (v14) {
              double v44 = 3.22780074;
            }
            if (v30 < v44 * v23)
            {
              double v29 = 3.66674774;
              if (v14) {
                double v29 = 2.6;
              }
              if (a5) {
                *a5 = 1;
              }
              goto LABEL_33;
            }
          }
          if (v23 * -0.134254297 < -v30 && v23 * 3.69995893 > -v30)
          {
            if (a5) {
              *a5 = 2;
            }
            double v15 = v30 * -4.86195604;
            goto LABEL_57;
          }
        }
        [v9 topLeft];
        double v46 = v45;
        [v11 topRight];
        if (v18 > v21)
        {
          double v48 = v47;
          if ([v8 fieldType] == 2)
          {
            double v49 = v46 - v48;
            if (v46 - v48 < v23 * 4.94467888 && v49 > v23 * -1.42588897 && vabdd_f64(v54, v53) < v23 * 0.933868987)
            {
              if (a5) {
                *a5 = 4;
              }
              if (v49 <= 0.0) {
                double v15 = 0.0;
              }
              else {
                double v15 = v49 * 2.48167153;
              }
              goto LABEL_57;
            }
          }
        }
        if (a5) {
          *a5 = 0;
        }
        goto LABEL_56;
      }
LABEL_55:

LABEL_56:
      double v15 = 1.79769313e308;
      goto LABEL_57;
    }
  }
  double v15 = 1.79769313e308;
LABEL_59:

  return v15;
}

+ (id)labelRegionForField:(id)a3 inRegions:(id)a4
{
  [a1 labelRegionsForField:a3 inRegions:a4];
  if (v6[0] == v6[1]) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)(v6[0] + 16);
  }
  id v7 = (void **)v6;
  std::vector<std::tuple<double,CRFormFieldLabelPosition,CROutputRegion * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v7);
  return v4;
}

+ (vector<std::tuple<double,)labelRegionsForField:(CROutputRegion *)> inRegions:()std:()CRFormFieldLabelPosition :(CROutputRegion *>>> *__return_ptr)retstr allocator<std:(id)a2 :(SEL)a3 tuple<double
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v55 count:16];
  id v48 = v10;
  if (v11)
  {
    p_var2 = &retstr->var2;
    uint64_t v12 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v10);
        }
        BOOL v14 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v53 = 0;
        objc_msgSend(a2, "_labelMatchingCostForRegion:field:position:", v14, v8, &v53, p_var2);
        double v16 = v15;
        if (v15 != 1.79769313e308)
        {
          id v17 = v14;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v18 = v17;

            if (v18)
            {
              var1 = (char *)retstr->var1;
              var0 = (char *)retstr->var2.var0;
              if (var1 >= var0)
              {
                unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((var1 - (char *)retstr->var0) >> 3);
                unint64_t v23 = v22 + 1;
                if (v22 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                }
                unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * ((var0 - (char *)retstr->var0) >> 3);
                if (2 * v24 > v23) {
                  unint64_t v23 = 2 * v24;
                }
                if (v24 >= 0x555555555555555) {
                  unint64_t v25 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v25 = v23;
                }
                v54[4] = p_var2;
                if (v25)
                {
                  if (v25 > 0xAAAAAAAAAAAAAAALL) {
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  }
                  double v26 = (char *)operator new(24 * v25);
                }
                else
                {
                  double v26 = 0;
                }
                double v27 = &v26[24 * v22];
                *(double *)double v27 = v16;
                *((void *)v27 + 1) = v53;
                *((void *)v27 + 2) = v18;
                double v29 = (char *)retstr->var0;
                double v28 = retstr->var1;
                double v30 = v27;
                if (v28 != retstr->var0)
                {
                  double v31 = (char *)retstr->var1;
                  do
                  {
                    long long v32 = *(_OWORD *)(v31 - 24);
                    v31 -= 24;
                    *(_OWORD *)(v30 - 24) = v32;
                    v30 -= 24;
                    uint64_t v33 = *((void *)v31 + 2);
                    *((void *)v31 + 2) = 0;
                    *((void *)v30 + 2) = v33;
                  }
                  while (v31 != v29);
                }
                double v34 = &v26[24 * v25];
                double v21 = v27 + 24;
                retstr->var0 = v30;
                retstr->var1 = v27 + 24;
                double v35 = retstr->var2.var0;
                retstr->var2.var0 = v34;
                v54[2] = v28;
                v54[3] = v35;
                v54[0] = v29;
                v54[1] = v29;
                std::__split_buffer<std::tuple<double,CRFormFieldLabelPosition,CROutputRegion * {__strong}>>::~__split_buffer((uint64_t)v54);
                id v10 = v48;
              }
              else
              {
                *(double *)var1 = v16;
                *((void *)var1 + 1) = v53;
                *((void *)var1 + 2) = v18;
                double v21 = var1 + 24;
              }
              retstr->var1 = v21;
            }
          }
          else
          {

            id v18 = 0;
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v11);
  }

  double v37 = (uint64_t *)retstr->var0;
  double v38 = (uint64_t *)retstr->var1;
  uint64_t v39 = (char *)v38 - (char *)retstr->var0;
  unint64_t v40 = 0xAAAAAAAAAAAAAAABLL * (v39 >> 3);
  if (v39 < 1)
  {
LABEL_34:
    double v45 = 0;
    unint64_t v42 = 0;
  }
  else
  {
    double v41 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
    unint64_t v42 = 0xAAAAAAAAAAAAAAABLL * (v39 >> 3);
    while (1)
    {
      double v43 = operator new(24 * v42, v41);
      if (v43) {
        break;
      }
      BOOL v44 = v42 > 1;
      v42 >>= 1;
      if (!v44) {
        goto LABEL_34;
      }
    }
    double v45 = v43;
  }
  std::__stable_sort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__wrap_iter<std::tuple<double,CRFormFieldLabelPosition,CROutputRegion * {__strong}> *>>(v37, v38, v40, (uint64_t)v45, v42, v36);
  if (v45) {
    operator delete(v45);
  }

  return result;
}

+ (id)parseAndAssignLabelForField:(id)a3 regions:(id)a4 associatedLabels:(id)a5 labelRegions:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = +[CRFormLabelFinder labelRegionForField:v9 inRegions:v10];
  if (v12 && [v9 fieldSource] == 1)
  {
    v13 = [v11 objectForKeyedSubscript:v12];
    if (v13)
    {
      if (!+[CRFormUtilities isRegion:verticallyAlignedWithRegionBelow:maxRelativeDistance:](CRFormUtilities, "isRegion:verticallyAlignedWithRegionBelow:maxRelativeDistance:", v12, v9, 10.0)|| !+[CRFormUtilities isRegion:v13 verticallyAlignedWithRegionBelow:v9 maxRelativeDistance:10.0])
      {

        uint64_t v12 = 0;
      }
    }
    else
    {
      [v11 setObject:v9 forKeyedSubscript:v12];
    }
  }
  +[CRFormLabelFinder labelRegionsForField:v9 inRegions:v10];
  BOOL v14 = *(id **)a6;
  if (*(void *)a6)
  {
    double v15 = (id *)*((void *)a6 + 1);
    double v16 = *(id **)a6;
    if (v15 != v14)
    {
      do
      {
        id v17 = v15 - 3;

        double v15 = v17;
      }
      while (v17 != v14);
      double v16 = *(id **)a6;
    }
    *((void *)a6 + 1) = v14;
    operator delete(v16);
    *(void *)a6 = 0;
    *((void *)a6 + 1) = 0;
    *((void *)a6 + 2) = 0;
  }
  *(_OWORD *)a6 = v21;
  *((void *)a6 + 2) = v22;
  uint64_t v22 = 0;
  long long v21 = 0uLL;
  unint64_t v23 = (void **)&v21;
  std::vector<std::tuple<double,CRFormFieldLabelPosition,CROutputRegion * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v23);
  id v18 = CRCastAsClass<CRFormFieldOutputRegion>(v9);
  double v19 = v18;
  if (v18) {
    [v18 setLabelRegion:v12];
  }

  return v12;
}

@end