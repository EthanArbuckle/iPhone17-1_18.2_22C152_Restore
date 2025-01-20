@interface HALSchemaHALAlarmContext
- (BOOL)hasTimeSinceAlarmFiredInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HALSchemaHALAlarmContext)initWithDictionary:(id)a3;
- (HALSchemaHALAlarmContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)timeSinceAlarmFiredInSeconds;
- (void)deleteTimeSinceAlarmFiredInSeconds;
- (void)setHasTimeSinceAlarmFiredInSeconds:(BOOL)a3;
- (void)setTimeSinceAlarmFiredInSeconds:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HALSchemaHALAlarmContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)timeSinceAlarmFiredInSeconds
{
  return self->_timeSinceAlarmFiredInSeconds;
}

- (HALSchemaHALAlarmContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HALSchemaHALAlarmContext;
  v5 = [(HALSchemaHALAlarmContext *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"timeSinceAlarmFiredInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALAlarmContext setTimeSinceAlarmFiredInSeconds:](v5, "setTimeSinceAlarmFiredInSeconds:", [v6 unsignedLongLongValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (HALSchemaHALAlarmContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(HALSchemaHALAlarmContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(HALSchemaHALAlarmContext *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HALSchemaHALAlarmContext timeSinceAlarmFiredInSeconds](self, "timeSinceAlarmFiredInSeconds"));
    [v3 setObject:v4 forKeyedSubscript:@"timeSinceAlarmFiredInSeconds"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761u * self->_timeSinceAlarmFiredInSeconds;
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
    if ((*(unsigned char *)&self->_has & 1) == (v4[16] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (unint64_t timeSinceAlarmFiredInSeconds = self->_timeSinceAlarmFiredInSeconds,
            timeSinceAlarmFiredInSeconds == [v4 timeSinceAlarmFiredInSeconds]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALAlarmContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteTimeSinceAlarmFiredInSeconds
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTimeSinceAlarmFiredInSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeSinceAlarmFiredInSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimeSinceAlarmFiredInSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t timeSinceAlarmFiredInSeconds = a3;
}

@end