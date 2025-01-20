@interface _UIPreviewPresentationPlatterView
- (BOOL)isDropShadowEnabled;
- (CGSize)contentClippingSize;
- (CGSize)contentSize;
- (UIView)contentShadowView;
- (UIView)contentTransformView;
- (UIView)contentView;
- (_UIPreviewPresentationEffectView)contentClipView;
- (_UIPreviewPresentationEffectView)contentEffectView;
- (_UIPreviewPresentationPlatterView)initWithContentView:(id)a3;
- (double)blurRadius;
- (double)cornerRadius;
- (void)layoutSubviews;
- (void)setBlurRadius:(double)a3;
- (void)setContentClipView:(id)a3;
- (void)setContentClippingSize:(CGSize)a3;
- (void)setContentEffectView:(id)a3;
- (void)setContentShadowView:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentTransformView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDropShadowEnabled:(BOOL)a3;
@end

@implementation _UIPreviewPresentationPlatterView

- (_UIPreviewPresentationPlatterView)initWithContentView:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_UIPreviewPresentationPlatterView;
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[UIView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    [(_UIPreviewPresentationPlatterView *)v9 setContentView:v4];
    [(UIView *)v10 setClipsToBounds:0];
    v11 = objc_alloc_init(_UIPreviewPresentationEffectView);
    [(UIView *)v10 bounds];
    -[UIView setFrame:](v11, "setFrame:");
    [(_UIPreviewPresentationEffectView *)v11 setBlurRadius:0.0];
    [(_UIPreviewPresentationPlatterView *)v10 setContentEffectView:v11];

    v12 = objc_alloc_init(_UIPreviewPresentationEffectView);
    [(UIView *)v12 setClipsToBounds:1];
    [(_UIPreviewPresentationPlatterView *)v10 setContentClipView:v12];

    v13 = objc_alloc_init(UIView);
    [(UIView *)v13 setAutoresizesSubviews:0];
    double v14 = *MEMORY[0x1E4F1DAD8];
    double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    v16 = [(UIView *)v13 layer];
    objc_msgSend(v16, "setAnchorPoint:", v14, v15);

    [(_UIPreviewPresentationPlatterView *)v10 setContentTransformView:v13];
    v17 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v5, v6, v7, v8);
    v18 = +[UIImage kitImageNamed:@"_UIPreviewPlatterShadow"];
    [(UIImageView *)v17 setImage:v18];

    [(_UIPreviewPresentationPlatterView *)v10 setContentShadowView:v17];
    v19 = [(_UIPreviewPresentationPlatterView *)v10 contentTransformView];
    [v19 addSubview:v4];

    v20 = [(_UIPreviewPresentationPlatterView *)v10 contentClipView];
    v21 = [(_UIPreviewPresentationPlatterView *)v10 contentTransformView];
    [v20 addSubview:v21];

    v22 = [(_UIPreviewPresentationPlatterView *)v10 contentEffectView];
    v23 = [(_UIPreviewPresentationPlatterView *)v10 contentClipView];
    [v22 addSubview:v23];

    v24 = [(_UIPreviewPresentationPlatterView *)v10 contentEffectView];
    [(UIView *)v10 addSubview:v24];

    v25 = [(_UIPreviewPresentationPlatterView *)v10 contentShadowView];
    v26 = [(_UIPreviewPresentationPlatterView *)v10 contentEffectView];
    [(UIView *)v10 insertSubview:v25 belowSubview:v26];

    v27 = v10;
  }

  return v10;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_UIPreviewPresentationPlatterView *)self contentSize];
  if (width != v7 || height != v6)
  {
    self->_contentSize.double width = width;
    self->_contentSize.double height = height;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setContentClippingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(_UIPreviewPresentationPlatterView *)self contentClippingSize];
  if (width != v7 || height != v6)
  {
    self->_contentClippingSize.double width = width;
    self->_contentClippingSize.double height = height;
    [(UIView *)self setNeedsLayout];
  }
}

- (double)blurRadius
{
  v2 = [(_UIPreviewPresentationPlatterView *)self contentEffectView];
  [v2 blurRadius];
  double v4 = v3;

  return v4;
}

- (void)setBlurRadius:(double)a3
{
  id v4 = [(_UIPreviewPresentationPlatterView *)self contentEffectView];
  [v4 setBlurRadius:a3];
}

- (void)setCornerRadius:(double)a3
{
  id v4 = [(_UIPreviewPresentationPlatterView *)self contentClipView];
  [v4 setCornerRadius:a3];
}

- (double)cornerRadius
{
  v2 = [(_UIPreviewPresentationPlatterView *)self contentClipView];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setDropShadowEnabled:(BOOL)a3
{
  if ([(_UIPreviewPresentationPlatterView *)self isDropShadowEnabled] != a3)
  {
    self->_dropShadowEnabled = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v64.receiver = self;
  v64.super_class = (Class)_UIPreviewPresentationPlatterView;
  [(UIView *)&v64 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(_UIPreviewPresentationPlatterView *)self contentEffectView];
  double v58 = v6;
  double v59 = v8;
  double v60 = v10;
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(_UIPreviewPresentationPlatterView *)self contentEffectView];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  [(_UIPreviewPresentationPlatterView *)self contentClippingSize];
  double v24 = *MEMORY[0x1E4F1DB30];
  double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v21 == *MEMORY[0x1E4F1DB30] && v22 == v23)
  {
    double v26 = v20;
  }
  else
  {
    double v26 = v22;
    double v16 = round(v16 + v20 * 0.5 - v22 * 0.5);
    double v14 = round(v14 + v18 * 0.5 - v21 * 0.5);
    double v18 = v21;
  }
  v27 = [(_UIPreviewPresentationPlatterView *)self contentClipView];
  objc_msgSend(v27, "setFrame:", v14, v16, v18, v26);

  v28 = [(_UIPreviewPresentationPlatterView *)self contentClipView];
  objc_msgSend(v28, "convertRect:fromView:", self, v4, v58, v59, v60);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __51___UIPreviewPresentationPlatterView_layoutSubviews__block_invoke;
  v63[3] = &unk_1E52D9F70;
  v63[4] = self;
  +[UIView performWithoutAnimation:v63];
  v37 = [(_UIPreviewPresentationPlatterView *)self contentTransformView];
  objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);

  [(_UIPreviewPresentationPlatterView *)self contentSize];
  double v40 = v39;
  if (v39 == v24 && v38 == v23)
  {
    v41 = [(_UIPreviewPresentationPlatterView *)self contentTransformView];
    [v41 bounds];
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    v50 = [(_UIPreviewPresentationPlatterView *)self contentView];
    objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);
  }
  else
  {
    v65.origin.x = v30;
    v65.origin.y = v32;
    v65.size.double width = v34;
    v65.size.double height = v36;
    double Height = CGRectGetHeight(v65);
    v66.origin.x = v30;
    v66.origin.y = v32;
    v66.size.double width = v34;
    v66.size.double height = v36;
    double v52 = Height * (v40 / CGRectGetWidth(v66));
    v53 = [(_UIPreviewPresentationPlatterView *)self contentView];
    objc_msgSend(v53, "setFrame:", 0.0, 0.0, v40, v52);

    v67.origin.x = v30;
    v67.origin.y = v32;
    v67.size.double width = v34;
    v67.size.double height = v36;
    CGFloat Width = CGRectGetWidth(v67);
    CGAffineTransformMakeScale(&v62, Width / v40, Width / v40);
    v41 = [(_UIPreviewPresentationPlatterView *)self contentTransformView];
    CGAffineTransform v61 = v62;
    [v41 setTransform:&v61];
  }

  v55 = [(_UIPreviewPresentationPlatterView *)self contentShadowView];
  v68.origin.x = v4 + -13.0;
  v68.origin.y = v58 + -36.0;
  v68.size.double width = v59 + 26.0;
  v68.size.double height = v60 + 72.0;
  CGRect v69 = CGRectOffset(v68, 0.0, 4.0);
  objc_msgSend(v55, "setFrame:", v69.origin.x, v69.origin.y, v69.size.width, v69.size.height);
  BOOL v56 = [(_UIPreviewPresentationPlatterView *)self isDropShadowEnabled];
  double v57 = 1.0;
  if (!v56) {
    double v57 = 0.0;
  }
  [v55 setAlpha:v57];
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)contentClippingSize
{
  double width = self->_contentClippingSize.width;
  double height = self->_contentClippingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isDropShadowEnabled
{
  return self->_dropShadowEnabled;
}

- (_UIPreviewPresentationEffectView)contentEffectView
{
  return self->_contentEffectView;
}

- (void)setContentEffectView:(id)a3
{
}

- (_UIPreviewPresentationEffectView)contentClipView
{
  return self->_contentClipView;
}

- (void)setContentClipView:(id)a3
{
}

- (UIView)contentTransformView
{
  return self->_contentTransformView;
}

- (void)setContentTransformView:(id)a3
{
}

- (UIView)contentShadowView
{
  return self->_contentShadowView;
}

- (void)setContentShadowView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentShadowView, 0);
  objc_storeStrong((id *)&self->_contentTransformView, 0);
  objc_storeStrong((id *)&self->_contentClipView, 0);
  objc_storeStrong((id *)&self->_contentEffectView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end