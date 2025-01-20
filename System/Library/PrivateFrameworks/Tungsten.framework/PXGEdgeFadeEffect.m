@interface PXGEdgeFadeEffect
- (PXGEdgeFadeEffect)initWithEntityManager:(id)a3;
- (id)shader;
- (int64_t)direction;
- (void)setDirection:(int64_t)a3;
@end

@implementation PXGEdgeFadeEffect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionUniform, 0);

  objc_storeStrong((id *)&self->_shader, 0);
}

- (id)shader
{
  return self->_shader;
}

- (void)setDirection:(int64_t)a3
{
  *(float *)&double v3 = (float)a3;
  [(PXGUniform *)self->_directionUniform setFloatValue:v3];
}

- (int64_t)direction
{
  [(PXGUniform *)self->_directionUniform floatValue];
  return (uint64_t)v2;
}

- (PXGEdgeFadeEffect)initWithEntityManager:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)PXGEdgeFadeEffect;
  double v3 = [(PXGEffect *)&v11 initWithEntityManager:a3];
  if (v3)
  {
    v4 = [[PXGUniform alloc] initWithName:@"directionUniform" type:0];
    directionUniform = v3->_directionUniform;
    v3->_directionUniform = v4;

    v6 = [PXGShader alloc];
    v12[0] = v3->_directionUniform;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    uint64_t v8 = -[PXGShader initWithOpcodes:source:uniforms:components:](v6, "initWithOpcodes:source:uniforms:components:", 0, 2, 0, v7, 0);
    shader = v3->_shader;
    v3->_shader = (PXGShader *)v8;

    [(PXGEdgeFadeEffect *)v3 setDirection:0];
  }
  return v3;
}

@end