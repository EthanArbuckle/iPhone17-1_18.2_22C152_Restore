@interface SUGSchemaSUGSuggestion
- (BOOL)hasAutoCompleteSuggestionMetaData;
- (BOOL)hasChannel;
- (BOOL)hasChannelScore;
- (BOOL)hasDeliveryVehicle;
- (BOOL)hasFinalRank;
- (BOOL)hasFinalScore;
- (BOOL)hasGoal;
- (BOOL)hasGoalSpecificScore;
- (BOOL)hasLinkId;
- (BOOL)hasLoggingActionId;
- (BOOL)hasNumCharactersInSuggestion;
- (BOOL)hasNumWordsInSuggestion;
- (BOOL)hasSmartSuppressionScore;
- (BOOL)hasSubscribedSignal;
- (BOOL)hasSuggestionId;
- (BOOL)hasSuggestionTier;
- (BOOL)hasSuppressionResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)loggingActionId;
- (NSString)suggestionId;
- (SISchemaUUID)linkId;
- (SUGSchemaSUGAutoCompleteSuggestionMetaData)autoCompleteSuggestionMetaData;
- (SUGSchemaSUGSiriHelpSignal)subscribedSignal;
- (SUGSchemaSUGSuggestion)initWithDictionary:(id)a3;
- (SUGSchemaSUGSuggestion)initWithJSON:(id)a3;
- (SUGSchemaSUGSuppressionResult)suppressionResult;
- (double)channelScore;
- (double)finalScore;
- (double)goalSpecificScore;
- (double)smartSuppressionScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)channel;
- (int)deliveryVehicle;
- (int)goal;
- (int)numCharactersInSuggestion;
- (int)numWordsInSuggestion;
- (int)suggestionTier;
- (unint64_t)hash;
- (unsigned)finalRank;
- (void)deleteAutoCompleteSuggestionMetaData;
- (void)deleteChannel;
- (void)deleteChannelScore;
- (void)deleteDeliveryVehicle;
- (void)deleteFinalRank;
- (void)deleteFinalScore;
- (void)deleteGoal;
- (void)deleteGoalSpecificScore;
- (void)deleteLinkId;
- (void)deleteLoggingActionId;
- (void)deleteNumCharactersInSuggestion;
- (void)deleteNumWordsInSuggestion;
- (void)deleteSmartSuppressionScore;
- (void)deleteSubscribedSignal;
- (void)deleteSuggestionId;
- (void)deleteSuggestionTier;
- (void)deleteSuppressionResult;
- (void)setAutoCompleteSuggestionMetaData:(id)a3;
- (void)setChannel:(int)a3;
- (void)setChannelScore:(double)a3;
- (void)setDeliveryVehicle:(int)a3;
- (void)setFinalRank:(unsigned int)a3;
- (void)setFinalScore:(double)a3;
- (void)setGoal:(int)a3;
- (void)setGoalSpecificScore:(double)a3;
- (void)setHasAutoCompleteSuggestionMetaData:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasChannelScore:(BOOL)a3;
- (void)setHasDeliveryVehicle:(BOOL)a3;
- (void)setHasFinalRank:(BOOL)a3;
- (void)setHasFinalScore:(BOOL)a3;
- (void)setHasGoal:(BOOL)a3;
- (void)setHasGoalSpecificScore:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasLoggingActionId:(BOOL)a3;
- (void)setHasNumCharactersInSuggestion:(BOOL)a3;
- (void)setHasNumWordsInSuggestion:(BOOL)a3;
- (void)setHasSmartSuppressionScore:(BOOL)a3;
- (void)setHasSubscribedSignal:(BOOL)a3;
- (void)setHasSuggestionId:(BOOL)a3;
- (void)setHasSuggestionTier:(BOOL)a3;
- (void)setHasSuppressionResult:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setLoggingActionId:(id)a3;
- (void)setNumCharactersInSuggestion:(int)a3;
- (void)setNumWordsInSuggestion:(int)a3;
- (void)setSmartSuppressionScore:(double)a3;
- (void)setSubscribedSignal:(id)a3;
- (void)setSuggestionId:(id)a3;
- (void)setSuggestionTier:(int)a3;
- (void)setSuppressionResult:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SUGSchemaSUGSuggestion

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUGSchemaSUGSuggestion;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(SUGSchemaSUGSuggestion *)self subscribedSignal];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SUGSchemaSUGSuggestion *)self deleteSubscribedSignal];
  }
  v9 = [(SUGSchemaSUGSuggestion *)self suppressionResult];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SUGSchemaSUGSuggestion *)self deleteSuppressionResult];
  }
  v12 = [(SUGSchemaSUGSuggestion *)self autoCompleteSuggestionMetaData];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SUGSchemaSUGSuggestion *)self deleteAutoCompleteSuggestionMetaData];
  }
  v15 = [(SUGSchemaSUGSuggestion *)self linkId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SUGSchemaSUGSuggestion *)self deleteLinkId];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_autoCompleteSuggestionMetaData, 0);
  objc_storeStrong((id *)&self->_loggingActionId, 0);
  objc_storeStrong((id *)&self->_suppressionResult, 0);
  objc_storeStrong((id *)&self->_subscribedSignal, 0);
  objc_storeStrong((id *)&self->_suggestionId, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLoggingActionId = a3;
}

- (void)setHasAutoCompleteSuggestionMetaData:(BOOL)a3
{
  self->_hasSuppressionResult = a3;
}

- (void)setHasLoggingActionId:(BOOL)a3
{
  self->_hasSubscribedSignal = a3;
}

- (void)setHasSuppressionResult:(BOOL)a3
{
  self->_hasSuggestionId = a3;
}

- (void)setHasSubscribedSignal:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSuggestionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setAutoCompleteSuggestionMetaData:(id)a3
{
}

- (SUGSchemaSUGAutoCompleteSuggestionMetaData)autoCompleteSuggestionMetaData
{
  return self->_autoCompleteSuggestionMetaData;
}

- (int)numCharactersInSuggestion
{
  return self->_numCharactersInSuggestion;
}

- (int)numWordsInSuggestion
{
  return self->_numWordsInSuggestion;
}

- (double)smartSuppressionScore
{
  return self->_smartSuppressionScore;
}

- (double)channelScore
{
  return self->_channelScore;
}

- (int)channel
{
  return self->_channel;
}

- (void)setLoggingActionId:(id)a3
{
}

- (NSString)loggingActionId
{
  return self->_loggingActionId;
}

- (void)setSuppressionResult:(id)a3
{
}

- (SUGSchemaSUGSuppressionResult)suppressionResult
{
  return self->_suppressionResult;
}

- (int)suggestionTier
{
  return self->_suggestionTier;
}

- (double)finalScore
{
  return self->_finalScore;
}

- (double)goalSpecificScore
{
  return self->_goalSpecificScore;
}

- (unsigned)finalRank
{
  return self->_finalRank;
}

- (int)goal
{
  return self->_goal;
}

- (int)deliveryVehicle
{
  return self->_deliveryVehicle;
}

- (void)setSubscribedSignal:(id)a3
{
}

- (SUGSchemaSUGSiriHelpSignal)subscribedSignal
{
  return self->_subscribedSignal;
}

- (void)setSuggestionId:(id)a3
{
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (SUGSchemaSUGSuggestion)initWithDictionary:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SUGSchemaSUGSuggestion;
  v5 = [(SUGSchemaSUGSuggestion *)&v41 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SUGSchemaSUGSuggestion *)v5 setSuggestionId:v7];
    }
    v35 = v6;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"subscribedSignal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SUGSchemaSUGSiriHelpSignal alloc] initWithDictionary:v8];
      [(SUGSchemaSUGSuggestion *)v5 setSubscribedSignal:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"deliveryVehicle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGSuggestion setDeliveryVehicle:](v5, "setDeliveryVehicle:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"goal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGSuggestion setGoal:](v5, "setGoal:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"finalRank"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGSuggestion setFinalRank:](v5, "setFinalRank:", [v12 unsignedIntValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"goalSpecificScore"];
    objc_opt_class();
    v40 = v13;
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      -[SUGSchemaSUGSuggestion setGoalSpecificScore:](v5, "setGoalSpecificScore:");
    }
    int v14 = [v4 objectForKeyedSubscript:@"finalScore"];
    objc_opt_class();
    v39 = v14;
    if (objc_opt_isKindOfClass())
    {
      [v14 doubleValue];
      -[SUGSchemaSUGSuggestion setFinalScore:](v5, "setFinalScore:");
    }
    v15 = [v4 objectForKeyedSubscript:@"suggestionTier"];
    objc_opt_class();
    v38 = v15;
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGSuggestion setSuggestionTier:](v5, "setSuggestionTier:", [v15 intValue]);
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"suppressionResult"];
    objc_opt_class();
    v37 = (void *)v16;
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[SUGSchemaSUGSuppressionResult alloc] initWithDictionary:v16];
      [(SUGSchemaSUGSuggestion *)v5 setSuppressionResult:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"loggingActionId"];
    objc_opt_class();
    v36 = v18;
    if (objc_opt_isKindOfClass())
    {
      objc_super v19 = (void *)[v18 copy];
      [(SUGSchemaSUGSuggestion *)v5 setLoggingActionId:v19];
    }
    v34 = (void *)v8;
    v20 = [v4 objectForKeyedSubscript:@"channel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGSuggestion setChannel:](v5, "setChannel:", [v20 intValue]);
    }
    v33 = v10;
    v21 = [v4 objectForKeyedSubscript:@"channelScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v21 doubleValue];
      -[SUGSchemaSUGSuggestion setChannelScore:](v5, "setChannelScore:");
    }
    v32 = v11;
    v22 = [v4 objectForKeyedSubscript:@"smartSuppressionScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v22 doubleValue];
      -[SUGSchemaSUGSuggestion setSmartSuppressionScore:](v5, "setSmartSuppressionScore:");
    }
    v23 = objc_msgSend(v4, "objectForKeyedSubscript:", @"numWordsInSuggestion", v12);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGSuggestion setNumWordsInSuggestion:](v5, "setNumWordsInSuggestion:", [v23 intValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"numCharactersInSuggestion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGSuggestion setNumCharactersInSuggestion:](v5, "setNumCharactersInSuggestion:", [v24 intValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"autoCompleteSuggestionMetaData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = [[SUGSchemaSUGAutoCompleteSuggestionMetaData alloc] initWithDictionary:v25];
      [(SUGSchemaSUGSuggestion *)v5 setAutoCompleteSuggestionMetaData:v26];
    }
    v27 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[SISchemaUUID alloc] initWithDictionary:v27];
      [(SUGSchemaSUGSuggestion *)v5 setLinkId:v28];
    }
    v29 = v5;
  }
  return v5;
}

- (SUGSchemaSUGSuggestion)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SUGSchemaSUGSuggestion *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SUGSchemaSUGSuggestion *)self dictionaryRepresentation];
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
  if (self->_autoCompleteSuggestionMetaData)
  {
    id v4 = [(SUGSchemaSUGSuggestion *)self autoCompleteSuggestionMetaData];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"autoCompleteSuggestionMetaData"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"autoCompleteSuggestionMetaData"];
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    unsigned int v8 = [(SUGSchemaSUGSuggestion *)self channel] - 1;
    if (v8 > 7) {
      v9 = @"SUGCHANNEL_UNKNOWN";
    }
    else {
      v9 = off_1E5EB95F8[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"channel"];
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    int v14 = NSNumber;
    [(SUGSchemaSUGSuggestion *)self channelScore];
    v15 = objc_msgSend(v14, "numberWithDouble:");
    [v3 setObject:v15 forKeyedSubscript:@"channelScore"];

    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_40;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_13;
  }
  unsigned int v16 = [(SUGSchemaSUGSuggestion *)self deliveryVehicle] - 1;
  if (v16 > 9) {
    int v17 = @"SUGDELIVERYVEHICLE_UNKNOWN";
  }
  else {
    int v17 = off_1E5EB9638[v16];
  }
  [v3 setObject:v17 forKeyedSubscript:@"deliveryVehicle"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SUGSchemaSUGSuggestion finalRank](self, "finalRank"));
  [v3 setObject:v28 forKeyedSubscript:@"finalRank"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  v29 = NSNumber;
  [(SUGSchemaSUGSuggestion *)self finalScore];
  v30 = objc_msgSend(v29, "numberWithDouble:");
  [v3 setObject:v30 forKeyedSubscript:@"finalScore"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_16:
    if ((has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_42:
  unsigned int v31 = [(SUGSchemaSUGSuggestion *)self goal] - 1;
  if (v31 > 2) {
    v32 = @"SUGGOAL_UNKNOWN";
  }
  else {
    v32 = off_1E5EB9688[v31];
  }
  [v3 setObject:v32 forKeyedSubscript:@"goal"];
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_17:
    v10 = NSNumber;
    [(SUGSchemaSUGSuggestion *)self goalSpecificScore];
    int v11 = objc_msgSend(v10, "numberWithDouble:");
    [v3 setObject:v11 forKeyedSubscript:@"goalSpecificScore"];
  }
LABEL_18:
  if (self->_linkId)
  {
    v12 = [(SUGSchemaSUGSuggestion *)self linkId];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_loggingActionId)
  {
    objc_super v19 = [(SUGSchemaSUGSuggestion *)self loggingActionId];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"loggingActionId"];
  }
  __int16 v21 = (__int16)self->_has;
  if ((v21 & 0x400) != 0)
  {
    v26 = objc_msgSend(NSNumber, "numberWithInt:", -[SUGSchemaSUGSuggestion numCharactersInSuggestion](self, "numCharactersInSuggestion"));
    [v3 setObject:v26 forKeyedSubscript:@"numCharactersInSuggestion"];

    __int16 v21 = (__int16)self->_has;
    if ((v21 & 0x200) == 0)
    {
LABEL_30:
      if ((v21 & 0x100) == 0) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_30;
  }
  v27 = objc_msgSend(NSNumber, "numberWithInt:", -[SUGSchemaSUGSuggestion numWordsInSuggestion](self, "numWordsInSuggestion"));
  [v3 setObject:v27 forKeyedSubscript:@"numWordsInSuggestion"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_31:
    v22 = NSNumber;
    [(SUGSchemaSUGSuggestion *)self smartSuppressionScore];
    v23 = objc_msgSend(v22, "numberWithDouble:");
    [v3 setObject:v23 forKeyedSubscript:@"smartSuppressionScore"];
  }
LABEL_32:
  if (self->_subscribedSignal)
  {
    v24 = [(SUGSchemaSUGSuggestion *)self subscribedSignal];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"subscribedSignal"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"subscribedSignal"];
    }
  }
  if (self->_suggestionId)
  {
    v34 = [(SUGSchemaSUGSuggestion *)self suggestionId];
    v35 = (void *)[v34 copy];
    [v3 setObject:v35 forKeyedSubscript:@"suggestionId"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    unsigned int v36 = [(SUGSchemaSUGSuggestion *)self suggestionTier] - 1;
    if (v36 > 2) {
      v37 = @"SUGTIERCATEGORY_UNKNOWN";
    }
    else {
      v37 = off_1E5EB96A0[v36];
    }
    [v3 setObject:v37 forKeyedSubscript:@"suggestionTier"];
  }
  if (self->_suppressionResult)
  {
    v38 = [(SUGSchemaSUGSuggestion *)self suppressionResult];
    v39 = [v38 dictionaryRepresentation];
    if (v39)
    {
      [v3 setObject:v39 forKeyedSubscript:@"suppressionResult"];
    }
    else
    {
      v40 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v40 forKeyedSubscript:@"suppressionResult"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v38 = [(NSString *)self->_suggestionId hash];
  unint64_t v37 = [(SUGSchemaSUGSiriHelpSignal *)self->_subscribedSignal hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v36 = 2654435761 * self->_deliveryVehicle;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v35 = 2654435761 * self->_goal;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v34 = 0;
      if ((has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v36 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v35 = 0;
  if ((has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v34 = 2654435761 * self->_finalRank;
  if ((has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double goalSpecificScore = self->_goalSpecificScore;
  double v5 = -goalSpecificScore;
  if (goalSpecificScore >= 0.0) {
    double v5 = self->_goalSpecificScore;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_15:
  if ((has & 0x10) != 0)
  {
    double finalScore = self->_finalScore;
    double v11 = -finalScore;
    if (finalScore >= 0.0) {
      double v11 = self->_finalScore;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 0x20) != 0) {
    uint64_t v14 = 2654435761 * self->_suggestionTier;
  }
  else {
    uint64_t v14 = 0;
  }
  unint64_t v15 = [(SUGSchemaSUGSuppressionResult *)self->_suppressionResult hash];
  NSUInteger v16 = [(NSString *)self->_loggingActionId hash];
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x40) != 0)
  {
    uint64_t v18 = 2654435761 * self->_channel;
    if ((v17 & 0x80) != 0) {
      goto LABEL_28;
    }
LABEL_33:
    unint64_t v23 = 0;
    goto LABEL_36;
  }
  uint64_t v18 = 0;
  if ((v17 & 0x80) == 0) {
    goto LABEL_33;
  }
LABEL_28:
  double channelScore = self->_channelScore;
  double v20 = -channelScore;
  if (channelScore >= 0.0) {
    double v20 = self->_channelScore;
  }
  long double v21 = floor(v20 + 0.5);
  double v22 = (v20 - v21) * 1.84467441e19;
  unint64_t v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
  if (v22 >= 0.0)
  {
    if (v22 > 0.0) {
      v23 += (unint64_t)v22;
    }
  }
  else
  {
    v23 -= (unint64_t)fabs(v22);
  }
LABEL_36:
  if ((v17 & 0x100) != 0)
  {
    double smartSuppressionScore = self->_smartSuppressionScore;
    double v26 = -smartSuppressionScore;
    if (smartSuppressionScore >= 0.0) {
      double v26 = self->_smartSuppressionScore;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((v17 & 0x200) != 0)
  {
    uint64_t v29 = 2654435761 * self->_numWordsInSuggestion;
    if ((v17 & 0x400) != 0) {
      goto LABEL_46;
    }
LABEL_48:
    uint64_t v30 = 0;
    goto LABEL_49;
  }
  uint64_t v29 = 0;
  if ((v17 & 0x400) == 0) {
    goto LABEL_48;
  }
LABEL_46:
  uint64_t v30 = 2654435761 * self->_numCharactersInSuggestion;
LABEL_49:
  unint64_t v31 = v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v18 ^ v23;
  unint64_t v32 = v24 ^ v29 ^ v30 ^ [(SUGSchemaSUGAutoCompleteSuggestionMetaData *)self->_autoCompleteSuggestionMetaData hash];
  return v31 ^ v32 ^ [(SISchemaUUID *)self->_linkId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_74;
  }
  double v5 = [(SUGSchemaSUGSuggestion *)self suggestionId];
  long double v6 = [v4 suggestionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_73;
  }
  uint64_t v7 = [(SUGSchemaSUGSuggestion *)self suggestionId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(SUGSchemaSUGSuggestion *)self suggestionId];
    v10 = [v4 suggestionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_74;
    }
  }
  else
  {
  }
  double v5 = [(SUGSchemaSUGSuggestion *)self subscribedSignal];
  long double v6 = [v4 subscribedSignal];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_73;
  }
  uint64_t v12 = [(SUGSchemaSUGSuggestion *)self subscribedSignal];
  if (v12)
  {
    double v13 = (void *)v12;
    uint64_t v14 = [(SUGSchemaSUGSuggestion *)self subscribedSignal];
    unint64_t v15 = [v4 subscribedSignal];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_74;
    }
  }
  else
  {
  }
  $E9F9289BA528CEB819F3239A3C07F8DC has = self->_has;
  unsigned int v18 = v4[64];
  if ((*(unsigned char *)&has & 1) != (v18 & 1)) {
    goto LABEL_74;
  }
  if (*(unsigned char *)&has)
  {
    int deliveryVehicle = self->_deliveryVehicle;
    if (deliveryVehicle != [v4 deliveryVehicle]) {
      goto LABEL_74;
    }
    $E9F9289BA528CEB819F3239A3C07F8DC has = self->_has;
    unsigned int v18 = v4[64];
  }
  int v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1)) {
    goto LABEL_74;
  }
  if (v20)
  {
    int goal = self->_goal;
    if (goal != [v4 goal]) {
      goto LABEL_74;
    }
    $E9F9289BA528CEB819F3239A3C07F8DC has = self->_has;
    unsigned int v18 = v4[64];
  }
  int v22 = (*(unsigned int *)&has >> 2) & 1;
  if (v22 != ((v18 >> 2) & 1)) {
    goto LABEL_74;
  }
  if (v22)
  {
    unsigned int finalRank = self->_finalRank;
    if (finalRank != [v4 finalRank]) {
      goto LABEL_74;
    }
    $E9F9289BA528CEB819F3239A3C07F8DC has = self->_has;
    unsigned int v18 = v4[64];
  }
  int v24 = (*(unsigned int *)&has >> 3) & 1;
  if (v24 != ((v18 >> 3) & 1)) {
    goto LABEL_74;
  }
  if (v24)
  {
    double goalSpecificScore = self->_goalSpecificScore;
    [v4 goalSpecificScore];
    if (goalSpecificScore != v26) {
      goto LABEL_74;
    }
    $E9F9289BA528CEB819F3239A3C07F8DC has = self->_has;
    unsigned int v18 = v4[64];
  }
  int v27 = (*(unsigned int *)&has >> 4) & 1;
  if (v27 != ((v18 >> 4) & 1)) {
    goto LABEL_74;
  }
  if (v27)
  {
    double finalScore = self->_finalScore;
    [v4 finalScore];
    if (finalScore != v29) {
      goto LABEL_74;
    }
    $E9F9289BA528CEB819F3239A3C07F8DC has = self->_has;
    unsigned int v18 = v4[64];
  }
  int v30 = (*(unsigned int *)&has >> 5) & 1;
  if (v30 != ((v18 >> 5) & 1)) {
    goto LABEL_74;
  }
  if (v30)
  {
    int suggestionTier = self->_suggestionTier;
    if (suggestionTier != [v4 suggestionTier]) {
      goto LABEL_74;
    }
  }
  double v5 = [(SUGSchemaSUGSuggestion *)self suppressionResult];
  long double v6 = [v4 suppressionResult];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_73;
  }
  uint64_t v32 = [(SUGSchemaSUGSuggestion *)self suppressionResult];
  if (v32)
  {
    v33 = (void *)v32;
    uint64_t v34 = [(SUGSchemaSUGSuggestion *)self suppressionResult];
    uint64_t v35 = [v4 suppressionResult];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_74;
    }
  }
  else
  {
  }
  double v5 = [(SUGSchemaSUGSuggestion *)self loggingActionId];
  long double v6 = [v4 loggingActionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_73;
  }
  uint64_t v37 = [(SUGSchemaSUGSuggestion *)self loggingActionId];
  if (v37)
  {
    NSUInteger v38 = (void *)v37;
    v39 = [(SUGSchemaSUGSuggestion *)self loggingActionId];
    v40 = [v4 loggingActionId];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_74;
    }
  }
  else
  {
  }
  $E9F9289BA528CEB819F3239A3C07F8DC v42 = self->_has;
  int v43 = (*(unsigned int *)&v42 >> 6) & 1;
  unsigned int v44 = v4[64];
  if (v43 != ((v44 >> 6) & 1)) {
    goto LABEL_74;
  }
  if (v43)
  {
    int channel = self->_channel;
    if (channel != [v4 channel]) {
      goto LABEL_74;
    }
    $E9F9289BA528CEB819F3239A3C07F8DC v42 = self->_has;
    unsigned int v44 = v4[64];
  }
  int v46 = (*(unsigned int *)&v42 >> 7) & 1;
  if (v46 != ((v44 >> 7) & 1)) {
    goto LABEL_74;
  }
  if (v46)
  {
    double channelScore = self->_channelScore;
    [v4 channelScore];
    if (channelScore != v48) {
      goto LABEL_74;
    }
    $E9F9289BA528CEB819F3239A3C07F8DC v42 = self->_has;
    unsigned int v44 = v4[64];
  }
  int v49 = (*(unsigned int *)&v42 >> 8) & 1;
  if (v49 != ((v44 >> 8) & 1)) {
    goto LABEL_74;
  }
  if (v49)
  {
    double smartSuppressionScore = self->_smartSuppressionScore;
    [v4 smartSuppressionScore];
    if (smartSuppressionScore != v51) {
      goto LABEL_74;
    }
    $E9F9289BA528CEB819F3239A3C07F8DC v42 = self->_has;
    unsigned int v44 = v4[64];
  }
  int v52 = (*(unsigned int *)&v42 >> 9) & 1;
  if (v52 != ((v44 >> 9) & 1)) {
    goto LABEL_74;
  }
  if (v52)
  {
    int numWordsInSuggestion = self->_numWordsInSuggestion;
    if (numWordsInSuggestion != [v4 numWordsInSuggestion]) {
      goto LABEL_74;
    }
    $E9F9289BA528CEB819F3239A3C07F8DC v42 = self->_has;
    unsigned int v44 = v4[64];
  }
  int v54 = (*(unsigned int *)&v42 >> 10) & 1;
  if (v54 != ((v44 >> 10) & 1)) {
    goto LABEL_74;
  }
  if (v54)
  {
    int numCharactersInSuggestion = self->_numCharactersInSuggestion;
    if (numCharactersInSuggestion != [v4 numCharactersInSuggestion]) {
      goto LABEL_74;
    }
  }
  double v5 = [(SUGSchemaSUGSuggestion *)self autoCompleteSuggestionMetaData];
  long double v6 = [v4 autoCompleteSuggestionMetaData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_73;
  }
  uint64_t v56 = [(SUGSchemaSUGSuggestion *)self autoCompleteSuggestionMetaData];
  if (v56)
  {
    v57 = (void *)v56;
    v58 = [(SUGSchemaSUGSuggestion *)self autoCompleteSuggestionMetaData];
    v59 = [v4 autoCompleteSuggestionMetaData];
    int v60 = [v58 isEqual:v59];

    if (!v60) {
      goto LABEL_74;
    }
  }
  else
  {
  }
  double v5 = [(SUGSchemaSUGSuggestion *)self linkId];
  long double v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_73:

    goto LABEL_74;
  }
  uint64_t v61 = [(SUGSchemaSUGSuggestion *)self linkId];
  if (!v61)
  {

LABEL_77:
    BOOL v66 = 1;
    goto LABEL_75;
  }
  v62 = (void *)v61;
  v63 = [(SUGSchemaSUGSuggestion *)self linkId];
  v64 = [v4 linkId];
  char v65 = [v63 isEqual:v64];

  if (v65) {
    goto LABEL_77;
  }
LABEL_74:
  BOOL v66 = 0;
LABEL_75:

  return v66;
}

- (void)writeTo:(id)a3
{
  id v17 = a3;
  id v4 = [(SUGSchemaSUGSuggestion *)self suggestionId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  double v5 = [(SUGSchemaSUGSuggestion *)self subscribedSignal];

  if (v5)
  {
    long double v6 = [(SUGSchemaSUGSuggestion *)self subscribedSignal];
    PBDataWriterWriteSubmessage();
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_31;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
  unint64_t v8 = [(SUGSchemaSUGSuggestion *)self suppressionResult];

  if (v8)
  {
    unint64_t v9 = [(SUGSchemaSUGSuggestion *)self suppressionResult];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(SUGSchemaSUGSuggestion *)self loggingActionId];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x80) == 0)
    {
LABEL_18:
      if ((v11 & 0x100) == 0) {
        goto LABEL_19;
      }
      goto LABEL_37;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteDoubleField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x100) == 0)
  {
LABEL_19:
    if ((v11 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteDoubleField();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x200) == 0)
  {
LABEL_20:
    if ((v11 & 0x400) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_21:
  }
    PBDataWriterWriteInt32Field();
LABEL_22:
  uint64_t v12 = [(SUGSchemaSUGSuggestion *)self autoCompleteSuggestionMetaData];

  if (v12)
  {
    double v13 = [(SUGSchemaSUGSuggestion *)self autoCompleteSuggestionMetaData];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v14 = [(SUGSchemaSUGSuggestion *)self linkId];

  unint64_t v15 = v17;
  if (v14)
  {
    int v16 = [(SUGSchemaSUGSuggestion *)self linkId];
    PBDataWriterWriteSubmessage();

    unint64_t v15 = v17;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGSuggestionReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteAutoCompleteSuggestionMetaData
{
}

- (BOOL)hasAutoCompleteSuggestionMetaData
{
  return self->_autoCompleteSuggestionMetaData != 0;
}

- (void)deleteNumCharactersInSuggestion
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasNumCharactersInSuggestion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasNumCharactersInSuggestion
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setNumCharactersInSuggestion:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int numCharactersInSuggestion = a3;
}

- (void)deleteNumWordsInSuggestion
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasNumWordsInSuggestion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasNumWordsInSuggestion
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumWordsInSuggestion:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int numWordsInSuggestion = a3;
}

- (void)deleteSmartSuppressionScore
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasSmartSuppressionScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSmartSuppressionScore
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSmartSuppressionScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_double smartSuppressionScore = a3;
}

- (void)deleteChannelScore
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasChannelScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasChannelScore
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setChannelScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_double channelScore = a3;
}

- (void)deleteChannel
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasChannel
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setChannel:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int channel = a3;
}

- (void)deleteLoggingActionId
{
}

- (BOOL)hasLoggingActionId
{
  return self->_loggingActionId != 0;
}

- (void)deleteSuppressionResult
{
}

- (BOOL)hasSuppressionResult
{
  return self->_suppressionResult != 0;
}

- (void)deleteSuggestionTier
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasSuggestionTier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSuggestionTier
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSuggestionTier:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int suggestionTier = a3;
}

- (void)deleteFinalScore
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasFinalScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFinalScore
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setFinalScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_double finalScore = a3;
}

- (void)deleteGoalSpecificScore
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasGoalSpecificScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGoalSpecificScore
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setGoalSpecificScore:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_double goalSpecificScore = a3;
}

- (void)deleteFinalRank
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasFinalRank:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFinalRank
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setFinalRank:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unsigned int finalRank = a3;
}

- (void)deleteGoal
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasGoal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasGoal
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setGoal:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int goal = a3;
}

- (void)deleteDeliveryVehicle
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasDeliveryVehicle:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDeliveryVehicle
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDeliveryVehicle:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int deliveryVehicle = a3;
}

- (void)deleteSubscribedSignal
{
}

- (BOOL)hasSubscribedSignal
{
  return self->_subscribedSignal != 0;
}

- (void)deleteSuggestionId
{
}

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

@end