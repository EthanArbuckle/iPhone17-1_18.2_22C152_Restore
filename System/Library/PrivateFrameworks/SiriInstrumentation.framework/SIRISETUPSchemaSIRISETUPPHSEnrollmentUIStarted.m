@interface SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted
- (BOOL)hasEnrollmentMode;
- (BOOL)hasLocale;
- (BOOL)hasVoiceTriggerType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted)initWithDictionary:(id)a3;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted)initWithJSON:(id)a3;
- (SISchemaISOLocale)locale;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)enrollmentMode;
- (int)voiceTriggerType;
- (unint64_t)hash;
- (void)deleteEnrollmentMode;
- (void)deleteLocale;
- (void)deleteVoiceTriggerType;
- (void)setEnrollmentMode:(int)a3;
- (void)setHasEnrollmentMode:(BOOL)a3;
- (void)setHasLocale:(BOOL)a3;
- (void)setHasVoiceTriggerType:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setVoiceTriggerType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)self locale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)self deleteLocale];
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

- (void)setLocale:(id)a3
{
}

- (SISchemaISOLocale)locale
{
  return self->_locale;
}

- (int)voiceTriggerType
{
  return self->_voiceTriggerType;
}

- (int)enrollmentMode
{
  return self->_enrollmentMode;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted;
  v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"enrollmentMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted setEnrollmentMode:](v5, "setEnrollmentMode:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"voiceTriggerType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted setVoiceTriggerType:](v5, "setVoiceTriggerType:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[SISchemaISOLocale alloc] initWithDictionary:v8];
      [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)v5 setLocale:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)self dictionaryRepresentation];
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
    unsigned int v4 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)self enrollmentMode] - 1;
    if (v4 > 6) {
      v5 = @"SIRISETUPENROLLMENTUIMODE_UNKNOWN";
    }
    else {
      v5 = off_1E5EBF1C8[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"enrollmentMode"];
  }
  if (self->_locale)
  {
    v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)self locale];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"locale"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"locale"];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int v9 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)self voiceTriggerType];
    v10 = @"SIRISETUPENROLLMENTUIVOICETRIGGERTYPE_UNKNOWN";
    if (v9 == 1) {
      v10 = @"SIRISETUPENROLLMENTUIVOICETRIGGERTYPE_HS";
    }
    if (v9 == 2) {
      v11 = @"SIRISETUPENROLLMENTUIVOICETRIGGERTYPE_HS_JS";
    }
    else {
      v11 = v10;
    }
    [v3 setObject:v11 forKeyedSubscript:@"voiceTriggerType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_enrollmentMode;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(SISchemaISOLocale *)self->_locale hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_voiceTriggerType;
  return v3 ^ v2 ^ [(SISchemaISOLocale *)self->_locale hash];
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $548B5876226131DCE5D166D126AD36BC has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    int enrollmentMode = self->_enrollmentMode;
    if (enrollmentMode != [v4 enrollmentMode]) {
      goto LABEL_14;
    }
    $548B5876226131DCE5D166D126AD36BC has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (!v8
      || (int voiceTriggerType = self->_voiceTriggerType,
          voiceTriggerType == [v4 voiceTriggerType]))
    {
      v10 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)self locale];
      v11 = [v4 locale];
      objc_super v12 = v11;
      if ((v10 == 0) != (v11 != 0))
      {
        uint64_t v13 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)self locale];
        if (!v13)
        {

LABEL_17:
          BOOL v18 = 1;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        v15 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)self locale];
        v16 = [v4 locale];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)self locale];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStarted *)self locale];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRISETUPSchemaSIRISETUPPHSEnrollmentUIStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLocale
{
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
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

@end