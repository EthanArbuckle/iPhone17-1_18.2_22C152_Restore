@interface NLXSchemaCDMTask
- (BOOL)hasScore;
- (BOOL)hasTask;
- (BOOL)hasTaskId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMTask)initWithDictionary:(id)a3;
- (NLXSchemaCDMTask)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)taskId;
- (USOSchemaUSOGraph)task;
- (double)score;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteScore;
- (void)deleteTask;
- (void)deleteTaskId;
- (void)setHasScore:(BOOL)a3;
- (void)setHasTask:(BOOL)a3;
- (void)setHasTaskId:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)setTask:(id)a3;
- (void)setTaskId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMTask

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLXSchemaCDMTask;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMTask *)self taskId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaCDMTask *)self deleteTaskId];
  }
  v9 = [(NLXSchemaCDMTask *)self task];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLXSchemaCDMTask *)self deleteTask];
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
  objc_storeStrong((id *)&self->_taskId, 0);
}

- (void)setHasTask:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasTaskId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setTask:(id)a3
{
}

- (USOSchemaUSOGraph)task
{
  return self->_task;
}

- (void)setTaskId:(id)a3
{
}

- (SISchemaUUID)taskId
{
  return self->_taskId;
}

- (NLXSchemaCDMTask)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLXSchemaCDMTask;
  v5 = [(NLXSchemaCDMTask *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"taskId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLXSchemaCDMTask *)v5 setTaskId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"task"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[USOSchemaUSOGraph alloc] initWithDictionary:v8];
      [(NLXSchemaCDMTask *)v5 setTask:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      -[NLXSchemaCDMTask setScore:](v5, "setScore:");
    }
    int v11 = v5;
  }
  return v5;
}

- (NLXSchemaCDMTask)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMTask *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMTask *)self dictionaryRepresentation];
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
    id v4 = NSNumber;
    [(NLXSchemaCDMTask *)self score];
    v5 = objc_msgSend(v4, "numberWithDouble:");
    [v3 setObject:v5 forKeyedSubscript:@"score"];
  }
  if (self->_task)
  {
    v6 = [(NLXSchemaCDMTask *)self task];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"task"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"task"];
    }
  }
  if (self->_taskId)
  {
    v9 = [(NLXSchemaCDMTask *)self taskId];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"taskId"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"taskId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_taskId hash];
  unint64_t v4 = [(USOSchemaUSOGraph *)self->_task hash];
  if (*(unsigned char *)&self->_has)
  {
    double score = self->_score;
    double v7 = -score;
    if (score >= 0.0) {
      double v7 = self->_score;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  unint64_t v5 = [(NLXSchemaCDMTask *)self taskId];
  v6 = [v4 taskId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(NLXSchemaCDMTask *)self taskId];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(NLXSchemaCDMTask *)self taskId];
    v10 = [v4 taskId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  unint64_t v5 = [(NLXSchemaCDMTask *)self task];
  v6 = [v4 task];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(NLXSchemaCDMTask *)self task];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(NLXSchemaCDMTask *)self task];
    v15 = [v4 task];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[32] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0 || (double score = self->_score, [v4 score], score == v20))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(NLXSchemaCDMTask *)self taskId];

  if (v4)
  {
    unint64_t v5 = [(NLXSchemaCDMTask *)self taskId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(NLXSchemaCDMTask *)self task];

  if (v6)
  {
    uint64_t v7 = [(NLXSchemaCDMTask *)self task];
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMTaskReadFrom(self, (uint64_t)a3);
}

- (void)deleteScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double score = a3;
}

- (void)deleteTask
{
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (void)deleteTaskId
{
}

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

@end