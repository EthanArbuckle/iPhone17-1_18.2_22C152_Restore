@interface PXGEdgeStretchEffect
- (CGRect)sampleRect;
- (PXGEdgeStretchEffect)initWithEntityManager:(id)a3;
- (id)shader;
- (void)setSampleRect:(CGRect)a3;
@end

@implementation PXGEdgeStretchEffect

- (PXGEdgeStretchEffect)initWithEntityManager:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)PXGEdgeStretchEffect;
  v3 = [(PXGEffect *)&v11 initWithEntityManager:a3];
  if (v3)
  {
    v4 = [[PXGUniform alloc] initWithName:@"sampleRect" type:3];
    sampleRect = v3->_sampleRect;
    v3->_sampleRect = v4;

    v6 = [PXGShader alloc];
    v12[0] = v3->_sampleRect;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    uint64_t v8 = -[PXGShader initWithOpcodes:source:uniforms:components:](v6, "initWithOpcodes:source:uniforms:components:", 1, 0, 0, v7, 0);
    shader = v3->_shader;
    v3->_shader = (PXGShader *)v8;

    [(PXGShader *)v3->_shader setSampler:1];
  }
  return v3;
}

- (id)shader
{
  return self->_shader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleRect, 0);

  objc_storeStrong((id *)&self->_shader, 0);
}

- (void)setSampleRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat MinY = CGRectGetMinY(a3);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v19);
  v9.f64[0] = MaxY;
  v9.f64[1] = MinX;
  v10.f64[0] = MinY;
  v10.f64[1] = MaxX;
  *(void *)&double v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v10), v9).u64[0];
  sampleRect = self->_sampleRect;

  [(PXGUniform *)sampleRect setFloat4Value:v11];
}

- (CGRect)sampleRect
{
  uint64_t v2 = [(PXGUniform *)self->_sampleRect float4Value];
  v5.n128_f64[0] = v6.n128_f32[1];
  v6.n128_f64[0] = v6.n128_f32[0];

  v3.n128_f64[0] = v6.n128_f32[2];
  v4.n128_f64[0] = v6.n128_f32[3];
  MEMORY[0x270F540A8](v2, v6, v5, v3, v4);
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

@end