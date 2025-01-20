@interface CAPropertyAnimation(TSDCAAnimationAdditions)
- (double)TSD_animationPercentFromAnimationTime:()TSDCAAnimationAdditions;
- (uint64_t)TSD_containsAnimationForKeyPath:()TSDCAAnimationAdditions;
- (uint64_t)p_adjustedResultWithValue:()TSDCAAnimationAdditions;
- (uint64_t)p_interpolatedValueFrom:()TSDCAAnimationAdditions to:percent:;
- (void)TSD_animationForKeyPath:()TSDCAAnimationAdditions atTime:;
@end

@implementation CAPropertyAnimation(TSDCAAnimationAdditions)

- (uint64_t)p_adjustedResultWithValue:()TSDCAAnimationAdditions
{
  if (!a3) {
    return (uint64_t)a3;
  }
  if ((objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", @"transform.rotation") & 1) != 0
    || (objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", @"transform.rotation.x") & 1) != 0
    || (objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", @"transform.rotation.y") & 1) != 0
    || objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", @"transform.rotation.z"))
  {
    [a3 doubleValue];
    double v6 = fmod(v5 + 3.14159265, 6.28318531) + -3.14159265;
    if (v6 < -3.14159265) {
      double v6 = v6 + 6.28318531;
    }
    v7 = NSNumber;
    return [v7 numberWithDouble:v6];
  }
  if ((objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", @"hidden") & 1) == 0
    && !objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", @"doubleSided"))
  {
    return (uint64_t)a3;
  }
  uint64_t v9 = [a3 charValue];
  v10 = NSNumber;

  return [v10 numberWithChar:v9];
}

- (uint64_t)p_interpolatedValueFrom:()TSDCAAnimationAdditions to:percent:
{
  CFTypeID v8 = CFGetTypeID(cf);
  if (v8 == CGColorGetTypeID())
  {
    uint64_t v9 = (void *)[MEMORY[0x263F7C808] colorWithCGColor:cf];
    v10 = objc_msgSend(v9, "blendedColorWithFraction:ofColor:", objc_msgSend(MEMORY[0x263F7C808], "colorWithCGColor:", a5), a4);
    return [v10 CGColor];
  }
  else
  {
    return [cf mixedObjectWithFraction:a5 ofObject:a4];
  }
}

- (double)TSD_animationPercentFromAnimationTime:()TSDCAAnimationAdditions
{
  [a1 beginTime];
  double v5 = a2 - v4;
  [a1 timeOffset];
  double v7 = v5 - v6;
  [a1 duration];
  return v7 / v8;
}

- (uint64_t)TSD_containsAnimationForKeyPath:()TSDCAAnimationAdditions
{
  double v4 = (void *)[a1 keyPath];

  return [v4 isEqualToString:a3];
}

- (void)TSD_animationForKeyPath:()TSDCAAnimationAdditions atTime:
{
  if (objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", a3)) {
    return a1;
  }
  else {
    return 0;
  }
}

@end