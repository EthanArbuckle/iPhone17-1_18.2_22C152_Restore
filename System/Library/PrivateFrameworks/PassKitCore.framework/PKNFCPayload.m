@interface PKNFCPayload
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPKNFCPayload:(id)a3;
- (BOOL)requiresAuthentication;
- (NSData)encryptionPublicKeyData;
- (NSString)message;
- (PKNFCPayload)initWithCoder:(id)a3;
- (PKNFCPayload)initWithNFCDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)payloadState;
- (void)encodeWithCoder:(id)a3;
- (void)setEncryptionPublicKeyData:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPayloadState:(unint64_t)a3;
- (void)setRequiresAuthentication:(BOOL)a3;
@end

@implementation PKNFCPayload

- (PKNFCPayload)initWithNFCDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKNFCPayload;
  v5 = [(PKNFCPayload *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v6;

    v8 = [v4 objectForKey:@"encryptionPublicKey"];
    if (v8)
    {
      CFDataRef v9 = (const __CFData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
      CFDataRef v10 = PKCreatePublicKeyFromDER(v9);
      encryptionPublicKeyData = v5->_encryptionPublicKeyData;
      v5->_encryptionPublicKeyData = (NSData *)v10;
    }
    v5->_payloadState = 0;
    v5->_requiresAuthentication = [v4 PKBoolForKey:@"requiresAuthentication"];
  }
  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_message];
  [v3 safelyAddObject:self->_encryptionPublicKeyData];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_requiresAuthentication - v4 + 32 * v4;
  unint64_t v6 = self->_payloadState - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKNFCPayload *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKNFCPayload *)self isEqualToPKNFCPayload:v5];

  return v6;
}

- (BOOL)isEqualToPKNFCPayload:(id)a3
{
  uint64_t v4 = a3;
  message = self->_message;
  BOOL v6 = (NSString *)v4[2];
  if (message) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (message != v6) {
      goto LABEL_16;
    }
  }
  else if ((-[NSString isEqual:](message, "isEqual:") & 1) == 0)
  {
    goto LABEL_16;
  }
  encryptionPublicKeyData = self->_encryptionPublicKeyData;
  CFDataRef v9 = (NSData *)v4[3];
  if (!encryptionPublicKeyData || !v9)
  {
    if (encryptionPublicKeyData == v9) {
      goto LABEL_14;
    }
LABEL_16:
    BOOL v10 = 0;
    goto LABEL_17;
  }
  if ((-[NSData isEqual:](encryptionPublicKeyData, "isEqual:") & 1) == 0) {
    goto LABEL_16;
  }
LABEL_14:
  if (self->_requiresAuthentication != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_16;
  }
  BOOL v10 = self->_payloadState == v4[4];
LABEL_17:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(NSString *)self->_message copyWithZone:a3];
  BOOL v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_encryptionPublicKeyData copyWithZone:a3];
  CFDataRef v9 = (void *)v5[3];
  v5[3] = v8;

  *((unsigned char *)v5 + 8) = self->_requiresAuthentication;
  v5[4] = self->_payloadState;
  return v5;
}

- (PKNFCPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKNFCPayload;
  uint64_t v5 = [(PKNFCPayload *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionPublicKey"];
    encryptionPublicKeyData = v5->_encryptionPublicKeyData;
    v5->_encryptionPublicKeyData = (NSData *)v8;

    v5->_requiresAuthentication = [v4 decodeBoolForKey:@"requiresAuthentication"];
    v5->_payloadState = [v4 decodeIntegerForKey:@"payloadState"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  message = self->_message;
  id v5 = a3;
  [v5 encodeObject:message forKey:@"message"];
  [v5 encodeObject:self->_encryptionPublicKeyData forKey:@"encryptionPublicKey"];
  [v5 encodeBool:self->_requiresAuthentication forKey:@"requiresAuthentication"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_payloadState];
  [v5 encodeObject:v6 forKey:@"payloadState"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = @"YES";
  if (!self->_requiresAuthentication) {
    id v5 = @"NO";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; Message: %@; Encryption Public Key: %@; Requires Authentication: %@; Payload State: %lu;>",
               v4,
               self,
               self->_message,
               self->_encryptionPublicKeyData,
               v5,
               self->_payloadState);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSData)encryptionPublicKeyData
{
  return self->_encryptionPublicKeyData;
}

- (void)setEncryptionPublicKeyData:(id)a3
{
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->_requiresAuthentication = a3;
}

- (unint64_t)payloadState
{
  return self->_payloadState;
}

- (void)setPayloadState:(unint64_t)a3
{
  self->_payloadState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionPublicKeyData, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end