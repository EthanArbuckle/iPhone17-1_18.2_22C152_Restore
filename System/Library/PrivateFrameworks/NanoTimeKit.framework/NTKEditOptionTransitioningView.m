@interface NTKEditOptionTransitioningView
- (NTKEditOption)fromEditOption;
- (NTKEditOption)toEditOption;
- (NTKEditOptionTransitioningView)initWithFrame:(CGRect)a3;
- (NTKEditOptionTransitioningViewDelegate)delegate;
- (void)_resetTransitionImageView:(id)a3;
- (void)_updateUnifiedScaleTransform;
- (void)didAddSubview:(id)a3;
- (void)setBreatheFraction:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmingAlpha:(double)a3;
- (void)setFromEditOption:(id)a3;
- (void)setOption:(id)a3;
- (void)setRubberBandingFraction:(double)a3;
- (void)setToEditOption:(id)a3;
- (void)setTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5;
@end

@implementation NTKEditOptionTransitioningView

- (NTKEditOptionTransitioningView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)NTKEditOptionTransitioningView;
  v3 = -[NTKEditOptionTransitioningView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] blackColor];
    [(NTKEditOptionTransitioningView *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKEditOptionTransitioningView *)v3 bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    transitionContainer = v3->_transitionContainer;
    v3->_transitionContainer = (UIView *)v6;

    v8 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v3->_transitionContainer setBackgroundColor:v8];

    [(NTKEditOptionTransitioningView *)v3 addSubview:v3->_transitionContainer];
    v3->_breathScaleModifier = 1.0;
    v3->_rubberBandScaleModifier = 1.0;
    v9 = [MEMORY[0x1E4F19A30] currentDevice];
    [v9 screenCornerRadius];
    double v11 = v10;

    id v12 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(NTKEditOptionTransitioningView *)v3 bounds];
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:");
    toTransitionImageView = v3->_toTransitionImageView;
    v3->_toTransitionImageView = (UIImageView *)v13;

    [(UIImageView *)v3->_toTransitionImageView setHidden:1];
    [(UIView *)v3->_transitionContainer addSubview:v3->_toTransitionImageView];
    NTKApplyViewCornerRadius(v3->_toTransitionImageView, v11);
    id v15 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(NTKEditOptionTransitioningView *)v3 bounds];
    uint64_t v16 = objc_msgSend(v15, "initWithFrame:");
    fromTransitionImageView = v3->_fromTransitionImageView;
    v3->_fromTransitionImageView = (UIImageView *)v16;

    [(UIImageView *)v3->_fromTransitionImageView setHidden:1];
    [(UIView *)v3->_transitionContainer addSubview:v3->_fromTransitionImageView];
    NTKApplyViewCornerRadius(v3->_fromTransitionImageView, v11);
    id v18 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKEditOptionTransitioningView *)v3 bounds];
    uint64_t v19 = objc_msgSend(v18, "initWithFrame:");
    transitionDimmingView = v3->_transitionDimmingView;
    v3->_transitionDimmingView = (UIView *)v19;

    [(UIView *)v3->_transitionDimmingView setAutoresizingMask:18];
    v21 = v3->_transitionDimmingView;
    v22 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v21 setBackgroundColor:v22];

    [(UIView *)v3->_transitionDimmingView setAlpha:0.0];
    [(NTKEditOptionTransitioningView *)v3 addSubview:v3->_transitionDimmingView];
  }
  return v3;
}

- (void)didAddSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKEditOptionTransitioningView;
  [(NTKEditOptionTransitioningView *)&v4 didAddSubview:a3];
  [(NTKEditOptionTransitioningView *)self bringSubviewToFront:self->_transitionDimmingView];
}

- (void)setBreatheFraction:(double)a3
{
  self->_breathScaleModifier = NTKLargeElementScaleForBreathingFraction(a3);

  [(NTKEditOptionTransitioningView *)self _updateUnifiedScaleTransform];
}

- (void)setRubberBandingFraction:(double)a3
{
  self->_rubberBandScaleModifier = NTKScaleForRubberBandingFraction(a3);

  [(NTKEditOptionTransitioningView *)self _updateUnifiedScaleTransform];
}

- (void)_updateUnifiedScaleTransform
{
  transitionContainer = self->_transitionContainer;
  CGAffineTransformMakeScale(&v3, self->_breathScaleModifier * self->_rubberBandScaleModifier, self->_breathScaleModifier * self->_rubberBandScaleModifier);
  [(UIView *)transitionContainer setTransform:&v3];
}

- (void)setDimmingAlpha:(double)a3
{
}

- (void)setOption:(id)a3
{
  toTransitionImageView = self->_toTransitionImageView;
  id v5 = a3;
  [(UIImageView *)toTransitionImageView setHidden:1];
  [(UIImageView *)self->_fromTransitionImageView setHidden:0];
  [(NTKEditOptionTransitioningView *)self setFromEditOption:v5];
}

- (void)setTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 isEqual:v9])
  {
    if ([v9 isEqual:self->_fromEditOption])
    {
      fromTransitionImageView = self->_fromTransitionImageView;
      long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v34 = *MEMORY[0x1E4F1DAB8];
      long long v35 = v11;
      long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(UIImageView *)fromTransitionImageView setTransform:&v34];
      uint64_t v12 = 440;
LABEL_9:
      [*(id *)((char *)&self->super.super.super.isa + v12) setHidden:1];
      goto LABEL_10;
    }
    if ([v9 isEqual:self->_toEditOption])
    {
      toTransitionImageView = self->_toTransitionImageView;
      long long v33 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v34 = *MEMORY[0x1E4F1DAB8];
      long long v35 = v33;
      long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(UIImageView *)toTransitionImageView setTransform:&v34];
      uint64_t v12 = 448;
      goto LABEL_9;
    }
  }
  else
  {
    [(UIImageView *)self->_toTransitionImageView setHidden:0];
    [(UIImageView *)self->_fromTransitionImageView setHidden:0];
    [(NTKEditOptionTransitioningView *)self setToEditOption:v9];
    uint64_t v13 = [(NTKEditOptionTransitioningView *)self delegate];
    int v14 = [v13 shouldFadeIncomingView];

    if (v14)
    {
      v27 = self->_toTransitionImageView;
      CLKCompressFraction();
      uint64_t v15 = -[UIImageView setAlpha:](v27, "setAlpha:");
    }
    v23.f64[0] = 0.0;
    v24.f64[0] = 0.0;
    v25.f64[0] = 1.0;
    double v28 = NTKFindCubicBezierPoint(a3, v23, 0.0, v24, 0.0, v25, 0.0, v15, v16, v17, v18, v19, v20, v21, v22, v26);
    v29 = self->_toTransitionImageView;
    CGAffineTransformMakeScale(&v38, (1.0 - v28) * -0.1 + 1.0, (1.0 - v28) * -0.1 + 1.0);
    -[UIImageView setTransform:](v29, "setTransform:", &v38, 0x3FF0000000000000, 0);
    [(NTKEditOptionTransitioningView *)self setFromEditOption:v8];
    v30 = self->_fromTransitionImageView;
    [(NTKEditOptionTransitioningView *)self bounds];
    CGAffineTransformMakeTranslation(&v37, 0.0, -(a3 * v31));
    [(UIImageView *)v30 setTransform:&v37];
  }
LABEL_10:
}

- (void)setToEditOption:(id)a3
{
  id v8 = (NTKEditOption *)a3;
  if (self->_toEditOption != v8)
  {
    objc_storeStrong((id *)&self->_toEditOption, a3);
    [(NTKEditOptionTransitioningView *)self _resetTransitionImageView:self->_toTransitionImageView];
    toTransitionImageView = self->_toTransitionImageView;
    uint64_t v6 = [(NTKEditOptionTransitioningView *)self delegate];
    v7 = [v6 imageForEditOption:v8];
    [(UIImageView *)toTransitionImageView setImage:v7];
  }
}

- (void)setFromEditOption:(id)a3
{
  id v8 = (NTKEditOption *)a3;
  if (self->_fromEditOption != v8)
  {
    objc_storeStrong((id *)&self->_fromEditOption, a3);
    [(NTKEditOptionTransitioningView *)self _resetTransitionImageView:self->_fromTransitionImageView];
    fromTransitionImageView = self->_fromTransitionImageView;
    uint64_t v6 = [(NTKEditOptionTransitioningView *)self delegate];
    v7 = [v6 imageForEditOption:v8];
    [(UIImageView *)fromTransitionImageView setImage:v7];
  }
}

- (void)_resetTransitionImageView:(id)a3
{
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v6 = *MEMORY[0x1E4F1DAB8];
  long long v7 = v4;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  id v5 = a3;
  [v5 setTransform:&v6];
  [(NTKEditOptionTransitioningView *)self bounds];
  objc_msgSend(v5, "setFrame:");
}

- (NTKEditOptionTransitioningViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKEditOptionTransitioningViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NTKEditOption)toEditOption
{
  return self->_toEditOption;
}

- (NTKEditOption)fromEditOption
{
  return self->_fromEditOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromEditOption, 0);
  objc_storeStrong((id *)&self->_toEditOption, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fromTransitionImageView, 0);
  objc_storeStrong((id *)&self->_toTransitionImageView, 0);
  objc_storeStrong((id *)&self->_transitionDimmingView, 0);

  objc_storeStrong((id *)&self->_transitionContainer, 0);
}

@end