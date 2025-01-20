@interface PBBProtoAcknowledgeBuysOnWatchCredentialIngestion
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDescription;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSString)errorDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)errorCode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(int)a3;
- (void)setErrorDescription:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoAcknowledgeBuysOnWatchCredentialIngestion

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

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoAcknowledgeBuysOnWatchCredentialIngestion;
  v4 = [(PBBProtoAcknowledgeBuysOnWatchCredentialIngestion *)&v8 description];
  v5 = [(PBBProtoAcknowledgeBuysOnWatchCredentialIngestion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = [NSNumber numberWithBool:self->_success];
    [v3 setObject:v4 forKey:@"success"];
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v3 setObject:errorDescription forKey:@"errorDescription"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithInt:self->_errorCode];
    [v3 setObject:v6 forKey:@"errorCode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoAcknowledgeBuysOnWatchCredentialIngestionReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[24] = self->_success;
    v4[28] |= 2u;
  }
  if (self->_errorDescription)
  {
    id v5 = v4;
    objc_msgSend(v4, "setErrorDescription:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_errorCode;
    v4[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 24) = self->_success;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_errorDescription copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 8) = self->_errorCode;
    *(unsigned char *)(v6 + 28) |= 1u;
  }
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
    if (self->_success)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_17;
  }
  errorDescription = self->_errorDescription;
  if (!((unint64_t)errorDescription | *((void *)v4 + 2))) {
    goto LABEL_13;
  }
  if (!-[NSString isEqual:](errorDescription, "isEqual:"))
  {
LABEL_17:
    BOOL v7 = 0;
    goto LABEL_18;
  }
  char has = (char)self->_has;
LABEL_13:
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_17;
    }
    BOOL v7 = 1;
  }
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_success;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_errorDescription hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    self->_success = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2))
  {
    id v5 = v4;
    -[PBBProtoAcknowledgeBuysOnWatchCredentialIngestion setErrorDescription:](self, "setErrorDescription:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 28))
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)success
{
  return self->_success;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (int)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
}

@end