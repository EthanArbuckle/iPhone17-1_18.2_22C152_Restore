@interface NPKProtoPaymentWebServiceRegistrationResponse
- (BOOL)hasErrorData;
- (BOOL)hasPending;
- (BOOL)hasRegistrationResult;
- (BOOL)hasWebServiceContextData;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NSData)errorData;
- (NSData)webServiceContextData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)registrationResult;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setHasRegistrationResult:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)setRegistrationResult:(unsigned int)a3;
- (void)setWebServiceContextData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPaymentWebServiceRegistrationResponse

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

- (void)setRegistrationResult:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_registrationResult = a3;
}

- (void)setHasRegistrationResult:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRegistrationResult
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (BOOL)hasWebServiceContextData
{
  return self->_webServiceContextData != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPaymentWebServiceRegistrationResponse;
  v4 = [(NPKProtoPaymentWebServiceRegistrationResponse *)&v8 description];
  v5 = [(NPKProtoPaymentWebServiceRegistrationResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v5 forKey:@"pending"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_registrationResult];
    [v3 setObject:v6 forKey:@"registrationResult"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  webServiceContextData = self->_webServiceContextData;
  if (webServiceContextData) {
    [v3 setObject:webServiceContextData forKey:@"webServiceContextData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPaymentWebServiceRegistrationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_errorData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_webServiceContextData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[32] = self->_pending;
    v4[36] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_registrationResult;
    v4[36] |= 1u;
  }
  id v6 = v4;
  if (self->_errorData)
  {
    objc_msgSend(v4, "setErrorData:");
    id v4 = v6;
  }
  if (self->_webServiceContextData)
  {
    objc_msgSend(v6, "setWebServiceContextData:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_pending;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_registrationResult;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v8 = [(NSData *)self->_errorData copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  uint64_t v10 = [(NSData *)self->_webServiceContextData copyWithZone:a3];
  v11 = (void *)v6[3];
  v6[3] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) != 0)
    {
      if (self->_pending)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_19;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
LABEL_19:
    char v7 = 0;
    goto LABEL_20;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0) {
    goto LABEL_19;
  }
LABEL_10:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_registrationResult != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 1) && !-[NSData isEqual:](errorData, "isEqual:")) {
    goto LABEL_19;
  }
  webServiceContextData = self->_webServiceContextData;
  if ((unint64_t)webServiceContextData | *((void *)v4 + 3)) {
    char v7 = -[NSData isEqual:](webServiceContextData, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_pending;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_registrationResult;
LABEL_6:
  uint64_t v5 = v4 ^ v3 ^ [(NSData *)self->_errorData hash];
  return v5 ^ [(NSData *)self->_webServiceContextData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_pending = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if (v5)
  {
    self->_registrationResult = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[NPKProtoPaymentWebServiceRegistrationResponse setErrorData:](self, "setErrorData:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[NPKProtoPaymentWebServiceRegistrationResponse setWebServiceContextData:](self, "setWebServiceContextData:");
    id v4 = v6;
  }
}

- (BOOL)pending
{
  return self->_pending;
}

- (unsigned)registrationResult
{
  return self->_registrationResult;
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (NSData)webServiceContextData
{
  return self->_webServiceContextData;
}

- (void)setWebServiceContextData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webServiceContextData, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end