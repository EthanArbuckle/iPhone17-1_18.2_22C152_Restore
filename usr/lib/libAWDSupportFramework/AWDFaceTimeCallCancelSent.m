@interface AWDFaceTimeCallCancelSent
- (BOOL)hasCancelCode;
- (BOOL)hasErrorCode;
- (BOOL)hasGuid;
- (BOOL)hasIsVideo;
- (BOOL)hasOnLockScreen;
- (BOOL)hasSendDuration;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)errorCode;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)cancelCode;
- (unsigned)isVideo;
- (unsigned)onLockScreen;
- (unsigned)sendDuration;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCancelCode:(unsigned int)a3;
- (void)setErrorCode:(int)a3;
- (void)setGuid:(id)a3;
- (void)setHasCancelCode:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasIsVideo:(BOOL)a3;
- (void)setHasOnLockScreen:(BOOL)a3;
- (void)setHasSendDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsVideo:(unsigned int)a3;
- (void)setOnLockScreen:(unsigned int)a3;
- (void)setSendDuration:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDFaceTimeCallCancelSent

- (void)dealloc
{
  [(AWDFaceTimeCallCancelSent *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallCancelSent;
  [(AWDFaceTimeCallCancelSent *)&v3 dealloc];
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

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCancelCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cancelCode = a3;
}

- (void)setHasCancelCode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCancelCode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSendDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_sendDuration = a3;
}

- (void)setHasSendDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSendDuration
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsVideo:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isVideo = a3;
}

- (void)setHasIsVideo:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsVideo
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setOnLockScreen:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_onLockScreen = a3;
}

- (void)setHasOnLockScreen:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOnLockScreen
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDFaceTimeCallCancelSent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDFaceTimeCallCancelSent description](&v3, sel_description), -[AWDFaceTimeCallCancelSent dictionaryRepresentation](self, "dictionaryRepresentation")];
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
  if (has)
  {
    [v4 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:[NSNumber numberWithInt:self->_errorCode] forKey:@"errorCode"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_cancelCode] forKey:@"cancelCode"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
LABEL_15:
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_isVideo] forKey:@"isVideo"];
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v4;
    }
    goto LABEL_9;
  }
LABEL_14:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_sendDuration] forKey:@"sendDuration"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_15;
  }
LABEL_8:
  if ((has & 0x10) != 0) {
LABEL_9:
  }
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_onLockScreen] forKey:@"onLockScreen"];
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDFaceTimeCallCancelSentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
LABEL_14:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_14;
  }
LABEL_8:
  if ((has & 0x10) == 0) {
    return;
  }
LABEL_15:

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
    *((unsigned char *)a3 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 5) = self->_errorCode;
  *((unsigned char *)a3 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 4) = self->_cancelCode;
  *((unsigned char *)a3 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 10) = self->_sendDuration;
  *((unsigned char *)a3 + 44) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      return;
    }
    goto LABEL_9;
  }
LABEL_15:
  *((_DWORD *)a3 + 8) = self->_isVideo;
  *((unsigned char *)a3 + 44) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return;
  }
LABEL_9:
  *((_DWORD *)a3 + 9) = self->_onLockScreen;
  *((unsigned char *)a3 + 44) |= 0x10u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")

  *(void *)(v5 + 24) = [(NSString *)self->_guid copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 20) = self->_errorCode;
  *(unsigned char *)(v5 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *(_DWORD *)(v5 + 16) = self->_cancelCode;
  *(unsigned char *)(v5 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    *(_DWORD *)(v5 + 32) = self->_isVideo;
    *(unsigned char *)(v5 + 44) |= 8u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return (id)v5;
    }
    goto LABEL_7;
  }
LABEL_12:
  *(_DWORD *)(v5 + 40) = self->_sendDuration;
  *(unsigned char *)(v5 + 44) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 36) = self->_onLockScreen;
    *(unsigned char *)(v5 + 44) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    guid = self->_guid;
    if (!((unint64_t)guid | *((void *)a3 + 3)) || (int v5 = -[NSString isEqual:](guid, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
          goto LABEL_33;
        }
      }
      else if (*((unsigned char *)a3 + 44))
      {
LABEL_33:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(unsigned char *)&self->_has & 4) != 0)
      {
        if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_errorCode != *((_DWORD *)a3 + 5)) {
          goto LABEL_33;
        }
      }
      else if ((*((unsigned char *)a3 + 44) & 4) != 0)
      {
        goto LABEL_33;
      }
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_cancelCode != *((_DWORD *)a3 + 4)) {
          goto LABEL_33;
        }
      }
      else if ((*((unsigned char *)a3 + 44) & 2) != 0)
      {
        goto LABEL_33;
      }
      if ((*(unsigned char *)&self->_has & 0x20) != 0)
      {
        if ((*((unsigned char *)a3 + 44) & 0x20) == 0 || self->_sendDuration != *((_DWORD *)a3 + 10)) {
          goto LABEL_33;
        }
      }
      else if ((*((unsigned char *)a3 + 44) & 0x20) != 0)
      {
        goto LABEL_33;
      }
      if ((*(unsigned char *)&self->_has & 8) != 0)
      {
        if ((*((unsigned char *)a3 + 44) & 8) == 0 || self->_isVideo != *((_DWORD *)a3 + 8)) {
          goto LABEL_33;
        }
      }
      else if ((*((unsigned char *)a3 + 44) & 8) != 0)
      {
        goto LABEL_33;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 0x10) == 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0)
      {
        if ((*((unsigned char *)a3 + 44) & 0x10) == 0 || self->_onLockScreen != *((_DWORD *)a3 + 9)) {
          goto LABEL_33;
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
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_errorCode;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_cancelCode;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_sendDuration;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_11:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_isVideo;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_onLockScreen;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[AWDFaceTimeCallCancelSent setGuid:](self, "setGuid:");
  }
  char v5 = *((unsigned char *)a3 + 44);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_errorCode = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_cancelCode = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_sendDuration = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)a3 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      return;
    }
    goto LABEL_9;
  }
LABEL_15:
  self->_isVideo = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 44) & 0x10) == 0) {
    return;
  }
LABEL_9:
  self->_onLockScreen = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x10u;
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

- (int)errorCode
{
  return self->_errorCode;
}

- (unsigned)cancelCode
{
  return self->_cancelCode;
}

- (unsigned)sendDuration
{
  return self->_sendDuration;
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