@interface WCDProtoMessageRequest
- (BOOL)dictionaryMessage;
- (BOOL)expectsResponse;
- (BOOL)hasClientData;
- (BOOL)hasCoreLocationData;
- (BOOL)hasDictionaryMessage;
- (BOOL)hasExpectsResponse;
- (BOOL)hasIsInUse;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInUse;
- (BOOL)readFrom:(id)a3;
- (NSData)clientData;
- (NSData)coreLocationData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientData:(id)a3;
- (void)setCoreLocationData:(id)a3;
- (void)setDictionaryMessage:(BOOL)a3;
- (void)setExpectsResponse:(BOOL)a3;
- (void)setHasDictionaryMessage:(BOOL)a3;
- (void)setHasExpectsResponse:(BOOL)a3;
- (void)setHasIsInUse:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIsInUse:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WCDProtoMessageRequest

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasClientData
{
  return self->_clientData != 0;
}

- (void)setExpectsResponse:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_expectsResponse = a3;
}

- (void)setHasExpectsResponse:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasExpectsResponse
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDictionaryMessage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dictionaryMessage = a3;
}

- (void)setHasDictionaryMessage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDictionaryMessage
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsInUse:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isInUse = a3;
}

- (void)setHasIsInUse:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsInUse
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasCoreLocationData
{
  return self->_coreLocationData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)WCDProtoMessageRequest;
  char v3 = [(WCDProtoMessageRequest *)&v7 description];
  v4 = [(WCDProtoMessageRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  clientData = self->_clientData;
  if (clientData) {
    [v3 setObject:clientData forKey:@"clientData"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v10 = +[NSNumber numberWithBool:self->_expectsResponse];
    [v3 setObject:v10 forKey:@"expectsResponse"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v11 = +[NSNumber numberWithBool:self->_dictionaryMessage];
  [v3 setObject:v11 forKey:@"dictionaryMessage"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    objc_super v7 = +[NSNumber numberWithBool:self->_isInUse];
    [v3 setObject:v7 forKey:@"isInUse"];
  }
LABEL_9:
  coreLocationData = self->_coreLocationData;
  if (coreLocationData) {
    [v3 setObject:coreLocationData forKey:@"coreLocationData"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WCDProtoMessageRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_clientData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_9:
  if (self->_coreLocationData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_version;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v6 = v4;
  if (self->_clientData)
  {
    [v4 setClientData:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 29) = self->_expectsResponse;
    *((unsigned char *)v4 + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 28) = self->_dictionaryMessage;
  *((unsigned char *)v4 + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    *((unsigned char *)v4 + 30) = self->_isInUse;
    *((unsigned char *)v4 + 32) |= 8u;
  }
LABEL_9:
  if (self->_coreLocationData)
  {
    [v6 setCoreLocationData:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[6] = self->_version;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v7 = [(NSData *)self->_clientData copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *((unsigned char *)v6 + 28) = self->_dictionaryMessage;
    *((unsigned char *)v6 + 32) |= 2u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  *((unsigned char *)v6 + 29) = self->_expectsResponse;
  *((unsigned char *)v6 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *((unsigned char *)v6 + 30) = self->_isInUse;
    *((unsigned char *)v6 + 32) |= 8u;
  }
LABEL_7:
  id v10 = [(NSData *)self->_coreLocationData copyWithZone:a3];
  v11 = (void *)v6[2];
  v6[2] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_30;
  }
  clientData = self->_clientData;
  if ((unint64_t)clientData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](clientData, "isEqual:")) {
      goto LABEL_30;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0) {
      goto LABEL_30;
    }
    if (self->_expectsResponse)
    {
      if (!*((unsigned char *)v4 + 29)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 29))
    {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_30;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0) {
      goto LABEL_30;
    }
    if (self->_dictionaryMessage)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_30;
  }
  if ((has & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0) {
      goto LABEL_36;
    }
LABEL_30:
    unsigned __int8 v7 = 0;
    goto LABEL_31;
  }
  if ((*((unsigned char *)v4 + 32) & 8) == 0) {
    goto LABEL_30;
  }
  if (!self->_isInUse)
  {
    if (!*((unsigned char *)v4 + 30)) {
      goto LABEL_36;
    }
    goto LABEL_30;
  }
  if (!*((unsigned char *)v4 + 30)) {
    goto LABEL_30;
  }
LABEL_36:
  coreLocationData = self->_coreLocationData;
  if ((unint64_t)coreLocationData | *((void *)v4 + 2)) {
    unsigned __int8 v7 = -[NSData isEqual:](coreLocationData, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_31:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSData *)self->_clientData hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ (unint64_t)[(NSData *)self->_coreLocationData hash];
  }
  uint64_t v5 = 2654435761 * self->_expectsResponse;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_dictionaryMessage;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_isInUse;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ (unint64_t)[(NSData *)self->_coreLocationData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 32))
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[WCDProtoMessageRequest setClientData:](self, "setClientData:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_expectsResponse = *((unsigned char *)v4 + 29);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_dictionaryMessage = *((unsigned char *)v4 + 28);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
LABEL_8:
    self->_isInUse = *((unsigned char *)v4 + 30);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_9:
  if (*((void *)v4 + 2))
  {
    -[WCDProtoMessageRequest setCoreLocationData:](self, "setCoreLocationData:");
    id v4 = v6;
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

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (BOOL)dictionaryMessage
{
  return self->_dictionaryMessage;
}

- (BOOL)isInUse
{
  return self->_isInUse;
}

- (NSData)coreLocationData
{
  return self->_coreLocationData;
}

- (void)setCoreLocationData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreLocationData, 0);

  objc_storeStrong((id *)&self->_clientData, 0);
}

@end