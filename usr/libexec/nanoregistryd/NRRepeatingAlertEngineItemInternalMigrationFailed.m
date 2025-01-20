@interface NRRepeatingAlertEngineItemInternalMigrationFailed
- (id)alertName;
- (id)radarDescription;
- (id)radarTitle;
@end

@implementation NRRepeatingAlertEngineItemInternalMigrationFailed

- (id)radarTitle
{
  return @"Watch Migration Failed and unpaired the migrating watch";
}

- (id)radarDescription
{
  return @"<PLEASE ALSO GATHER A WATCH SYSDIAGNOSE FROM THE MIGRATING WATCH, IT IS LIKELY NOT CONNNECTED TO THIS COMPANION> While migrating a watch, the migration ended with a fatal error, which will disconnect the watch from both the previous phone, and the newly restored phone.";
}

- (id)alertName
{
  return @"InternalMigrationFailed";
}

@end