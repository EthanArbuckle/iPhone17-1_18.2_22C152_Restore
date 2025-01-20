@interface SUGSchemaSUGInteraction
- (BOOL)hasHasOccurredWithinHour;
- (BOOL)hasOccurredWithinHour;
- (BOOL)hasRelatedSuggestionEventSequenceNum;
- (BOOL)hasRelatedSuggestionId;
- (BOOL)hasRelatedSuggestionsShownCount;
- (BOOL)hasTriggerType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)relatedSuggestionId;
- (SUGSchemaSUGInteraction)initWithDictionary:(id)a3;
- (SUGSchemaSUGInteraction)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)triggerType;
- (unint64_t)hash;
- (unsigned)relatedSuggestionEventSequenceNum;
- (unsigned)relatedSuggestionsShownCount;
- (void)deleteHasOccurredWithinHour;
- (void)deleteRelatedSuggestionEventSequenceNum;
- (void)deleteRelatedSuggestionId;
- (void)deleteRelatedSuggestionsShownCount;
- (void)deleteTriggerType;
- (void)setHasHasOccurredWithinHour:(BOOL)a3;
- (void)setHasOccurredWithinHour:(BOOL)a3;
- (void)setHasRelatedSuggestionEventSequenceNum:(BOOL)a3;
- (void)setHasRelatedSuggestionId:(BOOL)a3;
- (void)setHasRelatedSuggestionsShownCount:(BOOL)a3;
- (void)setHasTriggerType:(BOOL)a3;
- (void)setRelatedSuggestionEventSequenceNum:(unsigned int)a3;
- (void)setRelatedSuggestionId:(id)a3;
- (void)setRelatedSuggestionsShownCount:(unsigned int)a3;
- (void)setTriggerType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SUGSchemaSUGInteraction

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasRelatedSuggestionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)triggerType
{
  return self->_triggerType;
}

- (BOOL)hasOccurredWithinHour
{
  return self->_hasOccurredWithinHour;
}

- (unsigned)relatedSuggestionsShownCount
{
  return self->_relatedSuggestionsShownCount;
}

- (unsigned)relatedSuggestionEventSequenceNum
{
  return self->_relatedSuggestionEventSequenceNum;
}

- (void)setRelatedSuggestionId:(id)a3
{
}

- (NSString)relatedSuggestionId
{
  return self->_relatedSuggestionId;
}

- (SUGSchemaSUGInteraction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUGSchemaSUGInteraction;
  v5 = [(SUGSchemaSUGInteraction *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"relatedSuggestionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SUGSchemaSUGInteraction *)v5 setRelatedSuggestionId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"relatedSuggestionEventSequenceNum"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGInteraction setRelatedSuggestionEventSequenceNum:](v5, "setRelatedSuggestionEventSequenceNum:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"relatedSuggestionsShownCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGInteraction setRelatedSuggestionsShownCount:](v5, "setRelatedSuggestionsShownCount:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"hasOccurredWithinHour"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGInteraction setHasOccurredWithinHour:](v5, "setHasOccurredWithinHour:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"triggerType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGInteraction setTriggerType:](v5, "setTriggerType:", [v11 intValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (SUGSchemaSUGInteraction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SUGSchemaSUGInteraction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SUGSchemaSUGInteraction *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SUGSchemaSUGInteraction hasOccurredWithinHour](self, "hasOccurredWithinHour"));
    [v3 setObject:v5 forKeyedSubscript:@"hasOccurredWithinHour"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SUGSchemaSUGInteraction relatedSuggestionEventSequenceNum](self, "relatedSuggestionEventSequenceNum"));
    [v3 setObject:v6 forKeyedSubscript:@"relatedSuggestionEventSequenceNum"];
  }
  if (self->_relatedSuggestionId)
  {
    uint64_t v7 = [(SUGSchemaSUGInteraction *)self relatedSuggestionId];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"relatedSuggestionId"];
  }
  char v9 = (char)self->_has;
  if ((v9 & 2) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SUGSchemaSUGInteraction relatedSuggestionsShownCount](self, "relatedSuggestionsShownCount"));
    [v3 setObject:v10 forKeyedSubscript:@"relatedSuggestionsShownCount"];

    char v9 = (char)self->_has;
  }
  if ((v9 & 8) != 0)
  {
    int v11 = [(SUGSchemaSUGInteraction *)self triggerType];
    v12 = @"SUGTRIGGERTYPE_UNKNOWN";
    if (v11 == 1) {
      v12 = @"SUGTRIGGERTYPE_HS";
    }
    if (v11 == 2) {
      v13 = @"SUGTRIGGERTYPE_BUTTON";
    }
    else {
      v13 = v12;
    }
    [v3 setObject:v13 forKeyedSubscript:@"triggerType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_relatedSuggestionId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_relatedSuggestionEventSequenceNum;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_relatedSuggestionsShownCount;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_hasOccurredWithinHour;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_triggerType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  uint64_t v5 = [(SUGSchemaSUGInteraction *)self relatedSuggestionId];
  uint64_t v6 = [v4 relatedSuggestionId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_24;
  }
  uint64_t v8 = [(SUGSchemaSUGInteraction *)self relatedSuggestionId];
  if (v8)
  {
    char v9 = (void *)v8;
    v10 = [(SUGSchemaSUGInteraction *)self relatedSuggestionId];
    int v11 = [v4 relatedSuggestionId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $75835F0F9B5E13ACB81079993A3297F6 has = self->_has;
  unsigned int v14 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_24:
    BOOL v22 = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int relatedSuggestionEventSequenceNum = self->_relatedSuggestionEventSequenceNum;
    if (relatedSuggestionEventSequenceNum != [v4 relatedSuggestionEventSequenceNum]) {
      goto LABEL_24;
    }
    $75835F0F9B5E13ACB81079993A3297F6 has = self->_has;
    unsigned int v14 = v4[32];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v16)
  {
    unsigned int relatedSuggestionsShownCount = self->_relatedSuggestionsShownCount;
    if (relatedSuggestionsShownCount != [v4 relatedSuggestionsShownCount]) {
      goto LABEL_24;
    }
    $75835F0F9B5E13ACB81079993A3297F6 has = self->_has;
    unsigned int v14 = v4[32];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_24;
  }
  if (v18)
  {
    int hasOccurredWithinHour = self->_hasOccurredWithinHour;
    if (hasOccurredWithinHour == [v4 hasOccurredWithinHour])
    {
      $75835F0F9B5E13ACB81079993A3297F6 has = self->_has;
      unsigned int v14 = v4[32];
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_20:
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_24;
  }
  if (v20)
  {
    int triggerType = self->_triggerType;
    if (triggerType != [v4 triggerType]) {
      goto LABEL_24;
    }
  }
  BOOL v22 = 1;
LABEL_25:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(SUGSchemaSUGInteraction *)self relatedSuggestionId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  uint64_t v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v6 = v7;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  uint64_t v6 = v7;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    uint64_t v6 = v7;
  }
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGInteractionReadFrom(self, (uint64_t)a3);
}

- (void)deleteTriggerType
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasTriggerType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTriggerType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTriggerType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int triggerType = a3;
}

- (void)deleteHasOccurredWithinHour
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasHasOccurredWithinHour:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasOccurredWithinHour
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasOccurredWithinHour:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int hasOccurredWithinHour = a3;
}

- (void)deleteRelatedSuggestionsShownCount
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasRelatedSuggestionsShownCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRelatedSuggestionsShownCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRelatedSuggestionsShownCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int relatedSuggestionsShownCount = a3;
}

- (void)deleteRelatedSuggestionEventSequenceNum
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRelatedSuggestionEventSequenceNum:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRelatedSuggestionEventSequenceNum
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRelatedSuggestionEventSequenceNum:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int relatedSuggestionEventSequenceNum = a3;
}

- (void)deleteRelatedSuggestionId
{
}

- (BOOL)hasRelatedSuggestionId
{
  return self->_relatedSuggestionId != 0;
}

@end