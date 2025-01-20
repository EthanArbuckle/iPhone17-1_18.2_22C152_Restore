@interface BKDisplayAnnotationCrosshatchedBackgroundStyle
- (void)applyToLayer:(id)a3 forContent:(id)a4;
@end

@implementation BKDisplayAnnotationCrosshatchedBackgroundStyle

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v4 = a3;
  [v4 bk_setBackgroundColorRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  *(_OWORD *)&callbacks.version = unk_1000F6800;
  callbacks.releaseInfo = 0;
  CGAffineTransformMakeRotation(&v10, 1.0);
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = 16.0;
  v13.size.height = 16.0;
  v5 = CGPatternCreate(0, v13, &v10, 16.0, 16.0, kCGPatternTilingConstantSpacing, 1, &callbacks);
  Pattern = CGColorSpaceCreatePattern(0);
  if (Pattern)
  {
    v7 = Pattern;
    CGFloat components = 1.0;
    CGColorRef v8 = CGColorCreateWithPattern(Pattern, v5, &components);
    if (v8)
    {
      CGColorRef v9 = v8;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v4 setFillColor:v9];
      }
      else {
        [v4 setBackgroundColor:v9];
      }
      CFRelease(v9);
    }
    CFRelease(v7);
  }
}

@end