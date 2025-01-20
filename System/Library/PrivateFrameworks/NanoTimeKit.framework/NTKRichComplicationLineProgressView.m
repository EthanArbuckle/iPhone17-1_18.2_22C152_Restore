@interface NTKRichComplicationLineProgressView
- (id)initForFamily:(int64_t)a3 device:(id)a4 progressFillStyle:(int64_t)a5;
- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3;
- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3 locations:(id)a4;
- (int64_t)progressFillStyle;
- (void)setProgress:(double)a3;
@end

@implementation NTKRichComplicationLineProgressView

- (id)initForFamily:(int64_t)a3 device:(id)a4 progressFillStyle:(int64_t)a5
{
  id v8 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__NTKRichComplicationLineProgressView_initForFamily_device_progressFillStyle___block_invoke;
  aBlock[3] = &unk_1E62C61B8;
  id v9 = v8;
  id v19 = v9;
  v10 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if ((unint64_t)a5 > 1) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = objc_opt_class();
  }
  v12 = v10[2](v10, v11);
  v13 = v10[2](v10, v11);
  v17.receiver = self;
  v17.super_class = (Class)NTKRichComplicationLineProgressView;
  v14 = [(CDRichComplicationProgressView *)&v17 initForFamily:a3 device:v9 backgroundShapeView:v12 foregroundShapeView:v13];
  v15 = v14;
  if (v14) {
    v14[65] = a5;
  }

  return v15;
}

id __78__NTKRichComplicationLineProgressView_initForFamily_device_progressFillStyle___block_invoke(uint64_t a1, Class a2)
{
  v2 = (void *)[[a2 alloc] initForDevice:*(void *)(a1 + 32) withFilterStyle:0];

  return v2;
}

- (void)setProgress:(double)a3
{
}

- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3
{
  id v4 = a3;
  [(NTKRichComplicationLineProgressView *)self progressFillStyle];
  CDRichComplicationProgressFillStyleIsMetered();
}

- (id)overrideBackgroundGradientColorsForGradientColors:(id)a3 locations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NTKRichComplicationLineProgressView *)self progressFillStyle];
  CDRichComplicationProgressFillStyleIsMetered();
}

- (int64_t)progressFillStyle
{
  return self->_progressFillStyle;
}

@end