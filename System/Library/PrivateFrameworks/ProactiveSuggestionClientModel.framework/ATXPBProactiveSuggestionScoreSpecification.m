@interface ATXPBProactiveSuggestionScoreSpecification
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)suggestedConfidenceCategoryAsString:(__CFString *)a1;
- (double)rawScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)StringAsSuggestedConfidenceCategory:(uint64_t)a1;
- (uint64_t)hasRawScore;
- (uint64_t)hasSuggestedConfidenceCategory;
- (uint64_t)setHasRawScore:(uint64_t)result;
- (uint64_t)setHasSuggestedConfidenceCategory:(uint64_t)result;
- (uint64_t)setRawScore:(uint64_t)result;
- (uint64_t)setSuggestedConfidenceCategory:(uint64_t)result;
- (uint64_t)suggestedConfidenceCategory;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBProactiveSuggestionScoreSpecification

- (uint64_t)suggestedConfidenceCategory
{
  if (result)
  {
    if ((*(unsigned char *)(result + 20) & 2) != 0) {
      return *(unsigned int *)(result + 16);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (double)rawScore
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setRawScore:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 20) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasRawScore:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 20) = *(unsigned char *)(result + 20) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasRawScore
{
  if (result) {
    return *(unsigned char *)(result + 20) & 1;
  }
  return result;
}

- (uint64_t)setSuggestedConfidenceCategory:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 20) |= 2u;
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasSuggestedConfidenceCategory:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 20) = *(unsigned char *)(result + 20) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasSuggestedConfidenceCategory
{
  if (result) {
    return (*(unsigned __int8 *)(result + 20) >> 1) & 1;
  }
  return result;
}

- (__CFString)suggestedConfidenceCategoryAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5F018E8[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsSuggestedConfidenceCategory:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Unknown"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"Fallback"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"LowConfidence"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"MediumConfidence"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"HighConfidence"])
    {
      uint64_t v6 = 4;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBProactiveSuggestionScoreSpecification;
  v4 = [(ATXPBProactiveSuggestionScoreSpecification *)&v8 description];
  id v5 = [(ATXPBProactiveSuggestionScoreSpecification *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    id v5 = [NSNumber numberWithDouble:self->_rawScore];
    [v3 setObject:v5 forKey:@"rawScore"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t suggestedConfidenceCategory = self->_suggestedConfidenceCategory;
    if (suggestedConfidenceCategory >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_suggestedConfidenceCategory);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5F018E8[suggestedConfidenceCategory];
    }
    [v3 setObject:v7 forKey:@"suggestedConfidenceCategory"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBProactiveSuggestionScoreSpecificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    char v4 = *(unsigned char *)(a1 + 20);
    if (v4)
    {
      v3[1] = *(void *)(a1 + 8);
      *((unsigned char *)v3 + 20) |= 1u;
      char v4 = *(unsigned char *)(a1 + 20);
    }
    if ((v4 & 2) != 0)
    {
      *((_DWORD *)v3 + 4) = *(_DWORD *)(a1 + 16);
      *((unsigned char *)v3 + 20) |= 2u;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = *(void *)&self->_rawScore;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_suggestedConfidenceCategory;
    *((unsigned char *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_rawScore != *((double *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_suggestedConfidenceCategory != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double rawScore = self->_rawScore;
    double v6 = -rawScore;
    if (rawScore >= 0.0) {
      double v6 = self->_rawScore;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_suggestedConfidenceCategory;
  }
  else {
    uint64_t v9 = 0;
  }
  return v9 ^ v4;
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    char v4 = v3[20];
    if (v4)
    {
      *(void *)(a1 + 8) = *((void *)v3 + 1);
      *(unsigned char *)(a1 + 20) |= 1u;
      char v4 = v3[20];
    }
    if ((v4 & 2) != 0)
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
      *(unsigned char *)(a1 + 20) |= 2u;
    }
  }
}

@end