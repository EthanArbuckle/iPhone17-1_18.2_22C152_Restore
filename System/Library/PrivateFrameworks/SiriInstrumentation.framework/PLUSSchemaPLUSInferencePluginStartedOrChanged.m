@interface PLUSSchemaPLUSInferencePluginStartedOrChanged
- (BOOL)hasTriggerReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSInferencePluginStartedOrChanged)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSInferencePluginStartedOrChanged)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)triggerReason;
- (unint64_t)hash;
- (void)deleteTriggerReason;
- (void)setHasTriggerReason:(BOOL)a3;
- (void)setTriggerReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSInferencePluginStartedOrChanged

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)triggerReason
{
  return self->_triggerReason;
}

- (PLUSSchemaPLUSInferencePluginStartedOrChanged)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSInferencePluginStartedOrChanged;
  v5 = [(PLUSSchemaPLUSInferencePluginStartedOrChanged *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"triggerReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSInferencePluginStartedOrChanged setTriggerReason:](v5, "setTriggerReason:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSInferencePluginStartedOrChanged)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSInferencePluginStartedOrChanged *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSInferencePluginStartedOrChanged *)self dictionaryRepresentation];
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
    int v4 = [(PLUSSchemaPLUSInferencePluginStartedOrChanged *)self triggerReason];
    v5 = @"PLUSINFERENCEPLUGINTRIGGERREASON_UNKNOWN";
    if (v4 == 1) {
      v5 = @"PLUSINFERENCEPLUGINTRIGGERREASON_MAINTAINENCE_TRIGGER";
    }
    if (v4 == 2) {
      v6 = @"PLUSINFERENCEPLUGINTRIGGERREASON_EVENT_TRIGGER";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"triggerReason"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_triggerReason;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int triggerReason = self->_triggerReason, triggerReason == [v4 triggerReason]))
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
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSInferencePluginStartedOrChangedReadFrom(self, (uint64_t)a3);
}

- (void)deleteTriggerReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTriggerReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTriggerReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTriggerReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int triggerReason = a3;
}

@end