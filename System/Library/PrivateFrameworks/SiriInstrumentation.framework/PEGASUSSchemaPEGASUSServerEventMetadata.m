@interface PEGASUSSchemaPEGASUSServerEventMetadata
- (BOOL)hasPegasusId;
- (BOOL)hasResultCandidateId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)resultCandidateId;
- (PEGASUSSchemaPEGASUSServerEventMetadata)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSServerEventMetadata)initWithJSON:(id)a3;
- (SISchemaUUID)pegasusId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deletePegasusId;
- (void)deleteResultCandidateId;
- (void)setHasPegasusId:(BOOL)a3;
- (void)setHasResultCandidateId:(BOOL)a3;
- (void)setPegasusId:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSServerEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PEGASUSSchemaPEGASUSServerEventMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self pegasusId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PEGASUSSchemaPEGASUSServerEventMetadata *)self deletePegasusId];
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
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_pegasusId, 0);
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  self->_hasResultCandidateId = a3;
}

- (void)setHasPegasusId:(BOOL)a3
{
  self->_hasPegasusId = a3;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setPegasusId:(id)a3
{
}

- (SISchemaUUID)pegasusId
{
  return self->_pegasusId;
}

- (PEGASUSSchemaPEGASUSServerEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PEGASUSSchemaPEGASUSServerEventMetadata;
  v5 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"pegasusId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PEGASUSSchemaPEGASUSServerEventMetadata *)v5 setPegasusId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(PEGASUSSchemaPEGASUSServerEventMetadata *)v5 setResultCandidateId:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSServerEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self dictionaryRepresentation];
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
  if (self->_pegasusId)
  {
    id v4 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self pegasusId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"pegasusId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"pegasusId"];
    }
  }
  if (self->_resultCandidateId)
  {
    uint64_t v7 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self resultCandidateId];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"resultCandidateId"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_pegasusId hash];
  return [(NSString *)self->_resultCandidateId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self pegasusId];
  v6 = [v4 pegasusId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self pegasusId];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self pegasusId];
    v10 = [v4 pegasusId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self resultCandidateId];
  v6 = [v4 resultCandidateId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self resultCandidateId];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self resultCandidateId];
    v15 = [v4 resultCandidateId];
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
  id v7 = a3;
  id v4 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self pegasusId];

  if (v4)
  {
    v5 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self pegasusId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self resultCandidateId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSServerEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteResultCandidateId
{
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deletePegasusId
{
}

- (BOOL)hasPegasusId
{
  return self->_pegasusId != 0;
}

@end