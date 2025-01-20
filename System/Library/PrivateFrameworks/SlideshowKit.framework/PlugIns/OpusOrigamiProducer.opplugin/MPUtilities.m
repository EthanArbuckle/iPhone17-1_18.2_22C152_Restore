@interface MPUtilities
+ ($421962E1114BB55FD51FACB03C2AC210)scaledFilterPresetVectorValue:(SEL)a3 withKey:(id *)a4 forFilterID:(id)a5 andPresetID:(id)a6;
+ (BOOL)pathIsRelative:(id)a3;
+ (CGColor)CGColorFromString:(id)a3;
+ (CGColor)CGColorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
+ (CGColor)blackCGColor;
+ (CGPoint)computePointValueForAnimationPath:(id)a3 atTime:(double)a4 defaultsTo:(CGPoint)a5;
+ (CGPoint)scaledFilterPresetPointValue:(CGPoint)a3 withKey:(id)a4 forFilterID:(id)a5 andPresetID:(id)a6;
+ (double)aspectRatioOfLayerable:(id)a3 relativeToAspectRatio:(double)a4;
+ (double)computeScalarValueForAnimationPath:(id)a3 atTime:(double)a4 defaultsTo:(double)a5 context:(id)a6;
+ (double)displayTimeForText:(id)a3;
+ (double)scaledFilterPresetScalarValue:(double)a3 withKey:(id)a4 forFilterID:(id)a5 andPresetID:(id)a6;
+ (double)transformTime:(double)a3 forAnimationPath:(id)a4;
+ (id)animationsPathsFromFilterID:(id)a3 andPresetID:(id)a4;
+ (id)attributesFormMPFilter:(id)a3 atTime:(double)a4;
+ (id)attributesFromAnimationPathsInFilter:(id)a3 atTime:(double)a4;
+ (id)computeVectorValueForAnimationPath:(id)a3 atTime:(double)a4 defaultsTo:(id)a5;
+ (id)createMCAction:(id)a3 forPlug:(id)a4 withKey:(id)a5;
+ (id)createPlugInContainer:(id)a3 forLayer:(id)a4 key:(id)a5 inDocument:(id)a6;
+ (id)createPlugInSlide:(id)a3 forLayer:(id)a4 inDocument:(id)a5;
+ (id)createPlugPathToContainer:(id)a3 inDocument:(id)a4;
+ (id)createPlugPathToObject:(id)a3 inDocument:(id)a4;
+ (id)defaultAttributesForMPFilter:(id)a3;
+ (id)defaultAttributesForMPTransition:(id)a3;
+ (id)effectContainersForTime:(double)a3 inDocument:(id)a4;
+ (id)effectForMCContainerEffect:(id)a3 inDocument:(id)a4;
+ (id)effectForMCContainerWithObjectID:(id)a3 inDocument:(id)a4;
+ (id)executeScript:(id)a3 withHeader:(id)a4 andAttributes:(id)a5;
+ (id)idOfCombinedID:(id)a3;
+ (id)layerForContainer:(id)a3 inDocument:(id)a4;
+ (id)parentsOfObject:(id)a3;
+ (id)placesPinLabelForSlideAssetPath:(id)a3 inDocument:(id)a4;
+ (id)presetIDOfCombinedID:(id)a3;
+ (id)slideForElementID:(id)a3 withMCContainerEffect:(id)a4 inDocument:(id)a5;
+ (id)slideForPath:(id)a3 inDocument:(id)a4;
+ (id)slideForSlide:(id)a3 inDocument:(id)a4;
+ (id)stringFromCGColor:(CGColor *)a3;
+ (id)stringWithNewUUID;
+ (id)textForElementID:(id)a3 withMCContainerEffect:(id)a4 inDocument:(id)a5;
+ (id)textForIndex:(int64_t)a3 inMCContainerWithObjectID:(id)a4 inDocument:(id)a5;
+ (id)textsDisplayedAtTime:(double)a3 inDocument:(id)a4;
+ (unint64_t)timeOffSetFromString:(id)a3;
+ (void)collectAllActionableLayers:(id)a3 inDictionary:(id)a4;
+ (void)syncAnimationPaths:(id)a3;
@end

@implementation MPUtilities

+ (unint64_t)timeOffSetFromString:(id)a3
{
  if ([a3 isEqualToString:@"relativeFromTimeInForFullDuration"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"relativeFromTimeInForPhaseInDuration"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"relativeFromMainStartForPhaseInDuration"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"relativeFromMainStartForMainDuration"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"relativeFromMainEndForMainDuration"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"relativeFromMainEndForPhaseOutDuration"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"relativeFromTimeOutForPhaseOutDuration"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"relativeFromTimeOutForFullDuration"]) {
    return 7;
  }
  return 0;
}

+ (double)transformTime:(double)a3 forAnimationPath:(id)a4
{
  id v6 = [a4 orderedKeyframes];
  id v7 = [v6 count];
  double v8 = 0.0;
  if (a3 <= 0.0 || (unint64_t)v7 < 2) {
    return v8;
  }
  double v8 = 1.0;
  if (a3 >= 1.0) {
    return v8;
  }
  unint64_t v10 = (unint64_t)v7;
  unsigned int v11 = 0;
  unint64_t v12 = 1;
  while (1)
  {
    objc_msgSend(a4, "relativeTimeForKeyframe:", objc_msgSend(v6, "objectAtIndex:", v12));
    if (v13 >= a3) {
      break;
    }
    unint64_t v12 = v11 + 2;
    ++v11;
    if (v10 <= v12) {
      return v8;
    }
  }
  id v15 = [v6 objectAtIndex:v11];
  id v16 = [v6 objectAtIndex:v12];
  [a4 relativeTimeForKeyframe:v15];
  double v18 = v17;
  [a4 relativeTimeForKeyframe:v16];
  double v20 = v19 - v18;
  double v21 = (a3 - v18) / (v19 - v18);
  [v15 postControl];
  double v23 = v22;
  [v16 preControl];
  return v18 + Spline1(v21, 0.0, v23, v24 + 1.0, 1.0, 0.0, 0.0, 1.0, 1.0) * v20;
}

+ (double)computeScalarValueForAnimationPath:(id)a3 atTime:(double)a4 defaultsTo:(double)a5 context:(id)a6
{
  id v10 = [a3 animationPath];
  id v11 = objc_msgSend(objc_msgSend(a3, "parent"), "plug");
  id v12 = [v10 orderedKeyframesWithPlugTiming:v11];
  double v13 = (char *)[v12 count];
  unsigned int v14 = [v10 isTriggered];
  if (v13)
  {
    unsigned int v15 = v14;
    char v16 = a4 <= 0.0 ? v14 : 0;
    if ((v16 & 1) == 0)
    {
      if (v13 == (unsigned char *)&dword_0 + 1) {
        char v17 = v14;
      }
      else {
        char v17 = 1;
      }
      if (a4 > 0.0 && (v17 & 1) != 0)
      {
        if (a4 < 1.0)
        {
          uint64_t v18 = v14 ^ 1;
          if ((unint64_t)v13 > v18)
          {
            unsigned int v19 = v18 + 1;
            while (1)
            {
              +[MCAnimationPathKeyframed timeForKeyframe:withPlugTiming:](MCAnimationPathKeyframed, "timeForKeyframe:withPlugTiming:", [v12 objectAtIndex:v18], v11);
              double v21 = v20;
              [v11 fullDuration];
              if (v21 / v22 >= a4) {
                break;
              }
              uint64_t v18 = v19;
              if ((unint64_t)v13 <= v19++) {
                goto LABEL_16;
              }
            }
            if (v19 == 1) {
              id v25 = 0;
            }
            else {
              id v25 = [v12 objectAtIndex:v19 - 2];
            }
            id v26 = [v12 objectAtIndex:v18];
LABEL_19:
            if (v25)
            {
              +[MCAnimationPathKeyframed timeForKeyframe:v25 withPlugTiming:v11];
              double v28 = v27;
              [v11 fullDuration];
              double v30 = v28 / v29;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v25 timeOffset];
                [v25 duration];
                TimeForKeyframeAttributesInPlug([v25 timeOffsetKind], 0, v11);
                double v32 = v31;
                [v11 fullDuration];
                double v34 = v32 / v33;
                BOOL v35 = v32 / v33 <= a4 || v30 > a4;
                float v36 = a5;
                if ([v25 function])
                {
                  id v37 = (id)qword_1F1458;
                  if (!qword_1F1458)
                  {
                    id v37 = objc_alloc_init((Class)NSMutableDictionary);
                    qword_1F1458 = (uint64_t)v37;
                  }
                  v38 = (MUMathExpressionFloatBased *)objc_msgSend(v37, "objectForKey:", objc_msgSend(v25, "function"));
                  if (v38)
                  {
                    v39 = v38;
                    [(MUMathExpressionFloatBased *)v38 resetAllVariables];
                  }
                  else
                  {
                    v41 = -[MUMathExpressionFloatBased initWithString:error:]([MUMathExpressionFloatBased alloc], "initWithString:error:", [v25 function], 0);
                    if (!v41) {
                      goto LABEL_43;
                    }
                    v39 = v41;
                    objc_msgSend((id)qword_1F1458, "setObject:forKey:", v41, objc_msgSend(v25, "function"));
                  }
                  id v42 = [v25 functionParameters];
                  if (v42) {
                    [(MUMathExpressionFloatBased *)v39 setVariableValues:v42];
                  }
                  if (a6) {
                    [(MUMathExpressionFloatBased *)v39 setVariableValues:a6];
                  }
                  double v43 = 0.0;
                  if (v30 < a4)
                  {
                    double v43 = 1.0;
                    if (v34 > a4) {
                      double v43 = (a4 - v30) / (v34 - v30);
                    }
                  }
                  [v25 functionTimeFactor];
                  double v45 = v44;
                  [v25 functionTimeOffset];
                  double v47 = v46 + v43 * v45;
                  *(float *)&double v47 = v47;
                  [(MUMathExpressionFloatBased *)v39 setValue:@"time" forVariable:v47];
                  if (v15)
                  {
                    *(float *)&double v48 = a5;
                    [(MUMathExpressionFloatBased *)v39 setValue:@"startValue" forVariable:v48];
                  }
                  [(MUMathExpressionFloatBased *)v39 evaluate];
                  float v36 = v49;
                }
              }
              else
              {
                [v25 value];
                float v36 = v40;
                BOOL v35 = 1;
              }
            }
            else
            {
              float v36 = a5;
              BOOL v35 = 1;
              double v30 = 0.0;
            }
LABEL_43:
            if (!v35 || !v26) {
              return v36;
            }
            +[MCAnimationPathKeyframed timeForKeyframe:v26 withPlugTiming:v11];
            double v51 = v50;
            [v11 fullDuration];
            double v53 = v51 / v52;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [v26 value];
LABEL_63:
              float v54 = v58;
              goto LABEL_64;
            }
            float v54 = a5;
            if ([v26 function])
            {
              id v55 = (id)qword_1F1458;
              if (!qword_1F1458)
              {
                id v55 = objc_alloc_init((Class)NSMutableDictionary);
                qword_1F1458 = (uint64_t)v55;
              }
              v56 = (MUMathExpressionFloatBased *)objc_msgSend(v55, "objectForKey:", objc_msgSend(v26, "function"));
              if (v56)
              {
                v57 = v56;
                [(MUMathExpressionFloatBased *)v56 resetAllVariables];
LABEL_56:
                id v60 = [v26 functionParameters];
                if (v60) {
                  [(MUMathExpressionFloatBased *)v57 setVariableValues:v60];
                }
                if (a6) {
                  [(MUMathExpressionFloatBased *)v57 setVariableValues:a6];
                }
                [v26 functionTimeOffset];
                *(float *)&double v61 = v61;
                [(MUMathExpressionFloatBased *)v57 setValue:@"time" forVariable:v61];
                if (v15)
                {
                  *(float *)&double v62 = v54;
                  [(MUMathExpressionFloatBased *)v57 setValue:@"startValue" forVariable:v62];
                }
                [(MUMathExpressionFloatBased *)v57 evaluate];
                goto LABEL_63;
              }
              v59 = -[MUMathExpressionFloatBased initWithString:error:]([MUMathExpressionFloatBased alloc], "initWithString:error:", [v26 function], 0);
              if (v59)
              {
                v57 = v59;
                objc_msgSend((id)qword_1F1458, "setObject:forKey:", v59, objc_msgSend(v26, "function"));

                goto LABEL_56;
              }
            }
LABEL_64:
            double v63 = v53 - v30;
            double v64 = (a4 - v30) / (v53 - v30);
            [v25 postControl];
            double v66 = v65;
            [v26 preControl];
            double v68 = v30 + Spline1(v64, 0.0, v66, v67 + 1.0, 1.0, 0.0, 0.0, 1.0, 1.0) * v63 - v30;
            float v69 = 0.0;
            if (v68 > 0.0) {
              float v69 = v68 / v63;
            }
            return (float)(v36 + (float)((float)(v54 - v36) * v69));
          }
        }
LABEL_16:
        id v24 = [v12 lastObject];
      }
      else
      {
        id v24 = [v12 objectAtIndex:0];
      }
      id v25 = v24;
      id v26 = 0;
      goto LABEL_19;
    }
  }
  return a5;
}

+ (CGPoint)computePointValueForAnimationPath:(id)a3 atTime:(double)a4 defaultsTo:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  objc_msgSend(a1, "transformTime:forAnimationPath:", a4);
  double v9 = v8;
  id v10 = [a3 orderedKeyframes];
  id v11 = (char *)[v10 count];
  if (!v11) {
    goto LABEL_17;
  }
  if (v11 == (unsigned char *)&dword_0 + 1 || v9 <= 0.0)
  {
    id v20 = [v10 objectAtIndex:0];
LABEL_16:
    [v20 point];
    double x = v21;
    double y = v22;
    goto LABEL_17;
  }
  if (v9 >= 1.0)
  {
    id v20 = [v10 lastObject];
    goto LABEL_16;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v12 = [v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v12)
  {
    id v13 = v12;
    unsigned int v14 = 0;
    uint64_t v15 = *(void *)v46;
    while (2)
    {
      char v16 = 0;
      char v17 = v14;
      do
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v10);
        }
        unsigned int v14 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v16);
        [a3 relativeTimeForKeyframe:v14];
        if (v18 > v9)
        {
          unsigned int v19 = v14;
          unsigned int v14 = v17;
          goto LABEL_19;
        }
        char v16 = (char *)v16 + 1;
        char v17 = v14;
      }
      while (v13 != v16);
      id v13 = [v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    unsigned int v19 = 0;
LABEL_19:
    if (v14)
    {
      [a3 relativeTimeForKeyframe:v14];
      double v26 = v25;
      [a3 relativeTimeForKeyframe:v19];
      double v28 = v27;
      [v14 point];
      double v30 = v29;
      if (v19)
      {
        [v19 point];
        double v32 = v31;
        [v14 point];
        double v34 = v32 - v33;
        double v35 = v9 - v26;
        double v36 = v28 - v26;
        double v37 = (v9 - v26) * v34 / (v28 - v26);
        [v14 point];
        double v39 = v38;
        [v19 point];
        double v41 = v40;
        [v14 point];
        double v43 = v35 * (v41 - v42) / v36;
      }
      else
      {
        [v14 point];
        double v39 = v44;
        double v37 = 0.0;
        double v43 = 0.0;
      }
      double x = v30 + v37;
      double y = v39 + v43;
    }
  }
LABEL_17:
  double v23 = x;
  double v24 = y;
  result.double y = v24;
  result.double x = v23;
  return result;
}

+ (id)computeVectorValueForAnimationPath:(id)a3 atTime:(double)a4 defaultsTo:(id)a5
{
  objc_msgSend(a1, "transformTime:forAnimationPath:", a4);
  double v8 = v7;
  id v9 = [a3 orderedKeyframes];
  id v10 = (char *)[v9 count];
  if (!v10) {
    return a5;
  }
  if (v10 == (unsigned char *)&dword_0 + 1 || v8 <= 0.0)
  {
    id v33 = [v9 objectAtIndex:0];
  }
  else
  {
    if (v8 < 1.0)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v11 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v11)
      {
        id v12 = v11;
        id v13 = 0;
        uint64_t v14 = *(void *)v39;
LABEL_7:
        uint64_t v15 = 0;
        char v16 = v13;
        while (1)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v15);
          [a3 relativeTimeForKeyframe:v13];
          if (v17 > v8) {
            break;
          }
          uint64_t v15 = (char *)v15 + 1;
          char v16 = v13;
          if (v12 == v15)
          {
            id v12 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
            if (v12) {
              goto LABEL_7;
            }
            char v16 = v13;
            id v13 = 0;
            break;
          }
        }
        if (v16)
        {
          long long v36 = 0uLL;
          int v37 = 0;
          double v18 = (char *)[a5 count];
          LOBYTE(v36) = [a5 count];
          [a3 relativeTimeForKeyframe:v16];
          double v20 = v19;
          [a3 relativeTimeForKeyframe:v13];
          if (v18)
          {
            double v22 = 0;
            double v23 = v8 - v20;
            double v24 = v21 - v20;
            do
            {
              objc_msgSend(objc_msgSend(v16, "vector"), "valueAtIndex:", v22);
              double v26 = v25;
              if (v13)
              {
                objc_msgSend(objc_msgSend(v13, "vector"), "valueAtIndex:", v22);
                double v28 = v27;
                objc_msgSend(objc_msgSend(v16, "vector"), "valueAtIndex:", v22);
                double v30 = v23 * (v28 - v29) / v24;
              }
              else
              {
                double v30 = 0.0;
              }
              float v31 = v26 + v30;
              *((float *)&v36 + (void)v22++ + 1) = v31;
            }
            while (v18 != v22);
          }
          long long v34 = v36;
          int v35 = v37;
          return +[MPVector vectorFromMCVector:&v34];
        }
      }
      return a5;
    }
    id v33 = [v9 lastObject];
  }
  return [v33 vector];
}

+ (double)scaledFilterPresetScalarValue:(double)a3 withKey:(id)a4 forFilterID:(id)a5 andPresetID:(id)a6
{
  if (!a6) {
    return a3;
  }
  id v7 = objc_msgSend(+[MPFilterManager sharedManager](MPFilterManager, "sharedManager", a4), "animationsForFilterID:andPresetID:", a5, a6);
  unint64_t v8 = (unint64_t)[v7 objectForKey:@"boxMin"];
  unint64_t v9 = (unint64_t)[v7 objectForKey:@"boxMax"];
  if (!(v8 | v9)) {
    return a3;
  }
  id v10 = (void *)v9;
  if (!v8)
  {
    double v12 = 0.0;
    if (v9) {
      goto LABEL_5;
    }
LABEL_8:
    double v14 = 1.0;
    return v12 + (v14 - v12) * a3;
  }
  [(id)v8 floatValue];
  double v12 = v11;
  if (!v10) {
    goto LABEL_8;
  }
LABEL_5:
  [v10 floatValue];
  double v14 = v13;
  return v12 + (v14 - v12) * a3;
}

+ (CGPoint)scaledFilterPresetPointValue:(CGPoint)a3 withKey:(id)a4 forFilterID:(id)a5 andPresetID:(id)a6
{
  CGFloat y = a3.y;
  double x = a3.x;
  if (a6)
  {
    id v9 = objc_msgSend(+[MPFilterManager sharedManager](MPFilterManager, "sharedManager"), "animationsForFilterID:andPresetID:", a5, a6);
    id v10 = (NSString *)[v9 objectForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"boxMin %@", a4)];
    id v11 = [v9 objectForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"boxMax %@", a4)];
    if ((unint64_t)v10 | (unint64_t)v11)
    {
      double v12 = (NSString *)v11;
      if (v10)
      {
        *(void *)&double v13 = *(_OWORD *)&CGPointFromString(v10);
        if (v12)
        {
LABEL_5:
          *(void *)&double v14 = *(_OWORD *)&CGPointFromString(v12);
LABEL_8:
          double x = v13 + (v14 - v13) * x;
          CGFloat y = x;
          goto LABEL_9;
        }
      }
      else
      {
        double v13 = 0.0;
        if (v11) {
          goto LABEL_5;
        }
      }
      double v14 = 1.0;
      goto LABEL_8;
    }
  }
LABEL_9:
  double v15 = x;
  double v16 = y;
  result.CGFloat y = v16;
  result.double x = v15;
  return result;
}

+ ($421962E1114BB55FD51FACB03C2AC210)scaledFilterPresetVectorValue:(SEL)a3 withKey:(id *)a4 forFilterID:(id)a5 andPresetID:(id)a6
{
  if (a7)
  {
    id v10 = objc_msgSend(+[MPFilterManager sharedManager](MPFilterManager, "sharedManager"), "animationsForFilterID:andPresetID:", a6, a7);
    unint64_t v11 = (unint64_t)[v10 objectForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"boxMin %@", a5)];
    CGPoint result = ($421962E1114BB55FD51FACB03C2AC210 *)[v10 objectForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"boxMax %@", a5)];
    if (v11 | (unint64_t)result)
    {
      double v12 = result;
      uint64_t var0 = a4->var0;
      double v14 = +[MPVector vectorFromString:@"0. 0. 0. 0."];
      CGPoint result = +[MPVector vectorFromString:@"0. 0. 0. 0."];
      double v15 = result;
      if (v11)
      {
        CGPoint result = +[MPVector vectorFromString:v11];
        double v14 = result;
      }
      if (v12)
      {
        CGPoint result = +[MPVector vectorFromString:v12];
        double v15 = result;
      }
      if (var0)
      {
        uint64_t v16 = 0;
        var1 = a4->var1;
        do
        {
          [($421962E1114BB55FD51FACB03C2AC210 *)v15 valueAtIndex:v16];
          double v19 = v18;
          [($421962E1114BB55FD51FACB03C2AC210 *)v14 valueAtIndex:v16];
          double v21 = v19 - v20;
          double v22 = var1[v16];
          CGPoint result = ($421962E1114BB55FD51FACB03C2AC210 *)[($421962E1114BB55FD51FACB03C2AC210 *)v14 valueAtIndex:v16];
          *(float *)&double v23 = v23 + v21 * v22;
          var1[v16++] = *(float *)&v23;
        }
        while (var0 != v16);
      }
    }
  }
  *(_OWORD *)&retstr->uint64_t var0 = *(_OWORD *)&a4->var0;
  retstr->var1[3] = a4->var1[3];
  return result;
}

+ (id)defaultAttributesForMPFilter:(id)a3
{
  return 0;
}

+ (id)defaultAttributesForMPTransition:(id)a3
{
  return 0;
}

+ (id)attributesFormMPFilter:(id)a3 atTime:(double)a4
{
  id v6 = +[NSMutableDictionary dictionary];
  objc_msgSend(v6, "addEntriesFromDictionary:", objc_msgSend(+[MPFilterManager sharedManager](MPFilterManager, "sharedManager"), "attributesForFilterID:andPresetID:", objc_msgSend(a3, "filterID"), objc_msgSend(a3, "presetID")));
  objc_msgSend(v6, "addEntriesFromDictionary:", +[MPUtilities attributesFromAnimationPathsInFilter:atTime:](MPUtilities, "attributesFromAnimationPathsInFilter:atTime:", a3, a4));
  return v6;
}

+ (id)attributesFromAnimationPathsInFilter:(id)a3 atTime:(double)a4
{
  id v6 = +[MPUtilities defaultAttributesForMPFilter:](MPUtilities, "defaultAttributesForMPFilter:");
  id v7 = +[NSMutableDictionary dictionary];
  unint64_t v8 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[MPUtilities animationsPathsFromFilterID:andPresetID:](MPUtilities, "animationsPathsFromFilterID:andPresetID:", [a3 filterID], objc_msgSend(a3, "presetID")));
  -[NSMutableDictionary addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", [a3 animationPaths]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v14 = [(NSMutableDictionary *)v8 objectForKey:v13];
        if (v14)
        {
          id v15 = v14;
          id v16 = [v14 orderedKeyframes];
          if (objc_msgSend(objc_msgSend(v16, "lastObject"), "isMemberOfClass:", objc_opt_class()))
          {
            objc_msgSend(objc_msgSend(v6, "objectForKey:", v13), "floatValue");
            +[MPUtilities computeScalarValueForAnimationPath:v15 atTime:0 defaultsTo:a4 context:v17];
            *(float *)&double v18 = v18;
            double v19 = +[NSNumber numberWithFloat:v18];
          }
          else if (objc_msgSend(objc_msgSend(v16, "lastObject"), "isMemberOfClass:", objc_opt_class()))
          {
            CGPoint v20 = CGPointFromString((NSString *)[v6 objectForKey:v13]);
            +[MPUtilities computePointValueForAnimationPath:atTime:defaultsTo:](MPUtilities, "computePointValueForAnimationPath:atTime:defaultsTo:", v15, a4, v20.x, v20.y);
            double v19 = (NSNumber *)NSStringFromCGPoint(v27);
          }
          else
          {
            if (!objc_msgSend(objc_msgSend(v16, "lastObject"), "isMemberOfClass:", objc_opt_class())) {
              continue;
            }
            double v19 = (NSNumber *)objc_msgSend(+[MPUtilities computeVectorValueForAnimationPath:atTime:defaultsTo:](MPUtilities, "computeVectorValueForAnimationPath:atTime:defaultsTo:", v15, +[MPVector vectorFromString:](MPVector, "vectorFromString:", objc_msgSend(v6, "objectForKey:", v13)), a4), "CIColorString");
          }
          [v7 setValue:v19 forKey:v13];
        }
      }
      id v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
  return v7;
}

+ (id)animationsPathsFromFilterID:(id)a3 andPresetID:(id)a4
{
  id v6 = +[MPFilterManager sharedManager];
  id v40 = a3;
  id v7 = a3;
  id v8 = a4;
  id v9 = [v6 animationsForFilterID:v7 andPresetID:a4];
  id v37 = +[NSMutableDictionary dictionary];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v38 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v38)
  {
    uint64_t v36 = *(void *)v48;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(v9);
        }
        uint64_t v11 = *(void *)(*((void *)&v47 + 1) + 8 * v10);
        id v12 = +[MPAnimationPath animationPath];
        [v37 setObject:v12 forKey:v11];
        id v13 = [v9 objectForKey:v11];
        objc_opt_class();
        uint64_t v39 = v10;
        if (objc_opt_isKindOfClass()) {
          id v13 = objc_msgSend(+[MPAnimationManager sharedManager](MPAnimationManager, "sharedManager"), "animationDescriptionForAnimationID:", v13);
        }
        id v14 = (char *)objc_msgSend(objc_msgSend(v13, "objectForKey:", @"values"), "count");
        objc_msgSend(objc_msgSend(v13, "objectForKey:", @"keyTimes"), "objectAtIndex:", 0);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if ([v13 objectForKey:@"valueType"]
          && !objc_msgSend(objc_msgSend(v13, "objectForKey:", @"valueType"), "isEqualToString:", @"scalar"))
        {
          if (objc_msgSend(objc_msgSend(v13, "objectForKey:", @"valueType"), "isEqualToString:", @"2DPath"))
          {
            if ((uint64_t)v14 >= 1)
            {
              for (i = 0; i != v14; ++i)
              {
                objc_msgSend(objc_msgSend(objc_msgSend(v13, "objectForKey:", @"values"), "objectAtIndex:", i), "CGPointValue");
                +[MPUtilities scaledFilterPresetPointValue:withKey:forFilterID:andPresetID:](MPUtilities, "scaledFilterPresetPointValue:withKey:forFilterID:andPresetID:", v11, v40, v8);
                double v26 = v25;
                double v28 = v27;
                id v29 = objc_msgSend(objc_msgSend(v13, "objectForKey:", @"keyTimes"), "objectAtIndex:", i);
                if (isKindOfClass) {
                  id v29 = [v29 objectForKey:@"timeOffset"];
                }
                [v29 doubleValue];
                objc_msgSend(v12, "createKeyframeWithPoint:atTime:offsetType:", +[MPUtilities timeOffSetFromString:](MPUtilities, "timeOffSetFromString:", objc_msgSend(v13, "objectForKey:", @"timeOffsetKind")), v26, v28, v30);
              }
            }
          }
          else if (objc_msgSend(objc_msgSend(v13, "objectForKey:", @"valueType"), "isEqualToString:", @"vector")&& (uint64_t)v14 >= 1)
          {
            for (j = 0; j != v14; ++j)
            {
              long long v45 = 0uLL;
              int v46 = 0;
              MCStringToVector(objc_msgSend(objc_msgSend(v13, "objectForKey:", @"values"), "objectAtIndex:", j), (uint64_t)&v45);
              long long v43 = 0uLL;
              int v44 = 0;
              long long v41 = v45;
              int v42 = v46;
              +[MPUtilities scaledFilterPresetVectorValue:&v41 withKey:v11 forFilterID:v40 andPresetID:v8];
              id v32 = objc_msgSend(objc_msgSend(v13, "objectForKey:", @"keyTimes"), "objectAtIndex:", j);
              if (isKindOfClass) {
                id v32 = [v32 objectForKey:@"timeOffset"];
              }
              [v32 doubleValue];
              long long v41 = v43;
              int v42 = v44;
              objc_msgSend(v12, "createKeyframeWithVector:atTime:offsetType:", +[MPVector vectorFromMCVector:](MPVector, "vectorFromMCVector:", &v41), +[MPUtilities timeOffSetFromString:](MPUtilities, "timeOffSetFromString:", objc_msgSend(v13, "objectForKey:", @"timeOffsetKind")), v33);
            }
          }
        }
        else if ((uint64_t)v14 >= 1)
        {
          id v16 = 0;
          for (k = 0; k != v14; ++k)
          {
            objc_msgSend(objc_msgSend(objc_msgSend(v13, "objectForKey:", @"values"), "objectAtIndex:", k), "floatValue");
            +[MPUtilities scaledFilterPresetScalarValue:v11 withKey:v40 forFilterID:v8 andPresetID:v18];
            double v20 = v19;
            id v21 = objc_msgSend(objc_msgSend(v13, "objectForKey:", @"keyTimes"), "objectAtIndex:", k);
            if (isKindOfClass)
            {
              id v16 = [v21 objectForKey:@"timeOffsetKind"];
              id v21 = objc_msgSend(objc_msgSend(objc_msgSend(v13, "objectForKey:", @"keyTimes"), "objectAtIndex:", k), "objectForKey:", @"timeOffset");
            }
            float v22 = v20;
            [v21 doubleValue];
            objc_msgSend(v12, "createKeyframeWithScalar:atTime:offsetType:", +[MPUtilities timeOffSetFromString:](MPUtilities, "timeOffSetFromString:", v16), v22, v23);
          }
        }
        uint64_t v10 = v39 + 1;
      }
      while ((id)(v39 + 1) != v38);
      id v34 = [v9 countByEnumeratingWithState:&v47 objects:v51 count:16];
      id v38 = v34;
    }
    while (v34);
  }
  return v37;
}

+ (void)syncAnimationPaths:(id)a3
{
  id v35 = +[NSMutableArray array];
  id obj = a3;
  id v41 = +[NSMutableSet set];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v34 = [a3 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v57;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v57 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v4;
        v5 = *(void **)(*((void *)&v56 + 1) + 8 * v4);
        id v42 = +[NSMutableArray array];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v6 = v5;
        id v38 = [v5 keyframes];
        id v7 = [v38 countByEnumeratingWithState:&v52 objects:v62 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v53;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v53 != v9) {
                objc_enumerationMutation(v38);
              }
              uint64_t v11 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              [v11 time];
              id v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              [v6 relativeTimeForKeyframe:v11];
              id v13 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v12, @"origTime", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"relTime", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)[v11 offsetType]), @"offsetType", 0);
              [v42 addObject:v13];
              [v41 addObject:v13];
            }
            id v8 = [v38 countByEnumeratingWithState:&v52 objects:v62 count:16];
          }
          while (v8);
        }
        [v35 addObject:v42];
        uint64_t v4 = v36 + 1;
      }
      while ((id)(v36 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
    }
    while (v34);
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v39 = [v35 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v39)
  {
    uint64_t v14 = 0;
    uint64_t v37 = *(void *)v49;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v49 != v37) {
          objc_enumerationMutation(v35);
        }
        uint64_t v43 = v15;
        id v16 = +[NSMutableSet setWithArray:*(void *)(*((void *)&v48 + 1) + 8 * v15)];
        float v17 = +[NSMutableSet setWithSet:v41];
        [(NSMutableSet *)v17 minusSet:v16];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v44 objects:v60 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v45;
          do
          {
            for (j = 0; j != v19; j = (char *)j + 1)
            {
              if (*(void *)v45 != v20) {
                objc_enumerationMutation(v17);
              }
              float v22 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
              objc_msgSend(objc_msgSend(v22, "objectForKey:", @"relTime"), "doubleValue");
              double v24 = v23;
              objc_msgSend(objc_msgSend(v22, "objectForKey:", @"relTime"), "doubleValue");
              double v26 = v25;
              uint64_t v27 = (int)objc_msgSend(objc_msgSend(v22, "objectForKey:", @"offsetType"), "intValue");
              id v28 = [obj objectAtIndex:v14];
              id v29 = objc_msgSend(objc_msgSend(v28, "orderedKeyframes"), "lastObject");
              if ([v29 isMemberOfClass:objc_opt_class()])
              {
                [v29 scalar];
                +[MPUtilities computeScalarValueForAnimationPath:v28 atTime:0 defaultsTo:v24 context:v30];
                objc_msgSend(v28, "createKeyframeWithScalar:atTime:offsetType:", v27);
              }
              else if ([v29 isMemberOfClass:objc_opt_class()])
              {
                [v29 point];
                +[MPUtilities computePointValueForAnimationPath:atTime:defaultsTo:](MPUtilities, "computePointValueForAnimationPath:atTime:defaultsTo:", v28, v24, v31, v32);
                objc_msgSend(v28, "createKeyframeWithPoint:atTime:offsetType:", v27);
              }
              else if ([v29 isMemberOfClass:objc_opt_class()])
              {
                objc_msgSend(v28, "createKeyframeWithVector:atTime:offsetType:", +[MPUtilities computeVectorValueForAnimationPath:atTime:defaultsTo:](MPUtilities, "computeVectorValueForAnimationPath:atTime:defaultsTo:", v28, objc_msgSend(v29, "vector"), v24), v27, v26);
              }
            }
            id v19 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v44 objects:v60 count:16];
          }
          while (v19);
        }
        ++v14;
        uint64_t v15 = v43 + 1;
      }
      while ((id)(v43 + 1) != v39);
      id v39 = [v35 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v39);
  }
}

+ (id)effectContainersForTime:(double)a3 inDocument:(id)a4
{
  id v6 = +[NSMutableSet set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = [a4 layers];
  id v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [v12 timeIn];
        double v14 = v13;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v15 = objc_msgSend(v12, "effectContainers", 0);
        id v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v27;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
              if (v14 <= a3)
              {
                [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) duration];
                if (v14 + v21 >= a3) {
                  [v6 addObject:v20];
                }
              }
              [v20 duration];
              double v23 = v22;
              [v20 outroTransitionDuration];
              double v14 = v14 + v23 - v24;
            }
            id v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v17);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v9);
  }
  return v6;
}

+ (id)textForIndex:(int64_t)a3 inMCContainerWithObjectID:(id)a4 inDocument:(id)a5
{
  id v7 = objc_msgSend(objc_msgSend(a5, "montage"), "containerForObjectID:", a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v8 = +[MPUtilities effectForMCContainerEffect:v7 inDocument:a5];
  if ((unint64_t)objc_msgSend(objc_msgSend(v8, "texts"), "count") <= a3) {
    return 0;
  }
  id v9 = [v8 texts];
  return [v9 objectAtIndex:a3];
}

+ (id)effectForMCContainerWithObjectID:(id)a3 inDocument:(id)a4
{
  id v5 = objc_msgSend(objc_msgSend(a4, "montage"), "containerForObjectID:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return +[MPUtilities effectForMCContainerEffect:v5 inDocument:a4];
}

+ (id)effectForMCContainerEffect:(id)a3 inDocument:(id)a4
{
  id result = objc_msgSend(a1, "createPlugPathToContainer:inDocument:");
  if (!result) {
    return result;
  }
  id v7 = result;
  id result = [result count];
  if (!result) {
    return result;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id result = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (!result) {
    return result;
  }
  id v8 = result;
  uint64_t v9 = *(void *)v36;
  id v25 = a3;
  id v26 = v7;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v36 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      HasPrefidouble x = NSStringHasPrefix(v11, "SI_");
      if (!HasPrefix
        && (([a4 conformsToProtocol:&OBJC_PROTOCOL___MPManualLayerSupport] & 1) != 0
         || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
      {
        id v13 = objc_msgSend(a4, "layerForKey:", v11, v25);
        if (!v13)
        {
          if (([a4 conformsToProtocol:&OBJC_PROTOCOL___MPAutomaticLayerSupport] & 1) == 0
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || (id v14 = [a4 layers],
                long long v31 = 0u,
                long long v32 = 0u,
                long long v33 = 0u,
                long long v34 = 0u,
                (id v15 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16]) == 0))
          {
            id v13 = 0;
            goto LABEL_44;
          }
          id v16 = v15;
          uint64_t v17 = *(void *)v32;
LABEL_16:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v14);
            }
            id v13 = *(id *)(*((void *)&v31 + 1) + 8 * v18);
            if (objc_msgSend(objc_msgSend(objc_msgSend(v13, "plug"), "idInSupercontainer"), "isEqualToString:", v11))break; {
            if (v16 == (id)++v18)
            }
            {
              id v16 = [v14 countByEnumeratingWithState:&v31 objects:v40 count:16];
              id v13 = 0;
              id v7 = v26;
              if (v16) {
                goto LABEL_16;
              }
              goto LABEL_44;
            }
          }
LABEL_41:
          id v7 = v26;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = [a4 layerForKey:v11];
        }
        else
        {
          if (!HasPrefix || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || (uint64_t)[a4 countOfEffects] < 2
              || (id v20 = [a4 effects],
                  long long v27 = 0u,
                  long long v28 = 0u,
                  long long v29 = 0u,
                  long long v30 = 0u,
                  (id v21 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16]) == 0))
            {
              id v13 = a4;
              goto LABEL_44;
            }
            id v22 = v21;
            uint64_t v23 = *(void *)v28;
LABEL_33:
            uint64_t v24 = 0;
            while (1)
            {
              if (*(void *)v28 != v23) {
                objc_enumerationMutation(v20);
              }
              id v13 = *(id *)(*((void *)&v27 + 1) + 8 * v24);
              if (objc_msgSend(objc_msgSend(objc_msgSend(v13, "plug", v25), "idInSupercontainer"), "isEqualToString:", v11))break; {
              if (v22 == (id)++v24)
              }
              {
                id v22 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
                if (v22) {
                  goto LABEL_33;
                }
                id v13 = a4;
                break;
              }
            }
            a3 = v25;
            goto LABEL_41;
          }
          id v19 = objc_msgSend(objc_msgSend(a4, "effectContainers"), "objectAtIndex:", NSIntegerFromString(v11, 3uLL));
        }
        id v13 = v19;
      }
LABEL_44:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 countOfEffects] == (char *)&dword_0 + 1) {
        a4 = objc_msgSend(objc_msgSend(v13, "effects"), "lastObject");
      }
      else {
        a4 = v13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
      }
      if (objc_msgSend(a4, "container", v25) == a3) {
        return a4;
      }
    }
    id v8 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
    id result = 0;
    if (v8) {
      continue;
    }
    return result;
  }
}

+ (id)slideForSlide:(id)a3 inDocument:(id)a4
{
  id v5 = +[MPUtilities effectForMCContainerEffect:inDocument:](MPUtilities, "effectForMCContainerEffect:inDocument:", [a3 container], a4);
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  id v7 = objc_msgSend(objc_msgSend(v5, "slides"), "count");
  if (v7 <= [a3 index]) {
    return 0;
  }
  id v8 = [v6 slides];
  id v9 = [a3 index];
  return [v8 objectAtIndex:v9];
}

+ (id)slideForPath:(id)a3 inDocument:(id)a4
{
  id v5 = objc_msgSend(objc_msgSend(a4, "montage"), "videoAssetForFileAtPath:", a3);
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  id v7 = [v5 slides];
  if (![v7 count]) {
    return 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v8) {
    return 0;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v19;
LABEL_5:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v19 != v10) {
      objc_enumerationMutation(v7);
    }
    id v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
    id v13 = +[MPUtilities effectForMCContainerEffect:inDocument:](MPUtilities, "effectForMCContainerEffect:inDocument:", [v12 container], a4);
    if (v13)
    {
      id v14 = v13;
      id v15 = [v12 index];
      if (v15 < objc_msgSend(objc_msgSend(v14, "slides"), "count"))
      {
        id v16 = objc_msgSend(objc_msgSend(v14, "slides"), "objectAtIndex:", objc_msgSend(v12, "index"));
        if (objc_msgSend(objc_msgSend(v6, "path"), "isEqualToString:", objc_msgSend(v16, "path"))) {
          return v16;
        }
      }
    }
    if (v9 == (id)++v11)
    {
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      id v16 = 0;
      if (v9) {
        goto LABEL_5;
      }
      return v16;
    }
  }
}

+ (id)textsDisplayedAtTime:(double)a3 inDocument:(id)a4
{
  id v5 = +[MPUtilities effectContainersForTime:inDocument:](MPUtilities, "effectContainersForTime:inDocument:", a4);
  id v6 = +[NSMutableSet set];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v5;
  id v32 = [v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v43;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v43 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v7;
        id v8 = *(void **)(*((void *)&v42 + 1) + 8 * v7);
        [v8 startTime];
        double v10 = v9;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v11 = [v8 effects];
        id v12 = [v11 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v12)
        {
          id v13 = v12;
          double v14 = a3 - v10;
          uint64_t v15 = *(void *)v39;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v39 != v15) {
                objc_enumerationMutation(v11);
              }
              uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              id v18 = [v17 texts];
              id v19 = [v18 countByEnumeratingWithState:&v34 objects:v46 count:16];
              if (v19)
              {
                id v20 = v19;
                uint64_t v21 = *(void *)v35;
                do
                {
                  for (j = 0; j != v20; j = (char *)j + 1)
                  {
                    if (*(void *)v35 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v23 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
                    [v23 displayStartTime];
                    double v25 = v24;
                    [v23 displayDuration];
                    double v27 = v25 + v26;
                    if (v14 >= v25 && v14 <= v27) {
                      [v6 addObject:v23];
                    }
                  }
                  id v20 = [v18 countByEnumeratingWithState:&v34 objects:v46 count:16];
                }
                while (v20);
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v13);
        }
        uint64_t v7 = v33 + 1;
      }
      while ((id)(v33 + 1) != v32);
      id v32 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v32);
  }
  return v6;
}

+ (id)textForElementID:(id)a3 withMCContainerEffect:(id)a4 inDocument:(id)a5
{
  id v6 = +[MPUtilities effectForMCContainerEffect:a4 inDocument:a5];
  id v7 = objc_msgSend(objc_msgSend(a3, "stringByTrimmingCharactersInSet:", +[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet")), "integerValue");
  if (!v6) {
    return 0;
  }
  unint64_t v8 = (unint64_t)v7;
  if (!objc_msgSend(objc_msgSend(v6, "texts"), "count")
    || v8 >= (unint64_t)objc_msgSend(objc_msgSend(v6, "texts"), "count"))
  {
    return 0;
  }
  id v9 = [v6 texts];
  return [v9 objectAtIndex:v8];
}

+ (id)slideForElementID:(id)a3 withMCContainerEffect:(id)a4 inDocument:(id)a5
{
  id v6 = +[MPUtilities effectForMCContainerEffect:a4 inDocument:a5];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  unint64_t v8 = objc_msgSend(objc_msgSend(a3, "stringByTrimmingCharactersInSet:", +[NSCharacterSet letterCharacterSet](NSCharacterSet, "letterCharacterSet")), "integerValue");
  if (!objc_msgSend(objc_msgSend(v7, "slides"), "count") || v8 >= objc_msgSend(objc_msgSend(v7, "slides"), "count"))
  {
    if (objc_msgSend(objc_msgSend(v7, "secondarySlides"), "count"))
    {
      uint64_t v10 = (uint64_t)objc_msgSend(objc_msgSend(v7, "slides"), "count");
      if (objc_msgSend(objc_msgSend(v7, "secondarySlides"), "count"))
      {
        v8 -= v10;
        if (v8 < objc_msgSend(objc_msgSend(v7, "secondarySlides"), "count"))
        {
          id v9 = [v7 secondarySlides];
          goto LABEL_9;
        }
      }
    }
    return 0;
  }
  id v9 = [v7 slides];
LABEL_9:
  return [v9 objectAtIndex:v8];
}

+ (id)layerForContainer:(id)a3 inDocument:(id)a4
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(objc_msgSend(a4, "documentLayerGroup"), "layers", 0);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (objc_msgSend(objc_msgSend(v10, "plug"), "container") == a3) {
      return v10;
    }
    if (v7 == (id)++v9)
    {
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

+ (id)idOfCombinedID:(id)a3
{
  id v4 = [a3 componentsSeparatedByString:@"/"];
  if (![v4 count]) {
    return a3;
  }
  return [v4 objectAtIndex:0];
}

+ (id)presetIDOfCombinedID:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"/"];
  if ((unint64_t)[v3 count] < 2) {
    return @"Default";
  }
  return [v3 objectAtIndex:1];
}

+ (id)placesPinLabelForSlideAssetPath:(id)a3 inDocument:(id)a4
{
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v5 = [a4 layers];
  id result = [v5 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (result)
  {
    id v7 = result;
    uint64_t v8 = *(void *)v52;
    uint64_t v29 = *(void *)v52;
    id v30 = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v11 = objc_msgSend(v10, "effectContainers", v29, v30);
        id v12 = [v11 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v48;
          uint64_t v31 = i;
          id v32 = v7;
          uint64_t v33 = *(void *)v48;
          id v34 = v11;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v48 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
              long long v43 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              id obj = [v16 effects];
              id v17 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
              if (v17)
              {
                id v18 = v17;
                uint64_t v38 = *(void *)v44;
                id v35 = v13;
                do
                {
                  for (k = 0; k != v18; k = (char *)k + 1)
                  {
                    if (*(void *)v44 != v38) {
                      objc_enumerationMutation(obj);
                    }
                    id v20 = *(void **)(*((void *)&v43 + 1) + 8 * (void)k);
                    if (objc_msgSend(objc_msgSend(v20, "effectID"), "isEqualToString:", @"PinMap"))
                    {
                      id v22 = objc_msgSend(objc_msgSend(v20, "effectAttributeForKey:", @"pinInformation"), "objectsAtIndexes:", +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", NSRangeFromString((NSString *)objc_msgSend(v20, "effectAttributeForKey:", @"pinRange")).location, v21));
                      long long v39 = 0u;
                      long long v40 = 0u;
                      long long v41 = 0u;
                      long long v42 = 0u;
                      uint64_t v23 = (char *)[v22 countByEnumeratingWithState:&v39 objects:v55 count:16];
                      if (v23)
                      {
                        double v24 = v23;
                        double v25 = 0;
                        uint64_t v26 = *(void *)v40;
                        while (2)
                        {
                          double v27 = 0;
                          long long v36 = &v24[(void)v25];
                          do
                          {
                            if (*(void *)v40 != v26) {
                              objc_enumerationMutation(v22);
                            }
                            id v28 = objc_msgSend(objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * (void)v27), "objectForKey:", @"photos"), "indexOfObject:", a3);
                            if (v28 != (id)0x7FFFFFFFFFFFFFFFLL)
                            {
                              if (v28) {
                                return 0;
                              }
                              else {
                                return objc_msgSend(objc_msgSend(v20, "texts"), "objectAtIndex:", &v27[(void)v25 + 1]);
                              }
                            }
                            ++v27;
                          }
                          while (v24 != v27);
                          double v24 = (char *)[v22 countByEnumeratingWithState:&v39 objects:v55 count:16];
                          double v25 = v36;
                          if (v24) {
                            continue;
                          }
                          break;
                        }
                      }
                    }
                  }
                  id v18 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
                  uint64_t v14 = v33;
                  id v11 = v34;
                  id v13 = v35;
                }
                while (v18);
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v47 objects:v57 count:16];
            uint64_t v8 = v29;
            id v5 = v30;
            i = v31;
            id v7 = v32;
          }
          while (v13);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v51 objects:v58 count:16];
      id result = 0;
    }
    while (v7);
  }
  return result;
}

+ (double)aspectRatioOfLayerable:(id)a3 relativeToAspectRatio:(double)a4
{
  id v6 = objc_msgSend(+[MPUtilities parentsOfObject:](MPUtilities, "parentsOfObject:"), "reverseObjectEnumerator");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          [v11 parent];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [v11 size];
            a4 = a4 * (v12 / v13);
          }
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  [a3 size];
  return a4 * (v14 / v15);
}

+ (double)displayTimeForText:(id)a3
{
  id v4 = [a3 parentEffect];
  if (!v4) {
    return 0.0;
  }
  id v5 = v4;
  id v6 = [v4 parentDocument];
  if (v5 == [v6 titleEffect])
  {
    id v10 = [v5 effectID];
    objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "defaultPosterFrameTimeForEffectID:andPresetID:", v10, objc_msgSend(v5, "presetID"));
    double v8 = v11;
    if ((objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "posterTimeIsStaticForEffectID:andPresetID:", v10, objc_msgSend(v5, "presetID")) & 1) == 0)
    {
      id v12 = +[MREffectManager sharedManager];
      id v13 = [v5 formattedAttributes];
      id v14 = [v5 effectID];
      id v15 = [v5 slides];
      id v16 = [v5 texts];
      [v6 aspectRatio];
      id v17 = objc_msgSend(v12, "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:", v14, v13, v15, v16);
      if (v17)
      {
        long long v18 = v17;
        [v5 fullDuration];
        double v20 = v19;
        [v18 mainDuration];
        double v22 = v21;
        [v18 phaseInDuration];
        double v24 = v22 + v23;
        [v18 phaseOutDuration];
        double v26 = v20 / (v24 + v25);
      }
      else
      {
        [v12 defaultMainDurationForEffectID:v10];
        double v57 = v56;
        [v12 defaultPhaseInDurationForEffectID:v10];
        double v59 = v58;
        [v12 defaultPhaseOutDurationForEffectID:v10];
        double v61 = v60;
        [v5 fullDuration];
        double v26 = v62 / (v57 + v59 + v61);
      }
      double v8 = v8 * v26;
    }
    goto LABEL_19;
  }
  [a3 displayTime];
  if (v7 != 0.0)
  {
    double v8 = v7;
LABEL_19:
    objc_msgSend(objc_msgSend(v5, "parentContainer"), "startTime");
    return v8 + v63;
  }
  id v27 = [v5 effectID];
  objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "defaultPosterFrameTimeForEffectID:andPresetID:", v27, objc_msgSend(v5, "presetID"));
  double v29 = v28;
  id v30 = +[MREffectManager sharedManager];
  id v31 = [v5 formattedAttributes];
  id v32 = [v5 effectID];
  id v33 = [v5 slides];
  id v34 = [v5 texts];
  [v6 aspectRatio];
  id v35 = objc_msgSend(v30, "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:", v32, v31, v33, v34);
  if (v35)
  {
    long long v36 = v35;
    [v5 fullDuration];
    double v38 = v37;
    [v36 mainDuration];
    double v40 = v39;
    [v36 phaseInDuration];
    double v42 = v40 + v41;
    [v36 phaseOutDuration];
    double v44 = v38 / (v42 + v43);
  }
  else
  {
    [v30 defaultMainDurationForEffectID:v27];
    double v46 = v45;
    [v30 defaultPhaseInDurationForEffectID:v27];
    double v48 = v47;
    [v30 defaultPhaseOutDurationForEffectID:v27];
    double v50 = v49;
    [v5 fullDuration];
    double v44 = v51 / (v46 + v48 + v50);
  }
  double v52 = v29 * v44;
  objc_msgSend(objc_msgSend(v5, "parentContainer"), "introTransitionDuration");
  if (v52 < v53) {
    double v52 = v53;
  }
  objc_msgSend(objc_msgSend(v5, "parentContainer"), "startTime");
  double v55 = v54 + v52;
  [v6 videoDuration];
  if (v55 < result) {
    return v55;
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
  double v11 = [[MUMathExpressionFloatBased alloc] initWithString:v9 error:0];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = [a5 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v39;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(a5);
        }
        uint64_t v16 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        id v17 = [a5 objectForKey:v16];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v18 = (objc_class *)objc_opt_class();
          if (![NSStringFromClass(v18) isEqualToString:@"NSCFBoolean"]) {
            continue;
          }
        }
        [v17 doubleValue];
        *(float *)&double v19 = v19;
        [(MUMathExpressionFloatBased *)v10 setValue:v16 forVariable:v19];
        [v17 doubleValue];
        *(float *)&double v20 = v20;
        [(MUMathExpressionFloatBased *)v11 setValue:v16 forVariable:v20];
      }
      id v13 = [a5 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v13);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v21 = [a4 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(a4);
        }
        uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * (void)j);
        id v26 = [a4 objectForKey:v25];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v26 doubleValue];
          *(float *)&double v27 = v27;
          [(MUMathExpressionFloatBased *)v10 setValue:v25 forVariable:v27];
          [v26 doubleValue];
          *(float *)&double v28 = v28;
          [(MUMathExpressionFloatBased *)v11 setValue:v25 forVariable:v28];
        }
      }
      id v22 = [a4 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v22);
  }
  [(MUMathExpressionFloatBased *)v10 evaluate];
  CGFloat v30 = v29;
  [(MUMathExpressionFloatBased *)v11 evaluate];
  CGFloat v32 = v31;

  v44.width = v30;
  v44.height = v32;
  return NSStringFromCGSize(v44);
}

+ (id)stringWithNewUUID
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  CFStringRef v3 = CFUUIDCreateString(0, v2);
  id v4 = +[NSString stringWithString:v3];
  CFRelease(v3);
  CFRelease(v2);
  return v4;
}

+ (CGColor)CGColorFromString:(id)a3
{
  CGRect components = CGRectFromString((NSString *)a3);
  CFStringRef v3 = +[MPUtilities newColorSpaceForDevice];
  id v4 = CGColorCreate(v3, &components.origin.x);
  CGColorSpaceRelease(v3);
  return v4;
}

+ (id)stringFromCGColor:(CGColor *)a3
{
  if (!a3) {
    return 0;
  }
  Components = CGColorGetComponents(a3);
  uint64_t v4 = *(void *)Components;
  uint64_t v5 = *((void *)Components + 1);
  uint64_t v6 = *((void *)Components + 2);
  uint64_t v7 = *((void *)Components + 3);
  return NSStringFromCGRect(*(CGRect *)&v4);
}

+ (CGColor)CGColorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  components[0] = a3;
  components[1] = a4;
  components[2] = a5;
  components[3] = a6;
  uint64_t v6 = +[MPUtilities newColorSpaceForDevice];
  uint64_t v7 = CGColorCreate(v6, components);
  CGColorSpaceRelease(v6);
  return v7;
}

+ (CGColor)blackCGColor
{
  CFUUIDRef v2 = +[MPUtilities newColorSpaceForDevice];
  CFStringRef v3 = CGColorCreate(v2, (const CGFloat *)&v5);
  CGColorSpaceRelease(v2);
  return v3;
}

+ (id)createPlugPathToContainer:(id)a3 inDocument:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v6 = +[NSMutableArray array];
  id v7 = [a4 montage];
  id v8 = [a3 referencingPlug];
  if (!v8) {
    return 0;
  }
  for (id i = v8; i != [v7 rootPlug]; id i = objc_msgSend(objc_msgSend(i, "supercontainer"), "referencingPlug"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = NSStringWithInteger("SI_", (unint64_t)[i index]);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return 0;
        }
      }
      id v10 = (NSString *)[i idInSupercontainer];
    }
    [v6 insertObject:v10 atIndex:0];
  }
  return v6;
}

+ (id)createPlugPathToObject:(id)a3 inDocument:(id)a4
{
  id v6 = +[NSMutableArray array];
  id v7 = [a4 montage];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return 0;
        }
        if (![a3 plug]) {
          a3 = [a3 parentContainer];
        }
      }
    }
  }
  id v8 = [a3 plug];
  if (!v8) {
    return 0;
  }
  id v9 = v8;
  while (v9 != [v7 rootPlug])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = NSStringWithInteger("SI_", (unint64_t)[v9 index]);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          NSLog(@"Hmmmm what to do? Can't create a plug path.");
          continue;
        }
      }
      id v10 = (NSString *)[v9 idInSupercontainer];
    }
    [v6 insertObject:v10 atIndex:0];
    id v9 = objc_msgSend(objc_msgSend(v9, "supercontainer"), "referencingPlug");
  }
  return v6;
}

+ (BOOL)pathIsRelative:(id)a3
{
  return [a3 characterAtIndex:0] != 47;
}

+ (id)createMCAction:(id)a3 forPlug:(id)a4 withKey:(id)a5
{
  id v8 = [a3 targetObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:](MCTransitionTrigger, "transitionForTargetPlugObjectID:withTransitionID:", [v8 objectID], objc_msgSend(a3, "transitionID"));
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = +[MCAnimationTrigger animationTriggerForTargetPlugObjectID:withAnimationKey:](MCAnimationTrigger, "animationTriggerForTargetPlugObjectID:withAnimationKey:", [v8 objectID], objc_msgSend(a3, "animationKey"));
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = +[MCActionTrigger actionTriggerForTargetPlugObjectID:withActionKey:](MCActionTrigger, "actionTriggerForTargetPlugObjectID:withActionKey:", [v8 objectID], objc_msgSend(a3, "actionKey"));
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = +[MCStateOperationExpression stateOperationForTargetPlugObjectID:withStateKey:andExpression:](MCStateOperationExpression, "stateOperationForTargetPlugObjectID:withStateKey:andExpression:", [v8 objectID], objc_msgSend(a3, "stateKey"), objc_msgSend(a3, "operation"));
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = +[MCConditionalAction conditionalActionWithPredicate:0];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v9 = +[MCActionGroup actionGroup];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                id v10 = 0;
                goto LABEL_16;
              }
              id v9 = +[MCGenericAction genericActionForTargetPlugObjectID:withAttributes:](MCGenericAction, "genericActionForTargetPlugObjectID:withAttributes:", [v8 objectID], objc_msgSend(a3, "attributes"));
            }
          }
        }
      }
    }
  }
  id v10 = v9;
LABEL_16:
  [a4 setAction:v10 forKey:a5];
  return v10;
}

+ (void)collectAllActionableLayers:(id)a3 inDictionary:(id)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (id i = 0; i != v7; id i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(a4, "setObject:forKey:", v10, objc_msgSend(v10, "uuid"));
          id v11 = [v10 keyedLayers];
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          objc_msgSend(a4, "setObject:forKey:", v10, objc_msgSend(v10, "uuid"));
          if ((isKindOfClass & 1) == 0) {
            continue;
          }
          id v11 = [v10 layers];
        }
        +[MPUtilities collectAllActionableLayers:inDictionary:](MPUtilities, "collectAllActionableLayers:inDictionary:", [v11 allValues], a4);
      }
      id v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

+ (id)createPlugInContainer:(id)a3 forLayer:(id)a4 key:(id)a5 inDocument:(id)a6
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = objc_msgSend(objc_msgSend(a6, "montage"), "createSerializerContainer");
    id v11 = [a3 setPlugForContainer:v10 forID:a5];
    objc_msgSend(a4, "setMontage:", objc_msgSend(a6, "montage"));
    [a4 setPlug:v11];
    [a4 setLayerSerializer:v10];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = objc_msgSend(objc_msgSend(a6, "montage"), "createEffectContainer");
      id v11 = [a3 setPlugForContainer:v12 forID:a5];
      objc_msgSend(a4, "setMontage:", objc_msgSend(a6, "montage"));
      [a4 setPlug:v11];
      [a4 setLayerEffect:v12];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = objc_msgSend(objc_msgSend(a6, "montage"), "createParallelizerContainer");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return 0;
        }
        id v13 = objc_msgSend(objc_msgSend(a6, "montage"), "createNavigatorContainer");
      }
      id v14 = v13;
      id v11 = [a3 setPlugForContainer:v13 forID:a5];
      [a4 setContainer:v14];
      [a4 setPlug:v11];
    }
  }
  return v11;
}

+ (id)createPlugInSlide:(id)a3 forLayer:(id)a4 inDocument:(id)a5
{
  id v7 = objc_msgSend(objc_msgSend(a5, "montage", a3), "createParallelizerContainer");
  id v8 = -[MCObject initFromScratchWithMontage:]([MCPlugSlide alloc], "initFromScratchWithMontage:", [a5 montage]);
  [v8 setContainer:v7];
  [a4 setContainer:v7];
  [a4 setPlug:v8];
  return v8;
}

+ (id)parentsOfObject:(id)a3
{
  id v4 = +[NSMutableArray array];
  while (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return v4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      a3 = [a3 parentContainer];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [a3 parentLayer];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_12;
          }
        }
      }
      id v5 = [a3 parent];
    }
    a3 = v5;
LABEL_12:
    [v4 addObject:a3];
  }
  return v4;
}

@end