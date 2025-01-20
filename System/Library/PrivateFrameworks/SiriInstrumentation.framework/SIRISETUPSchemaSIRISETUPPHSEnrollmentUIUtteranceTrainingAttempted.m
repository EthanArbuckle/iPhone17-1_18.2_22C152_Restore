@interface SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted
- (BOOL)hasEnrollmentMode;
- (BOOL)hasIsRetry;
- (BOOL)hasLocale;
- (BOOL)hasPageNumber;
- (BOOL)hasTrainingOutcome;
- (BOOL)hasWasAudioHintNeeded;
- (BOOL)hasWasAudioHintSpokenSuccessfully;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRetry;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasAudioHintNeeded;
- (BOOL)wasAudioHintSpokenSuccessfully;
- (NSData)jsonData;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted)initWithDictionary:(id)a3;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted)initWithJSON:(id)a3;
- (SISchemaISOLocale)locale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)enrollmentMode;
- (int)trainingOutcome;
- (unint64_t)hash;
- (unsigned)pageNumber;
- (void)deleteEnrollmentMode;
- (void)deleteIsRetry;
- (void)deleteLocale;
- (void)deletePageNumber;
- (void)deleteTrainingOutcome;
- (void)deleteWasAudioHintNeeded;
- (void)deleteWasAudioHintSpokenSuccessfully;
- (void)setEnrollmentMode:(int)a3;
- (void)setHasEnrollmentMode:(BOOL)a3;
- (void)setHasIsRetry:(BOOL)a3;
- (void)setHasLocale:(BOOL)a3;
- (void)setHasPageNumber:(BOOL)a3;
- (void)setHasTrainingOutcome:(BOOL)a3;
- (void)setHasWasAudioHintNeeded:(BOOL)a3;
- (void)setHasWasAudioHintSpokenSuccessfully:(BOOL)a3;
- (void)setIsRetry:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setPageNumber:(unsigned int)a3;
- (void)setTrainingOutcome:(int)a3;
- (void)setWasAudioHintNeeded:(BOOL)a3;
- (void)setWasAudioHintSpokenSuccessfully:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)self locale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)self deleteLocale];
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

- (void)setHasLocale:(BOOL)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 2) = a3;
}

- (BOOL)wasAudioHintSpokenSuccessfully
{
  return self->_wasAudioHintSpokenSuccessfully;
}

- (BOOL)wasAudioHintNeeded
{
  return self->_wasAudioHintNeeded;
}

- (int)trainingOutcome
{
  return self->_trainingOutcome;
}

- (BOOL)isRetry
{
  return self->_isRetry;
}

- (void)setLocale:(id)a3
{
}

- (SISchemaISOLocale)locale
{
  return self->_locale;
}

- (int)enrollmentMode
{
  return self->_enrollmentMode;
}

- (unsigned)pageNumber
{
  return self->_pageNumber;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted;
  v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"pageNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setPageNumber:](v5, "setPageNumber:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"enrollmentMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setEnrollmentMode:](v5, "setEnrollmentMode:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[SISchemaISOLocale alloc] initWithDictionary:v8];
      [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)v5 setLocale:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"isRetry"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setIsRetry:](v5, "setIsRetry:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"trainingOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setTrainingOutcome:](v5, "setTrainingOutcome:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"wasAudioHintNeeded"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setWasAudioHintNeeded:](v5, "setWasAudioHintNeeded:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"wasAudioHintSpokenSuccessfully"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted setWasAudioHintSpokenSuccessfully:](v5, "setWasAudioHintSpokenSuccessfully:", [v13 BOOLValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)self dictionaryRepresentation];
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
  char v4 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  if ((v4 & 2) != 0)
  {
    unsigned int v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)self enrollmentMode] - 1;
    if (v5 > 6) {
      v6 = @"SIRISETUPENROLLMENTUIMODE_UNKNOWN";
    }
    else {
      v6 = off_1E5EBF200[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"enrollmentMode"];
    char v4 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  }
  if ((v4 & 4) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted isRetry](self, "isRetry"));
    [v3 setObject:v7 forKeyedSubscript:@"isRetry"];
  }
  if (self->_locale)
  {
    v8 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)self locale];
    objc_super v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"locale"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"locale"];
    }
  }
  char v11 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  if (v11)
  {
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted pageNumber](self, "pageNumber"));
    [v3 setObject:v14 forKeyedSubscript:@"pageNumber"];

    char v11 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
    if ((v11 & 8) == 0)
    {
LABEL_15:
      if ((v11 & 0x10) == 0) {
        goto LABEL_16;
      }
      goto LABEL_26;
    }
  }
  else if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 8) == 0)
  {
    goto LABEL_15;
  }
  unsigned int v15 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)self trainingOutcome]
      - 1;
  if (v15 > 2) {
    objc_super v16 = @"SIRISETUPENROLLMENTUITRAININGOUTCOME_UNKNOWN";
  }
  else {
    objc_super v16 = off_1E5EBF238[v15];
  }
  [v3 setObject:v16 forKeyedSubscript:@"trainingOutcome"];
  char v11 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  if ((v11 & 0x10) == 0)
  {
LABEL_16:
    if ((v11 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_26:
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted wasAudioHintNeeded](self, "wasAudioHintNeeded"));
  [v3 setObject:v17 forKeyedSubscript:@"wasAudioHintNeeded"];

  if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 0x20) != 0)
  {
LABEL_17:
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted wasAudioHintSpokenSuccessfully](self, "wasAudioHintSpokenSuccessfully"));
    [v3 setObject:v12 forKeyedSubscript:@"wasAudioHintSpokenSuccessfully"];
  }
LABEL_18:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_wasAudioHintSpokenSuccessfully + 1))
  {
    uint64_t v3 = 2654435761 * self->_pageNumber;
    if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_enrollmentMode;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(SISchemaISOLocale *)self->_locale hash];
  if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_isRetry;
    if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 8) != 0)
    {
LABEL_8:
      uint64_t v7 = 2654435761 * self->_trainingOutcome;
      if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 0x10) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v8 = 0;
      if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 0x20) != 0) {
        goto LABEL_10;
      }
LABEL_14:
      uint64_t v9 = 0;
      return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 8) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = 0;
  if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v8 = 2654435761 * self->_wasAudioHintNeeded;
  if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_wasAudioHintSpokenSuccessfully;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1);
  unsigned int v6 = v4[34];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_31;
  }
  if (v5)
  {
    unsigned int pageNumber = self->_pageNumber;
    if (pageNumber != [v4 pageNumber]) {
      goto LABEL_31;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1);
    unsigned int v6 = v4[34];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_31;
  }
  if (v8)
  {
    int enrollmentMode = self->_enrollmentMode;
    if (enrollmentMode != [v4 enrollmentMode]) {
      goto LABEL_31;
    }
  }
  v10 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)self locale];
  char v11 = [v4 locale];
  v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_31;
  }
  uint64_t v13 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)self locale];
  if (v13)
  {
    v14 = (void *)v13;
    unsigned int v15 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)self locale];
    objc_super v16 = [v4 locale];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unsigned int v18 = *((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1);
  int v19 = (v18 >> 2) & 1;
  unsigned int v20 = v4[34];
  if (v19 != ((v20 >> 2) & 1))
  {
LABEL_31:
    BOOL v28 = 0;
    goto LABEL_32;
  }
  if (v19)
  {
    int isRetry = self->_isRetry;
    if (isRetry != [v4 isRetry]) {
      goto LABEL_31;
    }
    unsigned int v18 = *((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1);
    unsigned int v20 = v4[34];
  }
  int v22 = (v18 >> 3) & 1;
  if (v22 != ((v20 >> 3) & 1)) {
    goto LABEL_31;
  }
  if (v22)
  {
    int trainingOutcome = self->_trainingOutcome;
    if (trainingOutcome != [v4 trainingOutcome]) {
      goto LABEL_31;
    }
    unsigned int v18 = *((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1);
    unsigned int v20 = v4[34];
  }
  int v24 = (v18 >> 4) & 1;
  if (v24 != ((v20 >> 4) & 1)) {
    goto LABEL_31;
  }
  if (v24)
  {
    int wasAudioHintNeeded = self->_wasAudioHintNeeded;
    if (wasAudioHintNeeded == [v4 wasAudioHintNeeded])
    {
      unsigned int v18 = *((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1);
      unsigned int v20 = v4[34];
      goto LABEL_27;
    }
    goto LABEL_31;
  }
LABEL_27:
  int v26 = (v18 >> 5) & 1;
  if (v26 != ((v20 >> 5) & 1)) {
    goto LABEL_31;
  }
  if (v26)
  {
    int wasAudioHintSpokenSuccessfully = self->_wasAudioHintSpokenSuccessfully;
    if (wasAudioHintSpokenSuccessfully != [v4 wasAudioHintSpokenSuccessfully]) {
      goto LABEL_31;
    }
  }
  BOOL v28 = 1;
LABEL_32:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char v4 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  if (v4)
  {
    PBDataWriterWriteUint32Field();
    char v4 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  }
  if ((v4 & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  unsigned int v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)self locale];

  if (v5)
  {
    unsigned int v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttempted *)self locale];
    PBDataWriterWriteSubmessage();
  }
  char v7 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  if ((v7 & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v7 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
    if ((v7 & 8) == 0)
    {
LABEL_9:
      if ((v7 & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  char v7 = *(&self->_wasAudioHintSpokenSuccessfully + 1);
  if ((v7 & 0x10) == 0)
  {
LABEL_10:
    if ((v7 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  if ((*(&self->_wasAudioHintSpokenSuccessfully + 1) & 0x20) != 0) {
LABEL_11:
  }
    PBDataWriterWriteBOOLField();
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return SIRISETUPSchemaSIRISETUPPHSEnrollmentUIUtteranceTrainingAttemptedReadFrom(self, (uint64_t)a3);
}

- (void)deleteWasAudioHintSpokenSuccessfully
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) &= ~0x20u;
}

- (void)setHasWasAudioHintSpokenSuccessfully:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(&self->_wasAudioHintSpokenSuccessfully + 1) = *(&self->_wasAudioHintSpokenSuccessfully + 1) & 0xDF | v3;
}

- (BOOL)hasWasAudioHintSpokenSuccessfully
{
  return (*((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1) >> 5) & 1;
}

- (void)setWasAudioHintSpokenSuccessfully:(BOOL)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) |= 0x20u;
  self->_int wasAudioHintSpokenSuccessfully = a3;
}

- (void)deleteWasAudioHintNeeded
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) &= ~0x10u;
}

- (void)setHasWasAudioHintNeeded:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_wasAudioHintSpokenSuccessfully + 1) = *(&self->_wasAudioHintSpokenSuccessfully + 1) & 0xEF | v3;
}

- (BOOL)hasWasAudioHintNeeded
{
  return (*((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1) >> 4) & 1;
}

- (void)setWasAudioHintNeeded:(BOOL)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) |= 0x10u;
  self->_int wasAudioHintNeeded = a3;
}

- (void)deleteTrainingOutcome
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) &= ~8u;
}

- (void)setHasTrainingOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_wasAudioHintSpokenSuccessfully + 1) = *(&self->_wasAudioHintSpokenSuccessfully + 1) & 0xF7 | v3;
}

- (BOOL)hasTrainingOutcome
{
  return (*((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1) >> 3) & 1;
}

- (void)setTrainingOutcome:(int)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) |= 8u;
  self->_int trainingOutcome = a3;
}

- (void)deleteIsRetry
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) &= ~4u;
}

- (void)setHasIsRetry:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_wasAudioHintSpokenSuccessfully + 1) = *(&self->_wasAudioHintSpokenSuccessfully + 1) & 0xFB | v3;
}

- (BOOL)hasIsRetry
{
  return (*((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1) >> 2) & 1;
}

- (void)setIsRetry:(BOOL)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) |= 4u;
  self->_int isRetry = a3;
}

- (void)deleteLocale
{
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)deleteEnrollmentMode
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) &= ~2u;
}

- (void)setHasEnrollmentMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_wasAudioHintSpokenSuccessfully + 1) = *(&self->_wasAudioHintSpokenSuccessfully + 1) & 0xFD | v3;
}

- (BOOL)hasEnrollmentMode
{
  return (*((unsigned __int8 *)&self->_wasAudioHintSpokenSuccessfully + 1) >> 1) & 1;
}

- (void)setEnrollmentMode:(int)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) |= 2u;
  self->_int enrollmentMode = a3;
}

- (void)deletePageNumber
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) &= ~1u;
}

- (void)setHasPageNumber:(BOOL)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) = *(&self->_wasAudioHintSpokenSuccessfully + 1) & 0xFE | a3;
}

- (BOOL)hasPageNumber
{
  return *(&self->_wasAudioHintSpokenSuccessfully + 1);
}

- (void)setPageNumber:(unsigned int)a3
{
  *(&self->_wasAudioHintSpokenSuccessfully + 1) |= 1u;
  self->_unsigned int pageNumber = a3;
}

@end