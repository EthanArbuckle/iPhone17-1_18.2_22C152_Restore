@interface _PXStoryScrubberClipView
- (UIView)dimOverlayView;
- (UIView)highlightOverlayView;
- (void)layoutSubviews;
- (void)setDimOverlayView:(id)a3;
- (void)setHighlightOverlayView:(id)a3;
@end

@implementation _PXStoryScrubberClipView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimOverlayView, 0);
  objc_storeStrong((id *)&self->_highlightOverlayView, 0);
}

- (void)setDimOverlayView:(id)a3
{
}

- (void)setHighlightOverlayView:(id)a3
{
}

- (UIView)highlightOverlayView
{
  v17[2] = *MEMORY[0x1E4F143B8];
  highlightOverlayView = self->_highlightOverlayView;
  if (!highlightOverlayView)
  {
    v4 = [PXGradientView alloc];
    v5 = [(PXGFocusEffectView *)self contentView];
    [v5 bounds];
    v6 = -[PXGradientView initWithFrame:](v4, "initWithFrame:");

    v7 = [MEMORY[0x1E4FB1618] whiteColor];
    v8 = [v7 colorWithAlphaComponent:0.2];
    v17[0] = v8;
    v9 = [MEMORY[0x1E4FB1618] whiteColor];
    v10 = [v9 colorWithAlphaComponent:0.0];
    v17[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    [(UIView *)v6 setColors:v11];

    [(UIView *)v6 setLocations:&unk_1F02D43A8];
    -[UIView setStartPoint:](v6, "setStartPoint:", 0.5, 0.0);
    -[UIView setEndPoint:](v6, "setEndPoint:", 0.5, 1.0);
    uint64_t v12 = *MEMORY[0x1E4F3A2E8];
    v13 = [(UIView *)v6 layer];
    [v13 setCompositingFilter:v12];

    v14 = [(PXGFocusEffectView *)self contentView];
    [v14 addSubview:v6];

    v15 = self->_highlightOverlayView;
    self->_highlightOverlayView = v6;

    highlightOverlayView = self->_highlightOverlayView;
  }
  return highlightOverlayView;
}

- (UIView)dimOverlayView
{
  dimOverlayView = self->_dimOverlayView;
  if (!dimOverlayView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v5 = [(PXGFocusEffectView *)self contentView];
    [v5 bounds];
    v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v7 = self->_dimOverlayView;
    self->_dimOverlayView = v6;

    v8 = [MEMORY[0x1E4FB1618] blackColor];
    v9 = [v8 colorWithAlphaComponent:0.4];
    [(UIView *)self->_dimOverlayView setBackgroundColor:v9];

    v10 = [(PXGFocusEffectView *)self contentView];
    [v10 addSubview:self->_dimOverlayView];

    dimOverlayView = self->_dimOverlayView;
  }
  return dimOverlayView;
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)_PXStoryScrubberClipView;
  [(PXGFocusEffectView *)&v41 layoutSubviews];
  v3 = [(PXGFocusableView *)self userData];
  id v4 = [(PXGFocusEffectView *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v3 cornerRadius];
  double v14 = v13;
  int v15 = [v3 isCurrent];
  int v16 = [v3 shouldAdjustContent];
  v17 = [(_PXStoryScrubberClipView *)self highlightOverlayView];
  objc_msgSend(v17, "setFrame:", v6, v8, v10, v12);
  v18 = [v17 layer];
  [v18 setCornerRadius:v14];

  v19 = [(PXGFocusEffectView *)self contentView];
  [v19 bringSubviewToFront:v17];

  v20 = [(_PXStoryScrubberClipView *)self dimOverlayView];
  objc_msgSend(v20, "setFrame:", v6, v8, v10, v12);
  v21 = [v20 layer];
  [v21 setCornerRadius:v14];

  v22 = [(PXGFocusEffectView *)self contentView];
  [v22 bringSubviewToFront:v20];

  v23 = [(PXGFocusEffectView *)self contentView];
  v24 = [v23 layer];

  v25 = [MEMORY[0x1E4FB1618] blackColor];
  id v26 = [v25 colorWithAlphaComponent:0.5];
  objc_msgSend(v24, "setShadowColor:", objc_msgSend(v26, "CGColor"));

  objc_msgSend(v24, "setShadowOffset:", 0.0, 2.0);
  [v24 setShadowRadius:20.0];
  double v27 = 0.0;
  if ((v15 & v16) != 0) {
    *(float *)&double v27 = 1.0;
  }
  [v24 setShadowOpacity:v27];
  LODWORD(v28) = 0.25;
  LODWORD(v29) = 0.75;
  LODWORD(v30) = 1.0;
  v31 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v28 :0.0 :v29 :v30];
  v32 = (void *)MEMORY[0x1E4FB1EB0];
  v33 = +[_PXCustomTimingFunctionAnimationFactory factoryWithTimingFunction:v31];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __42___PXStoryScrubberClipView_layoutSubviews__block_invoke;
  v36[3] = &unk_1E5DBF070;
  char v39 = v15;
  char v40 = v16;
  id v37 = v17;
  id v38 = v20;
  id v34 = v20;
  id v35 = v17;
  [v32 _animateWithDuration:393216 delay:v33 options:v36 factory:0 animations:0.2 completion:0.0];
}

@end