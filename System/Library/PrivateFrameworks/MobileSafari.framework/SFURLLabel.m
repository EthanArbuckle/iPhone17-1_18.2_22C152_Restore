@interface SFURLLabel
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isAnimatingTextSize;
- (BOOL)needsMasking;
- (CGRect)_unclippedContentRect;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)urlSize;
- (NSAttributedString)attributedText;
- (NSString)text;
- (SFURLLabel)init;
- (SFURLLabel)initWithFadeOutDistance:(double)a3;
- (UIColor)textColor;
- (UIFont)font;
- (UIView)URLContainerClipView;
- (double)baselineOffsetFromBottom;
- (double)labelCapHeightInsetFromTop;
- (double)lastLineBaselineFrameOriginY;
- (id)accessibilityLabel;
- (int64_t)fadeOutEdge;
- (int64_t)textAlignmentEdge;
- (void)_preferredContentSizeCategoryDidChange;
- (void)_setNeedsUpdateSize;
- (void)_updateMask;
- (void)_updateSize;
- (void)_updateSizeIfNeeded;
- (void)beginTextSizeAnimation;
- (void)endTextSizeAnimation;
- (void)layoutSubviews;
- (void)setAccessibilityIgnoresInvertColors:(BOOL)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setFadeOutEdge:(int64_t)a3;
- (void)setFont:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignmentEdge:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setURLContainerClipView:(id)a3;
@end

@implementation SFURLLabel

- (BOOL)accessibilityIgnoresInvertColors
{
  return [(UILabel *)self->_label accessibilityIgnoresInvertColors];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SFURLLabel *)self _updateSizeIfNeeded];
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v7 = self->_urlSize.width;
    double v8 = self->_urlSize.height;
  }
  else
  {
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width, height);
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)_updateMask
{
  if ([(SFURLLabel *)self needsMasking]
    || [(SFURLLabel *)self isAnimatingTextSize])
  {
    fadeOut = self->_fadeOut;
  }
  else
  {
    fadeOut = 0;
  }

  [(SFURLLabel *)self setMaskView:fadeOut];
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)SFURLLabel;
  [(SFURLLabel *)&v36 layoutSubviews];
  [(SFURLLabel *)self _updateSizeIfNeeded];
  [(SFURLLabel *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  p_label = &self->_label;
  label = self->_label;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v35[0] = *MEMORY[0x1E4F1DAB8];
  v35[1] = v13;
  v35[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UILabel *)label setTransform:v35];
  if (self->_textAlignmentEdge)
  {
    v37.origin.x = v4;
    v37.origin.y = v6;
    v37.size.double width = v8;
    v37.size.double height = v10;
    double v14 = CGRectGetMaxX(v37) - self->_urlSize.width;
  }
  else
  {
    double v14 = 0.0;
  }
  v38.origin.x = v4;
  v38.origin.y = v6;
  v38.size.double width = v8;
  v38.size.double height = v10;
  CGRectGetHeight(v38);
  [(UILabel *)*p_label setFrame:_SFRoundRectToPixels(v14)];
  p_textSizeTransitionContext = &self->_textSizeTransitionContext;
  if (self->_textSizeTransitionContext.label)
  {
    v16 = [(UILabel *)*p_label textColor];
    [(UILabel *)p_textSizeTransitionContext->label setTextColor:v16];

    [(UILabel *)*p_label center];
    -[UILabel setCenter:](p_textSizeTransitionContext->label, "setCenter:");
    [(UILabel *)*p_label frame];
    double Width = CGRectGetWidth(v39);
    CGFloat v18 = Width / CGRectGetWidth(self->_textSizeTransitionContext.previousLabelFrame);
    [(UILabel *)*p_label frame];
    double Height = CGRectGetHeight(v40);
    double v20 = Height / CGRectGetHeight(self->_textSizeTransitionContext.previousLabelFrame);
    CGAffineTransformMakeScale(&v34, v18, v20);
    v21 = p_textSizeTransitionContext->label;
    CGAffineTransform v33 = v34;
    [(UILabel *)v21 setTransform:&v33];
    BOOL v22 = _SFEqualWithEpsilon(v18, 1.0, 0.0001) && _SFEqualWithEpsilon(v20, 1.0, 0.0001);
    [(UILabel *)*p_label setAlpha:(double)!v22];
    double v23 = (double)v22;
  }
  else
  {
    double v23 = 1.0;
    p_textSizeTransitionContext = ($2A756C8CE9B9339971B8C228F234A8CD *)&self->_label;
  }
  [(UILabel *)p_textSizeTransitionContext->label setAlpha:v23];
  [(SFURLLabel *)self _unclippedContentRect];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  if (![(SFURLLabel *)self needsMasking])
  {
    double fadeOutDistance = self->_fadeOutDistance;
    double v29 = v29 + fadeOutDistance;
    if (self->_textAlignmentEdge != 1) {
      double fadeOutDistance = 0.0;
    }
    double v25 = v25 - fadeOutDistance;
  }
  -[UIImageView setFrame:](self->_fadeOut, "setFrame:", v25, v27, v29, v31);
  [(SFURLLabel *)self _updateMask];
}

- (BOOL)needsMasking
{
  double width = self->_urlSize.width;
  [(SFURLLabel *)self _unclippedContentRect];
  return width > CGRectGetWidth(v4) + 0.001;
}

- (CGRect)_unclippedContentRect
{
  [(SFURLLabel *)self bounds];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_URLContainerClipView);
  v12 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained bounds];
    -[SFURLLabel convertRect:fromView:](self, "convertRect:fromView:", v12);
    v24.origin.CGFloat x = v13;
    v24.origin.CGFloat y = v14;
    v24.size.CGFloat width = v15;
    v24.size.CGFloat height = v16;
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRect v22 = CGRectIntersection(v21, v24);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
  }

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)_updateSizeIfNeeded
{
  if (self->_needsUpdateSize) {
    [(SFURLLabel *)self _updateSize];
  }
  self->_needsUpdateSize = 0;
}

- (BOOL)isAnimatingTextSize
{
  return self->_textSizeTransitionContext.transitionCount != 0;
}

- (void)setTextAlignmentEdge:(int64_t)a3
{
  if (self->_textAlignmentEdge != a3)
  {
    self->_textAlignmentEdge = a3;
    [(SFURLLabel *)self setNeedsLayout];
  }
}

- (void)setFadeOutEdge:(int64_t)a3
{
  if (self->_fadeOutEdge != a3)
  {
    self->_fadeOutEdge = a3;
    SFFadeOutImage(a3 != 0, self->_fadeOutDistance);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UIImageView *)self->_fadeOut setImage:v4];
  }
}

- (void)setTextColor:(id)a3
{
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
}

- (SFURLLabel)initWithFadeOutDistance:(double)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)SFURLLabel;
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CGFloat v8 = -[SFURLLabel initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v5, v6, v7);
  double v9 = v8;
  if (v8)
  {
    v8->_double fadeOutDistance = a3;
    CGFloat v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v9->_label;
    v9->_label = v10;

    v12 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v9->_label setBackgroundColor:v12];

    [(UILabel *)v9->_label setTextAlignment:0];
    [(UILabel *)v9->_label setContentMode:9];
    [(UILabel *)v9->_label setLineBreakMode:2];
    CGFloat v13 = [(SFURLLabel *)v9 contentView];
    [v13 addSubview:v9->_label];
    [v13 setClipsToBounds:0];
    CGFloat v14 = -[SFURLLabelFadeOutImageView initWithFrame:]([SFURLLabelFadeOutImageView alloc], "initWithFrame:", v4, v5, v6, v7);
    fadeOut = v9->_fadeOut;
    v9->_fadeOut = &v14->super;

    CGFloat v16 = SFFadeOutImage(0, v9->_fadeOutDistance);
    [(UIImageView *)v9->_fadeOut setImage:v16];

    v22[0] = objc_opt_class();
    double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    id v18 = (id)[(SFURLLabel *)v9 registerForTraitChanges:v17 withTarget:v9 action:sel__preferredContentSizeCategoryDidChange];

    double v19 = v9;
  }

  return v9;
}

- (void)setAttributedText:(id)a3
{
  id v6 = a3;
  double v4 = [(UILabel *)self->_label attributedText];
  char v5 = [v6 isEqualToAttributedString:v4];

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_label setAttributedText:v6];
    [(SFURLLabel *)self _updateSize];
  }
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  char v5 = [(UILabel *)self->_label font];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    [(UILabel *)self->_label setFont:v4];
    [(SFURLLabel *)self _updateSize];
    if (self->_textSizeTransitionContext.transitionCount)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __22__SFURLLabel_setFont___block_invoke;
      v7[3] = &unk_1E54E9858;
      v7[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
    }
  }
}

- (void)_updateSize
{
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v4 = v3;
  double width = self->_urlSize.width;
  double height = self->_urlSize.height;
  self->_urlSize.double width = v7;
  if (_SFEqualWithEpsilon(v3, 0.0, 0.001)) {
    double v4 = self->_urlSize.height;
  }
  else {
    self->_urlSize.double height = v4;
  }
  if (width != self->_urlSize.width || height != v4)
  {
    [(SFURLLabel *)self invalidateIntrinsicContentSize];
    if (!self->_needsUpdateSize)
    {
      [(SFURLLabel *)self setNeedsLayout];
    }
  }
}

- (NSString)text
{
  return [(UILabel *)self->_label text];
}

- (void)setText:(id)a3
{
  id v11 = a3;
  double v4 = [(UILabel *)self->_label text];
  char v5 = [v11 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_label setText:v11];
    p_textSizeTransitionContext = &self->_textSizeTransitionContext;
    if (self->_textSizeTransitionContext.transitionCount)
    {
      [(UILabel *)p_textSizeTransitionContext->label setText:v11];
      [(UILabel *)p_textSizeTransitionContext->label sizeToFit];
      [(UILabel *)p_textSizeTransitionContext->label bounds];
      self->_textSizeTransitionContext.previousLabelFrame.origin.CGFloat x = v7;
      self->_textSizeTransitionContext.previousLabelFrame.origin.CGFloat y = v8;
      self->_textSizeTransitionContext.previousLabelFrame.size.double width = v9;
      self->_textSizeTransitionContext.previousLabelFrame.size.double height = v10;
    }
    [(SFURLLabel *)self _updateSize];
  }
}

- (SFURLLabel)init
{
  return [(SFURLLabel *)self initWithFadeOutDistance:13.0];
}

- (void)beginTextSizeAnimation
{
  p_textSizeTransitionContext = &self->_textSizeTransitionContext;
  if (self->_textSizeTransitionContext.label)
  {
    ++self->_textSizeTransitionContext.transitionCount;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(UILabel *)self->_label bounds];
    char v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:");
    char v6 = [(UILabel *)self->_label font];
    [(UILabel *)v5 setFont:v6];

    CGFloat v7 = [(UILabel *)self->_label textColor];
    [(UILabel *)v5 setTextColor:v7];

    CGFloat v8 = [(UILabel *)self->_label text];
    [(UILabel *)v5 setText:v8];

    [(UILabel *)v5 setTextAlignment:[(UILabel *)self->_label textAlignment]];
    [(UILabel *)v5 setLineBreakMode:[(UILabel *)self->_label lineBreakMode]];
    [(UILabel *)v5 setNumberOfLines:[(UILabel *)self->_label numberOfLines]];
    [(UILabel *)v5 setAdjustsFontSizeToFitWidth:[(UILabel *)self->_label adjustsFontSizeToFitWidth]];
    label = p_textSizeTransitionContext->label;
    p_textSizeTransitionContext->label = v5;
    CGFloat v10 = v5;

    [(UILabel *)self->_label bounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    p_textSizeTransitionContext->previousLabelFrame.origin.CGFloat x = v12;
    p_textSizeTransitionContext->previousLabelFrame.origin.CGFloat y = v14;
    p_textSizeTransitionContext->previousLabelFrame.size.double width = v16;
    p_textSizeTransitionContext->previousLabelFrame.size.double height = v18;
    double v19 = p_textSizeTransitionContext->label;
    ++p_textSizeTransitionContext->transitionCount;
    if (!v19) {
      return;
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __36__SFURLLabel_beginTextSizeAnimation__block_invoke;
  v20[3] = &unk_1E54E9858;
  v20[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v20];
}

uint64_t __36__SFURLLabel_beginTextSizeAnimation__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateMask];
  [*(id *)(*(void *)(a1 + 32) + 544) center];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 568), "setCenter:");
  v2 = [*(id *)(a1 + 32) contentView];
  [v2 addSubview:*(void *)(*(void *)(a1 + 32) + 568)];

  double v3 = *(void **)(*(void *)(a1 + 32) + 544);

  return [v3 setAlpha:0.0];
}

- (void)endTextSizeAnimation
{
  p_textSizeTransitionContext = &self->_textSizeTransitionContext;
  int64_t v3 = self->_textSizeTransitionContext.transitionCount - 1;
  self->_textSizeTransitionContext.transitionCount = v3;
  if (!v3)
  {
    [(SFURLLabel *)self _updateMask];
    [(UILabel *)p_textSizeTransitionContext->label removeFromSuperview];
    label = p_textSizeTransitionContext->label;
    p_textSizeTransitionContext->label = 0;

    char v6 = self->_label;
    [(UILabel *)v6 setAlpha:1.0];
  }
}

- (UIFont)font
{
  return [(UILabel *)self->_label font];
}

uint64_t __22__SFURLLabel_setFont___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 544), "setBounds:", 0.0, 0.0, *(double *)(*(void *)(a1 + 32) + 640), *(double *)(*(void *)(a1 + 32) + 648));
  double Width = CGRectGetWidth(*(CGRect *)(*(void *)(a1 + 32) + 584));
  [*(id *)(*(void *)(a1 + 32) + 544) bounds];
  CGFloat v3 = Width / CGRectGetWidth(v10);
  double Height = CGRectGetHeight(*(CGRect *)(*(void *)(a1 + 32) + 584));
  [*(id *)(*(void *)(a1 + 32) + 544) bounds];
  CGFloat v5 = CGRectGetHeight(v11);
  CGAffineTransformMakeScale(&v9, v3, Height / v5);
  char v6 = *(void **)(*(void *)(a1 + 32) + 544);
  CGAffineTransform v8 = v9;
  return [v6 setTransform:&v8];
}

- (UIColor)textColor
{
  return [(UILabel *)self->_label textColor];
}

- (NSAttributedString)attributedText
{
  return [(UILabel *)self->_label attributedText];
}

- (void)setAccessibilityIgnoresInvertColors:(BOOL)a3
{
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return [(UILabel *)self->_label adjustsFontForContentSizeCategory];
}

- (double)baselineOffsetFromBottom
{
  [(UILabel *)self->_label _baselineOffsetFromBottom];
  return result;
}

- (double)lastLineBaselineFrameOriginY
{
  [(SFURLLabel *)self layoutIfNeeded];
  label = self->_label;

  [(UILabel *)label _lastLineBaselineFrameOriginY];
  return result;
}

- (double)labelCapHeightInsetFromTop
{
  [(UILabel *)self->_label _firstLineCapFrameOriginY];
  return result;
}

- (id)accessibilityLabel
{
  return (id)[(UILabel *)self->_label accessibilityLabel];
}

- (void)_setNeedsUpdateSize
{
  self->_needsUpdateSize = 1;
  [(SFURLLabel *)self setNeedsLayout];
}

- (CGSize)intrinsicContentSize
{
  [(SFURLLabel *)self _updateSizeIfNeeded];
  double width = self->_urlSize.width;
  double height = self->_urlSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_preferredContentSizeCategoryDidChange
{
  if ([(SFURLLabel *)self adjustsFontForContentSizeCategory])
  {
    [(SFURLLabel *)self _setNeedsUpdateSize];
  }
}

- (CGSize)urlSize
{
  double width = self->_urlSize.width;
  double height = self->_urlSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)textAlignmentEdge
{
  return self->_textAlignmentEdge;
}

- (int64_t)fadeOutEdge
{
  return self->_fadeOutEdge;
}

- (UIView)URLContainerClipView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_URLContainerClipView);

  return (UIView *)WeakRetained;
}

- (void)setURLContainerClipView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_URLContainerClipView);

  objc_storeStrong((id *)&self->_fadeOut, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end