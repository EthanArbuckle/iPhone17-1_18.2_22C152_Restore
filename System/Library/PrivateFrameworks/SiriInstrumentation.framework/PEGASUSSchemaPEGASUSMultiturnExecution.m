@interface PEGASUSSchemaPEGASUSMultiturnExecution
- (BOOL)hasIsRewrite;
- (BOOL)hasTriggerError;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRewrite;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSMultiturnExecution)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSMultiturnExecution)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)triggerError;
- (unint64_t)hash;
- (void)deleteIsRewrite;
- (void)deleteTriggerError;
- (void)setHasIsRewrite:(BOOL)a3;
- (void)setHasTriggerError:(BOOL)a3;
- (void)setIsRewrite:(BOOL)a3;
- (void)setTriggerError:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSMultiturnExecution

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)triggerError
{
  return self->_triggerError;
}

- (BOOL)isRewrite
{
  return self->_isRewrite;
}

- (PEGASUSSchemaPEGASUSMultiturnExecution)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PEGASUSSchemaPEGASUSMultiturnExecution;
  v5 = [(PEGASUSSchemaPEGASUSMultiturnExecution *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isRewrite"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSMultiturnExecution setIsRewrite:](v5, "setIsRewrite:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"triggerError"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSMultiturnExecution setTriggerError:](v5, "setTriggerError:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSMultiturnExecution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSMultiturnExecution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSMultiturnExecution *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[PEGASUSSchemaPEGASUSMultiturnExecution isRewrite](self, "isRewrite"));
    [v3 setObject:v5 forKeyedSubscript:@"isRewrite"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v6 = [(PEGASUSSchemaPEGASUSMultiturnExecution *)self triggerError] - 1;
    if (v6 > 8) {
      uint64_t v7 = @"PEGASUSMULTITURNTRIGGERERROR_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EBF500[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"triggerError"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_isRewrite;
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
  uint64_t v3 = 2654435761 * self->_triggerError;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $6EC73F1175EEBCF39126F6DC47B33907 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int isRewrite = self->_isRewrite;
    if (isRewrite != [v4 isRewrite])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $6EC73F1175EEBCF39126F6DC47B33907 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int triggerError = self->_triggerError;
    if (triggerError != [v4 triggerError]) {
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
    PBDataWriterWriteBOOLField();
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
  return PEGASUSSchemaPEGASUSMultiturnExecutionReadFrom(self, (uint64_t)a3);
}

- (void)deleteTriggerError
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasTriggerError:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTriggerError
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTriggerError:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int triggerError = a3;
}

- (void)deleteIsRewrite
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsRewrite:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsRewrite
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsRewrite:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isRewrite = a3;
}

@end