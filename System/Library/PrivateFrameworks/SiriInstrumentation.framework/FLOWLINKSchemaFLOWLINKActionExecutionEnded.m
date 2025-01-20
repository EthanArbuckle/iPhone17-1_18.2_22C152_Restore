@interface FLOWLINKSchemaFLOWLINKActionExecutionEnded
- (BOOL)hasHasOutputToPresent;
- (BOOL)hasOutputToPresent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWLINKSchemaFLOWLINKActionExecutionEnded)initWithDictionary:(id)a3;
- (FLOWLINKSchemaFLOWLINKActionExecutionEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteHasOutputToPresent;
- (void)setHasHasOutputToPresent:(BOOL)a3;
- (void)setHasOutputToPresent:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWLINKSchemaFLOWLINKActionExecutionEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)hasOutputToPresent
{
  return self->_hasOutputToPresent;
}

- (FLOWLINKSchemaFLOWLINKActionExecutionEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FLOWLINKSchemaFLOWLINKActionExecutionEnded;
  v5 = [(FLOWLINKSchemaFLOWLINKActionExecutionEnded *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hasOutputToPresent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWLINKSchemaFLOWLINKActionExecutionEnded setHasOutputToPresent:](v5, "setHasOutputToPresent:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (FLOWLINKSchemaFLOWLINKActionExecutionEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWLINKSchemaFLOWLINKActionExecutionEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWLINKSchemaFLOWLINKActionExecutionEnded *)self dictionaryRepresentation];
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
  if (*(&self->_hasOutputToPresent + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWLINKSchemaFLOWLINKActionExecutionEnded hasOutputToPresent](self, "hasOutputToPresent"));
    [v3 setObject:v4 forKeyedSubscript:@"hasOutputToPresent"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_hasOutputToPresent + 1)) {
    return 2654435761 * self->_hasOutputToPresent;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if (*(&self->_hasOutputToPresent + 1) == (v4[9] & 1))
    {
      if (!*(&self->_hasOutputToPresent + 1)
        || (int hasOutputToPresent = self->_hasOutputToPresent,
            hasOutputToPresent == [v4 hasOutputToPresent]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_hasOutputToPresent + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWLINKSchemaFLOWLINKActionExecutionEndedReadFrom(self, (uint64_t)a3);
}

- (void)deleteHasOutputToPresent
{
  *(&self->_hasOutputToPresent + 1) &= ~1u;
}

- (void)setHasHasOutputToPresent:(BOOL)a3
{
  *(&self->_hasOutputToPresent + 1) = *(&self->_hasOutputToPresent + 1) & 0xFE | a3;
}

- (BOOL)hasHasOutputToPresent
{
  return *(&self->_hasOutputToPresent + 1);
}

- (void)setHasOutputToPresent:(BOOL)a3
{
  *(&self->_hasOutputToPresent + 1) |= 1u;
  self->_int hasOutputToPresent = a3;
}

@end