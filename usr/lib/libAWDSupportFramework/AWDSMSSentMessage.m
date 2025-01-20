@interface AWDSMSSentMessage
- (BOOL)hasCtError;
- (BOOL)hasFzError;
- (BOOL)hasGuid;
- (BOOL)hasHasAttachments;
- (BOOL)hasIsGroupMessage;
- (BOOL)hasIsToEmail;
- (BOOL)hasIsToPhoneNumber;
- (BOOL)hasSendDuration;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)ctError;
- (int)fzError;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)hasAttachments;
- (unsigned)isGroupMessage;
- (unsigned)isToEmail;
- (unsigned)isToPhoneNumber;
- (unsigned)sendDuration;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCtError:(int)a3;
- (void)setFzError:(int)a3;
- (void)setGuid:(id)a3;
- (void)setHasAttachments:(unsigned int)a3;
- (void)setHasCtError:(BOOL)a3;
- (void)setHasFzError:(BOOL)a3;
- (void)setHasHasAttachments:(BOOL)a3;
- (void)setHasIsGroupMessage:(BOOL)a3;
- (void)setHasIsToEmail:(BOOL)a3;
- (void)setHasIsToPhoneNumber:(BOOL)a3;
- (void)setHasSendDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsGroupMessage:(unsigned int)a3;
- (void)setIsToEmail:(unsigned int)a3;
- (void)setIsToPhoneNumber:(unsigned int)a3;
- (void)setSendDuration:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSMSSentMessage

- (void)dealloc
{
  [(AWDSMSSentMessage *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSMSSentMessage;
  [(AWDSMSSentMessage *)&v3 dealloc];
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

- (void)setFzError:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_fzError = a3;
}

- (void)setHasFzError:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFzError
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCtError:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ctError = a3;
}

- (void)setHasCtError:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCtError
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsGroupMessage:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isGroupMessage = a3;
}

- (void)setHasIsGroupMessage:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsGroupMessage
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsToPhoneNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isToPhoneNumber = a3;
}

- (void)setHasIsToPhoneNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsToPhoneNumber
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setIsToEmail:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isToEmail = a3;
}

- (void)setHasIsToEmail:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsToEmail
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasAttachments:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_hasAttachments = a3;
}

- (void)setHasHasAttachments:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHasAttachments
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSendDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_sendDuration = a3;
}

- (void)setHasSendDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSendDuration
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSMSSentMessage;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSMSSentMessage description](&v3, sel_description), -[AWDSMSSentMessage dictionaryRepresentation](self, "dictionaryRepresentation")];
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
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:[NSNumber numberWithInt:self->_fzError] forKey:@"fzError"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v4 setObject:[NSNumber numberWithInt:self->_ctError] forKey:@"ctError"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_isGroupMessage] forKey:@"isGroupMessage"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_isToPhoneNumber] forKey:@"isToPhoneNumber"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
LABEL_18:
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_hasAttachments] forKey:@"hasAttachments"];
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      return v4;
    }
LABEL_19:
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_sendDuration] forKey:@"sendDuration"];
    return v4;
  }
LABEL_17:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_isToEmail] forKey:@"isToEmail"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_18;
  }
LABEL_10:
  if (has < 0) {
    goto LABEL_19;
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSMSSentMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
      goto LABEL_14;
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
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
LABEL_18:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_18;
  }
LABEL_10:
  if ((has & 0x80) == 0) {
    return;
  }
LABEL_19:

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
    *((unsigned char *)a3 + 52) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 5) = self->_fzError;
  *((unsigned char *)a3 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 4) = self->_ctError;
  *((unsigned char *)a3 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 9) = self->_isGroupMessage;
  *((unsigned char *)a3 + 52) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 11) = self->_isToPhoneNumber;
  *((unsigned char *)a3 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 10) = self->_isToEmail;
  *((unsigned char *)a3 + 52) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      return;
    }
LABEL_19:
    *((_DWORD *)a3 + 12) = self->_sendDuration;
    *((unsigned char *)a3 + 52) |= 0x80u;
    return;
  }
LABEL_18:
  *((_DWORD *)a3 + 8) = self->_hasAttachments;
  *((unsigned char *)a3 + 52) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    goto LABEL_19;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 24) = [(NSString *)self->_guid copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 52) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 20) = self->_fzError;
  *(unsigned char *)(v5 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v5 + 16) = self->_ctError;
  *(unsigned char *)(v5 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 36) = self->_isGroupMessage;
  *(unsigned char *)(v5 + 52) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 44) = self->_isToPhoneNumber;
  *(unsigned char *)(v5 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    *(_DWORD *)(v5 + 32) = self->_hasAttachments;
    *(unsigned char *)(v5 + 52) |= 8u;
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      return (id)v5;
    }
LABEL_17:
    *(_DWORD *)(v5 + 48) = self->_sendDuration;
    *(unsigned char *)(v5 + 52) |= 0x80u;
    return (id)v5;
  }
LABEL_15:
  *(_DWORD *)(v5 + 40) = self->_isToEmail;
  *(unsigned char *)(v5 + 52) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_16;
  }
LABEL_8:
  if (has < 0) {
    goto LABEL_17;
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
        if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
          goto LABEL_43;
        }
      }
      else if (*((unsigned char *)a3 + 52))
      {
LABEL_43:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(unsigned char *)&self->_has & 4) != 0)
      {
        if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_fzError != *((_DWORD *)a3 + 5)) {
          goto LABEL_43;
        }
      }
      else if ((*((unsigned char *)a3 + 52) & 4) != 0)
      {
        goto LABEL_43;
      }
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_ctError != *((_DWORD *)a3 + 4)) {
          goto LABEL_43;
        }
      }
      else if ((*((unsigned char *)a3 + 52) & 2) != 0)
      {
        goto LABEL_43;
      }
      if ((*(unsigned char *)&self->_has & 0x10) != 0)
      {
        if ((*((unsigned char *)a3 + 52) & 0x10) == 0 || self->_isGroupMessage != *((_DWORD *)a3 + 9)) {
          goto LABEL_43;
        }
      }
      else if ((*((unsigned char *)a3 + 52) & 0x10) != 0)
      {
        goto LABEL_43;
      }
      if ((*(unsigned char *)&self->_has & 0x40) != 0)
      {
        if ((*((unsigned char *)a3 + 52) & 0x40) == 0 || self->_isToPhoneNumber != *((_DWORD *)a3 + 11)) {
          goto LABEL_43;
        }
      }
      else if ((*((unsigned char *)a3 + 52) & 0x40) != 0)
      {
        goto LABEL_43;
      }
      if ((*(unsigned char *)&self->_has & 0x20) != 0)
      {
        if ((*((unsigned char *)a3 + 52) & 0x20) == 0 || self->_isToEmail != *((_DWORD *)a3 + 10)) {
          goto LABEL_43;
        }
      }
      else if ((*((unsigned char *)a3 + 52) & 0x20) != 0)
      {
        goto LABEL_43;
      }
      if ((*(unsigned char *)&self->_has & 8) != 0)
      {
        if ((*((unsigned char *)a3 + 52) & 8) == 0 || self->_hasAttachments != *((_DWORD *)a3 + 8)) {
          goto LABEL_43;
        }
      }
      else if ((*((unsigned char *)a3 + 52) & 8) != 0)
      {
        goto LABEL_43;
      }
      LOBYTE(v5) = *((char *)a3 + 52) >= 0;
      if ((*(unsigned char *)&self->_has & 0x80) != 0)
      {
        if ((*((unsigned char *)a3 + 52) & 0x80) == 0 || self->_sendDuration != *((_DWORD *)a3 + 12)) {
          goto LABEL_43;
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
      uint64_t v5 = 2654435761 * self->_fzError;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
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
    uint64_t v6 = 2654435761 * self->_ctError;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_isGroupMessage;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_isToPhoneNumber;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_isToEmail;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_15:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_hasAttachments;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v11 = 2654435761 * self->_sendDuration;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[AWDSMSSentMessage setGuid:](self, "setGuid:");
  }
  char v5 = *((unsigned char *)a3 + 52);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_fzError = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_ctError = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_isGroupMessage = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_isToPhoneNumber = *((_DWORD *)a3 + 11);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_isToEmail = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      return;
    }
LABEL_19:
    self->_sendDuration = *((_DWORD *)a3 + 12);
    *(unsigned char *)&self->_has |= 0x80u;
    return;
  }
LABEL_18:
  self->_hasAttachments = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 52) & 0x80) != 0) {
    goto LABEL_19;
  }
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

- (int)fzError
{
  return self->_fzError;
}

- (int)ctError
{
  return self->_ctError;
}

- (unsigned)isGroupMessage
{
  return self->_isGroupMessage;
}

- (unsigned)isToPhoneNumber
{
  return self->_isToPhoneNumber;
}

- (unsigned)isToEmail
{
  return self->_isToEmail;
}

- (unsigned)hasAttachments
{
  return self->_hasAttachments;
}

- (unsigned)sendDuration
{
  return self->_sendDuration;
}

@end