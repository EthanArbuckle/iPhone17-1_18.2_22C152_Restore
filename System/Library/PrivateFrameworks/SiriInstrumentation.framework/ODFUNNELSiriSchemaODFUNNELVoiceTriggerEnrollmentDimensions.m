@interface ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions
- (BOOL)hasCoreDimensions;
- (BOOL)hasEnrollmentMode;
- (BOOL)hasEnrollmentOutcome;
- (BOOL)hasPageNumberCompleted;
- (BOOL)hasTrainingOutcome;
- (BOOL)hasVoiceTriggerType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (ODFUNNELSiriSchemaODFUNNELCoreDimensions)coreDimensions;
- (ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions)initWithDictionary:(id)a3;
- (ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)enrollmentMode;
- (int)enrollmentOutcome;
- (int)trainingOutcome;
- (int)voiceTriggerType;
- (unint64_t)hash;
- (unsigned)pageNumberCompleted;
- (void)deleteCoreDimensions;
- (void)deleteEnrollmentMode;
- (void)deleteEnrollmentOutcome;
- (void)deletePageNumberCompleted;
- (void)deleteTrainingOutcome;
- (void)deleteVoiceTriggerType;
- (void)setCoreDimensions:(id)a3;
- (void)setEnrollmentMode:(int)a3;
- (void)setEnrollmentOutcome:(int)a3;
- (void)setHasCoreDimensions:(BOOL)a3;
- (void)setHasEnrollmentMode:(BOOL)a3;
- (void)setHasEnrollmentOutcome:(BOOL)a3;
- (void)setHasPageNumberCompleted:(BOOL)a3;
- (void)setHasTrainingOutcome:(BOOL)a3;
- (void)setHasVoiceTriggerType:(BOOL)a3;
- (void)setPageNumberCompleted:(unsigned int)a3;
- (void)setTrainingOutcome:(int)a3;
- (void)setVoiceTriggerType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self coreDimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self deleteCoreDimensions];
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

- (void)setHasCoreDimensions:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)trainingOutcome
{
  return self->_trainingOutcome;
}

- (unsigned)pageNumberCompleted
{
  return self->_pageNumberCompleted;
}

- (int)enrollmentOutcome
{
  return self->_enrollmentOutcome;
}

- (int)voiceTriggerType
{
  return self->_voiceTriggerType;
}

- (int)enrollmentMode
{
  return self->_enrollmentMode;
}

- (void)setCoreDimensions:(id)a3
{
}

- (ODFUNNELSiriSchemaODFUNNELCoreDimensions)coreDimensions
{
  return self->_coreDimensions;
}

- (ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions;
  v5 = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"coreDimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODFUNNELSiriSchemaODFUNNELCoreDimensions alloc] initWithDictionary:v6];
      [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)v5 setCoreDimensions:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"enrollmentMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions setEnrollmentMode:](v5, "setEnrollmentMode:", [v8 intValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"voiceTriggerType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions setVoiceTriggerType:](v5, "setVoiceTriggerType:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"enrollmentOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions setEnrollmentOutcome:](v5, "setEnrollmentOutcome:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"pageNumberCompleted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions setPageNumberCompleted:](v5, "setPageNumberCompleted:", [v11 unsignedIntValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"trainingOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions setTrainingOutcome:](v5, "setTrainingOutcome:", [v12 intValue]);
    }
    v13 = v5;
  }
  return v5;
}

- (ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self dictionaryRepresentation];
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
  if (self->_coreDimensions)
  {
    id v4 = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self coreDimensions];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"coreDimensions"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"coreDimensions"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v12 = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self enrollmentMode] - 1;
    if (v12 > 6) {
      v13 = @"SIRISETUPENROLLMENTUIMODE_UNKNOWN";
    }
    else {
      v13 = off_1E5EC1AA0[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"enrollmentMode"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_8:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_8;
  }
  unsigned int v14 = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self enrollmentOutcome] - 1;
  if (v14 > 2) {
    objc_super v15 = @"SIRISETUPENROLLMENTUISESSIONOUTCOME_UNKNOWN";
  }
  else {
    objc_super v15 = off_1E5EC1AD8[v14];
  }
  [v3 setObject:v15 forKeyedSubscript:@"enrollmentOutcome"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions pageNumberCompleted](self, "pageNumberCompleted"));
  [v3 setObject:v16 forKeyedSubscript:@"pageNumberCompleted"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
LABEL_29:
  unsigned int v17 = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self trainingOutcome] - 1;
  if (v17 > 2) {
    v18 = @"SIRISETUPENROLLMENTUITRAININGOUTCOME_UNKNOWN";
  }
  else {
    v18 = off_1E5EC1AF0[v17];
  }
  [v3 setObject:v18 forKeyedSubscript:@"trainingOutcome"];
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_17;
  }
LABEL_11:
  int v8 = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self voiceTriggerType];
  objc_super v9 = @"SIRISETUPENROLLMENTUIVOICETRIGGERTYPE_UNKNOWN";
  if (v8 == 1) {
    objc_super v9 = @"SIRISETUPENROLLMENTUIVOICETRIGGERTYPE_HS";
  }
  if (v8 == 2) {
    v10 = @"SIRISETUPENROLLMENTUIVOICETRIGGERTYPE_HS_JS";
  }
  else {
    v10 = v9;
  }
  [v3 setObject:v10 forKeyedSubscript:@"voiceTriggerType"];
LABEL_17:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODFUNNELSiriSchemaODFUNNELCoreDimensions *)self->_coreDimensions hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_enrollmentMode;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_voiceTriggerType;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_enrollmentOutcome;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_pageNumberCompleted;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_trainingOutcome;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  uint64_t v5 = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self coreDimensions];
  uint64_t v6 = [v4 coreDimensions];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

    goto LABEL_28;
  }
  uint64_t v8 = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self coreDimensions];
  if (v8)
  {
    objc_super v9 = (void *)v8;
    v10 = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self coreDimensions];
    v11 = [v4 coreDimensions];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_28;
    }
  }
  else
  {
  }
  $2E83BFF84BFAD03899E5E1CC54226552 has = self->_has;
  unsigned int v14 = v4[36];
  if ((*(unsigned char *)&has & 1) != (v14 & 1))
  {
LABEL_28:
    BOOL v24 = 0;
    goto LABEL_29;
  }
  if (*(unsigned char *)&has)
  {
    int enrollmentMode = self->_enrollmentMode;
    if (enrollmentMode != [v4 enrollmentMode]) {
      goto LABEL_28;
    }
    $2E83BFF84BFAD03899E5E1CC54226552 has = self->_has;
    unsigned int v14 = v4[36];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v14 >> 1) & 1)) {
    goto LABEL_28;
  }
  if (v16)
  {
    int voiceTriggerType = self->_voiceTriggerType;
    if (voiceTriggerType != [v4 voiceTriggerType]) {
      goto LABEL_28;
    }
    $2E83BFF84BFAD03899E5E1CC54226552 has = self->_has;
    unsigned int v14 = v4[36];
  }
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v14 >> 2) & 1)) {
    goto LABEL_28;
  }
  if (v18)
  {
    int enrollmentOutcome = self->_enrollmentOutcome;
    if (enrollmentOutcome != [v4 enrollmentOutcome]) {
      goto LABEL_28;
    }
    $2E83BFF84BFAD03899E5E1CC54226552 has = self->_has;
    unsigned int v14 = v4[36];
  }
  int v20 = (*(unsigned int *)&has >> 3) & 1;
  if (v20 != ((v14 >> 3) & 1)) {
    goto LABEL_28;
  }
  if (v20)
  {
    unsigned int pageNumberCompleted = self->_pageNumberCompleted;
    if (pageNumberCompleted == [v4 pageNumberCompleted])
    {
      $2E83BFF84BFAD03899E5E1CC54226552 has = self->_has;
      unsigned int v14 = v4[36];
      goto LABEL_24;
    }
    goto LABEL_28;
  }
LABEL_24:
  int v22 = (*(unsigned int *)&has >> 4) & 1;
  if (v22 != ((v14 >> 4) & 1)) {
    goto LABEL_28;
  }
  if (v22)
  {
    int trainingOutcome = self->_trainingOutcome;
    if (trainingOutcome != [v4 trainingOutcome]) {
      goto LABEL_28;
    }
  }
  BOOL v24 = 1;
LABEL_29:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self coreDimensions];

  if (v4)
  {
    uint64_t v5 = [(ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensions *)self coreDimensions];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
LABEL_10:
}

- (BOOL)readFrom:(id)a3
{
  return ODFUNNELSiriSchemaODFUNNELVoiceTriggerEnrollmentDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)deleteTrainingOutcome
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasTrainingOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTrainingOutcome
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTrainingOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int trainingOutcome = a3;
}

- (void)deletePageNumberCompleted
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasPageNumberCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPageNumberCompleted
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPageNumberCompleted:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unsigned int pageNumberCompleted = a3;
}

- (void)deleteEnrollmentOutcome
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasEnrollmentOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEnrollmentOutcome
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEnrollmentOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int enrollmentOutcome = a3;
}

- (void)deleteVoiceTriggerType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasVoiceTriggerType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVoiceTriggerType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setVoiceTriggerType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int voiceTriggerType = a3;
}

- (void)deleteEnrollmentMode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEnrollmentMode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnrollmentMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEnrollmentMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int enrollmentMode = a3;
}

- (void)deleteCoreDimensions
{
}

- (BOOL)hasCoreDimensions
{
  return self->_coreDimensions != 0;
}

@end