@interface SDAuthenticationResponse
- (BOOL)hasAksToken;
- (BOOL)hasAwdlInfo;
- (BOOL)hasErrorCode;
- (BOOL)hasSessionID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)aksToken;
- (NSData)awdlInfo;
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
- (void)setAwdlInfo:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationResponse

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

- (BOOL)hasAwdlInfo
{
  return self->_awdlInfo != 0;
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

- (BOOL)hasAksToken
{
  return self->_aksToken != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAuthenticationResponse;
  char v3 = [(SDAuthenticationResponse *)&v7 description];
  v4 = [(SDAuthenticationResponse *)self dictionaryRepresentation];
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
  awdlInfo = self->_awdlInfo;
  if (awdlInfo) {
    [v3 setObject:awdlInfo forKey:@"awdlInfo"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v7 forKey:@"errorCode"];
  }
  aksToken = self->_aksToken;
  if (aksToken) {
    [v3 setObject:aksToken forKey:@"aksToken"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_sessionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_awdlInfo)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_aksToken)
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
    v4[10] = self->_version;
    *((unsigned char *)v4 + 44) |= 2u;
  }
  id v5 = v4;
  if (self->_sessionID)
  {
    [v4 setSessionID:];
    id v4 = v5;
  }
  if (self->_awdlInfo)
  {
    [v5 setAwdlInfo:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_errorCode;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  if (self->_aksToken)
  {
    [v5 setAksToken:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[10] = self->_version;
    *((unsigned char *)v5 + 44) |= 2u;
  }
  id v7 = [(NSString *)self->_sessionID copyWithZone:a3];
  v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(NSData *)self->_awdlInfo copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 6) = self->_errorCode;
    *((unsigned char *)v6 + 44) |= 1u;
  }
  id v11 = [(NSData *)self->_aksToken copyWithZone:a3];
  v12 = (void *)v6[1];
  v6[1] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_version != *((_DWORD *)v4 + 10)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
LABEL_18:
    unsigned __int8 v8 = 0;
    goto LABEL_19;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 4) && !-[NSString isEqual:](sessionID, "isEqual:")) {
    goto LABEL_18;
  }
  awdlInfo = self->_awdlInfo;
  if ((unint64_t)awdlInfo | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](awdlInfo, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_18;
  }
  aksToken = self->_aksToken;
  if ((unint64_t)aksToken | *((void *)v4 + 1)) {
    unsigned __int8 v8 = -[NSData isEqual:](aksToken, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_19:

  return v8;
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
  unint64_t v5 = (unint64_t)[(NSData *)self->_awdlInfo hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ (unint64_t)[(NSData *)self->_aksToken hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[11] & 2) != 0)
  {
    self->_version = v4[10];
    *(unsigned char *)&self->_has |= 2u;
  }
  unint64_t v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[SDAuthenticationResponse setSessionID:](self, "setSessionID:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[SDAuthenticationResponse setAwdlInfo:](self, "setAwdlInfo:");
    NSUInteger v4 = v5;
  }
  if (v4[11])
  {
    self->_errorCode = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[SDAuthenticationResponse setAksToken:](self, "setAksToken:");
    NSUInteger v4 = v5;
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

- (NSData)awdlInfo
{
  return self->_awdlInfo;
}

- (void)setAwdlInfo:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (NSData)aksToken
{
  return self->_aksToken;
}

- (void)setAksToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_awdlInfo, 0);

  objc_storeStrong((id *)&self->_aksToken, 0);
}

@end