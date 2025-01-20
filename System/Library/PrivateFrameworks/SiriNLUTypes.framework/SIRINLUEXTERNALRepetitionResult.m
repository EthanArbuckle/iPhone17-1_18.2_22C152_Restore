@interface SIRINLUEXTERNALRepetitionResult
- (BOOL)hasAsrHypothesisIndex;
- (BOOL)hasRepetitionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)repetitionTypeAsString:(int)a3;
- (int)StringAsRepetitionType:(id)a3;
- (int)repetitionType;
- (unint64_t)hash;
- (unsigned)asrHypothesisIndex;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAsrHypothesisIndex:(unsigned int)a3;
- (void)setHasAsrHypothesisIndex:(BOOL)a3;
- (void)setHasRepetitionType:(BOOL)a3;
- (void)setRepetitionType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALRepetitionResult

- (unsigned)asrHypothesisIndex
{
  return self->_asrHypothesisIndex;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_asrHypothesisIndex = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_repetitionType = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_asrHypothesisIndex;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_repetitionType;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_asrHypothesisIndex != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_repetitionType != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_asrHypothesisIndex;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_repetitionType;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_asrHypothesisIndex;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = self->_repetitionType;
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALRepetitionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    BOOL v5 = [NSNumber numberWithUnsignedInt:self->_asrHypothesisIndex];
    [v3 setObject:v5 forKey:@"asr_hypothesis_index"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t repetitionType = self->_repetitionType;
    if (repetitionType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_repetitionType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E6578BB8[repetitionType];
    }
    [v3 setObject:v7 forKey:@"repetition_type"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALRepetitionResult;
  id v4 = [(SIRINLUEXTERNALRepetitionResult *)&v8 description];
  BOOL v5 = [(SIRINLUEXTERNALRepetitionResult *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsRepetitionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_AVAILABLE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PARTIAL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FULL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)repetitionTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6578BB8[a3];
  }
  return v3;
}

- (BOOL)hasRepetitionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasRepetitionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setRepetitionType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t repetitionType = a3;
}

- (int)repetitionType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_repetitionType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasAsrHypothesisIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAsrHypothesisIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAsrHypothesisIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_asrHypothesisIndex = a3;
}

@end