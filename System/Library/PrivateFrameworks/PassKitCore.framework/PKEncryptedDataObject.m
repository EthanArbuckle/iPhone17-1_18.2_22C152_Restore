@interface PKEncryptedDataObject
+ (BOOL)supportsSecureCoding;
- (NSData)data;
- (NSData)ephemeralPublicKey;
- (NSData)publicKeyHash;
- (PKEncryptedDataObject)initWithCoder:(id)a3;
- (PKEncryptedDataObject)initWithWebServiceDictionary:(id)a3;
- (id)asWebServiceDictionary;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setEphemeralPublicKey:(id)a3;
- (void)setPublicKeyHash:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation PKEncryptedDataObject

- (id)asWebServiceDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(NSData *)self->_publicKeyHash base64EncodedStringWithOptions:0];
  [v3 setObject:v4 forKey:@"publicKeyHash"];

  v5 = [(NSData *)self->_ephemeralPublicKey base64EncodedStringWithOptions:0];
  [v3 setObject:v5 forKey:@"ephemeralPublicKey"];

  v6 = [(NSData *)self->_data base64EncodedStringWithOptions:0];
  [v3 setObject:v6 forKey:@"data"];

  unint64_t version = self->_version;
  v8 = @"Unknown";
  if (version) {
    v8 = 0;
  }
  if (version == 1) {
    v9 = @"EC_v3";
  }
  else {
    v9 = v8;
  }
  [v3 setObject:v9 forKey:@"version"];
  v10 = (void *)[v3 copy];

  return v10;
}

- (PKEncryptedDataObject)initWithWebServiceDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v19.receiver = self;
    v19.super_class = (Class)PKEncryptedDataObject;
    self = [(PKEncryptedDataObject *)&v19 init];
    if (self)
    {
      v5 = [v4 PKStringForKey:@"publicKeyHash"];
      if (v5)
      {
        v6 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v5 options:0];
        publicKeyHash = self->_publicKeyHash;
        self->_publicKeyHash = v6;
      }
      v8 = [v4 PKStringForKey:@"ephemeralPublicKey"];
      if (v8)
      {
        v9 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
        ephemeralPublicKey = self->_ephemeralPublicKey;
        self->_ephemeralPublicKey = v9;
      }
      v11 = [v4 PKStringForKey:@"data"];
      if (v11)
      {
        v12 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v11 options:0];
        data = self->_data;
        self->_data = v12;
      }
      v14 = [v4 PKStringForKey:@"version"];
      v15 = v14;
      unint64_t v17 = 1;
      if (v14 != @"EC_v3")
      {
        if (!v14
          || (uint64_t v16 = [(__CFString *)v14 caseInsensitiveCompare:@"EC_v3"],
              v15,
              v16))
        {
          unint64_t v17 = 0;
        }
      }

      self->_unint64_t version = v17;
    }
  }

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKEncryptedDataObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKEncryptedDataObject;
  v5 = [(PKEncryptedDataObject *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyHash"];
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ephemeralPublicKey"];
    ephemeralPublicKey = v5->_ephemeralPublicKey;
    v5->_ephemeralPublicKey = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    v5->_unint64_t version = [v12 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  publicKeyHash = self->_publicKeyHash;
  id v5 = a3;
  [v5 encodeObject:publicKeyHash forKey:@"publicKeyHash"];
  [v5 encodeObject:self->_ephemeralPublicKey forKey:@"ephemeralPublicKey"];
  [v5 encodeObject:self->_data forKey:@"data"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_version];
  [v5 encodeObject:v6 forKey:@"version"];
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_unint64_t version = a3;
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(id)a3
{
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
}

@end