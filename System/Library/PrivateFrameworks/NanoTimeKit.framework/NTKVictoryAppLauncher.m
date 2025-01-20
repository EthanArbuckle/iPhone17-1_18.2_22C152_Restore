@interface NTKVictoryAppLauncher
+ (id)complication;
+ (id)prelaunchApplicationIdentifiers;
@end

@implementation NTKVictoryAppLauncher

+ (id)complication
{
  v2 = [MEMORY[0x1E4F196C8] legacyComplicationDescriptor];
  v3 = +[NTKRemoteComplication complicationWithClientIdentifier:@"com.nike.nikeplus-gps.watchkitapp.watchkitextension" appBundleIdentifier:@"com.nike.nikeplus-gps.watchkitapp" complicationDescriptor:v2];

  return v3;
}

+ (id)prelaunchApplicationIdentifiers
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"com.nike.nikeplus-gps.watchkitapp"];
}

@end