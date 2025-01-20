@interface SIRINLUEXTERNALAsrTokenInformation
- (BOOL)addSpaceAfter;
- (BOOL)hasAddSpaceAfter;
- (BOOL)hasBeginIndex;
- (BOOL)hasConfidenceScore;
- (BOOL)hasEndIndex;
- (BOOL)hasEndMilliSeconds;
- (BOOL)hasIpaPhoneSequence;
- (BOOL)hasPhoneSequence;
- (BOOL)hasPostItnText;
- (BOOL)hasRemoveSpaceAfter;
- (BOOL)hasRemoveSpaceBefore;
- (BOOL)hasStartMilliSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)removeSpaceAfter;
- (BOOL)removeSpaceBefore;
- (NSString)ipaPhoneSequence;
- (NSString)phoneSequence;
- (NSString)postItnText;
- (double)confidenceScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)endMilliSeconds;
- (int)startMilliSeconds;
- (unint64_t)hash;
- (unsigned)beginIndex;
- (unsigned)endIndex;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddSpaceAfter:(BOOL)a3;
- (void)setBeginIndex:(unsigned int)a3;
- (void)setConfidenceScore:(double)a3;
- (void)setEndIndex:(unsigned int)a3;
- (void)setEndMilliSeconds:(int)a3;
- (void)setHasAddSpaceAfter:(BOOL)a3;
- (void)setHasBeginIndex:(BOOL)a3;
- (void)setHasConfidenceScore:(BOOL)a3;
- (void)setHasEndIndex:(BOOL)a3;
- (void)setHasEndMilliSeconds:(BOOL)a3;
- (void)setHasRemoveSpaceAfter:(BOOL)a3;
- (void)setHasRemoveSpaceBefore:(BOOL)a3;
- (void)setHasStartMilliSeconds:(BOOL)a3;
- (void)setIpaPhoneSequence:(id)a3;
- (void)setPhoneSequence:(id)a3;
- (void)setPostItnText:(id)a3;
- (void)setRemoveSpaceAfter:(BOOL)a3;
- (void)setRemoveSpaceBefore:(BOOL)a3;
- (void)setStartMilliSeconds:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALAsrTokenInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postItnText, 0);
  objc_storeStrong((id *)&self->_phoneSequence, 0);
  objc_storeStrong((id *)&self->_ipaPhoneSequence, 0);
}

- (int)endMilliSeconds
{
  return self->_endMilliSeconds;
}

- (int)startMilliSeconds
{
  return self->_startMilliSeconds;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (unsigned)beginIndex
{
  return self->_beginIndex;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (BOOL)removeSpaceBefore
{
  return self->_removeSpaceBefore;
}

- (BOOL)removeSpaceAfter
{
  return self->_removeSpaceAfter;
}

- (BOOL)addSpaceAfter
{
  return self->_addSpaceAfter;
}

- (void)setIpaPhoneSequence:(id)a3
{
}

- (NSString)ipaPhoneSequence
{
  return self->_ipaPhoneSequence;
}

- (void)setPhoneSequence:(id)a3
{
}

- (NSString)phoneSequence
{
  return self->_phoneSequence;
}

- (void)setPostItnText:(id)a3
{
}

- (NSString)postItnText
{
  return self->_postItnText;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 6))
  {
    -[SIRINLUEXTERNALAsrTokenInformation setPostItnText:](self, "setPostItnText:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[SIRINLUEXTERNALAsrTokenInformation setPhoneSequence:](self, "setPhoneSequence:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[SIRINLUEXTERNALAsrTokenInformation setIpaPhoneSequence:](self, "setIpaPhoneSequence:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 0x20) != 0)
  {
    self->_addSpaceAfter = *((unsigned char *)v4 + 60);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = *((unsigned char *)v4 + 64);
    if ((v5 & 0x40) == 0)
    {
LABEL_9:
      if ((v5 & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x40) == 0)
  {
    goto LABEL_9;
  }
  self->_removeSpaceAfter = *((unsigned char *)v4 + 61);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_removeSpaceBefore = *((unsigned char *)v4 + 62);
  *(unsigned char *)&self->_has |= 0x80u;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 1) == 0)
  {
LABEL_11:
    if ((v5 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_confidenceScore = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 2) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_beginIndex = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 4) == 0)
  {
LABEL_13:
    if ((v5 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_endIndex = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 0x10) == 0)
  {
LABEL_14:
    if ((v5 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_25:
  self->_startMilliSeconds = *((_DWORD *)v4 + 14);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
LABEL_15:
    self->_endMilliSeconds = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_16:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_postItnText hash];
  NSUInteger v4 = [(NSString *)self->_phoneSequence hash];
  NSUInteger v5 = [(NSString *)self->_ipaPhoneSequence hash];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t v7 = 2654435761 * self->_addSpaceAfter;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v8 = 2654435761 * self->_removeSpaceAfter;
      if ((*(unsigned char *)&self->_has & 0x80) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v9 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v14 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v9 = 2654435761 * self->_removeSpaceBefore;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double confidenceScore = self->_confidenceScore;
  double v11 = -confidenceScore;
  if (confidenceScore >= 0.0) {
    double v11 = self->_confidenceScore;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_15:
  if ((has & 2) != 0)
  {
    uint64_t v15 = 2654435761 * self->_beginIndex;
    if ((has & 4) != 0)
    {
LABEL_17:
      uint64_t v16 = 2654435761 * self->_endIndex;
      if ((has & 0x10) != 0) {
        goto LABEL_18;
      }
LABEL_22:
      uint64_t v17 = 0;
      if ((has & 8) != 0) {
        goto LABEL_19;
      }
LABEL_23:
      uint64_t v18 = 0;
      return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((has & 4) != 0) {
      goto LABEL_17;
    }
  }
  uint64_t v16 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v17 = 2654435761 * self->_startMilliSeconds;
  if ((has & 8) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t v18 = 2654435761 * self->_endMilliSeconds;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_56;
  }
  postItnText = self->_postItnText;
  if ((unint64_t)postItnText | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](postItnText, "isEqual:")) {
      goto LABEL_56;
    }
  }
  phoneSequence = self->_phoneSequence;
  if ((unint64_t)phoneSequence | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](phoneSequence, "isEqual:")) {
      goto LABEL_56;
    }
  }
  ipaPhoneSequence = self->_ipaPhoneSequence;
  if ((unint64_t)ipaPhoneSequence | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](ipaPhoneSequence, "isEqual:")) {
      goto LABEL_56;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x20) == 0) {
      goto LABEL_56;
    }
    if (self->_addSpaceAfter)
    {
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_56;
      }
    }
    else if (*((unsigned char *)v4 + 60))
    {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x20) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x40) == 0) {
      goto LABEL_56;
    }
    if (self->_removeSpaceAfter)
    {
      if (!*((unsigned char *)v4 + 61)) {
        goto LABEL_56;
      }
    }
    else if (*((unsigned char *)v4 + 61))
    {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x40) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x80) == 0) {
      goto LABEL_26;
    }
LABEL_56:
    BOOL v8 = 0;
    goto LABEL_57;
  }
  if ((*((unsigned char *)v4 + 64) & 0x80) == 0) {
    goto LABEL_56;
  }
  if (self->_removeSpaceBefore)
  {
    if (!*((unsigned char *)v4 + 62)) {
      goto LABEL_56;
    }
  }
  else if (*((unsigned char *)v4 + 62))
  {
    goto LABEL_56;
  }
LABEL_26:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_confidenceScore != *((double *)v4 + 1)) {
      goto LABEL_56;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_beginIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_endIndex != *((_DWORD *)v4 + 5)) {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_56;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0 || self->_startMilliSeconds != *((_DWORD *)v4 + 14)) {
      goto LABEL_56;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_56;
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_endMilliSeconds != *((_DWORD *)v4 + 6)) {
      goto LABEL_56;
    }
    BOOL v8 = 1;
  }
LABEL_57:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_postItnText copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_phoneSequence copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_ipaPhoneSequence copyWithZone:a3];
  double v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 60) = self->_addSpaceAfter;
    *(unsigned char *)(v5 + 64) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 61) = self->_removeSpaceAfter;
  *(unsigned char *)(v5 + 64) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(unsigned char *)(v5 + 62) = self->_removeSpaceBefore;
  *(unsigned char *)(v5 + 64) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(double *)(v5 + 8) = self->_confidenceScore;
  *(unsigned char *)(v5 + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 16) = self->_beginIndex;
  *(unsigned char *)(v5 + 64) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    *(_DWORD *)(v5 + 56) = self->_startMilliSeconds;
    *(unsigned char *)(v5 + 64) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return (id)v5;
    }
    goto LABEL_9;
  }
LABEL_16:
  *(_DWORD *)(v5 + 20) = self->_endIndex;
  *(unsigned char *)(v5 + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_17;
  }
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 24) = self->_endMilliSeconds;
    *(unsigned char *)(v5 + 64) |= 8u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_postItnText)
  {
    objc_msgSend(v4, "setPostItnText:");
    id v4 = v6;
  }
  if (self->_phoneSequence)
  {
    objc_msgSend(v6, "setPhoneSequence:");
    id v4 = v6;
  }
  if (self->_ipaPhoneSequence)
  {
    objc_msgSend(v6, "setIpaPhoneSequence:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)v4 + 60) = self->_addSpaceAfter;
    *((unsigned char *)v4 + 64) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v4 + 61) = self->_removeSpaceAfter;
  *((unsigned char *)v4 + 64) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)v4 + 62) = self->_removeSpaceBefore;
  *((unsigned char *)v4 + 64) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)v4 + 1) = *(void *)&self->_confidenceScore;
  *((unsigned char *)v4 + 64) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 4) = self->_beginIndex;
  *((unsigned char *)v4 + 64) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 5) = self->_endIndex;
  *((unsigned char *)v4 + 64) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_25:
  *((_DWORD *)v4 + 14) = self->_startMilliSeconds;
  *((unsigned char *)v4 + 64) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_15:
    *((_DWORD *)v4 + 6) = self->_endMilliSeconds;
    *((unsigned char *)v4 + 64) |= 8u;
  }
LABEL_16:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_postItnText)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_phoneSequence)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_ipaPhoneSequence)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_16:
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALAsrTokenInformationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  postItnText = self->_postItnText;
  if (postItnText) {
    [v3 setObject:postItnText forKey:@"post_itn_text"];
  }
  phoneSequence = self->_phoneSequence;
  if (phoneSequence) {
    [v4 setObject:phoneSequence forKey:@"phone_sequence"];
  }
  ipaPhoneSequence = self->_ipaPhoneSequence;
  if (ipaPhoneSequence) {
    [v4 setObject:ipaPhoneSequence forKey:@"ipa_phone_sequence"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    double v11 = [NSNumber numberWithBool:self->_addSpaceAfter];
    [v4 setObject:v11 forKey:@"add_space_after"];

    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  long double v12 = [NSNumber numberWithBool:self->_removeSpaceAfter];
  [v4 setObject:v12 forKey:@"remove_space_after"];

  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  double v13 = [NSNumber numberWithBool:self->_removeSpaceBefore];
  [v4 setObject:v13 forKey:@"remove_space_before"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v14 = [NSNumber numberWithDouble:self->_confidenceScore];
  [v4 setObject:v14 forKey:@"confidence_score"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v15 = [NSNumber numberWithUnsignedInt:self->_beginIndex];
  [v4 setObject:v15 forKey:@"begin_index"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v16 = [NSNumber numberWithUnsignedInt:self->_endIndex];
  [v4 setObject:v16 forKey:@"end_index"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_25:
  uint64_t v17 = [NSNumber numberWithInt:self->_startMilliSeconds];
  [v4 setObject:v17 forKey:@"start_milli_seconds"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_15:
    uint64_t v9 = [NSNumber numberWithInt:self->_endMilliSeconds];
    [v4 setObject:v9 forKey:@"end_milli_seconds"];
  }
LABEL_16:
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALAsrTokenInformation;
  id v4 = [(SIRINLUEXTERNALAsrTokenInformation *)&v8 description];
  uint64_t v5 = [(SIRINLUEXTERNALAsrTokenInformation *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasEndMilliSeconds
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasEndMilliSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setEndMilliSeconds:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_endMilliSeconds = a3;
}

- (BOOL)hasStartMilliSeconds
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasStartMilliSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setStartMilliSeconds:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_startMilliSeconds = a3;
}

- (BOOL)hasEndIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasEndIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setEndIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_endIndex = a3;
}

- (BOOL)hasBeginIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasBeginIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setBeginIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_beginIndex = a3;
}

- (BOOL)hasConfidenceScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setConfidenceScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double confidenceScore = a3;
}

- (BOOL)hasRemoveSpaceBefore
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasRemoveSpaceBefore:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (void)setRemoveSpaceBefore:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_removeSpaceBefore = a3;
}

- (BOOL)hasRemoveSpaceAfter
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasRemoveSpaceAfter:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setRemoveSpaceAfter:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_removeSpaceAfter = a3;
}

- (BOOL)hasAddSpaceAfter
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasAddSpaceAfter:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setAddSpaceAfter:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_addSpaceAfter = a3;
}

- (BOOL)hasIpaPhoneSequence
{
  return self->_ipaPhoneSequence != 0;
}

- (BOOL)hasPhoneSequence
{
  return self->_phoneSequence != 0;
}

- (BOOL)hasPostItnText
{
  return self->_postItnText != 0;
}

@end