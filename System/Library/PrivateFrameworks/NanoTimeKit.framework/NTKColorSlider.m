@interface NTKColorSlider
+ (CGRect)frameForTrackFrame:(CGRect)a3;
- (BOOL)_valueIsInsideMidpoint:(float)a3;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (CGRect)trackRectForBounds:(CGRect)a3;
- (NSArray)colors;
- (NTKColorSlider)initWithFrame:(CGRect)a3;
- (NTKColorSliderDelegate)delegate;
- (double)_colorGradientStep;
- (id)createThumbView;
- (id)currentMaximumTrackImage;
- (id)currentMinimumTrackImage;
- (void)_setValue:(float)a3 animated:(BOOL)a4;
- (void)_updateThumbColor;
- (void)layoutSubviews;
- (void)setColors:(id)a3;
- (void)setDelegate:(id)a3;
- (void)valueDidChange:(id)a3 forEvent:(id)a4;
@end

@implementation NTKColorSlider

- (NTKColorSlider)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)NTKColorSlider;
  v3 = -[NTKColorSlider initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NTKColorSlider *)v3 setMinimumValue:0.0];
    LODWORD(v5) = 1.0;
    [(NTKColorSlider *)v4 setMaximumValue:v5];
    LODWORD(v6) = 0.5;
    [(NTKColorSlider *)v4 setValue:v6];
    v4->_layoutDirection = CLKLayoutIsRTL();
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB20E8]) initWithStyle:2];
    [(NTKColorSlider *)v4 _setEdgeFeedbackGenerator:v7];

    v8 = [(NTKColorSlider *)v4 _edgeFeedbackGenerator];
    [v8 setAxis:1];

    [(NTKColorSlider *)v4 maximumValue];
    float v10 = v9;
    [(NTKColorSlider *)v4 minimumValue];
    double v12 = (float)(v10 - v11);
    v13 = [(NTKColorSlider *)v4 _edgeFeedbackGenerator];
    [v13 setDistance:v12];

    v14 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4FB1C18]);
    selectionFeedbackGenerator = v4->_selectionFeedbackGenerator;
    v4->_selectionFeedbackGenerator = v14;

    [(UISelectionFeedbackGenerator *)v4->_selectionFeedbackGenerator _setOutputMode:5];
    [(NTKColorSlider *)v4 addTarget:v4 action:sel_valueDidChange_forEvent_ forControlEvents:4096];
    uint64_t v16 = [MEMORY[0x1E4F39BD0] layer];
    trackLayer = v4->_trackLayer;
    v4->_trackLayer = (CAGradientLayer *)v16;

    [(CAGradientLayer *)v4->_trackLayer setCornerCurve:*MEMORY[0x1E4F39EA8]];
    -[CAGradientLayer setStartPoint:](v4->_trackLayer, "setStartPoint:", 0.0, 0.5);
    -[CAGradientLayer setEndPoint:](v4->_trackLayer, "setEndPoint:", 1.0, 0.5);
    if (v4->_layoutDirection == 1)
    {
      CATransform3DMakeScale(&v26, -1.0, 1.0, 1.0);
    }
    else
    {
      long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      *(_OWORD *)&v26.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      *(_OWORD *)&v26.m33 = v18;
      long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      *(_OWORD *)&v26.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      *(_OWORD *)&v26.m43 = v19;
      long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)&v26.m11 = *MEMORY[0x1E4F39B10];
      *(_OWORD *)&v26.m13 = v20;
      long long v21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      *(_OWORD *)&v26.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      *(_OWORD *)&v26.m23 = v21;
    }
    v22 = v4->_trackLayer;
    CATransform3D v25 = v26;
    [(CAGradientLayer *)v22 setTransform:&v25];
    v23 = [(NTKColorSlider *)v4 layer];
    [v23 insertSublayer:v4->_trackLayer atIndex:0];

    [(NTKColorSlider *)v4 setClipsToBounds:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NTKColorSlider;
  [(NTKColorSlider *)&v14 layoutSubviews];
  [(NTKColorSlider *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIImageView *)self->_thumbView bounds];
  -[NTKColorSliderThumbView setFrame:](self->_thumbContent, "setFrame:");
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.double width = v8;
  v15.size.double height = v10;
  CGRect v16 = CGRectInset(v15, *MEMORY[0x1E4F1DB30], 9.0);
  double width = v16.size.width;
  double height = v16.size.height;
  -[CAGradientLayer setFrame:](self->_trackLayer, "setFrame:", v16.origin.x, v16.origin.y);
  if (width >= height) {
    double v13 = height;
  }
  else {
    double v13 = width;
  }
  [(CAGradientLayer *)self->_trackLayer setCornerRadius:v13 * 0.5];
}

- (void)setColors:(id)a3
{
  p_colors = &self->_colors;
  objc_storeStrong((id *)&self->_colors, a3);
  id v6 = a3;
  double v7 = objc_opt_new();
  CGFloat v8 = objc_opt_new();
  [(NTKColorSlider *)self _colorGradientStep];
  double v9 = *p_colors;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __28__NTKColorSlider_setColors___block_invoke;
  v13[3] = &unk_1E62C8960;
  id v14 = v7;
  id v15 = v8;
  uint64_t v16 = v10;
  id v11 = v8;
  id v12 = v7;
  [(NSArray *)v9 enumerateObjectsUsingBlock:v13];
  [MEMORY[0x1E4F39CF8] begin];
  [(CAGradientLayer *)self->_trackLayer setColors:v12];
  [(CAGradientLayer *)self->_trackLayer setLocations:v11];
  [(NTKColorSlider *)self _updateThumbColor];
  [MEMORY[0x1E4F39CF8] commit];
}

void __28__NTKColorSlider_setColors___block_invoke(uint64_t a1, id a2, unint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "CGColor"));
  double v5 = *(void **)(a1 + 40);
  id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 48) * (double)a3];
  [v5 addObject:v6];
}

+ (CGRect)frameForTrackFrame:(CGRect)a3
{
  return CGRectInset(a3, 0.0, -9.0);
}

- (void)_updateThumbColor
{
  if (![(NSArray *)self->_colors count]) {
    return;
  }
  [(NTKColorSlider *)self value];
  if (v3 == 0.0)
  {
    colors = self->_colors;
    uint64_t v5 = 0;
  }
  else
  {
    [(NTKColorSlider *)self value];
    if (v6 != 1.0)
    {
      [(NTKColorSlider *)self _colorGradientStep];
      double v10 = v9;
      [(NTKColorSlider *)self value];
      double v12 = v11 / v10;
      double v13 = [(NSArray *)self->_colors objectAtIndexedSubscript:(uint64_t)v12];
      id v14 = [(NSArray *)self->_colors objectAtIndexedSubscript:(uint64_t)v12 + 1];
      NTKInterpolateBetweenColors();
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v8 = (uint64_t)v16;
      goto LABEL_8;
    }
    double v7 = self->_colors;
    uint64_t v5 = [(NSArray *)v7 count] - 1;
    colors = v7;
  }
  uint64_t v8 = [(NSArray *)colors objectAtIndexedSubscript:v5];
LABEL_8:
  id v15 = (id)v8;
  [(NTKColorSliderThumbView *)self->_thumbContent setColor:v8];
}

- (double)_colorGradientStep
{
  NSUInteger v3 = [(NSArray *)self->_colors count];
  double result = 1.0;
  if (v3 >= 2) {
    return 1.0 / (double)([(NSArray *)self->_colors count] - 1);
  }
  return result;
}

- (id)createThumbView
{
  thumbView = self->_thumbView;
  if (!thumbView)
  {
    CGFloat v4 = (UIImageView *)objc_opt_new();
    uint64_t v5 = self->_thumbView;
    self->_thumbView = v4;

    float v6 = (NTKColorSliderThumbView *)objc_opt_new();
    thumbContent = self->_thumbContent;
    self->_thumbContent = v6;

    [(UIImageView *)self->_thumbView addSubview:self->_thumbContent];
    [(NTKColorSlider *)self _updateThumbColor];
    thumbView = self->_thumbView;
  }
  return thumbView;
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)NTKColorSlider;
  -[NTKColorSlider trackRectForBounds:](&v15, sel_trackRectForBounds_);
  double v8 = v7;
  double v10 = v9;
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double v11 = CGRectGetWidth(v16) + 18.0;
  double v12 = -9.0;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  -[NTKColorSliderThumbView sizeThatFits:](self->_thumbContent, "sizeThatFits:", a3.size.width, a3.size.height);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGRectGetMinX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGRectGetWidth(v18);
  v19.origin.CGFloat x = 0.0;
  v19.origin.CGFloat y = 0.0;
  v19.size.CGFloat width = v10;
  v19.size.CGFloat height = v12;
  CGRectGetWidth(v19);
  UIRectCenteredYInRectScale();
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)currentMinimumTrackImage
{
  return 0;
}

- (id)currentMaximumTrackImage
{
  return 0;
}

- (void)_setValue:(float)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKColorSlider;
  -[NTKColorSlider setValue:animated:](&v5, sel_setValue_animated_, a4);
  [(NTKColorSlider *)self _updateThumbColor];
}

- (BOOL)_valueIsInsideMidpoint:(float)a3
{
  [(NTKColorSlider *)self maximumValue];
  float v6 = v5;
  [(NTKColorSlider *)self minimumValue];
  float v8 = a3 + (float)((float)(v6 - v7) * -0.5);
  if (v8 < 0.0) {
    float v8 = -v8;
  }
  return v8 + -0.01 < 0.0;
}

- (void)valueDidChange:(id)a3 forEvent:(id)a4
{
  id v5 = a4;
  [(NTKColorSlider *)self value];
  float v7 = v6;
  if (-[NTKColorSlider _valueIsInsideMidpoint:](self, "_valueIsInsideMidpoint:"))
  {
    if (!self->_shouldTriggerMidpointFeedback) {
      goto LABEL_6;
    }
    [(UISelectionFeedbackGenerator *)self->_selectionFeedbackGenerator selectionChanged];
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  self->_shouldTriggerMidpointFeedback = v8;
LABEL_6:
  double v9 = v7;
  [(NTKColorSlider *)self _updateThumbColor];
  CGFloat v10 = [v5 allTouches];

  id v28 = [v10 anyObject];

  switch([v28 phase])
  {
    case 0:
      [(UISelectionFeedbackGenerator *)self->_selectionFeedbackGenerator prepare];
      double v11 = [(NTKColorSlider *)self _edgeFeedbackGenerator];
      [v11 prepare];

      CGFloat v12 = [(NTKColorSlider *)self _edgeFeedbackGenerator];
      [v12 userInteractionStarted];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained colorSlider:self valueChanged:0 phase:v7];

      goto LABEL_8;
    case 1:
LABEL_8:
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      double v15 = v14;
      double v16 = self;
      double v17 = v7;
      uint64_t v18 = 1;
      goto LABEL_11;
    case 3:
      CGRect v19 = [(NTKColorSlider *)self _edgeFeedbackGenerator];
      [v19 userInteractionEnded];

      id v20 = objc_loadWeakRetained((id *)&self->_delegate);
      [v20 colorSlider:self valueChanged:2 phase:v7];

      *(float *)&double v21 = v7;
      [(NTKColorSlider *)self setValue:0 animated:v21];
      break;
    case 4:
      v22 = [(NTKColorSlider *)self _edgeFeedbackGenerator];
      [v22 userInteractionCancelled];

      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      double v15 = v14;
      double v16 = self;
      double v17 = v7;
      uint64_t v18 = 3;
LABEL_11:
      [v14 colorSlider:v16 valueChanged:v18 phase:v17];

      break;
    default:
      break;
  }
  v23 = [(NTKColorSlider *)self _edgeFeedbackGenerator];
  v24 = [(NTKColorSlider *)self _edgeFeedbackGenerator];
  [v24 distance];
  double v26 = v25;
  [(NTKColorSlider *)self minimumValue];
  [v23 positionUpdated:v26 * (v9 - v27)];
}

- (NTKColorSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKColorSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)colors
{
  return self->_colors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colors, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectionFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_trackLayer, 0);
  objc_storeStrong((id *)&self->_thumbContent, 0);
  objc_storeStrong((id *)&self->_thumbView, 0);
}

@end