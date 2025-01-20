@interface SDAuthenticationPairingCreateRecord
- (BOOL)hasErrorCode;
- (BOOL)hasRequestArmingUI;
- (BOOL)hasSessionID;
- (BOOL)hasToken;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requestArmingUI;
- (NSData)token;
- (NSString)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)type;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasRequestArmingUI:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setRequestArmingUI:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setToken:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationPairingCreateRecord

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

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (void)setRequestArmingUI:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_requestArmingUI = a3;
}

- (void)setHasRequestArmingUI:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequestArmingUI
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAuthenticationPairingCreateRecord;
  char v3 = [(SDAuthenticationPairingCreateRecord *)&v7 description];
  v4 = [(SDAuthenticationPairingCreateRecord *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v6 forKey:@"errorCode"];
  }
  token = self->_token;
  if (token) {
    [v3 setObject:token forKey:@"token"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_requestArmingUI];
    [v3 setObject:v8 forKey:@"requestArmingUI"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationPairingCreateRecordReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_token) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[8] = self->_version;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  v5 = v4;
  if (self->_sessionID)
  {
    [v4 setSessionID:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_errorCode;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_token)
  {
    [v5 setToken:];
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 36) = self->_requestArmingUI;
    *((unsigned char *)v4 + 40) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[8] = self->_version;
    *((unsigned char *)v5 + 40) |= 2u;
  }
  id v7 = [(NSString *)self->_sessionID copyWithZone:a3];
  v8 = (void *)v6[2];
  v6[2] = v7;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((unsigned char *)v6 + 40) |= 1u;
  }
  id v9 = [(NSData *)self->_token copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v6 + 36) = self->_requestArmingUI;
    *((unsigned char *)v6 + 40) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_version != *((_DWORD *)v4 + 8)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_20;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](sessionID, "isEqual:")) {
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_20;
  }
  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](token, "isEqual:")) {
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) != 0)
    {
      if (self->_requestArmingUI)
      {
        if (!*((unsigned char *)v4 + 36)) {
          goto LABEL_20;
        }
      }
      else if (*((unsigned char *)v4 + 36))
      {
        goto LABEL_20;
      }
      BOOL v8 = 1;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v8 = 0;
  }
LABEL_21:

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
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = (unint64_t)[(NSData *)self->_token hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_requestArmingUI;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[SDAuthenticationPairingCreateRecord setSessionID:](self, "setSessionID:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[SDAuthenticationPairingCreateRecord setToken:](self, "setToken:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    self->_requestArmingUI = *((unsigned char *)v4 + 36);
    *(unsigned char *)&self->_has |= 4u;
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

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (BOOL)requestArmingUI
{
  return self->_requestArmingUI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
}

- (unsigned)type
{
  return 0;
}

@end