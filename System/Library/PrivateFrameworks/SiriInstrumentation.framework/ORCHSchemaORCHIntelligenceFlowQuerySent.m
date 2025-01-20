@interface ORCHSchemaORCHIntelligenceFlowQuerySent
- (BOOL)hasPlannerQueryId;
- (BOOL)hasSubRequestId;
- (BOOL)hasTraceId;
- (BOOL)hasTrpId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ORCHSchemaORCHIntelligenceFlowQuerySent)initWithDictionary:(id)a3;
- (ORCHSchemaORCHIntelligenceFlowQuerySent)initWithJSON:(id)a3;
- (SISchemaUUID)plannerQueryId;
- (SISchemaUUID)subRequestId;
- (SISchemaUUID)traceId;
- (SISchemaUUID)trpId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deletePlannerQueryId;
- (void)deleteSubRequestId;
- (void)deleteTraceId;
- (void)deleteTrpId;
- (void)setHasPlannerQueryId:(BOOL)a3;
- (void)setHasSubRequestId:(BOOL)a3;
- (void)setHasTraceId:(BOOL)a3;
- (void)setHasTrpId:(BOOL)a3;
- (void)setPlannerQueryId:(id)a3;
- (void)setSubRequestId:(id)a3;
- (void)setTraceId:(id)a3;
- (void)setTrpId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ORCHSchemaORCHIntelligenceFlowQuerySent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ORCHSchemaORCHIntelligenceFlowQuerySent;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self plannerQueryId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self deletePlannerQueryId];
  }
  v9 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self trpId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self deleteTrpId];
  }
  v12 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self subRequestId];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self deleteSubRequestId];
  }
  v15 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self traceId];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self deleteTraceId];
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
  objc_storeStrong((id *)&self->_traceId, 0);
  objc_storeStrong((id *)&self->_subRequestId, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_plannerQueryId, 0);
}

- (void)setHasTraceId:(BOOL)a3
{
  self->_hasTraceId = a3;
}

- (void)setHasSubRequestId:(BOOL)a3
{
  self->_hasSubRequestId = a3;
}

- (void)setHasTrpId:(BOOL)a3
{
  self->_hasTrpId = a3;
}

- (void)setHasPlannerQueryId:(BOOL)a3
{
  self->_hasPlannerQueryId = a3;
}

- (void)setTraceId:(id)a3
{
}

- (SISchemaUUID)traceId
{
  return self->_traceId;
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

- (void)setPlannerQueryId:(id)a3
{
}

- (SISchemaUUID)plannerQueryId
{
  return self->_plannerQueryId;
}

- (ORCHSchemaORCHIntelligenceFlowQuerySent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ORCHSchemaORCHIntelligenceFlowQuerySent;
  v5 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"plannerQueryId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(ORCHSchemaORCHIntelligenceFlowQuerySent *)v5 setPlannerQueryId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"trpId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(ORCHSchemaORCHIntelligenceFlowQuerySent *)v5 setTrpId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"subRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaUUID alloc] initWithDictionary:v10];
      [(ORCHSchemaORCHIntelligenceFlowQuerySent *)v5 setSubRequestId:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"traceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaUUID alloc] initWithDictionary:v12];
      [(ORCHSchemaORCHIntelligenceFlowQuerySent *)v5 setTraceId:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (ORCHSchemaORCHIntelligenceFlowQuerySent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self dictionaryRepresentation];
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
  if (self->_plannerQueryId)
  {
    id v4 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self plannerQueryId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"plannerQueryId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"plannerQueryId"];
    }
  }
  if (self->_subRequestId)
  {
    uint64_t v7 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self subRequestId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"subRequestId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"subRequestId"];
    }
  }
  if (self->_traceId)
  {
    v10 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self traceId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"traceId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"traceId"];
    }
  }
  if (self->_trpId)
  {
    v13 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self trpId];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"trpId"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"trpId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_plannerQueryId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_trpId hash] ^ v3;
  unint64_t v5 = [(SISchemaUUID *)self->_subRequestId hash];
  return v4 ^ v5 ^ [(SISchemaUUID *)self->_traceId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self plannerQueryId];
  v6 = [v4 plannerQueryId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self plannerQueryId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self plannerQueryId];
    v10 = [v4 plannerQueryId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self trpId];
  v6 = [v4 trpId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self trpId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self trpId];
    v15 = [v4 trpId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self subRequestId];
  v6 = [v4 subRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self subRequestId];
  if (v17)
  {
    v18 = (void *)v17;
    objc_super v19 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self subRequestId];
    v20 = [v4 subRequestId];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self traceId];
  v6 = [v4 traceId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self traceId];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self traceId];
    v25 = [v4 traceId];
    char v26 = [v24 isEqual:v25];

    if (v26) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  id v4 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self plannerQueryId];

  if (v4)
  {
    unint64_t v5 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self plannerQueryId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self trpId];

  if (v6)
  {
    uint64_t v7 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self trpId];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self subRequestId];

  if (v8)
  {
    v9 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self subRequestId];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self traceId];

  if (v10)
  {
    int v11 = [(ORCHSchemaORCHIntelligenceFlowQuerySent *)self traceId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ORCHSchemaORCHIntelligenceFlowQuerySentReadFrom(self, (uint64_t)a3);
}

- (void)deleteTraceId
{
}

- (BOOL)hasTraceId
{
  return self->_traceId != 0;
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

- (void)deletePlannerQueryId
{
}

- (BOOL)hasPlannerQueryId
{
  return self->_plannerQueryId != 0;
}

@end