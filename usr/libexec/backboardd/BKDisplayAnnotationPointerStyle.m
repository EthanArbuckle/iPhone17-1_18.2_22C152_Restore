@interface BKDisplayAnnotationPointerStyle
- (void)applyToLayer:(id)a3 forContent:(id)a4;
@end

@implementation BKDisplayAnnotationPointerStyle

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  id v20 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v20;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  uint64_t v10 = objc_opt_class();
  id v11 = v6;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  [v13 shapeSize];
  double v15 = v14;
  double v17 = v16;

  double v18 = v17 * 0.414213562 / 1.41421356;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, 0.0, v17 + 0.0);
  CGPathAddLineToPoint(Mutable, 0, v18 + 0.0, v17 + 0.0 - v18);
  CGPathAddLineToPoint(Mutable, 0, v17 + 0.0 - v18, v17 + 0.0 - v18);
  CGPathAddLineToPoint(Mutable, 0, 0.0, 0.0);
  CGPathCloseSubpath(Mutable);
  [v9 setBounds:0.0, 0.0, v15, v17];
  [v9 setPath:Mutable];
  [v20 bk_setBackgroundColorRed:1.0 green:1.0 blue:1.0 alpha:0.649999976];
  [v20 bk_setForegroundColorRed:0.0 green:0.0 blue:0.0 alpha:0.5];

  CFRelease(Mutable);
}

@end