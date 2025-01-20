@interface SBNotificationCenterDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBNotificationCenterDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"useDuetRecommendations"];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBNotificationCenterUseDuet" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  v5 = [NSString stringWithUTF8String:"batteryWidgetAlwaysAvailable"];
  uint64_t v6 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBBatteryWidgetAlwaysAvailable" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v7 = [NSString stringWithUTF8String:"widgetSnapshottingEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBWidgetSnapshottingEnabled" toDefaultValue:v4 options:1];

  v8 = [NSString stringWithUTF8String:"widgetLoggingEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBWidgetLogging" toDefaultValue:v6 options:1];

  v9 = [NSString stringWithUTF8String:"showWidgetSnapshotDebugLabels"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBWidgetSnapshotDebugLabels" toDefaultValue:v6 options:1];

  v10 = [NSString stringWithUTF8String:"didPurgeNonCAMLSnapshots"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"SBDidPurgeNonCAMLSnapshots" toDefaultValue:v6 options:1];

  id v11 = [NSString stringWithUTF8String:"didPurgeNonASTCSnapshots"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"SBDidPurgeNonASTCSnapshots" toDefaultValue:v6 options:1];
}

@end