@interface SPUIHeaderBlurView
- (BOOL)keyboardIsUp;
- (BOOL)useInPlaceFilteredBlur;
- (SPUIHeaderBlurView)init;
- (void)keyboardWillHide;
- (void)keyboardWillShow;
- (void)setKeyboardIsUp:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setUseInPlaceFilteredBlur:(BOOL)a3;
- (void)updateEffect;
@end

@implementation SPUIHeaderBlurView

- (void)keyboardWillShow
{
}

- (SPUIHeaderBlurView)init
{
  v8.receiver = self;
  v8.super_class = (Class)SPUIHeaderBlurView;
  v2 = [(SPUIHeaderBlurView *)&v8 init];
  if (v2)
  {
    if ([MEMORY[0x263F79140] bottomSearchFieldEnabled])
    {
      v3 = [MEMORY[0x263F08A00] defaultCenter];
      [v3 addObserver:v2 selector:sel_keyboardWillShow name:*MEMORY[0x263F83808] object:0];

      v4 = [MEMORY[0x263F08A00] defaultCenter];
      [v4 addObserver:v2 selector:sel_keyboardWillHide name:*MEMORY[0x263F83800] object:0];

      v5 = [MEMORY[0x263F08A00] defaultCenter];
      [v5 addObserver:v2 selector:sel_updateEffect name:*MEMORY[0x263F831F8] object:0];

      [(SPUIHeaderBlurView *)v2 setKeyboardIsUp:1];
    }
    else
    {
      [(SPUIHeaderBlurView *)v2 updateEffect];
    }
    v6 = [(SPUIHeaderBlurView *)v2 contentView];
    [v6 setAlpha:1.0];
  }
  return v2;
}

- (void)setKeyboardIsUp:(BOOL)a3
{
  if (self->_keyboardIsUp != a3)
  {
    self->_keyboardIsUp = a3;
    [(SPUIHeaderBlurView *)self updateEffect];
  }
}

- (void)updateEffect
{
  v20[1] = *MEMORY[0x263EF8340];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v3 = (void *)MEMORY[0x263F825D8];
    v4 = [MEMORY[0x263F825C8] darkGrayColor];
    v5 = [v3 colorEffectColor:v4];
    v20[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    [(SPUIHeaderBlurView *)self setBackgroundEffects:v6];

    v7 = self;
    objc_super v8 = 0;
  }
  else
  {
    if ([MEMORY[0x263F79140] bottomSearchFieldEnabled])
    {
      v9 = objc_opt_new();
      v10 = [MEMORY[0x263F824D8] _effectWithBlurRadius:30.0 scale:0.1];
      [v9 addObject:v10];

      v11 = [MEMORY[0x263F825D8] colorEffectSaturate:1.6];
      v19[0] = v11;
      v12 = [MEMORY[0x263F825D8] colorEffectBrightness:0.15];
      v19[1] = v12;
      v13 = [MEMORY[0x263F825D8] colorEffectLuminanceCurveMap:&unk_26F10BCE8 blendingAmount:0.5];
      v19[2] = v13;
      v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];
      [v9 addObjectsFromArray:v14];

      [(SPUIHeaderBlurView *)self setBackgroundEffects:v9];
      return;
    }
    v15 = [MEMORY[0x263F824D8] effectWithBlurRadius:22.5];
    v18[0] = v15;
    v16 = [MEMORY[0x263F825D8] colorEffectSaturate:1.3];
    v18[1] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    [(SPUIHeaderBlurView *)self setBackgroundEffects:v17];

    objc_super v8 = @"SPUIHeaderBlurView";
    v7 = self;
  }
  [(SPUIHeaderBlurView *)v7 _setGroupName:v8];
}

- (void)keyboardWillHide
{
}

- (void)setUseInPlaceFilteredBlur:(BOOL)a3
{
  if (self->_useInPlaceFilteredBlur != a3)
  {
    self->_useInPlaceFilteredBlur = a3;
    [(SPUIHeaderBlurView *)self updateEffect];
  }
}

- (void)setTintColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SPUIHeaderBlurView;
  [(SPUIHeaderBlurView *)&v4 setTintColor:a3];
  [(SPUIHeaderBlurView *)self updateEffect];
}

- (BOOL)useInPlaceFilteredBlur
{
  return self->_useInPlaceFilteredBlur;
}

- (BOOL)keyboardIsUp
{
  return self->_keyboardIsUp;
}

@end