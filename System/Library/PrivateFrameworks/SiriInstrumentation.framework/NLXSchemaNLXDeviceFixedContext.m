@interface NLXSchemaNLXDeviceFixedContext
- (BOOL)hasIsTestEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTestEvent;
- (BOOL)readFrom:(id)a3;
- (NLXSchemaNLXDeviceFixedContext)initWithDictionary:(id)a3;
- (NLXSchemaNLXDeviceFixedContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsTestEvent;
- (void)setHasIsTestEvent:(BOOL)a3;
- (void)setIsTestEvent:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NLXSchemaNLXDeviceFixedContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isTestEvent
{
  return self->_isTestEvent;
}

- (NLXSchemaNLXDeviceFixedContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NLXSchemaNLXDeviceFixedContext;
  v5 = [(NLXSchemaNLXDeviceFixedContext *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isTestEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NLXSchemaNLXDeviceFixedContext setIsTestEvent:](v5, "setIsTestEvent:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (NLXSchemaNLXDeviceFixedContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NLXSchemaNLXDeviceFixedContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NLXSchemaNLXDeviceFixedContext *)self dictionaryRepresentation];
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
  if (*(&self->_isTestEvent + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[NLXSchemaNLXDeviceFixedContext isTestEvent](self, "isTestEvent"));
    [v3 setObject:v4 forKeyedSubscript:@"isTestEvent"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isTestEvent + 1)) {
    return 2654435761 * self->_isTestEvent;
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
    if (*(&self->_isTestEvent + 1) == (v4[9] & 1))
    {
      if (!*(&self->_isTestEvent + 1)
        || (int isTestEvent = self->_isTestEvent, isTestEvent == [v4 isTestEvent]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_isTestEvent + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaNLXDeviceFixedContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsTestEvent
{
  *(&self->_isTestEvent + 1) &= ~1u;
}

- (void)setHasIsTestEvent:(BOOL)a3
{
  *(&self->_isTestEvent + 1) = *(&self->_isTestEvent + 1) & 0xFE | a3;
}

- (BOOL)hasIsTestEvent
{
  return *(&self->_isTestEvent + 1);
}

- (void)setIsTestEvent:(BOOL)a3
{
  *(&self->_isTestEvent + 1) |= 1u;
  self->_int isTestEvent = a3;
}

@end