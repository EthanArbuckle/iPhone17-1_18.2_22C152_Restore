@interface CAMSchemaCAMClientEventMetadata
- (BOOL)hasCamId;
- (BOOL)hasFeature;
- (BOOL)hasRequestId;
- (BOOL)hasResultCandidateId;
- (BOOL)hasSubRequestId;
- (BOOL)hasTrpId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CAMSchemaCAMClientEventMetadata)initWithDictionary:(id)a3;
- (CAMSchemaCAMClientEventMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)resultCandidateId;
- (SISchemaUUID)camId;
- (SISchemaUUID)requestId;
- (SISchemaUUID)subRequestId;
- (SISchemaUUID)trpId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)feature;
- (unint64_t)hash;
- (void)deleteCamId;
- (void)deleteFeature;
- (void)deleteRequestId;
- (void)deleteResultCandidateId;
- (void)deleteSubRequestId;
- (void)deleteTrpId;
- (void)setCamId:(id)a3;
- (void)setFeature:(int)a3;
- (void)setHasCamId:(BOOL)a3;
- (void)setHasFeature:(BOOL)a3;
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

@implementation CAMSchemaCAMClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CAMSchemaCAMClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(CAMSchemaCAMClientEventMetadata *)self camId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(CAMSchemaCAMClientEventMetadata *)self deleteCamId];
  }
  v9 = [(CAMSchemaCAMClientEventMetadata *)self requestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(CAMSchemaCAMClientEventMetadata *)self deleteRequestId];
  }
  v12 = [(CAMSchemaCAMClientEventMetadata *)self trpId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(CAMSchemaCAMClientEventMetadata *)self deleteTrpId];
  }
  v15 = [(CAMSchemaCAMClientEventMetadata *)self subRequestId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(CAMSchemaCAMClientEventMetadata *)self deleteSubRequestId];
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
  objc_storeStrong((id *)&self->_camId, 0);
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasResultCandidateId = a3;
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasCamId = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasCamId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
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

- (int)feature
{
  return self->_feature;
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (void)setCamId:(id)a3
{
}

- (SISchemaUUID)camId
{
  return self->_camId;
}

- (CAMSchemaCAMClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CAMSchemaCAMClientEventMetadata;
  v5 = [(CAMSchemaCAMClientEventMetadata *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"camId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(CAMSchemaCAMClientEventMetadata *)v5 setCamId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(CAMSchemaCAMClientEventMetadata *)v5 setResultCandidateId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"feature"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAMSchemaCAMClientEventMetadata setFeature:](v5, "setFeature:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[SISchemaUUID alloc] initWithDictionary:v11];
      [(CAMSchemaCAMClientEventMetadata *)v5 setRequestId:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"trpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [[SISchemaUUID alloc] initWithDictionary:v13];
      [(CAMSchemaCAMClientEventMetadata *)v5 setTrpId:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"subRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaUUID alloc] initWithDictionary:v15];
      [(CAMSchemaCAMClientEventMetadata *)v5 setSubRequestId:v16];
    }
    int v17 = v5;
  }
  return v5;
}

- (CAMSchemaCAMClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAMSchemaCAMClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAMSchemaCAMClientEventMetadata *)self dictionaryRepresentation];
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
  if (self->_camId)
  {
    id v4 = [(CAMSchemaCAMClientEventMetadata *)self camId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"camId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"camId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = [(CAMSchemaCAMClientEventMetadata *)self feature] - 1;
    if (v7 > 2) {
      int v8 = @"CAMFEATURE_UNKNOWN";
    }
    else {
      int v8 = off_1E5EACB50[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"feature"];
  }
  if (self->_requestId)
  {
    v9 = [(CAMSchemaCAMClientEventMetadata *)self requestId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"requestId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"requestId"];
    }
  }
  if (self->_resultCandidateId)
  {
    v12 = [(CAMSchemaCAMClientEventMetadata *)self resultCandidateId];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"resultCandidateId"];
  }
  if (self->_subRequestId)
  {
    int v14 = [(CAMSchemaCAMClientEventMetadata *)self subRequestId];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"subRequestId"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"subRequestId"];
    }
  }
  if (self->_trpId)
  {
    int v17 = [(CAMSchemaCAMClientEventMetadata *)self trpId];
    v18 = [v17 dictionaryRepresentation];
    if (v18)
    {
      [v3 setObject:v18 forKeyedSubscript:@"trpId"];
    }
    else
    {
      objc_super v19 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v19 forKeyedSubscript:@"trpId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_camId hash];
  NSUInteger v4 = [(NSString *)self->_resultCandidateId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_feature;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(SISchemaUUID *)self->_requestId hash];
  unint64_t v7 = [(SISchemaUUID *)self->_trpId hash];
  return v6 ^ v7 ^ [(SISchemaUUID *)self->_subRequestId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  uint64_t v5 = [(CAMSchemaCAMClientEventMetadata *)self camId];
  unint64_t v6 = [v4 camId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v7 = [(CAMSchemaCAMClientEventMetadata *)self camId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(CAMSchemaCAMClientEventMetadata *)self camId];
    v10 = [v4 camId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(CAMSchemaCAMClientEventMetadata *)self resultCandidateId];
  unint64_t v6 = [v4 resultCandidateId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v12 = [(CAMSchemaCAMClientEventMetadata *)self resultCandidateId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(CAMSchemaCAMClientEventMetadata *)self resultCandidateId];
    v15 = [v4 resultCandidateId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[56] & 1)) {
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    int feature = self->_feature;
    if (feature != [v4 feature]) {
      goto LABEL_30;
    }
  }
  uint64_t v5 = [(CAMSchemaCAMClientEventMetadata *)self requestId];
  unint64_t v6 = [v4 requestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v18 = [(CAMSchemaCAMClientEventMetadata *)self requestId];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(CAMSchemaCAMClientEventMetadata *)self requestId];
    v21 = [v4 requestId];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(CAMSchemaCAMClientEventMetadata *)self trpId];
  unint64_t v6 = [v4 trpId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v23 = [(CAMSchemaCAMClientEventMetadata *)self trpId];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(CAMSchemaCAMClientEventMetadata *)self trpId];
    v26 = [v4 trpId];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(CAMSchemaCAMClientEventMetadata *)self subRequestId];
  unint64_t v6 = [v4 subRequestId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v28 = [(CAMSchemaCAMClientEventMetadata *)self subRequestId];
    if (!v28)
    {

LABEL_33:
      BOOL v33 = 1;
      goto LABEL_31;
    }
    v29 = (void *)v28;
    v30 = [(CAMSchemaCAMClientEventMetadata *)self subRequestId];
    v31 = [v4 subRequestId];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_33;
    }
  }
  else
  {
LABEL_29:
  }
LABEL_30:
  BOOL v33 = 0;
LABEL_31:

  return v33;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  NSUInteger v4 = [(CAMSchemaCAMClientEventMetadata *)self camId];

  if (v4)
  {
    uint64_t v5 = [(CAMSchemaCAMClientEventMetadata *)self camId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(CAMSchemaCAMClientEventMetadata *)self resultCandidateId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(CAMSchemaCAMClientEventMetadata *)self requestId];

  if (v7)
  {
    int v8 = [(CAMSchemaCAMClientEventMetadata *)self requestId];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(CAMSchemaCAMClientEventMetadata *)self trpId];

  if (v9)
  {
    v10 = [(CAMSchemaCAMClientEventMetadata *)self trpId];
    PBDataWriterWriteSubmessage();
  }
  int v11 = [(CAMSchemaCAMClientEventMetadata *)self subRequestId];

  uint64_t v12 = v14;
  if (v11)
  {
    v13 = [(CAMSchemaCAMClientEventMetadata *)self subRequestId];
    PBDataWriterWriteSubmessage();

    uint64_t v12 = v14;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CAMSchemaCAMClientEventMetadataReadFrom(self, (uint64_t)a3);
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

- (void)deleteFeature
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasFeature:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeature
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFeature:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int feature = a3;
}

- (void)deleteResultCandidateId
{
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteCamId
{
}

- (BOOL)hasCamId
{
  return self->_camId != 0;
}

@end