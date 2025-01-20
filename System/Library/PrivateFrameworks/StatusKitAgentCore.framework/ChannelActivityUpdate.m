@interface ChannelActivityUpdate
- (BOOL)hasCurrentVersion;
- (BOOL)hasEncryptedUpdatePayload;
- (BOOL)hasPrevVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptedUpdatePayload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)currentVersion;
- (unint64_t)hash;
- (unint64_t)prevVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentVersion:(unint64_t)a3;
- (void)setEncryptedUpdatePayload:(id)a3;
- (void)setHasCurrentVersion:(BOOL)a3;
- (void)setHasPrevVersion:(BOOL)a3;
- (void)setPrevVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ChannelActivityUpdate

- (void)setCurrentVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_currentVersion = a3;
}

- (void)setHasCurrentVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCurrentVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPrevVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_prevVersion = a3;
}

- (void)setHasPrevVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrevVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasEncryptedUpdatePayload
{
  return self->_encryptedUpdatePayload != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ChannelActivityUpdate;
  v4 = [(ChannelActivityUpdate *)&v8 description];
  v5 = [(ChannelActivityUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_currentVersion];
    [v3 setObject:v5 forKey:@"current_version"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithUnsignedLongLong:self->_prevVersion];
    [v3 setObject:v6 forKey:@"prev_version"];
  }
  encryptedUpdatePayload = self->_encryptedUpdatePayload;
  if (encryptedUpdatePayload) {
    [v3 setObject:encryptedUpdatePayload forKey:@"encrypted_update_payload"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelActivityUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_encryptedUpdatePayload)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_currentVersion;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_prevVersion;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  if (self->_encryptedUpdatePayload)
  {
    id v6 = v4;
    objc_msgSend(v4, "setEncryptedUpdatePayload:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_currentVersion;
    *(unsigned char *)(v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_prevVersion;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  uint64_t v8 = [(NSData *)self->_encryptedUpdatePayload copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_currentVersion != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_prevVersion != *((void *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_14;
  }
  encryptedUpdatePayload = self->_encryptedUpdatePayload;
  if ((unint64_t)encryptedUpdatePayload | *((void *)v4 + 3)) {
    char v6 = -[NSData isEqual:](encryptedUpdatePayload, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_currentVersion;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSData *)self->_encryptedUpdatePayload hash];
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_prevVersion;
  return v3 ^ v2 ^ [(NSData *)self->_encryptedUpdatePayload hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_currentVersion = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_prevVersion = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[ChannelActivityUpdate setEncryptedUpdatePayload:](self, "setEncryptedUpdatePayload:");
    id v4 = v6;
  }
}

- (unint64_t)currentVersion
{
  return self->_currentVersion;
}

- (unint64_t)prevVersion
{
  return self->_prevVersion;
}

- (NSData)encryptedUpdatePayload
{
  return self->_encryptedUpdatePayload;
}

- (void)setEncryptedUpdatePayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end