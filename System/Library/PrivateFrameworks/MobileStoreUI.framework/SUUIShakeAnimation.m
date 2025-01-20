@interface SUUIShakeAnimation
- (SUUIShakeAnimation)initWithOptions:(id)a3;
- (void)animatePINInputControl:(id)a3;
- (void)animateView:(id)a3;
@end

@implementation SUUIShakeAnimation

- (SUUIShakeAnimation)initWithOptions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIShakeAnimation;
  v5 = [(SUUIShakeAnimation *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKey:0x270508D50];
    if (objc_opt_respondsToSelector()) {
      v5->_shouldErase = [v6 BOOLValue];
    }
    v7 = [v4 objectForKey:0x270508D70];

    if (objc_opt_respondsToSelector()) {
      char v8 = [v7 BOOLValue];
    }
    else {
      char v8 = 1;
    }
    v5->_shouldVibrate = v8;
  }
  return v5;
}

- (void)animatePINInputControl:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v6 = v4;
  if (self->_shouldErase)
  {
    [v4 setText:0];
    id v5 = v6;
  }
  [(SUUIShakeAnimation *)self animateView:v5];
}

- (void)animateView:(id)a3
{
  id v27 = [a3 layer];
  [v27 removeAllAnimations];
  id v4 = [MEMORY[0x263F15890] animationWithKeyPath:@"position.x"];
  [v4 setMass:1.20000005];
  [v4 setStiffness:1200.0];
  [v4 setDamping:12.0];
  LODWORD(v5) = 1028389654;
  LODWORD(v6) = 990057071;
  LODWORD(v7) = 1059712716;
  LODWORD(v8) = 1.0;
  v9 = [MEMORY[0x263F15808] functionWithControlPoints:v5 :v6 :v7 :v8];
  [v4 setTimingFunction:v9];

  [v4 setDuration:0.860000014];
  [v4 setVelocity:0.0];
  uint64_t v10 = *MEMORY[0x263F15AA0];
  [v4 setFillMode:*MEMORY[0x263F15AA0]];
  v11 = NSNumber;
  [v27 position];
  double v13 = v12 + 60.0;
  *(float *)&double v13 = v13;
  v14 = [v11 numberWithFloat:v13];
  [v4 setFromValue:v14];

  [v27 addAnimation:v4 forKey:@"position"];
  v15 = [MEMORY[0x263F15760] animationWithKeyPath:@"position.x"];
  LODWORD(v16) = 1036831949;
  LODWORD(v17) = 0.25;
  LODWORD(v18) = 0.25;
  LODWORD(v19) = 1.0;
  v20 = [MEMORY[0x263F15808] functionWithControlPoints:v17 :v16 :v18 :v19];
  [v15 setTimingFunction:v20];

  [v15 setDuration:0.0700000003];
  [v15 setFillMode:v10];
  v21 = NSNumber;
  [v27 position];
  double v23 = v22 + -60.0;
  *(float *)&double v23 = v23;
  v24 = [v21 numberWithFloat:v23];
  [v15 setFromValue:v24];

  [v27 addAnimation:v15 forKey:@"force"];
  if (self->_shouldVibrate)
  {
    v25 = (void *)SUUIAudioToolboxFramework();
    v26 = (void (*)(uint64_t))SUUIWeakLinkedSymbolForString("AudioServicesPlaySystemSound", v25);
    if (v26) {
      v26(4095);
    }
  }
}

@end