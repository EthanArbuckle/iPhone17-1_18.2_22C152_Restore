@interface CRLConnectionLineMagnetInfo
- (BOOL)connected;
- (CGPoint)position;
- (CRLCanvasLayout)layout;
- (CRLConnectionLineMagnetInfo)initWithType:(unint64_t)a3 position:(CGPoint)a4 layout:(id)a5 connected:(BOOL)a6;
- (unint64_t)magnetType;
- (void)setConnected:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setMagnetType:(unint64_t)a3;
- (void)setPosition:(CGPoint)a3;
@end

@implementation CRLConnectionLineMagnetInfo

- (CRLConnectionLineMagnetInfo)initWithType:(unint64_t)a3 position:(CGPoint)a4 layout:(id)a5 connected:(BOOL)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CRLConnectionLineMagnetInfo;
  v13 = [(CRLConnectionLineMagnetInfo *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->mMagnetType = a3;
    v13->mPosition.CGFloat x = x;
    v13->mPosition.CGFloat y = y;
    objc_storeStrong((id *)&v13->mLayout, a5);
    v14->mConnected = a6;
  }

  return v14;
}

- (unint64_t)magnetType
{
  return self->mMagnetType;
}

- (void)setMagnetType:(unint64_t)a3
{
  self->mMagnetType = a3;
}

- (CGPoint)position
{
  double x = self->mPosition.x;
  double y = self->mPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->mPosition = a3;
}

- (CRLCanvasLayout)layout
{
  return self->mLayout;
}

- (void)setLayout:(id)a3
{
}

- (BOOL)connected
{
  return self->mConnected;
}

- (void)setConnected:(BOOL)a3
{
  self->mConnected = a3;
}

- (void).cxx_destruct
{
}

@end