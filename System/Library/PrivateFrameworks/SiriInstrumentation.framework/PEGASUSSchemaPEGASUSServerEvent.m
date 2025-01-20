@interface PEGASUSSchemaPEGASUSServerEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasEventMetadata;
- (BOOL)hasPegasusAmpSafetyLoggingInfo;
- (BOOL)hasPegasusInfoDomainMultistepAndMultiturnExecutionReported;
- (BOOL)hasPegasusRequestContext;
- (BOOL)hasPegasusRequestEndedTier1;
- (BOOL)hasPegasusRewrittenUtterancesReported;
- (BOOL)hasPegasusRewrittenUtterancesReportedTier1;
- (BOOL)hasPegasusUtteranceUnderstandingReported;
- (BOOL)hasPegasusUtteranceUnderstandingReportedTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo)pegasusAmpSafetyLoggingInfo;
- (PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported)pegasusInfoDomainMultistepAndMultiturnExecutionReported;
- (PEGASUSSchemaPEGASUSRequestContext)pegasusRequestContext;
- (PEGASUSSchemaPEGASUSRequestEndedTier1)pegasusRequestEndedTier1;
- (PEGASUSSchemaPEGASUSRewrittenUtterancesReported)pegasusRewrittenUtterancesReported;
- (PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1)pegasusRewrittenUtterancesReportedTier1;
- (PEGASUSSchemaPEGASUSServerEvent)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSServerEvent)initWithJSON:(id)a3;
- (PEGASUSSchemaPEGASUSServerEventMetadata)eventMetadata;
- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReported)pegasusUtteranceUnderstandingReported;
- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1)pegasusUtteranceUnderstandingReportedTier1;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteEventMetadata;
- (void)deletePegasusAmpSafetyLoggingInfo;
- (void)deletePegasusInfoDomainMultistepAndMultiturnExecutionReported;
- (void)deletePegasusRequestContext;
- (void)deletePegasusRequestEndedTier1;
- (void)deletePegasusRewrittenUtterancesReported;
- (void)deletePegasusRewrittenUtterancesReportedTier1;
- (void)deletePegasusUtteranceUnderstandingReported;
- (void)deletePegasusUtteranceUnderstandingReportedTier1;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasPegasusAmpSafetyLoggingInfo:(BOOL)a3;
- (void)setHasPegasusInfoDomainMultistepAndMultiturnExecutionReported:(BOOL)a3;
- (void)setHasPegasusRequestContext:(BOOL)a3;
- (void)setHasPegasusRequestEndedTier1:(BOOL)a3;
- (void)setHasPegasusRewrittenUtterancesReported:(BOOL)a3;
- (void)setHasPegasusRewrittenUtterancesReportedTier1:(BOOL)a3;
- (void)setHasPegasusUtteranceUnderstandingReported:(BOOL)a3;
- (void)setHasPegasusUtteranceUnderstandingReportedTier1:(BOOL)a3;
- (void)setPegasusAmpSafetyLoggingInfo:(id)a3;
- (void)setPegasusInfoDomainMultistepAndMultiturnExecutionReported:(id)a3;
- (void)setPegasusRequestContext:(id)a3;
- (void)setPegasusRequestEndedTier1:(id)a3;
- (void)setPegasusRewrittenUtterancesReported:(id)a3;
- (void)setPegasusRewrittenUtterancesReportedTier1:(id)a3;
- (void)setPegasusUtteranceUnderstandingReported:(id)a3;
- (void)setPegasusUtteranceUnderstandingReportedTier1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSServerEvent

- (int)componentName
{
  v2 = [(PEGASUSSchemaPEGASUSServerEvent *)self eventMetadata];
  v3 = [v2 pegasusId];

  if (v3)
  {
    v4 = [v3 value];
    if (v4)
    {
      v5 = [v3 value];
      uint64_t v6 = [v5 length];

      if (v6) {
        LODWORD(v4) = 24;
      }
      else {
        LODWORD(v4) = 0;
      }
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }

  return (int)v4;
}

- (id)getComponentId
{
  v2 = [(PEGASUSSchemaPEGASUSServerEvent *)self eventMetadata];
  v3 = [v2 pegasusId];

  if (!v3) {
    goto LABEL_5;
  }
  id v4 = [v3 value];
  if (!v4) {
    goto LABEL_6;
  }
  v5 = [v3 value];
  uint64_t v6 = [v5 length];

  if (v6) {
    id v4 = v3;
  }
  else {
LABEL_5:
  }
    id v4 = 0;
LABEL_6:

  return v4;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PEGASUSSchemaPEGASUSServerEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v34 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRewrittenUtterancesReportedTier1];
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusUtteranceUnderstandingReportedTier1];
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRequestEndedTier1];
  }
  if ([v4 isConditionSet:4])
  {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRewrittenUtterancesReportedTier1];
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusUtteranceUnderstandingReportedTier1];
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRequestEndedTier1];
  }
  if ([v4 isConditionSet:5])
  {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRewrittenUtterancesReportedTier1];
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusUtteranceUnderstandingReportedTier1];
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRequestEndedTier1];
  }
  if ([v4 isConditionSet:6])
  {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRewrittenUtterancesReportedTier1];
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusUtteranceUnderstandingReportedTier1];
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRequestEndedTier1];
  }
  if ([v4 isConditionSet:7])
  {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRewrittenUtterancesReportedTier1];
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusUtteranceUnderstandingReportedTier1];
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRequestEndedTier1];
  }
  uint64_t v6 = [(PEGASUSSchemaPEGASUSServerEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deleteEventMetadata];
  }
  v9 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRequestContext];
  }
  v12 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReported];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRewrittenUtterancesReported];
  }
  v15 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReportedTier1];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRewrittenUtterancesReportedTier1];
  }
  v18 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReported];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusUtteranceUnderstandingReported];
  }
  v21 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReportedTier1];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusUtteranceUnderstandingReportedTier1];
  }
  v24 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestEndedTier1];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusRequestEndedTier1];
  }
  v27 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusInfoDomainMultistepAndMultiturnExecutionReported];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusInfoDomainMultistepAndMultiturnExecutionReported];
  }
  v30 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusAmpSafetyLoggingInfo];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(PEGASUSSchemaPEGASUSServerEvent *)self deletePegasusAmpSafetyLoggingInfo];
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
  unint64_t v3 = [(PEGASUSSchemaPEGASUSServerEvent *)self whichEvent_Type];
  if (v3 - 101 > 7) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAB788[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 7) {
    return 0;
  }
  else {
    return off_1E5EAB7C8[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pegasusAmpSafetyLoggingInfo, 0);
  objc_storeStrong((id *)&self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported, 0);
  objc_storeStrong((id *)&self->_pegasusRequestEndedTier1, 0);
  objc_storeStrong((id *)&self->_pegasusUtteranceUnderstandingReportedTier1, 0);
  objc_storeStrong((id *)&self->_pegasusUtteranceUnderstandingReported, 0);
  objc_storeStrong((id *)&self->_pegasusRewrittenUtterancesReportedTier1, 0);
  objc_storeStrong((id *)&self->_pegasusRewrittenUtterancesReported, 0);
  objc_storeStrong((id *)&self->_pegasusRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasPegasusAmpSafetyLoggingInfo:(BOOL)a3
{
  self->_hasPegasusAmpSafetyLoggingInfo = a3;
}

- (BOOL)hasPegasusAmpSafetyLoggingInfo
{
  return self->_hasPegasusAmpSafetyLoggingInfo;
}

- (void)setHasPegasusInfoDomainMultistepAndMultiturnExecutionReported:(BOOL)a3
{
  self->_hasPegasusInfoDomainMultistepAndMultiturnExecutionReported = a3;
}

- (BOOL)hasPegasusInfoDomainMultistepAndMultiturnExecutionReported
{
  return self->_hasPegasusInfoDomainMultistepAndMultiturnExecutionReported;
}

- (void)setHasPegasusRequestEndedTier1:(BOOL)a3
{
  self->_hasPegasusRequestEndedTier1 = a3;
}

- (BOOL)hasPegasusRequestEndedTier1
{
  return self->_hasPegasusRequestEndedTier1;
}

- (void)setHasPegasusUtteranceUnderstandingReportedTier1:(BOOL)a3
{
  self->_hasPegasusUtteranceUnderstandingReportedTier1 = a3;
}

- (BOOL)hasPegasusUtteranceUnderstandingReportedTier1
{
  return self->_hasPegasusUtteranceUnderstandingReportedTier1;
}

- (void)setHasPegasusUtteranceUnderstandingReported:(BOOL)a3
{
  self->_hasPegasusUtteranceUnderstandingReported = a3;
}

- (BOOL)hasPegasusUtteranceUnderstandingReported
{
  return self->_hasPegasusUtteranceUnderstandingReported;
}

- (void)setHasPegasusRewrittenUtterancesReportedTier1:(BOOL)a3
{
  self->_hasPegasusRewrittenUtterancesReportedTier1 = a3;
}

- (BOOL)hasPegasusRewrittenUtterancesReportedTier1
{
  return self->_hasPegasusRewrittenUtterancesReportedTier1;
}

- (void)setHasPegasusRewrittenUtterancesReported:(BOOL)a3
{
  self->_hasPegasusRewrittenUtterancesReported = a3;
}

- (BOOL)hasPegasusRewrittenUtterancesReported
{
  return self->_hasPegasusRewrittenUtterancesReported;
}

- (void)setHasPegasusRequestContext:(BOOL)a3
{
  self->_hasPegasusRequestContext = a3;
}

- (BOOL)hasPegasusRequestContext
{
  return self->_hasPegasusRequestContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (PEGASUSSchemaPEGASUSServerEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (PEGASUSSchemaPEGASUSServerEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PEGASUSSchemaPEGASUSServerEvent;
  v5 = [(PEGASUSSchemaPEGASUSServerEvent *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PEGASUSSchemaPEGASUSServerEventMetadata alloc] initWithDictionary:v6];
      [(PEGASUSSchemaPEGASUSServerEvent *)v5 setEventMetadata:v7];
    }
    v27 = (void *)v6;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"pegasusRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PEGASUSSchemaPEGASUSRequestContext alloc] initWithDictionary:v8];
      [(PEGASUSSchemaPEGASUSServerEvent *)v5 setPegasusRequestContext:v9];
    }
    v10 = objc_msgSend(v4, "objectForKeyedSubscript:", @"pegasusRewrittenUtterancesReported", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PEGASUSSchemaPEGASUSRewrittenUtterancesReported alloc] initWithDictionary:v10];
      [(PEGASUSSchemaPEGASUSServerEvent *)v5 setPegasusRewrittenUtterancesReported:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"pegasusRewrittenUtterancesReportedTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 alloc] initWithDictionary:v12];
      [(PEGASUSSchemaPEGASUSServerEvent *)v5 setPegasusRewrittenUtterancesReportedTier1:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"pegasusUtteranceUnderstandingReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[PEGASUSSchemaPEGASUSUtteranceUnderstandingReported alloc] initWithDictionary:v14];
      [(PEGASUSSchemaPEGASUSServerEvent *)v5 setPegasusUtteranceUnderstandingReported:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"pegasusUtteranceUnderstandingReportedTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 alloc] initWithDictionary:v16];
      [(PEGASUSSchemaPEGASUSServerEvent *)v5 setPegasusUtteranceUnderstandingReportedTier1:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"pegasusRequestEndedTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PEGASUSSchemaPEGASUSRequestEndedTier1 alloc] initWithDictionary:v18];
      [(PEGASUSSchemaPEGASUSServerEvent *)v5 setPegasusRequestEndedTier1:v19];
    }
    int v20 = [v4 objectForKeyedSubscript:@"pegasusInfoDomainMultistepAndMultiturnExecutionReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported alloc] initWithDictionary:v20];
      [(PEGASUSSchemaPEGASUSServerEvent *)v5 setPegasusInfoDomainMultistepAndMultiturnExecutionReported:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"pegasusAmpSafetyLoggingInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo alloc] initWithDictionary:v22];
      [(PEGASUSSchemaPEGASUSServerEvent *)v5 setPegasusAmpSafetyLoggingInfo:v23];
    }
    v24 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSServerEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSServerEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSServerEvent *)self dictionaryRepresentation];
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
    id v4 = [(PEGASUSSchemaPEGASUSServerEvent *)self eventMetadata];
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
  if (self->_pegasusAmpSafetyLoggingInfo)
  {
    uint64_t v7 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusAmpSafetyLoggingInfo];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"pegasusAmpSafetyLoggingInfo"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"pegasusAmpSafetyLoggingInfo"];
    }
  }
  if (self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported)
  {
    v10 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusInfoDomainMultistepAndMultiturnExecutionReported];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"pegasusInfoDomainMultistepAndMultiturnExecutionReported"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"pegasusInfoDomainMultistepAndMultiturnExecutionReported"];
    }
  }
  if (self->_pegasusRequestContext)
  {
    v13 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"pegasusRequestContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"pegasusRequestContext"];
    }
  }
  if (self->_pegasusRequestEndedTier1)
  {
    v16 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestEndedTier1];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"pegasusRequestEndedTier1"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"pegasusRequestEndedTier1"];
    }
  }
  if (self->_pegasusRewrittenUtterancesReported)
  {
    v19 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReported];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"pegasusRewrittenUtterancesReported"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"pegasusRewrittenUtterancesReported"];
    }
  }
  if (self->_pegasusRewrittenUtterancesReportedTier1)
  {
    v22 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReportedTier1];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"pegasusRewrittenUtterancesReportedTier1"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"pegasusRewrittenUtterancesReportedTier1"];
    }
  }
  if (self->_pegasusUtteranceUnderstandingReported)
  {
    v25 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReported];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"pegasusUtteranceUnderstandingReported"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"pegasusUtteranceUnderstandingReported"];
    }
  }
  if (self->_pegasusUtteranceUnderstandingReportedTier1)
  {
    objc_super v28 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReportedTier1];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"pegasusUtteranceUnderstandingReportedTier1"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"pegasusUtteranceUnderstandingReportedTier1"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PEGASUSSchemaPEGASUSServerEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(PEGASUSSchemaPEGASUSRequestContext *)self->_pegasusRequestContext hash] ^ v3;
  unint64_t v5 = [(PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)self->_pegasusRewrittenUtterancesReported hash];
  unint64_t v6 = v4 ^ v5 ^ [(PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *)self->_pegasusRewrittenUtterancesReportedTier1 hash];
  unint64_t v7 = [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *)self->_pegasusUtteranceUnderstandingReported hash];
  unint64_t v8 = v7 ^ [(PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)self->_pegasusUtteranceUnderstandingReportedTier1 hash];
  unint64_t v9 = v6 ^ v8 ^ [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self->_pegasusRequestEndedTier1 hash];
  unint64_t v10 = [(PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported hash];
  return v9 ^ v10 ^ [(PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)self->_pegasusAmpSafetyLoggingInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_48;
  }
  unint64_t v6 = [(PEGASUSSchemaPEGASUSServerEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v8 = [(PEGASUSSchemaPEGASUSServerEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(PEGASUSSchemaPEGASUSServerEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestContext];
  unint64_t v7 = [v4 pegasusRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v13 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestContext];
    v16 = [v4 pegasusRequestContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReported];
  unint64_t v7 = [v4 pegasusRewrittenUtterancesReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v18 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReported];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReported];
    v21 = [v4 pegasusRewrittenUtterancesReported];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReportedTier1];
  unint64_t v7 = [v4 pegasusRewrittenUtterancesReportedTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v23 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReportedTier1];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReportedTier1];
    int v26 = [v4 pegasusRewrittenUtterancesReportedTier1];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReported];
  unint64_t v7 = [v4 pegasusUtteranceUnderstandingReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v28 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReported];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReported];
    v31 = [v4 pegasusUtteranceUnderstandingReported];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReportedTier1];
  unint64_t v7 = [v4 pegasusUtteranceUnderstandingReportedTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v33 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReportedTier1];
  if (v33)
  {
    objc_super v34 = (void *)v33;
    v35 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReportedTier1];
    v36 = [v4 pegasusUtteranceUnderstandingReportedTier1];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestEndedTier1];
  unint64_t v7 = [v4 pegasusRequestEndedTier1];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v38 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestEndedTier1];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestEndedTier1];
    v41 = [v4 pegasusRequestEndedTier1];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusInfoDomainMultistepAndMultiturnExecutionReported];
  unint64_t v7 = [v4 pegasusInfoDomainMultistepAndMultiturnExecutionReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_47;
  }
  uint64_t v43 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusInfoDomainMultistepAndMultiturnExecutionReported];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusInfoDomainMultistepAndMultiturnExecutionReported];
    v46 = [v4 pegasusInfoDomainMultistepAndMultiturnExecutionReported];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_48;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusAmpSafetyLoggingInfo];
  unint64_t v7 = [v4 pegasusAmpSafetyLoggingInfo];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v48 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusAmpSafetyLoggingInfo];
    if (!v48)
    {

LABEL_51:
      BOOL v53 = 1;
      goto LABEL_49;
    }
    v49 = (void *)v48;
    v50 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusAmpSafetyLoggingInfo];
    v51 = [v4 pegasusAmpSafetyLoggingInfo];
    char v52 = [v50 isEqual:v51];

    if (v52) {
      goto LABEL_51;
    }
  }
  else
  {
LABEL_47:
  }
LABEL_48:
  BOOL v53 = 0;
LABEL_49:

  return v53;
}

- (void)writeTo:(id)a3
{
  id v22 = a3;
  id v4 = [(PEGASUSSchemaPEGASUSServerEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(PEGASUSSchemaPEGASUSServerEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestContext];

  if (v6)
  {
    unint64_t v7 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReported];

  if (v8)
  {
    unint64_t v9 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReported];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReportedTier1];

  if (v10)
  {
    int v11 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRewrittenUtterancesReportedTier1];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReported];

  if (v12)
  {
    uint64_t v13 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReported];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReportedTier1];

  if (v14)
  {
    v15 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusUtteranceUnderstandingReportedTier1];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestEndedTier1];

  if (v16)
  {
    int v17 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusRequestEndedTier1];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusInfoDomainMultistepAndMultiturnExecutionReported];

  if (v18)
  {
    v19 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusInfoDomainMultistepAndMultiturnExecutionReported];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusAmpSafetyLoggingInfo];

  if (v20)
  {
    v21 = [(PEGASUSSchemaPEGASUSServerEvent *)self pegasusAmpSafetyLoggingInfo];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSServerEventReadFrom(self, (uint64_t)a3);
}

- (void)deletePegasusAmpSafetyLoggingInfo
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pegasusAmpSafetyLoggingInfo = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo)pegasusAmpSafetyLoggingInfo
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_pegasusAmpSafetyLoggingInfo;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPegasusAmpSafetyLoggingInfo:(id)a3
{
  id v4 = (PEGASUSSchemaPEGASUSAMPSafetyLoggingInfo *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = 0;

  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = 0;

  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = 0;

  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  unint64_t v12 = 108;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  pegasusAmpSafetyLoggingInfo = self->_pegasusAmpSafetyLoggingInfo;
  self->_pegasusAmpSafetyLoggingInfo = v4;
}

- (void)deletePegasusInfoDomainMultistepAndMultiturnExecutionReported
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported)pegasusInfoDomainMultistepAndMultiturnExecutionReported
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPegasusInfoDomainMultistepAndMultiturnExecutionReported:(id)a3
{
  id v4 = (PEGASUSSchemaPEGASUSInfoDomainMultistepAndMultiturnExecutionReported *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = 0;

  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = 0;

  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = 0;

  pegasusAmpSafetyLoggingInfo = self->_pegasusAmpSafetyLoggingInfo;
  self->_pegasusAmpSafetyLoggingInfo = 0;

  unint64_t v12 = 107;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = v4;
}

- (void)deletePegasusRequestEndedTier1
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pegasusRequestEndedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PEGASUSSchemaPEGASUSRequestEndedTier1)pegasusRequestEndedTier1
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_pegasusRequestEndedTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPegasusRequestEndedTier1:(id)a3
{
  id v4 = (PEGASUSSchemaPEGASUSRequestEndedTier1 *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = 0;

  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = 0;

  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  pegasusAmpSafetyLoggingInfo = self->_pegasusAmpSafetyLoggingInfo;
  self->_pegasusAmpSafetyLoggingInfo = 0;

  unint64_t v12 = 106;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = v4;
}

- (void)deletePegasusUtteranceUnderstandingReportedTier1
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pegasusUtteranceUnderstandingReportedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1)pegasusUtteranceUnderstandingReportedTier1
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_pegasusUtteranceUnderstandingReportedTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPegasusUtteranceUnderstandingReportedTier1:(id)a3
{
  id v4 = (PEGASUSSchemaPEGASUSUtteranceUnderstandingReportedTier1 *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = 0;

  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = 0;

  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = 0;

  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  pegasusAmpSafetyLoggingInfo = self->_pegasusAmpSafetyLoggingInfo;
  self->_pegasusAmpSafetyLoggingInfo = 0;

  unint64_t v12 = 105;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = v4;
}

- (void)deletePegasusUtteranceUnderstandingReported
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pegasusUtteranceUnderstandingReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PEGASUSSchemaPEGASUSUtteranceUnderstandingReported)pegasusUtteranceUnderstandingReported
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_pegasusUtteranceUnderstandingReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPegasusUtteranceUnderstandingReported:(id)a3
{
  id v4 = (PEGASUSSchemaPEGASUSUtteranceUnderstandingReported *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = 0;

  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = 0;

  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  pegasusAmpSafetyLoggingInfo = self->_pegasusAmpSafetyLoggingInfo;
  self->_pegasusAmpSafetyLoggingInfo = 0;

  unint64_t v12 = 104;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = v4;
}

- (void)deletePegasusRewrittenUtterancesReportedTier1
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pegasusRewrittenUtterancesReportedTier1 = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1)pegasusRewrittenUtterancesReportedTier1
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_pegasusRewrittenUtterancesReportedTier1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPegasusRewrittenUtterancesReportedTier1:(id)a3
{
  id v4 = (PEGASUSSchemaPEGASUSRewrittenUtterancesReportedTier1 *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = 0;

  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = 0;

  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = 0;

  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  pegasusAmpSafetyLoggingInfo = self->_pegasusAmpSafetyLoggingInfo;
  self->_pegasusAmpSafetyLoggingInfo = 0;

  unint64_t v12 = 103;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = v4;
}

- (void)deletePegasusRewrittenUtterancesReported
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pegasusRewrittenUtterancesReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PEGASUSSchemaPEGASUSRewrittenUtterancesReported)pegasusRewrittenUtterancesReported
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_pegasusRewrittenUtterancesReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPegasusRewrittenUtterancesReported:(id)a3
{
  id v4 = (PEGASUSSchemaPEGASUSRewrittenUtterancesReported *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = 0;

  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = 0;

  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  pegasusAmpSafetyLoggingInfo = self->_pegasusAmpSafetyLoggingInfo;
  self->_pegasusAmpSafetyLoggingInfo = 0;

  unint64_t v12 = 102;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = v4;
}

- (void)deletePegasusRequestContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pegasusRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PEGASUSSchemaPEGASUSRequestContext)pegasusRequestContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_pegasusRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPegasusRequestContext:(id)a3
{
  id v4 = (PEGASUSSchemaPEGASUSRequestContext *)a3;
  pegasusRewrittenUtterancesReported = self->_pegasusRewrittenUtterancesReported;
  self->_pegasusRewrittenUtterancesReported = 0;

  pegasusRewrittenUtterancesReportedTier1 = self->_pegasusRewrittenUtterancesReportedTier1;
  self->_pegasusRewrittenUtterancesReportedTier1 = 0;

  pegasusUtteranceUnderstandingReported = self->_pegasusUtteranceUnderstandingReported;
  self->_pegasusUtteranceUnderstandingReported = 0;

  pegasusUtteranceUnderstandingReportedTier1 = self->_pegasusUtteranceUnderstandingReportedTier1;
  self->_pegasusUtteranceUnderstandingReportedTier1 = 0;

  pegasusRequestEndedTier1 = self->_pegasusRequestEndedTier1;
  self->_pegasusRequestEndedTier1 = 0;

  pegasusInfoDomainMultistepAndMultiturnExecutionReported = self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported;
  self->_pegasusInfoDomainMultistepAndMultiturnExecutionReported = 0;

  pegasusAmpSafetyLoggingInfo = self->_pegasusAmpSafetyLoggingInfo;
  self->_pegasusAmpSafetyLoggingInfo = 0;

  unint64_t v12 = 101;
  if (!v4) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichEvent_Type = v12;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = v4;
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
  unint64_t v2 = [(PEGASUSSchemaPEGASUSServerEvent *)self whichEvent_Type];
  if (v2 - 101 > 7) {
    return @"com.apple.aiml.siri.pegasus.PEGASUSServerEvent";
  }
  else {
    return off_1E5EB3D08[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 49;
}

@end