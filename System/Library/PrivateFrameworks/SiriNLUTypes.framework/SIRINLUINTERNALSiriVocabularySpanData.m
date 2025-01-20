@interface SIRINLUINTERNALSiriVocabularySpanData
- (BOOL)hasMatchScore;
- (BOOL)hasPriorOrdinality;
- (BOOL)hasPriorScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)matchScore;
- (double)priorScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)priorOrdinality;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMatchScore:(BOOL)a3;
- (void)setHasPriorOrdinality:(BOOL)a3;
- (void)setHasPriorScore:(BOOL)a3;
- (void)setMatchScore:(double)a3;
- (void)setPriorOrdinality:(unsigned int)a3;
- (void)setPriorScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSiriVocabularySpanData

- (double)matchScore
{
  return self->_matchScore;
}

- (double)priorScore
{
  return self->_priorScore;
}

- (unsigned)priorOrdinality
{
  return self->_priorOrdinality;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 4) != 0)
  {
    self->_priorOrdinality = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_priorScore = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 28))
  {
LABEL_4:
    self->_matchScore = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_priorOrdinality;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double priorScore = self->_priorScore;
  double v6 = -priorScore;
  if (priorScore >= 0.0) {
    double v6 = self->_priorScore;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if (has)
  {
    double matchScore = self->_matchScore;
    double v12 = -matchScore;
    if (matchScore >= 0.0) {
      double v12 = self->_matchScore;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  return v9 ^ v4 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_priorOrdinality != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_priorScore != *((double *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_matchScore != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 6) = self->_priorOrdinality;
    *((unsigned char *)result + 28) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = *(void *)&self->_priorScore;
  *((unsigned char *)result + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 1) = *(void *)&self->_matchScore;
  *((unsigned char *)result + 28) |= 1u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[6] = self->_priorOrdinality;
    *((unsigned char *)v4 + 28) |= 4u;
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
  *((void *)v4 + 2) = *(void *)&self->_priorScore;
  *((unsigned char *)v4 + 28) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)v4 + 1) = *(void *)&self->_matchScore;
    *((unsigned char *)v4 + 28) |= 1u;
  }
LABEL_5:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
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
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSiriVocabularySpanDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    long double v7 = [NSNumber numberWithUnsignedInt:self->_priorOrdinality];
    [v3 setObject:v7 forKey:@"prior_ordinality"];

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
  double v8 = [NSNumber numberWithDouble:self->_priorScore];
  [v3 setObject:v8 forKey:@"prior_score"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    BOOL v5 = [NSNumber numberWithDouble:self->_matchScore];
    [v3 setObject:v5 forKey:@"match_score"];
  }
LABEL_5:
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSiriVocabularySpanData;
  id v4 = [(SIRINLUINTERNALSiriVocabularySpanData *)&v8 description];
  BOOL v5 = [(SIRINLUINTERNALSiriVocabularySpanData *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMatchScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMatchScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMatchScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double matchScore = a3;
}

- (BOOL)hasPriorScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasPriorScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setPriorScore:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double priorScore = a3;
}

- (BOOL)hasPriorOrdinality
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasPriorOrdinality:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setPriorOrdinality:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_priorOrdinality = a3;
}

@end