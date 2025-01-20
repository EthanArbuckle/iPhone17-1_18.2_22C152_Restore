@interface SAIntentGroupIntentSearchMetadata
+ (id)intentSearchMetadata;
- (NSString)jsonData;
- (NSString)metadataType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)version;
- (void)setJsonData:(id)a3;
- (void)setMetadataType:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation SAIntentGroupIntentSearchMetadata

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"IntentSearchMetadata";
}

+ (id)intentSearchMetadata
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)jsonData
{
  return (NSString *)[(AceObject *)self propertyForKey:@"jsonData"];
}

- (void)setJsonData:(id)a3
{
}

- (NSString)metadataType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"metadataType"];
}

- (void)setMetadataType:(id)a3
{
}

- (int64_t)version
{
  return AceObjectIntegerForProperty(self, @"version");
}

- (void)setVersion:(int64_t)a3
{
}

@end