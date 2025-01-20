@interface CABasicAnimation(TSDCAAnimationAdditions)
- (double)TSD_animationPercentByApplyingTimingFunctionForKeyPath:()TSDCAAnimationAdditions atTime:;
- (uint64_t)TSD_valueAtTime:()TSDCAAnimationAdditions initialValue:;
- (uint64_t)p_getValue:()TSDCAAnimationAdditions animationPercent:atTime:initialValue:;
@end

@implementation CABasicAnimation(TSDCAAnimationAdditions)

- (uint64_t)p_getValue:()TSDCAAnimationAdditions animationPercent:atTime:initialValue:
{
  objc_msgSend(a1, "TSD_animationPercentFromAnimationTime:");
  double v10 = v9;
  if (v9 < 0.0)
  {
    v11 = (void *)[a1 fillMode];
    if (([v11 isEqualToString:*MEMORY[0x263F15AA0]] & 1) == 0)
    {
      v12 = (void *)[a1 fillMode];
      uint64_t result = [v12 isEqualToString:*MEMORY[0x263F15AA8]];
      if (!result) {
        goto LABEL_8;
      }
    }
    goto LABEL_6;
  }
  if (v9 == 0.0)
  {
LABEL_6:
    uint64_t result = [a1 fromValue];
LABEL_7:
    a5 = result;
    goto LABEL_8;
  }
  if (v9 == 1.0 && (objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", @"hidden") & 1) == 0)
  {
LABEL_22:
    uint64_t result = [a1 toValue];
    goto LABEL_7;
  }
  if (v10 >= 1.0)
  {
    v15 = (void *)[a1 fillMode];
    if (([v15 isEqualToString:*MEMORY[0x263F15AB0]] & 1) == 0)
    {
      v16 = (void *)[a1 fillMode];
      uint64_t result = [v16 isEqualToString:*MEMORY[0x263F15AA8]];
      if (!result)
      {
LABEL_8:
        if (!a3) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
    goto LABEL_22;
  }
  uint64_t result = [a1 timingFunction];
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a1, "timingFunction"), "TSD_valueAtPercent:", v10);
    double v10 = v14;
  }
  if (a3)
  {
    a5 = objc_msgSend(a1, "p_interpolatedValueFrom:to:percent:", objc_msgSend(a1, "fromValue"), objc_msgSend(a1, "toValue"), v10);
LABEL_9:
    uint64_t result = objc_msgSend(a1, "p_adjustedResultWithValue:", a5);
    *a3 = result;
  }
LABEL_10:
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
  if ((objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", a4) & 1) == 0)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[CABasicAnimation(TSDCAAnimationAdditions) TSD_animationPercentByApplyingTimingFunctionForKeyPath:atTime:]"];
    [v7 handleFailureInFunction:v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 360, @"Wrong keyPath! (Expected %@, was asked for %@)", objc_msgSend(a1, "keyPath"), a4 file lineNumber description];
  }
  double v10 = 0.0;
  objc_msgSend(a1, "p_getValue:animationPercent:atTime:initialValue:", 0, &v10, 0, a2);
  return v10;
}

@end