@interface SSDownloadPolicyUserDefaultState
+ (BOOL)supportsSecureCoding;
- (BOOL)currentBoolValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldInvertBoolValue;
- (NSNumber)fallbackNumberValue;
- (NSString)domain;
- (NSString)key;
- (SSDownloadPolicyUserDefaultState)initWithCoder:(id)a3;
- (SSDownloadPolicyUserDefaultState)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDomain:(id)a3;
- (void)setFallbackNumberValue:(id)a3;
- (void)setKey:(id)a3;
- (void)setShouldInvertBoolValue:(BOOL)a3;
@end

@implementation SSDownloadPolicyUserDefaultState

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  uint64_t v4 = [(NSNumber *)self->_fallbackNumberValue hash] ^ v3;
  return v4 ^ [(NSString *)self->_key hash] ^ self->_shouldInvertBoolValue;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SSDownloadPolicyUserDefaultState *)a3;
  if (v4 == self) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (domain = self->_domain, domain != v4->_domain) && !-[NSString isEqualToString:](domain, "isEqualToString:")
    || self->_shouldInvertBoolValue != v4->_shouldInvertBoolValue
    || (key = self->_key, key != v4->_key) && !-[NSString isEqualToString:](key, "isEqualToString:"))
  {
    char v8 = 0;
    goto LABEL_12;
  }
  fallbackNumberValue = self->_fallbackNumberValue;
  if (fallbackNumberValue == v4->_fallbackNumberValue)
  {
LABEL_11:
    char v8 = 1;
    goto LABEL_12;
  }
  char v8 = -[NSNumber isEqual:](fallbackNumberValue, "isEqual:");
LABEL_12:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  domain = self->_domain;
  id v5 = a3;
  [v5 encodeObject:domain forKey:@"domain"];
  [v5 encodeObject:self->_fallbackNumberValue forKey:@"fallnumval"];
  [v5 encodeObject:self->_key forKey:@"key"];
  [v5 encodeBool:self->_shouldInvertBoolValue forKey:@"sibv"];
}

- (SSDownloadPolicyUserDefaultState)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SSDownloadPolicyUserDefaultState;
  id v5 = [(SSDownloadPolicyUserDefaultState *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fallnumval"];
    fallbackNumberValue = v5->_fallbackNumberValue;
    v5->_fallbackNumberValue = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    key = v5->_key;
    v5->_key = (NSString *)v10;

    v5->_shouldInvertBoolValue = [v4 decodeBoolForKey:@"sibv"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_domain);
    objc_storeStrong((id *)(v5 + 16), self->_fallbackNumberValue);
    objc_storeStrong((id *)(v5 + 24), self->_key);
    *(unsigned char *)(v5 + 32) = self->_shouldInvertBoolValue;
  }
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_domain);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_fallbackNumberValue);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_key);
  xpc_dictionary_set_BOOL(v3, "3", self->_shouldInvertBoolValue);
  return v3;
}

- (SSDownloadPolicyUserDefaultState)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v14.receiver = self;
    v14.super_class = (Class)SSDownloadPolicyUserDefaultState;
    uint64_t v6 = [(SSDownloadPolicyUserDefaultState *)&v14 init];
    if (v6)
    {
      objc_opt_class();
      CFArrayRef v8 = SSXPCDictionaryCopyCFObjectWithClass(v5, "0");
      domain = v6->_domain;
      v6->_domain = (NSString *)v8;

      objc_opt_class();
      CFArrayRef v10 = SSXPCDictionaryCopyCFObjectWithClass(v5, "1");
      fallbackNumberValue = v6->_fallbackNumberValue;
      v6->_fallbackNumberValue = (NSNumber *)v10;

      objc_opt_class();
      CFArrayRef v12 = SSXPCDictionaryCopyCFObjectWithClass(v5, "2");
      key = v6->_key;
      v6->_key = (NSString *)v12;

      v6->_shouldInvertBoolValue = xpc_dictionary_get_BOOL(v5, "3");
    }
  }
  else
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)currentBoolValue
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef key = (const __CFString *)self->_key;
  if (!key
    || (CFStringRef domain = (const __CFString *)self->_domain) == 0
    || (BOOL v5 = CFPreferencesGetAppBooleanValue(key, domain, &keyExistsAndHasValidFormat) != 0, !keyExistsAndHasValidFormat))
  {
    BOOL v5 = [(NSNumber *)self->_fallbackNumberValue BOOLValue];
  }
  return v5 ^ self->_shouldInvertBoolValue;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSNumber)fallbackNumberValue
{
  return self->_fallbackNumberValue;
}

- (void)setFallbackNumberValue:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (BOOL)shouldInvertBoolValue
{
  return self->_shouldInvertBoolValue;
}

- (void)setShouldInvertBoolValue:(BOOL)a3
{
  self->_shouldInvertBoolValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_fallbackNumberValue, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end