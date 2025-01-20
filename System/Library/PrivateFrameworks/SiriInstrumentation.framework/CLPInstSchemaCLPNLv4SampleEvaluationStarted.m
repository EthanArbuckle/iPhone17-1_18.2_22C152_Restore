@interface CLPInstSchemaCLPNLv4SampleEvaluationStarted
- (BOOL)hasBatchChunkId;
- (BOOL)hasBatchNumChunks;
- (BOOL)hasSyntheticRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLPInstSchemaCLPNLv4SampleEvaluationStarted)initWithDictionary:(id)a3;
- (CLPInstSchemaCLPNLv4SampleEvaluationStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)syntheticRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)batchChunkId;
- (unsigned)batchNumChunks;
- (void)deleteBatchChunkId;
- (void)deleteBatchNumChunks;
- (void)deleteSyntheticRequestId;
- (void)setBatchChunkId:(unsigned int)a3;
- (void)setBatchNumChunks:(unsigned int)a3;
- (void)setHasBatchChunkId:(BOOL)a3;
- (void)setHasBatchNumChunks:(BOOL)a3;
- (void)setHasSyntheticRequestId:(BOOL)a3;
- (void)setSyntheticRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPInstSchemaCLPNLv4SampleEvaluationStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLPInstSchemaCLPNLv4SampleEvaluationStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(CLPInstSchemaCLPNLv4SampleEvaluationStarted *)self syntheticRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(CLPInstSchemaCLPNLv4SampleEvaluationStarted *)self deleteSyntheticRequestId];
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
}

- (void)setHasSyntheticRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setSyntheticRequestId:(id)a3
{
}

- (SISchemaUUID)syntheticRequestId
{
  return self->_syntheticRequestId;
}

- (unsigned)batchChunkId
{
  return self->_batchChunkId;
}

- (unsigned)batchNumChunks
{
  return self->_batchNumChunks;
}

- (CLPInstSchemaCLPNLv4SampleEvaluationStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLPInstSchemaCLPNLv4SampleEvaluationStarted;
  v5 = [(CLPInstSchemaCLPNLv4SampleEvaluationStarted *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"batchNumChunks"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4SampleEvaluationStarted setBatchNumChunks:](v5, "setBatchNumChunks:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"batchChunkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CLPInstSchemaCLPNLv4SampleEvaluationStarted setBatchChunkId:](v5, "setBatchChunkId:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"syntheticRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(CLPInstSchemaCLPNLv4SampleEvaluationStarted *)v5 setSyntheticRequestId:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (CLPInstSchemaCLPNLv4SampleEvaluationStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CLPInstSchemaCLPNLv4SampleEvaluationStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CLPInstSchemaCLPNLv4SampleEvaluationStarted *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CLPInstSchemaCLPNLv4SampleEvaluationStarted batchChunkId](self, "batchChunkId"));
    [v3 setObject:v5 forKeyedSubscript:@"batchChunkId"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CLPInstSchemaCLPNLv4SampleEvaluationStarted batchNumChunks](self, "batchNumChunks"));
    [v3 setObject:v6 forKeyedSubscript:@"batchNumChunks"];
  }
  if (self->_syntheticRequestId)
  {
    uint64_t v7 = [(CLPInstSchemaCLPNLv4SampleEvaluationStarted *)self syntheticRequestId];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"syntheticRequestId"];
    }
    else
    {
      objc_super v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"syntheticRequestId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_batchNumChunks;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(SISchemaUUID *)self->_syntheticRequestId hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_batchChunkId;
  return v3 ^ v2 ^ [(SISchemaUUID *)self->_syntheticRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $194062262D93EA6A2D456AE6314F4529 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int batchNumChunks = self->_batchNumChunks;
    if (batchNumChunks != [v4 batchNumChunks]) {
      goto LABEL_14;
    }
    $194062262D93EA6A2D456AE6314F4529 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8 || (unsigned int batchChunkId = self->_batchChunkId, batchChunkId == [v4 batchChunkId]))
    {
      v10 = [(CLPInstSchemaCLPNLv4SampleEvaluationStarted *)self syntheticRequestId];
      v11 = [v4 syntheticRequestId];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(CLPInstSchemaCLPNLv4SampleEvaluationStarted *)self syntheticRequestId];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(CLPInstSchemaCLPNLv4SampleEvaluationStarted *)self syntheticRequestId];
        v16 = [v4 syntheticRequestId];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  v5 = [(CLPInstSchemaCLPNLv4SampleEvaluationStarted *)self syntheticRequestId];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(CLPInstSchemaCLPNLv4SampleEvaluationStarted *)self syntheticRequestId];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CLPInstSchemaCLPNLv4SampleEvaluationStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteSyntheticRequestId
{
}

- (BOOL)hasSyntheticRequestId
{
  return self->_syntheticRequestId != 0;
}

- (void)deleteBatchChunkId
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasBatchChunkId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBatchChunkId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBatchChunkId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int batchChunkId = a3;
}

- (void)deleteBatchNumChunks
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasBatchNumChunks:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBatchNumChunks
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBatchNumChunks:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int batchNumChunks = a3;
}

@end