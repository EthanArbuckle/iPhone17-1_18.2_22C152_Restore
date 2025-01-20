@interface CSDMessagingVoucher
+ (CSDMessagingVoucher)voucherWithTUVoucher:(id)a3;
- (BOOL)hasEncryptedData;
- (BOOL)hasHandle;
- (BOOL)hasTokenPrefixedURI;
- (BOOL)hasUnsafeData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingHandle)handle;
- (NSData)encryptedData;
- (NSData)unsafeData;
- (NSString)tokenPrefixedURI;
- (TUVoucher)tuVoucher;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptedData:(id)a3;
- (void)setHandle:(id)a3;
- (void)setTokenPrefixedURI:(id)a3;
- (void)setUnsafeData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingVoucher

+ (CSDMessagingVoucher)voucherWithTUVoucher:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CSDMessagingVoucher);
  v5 = [v3 handle];
  v6 = +[CSDMessagingHandle handleWithTUHandle:v5];
  [(CSDMessagingVoucher *)v4 setHandle:v6];

  v7 = [v3 tokenPrefixedURI];
  [(CSDMessagingVoucher *)v4 setTokenPrefixedURI:v7];

  v8 = [v3 unsafeData];
  [(CSDMessagingVoucher *)v4 setUnsafeData:v8];

  v9 = [v3 encryptedData];

  [(CSDMessagingVoucher *)v4 setEncryptedData:v9];

  return v4;
}

- (TUVoucher)tuVoucher
{
  id v3 = objc_alloc((Class)TUVoucher);
  v4 = [(CSDMessagingVoucher *)self handle];
  v5 = [v4 tuHandle];
  v6 = [(CSDMessagingVoucher *)self tokenPrefixedURI];
  v7 = [(CSDMessagingVoucher *)self unsafeData];
  v8 = [(CSDMessagingVoucher *)self encryptedData];
  id v9 = [v3 initWithHandle:v5 tokenPrefixedURI:v6 data:v7 encryptedData:v8];

  return (TUVoucher *)v9;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasTokenPrefixedURI
{
  return self->_tokenPrefixedURI != 0;
}

- (BOOL)hasUnsafeData
{
  return self->_unsafeData != 0;
}

- (BOOL)hasEncryptedData
{
  return self->_encryptedData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingVoucher;
  id v3 = [(CSDMessagingVoucher *)&v7 description];
  v4 = [(CSDMessagingVoucher *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  handle = self->_handle;
  if (handle)
  {
    v5 = [(CSDMessagingHandle *)handle dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"handle"];
  }
  tokenPrefixedURI = self->_tokenPrefixedURI;
  if (tokenPrefixedURI) {
    [v3 setObject:tokenPrefixedURI forKey:@"tokenPrefixedURI"];
  }
  unsafeData = self->_unsafeData;
  if (unsafeData) {
    [v3 setObject:unsafeData forKey:@"unsafeData"];
  }
  encryptedData = self->_encryptedData;
  if (encryptedData) {
    [v3 setObject:encryptedData forKey:@"encryptedData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100137D04((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_handle)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_tokenPrefixedURI)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_unsafeData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_encryptedData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_handle)
  {
    objc_msgSend(v4, "setHandle:");
    id v4 = v5;
  }
  if (self->_tokenPrefixedURI)
  {
    objc_msgSend(v5, "setTokenPrefixedURI:");
    id v4 = v5;
  }
  if (self->_unsafeData)
  {
    objc_msgSend(v5, "setUnsafeData:");
    id v4 = v5;
  }
  if (self->_encryptedData)
  {
    objc_msgSend(v5, "setEncryptedData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CSDMessagingHandle *)self->_handle copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_tokenPrefixedURI copyWithZone:a3];
  id v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(NSData *)self->_unsafeData copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(NSData *)self->_encryptedData copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((handle = self->_handle, !((unint64_t)handle | v4[2]))
     || -[CSDMessagingHandle isEqual:](handle, "isEqual:"))
    && ((tokenPrefixedURI = self->_tokenPrefixedURI, !((unint64_t)tokenPrefixedURI | v4[3]))
     || -[NSString isEqual:](tokenPrefixedURI, "isEqual:"))
    && ((unsafeData = self->_unsafeData, !((unint64_t)unsafeData | v4[4]))
     || -[NSData isEqual:](unsafeData, "isEqual:")))
  {
    encryptedData = self->_encryptedData;
    if ((unint64_t)encryptedData | v4[1]) {
      unsigned __int8 v9 = -[NSData isEqual:](encryptedData, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(CSDMessagingHandle *)self->_handle hash];
  unint64_t v4 = [(NSString *)self->_tokenPrefixedURI hash] ^ v3;
  unint64_t v5 = (unint64_t)[(NSData *)self->_unsafeData hash];
  return v4 ^ v5 ^ (unint64_t)[(NSData *)self->_encryptedData hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  handle = self->_handle;
  uint64_t v6 = v4[2];
  objc_super v7 = v4;
  if (handle)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CSDMessagingHandle mergeFrom:](handle, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CSDMessagingVoucher setHandle:](self, "setHandle:");
  }
  unint64_t v4 = v7;
LABEL_7:
  if (v4[3])
  {
    -[CSDMessagingVoucher setTokenPrefixedURI:](self, "setTokenPrefixedURI:");
    unint64_t v4 = v7;
  }
  if (v4[4])
  {
    -[CSDMessagingVoucher setUnsafeData:](self, "setUnsafeData:");
    unint64_t v4 = v7;
  }
  if (v4[1])
  {
    -[CSDMessagingVoucher setEncryptedData:](self, "setEncryptedData:");
    unint64_t v4 = v7;
  }
}

- (CSDMessagingHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)tokenPrefixedURI
{
  return self->_tokenPrefixedURI;
}

- (void)setTokenPrefixedURI:(id)a3
{
}

- (NSData)unsafeData
{
  return self->_unsafeData;
}

- (void)setUnsafeData:(id)a3
{
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void)setEncryptedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsafeData, 0);
  objc_storeStrong((id *)&self->_tokenPrefixedURI, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_encryptedData, 0);
}

@end