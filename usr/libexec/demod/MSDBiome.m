@interface MSDBiome
+ (id)collectAppUsageDataFrom:(id)a3 to:(id)a4;
@end

@implementation MSDBiome

+ (id)collectAppUsageDataFrom:(id)a3 to:(id)a4
{
  return +[MSDBiomeAppInFocusStream collectAppUsageDataFrom:a3 to:a4];
}

@end