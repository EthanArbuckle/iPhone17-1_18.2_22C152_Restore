@interface SDUnlockSetupRequest
- (BOOL)hasLongTermKey;
- (BOOL)hasLtkHash;
- (BOOL)hasRemoteNeedsLTK;
- (BOOL)hasSessionID;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)remoteNeedsLTK;
- (NSData)longTermKey;
- (NSData)ltkHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)sessionID;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRemoteNeedsLTK:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLongTermKey:(id)a3;
- (void)setLtkHash:(id)a3;
- (void)setRemoteNeedsLTK:(BOOL)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDUnlockSetupRequest

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

- (BOOL)hasLongTermKey
{
  return self->_longTermKey != 0;
}

- (BOOL)hasLtkHash
{
  return self->_ltkHash != 0;
}

- (void)setRemoteNeedsLTK:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_remoteNeedsLTK = a3;
}

- (void)setHasRemoteNeedsLTK:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRemoteNeedsLTK
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDUnlockSetupRequest;
  char v3 = [(SDUnlockSetupRequest *)&v7 description];
  v4 = [(SDUnlockSetupRequest *)self dictionaryRepresentation];
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
  longTermKey = self->_longTermKey;
  if (longTermKey) {
    [v3 setObject:longTermKey forKey:@"longTermKey"];
  }
  ltkHash = self->_ltkHash;
  if (ltkHash) {
    [v3 setObject:ltkHash forKey:@"ltkHash"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v9 = +[NSNumber numberWithBool:self->_remoteNeedsLTK];
    [v3 setObject:v9 forKey:@"remoteNeedsLTK"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDUnlockSetupRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_longTermKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_ltkHash) {
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
    v4[7] = self->_version;
    *((unsigned char *)v4 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[6] = self->_sessionID;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  v6 = v4;
  if (self->_longTermKey)
  {
    [v4 setLongTermKey:];
    v4 = v6;
  }
  if (self->_ltkHash)
  {
    [v6 setLtkHash:];
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_remoteNeedsLTK;
    *((unsigned char *)v4 + 36) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[7] = self->_version;
    *((unsigned char *)v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[6] = self->_sessionID;
    *((unsigned char *)v5 + 36) |= 1u;
  }
  id v8 = [(NSData *)self->_longTermKey copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  id v10 = [(NSData *)self->_ltkHash copyWithZone:a3];
  v11 = (void *)v6[2];
  v6[2] = v10;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v6 + 32) = self->_remoteNeedsLTK;
    *((unsigned char *)v6 + 36) |= 4u;
  }
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
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_version != *((_DWORD *)v4 + 7)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_sessionID != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_18;
  }
  longTermKey = self->_longTermKey;
  if ((unint64_t)longTermKey | *((void *)v4 + 1) && !-[NSData isEqual:](longTermKey, "isEqual:")) {
    goto LABEL_18;
  }
  ltkHash = self->_ltkHash;
  if ((unint64_t)ltkHash | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](ltkHash, "isEqual:")) {
      goto LABEL_18;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0)
    {
LABEL_18:
      BOOL v7 = 0;
      goto LABEL_19;
    }
    if (self->_remoteNeedsLTK)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_18;
    }
    BOOL v7 = 1;
  }
LABEL_19:

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
  unint64_t v5 = (unint64_t)[(NSData *)self->_longTermKey hash];
  unint64_t v6 = (unint64_t)[(NSData *)self->_ltkHash hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_remoteNeedsLTK;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if (v5)
  {
    self->_sessionID = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[SDUnlockSetupRequest setLongTermKey:](self, "setLongTermKey:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[SDUnlockSetupRequest setLtkHash:](self, "setLtkHash:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    self->_remoteNeedsLTK = *((unsigned char *)v4 + 32);
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

- (NSData)longTermKey
{
  return self->_longTermKey;
}

- (void)setLongTermKey:(id)a3
{
}

- (NSData)ltkHash
{
  return self->_ltkHash;
}

- (void)setLtkHash:(id)a3
{
}

- (BOOL)remoteNeedsLTK
{
  return self->_remoteNeedsLTK;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ltkHash, 0);

  objc_storeStrong((id *)&self->_longTermKey, 0);
}

@end