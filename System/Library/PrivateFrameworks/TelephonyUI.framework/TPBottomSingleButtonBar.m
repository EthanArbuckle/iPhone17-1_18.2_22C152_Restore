@interface TPBottomSingleButtonBar
+ (id)_backgroundImage;
- (double)buttonWidth;
- (id)button;
- (void)setButton:(id)a3 andStyle:(BOOL)a4;
@end

@implementation TPBottomSingleButtonBar

+ (id)_backgroundImage
{
  return 0;
}

- (double)buttonWidth
{
  unint64_t style = self->super._style;
  double result = 0.0;
  if (style <= 3) {
    return dbl_1C2F72CA8[style];
  }
  return result;
}

- (void)setButton:(id)a3 andStyle:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (TPButton *)a3;
  p_button = (id *)&self->_button;
  button = self->_button;
  id v10 = v7;
  v26 = v7;
  if (button != v7)
  {
    [(TPButton *)button removeFromSuperview];
    objc_storeStrong((id *)&self->_button, a3);
    id v10 = *p_button;
  }
  if (v10)
  {
    v11 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if (v4)
      {
        [(TPBottomSingleButtonBar *)self bounds];
        double v14 = v13;
        double v16 = v15;
        [*p_button frame];
        objc_msgSend((id)objc_opt_class(), "defaultHeightForColor:", objc_msgSend(*p_button, "buttonColor"));
        double v18 = v17;
        double v19 = floor((v16 - v17) * 0.5) + 2.0;
        double v20 = v14 + -4.0;
        id v21 = *p_button;
        double v22 = 2.0;
LABEL_9:
        objc_msgSend(v21, "setFrame:", v22, v19, v20, v18);
      }
    }
    else if (v4)
    {
      [(TPBottomSingleButtonBar *)self bounds];
      double v24 = v23;
      objc_msgSend((id)objc_opt_class(), "defaultHeightForColor:", objc_msgSend(*p_button, "buttonColor"));
      double v18 = v25;
      id v21 = *p_button;
      double v22 = 0.0;
      double v19 = 0.0;
      double v20 = v24;
      goto LABEL_9;
    }
    [(TPBottomSingleButtonBar *)self addSubview:*p_button];
  }
  [(TPBottomSingleButtonBar *)self setNeedsLayout];
}

- (id)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong(&self->_delegate, 0);
}

@end