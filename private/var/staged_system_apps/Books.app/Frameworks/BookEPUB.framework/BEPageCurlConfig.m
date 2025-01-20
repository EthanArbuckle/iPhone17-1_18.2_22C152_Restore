@interface BEPageCurlConfig
+ (id)shared;
- (BEPageCurlDelegate)pageCurlDelegate;
- (UIColor)baseColor;
- (double)tapAnimationDuration;
- (id)defaults:(id)a3 colorForStrengthKey:(id)a4 opacityKey:(id)a5;
- (void)apply:(id)a3 forKeyPath:(id)a4 toFilter:(id)a5;
- (void)applyToFilter:(id)a3;
- (void)setBaseColor:(id)a3;
- (void)setPageCurlDelegate:(id)a3;
- (void)setTapAnimationDuration:(double)a3;
@end

@implementation BEPageCurlConfig

- (void)setBaseColor:(id)a3
{
  id v21 = a3;
  objc_storeStrong((id *)&self->_baseColor, a3);
  if (([v21 getRed:&self->_red green:&self->_green blue:&self->_blue alpha:&self->_alpha] & 1) == 0)
  {
    NSLog(@"Cannot use this color.");
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&self->_red = _Q0;
    *(_OWORD *)&self->_blue = _Q0;
  }
  uint64_t v10 = +[NSUserDefaults standardUserDefaults];
  v11 = [(BEPageCurlConfig *)self defaults:v10 colorForStrengthKey:@"kCurlInputBack0Strength" opacityKey:@"kCurlInputBack0Opacity"];
  backColor0 = self->backColor0;
  self->backColor0 = v11;

  v13 = [(BEPageCurlConfig *)self defaults:v10 colorForStrengthKey:@"kCurlInputBack1Strength" opacityKey:@"kCurlInputBack1Opacity"];
  backColor1 = self->backColor1;
  self->backColor1 = v13;

  sub_10100(v15, v16, v17, (int)@"kCurlInputShadowStrength", (int)@"kCurlInputShadowOpacity", v18, v19, v20, v22, v23, v24, v25, v26, v27, v28, v29);
}

+ (id)shared
{
  if (qword_409B08 != -1) {
    dispatch_once(&qword_409B08, &stru_3C0690);
  }
  v2 = (void *)qword_409B00;

  return v2;
}

- (id)defaults:(id)a3 colorForStrengthKey:(id)a4 opacityKey:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [v9 doubleForKey:a4];
  double v11 = v10;
  [v9 doubleForKey:v8];
  double v13 = v12;

  double v14 = v11 * self->_red;
  double v15 = v11 * self->_green;
  double v16 = v11 * self->_blue;
  double v17 = v13 * self->_alpha;

  return +[UIColor colorWithRed:v14 green:v15 blue:v16 alpha:v17];
}

- (void)applyToFilter:(id)a3
{
  backColor0 = self->backColor0;
  id v5 = a3;
  [(BEPageCurlConfig *)self apply:backColor0 forKeyPath:@"inputBackColor0" toFilter:v5];
  [(BEPageCurlConfig *)self apply:self->backColor1 forKeyPath:@"inputBackColor1" toFilter:v5];
  [(BEPageCurlConfig *)self apply:self->shadowColor forKeyPath:@"inputShadowColor" toFilter:v5];
}

- (void)apply:(id)a3 forKeyPath:(id)a4 toFilter:(id)a5
{
  if (a3)
  {
    id v7 = a3;
    id v8 = a5;
    id v9 = a4;
    objc_msgSend(v8, "setValue:forKeyPath:", objc_msgSend(v7, "CGColor"), v9);
  }
}

- (UIColor)baseColor
{
  return self->_baseColor;
}

- (double)tapAnimationDuration
{
  return self->_tapAnimationDuration;
}

- (void)setTapAnimationDuration:(double)a3
{
  self->_tapAnimationDuration = a3;
}

- (BEPageCurlDelegate)pageCurlDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageCurlDelegate);

  return (BEPageCurlDelegate *)WeakRetained;
}

- (void)setPageCurlDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pageCurlDelegate);
  objc_storeStrong((id *)&self->shadowColor, 0);
  objc_storeStrong((id *)&self->backColor1, 0);
  objc_storeStrong((id *)&self->backColor0, 0);

  objc_storeStrong((id *)&self->_baseColor, 0);
}

@end