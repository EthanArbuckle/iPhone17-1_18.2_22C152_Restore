@interface UIKeyboardDicationBackgroundGradientView
- (CGRect)_backgroundFillFrame;
- (UIDictationView)dictationView;
- (UIKBRenderConfig)renderConfig;
- (UIKeyboardDicationBackgroundGradientView)initWithFrame:(CGRect)a3;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_timingFunctionForAnimation;
- (id)backgroundColorForCurrentRenderConfig;
- (void)layoutSubviews;
- (void)setDictationView:(id)a3;
- (void)setRenderConfig:(id)a3;
- (void)startColorTransitionIn;
- (void)startColorTransitionOut;
@end

@implementation UIKeyboardDicationBackgroundGradientView

- (UIKeyboardDicationBackgroundGradientView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardDicationBackgroundGradientView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(UIView *)v3 setBackgroundColor:v4];

    v5 = v3;
  }

  return v3;
}

- (id)backgroundColorForCurrentRenderConfig
{
  return +[UIColor colorWithRed:0.447058824 green:0.482352941 blue:0.529411765 alpha:0.48];
}

- (void)startColorTransitionIn
{
  v3 = [(UIKeyboardDicationBackgroundGradientView *)self renderConfig];
  int v4 = [v3 lightKeyboard];

  if (v4)
  {
    v5 = UIKBGetNamedColor(@"UIKBColorLightBackdropTint");
    id v6 = [(UIView *)self layer];
    [v6 setBackgroundColor:v5];
  }
  else
  {
    id v6 = +[UIColor clearColor];
    uint64_t v7 = [v6 CGColor];
    v8 = [(UIView *)self layer];
    [v8 setBackgroundColor:v7];
  }
  v9 = [(UIView *)self layer];
  [v9 setNeedsDisplay];

  v10 = +[UIDictationLandingViewSettings sharedInstance];
  [v10 colorTransitionInDuration];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__UIKeyboardDicationBackgroundGradientView_startColorTransitionIn__block_invoke;
  v11[3] = &unk_1E52D9F70;
  v11[4] = self;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, self, v11, &__block_literal_global_339);
}

void __66__UIKeyboardDicationBackgroundGradientView_startColorTransitionIn__block_invoke(uint64_t a1)
{
  v2 = UIKBGetNamedColor(@"UIKBColoriPhoneDictationBackboard");
  id v3 = [*(id *)(a1 + 32) layer];
  [v3 setBackgroundColor:v2];
}

- (void)startColorTransitionOut
{
  id v3 = UIKBGetNamedColor(@"UIKBColoriPhoneDictationBackboard");
  int v4 = [(UIView *)self layer];
  [v4 setBackgroundColor:v3];

  v5 = [(UIView *)self layer];
  [v5 setNeedsDisplay];

  id v6 = [(UIKeyboardDicationBackgroundGradientView *)self renderConfig];
  LODWORD(v4) = [v6 lightKeyboard];

  if (v4)
  {
    uint64_t v7 = UIKBGetNamedColor(@"UIKBColorLightBackdropTint");
  }
  else
  {
    id v8 = +[UIColor clearColor];
    uint64_t v7 = (void *)[v8 CGColor];
  }
  v9 = +[UIKeyboardInputMode dictationInputMode];
  char v10 = [v9 usingTypeAndTalk] ^ 1;

  v11 = +[UIDictationLandingViewSettings sharedInstance];
  [v11 colorTransitionOutDuration];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__UIKeyboardDicationBackgroundGradientView_startColorTransitionOut__block_invoke;
  v14[3] = &unk_1E52D9CD0;
  v14[4] = self;
  v14[5] = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__UIKeyboardDicationBackgroundGradientView_startColorTransitionOut__block_invoke_2;
  v12[3] = &unk_1E52E0478;
  char v13 = v10;
  v12[4] = self;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, self, v14, v12);
}

void __67__UIKeyboardDicationBackgroundGradientView_startColorTransitionOut__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) layer];
  [v2 setBackgroundColor:v1];
}

void __67__UIKeyboardDicationBackgroundGradientView_startColorTransitionOut__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v1 = [*(id *)(a1 + 32) dictationView];
    [v1 finishReturnToKeyboard];
  }
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return (id)[MEMORY[0x1E4F39B48] animationWithKeyPath:a4];
}

- (id)_timingFunctionForAnimation
{
  return (id)[MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
}

- (CGRect)_backgroundFillFrame
{
  unint64_t v3 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  [(UIView *)self bounds];
  if (v3 == 1)
  {
    double v4 = v4 + 12.0;
    double v5 = v5 + 17.0;
    double v6 = v6 + -24.0;
    double v7 = v7 + -34.0;
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardDicationBackgroundGradientView;
  [(UIView *)&v4 layoutSubviews];
  unint64_t v3 = [(UIView *)self superview];
  [v3 bounds];
  -[UIView setBounds:](self, "setBounds:");

  [(UIView *)self setNeedsDisplay];
}

- (void)setRenderConfig:(id)a3
{
  double v5 = (UIKBRenderConfig *)a3;
  if (self->_renderConfig != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_renderConfig, a3);
    [(UIView *)self setNeedsLayout];
    double v5 = v6;
  }
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (UIDictationView)dictationView
{
  return self->_dictationView;
}

- (void)setDictationView:(id)a3
{
  self->_dictationView = (UIDictationView *)a3;
}

- (void).cxx_destruct
{
}

@end