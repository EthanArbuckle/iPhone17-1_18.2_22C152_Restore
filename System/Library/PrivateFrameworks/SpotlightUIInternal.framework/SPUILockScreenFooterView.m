@interface SPUILockScreenFooterView
- (SPUILockScreenFooterView)init;
- (TLKTextButton)unlockScreenButton;
- (void)setUnlockScreenButton:(id)a3;
- (void)unlockButtonPressed:(id)a3;
- (void)updateTitle;
@end

@implementation SPUILockScreenFooterView

- (SPUILockScreenFooterView)init
{
  v13[1] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v13[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  v12.receiver = self;
  v12.super_class = (Class)SPUILockScreenFooterView;
  v5 = [(NUIContainerBoxView *)&v12 initWithArrangedSubviews:v4];

  if (v5)
  {
    [v3 setProminence:2];
    v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [v3 setFont:v6];

    v7 = [v3 titleLabel];
    [v7 setAdjustsFontForContentSizeCategory:1];

    v8 = [v3 titleLabel];
    [v8 setNumberOfLines:2];

    v9 = [v3 titleLabel];
    [v9 setTextAlignment:1];

    [v3 addTarget:v5 action:sel_unlockButtonPressed_];
    objc_msgSend(v3, "setMinimumLayoutSize:", 44.0, 44.0);
    [(SPUILockScreenFooterView *)v5 setUnlockScreenButton:v3];
    [(SPUILockScreenFooterView *)v5 setLayoutMarginsRelativeArrangement:1];
    -[SPUILockScreenFooterView setLayoutMargins:](v5, "setLayoutMargins:", 16.0, 24.0, 16.0, 24.0);
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v5 selector:sel_updateTitle name:*MEMORY[0x263F83428] object:0];

    [(SPUILockScreenFooterView *)v5 updateTitle];
  }

  return v5;
}

- (void)unlockButtonPressed:(id)a3
{
}

- (void)updateTitle
{
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v5 localizedStringForKey:@"LOCK_SCREEN_TEXT" value:&stru_26F104E28 table:0];
  v4 = [(SPUILockScreenFooterView *)self unlockScreenButton];
  [v4 setTitle:v3];
}

- (TLKTextButton)unlockScreenButton
{
  return (TLKTextButton *)objc_getProperty(self, a2, 664, 1);
}

- (void)setUnlockScreenButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end