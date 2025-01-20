@interface SBSoftwareUpdateDefaults
- (void)_bindAndRegisterDefaults;
- (void)clearDeveloperInstallBrickAlerts;
@end

@implementation SBSoftwareUpdateDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"developerInstallBrickAlertShown7DayWarning"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBDeveloperBrickAlert1" toDefaultValue:MEMORY[0x1E4F1CC28] options:4];

  v5 = [NSString stringWithUTF8String:"developerInstallBrickAlertShown3DayWarning"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBDeveloperBrickAlert2" toDefaultValue:v4 options:4];

  id v6 = [NSString stringWithUTF8String:"developerInstallBrickAlertShownTomorrowWarning"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBDeveloperBrickAlert3" toDefaultValue:v4 options:4];
}

- (void)clearDeveloperInstallBrickAlerts
{
  [(SBSoftwareUpdateDefaults *)self setDeveloperInstallBrickAlertShown7DayWarning:0];
  [(SBSoftwareUpdateDefaults *)self setDeveloperInstallBrickAlertShown3DayWarning:0];
  [(SBSoftwareUpdateDefaults *)self setDeveloperInstallBrickAlertShownTomorrowWarning:0];
}

@end