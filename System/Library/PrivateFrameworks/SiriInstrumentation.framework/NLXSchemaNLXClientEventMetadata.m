@interface NLXSchemaNLXClientEventMetadata
- (BOOL)hasComponentInvocationSource;
- (BOOL)hasNlId;
- (BOOL)hasRequestId;
- (BOOL)hasResultCandidateId;
- (BOOL)hasSubRequestId;
- (BOOL)hasTrpId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaNLXClientEventMetadata)initWithDictionary:(id)a3;
- (NLXSchemaNLXClientEventMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)resultCandidateId;
- (SISchemaUUID)nlId;
- (SISchemaUUID)requestId;
- (SISchemaUUID)subRequestId;
- (SISchemaUUID)trpId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)componentInvocationSource;
- (unint64_t)hash;
- (void)deleteComponentInvocationSource;
- (void)deleteNlId;
- (void)deleteRequestId;
- (void)deleteResultCandidateId;
- (void)deleteSubRequestId;
- (void)deleteTrpId;
- (void)setComponentInvocationSource:(int)a3;
- (void)setHasComponentInvocationSource:(BOOL)a3;
- (void)setHasNlId:(BOOL)a3;
- (void)setHasRequestId:(BOOL)a3;
- (void)setHasResultCandidateId:(BOOL)a3;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setHasTrpId:(BOOL)a3;
- (void)setNlId:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setSubRequestId:(id)a3;
- (void)setTrpId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaNLXClientEventMetadata

- (BOOL)hasNlId
{
  return self->_nlId != 0;
}

- (void)writeTo:(id)a3
{
  id v14 = a3;
  v4 = [(NLXSchemaNLXClientEventMetadata *)self nlId];

  if (v4)
  {
    v5 = [(NLXSchemaNLXClientEventMetadata *)self nlId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(NLXSchemaNLXClientEventMetadata *)self resultCandidateId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  v7 = [(NLXSchemaNLXClientEventMetadata *)self requestId];

  if (v7)
  {
    v8 = [(NLXSchemaNLXClientEventMetadata *)self requestId];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(NLXSchemaNLXClientEventMetadata *)self trpId];

  if (v9)
  {
    v10 = [(NLXSchemaNLXClientEventMetadata *)self trpId];
    PBDataWriterWriteSubmessage();
  }
  v11 = [(NLXSchemaNLXClientEventMetadata *)self subRequestId];

  v12 = v14;
  if (v11)
  {
    v13 = [(NLXSchemaNLXClientEventMetadata *)self subRequestId];
    PBDataWriterWriteSubmessage();

    v12 = v14;
  }
}

- (SISchemaUUID)nlId
{
  return self->_nlId;
}

- (SISchemaUUID)trpId
{
  return self->_trpId;
}

- (NSString)resultCandidateId
{
  return self->_resultCandidateId;
}

- (SISchemaUUID)requestId
{
  return self->_requestId;
}

- (void)setResultCandidateId:(id)a3
{
}

- (void)setNlId:(id)a3
{
}

- (void)setComponentInvocationSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_componentInvocationSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_nlId, 0);
}

- (void)setTrpId:(id)a3
{
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NLXSchemaNLXClientEventMetadata;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaNLXClientEventMetadata *)self nlId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaNLXClientEventMetadata *)self deleteNlId];
  }
  v9 = [(NLXSchemaNLXClientEventMetadata *)self requestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLXSchemaNLXClientEventMetadata *)self deleteRequestId];
  }
  v12 = [(NLXSchemaNLXClientEventMetadata *)self trpId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(NLXSchemaNLXClientEventMetadata *)self deleteTrpId];
  }
  v15 = [(NLXSchemaNLXClientEventMetadata *)self subRequestId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(NLXSchemaNLXClientEventMetadata *)self deleteSubRequestId];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasResultCandidateId = a3;
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasNlId = a3;
}

- (void)setHasRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasResultCandidateId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasNlId:(BOOL)a3
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

- (void)setRequestId:(id)a3
{
}

- (int)componentInvocationSource
{
  return self->_componentInvocationSource;
}

- (NLXSchemaNLXClientEventMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NLXSchemaNLXClientEventMetadata;
  v5 = [(NLXSchemaNLXClientEventMetadata *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"nlId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLXSchemaNLXClientEventMetadata *)v5 setNlId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"resultCandidateId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(NLXSchemaNLXClientEventMetadata *)v5 setResultCandidateId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"componentInvocationSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaNLXClientEventMetadata setComponentInvocationSource:](v5, "setComponentInvocationSource:", [v10 intValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[SISchemaUUID alloc] initWithDictionary:v11];
      [(NLXSchemaNLXClientEventMetadata *)v5 setRequestId:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"trpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v14 = [[SISchemaUUID alloc] initWithDictionary:v13];
      [(NLXSchemaNLXClientEventMetadata *)v5 setTrpId:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"subRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaUUID alloc] initWithDictionary:v15];
      [(NLXSchemaNLXClientEventMetadata *)v5 setSubRequestId:v16];
    }
    int v17 = v5;
  }
  return v5;
}

- (NLXSchemaNLXClientEventMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaNLXClientEventMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaNLXClientEventMetadata *)self dictionaryRepresentation];
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
    unsigned int v4 = [(NLXSchemaNLXClientEventMetadata *)self componentInvocationSource] - 1;
    if (v4 > 0xC) {
      v5 = @"COMPONENTINVOCATIONSOURCE_UNKNOWN";
    }
    else {
      v5 = off_1E5EB3560[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"componentInvocationSource"];
  }
  if (self->_nlId)
  {
    v6 = [(NLXSchemaNLXClientEventMetadata *)self nlId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"nlId"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"nlId"];
    }
  }
  if (self->_requestId)
  {
    v9 = [(NLXSchemaNLXClientEventMetadata *)self requestId];
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
    v12 = [(NLXSchemaNLXClientEventMetadata *)self resultCandidateId];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"resultCandidateId"];
  }
  if (self->_subRequestId)
  {
    int v14 = [(NLXSchemaNLXClientEventMetadata *)self subRequestId];
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
    int v17 = [(NLXSchemaNLXClientEventMetadata *)self trpId];
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
  unint64_t v3 = [(SISchemaUUID *)self->_nlId hash];
  NSUInteger v4 = [(NSString *)self->_resultCandidateId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_componentInvocationSource;
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
  uint64_t v5 = [(NLXSchemaNLXClientEventMetadata *)self nlId];
  unint64_t v6 = [v4 nlId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v7 = [(NLXSchemaNLXClientEventMetadata *)self nlId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(NLXSchemaNLXClientEventMetadata *)self nlId];
    v10 = [v4 nlId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NLXSchemaNLXClientEventMetadata *)self resultCandidateId];
  unint64_t v6 = [v4 resultCandidateId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v12 = [(NLXSchemaNLXClientEventMetadata *)self resultCandidateId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(NLXSchemaNLXClientEventMetadata *)self resultCandidateId];
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
    int componentInvocationSource = self->_componentInvocationSource;
    if (componentInvocationSource != [v4 componentInvocationSource]) {
      goto LABEL_30;
    }
  }
  uint64_t v5 = [(NLXSchemaNLXClientEventMetadata *)self requestId];
  unint64_t v6 = [v4 requestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v18 = [(NLXSchemaNLXClientEventMetadata *)self requestId];
  if (v18)
  {
    objc_super v19 = (void *)v18;
    v20 = [(NLXSchemaNLXClientEventMetadata *)self requestId];
    v21 = [v4 requestId];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NLXSchemaNLXClientEventMetadata *)self trpId];
  unint64_t v6 = [v4 trpId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_29;
  }
  uint64_t v23 = [(NLXSchemaNLXClientEventMetadata *)self trpId];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(NLXSchemaNLXClientEventMetadata *)self trpId];
    v26 = [v4 trpId];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v5 = [(NLXSchemaNLXClientEventMetadata *)self subRequestId];
  unint64_t v6 = [v4 subRequestId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v28 = [(NLXSchemaNLXClientEventMetadata *)self subRequestId];
    if (!v28)
    {

LABEL_33:
      BOOL v33 = 1;
      goto LABEL_31;
    }
    v29 = (void *)v28;
    v30 = [(NLXSchemaNLXClientEventMetadata *)self subRequestId];
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

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaNLXClientEventMetadataReadFrom(self, (uint64_t)a3);
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

- (void)deleteComponentInvocationSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasComponentInvocationSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasComponentInvocationSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)deleteResultCandidateId
{
}

- (BOOL)hasResultCandidateId
{
  return self->_resultCandidateId != 0;
}

- (void)deleteNlId
{
}

@end