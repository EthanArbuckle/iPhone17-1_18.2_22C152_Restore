@interface SDUnlockSessionAuthToken
- (BOOL)hasAuthToken;
- (BOOL)hasErrorCode;
- (BOOL)hasSessionID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)authToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSessionAuthToken

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

- (BOOL)hasAuthToken
{
  return self->_authToken != 0;
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
  v7.super_class = (Class)SDUnlockSessionAuthToken;
  char v3 = [(SDUnlockSessionAuthToken *)&v7 description];
  v4 = [(SDUnlockSessionAuthToken *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_sessionID];
    [v3 setObject:v6 forKey:@"sessionID"];
  }
  authToken = self->_authToken;
  if (authToken) {
    [v3 setObject:authToken forKey:@"authToken"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = +[NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v8 forKey:@"errorCode"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSessionAuthTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_authToken) {
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
    v4[6] = self->_version;
    *((unsigned char *)v4 + 28) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[5] = self->_sessionID;
    *((unsigned char *)v4 + 28) |= 2u;
  }
  if (self->_authToken)
  {
    v6 = v4;
    [v4 setAuthToken:];
    v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_errorCode;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[6] = self->_version;
    *((unsigned char *)v5 + 28) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[5] = self->_sessionID;
    *((unsigned char *)v5 + 28) |= 2u;
  }
  id v8 = [(NSData *)self->_authToken copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 4) = self->_errorCode;
    *((unsigned char *)v6 + 28) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_version != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_sessionID != *((_DWORD *)v4 + 5)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_19;
  }
  authToken = self->_authToken;
  if ((unint64_t)authToken | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](authToken, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_version;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_sessionID;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = (unint64_t)[(NSData *)self->_authToken hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_errorCode;
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
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if ((v5 & 2) != 0)
  {
    self->_sessionID = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[SDUnlockSessionAuthToken setAuthToken:](self, "setAuthToken:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 28))
  {
    self->_errorCode = *((_DWORD *)v4 + 4);
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

- (NSData)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
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