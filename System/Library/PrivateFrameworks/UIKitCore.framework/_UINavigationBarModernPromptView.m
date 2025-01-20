@interface _UINavigationBarModernPromptView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (NSString)prompt;
- (UIColor)textColor;
- (_UINavigationBarModernPromptView)initWithFrame:(CGRect)a3;
- (void)_updatePromptLabel;
- (void)setPrompt:(id)a3;
- (void)setTextColor:(id)a3;
- (void)updateLayoutData:(id)a3 layoutWidth:(double)a4;
@end

@implementation _UINavigationBarModernPromptView

- (_UINavigationBarModernPromptView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UINavigationBarModernPromptView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    prompt = v3->_prompt;
    v3->_prompt = (NSString *)&stru_1ED0E84C0;

    uint64_t v6 = +[UIColor labelColor];
    textColor = v4->_textColor;
    v4->_textColor = (UIColor *)v6;

    [(UIView *)v4 _setHostsLayoutEngine:1];
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
}

- (void)_updatePromptLabel
{
  if (!self->_promptLabel && [(NSString *)self->_prompt length])
  {
    v3 = objc_alloc_init(UILabel);
    promptLabel = self->_promptLabel;
    self->_promptLabel = v3;

    [(UILabel *)self->_promptLabel setAdjustsFontSizeToFitWidth:1];
    [(UIView *)self addSubview:self->_promptLabel];
    [(UIView *)self->_promptLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(UIView *)self->_promptLabel lastBaselineAnchor];
    uint64_t v6 = [(UIView *)self topAnchor];
    v7 = [v5 constraintEqualToAnchor:v6 constant:22.0];
    [v7 setActive:1];

    v8 = [(UIView *)self->_promptLabel centerXAnchor];
    objc_super v9 = [(UIView *)self centerXAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    [v10 setActive:1];

    v11 = [(UIView *)self->_promptLabel leadingAnchor];
    v12 = [(UIView *)self layoutMarginsGuide];
    v13 = [v12 leadingAnchor];
    v14 = [v11 constraintGreaterThanOrEqualToAnchor:v13];
    [v14 setActive:1];

    v15 = [(UIView *)self->_promptLabel trailingAnchor];
    v16 = [(UIView *)self layoutMarginsGuide];
    v17 = [v16 trailingAnchor];
    v18 = [v15 constraintLessThanOrEqualToAnchor:v17];
    [v18 setActive:1];
  }
  [(UILabel *)self->_promptLabel setTextColor:self->_textColor];
  if (self->_prompt) {
    prompt = (__CFString *)self->_prompt;
  }
  else {
    prompt = &stru_1ED0E84C0;
  }
  [(UILabel *)self->_promptLabel setText:prompt];
  id v21 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:@"UICTContentSizeCategoryL"];
  v20 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote" compatibleWithTraitCollection:v21];
  [(UILabel *)self->_promptLabel setFont:v20];
}

- (void)setPrompt:(id)a3
{
  v4 = (__CFString *)a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = &stru_1ED0E84C0;
  }
  obj = v5;
  if (!-[NSString isEqualToString:](self->_prompt, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_prompt, obj);
    [(_UINavigationBarModernPromptView *)self _updatePromptLabel];
  }
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[UIColor labelColor];
  }
  id obj = v4;
  if (![(UIColor *)self->_textColor isEqual:v4])
  {
    objc_storeStrong((id *)&self->_textColor, obj);
    [(_UINavigationBarModernPromptView *)self _updatePromptLabel];
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = 34.0;
  double v3 = -1.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 34.0;
  result.height = v3;
  return result;
}

- (void)updateLayoutData:(id)a3 layoutWidth:(double)a4
{
  if (a3) {
    *((int64x2_t *)a3 + 2) = vdupq_n_s64(0x4041000000000000uLL);
  }
}

- (NSString)prompt
{
  return self->_prompt;
}

- (UIColor)textColor
{
  return self->_textColor;
}

@end