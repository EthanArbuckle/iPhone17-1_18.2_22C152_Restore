@interface ODDSiriSchemaODDHomeKitProperties
- (BOOL)hasHasHomekitHome;
- (BOOL)hasHomekitHome;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODDSiriSchemaODDHomeKitProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDHomeKitProperties)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteHasHomekitHome;
- (void)setHasHasHomekitHome:(BOOL)a3;
- (void)setHasHomekitHome:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDHomeKitProperties

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)hasHomekitHome
{
  return self->_hasHomekitHome;
}

- (ODDSiriSchemaODDHomeKitProperties)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDHomeKitProperties;
  v5 = [(ODDSiriSchemaODDHomeKitProperties *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hasHomekitHome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDHomeKitProperties setHasHomekitHome:](v5, "setHasHomekitHome:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDHomeKitProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDHomeKitProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDHomeKitProperties *)self dictionaryRepresentation];
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
  if (*(&self->_hasHomekitHome + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDHomeKitProperties hasHomekitHome](self, "hasHomekitHome"));
    [v3 setObject:v4 forKeyedSubscript:@"hasHomekitHome"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_hasHomekitHome + 1)) {
    return 2654435761 * self->_hasHomekitHome;
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
    if (*(&self->_hasHomekitHome + 1) == (v4[9] & 1))
    {
      if (!*(&self->_hasHomekitHome + 1)
        || (int hasHomekitHome = self->_hasHomekitHome, hasHomekitHome == [v4 hasHomekitHome]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_hasHomekitHome + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDHomeKitPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteHasHomekitHome
{
  *(&self->_hasHomekitHome + 1) &= ~1u;
}

- (void)setHasHasHomekitHome:(BOOL)a3
{
  *(&self->_hasHomekitHome + 1) = *(&self->_hasHomekitHome + 1) & 0xFE | a3;
}

- (BOOL)hasHasHomekitHome
{
  return *(&self->_hasHomekitHome + 1);
}

- (void)setHasHomekitHome:(BOOL)a3
{
  *(&self->_hasHomekitHome + 1) |= 1u;
  self->_int hasHomekitHome = a3;
}

@end