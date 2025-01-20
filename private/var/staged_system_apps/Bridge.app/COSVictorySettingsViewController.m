@interface COSVictorySettingsViewController
- (Class)installRowClass;
- (id)installRowIdentifier;
- (id)partnerAppStoreIdentifier;
@end

@implementation COSVictorySettingsViewController

- (id)installRowIdentifier
{
  return @"VICTORY_INSTALL_GROUP";
}

- (Class)installRowClass
{
  return (Class)objc_opt_class();
}

- (id)partnerAppStoreIdentifier
{
  id v2 = sub_1000E338C();

  return +[NSNumber numberWithInteger:v2];
}

@end