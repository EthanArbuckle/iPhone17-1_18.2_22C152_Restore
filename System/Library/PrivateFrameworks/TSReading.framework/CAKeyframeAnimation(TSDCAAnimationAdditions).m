@interface CAKeyframeAnimation(TSDCAAnimationAdditions)
- (double)TSD_animationPercentByApplyingTimingFunctionForKeyPath:()TSDCAAnimationAdditions atTime:;
- (uint64_t)TSD_valueAtTime:()TSDCAAnimationAdditions initialValue:;
- (void)p_getValue:()TSDCAAnimationAdditions animationPercent:atTime:initialValue:;
@end

@implementation CAKeyframeAnimation(TSDCAAnimationAdditions)

- (void)p_getValue:()TSDCAAnimationAdditions animationPercent:atTime:initialValue:
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  objc_msgSend(a1, "TSD_animationPercentFromAnimationTime:");
  double v10 = v9;
  if (v9 < 0.0)
  {
    v11 = (void *)[a1 fillMode];
    if (([v11 isEqualToString:*MEMORY[0x263F15AA0]] & 1) == 0)
    {
      v12 = (void *)[a1 fillMode];
      result = (void *)[v12 isEqualToString:*MEMORY[0x263F15AA8]];
      if (!result) {
        goto LABEL_9;
      }
    }
    goto LABEL_7;
  }
  if (v9 == 0.0
    || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "keyTimes"), "objectAtIndex:", 0), "doubleValue"), v10 < v14))
  {
LABEL_7:
    result = objc_msgSend((id)objc_msgSend(a1, "values"), "objectAtIndex:", 0);
LABEL_8:
    a5 = result;
    goto LABEL_9;
  }
  if (v10 == 1.0)
  {
LABEL_15:
    result = objc_msgSend((id)objc_msgSend(a1, "values"), "lastObject");
    goto LABEL_8;
  }
  if (v10 > 1.0
    || v10 < 1.0
    && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "keyTimes"), "lastObject"), "doubleValue"), v10 > v15))
  {
    v16 = (void *)[a1 fillMode];
    if (([v16 isEqualToString:*MEMORY[0x263F15AB0]] & 1) == 0)
    {
      v17 = (void *)[a1 fillMode];
      result = (void *)[v17 isEqualToString:*MEMORY[0x263F15AA8]];
      if (!result)
      {
LABEL_9:
        if (!a3) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
    goto LABEL_15;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v18 = objc_msgSend(a1, "keyTimes", 0);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        [v23 doubleValue];
        if (v10 < v24)
        {
          uint64_t v25 = objc_msgSend((id)objc_msgSend(a1, "keyTimes"), "indexOfObject:", v23) - 1;
          goto LABEL_32;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  uint64_t v25 = 0;
LABEL_32:
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "keyTimes"), "objectAtIndex:", v25), "doubleValue");
  double v27 = v26;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "keyTimes"), "objectAtIndex:", v25 + 1), "doubleValue");
  double v29 = v28;
  uint64_t v30 = objc_msgSend((id)objc_msgSend(a1, "values"), "objectAtIndex:", v25);
  uint64_t v31 = objc_msgSend((id)objc_msgSend(a1, "values"), "objectAtIndex:", v25 + 1);
  result = objc_msgSend((id)objc_msgSend(a1, "timingFunctions"), "objectAtIndex:", v25);
  double v10 = (v10 - v27) / (v29 - v27);
  if (result)
  {
    result = objc_msgSend(result, "TSD_valueAtPercent:", v10);
    double v10 = v32;
  }
  if (a3)
  {
    uint64_t v33 = objc_msgSend(a1, "p_interpolatedValueFrom:to:percent:", v30, v31, v10);
    if (v33)
    {
      a5 = (void *)v33;
    }
    else
    {
      v34 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v35 = [NSString stringWithUTF8String:"-[CAKeyframeAnimation(TSDCAAnimationAdditions) p_getValue:animationPercent:atTime:initialValue:]"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 444, @"result is nil!");
      a5 = 0;
    }
LABEL_10:
    result = objc_msgSend(a1, "p_adjustedResultWithValue:", a5);
    *a3 = result;
  }
LABEL_11:
  if (a4) {
    *a4 = v10;
  }
  return result;
}

- (uint64_t)TSD_valueAtTime:()TSDCAAnimationAdditions initialValue:
{
  uint64_t v4 = 0;
  objc_msgSend(a1, "p_getValue:animationPercent:atTime:initialValue:", &v4, 0, a3);
  return v4;
}

- (double)TSD_animationPercentByApplyingTimingFunctionForKeyPath:()TSDCAAnimationAdditions atTime:
{
  double v2 = 0.0;
  objc_msgSend(a1, "p_getValue:animationPercent:atTime:initialValue:", 0, &v2, 0);
  return v2;
}

@end