@interface NLXSchemaCDMSystemPrompted
- (BOOL)hasTarget;
- (BOOL)hasTaskId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaCDMSystemPrompted)initWithDictionary:(id)a3;
- (NLXSchemaCDMSystemPrompted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)taskId;
- (USOSchemaUSOGraph)target;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteTarget;
- (void)deleteTaskId;
- (void)setHasTarget:(BOOL)a3;
- (void)setHasTaskId:(BOOL)a3;
- (void)setTarget:(id)a3;
- (void)setTaskId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaCDMSystemPrompted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NLXSchemaCDMSystemPrompted;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(NLXSchemaCDMSystemPrompted *)self taskId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(NLXSchemaCDMSystemPrompted *)self deleteTaskId];
  }
  v9 = [(NLXSchemaCDMSystemPrompted *)self target];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(NLXSchemaCDMSystemPrompted *)self deleteTarget];
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
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_taskId, 0);
}

- (void)setHasTarget:(BOOL)a3
{
  self->_hasTarget = a3;
}

- (void)setHasTaskId:(BOOL)a3
{
  self->_hasTaskId = a3;
}

- (void)setTarget:(id)a3
{
}

- (USOSchemaUSOGraph)target
{
  return self->_target;
}

- (void)setTaskId:(id)a3
{
}

- (SISchemaUUID)taskId
{
  return self->_taskId;
}

- (NLXSchemaCDMSystemPrompted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NLXSchemaCDMSystemPrompted;
  v5 = [(NLXSchemaCDMSystemPrompted *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"taskId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(NLXSchemaCDMSystemPrompted *)v5 setTaskId:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"target"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[USOSchemaUSOGraph alloc] initWithDictionary:v8];
      [(NLXSchemaCDMSystemPrompted *)v5 setTarget:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (NLXSchemaCDMSystemPrompted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaCDMSystemPrompted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaCDMSystemPrompted *)self dictionaryRepresentation];
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
  if (self->_target)
  {
    id v4 = [(NLXSchemaCDMSystemPrompted *)self target];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"target"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"target"];
    }
  }
  if (self->_taskId)
  {
    uint64_t v7 = [(NLXSchemaCDMSystemPrompted *)self taskId];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"taskId"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"taskId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_taskId hash];
  return [(USOSchemaUSOGraph *)self->_target hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(NLXSchemaCDMSystemPrompted *)self taskId];
  v6 = [v4 taskId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(NLXSchemaCDMSystemPrompted *)self taskId];
  if (v7)
  {
    int v8 = (void *)v7;
    v9 = [(NLXSchemaCDMSystemPrompted *)self taskId];
    v10 = [v4 taskId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(NLXSchemaCDMSystemPrompted *)self target];
  v6 = [v4 target];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(NLXSchemaCDMSystemPrompted *)self target];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(NLXSchemaCDMSystemPrompted *)self target];
    v15 = [v4 target];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(NLXSchemaCDMSystemPrompted *)self taskId];

  if (v4)
  {
    v5 = [(NLXSchemaCDMSystemPrompted *)self taskId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(NLXSchemaCDMSystemPrompted *)self target];

  if (v6)
  {
    uint64_t v7 = [(NLXSchemaCDMSystemPrompted *)self target];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMSystemPromptedReadFrom(self, (uint64_t)a3);
}

- (void)deleteTarget
{
}

- (BOOL)hasTarget
{
  return self->_target != 0;
}

- (void)deleteTaskId
{
}

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

@end