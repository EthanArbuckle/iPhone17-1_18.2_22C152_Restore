@interface NTKHeartRateComplicationUtilties
+ (id)heartrateTintColor;
@end

@implementation NTKHeartRateComplicationUtilties

+ (id)heartrateTintColor
{
  if (heartrateTintColor_onceToken != -1) {
    dispatch_once(&heartrateTintColor_onceToken, &__block_literal_global_77);
  }
  v2 = (void *)heartrateTintColor__heartRateColor;

  return v2;
}

void __54__NTKHeartRateComplicationUtilties_heartrateTintColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.219607845 blue:0.0980392173 alpha:255.0];
  v1 = (void *)heartrateTintColor__heartRateColor;
  heartrateTintColor__heartRateColor = v0;
}

@end