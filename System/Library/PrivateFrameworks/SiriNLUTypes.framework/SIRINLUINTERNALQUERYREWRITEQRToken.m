@interface SIRINLUINTERNALQUERYREWRITEQRToken
+ (id)options;
- (BOOL)hasAsrConfidence;
- (BOOL)hasEndIndex;
- (BOOL)hasPhoneSequence;
- (BOOL)hasRemoveSpaceAfter;
- (BOOL)hasStartIndex;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)removeSpaceAfter;
- (NSString)phoneSequence;
- (NSString)value;
- (double)asrConfidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)endIndex;
- (unsigned)startIndex;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsrConfidence:(double)a3;
- (void)setEndIndex:(unsigned int)a3;
- (void)setHasAsrConfidence:(BOOL)a3;
- (void)setHasEndIndex:(BOOL)a3;
- (void)setHasRemoveSpaceAfter:(BOOL)a3;
- (void)setHasStartIndex:(BOOL)a3;
- (void)setPhoneSequence:(id)a3;
- (void)setRemoveSpaceAfter:(BOOL)a3;
- (void)setStartIndex:(unsigned int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALQUERYREWRITEQRToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_phoneSequence, 0);
}

- (BOOL)removeSpaceAfter
{
  return self->_removeSpaceAfter;
}

- (void)setPhoneSequence:(id)a3
{
}

- (NSString)phoneSequence
{
  return self->_phoneSequence;
}

- (double)asrConfidence
{
  return self->_asrConfidence;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 5))
  {
    -[SIRINLUINTERNALQUERYREWRITEQRToken setValue:](self, "setValue:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 4) != 0)
  {
    self->_startIndex = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_endIndex = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 52))
  {
LABEL_6:
    self->_asrConfidence = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_7:
  if (*((void *)v4 + 3))
  {
    -[SIRINLUINTERNALQUERYREWRITEQRToken setPhoneSequence:](self, "setPhoneSequence:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    self->_removeSpaceAfter = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_value hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v10 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = 2654435761 * self->_startIndex;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_endIndex;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double asrConfidence = self->_asrConfidence;
  double v7 = -asrConfidence;
  if (asrConfidence >= 0.0) {
    double v7 = self->_asrConfidence;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  NSUInteger v11 = [(NSString *)self->_phoneSequence hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v12 = 2654435761 * self->_removeSpaceAfter;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](value, "isEqual:")) {
      goto LABEL_24;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 52);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_startIndex != *((_DWORD *)v4 + 8)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_endIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_asrConfidence != *((double *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_24;
  }
  phoneSequence = self->_phoneSequence;
  if ((unint64_t)phoneSequence | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](phoneSequence, "isEqual:")) {
      goto LABEL_24;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 52);
  }
  BOOL v9 = (v7 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v7 & 8) != 0)
    {
      if (self->_removeSpaceAfter)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_24;
        }
      }
      else if (*((unsigned char *)v4 + 48))
      {
        goto LABEL_24;
      }
      BOOL v9 = 1;
      goto LABEL_25;
    }
LABEL_24:
    BOOL v9 = 0;
  }
LABEL_25:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_value copyWithZone:a3];
  char v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_startIndex;
    *(unsigned char *)(v5 + 52) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_endIndex;
  *(unsigned char *)(v5 + 52) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_asrConfidence;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
LABEL_5:
  uint64_t v9 = [(NSString *)self->_phoneSequence copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v5 + 48) = self->_removeSpaceAfter;
    *(unsigned char *)(v5 + 52) |= 8u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_value)
  {
    objc_msgSend(v4, "setValue:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_startIndex;
    *((unsigned char *)v4 + 52) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 4) = self->_endIndex;
  *((unsigned char *)v4 + 52) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *((void *)v4 + 1) = *(void *)&self->_asrConfidence;
    *((unsigned char *)v4 + 52) |= 1u;
  }
LABEL_7:
  if (self->_phoneSequence)
  {
    objc_msgSend(v6, "setPhoneSequence:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v4 + 48) = self->_removeSpaceAfter;
    *((unsigned char *)v4 + 52) |= 8u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_value)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_7:
  if (self->_phoneSequence)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALQUERYREWRITEQRTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  value = self->_value;
  if (value) {
    [v3 setObject:value forKey:@"value"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    NSUInteger v11 = [NSNumber numberWithUnsignedInt:self->_startIndex];
    [v4 setObject:v11 forKey:@"start_index"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  uint64_t v12 = [NSNumber numberWithUnsignedInt:self->_endIndex];
  [v4 setObject:v12 forKey:@"end_index"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    char v7 = [NSNumber numberWithDouble:self->_asrConfidence];
    [v4 setObject:v7 forKey:@"asr_confidence"];
  }
LABEL_7:
  phoneSequence = self->_phoneSequence;
  if (phoneSequence) {
    [v4 setObject:phoneSequence forKey:@"phone_sequence"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v9 = [NSNumber numberWithBool:self->_removeSpaceAfter];
    [v4 setObject:v9 forKey:@"remove_space_after"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALQUERYREWRITEQRToken;
  id v4 = [(SIRINLUINTERNALQUERYREWRITEQRToken *)&v8 description];
  uint64_t v5 = [(SIRINLUINTERNALQUERYREWRITEQRToken *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRemoveSpaceAfter
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasRemoveSpaceAfter:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setRemoveSpaceAfter:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_removeSpaceAfter = a3;
}

- (BOOL)hasPhoneSequence
{
  return self->_phoneSequence != 0;
}

- (BOOL)hasAsrConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAsrConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAsrConfidence:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double asrConfidence = a3;
}

- (BOOL)hasEndIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasEndIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setEndIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endIndex = a3;
}

- (BOOL)hasStartIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasStartIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setStartIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_startIndex = a3;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

+ (id)options
{
  if (options_once_14887 != -1) {
    dispatch_once(&options_once_14887, &__block_literal_global_14888);
  }
  v2 = (void *)options_sOptions_14889;
  return v2;
}

void __45__SIRINLUINTERNALQUERYREWRITEQRToken_options__block_invoke()
{
  v0 = (void *)options_sOptions_14889;
  options_sOptions_14889 = (uint64_t)&unk_1F234AA38;
}

@end