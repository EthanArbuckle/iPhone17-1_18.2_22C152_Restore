@interface OTCustodianRecoveryKey
+ (BOOL)supportsSecureCoding;
- (BOOL)generateWrappingWithError:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCustodianRecoveryKey:(id)a3;
- (BOOL)unwrapWithError:(id *)a3;
- (NSData)wrappedKey;
- (NSData)wrappingKey;
- (NSString)recoveryString;
- (NSUUID)uuid;
- (OTCustodianRecoveryKey)initWithCoder:(id)a3;
- (OTCustodianRecoveryKey)initWithUUID:(id)a3 recoveryString:(id)a4 error:(id *)a5;
- (OTCustodianRecoveryKey)initWithWrappedKey:(id)a3 wrappingKey:(id)a4 uuid:(id)a5 error:(id *)a6;
- (id)dictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OTCustodianRecoveryKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryString, 0);
  objc_storeStrong((id *)&self->_wrappedKey, 0);
  objc_storeStrong((id *)&self->_wrappingKey, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (NSString)recoveryString
{
  return self->_recoveryString;
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (NSData)wrappingKey
{
  return self->_wrappingKey;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"uuid"];
  [v5 encodeObject:self->_wrappingKey forKey:@"wrappingKey"];
  [v5 encodeObject:self->_wrappedKey forKey:@"wrappedKey"];
  [v5 encodeObject:self->_recoveryString forKey:@"recoveryString"];
}

- (OTCustodianRecoveryKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)OTCustodianRecoveryKey;
  id v5 = [(OTCustodianRecoveryKey *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappingKey"];
    wrappingKey = v5->_wrappingKey;
    v5->_wrappingKey = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedKey"];
    wrappedKey = v5->_wrappedKey;
    v5->_wrappedKey = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recoveryString"];
    recoveryString = v5->_recoveryString;
    v5->_recoveryString = (NSString *)v12;
  }
  return v5;
}

- (id)dictionary
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"uuid";
  v3 = [(OTCustodianRecoveryKey *)self uuid];
  id v4 = [v3 description];
  v13[0] = v4;
  v12[1] = @"recoveryString";
  id v5 = [(OTCustodianRecoveryKey *)self recoveryString];
  v13[1] = v5;
  v12[2] = @"wrappingKey";
  uint64_t v6 = [(OTCustodianRecoveryKey *)self wrappingKey];
  v7 = [v6 base64EncodedStringWithOptions:0];
  v13[2] = v7;
  v12[3] = @"wrappedKey";
  uint64_t v8 = [(OTCustodianRecoveryKey *)self wrappedKey];
  v9 = [v8 base64EncodedStringWithOptions:0];
  v13[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (OTCustodianRecoveryKey *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(OTCustodianRecoveryKey *)self isEqualToCustodianRecoveryKey:v4];
  }

  return v5;
}

- (BOOL)isEqualToCustodianRecoveryKey:(id)a3
{
  id v4 = (OTCustodianRecoveryKey *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    BOOL v5 = [(OTCustodianRecoveryKey *)self uuid];
    uint64_t v6 = [(OTCustodianRecoveryKey *)v4 uuid];
    if ([v5 isEqual:v6])
    {
      v7 = [(OTCustodianRecoveryKey *)self wrappingKey];
      uint64_t v8 = [(OTCustodianRecoveryKey *)v4 wrappingKey];
      if ([v7 isEqualToData:v8])
      {
        v9 = [(OTCustodianRecoveryKey *)self wrappedKey];
        uint64_t v10 = [(OTCustodianRecoveryKey *)v4 wrappedKey];
        if ([v9 isEqualToData:v10])
        {
          v11 = [(OTCustodianRecoveryKey *)self recoveryString];
          uint64_t v12 = [(OTCustodianRecoveryKey *)v4 recoveryString];
          char v13 = [v11 isEqualToString:v12];
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  return v13;
}

- (OTCustodianRecoveryKey)initWithWrappedKey:(id)a3 wrappingKey:(id)a4 uuid:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)OTCustodianRecoveryKey;
  v14 = [(OTCustodianRecoveryKey *)&v18 init];
  p_isa = (id *)&v14->super.isa;
  if (v14
    && (objc_storeStrong((id *)&v14->_uuid, a5),
        objc_storeStrong(p_isa + 3, a3),
        objc_storeStrong(p_isa + 2, a4),
        ![p_isa unwrapWithError:a6]))
  {
    v16 = 0;
  }
  else
  {
    v16 = p_isa;
  }

  return v16;
}

- (BOOL)unwrapWithError:(id *)a3
{
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F9A5D8]) initWithBitSize:2];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F9A5D0]) initWithData:self->_wrappingKey specifier:v5 error:a3];
  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F9A5E8]) initWithKeySpecifier:v5];
    uint64_t v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:self->_wrappedKey error:a3];
    if (v8)
    {
      v9 = [v7 decrypt:v8 withKey:v6 error:a3];
      BOOL v10 = v9 != 0;
      if (v9)
      {
        id v11 = (NSString *)[[NSString alloc] initWithData:v9 encoding:4];
        recoveryString = self->_recoveryString;
        self->_recoveryString = v11;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (OTCustodianRecoveryKey)initWithUUID:(id)a3 recoveryString:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)OTCustodianRecoveryKey;
  id v11 = [(OTCustodianRecoveryKey *)&v19 init];
  p_isa = (id *)&v11->super.isa;
  if (!v11) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v11->_uuid, a3);
  objc_storeStrong(p_isa + 4, a4);
  id v18 = 0;
  char v13 = [p_isa generateWrappingWithError:&v18];
  id v14 = v18;
  objc_super v15 = v14;
  if (v13)
  {

LABEL_4:
    v16 = p_isa;
    goto LABEL_8;
  }
  if (a5) {
    *a5 = v14;
  }

  v16 = 0;
LABEL_8:

  return v16;
}

- (BOOL)generateWrappingWithError:(id *)a3
{
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F9A5D8]) initWithBitSize:2];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F9A5D0]) initRandomKeyWithSpecifier:v5 error:a3];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 keyData];
    wrappingKey = self->_wrappingKey;
    self->_wrappingKey = v8;

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F9A5E8]) initWithKeySpecifier:v5];
    id v11 = [(NSString *)self->_recoveryString dataUsingEncoding:4];
    id v12 = [MEMORY[0x1E4F1C9B8] data];
    char v13 = [v10 encrypt:v11 withKey:v7 additionalAuthenticatedData:v12 error:a3];

    if (v13)
    {
      id v14 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:a3];
      BOOL v15 = v14 != 0;
      if (v14) {
        objc_storeStrong((id *)&self->_wrappedKey, v14);
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end