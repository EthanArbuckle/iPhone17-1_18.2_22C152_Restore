@interface NLXSchemaCDMSystemReportedFailure
- (BOOL)hasReason;
- (BOOL)hasTask;
- (BOOL)hasTaskId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMSystemReportedFailure)initWithDictionary:(id)a3;
- (NLXSchemaCDMSystemReportedFailure)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)taskId;
- (USOSchemaUSOGraph)reason;
- (USOSchemaUSOGraph)task;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteReason;
- (void)deleteTask;
- (void)deleteTaskId;
- (void)setHasReason:(BOOL)a3;
- (void)setHasTask:(BOOL)a3;
- (void)setHasTaskId:(BOOL)a3;
- (void)setReason:(id)a3;
- (void)setTask:(id)a3;
- (void)setTaskId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMSystemReportedFailure

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NLXSchemaCDMSystemReportedFailure;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMSystemReportedFailure *)self taskId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaCDMSystemReportedFailure *)self deleteTaskId];
  }
  v9 = [(NLXSchemaCDMSystemReportedFailure *)self reason];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLXSchemaCDMSystemReportedFailure *)self deleteReason];
  }
  v12 = [(NLXSchemaCDMSystemReportedFailure *)self task];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(NLXSchemaCDMSystemReportedFailure *)self deleteTask];
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
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
}

- (void)setHasTask:(BOOL)a3
{
  self->_hasTask = a3;
}

- (void)setHasReason:(BOOL)a3
{
  self->_hasReason = a3;
}

- (void)setHasTaskId:(BOOL)a3
{
  self->_hasTaskId = a3;
}

- (void)setTask:(id)a3
{
}

- (USOSchemaUSOGraph)task
{
  return self->_task;
}

- (void)setReason:(id)a3
{
}

- (USOSchemaUSOGraph)reason
{
  return self->_reason;
}

- (void)setTaskId:(id)a3
{
}

- (SISchemaUUID)taskId
{
  return self->_taskId;
}

- (NLXSchemaCDMSystemReportedFailure)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NLXSchemaCDMSystemReportedFailure;
  v5 = [(NLXSchemaCDMSystemReportedFailure *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"taskId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLXSchemaCDMSystemReportedFailure *)v5 setTaskId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"reason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[USOSchemaUSOGraph alloc] initWithDictionary:v8];
      [(NLXSchemaCDMSystemReportedFailure *)v5 setReason:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"task"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[USOSchemaUSOGraph alloc] initWithDictionary:v10];
      [(NLXSchemaCDMSystemReportedFailure *)v5 setTask:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (NLXSchemaCDMSystemReportedFailure)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMSystemReportedFailure *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMSystemReportedFailure *)self dictionaryRepresentation];
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
  if (self->_reason)
  {
    id v4 = [(NLXSchemaCDMSystemReportedFailure *)self reason];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"reason"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"reason"];
    }
  }
  if (self->_task)
  {
    uint64_t v7 = [(NLXSchemaCDMSystemReportedFailure *)self task];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"task"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"task"];
    }
  }
  if (self->_taskId)
  {
    v10 = [(NLXSchemaCDMSystemReportedFailure *)self taskId];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"taskId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"taskId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_taskId hash];
  unint64_t v4 = [(USOSchemaUSOGraph *)self->_reason hash] ^ v3;
  return v4 ^ [(USOSchemaUSOGraph *)self->_task hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(NLXSchemaCDMSystemReportedFailure *)self taskId];
  v6 = [v4 taskId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(NLXSchemaCDMSystemReportedFailure *)self taskId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(NLXSchemaCDMSystemReportedFailure *)self taskId];
    v10 = [v4 taskId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(NLXSchemaCDMSystemReportedFailure *)self reason];
  v6 = [v4 reason];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(NLXSchemaCDMSystemReportedFailure *)self reason];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(NLXSchemaCDMSystemReportedFailure *)self reason];
    v15 = [v4 reason];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(NLXSchemaCDMSystemReportedFailure *)self task];
  v6 = [v4 task];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(NLXSchemaCDMSystemReportedFailure *)self task];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(NLXSchemaCDMSystemReportedFailure *)self task];
    v20 = [v4 task];
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
  id v4 = [(NLXSchemaCDMSystemReportedFailure *)self taskId];

  if (v4)
  {
    v5 = [(NLXSchemaCDMSystemReportedFailure *)self taskId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(NLXSchemaCDMSystemReportedFailure *)self reason];

  if (v6)
  {
    uint64_t v7 = [(NLXSchemaCDMSystemReportedFailure *)self reason];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(NLXSchemaCDMSystemReportedFailure *)self task];

  if (v8)
  {
    v9 = [(NLXSchemaCDMSystemReportedFailure *)self task];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMSystemReportedFailureReadFrom(self, (uint64_t)a3);
}

- (void)deleteTask
{
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (void)deleteReason
{
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (void)deleteTaskId
{
}

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

@end