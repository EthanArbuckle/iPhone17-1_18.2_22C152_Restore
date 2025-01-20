@interface NPKProtoSignDataResponse
- (BOOL)hasCertsBytes;
- (BOOL)hasPending;
- (BOOL)hasSignatureInfoBytes;
- (BOOL)hasSignedData;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NSData)certsBytes;
- (NSData)signatureInfoBytes;
- (NSData)signedData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCertsBytes:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)setSignatureInfoBytes:(id)a3;
- (void)setSignedData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoSignDataResponse

- (void)setPending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPending
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSignedData
{
  return self->_signedData != 0;
}

- (BOOL)hasCertsBytes
{
  return self->_certsBytes != 0;
}

- (BOOL)hasSignatureInfoBytes
{
  return self->_signatureInfoBytes != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSignDataResponse;
  v4 = [(NPKProtoSignDataResponse *)&v8 description];
  v5 = [(NPKProtoSignDataResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v4 forKey:@"pending"];
  }
  signedData = self->_signedData;
  if (signedData) {
    [v3 setObject:signedData forKey:@"signedData"];
  }
  certsBytes = self->_certsBytes;
  if (certsBytes) {
    [v3 setObject:certsBytes forKey:@"certsBytes"];
  }
  signatureInfoBytes = self->_signatureInfoBytes;
  if (signatureInfoBytes) {
    [v3 setObject:signatureInfoBytes forKey:@"signatureInfoBytes"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSignDataResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_signedData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_certsBytes)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_signatureInfoBytes)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[32] = self->_pending;
    v4[36] |= 1u;
  }
  id v5 = v4;
  if (self->_signedData)
  {
    objc_msgSend(v4, "setSignedData:");
    id v4 = v5;
  }
  if (self->_certsBytes)
  {
    objc_msgSend(v5, "setCertsBytes:");
    id v4 = v5;
  }
  if (self->_signatureInfoBytes)
  {
    objc_msgSend(v5, "setSignatureInfoBytes:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 32) = self->_pending;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_signedData copyWithZone:a3];
  objc_super v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = [(NSData *)self->_certsBytes copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  uint64_t v11 = [(NSData *)self->_signatureInfoBytes copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 36))
    {
      if (self->_pending)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_16;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
LABEL_16:
    char v8 = 0;
    goto LABEL_17;
  }
  if (*((unsigned char *)v4 + 36)) {
    goto LABEL_16;
  }
LABEL_10:
  signedData = self->_signedData;
  if ((unint64_t)signedData | *((void *)v4 + 3) && !-[NSData isEqual:](signedData, "isEqual:")) {
    goto LABEL_16;
  }
  certsBytes = self->_certsBytes;
  if ((unint64_t)certsBytes | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](certsBytes, "isEqual:")) {
      goto LABEL_16;
    }
  }
  signatureInfoBytes = self->_signatureInfoBytes;
  if ((unint64_t)signatureInfoBytes | *((void *)v4 + 2)) {
    char v8 = -[NSData isEqual:](signatureInfoBytes, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_pending;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_signedData hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_certsBytes hash];
  return v4 ^ v5 ^ [(NSData *)self->_signatureInfoBytes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[36])
  {
    self->_pending = v4[32];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[NPKProtoSignDataResponse setSignedData:](self, "setSignedData:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[NPKProtoSignDataResponse setCertsBytes:](self, "setCertsBytes:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NPKProtoSignDataResponse setSignatureInfoBytes:](self, "setSignatureInfoBytes:");
    uint64_t v4 = v5;
  }
}

- (BOOL)pending
{
  return self->_pending;
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(id)a3
{
}

- (NSData)certsBytes
{
  return self->_certsBytes;
}

- (void)setCertsBytes:(id)a3
{
}

- (NSData)signatureInfoBytes
{
  return self->_signatureInfoBytes;
}

- (void)setSignatureInfoBytes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedData, 0);
  objc_storeStrong((id *)&self->_signatureInfoBytes, 0);
  objc_storeStrong((id *)&self->_certsBytes, 0);
}

@end