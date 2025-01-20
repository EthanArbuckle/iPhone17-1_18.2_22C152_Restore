@interface VUIRoundButton
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)textLabels;
- (UIButton)button;
- (UIImage)buttonImage;
- (UIStackView)textLabelStackView;
- (VUIRoundButton)initWithFrame:(CGRect)a3;
- (VUIRoundButtonDelegate)delegate;
- (void)_setUpViews;
- (void)buttonPressed:(id)a3;
- (void)buttonReleased:(id)a3;
- (void)buttonSelected:(id)a3;
- (void)configureTextStackView;
- (void)setButton:(id)a3;
- (void)setButtonImage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTextLabelStackView:(id)a3;
- (void)setTextLabels:(id)a3;
@end

@implementation VUIRoundButton

- (VUIRoundButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VUIRoundButton;
  v3 = -[VUIRoundButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    [(VUIRoundButton *)v3 _setUpViews];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_super v7 = [(VUIRoundButton *)self textLabels];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "sizeThatFits:", width, height);
        double v6 = v6 + v13;
        if (v12 >= v5) {
          double v5 = v12;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  if (v6 >= 28.0) {
    double v14 = v6;
  }
  else {
    double v14 = 28.0;
  }
  double v15 = ceil(v5 + 28.0 + 4.0);
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[VUIRoundButton sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setButtonImage:(id)a3
{
  p_buttonImage = &self->_buttonImage;
  id v7 = a3;
  if ((-[UIImage isEqual:](*p_buttonImage, "isEqual:") & 1) == 0)
  {
    double v6 = [(VUIRoundButton *)self button];
    [v6 setImage:v7 forState:0];

    objc_storeStrong((id *)p_buttonImage, a3);
  }
}

- (void)setTextLabels:(id)a3
{
  id v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_textLabels, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_textLabels, a3);
    [(VUIRoundButton *)self configureTextStackView];
  }
}

- (void)_setUpViews
{
  double v3 = [(VUIRoundButton *)self button];
  [(VUIRoundButton *)self addSubview:v3];

  uint64_t v4 = [(VUIRoundButton *)self button];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [(VUIRoundButton *)self button];
  double v6 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  [v5 setBackgroundColor:v6];

  id v7 = [(VUIRoundButton *)self button];
  uint64_t v8 = [MEMORY[0x1E4FB1618] whiteColor];
  [v7 setTintColor:v8];

  uint64_t v9 = [(VUIRoundButton *)self button];
  uint64_t v10 = [v9 layer];
  [v10 setMasksToBounds:1];

  uint64_t v11 = [(VUIRoundButton *)self button];
  double v12 = [v11 layer];
  [v12 setCornerRadius:14.0];

  double v13 = [(VUIRoundButton *)self button];
  double v14 = [v13 leadingAnchor];
  double v15 = [(VUIRoundButton *)self leadingAnchor];
  long long v16 = [v14 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  long long v17 = [(VUIRoundButton *)self button];
  long long v18 = [v17 heightAnchor];
  long long v19 = [v18 constraintEqualToConstant:28.0];
  [v19 setActive:1];

  v20 = [(VUIRoundButton *)self button];
  uint64_t v21 = [v20 widthAnchor];
  v22 = [v21 constraintEqualToConstant:28.0];
  [v22 setActive:1];

  v23 = [(VUIRoundButton *)self button];
  v24 = [v23 centerYAnchor];
  v25 = [(VUIRoundButton *)self centerYAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  v27 = [(VUIRoundButton *)self button];
  objc_msgSend(v27, "setImageEdgeInsets:", 7.0, 7.0, 7.0, 7.0);

  v28 = [(VUIRoundButton *)self button];
  [v28 addTarget:self action:sel_buttonSelected_ forControlEvents:3];

  v29 = [(VUIRoundButton *)self button];
  [v29 addTarget:self action:sel_buttonReleased_ forControlEvents:128];

  id v30 = [(VUIRoundButton *)self button];
  [v30 addTarget:self action:sel_buttonPressed_ forControlEvents:64];
}

- (void)configureTextStackView
{
  textLabelStackView = self->_textLabelStackView;
  if (textLabelStackView)
  {
    [(UIStackView *)textLabelStackView removeFromSuperview];
    uint64_t v4 = self->_textLabelStackView;
    self->_textLabelStackView = 0;
  }
  id v5 = objc_alloc(MEMORY[0x1E4FB1C60]);
  double v6 = [(VUIRoundButton *)self textLabels];
  id v7 = (UIStackView *)[v5 initWithArrangedSubviews:v6];
  uint64_t v8 = self->_textLabelStackView;
  self->_textLabelStackView = v7;

  uint64_t v9 = [(VUIRoundButton *)self textLabelStackView];
  [(VUIRoundButton *)self addSubview:v9];

  uint64_t v10 = [(VUIRoundButton *)self textLabelStackView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v11 = [(VUIRoundButton *)self textLabelStackView];
  [v11 setAxis:1];

  double v12 = [(VUIRoundButton *)self textLabelStackView];
  double v13 = [v12 centerYAnchor];
  double v14 = [(VUIRoundButton *)self button];
  double v15 = [v14 centerYAnchor];
  long long v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  long long v17 = [(VUIRoundButton *)self textLabelStackView];
  long long v18 = [v17 leadingAnchor];
  long long v19 = [(VUIRoundButton *)self button];
  v20 = [v19 trailingAnchor];
  uint64_t v21 = [v18 constraintEqualToAnchor:v20 constant:4.0];
  [v21 setActive:1];

  id v25 = [(VUIRoundButton *)self textLabelStackView];
  v22 = [v25 trailingAnchor];
  v23 = [(VUIRoundButton *)self trailingAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  [v24 setActive:1];
}

- (void)buttonSelected:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  objc_msgSend(v3, "vui_keyBlueHighlightedColor");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setBackgroundColor:v5];
}

- (void)buttonReleased:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a3;
  objc_msgSend(v3, "vui_keyColor");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setBackgroundColor:v5];
}

- (void)buttonPressed:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  double v6 = objc_msgSend(v4, "vui_keyColor");
  [v5 setBackgroundColor:v6];

  id v7 = [(VUIRoundButton *)self delegate];
  [v7 didSelectButton:self];
}

- (UIImage)buttonImage
{
  return self->_buttonImage;
}

- (NSArray)textLabels
{
  return self->_textLabels;
}

- (VUIRoundButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIRoundButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (UIStackView)textLabelStackView
{
  return self->_textLabelStackView;
}

- (void)setTextLabelStackView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabelStackView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textLabels, 0);
  objc_storeStrong((id *)&self->_buttonImage, 0);
}

@end