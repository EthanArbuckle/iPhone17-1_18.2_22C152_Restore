@interface DODMLASRSchemaDODMLASRAudioFileResult
- (BOOL)hasAsrId;
- (BOOL)hasLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRAudioFileResult)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRAudioFileResult)initWithJSON:(id)a3;
- (NSArray)decodingResults;
- (NSData)jsonData;
- (SISchemaUUID)asrId;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)decodingResultsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)decodingResultsCount;
- (unint64_t)hash;
- (void)addDecodingResults:(id)a3;
- (void)clearDecodingResults;
- (void)deleteAsrId;
- (void)deleteLinkId;
- (void)setAsrId:(id)a3;
- (void)setDecodingResults:(id)a3;
- (void)setHasAsrId:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRAudioFileResult

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DODMLASRSchemaDODMLASRAudioFileResult;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self asrId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(DODMLASRSchemaDODMLASRAudioFileResult *)self deleteAsrId];
  }
  v9 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self decodingResults];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(DODMLASRSchemaDODMLASRAudioFileResult *)self setDecodingResults:v10];

  v11 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self linkId];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(DODMLASRSchemaDODMLASRAudioFileResult *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_decodingResults, 0);
  objc_storeStrong((id *)&self->_asrId, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasAsrId:(BOOL)a3
{
  self->_hasAsrId = a3;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setDecodingResults:(id)a3
{
}

- (NSArray)decodingResults
{
  return self->_decodingResults;
}

- (void)setAsrId:(id)a3
{
}

- (SISchemaUUID)asrId
{
  return self->_asrId;
}

- (DODMLASRSchemaDODMLASRAudioFileResult)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DODMLASRSchemaDODMLASRAudioFileResult;
  v5 = [(DODMLASRSchemaDODMLASRAudioFileResult *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"asrId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(DODMLASRSchemaDODMLASRAudioFileResult *)v5 setAsrId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"decodingResults"];
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
              objc_super v15 = [[DODMLASRSchemaDODMLASRDecodingResult alloc] initWithDictionary:v14];
              [(DODMLASRSchemaDODMLASRAudioFileResult *)v5 addDecodingResults:v15];
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
      [(DODMLASRSchemaDODMLASRAudioFileResult *)v5 setLinkId:v17];
    }
    v18 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRAudioFileResult)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRAudioFileResult *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self dictionaryRepresentation];
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
  if (self->_asrId)
  {
    id v4 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self asrId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"asrId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"asrId"];
    }
  }
  if ([(NSArray *)self->_decodingResults count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    int v8 = self->_decodingResults;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"decodingResults"];
  }
  if (self->_linkId)
  {
    objc_super v15 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self linkId];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"linkId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v19);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_asrId hash];
  uint64_t v4 = [(NSArray *)self->_decodingResults hash] ^ v3;
  return v4 ^ [(SISchemaUUID *)self->_linkId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self asrId];
  v6 = [v4 asrId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self asrId];
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t v9 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self asrId];
    uint64_t v10 = [v4 asrId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self decodingResults];
  v6 = [v4 decodingResults];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self decodingResults];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self decodingResults];
    objc_super v15 = [v4 decodingResults];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self linkId];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    long long v19 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self linkId];
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
  v5 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self asrId];

  if (v5)
  {
    v6 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self asrId];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_decodingResults;
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

  uint64_t v12 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self linkId];

  if (v12)
  {
    uint64_t v13 = [(DODMLASRSchemaDODMLASRAudioFileResult *)self linkId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRAudioFileResultReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (id)decodingResultsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_decodingResults objectAtIndexedSubscript:a3];
}

- (unint64_t)decodingResultsCount
{
  return [(NSArray *)self->_decodingResults count];
}

- (void)addDecodingResults:(id)a3
{
  id v4 = a3;
  decodingResults = self->_decodingResults;
  id v8 = v4;
  if (!decodingResults)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_decodingResults;
    self->_decodingResults = v6;

    id v4 = v8;
    decodingResults = self->_decodingResults;
  }
  [(NSArray *)decodingResults addObject:v4];
}

- (void)clearDecodingResults
{
}

- (void)deleteAsrId
{
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

@end