@interface SASyncChunk
+ (id)chunk;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)toAdd;
- (NSArray)toRemove;
- (NSString)appBundleId;
- (NSString)intentSlotName;
- (NSString)key;
- (NSString)postGen;
- (NSString)preGen;
- (NSString)validity;
- (SASyncAppMetaData)appMetaData;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppBundleId:(id)a3;
- (void)setAppMetaData:(id)a3;
- (void)setIntentSlotName:(id)a3;
- (void)setKey:(id)a3;
- (void)setPostGen:(id)a3;
- (void)setPreGen:(id)a3;
- (void)setToAdd:(id)a3;
- (void)setToRemove:(id)a3;
- (void)setValidity:(id)a3;
@end

@implementation SASyncChunk

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"Chunk";
}

+ (id)chunk
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

- (NSString)postGen
{
  return (NSString *)[(AceObject *)self propertyForKey:@"postGen"];
}

- (void)setPostGen:(id)a3
{
}

- (NSString)preGen
{
  return (NSString *)[(AceObject *)self propertyForKey:@"preGen"];
}

- (void)setPreGen:(id)a3
{
}

- (NSArray)toAdd
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"toAdd", v3);
}

- (void)setToAdd:(id)a3
{
}

- (NSArray)toRemove
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"toRemove", v3);
}

- (void)setToRemove:(id)a3
{
}

- (NSString)validity
{
  return (NSString *)[(AceObject *)self propertyForKey:@"validity"];
}

- (void)setValidity:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end