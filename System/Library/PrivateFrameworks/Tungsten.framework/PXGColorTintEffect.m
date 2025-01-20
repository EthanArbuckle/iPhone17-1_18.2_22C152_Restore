@interface PXGColorTintEffect
- (PXGColorTintEffect)initWithEntityManager:(id)a3;
- (UIColor)tintColor;
- (id)shader;
- (void)setTintColor:(id)a3;
@end

@implementation PXGColorTintEffect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_tintColorUniform, 0);

  objc_storeStrong((id *)&self->_shader, 0);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (id)shader
{
  return self->_shader;
}

- (void)setTintColor:(id)a3
{
  v5 = (PXGUniform *)a3;
  v6 = self->_tintColorUniform;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(PXGUniform *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_tintColor, a3);
      float64_t v13 = 0.0;
      float64_t v14 = 0.0;
      float64_t v11 = 0.0;
      float64_t v12 = 0.0;
      [(PXGUniform *)v5 getRed:&v14 green:&v13 blue:&v12 alpha:&v11];
      v9.f64[0] = v14;
      v10.f64[0] = v12;
      v9.f64[1] = v13;
      v10.f64[1] = v11;
      [(PXGUniform *)self->_tintColorUniform setFloat4Value:*(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v10).i64];
    }
  }
}

- (PXGColorTintEffect)initWithEntityManager:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)PXGColorTintEffect;
  v3 = [(PXGEffect *)&v12 initWithEntityManager:a3];
  if (v3)
  {
    v4 = [[PXGUniform alloc] initWithName:@"tintColor" type:3];
    tintColorUniform = v3->_tintColorUniform;
    v3->_tintColorUniform = v4;

    v6 = [PXGShader alloc];
    v13[0] = v3->_tintColorUniform;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    uint64_t v8 = -[PXGShader initWithOpcodes:source:uniforms:components:](v6, "initWithOpcodes:source:uniforms:components:", 0x200000000, 0, 0, v7, 0);
    shader = v3->_shader;
    v3->_shader = (PXGShader *)v8;

    float64x2_t v10 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
    [(PXGColorTintEffect *)v3 setTintColor:v10];
  }
  return v3;
}

@end