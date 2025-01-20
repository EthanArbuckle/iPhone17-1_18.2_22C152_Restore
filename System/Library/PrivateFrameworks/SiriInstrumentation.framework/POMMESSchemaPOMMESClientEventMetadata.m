@interface POMMESSchemaPOMMESClientEventMetadata
- (BOOL)hasOriginProcess;
- (BOOL)hasPommesId;
- (BOOL)hasRequestId;
- (BOOL)hasResultCandidateId;
- (BOOL)hasSearchToolGlobalSearchResultId;
- (BOOL)hasSearchToolId;
- (BOOL)hasSubRequestId;
- (BOOL)hasTrpId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)resultCandidateId;
- (POMMESSchemaPOMMESClientEventMetadata)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESClientEventMetadata)initWithJSON:(id)a3;
- (SISchemaUUID)pommesId;
- (SISchemaUUID)requestId;
- (SISchemaUUID)searchToolId;
- (SISchemaUUID)subRequestId;
- (SISchemaUUID)trpId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)originProcess;
- (int)searchToolGlobalSearchResultId;
- (unint64_t)hash;
- (void)deleteOriginProcess;
- (void)deletePommesId;
- (void)deleteRequestId;
- (void)deleteResultCandidateId;
- (void)deleteSearchToolGlobalSearchResultId;
- (void)deleteSearchToolId;
- (void)deleteSubRequestId;
- (void)deleteTrpId;
- (void)setHasOriginProcess:(BOOL)a3;
- (void)setHasPommesId:(BOOL)a3;
- (void)setHasRequestId:(BOOL)a3;
- (void)setHasResultCandidateId:(BOOL)a3;
- (void)setHasSearchToolGlobalSearchResultId:(BOOL)a3;
- (void)setHasSearchToolId:(BOOL)a3;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setHasTrpId:(BOOL)a3;
- (void)setOriginProcess:(int)a3;
- (void)setPommesId:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setSearchToolGlobalSearchResultId:(int)a3;
- (void)setSearchToolId:(id)a3;
- (void)setSubRequestId:(id)a3;
- (void)setTrpId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESClientEventMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)POMMESSchemaPOMMESClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v22 applySensitiveConditionsPolicy:v4];
  v6 = [(POMMESSchemaPOMMESClientEventMetadata *)self pommesId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(POMMESSchemaPOMMESClientEventMetadata *)self deletePommesId];
  }
  v9 = [(POMMESSchemaPOMMESClientEventMetadata *)self requestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(POMMESSchemaPOMMESClientEventMetadata *)self deleteRequestId];
  }
  v12 = [(POMMESSchemaPOMMESClientEventMetadata *)self trpId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(POMMESSchemaPOMMESClientEventMetadata *)self deleteTrpId];
  }
  v15 = [(POMMESSchemaPOMMESClientEventMetadata *)self subRequestId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(POMMESSchemaPOMMESClientEventMetadata *)self deleteSubRequestId];
  }
  v18 = [(POMMESSchemaPOMMESClientEventMetadata *)self searchToolId];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(POMMESSchemaPOMMESClientEventMetadata *)self deleteSearchToolId];
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
  objc_storeStrong((id *)&self->_searchToolId, 0);
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_pommesId, 0);
}

- (void)setHasSearchToolId:(BOOL)a3
{
  self->_hasRequestId = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasResultCandidateId = a3;
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasPommesId = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasPommesId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)searchToolGlobalSearchResultId
{
  return self->_searchToolGlobalSearchResultId;
}

- (void)setSearchToolId:(id)a3
{
}

- (SISchemaUUID)searchToolId
{
  return self->_searchToolId;
}

- (void)setSubRequestId:(id)a3
{
}

- (SISchemaUUID)subRequestId
{
  return self->_subRequestId;
}

- (int)originProcess
{
  return self->_originProcess;
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

- (void)setPommesId:(id)a3
{
}

- (SISchemaUUID)pommesId
{
  return self->_pommesId;
}

- (POMMESSchemaPOMMESClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)POMMESSchemaPOMMESClientEventMetadata;
  v5 = [(POMMESSchemaPOMMESClientEventMetadata *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"pommesId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(POMMESSchemaPOMMESClientEventMetadata *)v5 setPommesId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(POMMESSchemaPOMMESClientEventMetadata *)v5 setResultCandidateId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(POMMESSchemaPOMMESClientEventMetadata *)v5 setRequestId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"trpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(POMMESSchemaPOMMESClientEventMetadata *)v5 setTrpId:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"originProcess"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESClientEventMetadata setOriginProcess:](v5, "setOriginProcess:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"subRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaUUID alloc] initWithDictionary:v15];
      [(POMMESSchemaPOMMESClientEventMetadata *)v5 setSubRequestId:v16];
    }
    int v17 = [v4 objectForKeyedSubscript:@"searchToolId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[SISchemaUUID alloc] initWithDictionary:v17];
      [(POMMESSchemaPOMMESClientEventMetadata *)v5 setSearchToolId:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"searchToolGlobalSearchResultId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESClientEventMetadata setSearchToolGlobalSearchResultId:](v5, "setSearchToolGlobalSearchResultId:", [v19 intValue]);
    }
    int v20 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESClientEventMetadata *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    int v4 = [(POMMESSchemaPOMMESClientEventMetadata *)self originProcess];
    v5 = @"POMMESCLIENTORIGINPROCESS_UNKNOWN";
    if (v4 == 1) {
      v5 = @"POMMESCLIENTORIGINPROCESS_SIRI";
    }
    if (v4 == 2) {
      v6 = @"POMMESCLIENTORIGINPROCESS_MAINTENANCE";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"originProcess"];
  }
  if (self->_pommesId)
  {
    uint64_t v7 = [(POMMESSchemaPOMMESClientEventMetadata *)self pommesId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"pommesId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"pommesId"];
    }
  }
  if (self->_requestId)
  {
    v10 = [(POMMESSchemaPOMMESClientEventMetadata *)self requestId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"requestId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"requestId"];
    }
  }
  if (self->_resultCandidateId)
  {
    v13 = [(POMMESSchemaPOMMESClientEventMetadata *)self resultCandidateId];
    int v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"resultCandidateId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v15 = objc_msgSend(NSNumber, "numberWithInt:", -[POMMESSchemaPOMMESClientEventMetadata searchToolGlobalSearchResultId](self, "searchToolGlobalSearchResultId"));
    [v3 setObject:v15 forKeyedSubscript:@"searchToolGlobalSearchResultId"];
  }
  if (self->_searchToolId)
  {
    v16 = [(POMMESSchemaPOMMESClientEventMetadata *)self searchToolId];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"searchToolId"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"searchToolId"];
    }
  }
  if (self->_subRequestId)
  {
    v19 = [(POMMESSchemaPOMMESClientEventMetadata *)self subRequestId];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"subRequestId"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"subRequestId"];
    }
  }
  if (self->_trpId)
  {
    objc_super v22 = [(POMMESSchemaPOMMESClientEventMetadata *)self trpId];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"trpId"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"trpId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_pommesId hash];
  NSUInteger v4 = [(NSString *)self->_resultCandidateId hash];
  unint64_t v5 = [(SISchemaUUID *)self->_requestId hash];
  unint64_t v6 = [(SISchemaUUID *)self->_trpId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_originProcess;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = [(SISchemaUUID *)self->_subRequestId hash];
  unint64_t v9 = [(SISchemaUUID *)self->_searchToolId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_searchToolGlobalSearchResultId;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  unint64_t v5 = [(POMMESSchemaPOMMESClientEventMetadata *)self pommesId];
  unint64_t v6 = [v4 pommesId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v7 = [(POMMESSchemaPOMMESClientEventMetadata *)self pommesId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(POMMESSchemaPOMMESClientEventMetadata *)self pommesId];
    uint64_t v10 = [v4 pommesId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  unint64_t v5 = [(POMMESSchemaPOMMESClientEventMetadata *)self resultCandidateId];
  unint64_t v6 = [v4 resultCandidateId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v12 = [(POMMESSchemaPOMMESClientEventMetadata *)self resultCandidateId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(POMMESSchemaPOMMESClientEventMetadata *)self resultCandidateId];
    v15 = [v4 resultCandidateId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  unint64_t v5 = [(POMMESSchemaPOMMESClientEventMetadata *)self requestId];
  unint64_t v6 = [v4 requestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v17 = [(POMMESSchemaPOMMESClientEventMetadata *)self requestId];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(POMMESSchemaPOMMESClientEventMetadata *)self requestId];
    int v20 = [v4 requestId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  unint64_t v5 = [(POMMESSchemaPOMMESClientEventMetadata *)self trpId];
  unint64_t v6 = [v4 trpId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v22 = [(POMMESSchemaPOMMESClientEventMetadata *)self trpId];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(POMMESSchemaPOMMESClientEventMetadata *)self trpId];
    v25 = [v4 trpId];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[68] & 1)) {
    goto LABEL_35;
  }
  if (*(unsigned char *)&self->_has)
  {
    int originProcess = self->_originProcess;
    if (originProcess != [v4 originProcess]) {
      goto LABEL_35;
    }
  }
  unint64_t v5 = [(POMMESSchemaPOMMESClientEventMetadata *)self subRequestId];
  unint64_t v6 = [v4 subRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v28 = [(POMMESSchemaPOMMESClientEventMetadata *)self subRequestId];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(POMMESSchemaPOMMESClientEventMetadata *)self subRequestId];
    v31 = [v4 subRequestId];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  unint64_t v5 = [(POMMESSchemaPOMMESClientEventMetadata *)self searchToolId];
  unint64_t v6 = [v4 searchToolId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_34:

    goto LABEL_35;
  }
  uint64_t v33 = [(POMMESSchemaPOMMESClientEventMetadata *)self searchToolId];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(POMMESSchemaPOMMESClientEventMetadata *)self searchToolId];
    v36 = [v4 searchToolId];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  int v40 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v40 == ((v4[68] >> 1) & 1))
  {
    if (!v40
      || (int searchToolGlobalSearchResultId = self->_searchToolGlobalSearchResultId,
          searchToolGlobalSearchResultId == [v4 searchToolGlobalSearchResultId]))
    {
      BOOL v38 = 1;
      goto LABEL_36;
    }
  }
LABEL_35:
  BOOL v38 = 0;
LABEL_36:

  return v38;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  NSUInteger v4 = [(POMMESSchemaPOMMESClientEventMetadata *)self pommesId];

  if (v4)
  {
    unint64_t v5 = [(POMMESSchemaPOMMESClientEventMetadata *)self pommesId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEventMetadata *)self resultCandidateId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(POMMESSchemaPOMMESClientEventMetadata *)self requestId];

  if (v7)
  {
    unint64_t v8 = [(POMMESSchemaPOMMESClientEventMetadata *)self requestId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v9 = [(POMMESSchemaPOMMESClientEventMetadata *)self trpId];

  if (v9)
  {
    uint64_t v10 = [(POMMESSchemaPOMMESClientEventMetadata *)self trpId];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  int v11 = [(POMMESSchemaPOMMESClientEventMetadata *)self subRequestId];

  if (v11)
  {
    uint64_t v12 = [(POMMESSchemaPOMMESClientEventMetadata *)self subRequestId];
    PBDataWriterWriteSubmessage();
  }
  v13 = [(POMMESSchemaPOMMESClientEventMetadata *)self searchToolId];

  if (v13)
  {
    int v14 = [(POMMESSchemaPOMMESClientEventMetadata *)self searchToolId];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESClientEventMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteSearchToolGlobalSearchResultId
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasSearchToolGlobalSearchResultId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSearchToolGlobalSearchResultId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSearchToolGlobalSearchResultId:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int searchToolGlobalSearchResultId = a3;
}

- (void)deleteSearchToolId
{
}

- (BOOL)hasSearchToolId
{
  return self->_searchToolId != 0;
}

- (void)deleteSubRequestId
{
}

- (BOOL)hasSubRequestId
{
  return self->_subRequestId != 0;
}

- (void)deleteOriginProcess
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasOriginProcess:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOriginProcess
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOriginProcess:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int originProcess = a3;
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

- (void)deletePommesId
{
}

- (BOOL)hasPommesId
{
  return self->_pommesId != 0;
}

@end