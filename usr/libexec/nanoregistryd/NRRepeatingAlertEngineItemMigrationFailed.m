@interface NRRepeatingAlertEngineItemMigrationFailed
+ (id)launchURL;
- (id)string:(unint64_t)a3 localized:(BOOL)a4;
- (void)alternateButtonWasPressed;
- (void)otherButtonWasPressed;
@end

@implementation NRRepeatingAlertEngineItemMigrationFailed

- (id)string:(unint64_t)a3 localized:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1
    && ([(NRRepeatingAlertEngineItem *)self device],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8 = [(NRRepeatingAlertEngineItem *)self device];
    v9 = [v8 propertyForName:NRDevicePropertyName];
    v10 = [v9 value];

    v11 = +[NSBundle bundleWithIdentifier:@"com.apple.private.NanoRegistry"];
    v12 = [v11 localizedStringForKey:@"MIGRATION_FAILED_MESSAGE_%@" value:&stru_10016A1E8 table:@"Localizable"];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v10);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NRRepeatingAlertEngineItemMigrationFailed;
    v13 = [(NRRepeatingAlertEngineItem *)&v15 string:a3 localized:v4];
  }

  return v13;
}

- (void)alternateButtonWasPressed
{
  id v2 = +[NRQueue registryDaemonQueue];
  [v2 dispatchAsync:&stru_1001697A0];
}

+ (id)launchURL
{
  return @"bridge:root=ActiveWatch";
}

- (void)otherButtonWasPressed
{
}

@end