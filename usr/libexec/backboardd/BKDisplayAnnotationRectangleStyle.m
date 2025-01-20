@interface BKDisplayAnnotationRectangleStyle
- (void)applyToLayer:(id)a3 forContent:(id)a4;
@end

@implementation BKDisplayAnnotationRectangleStyle

- (void)applyToLayer:(id)a3 forContent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  id v19 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      v8 = v19;
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

  Mutable = CGPathCreateMutable();
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v15;
  v21.size.height = v17;
  CGPathAddRect(Mutable, 0, v21);
  [v9 setBounds:0.0, 0.0, v15, v17];
  [v9 setPath:Mutable];

  CFRelease(Mutable);
}

@end