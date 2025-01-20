@interface SAPhoneVoiceMail
+ (id)voiceMail;
- (NSNumber)length;
- (NSString)filePath;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFilePath:(id)a3;
- (void)setLength:(id)a3;
@end

@implementation SAPhoneVoiceMail

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"VoiceMail";
}

+ (id)voiceMail
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)filePath
{
  return (NSString *)[(AceObject *)self propertyForKey:@"filePath"];
}

- (void)setFilePath:(id)a3
{
}

- (NSNumber)length
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"length"];
}

- (void)setLength:(id)a3
{
}

@end