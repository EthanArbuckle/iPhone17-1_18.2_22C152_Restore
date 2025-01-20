@interface SACFScriptEncryptionParameters
+ (id)scriptEncryptionParameters;
- (NSData)encryptionKey;
- (NSData)hmac;
- (NSData)hmacKey;
- (NSData)initializationVector;
- (NSString)type;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEncryptionKey:(id)a3;
- (void)setHmac:(id)a3;
- (void)setHmacKey:(id)a3;
- (void)setInitializationVector:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SACFScriptEncryptionParameters

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"ScriptEncryptionParameters";
}

+ (id)scriptEncryptionParameters
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)encryptionKey
{
  return (NSData *)[(AceObject *)self propertyForKey:@"encryptionKey"];
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSData)hmac
{
  return (NSData *)[(AceObject *)self propertyForKey:@"hmac"];
}

- (void)setHmac:(id)a3
{
}

- (NSData)hmacKey
{
  return (NSData *)[(AceObject *)self propertyForKey:@"hmacKey"];
}

- (void)setHmacKey:(id)a3
{
}

- (NSData)initializationVector
{
  return (NSData *)[(AceObject *)self propertyForKey:@"initializationVector"];
}

- (void)setInitializationVector:(id)a3
{
}

- (NSString)type
{
  return (NSString *)[(AceObject *)self propertyForKey:@"type"];
}

- (void)setType:(id)a3
{
}

@end