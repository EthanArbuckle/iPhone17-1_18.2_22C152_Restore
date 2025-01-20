@interface SISchemaABExperimentAssetRetrievalStatusChanged
- (BOOL)hasAssetId;
- (BOOL)hasExperimentId;
- (BOOL)hasRetrievalStatusCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)assetId;
- (NSString)experimentId;
- (SISchemaABExperimentAssetRetrievalStatusChanged)initWithDictionary:(id)a3;
- (SISchemaABExperimentAssetRetrievalStatusChanged)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)retrievalStatusCode;
- (unint64_t)hash;
- (void)deleteAssetId;
- (void)deleteExperimentId;
- (void)deleteRetrievalStatusCode;
- (void)setAssetId:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setHasAssetId:(BOOL)a3;
- (void)setHasExperimentId:(BOOL)a3;
- (void)setHasRetrievalStatusCode:(BOOL)a3;
- (void)setRetrievalStatusCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaABExperimentAssetRetrievalStatusChanged

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
}

- (void)setHasAssetId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasExperimentId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)retrievalStatusCode
{
  return self->_retrievalStatusCode;
}

- (void)setAssetId:(id)a3
{
}

- (NSString)assetId
{
  return self->_assetId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (SISchemaABExperimentAssetRetrievalStatusChanged)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaABExperimentAssetRetrievalStatusChanged;
  v5 = [(SISchemaABExperimentAssetRetrievalStatusChanged *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"experimentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaABExperimentAssetRetrievalStatusChanged *)v5 setExperimentId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"assetId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(SISchemaABExperimentAssetRetrievalStatusChanged *)v5 setAssetId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"retrievalStatusCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaABExperimentAssetRetrievalStatusChanged setRetrievalStatusCode:](v5, "setRetrievalStatusCode:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (SISchemaABExperimentAssetRetrievalStatusChanged)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaABExperimentAssetRetrievalStatusChanged *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaABExperimentAssetRetrievalStatusChanged *)self dictionaryRepresentation];
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
  if (self->_assetId)
  {
    id v4 = [(SISchemaABExperimentAssetRetrievalStatusChanged *)self assetId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"assetId"];
  }
  if (self->_experimentId)
  {
    v6 = [(SISchemaABExperimentAssetRetrievalStatusChanged *)self experimentId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"experimentId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[SISchemaABExperimentAssetRetrievalStatusChanged retrievalStatusCode](self, "retrievalStatusCode"));
    [v3 setObject:v8 forKeyedSubscript:@"retrievalStatusCode"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_experimentId hash];
  NSUInteger v4 = [(NSString *)self->_assetId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_retrievalStatusCode;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(SISchemaABExperimentAssetRetrievalStatusChanged *)self experimentId];
  v6 = [v4 experimentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaABExperimentAssetRetrievalStatusChanged *)self experimentId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(SISchemaABExperimentAssetRetrievalStatusChanged *)self experimentId];
    v10 = [v4 experimentId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(SISchemaABExperimentAssetRetrievalStatusChanged *)self assetId];
  v6 = [v4 assetId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(SISchemaABExperimentAssetRetrievalStatusChanged *)self assetId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(SISchemaABExperimentAssetRetrievalStatusChanged *)self assetId];
    v15 = [v4 assetId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int retrievalStatusCode = self->_retrievalStatusCode,
          retrievalStatusCode == [v4 retrievalStatusCode]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  NSUInteger v4 = [(SISchemaABExperimentAssetRetrievalStatusChanged *)self experimentId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(SISchemaABExperimentAssetRetrievalStatusChanged *)self assetId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = v7;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteSint32Field();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaABExperimentAssetRetrievalStatusChangedReadFrom(self, (uint64_t)a3);
}

- (void)deleteRetrievalStatusCode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasRetrievalStatusCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRetrievalStatusCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRetrievalStatusCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int retrievalStatusCode = a3;
}

- (void)deleteAssetId
{
}

- (BOOL)hasAssetId
{
  return self->_assetId != 0;
}

- (void)deleteExperimentId
{
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

@end