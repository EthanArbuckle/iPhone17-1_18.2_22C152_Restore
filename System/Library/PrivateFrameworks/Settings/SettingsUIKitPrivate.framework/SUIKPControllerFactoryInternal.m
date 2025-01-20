@interface SUIKPControllerFactoryInternal
+ (id)thirdPartySettingsControllerForSpecifierWithSpecifier:(id)a3;
- (SUIKPControllerFactoryInternal)init;
@end

@implementation SUIKPControllerFactoryInternal

+ (id)thirdPartySettingsControllerForSpecifierWithSpecifier:(id)a3
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for SUIKPThirdPartyAppListController());
  id v5 = a3;
  sub_236F42C48();
  v7 = v6;
  objc_msgSend(v6, sel_setSpecifier_, v5);

  return v7;
}

- (SUIKPControllerFactoryInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _ControllerFactory();
  return [(SUIKPControllerFactoryInternal *)&v3 init];
}

@end