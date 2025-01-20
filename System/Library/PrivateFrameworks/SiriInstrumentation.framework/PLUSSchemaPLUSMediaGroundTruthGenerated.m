@interface PLUSSchemaPLUSMediaGroundTruthGenerated
- (BOOL)hasGroundTruth;
- (BOOL)hasOriginalRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSMediaGroundTruth)groundTruth;
- (PLUSSchemaPLUSMediaGroundTruthGenerated)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSMediaGroundTruthGenerated)initWithJSON:(id)a3;
- (SISchemaUUID)originalRequestId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteGroundTruth;
- (void)deleteOriginalRequestId;
- (void)setGroundTruth:(id)a3;
- (void)setHasGroundTruth:(BOOL)a3;
- (void)setHasOriginalRequestId:(BOOL)a3;
- (void)setOriginalRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSMediaGroundTruthGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLUSSchemaPLUSMediaGroundTruthGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self originalRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self deleteOriginalRequestId];
  }
  v9 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self groundTruth];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self deleteGroundTruth];
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
  objc_storeStrong((id *)&self->_groundTruth, 0);
  objc_storeStrong((id *)&self->_originalRequestId, 0);
}

- (void)setHasGroundTruth:(BOOL)a3
{
  self->_hasGroundTruth = a3;
}

- (void)setHasOriginalRequestId:(BOOL)a3
{
  self->_hasOriginalRequestId = a3;
}

- (void)setGroundTruth:(id)a3
{
}

- (PLUSSchemaPLUSMediaGroundTruth)groundTruth
{
  return self->_groundTruth;
}

- (void)setOriginalRequestId:(id)a3
{
}

- (SISchemaUUID)originalRequestId
{
  return self->_originalRequestId;
}

- (PLUSSchemaPLUSMediaGroundTruthGenerated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSMediaGroundTruthGenerated;
  v5 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSMediaGroundTruthGenerated *)v5 setOriginalRequestId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"groundTruth"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PLUSSchemaPLUSMediaGroundTruth alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSMediaGroundTruthGenerated *)v5 setGroundTruth:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSMediaGroundTruthGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self dictionaryRepresentation];
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
  if (self->_groundTruth)
  {
    id v4 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self groundTruth];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"groundTruth"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"groundTruth"];
    }
  }
  if (self->_originalRequestId)
  {
    uint64_t v7 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self originalRequestId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"originalRequestId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"originalRequestId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalRequestId hash];
  return [(PLUSSchemaPLUSMediaGroundTruth *)self->_groundTruth hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self originalRequestId];
  v6 = [v4 originalRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self originalRequestId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self originalRequestId];
    v10 = [v4 originalRequestId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self groundTruth];
  v6 = [v4 groundTruth];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self groundTruth];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self groundTruth];
    v15 = [v4 groundTruth];
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
  id v8 = a3;
  id v4 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self originalRequestId];

  if (v4)
  {
    v5 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self originalRequestId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self groundTruth];

  if (v6)
  {
    uint64_t v7 = [(PLUSSchemaPLUSMediaGroundTruthGenerated *)self groundTruth];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSMediaGroundTruthGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteGroundTruth
{
}

- (BOOL)hasGroundTruth
{
  return self->_groundTruth != 0;
}

- (void)deleteOriginalRequestId
{
}

- (BOOL)hasOriginalRequestId
{
  return self->_originalRequestId != 0;
}

@end