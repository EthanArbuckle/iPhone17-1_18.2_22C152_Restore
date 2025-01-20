@interface DevicePINKeypadContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (DevicePINKeypad)keypad;
- (DevicePINKeypadContainerView)initWithKeypad:(id)a3;
- (UIVisualEffectView)backdropView;
- (double)iPadKeypadHeight;
- (void)layoutSubviews;
- (void)setBackdropView:(id)a3;
- (void)setIPadKeypadHeight:(double)a3;
- (void)setKeypad:(id)a3;
@end

@implementation DevicePINKeypadContainerView

- (DevicePINKeypadContainerView)initWithKeypad:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DevicePINKeypadContainerView;
  v6 = [(DevicePINKeypadContainerView *)&v18 init];
  if (v6)
  {
    if (PSUsePadStylePIN())
    {
      id v7 = objc_alloc(MEMORY[0x1E4F43028]);
      v8 = [MEMORY[0x1E4F427D8] effectWithStyle:1000];
      uint64_t v9 = [v7 initWithEffect:v8];
      backdropView = v6->_backdropView;
      v6->_backdropView = (UIVisualEffectView *)v9;

      v11 = [MEMORY[0x1E4F428B8] systemFillColor];
      v12 = [(UIVisualEffectView *)v6->_backdropView contentView];
      [v12 setBackgroundColor:v11];

      [(DevicePINKeypadContainerView *)v6 addSubview:v6->_backdropView];
      v6->_iPadKeypadHeight = 226.0;
    }
    p_keypad = &v6->_keypad;
    objc_storeStrong((id *)&v6->_keypad, a3);
    v14 = [MEMORY[0x1E4F42948] currentDevice];
    int v15 = objc_msgSend(v14, "sf_isiPad");

    if (v15)
    {
      v16 = [(UIVisualEffectView *)v6->_backdropView contentView];
      [v16 addSubview:*p_keypad];
    }
    else
    {
      [(DevicePINKeypadContainerView *)v6 addSubview:*p_keypad];
    }
  }

  return v6;
}

- (void)layoutSubviews
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)DevicePINKeypadContainerView;
  [(DevicePINKeypadContainerView *)&v38 layoutSubviews];
  [(DevicePINKeypadContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (PSUsePadStylePIN())
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v11 = [(DevicePINKeypad *)self->_keypad subviews];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v35;
      double v15 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v11);
          }
          v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          objc_super v18 = objc_msgSend(v17, "subviews", 0);
          uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v31 != v21) {
                  objc_enumerationMutation(v18);
                }
                [*(id *)(*((void *)&v30 + 1) + 8 * j) frame];
                double MaxY = CGRectGetMaxY(v42);
                if (v15 < MaxY) {
                  double v15 = MaxY;
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v39 count:16];
            }
            while (v20);
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v13);

      if (v15 >= 216.0 && v15 <= 228.0) {
        self->_iPadKeypadHeight = v15;
      }
    }
    else
    {
    }
    double v26 = PSRoundToPixel((self->_iPadKeypadHeight - v10) * 0.5);
    double v24 = v10 + PSRoundToPixel(v26 + v26);
    [(DevicePINKeypadContainerView *)self frame];
    double v25 = PSRoundToPixel(v27 - v24);
    double v28 = v26 + 1.0;
    double v29 = 0.0;
    if (v26 >= 0.0) {
      double v28 = -0.0;
    }
    else {
      double v29 = v26 + 1.0;
    }
    -[UIVisualEffectView setFrame:](self->_backdropView, "setFrame:", v4, v6 + v28, v8, v10 - v29);
  }
  else
  {
    double v24 = v10;
    double v25 = v6;
  }
  -[UIKeyboard setFrame:](self->_keypad, "setFrame:", v4, v25, v8, v24);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (PSUsePadStylePIN())
  {
    double v6 = 220.0;
    double v7 = 320.0;
  }
  else
  {
    -[DevicePINKeypad sizeThatFits:](self->_keypad, "sizeThatFits:", width, height);
  }
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (DevicePINKeypad)keypad
{
  return (DevicePINKeypad *)objc_getProperty(self, a2, 408, 1);
}

- (void)setKeypad:(id)a3
{
}

- (UIVisualEffectView)backdropView
{
  return (UIVisualEffectView *)objc_getProperty(self, a2, 416, 1);
}

- (void)setBackdropView:(id)a3
{
}

- (double)iPadKeypadHeight
{
  return self->_iPadKeypadHeight;
}

- (void)setIPadKeypadHeight:(double)a3
{
  self->_iPadKeypadHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_keypad, 0);
}

@end