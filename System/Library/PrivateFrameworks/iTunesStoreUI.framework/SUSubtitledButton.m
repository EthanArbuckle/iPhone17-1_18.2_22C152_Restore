@interface SUSubtitledButton
- (CGRect)subtitleRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)currentSubtitle;
- (UIColor)currentSubtitleColor;
- (UIColor)currentSubtitleShadowColor;
- (UILabel)subtitleLabel;
- (id)_subtitleFont;
- (id)_subtitledContentForState:(unint64_t)a3;
- (id)subtitleColorForState:(unint64_t)a3;
- (id)subtitleForState:(unint64_t)a3;
- (id)subtitleShadowColorForState:(unint64_t)a3;
- (int64_t)_subtitleLineBreakMode;
- (void)_setupSubtitleView;
- (void)configureFromScriptButton:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setSubtitle:(id)a3 forState:(unint64_t)a4;
- (void)setSubtitleColor:(id)a3 forState:(unint64_t)a4;
- (void)setSubtitleShadowColor:(id)a3 forState:(unint64_t)a4;
@end

@implementation SUSubtitledButton

- (void)dealloc
{
  subtitleContentLookup = self->_subtitleContentLookup;
  if (subtitleContentLookup)
  {
    CFRelease(subtitleContentLookup);
    self->_subtitleContentLookup = 0;
  }

  self->_subtitleView = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUSubtitledButton;
  [(SUSubtitledButton *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SUSubtitledButton;
  [(SUSubtitledButton *)&v5 layoutSubviews];
  v3 = [(SUSubtitledButton *)self currentSubtitle];
  if ([(NSString *)v3 length])
  {
    [(SUSubtitledButton *)self _setupSubtitleView];
    [(UILabel *)self->_subtitleView setHidden:0];
    [(UILabel *)self->_subtitleView setShadowColor:[(SUSubtitledButton *)self currentSubtitleShadowColor]];
    [(UILabel *)self->_subtitleView setText:v3];
    [(UILabel *)self->_subtitleView setTextColor:[(SUSubtitledButton *)self currentSubtitleColor]];
    subtitleView = self->_subtitleView;
    [(SUSubtitledButton *)self bounds];
    -[SUSubtitledButton contentRectForBounds:](self, "contentRectForBounds:");
    -[SUSubtitledButton subtitleRectForContentRect:](self, "subtitleRectForContentRect:");
    -[UILabel setFrame:](subtitleView, "setFrame:");
  }
  else
  {
    [(UILabel *)self->_subtitleView setHidden:1];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SUSubtitledButton;
  -[SUSubtitledButton sizeThatFits:](&v17, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  v8 = [(SUSubtitledButton *)self currentSubtitle];
  if ([(NSString *)v8 length])
  {
    [(NSString *)v8 _legacy_sizeWithFont:[(SUSubtitledButton *)self _subtitleFont] forWidth:[(SUSubtitledButton *)self _subtitleLineBreakMode] lineBreakMode:3.40282347e38];
    double v10 = v9;
    double v12 = v11;
    [(SUSubtitledButton *)self contentEdgeInsets];
    double v7 = v7 + v12;
    if (v5 < v10 + v13 + v14) {
      double v5 = v10 + v13 + v14;
    }
  }
  double v15 = v5;
  double v16 = v7;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)configureFromScriptButton:(id)a3
{
  [a3 subtitle];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [a3 subtitle];
  }
  [(SUSubtitledButton *)self setSubtitle:v5 forState:0];
  v6.receiver = self;
  v6.super_class = (Class)SUSubtitledButton;
  [(UIButton *)&v6 configureFromScriptButton:a3];
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v33.receiver = self;
  v33.super_class = (Class)SUSubtitledButton;
  -[SUSubtitledButton titleRectForContentRect:](&v33, sel_titleRectForContentRect_);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(SUSubtitledButton *)self currentSubtitle];
  if ([(NSString *)v16 length])
  {
    [(SUSubtitledButton *)self titleEdgeInsets];
    CGFloat v18 = x + v17;
    double v20 = y + v19;
    CGFloat v22 = width - (v17 + v21);
    double v24 = height - (v19 + v23);
    id v25 = [(SUSubtitledButton *)self _subtitleFont];
    v34.origin.double x = v18;
    v34.origin.double y = v20;
    v34.size.double width = v22;
    v34.size.double height = v24;
    [(NSString *)v16 _legacy_sizeWithFont:v25 forWidth:[(SUSubtitledButton *)self _subtitleLineBreakMode] lineBreakMode:CGRectGetWidth(v34)];
    double v27 = v26;
    uint64_t v28 = [(SUSubtitledButton *)self contentVerticalAlignment];
    if (v28 != 1 && v28 != 3)
    {
      if (v28 == 2) {
        double v11 = v11 - (v27 + 1.0);
      }
      else {
        double v11 = v20 + floor((v24 - (v15 + v27 + 1.0)) * 0.5);
      }
    }
  }
  double v29 = v9;
  double v30 = v11;
  double v31 = v13;
  double v32 = v15;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (NSString)currentSubtitle
{
  uint64_t v3 = [(SUSubtitledButton *)self state];

  return (NSString *)[(SUSubtitledButton *)self subtitleForState:v3];
}

- (UIColor)currentSubtitleColor
{
  uint64_t v3 = [(SUSubtitledButton *)self state];

  return (UIColor *)[(SUSubtitledButton *)self subtitleColorForState:v3];
}

- (UIColor)currentSubtitleShadowColor
{
  uint64_t v3 = [(SUSubtitledButton *)self state];

  return (UIColor *)[(SUSubtitledButton *)self subtitleShadowColorForState:v3];
}

- (void)setSubtitle:(id)a3 forState:(unint64_t)a4
{
  objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", a4), "setSubtitle:", a3);
  if ([(SUSubtitledButton *)self autosizesToFit]) {
    [(SUSubtitledButton *)self sizeToFit];
  }
  [(SUSubtitledButton *)self setNeedsLayout];
  if (a4 && [(SUSubtitledButton *)self state] == a4)
  {
    [(SUSubtitledButton *)self layoutIfNeeded];
  }
}

- (void)setSubtitleColor:(id)a3 forState:(unint64_t)a4
{
  objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", a4), "setSubtitleColor:", a3);
  [(SUSubtitledButton *)self setNeedsLayout];
  if (a4 && [(SUSubtitledButton *)self state] == a4)
  {
    [(SUSubtitledButton *)self layoutIfNeeded];
  }
}

- (void)setSubtitleShadowColor:(id)a3 forState:(unint64_t)a4
{
  objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", a4), "setSubtitleShadowColor:", a3);
  [(SUSubtitledButton *)self setNeedsLayout];
  if (a4 && [(SUSubtitledButton *)self state] == a4)
  {
    [(SUSubtitledButton *)self layoutIfNeeded];
  }
}

- (id)subtitleColorForState:(unint64_t)a3
{
  id result = (id)objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", a3), "subtitleColor");
  if (!result)
  {
    id v5 = [(SUSubtitledButton *)self _subtitledContentForState:0];
    return (id)[v5 subtitleColor];
  }
  return result;
}

- (id)subtitleForState:(unint64_t)a3
{
  id result = (id)objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", a3), "subtitle");
  if (!result)
  {
    id v5 = [(SUSubtitledButton *)self _subtitledContentForState:0];
    return (id)[v5 subtitle];
  }
  return result;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleView;
}

- (CGRect)subtitleRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(SUSubtitledButton *)self currentSubtitle];
  if ([(NSString *)v8 length])
  {
    [(SUSubtitledButton *)self titleEdgeInsets];
    double v10 = x + v9;
    double v12 = y + v11;
    CGFloat v14 = width - (v9 + v13);
    CGFloat v16 = height - (v11 + v15);
    id v17 = [(SUSubtitledButton *)self _subtitleFont];
    v36.origin.double x = v10;
    v36.origin.double y = v12;
    double v33 = v16;
    double v34 = v14;
    v36.size.double width = v14;
    v36.size.double height = v16;
    [(NSString *)v8 _legacy_sizeWithFont:v17 forWidth:[(SUSubtitledButton *)self _subtitleLineBreakMode] lineBreakMode:CGRectGetWidth(v36)];
    double v19 = v18;
    double v35 = v20;
    uint64_t v21 = [(SUSubtitledButton *)self contentHorizontalAlignment];
    double v22 = v10;
    if (v21 != 1 && v21 != 3)
    {
      if (v21 == 2)
      {
        v37.origin.double x = v10;
        v37.origin.double y = v12;
        v37.size.double height = v33;
        v37.size.double width = v34;
        double v22 = CGRectGetMaxX(v37) - v19;
      }
      else
      {
        double v22 = v10 + floor((v34 - v19) * 0.5);
      }
    }
    -[SUSubtitledButton titleRectForContentRect:](self, "titleRectForContentRect:", x, y, width, height);
    if (v27 > 0.00000011920929)
    {
      double v12 = CGRectGetMaxY(*(CGRect *)&v24) + 1.0;
LABEL_14:
      double v23 = v35;
      goto LABEL_15;
    }
    uint64_t v28 = [(SUSubtitledButton *)self contentVerticalAlignment];
    if (v28 == 1 || v28 == 3) {
      goto LABEL_14;
    }
    if (v28 == 2)
    {
      v38.origin.double x = v10;
      v38.origin.double y = v12;
      v38.size.double height = v33;
      v38.size.double width = v34;
      CGFloat MaxY = CGRectGetMaxY(v38);
      double v23 = v35;
      double v12 = MaxY - v35;
    }
    else
    {
      double v23 = v35;
      double v12 = v12 + floor((v33 - v35) * 0.5);
    }
  }
  else
  {
    double v22 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v19 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v23 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
LABEL_15:
  double v30 = v22;
  double v31 = v12;
  double v32 = v19;
  result.size.double height = v23;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (id)subtitleShadowColorForState:(unint64_t)a3
{
  id result = (id)objc_msgSend(-[SUSubtitledButton _subtitledContentForState:](self, "_subtitledContentForState:", a3), "subtitleShadowColor");
  if (!result)
  {
    id v5 = [(SUSubtitledButton *)self _subtitledContentForState:0];
    return (id)[v5 subtitleShadowColor];
  }
  return result;
}

- (void)_setupSubtitleView
{
  if (!self->_subtitleView)
  {
    uint64_t v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    self->_subtitleView = v3;
    -[UILabel setBackgroundColor:](v3, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    -[UILabel setFont:](self->_subtitleView, "setFont:", [MEMORY[0x263F1C658] systemFontOfSize:14.0]);
    [(UILabel *)self->_subtitleView setEnabled:1];
    [(UILabel *)self->_subtitleView setClipsToBounds:1];
    -[UILabel setShadowOffset:](self->_subtitleView, "setShadowOffset:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    [(UILabel *)self->_subtitleView setTextAlignment:2 * ([(SUSubtitledButton *)self contentHorizontalAlignment] == 2)];
    [(SUSubtitledButton *)self addSubview:self->_subtitleView];
    [(SUSubtitledButton *)self setNeedsLayout];
  }
}

- (id)_subtitledContentForState:(unint64_t)a3
{
  subtitleContentLookup = self->_subtitleContentLookup;
  if (!subtitleContentLookup)
  {
    subtitleContentLookup = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x263EFFF90]);
    self->_subtitleContentLookup = subtitleContentLookup;
  }
  Value = (SUSubtitledButtonContent *)CFDictionaryGetValue(subtitleContentLookup, (const void *)a3);
  if (!Value)
  {
    Value = objc_alloc_init(SUSubtitledButtonContent);
    CFDictionarySetValue(self->_subtitleContentLookup, (const void *)a3, Value);
  }
  return Value;
}

- (id)_subtitleFont
{
  subtitleView = self->_subtitleView;
  if (subtitleView) {
    return [(UILabel *)subtitleView font];
  }
  else {
    return (id)[MEMORY[0x263F1C658] systemFontOfSize:14.0];
  }
}

- (int64_t)_subtitleLineBreakMode
{
  subtitleView = self->_subtitleView;
  if (subtitleView) {
    return [(UILabel *)subtitleView lineBreakMode];
  }
  else {
    return 4;
  }
}

@end