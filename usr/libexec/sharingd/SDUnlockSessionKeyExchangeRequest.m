@interface SDUnlockSessionKeyExchangeRequest
- (BOOL)hasErrorCode;
- (BOOL)hasKey;
- (BOOL)hasSessionID;
- (BOOL)hasUsingRecord;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)usingRecord;
- (NSData)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasUsingRecord:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setUsingRecord:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSessionKeyExchangeRequest

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSessionID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUsingRecord:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_usingRecord = a3;
}

- (void)setHasUsingRecord:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUsingRecord
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasKey
{
  return self->_key != 0;
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

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDUnlockSessionKeyExchangeRequest;
  char v3 = [(SDUnlockSessionKeyExchangeRequest *)&v7 description];
  v4 = [(SDUnlockSessionKeyExchangeRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v9 forKey:@"version"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = +[NSNumber numberWithUnsignedInt:self->_sessionID];
  [v3 setObject:v10 forKey:@"sessionID"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    v5 = +[NSNumber numberWithBool:self->_usingRecord];
    [v3 setObject:v5 forKey:@"usingRecord"];
  }
LABEL_5:
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v7 forKey:@"errorCode"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSessionKeyExchangeRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  if (self->_key) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[7] = self->_version;
    *((unsigned char *)v4 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_sessionID;
  *((unsigned char *)v4 + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 32) = self->_usingRecord;
    *((unsigned char *)v4 + 36) |= 8u;
  }
LABEL_5:
  if (self->_key)
  {
    v6 = v4;
    [v4 setKey:];
    v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_errorCode;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[7] = self->_version;
    *((unsigned char *)v5 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[6] = self->_sessionID;
  *((unsigned char *)v5 + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    *((unsigned char *)v5 + 32) = self->_usingRecord;
    *((unsigned char *)v5 + 36) |= 8u;
  }
LABEL_5:
  id v8 = [(NSData *)self->_key copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((unsigned char *)v6 + 36) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_version != *((_DWORD *)v4 + 7)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_sessionID != *((_DWORD *)v4 + 6)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0) {
      goto LABEL_27;
    }
    if (self->_usingRecord)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_27;
  }
  key = self->_key;
  if (!((unint64_t)key | *((void *)v4 + 2))) {
    goto LABEL_23;
  }
  if (!-[NSData isEqual:](key, "isEqual:"))
  {
LABEL_27:
    BOOL v7 = 0;
    goto LABEL_28;
  }
  char has = (char)self->_has;
LABEL_23:
  BOOL v7 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_27;
    }
    BOOL v7 = 1;
  }
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_version;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_sessionID;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_usingRecord;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  unint64_t v6 = (unint64_t)[(NSData *)self->_key hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_sessionID = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_4:
    self->_usingRecord = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_5:
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[SDUnlockSessionKeyExchangeRequest setKey:](self, "setKey:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 36))
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (BOOL)usingRecord
{
  return self->_usingRecord;
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
}

@end