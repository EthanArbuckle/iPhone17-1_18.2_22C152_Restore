@interface NPKProtoInsertBridgeNotificationRequest
- (BOOL)hasActionURLString;
- (BOOL)hasExpirationDateData;
- (BOOL)hasNotificationIdentifier;
- (BOOL)hasPassUniqueID;
- (BOOL)hasPlaySound;
- (BOOL)isEqual:(id)a3;
- (BOOL)playSound;
- (BOOL)readFrom:(id)a3;
- (NSData)expirationDateData;
- (NSString)actionURLString;
- (NSString)message;
- (NSString)notificationIdentifier;
- (NSString)passUniqueID;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionURLString:(id)a3;
- (void)setExpirationDateData:(id)a3;
- (void)setHasPlaySound:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setNotificationIdentifier:(id)a3;
- (void)setPassUniqueID:(id)a3;
- (void)setPlaySound:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoInsertBridgeNotificationRequest

- (BOOL)hasActionURLString
{
  return self->_actionURLString != 0;
}

- (BOOL)hasPassUniqueID
{
  return self->_passUniqueID != 0;
}

- (void)setPlaySound:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_playSound = a3;
}

- (void)setHasPlaySound:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaySound
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasNotificationIdentifier
{
  return self->_notificationIdentifier != 0;
}

- (BOOL)hasExpirationDateData
{
  return self->_expirationDateData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoInsertBridgeNotificationRequest;
  v4 = [(NPKProtoInsertBridgeNotificationRequest *)&v8 description];
  v5 = [(NPKProtoInsertBridgeNotificationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  message = self->_message;
  if (message) {
    [v4 setObject:message forKey:@"message"];
  }
  actionURLString = self->_actionURLString;
  if (actionURLString) {
    [v4 setObject:actionURLString forKey:@"actionURLString"];
  }
  passUniqueID = self->_passUniqueID;
  if (passUniqueID) {
    [v4 setObject:passUniqueID forKey:@"passUniqueID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithBool:self->_playSound];
    [v4 setObject:v9 forKey:@"playSound"];
  }
  notificationIdentifier = self->_notificationIdentifier;
  if (notificationIdentifier) {
    [v4 setObject:notificationIdentifier forKey:@"notificationIdentifier"];
  }
  expirationDateData = self->_expirationDateData;
  if (expirationDateData) {
    [v4 setObject:expirationDateData forKey:@"expirationDateData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoInsertBridgeNotificationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_title) {
    -[NPKProtoInsertBridgeNotificationRequest writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteStringField();
  if (!self->_message) {
    -[NPKProtoInsertBridgeNotificationRequest writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (self->_actionURLString) {
    PBDataWriterWriteStringField();
  }
  if (self->_passUniqueID) {
    PBDataWriterWriteStringField();
  }
  v5 = v6;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    v5 = v6;
  }
  if (self->_notificationIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_expirationDateData)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [v5 setTitle:self->_title];
  [v5 setMessage:self->_message];
  if (self->_actionURLString) {
    objc_msgSend(v5, "setActionURLString:");
  }
  if (self->_passUniqueID) {
    objc_msgSend(v5, "setPassUniqueID:");
  }
  id v4 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[56] = self->_playSound;
    v5[60] |= 1u;
  }
  if (self->_notificationIdentifier)
  {
    objc_msgSend(v5, "setNotificationIdentifier:");
    id v4 = v5;
  }
  if (self->_expirationDateData)
  {
    objc_msgSend(v5, "setExpirationDateData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_message copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_actionURLString copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  uint64_t v12 = [(NSString *)self->_passUniqueID copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 56) = self->_playSound;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v14 = [(NSString *)self->_notificationIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  uint64_t v16 = [(NSData *)self->_expirationDateData copyWithZone:a3];
  v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_22;
    }
  }
  message = self->_message;
  if ((unint64_t)message | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](message, "isEqual:")) {
      goto LABEL_22;
    }
  }
  actionURLString = self->_actionURLString;
  if ((unint64_t)actionURLString | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](actionURLString, "isEqual:")) {
      goto LABEL_22;
    }
  }
  passUniqueID = self->_passUniqueID;
  if ((unint64_t)passUniqueID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](passUniqueID, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 60))
    {
      if (self->_playSound)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_22;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_18;
      }
    }
LABEL_22:
    char v11 = 0;
    goto LABEL_23;
  }
  if (*((unsigned char *)v4 + 60)) {
    goto LABEL_22;
  }
LABEL_18:
  notificationIdentifier = self->_notificationIdentifier;
  if ((unint64_t)notificationIdentifier | *((void *)v4 + 4)
    && !-[NSString isEqual:](notificationIdentifier, "isEqual:"))
  {
    goto LABEL_22;
  }
  expirationDateData = self->_expirationDateData;
  if ((unint64_t)expirationDateData | *((void *)v4 + 2)) {
    char v11 = -[NSData isEqual:](expirationDateData, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_23:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_message hash];
  NSUInteger v5 = [(NSString *)self->_actionURLString hash];
  NSUInteger v6 = [(NSString *)self->_passUniqueID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_playSound;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v9 = v7 ^ [(NSString *)self->_notificationIdentifier hash];
  return v8 ^ v9 ^ [(NSData *)self->_expirationDateData hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (BOOL *)a3;
  NSUInteger v5 = v4;
  if (*((void *)v4 + 6))
  {
    -[NPKProtoInsertBridgeNotificationRequest setTitle:](self, "setTitle:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NPKProtoInsertBridgeNotificationRequest setMessage:](self, "setMessage:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[NPKProtoInsertBridgeNotificationRequest setActionURLString:](self, "setActionURLString:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[NPKProtoInsertBridgeNotificationRequest setPassUniqueID:](self, "setPassUniqueID:");
    NSUInteger v4 = v5;
  }
  if (v4[60])
  {
    self->_playSound = v4[56];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[NPKProtoInsertBridgeNotificationRequest setNotificationIdentifier:](self, "setNotificationIdentifier:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NPKProtoInsertBridgeNotificationRequest setExpirationDateData:](self, "setExpirationDateData:");
    NSUInteger v4 = v5;
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)actionURLString
{
  return self->_actionURLString;
}

- (void)setActionURLString:(id)a3
{
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
}

- (BOOL)playSound
{
  return self->_playSound;
}

- (NSString)notificationIdentifier
{
  return self->_notificationIdentifier;
}

- (void)setNotificationIdentifier:(id)a3
{
}

- (NSData)expirationDateData
{
  return self->_expirationDateData;
}

- (void)setExpirationDateData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_notificationIdentifier, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_expirationDateData, 0);
  objc_storeStrong((id *)&self->_actionURLString, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoInsertBridgeNotificationRequest writeTo:]", "NPKProtoInsertBridgeNotificationRequest.m", 167, "nil != self->_title");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoInsertBridgeNotificationRequest writeTo:]", "NPKProtoInsertBridgeNotificationRequest.m", 172, "nil != self->_message");
}

@end