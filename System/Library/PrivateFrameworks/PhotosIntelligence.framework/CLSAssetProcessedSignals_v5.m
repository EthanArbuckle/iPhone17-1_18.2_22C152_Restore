@interface CLSAssetProcessedSignals_v5
- (BOOL)isShowcasingFood;
- (void)setIsShowcasingFood:(BOOL)a3;
@end

@implementation CLSAssetProcessedSignals_v5

- (void)setIsShowcasingFood:(BOOL)a3
{
  *((unsigned char *)&self->super.super + 10) = a3;
}

- (BOOL)isShowcasingFood
{
  return *((unsigned char *)&self->super.super + 10);
}

@end