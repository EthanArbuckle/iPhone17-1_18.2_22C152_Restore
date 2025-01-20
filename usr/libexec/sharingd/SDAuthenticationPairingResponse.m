@interface SDAuthenticationPairingResponse
- (BOOL)hasErrorCode;
- (BOOL)hasLongTermKey;
- (BOOL)hasRequestArmingUI;
- (BOOL)hasSessionID;
- (BOOL)hasToken;
- (BOOL)hasType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requestArmingUI;
- (NSData)longTermKey;
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
- (void)setHasType:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLongTermKey:(id)a3;
- (void)setRequestArmingUI:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setToken:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAuthenticationPairingResponse

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

- (void)setType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (BOOL)hasLongTermKey
{
  return self->_longTermKey != 0;
}

- (BOOL)hasToken
{
  return self->_token != 0;
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

- (void)setRequestArmingUI:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_requestArmingUI = a3;
}

- (void)setHasRequestArmingUI:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRequestArmingUI
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAuthenticationPairingResponse;
  char v3 = [(SDAuthenticationPairingResponse *)&v7 description];
  v4 = [(SDAuthenticationPairingResponse *)self dictionaryRepresentation];
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
    v6 = +[NSNumber numberWithUnsignedInt:self->_type];
    [v3 setObject:v6 forKey:@"type"];
  }
  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  longTermKey = self->_longTermKey;
  if (longTermKey) {
    [v3 setObject:longTermKey forKey:@"longTermKey"];
  }
  token = self->_token;
  if (token) {
    [v3 setObject:token forKey:@"token"];
  }
  char v10 = (char)self->_has;
  if (v10)
  {
    v11 = +[NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v11 forKey:@"errorCode"];

    char v10 = (char)self->_has;
  }
  if ((v10 & 8) != 0)
  {
    v12 = +[NSNumber numberWithBool:self->_requestArmingUI];
    [v3 setObject:v12 forKey:@"requestArmingUI"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAuthenticationPairingResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_sessionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_longTermKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_token) {
    PBDataWriterWriteDataField();
  }
  char v5 = (char)self->_has;
  if (v5)
  {
    PBDataWriterWriteUint32Field();
    char v5 = (char)self->_has;
  }
  if ((v5 & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[11] = self->_version;
    *((unsigned char *)v4 + 52) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[10] = self->_type;
    *((unsigned char *)v4 + 52) |= 2u;
  }
  objc_super v7 = v4;
  if (self->_sessionID)
  {
    [v4 setSessionID:];
    v4 = v7;
  }
  if (self->_longTermKey)
  {
    [v7 setLongTermKey:];
    v4 = v7;
  }
  if (self->_token)
  {
    [v7 setToken:];
    v4 = v7;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    v4[2] = self->_errorCode;
    *((unsigned char *)v4 + 52) |= 1u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 8) != 0)
  {
    *((unsigned char *)v4 + 48) = self->_requestArmingUI;
    *((unsigned char *)v4 + 52) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = [[objc_opt_class() allocWithZone:a3] init];
  char v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[11] = self->_version;
    *((unsigned char *)v5 + 52) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[10] = self->_type;
    *((unsigned char *)v5 + 52) |= 2u;
  }
  id v8 = [(NSString *)self->_sessionID copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  id v10 = [(NSData *)self->_longTermKey copyWithZone:a3];
  v11 = (void *)v6[2];
  v6[2] = v10;

  id v12 = [(NSData *)self->_token copyWithZone:a3];
  v13 = (void *)v6[4];
  v6[4] = v12;

  char v14 = (char)self->_has;
  if (v14)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((unsigned char *)v6 + 52) |= 1u;
    char v14 = (char)self->_has;
  }
  if ((v14 & 8) != 0)
  {
    *((unsigned char *)v6 + 48) = self->_requestArmingUI;
    *((unsigned char *)v6 + 52) |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_version != *((_DWORD *)v4 + 11)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_25;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 3) && !-[NSString isEqual:](sessionID, "isEqual:")) {
    goto LABEL_25;
  }
  longTermKey = self->_longTermKey;
  if ((unint64_t)longTermKey | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](longTermKey, "isEqual:")) {
      goto LABEL_25;
    }
  }
  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](token, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_25;
  }
  BOOL v8 = (*((unsigned char *)v4 + 52) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0)
    {
LABEL_25:
      BOOL v8 = 0;
      goto LABEL_26;
    }
    if (self->_requestArmingUI)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_25;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_25;
    }
    BOOL v8 = 1;
  }
LABEL_26:

  return v8;
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
      uint64_t v4 = 2654435761 * self->_type;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_sessionID hash];
  unint64_t v6 = (unint64_t)[(NSData *)self->_longTermKey hash];
  unint64_t v7 = (unint64_t)[(NSData *)self->_token hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_errorCode;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_requestArmingUI;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 52);
  }
  if ((v5 & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  id v7 = v4;
  if (*((void *)v4 + 3))
  {
    -[SDAuthenticationPairingResponse setSessionID:](self, "setSessionID:");
    id v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[SDAuthenticationPairingResponse setLongTermKey:](self, "setLongTermKey:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[SDAuthenticationPairingResponse setToken:](self, "setToken:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 52);
  if (v6)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 52);
  }
  if ((v6 & 8) != 0)
  {
    self->_requestArmingUI = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
{
}

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (BOOL)requestArmingUI
{
  return self->_requestArmingUI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_longTermKey, 0);
}

@end