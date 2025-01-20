@interface NLXSchemaMARRSMentionResolverEnded
- (BOOL)hasLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaMARRSMentionResolverEnded)initWithDictionary:(id)a3;
- (NLXSchemaMARRSMentionResolverEnded)initWithJSON:(id)a3;
- (NSArray)mentionResolverSpans;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)mentionResolverSpansAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)mentionResolverSpansCount;
- (void)addMentionResolverSpans:(id)a3;
- (void)clearMentionResolverSpans;
- (void)deleteLinkId;
- (void)setHasLinkId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setMentionResolverSpans:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaMARRSMentionResolverEnded

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NLXSchemaMARRSMentionResolverEnded;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v11 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaMARRSMentionResolverEnded *)self mentionResolverSpans];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(NLXSchemaMARRSMentionResolverEnded *)self setMentionResolverSpans:v7];

  v8 = [(NLXSchemaMARRSMentionResolverEnded *)self linkId];
  v9 = [v8 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v9 suppressMessage];
  if (v4) {
    [(NLXSchemaMARRSMentionResolverEnded *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_mentionResolverSpans, 0);
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

- (void)setMentionResolverSpans:(id)a3
{
}

- (NSArray)mentionResolverSpans
{
  return self->_mentionResolverSpans;
}

- (NLXSchemaMARRSMentionResolverEnded)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NLXSchemaMARRSMentionResolverEnded;
  v5 = [(NLXSchemaMARRSMentionResolverEnded *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"mentionResolverSpans"];
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
              [(NLXSchemaMARRSMentionResolverEnded *)v5 addMentionResolverSpans:v14];
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
      [(NLXSchemaMARRSMentionResolverEnded *)v5 setLinkId:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (NLXSchemaMARRSMentionResolverEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaMARRSMentionResolverEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaMARRSMentionResolverEnded *)self dictionaryRepresentation];
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
  if (self->_linkId)
  {
    id v4 = [(NLXSchemaMARRSMentionResolverEnded *)self linkId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"linkId"];
    }
  }
  if ([(NSArray *)self->_mentionResolverSpans count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = self->_mentionResolverSpans;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"mentionResolverSpans"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v16);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_mentionResolverSpans hash];
  return [(SISchemaUUID *)self->_linkId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(NLXSchemaMARRSMentionResolverEnded *)self mentionResolverSpans];
  v6 = [v4 mentionResolverSpans];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(NLXSchemaMARRSMentionResolverEnded *)self mentionResolverSpans];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(NLXSchemaMARRSMentionResolverEnded *)self mentionResolverSpans];
    uint64_t v10 = [v4 mentionResolverSpans];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(NLXSchemaMARRSMentionResolverEnded *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(NLXSchemaMARRSMentionResolverEnded *)self linkId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(NLXSchemaMARRSMentionResolverEnded *)self linkId];
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
  v5 = self->_mentionResolverSpans;
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

  uint64_t v10 = [(NLXSchemaMARRSMentionResolverEnded *)self linkId];

  if (v10)
  {
    int v11 = [(NLXSchemaMARRSMentionResolverEnded *)self linkId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaMARRSMentionResolverEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (id)mentionResolverSpansAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_mentionResolverSpans objectAtIndexedSubscript:a3];
}

- (unint64_t)mentionResolverSpansCount
{
  return [(NSArray *)self->_mentionResolverSpans count];
}

- (void)addMentionResolverSpans:(id)a3
{
  id v4 = a3;
  mentionResolverSpans = self->_mentionResolverSpans;
  id v8 = v4;
  if (!mentionResolverSpans)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_mentionResolverSpans;
    self->_mentionResolverSpans = v6;

    id v4 = v8;
    mentionResolverSpans = self->_mentionResolverSpans;
  }
  [(NSArray *)mentionResolverSpans addObject:v4];
}

- (void)clearMentionResolverSpans
{
}

@end