@interface PXGRegionMaskEffect
- (PXGRegionMaskEffect)initWithEntityManager:(id)a3;
- (PXRegion)region;
- (double)alpha;
- (id)shader;
- (void)_updateValues;
- (void)setAlpha:(double)a3;
- (void)setRegion:(id)a3;
@end

@implementation PXGRegionMaskEffect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_valuesUniform, 0);

  objc_storeStrong((id *)&self->_shader, 0);
}

- (double)alpha
{
  return self->_alpha;
}

- (PXRegion)region
{
  return self->_region;
}

- (id)shader
{
  return self->_shader;
}

- (void)_updateValues
{
  v18 = self->_region;
  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v10 = [MEMORY[0x263F08690] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    v14 = [(PXRegion *)v18 px_descriptionForAssertionMessage];
    [v10 handleFailureInMethod:a2, self, @"PXGRegionMaskEffect.m", 47, @"%@ should be an instance inheriting from %@, but it is %@", @"_region", v12, v14 object file lineNumber description];
  }
  else
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXGRegionMaskEffect.m", 47, @"%@ should be an instance inheriting from %@, but it is nil", @"_region", v12 object file lineNumber description];
  }

LABEL_3:
  [(PXRegion *)v18 a];
  float64_t v17 = v4;
  [(PXRegion *)v18 b];
  float64_t v16 = v5;
  [(PXRegion *)v18 c];
  float64_t v15 = v6;
  [(PXGRegionMaskEffect *)self alpha];
  v7.f64[0] = v15;
  v7.f64[1] = v8;
  v9.f64[0] = v17;
  v9.f64[1] = v16;
  [(PXGUniform *)self->_valuesUniform setFloat4Value:*(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v9), v7).i64];
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
  [(PXGRegionMaskEffect *)self _updateValues];
}

- (void)setRegion:(id)a3
{
  double v4 = (PXRegion *)a3;
  if (!v4)
  {
    double v4 = [MEMORY[0x263F5E370] identityRegion];
  }
  obj = v4;
  double v5 = self->_region;
  if (v5 == obj)
  {
  }
  else
  {
    double v6 = v5;
    char v7 = -[PXRegion isEqual:](v5, "isEqual:");

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_region, obj);
      [(PXGRegionMaskEffect *)self _updateValues];
    }
  }
}

- (PXGRegionMaskEffect)initWithEntityManager:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)PXGRegionMaskEffect;
  v3 = [(PXGEffect *)&v11 initWithEntityManager:a3];
  if (v3)
  {
    double v4 = [[PXGUniform alloc] initWithName:@"values" type:3];
    valuesUniform = v3->_valuesUniform;
    v3->_valuesUniform = v4;

    double v6 = [PXGShader alloc];
    v12[0] = v3->_valuesUniform;
    char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    uint64_t v8 = -[PXGShader initWithOpcodes:source:uniforms:components:](v6, "initWithOpcodes:source:uniforms:components:", 0, 1, 0, v7, 0);
    shader = v3->_shader;
    v3->_shader = (PXGShader *)v8;

    [(PXGRegionMaskEffect *)v3 setRegion:0];
    [(PXGRegionMaskEffect *)v3 setAlpha:1.0];
  }
  return v3;
}

@end