@interface TVRUIPagingButton
- (BOOL)isEnabled;
- (TVRUIButton)bottomButton;
- (TVRUIButton)topButton;
- (TVRUIPagingButton)initWithTitle:(id)a3 styleProvider:(id)a4;
- (TVRUIStyleProvider)styleProvider;
- (UILabel)titleLabel;
- (_TVRUIEventDelegate)buttonEventDelegate;
- (void)_buttonPressed:(id)a3;
- (void)_buttonReleased:(id)a3;
- (void)_darkenSystemColorsChanged:(id)a3;
- (void)setBottomButton:(id)a3;
- (void)setButtonEventDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopButton:(id)a3;
@end

@implementation TVRUIPagingButton

- (TVRUIPagingButton)initWithTitle:(id)a3 styleProvider:(id)a4
{
  v58[10] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v57.receiver = self;
  v57.super_class = (Class)TVRUIPagingButton;
  v8 = -[TVRUIPagingButton initWithFrame:](&v57, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v8)
  {
    v9 = [v7 buttonBackgroundColor];
    [(TVRUIPagingButton *)v8 setBackgroundColor:v9];

    [v7 secondaryButtonSize];
    double v11 = v10 * 0.5;
    v12 = [(TVRUIPagingButton *)v8 layer];
    [v12 setCornerRadius:v11];

    v13 = [[TVRUIButton alloc] initWithType:26 hasTapAction:0];
    topButton = v8->_topButton;
    v8->_topButton = v13;

    [(TVRUIButton *)v8->_topButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TVRUIPagingButton *)v8 addSubview:v8->_topButton];
    v15 = [[TVRUIButton alloc] initWithType:27 hasTapAction:0];
    bottomButton = v8->_bottomButton;
    v8->_bottomButton = v15;

    [(TVRUIButton *)v8->_bottomButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TVRUIPagingButton *)v8 addSubview:v8->_bottomButton];
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v17;

    [(UILabel *)v8->_titleLabel setText:v6];
    v19 = [v7 buttonTextColor];
    [(UILabel *)v8->_titleLabel setTextColor:v19];

    v20 = [v7 pagingButtonFont];
    [(UILabel *)v8->_titleLabel setFont:v20];

    [(UILabel *)v8->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v8->_titleLabel setTextAlignment:1];
    [(UILabel *)v8->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(TVRUIPagingButton *)v8 addSubview:v8->_titleLabel];
    v42 = (void *)MEMORY[0x263F08938];
    v54 = [(TVRUIButton *)v8->_topButton topAnchor];
    v53 = [(TVRUIPagingButton *)v8 topAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v58[0] = v52;
    v51 = [(TVRUIButton *)v8->_topButton centerXAnchor];
    v50 = [(TVRUIPagingButton *)v8 centerXAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v58[1] = v49;
    v48 = [(TVRUIButton *)v8->_topButton widthAnchor];
    v47 = [(TVRUIPagingButton *)v8 widthAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v58[2] = v46;
    v45 = [(TVRUIButton *)v8->_topButton heightAnchor];
    v44 = [(TVRUIButton *)v8->_topButton widthAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v58[3] = v43;
    v41 = [(UILabel *)v8->_titleLabel centerXAnchor];
    v40 = [(TVRUIPagingButton *)v8 centerXAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v58[4] = v39;
    v38 = [(UILabel *)v8->_titleLabel centerYAnchor];
    v37 = [(TVRUIPagingButton *)v8 centerYAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v58[5] = v36;
    v35 = [(TVRUIButton *)v8->_bottomButton bottomAnchor];
    v34 = [(TVRUIPagingButton *)v8 bottomAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v58[6] = v33;
    v32 = [(TVRUIButton *)v8->_bottomButton centerXAnchor];
    v31 = [(TVRUIPagingButton *)v8 centerXAnchor];
    v21 = [v32 constraintEqualToAnchor:v31];
    v58[7] = v21;
    v22 = [(TVRUIButton *)v8->_bottomButton heightAnchor];
    [(TVRUIButton *)v8->_topButton heightAnchor];
    v23 = id v56 = v6;
    [v22 constraintEqualToAnchor:v23];
    v24 = id v55 = v7;
    v58[8] = v24;
    v25 = [(TVRUIButton *)v8->_bottomButton widthAnchor];
    v26 = [(TVRUIButton *)v8->_topButton widthAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v58[9] = v27;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:10];
    [v42 activateConstraints:v28];

    id v7 = v55;
    id v6 = v56;

    [(TVRUIButton *)v8->_topButton addTarget:v8 action:sel__buttonPressed_ forControlEvents:1];
    [(TVRUIButton *)v8->_topButton addTarget:v8 action:sel__buttonReleased_ forControlEvents:448];
    [(TVRUIButton *)v8->_bottomButton addTarget:v8 action:sel__buttonPressed_ forControlEvents:1];
    [(TVRUIButton *)v8->_bottomButton addTarget:v8 action:sel__buttonReleased_ forControlEvents:448];
    [(TVRUIPagingButton *)v8 setStyleProvider:v55];
    v29 = [MEMORY[0x263F08A00] defaultCenter];
    [v29 addObserver:v8 selector:sel__darkenSystemColorsChanged_ name:*MEMORY[0x263F831A0] object:0];
  }
  return v8;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enabled = a3;
  -[TVRUIPagingButton setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  double v5 = 1.0;
  if (!self->_enabled)
  {
    id v6 = [(TVRUIPagingButton *)self styleProvider];
    [v6 disabledButtonAlpha];
    double v5 = v7;
  }
  v8 = [(TVRUIPagingButton *)self topButton];
  [v8 setEnabled:v3];

  v9 = [(TVRUIPagingButton *)self topButton];
  [v9 setAlpha:v5];

  double v10 = [(TVRUIPagingButton *)self bottomButton];
  [v10 setEnabled:v3];

  double v11 = [(TVRUIPagingButton *)self bottomButton];
  [v11 setAlpha:v5];

  v12 = [(TVRUIPagingButton *)self styleProvider];
  v13 = v12;
  if (v3) {
    [v12 buttonTextColor];
  }
  else {
  v14 = [v12 tintColorForButtonDisabled];
  }
  v15 = [(TVRUIPagingButton *)self titleLabel];
  [v15 setTextColor:v14];

  [(TVRUIPagingButton *)self setAlpha:v5];
}

- (void)_darkenSystemColorsChanged:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[TVRUIPagingButton _darkenSystemColorsChanged:]";
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  double v5 = [(TVRUIPagingButton *)self styleProvider];
  id v6 = [v5 buttonBackgroundColor];
  [(TVRUIPagingButton *)self setBackgroundColor:v6];
}

- (void)_buttonPressed:(id)a3
{
  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, [a3 buttonType]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(TVRUIPagingButton *)self buttonEventDelegate];
  if (v4)
  {
    double v5 = (void *)v4;
    id v6 = [(TVRUIPagingButton *)self buttonEventDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(TVRUIPagingButton *)self buttonEventDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (void)_buttonReleased:(id)a3
{
  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, [a3 buttonType]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(TVRUIPagingButton *)self buttonEventDelegate];
  if (v4)
  {
    double v5 = (void *)v4;
    id v6 = [(TVRUIPagingButton *)self buttonEventDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(TVRUIPagingButton *)self buttonEventDelegate];
      [v8 generatedButtonEvent:v9];
    }
  }
}

- (_TVRUIEventDelegate)buttonEventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonEventDelegate);
  return (_TVRUIEventDelegate *)WeakRetained;
}

- (void)setButtonEventDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (TVRUIButton)topButton
{
  return self->_topButton;
}

- (void)setTopButton:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (TVRUIButton)bottomButton
{
  return self->_bottomButton;
}

- (void)setBottomButton:(id)a3
{
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_bottomButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_topButton, 0);
  objc_destroyWeak((id *)&self->_buttonEventDelegate);
}

@end