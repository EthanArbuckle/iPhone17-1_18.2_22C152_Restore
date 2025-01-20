@interface PMLGradientResults
- (NSNumber)loss;
- (PMLGradientResults)initWithGradient:(id)a3 loss:(id)a4;
- (PMLMutableDenseVector)gradient;
@end

@implementation PMLGradientResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loss, 0);
  objc_storeStrong((id *)&self->_gradient, 0);
}

- (NSNumber)loss
{
  return self->_loss;
}

- (PMLMutableDenseVector)gradient
{
  return self->_gradient;
}

- (PMLGradientResults)initWithGradient:(id)a3 loss:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PMLGradientSolver.m", 28, @"Invalid parameter not satisfying: %@", @"gradient" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PMLGradientResults;
  v10 = [(PMLGradientResults *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_gradient, a3);
    objc_storeStrong((id *)&v11->_loss, a4);
  }

  return v11;
}

@end