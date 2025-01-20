@interface CRLConnectionLineMagnet
- (CGPoint)magnetNormalizedPosition;
- (CRLConnectionLineMagnet)initWithType:(unint64_t)a3 normalizedPosition:(CGPoint)a4;
- (unint64_t)magnetType;
- (void)setMagnetNormalizedPosition:(CGPoint)a3;
- (void)setMagnetType:(unint64_t)a3;
@end

@implementation CRLConnectionLineMagnet

- (CRLConnectionLineMagnet)initWithType:(unint64_t)a3 normalizedPosition:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v8.receiver = self;
  v8.super_class = (Class)CRLConnectionLineMagnet;
  result = [(CRLConnectionLineMagnet *)&v8 init];
  if (result)
  {
    result->mMagnetType = a3;
    result->mMagnetNormalizedPosition.CGFloat x = x;
    result->mMagnetNormalizedPosition.CGFloat y = y;
  }
  return result;
}

- (unint64_t)magnetType
{
  return self->mMagnetType;
}

- (void)setMagnetType:(unint64_t)a3
{
  self->mMagnetType = a3;
}

- (CGPoint)magnetNormalizedPosition
{
  double x = self->mMagnetNormalizedPosition.x;
  double y = self->mMagnetNormalizedPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMagnetNormalizedPosition:(CGPoint)a3
{
  self->mMagnetNormalizedPosition = a3;
}

@end