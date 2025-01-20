@interface MXRecognitionToken
- (BOOL)addSpaceAfter;
- (BOOL)hasAddSpaceAfter;
- (BOOL)hasConfidence;
- (BOOL)hasEndMilliSeconds;
- (BOOL)hasIpaPhoneSeq;
- (BOOL)hasPhoneSeq;
- (BOOL)hasSilenceStartMilliSeconds;
- (BOOL)hasStartMilliSeconds;
- (BOOL)hasTokenText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)ipaPhoneSeq;
- (NSString)phoneSeq;
- (NSString)tokenText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)confidence;
- (int)endMilliSeconds;
- (int)silenceStartMilliSeconds;
- (int)startMilliSeconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddSpaceAfter:(BOOL)a3;
- (void)setConfidence:(int)a3;
- (void)setEndMilliSeconds:(int)a3;
- (void)setHasAddSpaceAfter:(BOOL)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasEndMilliSeconds:(BOOL)a3;
- (void)setHasSilenceStartMilliSeconds:(BOOL)a3;
- (void)setHasStartMilliSeconds:(BOOL)a3;
- (void)setIpaPhoneSeq:(id)a3;
- (void)setPhoneSeq:(id)a3;
- (void)setSilenceStartMilliSeconds:(int)a3;
- (void)setStartMilliSeconds:(int)a3;
- (void)setTokenText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXRecognitionToken

- (BOOL)hasTokenText
{
  return self->_tokenText != 0;
}

- (void)setStartMilliSeconds:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_startMilliSeconds = a3;
}

- (void)setHasStartMilliSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStartMilliSeconds
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEndMilliSeconds:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endMilliSeconds = a3;
}

- (void)setHasEndMilliSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndMilliSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSilenceStartMilliSeconds:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_silenceStartMilliSeconds = a3;
}

- (void)setHasSilenceStartMilliSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSilenceStartMilliSeconds
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setConfidence:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAddSpaceAfter:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_addSpaceAfter = a3;
}

- (void)setHasAddSpaceAfter:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAddSpaceAfter
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasPhoneSeq
{
  return self->_phoneSeq != 0;
}

- (BOOL)hasIpaPhoneSeq
{
  return self->_ipaPhoneSeq != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXRecognitionToken;
  v4 = [(MXRecognitionToken *)&v8 description];
  v5 = [(MXRecognitionToken *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  tokenText = self->_tokenText;
  if (tokenText) {
    [v3 setObject:tokenText forKey:@"token_text"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v11 = [NSNumber numberWithInt:self->_startMilliSeconds];
    [v4 setObject:v11 forKey:@"start_milli_seconds"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v12 = [NSNumber numberWithInt:self->_endMilliSeconds];
  [v4 setObject:v12 forKey:@"end_milli_seconds"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v13 = [NSNumber numberWithInt:self->_silenceStartMilliSeconds];
  [v4 setObject:v13 forKey:@"silence_start_milli_seconds"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  v14 = [NSNumber numberWithInt:self->_confidence];
  [v4 setObject:v14 forKey:@"confidence"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    v7 = [NSNumber numberWithBool:self->_addSpaceAfter];
    [v4 setObject:v7 forKey:@"add_space_after"];
  }
LABEL_9:
  phoneSeq = self->_phoneSeq;
  if (phoneSeq) {
    [v4 setObject:phoneSeq forKey:@"phone_seq"];
  }
  ipaPhoneSeq = self->_ipaPhoneSeq;
  if (ipaPhoneSeq) {
    [v4 setObject:ipaPhoneSeq forKey:@"ipa_phone_seq"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXRecognitionTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_tokenText)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_9:
  if (self->_phoneSeq)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_ipaPhoneSeq)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_tokenText)
  {
    objc_msgSend(v4, "setTokenText:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_startMilliSeconds;
    *((unsigned char *)v4 + 52) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 3) = self->_endMilliSeconds;
  *((unsigned char *)v4 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 8) = self->_silenceStartMilliSeconds;
  *((unsigned char *)v4 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  *((_DWORD *)v4 + 2) = self->_confidence;
  *((unsigned char *)v4 + 52) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *((unsigned char *)v4 + 48) = self->_addSpaceAfter;
    *((unsigned char *)v4 + 52) |= 0x10u;
  }
LABEL_9:
  if (self->_phoneSeq)
  {
    objc_msgSend(v6, "setPhoneSeq:");
    id v4 = v6;
  }
  if (self->_ipaPhoneSeq)
  {
    objc_msgSend(v6, "setIpaPhoneSeq:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_tokenText copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_startMilliSeconds;
    *(unsigned char *)(v5 + 52) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 12) = self->_endMilliSeconds;
  *(unsigned char *)(v5 + 52) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(_DWORD *)(v5 + 8) = self->_confidence;
    *(unsigned char *)(v5 + 52) |= 1u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v5 + 32) = self->_silenceStartMilliSeconds;
  *(unsigned char *)(v5 + 52) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    *(unsigned char *)(v5 + 48) = self->_addSpaceAfter;
    *(unsigned char *)(v5 + 52) |= 0x10u;
  }
LABEL_7:
  uint64_t v9 = [(NSString *)self->_phoneSeq copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_ipaPhoneSeq copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  tokenText = self->_tokenText;
  if ((unint64_t)tokenText | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](tokenText, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0 || self->_startMilliSeconds != *((_DWORD *)v4 + 9)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_endMilliSeconds != *((_DWORD *)v4 + 3)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_silenceStartMilliSeconds != *((_DWORD *)v4 + 8)) {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_36;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_confidence != *((_DWORD *)v4 + 2)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
    {
      if (self->_addSpaceAfter)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_36;
        }
        goto LABEL_32;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_32;
      }
    }
LABEL_36:
    char v8 = 0;
    goto LABEL_37;
  }
  if ((*((unsigned char *)v4 + 52) & 0x10) != 0) {
    goto LABEL_36;
  }
LABEL_32:
  phoneSeq = self->_phoneSeq;
  if ((unint64_t)phoneSeq | *((void *)v4 + 3) && !-[NSString isEqual:](phoneSeq, "isEqual:")) {
    goto LABEL_36;
  }
  ipaPhoneSeq = self->_ipaPhoneSeq;
  if ((unint64_t)ipaPhoneSeq | *((void *)v4 + 2)) {
    char v8 = -[NSString isEqual:](ipaPhoneSeq, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_37:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_tokenText hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_startMilliSeconds;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_endMilliSeconds;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_silenceStartMilliSeconds;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v8 = 0;
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_confidence;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_addSpaceAfter;
LABEL_12:
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_phoneSeq hash];
  return v9 ^ [(NSString *)self->_ipaPhoneSeq hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 5))
  {
    -[MXRecognitionToken setTokenText:](self, "setTokenText:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 8) != 0)
  {
    self->_startMilliSeconds = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_endMilliSeconds = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_silenceStartMilliSeconds = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  self->_confidence = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
  {
LABEL_8:
    self->_addSpaceAfter = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_9:
  if (*((void *)v4 + 3))
  {
    -[MXRecognitionToken setPhoneSeq:](self, "setPhoneSeq:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[MXRecognitionToken setIpaPhoneSeq:](self, "setIpaPhoneSeq:");
    id v4 = v6;
  }
}

- (NSString)tokenText
{
  return self->_tokenText;
}

- (void)setTokenText:(id)a3
{
}

- (int)startMilliSeconds
{
  return self->_startMilliSeconds;
}

- (int)endMilliSeconds
{
  return self->_endMilliSeconds;
}

- (int)silenceStartMilliSeconds
{
  return self->_silenceStartMilliSeconds;
}

- (int)confidence
{
  return self->_confidence;
}

- (BOOL)addSpaceAfter
{
  return self->_addSpaceAfter;
}

- (NSString)phoneSeq
{
  return self->_phoneSeq;
}

- (void)setPhoneSeq:(id)a3
{
}

- (NSString)ipaPhoneSeq
{
  return self->_ipaPhoneSeq;
}

- (void)setIpaPhoneSeq:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenText, 0);
  objc_storeStrong((id *)&self->_phoneSeq, 0);

  objc_storeStrong((id *)&self->_ipaPhoneSeq, 0);
}

@end