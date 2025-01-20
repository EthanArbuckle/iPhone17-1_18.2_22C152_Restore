@interface QuadraBinShaders
- (MTLComputePipelineState)quadraBin;
- (QuadraBinShaders)initWithMetalContext:(id)a3;
@end

@implementation QuadraBinShaders

- (QuadraBinShaders)initWithMetalContext:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)QuadraBinShaders;
  self = [(QuadraBinShaders *)&v8 init];
  if (!self)
  {
    FigDebugAssert3();
    goto LABEL_4;
  }
  v5 = [v4 computePipelineStateFor:@"QuadraBin::quadraBin" constants:0];
  quadraBin = self->_quadraBin;
  self->_quadraBin = v5;

  if (!self->_quadraBin)
  {
LABEL_7:
    FigDebugAssert3();

    self = 0;
  }
LABEL_4:

  return self;
}

- (MTLComputePipelineState)quadraBin
{
  return self->_quadraBin;
}

- (void).cxx_destruct
{
}

@end