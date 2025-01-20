@interface NLXSchemaNLXLegacyNLContextTier1
- (BOOL)hasLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaNLXLegacyNLContextTier1)initWithDictionary:(id)a3;
- (NLXSchemaNLXLegacyNLContextTier1)initWithJSON:(id)a3;
- (NSArray)renderedTexts;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)renderedTextsAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)renderedTextsCount;
- (void)addRenderedTexts:(id)a3;
- (void)clearRenderedTexts;
- (void)deleteLinkId;
- (void)setHasLinkId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setRenderedTexts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaNLXLegacyNLContextTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NLXSchemaNLXLegacyNLContextTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v10 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2]) {
    [(NLXSchemaNLXLegacyNLContextTier1 *)self deleteRenderedTexts];
  }
  if ([v4 isConditionSet:4]) {
    [(NLXSchemaNLXLegacyNLContextTier1 *)self deleteRenderedTexts];
  }
  if ([v4 isConditionSet:5]) {
    [(NLXSchemaNLXLegacyNLContextTier1 *)self deleteRenderedTexts];
  }
  if ([v4 isConditionSet:6]) {
    [(NLXSchemaNLXLegacyNLContextTier1 *)self deleteRenderedTexts];
  }
  if ([v4 isConditionSet:7]) {
    [(NLXSchemaNLXLegacyNLContextTier1 *)self deleteRenderedTexts];
  }
  v6 = [(NLXSchemaNLXLegacyNLContextTier1 *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaNLXLegacyNLContextTier1 *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_renderedTexts, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setRenderedTexts:(id)a3
{
}

- (NSArray)renderedTexts
{
  return self->_renderedTexts;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (NLXSchemaNLXLegacyNLContextTier1)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NLXSchemaNLXLegacyNLContextTier1;
  v5 = [(NLXSchemaNLXLegacyNLContextTier1 *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLXSchemaNLXLegacyNLContextTier1 *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"renderedTexts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = objc_msgSend(v14, "copy", (void)v18);
              [(NLXSchemaNLXLegacyNLContextTier1 *)v5 addRenderedTexts:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v11);
      }
    }
    v16 = v5;
  }
  return v5;
}

- (NLXSchemaNLXLegacyNLContextTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaNLXLegacyNLContextTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaNLXLegacyNLContextTier1 *)self dictionaryRepresentation];
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
  if (self->_linkId)
  {
    id v4 = [(NLXSchemaNLXLegacyNLContextTier1 *)self linkId];
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
  if (self->_renderedTexts)
  {
    uint64_t v7 = [(NLXSchemaNLXLegacyNLContextTier1 *)self renderedTexts];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"renderedTexts"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  return [(NSArray *)self->_renderedTexts hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(NLXSchemaNLXLegacyNLContextTier1 *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(NLXSchemaNLXLegacyNLContextTier1 *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    id v9 = [(NLXSchemaNLXLegacyNLContextTier1 *)self linkId];
    uint64_t v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(NLXSchemaNLXLegacyNLContextTier1 *)self renderedTexts];
  v6 = [v4 renderedTexts];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(NLXSchemaNLXLegacyNLContextTier1 *)self renderedTexts];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    uint64_t v13 = (void *)v12;
    v14 = [(NLXSchemaNLXLegacyNLContextTier1 *)self renderedTexts];
    v15 = [v4 renderedTexts];
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
  v5 = [(NLXSchemaNLXLegacyNLContextTier1 *)self linkId];

  if (v5)
  {
    v6 = [(NLXSchemaNLXLegacyNLContextTier1 *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_renderedTexts;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaNLXLegacyNLContextTier1ReadFrom(self, (uint64_t)a3);
}

- (id)renderedTextsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_renderedTexts objectAtIndexedSubscript:a3];
}

- (unint64_t)renderedTextsCount
{
  return [(NSArray *)self->_renderedTexts count];
}

- (void)addRenderedTexts:(id)a3
{
  id v4 = a3;
  renderedTexts = self->_renderedTexts;
  id v8 = v4;
  if (!renderedTexts)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_renderedTexts;
    self->_renderedTexts = v6;

    id v4 = v8;
    renderedTexts = self->_renderedTexts;
  }
  [(NSArray *)renderedTexts addObject:v4];
}

- (void)clearRenderedTexts
{
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end