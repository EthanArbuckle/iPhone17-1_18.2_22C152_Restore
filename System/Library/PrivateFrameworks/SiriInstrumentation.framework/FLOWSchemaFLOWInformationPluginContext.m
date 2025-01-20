@interface FLOWSchemaFLOWInformationPluginContext
- (BOOL)hasEventType;
- (BOOL)hasExecutedPegasusDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWInformationPluginContext)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWInformationPluginContext)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)executedPegasusDomain;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)eventType;
- (unint64_t)hash;
- (void)deleteEventType;
- (void)deleteExecutedPegasusDomain;
- (void)setEventType:(int)a3;
- (void)setExecutedPegasusDomain:(id)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasExecutedPegasusDomain:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWInformationPluginContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FLOWSchemaFLOWInformationPluginContext;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6) {
    [(FLOWSchemaFLOWInformationPluginContext *)self deleteExecutedPegasusDomain];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasExecutedPegasusDomain:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setExecutedPegasusDomain:(id)a3
{
}

- (NSString)executedPegasusDomain
{
  return self->_executedPegasusDomain;
}

- (int)eventType
{
  return self->_eventType;
}

- (FLOWSchemaFLOWInformationPluginContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FLOWSchemaFLOWInformationPluginContext;
  v5 = [(FLOWSchemaFLOWInformationPluginContext *)&v11 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"eventType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWInformationPluginContext setEventType:](v5, "setEventType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"executedPegasusDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v8 = (void *)[v7 copy];
      [(FLOWSchemaFLOWInformationPluginContext *)v5 setExecutedPegasusDomain:v8];
    }
    v9 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWInformationPluginContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWInformationPluginContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWInformationPluginContext *)self dictionaryRepresentation];
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
    int v4 = [(FLOWSchemaFLOWInformationPluginContext *)self eventType];
    v5 = @"FLOWINFORMATIONPLUGINEVENTTYPE_UNKNOWN";
    if (v4 == 1) {
      v5 = @"FLOWINFORMATIONPLUGINEVENTTYPE_POMMES";
    }
    if (v4 == 2) {
      int v6 = @"FLOWINFORMATIONPLUGINEVENTTYPE_MODALITY";
    }
    else {
      int v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"eventType"];
  }
  if (self->_executedPegasusDomain)
  {
    uint64_t v7 = [(FLOWSchemaFLOWInformationPluginContext *)self executedPegasusDomain];
    objc_super v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"executedPegasusDomain"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_executedPegasusDomain hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int eventType = self->_eventType, eventType == [v4 eventType]))
      {
        int v6 = [(FLOWSchemaFLOWInformationPluginContext *)self executedPegasusDomain];
        uint64_t v7 = [v4 executedPegasusDomain];
        objc_super v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(FLOWSchemaFLOWInformationPluginContext *)self executedPegasusDomain];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(FLOWSchemaFLOWInformationPluginContext *)self executedPegasusDomain];
          v12 = [v4 executedPegasusDomain];
          char v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  int v4 = [(FLOWSchemaFLOWInformationPluginContext *)self executedPegasusDomain];

  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWInformationPluginContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteExecutedPegasusDomain
{
}

- (BOOL)hasExecutedPegasusDomain
{
  return self->_executedPegasusDomain != 0;
}

- (void)deleteEventType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEventType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int eventType = a3;
}

@end