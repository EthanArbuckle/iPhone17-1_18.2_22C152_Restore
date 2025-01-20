@interface NPKProtoPerformProductActionResponse
- (BOOL)hasAvailableProductsData;
- (BOOL)hasErrorData;
- (BOOL)hasPending;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NSData)availableProductsData;
- (NSData)errorData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvailableProductsData:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPerformProductActionResponse

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

- (BOOL)hasAvailableProductsData
{
  return self->_availableProductsData != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPerformProductActionResponse;
  v4 = [(NPKProtoPerformProductActionResponse *)&v8 description];
  v5 = [(NPKProtoPerformProductActionResponse *)self dictionaryRepresentation];
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
  availableProductsData = self->_availableProductsData;
  if (availableProductsData) {
    [v3 setObject:availableProductsData forKey:@"availableProductsData"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPerformProductActionResponseReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_availableProductsData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_errorData)
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
    v4[24] = self->_pending;
    v4[28] |= 1u;
  }
  id v5 = v4;
  if (self->_availableProductsData)
  {
    objc_msgSend(v4, "setAvailableProductsData:");
    id v4 = v5;
  }
  if (self->_errorData)
  {
    objc_msgSend(v5, "setErrorData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_pending;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_availableProductsData copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSData *)self->_errorData copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_pending)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    char v7 = 0;
    goto LABEL_15;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_14;
  }
LABEL_10:
  availableProductsData = self->_availableProductsData;
  if ((unint64_t)availableProductsData | *((void *)v4 + 1)
    && !-[NSData isEqual:](availableProductsData, "isEqual:"))
  {
    goto LABEL_14;
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 2)) {
    char v7 = -[NSData isEqual:](errorData, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_pending;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_availableProductsData hash] ^ v3;
  return v4 ^ [(NSData *)self->_errorData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[28])
  {
    self->_pending = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NPKProtoPerformProductActionResponse setAvailableProductsData:](self, "setAvailableProductsData:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NPKProtoPerformProductActionResponse setErrorData:](self, "setErrorData:");
    uint64_t v4 = v5;
  }
}

- (BOOL)pending
{
  return self->_pending;
}

- (NSData)availableProductsData
{
  return self->_availableProductsData;
}

- (void)setAvailableProductsData:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_availableProductsData, 0);
}

@end