@interface PFSMargins
+ (void)mapMarginStyleProperty:(id)a3 propertyNames:(id *)a4 left:(double *)a5 top:(double *)a6 right:(double *)a7 bottom:(double *)a8 parentFontSize:(double)a9 percentageBasis:(double)a10;
+ (void)valuesFromMarginValueList:(id)a3 top:(id *)a4 right:(id *)a5 bottom:(id *)a6 left:(id *)a7;
@end

@implementation PFSMargins

+ (void)valuesFromMarginValueList:(id)a3 top:(id *)a4 right:(id *)a5 bottom:(id *)a6 left:(id *)a7
{
  v12 = (int *)[a3 count];
  v13 = v12;
  if (v12)
  {
    v12 = (int *)[a3 objectAtIndex:0];
    v14 = v12;
    if (v13 == &dword_4)
    {
      v13 = (int *)[a3 objectAtIndex:1];
      v15 = (int *)[a3 objectAtIndex:2];
      v12 = (int *)[a3 objectAtIndex:3];
      if (a4) {
        goto LABEL_12;
      }
    }
    else
    {
      if (v13 == (int *)((char *)&dword_0 + 3))
      {
        v13 = (int *)[a3 objectAtIndex:1];
        v15 = (int *)[a3 objectAtIndex:2];
        v12 = v13;
        if (!a4) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      if (v13 == (int *)((char *)&dword_0 + 2))
      {
        v12 = (int *)[a3 objectAtIndex:1];
        v13 = v12;
        v15 = v14;
        if (!a4) {
          goto LABEL_13;
        }
LABEL_12:
        *a4 = v14;
        goto LABEL_13;
      }
      v13 = v12;
      v15 = v12;
      if (a4) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    v14 = 0;
    v15 = 0;
    if (a4) {
      goto LABEL_12;
    }
  }
LABEL_13:
  if (a5) {
    *a5 = v13;
  }
  if (a6) {
    *a6 = v15;
  }
  if (a7) {
    *a7 = v12;
  }
}

+ (void)mapMarginStyleProperty:(id)a3 propertyNames:(id *)a4 left:(double *)a5 top:(double *)a6 right:(double *)a7 bottom:(double *)a8 parentFontSize:(double)a9 percentageBasis:(double)a10
{
  uint64_t v39 = 0;
  int64x2_t v38 = 0u;
  memset(v37, 0, sizeof(v37));
  sub_1F58D0(v37, a4);
  sub_1F5958((uint64_t)v37, &a4->var3);
  id v19 = [a3 firstValueFromCandidatePropertyNames:v37 selectedIndex:&v39];
  if (v19)
  {
    id v36 = 0;
    if (v39 == 1)
    {
      id v36 = [v19 lastObject];
      if (v36)
      {
LABEL_5:
        +[PFSUtilities htmlValueToPointLength:parentFontSize:percentageBasis:](PFSUtilities, "htmlValueToPointLength:parentFontSize:percentageBasis:", a9, a10);
        double v21 = v20;
        goto LABEL_8;
      }
    }
    else if (!v39)
    {
      [a1 valuesFromMarginValueList:v19 top:&v36 right:0 bottom:0 left:0];
      if (v36) {
        goto LABEL_5;
      }
    }
  }
  double v21 = -65536.0;
LABEL_8:
  int64x2_t v35 = (int64x2_t)xmmword_345740;
  int64x2_t v38 = vaddq_s64(v38, (int64x2_t)xmmword_345740);
  if (v38.i64[0] >= 0x400uLL)
  {
    operator delete(**((void ***)&v37[0] + 1));
    *((void *)&v37[0] + 1) += 8;
    v38.i64[0] -= 512;
  }
  sub_1F5958((uint64_t)v37, &a4->var2);
  id v22 = [a3 firstValueFromCandidatePropertyNames:v37 selectedIndex:&v39];
  if (v22)
  {
    id v36 = 0;
    if (v39 == 1)
    {
      id v36 = [v22 lastObject];
      if (v36)
      {
LABEL_14:
        +[PFSUtilities htmlValueToPointLength:parentFontSize:percentageBasis:](PFSUtilities, "htmlValueToPointLength:parentFontSize:percentageBasis:", a9, a10, 1, -1);
        double v24 = v23;
        goto LABEL_17;
      }
    }
    else if (!v39)
    {
      [a1 valuesFromMarginValueList:v22 top:0 right:&v36 bottom:0 left:0];
      if (v36) {
        goto LABEL_14;
      }
    }
  }
  double v24 = -65536.0;
LABEL_17:
  int64x2_t v38 = vaddq_s64(v38, v35);
  if (v38.i64[0] >= 0x400uLL)
  {
    operator delete(**((void ***)&v37[0] + 1));
    *((void *)&v37[0] + 1) += 8;
    v38.i64[0] -= 512;
  }
  sub_1F5958((uint64_t)v37, &a4->var4);
  id v25 = [a3 firstValueFromCandidatePropertyNames:v37 selectedIndex:&v39];
  if (v25)
  {
    id v36 = 0;
    if (v39 == 1)
    {
      id v36 = [v25 lastObject];
      if (v36)
      {
LABEL_23:
        +[PFSUtilities htmlValueToPointLength:a9 parentFontSize:a10 percentageBasis:*(_OWORD *)&v35];
        double v27 = v26;
        goto LABEL_26;
      }
    }
    else if (!v39)
    {
      [a1 valuesFromMarginValueList:v25 top:0 right:0 bottom:&v36 left:0];
      if (v36) {
        goto LABEL_23;
      }
    }
  }
  double v27 = -65536.0;
LABEL_26:
  int64x2_t v38 = vaddq_s64(v38, v35);
  if (v38.i64[0] >= 0x400uLL)
  {
    operator delete(**((void ***)&v37[0] + 1));
    *((void *)&v37[0] + 1) += 8;
    v38.i64[0] -= 512;
  }
  sub_1F5958((uint64_t)v37, &a4->var1);
  id v28 = [a3 firstValueFromCandidatePropertyNames:v37 selectedIndex:&v39];
  if (v28)
  {
    id v36 = 0;
    if (v39 == 1)
    {
      id v36 = [v28 lastObject];
      if (v36)
      {
LABEL_32:
        +[PFSUtilities htmlValueToPointLength:a9 parentFontSize:a10 percentageBasis:*(_OWORD *)&v35];
        double v30 = v29;
        goto LABEL_35;
      }
    }
    else if (!v39)
    {
      [a1 valuesFromMarginValueList:v28 top:0 right:0 bottom:0 left:&v36];
      if (v36) {
        goto LABEL_32;
      }
    }
  }
  double v30 = -65536.0;
LABEL_35:
  int64x2_t v38 = vaddq_s64(v38, v35);
  if (v38.i64[0] >= 0x400uLL)
  {
    operator delete(**((void ***)&v37[0] + 1));
    *((void *)&v37[0] + 1) += 8;
    v38.i64[0] -= 512;
  }
  if (v30 != -65536.0)
  {
    double v31 = *a5;
    if (*a5 == -65536.0) {
      double v31 = -0.0;
    }
    *a5 = v30 + v31;
  }
  if (v21 != -65536.0)
  {
    double v32 = *a6;
    if (*a6 == -65536.0) {
      double v32 = -0.0;
    }
    *a6 = v21 + v32;
  }
  if (v24 != -65536.0)
  {
    double v33 = *a7;
    if (*a7 == -65536.0) {
      double v33 = -0.0;
    }
    *a7 = v24 + v33;
  }
  if (v27 != -65536.0)
  {
    double v34 = *a8;
    if (*a8 == -65536.0) {
      double v34 = -0.0;
    }
    *a8 = v27 + v34;
  }
  sub_1F59D8(v37);
}

@end