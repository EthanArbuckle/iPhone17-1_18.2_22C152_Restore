@interface SDAuthenticationToken
- (BOOL)hasAksToken;
- (BOOL)hasErrorCode;
- (BOOL)hasSessionID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)aksToken;
- (NSString)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAksToken:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationToken

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

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (BOOL)hasAksToken
{
  return self->_aksToken != 0;
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
  v7.super_class = (Class)SDAuthenticationToken;
  char v3 = [(SDAuthenticationToken *)&v7 description];
  v4 = [(SDAuthenticationToken *)self dictionaryRepresentation];
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
  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  aksToken = self->_aksToken;
  if (aksToken) {
    [v3 setObject:aksToken forKey:@"aksToken"];
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
  return SDAuthenticationTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_sessionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_aksToken) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[8] = self->_version;
    *((unsigned char *)v4 + 36) |= 2u;
  }
  v5 = v4;
  if (self->_sessionID)
  {
    [v4 setSessionID:];
    id v4 = v5;
  }
  if (self->_aksToken)
  {
    [v5 setAksToken:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_errorCode;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[8] = self->_version;
    *((unsigned char *)v5 + 36) |= 2u;
  }
  id v7 = [(NSString *)self->_sessionID copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(NSData *)self->_aksToken copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 4) = self->_errorCode;
    *((unsigned char *)v6 + 36) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_version != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 3) && !-[NSString isEqual:](sessionID, "isEqual:")) {
    goto LABEL_15;
  }
  aksToken = self->_aksToken;
  if ((unint64_t)aksToken | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](aksToken, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
    BOOL v7 = 1;
  }
LABEL_16:

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
  NSUInteger v4 = [(NSString *)self->_sessionID hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_aksToken hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[9] & 2) != 0)
  {
    self->_version = v4[8];
    *(unsigned char *)&self->_has |= 2u;
  }
  unint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[SDAuthenticationToken setSessionID:](self, "setSessionID:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[SDAuthenticationToken setAksToken:](self, "setAksToken:");
    NSUInteger v4 = v5;
  }
  if (v4[9])
  {
    self->_errorCode = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSData)aksToken
{
  return self->_aksToken;
}

- (void)setAksToken:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_aksToken, 0);
}

@end