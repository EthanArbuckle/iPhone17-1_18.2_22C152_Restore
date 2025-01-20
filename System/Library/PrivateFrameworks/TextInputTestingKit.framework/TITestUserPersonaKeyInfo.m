@interface TITestUserPersonaKeyInfo
- (CGPoint)center;
- (TIFitAffineMLLMatrixWrapper)rotationMatrix;
- (TIGaussianErrorGenerator)errorGenerator;
- (id)description;
- (void)setCenter:(CGPoint)a3;
- (void)setErrorGenerator:(id)a3;
- (void)setRotationMatrix:(id)a3;
@end

@implementation TITestUserPersonaKeyInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationMatrix, 0);
  objc_storeStrong((id *)&self->_errorGenerator, 0);
}

- (void)setRotationMatrix:(id)a3
{
}

- (TIFitAffineMLLMatrixWrapper)rotationMatrix
{
  return self->_rotationMatrix;
}

- (void)setErrorGenerator:(id)a3
{
}

- (TIGaussianErrorGenerator)errorGenerator
{
  return self->_errorGenerator;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)TITestUserPersonaKeyInfo;
  v4 = [(TITestUserPersonaKeyInfo *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ @ {%.1f, %.1f}", v4, *(void *)&self->_center.x, *(void *)&self->_center.y];

  return v5;
}

@end