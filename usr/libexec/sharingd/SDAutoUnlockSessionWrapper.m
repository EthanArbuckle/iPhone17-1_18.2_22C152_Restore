@interface SDAutoUnlockSessionWrapper
- (BOOL)hasAksSessionID;
- (BOOL)hasAuthTag;
- (BOOL)hasAwdlCacheID;
- (BOOL)hasEncryptedPayload;
- (BOOL)hasMessageType;
- (BOOL)hasNonce;
- (BOOL)hasPayload;
- (BOOL)hasSenderID;
- (BOOL)hasSessionID;
- (BOOL)hasUseProxy;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)useProxy;
- (NSData)authTag;
- (NSData)encryptedPayload;
- (NSData)nonce;
- (NSData)payload;
- (NSData)senderID;
- (NSData)sessionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)aksSessionID;
- (unsigned)awdlCacheID;
- (unsigned)messageType;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAksSessionID:(unsigned int)a3;
- (void)setAuthTag:(id)a3;
- (void)setAwdlCacheID:(unsigned int)a3;
- (void)setEncryptedPayload:(id)a3;
- (void)setHasAksSessionID:(BOOL)a3;
- (void)setHasAwdlCacheID:(BOOL)a3;
- (void)setHasMessageType:(BOOL)a3;
- (void)setHasUseProxy:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMessageType:(unsigned int)a3;
- (void)setNonce:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSenderID:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setUseProxy:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockSessionWrapper

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

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (void)setMessageType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMessageType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasSenderID
{
  return self->_senderID != 0;
}

- (void)setUseProxy:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_useProxy = a3;
}

- (void)setHasUseProxy:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUseProxy
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAwdlCacheID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_awdlCacheID = a3;
}

- (void)setHasAwdlCacheID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAwdlCacheID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAksSessionID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_aksSessionID = a3;
}

- (void)setHasAksSessionID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAksSessionID
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasEncryptedPayload
{
  return self->_encryptedPayload != 0;
}

- (BOOL)hasAuthTag
{
  return self->_authTag != 0;
}

- (BOOL)hasNonce
{
  return self->_nonce != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockSessionWrapper;
  char v3 = [(SDAutoUnlockSessionWrapper *)&v7 description];
  v4 = [(SDAutoUnlockSessionWrapper *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  sessionID = self->_sessionID;
  if (sessionID) {
    [v3 setObject:sessionID forKey:@"sessionID"];
  }
  payload = self->_payload;
  if (payload) {
    [v3 setObject:payload forKey:@"payload"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_messageType];
    [v3 setObject:v7 forKey:@"messageType"];
  }
  senderID = self->_senderID;
  if (senderID) {
    [v3 setObject:senderID forKey:@"senderID"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v15 = +[NSNumber numberWithBool:self->_useProxy];
    [v3 setObject:v15 forKey:@"useProxy"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  v16 = +[NSNumber numberWithUnsignedInt:self->_awdlCacheID];
  [v3 setObject:v16 forKey:@"awdlCacheID"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_14:
    v10 = +[NSNumber numberWithUnsignedInt:self->_aksSessionID];
    [v3 setObject:v10 forKey:@"aksSessionID"];
  }
LABEL_15:
  encryptedPayload = self->_encryptedPayload;
  if (encryptedPayload) {
    [v3 setObject:encryptedPayload forKey:@"encryptedPayload"];
  }
  authTag = self->_authTag;
  if (authTag) {
    [v3 setObject:authTag forKey:@"authTag"];
  }
  nonce = self->_nonce;
  if (nonce) {
    [v3 setObject:nonce forKey:@"nonce"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockSessionWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_sessionID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_payload)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_senderID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_14:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_15:
  if (self->_encryptedPayload)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_authTag)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_nonce)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[20] = self->_version;
    *((unsigned char *)v4 + 88) |= 8u;
  }
  id v6 = v4;
  if (self->_sessionID)
  {
    [v4 setSessionID:];
    id v4 = v6;
  }
  if (self->_payload)
  {
    [v6 setPayload:];
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[10] = self->_messageType;
    *((unsigned char *)v4 + 88) |= 4u;
  }
  if (self->_senderID)
  {
    [v6 setSenderID:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((unsigned char *)v4 + 84) = self->_useProxy;
    *((unsigned char *)v4 + 88) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  v4[6] = self->_awdlCacheID;
  *((unsigned char *)v4 + 88) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_14:
    v4[2] = self->_aksSessionID;
    *((unsigned char *)v4 + 88) |= 1u;
  }
LABEL_15:
  if (self->_encryptedPayload)
  {
    [v6 setEncryptedPayload:];
    id v4 = v6;
  }
  if (self->_authTag)
  {
    [v6 setAuthTag:];
    id v4 = v6;
  }
  if (self->_nonce)
  {
    [v6 setNonce:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v5[20] = self->_version;
    *((unsigned char *)v5 + 88) |= 8u;
  }
  id v7 = [(NSData *)self->_sessionID copyWithZone:a3];
  v8 = (void *)v6[9];
  v6[9] = v7;

  id v9 = [(NSData *)self->_payload copyWithZone:a3];
  v10 = (void *)v6[7];
  v6[7] = v9;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_messageType;
    *((unsigned char *)v6 + 88) |= 4u;
  }
  id v11 = [(NSData *)self->_senderID copyWithZone:a3];
  v12 = (void *)v6[8];
  v6[8] = v11;

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    *((_DWORD *)v6 + 6) = self->_awdlCacheID;
    *((unsigned char *)v6 + 88) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *((unsigned char *)v6 + 84) = self->_useProxy;
  *((unsigned char *)v6 + 88) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if (has)
  {
LABEL_8:
    *((_DWORD *)v6 + 2) = self->_aksSessionID;
    *((unsigned char *)v6 + 88) |= 1u;
  }
LABEL_9:
  id v14 = [(NSData *)self->_encryptedPayload copyWithZone:a3];
  v15 = (void *)v6[4];
  v6[4] = v14;

  id v16 = [(NSData *)self->_authTag copyWithZone:a3];
  v17 = (void *)v6[2];
  v6[2] = v16;

  id v18 = [(NSData *)self->_nonce copyWithZone:a3];
  v19 = (void *)v6[6];
  v6[6] = v18;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 8) == 0 || self->_version != *((_DWORD *)v4 + 20)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 8) != 0)
  {
    goto LABEL_43;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((void *)v4 + 9) && !-[NSData isEqual:](sessionID, "isEqual:")) {
    goto LABEL_43;
  }
  payload = self->_payload;
  if ((unint64_t)payload | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](payload, "isEqual:")) {
      goto LABEL_43;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 4) == 0 || self->_messageType != *((_DWORD *)v4 + 10)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 4) != 0)
  {
    goto LABEL_43;
  }
  senderID = self->_senderID;
  if ((unint64_t)senderID | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](senderID, "isEqual:")) {
      goto LABEL_43;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x10) != 0)
    {
      if (self->_useProxy)
      {
        if (!*((unsigned char *)v4 + 84)) {
          goto LABEL_43;
        }
        goto LABEL_27;
      }
      if (!*((unsigned char *)v4 + 84)) {
        goto LABEL_27;
      }
    }
LABEL_43:
    unsigned __int8 v12 = 0;
    goto LABEL_44;
  }
  if ((*((unsigned char *)v4 + 88) & 0x10) != 0) {
    goto LABEL_43;
  }
LABEL_27:
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_awdlCacheID != *((_DWORD *)v4 + 6)) {
      goto LABEL_43;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    goto LABEL_43;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_aksSessionID != *((_DWORD *)v4 + 2)) {
      goto LABEL_43;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
    goto LABEL_43;
  }
  encryptedPayload = self->_encryptedPayload;
  if ((unint64_t)encryptedPayload | *((void *)v4 + 4)
    && !-[NSData isEqual:](encryptedPayload, "isEqual:"))
  {
    goto LABEL_43;
  }
  authTag = self->_authTag;
  if ((unint64_t)authTag | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](authTag, "isEqual:")) {
      goto LABEL_43;
    }
  }
  nonce = self->_nonce;
  if ((unint64_t)nonce | *((void *)v4 + 6)) {
    unsigned __int8 v12 = -[NSData isEqual:](nonce, "isEqual:");
  }
  else {
    unsigned __int8 v12 = 1;
  }
LABEL_44:

  return v12;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_version;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = (unint64_t)[(NSData *)self->_sessionID hash];
  unint64_t v5 = (unint64_t)[(NSData *)self->_payload hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_messageType;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = (unint64_t)[(NSData *)self->_senderID hash];
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v9 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v10 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = 2654435761 * self->_useProxy;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_awdlCacheID;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v10 = 2654435761 * self->_aksSessionID;
LABEL_14:
  unint64_t v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  unint64_t v12 = v10 ^ (unint64_t)[(NSData *)self->_encryptedPayload hash];
  unint64_t v13 = v12 ^ (unint64_t)[(NSData *)self->_authTag hash];
  return v11 ^ v13 ^ (unint64_t)[(NSData *)self->_nonce hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 88) & 8) != 0)
  {
    self->_version = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_has |= 8u;
  }
  id v6 = v4;
  if (*((void *)v4 + 9))
  {
    -[SDAutoUnlockSessionWrapper setSessionID:](self, "setSessionID:");
    id v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[SDAutoUnlockSessionWrapper setPayload:](self, "setPayload:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 88) & 4) != 0)
  {
    self->_messageType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 8))
  {
    -[SDAutoUnlockSessionWrapper setSenderID:](self, "setSenderID:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 88);
  if ((v5 & 0x10) != 0)
  {
    self->_useProxy = *((unsigned char *)v4 + 84);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 88);
    if ((v5 & 2) == 0)
    {
LABEL_13:
      if ((v5 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_awdlCacheID = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 88))
  {
LABEL_14:
    self->_aksSessionID = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_15:
  if (*((void *)v4 + 4))
  {
    -[SDAutoUnlockSessionWrapper setEncryptedPayload:](self, "setEncryptedPayload:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[SDAutoUnlockSessionWrapper setAuthTag:](self, "setAuthTag:");
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[SDAutoUnlockSessionWrapper setNonce:](self, "setNonce:");
    id v4 = v6;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSData)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (NSData)senderID
{
  return self->_senderID;
}

- (void)setSenderID:(id)a3
{
}

- (BOOL)useProxy
{
  return self->_useProxy;
}

- (unsigned)awdlCacheID
{
  return self->_awdlCacheID;
}

- (unsigned)aksSessionID
{
  return self->_aksSessionID;
}

- (NSData)encryptedPayload
{
  return self->_encryptedPayload;
}

- (void)setEncryptedPayload:(id)a3
{
}

- (NSData)authTag
{
  return self->_authTag;
}

- (void)setAuthTag:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_encryptedPayload, 0);

  objc_storeStrong((id *)&self->_authTag, 0);
}

@end