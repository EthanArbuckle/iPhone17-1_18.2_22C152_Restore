@interface CLWaterStateInterface
- (BOOL)isWaterStateON;
- (CLWaterStateInterface)init;
@end

@implementation CLWaterStateInterface

- (BOOL)isWaterStateON
{
  return 0;
}

- (CLWaterStateInterface)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLWaterStateInterface;
  return [(CLWaterStateInterface *)&v3 init];
}

@end