@interface PCSManateePrivateKey
- (BOOL)hasPrivateKey;
- (BOOL)hasPublicKeyInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)privateKey;
- (NSData)publicKeyInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPrivateKey:(id)a3;
- (void)setPublicKeyInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PCSManateePrivateKey

- (BOOL)hasPrivateKey
{
  return self->_privateKey != 0;
}

- (BOOL)hasPublicKeyInfo
{
  return self->_publicKeyInfo != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PCSManateePrivateKey;
  v4 = [(PCSManateePrivateKey *)&v8 description];
  v5 = [(PCSManateePrivateKey *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  privateKey = self->_privateKey;
  if (privateKey) {
    [v3 setObject:privateKey forKey:@"privateKey"];
  }
  publicKeyInfo = self->_publicKeyInfo;
  if (publicKeyInfo) {
    [v4 setObject:publicKeyInfo forKey:@"publicKeyInfo"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PCSManateePrivateKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_privateKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_publicKeyInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_privateKey)
  {
    objc_msgSend(v4, "setPrivateKey:");
    id v4 = v5;
  }
  if (self->_publicKeyInfo)
  {
    objc_msgSend(v5, "setPublicKeyInfo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_privateKey copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_publicKeyInfo copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((privateKey = self->_privateKey, !((unint64_t)privateKey | v4[1]))
     || -[NSData isEqual:](privateKey, "isEqual:")))
  {
    publicKeyInfo = self->_publicKeyInfo;
    if ((unint64_t)publicKeyInfo | v4[2]) {
      char v7 = -[NSData isEqual:](publicKeyInfo, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_privateKey hash];
  return [(NSData *)self->_publicKeyInfo hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[PCSManateePrivateKey setPrivateKey:](self, "setPrivateKey:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[PCSManateePrivateKey setPublicKeyInfo:](self, "setPublicKeyInfo:");
    id v4 = v5;
  }
}

- (NSData)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(id)a3
{
}

- (NSData)publicKeyInfo
{
  return self->_publicKeyInfo;
}

- (void)setPublicKeyInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyInfo, 0);
  objc_storeStrong((id *)&self->_privateKey, 0);
}

@end