@interface SiriUIHelpButton
+ (SiriUIHelpButton)buttonWithHelpImageMask;
- (double)_targetAlpha;
- (void)pulse;
- (void)setEmphasized:(BOOL)a3;
@end

@implementation SiriUIHelpButton

+ (SiriUIHelpButton)buttonWithHelpImageMask
{
  v3 = [MEMORY[0x263F285A0] sharedPreferences];
  v4 = [v3 languageCode];
  char v5 = [v4 hasPrefix:@"he"];

  v6 = (void *)MEMORY[0x263F1C6B0];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v6 imageNamed:@"helpglyph" inBundle:v7];

  if ((v5 & 1) == 0 && SiriLanguageIsRTL())
  {
    uint64_t v9 = [v8 imageWithHorizontallyFlippedOrientation];

    v8 = (void *)v9;
  }
  v10 = [a1 buttonWithImageMask:v8 style:0];

  return (SiriUIHelpButton *)v10;
}

- (void)setEmphasized:(BOOL)a3
{
  if (self->_emphasized != a3)
  {
    self->_emphasized = a3;
    if (([(SiriUIHelpButton *)self isHighlighted] & 1) == 0)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __34__SiriUIHelpButton_setEmphasized___block_invoke;
      v5[3] = &unk_26469EFA8;
      v5[4] = self;
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __34__SiriUIHelpButton_setEmphasized___block_invoke_2;
      v4[3] = &unk_26469F020;
      v4[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:2 delay:v5 options:v4 animations:0.6 completion:0.0];
    }
  }
}

uint64_t __34__SiriUIHelpButton_setEmphasized___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 _targetAlpha];
  return objc_msgSend(v1, "setAlpha:");
}

uint64_t __34__SiriUIHelpButton_setEmphasized___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 816) = 0;
  return result;
}

- (void)pulse
{
  if (!self->_animatingEmphasis && ([(SiriUIHelpButton *)self isHighlighted] & 1) == 0)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __25__SiriUIHelpButton_pulse__block_invoke;
    v4[3] = &unk_26469EFA8;
    v4[4] = self;
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __25__SiriUIHelpButton_pulse__block_invoke_2;
    v3[3] = &unk_26469F020;
    v3[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:2 delay:v4 options:v3 animations:0.6 completion:0.0];
  }
}

uint64_t __25__SiriUIHelpButton_pulse__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.4];
}

uint64_t __25__SiriUIHelpButton_pulse__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __25__SiriUIHelpButton_pulse__block_invoke_3;
  v2[3] = &unk_26469EFA8;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F1CB60] animateWithDuration:2 delay:v2 options:0 animations:0.6 completion:0.0];
}

uint64_t __25__SiriUIHelpButton_pulse__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 _targetAlpha];
  return objc_msgSend(v1, "setAlpha:");
}

- (double)_targetAlpha
{
  if (self->_emphasized) {
    [MEMORY[0x263F1C550] whiteColor];
  }
  else {
  v2 = objc_msgSend(MEMORY[0x263F1C550], "siriui_maskingColor");
  }
  uint64_t v5 = 0x3FF0000000000000;
  uint64_t v6 = 0x3FF0000000000000;
  [v2 getWhite:&v5 alpha:&v6];
  double v3 = *(double *)&v6;

  return v3;
}

@end