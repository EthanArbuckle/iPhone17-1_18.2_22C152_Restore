@interface SASyncAppMetaData
+ (id)appMetaData;
- (NSArray)syncSlots;
- (NSNumber)developerMode;
- (SASyncAppIdentifyingInfo)appIdentifyingInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppIdentifyingInfo:(id)a3;
- (void)setDeveloperMode:(id)a3;
- (void)setSyncSlots:(id)a3;
@end

@implementation SASyncAppMetaData

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"AppMetaData";
}

+ (id)appMetaData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SASyncAppIdentifyingInfo)appIdentifyingInfo
{
  return (SASyncAppIdentifyingInfo *)AceObjectAceObjectForProperty(self, @"appIdentifyingInfo");
}

- (void)setAppIdentifyingInfo:(id)a3
{
}

- (NSNumber)developerMode
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"developerMode"];
}

- (void)setDeveloperMode:(id)a3
{
}

- (NSArray)syncSlots
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"syncSlots"];
}

- (void)setSyncSlots:(id)a3
{
}

@end