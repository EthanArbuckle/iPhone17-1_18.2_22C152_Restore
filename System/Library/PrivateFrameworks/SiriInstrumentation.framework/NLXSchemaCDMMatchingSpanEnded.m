@interface NLXSchemaCDMMatchingSpanEnded
- (BOOL)hasContextId;
- (BOOL)hasLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMMatchingSpanEnded)initWithDictionary:(id)a3;
- (NLXSchemaCDMMatchingSpanEnded)initWithJSON:(id)a3;
- (NSArray)matchingSpans;
- (NSData)jsonData;
- (SISchemaUUID)contextId;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)matchingSpansAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)matchingSpansCount;
- (void)addMatchingSpans:(id)a3;
- (void)clearMatchingSpans;
- (void)deleteContextId;
- (void)deleteLinkId;
- (void)setContextId:(id)a3;
- (void)setHasContextId:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setMatchingSpans:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMMatchingSpanEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NLXSchemaCDMMatchingSpanEnded;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMMatchingSpanEnded *)self contextId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaCDMMatchingSpanEnded *)self deleteContextId];
  }
  v9 = [(NLXSchemaCDMMatchingSpanEnded *)self matchingSpans];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(NLXSchemaCDMMatchingSpanEnded *)self setMatchingSpans:v10];

  v11 = [(NLXSchemaCDMMatchingSpanEnded *)self linkId];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(NLXSchemaCDMMatchingSpanEnded *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_matchingSpans, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasContextId:(BOOL)a3
{
  self->_hasContextId = a3;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setMatchingSpans:(id)a3
{
}

- (NSArray)matchingSpans
{
  return self->_matchingSpans;
}

- (void)setContextId:(id)a3
{
}

- (SISchemaUUID)contextId
{
  return self->_contextId;
}

- (NLXSchemaCDMMatchingSpanEnded)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NLXSchemaCDMMatchingSpanEnded;
  v5 = [(NLXSchemaCDMMatchingSpanEnded *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contextId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLXSchemaCDMMatchingSpanEnded *)v5 setContextId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"matchingSpans"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v6;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_super v15 = [[NLXSchemaCDMMatchingSpan alloc] initWithDictionary:v14];
              [(NLXSchemaCDMMatchingSpanEnded *)v5 addMatchingSpans:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v11);
      }

      v6 = v20;
    }
    v16 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[SISchemaUUID alloc] initWithDictionary:v16];
      [(NLXSchemaCDMMatchingSpanEnded *)v5 setLinkId:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (NLXSchemaCDMMatchingSpanEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMMatchingSpanEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMMatchingSpanEnded *)self dictionaryRepresentation];
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_contextId)
  {
    id v4 = [(NLXSchemaCDMMatchingSpanEnded *)self contextId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"contextId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"contextId"];
    }
  }
  if (self->_linkId)
  {
    uint64_t v7 = [(NLXSchemaCDMMatchingSpanEnded *)self linkId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"linkId"];
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"linkId"];
    }
  }
  if ([(NSArray *)self->_matchingSpans count])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = self->_matchingSpans;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          if (v16)
          {
            [v10 addObject:v16];
          }
          else
          {
            v17 = [MEMORY[0x1E4F1CA98] null];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"matchingSpans"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_contextId hash];
  uint64_t v4 = [(NSArray *)self->_matchingSpans hash] ^ v3;
  return v4 ^ [(SISchemaUUID *)self->_linkId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(NLXSchemaCDMMatchingSpanEnded *)self contextId];
  v6 = [v4 contextId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(NLXSchemaCDMMatchingSpanEnded *)self contextId];
  if (v7)
  {
    int v8 = (void *)v7;
    id v9 = [(NLXSchemaCDMMatchingSpanEnded *)self contextId];
    uint64_t v10 = [v4 contextId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(NLXSchemaCDMMatchingSpanEnded *)self matchingSpans];
  v6 = [v4 matchingSpans];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(NLXSchemaCDMMatchingSpanEnded *)self matchingSpans];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(NLXSchemaCDMMatchingSpanEnded *)self matchingSpans];
    objc_super v15 = [v4 matchingSpans];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(NLXSchemaCDMMatchingSpanEnded *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(NLXSchemaCDMMatchingSpanEnded *)self linkId];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    long long v19 = [(NLXSchemaCDMMatchingSpanEnded *)self linkId];
    long long v20 = [v4 linkId];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NLXSchemaCDMMatchingSpanEnded *)self contextId];

  if (v5)
  {
    v6 = [(NLXSchemaCDMMatchingSpanEnded *)self contextId];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_matchingSpans;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [(NLXSchemaCDMMatchingSpanEnded *)self linkId];

  if (v12)
  {
    uint64_t v13 = [(NLXSchemaCDMMatchingSpanEnded *)self linkId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMMatchingSpanEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (id)matchingSpansAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_matchingSpans objectAtIndexedSubscript:a3];
}

- (unint64_t)matchingSpansCount
{
  return [(NSArray *)self->_matchingSpans count];
}

- (void)addMatchingSpans:(id)a3
{
  id v4 = a3;
  matchingSpans = self->_matchingSpans;
  id v8 = v4;
  if (!matchingSpans)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_matchingSpans;
    self->_matchingSpans = v6;

    id v4 = v8;
    matchingSpans = self->_matchingSpans;
  }
  [(NSArray *)matchingSpans addObject:v4];
}

- (void)clearMatchingSpans
{
}

- (void)deleteContextId
{
}

- (BOOL)hasContextId
{
  return self->_contextId != 0;
}

@end