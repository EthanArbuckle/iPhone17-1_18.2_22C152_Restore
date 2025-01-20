@interface VTUIColorLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (VTUIColorLayer)init;
- (id)actionForKey:(id)a3;
- (void)display;
@end

@implementation VTUIColorLayer

- (VTUIColorLayer)init
{
  v10.receiver = self;
  v10.super_class = (Class)VTUIColorLayer;
  v2 = [(VTUIColorLayer *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] colorWithRed:0.96875 green:0.25390625 blue:0.36328125 alpha:1.0];
    redColor = v2->_redColor;
    v2->_redColor = (UIColor *)v3;

    uint64_t v5 = [MEMORY[0x263F825C8] colorWithRed:0.15625 green:0.52734375 blue:0.9921875 alpha:1.0];
    blueColor = v2->_blueColor;
    v2->_blueColor = (UIColor *)v5;

    uint64_t v7 = [MEMORY[0x263F825C8] labelColor];
    backgroundColor = v2->_backgroundColor;
    v2->_backgroundColor = (UIColor *)v7;
  }
  return v2;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"phase"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___VTUIColorLayer;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_needsDisplayForKey_, v4);
  }

  return v5;
}

- (void)display
{
  [(VTUIColorLayer *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(VTUIColorLayer *)self bounds];
  v44.width = v11;
  v44.height = v12;
  double v13 = 0.0;
  UIGraphicsBeginImageContextWithOptions(v44, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGFloat v41 = v4;
  CGFloat v42 = v10;
  v45.origin.x = v4;
  v45.origin.y = v6;
  CGFloat v37 = v8;
  v45.size.width = v8;
  v45.size.height = v10;
  CGContextClearRect(CurrentContext, v45);
  v15 = [(VTUIColorLayer *)self presentationLayer];
  [v15 phase];
  float v17 = v16;

  float v18 = (float)((float)(v17 + -0.57) / 0.4) * 12.0;
  if (v18 > -10.0)
  {
    double v13 = 1.0;
    if (v18 < 10.0)
    {
      float v19 = 1.0 / (exp((float)-v18) + 1.0);
      double v13 = v19;
    }
  }
  double v40 = v13;
  float v20 = (float)((float)(v17 + -0.4) / 0.8) * 12.0;
  float v21 = 0.0;
  float v22 = 0.0;
  if (v20 > -10.0)
  {
    float v22 = 1.0;
    if (v20 < 10.0) {
      float v22 = 1.0 / (exp((float)-v20) + 1.0);
    }
  }
  float v23 = (float)((float)(v17 + -0.6) / 0.3) * 12.0;
  if (v23 > -10.0)
  {
    float v21 = 1.0;
    if (v23 < 10.0) {
      float v21 = 1.0 / (exp((float)-v23) + 1.0);
    }
  }
  float v24 = (float)((float)(v17 + -0.35) / 0.6) * 12.0;
  float v25 = 0.0;
  float v26 = 0.0;
  if (v24 > -10.0)
  {
    float v26 = 1.0;
    if (v24 < 10.0) {
      float v26 = 1.0 / (exp((float)-v24) + 1.0);
    }
  }
  float v27 = (float)((float)(v17 + -0.3) / 0.4) * 12.0;
  if (v27 > -10.0)
  {
    float v25 = 1.0;
    if (v27 < 10.0) {
      float v25 = 1.0 / (exp((float)-v27) + 1.0);
    }
  }
  v28 = objc_msgSend(MEMORY[0x263F82DA0], "currentTraitCollection", *(void *)&v37);
  uint64_t v29 = [v28 userInterfaceStyle];

  float v30 = v38;
  float v31 = v25 * v30;
  float v32 = v26 * v30;
  float v33 = v22 * v30;
  CGContextSetFillColorWithColor(CurrentContext, [(UIColor *)self->_redColor CGColor]);
  v46.size.width = v31;
  v46.origin.x = v41;
  v46.origin.y = v6;
  v46.size.height = v42;
  CGContextFillRect(CurrentContext, v46);
  CGContextSetFillColorWithColor(CurrentContext, [(UIColor *)self->_blueColor CGColor]);
  v47.size.width = v32;
  v47.origin.x = v41;
  v47.origin.y = v6;
  v47.size.height = v42;
  CGContextFillRect(CurrentContext, v47);
  id v39 = [MEMORY[0x263F825C8] colorWithRed:(float)((float)(1.0 - v21) * 0.37891) green:(float)((float)(1.0 - v21) * 0.98828) blue:(float)((float)(1.0 - v21) * 0.67578) alpha:1.0];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v39 CGColor]);
  v48.size.width = v33;
  v48.origin.x = v41;
  v48.origin.y = v6;
  v48.size.height = v42;
  CGContextFillRect(CurrentContext, v48);
  double v34 = 0.0;
  if (v29 != 1) {
    double v34 = v40;
  }
  id v35 = [(UIColor *)self->_backgroundColor colorWithAlphaComponent:v34];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v35 CGColor]);
  [(VTUIColorLayer *)self bounds];
  CGContextFillRect(CurrentContext, v49);
  UIGraphicsGetImageFromCurrentImageContext();
  id v36 = objc_claimAutoreleasedReturnValue();
  -[VTUIColorLayer setContents:](self, "setContents:", [v36 CGImage]);

  UIGraphicsEndImageContext();
}

- (id)actionForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"phase"])
  {
    double v5 = [MEMORY[0x263F15760] animationWithKeyPath:v4];

    CGFloat v6 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
    [v5 setTimingFunction:v6];

    double v7 = NSNumber;
    [(VTUIColorLayer *)self phase];
    CGFloat v8 = objc_msgSend(v7, "numberWithFloat:");
    [v5 setFromValue:v8];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VTUIColorLayer;
    double v5 = [(VTUIColorLayer *)&v10 actionForKey:v4];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_blueColor, 0);
  objc_storeStrong((id *)&self->_redColor, 0);
}

@end