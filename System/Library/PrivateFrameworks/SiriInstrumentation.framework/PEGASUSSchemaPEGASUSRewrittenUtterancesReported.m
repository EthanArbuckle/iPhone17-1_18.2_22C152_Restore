@interface PEGASUSSchemaPEGASUSRewrittenUtterancesReported
- (BOOL)hasLinkId;
- (BOOL)hasWasRewrittenUtteranceUsed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasRewrittenUtteranceUsed;
- (NSArray)rewrittenUtterancesMetadatas;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSRewrittenUtterancesReported)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSRewrittenUtterancesReported)initWithJSON:(id)a3;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)rewrittenUtterancesMetadataAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)rewrittenUtterancesMetadataCount;
- (void)addRewrittenUtterancesMetadata:(id)a3;
- (void)clearRewrittenUtterancesMetadata;
- (void)deleteLinkId;
- (void)deleteWasRewrittenUtteranceUsed;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasWasRewrittenUtteranceUsed:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)setRewrittenUtterancesMetadatas:(id)a3;
- (void)setWasRewrittenUtteranceUsed:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSRewrittenUtterancesReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PEGASUSSchemaPEGASUSRewrittenUtterancesReported;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self deleteLinkId];
  }
  v9 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self rewrittenUtterancesMetadatas];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self setRewrittenUtterancesMetadatas:v10];

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
  objc_storeStrong((id *)&self->_rewrittenUtterancesMetadatas, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setRewrittenUtterancesMetadatas:(id)a3
{
}

- (NSArray)rewrittenUtterancesMetadatas
{
  return self->_rewrittenUtterancesMetadatas;
}

- (BOOL)wasRewrittenUtteranceUsed
{
  return self->_wasRewrittenUtteranceUsed;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (PEGASUSSchemaPEGASUSRewrittenUtterancesReported)initWithDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PEGASUSSchemaPEGASUSRewrittenUtterancesReported;
  v5 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)v5 setLinkId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"wasRewrittenUtteranceUsed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported setWasRewrittenUtteranceUsed:](v5, "setWasRewrittenUtteranceUsed:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"rewrittenUtterancesMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v8;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[PEGASUSSchemaPEGASUSRewrittenUtterance alloc] initWithDictionary:v15];
              [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)v5 addRewrittenUtterancesMetadata:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v12);
      }

      int v8 = v19;
    }
    v17 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSRewrittenUtterancesReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self dictionaryRepresentation];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_linkId)
  {
    id v4 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self linkId];
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
  if ([(NSArray *)self->_rewrittenUtterancesMetadatas count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    int v8 = self->_rewrittenUtterancesMetadatas;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
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
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"rewrittenUtterancesMetadata"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[PEGASUSSchemaPEGASUSRewrittenUtterancesReported wasRewrittenUtteranceUsed](self, "wasRewrittenUtteranceUsed"));
    [v3 setObject:v15 forKeyedSubscript:@"wasRewrittenUtteranceUsed"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v17);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_wasRewrittenUtteranceUsed;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSArray *)self->_rewrittenUtterancesMetadatas hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  v5 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self linkId];
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t v9 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self linkId];
    uint64_t v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int wasRewrittenUtteranceUsed = self->_wasRewrittenUtteranceUsed;
    if (wasRewrittenUtteranceUsed != [v4 wasRewrittenUtteranceUsed]) {
      goto LABEL_15;
    }
  }
  v5 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self rewrittenUtterancesMetadatas];
  v6 = [v4 rewrittenUtterancesMetadatas];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v13 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self rewrittenUtterancesMetadatas];
    if (!v13)
    {

LABEL_18:
      BOOL v18 = 1;
      goto LABEL_16;
    }
    v14 = (void *)v13;
    uint64_t v15 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self rewrittenUtterancesMetadatas];
    v16 = [v4 rewrittenUtterancesMetadatas];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self linkId];

  if (v5)
  {
    v6 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_rewrittenUtterancesMetadatas;
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
        PBDataWriterWriteSubmessage();
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
  return PEGASUSSchemaPEGASUSRewrittenUtterancesReportedReadFrom(self, (uint64_t)a3);
}

- (id)rewrittenUtterancesMetadataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_rewrittenUtterancesMetadatas objectAtIndexedSubscript:a3];
}

- (unint64_t)rewrittenUtterancesMetadataCount
{
  return [(NSArray *)self->_rewrittenUtterancesMetadatas count];
}

- (void)addRewrittenUtterancesMetadata:(id)a3
{
  id v4 = a3;
  rewrittenUtterancesMetadatas = self->_rewrittenUtterancesMetadatas;
  id v8 = v4;
  if (!rewrittenUtterancesMetadatas)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_rewrittenUtterancesMetadatas;
    self->_rewrittenUtterancesMetadatas = v6;

    id v4 = v8;
    rewrittenUtterancesMetadatas = self->_rewrittenUtterancesMetadatas;
  }
  [(NSArray *)rewrittenUtterancesMetadatas addObject:v4];
}

- (void)clearRewrittenUtterancesMetadata
{
}

- (void)deleteWasRewrittenUtteranceUsed
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasWasRewrittenUtteranceUsed:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasWasRewrittenUtteranceUsed
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWasRewrittenUtteranceUsed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int wasRewrittenUtteranceUsed = a3;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end