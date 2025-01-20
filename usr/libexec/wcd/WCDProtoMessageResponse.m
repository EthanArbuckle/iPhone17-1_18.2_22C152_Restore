@interface WCDProtoMessageResponse
- (BOOL)dictionaryMessage;
- (BOOL)hasClientData;
- (BOOL)hasDictionaryMessage;
- (BOOL)hasErrorCode;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)clientData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientData:(id)a3;
- (void)setDictionaryMessage:(BOOL)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasDictionaryMessage:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WCDProtoMessageResponse

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasClientData
{
  return self->_clientData != 0;
}

- (void)setErrorCode:(unsigned int)a3
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

- (void)setDictionaryMessage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_dictionaryMessage = a3;
}

- (void)setHasDictionaryMessage:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDictionaryMessage
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)WCDProtoMessageResponse;
  char v3 = [(WCDProtoMessageResponse *)&v7 description];
  v4 = [(WCDProtoMessageResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  clientData = self->_clientData;
  if (clientData) {
    [v3 setObject:clientData forKey:@"clientData"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v7 forKey:@"errorCode"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_dictionaryMessage];
    [v3 setObject:v8 forKey:@"dictionaryMessage"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WCDProtoMessageResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_clientData) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[5] = self->_version;
    *((unsigned char *)v4 + 28) |= 2u;
  }
  if (self->_clientData)
  {
    v6 = v4;
    [v4 setClientData:];
    v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_errorCode;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 24) = self->_dictionaryMessage;
    *((unsigned char *)v4 + 28) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[5] = self->_version;
    *((unsigned char *)v5 + 28) |= 2u;
  }
  id v7 = [(NSData *)self->_clientData copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v6 + 4) = self->_errorCode;
    *((unsigned char *)v6 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((unsigned char *)v6 + 24) = self->_dictionaryMessage;
    *((unsigned char *)v6 + 28) |= 4u;
  }
  return v6;
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
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_version != *((_DWORD *)v4 + 5)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_17;
  }
  clientData = self->_clientData;
  if ((unint64_t)clientData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](clientData, "isEqual:")) {
      goto LABEL_17;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 4)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_17;
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) != 0)
    {
      if (self->_dictionaryMessage)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)v4 + 24))
      {
        goto LABEL_17;
      }
      BOOL v7 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v7 = 0;
  }
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSData *)self->_clientData hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_errorCode;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_dictionaryMessage;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[WCDProtoMessageResponse setClientData:](self, "setClientData:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_errorCode = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if ((v5 & 4) != 0)
  {
    self->_dictionaryMessage = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)clientData
{
  return self->_clientData;
}

- (void)setClientData:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (BOOL)dictionaryMessage
{
  return self->_dictionaryMessage;
}

- (void).cxx_destruct
{
}

@end