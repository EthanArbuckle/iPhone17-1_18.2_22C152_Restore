@interface PXGColorGradingEffect
- (BOOL)isEqual:(id)a3;
- (PXGColorGradingEffect)initWithEntityManager:(id)a3;
- (PXGColorLookupCube)colorLookupCube;
- (float)intensity;
- (id)shader;
- (unint64_t)hash;
- (void)setColorLookupCube:(id)a3;
- (void)setIntensity:(float)a3;
@end

@implementation PXGColorGradingEffect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorLookupCube, 0);
  objc_storeStrong((id *)&self->_grayUniform, 0);
  objc_storeStrong((id *)&self->_valuesUniform, 0);
  objc_storeStrong((id *)&self->_cubeUniform, 0);

  objc_storeStrong((id *)&self->_shader, 0);
}

- (void)setIntensity:(float)a3
{
  self->_intensity = a3;
}

- (float)intensity
{
  return self->_intensity;
}

- (PXGColorLookupCube)colorLookupCube
{
  return self->_colorLookupCube;
}

- (id)shader
{
  return self->_shader;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)PXGColorGradingEffect;
  unint64_t v3 = [(PXGColorGradingEffect *)&v7 hash];
  v4 = [(PXGColorGradingEffect *)self colorLookupCube];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 colorLookupCube];
    id v7 = [(PXGColorGradingEffect *)self colorLookupCube];
    if (v6 == v7)
    {
    }
    else
    {
      v8 = v7;
      char v9 = [v6 isEqual:v7];

      if ((v9 & 1) == 0) {
        goto LABEL_9;
      }
    }
    int v11 = [v5 effectId];
    if (v11 == [(PXGEffect *)self effectId])
    {
      v12 = [v5 entityManager];
      v13 = [(PXGEffect *)self entityManager];
      BOOL v10 = v12 == v13;

LABEL_10:
      goto LABEL_11;
    }
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)setColorLookupCube:(id)a3
{
  id v5 = (PXGColorLookupCube *)a3;
  id v6 = self->_colorLookupCube;
  if (v6 == v5)
  {

LABEL_5:
    char v9 = [(PXGUniform *)self->_cubeUniform textureProvider];

    if (v9) {
      goto LABEL_13;
    }
    goto LABEL_6;
  }
  id v7 = v6;
  int v8 = [(PXGColorLookupCube *)v5 isEqual:v6];

  if (v8) {
    goto LABEL_5;
  }
LABEL_6:
  objc_storeStrong((id *)&self->_colorLookupCube, a3);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__PXGColorGradingEffect_setColorLookupCube___block_invoke;
  v16[3] = &unk_2655564B0;
  BOOL v10 = v5;
  v17 = v10;
  [(PXGUniform *)self->_cubeUniform setTextureProvider:v16];
  if (v10) {
    [(PXGColorLookupCube *)v10 center];
  }
  else {
    double v11 = 0.0;
  }
  [(PXGUniform *)self->_grayUniform setFloat4Value:v11];
  unint64_t v12 = [(PXGColorLookupCube *)v10 edgeSize];
  if (v12 <= 1) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = v12;
  }
  *(float *)v13.i32 = (float)v14;
  v15.i32[0] = 1056964608;
  v15.f32[1] = (float)v14 + -1.0;
  [(PXGUniform *)self->_valuesUniform setFloat4Value:COERCE_DOUBLE(vdiv_f32(v15, (float32x2_t)vdup_lane_s32(v13, 0)))];

LABEL_13:
}

id __44__PXGColorGradingEffect_setColorLookupCube___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = +[PXGColorGradingTexturesStore colorGradingTextureStoreForContext:a2];
  id v4 = [v3 colorGradingTextureWithColorLookupCube:*(void *)(a1 + 32)];

  return v4;
}

- (PXGColorGradingEffect)initWithEntityManager:(id)a3
{
  v17[3] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)PXGColorGradingEffect;
  unint64_t v3 = [(PXGEffect *)&v16 initWithEntityManager:a3];
  if (v3)
  {
    id v4 = [[PXGUniform alloc] initWithName:@"cube" type:5];
    cubeUniform = v3->_cubeUniform;
    v3->_cubeUniform = v4;

    id v6 = [[PXGUniform alloc] initWithName:@"coords" type:3];
    valuesUniform = v3->_valuesUniform;
    v3->_valuesUniform = v6;

    int v8 = [[PXGUniform alloc] initWithName:@"gray" type:3];
    grayUniform = v3->_grayUniform;
    v3->_grayUniform = v8;

    BOOL v10 = [PXGShader alloc];
    v17[0] = v3->_cubeUniform;
    v17[1] = v3->_valuesUniform;
    v17[2] = v3->_grayUniform;
    double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
    uint64_t v12 = -[PXGShader initWithOpcodes:source:uniforms:components:](v10, "initWithOpcodes:source:uniforms:components:", 0x100000000, 0, 0, v11, 0);
    shader = v3->_shader;
    v3->_shader = (PXGShader *)v12;

    [(PXGColorGradingEffect *)v3 setColorLookupCube:0];
    LODWORD(v14) = 1.0;
    [(PXGColorGradingEffect *)v3 setIntensity:v14];
  }
  return v3;
}

@end