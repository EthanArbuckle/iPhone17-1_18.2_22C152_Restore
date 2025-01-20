@interface SASBootstrapSpeechIdMetadata
+ (id)bootstrapSpeechIdMetadata;
- (NSDate)keychainCreationDate;
- (NSString)bootstrapSpeechId;
- (NSString)deviceType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBootstrapSpeechId:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setKeychainCreationDate:(id)a3;
@end

@implementation SASBootstrapSpeechIdMetadata

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"BootstrapSpeechIdMetadata";
}

+ (id)bootstrapSpeechIdMetadata
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)bootstrapSpeechId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"bootstrapSpeechId"];
}

- (void)setBootstrapSpeechId:(id)a3
{
}

- (NSString)deviceType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceType"];
}

- (void)setDeviceType:(id)a3
{
}

- (NSDate)keychainCreationDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"keychainCreationDate"];
}

- (void)setKeychainCreationDate:(id)a3
{
}

@end