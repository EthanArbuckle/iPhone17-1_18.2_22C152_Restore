@interface SDAutoUnlockLTKRequest
- (BOOL)checkViewState;
- (BOOL)hasCheckViewState;
- (BOOL)hasLocalID;
- (BOOL)hasLtk;
- (BOOL)hasLtkID;
- (BOOL)hasNeedsLTK;
- (BOOL)hasRemoteDeviceID;
- (BOOL)hasRemoteNeedsLTK;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsLTK;
- (BOOL)readFrom:(id)a3;
- (BOOL)remoteNeedsLTK;
- (NSData)ltk;
- (NSData)ltkID;
- (NSString)localID;
- (NSString)remoteDeviceID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCheckViewState:(BOOL)a3;
- (void)setHasCheckViewState:(BOOL)a3;
- (void)setHasNeedsLTK:(BOOL)a3;
- (void)setHasRemoteNeedsLTK:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLocalID:(id)a3;
- (void)setLtk:(id)a3;
- (void)setLtkID:(id)a3;
- (void)setNeedsLTK:(BOOL)a3;
- (void)setRemoteDeviceID:(id)a3;
- (void)setRemoteNeedsLTK:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockLTKRequest

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLocalID
{
  return self->_localID != 0;
}

- (BOOL)hasLtk
{
  return self->_ltk != 0;
}

- (BOOL)hasLtkID
{
  return self->_ltkID != 0;
}

- (void)setCheckViewState:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_checkViewState = a3;
}

- (void)setHasCheckViewState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCheckViewState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasRemoteDeviceID
{
  return self->_remoteDeviceID != 0;
}

- (void)setNeedsLTK:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_needsLTK = a3;
}

- (void)setHasNeedsLTK:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNeedsLTK
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRemoteNeedsLTK:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_remoteNeedsLTK = a3;
}

- (void)setHasRemoteNeedsLTK:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRemoteNeedsLTK
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockLTKRequest;
  char v3 = [(SDAutoUnlockLTKRequest *)&v7 description];
  v4 = [(SDAutoUnlockLTKRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  localID = self->_localID;
  if (localID) {
    [v3 setObject:localID forKey:@"localID"];
  }
  ltk = self->_ltk;
  if (ltk) {
    [v3 setObject:ltk forKey:@"ltk"];
  }
  ltkID = self->_ltkID;
  if (ltkID) {
    [v3 setObject:ltkID forKey:@"ltkID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_checkViewState];
    [v3 setObject:v8 forKey:@"checkViewState"];
  }
  remoteDeviceID = self->_remoteDeviceID;
  if (remoteDeviceID) {
    [v3 setObject:remoteDeviceID forKey:@"remoteDeviceID"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v11 = +[NSNumber numberWithBool:self->_needsLTK];
    [v3 setObject:v11 forKey:@"needsLTK"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v12 = +[NSNumber numberWithBool:self->_remoteNeedsLTK];
    [v3 setObject:v12 forKey:@"remoteNeedsLTK"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockLTKRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_localID) {
    PBDataWriterWriteStringField();
  }
  if (self->_ltk) {
    PBDataWriterWriteDataField();
  }
  if (self->_ltkID) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_remoteDeviceID) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[10] = self->_version;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  v6 = v4;
  if (self->_localID)
  {
    [v4 setLocalID:];
    v4 = v6;
  }
  if (self->_ltk)
  {
    [v6 setLtk:];
    v4 = v6;
  }
  if (self->_ltkID)
  {
    [v6 setLtkID:];
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 44) = self->_checkViewState;
    *((unsigned char *)v4 + 48) |= 2u;
  }
  if (self->_remoteDeviceID)
  {
    [v6 setRemoteDeviceID:];
    v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 45) = self->_needsLTK;
    *((unsigned char *)v4 + 48) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((unsigned char *)v4 + 46) = self->_remoteNeedsLTK;
    *((unsigned char *)v4 + 48) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[10] = self->_version;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v7 = [(NSString *)self->_localID copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  id v9 = [(NSData *)self->_ltk copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(NSData *)self->_ltkID copyWithZone:a3];
  v12 = (void *)v6[3];
  v6[3] = v11;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v6 + 44) = self->_checkViewState;
    *((unsigned char *)v6 + 48) |= 2u;
  }
  id v13 = [(NSString *)self->_remoteDeviceID copyWithZone:a3];
  v14 = (void *)v6[4];
  v6[4] = v13;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v6 + 45) = self->_needsLTK;
    *((unsigned char *)v6 + 48) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *((unsigned char *)v6 + 46) = self->_remoteNeedsLTK;
    *((unsigned char *)v6 + 48) |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_version != *((_DWORD *)v4 + 10)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_34;
  }
  localID = self->_localID;
  if ((unint64_t)localID | *((void *)v4 + 1) && !-[NSString isEqual:](localID, "isEqual:")) {
    goto LABEL_34;
  }
  ltk = self->_ltk;
  if ((unint64_t)ltk | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](ltk, "isEqual:")) {
      goto LABEL_34;
    }
  }
  ltkID = self->_ltkID;
  if ((unint64_t)ltkID | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](ltkID, "isEqual:")) {
      goto LABEL_34;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0) {
      goto LABEL_34;
    }
    if (self->_checkViewState)
    {
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_34;
      }
    }
    else if (*((unsigned char *)v4 + 44))
    {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_34;
  }
  remoteDeviceID = self->_remoteDeviceID;
  if ((unint64_t)remoteDeviceID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](remoteDeviceID, "isEqual:")) {
      goto LABEL_34;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0) {
      goto LABEL_34;
    }
    if (self->_needsLTK)
    {
      if (!*((unsigned char *)v4 + 45)) {
        goto LABEL_34;
      }
    }
    else if (*((unsigned char *)v4 + 45))
    {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_34;
  }
  BOOL v10 = (*((unsigned char *)v4 + 48) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) != 0)
    {
      if (self->_remoteNeedsLTK)
      {
        if (!*((unsigned char *)v4 + 46)) {
          goto LABEL_34;
        }
      }
      else if (*((unsigned char *)v4 + 46))
      {
        goto LABEL_34;
      }
      BOOL v10 = 1;
      goto LABEL_35;
    }
LABEL_34:
    BOOL v10 = 0;
  }
LABEL_35:

  return v10;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_localID hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_ltk hash];
  unint64_t v6 = (unint64_t)[(NSData *)self->_ltkID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_checkViewState;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_remoteDeviceID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v9 = 2654435761 * self->_needsLTK;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_remoteNeedsLTK;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 48))
  {
    self->_version = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[SDAutoUnlockLTKRequest setLocalID:](self, "setLocalID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[SDAutoUnlockLTKRequest setLtk:](self, "setLtk:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[SDAutoUnlockLTKRequest setLtkID:](self, "setLtkID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    self->_checkViewState = *((unsigned char *)v4 + 44);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 4))
  {
    -[SDAutoUnlockLTKRequest setRemoteDeviceID:](self, "setRemoteDeviceID:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 4) != 0)
  {
    self->_needsLTK = *((unsigned char *)v4 + 45);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 48);
  }
  if ((v5 & 8) != 0)
  {
    self->_remoteNeedsLTK = *((unsigned char *)v4 + 46);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)localID
{
  return self->_localID;
}

- (void)setLocalID:(id)a3
{
}

- (NSData)ltk
{
  return self->_ltk;
}

- (void)setLtk:(id)a3
{
}

- (NSData)ltkID
{
  return self->_ltkID;
}

- (void)setLtkID:(id)a3
{
}

- (BOOL)checkViewState
{
  return self->_checkViewState;
}

- (NSString)remoteDeviceID
{
  return self->_remoteDeviceID;
}

- (void)setRemoteDeviceID:(id)a3
{
}

- (BOOL)needsLTK
{
  return self->_needsLTK;
}

- (BOOL)remoteNeedsLTK
{
  return self->_remoteNeedsLTK;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDeviceID, 0);
  objc_storeStrong((id *)&self->_ltkID, 0);
  objc_storeStrong((id *)&self->_ltk, 0);

  objc_storeStrong((id *)&self->_localID, 0);
}

@end