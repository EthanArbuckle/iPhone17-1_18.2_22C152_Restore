@interface NPKProtoCarKeyDecryptDataRequest
- (BOOL)hasCredentialData;
- (BOOL)hasEncryptedData;
- (BOOL)hasEphemeralPublicKeyData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)credentialData;
- (NSData)encryptedData;
- (NSData)ephemeralPublicKeyData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCredentialData:(id)a3;
- (void)setEncryptedData:(id)a3;
- (void)setEphemeralPublicKeyData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCarKeyDecryptDataRequest

- (BOOL)hasEncryptedData
{
  return self->_encryptedData != 0;
}

- (BOOL)hasCredentialData
{
  return self->_credentialData != 0;
}

- (BOOL)hasEphemeralPublicKeyData
{
  return self->_ephemeralPublicKeyData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCarKeyDecryptDataRequest;
  v4 = [(NPKProtoCarKeyDecryptDataRequest *)&v8 description];
  v5 = [(NPKProtoCarKeyDecryptDataRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  encryptedData = self->_encryptedData;
  if (encryptedData) {
    [v3 setObject:encryptedData forKey:@"encryptedData"];
  }
  credentialData = self->_credentialData;
  if (credentialData) {
    [v4 setObject:credentialData forKey:@"credentialData"];
  }
  ephemeralPublicKeyData = self->_ephemeralPublicKeyData;
  if (ephemeralPublicKeyData) {
    [v4 setObject:ephemeralPublicKeyData forKey:@"ephemeralPublicKeyData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyDecryptDataRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptedData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_credentialData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_ephemeralPublicKeyData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptedData)
  {
    objc_msgSend(v4, "setEncryptedData:");
    id v4 = v5;
  }
  if (self->_credentialData)
  {
    objc_msgSend(v5, "setCredentialData:");
    id v4 = v5;
  }
  if (self->_ephemeralPublicKeyData)
  {
    objc_msgSend(v5, "setEphemeralPublicKeyData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_encryptedData copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_credentialData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSData *)self->_ephemeralPublicKeyData copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((encryptedData = self->_encryptedData, !((unint64_t)encryptedData | v4[2]))
     || -[NSData isEqual:](encryptedData, "isEqual:"))
    && ((credentialData = self->_credentialData, !((unint64_t)credentialData | v4[1]))
     || -[NSData isEqual:](credentialData, "isEqual:")))
  {
    ephemeralPublicKeyData = self->_ephemeralPublicKeyData;
    if ((unint64_t)ephemeralPublicKeyData | v4[3]) {
      char v8 = -[NSData isEqual:](ephemeralPublicKeyData, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_encryptedData hash];
  uint64_t v4 = [(NSData *)self->_credentialData hash] ^ v3;
  return v4 ^ [(NSData *)self->_ephemeralPublicKeyData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[2]) {
    -[NPKProtoCarKeyDecryptDataRequest setEncryptedData:](self, "setEncryptedData:");
  }
  if (v4[1]) {
    -[NPKProtoCarKeyDecryptDataRequest setCredentialData:](self, "setCredentialData:");
  }
  if (v4[3]) {
    -[NPKProtoCarKeyDecryptDataRequest setEphemeralPublicKeyData:](self, "setEphemeralPublicKeyData:");
  }
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void)setEncryptedData:(id)a3
{
}

- (NSData)credentialData
{
  return self->_credentialData;
}

- (void)setCredentialData:(id)a3
{
}

- (NSData)ephemeralPublicKeyData
{
  return self->_ephemeralPublicKeyData;
}

- (void)setEphemeralPublicKeyData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralPublicKeyData, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_credentialData, 0);
}

@end