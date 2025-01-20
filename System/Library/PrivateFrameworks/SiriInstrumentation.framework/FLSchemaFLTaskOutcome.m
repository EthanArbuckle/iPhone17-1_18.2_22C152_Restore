@interface FLSchemaFLTaskOutcome
- (BOOL)hasPromptStatus;
- (BOOL)hasTaskStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FLSchemaFLTaskOutcome)initWithDictionary:(id)a3;
- (FLSchemaFLTaskOutcome)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)promptStatus;
- (int)taskStatus;
- (unint64_t)hash;
- (void)deletePromptStatus;
- (void)deleteTaskStatus;
- (void)setHasPromptStatus:(BOOL)a3;
- (void)setHasTaskStatus:(BOOL)a3;
- (void)setPromptStatus:(int)a3;
- (void)setTaskStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLSchemaFLTaskOutcome

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)promptStatus
{
  return self->_promptStatus;
}

- (int)taskStatus
{
  return self->_taskStatus;
}

- (FLSchemaFLTaskOutcome)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FLSchemaFLTaskOutcome;
  v5 = [(FLSchemaFLTaskOutcome *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"taskStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLSchemaFLTaskOutcome setTaskStatus:](v5, "setTaskStatus:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"promptStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLSchemaFLTaskOutcome setPromptStatus:](v5, "setPromptStatus:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (FLSchemaFLTaskOutcome)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLSchemaFLTaskOutcome *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLSchemaFLTaskOutcome *)self dictionaryRepresentation];
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
    unsigned int v5 = [(FLSchemaFLTaskOutcome *)self promptStatus] - 1;
    if (v5 > 3) {
      v6 = @"FLTASKPROMPTSTATUS_UNKNOWN";
    }
    else {
      v6 = off_1E5EC0530[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"promptStatus"];
    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v7 = [(FLSchemaFLTaskOutcome *)self taskStatus] - 1;
    if (v7 > 6) {
      v8 = @"FLTASKSTATUS_UNKNOWN";
    }
    else {
      v8 = off_1E5EC0550[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"taskStatus"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_taskStatus;
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
  uint64_t v3 = 2654435761 * self->_promptStatus;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $2253483FA3D948D437515F46B41F44B0 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int taskStatus = self->_taskStatus;
    if (taskStatus != [v4 taskStatus])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $2253483FA3D948D437515F46B41F44B0 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int promptStatus = self->_promptStatus;
    if (promptStatus != [v4 promptStatus]) {
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
  return FLSchemaFLTaskOutcomeReadFrom(self, (uint64_t)a3);
}

- (void)deletePromptStatus
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasPromptStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPromptStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPromptStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int promptStatus = a3;
}

- (void)deleteTaskStatus
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTaskStatus:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTaskStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTaskStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int taskStatus = a3;
}

@end