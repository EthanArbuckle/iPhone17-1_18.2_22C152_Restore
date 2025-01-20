@interface PKSubcredentialEncryptedContainer
+ (BOOL)supportsSecureCoding;
- (NSData)data;
- (NSData)rawEphemeralPublicKey;
- (NSString)encryptionScheme;
- (NSString)ephemeralPublicKey;
- (NSString)publicKeyHash;
- (PKSubcredentialEncryptedContainer)initWithCoder:(id)a3;
- (PKSubcredentialEncryptedContainer)initWithDictionary:(id)a3;
- (PKSubcredentialEncryptedContainer)initWithEncryptionScheme:(id)a3 ephemeralPublicKey:(id)a4 publicKeyHash:(id)a5 data:(id)a6;
- (PKSubcredentialEncryptedContainer)initWithRequest:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSubcredentialEncryptedContainer

- (PKSubcredentialEncryptedContainer)initWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 version];
  v6 = [v4 ephemeralPublicKey];
  v7 = [v6 hexEncoding];
  v8 = [v4 publicKeyHash];
  v9 = [v8 hexEncoding];
  v10 = [v4 encryptedRequest];

  v11 = [(PKSubcredentialEncryptedContainer *)self initWithEncryptionScheme:v5 ephemeralPublicKey:v7 publicKeyHash:v9 data:v10];
  return v11;
}

- (PKSubcredentialEncryptedContainer)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 PKStringForKey:@"version"];
  v6 = [v4 PKStringForKey:@"ephemeralPublicKey"];
  v7 = [v4 PKStringForKey:@"publicKeyHash"];
  v8 = [v4 PKStringForKey:@"data"];

  if (v8) {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:1];
  }
  else {
    v9 = 0;
  }
  v10 = [(PKSubcredentialEncryptedContainer *)self initWithEncryptionScheme:v5 ephemeralPublicKey:v6 publicKeyHash:v7 data:v9];

  return v10;
}

- (PKSubcredentialEncryptedContainer)initWithEncryptionScheme:(id)a3 ephemeralPublicKey:(id)a4 publicKeyHash:(id)a5 data:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(PKSubcredentialEncryptedContainer *)self init];
  v16 = v15;
  if (!v15) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v15->_encryptionScheme, a3);
  p_ephemeralPublicKey = &v16->_ephemeralPublicKey;
  objc_storeStrong((id *)&v16->_ephemeralPublicKey, a4);
  p_publicKeyHash = &v16->_publicKeyHash;
  objc_storeStrong((id *)&v16->_publicKeyHash, a5);
  p_data = &v16->_data;
  objc_storeStrong((id *)&v16->_data, a6);
  encryptionScheme = v16->_encryptionScheme;
  if (!encryptionScheme) {
    goto LABEL_7;
  }
  if (*p_ephemeralPublicKey && *p_publicKeyHash && *p_data)
  {
LABEL_6:
    v21 = v16;
  }
  else
  {
LABEL_7:
    v22 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *p_ephemeralPublicKey;
      v24 = *p_publicKeyHash;
      v25 = *p_data;
      int v27 = 138413058;
      v28 = encryptionScheme;
      __int16 v29 = 2112;
      v30 = v23;
      __int16 v31 = 2112;
      v32 = v24;
      __int16 v33 = 2112;
      v34 = v25;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Received invalid encrypted request: version %@, ephemeral public key: %@, public key hash: %@, data: %@", (uint8_t *)&v27, 0x2Au);
    }

    v21 = 0;
  }

  return v21;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; encryptionScheme: %@; ephemeralPublicKey: %@; publicKeyHash: %@; data: %@ >",
               objc_opt_class(),
               self,
               self->_encryptionScheme,
               self->_ephemeralPublicKey,
               self->_publicKeyHash,
               self->_data);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(PKSubcredentialEncryptedContainer);
  uint64_t v6 = [(NSString *)self->_encryptionScheme copyWithZone:a3];
  encryptionScheme = v5->_encryptionScheme;
  v5->_encryptionScheme = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_ephemeralPublicKey copyWithZone:a3];
  ephemeralPublicKey = v5->_ephemeralPublicKey;
  v5->_ephemeralPublicKey = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_publicKeyHash copyWithZone:a3];
  publicKeyHash = v5->_publicKeyHash;
  v5->_publicKeyHash = (NSString *)v10;

  uint64_t v12 = [(NSData *)self->_data copyWithZone:a3];
  data = v5->_data;
  v5->_data = (NSData *)v12;

  return v5;
}

- (NSData)rawEphemeralPublicKey
{
  return (NSData *)[(NSString *)self->_ephemeralPublicKey pk_decodeHexadecimal];
}

- (id)dictionaryRepresentation
{
  v10[4] = *MEMORY[0x1E4F143B8];
  encryptionScheme = self->_encryptionScheme;
  if (encryptionScheme
    && (ephemeralPublicKey = self->_ephemeralPublicKey) != 0
    && (publicKeyHash = self->_publicKeyHash) != 0
    && (data = self->_data) != 0)
  {
    v9[0] = @"version";
    v9[1] = @"ephemeralPublicKey";
    v10[0] = encryptionScheme;
    v10[1] = ephemeralPublicKey;
    v10[2] = publicKeyHash;
    v9[2] = @"publicKeyHash";
    v9[3] = @"data";
    uint64_t v6 = [(NSData *)data base64EncodedStringWithOptions:0];
    v10[3] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  encryptionScheme = self->_encryptionScheme;
  id v5 = a3;
  [v5 encodeObject:encryptionScheme forKey:@"encryptionScheme"];
  [v5 encodeObject:self->_ephemeralPublicKey forKey:@"ephemeralPublicKey"];
  [v5 encodeObject:self->_publicKeyHash forKey:@"publicKeyHash"];
  [v5 encodeObject:self->_data forKey:@"data"];
}

- (PKSubcredentialEncryptedContainer)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKSubcredentialEncryptedContainer *)self init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptionScheme"];
  encryptionScheme = v5->_encryptionScheme;
  v5->_encryptionScheme = (NSString *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ephemeralPublicKey"];
  ephemeralPublicKey = v5->_ephemeralPublicKey;
  v5->_ephemeralPublicKey = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyHash"];
  publicKeyHash = v5->_publicKeyHash;
  v5->_publicKeyHash = (NSString *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  data = v5->_data;
  v5->_data = (NSData *)v12;

  id v14 = v5->_encryptionScheme;
  if (!v14) {
    goto LABEL_7;
  }
  if (v5->_ephemeralPublicKey && v5->_publicKeyHash && v5->_data)
  {
LABEL_6:
    v15 = v5;
  }
  else
  {
LABEL_7:
    v16 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v5->_ephemeralPublicKey;
      v18 = v5->_publicKeyHash;
      v19 = v5->_data;
      int v21 = 138413058;
      v22 = v14;
      __int16 v23 = 2112;
      v24 = v17;
      __int16 v25 = 2112;
      v26 = v18;
      __int16 v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Decoded invalid data: encryptionScheme %@, ephemeral public key: %@, public key hash: %@, data: %@", (uint8_t *)&v21, 0x2Au);
    }

    v15 = 0;
  }

  return v15;
}

- (NSString)encryptionScheme
{
  return self->_encryptionScheme;
}

- (NSString)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (NSString)publicKeyHash
{
  return self->_publicKeyHash;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_encryptionScheme, 0);
}

@end