@interface SharedChannelPublishOffGridPayloadRequest
- (BOOL)hasEncryptionKey;
- (BOOL)hasNotificationDisplayEpochSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptionKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)notificationDisplayEpochSeconds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setHasNotificationDisplayEpochSeconds:(BOOL)a3;
- (void)setNotificationDisplayEpochSeconds:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SharedChannelPublishOffGridPayloadRequest

- (BOOL)hasEncryptionKey
{
  return self->_encryptionKey != 0;
}

- (void)setNotificationDisplayEpochSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_notificationDisplayEpochSeconds = a3;
}

- (void)setHasNotificationDisplayEpochSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNotificationDisplayEpochSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SharedChannelPublishOffGridPayloadRequest;
  v4 = [(SharedChannelPublishOffGridPayloadRequest *)&v8 description];
  v5 = [(SharedChannelPublishOffGridPayloadRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  encryptionKey = self->_encryptionKey;
  if (encryptionKey) {
    [v3 setObject:encryptionKey forKey:@"encryption_key"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_notificationDisplayEpochSeconds];
    [v4 setObject:v6 forKey:@"notification_display_epoch_seconds"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelPublishOffGridPayloadRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptionKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_encryptionKey)
  {
    id v5 = v4;
    objc_msgSend(v4, "setEncryptionKey:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_notificationDisplayEpochSeconds;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_encryptionKey copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_notificationDisplayEpochSeconds;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  encryptionKey = self->_encryptionKey;
  if ((unint64_t)encryptionKey | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](encryptionKey, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_notificationDisplayEpochSeconds == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_encryptionKey hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_notificationDisplayEpochSeconds;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  if (v4[2])
  {
    uint64_t v5 = v4;
    -[SharedChannelPublishOffGridPayloadRequest setEncryptionKey:](self, "setEncryptionKey:");
    unint64_t v4 = v5;
  }
  if (v4[3])
  {
    self->_notificationDisplayEpochSeconds = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (unint64_t)notificationDisplayEpochSeconds
{
  return self->_notificationDisplayEpochSeconds;
}

- (void).cxx_destruct
{
}

@end