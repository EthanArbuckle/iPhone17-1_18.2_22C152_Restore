@interface SAWatchData
+ (id)watchData;
- (BOOL)configuredForLeftWrist;
- (BOOL)victoryDevice;
- (NSString)interfaceOrientation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setConfiguredForLeftWrist:(BOOL)a3;
- (void)setInterfaceOrientation:(id)a3;
- (void)setVictoryDevice:(BOOL)a3;
@end

@implementation SAWatchData

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"WatchData";
}

+ (id)watchData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)configuredForLeftWrist
{
  return AceObjectBoolForProperty(self, @"configuredForLeftWrist");
}

- (void)setConfiguredForLeftWrist:(BOOL)a3
{
}

- (NSString)interfaceOrientation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"interfaceOrientation"];
}

- (void)setInterfaceOrientation:(id)a3
{
}

- (BOOL)victoryDevice
{
  return AceObjectBoolForProperty(self, @"victoryDevice");
}

- (void)setVictoryDevice:(BOOL)a3
{
}

@end