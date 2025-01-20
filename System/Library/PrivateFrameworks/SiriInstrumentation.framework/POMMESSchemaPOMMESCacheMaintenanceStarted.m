@interface POMMESSchemaPOMMESCacheMaintenanceStarted
- (BOOL)hasTimeSinceLastMaintenanceInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESCacheMaintenanceStarted)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESCacheMaintenanceStarted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)timeSinceLastMaintenanceInSeconds;
- (void)deleteTimeSinceLastMaintenanceInSeconds;
- (void)setHasTimeSinceLastMaintenanceInSeconds:(BOOL)a3;
- (void)setTimeSinceLastMaintenanceInSeconds:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESCacheMaintenanceStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)timeSinceLastMaintenanceInSeconds
{
  return self->_timeSinceLastMaintenanceInSeconds;
}

- (POMMESSchemaPOMMESCacheMaintenanceStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)POMMESSchemaPOMMESCacheMaintenanceStarted;
  v5 = [(POMMESSchemaPOMMESCacheMaintenanceStarted *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"timeSinceLastMaintenanceInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESCacheMaintenanceStarted setTimeSinceLastMaintenanceInSeconds:](v5, "setTimeSinceLastMaintenanceInSeconds:", [v6 unsignedIntValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESCacheMaintenanceStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESCacheMaintenanceStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESCacheMaintenanceStarted *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESCacheMaintenanceStarted timeSinceLastMaintenanceInSeconds](self, "timeSinceLastMaintenanceInSeconds"));
    [v3 setObject:v4 forKeyedSubscript:@"timeSinceLastMaintenanceInSeconds"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_timeSinceLastMaintenanceInSeconds;
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
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (unsigned int timeSinceLastMaintenanceInSeconds = self->_timeSinceLastMaintenanceInSeconds,
            timeSinceLastMaintenanceInSeconds == [v4 timeSinceLastMaintenanceInSeconds]))
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
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESCacheMaintenanceStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteTimeSinceLastMaintenanceInSeconds
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTimeSinceLastMaintenanceInSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeSinceLastMaintenanceInSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimeSinceLastMaintenanceInSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int timeSinceLastMaintenanceInSeconds = a3;
}

@end