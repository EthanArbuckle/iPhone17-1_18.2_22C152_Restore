@interface NPKProtoInitializeCloudStoreIfNecessaryResponse
- (BOOL)hasErrorData;
- (BOOL)hasPending;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSData)errorData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoInitializeCloudStoreIfNecessaryResponse

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

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoInitializeCloudStoreIfNecessaryResponse;
  v4 = [(NPKProtoInitializeCloudStoreIfNecessaryResponse *)&v8 description];
  v5 = [(NPKProtoInitializeCloudStoreIfNecessaryResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v5 forKey:@"pending"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_success];
    [v3 setObject:v6 forKey:@"success"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoInitializeCloudStoreIfNecessaryResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[16] = self->_pending;
    v4[20] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[17] = self->_success;
    v4[20] |= 2u;
  }
  if (self->_errorData)
  {
    id v6 = v4;
    objc_msgSend(v4, "setErrorData:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[16] = self->_pending;
    v5[20] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[17] = self->_success;
    v5[20] |= 2u;
  }
  uint64_t v8 = [(NSData *)self->_errorData copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

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
    if ((*((unsigned char *)v4 + 20) & 1) == 0) {
      goto LABEL_14;
    }
    if (self->_pending)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0) {
      goto LABEL_20;
    }
LABEL_14:
    char v5 = 0;
    goto LABEL_15;
  }
  if ((*((unsigned char *)v4 + 20) & 2) == 0) {
    goto LABEL_14;
  }
  if (!self->_success)
  {
    if (!*((unsigned char *)v4 + 17)) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  if (!*((unsigned char *)v4 + 17)) {
    goto LABEL_14;
  }
LABEL_20:
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 1)) {
    char v5 = -[NSData isEqual:](errorData, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_pending;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSData *)self->_errorData hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_success;
  return v3 ^ v2 ^ [(NSData *)self->_errorData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = v4[20];
  if (v5)
  {
    self->_pending = v4[16];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = v4[20];
  }
  if ((v5 & 2) != 0)
  {
    self->_success = v4[17];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[NPKProtoInitializeCloudStoreIfNecessaryResponse setErrorData:](self, "setErrorData:");
    id v4 = v6;
  }
}

- (BOOL)pending
{
  return self->_pending;
}

- (BOOL)success
{
  return self->_success;
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
}

@end