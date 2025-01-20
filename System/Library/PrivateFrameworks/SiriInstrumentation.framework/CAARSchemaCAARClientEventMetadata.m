@interface CAARSchemaCAARClientEventMetadata
- (BOOL)hasCaarId;
- (BOOL)hasRequestId;
- (BOOL)hasResultCandidateId;
- (BOOL)hasSubRequestId;
- (BOOL)hasTrpId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CAARSchemaCAARClientEventMetadata)initWithDictionary:(id)a3;
- (CAARSchemaCAARClientEventMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)resultCandidateId;
- (SISchemaUUID)caarId;
- (SISchemaUUID)requestId;
- (SISchemaUUID)subRequestId;
- (SISchemaUUID)trpId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteCaarId;
- (void)deleteRequestId;
- (void)deleteResultCandidateId;
- (void)deleteSubRequestId;
- (void)deleteTrpId;
- (void)setCaarId:(id)a3;
- (void)setHasCaarId:(BOOL)a3;
- (void)setHasRequestId:(BOOL)a3;
- (void)setHasResultCandidateId:(BOOL)a3;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setHasTrpId:(BOOL)a3;
- (void)setRequestId:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setSubRequestId:(id)a3;
- (void)setTrpId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAARSchemaCAARClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CAARSchemaCAARClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(CAARSchemaCAARClientEventMetadata *)self caarId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CAARSchemaCAARClientEventMetadata *)self deleteCaarId];
  }
  v9 = [(CAARSchemaCAARClientEventMetadata *)self requestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CAARSchemaCAARClientEventMetadata *)self deleteRequestId];
  }
  v12 = [(CAARSchemaCAARClientEventMetadata *)self trpId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CAARSchemaCAARClientEventMetadata *)self deleteTrpId];
  }
  v15 = [(CAARSchemaCAARClientEventMetadata *)self subRequestId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(CAARSchemaCAARClientEventMetadata *)self deleteSubRequestId];
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
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_caarId, 0);
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

- (void)setHasResultCandidateId:(BOOL)a3
{
  self->_hasResultCandidateId = a3;
}

- (void)setHasCaarId:(BOOL)a3
{
  self->_hasCaarId = a3;
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

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setCaarId:(id)a3
{
}

- (SISchemaUUID)caarId
{
  return self->_caarId;
}

- (CAARSchemaCAARClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAARSchemaCAARClientEventMetadata;
  v5 = [(CAARSchemaCAARClientEventMetadata *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"caarId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(CAARSchemaCAARClientEventMetadata *)v5 setCaarId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(CAARSchemaCAARClientEventMetadata *)v5 setResultCandidateId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(CAARSchemaCAARClientEventMetadata *)v5 setRequestId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"trpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(CAARSchemaCAARClientEventMetadata *)v5 setTrpId:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"subRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaUUID alloc] initWithDictionary:v14];
      [(CAARSchemaCAARClientEventMetadata *)v5 setSubRequestId:v15];
    }
    v16 = v5;
  }
  return v5;
}

- (CAARSchemaCAARClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAARSchemaCAARClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAARSchemaCAARClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_caarId)
  {
    id v4 = [(CAARSchemaCAARClientEventMetadata *)self caarId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"caarId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"caarId"];
    }
  }
  if (self->_requestId)
  {
    uint64_t v7 = [(CAARSchemaCAARClientEventMetadata *)self requestId];
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
    v10 = [(CAARSchemaCAARClientEventMetadata *)self resultCandidateId];
    int v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"resultCandidateId"];
  }
  if (self->_subRequestId)
  {
    v12 = [(CAARSchemaCAARClientEventMetadata *)self subRequestId];
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
  if (self->_trpId)
  {
    v15 = [(CAARSchemaCAARClientEventMetadata *)self trpId];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"trpId"];
    }
    else
    {
      int v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"trpId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_caarId hash];
  NSUInteger v4 = [(NSString *)self->_resultCandidateId hash] ^ v3;
  unint64_t v5 = [(SISchemaUUID *)self->_requestId hash];
  unint64_t v6 = v4 ^ v5 ^ [(SISchemaUUID *)self->_trpId hash];
  return v6 ^ [(SISchemaUUID *)self->_subRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  unint64_t v5 = [(CAARSchemaCAARClientEventMetadata *)self caarId];
  unint64_t v6 = [v4 caarId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(CAARSchemaCAARClientEventMetadata *)self caarId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(CAARSchemaCAARClientEventMetadata *)self caarId];
    v10 = [v4 caarId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAARSchemaCAARClientEventMetadata *)self resultCandidateId];
  unint64_t v6 = [v4 resultCandidateId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(CAARSchemaCAARClientEventMetadata *)self resultCandidateId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(CAARSchemaCAARClientEventMetadata *)self resultCandidateId];
    v15 = [v4 resultCandidateId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAARSchemaCAARClientEventMetadata *)self requestId];
  unint64_t v6 = [v4 requestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(CAARSchemaCAARClientEventMetadata *)self requestId];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    objc_super v19 = [(CAARSchemaCAARClientEventMetadata *)self requestId];
    v20 = [v4 requestId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAARSchemaCAARClientEventMetadata *)self trpId];
  unint64_t v6 = [v4 trpId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(CAARSchemaCAARClientEventMetadata *)self trpId];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(CAARSchemaCAARClientEventMetadata *)self trpId];
    v25 = [v4 trpId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  unint64_t v5 = [(CAARSchemaCAARClientEventMetadata *)self subRequestId];
  unint64_t v6 = [v4 subRequestId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(CAARSchemaCAARClientEventMetadata *)self subRequestId];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(CAARSchemaCAARClientEventMetadata *)self subRequestId];
    v30 = [v4 subRequestId];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  id v4 = [(CAARSchemaCAARClientEventMetadata *)self caarId];

  if (v4)
  {
    unint64_t v5 = [(CAARSchemaCAARClientEventMetadata *)self caarId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(CAARSchemaCAARClientEventMetadata *)self resultCandidateId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(CAARSchemaCAARClientEventMetadata *)self requestId];

  if (v7)
  {
    int v8 = [(CAARSchemaCAARClientEventMetadata *)self requestId];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(CAARSchemaCAARClientEventMetadata *)self trpId];

  if (v9)
  {
    v10 = [(CAARSchemaCAARClientEventMetadata *)self trpId];
    PBDataWriterWriteSubmessage();
  }
  int v11 = [(CAARSchemaCAARClientEventMetadata *)self subRequestId];

  if (v11)
  {
    uint64_t v12 = [(CAARSchemaCAARClientEventMetadata *)self subRequestId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAARSchemaCAARClientEventMetadataReadFrom(self, (uint64_t)a3);
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

- (void)deleteResultCandidateId
{
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteCaarId
{
}

- (BOOL)hasCaarId
{
  return self->_caarId != 0;
}

@end