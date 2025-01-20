@interface DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults
- (BOOL)hasAsrId;
- (BOOL)hasDatapackVersion;
- (BOOL)hasErrorCode;
- (BOOL)hasLinkId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults)initWithDictionary:(id)a3;
- (DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults)initWithJSON:(id)a3;
- (NSArray)confusionPairs;
- (NSData)jsonData;
- (NSString)datapackVersion;
- (SISchemaUUID)asrId;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)confusionPairsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)errorCode;
- (unint64_t)confusionPairsCount;
- (unint64_t)hash;
- (void)addConfusionPairs:(id)a3;
- (void)clearConfusionPairs;
- (void)deleteAsrId;
- (void)deleteDatapackVersion;
- (void)deleteErrorCode;
- (void)deleteLinkId;
- (void)setAsrId:(id)a3;
- (void)setConfusionPairs:(id)a3;
- (void)setDatapackVersion:(id)a3;
- (void)setErrorCode:(int)a3;
- (void)setHasAsrId:(BOOL)a3;
- (void)setHasDatapackVersion:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setLinkId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self confusionPairs];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];
  [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self setConfusionPairs:v7];

  v8 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self asrId];
  v9 = [v8 applySensitiveConditionsPolicy:v4];
  int v10 = [v9 suppressMessage];

  if (v10) {
    [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self deleteAsrId];
  }
  v11 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self linkId];
  v12 = [v11 applySensitiveConditionsPolicy:v4];
  int v13 = [v12 suppressMessage];

  if (v13) {
    [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_asrId, 0);
  objc_storeStrong((id *)&self->_confusionPairs, 0);
  objc_storeStrong((id *)&self->_datapackVersion, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasAsrId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasDatapackVersion:(BOOL)a3
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

- (int)errorCode
{
  return self->_errorCode;
}

- (void)setAsrId:(id)a3
{
}

- (SISchemaUUID)asrId
{
  return self->_asrId;
}

- (void)setConfusionPairs:(id)a3
{
}

- (NSArray)confusionPairs
{
  return self->_confusionPairs;
}

- (void)setDatapackVersion:(id)a3
{
}

- (NSString)datapackVersion
{
  return self->_datapackVersion;
}

- (DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults)initWithDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults;
  v5 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"datapackVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)v5 setDatapackVersion:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"confusionPairs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = v6;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_super v15 = [[DODMLASRSchemaDODMLASRConfusionPair alloc] initWithDictionary:v14];
              [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)v5 addConfusionPairs:v15];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v11);
      }

      v6 = v23;
    }
    v16 = [v4 objectForKeyedSubscript:@"asrId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [[SISchemaUUID alloc] initWithDictionary:v16];
      [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)v5 setAsrId:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults setErrorCode:](v5, "setErrorCode:", [v18 intValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[SISchemaUUID alloc] initWithDictionary:v19];
      [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)v5 setLinkId:v20];
    }
    v21 = v5;
  }
  return v5;
}

- (DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self dictionaryRepresentation];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_asrId)
  {
    id v4 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self asrId];
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
  if ([(NSArray *)self->_confusionPairs count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v8 = self->_confusionPairs;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (void)v22);
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
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"confusionPairs"];
  }
  if (self->_datapackVersion)
  {
    objc_super v15 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self datapackVersion];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"datapackVersion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v17 = objc_msgSend(NSNumber, "numberWithInt:", -[DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults errorCode](self, "errorCode"));
    [v3 setObject:v17 forKeyedSubscript:@"errorCode"];
  }
  if (self->_linkId)
  {
    v18 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self linkId];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"linkId"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v22);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_datapackVersion hash];
  uint64_t v4 = [(NSArray *)self->_confusionPairs hash];
  unint64_t v5 = [(SISchemaUUID *)self->_asrId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(SISchemaUUID *)self->_linkId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  unint64_t v5 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self datapackVersion];
  uint64_t v6 = [v4 datapackVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v7 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self datapackVersion];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self datapackVersion];
    uint64_t v10 = [v4 datapackVersion];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v5 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self confusionPairs];
  uint64_t v6 = [v4 confusionPairs];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v12 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self confusionPairs];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self confusionPairs];
    objc_super v15 = [v4 confusionPairs];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  unint64_t v5 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self asrId];
  uint64_t v6 = [v4 asrId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v17 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self asrId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self asrId];
    v20 = [v4 asrId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    int errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
      goto LABEL_25;
    }
  }
  unint64_t v5 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self linkId];
  uint64_t v6 = [v4 linkId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v23 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self linkId];
    if (!v23)
    {

LABEL_28:
      BOOL v28 = 1;
      goto LABEL_26;
    }
    long long v24 = (void *)v23;
    long long v25 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self linkId];
    long long v26 = [v4 linkId];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_24:
  }
LABEL_25:
  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self datapackVersion];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_confusionPairs;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  int v11 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self asrId];

  if (v11)
  {
    uint64_t v12 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self asrId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self linkId];

  if (v13)
  {
    uint64_t v14 = [(DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResults *)self linkId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return DODMLASRSchemaDODMLASRUserEditExperimentRedecodingResultsReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int errorCode = a3;
}

- (void)deleteAsrId
{
}

- (BOOL)hasAsrId
{
  return self->_asrId != 0;
}

- (id)confusionPairsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_confusionPairs objectAtIndexedSubscript:a3];
}

- (unint64_t)confusionPairsCount
{
  return [(NSArray *)self->_confusionPairs count];
}

- (void)addConfusionPairs:(id)a3
{
  id v4 = a3;
  confusionPairs = self->_confusionPairs;
  id v8 = v4;
  if (!confusionPairs)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_confusionPairs;
    self->_confusionPairs = v6;

    id v4 = v8;
    confusionPairs = self->_confusionPairs;
  }
  [(NSArray *)confusionPairs addObject:v4];
}

- (void)clearConfusionPairs
{
}

- (void)deleteDatapackVersion
{
}

- (BOOL)hasDatapackVersion
{
  return self->_datapackVersion != 0;
}

@end