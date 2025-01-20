@interface SDUnlockSetupCreateRecord
- (BOOL)hasErrorCode;
- (BOOL)hasPairedDeviceID;
- (BOOL)hasSessionID;
- (BOOL)hasToken;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)token;
- (NSString)pairedDeviceID;
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
- (void)setHasVersion:(BOOL)a3;
- (void)setPairedDeviceID:(id)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setToken:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSetupCreateRecord

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

- (BOOL)hasPairedDeviceID
{
  return self->_pairedDeviceID != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDUnlockSetupCreateRecord;
  char v3 = [(SDUnlockSetupCreateRecord *)&v7 description];
  v4 = [(SDUnlockSetupCreateRecord *)self dictionaryRepresentation];
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
      if ((has & 1) == 0) {
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

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = +[NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v5 forKey:@"errorCode"];
  }
LABEL_5:
  token = self->_token;
  if (token) {
    [v3 setObject:token forKey:@"token"];
  }
  pairedDeviceID = self->_pairedDeviceID;
  if (pairedDeviceID) {
    [v3 setObject:pairedDeviceID forKey:@"pairedDeviceID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSetupCreateRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
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
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_token)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_pairedDeviceID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[10] = self->_version;
    *((unsigned char *)v4 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
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
  *((unsigned char *)v4 + 44) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v4[2] = self->_errorCode;
    *((unsigned char *)v4 + 44) |= 1u;
  }
LABEL_5:
  id v6 = v4;
  if (self->_token)
  {
    [v4 setToken:];
    id v4 = v6;
  }
  if (self->_pairedDeviceID)
  {
    [v6 setPairedDeviceID:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v5 + 6) = self->_sessionID;
    *((unsigned char *)v5 + 44) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 10) = self->_version;
  *((unsigned char *)v5 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *((_DWORD *)v5 + 2) = self->_errorCode;
    *((unsigned char *)v5 + 44) |= 1u;
  }
LABEL_5:
  id v8 = [(NSData *)self->_token copyWithZone:a3];
  v9 = (void *)v6[4];
  v6[4] = v8;

  id v10 = [(NSString *)self->_pairedDeviceID copyWithZone:a3];
  v11 = (void *)v6[2];
  v6[2] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_version != *((_DWORD *)v4 + 10)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
LABEL_21:
    unsigned __int8 v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_sessionID != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_21;
  }
  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 4) && !-[NSData isEqual:](token, "isEqual:")) {
    goto LABEL_21;
  }
  pairedDeviceID = self->_pairedDeviceID;
  if ((unint64_t)pairedDeviceID | *((void *)v4 + 2)) {
    unsigned __int8 v7 = -[NSString isEqual:](pairedDeviceID, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_22:

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
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_version;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_sessionID;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_errorCode;
LABEL_8:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ (unint64_t)[(NSData *)self->_token hash];
  return v6 ^ [(NSString *)self->_pairedDeviceID hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_sessionID = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 44))
  {
LABEL_4:
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[SDUnlockSetupCreateRecord setToken:](self, "setToken:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[SDUnlockSetupCreateRecord setPairedDeviceID:](self, "setPairedDeviceID:");
    id v4 = v6;
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

- (NSString)pairedDeviceID
{
  return self->_pairedDeviceID;
}

- (void)setPairedDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_pairedDeviceID, 0);
}

@end