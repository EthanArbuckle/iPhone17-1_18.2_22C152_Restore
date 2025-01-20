@interface SharedOwnershipAuth
- (BOOL)hasChannelPublicKey;
- (BOOL)hasNonce;
- (BOOL)hasServerEncryptionKey;
- (BOOL)hasSignNonce;
- (BOOL)hasSimpleJwt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)channelPublicKey;
- (NSData)nonce;
- (NSData)serverEncryptionKey;
- (NSData)signNonce;
- (NSString)simpleJwt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelPublicKey:(id)a3;
- (void)setNonce:(id)a3;
- (void)setServerEncryptionKey:(id)a3;
- (void)setSignNonce:(id)a3;
- (void)setSimpleJwt:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SharedOwnershipAuth

- (BOOL)hasSimpleJwt
{
  return self->_simpleJwt != 0;
}

- (BOOL)hasChannelPublicKey
{
  return self->_channelPublicKey != 0;
}

- (BOOL)hasNonce
{
  return self->_nonce != 0;
}

- (BOOL)hasSignNonce
{
  return self->_signNonce != 0;
}

- (BOOL)hasServerEncryptionKey
{
  return self->_serverEncryptionKey != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SharedOwnershipAuth;
  v4 = [(SharedOwnershipAuth *)&v8 description];
  v5 = [(SharedOwnershipAuth *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  simpleJwt = self->_simpleJwt;
  if (simpleJwt) {
    [v3 setObject:simpleJwt forKey:@"simple_jwt"];
  }
  channelPublicKey = self->_channelPublicKey;
  if (channelPublicKey) {
    [v4 setObject:channelPublicKey forKey:@"channel_public_key"];
  }
  nonce = self->_nonce;
  if (nonce) {
    [v4 setObject:nonce forKey:@"nonce"];
  }
  signNonce = self->_signNonce;
  if (signNonce) {
    [v4 setObject:signNonce forKey:@"sign_nonce"];
  }
  serverEncryptionKey = self->_serverEncryptionKey;
  if (serverEncryptionKey) {
    [v4 setObject:serverEncryptionKey forKey:@"server_encryption_key"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SharedOwnershipAuthReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_simpleJwt)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_channelPublicKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_nonce)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_signNonce)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_serverEncryptionKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_simpleJwt)
  {
    objc_msgSend(v4, "setSimpleJwt:");
    id v4 = v5;
  }
  if (self->_channelPublicKey)
  {
    objc_msgSend(v5, "setChannelPublicKey:");
    id v4 = v5;
  }
  if (self->_nonce)
  {
    objc_msgSend(v5, "setNonce:");
    id v4 = v5;
  }
  if (self->_signNonce)
  {
    objc_msgSend(v5, "setSignNonce:");
    id v4 = v5;
  }
  if (self->_serverEncryptionKey)
  {
    objc_msgSend(v5, "setServerEncryptionKey:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_simpleJwt copyWithZone:a3];
  v7 = (void *)v5[5];
  v5[5] = v6;

  uint64_t v8 = [(NSData *)self->_channelPublicKey copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSData *)self->_nonce copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSData *)self->_signNonce copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSData *)self->_serverEncryptionKey copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((simpleJwt = self->_simpleJwt, !((unint64_t)simpleJwt | v4[5]))
     || -[NSString isEqual:](simpleJwt, "isEqual:"))
    && ((channelPublicKey = self->_channelPublicKey, !((unint64_t)channelPublicKey | v4[1]))
     || -[NSData isEqual:](channelPublicKey, "isEqual:"))
    && ((nonce = self->_nonce, !((unint64_t)nonce | v4[2])) || -[NSData isEqual:](nonce, "isEqual:"))&& ((signNonce = self->_signNonce, !((unint64_t)signNonce | v4[4]))|| -[NSData isEqual:](signNonce, "isEqual:")))
  {
    serverEncryptionKey = self->_serverEncryptionKey;
    if ((unint64_t)serverEncryptionKey | v4[3]) {
      char v10 = -[NSData isEqual:](serverEncryptionKey, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_simpleJwt hash];
  uint64_t v4 = [(NSData *)self->_channelPublicKey hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_nonce hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_signNonce hash];
  return v6 ^ [(NSData *)self->_serverEncryptionKey hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[5]) {
    -[SharedOwnershipAuth setSimpleJwt:](self, "setSimpleJwt:");
  }
  if (v4[1]) {
    -[SharedOwnershipAuth setChannelPublicKey:](self, "setChannelPublicKey:");
  }
  if (v4[2]) {
    -[SharedOwnershipAuth setNonce:](self, "setNonce:");
  }
  if (v4[4]) {
    -[SharedOwnershipAuth setSignNonce:](self, "setSignNonce:");
  }
  if (v4[3]) {
    -[SharedOwnershipAuth setServerEncryptionKey:](self, "setServerEncryptionKey:");
  }
}

- (NSString)simpleJwt
{
  return self->_simpleJwt;
}

- (void)setSimpleJwt:(id)a3
{
}

- (NSData)channelPublicKey
{
  return self->_channelPublicKey;
}

- (void)setChannelPublicKey:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSData)signNonce
{
  return self->_signNonce;
}

- (void)setSignNonce:(id)a3
{
}

- (NSData)serverEncryptionKey
{
  return self->_serverEncryptionKey;
}

- (void)setServerEncryptionKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simpleJwt, 0);
  objc_storeStrong((id *)&self->_signNonce, 0);
  objc_storeStrong((id *)&self->_serverEncryptionKey, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_channelPublicKey, 0);
}

@end