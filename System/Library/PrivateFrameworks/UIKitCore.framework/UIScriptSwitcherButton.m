@interface UIScriptSwitcherButton
- (BOOL)isLeading;
- (CGSize)intrinsicContentSize;
- (UIImage)leftImage;
- (UIImage)rightImage;
- (UIImageView)leftImageView;
- (UIImageView)rightImageView;
- (UIScriptSwitcherButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsLeading:(BOOL)a3;
- (void)setLeftImage:(id)a3;
- (void)setLeftImageView:(id)a3;
- (void)setRightImage:(id)a3;
- (void)setRightImageView:(id)a3;
- (void)updateTintColor;
@end

@implementation UIScriptSwitcherButton

- (UIScriptSwitcherButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIScriptSwitcherButton;
  v3 = -[UIButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UIImageView);
    [(UIView *)v3 addSubview:v4];
    [(UIImageView *)v4 setContentMode:4];
    [(UIScriptSwitcherButton *)v3 setLeftImageView:v4];
    v5 = objc_alloc_init(UIImageView);
    [(UIImageView *)v5 setContentMode:4];
    [(UIView *)v3 addSubview:v5];
    [(UIScriptSwitcherButton *)v3 setRightImageView:v5];
    [(UIScriptSwitcherButton *)v3 updateTintColor];
  }
  return v3;
}

- (void)layoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)UIScriptSwitcherButton;
  [(UIButton *)&v46 layoutSubviews];
  double v3 = 3.0;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (+[UIKeyboardImpl isFloating]) {
      double v3 = 3.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  v4 = [(UIScriptSwitcherButton *)self leftImage];
  if (v4)
  {
    v5 = [(UIScriptSwitcherButton *)self leftImage];
    [v5 size];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  v10 = [(UIScriptSwitcherButton *)self rightImage];
  if (v10)
  {
    v11 = [(UIScriptSwitcherButton *)self rightImage];
    [v11 size];
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  if ([(UIScriptSwitcherButton *)self isLeading]) {
    double v16 = 10.0;
  }
  else {
    double v16 = 0.0;
  }
  v17 = [(UIScriptSwitcherButton *)self leftImage];

  if (v17)
  {
    if (v13 <= 0.0) {
      double v18 = v7;
    }
    else {
      double v18 = v7 + v13 + 2.0;
    }
    [(UIView *)self bounds];
    double v20 = v16 + (v19 + -10.0 - v18) * 0.5;
    [(UIView *)self bounds];
    double v22 = v3 + (v21 - v9) * 0.5;
    v23 = [(UIScriptSwitcherButton *)self leftImageView];
    objc_msgSend(v23, "setFrame:", v20, v22, v7, v9);

    v24 = [(UIScriptSwitcherButton *)self leftImage];
    v25 = [v24 imageWithRenderingMode:2];
    v26 = [(UIScriptSwitcherButton *)self leftImageView];
    [v26 setImage:v25];
  }
  else
  {
    double v27 = *MEMORY[0x1E4F1DB28];
    double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v29 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v30 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v31 = [(UIScriptSwitcherButton *)self leftImageView];
    objc_msgSend(v31, "setFrame:", v27, v28, v29, v30);

    v24 = [(UIScriptSwitcherButton *)self leftImageView];
    [v24 setImage:0];
  }

  v32 = [(UIScriptSwitcherButton *)self rightImage];

  if (v32)
  {
    v33 = [(UIScriptSwitcherButton *)self leftImage];
    if (v33)
    {
      v34 = [(UIScriptSwitcherButton *)self leftImageView];
      [v34 frame];
      double v16 = CGRectGetMaxX(v47) + 2.0;
    }
    [(UIView *)self bounds];
    double v36 = v3 + (v35 - v15) * 0.5;
    v37 = [(UIScriptSwitcherButton *)self rightImageView];
    objc_msgSend(v37, "setFrame:", v16, v36, v13, v15);

    v38 = [(UIScriptSwitcherButton *)self rightImage];
    v39 = [v38 imageWithRenderingMode:2];
    v40 = [(UIScriptSwitcherButton *)self rightImageView];
    [v40 setImage:v39];
  }
  else
  {
    double v41 = *MEMORY[0x1E4F1DB28];
    double v42 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v44 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v45 = [(UIScriptSwitcherButton *)self rightImageView];
    objc_msgSend(v45, "setFrame:", v41, v42, v43, v44);

    v38 = [(UIScriptSwitcherButton *)self rightImageView];
    [v38 setImage:0];
  }
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(UIScriptSwitcherButton *)self leftImage];

  if (v3)
  {
    v4 = [(UIScriptSwitcherButton *)self leftImage];
    [v4 size];
    double v6 = v5 + 0.0;
  }
  else
  {
    double v6 = 0.0;
  }
  double v7 = [(UIScriptSwitcherButton *)self rightImage];

  if (v7)
  {
    double v8 = [(UIScriptSwitcherButton *)self rightImage];
    [v8 size];
    double v6 = v6 + v9 + 2.0;
  }
  v12.receiver = self;
  v12.super_class = (Class)UIScriptSwitcherButton;
  [(UIButton *)&v12 intrinsicContentSize];
  if (v6 > 0.0) {
    double v10 = v6 + 10.0;
  }
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIScriptSwitcherButton;
  [(UIButton *)&v4 setHighlighted:a3];
  [(UIScriptSwitcherButton *)self updateTintColor];
}

- (void)setIsLeading:(BOOL)a3
{
  self->_isLeading = a3;
  [(UIButton *)self setNeedsLayout];
}

- (void)updateTintColor
{
  if ([(UIControl *)self isHighlighted])
  {
    id v5 = +[UIColor grayColor];
    [(UIButton *)self setTintColor:v5];
  }
  else
  {
    id v5 = +[UIKeyboardImpl activeInstance];
    double v3 = [v5 _inheritedRenderConfig];
    if ([v3 lightKeyboard]) {
      +[UIColor systemDarkGrayTintColor];
    }
    else {
    objc_super v4 = +[UIColor whiteColor];
    }
    [(UIButton *)self setTintColor:v4];
  }
}

- (UIImageView)leftImageView
{
  return self->_leftImageView;
}

- (void)setLeftImageView:(id)a3
{
}

- (UIImageView)rightImageView
{
  return self->_rightImageView;
}

- (void)setRightImageView:(id)a3
{
}

- (UIImage)leftImage
{
  return self->_leftImage;
}

- (void)setLeftImage:(id)a3
{
}

- (UIImage)rightImage
{
  return self->_rightImage;
}

- (void)setRightImage:(id)a3
{
}

- (BOOL)isLeading
{
  return self->_isLeading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightImage, 0);
  objc_storeStrong((id *)&self->_leftImage, 0);
  objc_storeStrong((id *)&self->_rightImageView, 0);
  objc_storeStrong((id *)&self->_leftImageView, 0);
}

@end