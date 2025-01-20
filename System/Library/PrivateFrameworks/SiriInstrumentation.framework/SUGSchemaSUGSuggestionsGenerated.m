@interface SUGSchemaSUGSuggestionsGenerated
- (BOOL)hasAutoCompleteQuery;
- (BOOL)hasGenerationId;
- (BOOL)hasGenerationTag;
- (BOOL)hasInvocationType;
- (BOOL)hasLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)suggestions;
- (NSData)jsonData;
- (NSString)generationTag;
- (SISchemaUUID)generationId;
- (SISchemaUUID)linkId;
- (SUGSchemaSUGAutoCompleteQuery)autoCompleteQuery;
- (SUGSchemaSUGSuggestionsGenerated)initWithDictionary:(id)a3;
- (SUGSchemaSUGSuggestionsGenerated)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suggestionsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)invocationType;
- (unint64_t)hash;
- (unint64_t)suggestionsCount;
- (void)addSuggestions:(id)a3;
- (void)clearSuggestions;
- (void)deleteAutoCompleteQuery;
- (void)deleteGenerationId;
- (void)deleteGenerationTag;
- (void)deleteInvocationType;
- (void)deleteLinkId;
- (void)setAutoCompleteQuery:(id)a3;
- (void)setGenerationId:(id)a3;
- (void)setGenerationTag:(id)a3;
- (void)setHasAutoCompleteQuery:(BOOL)a3;
- (void)setHasGenerationId:(BOOL)a3;
- (void)setHasGenerationTag:(BOOL)a3;
- (void)setHasInvocationType:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setInvocationType:(int)a3;
- (void)setLinkId:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SUGSchemaSUGSuggestionsGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SUGSchemaSUGSuggestionsGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v18 applySensitiveConditionsPolicy:v4];
  v6 = [(SUGSchemaSUGSuggestionsGenerated *)self suggestions];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(SUGSchemaSUGSuggestionsGenerated *)self setSuggestions:v7];

  v8 = [(SUGSchemaSUGSuggestionsGenerated *)self generationId];
  v9 = [v8 applySensitiveConditionsPolicy:v4];
  int v10 = [v9 suppressMessage];

  if (v10) {
    [(SUGSchemaSUGSuggestionsGenerated *)self deleteGenerationId];
  }
  v11 = [(SUGSchemaSUGSuggestionsGenerated *)self autoCompleteQuery];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(SUGSchemaSUGSuggestionsGenerated *)self deleteAutoCompleteQuery];
  }
  v14 = [(SUGSchemaSUGSuggestionsGenerated *)self linkId];
  v15 = [v14 applySensitiveConditionsPolicy:v4];
  int v16 = [v15 suppressMessage];

  if (v16) {
    [(SUGSchemaSUGSuggestionsGenerated *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_autoCompleteQuery, 0);
  objc_storeStrong((id *)&self->_generationTag, 0);
  objc_storeStrong((id *)&self->_generationId, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasGenerationId = a3;
}

- (void)setHasAutoCompleteQuery:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasGenerationTag:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasGenerationId:(BOOL)a3
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

- (void)setAutoCompleteQuery:(id)a3
{
}

- (SUGSchemaSUGAutoCompleteQuery)autoCompleteQuery
{
  return self->_autoCompleteQuery;
}

- (void)setGenerationTag:(id)a3
{
}

- (NSString)generationTag
{
  return self->_generationTag;
}

- (void)setGenerationId:(id)a3
{
}

- (SISchemaUUID)generationId
{
  return self->_generationId;
}

- (int)invocationType
{
  return self->_invocationType;
}

- (void)setSuggestions:(id)a3
{
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (SUGSchemaSUGSuggestionsGenerated)initWithDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SUGSchemaSUGSuggestionsGenerated;
  v5 = [(SUGSchemaSUGSuggestionsGenerated *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"suggestions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v27;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v13 = [SUGSchemaSUGSuggestion alloc];
              v14 = -[SUGSchemaSUGSuggestion initWithDictionary:](v13, "initWithDictionary:", v12, (void)v26);
              [(SUGSchemaSUGSuggestionsGenerated *)v5 addSuggestions:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"invocationType", (void)v26);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SUGSchemaSUGSuggestionsGenerated setInvocationType:](v5, "setInvocationType:", [v15 intValue]);
    }
    int v16 = [v4 objectForKeyedSubscript:@"generationId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[SISchemaUUID alloc] initWithDictionary:v16];
      [(SUGSchemaSUGSuggestionsGenerated *)v5 setGenerationId:v17];
    }
    objc_super v18 = [v4 objectForKeyedSubscript:@"generationTag"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(SUGSchemaSUGSuggestionsGenerated *)v5 setGenerationTag:v19];
    }
    v20 = [v4 objectForKeyedSubscript:@"autoCompleteQuery"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[SUGSchemaSUGAutoCompleteQuery alloc] initWithDictionary:v20];
      [(SUGSchemaSUGSuggestionsGenerated *)v5 setAutoCompleteQuery:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = [[SISchemaUUID alloc] initWithDictionary:v22];
      [(SUGSchemaSUGSuggestionsGenerated *)v5 setLinkId:v23];
    }
    v24 = v5;
  }
  return v5;
}

- (SUGSchemaSUGSuggestionsGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SUGSchemaSUGSuggestionsGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SUGSchemaSUGSuggestionsGenerated *)self dictionaryRepresentation];
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_autoCompleteQuery)
  {
    id v4 = [(SUGSchemaSUGSuggestionsGenerated *)self autoCompleteQuery];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"autoCompleteQuery"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"autoCompleteQuery"];
    }
  }
  if (self->_generationId)
  {
    uint64_t v7 = [(SUGSchemaSUGSuggestionsGenerated *)self generationId];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"generationId"];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"generationId"];
    }
  }
  if (self->_generationTag)
  {
    uint64_t v10 = [(SUGSchemaSUGSuggestionsGenerated *)self generationTag];
    uint64_t v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"generationTag"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v12 = [(SUGSchemaSUGSuggestionsGenerated *)self invocationType] - 1;
    if (v12 > 9) {
      int v13 = @"SUGINVOCATIONTYPE_UNKNOWN";
    }
    else {
      int v13 = off_1E5EB96B8[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"invocationType"];
  }
  if (self->_linkId)
  {
    v14 = [(SUGSchemaSUGSuggestionsGenerated *)self linkId];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"linkId"];
    }
    else
    {
      int v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"linkId"];
    }
  }
  if ([(NSArray *)self->_suggestions count])
  {
    v17 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v18 = self->_suggestions;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (void)v26);
          if (v23)
          {
            [v17 addObject:v23];
          }
          else
          {
            v24 = [MEMORY[0x1E4F1CA98] null];
            [v17 addObject:v24];
          }
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKeyedSubscript:@"suggestions"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v26);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_suggestions hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_invocationType;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(SISchemaUUID *)self->_generationId hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_generationTag hash];
  unint64_t v8 = [(SUGSchemaSUGAutoCompleteQuery *)self->_autoCompleteQuery hash];
  return v7 ^ v8 ^ [(SISchemaUUID *)self->_linkId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  uint64_t v5 = [(SUGSchemaSUGSuggestionsGenerated *)self suggestions];
  unint64_t v6 = [v4 suggestions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v7 = [(SUGSchemaSUGSuggestionsGenerated *)self suggestions];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(SUGSchemaSUGSuggestionsGenerated *)self suggestions];
    uint64_t v10 = [v4 suggestions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[56] & 1)) {
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    int invocationType = self->_invocationType;
    if (invocationType != [v4 invocationType]) {
      goto LABEL_30;
    }
  }
  uint64_t v5 = [(SUGSchemaSUGSuggestionsGenerated *)self generationId];
  unint64_t v6 = [v4 generationId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v13 = [(SUGSchemaSUGSuggestionsGenerated *)self generationId];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(SUGSchemaSUGSuggestionsGenerated *)self generationId];
    int v16 = [v4 generationId];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SUGSchemaSUGSuggestionsGenerated *)self generationTag];
  unint64_t v6 = [v4 generationTag];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v18 = [(SUGSchemaSUGSuggestionsGenerated *)self generationTag];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [(SUGSchemaSUGSuggestionsGenerated *)self generationTag];
    uint64_t v21 = [v4 generationTag];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SUGSchemaSUGSuggestionsGenerated *)self autoCompleteQuery];
  unint64_t v6 = [v4 autoCompleteQuery];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v23 = [(SUGSchemaSUGSuggestionsGenerated *)self autoCompleteQuery];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(SUGSchemaSUGSuggestionsGenerated *)self autoCompleteQuery];
    long long v26 = [v4 autoCompleteQuery];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SUGSchemaSUGSuggestionsGenerated *)self linkId];
  unint64_t v6 = [v4 linkId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v28 = [(SUGSchemaSUGSuggestionsGenerated *)self linkId];
    if (!v28)
    {

LABEL_33:
      BOOL v33 = 1;
      goto LABEL_31;
    }
    long long v29 = (void *)v28;
    objc_super v30 = [(SUGSchemaSUGSuggestionsGenerated *)self linkId];
    uint64_t v31 = [v4 linkId];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_33;
    }
  }
  else
  {
LABEL_29:
  }
LABEL_30:
  BOOL v33 = 0;
LABEL_31:

  return v33;
}

- (void)writeTo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = self->_suggestions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v10 = [(SUGSchemaSUGSuggestionsGenerated *)self generationId];

  if (v10)
  {
    int v11 = [(SUGSchemaSUGSuggestionsGenerated *)self generationId];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v12 = [(SUGSchemaSUGSuggestionsGenerated *)self generationTag];

  if (v12) {
    PBDataWriterWriteStringField();
  }
  uint64_t v13 = [(SUGSchemaSUGSuggestionsGenerated *)self autoCompleteQuery];

  if (v13)
  {
    v14 = [(SUGSchemaSUGSuggestionsGenerated *)self autoCompleteQuery];
    PBDataWriterWriteSubmessage();
  }
  v15 = [(SUGSchemaSUGSuggestionsGenerated *)self linkId];

  if (v15)
  {
    int v16 = [(SUGSchemaSUGSuggestionsGenerated *)self linkId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SUGSchemaSUGSuggestionsGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteAutoCompleteQuery
{
}

- (BOOL)hasAutoCompleteQuery
{
  return self->_autoCompleteQuery != 0;
}

- (void)deleteGenerationTag
{
}

- (BOOL)hasGenerationTag
{
  return self->_generationTag != 0;
}

- (void)deleteGenerationId
{
}

- (BOOL)hasGenerationId
{
  return self->_generationId != 0;
}

- (void)deleteInvocationType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasInvocationType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInvocationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInvocationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int invocationType = a3;
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

@end