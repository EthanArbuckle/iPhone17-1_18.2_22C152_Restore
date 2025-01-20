@interface SASyncAnchor
+ (id)anchor;
- (NSNumber)suspendDurationInSeconds;
- (NSString)appBundleId;
- (NSString)generation;
- (NSString)intentSlotName;
- (NSString)key;
- (NSString)suspendReason;
- (NSString)validity;
- (SASyncAppMetaData)appMetaData;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)count;
- (void)setAppBundleId:(id)a3;
- (void)setAppMetaData:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setGeneration:(id)a3;
- (void)setIntentSlotName:(id)a3;
- (void)setKey:(id)a3;
- (void)setSuspendDurationInSeconds:(id)a3;
- (void)setSuspendReason:(id)a3;
- (void)setValidity:(id)a3;
@end

@implementation SASyncAnchor

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"Anchor";
}

+ (id)anchor
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appBundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appBundleId"];
}

- (void)setAppBundleId:(id)a3
{
}

- (SASyncAppMetaData)appMetaData
{
  return (SASyncAppMetaData *)AceObjectAceObjectForProperty(self, @"appMetaData");
}

- (void)setAppMetaData:(id)a3
{
}

- (int64_t)count
{
  return AceObjectIntegerForProperty(self, @"count");
}

- (void)setCount:(int64_t)a3
{
}

- (NSString)generation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"generation"];
}

- (void)setGeneration:(id)a3
{
}

- (NSString)intentSlotName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"intentSlotName"];
}

- (void)setIntentSlotName:(id)a3
{
}

- (NSString)key
{
  return (NSString *)[(AceObject *)self propertyForKey:@"key"];
}

- (void)setKey:(id)a3
{
}

- (NSNumber)suspendDurationInSeconds
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"suspendDurationInSeconds"];
}

- (void)setSuspendDurationInSeconds:(id)a3
{
}

- (NSString)suspendReason
{
  return (NSString *)[(AceObject *)self propertyForKey:@"suspendReason"];
}

- (void)setSuspendReason:(id)a3
{
}

- (NSString)validity
{
  return (NSString *)[(AceObject *)self propertyForKey:@"validity"];
}

- (void)setValidity:(id)a3
{
}

@end