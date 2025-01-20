@interface PNRODSchemaPNRODClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
- (BOOL)hasEventMetadata;
- (BOOL)hasPnrodIntelligenceFlowActionGrainSummary;
- (BOOL)hasPnrodIntelligenceFlowPlannerGrainSummary;
- (BOOL)hasPnrodIntelligenceFlowRequestGrainSummary;
- (BOOL)hasPnrodIntelligenceFlowResponseGenerationComponentSummary;
- (BOOL)hasPnrodIntelligenceFlowSessionSummary;
- (BOOL)hasPnrodPNRODIntelligenceFlowPlannerComponentSummary;
- (BOOL)hasPnrodSiriTurnGrainSummary;
- (BOOL)hasPnronIntelligenceFlowExecutorComponentSummary;
- (BOOL)hasPnronScheduleDebugSummary;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PNRODSchemaPNRODClientEvent)initWithDictionary:(id)a3;
- (PNRODSchemaPNRODClientEvent)initWithJSON:(id)a3;
- (PNRODSchemaPNRODClientEventMetadata)eventMetadata;
- (PNRODSchemaPNRODIntelligenceFlowActionGrainSummary)pnrodIntelligenceFlowActionGrainSummary;
- (PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary)pnronIntelligenceFlowExecutorComponentSummary;
- (PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary)pnrodPNRODIntelligenceFlowPlannerComponentSummary;
- (PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary)pnrodIntelligenceFlowPlannerGrainSummary;
- (PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary)pnrodIntelligenceFlowRequestGrainSummary;
- (PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary)pnrodIntelligenceFlowResponseGenerationComponentSummary;
- (PNRODSchemaPNRODIntelligenceFlowSessionSummary)pnrodIntelligenceFlowSessionSummary;
- (PNRODSchemaPNRODScheduleDebugSummary)pnronScheduleDebugSummary;
- (PNRODSchemaPNRODSiriTurnGrainSummary)pnrodSiriTurnGrainSummary;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)clockIsolationLevel;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteEventMetadata;
- (void)deletePnrodIntelligenceFlowActionGrainSummary;
- (void)deletePnrodIntelligenceFlowPlannerGrainSummary;
- (void)deletePnrodIntelligenceFlowRequestGrainSummary;
- (void)deletePnrodIntelligenceFlowResponseGenerationComponentSummary;
- (void)deletePnrodIntelligenceFlowSessionSummary;
- (void)deletePnrodPNRODIntelligenceFlowPlannerComponentSummary;
- (void)deletePnrodSiriTurnGrainSummary;
- (void)deletePnronIntelligenceFlowExecutorComponentSummary;
- (void)deletePnronScheduleDebugSummary;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasPnrodIntelligenceFlowActionGrainSummary:(BOOL)a3;
- (void)setHasPnrodIntelligenceFlowPlannerGrainSummary:(BOOL)a3;
- (void)setHasPnrodIntelligenceFlowRequestGrainSummary:(BOOL)a3;
- (void)setHasPnrodIntelligenceFlowResponseGenerationComponentSummary:(BOOL)a3;
- (void)setHasPnrodIntelligenceFlowSessionSummary:(BOOL)a3;
- (void)setHasPnrodPNRODIntelligenceFlowPlannerComponentSummary:(BOOL)a3;
- (void)setHasPnrodSiriTurnGrainSummary:(BOOL)a3;
- (void)setHasPnronIntelligenceFlowExecutorComponentSummary:(BOOL)a3;
- (void)setHasPnronScheduleDebugSummary:(BOOL)a3;
- (void)setPnrodIntelligenceFlowActionGrainSummary:(id)a3;
- (void)setPnrodIntelligenceFlowPlannerGrainSummary:(id)a3;
- (void)setPnrodIntelligenceFlowRequestGrainSummary:(id)a3;
- (void)setPnrodIntelligenceFlowResponseGenerationComponentSummary:(id)a3;
- (void)setPnrodIntelligenceFlowSessionSummary:(id)a3;
- (void)setPnrodPNRODIntelligenceFlowPlannerComponentSummary:(id)a3;
- (void)setPnrodSiriTurnGrainSummary:(id)a3;
- (void)setPnronIntelligenceFlowExecutorComponentSummary:(id)a3;
- (void)setPnronScheduleDebugSummary:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNRODSchemaPNRODClientEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PNRODSchemaPNRODClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v37 applySensitiveConditionsPolicy:v4];
  v6 = [(PNRODSchemaPNRODClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PNRODSchemaPNRODClientEvent *)self deleteEventMetadata];
  }
  v9 = [(PNRODSchemaPNRODClientEvent *)self pnrodSiriTurnGrainSummary];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PNRODSchemaPNRODClientEvent *)self deletePnrodSiriTurnGrainSummary];
  }
  v12 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowRequestGrainSummary];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PNRODSchemaPNRODClientEvent *)self deletePnrodIntelligenceFlowRequestGrainSummary];
  }
  v15 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowPlannerGrainSummary];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PNRODSchemaPNRODClientEvent *)self deletePnrodIntelligenceFlowPlannerGrainSummary];
  }
  v18 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowActionGrainSummary];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PNRODSchemaPNRODClientEvent *)self deletePnrodIntelligenceFlowActionGrainSummary];
  }
  v21 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowSessionSummary];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PNRODSchemaPNRODClientEvent *)self deletePnrodIntelligenceFlowSessionSummary];
  }
  v24 = [(PNRODSchemaPNRODClientEvent *)self pnrodPNRODIntelligenceFlowPlannerComponentSummary];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PNRODSchemaPNRODClientEvent *)self deletePnrodPNRODIntelligenceFlowPlannerComponentSummary];
  }
  v27 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowResponseGenerationComponentSummary];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(PNRODSchemaPNRODClientEvent *)self deletePnrodIntelligenceFlowResponseGenerationComponentSummary];
  }
  v30 = [(PNRODSchemaPNRODClientEvent *)self pnronIntelligenceFlowExecutorComponentSummary];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(PNRODSchemaPNRODClientEvent *)self deletePnronIntelligenceFlowExecutorComponentSummary];
  }
  v33 = [(PNRODSchemaPNRODClientEvent *)self pnronScheduleDebugSummary];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(PNRODSchemaPNRODClientEvent *)self deletePnronScheduleDebugSummary];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(PNRODSchemaPNRODClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 8) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAB9D8[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 8) {
    return 0;
  }
  else {
    return off_1E5EABA20[a3 - 101];
  }
}

- (int)clockIsolationLevel
{
  if ([(PNRODSchemaPNRODClientEvent *)self whichEvent_Type] - 101 >= 9) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pnronScheduleDebugSummary, 0);
  objc_storeStrong((id *)&self->_pnronIntelligenceFlowExecutorComponentSummary, 0);
  objc_storeStrong((id *)&self->_pnrodIntelligenceFlowResponseGenerationComponentSummary, 0);
  objc_storeStrong((id *)&self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary, 0);
  objc_storeStrong((id *)&self->_pnrodIntelligenceFlowSessionSummary, 0);
  objc_storeStrong((id *)&self->_pnrodIntelligenceFlowActionGrainSummary, 0);
  objc_storeStrong((id *)&self->_pnrodIntelligenceFlowPlannerGrainSummary, 0);
  objc_storeStrong((id *)&self->_pnrodIntelligenceFlowRequestGrainSummary, 0);
  objc_storeStrong((id *)&self->_pnrodSiriTurnGrainSummary, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasPnronScheduleDebugSummary:(BOOL)a3
{
  self->_hasPnronScheduleDebugSummary = a3;
}

- (BOOL)hasPnronScheduleDebugSummary
{
  return self->_hasPnronScheduleDebugSummary;
}

- (void)setHasPnronIntelligenceFlowExecutorComponentSummary:(BOOL)a3
{
  self->_hasPnronIntelligenceFlowExecutorComponentSummary = a3;
}

- (BOOL)hasPnronIntelligenceFlowExecutorComponentSummary
{
  return self->_hasPnronIntelligenceFlowExecutorComponentSummary;
}

- (void)setHasPnrodIntelligenceFlowResponseGenerationComponentSummary:(BOOL)a3
{
  self->_hasPnrodIntelligenceFlowResponseGenerationComponentSummary = a3;
}

- (BOOL)hasPnrodIntelligenceFlowResponseGenerationComponentSummary
{
  return self->_hasPnrodIntelligenceFlowResponseGenerationComponentSummary;
}

- (void)setHasPnrodPNRODIntelligenceFlowPlannerComponentSummary:(BOOL)a3
{
  self->_hasPnrodPNRODIntelligenceFlowPlannerComponentSummary = a3;
}

- (BOOL)hasPnrodPNRODIntelligenceFlowPlannerComponentSummary
{
  return self->_hasPnrodPNRODIntelligenceFlowPlannerComponentSummary;
}

- (void)setHasPnrodIntelligenceFlowSessionSummary:(BOOL)a3
{
  self->_hasPnrodIntelligenceFlowSessionSummary = a3;
}

- (BOOL)hasPnrodIntelligenceFlowSessionSummary
{
  return self->_hasPnrodIntelligenceFlowSessionSummary;
}

- (void)setHasPnrodIntelligenceFlowActionGrainSummary:(BOOL)a3
{
  self->_hasPnrodIntelligenceFlowActionGrainSummary = a3;
}

- (BOOL)hasPnrodIntelligenceFlowActionGrainSummary
{
  return self->_hasPnrodIntelligenceFlowActionGrainSummary;
}

- (void)setHasPnrodIntelligenceFlowPlannerGrainSummary:(BOOL)a3
{
  self->_hasPnrodIntelligenceFlowPlannerGrainSummary = a3;
}

- (BOOL)hasPnrodIntelligenceFlowPlannerGrainSummary
{
  return self->_hasPnrodIntelligenceFlowPlannerGrainSummary;
}

- (void)setHasPnrodIntelligenceFlowRequestGrainSummary:(BOOL)a3
{
  self->_hasPnrodIntelligenceFlowRequestGrainSummary = a3;
}

- (BOOL)hasPnrodIntelligenceFlowRequestGrainSummary
{
  return self->_hasPnrodIntelligenceFlowRequestGrainSummary;
}

- (void)setHasPnrodSiriTurnGrainSummary:(BOOL)a3
{
  self->_hasPnrodSiriTurnGrainSummary = a3;
}

- (BOOL)hasPnrodSiriTurnGrainSummary
{
  return self->_hasPnrodSiriTurnGrainSummary;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (PNRODSchemaPNRODClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (PNRODSchemaPNRODClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PNRODSchemaPNRODClientEvent;
  v5 = [(PNRODSchemaPNRODClientEvent *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PNRODSchemaPNRODClientEventMetadata alloc] initWithDictionary:v6];
      [(PNRODSchemaPNRODClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"pnrodSiriTurnGrainSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PNRODSchemaPNRODSiriTurnGrainSummary alloc] initWithDictionary:v8];
      [(PNRODSchemaPNRODClientEvent *)v5 setPnrodSiriTurnGrainSummary:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"pnrodIntelligenceFlowRequestGrainSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary alloc] initWithDictionary:v10];
      [(PNRODSchemaPNRODClientEvent *)v5 setPnrodIntelligenceFlowRequestGrainSummary:v11];
    }
    v30 = (void *)v10;
    uint64_t v12 = [v4 objectForKeyedSubscript:@"pnrodIntelligenceFlowPlannerGrainSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary alloc] initWithDictionary:v12];
      [(PNRODSchemaPNRODClientEvent *)v5 setPnrodIntelligenceFlowPlannerGrainSummary:v13];
    }
    int v29 = (void *)v12;
    int v14 = [v4 objectForKeyedSubscript:@"pnrodIntelligenceFlowActionGrainSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[PNRODSchemaPNRODIntelligenceFlowActionGrainSummary alloc] initWithDictionary:v14];
      [(PNRODSchemaPNRODClientEvent *)v5 setPnrodIntelligenceFlowActionGrainSummary:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"pnrodIntelligenceFlowSessionSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[PNRODSchemaPNRODIntelligenceFlowSessionSummary alloc] initWithDictionary:v16];
      [(PNRODSchemaPNRODClientEvent *)v5 setPnrodIntelligenceFlowSessionSummary:v17];
    }
    v31 = (void *)v8;
    v18 = [v4 objectForKeyedSubscript:@"pnrodPNRODIntelligenceFlowPlannerComponentSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary alloc] initWithDictionary:v18];
      [(PNRODSchemaPNRODClientEvent *)v5 setPnrodPNRODIntelligenceFlowPlannerComponentSummary:v19];
    }
    int v20 = (void *)v6;
    v21 = [v4 objectForKeyedSubscript:@"pnrodIntelligenceFlowResponseGenerationComponentSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary alloc] initWithDictionary:v21];
      [(PNRODSchemaPNRODClientEvent *)v5 setPnrodIntelligenceFlowResponseGenerationComponentSummary:v22];
    }
    int v23 = [v4 objectForKeyedSubscript:@"pnronIntelligenceFlowExecutorComponentSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary alloc] initWithDictionary:v23];
      [(PNRODSchemaPNRODClientEvent *)v5 setPnronIntelligenceFlowExecutorComponentSummary:v24];
    }
    v25 = [v4 objectForKeyedSubscript:@"pnronScheduleDebugSummary"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v26 = [[PNRODSchemaPNRODScheduleDebugSummary alloc] initWithDictionary:v25];
      [(PNRODSchemaPNRODClientEvent *)v5 setPnronScheduleDebugSummary:v26];
    }
    v27 = v5;
  }
  return v5;
}

- (PNRODSchemaPNRODClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNRODSchemaPNRODClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PNRODSchemaPNRODClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_eventMetadata)
  {
    id v4 = [(PNRODSchemaPNRODClientEvent *)self eventMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_pnrodIntelligenceFlowActionGrainSummary)
  {
    uint64_t v7 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowActionGrainSummary];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"pnrodIntelligenceFlowActionGrainSummary"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"pnrodIntelligenceFlowActionGrainSummary"];
    }
  }
  if (self->_pnrodIntelligenceFlowPlannerGrainSummary)
  {
    uint64_t v10 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowPlannerGrainSummary];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"pnrodIntelligenceFlowPlannerGrainSummary"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"pnrodIntelligenceFlowPlannerGrainSummary"];
    }
  }
  if (self->_pnrodIntelligenceFlowRequestGrainSummary)
  {
    v13 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowRequestGrainSummary];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"pnrodIntelligenceFlowRequestGrainSummary"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"pnrodIntelligenceFlowRequestGrainSummary"];
    }
  }
  if (self->_pnrodIntelligenceFlowResponseGenerationComponentSummary)
  {
    v16 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowResponseGenerationComponentSummary];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"pnrodIntelligenceFlowResponseGenerationComponentSummary"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"pnrodIntelligenceFlowResponseGenerationComponentSummary"];
    }
  }
  if (self->_pnrodIntelligenceFlowSessionSummary)
  {
    v19 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowSessionSummary];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"pnrodIntelligenceFlowSessionSummary"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"pnrodIntelligenceFlowSessionSummary"];
    }
  }
  if (self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary)
  {
    v22 = [(PNRODSchemaPNRODClientEvent *)self pnrodPNRODIntelligenceFlowPlannerComponentSummary];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"pnrodPNRODIntelligenceFlowPlannerComponentSummary"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"pnrodPNRODIntelligenceFlowPlannerComponentSummary"];
    }
  }
  if (self->_pnrodSiriTurnGrainSummary)
  {
    v25 = [(PNRODSchemaPNRODClientEvent *)self pnrodSiriTurnGrainSummary];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"pnrodSiriTurnGrainSummary"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"pnrodSiriTurnGrainSummary"];
    }
  }
  if (self->_pnronIntelligenceFlowExecutorComponentSummary)
  {
    v28 = [(PNRODSchemaPNRODClientEvent *)self pnronIntelligenceFlowExecutorComponentSummary];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"pnronIntelligenceFlowExecutorComponentSummary"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"pnronIntelligenceFlowExecutorComponentSummary"];
    }
  }
  if (self->_pnronScheduleDebugSummary)
  {
    v31 = [(PNRODSchemaPNRODClientEvent *)self pnronScheduleDebugSummary];
    objc_super v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"pnronScheduleDebugSummary"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"pnronScheduleDebugSummary"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PNRODSchemaPNRODClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(PNRODSchemaPNRODSiriTurnGrainSummary *)self->_pnrodSiriTurnGrainSummary hash] ^ v3;
  unint64_t v5 = [(PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)self->_pnrodIntelligenceFlowRequestGrainSummary hash];
  unint64_t v6 = v4 ^ v5 ^ [(PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)self->_pnrodIntelligenceFlowPlannerGrainSummary hash];
  unint64_t v7 = [(PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)self->_pnrodIntelligenceFlowActionGrainSummary hash];
  unint64_t v8 = v7 ^ [(PNRODSchemaPNRODIntelligenceFlowSessionSummary *)self->_pnrodIntelligenceFlowSessionSummary hash];
  unint64_t v9 = v6 ^ v8 ^ [(PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary hash];
  unint64_t v10 = [(PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)self->_pnrodIntelligenceFlowResponseGenerationComponentSummary hash];
  unint64_t v11 = v10 ^ [(PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)self->_pnronIntelligenceFlowExecutorComponentSummary hash];
  return v9 ^ v11 ^ [(PNRODSchemaPNRODScheduleDebugSummary *)self->_pnronScheduleDebugSummary hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_53;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_53;
  }
  unint64_t v6 = [(PNRODSchemaPNRODClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v8 = [(PNRODSchemaPNRODClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(PNRODSchemaPNRODClientEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PNRODSchemaPNRODClientEvent *)self pnrodSiriTurnGrainSummary];
  unint64_t v7 = [v4 pnrodSiriTurnGrainSummary];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v13 = [(PNRODSchemaPNRODClientEvent *)self pnrodSiriTurnGrainSummary];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(PNRODSchemaPNRODClientEvent *)self pnrodSiriTurnGrainSummary];
    v16 = [v4 pnrodSiriTurnGrainSummary];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowRequestGrainSummary];
  unint64_t v7 = [v4 pnrodIntelligenceFlowRequestGrainSummary];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v18 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowRequestGrainSummary];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowRequestGrainSummary];
    v21 = [v4 pnrodIntelligenceFlowRequestGrainSummary];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowPlannerGrainSummary];
  unint64_t v7 = [v4 pnrodIntelligenceFlowPlannerGrainSummary];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v23 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowPlannerGrainSummary];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowPlannerGrainSummary];
    int v26 = [v4 pnrodIntelligenceFlowPlannerGrainSummary];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowActionGrainSummary];
  unint64_t v7 = [v4 pnrodIntelligenceFlowActionGrainSummary];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v28 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowActionGrainSummary];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowActionGrainSummary];
    v31 = [v4 pnrodIntelligenceFlowActionGrainSummary];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowSessionSummary];
  unint64_t v7 = [v4 pnrodIntelligenceFlowSessionSummary];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v33 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowSessionSummary];
  if (v33)
  {
    v34 = (void *)v33;
    int v35 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowSessionSummary];
    v36 = [v4 pnrodIntelligenceFlowSessionSummary];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PNRODSchemaPNRODClientEvent *)self pnrodPNRODIntelligenceFlowPlannerComponentSummary];
  unint64_t v7 = [v4 pnrodPNRODIntelligenceFlowPlannerComponentSummary];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v38 = [(PNRODSchemaPNRODClientEvent *)self pnrodPNRODIntelligenceFlowPlannerComponentSummary];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(PNRODSchemaPNRODClientEvent *)self pnrodPNRODIntelligenceFlowPlannerComponentSummary];
    v41 = [v4 pnrodPNRODIntelligenceFlowPlannerComponentSummary];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowResponseGenerationComponentSummary];
  unint64_t v7 = [v4 pnrodIntelligenceFlowResponseGenerationComponentSummary];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v43 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowResponseGenerationComponentSummary];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowResponseGenerationComponentSummary];
    v46 = [v4 pnrodIntelligenceFlowResponseGenerationComponentSummary];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PNRODSchemaPNRODClientEvent *)self pnronIntelligenceFlowExecutorComponentSummary];
  unint64_t v7 = [v4 pnronIntelligenceFlowExecutorComponentSummary];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_52;
  }
  uint64_t v48 = [(PNRODSchemaPNRODClientEvent *)self pnronIntelligenceFlowExecutorComponentSummary];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(PNRODSchemaPNRODClientEvent *)self pnronIntelligenceFlowExecutorComponentSummary];
    v51 = [v4 pnronIntelligenceFlowExecutorComponentSummary];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_53;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PNRODSchemaPNRODClientEvent *)self pnronScheduleDebugSummary];
  unint64_t v7 = [v4 pnronScheduleDebugSummary];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v53 = [(PNRODSchemaPNRODClientEvent *)self pnronScheduleDebugSummary];
    if (!v53)
    {

LABEL_56:
      BOOL v58 = 1;
      goto LABEL_54;
    }
    v54 = (void *)v53;
    v55 = [(PNRODSchemaPNRODClientEvent *)self pnronScheduleDebugSummary];
    v56 = [v4 pnronScheduleDebugSummary];
    char v57 = [v55 isEqual:v56];

    if (v57) {
      goto LABEL_56;
    }
  }
  else
  {
LABEL_52:
  }
LABEL_53:
  BOOL v58 = 0;
LABEL_54:

  return v58;
}

- (void)writeTo:(id)a3
{
  id v24 = a3;
  id v4 = [(PNRODSchemaPNRODClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(PNRODSchemaPNRODClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(PNRODSchemaPNRODClientEvent *)self pnrodSiriTurnGrainSummary];

  if (v6)
  {
    unint64_t v7 = [(PNRODSchemaPNRODClientEvent *)self pnrodSiriTurnGrainSummary];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowRequestGrainSummary];

  if (v8)
  {
    unint64_t v9 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowRequestGrainSummary];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowPlannerGrainSummary];

  if (v10)
  {
    unint64_t v11 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowPlannerGrainSummary];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowActionGrainSummary];

  if (v12)
  {
    uint64_t v13 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowActionGrainSummary];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowSessionSummary];

  if (v14)
  {
    v15 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowSessionSummary];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(PNRODSchemaPNRODClientEvent *)self pnrodPNRODIntelligenceFlowPlannerComponentSummary];

  if (v16)
  {
    int v17 = [(PNRODSchemaPNRODClientEvent *)self pnrodPNRODIntelligenceFlowPlannerComponentSummary];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowResponseGenerationComponentSummary];

  if (v18)
  {
    v19 = [(PNRODSchemaPNRODClientEvent *)self pnrodIntelligenceFlowResponseGenerationComponentSummary];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(PNRODSchemaPNRODClientEvent *)self pnronIntelligenceFlowExecutorComponentSummary];

  if (v20)
  {
    v21 = [(PNRODSchemaPNRODClientEvent *)self pnronIntelligenceFlowExecutorComponentSummary];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(PNRODSchemaPNRODClientEvent *)self pnronScheduleDebugSummary];

  if (v22)
  {
    uint64_t v23 = [(PNRODSchemaPNRODClientEvent *)self pnronScheduleDebugSummary];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PNRODSchemaPNRODClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deletePnronScheduleDebugSummary
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pnronScheduleDebugSummary = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PNRODSchemaPNRODScheduleDebugSummary)pnronScheduleDebugSummary
{
  if (self->_whichEvent_Type == 109) {
    v2 = self->_pnronScheduleDebugSummary;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPnronScheduleDebugSummary:(id)a3
{
  id v4 = (PNRODSchemaPNRODScheduleDebugSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  unint64_t v13 = 109;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = v4;
}

- (void)deletePnronIntelligenceFlowExecutorComponentSummary
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pnronIntelligenceFlowExecutorComponentSummary = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary)pnronIntelligenceFlowExecutorComponentSummary
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_pnronIntelligenceFlowExecutorComponentSummary;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPnronIntelligenceFlowExecutorComponentSummary:(id)a3
{
  id v4 = (PNRODSchemaPNRODIntelligenceFlowExecutorComponentSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  unint64_t v13 = 108;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = v4;
}

- (void)deletePnrodIntelligenceFlowResponseGenerationComponentSummary
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary)pnrodIntelligenceFlowResponseGenerationComponentSummary
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPnrodIntelligenceFlowResponseGenerationComponentSummary:(id)a3
{
  id v4 = (PNRODSchemaPNRODIntelligenceFlowResponseGenerationComponentSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  unint64_t v13 = 107;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = v4;
}

- (void)deletePnrodPNRODIntelligenceFlowPlannerComponentSummary
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary)pnrodPNRODIntelligenceFlowPlannerComponentSummary
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPnrodPNRODIntelligenceFlowPlannerComponentSummary:(id)a3
{
  id v4 = (PNRODSchemaPNRODIntelligenceFlowPlannerComponentSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  unint64_t v13 = 106;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = v4;
}

- (void)deletePnrodIntelligenceFlowSessionSummary
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pnrodIntelligenceFlowSessionSummary = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PNRODSchemaPNRODIntelligenceFlowSessionSummary)pnrodIntelligenceFlowSessionSummary
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_pnrodIntelligenceFlowSessionSummary;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPnrodIntelligenceFlowSessionSummary:(id)a3
{
  id v4 = (PNRODSchemaPNRODIntelligenceFlowSessionSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  unint64_t v13 = 105;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = v4;
}

- (void)deletePnrodIntelligenceFlowActionGrainSummary
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pnrodIntelligenceFlowActionGrainSummary = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PNRODSchemaPNRODIntelligenceFlowActionGrainSummary)pnrodIntelligenceFlowActionGrainSummary
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_pnrodIntelligenceFlowActionGrainSummary;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPnrodIntelligenceFlowActionGrainSummary:(id)a3
{
  id v4 = (PNRODSchemaPNRODIntelligenceFlowActionGrainSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  unint64_t v13 = 104;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = v4;
}

- (void)deletePnrodIntelligenceFlowPlannerGrainSummary
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary)pnrodIntelligenceFlowPlannerGrainSummary
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPnrodIntelligenceFlowPlannerGrainSummary:(id)a3
{
  id v4 = (PNRODSchemaPNRODIntelligenceFlowPlannerGrainSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  unint64_t v13 = 103;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = v4;
}

- (void)deletePnrodIntelligenceFlowRequestGrainSummary
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pnrodIntelligenceFlowRequestGrainSummary = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary)pnrodIntelligenceFlowRequestGrainSummary
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_pnrodIntelligenceFlowRequestGrainSummary;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPnrodIntelligenceFlowRequestGrainSummary:(id)a3
{
  id v4 = (PNRODSchemaPNRODIntelligenceFlowRequestGrainSummary *)a3;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  unint64_t v13 = 102;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = v4;
}

- (void)deletePnrodSiriTurnGrainSummary
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pnrodSiriTurnGrainSummary = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PNRODSchemaPNRODSiriTurnGrainSummary)pnrodSiriTurnGrainSummary
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_pnrodSiriTurnGrainSummary;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPnrodSiriTurnGrainSummary:(id)a3
{
  id v4 = (PNRODSchemaPNRODSiriTurnGrainSummary *)a3;
  pnrodIntelligenceFlowRequestGrainSummary = self->_pnrodIntelligenceFlowRequestGrainSummary;
  self->_pnrodIntelligenceFlowRequestGrainSummary = 0;

  pnrodIntelligenceFlowPlannerGrainSummary = self->_pnrodIntelligenceFlowPlannerGrainSummary;
  self->_pnrodIntelligenceFlowPlannerGrainSummary = 0;

  pnrodIntelligenceFlowActionGrainSummary = self->_pnrodIntelligenceFlowActionGrainSummary;
  self->_pnrodIntelligenceFlowActionGrainSummary = 0;

  pnrodIntelligenceFlowSessionSummary = self->_pnrodIntelligenceFlowSessionSummary;
  self->_pnrodIntelligenceFlowSessionSummary = 0;

  pnrodPNRODIntelligenceFlowPlannerComponentSummary = self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary;
  self->_pnrodPNRODIntelligenceFlowPlannerComponentSummary = 0;

  pnrodIntelligenceFlowResponseGenerationComponentSummary = self->_pnrodIntelligenceFlowResponseGenerationComponentSummary;
  self->_pnrodIntelligenceFlowResponseGenerationComponentSummary = 0;

  pnronIntelligenceFlowExecutorComponentSummary = self->_pnronIntelligenceFlowExecutorComponentSummary;
  self->_pnronIntelligenceFlowExecutorComponentSummary = 0;

  pnronScheduleDebugSummary = self->_pnronScheduleDebugSummary;
  self->_pnronScheduleDebugSummary = 0;

  unint64_t v13 = 101;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichEvent_Type = v13;
  pnrodSiriTurnGrainSummary = self->_pnrodSiriTurnGrainSummary;
  self->_pnrodSiriTurnGrainSummary = v4;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(PNRODSchemaPNRODClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 8) {
    return @"com.apple.aiml.siri.pnrod.PNRODClientEvent";
  }
  else {
    return off_1E5EBEFF0[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 91;
}

@end