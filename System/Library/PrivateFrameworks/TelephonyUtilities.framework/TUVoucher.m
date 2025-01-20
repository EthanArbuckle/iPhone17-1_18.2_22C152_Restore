@interface TUVoucher
+ (BOOL)supportsSecureCoding;
+ (id)voucherFromMessagingData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVoucher:(id)a3;
- (NSData)data;
- (NSData)encryptedData;
- (NSData)unsafeData;
- (NSString)tokenPrefixedURI;
- (TUHandle)handle;
- (TUVoucher)initWithCoder:(id)a3;
- (TUVoucher)initWithHandle:(id)a3 tokenPrefixedURI:(id)a4 data:(id)a5 encryptedData:(id)a6;
- (TUVoucher)initWithVoucher:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)messagingData;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUVoucher

- (TUVoucher)initWithHandle:(id)a3 tokenPrefixedURI:(id)a4 data:(id)a5 encryptedData:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)TUVoucher;
  v15 = [(TUVoucher *)&v23 init];
  if (v15)
  {
    uint64_t v16 = [v14 copy];
    encryptedData = v15->_encryptedData;
    v15->_encryptedData = (NSData *)v16;

    objc_storeStrong((id *)&v15->_handle, a3);
    uint64_t v18 = [v12 copy];
    tokenPrefixedURI = v15->_tokenPrefixedURI;
    v15->_tokenPrefixedURI = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    unsafeData = v15->_unsafeData;
    v15->_unsafeData = (NSData *)v20;
  }
  return v15;
}

- (TUVoucher)initWithVoucher:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TUVoucher;
  v5 = [(TUVoucher *)&v19 init];
  if (v5)
  {
    v6 = [v4 encryptedData];
    uint64_t v7 = [v6 copy];
    encryptedData = v5->_encryptedData;
    v5->_encryptedData = (NSData *)v7;

    v9 = [v4 handle];
    uint64_t v10 = [v9 copy];
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v10;

    id v12 = [v4 tokenPrefixedURI];
    uint64_t v13 = [v12 copy];
    tokenPrefixedURI = v5->_tokenPrefixedURI;
    v5->_tokenPrefixedURI = (NSString *)v13;

    v15 = [v4 unsafeData];
    uint64_t v16 = [v15 copy];
    unsafeData = v5->_unsafeData;
    v5->_unsafeData = (NSData *)v16;
  }
  return v5;
}

- (NSData)data
{
  return self->_unsafeData;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUVoucher)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TUVoucher;
  v5 = [(TUVoucher *)&v23 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_encryptedData);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    encryptedData = v5->_encryptedData;
    v5->_encryptedData = (NSData *)v8;

    uint64_t v10 = objc_opt_class();
    id v11 = NSStringFromSelector(sel_handle);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_tokenPrefixedURI);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    tokenPrefixedURI = v5->_tokenPrefixedURI;
    v5->_tokenPrefixedURI = (NSString *)v16;

    uint64_t v18 = objc_opt_class();
    objc_super v19 = NSStringFromSelector(sel_unsafeData);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    unsafeData = v5->_unsafeData;
    v5->_unsafeData = (NSData *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  encryptedData = self->_encryptedData;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_encryptedData);
  [v5 encodeObject:encryptedData forKey:v6];

  handle = self->_handle;
  uint64_t v8 = NSStringFromSelector(sel_handle);
  [v5 encodeObject:handle forKey:v8];

  tokenPrefixedURI = self->_tokenPrefixedURI;
  uint64_t v10 = NSStringFromSelector(sel_tokenPrefixedURI);
  [v5 encodeObject:tokenPrefixedURI forKey:v10];

  unsafeData = self->_unsafeData;
  NSStringFromSelector(sel_unsafeData);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:unsafeData forKey:v12];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TUVoucher allocWithZone:a3];

  return [(TUVoucher *)v4 initWithVoucher:self];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_handle);
  id v5 = [(TUVoucher *)self handle];
  [v3 appendFormat:@" %@=%@", v4, v5];

  uint64_t v6 = NSStringFromSelector(sel_tokenPrefixedURI);
  uint64_t v7 = [(TUVoucher *)self tokenPrefixedURI];
  [v3 appendFormat:@" %@=%@", v6, v7];

  uint64_t v8 = [(TUVoucher *)self data];
  objc_msgSend(v3, "appendFormat:", @" unsafeDataHash=%tu", objc_msgSend(v8, "hash"));

  v9 = [(TUVoucher *)self encryptedData];
  objc_msgSend(v3, "appendFormat:", @" encryptedDataHash=%tu", objc_msgSend(v9, "hash"));

  [v3 appendString:@">"];
  uint64_t v10 = (void *)[v3 copy];

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_encryptedData hash];
  unint64_t v4 = [(TUHandle *)self->_handle hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_tokenPrefixedURI hash];
  return v4 ^ v5 ^ [(NSData *)self->_unsafeData hash];
}

- (id)messagingData
{
  v2 = +[CSDMessagingVoucher voucherWithTUVoucher:self];
  uint64_t v3 = [v2 data];

  return v3;
}

+ (id)voucherFromMessagingData:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[CSDMessagingVoucher alloc] initWithData:v3];

  NSUInteger v5 = [(CSDMessagingVoucher *)v4 tuVoucher];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (TUVoucher *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TUVoucher *)self isEqualToVoucher:v4];
  }

  return v5;
}

- (BOOL)isEqualToVoucher:(id)a3
{
  id v4 = a3;
  encryptedData = self->_encryptedData;
  uint64_t v6 = [v4 encryptedData];
  if ([(NSData *)encryptedData isEqualToData:v6])
  {
    handle = self->_handle;
    uint64_t v8 = [v4 handle];
    if ([(TUHandle *)handle isEqualToHandle:v8])
    {
      tokenPrefixedURI = self->_tokenPrefixedURI;
      uint64_t v10 = [v4 tokenPrefixedURI];
      if ([(NSString *)tokenPrefixedURI isEqualToString:v10])
      {
        unsafeData = self->_unsafeData;
        id v12 = [v4 unsafeData];
        BOOL v13 = [(NSData *)unsafeData isEqualToData:v12];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (NSString)tokenPrefixedURI
{
  return self->_tokenPrefixedURI;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (NSData)unsafeData
{
  return self->_unsafeData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsafeData, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_tokenPrefixedURI, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end