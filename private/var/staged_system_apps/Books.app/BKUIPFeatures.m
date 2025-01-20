@interface BKUIPFeatures
+ (BOOL)uipFluidTransitionsEnabled;
+ (BOOL)useUIPFluidBookOpenTransition;
@end

@implementation BKUIPFeatures

+ (BOOL)uipFluidTransitionsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)useUIPFluidBookOpenTransition
{
  return _[a1 uipFluidTransitionsEnabled];
}

@end