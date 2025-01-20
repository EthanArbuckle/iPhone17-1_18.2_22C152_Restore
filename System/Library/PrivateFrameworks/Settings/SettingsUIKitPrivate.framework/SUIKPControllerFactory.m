@interface SUIKPControllerFactory
+ (id)thirdPartySettingsControllerWithSpecifier:(id)a3;
@end

@implementation SUIKPControllerFactory

+ (id)thirdPartySettingsControllerWithSpecifier:(id)a3
{
  return +[SUIKPControllerFactoryInternal thirdPartySettingsControllerForSpecifierWithSpecifier:a3];
}

@end