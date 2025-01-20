@interface PLUSSchemaPLUSContactSuggestionUsageSummary
- (BOOL)hasAbandonmentCount;
- (BOOL)hasActivationCount;
- (BOOL)hasAverageTimeBetweenActivationsInMs;
- (BOOL)hasConfirmationSelectedCount;
- (BOOL)hasDisambiguationSelectedCount;
- (BOOL)hasDomain;
- (BOOL)hasPresentationCount;
- (BOOL)hasSuggestionGenerationTimeSince1970InMs;
- (BOOL)hasTimeUntilFirstActivationInMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSContactSuggestionUsageSummary)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSContactSuggestionUsageSummary)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)domain;
- (unint64_t)averageTimeBetweenActivationsInMs;
- (unint64_t)hash;
- (unint64_t)suggestionGenerationTimeSince1970InMs;
- (unint64_t)timeUntilFirstActivationInMs;
- (unsigned)abandonmentCount;
- (unsigned)activationCount;
- (unsigned)confirmationSelectedCount;
- (unsigned)disambiguationSelectedCount;
- (unsigned)presentationCount;
- (void)deleteAbandonmentCount;
- (void)deleteActivationCount;
- (void)deleteAverageTimeBetweenActivationsInMs;
- (void)deleteConfirmationSelectedCount;
- (void)deleteDisambiguationSelectedCount;
- (void)deleteDomain;
- (void)deletePresentationCount;
- (void)deleteSuggestionGenerationTimeSince1970InMs;
- (void)deleteTimeUntilFirstActivationInMs;
- (void)setAbandonmentCount:(unsigned int)a3;
- (void)setActivationCount:(unsigned int)a3;
- (void)setAverageTimeBetweenActivationsInMs:(unint64_t)a3;
- (void)setConfirmationSelectedCount:(unsigned int)a3;
- (void)setDisambiguationSelectedCount:(unsigned int)a3;
- (void)setDomain:(int)a3;
- (void)setHasAbandonmentCount:(BOOL)a3;
- (void)setHasActivationCount:(BOOL)a3;
- (void)setHasAverageTimeBetweenActivationsInMs:(BOOL)a3;
- (void)setHasConfirmationSelectedCount:(BOOL)a3;
- (void)setHasDisambiguationSelectedCount:(BOOL)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)setHasPresentationCount:(BOOL)a3;
- (void)setHasSuggestionGenerationTimeSince1970InMs:(BOOL)a3;
- (void)setHasTimeUntilFirstActivationInMs:(BOOL)a3;
- (void)setPresentationCount:(unsigned int)a3;
- (void)setSuggestionGenerationTimeSince1970InMs:(unint64_t)a3;
- (void)setTimeUntilFirstActivationInMs:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSContactSuggestionUsageSummary

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)domain
{
  return self->_domain;
}

- (unsigned)abandonmentCount
{
  return self->_abandonmentCount;
}

- (unsigned)disambiguationSelectedCount
{
  return self->_disambiguationSelectedCount;
}

- (unsigned)confirmationSelectedCount
{
  return self->_confirmationSelectedCount;
}

- (unsigned)presentationCount
{
  return self->_presentationCount;
}

- (unsigned)activationCount
{
  return self->_activationCount;
}

- (unint64_t)averageTimeBetweenActivationsInMs
{
  return self->_averageTimeBetweenActivationsInMs;
}

- (unint64_t)timeUntilFirstActivationInMs
{
  return self->_timeUntilFirstActivationInMs;
}

- (unint64_t)suggestionGenerationTimeSince1970InMs
{
  return self->_suggestionGenerationTimeSince1970InMs;
}

- (PLUSSchemaPLUSContactSuggestionUsageSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PLUSSchemaPLUSContactSuggestionUsageSummary;
  v5 = [(PLUSSchemaPLUSContactSuggestionUsageSummary *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionGenerationTimeSince1970InMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setSuggestionGenerationTimeSince1970InMs:](v5, "setSuggestionGenerationTimeSince1970InMs:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"timeUntilFirstActivationInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setTimeUntilFirstActivationInMs:](v5, "setTimeUntilFirstActivationInMs:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"averageTimeBetweenActivationsInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setAverageTimeBetweenActivationsInMs:](v5, "setAverageTimeBetweenActivationsInMs:", [v8 unsignedLongLongValue]);
    }
    v9 = objc_msgSend(v4, "objectForKeyedSubscript:", @"activationCount", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setActivationCount:](v5, "setActivationCount:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"presentationCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setPresentationCount:](v5, "setPresentationCount:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"confirmationSelectedCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setConfirmationSelectedCount:](v5, "setConfirmationSelectedCount:", [v11 unsignedIntValue]);
    }
    v19 = v7;
    v12 = [v4 objectForKeyedSubscript:@"disambiguationSelectedCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setDisambiguationSelectedCount:](v5, "setDisambiguationSelectedCount:", [v12 unsignedIntValue]);
    }
    v13 = v6;
    v14 = [v4 objectForKeyedSubscript:@"abandonmentCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setAbandonmentCount:](v5, "setAbandonmentCount:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"domain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSContactSuggestionUsageSummary setDomain:](v5, "setDomain:", [v15 intValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSContactSuggestionUsageSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSContactSuggestionUsageSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSContactSuggestionUsageSummary *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSContactSuggestionUsageSummary abandonmentCount](self, "abandonmentCount"));
    [v3 setObject:v7 forKeyedSubscript:@"abandonmentCount"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSContactSuggestionUsageSummary activationCount](self, "activationCount"));
  [v3 setObject:v8 forKeyedSubscript:@"activationCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLUSSchemaPLUSContactSuggestionUsageSummary averageTimeBetweenActivationsInMs](self, "averageTimeBetweenActivationsInMs"));
  [v3 setObject:v9 forKeyedSubscript:@"averageTimeBetweenActivationsInMs"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSContactSuggestionUsageSummary confirmationSelectedCount](self, "confirmationSelectedCount"));
  [v3 setObject:v10 forKeyedSubscript:@"confirmationSelectedCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSContactSuggestionUsageSummary disambiguationSelectedCount](self, "disambiguationSelectedCount"));
  [v3 setObject:v11 forKeyedSubscript:@"disambiguationSelectedCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_19:
  unsigned int v12 = [(PLUSSchemaPLUSContactSuggestionUsageSummary *)self domain] - 1;
  if (v12 > 3) {
    v13 = @"PLUSINFERENCECONTACTDOMAIN_UNKNOWN";
  }
  else {
    v13 = off_1E5EB9DB8[v12];
  }
  [v3 setObject:v13 forKeyedSubscript:@"domain"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLUSSchemaPLUSContactSuggestionUsageSummary presentationCount](self, "presentationCount"));
  [v3 setObject:v14 forKeyedSubscript:@"presentationCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_24:
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLUSSchemaPLUSContactSuggestionUsageSummary suggestionGenerationTimeSince1970InMs](self, "suggestionGenerationTimeSince1970InMs"));
  [v3 setObject:v15 forKeyedSubscript:@"suggestionGenerationTimeSince1970InMs"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_10:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLUSSchemaPLUSContactSuggestionUsageSummary timeUntilFirstActivationInMs](self, "timeUntilFirstActivationInMs"));
    [v3 setObject:v5 forKeyedSubscript:@"timeUntilFirstActivationInMs"];
  }
LABEL_11:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_suggestionGenerationTimeSince1970InMs;
    if ((has & 2) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_timeUntilFirstActivationInMs;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_averageTimeBetweenActivationsInMs;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_activationCount;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_presentationCount;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_confirmationSelectedCount;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_disambiguationSelectedCount;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v10 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_abandonmentCount;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_domain;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  $5ADA42BDFC6FEBF971321BB42B88A1BB has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_38;
  }
  if (*(unsigned char *)&has)
  {
    unint64_t suggestionGenerationTimeSince1970InMs = self->_suggestionGenerationTimeSince1970InMs;
    if (suggestionGenerationTimeSince1970InMs != [v4 suggestionGenerationTimeSince1970InMs]) {
      goto LABEL_38;
    }
    $5ADA42BDFC6FEBF971321BB42B88A1BB has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_38;
  }
  if (v8)
  {
    unint64_t timeUntilFirstActivationInMs = self->_timeUntilFirstActivationInMs;
    if (timeUntilFirstActivationInMs != [v4 timeUntilFirstActivationInMs]) {
      goto LABEL_38;
    }
    $5ADA42BDFC6FEBF971321BB42B88A1BB has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_38;
  }
  if (v10)
  {
    unint64_t averageTimeBetweenActivationsInMs = self->_averageTimeBetweenActivationsInMs;
    if (averageTimeBetweenActivationsInMs != [v4 averageTimeBetweenActivationsInMs]) {
      goto LABEL_38;
    }
    $5ADA42BDFC6FEBF971321BB42B88A1BB has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_38;
  }
  if (v12)
  {
    unsigned int activationCount = self->_activationCount;
    if (activationCount != [v4 activationCount]) {
      goto LABEL_38;
    }
    $5ADA42BDFC6FEBF971321BB42B88A1BB has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_38;
  }
  if (v14)
  {
    unsigned int presentationCount = self->_presentationCount;
    if (presentationCount != [v4 presentationCount]) {
      goto LABEL_38;
    }
    $5ADA42BDFC6FEBF971321BB42B88A1BB has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_38;
  }
  if (v16)
  {
    unsigned int confirmationSelectedCount = self->_confirmationSelectedCount;
    if (confirmationSelectedCount != [v4 confirmationSelectedCount]) {
      goto LABEL_38;
    }
    $5ADA42BDFC6FEBF971321BB42B88A1BB has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_38;
  }
  if (v18)
  {
    unsigned int disambiguationSelectedCount = self->_disambiguationSelectedCount;
    if (disambiguationSelectedCount != [v4 disambiguationSelectedCount]) {
      goto LABEL_38;
    }
    $5ADA42BDFC6FEBF971321BB42B88A1BB has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_38;
  }
  if (v20)
  {
    unsigned int abandonmentCount = self->_abandonmentCount;
    if (abandonmentCount == [v4 abandonmentCount])
    {
      $5ADA42BDFC6FEBF971321BB42B88A1BB has = self->_has;
      unsigned int v6 = v4[28];
      goto LABEL_34;
    }
LABEL_38:
    BOOL v24 = 0;
    goto LABEL_39;
  }
LABEL_34:
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_38;
  }
  if (v22)
  {
    int domain = self->_domain;
    if (domain != [v4 domain]) {
      goto LABEL_38;
    }
  }
  BOOL v24 = 1;
LABEL_39:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    PBDataWriterWriteInt32Field();
LABEL_11:
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactSuggestionUsageSummaryReadFrom(self, (uint64_t)a3);
}

- (void)deleteDomain
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasDomain:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasDomain
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setDomain:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int domain = a3;
}

- (void)deleteAbandonmentCount
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasAbandonmentCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasAbandonmentCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAbandonmentCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unsigned int abandonmentCount = a3;
}

- (void)deleteDisambiguationSelectedCount
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasDisambiguationSelectedCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDisambiguationSelectedCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDisambiguationSelectedCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unsigned int disambiguationSelectedCount = a3;
}

- (void)deleteConfirmationSelectedCount
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasConfirmationSelectedCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasConfirmationSelectedCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setConfirmationSelectedCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unsigned int confirmationSelectedCount = a3;
}

- (void)deletePresentationCount
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasPresentationCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPresentationCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPresentationCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int presentationCount = a3;
}

- (void)deleteActivationCount
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasActivationCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasActivationCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setActivationCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unsigned int activationCount = a3;
}

- (void)deleteAverageTimeBetweenActivationsInMs
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasAverageTimeBetweenActivationsInMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAverageTimeBetweenActivationsInMs
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAverageTimeBetweenActivationsInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unint64_t averageTimeBetweenActivationsInMs = a3;
}

- (void)deleteTimeUntilFirstActivationInMs
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasTimeUntilFirstActivationInMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTimeUntilFirstActivationInMs
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTimeUntilFirstActivationInMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unint64_t timeUntilFirstActivationInMs = a3;
}

- (void)deleteSuggestionGenerationTimeSince1970InMs
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasSuggestionGenerationTimeSince1970InMs:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasSuggestionGenerationTimeSince1970InMs
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSuggestionGenerationTimeSince1970InMs:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unint64_t suggestionGenerationTimeSince1970InMs = a3;
}

@end