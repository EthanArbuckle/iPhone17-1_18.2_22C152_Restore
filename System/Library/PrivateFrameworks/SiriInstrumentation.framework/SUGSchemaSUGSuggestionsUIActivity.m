@interface SUGSchemaSUGSuggestionsUIActivity
- (BOOL)hasDeliveryVehicle;
- (BOOL)hasLinkId;
- (BOOL)hasUiActivity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)suggestionIds;
- (NSArray)suggestions;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (SUGSchemaSUGSuggestionsUIActivity)initWithDictionary:(id)a3;
- (SUGSchemaSUGSuggestionsUIActivity)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suggestionIdsAtIndex:(unint64_t)a3;
- (id)suggestionsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)deliveryVehicle;
- (int)uiActivity;
- (unint64_t)hash;
- (unint64_t)suggestionIdsCount;
- (unint64_t)suggestionsCount;
- (void)addSuggestionIds:(id)a3;
- (void)addSuggestions:(id)a3;
- (void)clearSuggestionIds;
- (void)clearSuggestions;
- (void)deleteDeliveryVehicle;
- (void)deleteLinkId;
- (void)deleteUiActivity;
- (void)setDeliveryVehicle:(int)a3;
- (void)setHasDeliveryVehicle:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasUiActivity:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setSuggestionIds:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)setUiActivity:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SUGSchemaSUGSuggestionsUIActivity

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SUGSchemaSUGSuggestionsUIActivity;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(SUGSchemaSUGSuggestionsUIActivity *)self suggestions];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(SUGSchemaSUGSuggestionsUIActivity *)self setSuggestions:v7];

  v8 = [(SUGSchemaSUGSuggestionsUIActivity *)self linkId];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(SUGSchemaSUGSuggestionsUIActivity *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_suggestionIds, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setSuggestions:(id)a3
{
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (int)uiActivity
{
  return self->_uiActivity;
}

- (int)deliveryVehicle
{
  return self->_deliveryVehicle;
}

- (void)setSuggestionIds:(id)a3
{
}

- (NSArray)suggestionIds
{
  return self->_suggestionIds;
}

- (SUGSchemaSUGSuggestionsUIActivity)initWithDictionary:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SUGSchemaSUGSuggestionsUIActivity;
  v5 = [(SUGSchemaSUGSuggestionsUIActivity *)&v39 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestionIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v7 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v36 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = (void *)[v13 copy];
              [(SUGSchemaSUGSuggestionsUIActivity *)v5 addSuggestionIds:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v10);
      }

      v6 = v7;
    }
    v15 = [v4 objectForKeyedSubscript:@"deliveryVehicle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGSuggestionsUIActivity setDeliveryVehicle:](v5, "setDeliveryVehicle:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"uiActivity"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGSuggestionsUIActivity setUiActivity:](v5, "setUiActivity:", [v16 intValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"suggestions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = v16;
      v30 = v15;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24 = [[SUGSchemaSUGSuggestion alloc] initWithDictionary:v23];
              [(SUGSchemaSUGSuggestionsUIActivity *)v5 addSuggestions:v24];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v40 count:16];
        }
        while (v20);
      }

      v15 = v30;
      v16 = v29;
    }
    v25 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = [[SISchemaUUID alloc] initWithDictionary:v25];
      [(SUGSchemaSUGSuggestionsUIActivity *)v5 setLinkId:v26];
    }
    v27 = v5;
  }
  return v5;
}

- (SUGSchemaSUGSuggestionsUIActivity)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SUGSchemaSUGSuggestionsUIActivity *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SUGSchemaSUGSuggestionsUIActivity *)self dictionaryRepresentation];
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
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = [(SUGSchemaSUGSuggestionsUIActivity *)self deliveryVehicle] - 1;
    if (v4 > 9) {
      v5 = @"SUGDELIVERYVEHICLE_UNKNOWN";
    }
    else {
      v5 = off_1E5EBF8C8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"deliveryVehicle"];
  }
  if (self->_linkId)
  {
    v6 = [(SUGSchemaSUGSuggestionsUIActivity *)self linkId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"linkId"];
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_suggestionIds)
  {
    uint64_t v9 = [(SUGSchemaSUGSuggestionsUIActivity *)self suggestionIds];
    uint64_t v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"suggestionIds"];
  }
  if ([(NSArray *)self->_suggestions count])
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v12 = self->_suggestions;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          if (v17)
          {
            [v11 addObject:v17];
          }
          else
          {
            id v18 = [MEMORY[0x1E4F1CA98] null];
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"suggestions"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int v19 = [(SUGSchemaSUGSuggestionsUIActivity *)self uiActivity];
    uint64_t v20 = @"SUGUIACTIVITY_UNKNOWN";
    if (v19 == 1) {
      uint64_t v20 = @"SUGUIACTIVITY_PRESENTED";
    }
    if (v19 == 2) {
      uint64_t v21 = @"SUGUIACTIVITY_TAPPED";
    }
    else {
      uint64_t v21 = v20;
    }
    [v3 setObject:v21 forKeyedSubscript:@"uiActivity"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_suggestionIds hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_deliveryVehicle;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_uiActivity;
LABEL_6:
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSArray *)self->_suggestions hash];
  return v6 ^ [(SISchemaUUID *)self->_linkId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  uint64_t v5 = [(SUGSchemaSUGSuggestionsUIActivity *)self suggestionIds];
  uint64_t v6 = [v4 suggestionIds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v7 = [(SUGSchemaSUGSuggestionsUIActivity *)self suggestionIds];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [(SUGSchemaSUGSuggestionsUIActivity *)self suggestionIds];
    uint64_t v10 = [v4 suggestionIds];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  $E51AE7829341A97806E40ACEC4F93920 has = self->_has;
  unsigned int v13 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&has)
  {
    int deliveryVehicle = self->_deliveryVehicle;
    if (deliveryVehicle != [v4 deliveryVehicle]) {
      goto LABEL_24;
    }
    $E51AE7829341A97806E40ACEC4F93920 has = self->_has;
    unsigned int v13 = v4[40];
  }
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  if (v15 != ((v13 >> 1) & 1)) {
    goto LABEL_24;
  }
  if (v15)
  {
    int uiActivity = self->_uiActivity;
    if (uiActivity != [v4 uiActivity]) {
      goto LABEL_24;
    }
  }
  uint64_t v5 = [(SUGSchemaSUGSuggestionsUIActivity *)self suggestions];
  uint64_t v6 = [v4 suggestions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_23;
  }
  uint64_t v17 = [(SUGSchemaSUGSuggestionsUIActivity *)self suggestions];
  if (v17)
  {
    id v18 = (void *)v17;
    int v19 = [(SUGSchemaSUGSuggestionsUIActivity *)self suggestions];
    uint64_t v20 = [v4 suggestions];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_24;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SUGSchemaSUGSuggestionsUIActivity *)self linkId];
  uint64_t v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v22 = [(SUGSchemaSUGSuggestionsUIActivity *)self linkId];
  if (!v22)
  {

LABEL_27:
    BOOL v27 = 1;
    goto LABEL_25;
  }
  long long v23 = (void *)v22;
  long long v24 = [(SUGSchemaSUGSuggestionsUIActivity *)self linkId];
  long long v25 = [v4 linkId];
  char v26 = [v24 isEqual:v25];

  if (v26) {
    goto LABEL_27;
  }
LABEL_24:
  BOOL v27 = 0;
LABEL_25:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = self->_suggestionIds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v11 = self->_suggestions;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  v16 = [(SUGSchemaSUGSuggestionsUIActivity *)self linkId];

  if (v16)
  {
    uint64_t v17 = [(SUGSchemaSUGSuggestionsUIActivity *)self linkId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGSuggestionsUIActivityReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (id)suggestionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_suggestions objectAtIndexedSubscript:a3];
}

- (unint64_t)suggestionsCount
{
  return [(NSArray *)self->_suggestions count];
}

- (void)addSuggestions:(id)a3
{
  id v4 = a3;
  suggestions = self->_suggestions;
  id v8 = v4;
  if (!suggestions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_suggestions;
    self->_suggestions = v6;

    id v4 = v8;
    suggestions = self->_suggestions;
  }
  [(NSArray *)suggestions addObject:v4];
}

- (void)clearSuggestions
{
}

- (void)deleteUiActivity
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasUiActivity:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUiActivity
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setUiActivity:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int uiActivity = a3;
}

- (void)deleteDeliveryVehicle
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDeliveryVehicle:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeliveryVehicle
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDeliveryVehicle:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int deliveryVehicle = a3;
}

- (id)suggestionIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_suggestionIds objectAtIndexedSubscript:a3];
}

- (unint64_t)suggestionIdsCount
{
  return [(NSArray *)self->_suggestionIds count];
}

- (void)addSuggestionIds:(id)a3
{
  id v4 = a3;
  suggestionIds = self->_suggestionIds;
  id v8 = v4;
  if (!suggestionIds)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_suggestionIds;
    self->_suggestionIds = v6;

    id v4 = v8;
    suggestionIds = self->_suggestionIds;
  }
  [(NSArray *)suggestionIds addObject:v4];
}

- (void)clearSuggestionIds
{
}

@end