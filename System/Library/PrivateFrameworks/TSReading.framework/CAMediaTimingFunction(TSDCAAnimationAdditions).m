@interface CAMediaTimingFunction(TSDCAAnimationAdditions)
- (void)TSD_valueAtPercent:()TSDCAAnimationAdditions;
@end

@implementation CAMediaTimingFunction(TSDCAAnimationAdditions)

- (void)TSD_valueAtPercent:()TSDCAAnimationAdditions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a2 < 0.0 || a2 > 1.0)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[CAMediaTimingFunction(TSDCAAnimationAdditions) TSD_valueAtPercent:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 56, @"percent(%0.3f) is outside [0,1]!", *(void *)&a2);
  }
  if (a2 != 0.0 && a2 != 1.0)
  {
    if (TSD_valueAtPercent__onceToken != -1) {
      dispatch_once(&TSD_valueAtPercent__onceToken, &__block_literal_global_52);
    }
    uint64_t v8 = 0;
    while (![a1 isEqual:TSD_valueAtPercent__s_CAMediaTimingFunctionsCacheArray[v8]])
    {
      if (++v8 == 5)
      {
        [a1 getControlPointAtIndex:0 values:v14];
        [a1 getControlPointAtIndex:1 values:v13];
        [a1 getControlPointAtIndex:2 values:v12];
        [a1 getControlPointAtIndex:3 values:v11];
        v9 = objc_opt_new();
        objc_msgSend(v9, "moveToPoint:", v14[0], v14[1]);
        objc_msgSend(v9, "curveToPoint:controlPoint1:controlPoint2:", v11[0], v11[1], v13[0], v13[1], v12[0], v12[1]);
        [v9 yValueFromXValue:a2];

        return;
      }
    }
    v10 = (void *)TSD_valueAtPercent__s_TSDBezierPathsCacheArray[v8];
    [v10 yValueFromXValue:a2];
  }
}

@end