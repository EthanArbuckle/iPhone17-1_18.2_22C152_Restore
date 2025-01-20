@interface PXGPinchEffect
- (CGPoint)normalizedCenter;
- (PXGPinchEffect)initWithEntityManager:(id)a3;
- (double)scale;
- (id)shader;
- (void)setNormalizedCenter:(CGPoint)a3;
- (void)setScale:(double)a3;
@end

@implementation PXGPinchEffect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_normalizedCenter, 0);

  objc_storeStrong((id *)&self->_shader, 0);
}

- (id)shader
{
  return self->_shader;
}

- (void)setScale:(double)a3
{
  *(float *)&a3 = a3;
  [(PXGUniform *)self->_scale setFloatValue:a3];
}

- (double)scale
{
  [(PXGUniform *)self->_scale floatValue];
  return v2;
}

- (void)setNormalizedCenter:(CGPoint)a3
{
  CGFloat y = a3.y;
  [(PXGUniform *)self->_normalizedCenter setFloat2Value:COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)a3))];
}

- (CGPoint)normalizedCenter
{
  [(PXGUniform *)self->_normalizedCenter float2Value];
  float64x2_t v3 = vcvtq_f64_f32(v2);
  double v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.CGFloat y = v4;
  return result;
}

- (PXGPinchEffect)initWithEntityManager:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)PXGPinchEffect;
  float64x2_t v3 = [(PXGEffect *)&v14 initWithEntityManager:a3];
  double v4 = v3;
  if (v3)
  {
    -[PXGPinchEffect setNormalizedCenter:](v3, "setNormalizedCenter:", 0.5, 0.5);
    v5 = [[PXGUniform alloc] initWithName:@"normalizedCenter" type:1];
    normalizedCenter = v4->_normalizedCenter;
    v4->_normalizedCenter = v5;

    v7 = [[PXGUniform alloc] initWithName:@"scale" type:0];
    scale = v4->_scale;
    v4->_scale = v7;

    v9 = [PXGShader alloc];
    v15[0] = v4->_normalizedCenter;
    v15[1] = v4->_scale;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    uint64_t v11 = -[PXGShader initWithOpcodes:source:uniforms:components:](v9, "initWithOpcodes:source:uniforms:components:", 2, 0, 0, v10, 0);
    shader = v4->_shader;
    v4->_shader = (PXGShader *)v11;

    [(PXGShader *)v4->_shader setSampler:1];
    [(PXGPinchEffect *)v4 setScale:1.0];
  }
  return v4;
}

@end