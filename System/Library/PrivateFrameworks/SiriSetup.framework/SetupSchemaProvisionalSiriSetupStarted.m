@interface SetupSchemaProvisionalSiriSetupStarted
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SetupSchemaProvisionalSiriSetupStarted)initWithDictionary:(id)a3;
- (SetupSchemaProvisionalSiriSetupStarted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)deleteExists;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SetupSchemaProvisionalSiriSetupStarted

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_exists = a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (BOOL)readFrom:(id)a3
{
  return SetupSchemaProvisionalSiriSetupStartedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((v4[12] & 1) == (*(unsigned char *)&self->_has & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int exists = self->_exists, exists == [v4 exists]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_exists;
  }
  else {
    return 0;
  }
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SetupSchemaProvisionalSiriSetupStarted exists](self, "exists"));
    [v3 setObject:v4 forKeyedSubscript:@"exists"];
  }
  [(SetupSchemaProvisionalSiriSetupStarted *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (NSData)jsonData
{
  v2 = [(SetupSchemaProvisionalSiriSetupStarted *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (SetupSchemaProvisionalSiriSetupStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SetupSchemaProvisionalSiriSetupStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (SetupSchemaProvisionalSiriSetupStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SetupSchemaProvisionalSiriSetupStarted;
  v5 = [(SetupSchemaProvisionalSiriSetupStarted *)&v9 init];
  if (v5)
  {
    BOOL v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SetupSchemaProvisionalSiriSetupStarted setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    uint64_t v7 = v5;
  }
  return v5;
}

- (BOOL)exists
{
  return self->_exists;
}

@end