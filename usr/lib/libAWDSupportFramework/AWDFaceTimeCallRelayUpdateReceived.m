@interface AWDFaceTimeCallRelayUpdateReceived
- (BOOL)hasGuid;
- (BOOL)hasIsVideo;
- (BOOL)hasOnLockScreen;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)isVideo;
- (unsigned)onLockScreen;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHasIsVideo:(BOOL)a3;
- (void)setHasOnLockScreen:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsVideo:(unsigned int)a3;
- (void)setOnLockScreen:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFaceTimeCallRelayUpdateReceived

- (void)dealloc
{
  [(AWDFaceTimeCallRelayUpdateReceived *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallRelayUpdateReceived;
  [(AWDFaceTimeCallRelayUpdateReceived *)&v3 dealloc];
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsVideo:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isVideo = a3;
}

- (void)setHasIsVideo:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsVideo
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setOnLockScreen:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_onLockScreen = a3;
}

- (void)setHasOnLockScreen:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOnLockScreen
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallRelayUpdateReceived;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDFaceTimeCallRelayUpdateReceived description](&v3, sel_description), -[AWDFaceTimeCallRelayUpdateReceived dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_isVideo] forKey:@"isVideo"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v4;
    }
    goto LABEL_6;
  }
  [v4 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 4) != 0) {
LABEL_6:
  }
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_onLockScreen] forKey:@"onLockScreen"];
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDFaceTimeCallRelayUpdateReceivedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_8:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_8;
  }
LABEL_5:
  if ((has & 4) == 0) {
    return;
  }
LABEL_9:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (self->_guid) {
    [a3 setGuid:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        return;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 6) = self->_isVideo;
  *((unsigned char *)a3 + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return;
  }
LABEL_6:
  *((_DWORD *)a3 + 7) = self->_onLockScreen;
  *((unsigned char *)a3 + 32) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 16) = [(NSString *)self->_guid copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 24) = self->_isVideo;
    *(unsigned char *)(v5 + 32) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 8) = self->_timestamp;
  *(unsigned char *)(v5 + 32) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 28) = self->_onLockScreen;
    *(unsigned char *)(v5 + 32) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
          goto LABEL_18;
        }
      }
      else if (*((unsigned char *)a3 + 32))
      {
LABEL_18:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_isVideo != *((_DWORD *)a3 + 6)) {
          goto LABEL_18;
        }
      }
      else if ((*((unsigned char *)a3 + 32) & 2) != 0)
      {
        goto LABEL_18;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 4) == 0;
      if ((*(unsigned char *)&self->_has & 4) != 0)
      {
        if ((*((unsigned char *)a3 + 32) & 4) == 0 || self->_onLockScreen != *((_DWORD *)a3 + 7)) {
          goto LABEL_18;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_guid hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  unint64_t v4 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_isVideo;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_onLockScreen;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[AWDFaceTimeCallRelayUpdateReceived setGuid:](self, "setGuid:");
  }
  char v5 = *((unsigned char *)a3 + 32);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 32);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        return;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_isVideo = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 32) & 4) == 0) {
    return;
  }
LABEL_6:
  self->_onLockScreen = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 4u;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)isVideo
{
  return self->_isVideo;
}

- (unsigned)onLockScreen
{
  return self->_onLockScreen;
}

@end