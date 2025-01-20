@interface OPTINSchemaOPTINInconsistentStateDetected
- (BOOL)hasInconsistencyCondition;
- (BOOL)hasInconsistencyTrigger;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (OPTINSchemaOPTINInconsistentStateDetected)initWithDictionary:(id)a3;
- (OPTINSchemaOPTINInconsistentStateDetected)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)inconsistencyCondition;
- (int)inconsistencyTrigger;
- (unint64_t)hash;
- (void)deleteInconsistencyCondition;
- (void)deleteInconsistencyTrigger;
- (void)setHasInconsistencyCondition:(BOOL)a3;
- (void)setHasInconsistencyTrigger:(BOOL)a3;
- (void)setInconsistencyCondition:(int)a3;
- (void)setInconsistencyTrigger:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation OPTINSchemaOPTINInconsistentStateDetected

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)inconsistencyTrigger
{
  return self->_inconsistencyTrigger;
}

- (int)inconsistencyCondition
{
  return self->_inconsistencyCondition;
}

- (OPTINSchemaOPTINInconsistentStateDetected)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)OPTINSchemaOPTINInconsistentStateDetected;
  v5 = [(OPTINSchemaOPTINInconsistentStateDetected *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"inconsistencyCondition"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[OPTINSchemaOPTINInconsistentStateDetected setInconsistencyCondition:](v5, "setInconsistencyCondition:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"inconsistencyTrigger"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[OPTINSchemaOPTINInconsistentStateDetected setInconsistencyTrigger:](v5, "setInconsistencyTrigger:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (OPTINSchemaOPTINInconsistentStateDetected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(OPTINSchemaOPTINInconsistentStateDetected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(OPTINSchemaOPTINInconsistentStateDetected *)self dictionaryRepresentation];
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
  if (has)
  {
    unsigned int v5 = [(OPTINSchemaOPTINInconsistentStateDetected *)self inconsistencyCondition] - 1;
    if (v5 > 2) {
      v6 = @"GRADINGOPTINSTATEINCONSISTENCYCONDITION_UNKNOWN";
    }
    else {
      v6 = off_1E5EBA0F8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"inconsistencyCondition"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ([(OPTINSchemaOPTINInconsistentStateDetected *)self inconsistencyTrigger] == 1) {
      uint64_t v7 = @"GRADINGOPTINSTATEINCONSISTENCYTRIGGER_AUDIO_LOG_UPLOAD";
    }
    else {
      uint64_t v7 = @"GRADINGOPTINSTATEINCONSISTENCYTRIGGER_UNKNOWN";
    }
    [v3 setObject:v7 forKeyedSubscript:@"inconsistencyTrigger"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_inconsistencyCondition;
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
  uint64_t v3 = 2654435761 * self->_inconsistencyTrigger;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $E8D4E47B56254D6A2D209EF8E79829F1 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int inconsistencyCondition = self->_inconsistencyCondition;
    if (inconsistencyCondition != [v4 inconsistencyCondition])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $E8D4E47B56254D6A2D209EF8E79829F1 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int inconsistencyTrigger = self->_inconsistencyTrigger;
    if (inconsistencyTrigger != [v4 inconsistencyTrigger]) {
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
  return OPTINSchemaOPTINInconsistentStateDetectedReadFrom(self, (uint64_t)a3);
}

- (void)deleteInconsistencyTrigger
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasInconsistencyTrigger:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInconsistencyTrigger
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setInconsistencyTrigger:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int inconsistencyTrigger = a3;
}

- (void)deleteInconsistencyCondition
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasInconsistencyCondition:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInconsistencyCondition
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInconsistencyCondition:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int inconsistencyCondition = a3;
}

@end