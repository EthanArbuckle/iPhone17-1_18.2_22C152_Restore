@interface PLUSSchemaPLUSContactGroundTruthGenerated
- (BOOL)hasGroundTruth;
- (BOOL)hasOriginalPlusId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSContactGroundTruth)groundTruth;
- (PLUSSchemaPLUSContactGroundTruthGenerated)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSContactGroundTruthGenerated)initWithJSON:(id)a3;
- (SISchemaUUID)originalPlusId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteGroundTruth;
- (void)deleteOriginalPlusId;
- (void)setGroundTruth:(id)a3;
- (void)setHasGroundTruth:(BOOL)a3;
- (void)setHasOriginalPlusId:(BOOL)a3;
- (void)setOriginalPlusId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSContactGroundTruthGenerated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLUSSchemaPLUSContactGroundTruthGenerated;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self originalPlusId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSContactGroundTruthGenerated *)self deleteOriginalPlusId];
  }
  v9 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self groundTruth];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSContactGroundTruthGenerated *)self deleteGroundTruth];
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
  objc_storeStrong((id *)&self->_originalPlusId, 0);
}

- (void)setHasGroundTruth:(BOOL)a3
{
  self->_hasGroundTruth = a3;
}

- (void)setHasOriginalPlusId:(BOOL)a3
{
  self->_hasOriginalPlusId = a3;
}

- (void)setGroundTruth:(id)a3
{
}

- (PLUSSchemaPLUSContactGroundTruth)groundTruth
{
  return self->_groundTruth;
}

- (void)setOriginalPlusId:(id)a3
{
}

- (SISchemaUUID)originalPlusId
{
  return self->_originalPlusId;
}

- (PLUSSchemaPLUSContactGroundTruthGenerated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSContactGroundTruthGenerated;
  v5 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originalPlusId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSContactGroundTruthGenerated *)v5 setOriginalPlusId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"groundTruth"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PLUSSchemaPLUSContactGroundTruth alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSContactGroundTruthGenerated *)v5 setGroundTruth:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSContactGroundTruthGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self dictionaryRepresentation];
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
    id v4 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self groundTruth];
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
  if (self->_originalPlusId)
  {
    uint64_t v7 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self originalPlusId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"originalPlusId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"originalPlusId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_originalPlusId hash];
  return [(PLUSSchemaPLUSContactGroundTruth *)self->_groundTruth hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self originalPlusId];
  v6 = [v4 originalPlusId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self originalPlusId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self originalPlusId];
    v10 = [v4 originalPlusId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self groundTruth];
  v6 = [v4 groundTruth];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self groundTruth];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self groundTruth];
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
  id v4 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self originalPlusId];

  if (v4)
  {
    v5 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self originalPlusId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self groundTruth];

  if (v6)
  {
    uint64_t v7 = [(PLUSSchemaPLUSContactGroundTruthGenerated *)self groundTruth];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSContactGroundTruthGeneratedReadFrom(self, (uint64_t)a3);
}

- (void)deleteGroundTruth
{
}

- (BOOL)hasGroundTruth
{
  return self->_groundTruth != 0;
}

- (void)deleteOriginalPlusId
{
}

- (BOOL)hasOriginalPlusId
{
  return self->_originalPlusId != 0;
}

@end