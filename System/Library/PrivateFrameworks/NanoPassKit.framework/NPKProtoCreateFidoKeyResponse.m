@interface NPKProtoCreateFidoKeyResponse
- (BOOL)hasErrorData;
- (BOOL)hasFidoAttestation;
- (BOOL)hasFidoKey;
- (BOOL)hasKeyHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (NSData)fidoAttestation;
- (NSData)fidoKey;
- (NSData)keyHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setFidoAttestation:(id)a3;
- (void)setFidoKey:(id)a3;
- (void)setKeyHash:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCreateFidoKeyResponse

- (BOOL)hasFidoKey
{
  return self->_fidoKey != 0;
}

- (BOOL)hasFidoAttestation
{
  return self->_fidoAttestation != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (BOOL)hasKeyHash
{
  return self->_keyHash != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCreateFidoKeyResponse;
  v4 = [(NPKProtoCreateFidoKeyResponse *)&v8 description];
  v5 = [(NPKProtoCreateFidoKeyResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  fidoKey = self->_fidoKey;
  if (fidoKey) {
    [v3 setObject:fidoKey forKey:@"fidoKey"];
  }
  fidoAttestation = self->_fidoAttestation;
  if (fidoAttestation) {
    [v4 setObject:fidoAttestation forKey:@"fidoAttestation"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  keyHash = self->_keyHash;
  if (keyHash) {
    [v4 setObject:keyHash forKey:@"keyHash"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCreateFidoKeyResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fidoKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_fidoAttestation)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_keyHash)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_fidoKey)
  {
    objc_msgSend(v4, "setFidoKey:");
    id v4 = v5;
  }
  if (self->_fidoAttestation)
  {
    objc_msgSend(v5, "setFidoAttestation:");
    id v4 = v5;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    id v4 = v5;
  }
  if (self->_keyHash)
  {
    objc_msgSend(v5, "setKeyHash:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_fidoKey copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSData *)self->_fidoAttestation copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSData *)self->_errorData copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSData *)self->_keyHash copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((fidoKey = self->_fidoKey, !((unint64_t)fidoKey | v4[3]))
     || -[NSData isEqual:](fidoKey, "isEqual:"))
    && ((fidoAttestation = self->_fidoAttestation, !((unint64_t)fidoAttestation | v4[2]))
     || -[NSData isEqual:](fidoAttestation, "isEqual:"))
    && ((errorData = self->_errorData, !((unint64_t)errorData | v4[1]))
     || -[NSData isEqual:](errorData, "isEqual:")))
  {
    keyHash = self->_keyHash;
    if ((unint64_t)keyHash | v4[4]) {
      char v9 = -[NSData isEqual:](keyHash, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_fidoKey hash];
  uint64_t v4 = [(NSData *)self->_fidoAttestation hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_errorData hash];
  return v4 ^ v5 ^ [(NSData *)self->_keyHash hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[3]) {
    -[NPKProtoCreateFidoKeyResponse setFidoKey:](self, "setFidoKey:");
  }
  if (v4[2]) {
    -[NPKProtoCreateFidoKeyResponse setFidoAttestation:](self, "setFidoAttestation:");
  }
  if (v4[1]) {
    -[NPKProtoCreateFidoKeyResponse setErrorData:](self, "setErrorData:");
  }
  if (v4[4]) {
    -[NPKProtoCreateFidoKeyResponse setKeyHash:](self, "setKeyHash:");
  }
}

- (NSData)fidoKey
{
  return self->_fidoKey;
}

- (void)setFidoKey:(id)a3
{
}

- (NSData)fidoAttestation
{
  return self->_fidoAttestation;
}

- (void)setFidoAttestation:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (NSData)keyHash
{
  return self->_keyHash;
}

- (void)setKeyHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyHash, 0);
  objc_storeStrong((id *)&self->_fidoKey, 0);
  objc_storeStrong((id *)&self->_fidoAttestation, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end