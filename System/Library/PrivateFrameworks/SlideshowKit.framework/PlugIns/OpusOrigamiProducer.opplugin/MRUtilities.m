@interface MRUtilities
+ (CGPoint)valueForPointAnimationPath:(id)a3 withPlugTiming:(id)a4 atTime:(double)a5 defaultsTo:(CGPoint)a6 previousKeyPoint:(CGPoint *)a7 nextKeyPoint:(CGPoint *)a8 animationIsOver:(BOOL *)a9;
+ (double)transformTime:(double)a3 forAnimationPath:(id)a4 withPlugTiming:(id)a5;
+ (double)valueForScalarAnimationPath:(id)a3 withPlugTiming:(id)a4 atTime:(double)a5 defaultsTo:(double)a6 previousKeyValue:(double *)a7 nextKeyValue:(double *)a8 animationIsOver:(BOOL *)a9;
+ (id)executeScript:(id)a3 withHeader:(id)a4 andAttributes:(id)a5;
+ (int64_t)operatingSystemMajorVersion;
+ (int64_t)operatingSystemMinorVersion;
+ (int64_t)operationQueueConcurrentOperationCount;
+ (void)initialize;
@end

@implementation MRUtilities

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRUtilities;
  objc_msgSendSuper2(&v2, "initialize");
}

+ (double)valueForScalarAnimationPath:(id)a3 withPlugTiming:(id)a4 atTime:(double)a5 defaultsTo:(double)a6 previousKeyValue:(double *)a7 nextKeyValue:(double *)a8 animationIsOver:(BOOL *)a9
{
  objc_msgSend(a1, "transformTime:forAnimationPath:withPlugTiming:", a5);
  double v16 = v15;
  if (a9) {
    *a9 = 1;
  }
  id v17 = [a3 orderedKeyframesWithPlugTiming:a4];
  v18 = (char *)[v17 count];
  if (!v18) {
    goto LABEL_15;
  }
  unint64_t v19 = (unint64_t)v18;
  if (v18 == (unsigned char *)&dword_0 + 1 || v16 <= 0.0)
  {
    if (a9) {
      *a9 = v18 == (unsigned char *)&dword_0 + 1;
    }
    id v24 = [v17 objectAtIndex:0];
    goto LABEL_14;
  }
  [a4 fullDuration];
  if (v16 >= v20)
  {
LABEL_10:
    id v24 = [v17 lastObject];
LABEL_14:
    [v24 value];
    a6 = v25;
LABEL_15:
    if (a8) {
      *a8 = a6;
    }
    if (a7) {
      *a7 = a6;
    }
    return a6;
  }
  unsigned int v21 = 0;
  unint64_t v22 = 1;
  while (1)
  {
    +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:](MCAnimationPathKeyframed, "timeForKeyframe:withPlugTiming:", [v17 objectAtIndex:v22], a4);
    if (v16 <= v23) {
      break;
    }
    unint64_t v22 = v21 + 2;
    ++v21;
    if (v19 <= v22) {
      goto LABEL_10;
    }
  }
  if (a9) {
    *a9 = 0;
  }
  id v27 = [v17 objectAtIndex:v21];
  id v28 = [v17 objectAtIndex:v22];
  +[MCAnimationPathKeyframed timeForKeyframe:v27 withPlugTiming:a4];
  double v30 = v29;
  +[MCAnimationPathKeyframed timeForKeyframe:v28 withPlugTiming:a4];
  double v32 = (v16 - v30) / (v31 - v30);
  if (v16 - v30 > 0.0) {
    double v33 = v32;
  }
  else {
    double v33 = 0.0;
  }
  [v27 value];
  if (a7) {
    *a7 = v34;
  }
  [v28 value];
  if (a8) {
    *a8 = v35;
  }
  [v27 value];
  double v37 = v36;
  [v28 value];
  float v39 = v38;
  [v27 value];
  return v37 + (float)(v39 - v40) * v33;
}

+ (CGPoint)valueForPointAnimationPath:(id)a3 withPlugTiming:(id)a4 atTime:(double)a5 defaultsTo:(CGPoint)a6 previousKeyPoint:(CGPoint *)a7 nextKeyPoint:(CGPoint *)a8 animationIsOver:(BOOL *)a9
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  objc_msgSend(a1, "transformTime:forAnimationPath:withPlugTiming:", a5);
  double v17 = v16;
  v57[0] = 0;
  v57[1] = 0;
  if (a7) {
    v18 = a7;
  }
  else {
    v18 = (CGPoint *)v57;
  }
  if (a8) {
    unint64_t v19 = a8;
  }
  else {
    unint64_t v19 = (CGPoint *)v57;
  }
  if (a9) {
    double v20 = a9;
  }
  else {
    double v20 = (BOOL *)v57;
  }
  *double v20 = 1;
  id v21 = [a3 orderedKeyframesWithPlugTiming:a4];
  unint64_t v22 = (char *)[v21 count];
  if (!v22)
  {
    v19->CGFloat x = x;
    if (a8) {
      double v33 = a8;
    }
    else {
      double v33 = (CGPoint *)v57;
    }
    v33->CGFloat y = y;
    CGPoint *v18 = *v19;
    double v32 = v18->x;
    if (a7) {
      double v30 = a7;
    }
    else {
      double v30 = (CGPoint *)v57;
    }
LABEL_35:
    double v38 = v30->y;
    goto LABEL_42;
  }
  unint64_t v23 = (unint64_t)v22;
  if (v22 == (unsigned char *)&dword_0 + 1 || v17 <= 0.0)
  {
    *double v20 = v22 == (unsigned char *)&dword_0 + 1;
    id v34 = [v21 objectAtIndex:0];
    goto LABEL_29;
  }
  [a4 fullDuration];
  if (v17 >= v24)
  {
    id v34 = [v21 lastObject];
LABEL_29:
    [v34 point];
    v19->CGFloat x = v36;
    double v30 = (CGPoint *)v57;
    if (a8) {
      double v37 = a8;
    }
    else {
      double v37 = (CGPoint *)v57;
    }
    v37->CGFloat y = v35;
    CGPoint *v18 = *v19;
    double v32 = v18->x;
LABEL_33:
    if (a7) {
      double v30 = a7;
    }
    goto LABEL_35;
  }
  v56 = v19;
  unsigned int v25 = 0;
  unint64_t v26 = 1;
  while (1)
  {
    +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:](MCAnimationPathKeyframed, "timeForKeyframe:withPlugTiming:", objc_msgSend(v21, "objectAtIndex:", v26, v56), a4);
    if (v17 <= v27) {
      break;
    }
    unint64_t v26 = v25 + 2;
    ++v25;
    if (v23 <= v26)
    {
      objc_msgSend(objc_msgSend(v21, "lastObject"), "point");
      v56->CGFloat x = v29;
      double v30 = (CGPoint *)v57;
      if (a8) {
        double v31 = a8;
      }
      else {
        double v31 = (CGPoint *)v57;
      }
      v31->CGFloat y = v28;
      CGPoint *v18 = *v56;
      double v32 = v18->x;
      goto LABEL_33;
    }
  }
  *double v20 = 0;
  id v39 = [v21 objectAtIndex:v25];
  id v40 = [v21 objectAtIndex:v26];
  [v39 point];
  double v42 = v41;
  double v44 = v43;
  [v40 point];
  double v46 = v45;
  double v48 = v47;
  +[MCAnimationPathKeyframed timeForKeyframe:v39 withPlugTiming:a4];
  double v50 = v49;
  double v51 = v17 - v49;
  +[MCAnimationPathKeyframed timeForKeyframe:v40 withPlugTiming:a4];
  double v53 = v51 / (v52 - v50);
  v18->CGFloat x = v42;
  v54 = (CGPoint *)v57;
  if (a7) {
    v55 = a7;
  }
  else {
    v55 = (CGPoint *)v57;
  }
  v55->CGFloat y = v44;
  v56->CGFloat x = v46;
  if (a8) {
    v54 = a8;
  }
  v54->CGFloat y = v48;
  double v32 = v42 + (v46 - v42) * v53;
  double v38 = v44 + (v48 - v44) * v53;
LABEL_42:
  result.CGFloat y = v38;
  result.CGFloat x = v32;
  return result;
}

+ (double)transformTime:(double)a3 forAnimationPath:(id)a4 withPlugTiming:(id)a5
{
  [a5 fullDuration];
  double v9 = v8;
  id v10 = [a4 orderedKeyframesWithPlugTiming:a5];
  id v11 = [v10 count];
  double result = 0.0;
  if (a3 > 0.0 && (unint64_t)v11 >= 2)
  {
    if (v9 <= a3)
    {
      return v9;
    }
    else
    {
      unint64_t v14 = (unint64_t)v11;
      unsigned int v15 = 0;
      unint64_t v16 = 1;
      while (1)
      {
        +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:](MCAnimationPathKeyframed, "timeForKeyframe:withPlugTiming:", objc_msgSend(v10, "objectAtIndex:", v16, result), a5);
        if (result >= a3) {
          break;
        }
        unint64_t v16 = v15 + 2;
        ++v15;
        if (v14 <= v16) {
          return v9;
        }
      }
      id v17 = [v10 objectAtIndex:v15];
      id v18 = [v10 objectAtIndex:v16];
      +[MCAnimationPathKeyframed timeForKeyframe:v17 withPlugTiming:a5];
      double v20 = v19;
      +[MCAnimationPathKeyframed timeForKeyframe:v18 withPlugTiming:a5];
      double v22 = v21 - v20;
      double v23 = (a3 - v20) / (v21 - v20);
      [v17 postControl];
      double v25 = v24;
      [v18 preControl];
      return v20 + Spline1(v23, 0.0, v25, v26 + 1.0, 1.0, 0.0, 0.0, 1.0, 1.0) * v22;
    }
  }
  return result;
}

+ (id)executeScript:(id)a3 withHeader:(id)a4 andAttributes:(id)a5
{
  if (!a3) {
    return 0;
  }
  id v7 = [a3 componentsSeparatedByString:@","];
  id v8 = objc_msgSend(objc_msgSend(v7, "objectAtIndex:", 0), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  id v9 = objc_msgSend(objc_msgSend(v7, "objectAtIndex:", 1), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  id v10 = [[MUMathExpressionFloatBased alloc] initWithString:v8 error:0];
  id v11 = [[MUMathExpressionFloatBased alloc] initWithString:v9 error:0];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v12 = [a5 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v38;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(a5);
        }
        uint64_t v16 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v17 = [a5 objectForKey:v16];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v18 = (objc_class *)objc_opt_class();
          if (![NSStringFromClass(v18) isEqualToString:@"NSCFBoolean"]) {
            continue;
          }
        }
        [v17 floatValue];
        int v20 = v19;
        -[MUMathExpressionFloatBased setValue:forVariable:](v10, "setValue:forVariable:", v16);
        LODWORD(v21) = v20;
        [(MUMathExpressionFloatBased *)v11 setValue:v16 forVariable:v21];
      }
      id v13 = [a5 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v13);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v22 = [a4 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(a4);
        }
        uint64_t v26 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
        id v27 = [a4 objectForKey:v26];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v27 floatValue];
          -[MUMathExpressionFloatBased setValue:forVariable:](v10, "setValue:forVariable:", v26);
          [v27 floatValue];
          -[MUMathExpressionFloatBased setValue:forVariable:](v11, "setValue:forVariable:", v26);
        }
      }
      id v23 = [a4 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v23);
  }
  [(MUMathExpressionFloatBased *)v10 evaluate];
  CGFloat v29 = v28;
  [(MUMathExpressionFloatBased *)v11 evaluate];
  CGFloat v31 = v30;

  v43.width = v29;
  v43.height = v31;
  return NSStringFromCGSize(v43);
}

+ (int64_t)operationQueueConcurrentOperationCount
{
  int64_t result = qword_1F0710;
  if (qword_1F0710 == -1)
  {
    int64_t result = [+[NSProcessInfo processInfo] processorCount];
    qword_1F0710 = result;
  }
  return result;
}

+ (int64_t)operatingSystemMinorVersion
{
  size_t size = 0;
  *(void *)v6 = 0x200000001;
  sysctl(v6, 2u, 0, &size, 0, 0);
  objc_super v2 = malloc_type_malloc(size, 0x100004077774924uLL);
  sysctl(v6, 2u, v2, &size, 0, 0);
  id v3 = objc_msgSend(-[NSArray objectAtIndex:](-[NSString componentsSeparatedByString:](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v2), "componentsSeparatedByString:", @"."), "objectAtIndex:", 1), "integerValue");
  free(v2);
  return (int64_t)v3;
}

+ (int64_t)operatingSystemMajorVersion
{
  size_t size = 0;
  *(void *)double v21 = 0x200000001;
  sysctl(v21, 2u, 0, &size, 0, 0);
  objc_super v2 = malloc_type_malloc(size, 0x100004077774924uLL);
  sysctl(v21, 2u, v2, &size, 0, 0);
  id v3 = +[NSString stringWithUTF8String:v2];
  uint64_t v4 = 0;
  char v5 = 1;
  int64_t v6 = 6;
  while (1)
  {
    char v7 = v5;
    if ([(NSString *)v3 characterAtIndex:v4] != a10[v4]) {
      break;
    }
    char v5 = 0;
    uint64_t v4 = 1;
    if ((v7 & 1) == 0) {
      goto LABEL_19;
    }
  }
  uint64_t v8 = 0;
  char v9 = 1;
  int64_t v6 = 7;
  while (1)
  {
    char v10 = v9;
    if ([(NSString *)v3 characterAtIndex:v8] != a11[v8]) {
      break;
    }
    char v9 = 0;
    uint64_t v8 = 1;
    if ((v10 & 1) == 0) {
      goto LABEL_19;
    }
  }
  uint64_t v11 = 0;
  char v12 = 1;
  int64_t v6 = 8;
  while (1)
  {
    char v13 = v12;
    if ([(NSString *)v3 characterAtIndex:v11] != a12[v11]) {
      break;
    }
    char v12 = 0;
    uint64_t v11 = 1;
    if ((v13 & 1) == 0) {
      goto LABEL_19;
    }
  }
  char v14 = 0;
  uint64_t v15 = 0;
  do
  {
    char v16 = v14;
    unsigned int v17 = [(NSString *)v3 characterAtIndex:v15];
    int v18 = a13[v15];
    if (v17 != v18) {
      break;
    }
    char v14 = 1;
    uint64_t v15 = 1;
  }
  while ((v16 & 1) == 0);
  if (v17 == v18) {
    int64_t v6 = 9;
  }
  else {
    int64_t v6 = 0;
  }
LABEL_19:
  free(v2);
  return v6;
}

@end