@interface NUCrossFadeTitleView
- (CGRect)visibleFrame;
- (NUCrossFadeTitleView)initWithCoder:(id)a3;
- (NUCrossFadeTitleView)initWithFrame:(CGRect)a3;
- (NUCrossFadeTitleView)initWithStyler:(id)a3;
- (NUCrossFadeViewAnimator)animator;
- (NUTextAndGlyphView)textAndGlyphView;
- (NUTitleViewStyler)styler;
- (NUTitleViewUpdate)update;
- (UIImageView)titleImageView;
- (UILabel)titleLabel;
- (id)_applyStylesToText:(id)a3 styleType:(unint64_t)a4;
- (id)_applyStylesToTextAndGlyph:(id)a3 styleType:(unint64_t)a4;
- (id)applyStylesToValueFromTitleViewUpdate:(id)a3;
- (id)viewForValueType:(unint64_t)a3;
- (unint64_t)displayValueType;
- (void)layoutSubviews;
- (void)relayoutWithAnimation:(BOOL)a3;
- (void)setDisplayValueType:(unint64_t)a3;
- (void)setStyler:(id)a3;
- (void)setUpdate:(id)a3;
- (void)updateTitleViewWithUpdate:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation NUCrossFadeTitleView

- (void)updateTitleViewWithUpdate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v15 = a3;
  v8 = (void (**)(void))a5;
  v9 = [(NUCrossFadeTitleView *)self viewForValueType:[(NUCrossFadeTitleView *)self displayValueType]];
  v10 = -[NUCrossFadeTitleView viewForValueType:](self, "viewForValueType:", [v15 valueType]);
  -[NUCrossFadeTitleView setDisplayValueType:](self, "setDisplayValueType:", [v15 valueType]);
  v11 = [(NUCrossFadeTitleView *)self applyStylesToValueFromTitleViewUpdate:v15];
  v12 = [(NUCrossFadeTitleView *)self animator];
  v13 = v12;
  if (a4)
  {
    [v12 crossFadeFromView:v9 toView:v10 value:v11 completion:v8];
  }
  else
  {
    [v12 resetView:v9];

    v14 = [(NUCrossFadeTitleView *)self animator];
    [v14 resetView:v10];

    objc_msgSend(v9, "nu_crossFadeViewSetValue:", 0);
    objc_msgSend(v10, "nu_crossFadeViewSetValue:", v11);
    if (v8) {
      v8[2](v8);
    }
  }
  [(NUCrossFadeTitleView *)self setUpdate:v15];
}

- (id)viewForValueType:(unint64_t)a3
{
  v4 = 0;
  switch(a3)
  {
    case 0uLL:
      v4 = [(NUCrossFadeTitleView *)self titleImageView];
      break;
    case 1uLL:
    case 4uLL:
      v4 = [(NUCrossFadeTitleView *)self titleLabel];
      break;
    case 2uLL:
      v4 = [(NUCrossFadeTitleView *)self textAndGlyphView];
      break;
    default:
      break;
  }

  return v4;
}

- (NUCrossFadeViewAnimator)animator
{
  return self->_animator;
}

- (void)setUpdate:(id)a3
{
}

- (void)setDisplayValueType:(unint64_t)a3
{
  self->_displayValueType = a3;
}

- (unint64_t)displayValueType
{
  return self->_displayValueType;
}

- (id)applyStylesToValueFromTitleViewUpdate:(id)a3
{
  id v4 = a3;
  switch([v4 valueType])
  {
    case 0:
    case 3:
      goto LABEL_6;
    case 1:
      uint64_t v5 = [v4 textAlignment];
      v6 = [(NUCrossFadeTitleView *)self titleLabel];
      [v6 setTextAlignment:v5];

      v7 = [v4 value];
      -[NUCrossFadeTitleView _applyStylesToText:styleType:](self, "_applyStylesToText:styleType:", v7, [v4 styleType]);
      v8 = (NUCrossFadeTitleView *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 2:
      v7 = [v4 value];
      -[NUCrossFadeTitleView _applyStylesToTextAndGlyph:styleType:](self, "_applyStylesToTextAndGlyph:styleType:", v7, [v4 styleType]);
      v8 = (NUCrossFadeTitleView *)objc_claimAutoreleasedReturnValue();
LABEL_4:
      self = v8;

      break;
    case 4:
      v9 = [(NUCrossFadeTitleView *)self titleLabel];
      [v9 setNumberOfLines:0];

      uint64_t v10 = [v4 textAlignment];
      v11 = [(NUCrossFadeTitleView *)self titleLabel];
      [v11 setTextAlignment:v10];

LABEL_6:
      self = [v4 value];
      break;
    default:
      break;
  }

  return self;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)NUCrossFadeTitleView;
  [(NUCrossFadeTitleView *)&v33 layoutSubviews];
  [(NUCrossFadeTitleView *)self bounds];
  double v4 = v3;
  [(NUCrossFadeTitleView *)self bounds];
  double v6 = v5 * 0.5;
  v7 = [(NUCrossFadeTitleView *)self titleImageView];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, v4, v6);

  [(NUCrossFadeTitleView *)self center];
  double v9 = v8;
  double v11 = v10;
  v12 = [(NUCrossFadeTitleView *)self titleImageView];
  objc_msgSend(v12, "setCenter:", v9, v11);

  [(NUCrossFadeTitleView *)self bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(NUCrossFadeTitleView *)self bounds];
  double v20 = v19;
  v21 = [(NUCrossFadeTitleView *)self titleLabel];
  objc_msgSend(v21, "setFrame:", v14, v16, v20, v18);

  [(NUCrossFadeTitleView *)self center];
  double v23 = v22;
  double v25 = v24;
  v26 = [(NUCrossFadeTitleView *)self titleLabel];
  objc_msgSend(v26, "setCenter:", v23, v25);

  v27 = [(NUCrossFadeTitleView *)self textAndGlyphView];
  objc_msgSend(v27, "setFrame:", v14, v16, v20, v18);

  [(NUCrossFadeTitleView *)self center];
  double v29 = v28;
  double v31 = v30;
  v32 = [(NUCrossFadeTitleView *)self textAndGlyphView];
  objc_msgSend(v32, "setCenter:", v29, v31);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)titleImageView
{
  return self->_titleImageView;
}

- (NUTextAndGlyphView)textAndGlyphView
{
  return self->_textAndGlyphView;
}

- (void)setStyler:(id)a3
{
}

- (NUCrossFadeTitleView)initWithStyler:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NUCrossFadeTitleView;
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v10 = -[NUCrossFadeTitleView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x263F001A8], v7, v8, v9);
  double v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_styler, a3);
    v11->_displayValueType = 3;
    v12 = objc_alloc_init(NUCrossFadeViewAnimator);
    animator = v11->_animator;
    v11->_animator = v12;

    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v6, v7, v8, v9);
    titleImageView = v11->_titleImageView;
    v11->_titleImageView = (UIImageView *)v14;

    [(UIImageView *)v11->_titleImageView setAutoresizingMask:2];
    [(UIImageView *)v11->_titleImageView setContentMode:1];
    [(UIImageView *)v11->_titleImageView nu_supportViewDebugging];
    [(NUCrossFadeTitleView *)v11 addSubview:v11->_titleImageView];
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v6, v7, v8, v9);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (UILabel *)v16;

    [(UILabel *)v11->_titleLabel setAutoresizingMask:2];
    [(UILabel *)v11->_titleLabel setNumberOfLines:1];
    [(UILabel *)v11->_titleLabel setMinimumScaleFactor:0.25];
    [(UILabel *)v11->_titleLabel nu_supportViewDebugging];
    [(NUCrossFadeTitleView *)v11 addSubview:v11->_titleLabel];
    double v18 = -[NUTextAndGlyphView initWithFrame:]([NUTextAndGlyphView alloc], "initWithFrame:", v6, v7, v8, v9);
    textAndGlyphView = v11->_textAndGlyphView;
    v11->_textAndGlyphView = v18;

    [(UIView *)v11->_textAndGlyphView nu_supportViewDebugging];
    [(NUCrossFadeTitleView *)v11 addSubview:v11->_textAndGlyphView];
  }

  return v11;
}

- (void)relayoutWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NUCrossFadeTitleView *)self update];
  [(NUCrossFadeTitleView *)self updateTitleViewWithUpdate:v5 animated:v3 completion:0];
}

- (NUTitleViewUpdate)update
{
  return self->_update;
}

- (NUCrossFadeTitleView)initWithFrame:(CGRect)a3
{
  return -[NUCrossFadeTitleView initWithStyler:](self, "initWithStyler:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NUCrossFadeTitleView)initWithCoder:(id)a3
{
  return [(NUCrossFadeTitleView *)self initWithStyler:0];
}

- (CGRect)visibleFrame
{
  switch([(NUCrossFadeTitleView *)self displayValueType])
  {
    case 0uLL:
      double v7 = [(NUCrossFadeTitleView *)self titleImageView];
      goto LABEL_5;
    case 1uLL:
    case 4uLL:
      double v7 = [(NUCrossFadeTitleView *)self titleLabel];
      goto LABEL_5;
    case 2uLL:
      double v7 = [(NUCrossFadeTitleView *)self textAndGlyphView];
LABEL_5:
      double v8 = v7;
      [v7 frame];
      double v2 = v9;
      double v3 = v10;
      double v4 = v11;
      double v5 = v12;

      break;
    case 3uLL:
      double v2 = *MEMORY[0x263F001A8];
      double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
      break;
    default:
      break;
  }
  double v13 = v2;
  double v14 = v3;
  double v15 = v4;
  double v16 = v5;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_applyStylesToText:(id)a3 styleType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(NUCrossFadeTitleView *)self styler];
  if (v7
    && (double v8 = (void *)v7,
        [(NUCrossFadeTitleView *)self styler],
        double v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    if (v6)
    {
      double v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      double v12 = [v6 componentsSeparatedByCharactersInSet:v11];

      unint64_t v13 = [v12 count];
      if (v13 >= 2) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = v13;
      }
      double v15 = [(NUCrossFadeTitleView *)self titleLabel];
      [v15 setNumberOfLines:v14];

      double v16 = [(NUCrossFadeTitleView *)self styler];
      [(NUCrossFadeTitleView *)self bounds];
      objc_msgSend(v16, "styleTitleText:styleType:boundingSize:", v6, a4, v17, v18);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = v6;
  }

  return v19;
}

- (id)_applyStylesToTextAndGlyph:(id)a3 styleType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(NUCrossFadeTitleView *)self styler];
  if (!v7) {
    goto LABEL_5;
  }
  double v8 = (void *)v7;
  double v9 = [(NUCrossFadeTitleView *)self styler];
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0) {
    goto LABEL_5;
  }
  if (v6)
  {
    double v11 = [v6 attributedText];

    if (v11)
    {
LABEL_5:
      double v12 = (NUTextAndGlyph *)v6;
      goto LABEL_6;
    }
    uint64_t v14 = [(NUCrossFadeTitleView *)self styler];
    double v15 = [v6 text];
    [(NUCrossFadeTitleView *)self bounds];
    double v18 = objc_msgSend(v14, "styleTitleText:styleType:boundingSize:", v15, a4, v16, v17);

    id v19 = [NUTextAndGlyph alloc];
    double v20 = [v6 glyph];
    double v12 = [(NUTextAndGlyph *)v19 initWithAttributedText:v18 glyph:v20];

    -[NUTextAndGlyph setAlignment:](v12, "setAlignment:", [v6 alignment]);
  }
  else
  {
    double v12 = 0;
  }
LABEL_6:

  return v12;
}

- (NUTitleViewStyler)styler
{
  return self->_styler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_update, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_textAndGlyphView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleImageView, 0);

  objc_storeStrong((id *)&self->_styler, 0);
}

@end