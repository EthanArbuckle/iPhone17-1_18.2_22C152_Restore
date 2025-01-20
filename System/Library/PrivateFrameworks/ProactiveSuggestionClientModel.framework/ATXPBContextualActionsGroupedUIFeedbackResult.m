@interface ATXPBContextualActionsGroupedUIFeedbackResult
- (ATXPBProactiveSuggestionGroupedUIFeedbackResult)groupedUIFeedbackResults;
- (BOOL)hasGroupedUIFeedbackResults;
- (BOOL)hasNumManuallyAddedSteps;
- (BOOL)hasNumShortcutsAtEnd;
- (BOOL)hasNumShortcutsAtStart;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)numManuallyAddedSteps;
- (unint64_t)numShortcutsAtEnd;
- (unint64_t)numShortcutsAtStart;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGroupedUIFeedbackResults:(id)a3;
- (void)setHasNumManuallyAddedSteps:(BOOL)a3;
- (void)setHasNumShortcutsAtEnd:(BOOL)a3;
- (void)setHasNumShortcutsAtStart:(BOOL)a3;
- (void)setNumManuallyAddedSteps:(unint64_t)a3;
- (void)setNumShortcutsAtEnd:(unint64_t)a3;
- (void)setNumShortcutsAtStart:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBContextualActionsGroupedUIFeedbackResult

- (BOOL)hasGroupedUIFeedbackResults
{
  return self->_groupedUIFeedbackResults != 0;
}

- (void)setNumShortcutsAtStart:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numShortcutsAtStart = a3;
}

- (void)setHasNumShortcutsAtStart:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumShortcutsAtStart
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumShortcutsAtEnd:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numShortcutsAtEnd = a3;
}

- (void)setHasNumShortcutsAtEnd:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumShortcutsAtEnd
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumManuallyAddedSteps:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numManuallyAddedSteps = a3;
}

- (void)setHasNumManuallyAddedSteps:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumManuallyAddedSteps
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBContextualActionsGroupedUIFeedbackResult;
  v4 = [(ATXPBContextualActionsGroupedUIFeedbackResult *)&v8 description];
  v5 = [(ATXPBContextualActionsGroupedUIFeedbackResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  groupedUIFeedbackResults = self->_groupedUIFeedbackResults;
  if (groupedUIFeedbackResults)
  {
    v5 = [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)groupedUIFeedbackResults dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"groupedUIFeedbackResults"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:self->_numShortcutsAtStart];
    [v3 setObject:v9 forKey:@"numShortcutsAtStart"];

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
  v10 = [NSNumber numberWithUnsignedLongLong:self->_numShortcutsAtEnd];
  [v3 setObject:v10 forKey:@"numShortcutsAtEnd"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    v7 = [NSNumber numberWithUnsignedLongLong:self->_numManuallyAddedSteps];
    [v3 setObject:v7 forKey:@"numManuallyAddedSteps"];
  }
LABEL_7:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBContextualActionsGroupedUIFeedbackResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_groupedUIFeedbackResults)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
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
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_groupedUIFeedbackResults)
  {
    id v6 = v4;
    objc_msgSend(v4, "setGroupedUIFeedbackResults:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_numShortcutsAtStart;
    *((unsigned char *)v4 + 40) |= 4u;
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
  *((void *)v4 + 2) = self->_numShortcutsAtEnd;
  *((unsigned char *)v4 + 40) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    *((void *)v4 + 1) = self->_numManuallyAddedSteps;
    *((unsigned char *)v4 + 40) |= 1u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_groupedUIFeedbackResults copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 16) = self->_numShortcutsAtEnd;
    *(unsigned char *)(v5 + 40) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 24) = self->_numShortcutsAtStart;
  *(unsigned char *)(v5 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_numManuallyAddedSteps;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  groupedUIFeedbackResults = self->_groupedUIFeedbackResults;
  if ((unint64_t)groupedUIFeedbackResults | *((void *)v4 + 4))
  {
    if (!-[ATXPBProactiveSuggestionGroupedUIFeedbackResult isEqual:](groupedUIFeedbackResults, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_numShortcutsAtStart != *((void *)v4 + 3)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_numShortcutsAtEnd != *((void *)v4 + 2)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_numManuallyAddedSteps != *((void *)v4 + 1)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ATXPBProactiveSuggestionGroupedUIFeedbackResult *)self->_groupedUIFeedbackResults hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  unint64_t v4 = 2654435761u * self->_numShortcutsAtStart;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_numShortcutsAtEnd;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v6 = 2654435761u * self->_numManuallyAddedSteps;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  groupedUIFeedbackResults = self->_groupedUIFeedbackResults;
  uint64_t v6 = v4[4];
  if (groupedUIFeedbackResults)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_super v8 = v4;
    groupedUIFeedbackResults = (ATXPBProactiveSuggestionGroupedUIFeedbackResult *)-[ATXPBProactiveSuggestionGroupedUIFeedbackResult mergeFrom:](groupedUIFeedbackResults, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_super v8 = v4;
    groupedUIFeedbackResults = (ATXPBProactiveSuggestionGroupedUIFeedbackResult *)-[ATXPBContextualActionsGroupedUIFeedbackResult setGroupedUIFeedbackResults:](self, "setGroupedUIFeedbackResults:");
  }
  unint64_t v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 40);
  if ((v7 & 4) != 0)
  {
    self->_numShortcutsAtStart = v4[3];
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v4 + 40);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((v4[5] & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_numShortcutsAtEnd = v4[2];
  *(unsigned char *)&self->_has |= 2u;
  if (v4[5])
  {
LABEL_10:
    self->_numManuallyAddedSteps = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_11:
  MEMORY[0x1F41817F8](groupedUIFeedbackResults, v4);
}

- (ATXPBProactiveSuggestionGroupedUIFeedbackResult)groupedUIFeedbackResults
{
  return self->_groupedUIFeedbackResults;
}

- (void)setGroupedUIFeedbackResults:(id)a3
{
}

- (unint64_t)numShortcutsAtStart
{
  return self->_numShortcutsAtStart;
}

- (unint64_t)numShortcutsAtEnd
{
  return self->_numShortcutsAtEnd;
}

- (unint64_t)numManuallyAddedSteps
{
  return self->_numManuallyAddedSteps;
}

- (void).cxx_destruct
{
}

@end