@interface CAShapeLayer(RecorderAdditions)
- (uint64_t)ic_setFillColor:()RecorderAdditions animated:;
- (uint64_t)ic_setPath:()RecorderAdditions animated:;
- (uint64_t)ic_setPath:()RecorderAdditions fromPath:animated:;
- (uint64_t)ic_setStrokeColor:()RecorderAdditions animated:;
- (void)ic_setOpacity:()RecorderAdditions animated:;
@end

@implementation CAShapeLayer(RecorderAdditions)

- (uint64_t)ic_setPath:()RecorderAdditions animated:
{
  uint64_t result = CGPathEqualToPath((CGPathRef)[a1 path], a3);
  if ((result & 1) == 0)
  {
    if (a4)
    {
      uint64_t v8 = *MEMORY[0x263F15EC0];
      return objc_msgSend(a1, "ic_animateProperty:toValue:timing:", @"path", a3, v8);
    }
    else
    {
      return [a1 setPath:a3];
    }
  }
  return result;
}

- (uint64_t)ic_setPath:()RecorderAdditions fromPath:animated:
{
  uint64_t result = CGPathEqualToPath((CGPathRef)[a1 path], a3);
  if ((result & 1) == 0)
  {
    if (a5)
    {
      uint64_t v10 = *MEMORY[0x263F15EC0];
      return objc_msgSend(a1, "ic_animateProperty:toValue:fromValue:timing:", @"path", a3, a4, v10);
    }
    else
    {
      return [a1 setPath:a3];
    }
  }
  return result;
}

- (uint64_t)ic_setFillColor:()RecorderAdditions animated:
{
  uint64_t result = CGColorEqualToColor((CGColorRef)[a1 fillColor], a3);
  if ((result & 1) == 0)
  {
    if (a4)
    {
      uint64_t v8 = *MEMORY[0x263F15EC8];
      return objc_msgSend(a1, "ic_animateProperty:toValue:timing:", @"fillColor", a3, v8);
    }
    else
    {
      return [a1 setFillColor:a3];
    }
  }
  return result;
}

- (uint64_t)ic_setStrokeColor:()RecorderAdditions animated:
{
  uint64_t result = CGColorEqualToColor((CGColorRef)[a1 strokeColor], a3);
  if ((result & 1) == 0)
  {
    if (a4)
    {
      uint64_t v8 = *MEMORY[0x263F15EC8];
      return objc_msgSend(a1, "ic_animateProperty:toValue:timing:", @"strokeColor", a3, v8);
    }
    else
    {
      return [a1 setStrokeColor:a3];
    }
  }
  return result;
}

- (void)ic_setOpacity:()RecorderAdditions animated:
{
  [a1 opacity];
  if (*(float *)&v7 != a2)
  {
    if (a4)
    {
      *(float *)&double v7 = a2;
      id v8 = [NSNumber numberWithFloat:v7];
      objc_msgSend(a1, "ic_animateProperty:toValue:timing:", @"opacity", v8, *MEMORY[0x263F15EC8]);
    }
    else
    {
      *(float *)&double v7 = a2;
      [a1 setOpacity:v7];
    }
  }
}

@end