@interface ODDSiriSchemaODDAssistantCounts
- (BOOL)hasReliabilityCounts;
- (BOOL)hasTaskCounts;
- (BOOL)hasTurnCounts;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDAssistantCounts)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDAssistantCounts)initWithJSON:(id)a3;
- (ODDSiriSchemaODDReliabilityCounts)reliabilityCounts;
- (ODDSiriSchemaODDTaskCounts)taskCounts;
- (ODDSiriSchemaODDTurnCounts)turnCounts;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteReliabilityCounts;
- (void)deleteTaskCounts;
- (void)deleteTurnCounts;
- (void)setHasReliabilityCounts:(BOOL)a3;
- (void)setHasTaskCounts:(BOOL)a3;
- (void)setHasTurnCounts:(BOOL)a3;
- (void)setReliabilityCounts:(id)a3;
- (void)setTaskCounts:(id)a3;
- (void)setTurnCounts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDAssistantCounts

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ODDSiriSchemaODDAssistantCounts;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDAssistantCounts *)self turnCounts];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDAssistantCounts *)self deleteTurnCounts];
  }
  v9 = [(ODDSiriSchemaODDAssistantCounts *)self taskCounts];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDAssistantCounts *)self deleteTaskCounts];
  }
  v12 = [(ODDSiriSchemaODDAssistantCounts *)self reliabilityCounts];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ODDSiriSchemaODDAssistantCounts *)self deleteReliabilityCounts];
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
  objc_storeStrong((id *)&self->_reliabilityCounts, 0);
  objc_storeStrong((id *)&self->_taskCounts, 0);
  objc_storeStrong((id *)&self->_turnCounts, 0);
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

- (ODDSiriSchemaODDAssistantCounts)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ODDSiriSchemaODDAssistantCounts;
  v5 = [(ODDSiriSchemaODDAssistantCounts *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"turnCounts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDTurnCounts alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDAssistantCounts *)v5 setTurnCounts:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"taskCounts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODDSiriSchemaODDTaskCounts alloc] initWithDictionary:v8];
      [(ODDSiriSchemaODDAssistantCounts *)v5 setTaskCounts:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"reliabilityCounts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ODDSiriSchemaODDReliabilityCounts alloc] initWithDictionary:v10];
      [(ODDSiriSchemaODDAssistantCounts *)v5 setReliabilityCounts:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDAssistantCounts)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDAssistantCounts *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDAssistantCounts *)self dictionaryRepresentation];
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
    id v4 = [(ODDSiriSchemaODDAssistantCounts *)self reliabilityCounts];
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
  if (self->_taskCounts)
  {
    uint64_t v7 = [(ODDSiriSchemaODDAssistantCounts *)self taskCounts];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"taskCounts"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"taskCounts"];
    }
  }
  if (self->_turnCounts)
  {
    v10 = [(ODDSiriSchemaODDAssistantCounts *)self turnCounts];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"turnCounts"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"turnCounts"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDTurnCounts *)self->_turnCounts hash];
  unint64_t v4 = [(ODDSiriSchemaODDTaskCounts *)self->_taskCounts hash] ^ v3;
  return v4 ^ [(ODDSiriSchemaODDReliabilityCounts *)self->_reliabilityCounts hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(ODDSiriSchemaODDAssistantCounts *)self turnCounts];
  v6 = [v4 turnCounts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssistantCounts *)self turnCounts];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(ODDSiriSchemaODDAssistantCounts *)self turnCounts];
    v10 = [v4 turnCounts];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ODDSiriSchemaODDAssistantCounts *)self taskCounts];
  v6 = [v4 taskCounts];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(ODDSiriSchemaODDAssistantCounts *)self taskCounts];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(ODDSiriSchemaODDAssistantCounts *)self taskCounts];
    v15 = [v4 taskCounts];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ODDSiriSchemaODDAssistantCounts *)self reliabilityCounts];
  v6 = [v4 reliabilityCounts];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(ODDSiriSchemaODDAssistantCounts *)self reliabilityCounts];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(ODDSiriSchemaODDAssistantCounts *)self reliabilityCounts];
    v20 = [v4 reliabilityCounts];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  id v4 = [(ODDSiriSchemaODDAssistantCounts *)self turnCounts];

  if (v4)
  {
    v5 = [(ODDSiriSchemaODDAssistantCounts *)self turnCounts];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(ODDSiriSchemaODDAssistantCounts *)self taskCounts];

  if (v6)
  {
    uint64_t v7 = [(ODDSiriSchemaODDAssistantCounts *)self taskCounts];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(ODDSiriSchemaODDAssistantCounts *)self reliabilityCounts];

  if (v8)
  {
    v9 = [(ODDSiriSchemaODDAssistantCounts *)self reliabilityCounts];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantCountsReadFrom(self, (uint64_t)a3);
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