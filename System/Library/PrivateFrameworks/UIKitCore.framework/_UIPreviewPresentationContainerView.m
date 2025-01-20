@interface _UIPreviewPresentationContainerView
- (BOOL)_shouldEnclosedScrollViewFlashIndicators:(id)a3;
- (BOOL)shouldLayoutForCommitPhase;
- (BOOL)shouldRasterizeForTransition;
- (CGRect)_preferredPlatterRectForContainerRect:(CGRect)a3;
- (CGSize)_standardPreferredContentSize;
- (CGSize)preferredContentSize;
- (UIView)contentTransformView;
- (UIView)contentView;
- (UIView)platterShadowView;
- (_UIPreviewPresentationContainerView)initWithFrame:(CGRect)a3;
- (_UIPreviewPresentationEffectView)platterClippingView;
- (_UIPreviewPresentationEffectView)platterView;
- (double)blurRadius;
- (double)cornerRadius;
- (void)initPlatterViewsIfNeeded;
- (void)layoutSubviews;
- (void)setBlurRadius:(double)a3;
- (void)setContentTransformView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setPlatterClippingView:(id)a3;
- (void)setPlatterShadowView:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setShouldLayoutForCommitPhase:(BOOL)a3;
- (void)setShouldRasterizeForTransition:(BOOL)a3;
@end

@implementation _UIPreviewPresentationContainerView

- (_UIPreviewPresentationContainerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPreviewPresentationContainerView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_UIPreviewPresentationContainerView *)v3 initPlatterViewsIfNeeded];
    v5 = v4;
  }

  return v4;
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  contentView = self->_contentView;
  v8 = v5;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    objc_super v7 = [(_UIPreviewPresentationContainerView *)self contentTransformView];
    [v7 addSubview:v8];

    [(UIView *)self setNeedsLayout];
  }
}

- (double)blurRadius
{
  v2 = [(_UIPreviewPresentationContainerView *)self platterView];
  [v2 blurRadius];
  double v4 = v3;

  return v4;
}

- (void)setBlurRadius:(double)a3
{
  id v4 = [(_UIPreviewPresentationContainerView *)self platterView];
  [v4 setBlurRadius:a3];
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (BOOL)shouldRasterizeForTransition
{
  v2 = [(_UIPreviewPresentationContainerView *)self platterView];
  char v3 = [v2 shouldRasterizeForTransition];

  return v3;
}

- (void)setShouldRasterizeForTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIPreviewPresentationContainerView *)self platterView];
  [v4 setShouldRasterizeForTransition:v3];
}

- (void)layoutSubviews
{
  v87.receiver = self;
  v87.super_class = (Class)_UIPreviewPresentationContainerView;
  [(UIView *)&v87 layoutSubviews];
  [(UIView *)self bounds];
  double x = v88.origin.x;
  double y = v88.origin.y;
  double width = v88.size.width;
  double height = v88.size.height;
  CGRectGetWidth(v88);
  v89.origin.double x = x;
  v89.origin.double y = y;
  v89.size.double width = width;
  v89.size.double height = height;
  CGRectGetHeight(v89);
  [(_UIPreviewPresentationContainerView *)self preferredContentSize];
  double v8 = v7;
  double v10 = v9;
  [(_UIPreviewPresentationContainerView *)self _standardPreferredContentSize];
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  BOOL v14 = v8 == *MEMORY[0x1E4F1DB30] && v10 == *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v83 = *MEMORY[0x1E4F1DB28];
  if (v14)
  {
    CGFloat rect = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v82 = v11 / v12;
    v90.origin.double x = x;
    v90.origin.double y = y;
    CGFloat v18 = *MEMORY[0x1E4F1DB28];
    v90.size.double width = width;
    v90.size.double height = height;
    v91.size.double width = CGRectGetWidth(v90);
    v91.origin.double x = v18;
    v91.origin.double y = v13;
    double v80 = v91.size.width;
    v91.size.double height = rect;
    double v81 = CGRectGetWidth(v91) / v82;
    double v17 = v13;
  }
  else
  {
    if (v8 == 0.0) {
      double v15 = width;
    }
    else {
      double v15 = v8;
    }
    if (v10 == 0.0) {
      double v16 = height;
    }
    else {
      double v16 = v10;
    }
    double v80 = v15;
    double v81 = v16;
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  }
  UIRoundToViewScale(self);
  double v20 = v19;
  UIRoundToViewScale(self);
  double v22 = v21;
  -[_UIPreviewPresentationContainerView _preferredPlatterRectForContainerRect:](self, "_preferredPlatterRectForContainerRect:", x, y, width, height);
  CGFloat v23 = v92.origin.x;
  CGFloat v24 = v92.origin.y;
  CGFloat v25 = v92.size.width;
  CGFloat v26 = v92.size.height;
  double MidX = CGRectGetMidX(v92);
  v93.origin.double x = v23;
  v93.origin.double y = v24;
  v93.size.double width = v25;
  v93.size.double height = v26;
  double MidY = CGRectGetMidY(v93);
  if ([(_UIPreviewPresentationContainerView *)self shouldLayoutForCommitPhase])
  {
    [(UIView *)self bounds];
    double v30 = v29;
    double v32 = v31;
    double v20 = v33;
    double v22 = v34;
  }
  else
  {
    double v30 = MidX - v20 * 0.5;
    double v32 = MidY - v22 * 0.5;
  }
  v35 = [(_UIPreviewPresentationContainerView *)self platterView];
  objc_msgSend(v35, "setFrame:", v30, v32, v20, v22);

  v36 = [(_UIPreviewPresentationContainerView *)self platterView];
  [v36 bounds];
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  v45 = [(_UIPreviewPresentationContainerView *)self platterClippingView];
  objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

  double v46 = 0.0;
  if (![(_UIPreviewPresentationContainerView *)self shouldLayoutForCommitPhase])
  {
    [(_UIPreviewPresentationContainerView *)self cornerRadius];
    double v46 = v47;
  }
  v48 = [(_UIPreviewPresentationContainerView *)self platterClippingView];
  [v48 _setContinuousCornerRadius:v46];

  v49 = [(_UIPreviewPresentationContainerView *)self platterView];
  [v49 bounds];
  CGFloat v51 = v50 + -13.0;
  CGFloat v53 = v52 + -36.0;
  CGFloat v55 = v54 + 26.0;
  CGFloat v57 = v56 + 72.0;

  v94.origin.double x = v51;
  v94.origin.double y = v53;
  v94.size.double width = v55;
  v94.size.double height = v57;
  CGRect v95 = CGRectOffset(v94, 0.0, 4.0);
  double v58 = v95.origin.x;
  double v59 = v95.origin.y;
  double v60 = v95.size.width;
  double v61 = v95.size.height;
  v62 = [(_UIPreviewPresentationContainerView *)self platterShadowView];
  objc_msgSend(v62, "setFrame:", v58, v59, v60, v61);

  v63 = [(_UIPreviewPresentationContainerView *)self platterClippingView];
  [v63 bounds];
  double v65 = v64;
  double v67 = v66;
  double v69 = v68;
  double v71 = v70;

  v72 = [(_UIPreviewPresentationContainerView *)self contentTransformView];
  long long v73 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v86[0] = *MEMORY[0x1E4F1DAB8];
  v86[1] = v73;
  v86[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v72 setTransform:v86];

  v74 = [(_UIPreviewPresentationContainerView *)self contentTransformView];
  objc_msgSend(v74, "setFrame:", v65, v67, v69, v71);

  v75 = [(_UIPreviewPresentationContainerView *)self contentView];
  objc_msgSend(v75, "setFrame:", v83, v17, v80, v81);

  v96.origin.double x = v65;
  v96.origin.double y = v67;
  v96.size.double width = v69;
  v96.size.double height = v71;
  double v76 = CGRectGetWidth(v96);
  v97.origin.double x = v83;
  v97.origin.double y = v17;
  v97.size.double width = v80;
  v97.size.double height = v81;
  double v77 = CGRectGetWidth(v97);
  if (![(_UIPreviewPresentationContainerView *)self shouldLayoutForCommitPhase])
  {
    CGAffineTransformMakeScale(&v85, v76 / v77, v76 / v77);
    v78 = [(_UIPreviewPresentationContainerView *)self contentTransformView];
    CGAffineTransform v84 = v85;
    [v78 setTransform:&v84];
  }
}

- (BOOL)_shouldEnclosedScrollViewFlashIndicators:(id)a3
{
  return 0;
}

- (void)initPlatterViewsIfNeeded
{
  BOOL v3 = [(_UIPreviewPresentationContainerView *)self platterView];

  if (!v3)
  {
    id v4 = objc_alloc_init(_UIPreviewPresentationEffectView);
    [(UIView *)self bounds];
    -[UIView setFrame:](v4, "setFrame:");
    [(_UIPreviewPresentationEffectView *)v4 setBlurRadius:8.0];
    [(UIView *)v4 setUserInteractionEnabled:0];
    [(_UIPreviewPresentationContainerView *)self setPlatterView:v4];

    v5 = objc_alloc_init(_UIPreviewPresentationEffectView);
    [(UIView *)v5 setClipsToBounds:1];
    [(UIView *)v5 setUserInteractionEnabled:0];
    [(_UIPreviewPresentationContainerView *)self setPlatterClippingView:v5];

    v6 = [UIImageView alloc];
    double v7 = -[UIImageView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v8 = +[UIImage kitImageNamed:@"_UIPreviewPlatterShadow"];
    [(UIImageView *)v7 setImage:v8];

    [(_UIPreviewPresentationContainerView *)self setPlatterShadowView:v7];
    double v9 = objc_alloc_init(UIView);
    [(UIView *)v9 setAutoresizesSubviews:0];
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v12 = [(UIView *)v9 layer];
    objc_msgSend(v12, "setAnchorPoint:", v10, v11);

    [(_UIPreviewPresentationContainerView *)self setContentTransformView:v9];
    CGFloat v13 = [(_UIPreviewPresentationContainerView *)self platterClippingView];
    BOOL v14 = [(_UIPreviewPresentationContainerView *)self contentTransformView];
    [v13 addSubview:v14];

    double v15 = [(_UIPreviewPresentationContainerView *)self platterView];
    double v16 = [(_UIPreviewPresentationContainerView *)self platterClippingView];
    [v15 addSubview:v16];

    double v17 = [(_UIPreviewPresentationContainerView *)self platterView];
    CGFloat v18 = [(_UIPreviewPresentationContainerView *)self platterShadowView];
    double v19 = [(_UIPreviewPresentationContainerView *)self platterClippingView];
    [v17 insertSubview:v18 belowSubview:v19];

    double v20 = [(_UIPreviewPresentationContainerView *)self platterView];
    [(UIView *)self addSubview:v20];

    [(_UIPreviewPresentationContainerView *)self setCornerRadius:13.0];
  }
}

- (CGRect)_preferredPlatterRectForContainerRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    _UIPreviewInteractionPlatterInsetsForRect(x, y, width, height);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v7 = x + v13;
    double v8 = y + v12;
    double v9 = width - (v14 + v17);
    double v10 = height - (v12 + v16);
  }
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGSize)_standardPreferredContentSize
{
  [(UIView *)self bounds];
  -[_UIPreviewPresentationContainerView _preferredPlatterRectForContainerRect:](self, "_preferredPlatterRectForContainerRect:");
  double v4 = v3;
  double v6 = v5;
  result.double height = v6;
  result.double width = v4;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  self->_preferredContentSize = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)shouldLayoutForCommitPhase
{
  return self->_shouldLayoutForCommitPhase;
}

- (void)setShouldLayoutForCommitPhase:(BOOL)a3
{
  self->_shouldLayoutForCommitPhase = a3;
}

- (_UIPreviewPresentationEffectView)platterClippingView
{
  return self->_platterClippingView;
}

- (void)setPlatterClippingView:(id)a3
{
}

- (UIView)platterShadowView
{
  return self->_platterShadowView;
}

- (void)setPlatterShadowView:(id)a3
{
}

- (UIView)contentTransformView
{
  return self->_contentTransformView;
}

- (void)setContentTransformView:(id)a3
{
}

- (_UIPreviewPresentationEffectView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_contentTransformView, 0);
  objc_storeStrong((id *)&self->_platterShadowView, 0);
  objc_storeStrong((id *)&self->_platterClippingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end