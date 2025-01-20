@interface MFPBlendStop
- (MFPBlendStop)initWithFactor:(float)a3 position:(float)a4;
- (float)factor;
- (float)position;
@end

@implementation MFPBlendStop

- (MFPBlendStop)initWithFactor:(float)a3 position:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MFPBlendStop;
  result = [(MFPBlendStop *)&v7 init];
  if (result)
  {
    result->mFactor = a3;
    result->mPosition = a4;
  }
  return result;
}

- (float)factor
{
  return self->mFactor;
}

- (float)position
{
  return self->mPosition;
}

@end