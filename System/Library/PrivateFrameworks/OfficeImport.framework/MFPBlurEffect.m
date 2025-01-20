@interface MFPBlurEffect
+ (id)GUID;
- (MFPBlurEffect)initWithRadius:(float)a3 expandEdge:(BOOL)a4;
@end

@implementation MFPBlurEffect

+ (id)GUID
{
  return @"633C80A4-1843-482B-9EF2-BE2834C5FDD4";
}

- (MFPBlurEffect)initWithRadius:(float)a3 expandEdge:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MFPBlurEffect;
  result = [(MFPBlurEffect *)&v7 init];
  if (result)
  {
    result->mRadius = a3;
    result->mExpandEdge = a4;
  }
  return result;
}

@end