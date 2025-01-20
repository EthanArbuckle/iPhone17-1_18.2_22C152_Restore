@interface SBCrossfadeView
+ (id)crossfadeViewWithStartView:(id)a3 endView:(id)a4 translucent:(BOOL)a5;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)adaptsAnimationFactoryTimingFunction;
- (BOOL)allowsGroupOpacityDuringCrossfade;
- (BSUIAnimationFactory)animationFactory;
- (id)_initWithStartView:(id)a3 endView:(id)a4 translucent:(BOOL)a5;
- (void)crossfadeWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)setAdaptsAnimationFactoryTimingFunction:(BOOL)a3;
- (void)setAllowsGroupOpacityDuringCrossfade:(BOOL)a3;
- (void)setAnimationFactory:(id)a3;
@end

@implementation SBCrossfadeView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endView, 0);
  objc_storeStrong((id *)&self->_startView, 0);

  objc_storeStrong((id *)&self->_animationFactory, 0);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBCrossfadeView;
  [(SBCrossfadeView *)&v5 layoutSubviews];
  startView = self->_startView;
  [(SBCrossfadeView *)self bounds];
  -[UIView setFrame:](startView, "setFrame:");
  endView = self->_endView;
  [(SBCrossfadeView *)self bounds];
  -[UIView setFrame:](endView, "setFrame:");
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"zPosition"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBCrossfadeView;
    BOOL v5 = [(SBCrossfadeView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)setAnimationFactory:(id)a3
{
}

+ (id)crossfadeViewWithStartView:(id)a3 endView:(id)a4 translucent:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) _initWithStartView:v9 endView:v8 translucent:v5];

  return v10;
}

void *__43__SBCrossfadeView_crossfadeWithCompletion___block_invoke(void *result)
{
  if ((uint64_t)--*(void *)(*(void *)(result[6] + 8) + 24) <= 0)
  {
    v1 = result;
    v2 = [*(id *)(result[4] + 416) layer];
    [v2 setAllowsHitTesting:*((unsigned __int8 *)v1 + 56)];

    [*(id *)(v1[4] + 416) setUserInteractionEnabled:*((unsigned __int8 *)v1 + 57)];
    result = (void *)v1[5];
    if (result)
    {
      v3 = (uint64_t (*)(void))result[2];
      return (void *)v3();
    }
  }
  return result;
}

- (void)crossfadeWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_crossfaded)
  {
    self->_crossfaded = 1;
    BOOL v5 = [(UIView *)self->_startView isUserInteractionEnabled];
    v6 = [(UIView *)self->_startView layer];
    char v7 = [v6 allowsHitTesting];

    id v8 = [(UIView *)self->_startView layer];
    [v8 setAllowsHitTesting:0];

    [(UIView *)self->_startView setUserInteractionEnabled:0];
    [(UIView *)self->_endView setHidden:0];
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v41 = 1;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke;
    v33[3] = &unk_2645D43D0;
    v35 = &v38;
    v33[4] = self;
    char v36 = v7;
    BOOL v37 = v5;
    id v34 = v4;
    id v9 = (void *)MEMORY[0x223C8BC20](v33);
    v10 = [(SBCrossfadeView *)self animationFactory];
    if (self->_translucent)
    {
      ++v39[3];
      BOOL v11 = [(SBCrossfadeView *)self allowsGroupOpacityDuringCrossfade];
      v12 = [(UIView *)self->_endView layer];
      [v12 setAllowsGroupOpacity:v11];

      v13 = [(UIView *)self->_startView layer];
      [v13 setAllowsGroupOpacity:v11];

      BOOL v14 = [(SBCrossfadeView *)self adaptsAnimationFactoryTimingFunction];
      if (v14)
      {
        LODWORD(v15) = 0.25;
        LODWORD(v16) = 0.75;
        LODWORD(v17) = 0.25;
        LODWORD(v18) = 0.75;
        v19 = [MEMORY[0x263F15808] functionWithControlPoints:v15 :v16 :v17 :v18];
        uint64_t v20 = [v10 factoryWithTimingFunction:v19];

        v10 = (void *)v20;
      }
      v21 = (void *)MEMORY[0x263F29D20];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_2;
      v32[3] = &unk_2645D3CD0;
      v32[4] = self;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_3;
      v30[3] = &unk_2645D43F8;
      v30[4] = self;
      id v31 = v9;
      [v21 animateWithFactory:v10 options:2 actions:v32 completion:v30];
      if (v14)
      {
        LODWORD(v22) = 0.75;
        LODWORD(v23) = 0.25;
        LODWORD(v24) = 0.75;
        LODWORD(v25) = 0.25;
        v26 = [MEMORY[0x263F15808] functionWithControlPoints:v22 :v23 :v24 :v25];
        uint64_t v27 = [v10 factoryWithTimingFunction:v26];

        v10 = (void *)v27;
      }
    }
    else
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_4;
      v29[3] = &unk_2645D3CD0;
      v29[4] = self;
      [MEMORY[0x263F1CB60] performWithoutAnimation:v29];
    }
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_5;
    v28[3] = &unk_2645D3CD0;
    v28[4] = self;
    [MEMORY[0x263F29D20] animateWithFactory:v10 options:2 actions:v28 completion:v9];

    _Block_object_dispose(&v38, 8);
  }
}

- (BSUIAnimationFactory)animationFactory
{
  return self->_animationFactory;
}

- (id)_initWithStartView:(id)a3 endView:(id)a4 translucent:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  [v9 frame];
  v18.receiver = self;
  v18.super_class = (Class)SBCrossfadeView;
  BOOL v11 = -[SBCrossfadeView initWithFrame:](&v18, sel_initWithFrame_);
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x263F29D20] factoryWithDuration:0.35];
    animationFactory = v11->_animationFactory;
    v11->_animationFactory = (BSUIAnimationFactory *)v12;

    objc_storeStrong((id *)&v11->_startView, a3);
    objc_storeStrong((id *)&v11->_endView, a4);
    v11->_translucent = a5;
    v11->_allowsGroupOpacityDuringCrossfade = 1;
    v11->_adaptsAnimationFactoryTimingFunction = 1;
    [(SBCrossfadeView *)v11 addSubview:v11->_endView];
    [(SBCrossfadeView *)v11 addSubview:v11->_startView];
    BOOL v14 = (void *)MEMORY[0x263F1CB60];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __58__SBCrossfadeView__initWithStartView_endView_translucent___block_invoke;
    v16[3] = &unk_2645D3CD0;
    double v17 = v11;
    [v14 performWithoutAnimation:v16];
  }
  return v11;
}

uint64_t __58__SBCrossfadeView__initWithStartView_endView_translucent___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
}

uint64_t __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
}

uint64_t __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:1.0];
}

uint64_t __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:1.0];
}

uint64_t __43__SBCrossfadeView_crossfadeWithCompletion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 424) layer];
  [v2 setAllowsGroupOpacity:0];

  v3 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
  [v3 setAllowsGroupOpacity:0];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (BOOL)allowsGroupOpacityDuringCrossfade
{
  return self->_allowsGroupOpacityDuringCrossfade;
}

- (void)setAllowsGroupOpacityDuringCrossfade:(BOOL)a3
{
  self->_allowsGroupOpacityDuringCrossfade = a3;
}

- (BOOL)adaptsAnimationFactoryTimingFunction
{
  return self->_adaptsAnimationFactoryTimingFunction;
}

- (void)setAdaptsAnimationFactoryTimingFunction:(BOOL)a3
{
  self->_adaptsAnimationFactoryTimingFunction = a3;
}

@end