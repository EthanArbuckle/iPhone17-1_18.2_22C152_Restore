@interface HALSchemaHALVoiceTriggerContext
- (BOOL)hasTimeSinceVoiceTriggerHeardInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HALSchemaHALVoiceTriggerContext)initWithDictionary:(id)a3;
- (HALSchemaHALVoiceTriggerContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)timeSinceVoiceTriggerHeardInSeconds;
- (void)deleteTimeSinceVoiceTriggerHeardInSeconds;
- (void)setHasTimeSinceVoiceTriggerHeardInSeconds:(BOOL)a3;
- (void)setTimeSinceVoiceTriggerHeardInSeconds:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HALSchemaHALVoiceTriggerContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)timeSinceVoiceTriggerHeardInSeconds
{
  return self->_timeSinceVoiceTriggerHeardInSeconds;
}

- (HALSchemaHALVoiceTriggerContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HALSchemaHALVoiceTriggerContext;
  v5 = [(HALSchemaHALVoiceTriggerContext *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"timeSinceVoiceTriggerHeardInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HALSchemaHALVoiceTriggerContext setTimeSinceVoiceTriggerHeardInSeconds:](v5, "setTimeSinceVoiceTriggerHeardInSeconds:", [v6 unsignedLongLongValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (HALSchemaHALVoiceTriggerContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(HALSchemaHALVoiceTriggerContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(HALSchemaHALVoiceTriggerContext *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HALSchemaHALVoiceTriggerContext timeSinceVoiceTriggerHeardInSeconds](self, "timeSinceVoiceTriggerHeardInSeconds"));
    [v3 setObject:v4 forKeyedSubscript:@"timeSinceVoiceTriggerHeardInSeconds"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761u * self->_timeSinceVoiceTriggerHeardInSeconds;
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
        || (unint64_t timeSinceVoiceTriggerHeardInSeconds = self->_timeSinceVoiceTriggerHeardInSeconds,
            timeSinceVoiceTriggerHeardInSeconds == [v4 timeSinceVoiceTriggerHeardInSeconds]))
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
  return HALSchemaHALVoiceTriggerContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteTimeSinceVoiceTriggerHeardInSeconds
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTimeSinceVoiceTriggerHeardInSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeSinceVoiceTriggerHeardInSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimeSinceVoiceTriggerHeardInSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t timeSinceVoiceTriggerHeardInSeconds = a3;
}

@end