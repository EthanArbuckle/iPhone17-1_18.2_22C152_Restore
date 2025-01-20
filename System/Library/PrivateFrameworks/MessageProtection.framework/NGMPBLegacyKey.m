@interface NGMPBLegacyKey
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptionKey;
- (NSData)signingKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setSigningKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NGMPBLegacyKey

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NGMPBLegacyKey;
  v4 = [(NGMPBLegacyKey *)&v8 description];
  v5 = [(NGMPBLegacyKey *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  encryptionKey = self->_encryptionKey;
  if (encryptionKey) {
    [v3 setObject:encryptionKey forKey:@"encryptionKey"];
  }
  signingKey = self->_signingKey;
  if (signingKey) {
    [v4 setObject:signingKey forKey:@"signingKey"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBLegacyKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_encryptionKey) {
    -[NGMPBLegacyKey writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
  if (!self->_signingKey) {
    -[NGMPBLegacyKey writeTo:]();
  }
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  encryptionKey = self->_encryptionKey;
  id v5 = a3;
  [v5 setEncryptionKey:encryptionKey];
  [v5 setSigningKey:self->_signingKey];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_encryptionKey copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_signingKey copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((encryptionKey = self->_encryptionKey, !((unint64_t)encryptionKey | v4[1]))
     || -[NSData isEqual:](encryptionKey, "isEqual:")))
  {
    signingKey = self->_signingKey;
    if ((unint64_t)signingKey | v4[2]) {
      char v7 = -[NSData isEqual:](signingKey, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_encryptionKey hash];
  return [(NSData *)self->_signingKey hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[NGMPBLegacyKey setEncryptionKey:](self, "setEncryptionKey:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[NGMPBLegacyKey setSigningKey:](self, "setSigningKey:");
    id v4 = v5;
  }
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSData)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingKey, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NGMPBLegacyKey writeTo:]", "NGMPBLegacyKey.m", 83, "nil != self->_encryptionKey");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NGMPBLegacyKey writeTo:]", "NGMPBLegacyKey.m", 88, "nil != self->_signingKey");
}

@end