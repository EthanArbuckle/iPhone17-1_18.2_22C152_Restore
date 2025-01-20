@interface NPKProtoCloudStoreStatusResponse
- (BOOL)cloudStoreIsSetup;
- (BOOL)hasAccountInfoData;
- (BOOL)hasCloudStoreIsSetup;
- (BOOL)hasErrorData;
- (BOOL)hasPending;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NSData)accountInfoData;
- (NSData)errorData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountInfoData:(id)a3;
- (void)setCloudStoreIsSetup:(BOOL)a3;
- (void)setErrorData:(id)a3;
- (void)setHasCloudStoreIsSetup:(BOOL)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCloudStoreStatusResponse

- (void)setPending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPending
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAccountInfoData
{
  return self->_accountInfoData != 0;
}

- (void)setCloudStoreIsSetup:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cloudStoreIsSetup = a3;
}

- (void)setHasCloudStoreIsSetup:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCloudStoreIsSetup
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCloudStoreStatusResponse;
  v4 = [(NPKProtoCloudStoreStatusResponse *)&v8 description];
  v5 = [(NPKProtoCloudStoreStatusResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v4 forKey:@"pending"];
  }
  accountInfoData = self->_accountInfoData;
  if (accountInfoData) {
    [v3 setObject:accountInfoData forKey:@"accountInfoData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_cloudStoreIsSetup];
    [v3 setObject:v6 forKey:@"cloudStoreIsSetup"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCloudStoreStatusResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_accountInfoData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[25] = self->_pending;
    v4[28] |= 2u;
  }
  id v5 = v4;
  if (self->_accountInfoData)
  {
    objc_msgSend(v4, "setAccountInfoData:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_cloudStoreIsSetup;
    v4[28] |= 1u;
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
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 25) = self->_pending;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  uint64_t v7 = [(NSData *)self->_accountInfoData copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v6 + 24) = self->_cloudStoreIsSetup;
    *(unsigned char *)(v6 + 28) |= 1u;
  }
  uint64_t v9 = [(NSData *)self->_errorData copyWithZone:a3];
  v10 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v9;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0) {
      goto LABEL_17;
    }
    if (self->_pending)
    {
      if (!*((unsigned char *)v4 + 25)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 25))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_17;
  }
  accountInfoData = self->_accountInfoData;
  if ((unint64_t)accountInfoData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](accountInfoData, "isEqual:")) {
      goto LABEL_17;
    }
    char has = (char)self->_has;
  }
  if ((has & 1) == 0)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0) {
      goto LABEL_23;
    }
LABEL_17:
    char v7 = 0;
    goto LABEL_18;
  }
  if ((*((unsigned char *)v4 + 28) & 1) == 0) {
    goto LABEL_17;
  }
  if (!self->_cloudStoreIsSetup)
  {
    if (!*((unsigned char *)v4 + 24)) {
      goto LABEL_23;
    }
    goto LABEL_17;
  }
  if (!*((unsigned char *)v4 + 24)) {
    goto LABEL_17;
  }
LABEL_23:
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 2)) {
    char v7 = -[NSData isEqual:](errorData, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_pending;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_accountInfoData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_cloudStoreIsSetup;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSData *)self->_errorData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if ((v4[28] & 2) != 0)
  {
    self->_pending = v4[25];
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NPKProtoCloudStoreStatusResponse setAccountInfoData:](self, "setAccountInfoData:");
    uint64_t v4 = v5;
  }
  if (v4[28])
  {
    self->_cloudStoreIsSetup = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[NPKProtoCloudStoreStatusResponse setErrorData:](self, "setErrorData:");
    uint64_t v4 = v5;
  }
}

- (BOOL)pending
{
  return self->_pending;
}

- (NSData)accountInfoData
{
  return self->_accountInfoData;
}

- (void)setAccountInfoData:(id)a3
{
}

- (BOOL)cloudStoreIsSetup
{
  return self->_cloudStoreIsSetup;
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
  objc_storeStrong((id *)&self->_accountInfoData, 0);
}

@end