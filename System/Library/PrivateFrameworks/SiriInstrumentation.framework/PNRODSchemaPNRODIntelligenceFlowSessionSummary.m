@interface PNRODSchemaPNRODIntelligenceFlowSessionSummary
- (BOOL)hasClientSessionId;
- (BOOL)hasFailureInfo;
- (BOOL)hasFullPlannerServiceSetupTime;
- (BOOL)hasPlanOverridesServiceSetupTime;
- (BOOL)hasPlanResolverServiceSetupTime;
- (BOOL)hasQueryDecorationServiceSetupTime;
- (BOOL)hasRawSessionId;
- (BOOL)hasResponseGenerationServiceSetupTime;
- (BOOL)hasStandardPlannerSetupTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PNRODSchemaPNRODFailureInfo)failureInfo;
- (PNRODSchemaPNRODIntelligenceFlowSessionSummary)initWithDictionary:(id)a3;
- (PNRODSchemaPNRODIntelligenceFlowSessionSummary)initWithJSON:(id)a3;
- (PNRODSchemaPNRODMetricDuration)fullPlannerServiceSetupTime;
- (PNRODSchemaPNRODMetricDuration)planOverridesServiceSetupTime;
- (PNRODSchemaPNRODMetricDuration)planResolverServiceSetupTime;
- (PNRODSchemaPNRODMetricDuration)queryDecorationServiceSetupTime;
- (PNRODSchemaPNRODMetricDuration)responseGenerationServiceSetupTime;
- (PNRODSchemaPNRODMetricDuration)standardPlannerSetupTime;
- (SISchemaUUID)clientSessionId;
- (SISchemaUUID)rawSessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteClientSessionId;
- (void)deleteFailureInfo;
- (void)deleteFullPlannerServiceSetupTime;
- (void)deletePlanOverridesServiceSetupTime;
- (void)deletePlanResolverServiceSetupTime;
- (void)deleteQueryDecorationServiceSetupTime;
- (void)deleteRawSessionId;
- (void)deleteResponseGenerationServiceSetupTime;
- (void)deleteStandardPlannerSetupTime;
- (void)setClientSessionId:(id)a3;
- (void)setFailureInfo:(id)a3;
- (void)setFullPlannerServiceSetupTime:(id)a3;
- (void)setHasClientSessionId:(BOOL)a3;
- (void)setHasFailureInfo:(BOOL)a3;
- (void)setHasFullPlannerServiceSetupTime:(BOOL)a3;
- (void)setHasPlanOverridesServiceSetupTime:(BOOL)a3;
- (void)setHasPlanResolverServiceSetupTime:(BOOL)a3;
- (void)setHasQueryDecorationServiceSetupTime:(BOOL)a3;
- (void)setHasRawSessionId:(BOOL)a3;
- (void)setHasResponseGenerationServiceSetupTime:(BOOL)a3;
- (void)setHasStandardPlannerSetupTime:(BOOL)a3;
- (void)setPlanOverridesServiceSetupTime:(id)a3;
- (void)setPlanResolverServiceSetupTime:(id)a3;
- (void)setQueryDecorationServiceSetupTime:(id)a3;
- (void)setRawSessionId:(id)a3;
- (void)setResponseGenerationServiceSetupTime:(id)a3;
- (void)setStandardPlannerSetupTime:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRODSchemaPNRODIntelligenceFlowSessionSummary

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowSessionSummary;
  v5 = [(SISchemaInstrumentationMessage *)&v34 applySensitiveConditionsPolicy:v4];
  v6 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self clientSessionId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self deleteClientSessionId];
  }
  v9 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self rawSessionId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self deleteRawSessionId];
  }
  v12 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self standardPlannerSetupTime];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self deleteStandardPlannerSetupTime];
  }
  v15 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self queryDecorationServiceSetupTime];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self deleteQueryDecorationServiceSetupTime];
  }
  v18 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self fullPlannerServiceSetupTime];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self deleteFullPlannerServiceSetupTime];
  }
  v21 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planOverridesServiceSetupTime];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self deletePlanOverridesServiceSetupTime];
  }
  v24 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planResolverServiceSetupTime];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self deletePlanResolverServiceSetupTime];
  }
  v27 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self responseGenerationServiceSetupTime];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self deleteResponseGenerationServiceSetupTime];
  }
  v30 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self failureInfo];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self deleteFailureInfo];
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
  objc_storeStrong((id *)&self->_failureInfo, 0);
  objc_storeStrong((id *)&self->_responseGenerationServiceSetupTime, 0);
  objc_storeStrong((id *)&self->_planResolverServiceSetupTime, 0);
  objc_storeStrong((id *)&self->_planOverridesServiceSetupTime, 0);
  objc_storeStrong((id *)&self->_fullPlannerServiceSetupTime, 0);
  objc_storeStrong((id *)&self->_queryDecorationServiceSetupTime, 0);
  objc_storeStrong((id *)&self->_standardPlannerSetupTime, 0);
  objc_storeStrong((id *)&self->_rawSessionId, 0);
  objc_storeStrong((id *)&self->_clientSessionId, 0);
}

- (void)setHasFailureInfo:(BOOL)a3
{
  self->_hasFailureInfo = a3;
}

- (void)setHasResponseGenerationServiceSetupTime:(BOOL)a3
{
  self->_hasResponseGenerationServiceSetupTime = a3;
}

- (void)setHasPlanResolverServiceSetupTime:(BOOL)a3
{
  self->_hasPlanResolverServiceSetupTime = a3;
}

- (void)setHasPlanOverridesServiceSetupTime:(BOOL)a3
{
  self->_hasPlanOverridesServiceSetupTime = a3;
}

- (void)setHasFullPlannerServiceSetupTime:(BOOL)a3
{
  self->_hasFullPlannerServiceSetupTime = a3;
}

- (void)setHasQueryDecorationServiceSetupTime:(BOOL)a3
{
  self->_hasQueryDecorationServiceSetupTime = a3;
}

- (void)setHasStandardPlannerSetupTime:(BOOL)a3
{
  self->_hasStandardPlannerSetupTime = a3;
}

- (void)setHasRawSessionId:(BOOL)a3
{
  self->_hasRawSessionId = a3;
}

- (void)setHasClientSessionId:(BOOL)a3
{
  self->_hasClientSessionId = a3;
}

- (void)setFailureInfo:(id)a3
{
}

- (PNRODSchemaPNRODFailureInfo)failureInfo
{
  return self->_failureInfo;
}

- (void)setResponseGenerationServiceSetupTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)responseGenerationServiceSetupTime
{
  return self->_responseGenerationServiceSetupTime;
}

- (void)setPlanResolverServiceSetupTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)planResolverServiceSetupTime
{
  return self->_planResolverServiceSetupTime;
}

- (void)setPlanOverridesServiceSetupTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)planOverridesServiceSetupTime
{
  return self->_planOverridesServiceSetupTime;
}

- (void)setFullPlannerServiceSetupTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)fullPlannerServiceSetupTime
{
  return self->_fullPlannerServiceSetupTime;
}

- (void)setQueryDecorationServiceSetupTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)queryDecorationServiceSetupTime
{
  return self->_queryDecorationServiceSetupTime;
}

- (void)setStandardPlannerSetupTime:(id)a3
{
}

- (PNRODSchemaPNRODMetricDuration)standardPlannerSetupTime
{
  return self->_standardPlannerSetupTime;
}

- (void)setRawSessionId:(id)a3
{
}

- (SISchemaUUID)rawSessionId
{
  return self->_rawSessionId;
}

- (void)setClientSessionId:(id)a3
{
}

- (SISchemaUUID)clientSessionId
{
  return self->_clientSessionId;
}

- (PNRODSchemaPNRODIntelligenceFlowSessionSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PNRODSchemaPNRODIntelligenceFlowSessionSummary;
  v5 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"clientSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)v5 setClientSessionId:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"rawSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)v5 setRawSessionId:v9];
    }
    v27 = (void *)v6;
    v10 = [v4 objectForKeyedSubscript:@"standardPlannerSetupTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v10];
      [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)v5 setStandardPlannerSetupTime:v11];
    }
    v12 = objc_msgSend(v4, "objectForKeyedSubscript:", @"queryDecorationServiceSetupTime", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v12];
      [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)v5 setQueryDecorationServiceSetupTime:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"fullPlannerServiceSetupTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v14];
      [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)v5 setFullPlannerServiceSetupTime:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"planOverridesServiceSetupTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v16];
      [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)v5 setPlanOverridesServiceSetupTime:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"planResolverServiceSetupTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v18];
      [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)v5 setPlanResolverServiceSetupTime:v19];
    }
    int v20 = [v4 objectForKeyedSubscript:@"responseGenerationServiceSetupTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[PNRODSchemaPNRODMetricDuration alloc] initWithDictionary:v20];
      [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)v5 setResponseGenerationServiceSetupTime:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"failureInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[PNRODSchemaPNRODFailureInfo alloc] initWithDictionary:v22];
      [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)v5 setFailureInfo:v23];
    }
    v24 = v5;
  }
  return v5;
}

- (PNRODSchemaPNRODIntelligenceFlowSessionSummary)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self dictionaryRepresentation];
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
  if (self->_clientSessionId)
  {
    id v4 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self clientSessionId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"clientSessionId"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"clientSessionId"];
    }
  }
  if (self->_failureInfo)
  {
    uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self failureInfo];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"failureInfo"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"failureInfo"];
    }
  }
  if (self->_fullPlannerServiceSetupTime)
  {
    v10 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self fullPlannerServiceSetupTime];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"fullPlannerServiceSetupTime"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"fullPlannerServiceSetupTime"];
    }
  }
  if (self->_planOverridesServiceSetupTime)
  {
    v13 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planOverridesServiceSetupTime];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"planOverridesServiceSetupTime"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"planOverridesServiceSetupTime"];
    }
  }
  if (self->_planResolverServiceSetupTime)
  {
    v16 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planResolverServiceSetupTime];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"planResolverServiceSetupTime"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"planResolverServiceSetupTime"];
    }
  }
  if (self->_queryDecorationServiceSetupTime)
  {
    v19 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self queryDecorationServiceSetupTime];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"queryDecorationServiceSetupTime"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"queryDecorationServiceSetupTime"];
    }
  }
  if (self->_rawSessionId)
  {
    v22 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self rawSessionId];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"rawSessionId"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"rawSessionId"];
    }
  }
  if (self->_responseGenerationServiceSetupTime)
  {
    v25 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self responseGenerationServiceSetupTime];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"responseGenerationServiceSetupTime"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"responseGenerationServiceSetupTime"];
    }
  }
  if (self->_standardPlannerSetupTime)
  {
    objc_super v28 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self standardPlannerSetupTime];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"standardPlannerSetupTime"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"standardPlannerSetupTime"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_clientSessionId hash];
  unint64_t v4 = [(SISchemaUUID *)self->_rawSessionId hash] ^ v3;
  unint64_t v5 = [(PNRODSchemaPNRODMetricDuration *)self->_standardPlannerSetupTime hash];
  unint64_t v6 = v4 ^ v5 ^ [(PNRODSchemaPNRODMetricDuration *)self->_queryDecorationServiceSetupTime hash];
  unint64_t v7 = [(PNRODSchemaPNRODMetricDuration *)self->_fullPlannerServiceSetupTime hash];
  unint64_t v8 = v7 ^ [(PNRODSchemaPNRODMetricDuration *)self->_planOverridesServiceSetupTime hash];
  unint64_t v9 = v6 ^ v8 ^ [(PNRODSchemaPNRODMetricDuration *)self->_planResolverServiceSetupTime hash];
  unint64_t v10 = [(PNRODSchemaPNRODMetricDuration *)self->_responseGenerationServiceSetupTime hash];
  return v9 ^ v10 ^ [(PNRODSchemaPNRODFailureInfo *)self->_failureInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self clientSessionId];
  unint64_t v6 = [v4 clientSessionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self clientSessionId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self clientSessionId];
    unint64_t v10 = [v4 clientSessionId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self rawSessionId];
  unint64_t v6 = [v4 rawSessionId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self rawSessionId];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self rawSessionId];
    v15 = [v4 rawSessionId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self standardPlannerSetupTime];
  unint64_t v6 = [v4 standardPlannerSetupTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v17 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self standardPlannerSetupTime];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self standardPlannerSetupTime];
    int v20 = [v4 standardPlannerSetupTime];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self queryDecorationServiceSetupTime];
  unint64_t v6 = [v4 queryDecorationServiceSetupTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v22 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self queryDecorationServiceSetupTime];
  if (v22)
  {
    int v23 = (void *)v22;
    v24 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self queryDecorationServiceSetupTime];
    v25 = [v4 queryDecorationServiceSetupTime];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self fullPlannerServiceSetupTime];
  unint64_t v6 = [v4 fullPlannerServiceSetupTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v27 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self fullPlannerServiceSetupTime];
  if (v27)
  {
    objc_super v28 = (void *)v27;
    int v29 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self fullPlannerServiceSetupTime];
    v30 = [v4 fullPlannerServiceSetupTime];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planOverridesServiceSetupTime];
  unint64_t v6 = [v4 planOverridesServiceSetupTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v32 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planOverridesServiceSetupTime];
  if (v32)
  {
    v33 = (void *)v32;
    objc_super v34 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planOverridesServiceSetupTime];
    v35 = [v4 planOverridesServiceSetupTime];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planResolverServiceSetupTime];
  unint64_t v6 = [v4 planResolverServiceSetupTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v37 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planResolverServiceSetupTime];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planResolverServiceSetupTime];
    v40 = [v4 planResolverServiceSetupTime];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self responseGenerationServiceSetupTime];
  unint64_t v6 = [v4 responseGenerationServiceSetupTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v42 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self responseGenerationServiceSetupTime];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self responseGenerationServiceSetupTime];
    v45 = [v4 responseGenerationServiceSetupTime];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self failureInfo];
  unint64_t v6 = [v4 failureInfo];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v47 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self failureInfo];
    if (!v47)
    {

LABEL_50:
      BOOL v52 = 1;
      goto LABEL_48;
    }
    v48 = (void *)v47;
    v49 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self failureInfo];
    v50 = [v4 failureInfo];
    char v51 = [v49 isEqual:v50];

    if (v51) {
      goto LABEL_50;
    }
  }
  else
  {
LABEL_46:
  }
LABEL_47:
  BOOL v52 = 0;
LABEL_48:

  return v52;
}

- (void)writeTo:(id)a3
{
  id v22 = a3;
  id v4 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self clientSessionId];

  if (v4)
  {
    unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self clientSessionId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self rawSessionId];

  if (v6)
  {
    uint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self rawSessionId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v8 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self standardPlannerSetupTime];

  if (v8)
  {
    unint64_t v9 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self standardPlannerSetupTime];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self queryDecorationServiceSetupTime];

  if (v10)
  {
    int v11 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self queryDecorationServiceSetupTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self fullPlannerServiceSetupTime];

  if (v12)
  {
    v13 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self fullPlannerServiceSetupTime];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planOverridesServiceSetupTime];

  if (v14)
  {
    v15 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planOverridesServiceSetupTime];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planResolverServiceSetupTime];

  if (v16)
  {
    uint64_t v17 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self planResolverServiceSetupTime];
    PBDataWriterWriteSubmessage();
  }
  v18 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self responseGenerationServiceSetupTime];

  if (v18)
  {
    v19 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self responseGenerationServiceSetupTime];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self failureInfo];

  if (v20)
  {
    int v21 = [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self failureInfo];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODIntelligenceFlowSessionSummaryReadFrom(self, (uint64_t)a3);
}

- (void)deleteFailureInfo
{
}

- (BOOL)hasFailureInfo
{
  return self->_failureInfo != 0;
}

- (void)deleteResponseGenerationServiceSetupTime
{
}

- (BOOL)hasResponseGenerationServiceSetupTime
{
  return self->_responseGenerationServiceSetupTime != 0;
}

- (void)deletePlanResolverServiceSetupTime
{
}

- (BOOL)hasPlanResolverServiceSetupTime
{
  return self->_planResolverServiceSetupTime != 0;
}

- (void)deletePlanOverridesServiceSetupTime
{
}

- (BOOL)hasPlanOverridesServiceSetupTime
{
  return self->_planOverridesServiceSetupTime != 0;
}

- (void)deleteFullPlannerServiceSetupTime
{
}

- (BOOL)hasFullPlannerServiceSetupTime
{
  return self->_fullPlannerServiceSetupTime != 0;
}

- (void)deleteQueryDecorationServiceSetupTime
{
}

- (BOOL)hasQueryDecorationServiceSetupTime
{
  return self->_queryDecorationServiceSetupTime != 0;
}

- (void)deleteStandardPlannerSetupTime
{
}

- (BOOL)hasStandardPlannerSetupTime
{
  return self->_standardPlannerSetupTime != 0;
}

- (void)deleteRawSessionId
{
}

- (BOOL)hasRawSessionId
{
  return self->_rawSessionId != 0;
}

- (void)deleteClientSessionId
{
}

- (BOOL)hasClientSessionId
{
  return self->_clientSessionId != 0;
}

@end