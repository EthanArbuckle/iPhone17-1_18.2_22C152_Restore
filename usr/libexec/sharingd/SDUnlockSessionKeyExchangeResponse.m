@interface SDUnlockSessionKeyExchangeResponse
- (BOOL)hasKey;
- (BOOL)hasKeyFailed;
- (BOOL)hasSessionID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)keyFailed;
- (BOOL)readFrom:(id)a3;
- (NSData)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasKeyFailed:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setKeyFailed:(BOOL)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSessionKeyExchangeResponse

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

- (void)setSessionID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionID
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setKeyFailed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_keyFailed = a3;
}

- (void)setHasKeyFailed:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKeyFailed
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDUnlockSessionKeyExchangeResponse;
  char v3 = [(SDUnlockSessionKeyExchangeResponse *)&v7 description];
  v4 = [(SDUnlockSessionKeyExchangeResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_sessionID];
    [v3 setObject:v6 forKey:@"sessionID"];
  }
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_keyFailed];
    [v3 setObject:v8 forKey:@"keyFailed"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSessionKeyExchangeResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_key) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_version;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[4] = self->_sessionID;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  if (self->_key)
  {
    v6 = v4;
    [v4 setKey:];
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 24) = self->_keyFailed;
    *((unsigned char *)v4 + 28) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[5] = self->_version;
    *((unsigned char *)v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[4] = self->_sessionID;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  id v8 = [(NSData *)self->_key copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v6 + 24) = self->_keyFailed;
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
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_sessionID != *((_DWORD *)v4 + 4)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_17;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](key, "isEqual:")) {
      goto LABEL_17;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) != 0)
    {
      if (self->_keyFailed)
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_version;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_sessionID;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = (unint64_t)[(NSData *)self->_key hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_keyFailed;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if (v5)
  {
    self->_sessionID = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[SDUnlockSessionKeyExchangeResponse setKey:](self, "setKey:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    self->_keyFailed = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 4u;
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

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (BOOL)keyFailed
{
  return self->_keyFailed;
}

- (void).cxx_destruct
{
}

@end