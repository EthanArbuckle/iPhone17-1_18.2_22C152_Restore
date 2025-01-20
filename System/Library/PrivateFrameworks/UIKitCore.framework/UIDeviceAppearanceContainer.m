@interface UIDeviceAppearanceContainer
+ (BOOL)_preventsAppearanceProxyCustomization;
- (id)_appearanceContainer;
- (id)_appearanceGuideClass;
@end

@implementation UIDeviceAppearanceContainer

- (id)_appearanceGuideClass
{
  return 0;
}

- (id)_appearanceContainer
{
  return 0;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 0;
}

@end