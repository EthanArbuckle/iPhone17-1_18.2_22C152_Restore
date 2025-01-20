@interface STSSearchNoticeView
- (BOOL)isContentCentered;
- (NSString)text;
- (STSSearchNoticeView)init;
- (UIColor)textColor;
- (UIEdgeInsets)contentInsets;
- (id)continueButtonAction;
- (void)_continuePressed:(id)a3;
- (void)layoutSubviews;
- (void)setContentCentered:(BOOL)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setContinueButtonAction:(id)a3;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation STSSearchNoticeView

- (STSSearchNoticeView)init
{
  v11.receiver = self;
  v11.super_class = (Class)STSSearchNoticeView;
  v2 = [(STSSearchNoticeView *)&v11 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x263F825C8], "sts_defaultBackgroundColor");
    [(STSSearchNoticeView *)v2 setBackgroundColor:v3];

    [(STSSearchNoticeView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    textLabel = v2->_textLabel;
    v2->_textLabel = v4;

    v6 = v2->_textLabel;
    v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v6 setFont:v7];

    [(UILabel *)v2->_textLabel setTextAlignment:1];
    [(UILabel *)v2->_textLabel setNumberOfLines:0];
    [(UILabel *)v2->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(STSSearchNoticeView *)v2 addSubview:v2->_textLabel];
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    constraints = v2->_constraints;
    v2->_constraints = (NSMutableArray *)v8;
  }
  return v2;
}

- (void)layoutSubviews
{
  [MEMORY[0x263F08938] deactivateConstraints:self->_constraints];
  [(NSMutableArray *)self->_constraints removeAllObjects];
  id v28 = [(STSSearchNoticeView *)self readableContentGuide];
  constraints = self->_constraints;
  v4 = [(UILabel *)self->_textLabel leadingAnchor];
  v5 = [v28 leadingAnchor];
  v6 = [v4 constraintEqualToAnchor:v5];
  [(NSMutableArray *)constraints addObject:v6];

  v7 = self->_constraints;
  uint64_t v8 = [(UILabel *)self->_textLabel trailingAnchor];
  v9 = [v28 trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [(NSMutableArray *)v7 addObject:v10];

  objc_super v11 = self->_constraints;
  v12 = [(UILabel *)self->_textLabel centerXAnchor];
  v13 = [(STSSearchNoticeView *)self centerXAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  [(NSMutableArray *)v11 addObject:v14];

  v15 = self->_constraints;
  v16 = [(UILabel *)self->_textLabel topAnchor];
  v17 = [(STSSearchNoticeView *)self topAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:16.0];
  [(NSMutableArray *)v15 addObject:v18];

  continueButton = self->_continueButton;
  if (continueButton)
  {
    v20 = self->_constraints;
    v21 = [(UIButton *)continueButton centerXAnchor];
    v22 = [(STSSearchNoticeView *)self centerXAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [(NSMutableArray *)v20 addObject:v23];

    v24 = self->_constraints;
    v25 = [(UIButton *)self->_continueButton topAnchor];
    v26 = [(UILabel *)self->_textLabel bottomAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:16.0];
    [(NSMutableArray *)v24 addObject:v27];
  }
  [MEMORY[0x263F08938] activateConstraints:self->_constraints];
}

- (void)_continuePressed:(id)a3
{
  continueButtonAction = (void (**)(void))self->_continueButtonAction;
  if (continueButtonAction) {
    continueButtonAction[2]();
  }
}

- (void)setText:(id)a3
{
  p_text = &self->_text;
  id v6 = a3;
  if (!-[NSString isEqualToString:](*p_text, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_text, a3);
    [(UILabel *)self->_textLabel setText:*p_text];
    [(STSSearchNoticeView *)self setNeedsLayout];
  }
}

- (UIColor)textColor
{
  return [(UILabel *)self->_textLabel textColor];
}

- (void)setTextColor:(id)a3
{
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(STSSearchNoticeView *)self setNeedsLayout];
  }
}

- (void)setContentCentered:(BOOL)a3
{
  if (self->_contentCentered != a3)
  {
    self->_contentCentered = a3;
    [(STSSearchNoticeView *)self setNeedsLayout];
  }
}

- (void)setContinueButtonAction:(id)a3
{
  if (self->_continueButtonAction != a3)
  {
    continueButton = self->_continueButton;
    id v5 = a3;
    [(UIButton *)continueButton removeFromSuperview];
    id v6 = (void *)MEMORY[0x230FB7F40](v5);

    id continueButtonAction = self->_continueButtonAction;
    self->_id continueButtonAction = v6;

    if (self->_continueButtonAction)
    {
      uint64_t v8 = [MEMORY[0x263F824E8] buttonWithType:1];
      v9 = self->_continueButton;
      self->_continueButton = v8;

      v10 = self->_continueButton;
      objc_super v11 = STSLocalizedString(@"NOTICE_CONTINUE_BUTTON_TITLE");
      [(UIButton *)v10 setTitle:v11 forState:0];

      v12 = [(UIButton *)self->_continueButton titleLabel];
      v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
      [v12 setFont:v13];

      [(UIButton *)self->_continueButton addTarget:self action:sel__continuePressed_ forControlEvents:64];
      [(UIButton *)self->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [(STSSearchNoticeView *)self addSubview:self->_continueButton];
    }
    [(STSSearchNoticeView *)self setNeedsLayout];
  }
}

- (NSString)text
{
  return self->_text;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)isContentCentered
{
  return self->_contentCentered;
}

- (id)continueButtonAction
{
  return self->_continueButtonAction;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueButtonAction, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);

  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end