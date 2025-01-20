@interface ATXPBProactiveSuggestionGroupedUIFeedbackResult
- (BOOL)hasEndDateOfLastSessionInSeconds;
- (BOOL)hasIsComplete;
- (BOOL)hasNumAbandonedSuggestions;
- (BOOL)hasNumEngagedSuggestions;
- (BOOL)hasNumRejectedSuggestions;
- (BOOL)hasNumSessionsWithAbandonedSuggestions;
- (BOOL)hasNumSessionsWithEngagedSuggestions;
- (BOOL)hasNumSessionsWithRejectedSuggestions;
- (BOOL)hasStartDateOfFirstSessionInSeconds;
- (BOOL)isComplete;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)endDateOfLastSessionInSeconds;
- (double)startDateOfFirstSessionInSeconds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)numAbandonedSuggestions;
- (unint64_t)numEngagedSuggestions;
- (unint64_t)numRejectedSuggestions;
- (unint64_t)numSessionsWithAbandonedSuggestions;
- (unint64_t)numSessionsWithEngagedSuggestions;
- (unint64_t)numSessionsWithRejectedSuggestions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndDateOfLastSessionInSeconds:(double)a3;
- (void)setHasEndDateOfLastSessionInSeconds:(BOOL)a3;
- (void)setHasIsComplete:(BOOL)a3;
- (void)setHasNumAbandonedSuggestions:(BOOL)a3;
- (void)setHasNumEngagedSuggestions:(BOOL)a3;
- (void)setHasNumRejectedSuggestions:(BOOL)a3;
- (void)setHasNumSessionsWithAbandonedSuggestions:(BOOL)a3;
- (void)setHasNumSessionsWithEngagedSuggestions:(BOOL)a3;
- (void)setHasNumSessionsWithRejectedSuggestions:(BOOL)a3;
- (void)setHasStartDateOfFirstSessionInSeconds:(BOOL)a3;
- (void)setIsComplete:(BOOL)a3;
- (void)setNumAbandonedSuggestions:(unint64_t)a3;
- (void)setNumEngagedSuggestions:(unint64_t)a3;
- (void)setNumRejectedSuggestions:(unint64_t)a3;
- (void)setNumSessionsWithAbandonedSuggestions:(unint64_t)a3;
- (void)setNumSessionsWithEngagedSuggestions:(unint64_t)a3;
- (void)setNumSessionsWithRejectedSuggestions:(unint64_t)a3;
- (void)setStartDateOfFirstSessionInSeconds:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBProactiveSuggestionGroupedUIFeedbackResult

- (void)setNumSessionsWithEngagedSuggestions:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numSessionsWithEngagedSuggestions = a3;
}

- (void)setHasNumSessionsWithEngagedSuggestions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumSessionsWithEngagedSuggestions
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumSessionsWithRejectedSuggestions:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numSessionsWithRejectedSuggestions = a3;
}

- (void)setHasNumSessionsWithRejectedSuggestions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumSessionsWithRejectedSuggestions
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumSessionsWithAbandonedSuggestions:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numSessionsWithAbandonedSuggestions = a3;
}

- (void)setHasNumSessionsWithAbandonedSuggestions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumSessionsWithAbandonedSuggestions
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumEngagedSuggestions:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numEngagedSuggestions = a3;
}

- (void)setHasNumEngagedSuggestions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumEngagedSuggestions
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumRejectedSuggestions:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numRejectedSuggestions = a3;
}

- (void)setHasNumRejectedSuggestions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumRejectedSuggestions
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumAbandonedSuggestions:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_numAbandonedSuggestions = a3;
}

- (void)setHasNumAbandonedSuggestions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasNumAbandonedSuggestions
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setIsComplete:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isComplete = a3;
}

- (void)setHasIsComplete:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsComplete
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setStartDateOfFirstSessionInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_startDateOfFirstSessionInSeconds = a3;
}

- (void)setHasStartDateOfFirstSessionInSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasStartDateOfFirstSessionInSeconds
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setEndDateOfLastSessionInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_endDateOfLastSessionInSeconds = a3;
}

- (void)setHasEndDateOfLastSessionInSeconds:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasEndDateOfLastSessionInSeconds
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBProactiveSuggestionGroupedUIFeedbackResult;
  v4 = [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)&v8 description];
  v5 = [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_numSessionsWithEngagedSuggestions];
    [v3 setObject:v7 forKey:@"numSessionsWithEngagedSuggestions"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_numSessionsWithRejectedSuggestions];
  [v3 setObject:v8 forKey:@"numSessionsWithRejectedSuggestions"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v9 = [NSNumber numberWithUnsignedLongLong:self->_numSessionsWithAbandonedSuggestions];
  [v3 setObject:v9 forKey:@"numSessionsWithAbandonedSuggestions"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = [NSNumber numberWithUnsignedLongLong:self->_numEngagedSuggestions];
  [v3 setObject:v10 forKey:@"numEngagedSuggestions"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = [NSNumber numberWithUnsignedLongLong:self->_numRejectedSuggestions];
  [v3 setObject:v11 forKey:@"numRejectedSuggestions"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = [NSNumber numberWithUnsignedLongLong:self->_numAbandonedSuggestions];
  [v3 setObject:v12 forKey:@"numAbandonedSuggestions"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = [NSNumber numberWithBool:self->_isComplete];
  [v3 setObject:v13 forKey:@"isComplete"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v14 = [NSNumber numberWithDouble:self->_startDateOfFirstSessionInSeconds];
  [v3 setObject:v14 forKey:@"startDateOfFirstSessionInSeconds"];

  if (*(_WORD *)&self->_has)
  {
LABEL_10:
    v5 = [NSNumber numberWithDouble:self->_endDateOfLastSessionInSeconds];
    [v3 setObject:v5 forKey:@"endDateOfLastSessionInSeconds"];
  }
LABEL_11:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBProactiveSuggestionGroupedUIFeedbackResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  if (*(_WORD *)&self->_has) {
LABEL_10:
  }
    PBDataWriterWriteDoubleField();
LABEL_11:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[6] = self->_numSessionsWithEngagedSuggestions;
    *((_WORD *)v4 + 38) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v4[7] = self->_numSessionsWithRejectedSuggestions;
  *((_WORD *)v4 + 38) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[5] = self->_numSessionsWithAbandonedSuggestions;
  *((_WORD *)v4 + 38) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[3] = self->_numEngagedSuggestions;
  *((_WORD *)v4 + 38) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[4] = self->_numRejectedSuggestions;
  *((_WORD *)v4 + 38) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[2] = self->_numAbandonedSuggestions;
  *((_WORD *)v4 + 38) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)v4 + 72) = self->_isComplete;
  *((_WORD *)v4 + 38) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v4[8] = *(void *)&self->_startDateOfFirstSessionInSeconds;
  *((_WORD *)v4 + 38) |= 0x80u;
  if (*(_WORD *)&self->_has)
  {
LABEL_10:
    v4[1] = *(void *)&self->_endDateOfLastSessionInSeconds;
    *((_WORD *)v4 + 38) |= 1u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((void *)result + 6) = self->_numSessionsWithEngagedSuggestions;
    *((_WORD *)result + 38) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 7) = self->_numSessionsWithRejectedSuggestions;
  *((_WORD *)result + 38) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 5) = self->_numSessionsWithAbandonedSuggestions;
  *((_WORD *)result + 38) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 3) = self->_numEngagedSuggestions;
  *((_WORD *)result + 38) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 4) = self->_numRejectedSuggestions;
  *((_WORD *)result + 38) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 2) = self->_numAbandonedSuggestions;
  *((_WORD *)result + 38) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)result + 72) = self->_isComplete;
  *((_WORD *)result + 38) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((void *)result + 8) = *(void *)&self->_startDateOfFirstSessionInSeconds;
  *((_WORD *)result + 38) |= 0x80u;
  if ((*(_WORD *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_10:
  *((void *)result + 1) = *(void *)&self->_endDateOfLastSessionInSeconds;
  *((_WORD *)result + 38) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_numSessionsWithEngagedSuggestions != *((void *)v4 + 6)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_numSessionsWithRejectedSuggestions != *((void *)v4 + 7)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_numSessionsWithAbandonedSuggestions != *((void *)v4 + 5)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_numEngagedSuggestions != *((void *)v4 + 3)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_numRejectedSuggestions != *((void *)v4 + 4)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_numAbandonedSuggestions != *((void *)v4 + 2)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 38) & 0x100) != 0)
    {
      if (self->_isComplete)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_49;
        }
        goto LABEL_40;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_40;
      }
    }
LABEL_49:
    BOOL v7 = 0;
    goto LABEL_50;
  }
  if ((*((_WORD *)v4 + 38) & 0x100) != 0) {
    goto LABEL_49;
  }
LABEL_40:
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_startDateOfFirstSessionInSeconds != *((double *)v4 + 8)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_49;
  }
  BOOL v7 = (v6 & 1) == 0;
  if (has)
  {
    if ((v6 & 1) == 0 || self->_endDateOfLastSessionInSeconds != *((double *)v4 + 1)) {
      goto LABEL_49;
    }
    BOOL v7 = 1;
  }
LABEL_50:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    unint64_t v21 = 2654435761u * self->_numSessionsWithEngagedSuggestions;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_numSessionsWithRejectedSuggestions;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v21 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_numSessionsWithAbandonedSuggestions;
    if ((has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_numEngagedSuggestions;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_numRejectedSuggestions;
    if ((has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v7 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_numAbandonedSuggestions;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_8;
    }
LABEL_19:
    uint64_t v9 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_20:
    unint64_t v14 = 0;
    goto LABEL_23;
  }
LABEL_18:
  unint64_t v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_19;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_isComplete;
  if ((has & 0x80) == 0) {
    goto LABEL_20;
  }
LABEL_9:
  double startDateOfFirstSessionInSeconds = self->_startDateOfFirstSessionInSeconds;
  double v11 = -startDateOfFirstSessionInSeconds;
  if (startDateOfFirstSessionInSeconds >= 0.0) {
    double v11 = self->_startDateOfFirstSessionInSeconds;
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
LABEL_23:
  if (has)
  {
    double endDateOfLastSessionInSeconds = self->_endDateOfLastSessionInSeconds;
    double v17 = -endDateOfLastSessionInSeconds;
    if (endDateOfLastSessionInSeconds >= 0.0) {
      double v17 = self->_endDateOfLastSessionInSeconds;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  return v4 ^ v21 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x20) != 0)
  {
    self->_numSessionsWithEngagedSuggestions = *((void *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v5 = *((_WORD *)v4 + 38);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_numSessionsWithRejectedSuggestions = *((void *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_numSessionsWithAbandonedSuggestions = *((void *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_numEngagedSuggestions = *((void *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_numRejectedSuggestions = *((void *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_numAbandonedSuggestions = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_isComplete = *((unsigned char *)v4 + 72);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 38);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  self->_double startDateOfFirstSessionInSeconds = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  if (*((_WORD *)v4 + 38))
  {
LABEL_10:
    self->_double endDateOfLastSessionInSeconds = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_11:
}

- (unint64_t)numSessionsWithEngagedSuggestions
{
  return self->_numSessionsWithEngagedSuggestions;
}

- (unint64_t)numSessionsWithRejectedSuggestions
{
  return self->_numSessionsWithRejectedSuggestions;
}

- (unint64_t)numSessionsWithAbandonedSuggestions
{
  return self->_numSessionsWithAbandonedSuggestions;
}

- (unint64_t)numEngagedSuggestions
{
  return self->_numEngagedSuggestions;
}

- (unint64_t)numRejectedSuggestions
{
  return self->_numRejectedSuggestions;
}

- (unint64_t)numAbandonedSuggestions
{
  return self->_numAbandonedSuggestions;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (double)startDateOfFirstSessionInSeconds
{
  return self->_startDateOfFirstSessionInSeconds;
}

- (double)endDateOfLastSessionInSeconds
{
  return self->_endDateOfLastSessionInSeconds;
}

@end