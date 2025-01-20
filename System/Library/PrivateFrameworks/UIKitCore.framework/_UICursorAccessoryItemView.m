@interface _UICursorAccessoryItemView
+ (id)_makeImageView;
+ (id)_makeLabelView;
- ($90CBC7AD7F202ACD7E5E12C06C780520)content;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)collapsed;
- (BOOL)isActive;
- (BOOL)isHighlighted;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_UICursorAccessoryItemView)initWithFrame:(CGRect)a3;
- (double)horizontalPadding;
- (unint64_t)roundedEdges;
- (unint64_t)style;
- (void)_recomputeColors;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setCollapsed:(BOOL)a3;
- (void)setContent:(id *)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setRoundedEdges:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation _UICursorAccessoryItemView

+ (id)_makeLabelView
{
  v2 = [UILabel alloc];
  v3 = -[UILabel initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  +[_UICursorAccessoryView baseFontSize];
  v4 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
  [(UILabel *)v3 setFont:v4];

  [(UILabel *)v3 setTextAlignment:1];
  return v3;
}

+ (id)_makeImageView
{
  v2 = [[UIImageView alloc] initWithImage:0];
  [(UIImageView *)v2 setContentMode:1];
  +[_UICursorAccessoryView baseFontSize];
  v3 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 6);
  [(UIImageView *)v2 setPreferredSymbolConfiguration:v3];

  return v2;
}

- (_UICursorAccessoryItemView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_UICursorAccessoryItemView;
  v3 = -[UIControl initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_roundedEdges = 10;
    v5 = [(UIView *)v3 layer];
    [v5 setAllowsGroupBlending:0];

    v6 = [(UIView *)v4 layer];
    [v6 setAllowsGroupOpacity:0];

    v7 = [_UIShapeView alloc];
    uint64_t v8 = -[UIView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (_UIShapeView *)v8;

    [(UIView *)v4->_backgroundView setUserInteractionEnabled:0];
    [(UIView *)v4 insertSubview:v4->_backgroundView atIndex:0];
    v10 = +[UITraitCollection systemTraitsAffectingColorAppearance];
    id v11 = [(UIView *)v4 registerForTraitChanges:v10 withAction:sel__recomputeColors];

    [(_UICursorAccessoryItemView *)v4 _recomputeColors];
    [(UIView *)v4 _setDisableDictationTouchCancellation:1];
  }
  return v4;
}

- (BOOL)isActive
{
  return self->_style == 1;
}

- (double)horizontalPadding
{
  double result = 10.0;
  if (self->_content.type == 3) {
    return 3.0;
  }
  return result;
}

- (void)_recomputeColors
{
  if (os_variant_has_internal_diagnostics())
  {
    if (!self)
    {
      v25 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v25, OS_LOG_TYPE_FAULT, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
      }
    }
  }
  else if (!self)
  {
    v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_recomputeColors___s_category) + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "Attempted to begin using the effective theme of a nil view.", buf, 2u);
    }
  }
  v3 = +[UITraitCollection _currentTraitCollectionIfExists]();
  v4 = [(UIView *)self traitCollection];
  +[UITraitCollection setCurrentTraitCollection:v4];

  v5 = (void *)_UISetCurrentFallbackEnvironment(self);
  v6 = [(UIView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 != 6)
  {
    uint64_t v8 = +[UIColor labelColor];
    v9 = +[UIColor clearColor];
    unint64_t style = self->_style;
    if (style == 1)
    {
      v15 = [(UIView *)self tintColor];
      +[_UICursorAccessoryView grayscaleLuminance:v15];
      double v17 = v16;

      if (v17 <= 0.75)
      {
        uint64_t v11 = +[UIColor whiteColor];
        v18 = (id *)MEMORY[0x1E4F3A2E8];
        double v13 = 0.95;
      }
      else
      {
        uint64_t v11 = +[UIColor blackColor];
        v18 = (id *)MEMORY[0x1E4F3A2E0];
        double v13 = 0.7;
      }

      id v12 = *v18;
      if (!self->_highlighted) {
        goto LABEL_17;
      }
      uint64_t v19 = +[UIColor colorWithWhite:1.0 alpha:0.1];
      v14 = v9;
    }
    else
    {
      if (style == 2)
      {
        uint64_t v11 = +[UIColor secondaryLabelColor];
        id v12 = 0;
        double v13 = 1.0;
        v14 = v8;
LABEL_16:

LABEL_17:
        uint64_t v8 = (void *)v11;
LABEL_18:
        id v20 = v9;
        uint64_t v21 = [v20 CGColor];
        v22 = [(_UIShapeView *)self->_backgroundView shapeLayer];
        [v22 setFillColor:v21];

        [(UIView *)self->_imageView setTintColor:v8];
        [(UIView *)self->_imageView setAlpha:v13];
        v23 = [(UIView *)self->_imageView layer];
        [v23 setCompositingFilter:v12];

        [(UILabel *)self->_labelView setTextColor:v8];
        [(UIView *)self->_labelView setAlpha:v13];
        v24 = [(UIView *)self->_labelView layer];
        [v24 setCompositingFilter:v12];

        goto LABEL_19;
      }
      if (!self->_highlighted)
      {
        id v12 = 0;
        double v13 = 1.0;
        goto LABEL_18;
      }
      uint64_t v19 = +[UIColor tertiarySystemBackgroundColor];
      id v12 = 0;
      v14 = v9;
      double v13 = 1.0;
      uint64_t v11 = (uint64_t)v8;
    }
    v9 = (void *)v19;
    goto LABEL_16;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __46___UICursorAccessoryItemView__recomputeColors__block_invoke;
  v27[3] = &unk_1E52D9F70;
  v27[4] = self;
  +[UIView animateWithDuration:0 delay:v27 options:&__block_literal_global_255 animations:0.05 completion:0.0];
LABEL_19:
  _UIRestorePreviousFallbackEnvironment(v5);
  +[UITraitCollection setCurrentTraitCollection:v3];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    BOOL v3 = a3;
    self->_highlighted = a3;
    [(_UICursorAccessoryItemView *)self _recomputeColors];
    v5 = [(UIView *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 6)
    {
      if (v3)
      {
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        double v16 = __45___UICursorAccessoryItemView_setHighlighted___block_invoke;
        double v17 = &unk_1E52D9F70;
        v18 = self;
        uint64_t v7 = &__block_literal_global_15_3;
        uint64_t v8 = &v14;
      }
      else
      {
        uint64_t v9 = MEMORY[0x1E4F143A8];
        uint64_t v10 = 3221225472;
        uint64_t v11 = __45___UICursorAccessoryItemView_setHighlighted___block_invoke_3;
        id v12 = &unk_1E52D9F70;
        double v13 = self;
        uint64_t v7 = &__block_literal_global_17_2;
        uint64_t v8 = &v9;
      }
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v8, v7, 0.05, 0.0, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

- (void)setStyle:(unint64_t)a3
{
  self->_unint64_t style = a3;
  [(_UICursorAccessoryItemView *)self _recomputeColors];
}

- (void)setRoundedEdges:(unint64_t)a3
{
  self->_roundedEdges = a3;
  [(UIView *)self setNeedsLayout];
}

- (void)setContent:(id *)a3
{
  p_content = &self->_content;
  __copy_assignment_8_8_s0_s8_t16w8((uint64_t)&self->_content, (uint64_t)a3);
  unint64_t type = p_content->type;
  if (type - 2 >= 2)
  {
    if (type != 1) {
      goto LABEL_10;
    }
    labelView = self->_labelView;
    if (!labelView)
    {
      id v12 = [(id)objc_opt_class() _makeLabelView];
      double v13 = self->_labelView;
      self->_labelView = v12;

      [(UILabel *)self->_labelView setUserInteractionEnabled:0];
      [(UIView *)self addSubview:self->_labelView];
      labelView = self->_labelView;
    }
    [(UILabel *)labelView setText:a3->var0];
    p_imageView = (void **)&self->_imageView;
    [(UIView *)self->_imageView removeFromSuperview];
  }
  else
  {
    imageView = self->_imageView;
    if (!imageView)
    {
      uint64_t v8 = [(id)objc_opt_class() _makeImageView];
      uint64_t v9 = self->_imageView;
      self->_imageView = v8;

      [(UIView *)self->_imageView setUserInteractionEnabled:0];
      [(UIView *)self addSubview:self->_imageView];
      imageView = self->_imageView;
    }
    [(UIImageView *)imageView setImage:a3->var1];
    p_imageView = (void **)&self->_labelView;
    [(UIView *)self->_labelView removeFromSuperview];
  }
  uint64_t v14 = *p_imageView;
  *p_imageView = 0;

LABEL_10:
  [(_UICursorAccessoryItemView *)self _recomputeColors];

  id var1 = a3->var1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  unint64_t type = self->_content.type;
  if (type == 1)
  {
    label = self->_content.label;
    uint64_t v15 = *(void *)off_1E52D2040;
    uint64_t v7 = [(UILabel *)self->_labelView font];
    v16[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    [(NSString *)label sizeWithAttributes:v8];
    double v4 = v9;

LABEL_6:
    +[_UICursorAccessoryView glyphWidth];
    if (v10 >= v4) {
      double v4 = v10;
    }
    +[_UICursorAccessoryView glyphHeight];
    double v12 = v11;
    double v13 = v4;
    goto LABEL_12;
  }
  if (type != 3)
  {
    double v4 = 0.0;
    if (type == 2)
    {
      +[_UICursorAccessoryView glyphWidth];
      double v4 = v5;
    }
    goto LABEL_6;
  }
  image = self->_content.image;
  [(UIImage *)image size];
LABEL_12:
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  v58.receiver = self;
  v58.super_class = (Class)_UICursorAccessoryItemView;
  [(UIView *)&v58 layoutSubviews];
  labelView = self->_labelView;
  if (labelView)
  {
    [(UIView *)labelView sizeToFit];
    [(UIView *)self->_labelView bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(UIView *)self bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [(UIView *)self contentScaleFactor];
    [(UILabel *)self->_labelView setFrame:UIRectCenteredIntegralRectScale(v5, v7, v9, v11, v13, v15, v17, v19, v20)];
  }
  if (self->_imageView)
  {
    if (self->_content.type == 3)
    {
      double v21 = *MEMORY[0x1E4F1DAD8];
      double v22 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      [(UIImage *)self->_content.image size];
      double v24 = v23;
      double v26 = v25;
      imageView = self->_imageView;
      double v28 = v21;
      double v29 = v22;
    }
    else
    {
      +[_UICursorAccessoryView glyphWidth];
      double v31 = v30;
      +[_UICursorAccessoryView glyphHeight];
      double v26 = v32;
      imageView = self->_imageView;
      double v28 = 0.0;
      double v29 = 0.0;
      double v24 = v31;
    }
    -[UIImageView setBounds:](imageView, "setBounds:", v28, v29, v24, v26);
    v33 = [(UIView *)self traitCollection];
    uint64_t v34 = [v33 userInterfaceIdiom];

    if (v34 == 6)
    {
      [(UIView *)self bounds];
      double v36 = v35;
      [(UIView *)self bounds];
      [(UIImageView *)self->_imageView setBounds:v36];
    }
    [(UIView *)self bounds];
    -[UIImageView setCenter:](self->_imageView, "setCenter:", v38 + v37 * 0.5, v40 + v39 * 0.5);
    long long v41 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v57.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v57.c = v41;
    *(_OWORD *)&v57.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    if (self->_style == 2) {
      CGAffineTransformMakeScale(&v57, 0.78, 0.78);
    }
    CGAffineTransform v56 = v57;
    [(UIView *)self->_imageView setTransform:&v56];
  }
  if (self->_backgroundView)
  {
    v42 = [(UIView *)self traitCollection];
    uint64_t v43 = [v42 userInterfaceIdiom];

    [(UIView *)self bounds];
    double v45 = v44;
    if (v43 == 6)
    {
      [(UIView *)self bounds];
      [(UIView *)self->_backgroundView setBounds:v45];
      v46 = [(_UIShapeView *)self->_backgroundView shapeLayer];
      [v46 setCornerRadius:22.0];

      [(UIView *)self bounds];
      -[UIView setCenter:](self->_backgroundView, "setCenter:", v48 + v47 * 0.5, v50 + v49 * 0.5);
    }
    else
    {
      [(UIView *)self->_backgroundView setFrame:v44];
      unint64_t roundedEdges = self->_roundedEdges;
      if ((roundedEdges & 8) != 0) {
        uint64_t v52 = ((uint64_t)(roundedEdges << 62) >> 63) & 5 | 0xA;
      }
      else {
        uint64_t v52 = ((uint64_t)(roundedEdges << 62) >> 63) & 5;
      }
      [(UIView *)self bounds];
      CGRectGetHeight(v59);
      [(UIView *)self bounds];
      +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v52);
      id v53 = objc_claimAutoreleasedReturnValue();
      uint64_t v54 = [v53 CGPath];
      v55 = [(_UIShapeView *)self->_backgroundView shapeLayer];
      [v55 setPath:v54];
    }
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_UICursorAccessoryItemView *)self setHighlighted:1];
  v9.receiver = self;
  v9.super_class = (Class)_UICursorAccessoryItemView;
  LOBYTE(self) = [(UIControl *)&v9 beginTrackingWithTouch:v7 withEvent:v6];

  return (char)self;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UICursorAccessoryItemView;
  [(UIControl *)&v5 endTrackingWithTouch:a3 withEvent:a4];
  [(_UICursorAccessoryItemView *)self setHighlighted:0];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UICursorAccessoryItemView;
  [(UIControl *)&v4 cancelTrackingWithEvent:a3];
  [(_UICursorAccessoryItemView *)self setHighlighted:0];
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)roundedEdges
{
  return self->_roundedEdges;
}

- (BOOL)collapsed
{
  return self->_collapsed;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- ($90CBC7AD7F202ACD7E5E12C06C780520)content
{
  p_content = &self->_content;
  retstr->var0 = self->_content.label;
  CGSize result = p_content->image;
  unint64_t type = p_content->type;
  retstr->id var1 = result;
  retstr->var2 = type;
  return result;
}

- (void).cxx_destruct
{
  p_content = &self->_content;

  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
}

@end