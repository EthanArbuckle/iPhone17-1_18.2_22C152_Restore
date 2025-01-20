@interface SDUnlockSetupSessionCreated
- (BOOL)hasErrorCode;
- (BOOL)hasFailureReasons;
- (BOOL)hasLongTermKey;
- (BOOL)hasLtkHash;
- (BOOL)hasLtkSyncing;
- (BOOL)hasSessionID;
- (BOOL)hasToken;
- (BOOL)hasVersion;
- (BOOL)hasWatchNewLTKSyncStatus;
- (BOOL)hasWatchOldLTKSyncStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)ltkSyncing;
- (BOOL)readFrom:(id)a3;
- (NSData)longTermKey;
- (NSData)ltkHash;
- (NSData)token;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)watchNewLTKSyncStatus;
- (int)watchOldLTKSyncStatus;
- (unint64_t)hash;
- (unsigned)errorCode;
- (unsigned)failureReasons;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setFailureReasons:(unsigned int)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasFailureReasons:(BOOL)a3;
- (void)setHasLtkSyncing:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHasWatchNewLTKSyncStatus:(BOOL)a3;
- (void)setHasWatchOldLTKSyncStatus:(BOOL)a3;
- (void)setLongTermKey:(id)a3;
- (void)setLtkHash:(id)a3;
- (void)setLtkSyncing:(BOOL)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setToken:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setWatchNewLTKSyncStatus:(int)a3;
- (void)setWatchOldLTKSyncStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSetupSessionCreated

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSessionID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionID
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (BOOL)hasLongTermKey
{
  return self->_longTermKey != 0;
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

- (void)setFailureReasons:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_failureReasons = a3;
}

- (void)setHasFailureReasons:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFailureReasons
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLtkSyncing:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_ltkSyncing = a3;
}

- (void)setHasLtkSyncing:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasLtkSyncing
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setWatchOldLTKSyncStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_watchOldLTKSyncStatus = a3;
}

- (void)setHasWatchOldLTKSyncStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWatchOldLTKSyncStatus
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setWatchNewLTKSyncStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_watchNewLTKSyncStatus = a3;
}

- (void)setHasWatchNewLTKSyncStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWatchNewLTKSyncStatus
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasLtkHash
{
  return self->_ltkHash != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDUnlockSetupSessionCreated;
  char v3 = [(SDUnlockSetupSessionCreated *)&v7 description];
  v4 = [(SDUnlockSetupSessionCreated *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_sessionID];
    [v3 setObject:v6 forKey:@"sessionID"];
  }
  token = self->_token;
  if (token) {
    [v3 setObject:token forKey:@"token"];
  }
  longTermKey = self->_longTermKey;
  if (longTermKey) {
    [v3 setObject:longTermKey forKey:@"longTermKey"];
  }
  char v9 = (char)self->_has;
  if (v9)
  {
    v13 = +[NSNumber numberWithUnsignedInt:self->_errorCode];
    [v3 setObject:v13 forKey:@"errorCode"];

    char v9 = (char)self->_has;
    if ((v9 & 2) == 0)
    {
LABEL_11:
      if ((v9 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  v14 = +[NSNumber numberWithUnsignedInt:self->_failureReasons];
  [v3 setObject:v14 forKey:@"failureReasons"];

  char v9 = (char)self->_has;
  if ((v9 & 0x40) == 0)
  {
LABEL_12:
    if ((v9 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  v15 = +[NSNumber numberWithBool:self->_ltkSyncing];
  [v3 setObject:v15 forKey:@"ltkSyncing"];

  char v9 = (char)self->_has;
  if ((v9 & 0x20) == 0)
  {
LABEL_13:
    if ((v9 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_23:
  v16 = +[NSNumber numberWithInt:self->_watchOldLTKSyncStatus];
  [v3 setObject:v16 forKey:@"watchOldLTKSyncStatus"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    v10 = +[NSNumber numberWithInt:self->_watchNewLTKSyncStatus];
    [v3 setObject:v10 forKey:@"watchNewLTKSyncStatus"];
  }
LABEL_15:
  ltkHash = self->_ltkHash;
  if (ltkHash) {
    [v3 setObject:ltkHash forKey:@"ltkHash"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSetupSessionCreatedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
  if (self->_token)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_longTermKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    char v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  char v6 = (char)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_12:
    if ((v6 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  char v6 = (char)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_15:
  if (self->_ltkHash)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[12] = self->_version;
    *((unsigned char *)v4 + 64) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[8] = self->_sessionID;
    *((unsigned char *)v4 + 64) |= 4u;
  }
  id v7 = v4;
  if (self->_token)
  {
    [v4 setToken:];
    id v4 = v7;
  }
  if (self->_longTermKey)
  {
    [v7 setLongTermKey:];
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    v4[2] = self->_errorCode;
    *((unsigned char *)v4 + 64) |= 1u;
    char v6 = (char)self->_has;
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  v4[3] = self->_failureReasons;
  *((unsigned char *)v4 + 64) |= 2u;
  char v6 = (char)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_12:
    if ((v6 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)v4 + 60) = self->_ltkSyncing;
  *((unsigned char *)v4 + 64) |= 0x40u;
  char v6 = (char)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_23:
  v4[14] = self->_watchOldLTKSyncStatus;
  *((unsigned char *)v4 + 64) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    v4[13] = self->_watchNewLTKSyncStatus;
    *((unsigned char *)v4 + 64) |= 0x10u;
  }
LABEL_15:
  if (self->_ltkHash)
  {
    [v7 setLtkHash:];
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  char v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5[12] = self->_version;
    *((unsigned char *)v5 + 64) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v5[8] = self->_sessionID;
    *((unsigned char *)v5 + 64) |= 4u;
  }
  id v8 = [(NSData *)self->_token copyWithZone:a3];
  char v9 = (void *)v6[5];
  v6[5] = v8;

  id v10 = [(NSData *)self->_longTermKey copyWithZone:a3];
  v11 = (void *)v6[2];
  v6[2] = v10;

  char v12 = (char)self->_has;
  if (v12)
  {
    *((_DWORD *)v6 + 2) = self->_errorCode;
    *((unsigned char *)v6 + 64) |= 1u;
    char v12 = (char)self->_has;
    if ((v12 & 2) == 0)
    {
LABEL_7:
      if ((v12 & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v6 + 3) = self->_failureReasons;
  *((unsigned char *)v6 + 64) |= 2u;
  char v12 = (char)self->_has;
  if ((v12 & 0x40) == 0)
  {
LABEL_8:
    if ((v12 & 0x20) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    *((_DWORD *)v6 + 14) = self->_watchOldLTKSyncStatus;
    *((unsigned char *)v6 + 64) |= 0x20u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_14:
  *((unsigned char *)v6 + 60) = self->_ltkSyncing;
  *((unsigned char *)v6 + 64) |= 0x40u;
  char v12 = (char)self->_has;
  if ((v12 & 0x20) != 0) {
    goto LABEL_15;
  }
LABEL_9:
  if ((v12 & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v6 + 13) = self->_watchNewLTKSyncStatus;
    *((unsigned char *)v6 + 64) |= 0x10u;
  }
LABEL_11:
  id v13 = [(NSData *)self->_ltkHash copyWithZone:a3];
  v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_version != *((_DWORD *)v4 + 12)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_sessionID != *((_DWORD *)v4 + 8)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_46;
  }
  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 5) && !-[NSData isEqual:](token, "isEqual:")) {
    goto LABEL_46;
  }
  longTermKey = self->_longTermKey;
  if ((unint64_t)longTermKey | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](longTermKey, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_failureReasons != *((_DWORD *)v4 + 3)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x40) != 0)
    {
      if (self->_ltkSyncing)
      {
        if (!*((unsigned char *)v4 + 60)) {
          goto LABEL_46;
        }
        goto LABEL_34;
      }
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_34;
      }
    }
LABEL_46:
    unsigned __int8 v8 = 0;
    goto LABEL_47;
  }
  if ((*((unsigned char *)v4 + 64) & 0x40) != 0) {
    goto LABEL_46;
  }
LABEL_34:
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x20) == 0 || self->_watchOldLTKSyncStatus != *((_DWORD *)v4 + 14)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0 || self->_watchNewLTKSyncStatus != *((_DWORD *)v4 + 13)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_46;
  }
  ltkHash = self->_ltkHash;
  if ((unint64_t)ltkHash | *((void *)v4 + 3)) {
    unsigned __int8 v8 = -[NSData isEqual:](ltkHash, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_47:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_version;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_sessionID;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = (unint64_t)[(NSData *)self->_token hash];
  unint64_t v6 = (unint64_t)[(NSData *)self->_longTermKey hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = 2654435761 * self->_errorCode;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_8:
      uint64_t v8 = 2654435761 * self->_failureReasons;
      if ((*(unsigned char *)&self->_has & 0x40) != 0) {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    uint64_t v9 = 2654435761 * self->_ltkSyncing;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_10;
    }
LABEL_15:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ (unint64_t)[(NSData *)self->_ltkHash hash];
  }
LABEL_14:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_15;
  }
LABEL_10:
  uint64_t v10 = 2654435761 * self->_watchOldLTKSyncStatus;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  uint64_t v11 = 2654435761 * self->_watchNewLTKSyncStatus;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ (unint64_t)[(NSData *)self->_ltkHash hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 8) != 0)
  {
    self->_version = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 64);
  }
  if ((v5 & 4) != 0)
  {
    self->_sessionID = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
  id v7 = v4;
  if (*((void *)v4 + 5))
  {
    -[SDUnlockSetupSessionCreated setToken:](self, "setToken:");
    id v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[SDUnlockSetupSessionCreated setLongTermKey:](self, "setLongTermKey:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 64);
  if (v6)
  {
    self->_errorCode = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 64);
    if ((v6 & 2) == 0)
    {
LABEL_11:
      if ((v6 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_failureReasons = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v6 = *((unsigned char *)v4 + 64);
  if ((v6 & 0x40) == 0)
  {
LABEL_12:
    if ((v6 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_ltkSyncing = *((unsigned char *)v4 + 60);
  *(unsigned char *)&self->_has |= 0x40u;
  char v6 = *((unsigned char *)v4 + 64);
  if ((v6 & 0x20) == 0)
  {
LABEL_13:
    if ((v6 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_23:
  self->_watchOldLTKSyncStatus = *((_DWORD *)v4 + 14);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v4 + 64) & 0x10) != 0)
  {
LABEL_14:
    self->_watchNewLTKSyncStatus = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_15:
  if (*((void *)v4 + 3))
  {
    -[SDUnlockSetupSessionCreated setLtkHash:](self, "setLtkHash:");
    id v4 = v7;
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

- (NSData)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
{
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (unsigned)failureReasons
{
  return self->_failureReasons;
}

- (BOOL)ltkSyncing
{
  return self->_ltkSyncing;
}

- (int)watchOldLTKSyncStatus
{
  return self->_watchOldLTKSyncStatus;
}

- (int)watchNewLTKSyncStatus
{
  return self->_watchNewLTKSyncStatus;
}

- (NSData)ltkHash
{
  return self->_ltkHash;
}

- (void)setLtkHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_ltkHash, 0);

  objc_storeStrong((id *)&self->_longTermKey, 0);
}

@end