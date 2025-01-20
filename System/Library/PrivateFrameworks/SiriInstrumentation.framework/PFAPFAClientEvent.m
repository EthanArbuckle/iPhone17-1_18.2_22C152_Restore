@interface PFAPFAClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
- (BOOL)hasEventMetadata;
- (BOOL)hasIngestionExtensionStreamStatistics;
- (BOOL)hasOrchestratorResultsStatsReported;
- (BOOL)hasPreprocessorExecutionContext;
- (BOOL)hasPreprocessorSessionEndStatsReported;
- (BOOL)hasPreprocessorSessionStartStatsReported;
- (BOOL)hasRepackagingExecution;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PFAIngestionExtensionStreamStatistics)ingestionExtensionStreamStatistics;
- (PFAPFAClientEvent)initWithDictionary:(id)a3;
- (PFAPFAClientEvent)initWithJSON:(id)a3;
- (PFAPFAEventMetadata)eventMetadata;
- (PFAPreprocessorExecutionContext)preprocessorExecutionContext;
- (PFAPreprocessorOrchestratorResultsStatsReported)orchestratorResultsStatsReported;
- (PFAPreprocessorSessionEndStatsReported)preprocessorSessionEndStatsReported;
- (PFAPreprocessorSessionStartStatsReported)preprocessorSessionStartStatsReported;
- (PFARepackagingExecution)repackagingExecution;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteEventMetadata;
- (void)deleteIngestionExtensionStreamStatistics;
- (void)deleteOrchestratorResultsStatsReported;
- (void)deletePreprocessorExecutionContext;
- (void)deletePreprocessorSessionEndStatsReported;
- (void)deletePreprocessorSessionStartStatsReported;
- (void)deleteRepackagingExecution;
- (void)setEventMetadata:(id)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasIngestionExtensionStreamStatistics:(BOOL)a3;
- (void)setHasOrchestratorResultsStatsReported:(BOOL)a3;
- (void)setHasPreprocessorExecutionContext:(BOOL)a3;
- (void)setHasPreprocessorSessionEndStatsReported:(BOOL)a3;
- (void)setHasPreprocessorSessionStartStatsReported:(BOOL)a3;
- (void)setHasRepackagingExecution:(BOOL)a3;
- (void)setIngestionExtensionStreamStatistics:(id)a3;
- (void)setOrchestratorResultsStatsReported:(id)a3;
- (void)setPreprocessorExecutionContext:(id)a3;
- (void)setPreprocessorSessionEndStatsReported:(id)a3;
- (void)setPreprocessorSessionStartStatsReported:(id)a3;
- (void)setRepackagingExecution:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PFAPFAClientEvent

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PFAPFAClientEvent;
  v5 = [(SISchemaInstrumentationMessage *)&v28 applySensitiveConditionsPolicy:v4];
  v6 = [(PFAPFAClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PFAPFAClientEvent *)self deleteEventMetadata];
  }
  v9 = [(PFAPFAClientEvent *)self repackagingExecution];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PFAPFAClientEvent *)self deleteRepackagingExecution];
  }
  v12 = [(PFAPFAClientEvent *)self preprocessorExecutionContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PFAPFAClientEvent *)self deletePreprocessorExecutionContext];
  }
  v15 = [(PFAPFAClientEvent *)self preprocessorSessionStartStatsReported];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PFAPFAClientEvent *)self deletePreprocessorSessionStartStatsReported];
  }
  v18 = [(PFAPFAClientEvent *)self preprocessorSessionEndStatsReported];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PFAPFAClientEvent *)self deletePreprocessorSessionEndStatsReported];
  }
  v21 = [(PFAPFAClientEvent *)self orchestratorResultsStatsReported];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PFAPFAClientEvent *)self deleteOrchestratorResultsStatsReported];
  }
  v24 = [(PFAPFAClientEvent *)self ingestionExtensionStreamStatistics];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PFAPFAClientEvent *)self deleteIngestionExtensionStreamStatistics];
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
  unint64_t v3 = [(PFAPFAClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 5) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAB808[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 5) {
    return 0;
  }
  else {
    return off_1E5EAB838[a3 - 101];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingestionExtensionStreamStatistics, 0);
  objc_storeStrong((id *)&self->_orchestratorResultsStatsReported, 0);
  objc_storeStrong((id *)&self->_preprocessorSessionEndStatsReported, 0);
  objc_storeStrong((id *)&self->_preprocessorSessionStartStatsReported, 0);
  objc_storeStrong((id *)&self->_preprocessorExecutionContext, 0);
  objc_storeStrong((id *)&self->_repackagingExecution, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasIngestionExtensionStreamStatistics:(BOOL)a3
{
  self->_hasIngestionExtensionStreamStatistics = a3;
}

- (BOOL)hasIngestionExtensionStreamStatistics
{
  return self->_hasIngestionExtensionStreamStatistics;
}

- (void)setHasOrchestratorResultsStatsReported:(BOOL)a3
{
  self->_hasOrchestratorResultsStatsReported = a3;
}

- (BOOL)hasOrchestratorResultsStatsReported
{
  return self->_hasOrchestratorResultsStatsReported;
}

- (void)setHasPreprocessorSessionEndStatsReported:(BOOL)a3
{
  self->_hasPreprocessorSessionEndStatsReported = a3;
}

- (BOOL)hasPreprocessorSessionEndStatsReported
{
  return self->_hasPreprocessorSessionEndStatsReported;
}

- (void)setHasPreprocessorSessionStartStatsReported:(BOOL)a3
{
  self->_hasPreprocessorSessionStartStatsReported = a3;
}

- (BOOL)hasPreprocessorSessionStartStatsReported
{
  return self->_hasPreprocessorSessionStartStatsReported;
}

- (void)setHasPreprocessorExecutionContext:(BOOL)a3
{
  self->_hasPreprocessorExecutionContext = a3;
}

- (BOOL)hasPreprocessorExecutionContext
{
  return self->_hasPreprocessorExecutionContext;
}

- (void)setHasRepackagingExecution:(BOOL)a3
{
  self->_hasRepackagingExecution = a3;
}

- (BOOL)hasRepackagingExecution
{
  return self->_hasRepackagingExecution;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (PFAPFAEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (PFAPFAClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PFAPFAClientEvent;
  v5 = [(PFAPFAClientEvent *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PFAPFAEventMetadata alloc] initWithDictionary:v6];
      [(PFAPFAClientEvent *)v5 setEventMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"repackagingExecution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PFARepackagingExecution alloc] initWithDictionary:v8];
      [(PFAPFAClientEvent *)v5 setRepackagingExecution:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"preprocessorExecutionContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PFAPreprocessorExecutionContext alloc] initWithDictionary:v10];
      [(PFAPFAClientEvent *)v5 setPreprocessorExecutionContext:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"preprocessorSessionStartStatsReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[PFAPreprocessorSessionStartStatsReported alloc] initWithDictionary:v12];
      [(PFAPFAClientEvent *)v5 setPreprocessorSessionStartStatsReported:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"preprocessorSessionEndStatsReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[PFAPreprocessorSessionEndStatsReported alloc] initWithDictionary:v14];
      [(PFAPFAClientEvent *)v5 setPreprocessorSessionEndStatsReported:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"orchestratorResultsStatsReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[PFAPreprocessorOrchestratorResultsStatsReported alloc] initWithDictionary:v16];
      [(PFAPFAClientEvent *)v5 setOrchestratorResultsStatsReported:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"ingestionExtensionStreamStatistics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PFAIngestionExtensionStreamStatistics alloc] initWithDictionary:v18];
      [(PFAPFAClientEvent *)v5 setIngestionExtensionStreamStatistics:v19];
    }
    int v20 = v5;
  }
  return v5;
}

- (PFAPFAClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PFAPFAClientEvent *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PFAPFAClientEvent *)self dictionaryRepresentation];
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
    id v4 = [(PFAPFAClientEvent *)self eventMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_ingestionExtensionStreamStatistics)
  {
    uint64_t v7 = [(PFAPFAClientEvent *)self ingestionExtensionStreamStatistics];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"ingestionExtensionStreamStatistics"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"ingestionExtensionStreamStatistics"];
    }
  }
  if (self->_orchestratorResultsStatsReported)
  {
    v10 = [(PFAPFAClientEvent *)self orchestratorResultsStatsReported];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"orchestratorResultsStatsReported"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"orchestratorResultsStatsReported"];
    }
  }
  if (self->_preprocessorExecutionContext)
  {
    v13 = [(PFAPFAClientEvent *)self preprocessorExecutionContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"preprocessorExecutionContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"preprocessorExecutionContext"];
    }
  }
  if (self->_preprocessorSessionEndStatsReported)
  {
    v16 = [(PFAPFAClientEvent *)self preprocessorSessionEndStatsReported];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"preprocessorSessionEndStatsReported"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"preprocessorSessionEndStatsReported"];
    }
  }
  if (self->_preprocessorSessionStartStatsReported)
  {
    v19 = [(PFAPFAClientEvent *)self preprocessorSessionStartStatsReported];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"preprocessorSessionStartStatsReported"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"preprocessorSessionStartStatsReported"];
    }
  }
  if (self->_repackagingExecution)
  {
    objc_super v22 = [(PFAPFAClientEvent *)self repackagingExecution];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"repackagingExecution"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"repackagingExecution"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PFAPFAEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(PFARepackagingExecution *)self->_repackagingExecution hash] ^ v3;
  unint64_t v5 = [(PFAPreprocessorExecutionContext *)self->_preprocessorExecutionContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(PFAPreprocessorSessionStartStatsReported *)self->_preprocessorSessionStartStatsReported hash];
  unint64_t v7 = [(PFAPreprocessorSessionEndStatsReported *)self->_preprocessorSessionEndStatsReported hash];
  unint64_t v8 = v7 ^ [(PFAPreprocessorOrchestratorResultsStatsReported *)self->_orchestratorResultsStatsReported hash];
  return v6 ^ v8 ^ [(PFAIngestionExtensionStreamStatistics *)self->_ingestionExtensionStreamStatistics hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_38;
  }
  unint64_t v6 = [(PFAPFAClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v8 = [(PFAPFAClientEvent *)self eventMetadata];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(PFAPFAClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PFAPFAClientEvent *)self repackagingExecution];
  unint64_t v7 = [v4 repackagingExecution];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v13 = [(PFAPFAClientEvent *)self repackagingExecution];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(PFAPFAClientEvent *)self repackagingExecution];
    v16 = [v4 repackagingExecution];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PFAPFAClientEvent *)self preprocessorExecutionContext];
  unint64_t v7 = [v4 preprocessorExecutionContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v18 = [(PFAPFAClientEvent *)self preprocessorExecutionContext];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(PFAPFAClientEvent *)self preprocessorExecutionContext];
    v21 = [v4 preprocessorExecutionContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PFAPFAClientEvent *)self preprocessorSessionStartStatsReported];
  unint64_t v7 = [v4 preprocessorSessionStartStatsReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v23 = [(PFAPFAClientEvent *)self preprocessorSessionStartStatsReported];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(PFAPFAClientEvent *)self preprocessorSessionStartStatsReported];
    int v26 = [v4 preprocessorSessionStartStatsReported];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PFAPFAClientEvent *)self preprocessorSessionEndStatsReported];
  unint64_t v7 = [v4 preprocessorSessionEndStatsReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v28 = [(PFAPFAClientEvent *)self preprocessorSessionEndStatsReported];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [(PFAPFAClientEvent *)self preprocessorSessionEndStatsReported];
    v31 = [v4 preprocessorSessionEndStatsReported];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PFAPFAClientEvent *)self orchestratorResultsStatsReported];
  unint64_t v7 = [v4 orchestratorResultsStatsReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_37;
  }
  uint64_t v33 = [(PFAPFAClientEvent *)self orchestratorResultsStatsReported];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(PFAPFAClientEvent *)self orchestratorResultsStatsReported];
    v36 = [v4 orchestratorResultsStatsReported];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_38;
    }
  }
  else
  {
  }
  unint64_t v6 = [(PFAPFAClientEvent *)self ingestionExtensionStreamStatistics];
  unint64_t v7 = [v4 ingestionExtensionStreamStatistics];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v38 = [(PFAPFAClientEvent *)self ingestionExtensionStreamStatistics];
    if (!v38)
    {

LABEL_41:
      BOOL v43 = 1;
      goto LABEL_39;
    }
    v39 = (void *)v38;
    v40 = [(PFAPFAClientEvent *)self ingestionExtensionStreamStatistics];
    v41 = [v4 ingestionExtensionStreamStatistics];
    char v42 = [v40 isEqual:v41];

    if (v42) {
      goto LABEL_41;
    }
  }
  else
  {
LABEL_37:
  }
LABEL_38:
  BOOL v43 = 0;
LABEL_39:

  return v43;
}

- (void)writeTo:(id)a3
{
  id v18 = a3;
  id v4 = [(PFAPFAClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(PFAPFAClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(PFAPFAClientEvent *)self repackagingExecution];

  if (v6)
  {
    unint64_t v7 = [(PFAPFAClientEvent *)self repackagingExecution];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(PFAPFAClientEvent *)self preprocessorExecutionContext];

  if (v8)
  {
    v9 = [(PFAPFAClientEvent *)self preprocessorExecutionContext];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(PFAPFAClientEvent *)self preprocessorSessionStartStatsReported];

  if (v10)
  {
    int v11 = [(PFAPFAClientEvent *)self preprocessorSessionStartStatsReported];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(PFAPFAClientEvent *)self preprocessorSessionEndStatsReported];

  if (v12)
  {
    uint64_t v13 = [(PFAPFAClientEvent *)self preprocessorSessionEndStatsReported];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(PFAPFAClientEvent *)self orchestratorResultsStatsReported];

  if (v14)
  {
    v15 = [(PFAPFAClientEvent *)self orchestratorResultsStatsReported];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(PFAPFAClientEvent *)self ingestionExtensionStreamStatistics];

  if (v16)
  {
    int v17 = [(PFAPFAClientEvent *)self ingestionExtensionStreamStatistics];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PFAPFAClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteIngestionExtensionStreamStatistics
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_ingestionExtensionStreamStatistics = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PFAIngestionExtensionStreamStatistics)ingestionExtensionStreamStatistics
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_ingestionExtensionStreamStatistics;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setIngestionExtensionStreamStatistics:(id)a3
{
  id v4 = (PFAIngestionExtensionStreamStatistics *)a3;
  repackagingExecution = self->_repackagingExecution;
  self->_repackagingExecution = 0;

  preprocessorExecutionContext = self->_preprocessorExecutionContext;
  self->_preprocessorExecutionContext = 0;

  preprocessorSessionStartStatsReported = self->_preprocessorSessionStartStatsReported;
  self->_preprocessorSessionStartStatsReported = 0;

  preprocessorSessionEndStatsReported = self->_preprocessorSessionEndStatsReported;
  self->_preprocessorSessionEndStatsReported = 0;

  orchestratorResultsStatsReported = self->_orchestratorResultsStatsReported;
  self->_orchestratorResultsStatsReported = 0;

  unint64_t v10 = 106;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  ingestionExtensionStreamStatistics = self->_ingestionExtensionStreamStatistics;
  self->_ingestionExtensionStreamStatistics = v4;
}

- (void)deleteOrchestratorResultsStatsReported
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_orchestratorResultsStatsReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PFAPreprocessorOrchestratorResultsStatsReported)orchestratorResultsStatsReported
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_orchestratorResultsStatsReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOrchestratorResultsStatsReported:(id)a3
{
  id v4 = (PFAPreprocessorOrchestratorResultsStatsReported *)a3;
  repackagingExecution = self->_repackagingExecution;
  self->_repackagingExecution = 0;

  preprocessorExecutionContext = self->_preprocessorExecutionContext;
  self->_preprocessorExecutionContext = 0;

  preprocessorSessionStartStatsReported = self->_preprocessorSessionStartStatsReported;
  self->_preprocessorSessionStartStatsReported = 0;

  preprocessorSessionEndStatsReported = self->_preprocessorSessionEndStatsReported;
  self->_preprocessorSessionEndStatsReported = 0;

  ingestionExtensionStreamStatistics = self->_ingestionExtensionStreamStatistics;
  self->_ingestionExtensionStreamStatistics = 0;

  unint64_t v10 = 105;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  orchestratorResultsStatsReported = self->_orchestratorResultsStatsReported;
  self->_orchestratorResultsStatsReported = v4;
}

- (void)deletePreprocessorSessionEndStatsReported
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_preprocessorSessionEndStatsReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PFAPreprocessorSessionEndStatsReported)preprocessorSessionEndStatsReported
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_preprocessorSessionEndStatsReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPreprocessorSessionEndStatsReported:(id)a3
{
  id v4 = (PFAPreprocessorSessionEndStatsReported *)a3;
  repackagingExecution = self->_repackagingExecution;
  self->_repackagingExecution = 0;

  preprocessorExecutionContext = self->_preprocessorExecutionContext;
  self->_preprocessorExecutionContext = 0;

  preprocessorSessionStartStatsReported = self->_preprocessorSessionStartStatsReported;
  self->_preprocessorSessionStartStatsReported = 0;

  orchestratorResultsStatsReported = self->_orchestratorResultsStatsReported;
  self->_orchestratorResultsStatsReported = 0;

  ingestionExtensionStreamStatistics = self->_ingestionExtensionStreamStatistics;
  self->_ingestionExtensionStreamStatistics = 0;

  unint64_t v10 = 104;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  preprocessorSessionEndStatsReported = self->_preprocessorSessionEndStatsReported;
  self->_preprocessorSessionEndStatsReported = v4;
}

- (void)deletePreprocessorSessionStartStatsReported
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_preprocessorSessionStartStatsReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PFAPreprocessorSessionStartStatsReported)preprocessorSessionStartStatsReported
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_preprocessorSessionStartStatsReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPreprocessorSessionStartStatsReported:(id)a3
{
  id v4 = (PFAPreprocessorSessionStartStatsReported *)a3;
  repackagingExecution = self->_repackagingExecution;
  self->_repackagingExecution = 0;

  preprocessorExecutionContext = self->_preprocessorExecutionContext;
  self->_preprocessorExecutionContext = 0;

  preprocessorSessionEndStatsReported = self->_preprocessorSessionEndStatsReported;
  self->_preprocessorSessionEndStatsReported = 0;

  orchestratorResultsStatsReported = self->_orchestratorResultsStatsReported;
  self->_orchestratorResultsStatsReported = 0;

  ingestionExtensionStreamStatistics = self->_ingestionExtensionStreamStatistics;
  self->_ingestionExtensionStreamStatistics = 0;

  unint64_t v10 = 103;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  preprocessorSessionStartStatsReported = self->_preprocessorSessionStartStatsReported;
  self->_preprocessorSessionStartStatsReported = v4;
}

- (void)deletePreprocessorExecutionContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_preprocessorExecutionContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PFAPreprocessorExecutionContext)preprocessorExecutionContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_preprocessorExecutionContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPreprocessorExecutionContext:(id)a3
{
  id v4 = (PFAPreprocessorExecutionContext *)a3;
  repackagingExecution = self->_repackagingExecution;
  self->_repackagingExecution = 0;

  preprocessorSessionStartStatsReported = self->_preprocessorSessionStartStatsReported;
  self->_preprocessorSessionStartStatsReported = 0;

  preprocessorSessionEndStatsReported = self->_preprocessorSessionEndStatsReported;
  self->_preprocessorSessionEndStatsReported = 0;

  orchestratorResultsStatsReported = self->_orchestratorResultsStatsReported;
  self->_orchestratorResultsStatsReported = 0;

  ingestionExtensionStreamStatistics = self->_ingestionExtensionStreamStatistics;
  self->_ingestionExtensionStreamStatistics = 0;

  unint64_t v10 = 102;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  preprocessorExecutionContext = self->_preprocessorExecutionContext;
  self->_preprocessorExecutionContext = v4;
}

- (void)deleteRepackagingExecution
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_repackagingExecution = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PFARepackagingExecution)repackagingExecution
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_repackagingExecution;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setRepackagingExecution:(id)a3
{
  id v4 = (PFARepackagingExecution *)a3;
  preprocessorExecutionContext = self->_preprocessorExecutionContext;
  self->_preprocessorExecutionContext = 0;

  preprocessorSessionStartStatsReported = self->_preprocessorSessionStartStatsReported;
  self->_preprocessorSessionStartStatsReported = 0;

  preprocessorSessionEndStatsReported = self->_preprocessorSessionEndStatsReported;
  self->_preprocessorSessionEndStatsReported = 0;

  orchestratorResultsStatsReported = self->_orchestratorResultsStatsReported;
  self->_orchestratorResultsStatsReported = 0;

  ingestionExtensionStreamStatistics = self->_ingestionExtensionStreamStatistics;
  self->_ingestionExtensionStreamStatistics = 0;

  unint64_t v10 = 101;
  if (!v4) {
    unint64_t v10 = 0;
  }
  self->_unint64_t whichEvent_Type = v10;
  repackagingExecution = self->_repackagingExecution;
  self->_repackagingExecution = v4;
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
  unint64_t v2 = [(PFAPFAClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 5) {
    return @"com.apple.aiml.lighthouse.pfa.PFAClientEvent";
  }
  else {
    return off_1E5EBDB80[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 86;
}

@end