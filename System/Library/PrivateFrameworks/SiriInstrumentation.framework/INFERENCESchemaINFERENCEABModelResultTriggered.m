@interface INFERENCESchemaINFERENCEABModelResultTriggered
- (BOOL)hasProjectIntent;
- (BOOL)hasTriggerReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEABModelResultTriggered)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEABModelResultTriggered)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)projectIntent;
- (int)triggerReason;
- (unint64_t)hash;
- (void)deleteProjectIntent;
- (void)deleteTriggerReason;
- (void)setHasProjectIntent:(BOOL)a3;
- (void)setHasTriggerReason:(BOOL)a3;
- (void)setProjectIntent:(int)a3;
- (void)setTriggerReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEABModelResultTriggered

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)projectIntent
{
  return self->_projectIntent;
}

- (int)triggerReason
{
  return self->_triggerReason;
}

- (INFERENCESchemaINFERENCEABModelResultTriggered)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INFERENCESchemaINFERENCEABModelResultTriggered;
  v5 = [(INFERENCESchemaINFERENCEABModelResultTriggered *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"triggerReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEABModelResultTriggered setTriggerReason:](v5, "setTriggerReason:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"projectIntent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEABModelResultTriggered setProjectIntent:](v5, "setProjectIntent:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEABModelResultTriggered)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEABModelResultTriggered *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEABModelResultTriggered *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v5 = [(INFERENCESchemaINFERENCEABModelResultTriggered *)self projectIntent] - 1;
    if (v5 > 0xB) {
      v6 = @"INFERENCEPROJECTINTENT_UNKNOWN";
    }
    else {
      v6 = off_1E5EBA458[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"projectIntent"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(INFERENCESchemaINFERENCEABModelResultTriggered *)self triggerReason] - 1;
    if (v7 > 9) {
      v8 = @"INFERENCEAPPRESOLUTIONTYPE_UNKNOWN";
    }
    else {
      v8 = off_1E5EBA4B8[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"triggerReason"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_triggerReason;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_projectIntent;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $05B29F5FB9491A2B59C3C12B16B5A3FE has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int triggerReason = self->_triggerReason;
    if (triggerReason != [v4 triggerReason])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $05B29F5FB9491A2B59C3C12B16B5A3FE has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int projectIntent = self->_projectIntent;
    if (projectIntent != [v4 projectIntent]) {
      goto LABEL_10;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEABModelResultTriggeredReadFrom(self, (uint64_t)a3);
}

- (void)deleteProjectIntent
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasProjectIntent:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProjectIntent
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setProjectIntent:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int projectIntent = a3;
}

- (void)deleteTriggerReason
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTriggerReason:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
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