@interface NTKRichComplicationRectangularBaseView
+ (id)viewWithLegacyComplicationType:(unint64_t)a3;
+ (void)updateCustomDataAnimationFromEarlierView:(id)a3 laterView:(id)a4 isForward:(BOOL)a5 animationType:(unint64_t)a6 animationDuration:(double)a7 animationFraction:(float)a8;
- (NTKRichComplicationRectangularBaseView)init;
- (NTKRichComplicationRectangularBaseView)initWithFamily:(int64_t)a3;
- (NTKRichComplicationRectangularBaseViewDelegate)delegate;
- (double)contentMargin;
- (id)_createAndAddColoringLabelWithFontSize:(double)a3 weight:(double)a4 usesTextProviderTintColoring:(BOOL)a5;
- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NTKRichComplicationRectangularBaseView

- (NTKRichComplicationRectangularBaseView)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKRichComplicationRectangularBaseView;
  return [(CDRichComplicationView *)&v3 initWithFamily:11];
}

- (NTKRichComplicationRectangularBaseView)initWithFamily:(int64_t)a3
{
  if (a3 == 11)
  {
    self = [(NTKRichComplicationRectangularBaseView *)self init];
    objc_super v3 = self;
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

+ (id)viewWithLegacyComplicationType:(unint64_t)a3
{
  if (a3)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_alloc_init(NTKRichComplicationRectangularBaseView);
  }
  return v4;
}

- (double)contentMargin
{
}

+ (void)updateCustomDataAnimationFromEarlierView:(id)a3 laterView:(id)a4 isForward:(BOOL)a5 animationType:(unint64_t)a6 animationDuration:(double)a7 animationFraction:(float)a8
{
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  memset(&v31, 0, sizeof(v31));
  if (a6 == 1)
  {
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v31.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v31.c = v16;
    *(_OWORD *)&v31.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    if (v9)
    {
LABEL_5:
      v13 = (CGAffineTransform *)MEMORY[0x1E4F1DAB8];
      long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v30.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v30.c = v14;
      *(_OWORD *)&v30.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransform v29 = v31;
      CGAffineTransform v28 = v31;
      v15 = v12;
      goto LABEL_8;
    }
  }
  else
  {
    if (!a6) {
      CGAffineTransformMakeScale(&v31, 0.9, 0.9);
    }
    if (v9) {
      goto LABEL_5;
    }
  }
  CGAffineTransform v30 = v31;
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v29.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v29.c = v17;
  *(_OWORD *)&v29.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v28.a = *(_OWORD *)&v29.a;
  *(_OWORD *)&v28.c = v17;
  *(_OWORD *)&v28.tx = *(_OWORD *)&v29.tx;
  v13 = &v31;
  v15 = v11;
LABEL_8:
  long long v18 = *(_OWORD *)&v13->c;
  *(_OWORD *)&v27.a = *(_OWORD *)&v13->a;
  *(_OWORD *)&v27.c = v18;
  *(_OWORD *)&v27.tx = *(_OWORD *)&v13->tx;
  id v19 = v15;
  if (a6 == 1) {
    CDTemplicateComplicationShouldPerformFullFade();
  }
  CLKCompressFraction();
  CLKCompressFraction();
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v11, "setAlpha:");
  CGAffineTransform v23 = v30;
  CGAffineTransform v22 = v28;
  CLKInterpolateBetweenTransform();
  v21[0] = v24;
  v21[1] = v25;
  v21[2] = v26;
  [v11 setTransform:v21];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v12, "setAlpha:");
  CGAffineTransform v23 = v29;
  CGAffineTransform v22 = v27;
  CLKInterpolateBetweenTransform();
  v20[0] = v20[3];
  v20[1] = v20[4];
  v20[2] = v20[5];
  [v12 setTransform:v20];
}

- (id)_createAndAddColoringLabelWithFontSize:(double)a3 weight:(double)a4 usesTextProviderTintColoring:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v9 = objc_opt_new();
  [v9 setUsesLegibility:0];
  [v9 setAlpha:1.0];
  v10 = [MEMORY[0x1E4FB1618] whiteColor];
  [v9 setColor:v10];

  [v9 setUsesTextProviderTintColoring:v5];
  id v11 = [MEMORY[0x1E4F19A50] systemFontOfSize:*MEMORY[0x1E4F19680] weight:a3 design:a4];
  id v12 = [v11 CLKFontWithAlternativePunctuation];

  [v9 setFont:v12];
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __117__NTKRichComplicationRectangularBaseView__createAndAddColoringLabelWithFontSize_weight_usesTextProviderTintColoring___block_invoke;
  v16[3] = &unk_1E62C0040;
  objc_copyWeak(&v17, &location);
  [v9 setNowProvider:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __117__NTKRichComplicationRectangularBaseView__createAndAddColoringLabelWithFontSize_weight_usesTextProviderTintColoring___block_invoke_2;
  v14[3] = &unk_1E62C0068;
  objc_copyWeak(&v15, &location);
  [v9 setNeedsResizeHandler:v14];
  [v9 setFilterProvider:self];
  [(NTKRichComplicationRectangularBaseView *)self addSubview:v9];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v9;
}

id __117__NTKRichComplicationRectangularBaseView__createAndAddColoringLabelWithFontSize_weight_usesTextProviderTintColoring___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = (id)MEMORY[0x1E4F19A20];
  }
  uint64_t v3 = [WeakRetained complicationDate];

  return v3;
}

void __117__NTKRichComplicationRectangularBaseView__createAndAddColoringLabelWithFontSize_weight_usesTextProviderTintColoring___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
  v1 = [WeakRetained displayObserver];
  [v1 complicationDisplayNeedsResize:WeakRetained];
}

- (void)_transitToHighlightState:(BOOL)a3 fraction:(double)a4
{
  CLKInterpolateBetweenFloatsClipped();
  CGAffineTransformMakeScale(&v7, v5, v5);
  CGAffineTransform v6 = v7;
  [(NTKRichComplicationRectangularBaseView *)self setTransform:&v6];
}

- (NTKRichComplicationRectangularBaseViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKRichComplicationRectangularBaseViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end