@interface IFTSchemaIFTSessionStart
- (BOOL)hasOriginatingDeviceWasLocal;
- (BOOL)isEqual:(id)a3;
- (BOOL)originatingDeviceWasLocal;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTSessionStart)initWithDictionary:(id)a3;
- (IFTSchemaIFTSessionStart)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteOriginatingDeviceWasLocal;
- (void)setHasOriginatingDeviceWasLocal:(BOOL)a3;
- (void)setOriginatingDeviceWasLocal:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTSessionStart

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)originatingDeviceWasLocal
{
  return self->_originatingDeviceWasLocal;
}

- (IFTSchemaIFTSessionStart)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTSessionStart;
  v5 = [(IFTSchemaIFTSessionStart *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"originatingDeviceWasLocal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTSessionStart setOriginatingDeviceWasLocal:](v5, "setOriginatingDeviceWasLocal:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (IFTSchemaIFTSessionStart)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTSessionStart *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTSessionStart *)self dictionaryRepresentation];
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
  if (*(&self->_originatingDeviceWasLocal + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTSessionStart originatingDeviceWasLocal](self, "originatingDeviceWasLocal"));
    [v3 setObject:v4 forKeyedSubscript:@"originatingDeviceWasLocal"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_originatingDeviceWasLocal + 1)) {
    return 2654435761 * self->_originatingDeviceWasLocal;
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
    if (*(&self->_originatingDeviceWasLocal + 1) == (v4[9] & 1))
    {
      if (!*(&self->_originatingDeviceWasLocal + 1)
        || (int originatingDeviceWasLocal = self->_originatingDeviceWasLocal,
            originatingDeviceWasLocal == [v4 originatingDeviceWasLocal]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_originatingDeviceWasLocal + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTSessionStartReadFrom(self, (uint64_t)a3);
}

- (void)deleteOriginatingDeviceWasLocal
{
  *(&self->_originatingDeviceWasLocal + 1) &= ~1u;
}

- (void)setHasOriginatingDeviceWasLocal:(BOOL)a3
{
  *(&self->_originatingDeviceWasLocal + 1) = *(&self->_originatingDeviceWasLocal + 1) & 0xFE | a3;
}

- (BOOL)hasOriginatingDeviceWasLocal
{
  return *(&self->_originatingDeviceWasLocal + 1);
}

- (void)setOriginatingDeviceWasLocal:(BOOL)a3
{
  *(&self->_originatingDeviceWasLocal + 1) |= 1u;
  self->_int originatingDeviceWasLocal = a3;
}

@end