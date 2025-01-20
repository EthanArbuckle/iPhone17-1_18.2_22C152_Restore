@interface ODDSiriSchemaODDAssistantExperimentCounts
- (BOOL)hasReliabilityCounts;
- (BOOL)hasSessionCounts;
- (BOOL)hasTaskCounts;
- (BOOL)hasTurnCounts;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDAssistantExperimentCounts)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDAssistantExperimentCounts)initWithJSON:(id)a3;
- (ODDSiriSchemaODDReliabilityCounts)reliabilityCounts;
- (ODDSiriSchemaODDSessionCounts)sessionCounts;
- (ODDSiriSchemaODDTaskCounts)taskCounts;
- (ODDSiriSchemaODDTurnCounts)turnCounts;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteReliabilityCounts;
- (void)deleteSessionCounts;
- (void)deleteTaskCounts;
- (void)deleteTurnCounts;
- (void)setHasReliabilityCounts:(BOOL)a3;
- (void)setHasSessionCounts:(BOOL)a3;
- (void)setHasTaskCounts:(BOOL)a3;
- (void)setHasTurnCounts:(BOOL)a3;
- (void)setReliabilityCounts:(id)a3;
- (void)setSessionCounts:(id)a3;
- (void)setTaskCounts:(id)a3;
- (void)setTurnCounts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDAssistantExperimentCounts

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ODDSiriSchemaODDAssistantExperimentCounts;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self turnCounts];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDAssistantExperimentCounts *)self deleteTurnCounts];
  }
  v9 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self taskCounts];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDAssistantExperimentCounts *)self deleteTaskCounts];
  }
  v12 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self reliabilityCounts];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ODDSiriSchemaODDAssistantExperimentCounts *)self deleteReliabilityCounts];
  }
  v15 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self sessionCounts];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(ODDSiriSchemaODDAssistantExperimentCounts *)self deleteSessionCounts];
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
  objc_storeStrong((id *)&self->_sessionCounts, 0);
  objc_storeStrong((id *)&self->_reliabilityCounts, 0);
  objc_storeStrong((id *)&self->_taskCounts, 0);
  objc_storeStrong((id *)&self->_turnCounts, 0);
}

- (void)setHasSessionCounts:(BOOL)a3
{
  self->_hasSessionCounts = a3;
}

- (void)setHasReliabilityCounts:(BOOL)a3
{
  self->_hasReliabilityCounts = a3;
}

- (void)setHasTaskCounts:(BOOL)a3
{
  self->_hasTaskCounts = a3;
}

- (void)setHasTurnCounts:(BOOL)a3
{
  self->_hasTurnCounts = a3;
}

- (void)setSessionCounts:(id)a3
{
}

- (ODDSiriSchemaODDSessionCounts)sessionCounts
{
  return self->_sessionCounts;
}

- (void)setReliabilityCounts:(id)a3
{
}

- (ODDSiriSchemaODDReliabilityCounts)reliabilityCounts
{
  return self->_reliabilityCounts;
}

- (void)setTaskCounts:(id)a3
{
}

- (ODDSiriSchemaODDTaskCounts)taskCounts
{
  return self->_taskCounts;
}

- (void)setTurnCounts:(id)a3
{
}

- (ODDSiriSchemaODDTurnCounts)turnCounts
{
  return self->_turnCounts;
}

- (ODDSiriSchemaODDAssistantExperimentCounts)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ODDSiriSchemaODDAssistantExperimentCounts;
  v5 = [(ODDSiriSchemaODDAssistantExperimentCounts *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"turnCounts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDTurnCounts alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDAssistantExperimentCounts *)v5 setTurnCounts:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"taskCounts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODDSiriSchemaODDTaskCounts alloc] initWithDictionary:v8];
      [(ODDSiriSchemaODDAssistantExperimentCounts *)v5 setTaskCounts:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"reliabilityCounts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ODDSiriSchemaODDReliabilityCounts alloc] initWithDictionary:v10];
      [(ODDSiriSchemaODDAssistantExperimentCounts *)v5 setReliabilityCounts:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"sessionCounts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[ODDSiriSchemaODDSessionCounts alloc] initWithDictionary:v12];
      [(ODDSiriSchemaODDAssistantExperimentCounts *)v5 setSessionCounts:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDAssistantExperimentCounts)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDAssistantExperimentCounts *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self dictionaryRepresentation];
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
  if (self->_reliabilityCounts)
  {
    id v4 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self reliabilityCounts];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"reliabilityCounts"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"reliabilityCounts"];
    }
  }
  if (self->_sessionCounts)
  {
    uint64_t v7 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self sessionCounts];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"sessionCounts"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"sessionCounts"];
    }
  }
  if (self->_taskCounts)
  {
    v10 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self taskCounts];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"taskCounts"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"taskCounts"];
    }
  }
  if (self->_turnCounts)
  {
    v13 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self turnCounts];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"turnCounts"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"turnCounts"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDTurnCounts *)self->_turnCounts hash];
  unint64_t v4 = [(ODDSiriSchemaODDTaskCounts *)self->_taskCounts hash] ^ v3;
  unint64_t v5 = [(ODDSiriSchemaODDReliabilityCounts *)self->_reliabilityCounts hash];
  return v4 ^ v5 ^ [(ODDSiriSchemaODDSessionCounts *)self->_sessionCounts hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self turnCounts];
  v6 = [v4 turnCounts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self turnCounts];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self turnCounts];
    v10 = [v4 turnCounts];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self taskCounts];
  v6 = [v4 taskCounts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self taskCounts];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self taskCounts];
    v15 = [v4 taskCounts];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self reliabilityCounts];
  v6 = [v4 reliabilityCounts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self reliabilityCounts];
  if (v17)
  {
    v18 = (void *)v17;
    objc_super v19 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self reliabilityCounts];
    v20 = [v4 reliabilityCounts];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self sessionCounts];
  v6 = [v4 sessionCounts];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v22 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self sessionCounts];
    if (!v22)
    {

LABEL_25:
      BOOL v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    v24 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self sessionCounts];
    v25 = [v4 sessionCounts];
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
  id v4 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self turnCounts];

  if (v4)
  {
    unint64_t v5 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self turnCounts];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self taskCounts];

  if (v6)
  {
    uint64_t v7 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self taskCounts];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self reliabilityCounts];

  if (v8)
  {
    v9 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self reliabilityCounts];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self sessionCounts];

  if (v10)
  {
    int v11 = [(ODDSiriSchemaODDAssistantExperimentCounts *)self sessionCounts];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantExperimentCountsReadFrom(self, (uint64_t)a3);
}

- (void)deleteSessionCounts
{
}

- (BOOL)hasSessionCounts
{
  return self->_sessionCounts != 0;
}

- (void)deleteReliabilityCounts
{
}

- (BOOL)hasReliabilityCounts
{
  return self->_reliabilityCounts != 0;
}

- (void)deleteTaskCounts
{
}

- (BOOL)hasTaskCounts
{
  return self->_taskCounts != 0;
}

- (void)deleteTurnCounts
{
}

- (BOOL)hasTurnCounts
{
  return self->_turnCounts != 0;
}

@end