@interface MFPColorBalanceEffect
+ (id)GUID;
- (MFPColorBalanceEffect)initWithCyanRed:(int)a3 magentaGreen:(int)a4 yellowBlue:(int)a5;
@end

@implementation MFPColorBalanceEffect

+ (id)GUID
{
  return @"537E597D-251E-48DA-9664-29CA496B70F8";
}

- (MFPColorBalanceEffect)initWithCyanRed:(int)a3 magentaGreen:(int)a4 yellowBlue:(int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MFPColorBalanceEffect;
  result = [(MFPColorBalanceEffect *)&v9 init];
  if (result)
  {
    result->mCyanRed = a3;
    result->mMagentaGreen = a4;
    result->mYellowBlue = a5;
  }
  return result;
}

@end