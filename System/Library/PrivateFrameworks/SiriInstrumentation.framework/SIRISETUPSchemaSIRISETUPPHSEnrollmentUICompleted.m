@interface SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted
- (BOOL)hasEnrollmentMode;
- (BOOL)hasEnrollmentOutcome;
- (BOOL)hasLocale;
- (BOOL)hasPageNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted)initWithDictionary:(id)a3;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted)initWithJSON:(id)a3;
- (SISchemaISOLocale)locale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)enrollmentMode;
- (int)enrollmentOutcome;
- (unint64_t)hash;
- (unsigned)pageNumber;
- (void)deleteEnrollmentMode;
- (void)deleteEnrollmentOutcome;
- (void)deleteLocale;
- (void)deletePageNumber;
- (void)setEnrollmentMode:(int)a3;
- (void)setEnrollmentOutcome:(int)a3;
- (void)setHasEnrollmentMode:(BOOL)a3;
- (void)setHasEnrollmentOutcome:(BOOL)a3;
- (void)setHasLocale:(BOOL)a3;
- (void)setHasPageNumber:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setPageNumber:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)self locale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)self deleteLocale];
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
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)pageNumber
{
  return self->_pageNumber;
}

- (int)enrollmentOutcome
{
  return self->_enrollmentOutcome;
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

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted;
  v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"enrollmentMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted setEnrollmentMode:](v5, "setEnrollmentMode:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[SISchemaISOLocale alloc] initWithDictionary:v7];
      [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)v5 setLocale:v8];
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"enrollmentOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted setEnrollmentOutcome:](v5, "setEnrollmentOutcome:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"pageNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted setPageNumber:](v5, "setPageNumber:", [v10 unsignedIntValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)self dictionaryRepresentation];
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
    unsigned int v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)self enrollmentMode] - 1;
    if (v5 > 6) {
      v6 = @"SIRISETUPENROLLMENTUIMODE_UNKNOWN";
    }
    else {
      v6 = off_1E5EBF178[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"enrollmentMode"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v7 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)self enrollmentOutcome] - 1;
    if (v7 > 2) {
      v8 = @"SIRISETUPENROLLMENTUISESSIONOUTCOME_UNKNOWN";
    }
    else {
      v8 = off_1E5EBF1B0[v7];
    }
    [v3 setObject:v8 forKeyedSubscript:@"enrollmentOutcome"];
  }
  if (self->_locale)
  {
    objc_super v9 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)self locale];
    v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"locale"];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"locale"];
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted pageNumber](self, "pageNumber"));
    [v3 setObject:v12 forKeyedSubscript:@"pageNumber"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_enrollmentMode;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SISchemaISOLocale *)self->_locale hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_enrollmentOutcome;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_pageNumber;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    int enrollmentMode = self->_enrollmentMode;
    if (enrollmentMode != [v4 enrollmentMode]) {
      goto LABEL_19;
    }
  }
  uint64_t v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)self locale];
  unsigned int v7 = [v4 locale];
  v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_19;
  }
  uint64_t v9 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)self locale];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)self locale];
    v12 = [v4 locale];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $94DF0BD37169BFE72FA37FC8BB2DCBE1 has = self->_has;
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v16 = v4[32];
  if (v15 != ((v16 >> 1) & 1))
  {
LABEL_19:
    BOOL v20 = 0;
    goto LABEL_20;
  }
  if (v15)
  {
    int enrollmentOutcome = self->_enrollmentOutcome;
    if (enrollmentOutcome == [v4 enrollmentOutcome])
    {
      $94DF0BD37169BFE72FA37FC8BB2DCBE1 has = self->_has;
      unsigned int v16 = v4[32];
      goto LABEL_15;
    }
    goto LABEL_19;
  }
LABEL_15:
  int v18 = (*(unsigned int *)&has >> 2) & 1;
  if (v18 != ((v16 >> 2) & 1)) {
    goto LABEL_19;
  }
  if (v18)
  {
    unsigned int pageNumber = self->_pageNumber;
    if (pageNumber != [v4 pageNumber]) {
      goto LABEL_19;
    }
  }
  BOOL v20 = 1;
LABEL_20:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v4 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)self locale];

  if (v4)
  {
    uint64_t v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompleted *)self locale];
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRISETUPSchemaSIRISETUPPHSEnrollmentUICompletedReadFrom(self, (uint64_t)a3);
}

- (void)deletePageNumber
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPageNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPageNumber
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPageNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int pageNumber = a3;
}

- (void)deleteEnrollmentOutcome
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEnrollmentOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEnrollmentOutcome
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEnrollmentOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int enrollmentOutcome = a3;
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

@end