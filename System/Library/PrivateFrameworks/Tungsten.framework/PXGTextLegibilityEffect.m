@interface PXGTextLegibilityEffect
- (PXGTextLegibilityEffect)initWithEntityManager:(id)a3;
- (UIColor)tintColor;
- (double)alpha;
- (double)strength;
- (id)shader;
- (void)_updateValues;
- (void)setAlpha:(double)a3;
- (void)setStrength:(double)a3;
- (void)setTintColor:(id)a3;
@end

@implementation PXGTextLegibilityEffect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_shader, 0);
}

- (void)setTintColor:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (double)strength
{
  return self->_strength;
}

- (double)alpha
{
  return self->_alpha;
}

- (id)shader
{
  return self->_shader;
}

- (void)_updateValues
{
  [(PXGTextLegibilityEffect *)self strength];
  float64_t v8 = v3;
  [(PXGTextLegibilityEffect *)self alpha];
  v4.f64[0] = v8;
  v4.f64[1] = v5;
  double v6 = COERCE_DOUBLE(vcvt_f32_f64(v4));
  values = self->_values;

  [(PXGUniform *)values setFloat2Value:v6];
}

- (void)setStrength:(double)a3
{
  if (self->_strength != a3)
  {
    self->_strength = a3;
    [(PXGTextLegibilityEffect *)self _updateValues];
  }
}

- (void)setAlpha:(double)a3
{
  if (self->_alpha != a3)
  {
    self->_alpha = a3;
    [(PXGTextLegibilityEffect *)self _updateValues];
  }
}

- (PXGTextLegibilityEffect)initWithEntityManager:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)PXGTextLegibilityEffect;
  float64x2_t v4 = [(PXGEffect *)&v18 initWithEntityManager:a3];
  if (v4)
  {
    double v6 = +[PXTungstenSettings sharedInstance];
    unint64_t v7 = [v6 textLegibilityDimmingType];

    if (v7 >= 3)
    {
      v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2, v4, @"PXGTextLegibilityEffect.m", 44, @"Invalid parameter not satisfying: %@", @"opcode != PXGFragmentColorOpcodeNil" object file lineNumber description];

      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = (v7 << 32) + 0x300000000;
    }
    v10 = [[PXGUniform alloc] initWithName:@"values" type:1];
    values = v4->_values;
    v4->_values = v10;

    v12 = [PXGShader alloc];
    v19[0] = v4->_values;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
    uint64_t v14 = -[PXGShader initWithOpcodes:source:uniforms:components:](v12, "initWithOpcodes:source:uniforms:components:", v8, 0, 0, v13, 0);
    shader = v4->_shader;
    v4->_shader = (PXGShader *)v14;

    v4->_alpha = 1.0;
    v16 = +[PXTungstenSettings sharedInstance];
    [v16 textLegibilityDimmingStrength];
    v4->_strength = v17;

    [(PXGTextLegibilityEffect *)v4 _updateValues];
  }
  return v4;
}

@end