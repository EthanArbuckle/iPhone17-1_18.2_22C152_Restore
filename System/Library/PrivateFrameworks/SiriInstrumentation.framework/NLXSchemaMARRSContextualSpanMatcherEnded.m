@interface NLXSchemaMARRSContextualSpanMatcherEnded
- (BOOL)hasLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaMARRSContextualSpanMatcherEnded)initWithDictionary:(id)a3;
- (NLXSchemaMARRSContextualSpanMatcherEnded)initWithJSON:(id)a3;
- (NSArray)contextualSpans;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)contextualSpansAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)contextualSpansCount;
- (unint64_t)hash;
- (void)addContextualSpans:(id)a3;
- (void)clearContextualSpans;
- (void)deleteLinkId;
- (void)setContextualSpans:(id)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaMARRSContextualSpanMatcherEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NLXSchemaMARRSContextualSpanMatcherEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaMARRSContextualSpanMatcherEnded *)self contextualSpans];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(NLXSchemaMARRSContextualSpanMatcherEnded *)self setContextualSpans:v7];

  v8 = [(NLXSchemaMARRSContextualSpanMatcherEnded *)self linkId];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(NLXSchemaMARRSContextualSpanMatcherEnded *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_contextualSpans, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setContextualSpans:(id)a3
{
}

- (NSArray)contextualSpans
{
  return self->_contextualSpans;
}

- (NLXSchemaMARRSContextualSpanMatcherEnded)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NLXSchemaMARRSContextualSpanMatcherEnded;
  v5 = [(NLXSchemaMARRSContextualSpanMatcherEnded *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contextualSpans"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [NLXSchemaCDMMatchingSpan alloc];
              v14 = -[NLXSchemaCDMMatchingSpan initWithDictionary:](v13, "initWithDictionary:", v12, (void)v19);
              [(NLXSchemaMARRSContextualSpanMatcherEnded *)v5 addContextualSpans:v14];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }
    }
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"linkId", (void)v19);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaUUID alloc] initWithDictionary:v15];
      [(NLXSchemaMARRSContextualSpanMatcherEnded *)v5 setLinkId:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (NLXSchemaMARRSContextualSpanMatcherEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaMARRSContextualSpanMatcherEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaMARRSContextualSpanMatcherEnded *)self dictionaryRepresentation];
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
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_contextualSpans count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v5 = self->_contextualSpans;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"contextualSpans"];
  }
  if (self->_linkId)
  {
    uint64_t v12 = [(NLXSchemaMARRSContextualSpanMatcherEnded *)self linkId];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"linkId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_contextualSpans hash];
  return [(SISchemaUUID *)self->_linkId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(NLXSchemaMARRSContextualSpanMatcherEnded *)self contextualSpans];
  uint64_t v6 = [v4 contextualSpans];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(NLXSchemaMARRSContextualSpanMatcherEnded *)self contextualSpans];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(NLXSchemaMARRSContextualSpanMatcherEnded *)self contextualSpans];
    uint64_t v10 = [v4 contextualSpans];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(NLXSchemaMARRSContextualSpanMatcherEnded *)self linkId];
  uint64_t v6 = [v4 linkId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(NLXSchemaMARRSContextualSpanMatcherEnded *)self linkId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(NLXSchemaMARRSContextualSpanMatcherEnded *)self linkId];
    v15 = [v4 linkId];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_contextualSpans;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(NLXSchemaMARRSContextualSpanMatcherEnded *)self linkId];

  if (v10)
  {
    int v11 = [(NLXSchemaMARRSContextualSpanMatcherEnded *)self linkId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMARRSContextualSpanMatcherEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (id)contextualSpansAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_contextualSpans objectAtIndexedSubscript:a3];
}

- (unint64_t)contextualSpansCount
{
  return [(NSArray *)self->_contextualSpans count];
}

- (void)addContextualSpans:(id)a3
{
  id v4 = a3;
  contextualSpans = self->_contextualSpans;
  id v8 = v4;
  if (!contextualSpans)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_contextualSpans;
    self->_contextualSpans = v6;

    id v4 = v8;
    contextualSpans = self->_contextualSpans;
  }
  [(NSArray *)contextualSpans addObject:v4];
}

- (void)clearContextualSpans
{
}

@end