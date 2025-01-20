@interface TTMSchemaTTMNeuralCombinerRequestStarted
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (TTMSchemaTTMNeuralCombinerRequestStarted)initWithDictionary:(id)a3;
- (TTMSchemaTTMNeuralCombinerRequestStarted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)mode;
- (unint64_t)hash;
- (void)deleteExists;
- (void)deleteMode;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setMode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TTMSchemaTTMNeuralCombinerRequestStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)mode
{
  return self->_mode;
}

- (BOOL)exists
{
  return self->_exists;
}

- (TTMSchemaTTMNeuralCombinerRequestStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TTMSchemaTTMNeuralCombinerRequestStarted;
  v5 = [(TTMSchemaTTMNeuralCombinerRequestStarted *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTMSchemaTTMNeuralCombinerRequestStarted setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"mode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[TTMSchemaTTMNeuralCombinerRequestStarted setMode:](v5, "setMode:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (TTMSchemaTTMNeuralCombinerRequestStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(TTMSchemaTTMNeuralCombinerRequestStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(TTMSchemaTTMNeuralCombinerRequestStarted *)self dictionaryRepresentation];
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
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[TTMSchemaTTMNeuralCombinerRequestStarted exists](self, "exists"));
    [v3 setObject:v5 forKeyedSubscript:@"exists"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int v6 = [(TTMSchemaTTMNeuralCombinerRequestStarted *)self mode];
    uint64_t v7 = @"TTMNEURALCOMBINERMODE_UNKNOWN";
    if (v6 == 1) {
      uint64_t v7 = @"TTMNEURALCOMBINERMODE_SIRI_X";
    }
    if (v6 == 2) {
      v8 = @"TTMNEURALCOMBINERMODE_CONVERSATIONAL";
    }
    else {
      v8 = v7;
    }
    [v3 setObject:v8 forKeyedSubscript:@"mode"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_exists;
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
  uint64_t v3 = 2654435761 * self->_mode;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  $09FF35EAF8830B3DFAEB30DA0C7E0BC0 has = self->_has;
  unsigned int v6 = v4[16];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_10;
  }
  if (*(unsigned char *)&has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists])
    {
LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    $09FF35EAF8830B3DFAEB30DA0C7E0BC0 has = self->_has;
    unsigned int v6 = v4[16];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_10;
  }
  if (v8)
  {
    int mode = self->_mode;
    if (mode != [v4 mode]) {
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
  return TTMSchemaTTMNeuralCombinerRequestStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteMode
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMode:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int mode = a3;
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exists = a3;
}

@end