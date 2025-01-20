@interface PVEffectComponent
- (PVEffect)effect;
- (PVEffectComponent)initWithEffect:(id)a3;
- (void)setEffect:(id)a3;
@end

@implementation PVEffectComponent

- (PVEffectComponent)initWithEffect:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PVEffectComponent;
  v5 = [(PVEffectComponent *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PVEffectComponent *)v5 setEffect:v4];
  }

  return v6;
}

- (PVEffect)effect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_effect);

  return (PVEffect *)WeakRetained;
}

- (void)setEffect:(id)a3
{
}

- (void).cxx_destruct
{
}

@end