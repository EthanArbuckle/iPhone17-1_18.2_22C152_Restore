@interface SBFSpringLoadedInteractionEffect
- (BOOL)useFastBlinkAnimation;
- (SBFSpringLoadedInteractionEffect)init;
- (SBFSpringLoadedInteractionEffectDelegate)delegate;
- (id)fastBlinkAnimation;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setUseFastBlinkAnimation:(BOOL)a3;
@end

@implementation SBFSpringLoadedInteractionEffect

- (void)setDelegate:(id)a3
{
}

- (SBFSpringLoadedInteractionEffect)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBFSpringLoadedInteractionEffect;
  v2 = [(SBFSpringLoadedInteractionEffect *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_useFastBlinkAnimation = 0;
    uint64_t v4 = [MEMORY[0x1E4F42E10] _blinkEffect];
    blinkEffect = v3->_blinkEffect;
    v3->_blinkEffect = (UISpringLoadedInteractionEffect *)v4;
  }
  return v3;
}

- (void)setUseFastBlinkAnimation:(BOOL)a3
{
  self->_useFastBlinkAnimation = a3;
  if (a3)
  {
    self->_blinkEffect = 0;
  }
  else
  {
    self->_blinkEffect = [MEMORY[0x1E4F42E10] _blinkEffect];
  }
  MEMORY[0x1F41817F8]();
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_super v7 = [v6 targetItem];
  if (v7) {
    [v6 targetItem];
  }
  else {
  v8 = [v14 view];
  }

  v9 = [(SBFSpringLoadedInteractionEffect *)self delegate];
  v10 = [v9 targetViewForSpringLoadingEffectForView:v8];

  [v6 setTargetView:v10];
  if (![(SBFSpringLoadedInteractionEffect *)self useFastBlinkAnimation])
  {
    [(UISpringLoadedInteractionEffect *)self->_blinkEffect interaction:v14 didChangeWithContext:v6];
    goto LABEL_12;
  }
  v11 = [v10 layer];
  uint64_t v12 = [v6 state];
  switch(v12)
  {
    case 3:
      goto LABEL_8;
    case 2:
      v13 = [(SBFSpringLoadedInteractionEffect *)self fastBlinkAnimation];
      [v11 addAnimation:v13 forKey:@"fastBlinkingAnimation"];

      break;
    case 0:
LABEL_8:
      [v11 removeAnimationForKey:@"fastBlinkingAnimation"];
      break;
  }

LABEL_12:
}

- (id)fastBlinkAnimation
{
  v2 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  [v2 setToValue:&unk_1ED89EC38];
  [v2 setDuration:0.1];
  [v2 setAutoreverses:1];
  LODWORD(v3) = 2.0;
  [v2 setRepeatCount:v3];
  return v2;
}

- (BOOL)useFastBlinkAnimation
{
  return self->_useFastBlinkAnimation;
}

- (SBFSpringLoadedInteractionEffectDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFSpringLoadedInteractionEffectDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blinkEffect, 0);
}

@end