@interface NTKCircularAnalogDialView
+ (id)_disabledLayerActions;
- (BOOL)isTickIndexForHour:(unint64_t)a3;
- (NTKCircularAnalogDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4;
- (NTKCircularAnalogDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4 hideHourTicks:(BOOL)a5;
- (NTKCircularAnalogDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4 smallTicksMatchingMinutes:(BOOL)a5;
- (NTKCircularAnalogDialView)initWithFrame:(CGRect)a3 options:(id *)a4 device:(id)a5;
- (double)_tickOpactiyAtIndex:(int64_t)a3 bezelTextWidthInRadius:(double)a4 invisibleTicksAlpha:(double)a5;
- (double)_tickOpactiyAtIndex:(int64_t)a3 bezelTextWidthInRadius:(double)a4 invisibleTicksAlpha:(double)a5 visibleTicksAlpha:(double)a6;
- (id)_instantaneousAnimationForKeyPath:(id)a3 value:(id)a4;
- (void)_toggleRasterization:(BOOL)a3;
- (void)applyColorTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5;
- (void)applyColorTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5;
- (void)cleanupAfterEdit;
- (void)fillDialTransitionWithFraction:(double)a3 bezelTextWidthRadians:(double)a4;
- (void)layoutLayerTicks:(id)a3 rotationAngleInDegree:(double)a4 smallTicks:(BOOL)a5;
- (void)layoutSubviews;
- (void)prepareForEdit;
- (void)setDialBackgroundColor:(id)a3;
- (void)setHideHourTicks:(BOOL)a3;
- (void)setHourTicksOpacity:(double)a3 bezelTextWidthRadians:(double)a4;
- (void)showAllTicksInDial;
- (void)transitInvisibleTicksAlphaWithBezelTextWidthInRadius:(double)a3 invisbleTicksAlpha:(double)a4;
- (void)transitTicksWithInitialBezelTextWidthInRadius:(double)a3 finalBezelTextWidthInRadius:(double)a4 fraction:(double)a5;
@end

@implementation NTKCircularAnalogDialView

- (NTKCircularAnalogDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  _LayoutConstants_22(v9, &v15);
  uint64_t v12 = 0;
  long long v13 = v15;
  long long v14 = v16;
  v10 = -[NTKCircularAnalogDialView initWithFrame:options:device:](self, "initWithFrame:options:device:", &v12, v9, x, y, width, height);

  return v10;
}

- (NTKCircularAnalogDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4 smallTicksMatchingMinutes:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  id v11 = a4;
  _LayoutConstants_22(v11, &v17);
  long long v15 = v17;
  long long v16 = v18;
  BOOL v14 = v5;
  uint64_t v12 = -[NTKCircularAnalogDialView initWithFrame:options:device:](self, "initWithFrame:options:device:", &v14, v11, x, y, width, height);

  return v12;
}

- (NTKCircularAnalogDialView)initWithFrame:(CGRect)a3 forDevice:(id)a4 hideHourTicks:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  id v11 = a4;
  _LayoutConstants_22(v11, &v18);
  long long v16 = v18;
  long long v17 = v19;
  uint64_t v12 = 256;
  if (!v5) {
    uint64_t v12 = 0;
  }
  uint64_t v15 = v12;
  long long v13 = -[NTKCircularAnalogDialView initWithFrame:options:device:](self, "initWithFrame:options:device:", &v15, v11, x, y, width, height);

  return v13;
}

- (NTKCircularAnalogDialView)initWithFrame:(CGRect)a3 options:(id *)a4 device:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a5;
  v52.receiver = self;
  v52.super_class = (Class)NTKCircularAnalogDialView;
  long long v13 = -[NTKCircularAnalogDialView initWithFrame:](&v52, sel_initWithFrame_, x, y, width, height);
  BOOL v14 = v13;
  if (v13)
  {
    p_options = &v13->_options;
    CGFloat v16 = a4->var3.height;
    long long v17 = *(_OWORD *)&a4->var2.height;
    *(_OWORD *)&v13->_options.smallTicksMatchingMinutes = *(_OWORD *)&a4->var0;
    *(_OWORD *)&v13->_options.hourTickSize.double height = v17;
    v13->_options.smallTickSize.double height = v16;
    objc_storeStrong((id *)&v13->_device, a5);
    id v49 = v12;
    long long v18 = [[NTKWhistlerAnalogColorPalette alloc] initWithDevice:v12];
    colorPalette = v14->_colorPalette;
    v14->_colorPalette = v18;

    long long v20 = [MEMORY[0x1E4FB1618] blackColor];
    [(NTKCircularAnalogDialView *)v14 setBackgroundColor:v20];

    v21 = [(NTKCircularAnalogDialView *)v14 layer];
    [v21 bounds];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v30 = v26 * 0.5;
    double v31 = v28 * 0.5;
    v32 = [(id)objc_opt_class() _disabledLayerActions];
    uint64_t v33 = objc_opt_new();
    dialBackgroundLayer = v14->_dialBackgroundLayer;
    v14->_dialBackgroundLayer = (CALayer *)v33;

    -[CALayer setPosition:](v14->_dialBackgroundLayer, "setPosition:", v30, v31);
    -[CALayer setBounds:](v14->_dialBackgroundLayer, "setBounds:", v23, v25, v27, v29);
    [(CALayer *)v14->_dialBackgroundLayer setActions:v32];
    [(CALayer *)v14->_dialBackgroundLayer setCornerRadius:v30];
    [v21 addSublayer:v14->_dialBackgroundLayer];
    uint64_t v35 = objc_opt_new();
    ticksLayer = v14->_ticksLayer;
    v14->_ticksLayer = (CALayer *)v35;

    -[CALayer setPosition:](v14->_ticksLayer, "setPosition:", v30, v31);
    -[CALayer setBounds:](v14->_ticksLayer, "setBounds:", v23, v25, v27, v29);
    [(CALayer *)v14->_ticksLayer setActions:v32];
    [v21 addSublayer:v14->_ticksLayer];
    v50 = [MEMORY[0x1E4F1CA48] array];
    v37 = [MEMORY[0x1E4F1CA48] array];
    v51 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v38 = 0;
    uint64_t v39 = 60;
    if (!p_options->smallTicksMatchingMinutes) {
      uint64_t v39 = 120;
    }
    v14->_numberOfTicks = v39;
    do
    {
      BOOL v40 = [(NTKCircularAnalogDialView *)v14 isTickIndexForHour:v38];
      v41 = objc_opt_new();
      objc_msgSend(v41, "setBounds:", 0.0, 0.0, v14->_options.smallTickSize.width, v14->_options.smallTickSize.height);
      [v41 setCornerRadius:v14->_options.smallTickSize.width * 0.5];
      objc_msgSend(v41, "setPosition:", v30, v14->_options.smallTickSize.height * 0.5);
      [v41 setActions:v32];
      [(CALayer *)v14->_ticksLayer addSublayer:v41];
      [(NSArray *)v37 addObject:v41];
      if (v40)
      {
        [v41 setHidden:!a4->var1];
        [(NSArray *)v51 addObject:v41];
        if (!a4->var1)
        {
          v42 = objc_opt_new();
          objc_msgSend(v42, "setBounds:", 0.0, 0.0, v14->_options.hourTickSize.width, v14->_options.hourTickSize.height);
          [v42 setCornerRadius:v14->_options.hourTickSize.width * 0.5];
          objc_msgSend(v42, "setPosition:", v30, v14->_options.hourTickSize.height * 0.5);
          [v42 setActions:v32];
          [(CALayer *)v14->_ticksLayer addSublayer:v42];
          [(NSArray *)v50 addObject:v42];
          [v42 setHidden:a4->var1];
        }
      }

      ++v38;
    }
    while (v14->_numberOfTicks > v38);
    allHourTicks = v14->_allHourTicks;
    v14->_allHourTicks = v50;
    v44 = v50;

    allSmallTicks = v14->_allSmallTicks;
    v14->_allSmallTicks = v37;
    v46 = v37;

    smallMatchingHourTicks = v14->_smallMatchingHourTicks;
    v14->_smallMatchingHourTicks = v51;

    [(NTKCircularAnalogDialView *)v14 _toggleRasterization:1];
    id v12 = v49;
  }

  return v14;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKCircularAnalogDialView;
  [(NTKCircularAnalogDialView *)&v8 layoutSubviews];
  unint64_t numberOfTicks = self->_numberOfTicks;
  if (numberOfTicks)
  {
    for (unint64_t i = 0; i < numberOfTicks; ++i)
    {
      double v5 = (double)(int)i / (double)numberOfTicks * 360.0;
      v6 = [(NSArray *)self->_allSmallTicks objectAtIndexedSubscript:i];
      [(NTKCircularAnalogDialView *)self layoutLayerTicks:v6 rotationAngleInDegree:1 smallTicks:v5];
      if ([(NTKCircularAnalogDialView *)self isTickIndexForHour:i])
      {
        v7 = [(NSArray *)self->_allHourTicks objectAtIndexedSubscript:i / (self->_numberOfTicks / 0xC)];
        [(NTKCircularAnalogDialView *)self layoutLayerTicks:v7 rotationAngleInDegree:0 smallTicks:v5];
      }
      unint64_t numberOfTicks = self->_numberOfTicks;
    }
  }
}

- (BOOL)isTickIndexForHour:(unint64_t)a3
{
  return a3 % (self->_numberOfTicks / 0xC) == 0;
}

- (void)layoutLayerTicks:(id)a3 rotationAngleInDegree:(double)a4 smallTicks:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v20.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v20.c = v16;
  *(_OWORD *)&v20.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(NTKCircularAnalogDialView *)self bounds];
  double v9 = v8;
  double height = self->_options.hourTickSize.height;
  double v11 = self->_options.smallTickSize.height;
  double tickPadding = self->_tickPadding;
  *(_OWORD *)&v19.a = *(_OWORD *)&v20.a;
  *(_OWORD *)&v19.c = v16;
  *(_OWORD *)&v19.tdouble x = *(_OWORD *)&v20.tx;
  CGAffineTransformTranslate(&v20, &v19, 0.0, tickPadding);
  [v7 size];
  CGFloat v14 = v9 * 0.5 - v13 * 0.5 - self->_tickPadding;
  CGAffineTransform v18 = v20;
  CGAffineTransformTranslate(&v19, &v18, 0.0, v14);
  CGAffineTransform v20 = v19;
  CLKDegreesToRadians();
  CGAffineTransform v18 = v20;
  CGAffineTransformRotate(&v19, &v18, v15);
  CGAffineTransform v20 = v19;
  CGAffineTransform v18 = v19;
  CGAffineTransformTranslate(&v19, &v18, 0.0, -v14);
  CGAffineTransform v20 = v19;
  if (v5)
  {
    CGAffineTransform v18 = v20;
    CGAffineTransformTranslate(&v19, &v18, 0.0, (height - v11) * 0.5);
    CGAffineTransform v20 = v19;
  }
  CGAffineTransform v17 = v20;
  [v7 setAffineTransform:&v17];
}

- (void)setDialBackgroundColor:(id)a3
{
  dialBackgroundLayer = self->_dialBackgroundLayer;
  uint64_t v4 = [a3 CGColor];
  [(CALayer *)dialBackgroundLayer setBackgroundColor:v4];
}

- (void)applyColorTransitionFraction:(double)a3 fromColorPalette:(id)a4 toColorPalette:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 circularDialFillColor];
  uint64_t v33 = [v9 circularDialFillColor];
  v34 = (void *)v10;
  double v11 = NTKInterpolateBetweenColors();
  dialBackgroundLayer = self->_dialBackgroundLayer;
  id v32 = v11;
  -[CALayer setBackgroundColor:](dialBackgroundLayer, "setBackgroundColor:", [v32 CGColor]);
  if ([v8 isMulticolorPalette]) {
    char v13 = 1;
  }
  else {
    char v13 = [v9 isMulticolorPalette];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke;
  aBlock[3] = &unk_1E62C4EF0;
  aBlock[4] = self;
  id v14 = v8;
  id v50 = v14;
  id v15 = v9;
  id v51 = v15;
  double v52 = a3;
  long long v16 = _Block_copy(aBlock);
  double v31 = [v14 circularDialSubtickColor];
  CGAffineTransform v17 = [v15 circularDialSubtickColor];
  CGAffineTransform v18 = NTKInterpolateBetweenColors();
  allSmallTicks = self->_allSmallTicks;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_2;
  v45[3] = &unk_1E62C4F18;
  char v48 = v13;
  id v46 = v18;
  id v47 = v16;
  id v30 = v18;
  id v29 = v16;
  [(NSArray *)allSmallTicks enumerateObjectsUsingBlock:v45];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_3;
  v41[3] = &unk_1E62C4F40;
  id v42 = v14;
  id v43 = v15;
  double v44 = a3;
  id v20 = v15;
  id v21 = v14;
  double v22 = _Block_copy(v41);
  double v23 = [v21 circularDialTickColor];
  double v24 = [v20 circularDialTickColor];
  double v25 = NTKInterpolateBetweenColors();
  allHourTicks = self->_allHourTicks;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_4;
  v37[3] = &unk_1E62C4F18;
  char v40 = v13;
  id v38 = v25;
  id v39 = v22;
  id v27 = v25;
  id v28 = v22;
  [(NSArray *)allHourTicks enumerateObjectsUsingBlock:v37];
  long long v36 = 0u;
  memset(v35, 0, sizeof(v35));
  _LayoutConstants_22(self->_device, v35);
  *(void *)&self->_double tickPadding = v36;
  [(NTKCircularAnalogDialView *)self setNeedsLayout];
}

id __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  unint64_t v4 = *(void *)(*(void *)(a1 + 32) + 416);
  if (v4 >= 0x3D)
  {
    if (v4 != 120) {
      __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_cold_1();
    }
    unint64_t v2 = a2 >> 1;
  }
  BOOL v5 = [*(id *)(a1 + 40) colorForCircularTicksForMinute:v2];
  v6 = [*(id *)(a1 + 48) colorForCircularTicksForMinute:v2];
  id v7 = NTKInterpolateBetweenColors();

  return v7;
}

void __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
    id v7 = a2;
    v6(v5, a3);
    id v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));
  }
  else
  {
    id v8 = *(id *)(a1 + 32);
    id v9 = a2;
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));
  }
}

id __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = [*(id *)(a1 + 32) colorForCircularTicksForHour:a2];
  uint64_t v5 = [*(id *)(a1 + 40) colorForCircularTicksForHour:a2];
  v6 = NTKInterpolateBetweenColors();

  return v6;
}

void __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
    id v7 = a2;
    v6(v5, a3);
    id v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v9, "CGColor"));
  }
  else
  {
    id v8 = *(id *)(a1 + 32);
    id v9 = a2;
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));
  }
}

- (void)applyColorTransitionFraction:(double)a3 fromFaceColorPalette:(id)a4 toFaceColorPalette:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette dialFillColorForColorPalette:v7];
  uint64_t v33 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette dialFillColorForColorPalette:v8];
  v34 = (void *)v9;
  uint64_t v10 = NTKInterpolateBetweenColors();
  dialBackgroundLayer = self->_dialBackgroundLayer;
  id v32 = v10;
  -[CALayer setBackgroundColor:](dialBackgroundLayer, "setBackgroundColor:", [v32 CGColor]);
  uint64_t v12 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette minuteTicksColorForColorPalette:v7];
  id v30 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette minuteTicksColorForColorPalette:v8];
  double v31 = (void *)v12;
  char v13 = NTKInterpolateBetweenColors();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v14 = self->_allSmallTicks;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v48;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v48 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * v18++), "setBackgroundColor:", objc_msgSend(v13, "CGColor"));
      }
      while (v16 != v18);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v16);
  }

  uint64_t v35 = v7;
  uint64_t v19 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette hourTicksColorForColorPalette:v7];
  id v20 = [(NTKWhistlerAnalogColorPalette *)self->_colorPalette hourTicksColorForColorPalette:v8];
  id v29 = (void *)v19;
  id v21 = NTKInterpolateBetweenColors();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  double v22 = self->_allHourTicks;
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v44;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * v26++), "setBackgroundColor:", objc_msgSend(v21, "CGColor"));
      }
      while (v24 != v26);
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v24);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  _LayoutConstants_22(self->_device, &v40);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__NTKCircularAnalogDialView_applyColorTransitionFraction_fromFaceColorPalette_toFaceColorPalette___block_invoke;
  aBlock[3] = &__block_descriptor_80_e29_d16__0__NTKFaceColorPalette_8l;
  long long v37 = v40;
  long long v38 = v41;
  long long v39 = v42;
  id v27 = (void (**)(void *, void *))_Block_copy(aBlock);
  v27[2](v27, v35);
  v27[2](v27, v8);
  CLKInterpolateBetweenFloatsClipped();
  self->_double tickPadding = v28;
  [(NTKCircularAnalogDialView *)self setNeedsLayout];
}

double __98__NTKCircularAnalogDialView_applyColorTransitionFraction_fromFaceColorPalette_toFaceColorPalette___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 isWhiteColor];
  uint64_t v4 = 64;
  if (v3) {
    uint64_t v4 = 72;
  }
  return *(double *)(a1 + v4);
}

- (id)_instantaneousAnimationForKeyPath:(id)a3 value:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F39B48];
  id v5 = a4;
  v6 = [v4 animationWithKeyPath:@"instanceDelay"];
  [v6 setFromValue:v5];
  [v6 setToValue:v5];

  [v6 setBeginTime:0.00000011920929];
  [v6 setDuration:0.00001];
  [v6 setFillMode:*MEMORY[0x1E4F39FA8]];
  return v6;
}

- (void)prepareForEdit
{
}

- (void)cleanupAfterEdit
{
}

- (void)setHideHourTicks:(BOOL)a3
{
  self->_options.hideHourTicks = a3;
  allHourTicks = self->_allHourTicks;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__NTKCircularAnalogDialView_setHideHourTicks___block_invoke;
  v9[3] = &__block_descriptor_33_e24_v32__0__CALayer_8Q16_B24l;
  BOOL v10 = a3;
  [(NSArray *)allHourTicks enumerateObjectsUsingBlock:v9];
  smallMatchingHourTicks = self->_smallMatchingHourTicks;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__NTKCircularAnalogDialView_setHideHourTicks___block_invoke_2;
  v7[3] = &__block_descriptor_33_e24_v32__0__CALayer_8Q16_B24l;
  BOOL v8 = a3;
  [(NSArray *)smallMatchingHourTicks enumerateObjectsUsingBlock:v7];
}

uint64_t __46__NTKCircularAnalogDialView_setHideHourTicks___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHidden:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __46__NTKCircularAnalogDialView_setHideHourTicks___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setHidden:*(unsigned char *)(a1 + 32) == 0];
}

- (void)setHourTicksOpacity:(double)a3 bezelTextWidthRadians:(double)a4
{
  allHourTicks = self->_allHourTicks;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__NTKCircularAnalogDialView_setHourTicksOpacity_bezelTextWidthRadians___block_invoke;
  v10[3] = &unk_1E62C4FA8;
  v10[4] = self;
  *(double *)&v10[5] = a4;
  *(double *)&v10[6] = a3;
  [(NSArray *)allHourTicks enumerateObjectsUsingBlock:v10];
  smallMatchingHourTicks = self->_smallMatchingHourTicks;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__NTKCircularAnalogDialView_setHourTicksOpacity_bezelTextWidthRadians___block_invoke_2;
  v9[3] = &unk_1E62C4FA8;
  void v9[4] = self;
  *(double *)&v9[5] = a4;
  *(double *)&v9[6] = a3;
  [(NSArray *)smallMatchingHourTicks enumerateObjectsUsingBlock:v9];
}

void __71__NTKCircularAnalogDialView_setHourTicksOpacity_bezelTextWidthRadians___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  [v6 setHidden:0];
  [*(id *)(a1 + 32) _tickOpactiyAtIndex:*(void *)(*(void *)(a1 + 32) + 416) / 0xCuLL * a3 bezelTextWidthInRadius:*(double *)(a1 + 40) invisibleTicksAlpha:0.0 visibleTicksAlpha:*(double *)(a1 + 48)];
  *(float *)&double v5 = v5;
  [v6 setOpacity:v5];
}

void __71__NTKCircularAnalogDialView_setHourTicksOpacity_bezelTextWidthRadians___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  [v6 setHidden:0];
  [*(id *)(a1 + 32) _tickOpactiyAtIndex:*(void *)(*(void *)(a1 + 32) + 416) / 0xCuLL * a3 bezelTextWidthInRadius:*(double *)(a1 + 40) invisibleTicksAlpha:0.0 visibleTicksAlpha:1.0 - *(double *)(a1 + 48)];
  *(float *)&double v5 = v5;
  [v6 setOpacity:v5];
}

- (void)fillDialTransitionWithFraction:(double)a3 bezelTextWidthRadians:(double)a4
{
  unint64_t v6 = (unint64_t)((double)[(NSArray *)self->_allSmallTicks count] * a3);
  NSUInteger v7 = [(NSArray *)self->_allSmallTicks count];
  NSUInteger v8 = [(NSArray *)self->_allHourTicks count];
  allSmallTicks = self->_allSmallTicks;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__NTKCircularAnalogDialView_fillDialTransitionWithFraction_bezelTextWidthRadians___block_invoke;
  v10[3] = &unk_1E62C4FD0;
  v10[4] = self;
  *(double *)&v10[5] = a4;
  v10[6] = v6;
  void v10[7] = v7 / v8;
  [(NSArray *)allSmallTicks enumerateObjectsUsingBlock:v10];
}

void __82__NTKCircularAnalogDialView_fillDialTransitionWithFraction_bezelTextWidthRadians___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v8 = a2;
  [*(id *)(a1 + 32) _tickOpactiyAtIndex:a3 bezelTextWidthInRadius:*(double *)(a1 + 40) invisibleTicksAlpha:0.0];
  *(float *)&double v5 = v5;
  if (*(void *)(a1 + 48) <= a3) {
    *(float *)&double v5 = 0.0;
  }
  [v8 setOpacity:v5];
  if (!(a3 % *(void *)(a1 + 56)))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v6 + 481))
    {
      NSUInteger v7 = objc_msgSend(*(id *)(v6 + 448), "objectAtIndexedSubscript:");
      [v8 opacity];
      objc_msgSend(v7, "setOpacity:");
    }
  }
}

- (void)showAllTicksInDial
{
}

- (void)transitTicksWithInitialBezelTextWidthInRadius:(double)a3 finalBezelTextWidthInRadius:(double)a4 fraction:(double)a5
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__NTKCircularAnalogDialView_transitTicksWithInitialBezelTextWidthInRadius_finalBezelTextWidthInRadius_fraction___block_invoke;
  aBlock[3] = &unk_1E62C4FD0;
  void aBlock[4] = self;
  *(double *)&void aBlock[5] = a3;
  *(double *)&aBlock[6] = a4;
  *(double *)&aBlock[7] = a5;
  uint64_t v6 = _Block_copy(aBlock);
  NSUInteger v7 = v6;
  if (!self->_options.hideHourTicks)
  {
    allHourTicks = self->_allHourTicks;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __112__NTKCircularAnalogDialView_transitTicksWithInitialBezelTextWidthInRadius_finalBezelTextWidthInRadius_fraction___block_invoke_2;
    uint64_t v12 = &unk_1E62C4FF8;
    char v13 = self;
    id v14 = v6;
    [(NSArray *)allHourTicks enumerateObjectsUsingBlock:&v9];
  }
  -[NSArray enumerateObjectsUsingBlock:](self->_allSmallTicks, "enumerateObjectsUsingBlock:", v7, v9, v10, v11, v12);
}

void __112__NTKCircularAnalogDialView_transitTicksWithInitialBezelTextWidthInRadius_finalBezelTextWidthInRadius_fraction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  double v6 = *(double *)(a1 + 40);
  id v8 = a2;
  [v5 _tickOpactiyAtIndex:a3 bezelTextWidthInRadius:v6 invisibleTicksAlpha:0.0];
  [*(id *)(a1 + 32) _tickOpactiyAtIndex:a3 bezelTextWidthInRadius:*(double *)(a1 + 48) invisibleTicksAlpha:0.0];
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v7 = v7;
  [v8 setOpacity:v7];
}

uint64_t __112__NTKCircularAnalogDialView_transitTicksWithInitialBezelTextWidthInRadius_finalBezelTextWidthInRadius_fraction___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)transitInvisibleTicksAlphaWithBezelTextWidthInRadius:(double)a3 invisbleTicksAlpha:(double)a4
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__NTKCircularAnalogDialView_transitInvisibleTicksAlphaWithBezelTextWidthInRadius_invisbleTicksAlpha___block_invoke;
  aBlock[3] = &unk_1E62C4FA8;
  void aBlock[4] = self;
  *(double *)&void aBlock[5] = a3;
  *(double *)&aBlock[6] = a4;
  double v5 = _Block_copy(aBlock);
  allHourTicks = self->_allHourTicks;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __101__NTKCircularAnalogDialView_transitInvisibleTicksAlphaWithBezelTextWidthInRadius_invisbleTicksAlpha___block_invoke_2;
  v8[3] = &unk_1E62C4FF8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(NSArray *)allHourTicks enumerateObjectsUsingBlock:v8];
  [(NSArray *)self->_allSmallTicks enumerateObjectsUsingBlock:v7];
}

void __101__NTKCircularAnalogDialView_transitInvisibleTicksAlphaWithBezelTextWidthInRadius_invisbleTicksAlpha___block_invoke(double *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (void *)*((void *)a1 + 4);
  double v5 = a1[5];
  double v6 = a1[6];
  id v8 = a2;
  [v4 _tickOpactiyAtIndex:a3 bezelTextWidthInRadius:v5 invisibleTicksAlpha:v6];
  *(float *)&double v7 = v7;
  [v8 setOpacity:v7];
}

uint64_t __101__NTKCircularAnalogDialView_transitInvisibleTicksAlphaWithBezelTextWidthInRadius_invisbleTicksAlpha___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)_disabledLayerActions
{
  if (_disabledLayerActions_onceToken_2 != -1) {
    dispatch_once(&_disabledLayerActions_onceToken_2, &__block_literal_global_89);
  }
  unint64_t v2 = (void *)_disabledLayerActions__dictionary_2;
  return v2;
}

void __50__NTKCircularAnalogDialView__disabledLayerActions__block_invoke()
{
  v4[9] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA98] null];
  v3[0] = @"instanceTransform";
  v3[1] = @"contentsMultiplyColor";
  v4[0] = v0;
  v4[1] = v0;
  v3[2] = @"transform";
  v3[3] = @"hidden";
  v4[2] = v0;
  v4[3] = v0;
  v3[4] = @"position";
  v3[5] = @"opacity";
  v4[4] = v0;
  v4[5] = v0;
  v3[6] = @"instanceCount";
  v3[7] = @"instanceDelay";
  v4[6] = v0;
  v4[7] = v0;
  v3[8] = @"backgroundColor";
  v4[8] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:9];
  unint64_t v2 = (void *)_disabledLayerActions__dictionary_2;
  _disabledLayerActions__dictionary_2 = v1;
}

- (double)_tickOpactiyAtIndex:(int64_t)a3 bezelTextWidthInRadius:(double)a4 invisibleTicksAlpha:(double)a5
{
  [(NTKCircularAnalogDialView *)self _tickOpactiyAtIndex:a3 bezelTextWidthInRadius:a4 invisibleTicksAlpha:a5 visibleTicksAlpha:1.0];
  return result;
}

- (double)_tickOpactiyAtIndex:(int64_t)a3 bezelTextWidthInRadius:(double)a4 invisibleTicksAlpha:(double)a5 visibleTicksAlpha:(double)a6
{
  double v8 = a4 * 0.5;
  CLKDegreesToRadians();
  if (v9 >= v8) {
    return a6;
  }
  else {
    return a5;
  }
}

- (void)_toggleRasterization:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(NTKCircularAnalogDialView *)self layer];
  id v6 = v5;
  if (v3)
  {
    [v5 setShouldRasterize:1];
    [(CLKDevice *)self->_device screenScale];
    objc_msgSend(v6, "setRasterizationScale:");
  }
  else
  {
    [v5 setShouldRasterize:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_smallMatchingHourTicks, 0);
  objc_storeStrong((id *)&self->_allHourTicks, 0);
  objc_storeStrong((id *)&self->_allSmallTicks, 0);
  objc_storeStrong((id *)&self->_ticksLayer, 0);
  objc_storeStrong((id *)&self->_dialBackgroundLayer, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __90__NTKCircularAnalogDialView_applyColorTransitionFraction_fromColorPalette_toColorPalette___block_invoke_cold_1()
{
  __assert_rtn("-[NTKCircularAnalogDialView applyColorTransitionFraction:fromColorPalette:toColorPalette:]_block_invoke", "NTKCircularAnalogDialView.m", 226, "self->_numberOfTicks == 120");
}

@end