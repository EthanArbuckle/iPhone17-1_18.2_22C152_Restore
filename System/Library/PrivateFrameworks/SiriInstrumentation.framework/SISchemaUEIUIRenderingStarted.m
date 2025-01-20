@interface SISchemaUEIUIRenderingStarted
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaUEIUIRenderingStarted)initWithDictionary:(id)a3;
- (SISchemaUEIUIRenderingStarted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteExists;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaUEIUIRenderingStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)exists
{
  return self->_exists;
}

- (SISchemaUEIUIRenderingStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SISchemaUEIUIRenderingStarted;
  v5 = [(SISchemaUEIUIRenderingStarted *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaUEIUIRenderingStarted setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (SISchemaUEIUIRenderingStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaUEIUIRenderingStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaUEIUIRenderingStarted *)self dictionaryRepresentation];
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
  if (*(&self->_exists + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaUEIUIRenderingStarted exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_exists + 1)) {
    return 2654435761 * self->_exists;
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
    if (*(&self->_exists + 1) == (v4[9] & 1))
    {
      if (!*(&self->_exists + 1) || (int exists = self->_exists, exists == [v4 exists])) {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_exists + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaUEIUIRenderingStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteExists
{
  *(&self->_exists + 1) &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(&self->_exists + 1) = *(&self->_exists + 1) & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(&self->_exists + 1);
}

- (void)setExists:(BOOL)a3
{
  *(&self->_exists + 1) |= 1u;
  self->_int exists = a3;
}

@end