@interface FLOWSchemaFLOWEventMetadata
- (BOOL)hasFlowId;
- (BOOL)hasRequestId;
- (BOOL)hasResultCandidateId;
- (BOOL)hasSubRequestId;
- (BOOL)hasTaskId;
- (BOOL)hasTrpId;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWEventMetadata)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWEventMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)resultCandidateId;
- (SISchemaUUID)flowId;
- (SISchemaUUID)requestId;
- (SISchemaUUID)subRequestId;
- (SISchemaUUID)taskId;
- (SISchemaUUID)trpId;
- (SISchemaVersion)version;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteFlowId;
- (void)deleteRequestId;
- (void)deleteResultCandidateId;
- (void)deleteSubRequestId;
- (void)deleteTaskId;
- (void)deleteTrpId;
- (void)deleteVersion;
- (void)setFlowId:(id)a3;
- (void)setHasFlowId:(BOOL)a3;
- (void)setHasRequestId:(BOOL)a3;
- (void)setHasResultCandidateId:(BOOL)a3;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setHasTaskId:(BOOL)a3;
- (void)setHasTrpId:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setRequestId:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setSubRequestId:(id)a3;
- (void)setTaskId:(id)a3;
- (void)setTrpId:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FLOWSchemaFLOWEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v25 applySensitiveConditionsPolicy:v4];
  v6 = [(FLOWSchemaFLOWEventMetadata *)self taskId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(FLOWSchemaFLOWEventMetadata *)self deleteTaskId];
  }
  v9 = [(FLOWSchemaFLOWEventMetadata *)self version];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(FLOWSchemaFLOWEventMetadata *)self deleteVersion];
  }
  v12 = [(FLOWSchemaFLOWEventMetadata *)self flowId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(FLOWSchemaFLOWEventMetadata *)self deleteFlowId];
  }
  v15 = [(FLOWSchemaFLOWEventMetadata *)self requestId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(FLOWSchemaFLOWEventMetadata *)self deleteRequestId];
  }
  v18 = [(FLOWSchemaFLOWEventMetadata *)self trpId];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(FLOWSchemaFLOWEventMetadata *)self deleteTrpId];
  }
  v21 = [(FLOWSchemaFLOWEventMetadata *)self subRequestId];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(FLOWSchemaFLOWEventMetadata *)self deleteSubRequestId];
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
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_flowId, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasSubRequestId = a3;
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasTrpId = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  self->_hasRequestId = a3;
}

- (void)setHasFlowId:(BOOL)a3
{
  self->_hasFlowId = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  self->_hasResultCandidateId = a3;
}

- (void)setHasTaskId:(BOOL)a3
{
  self->_hasTaskId = a3;
}

- (void)setSubRequestId:(id)a3
{
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (void)setTrpId:(id)a3
{
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (void)setRequestId:(id)a3
{
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setFlowId:(id)a3
{
}

- (SISchemaUUID)flowId
{
  return self->_flowId;
}

- (void)setVersion:(id)a3
{
}

- (SISchemaVersion)version
{
  return self->_version;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setTaskId:(id)a3
{
}

- (SISchemaUUID)taskId
{
  return self->_taskId;
}

- (FLOWSchemaFLOWEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FLOWSchemaFLOWEventMetadata;
  v5 = [(FLOWSchemaFLOWEventMetadata *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"taskId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(FLOWSchemaFLOWEventMetadata *)v5 setTaskId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(FLOWSchemaFLOWEventMetadata *)v5 setResultCandidateId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaVersion alloc] initWithDictionary:v10];
      [(FLOWSchemaFLOWEventMetadata *)v5 setVersion:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"flowId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(FLOWSchemaFLOWEventMetadata *)v5 setFlowId:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
      [(FLOWSchemaFLOWEventMetadata *)v5 setRequestId:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"trpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[SISchemaUUID alloc] initWithDictionary:v16];
      [(FLOWSchemaFLOWEventMetadata *)v5 setTrpId:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"subRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[SISchemaUUID alloc] initWithDictionary:v18];
      [(FLOWSchemaFLOWEventMetadata *)v5 setSubRequestId:v19];
    }
    int v20 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWEventMetadata *)self dictionaryRepresentation];
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
  if (self->_flowId)
  {
    id v4 = [(FLOWSchemaFLOWEventMetadata *)self flowId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"flowId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"flowId"];
    }
  }
  if (self->_requestId)
  {
    uint64_t v7 = [(FLOWSchemaFLOWEventMetadata *)self requestId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"requestId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"requestId"];
    }
  }
  if (self->_resultCandidateId)
  {
    v10 = [(FLOWSchemaFLOWEventMetadata *)self resultCandidateId];
    int v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"resultCandidateId"];
  }
  if (self->_subRequestId)
  {
    v12 = [(FLOWSchemaFLOWEventMetadata *)self subRequestId];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"subRequestId"];
    }
    else
    {
      int v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"subRequestId"];
    }
  }
  if (self->_taskId)
  {
    v15 = [(FLOWSchemaFLOWEventMetadata *)self taskId];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"taskId"];
    }
    else
    {
      int v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"taskId"];
    }
  }
  if (self->_trpId)
  {
    v18 = [(FLOWSchemaFLOWEventMetadata *)self trpId];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"trpId"];
    }
    else
    {
      int v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"trpId"];
    }
  }
  if (self->_version)
  {
    v21 = [(FLOWSchemaFLOWEventMetadata *)self version];
    objc_super v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"version"];
    }
    else
    {
      int v23 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v23 forKeyedSubscript:@"version"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_taskId hash];
  NSUInteger v4 = [(NSString *)self->_resultCandidateId hash] ^ v3;
  unint64_t v5 = [(SISchemaVersion *)self->_version hash];
  unint64_t v6 = v4 ^ v5 ^ [(SISchemaUUID *)self->_flowId hash];
  unint64_t v7 = [(SISchemaUUID *)self->_requestId hash];
  unint64_t v8 = v7 ^ [(SISchemaUUID *)self->_trpId hash];
  return v6 ^ v8 ^ [(SISchemaUUID *)self->_subRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  unint64_t v5 = [(FLOWSchemaFLOWEventMetadata *)self taskId];
  unint64_t v6 = [v4 taskId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(FLOWSchemaFLOWEventMetadata *)self taskId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(FLOWSchemaFLOWEventMetadata *)self taskId];
    v10 = [v4 taskId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(FLOWSchemaFLOWEventMetadata *)self resultCandidateId];
  unint64_t v6 = [v4 resultCandidateId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(FLOWSchemaFLOWEventMetadata *)self resultCandidateId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(FLOWSchemaFLOWEventMetadata *)self resultCandidateId];
    v15 = [v4 resultCandidateId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(FLOWSchemaFLOWEventMetadata *)self version];
  unint64_t v6 = [v4 version];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v17 = [(FLOWSchemaFLOWEventMetadata *)self version];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(FLOWSchemaFLOWEventMetadata *)self version];
    int v20 = [v4 version];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(FLOWSchemaFLOWEventMetadata *)self flowId];
  unint64_t v6 = [v4 flowId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v22 = [(FLOWSchemaFLOWEventMetadata *)self flowId];
  if (v22)
  {
    int v23 = (void *)v22;
    v24 = [(FLOWSchemaFLOWEventMetadata *)self flowId];
    objc_super v25 = [v4 flowId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(FLOWSchemaFLOWEventMetadata *)self requestId];
  unint64_t v6 = [v4 requestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v27 = [(FLOWSchemaFLOWEventMetadata *)self requestId];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(FLOWSchemaFLOWEventMetadata *)self requestId];
    v30 = [v4 requestId];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(FLOWSchemaFLOWEventMetadata *)self trpId];
  unint64_t v6 = [v4 trpId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v32 = [(FLOWSchemaFLOWEventMetadata *)self trpId];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(FLOWSchemaFLOWEventMetadata *)self trpId];
    v35 = [v4 trpId];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(FLOWSchemaFLOWEventMetadata *)self subRequestId];
  unint64_t v6 = [v4 subRequestId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v37 = [(FLOWSchemaFLOWEventMetadata *)self subRequestId];
    if (!v37)
    {

LABEL_40:
      BOOL v42 = 1;
      goto LABEL_38;
    }
    v38 = (void *)v37;
    v39 = [(FLOWSchemaFLOWEventMetadata *)self subRequestId];
    v40 = [v4 subRequestId];
    char v41 = [v39 isEqual:v40];

    if (v41) {
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
  }
LABEL_37:
  BOOL v42 = 0;
LABEL_38:

  return v42;
}

- (void)writeTo:(id)a3
{
  id v17 = a3;
  id v4 = [(FLOWSchemaFLOWEventMetadata *)self taskId];

  if (v4)
  {
    unint64_t v5 = [(FLOWSchemaFLOWEventMetadata *)self taskId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(FLOWSchemaFLOWEventMetadata *)self resultCandidateId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(FLOWSchemaFLOWEventMetadata *)self version];

  if (v7)
  {
    unint64_t v8 = [(FLOWSchemaFLOWEventMetadata *)self version];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(FLOWSchemaFLOWEventMetadata *)self flowId];

  if (v9)
  {
    v10 = [(FLOWSchemaFLOWEventMetadata *)self flowId];
    PBDataWriterWriteSubmessage();
  }
  int v11 = [(FLOWSchemaFLOWEventMetadata *)self requestId];

  if (v11)
  {
    uint64_t v12 = [(FLOWSchemaFLOWEventMetadata *)self requestId];
    PBDataWriterWriteSubmessage();
  }
  v13 = [(FLOWSchemaFLOWEventMetadata *)self trpId];

  if (v13)
  {
    int v14 = [(FLOWSchemaFLOWEventMetadata *)self trpId];
    PBDataWriterWriteSubmessage();
  }
  v15 = [(FLOWSchemaFLOWEventMetadata *)self subRequestId];

  if (v15)
  {
    int v16 = [(FLOWSchemaFLOWEventMetadata *)self subRequestId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteSubRequestId
{
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteTrpId
{
}

- (BOOL)hasTrpId
{
  return self->_trpId != 0;
}

- (void)deleteRequestId
{
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)deleteFlowId
{
}

- (BOOL)hasFlowId
{
  return self->_flowId != 0;
}

- (void)deleteVersion
{
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (void)deleteResultCandidateId
{
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteTaskId
{
}

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

@end