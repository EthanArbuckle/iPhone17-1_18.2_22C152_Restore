@interface AWDIMessageSentMessage
- (BOOL)hasConnectionType;
- (BOOL)hasFzError;
- (BOOL)hasGuid;
- (BOOL)hasHasAttachments;
- (BOOL)hasIsGroupMessage;
- (BOOL)hasIsToEmail;
- (BOOL)hasIsToPhoneNumber;
- (BOOL)hasIsTypingIndicator;
- (BOOL)hasMessageError;
- (BOOL)hasSendDuration;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)fzError;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)connectionType;
- (unsigned)hasAttachments;
- (unsigned)isGroupMessage;
- (unsigned)isToEmail;
- (unsigned)isToPhoneNumber;
- (unsigned)isTypingIndicator;
- (unsigned)messageError;
- (unsigned)sendDuration;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectionType:(unsigned int)a3;
- (void)setFzError:(int)a3;
- (void)setGuid:(id)a3;
- (void)setHasAttachments:(unsigned int)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasFzError:(BOOL)a3;
- (void)setHasHasAttachments:(BOOL)a3;
- (void)setHasIsGroupMessage:(BOOL)a3;
- (void)setHasIsToEmail:(BOOL)a3;
- (void)setHasIsToPhoneNumber:(BOOL)a3;
- (void)setHasIsTypingIndicator:(BOOL)a3;
- (void)setHasMessageError:(BOOL)a3;
- (void)setHasSendDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsGroupMessage:(unsigned int)a3;
- (void)setIsToEmail:(unsigned int)a3;
- (void)setIsToPhoneNumber:(unsigned int)a3;
- (void)setIsTypingIndicator:(unsigned int)a3;
- (void)setMessageError:(unsigned int)a3;
- (void)setSendDuration:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIMessageSentMessage

- (void)dealloc
{
  [(AWDIMessageSentMessage *)self setGuid:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageSentMessage;
  [(AWDIMessageSentMessage *)&v3 dealloc];
}

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setFzError:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_fzError = a3;
}

- (void)setHasFzError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFzError
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMessageError:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_messageError = a3;
}

- (void)setHasMessageError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMessageError
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsTypingIndicator:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isTypingIndicator = a3;
}

- (void)setHasIsTypingIndicator:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsTypingIndicator
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsGroupMessage:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isGroupMessage = a3;
}

- (void)setHasIsGroupMessage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsGroupMessage
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsToPhoneNumber:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isToPhoneNumber = a3;
}

- (void)setHasIsToPhoneNumber:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsToPhoneNumber
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsToEmail:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isToEmail = a3;
}

- (void)setHasIsToEmail:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsToEmail
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setHasAttachments:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_hasAttachments = a3;
}

- (void)setHasHasAttachments:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHasAttachments
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSendDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_sendDuration = a3;
}

- (void)setHasSendDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSendDuration
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageSentMessage;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIMessageSentMessage description](&v3, sel_description), -[AWDIMessageSentMessage dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    [v4 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 0x100) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:[NSNumber numberWithInt:self->_fzError] forKey:@"fzError"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_messageError] forKey:@"messageError"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_isTypingIndicator] forKey:@"isTypingIndicator"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_isGroupMessage] forKey:@"isGroupMessage"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_isToPhoneNumber] forKey:@"isToPhoneNumber"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_isToEmail] forKey:@"isToEmail"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
LABEL_23:
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_sendDuration] forKey:@"sendDuration"];
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return v4;
    }
    goto LABEL_13;
  }
LABEL_22:
  [v4 setObject:[NSNumber numberWithUnsignedInt:self->_hasAttachments] forKey:@"hasAttachments"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_23;
  }
LABEL_12:
  if ((has & 2) != 0) {
LABEL_13:
  }
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_connectionType] forKey:@"connectionType"];
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageSentMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 0x100) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
LABEL_22:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_23;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_22;
  }
LABEL_12:
  if ((has & 2) == 0) {
    return;
  }
LABEL_23:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (self->_guid) {
    [a3 setGuid:];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 0x100) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)a3 + 5) = self->_fzError;
  *((_WORD *)a3 + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)a3 + 13) = self->_messageError;
  *((_WORD *)a3 + 30) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 12) = self->_isTypingIndicator;
  *((_WORD *)a3 + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 9) = self->_isGroupMessage;
  *((_WORD *)a3 + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 11) = self->_isToPhoneNumber;
  *((_WORD *)a3 + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 10) = self->_isToEmail;
  *((_WORD *)a3 + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 8) = self->_hasAttachments;
  *((_WORD *)a3 + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_23:
  *((_DWORD *)a3 + 14) = self->_sendDuration;
  *((_WORD *)a3 + 30) |= 0x200u;
  if ((*(_WORD *)&self->_has & 2) == 0) {
    return;
  }
LABEL_13:
  *((_DWORD *)a3 + 4) = self->_connectionType;
  *((_WORD *)a3 + 30) |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[(id)objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 24) = [(NSString *)self->_guid copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 60) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 20) = self->_fzError;
  *(_WORD *)(v5 + 60) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 52) = self->_messageError;
  *(_WORD *)(v5 + 60) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 48) = self->_isTypingIndicator;
  *(_WORD *)(v5 + 60) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 36) = self->_isGroupMessage;
  *(_WORD *)(v5 + 60) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 44) = self->_isToPhoneNumber;
  *(_WORD *)(v5 + 60) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 40) = self->_isToEmail;
  *(_WORD *)(v5 + 60) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
LABEL_21:
    *(_DWORD *)(v5 + 56) = self->_sendDuration;
    *(_WORD *)(v5 + 60) |= 0x200u;
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_11;
  }
LABEL_20:
  *(_DWORD *)(v5 + 32) = self->_hasAttachments;
  *(_WORD *)(v5 + 60) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0) {
    goto LABEL_21;
  }
LABEL_10:
  if ((has & 2) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 16) = self->_connectionType;
    *(_WORD *)(v5 + 60) |= 2u;
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
      __int16 has = (__int16)self->_has;
      __int16 v8 = *((_WORD *)a3 + 30);
      if (has)
      {
        if ((v8 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
          goto LABEL_53;
        }
      }
      else if (v8)
      {
LABEL_53:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((has & 4) != 0)
      {
        if ((v8 & 4) == 0 || self->_fzError != *((_DWORD *)a3 + 5)) {
          goto LABEL_53;
        }
      }
      else if ((v8 & 4) != 0)
      {
        goto LABEL_53;
      }
      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 30) & 0x100) == 0 || self->_messageError != *((_DWORD *)a3 + 13)) {
          goto LABEL_53;
        }
      }
      else if ((*((_WORD *)a3 + 30) & 0x100) != 0)
      {
        goto LABEL_53;
      }
      if ((has & 0x80) != 0)
      {
        if ((v8 & 0x80) == 0 || self->_isTypingIndicator != *((_DWORD *)a3 + 12)) {
          goto LABEL_53;
        }
      }
      else if ((v8 & 0x80) != 0)
      {
        goto LABEL_53;
      }
      if ((has & 0x10) != 0)
      {
        if ((v8 & 0x10) == 0 || self->_isGroupMessage != *((_DWORD *)a3 + 9)) {
          goto LABEL_53;
        }
      }
      else if ((v8 & 0x10) != 0)
      {
        goto LABEL_53;
      }
      if ((has & 0x40) != 0)
      {
        if ((v8 & 0x40) == 0 || self->_isToPhoneNumber != *((_DWORD *)a3 + 11)) {
          goto LABEL_53;
        }
      }
      else if ((v8 & 0x40) != 0)
      {
        goto LABEL_53;
      }
      if ((has & 0x20) != 0)
      {
        if ((v8 & 0x20) == 0 || self->_isToEmail != *((_DWORD *)a3 + 10)) {
          goto LABEL_53;
        }
      }
      else if ((v8 & 0x20) != 0)
      {
        goto LABEL_53;
      }
      if ((has & 8) != 0)
      {
        if ((v8 & 8) == 0 || self->_hasAttachments != *((_DWORD *)a3 + 8)) {
          goto LABEL_53;
        }
      }
      else if ((v8 & 8) != 0)
      {
        goto LABEL_53;
      }
      if ((*(_WORD *)&self->_has & 0x200) != 0)
      {
        if ((*((_WORD *)a3 + 30) & 0x200) == 0 || self->_sendDuration != *((_DWORD *)a3 + 14)) {
          goto LABEL_53;
        }
      }
      else if ((*((_WORD *)a3 + 30) & 0x200) != 0)
      {
        goto LABEL_53;
      }
      LOBYTE(v5) = (v8 & 2) == 0;
      if ((has & 2) != 0)
      {
        if ((v8 & 2) == 0 || self->_connectionType != *((_DWORD *)a3 + 4)) {
          goto LABEL_53;
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
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v5 = 2654435761u * self->_timestamp;
    if ((has & 4) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_fzError;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_messageError;
    if ((has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_isTypingIndicator;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_isGroupMessage;
    if ((has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v9 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v10 = 2654435761 * self->_isToPhoneNumber;
    if ((has & 0x20) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v10 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_8:
    uint64_t v11 = 2654435761 * self->_isToEmail;
    if ((has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v11 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    uint64_t v12 = 2654435761 * self->_hasAttachments;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v13 = 0;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v14 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_19:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v13 = 2654435761 * self->_sendDuration;
  if ((has & 2) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v14 = 2654435761 * self->_connectionType;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[AWDIMessageSentMessage setGuid:](self, "setGuid:");
  }
  __int16 v5 = *((_WORD *)a3 + 30);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)a3 + 30);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 0x100) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_fzError = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)a3 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_messageError = *((_DWORD *)a3 + 13);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)a3 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_isTypingIndicator = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_isGroupMessage = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_isToPhoneNumber = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)a3 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_isToEmail = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_hasAttachments = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 2) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_23:
  self->_sendDuration = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)a3 + 30) & 2) == 0) {
    return;
  }
LABEL_13:
  self->_connectionType = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
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

- (unsigned)messageError
{
  return self->_messageError;
}

- (unsigned)isTypingIndicator
{
  return self->_isTypingIndicator;
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

- (unsigned)connectionType
{
  return self->_connectionType;
}

@end