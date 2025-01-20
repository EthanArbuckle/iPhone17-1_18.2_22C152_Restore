@interface SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected
- (BOOL)hasAudioId;
- (BOOL)hasEnrollmentDate;
- (BOOL)hasPageNumber;
- (BOOL)hasSiriInputLocale;
- (BOOL)hasTriggerPhrase;
- (BOOL)hasUtteranceEnrollSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)utteranceEnrollSuccess;
- (NSData)jsonData;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected)initWithDictionary:(id)a3;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected)initWithJSON:(id)a3;
- (SISchemaISOLocale)siriInputLocale;
- (SISchemaUUID)audioId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)triggerPhrase;
- (unint64_t)enrollmentDate;
- (unint64_t)hash;
- (unsigned)pageNumber;
- (void)deleteAudioId;
- (void)deleteEnrollmentDate;
- (void)deletePageNumber;
- (void)deleteSiriInputLocale;
- (void)deleteTriggerPhrase;
- (void)deleteUtteranceEnrollSuccess;
- (void)setAudioId:(id)a3;
- (void)setEnrollmentDate:(unint64_t)a3;
- (void)setHasAudioId:(BOOL)a3;
- (void)setHasEnrollmentDate:(BOOL)a3;
- (void)setHasPageNumber:(BOOL)a3;
- (void)setHasSiriInputLocale:(BOOL)a3;
- (void)setHasTriggerPhrase:(BOOL)a3;
- (void)setHasUtteranceEnrollSuccess:(BOOL)a3;
- (void)setPageNumber:(unsigned int)a3;
- (void)setSiriInputLocale:(id)a3;
- (void)setTriggerPhrase:(int)a3;
- (void)setUtteranceEnrollSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self audioId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self deleteAudioId];
  }
  v9 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self siriInputLocale];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self deleteSiriInputLocale];
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
  objc_storeStrong((id *)&self->_siriInputLocale, 0);
  objc_storeStrong((id *)&self->_audioId, 0);
}

- (void)setHasSiriInputLocale:(BOOL)a3
{
  *(&self->_utteranceEnrollSuccess + 3) = a3;
}

- (void)setHasAudioId:(BOOL)a3
{
  *(&self->_utteranceEnrollSuccess + 2) = a3;
}

- (BOOL)utteranceEnrollSuccess
{
  return self->_utteranceEnrollSuccess;
}

- (unint64_t)enrollmentDate
{
  return self->_enrollmentDate;
}

- (void)setSiriInputLocale:(id)a3
{
}

- (SISchemaISOLocale)siriInputLocale
{
  return self->_siriInputLocale;
}

- (int)triggerPhrase
{
  return self->_triggerPhrase;
}

- (void)setAudioId:(id)a3
{
}

- (SISchemaUUID)audioId
{
  return self->_audioId;
}

- (unsigned)pageNumber
{
  return self->_pageNumber;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected;
  v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"pageNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected setPageNumber:](v5, "setPageNumber:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"audioId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[SISchemaUUID alloc] initWithDictionary:v7];
      [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)v5 setAudioId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"triggerPhrase"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected setTriggerPhrase:](v5, "setTriggerPhrase:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"siriInputLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaISOLocale alloc] initWithDictionary:v10];
      [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)v5 setSiriInputLocale:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"enrollmentDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected setEnrollmentDate:](v5, "setEnrollmentDate:", [v12 unsignedLongLongValue]);
    }
    objc_super v13 = [v4 objectForKeyedSubscript:@"utteranceEnrollSuccess"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected setUtteranceEnrollSuccess:](v5, "setUtteranceEnrollSuccess:", [v13 BOOLValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self dictionaryRepresentation];
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
  if (self->_audioId)
  {
    id v4 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self audioId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"audioId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"audioId"];
    }
  }
  char v7 = *(&self->_utteranceEnrollSuccess + 1);
  if ((v7 & 4) != 0)
  {
    int v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected enrollmentDate](self, "enrollmentDate"));
    [v3 setObject:v8 forKeyedSubscript:@"enrollmentDate"];

    char v7 = *(&self->_utteranceEnrollSuccess + 1);
  }
  if (v7)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected pageNumber](self, "pageNumber"));
    [v3 setObject:v9 forKeyedSubscript:@"pageNumber"];
  }
  if (self->_siriInputLocale)
  {
    v10 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self siriInputLocale];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"siriInputLocale"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"siriInputLocale"];
    }
  }
  char v13 = *(&self->_utteranceEnrollSuccess + 1);
  if ((v13 & 2) != 0)
  {
    int v14 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self triggerPhrase];
    v15 = @"TRIGGERPHRASE_UNKNOWN";
    if (v14 == 1) {
      v15 = @"TRIGGERPHRASE_HEY_SIRI";
    }
    if (v14 == 2) {
      objc_super v16 = @"TRIGGERPHRASE_SIRI";
    }
    else {
      objc_super v16 = v15;
    }
    [v3 setObject:v16 forKeyedSubscript:@"triggerPhrase"];
    char v13 = *(&self->_utteranceEnrollSuccess + 1);
  }
  if ((v13 & 8) != 0)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected utteranceEnrollSuccess](self, "utteranceEnrollSuccess"));
    [v3 setObject:v17 forKeyedSubscript:@"utteranceEnrollSuccess"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_utteranceEnrollSuccess + 1)) {
    uint64_t v3 = 2654435761 * self->_pageNumber;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(SISchemaUUID *)self->_audioId hash];
  if ((*(&self->_utteranceEnrollSuccess + 1) & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_triggerPhrase;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(SISchemaISOLocale *)self->_siriInputLocale hash];
  if ((*(&self->_utteranceEnrollSuccess + 1) & 4) != 0)
  {
    unint64_t v7 = 2654435761u * self->_enrollmentDate;
    if ((*(&self->_utteranceEnrollSuccess + 1) & 8) != 0) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  unint64_t v7 = 0;
  if ((*(&self->_utteranceEnrollSuccess + 1) & 8) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v8 = 2654435761 * self->_utteranceEnrollSuccess;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if (*(&self->_utteranceEnrollSuccess + 1) != (v4[49] & 1)) {
    goto LABEL_18;
  }
  if (*(&self->_utteranceEnrollSuccess + 1))
  {
    unsigned int pageNumber = self->_pageNumber;
    if (pageNumber != [v4 pageNumber]) {
      goto LABEL_18;
    }
  }
  unint64_t v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self audioId];
  unint64_t v7 = [v4 audioId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_17;
  }
  uint64_t v8 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self audioId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self audioId];
    int v11 = [v4 audioId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v13 = (*((unsigned __int8 *)&self->_utteranceEnrollSuccess + 1) >> 1) & 1;
  if (v13 != ((v4[49] >> 1) & 1)) {
    goto LABEL_18;
  }
  if (v13)
  {
    int triggerPhrase = self->_triggerPhrase;
    if (triggerPhrase != [v4 triggerPhrase]) {
      goto LABEL_18;
    }
  }
  unint64_t v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self siriInputLocale];
  unint64_t v7 = [v4 siriInputLocale];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v15 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self siriInputLocale];
  if (v15)
  {
    objc_super v16 = (void *)v15;
    v17 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self siriInputLocale];
    v18 = [v4 siriInputLocale];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  unsigned int v22 = *((unsigned __int8 *)&self->_utteranceEnrollSuccess + 1);
  int v23 = (v22 >> 2) & 1;
  unsigned int v24 = v4[49];
  if (v23 == ((v24 >> 2) & 1))
  {
    if (v23)
    {
      unint64_t enrollmentDate = self->_enrollmentDate;
      if (enrollmentDate != [v4 enrollmentDate]) {
        goto LABEL_18;
      }
      unsigned int v22 = *((unsigned __int8 *)&self->_utteranceEnrollSuccess + 1);
      unsigned int v24 = v4[49];
    }
    int v26 = (v22 >> 3) & 1;
    if (v26 == ((v24 >> 3) & 1))
    {
      if (!v26
        || (int utteranceEnrollSuccess = self->_utteranceEnrollSuccess,
            utteranceEnrollSuccess == [v4 utteranceEnrollSuccess]))
      {
        BOOL v20 = 1;
        goto LABEL_19;
      }
    }
  }
LABEL_18:
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  if (*(&self->_utteranceEnrollSuccess + 1)) {
    PBDataWriterWriteUint32Field();
  }
  unint64_t v4 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self audioId];

  if (v4)
  {
    uint64_t v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self audioId];
    PBDataWriterWriteSubmessage();
  }
  if ((*(&self->_utteranceEnrollSuccess + 1) & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self siriInputLocale];

  if (v6)
  {
    unint64_t v7 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetected *)self siriInputLocale];
    PBDataWriterWriteSubmessage();
  }
  char v8 = *(&self->_utteranceEnrollSuccess + 1);
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char v8 = *(&self->_utteranceEnrollSuccess + 1);
  }
  if ((v8 & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRISETUPSchemaSIRISETUPPHSEnrollmentUtteranceDetectedReadFrom(self, (uint64_t)a3);
}

- (void)deleteUtteranceEnrollSuccess
{
  *(&self->_utteranceEnrollSuccess + 1) &= ~8u;
}

- (void)setHasUtteranceEnrollSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_utteranceEnrollSuccess + 1) = *(&self->_utteranceEnrollSuccess + 1) & 0xF7 | v3;
}

- (BOOL)hasUtteranceEnrollSuccess
{
  return (*((unsigned __int8 *)&self->_utteranceEnrollSuccess + 1) >> 3) & 1;
}

- (void)setUtteranceEnrollSuccess:(BOOL)a3
{
  *(&self->_utteranceEnrollSuccess + 1) |= 8u;
  self->_int utteranceEnrollSuccess = a3;
}

- (void)deleteEnrollmentDate
{
  *(&self->_utteranceEnrollSuccess + 1) &= ~4u;
}

- (void)setHasEnrollmentDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_utteranceEnrollSuccess + 1) = *(&self->_utteranceEnrollSuccess + 1) & 0xFB | v3;
}

- (BOOL)hasEnrollmentDate
{
  return (*((unsigned __int8 *)&self->_utteranceEnrollSuccess + 1) >> 2) & 1;
}

- (void)setEnrollmentDate:(unint64_t)a3
{
  *(&self->_utteranceEnrollSuccess + 1) |= 4u;
  self->_unint64_t enrollmentDate = a3;
}

- (void)deleteSiriInputLocale
{
}

- (BOOL)hasSiriInputLocale
{
  return self->_siriInputLocale != 0;
}

- (void)deleteTriggerPhrase
{
  *(&self->_utteranceEnrollSuccess + 1) &= ~2u;
}

- (void)setHasTriggerPhrase:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_utteranceEnrollSuccess + 1) = *(&self->_utteranceEnrollSuccess + 1) & 0xFD | v3;
}

- (BOOL)hasTriggerPhrase
{
  return (*((unsigned __int8 *)&self->_utteranceEnrollSuccess + 1) >> 1) & 1;
}

- (void)setTriggerPhrase:(int)a3
{
  *(&self->_utteranceEnrollSuccess + 1) |= 2u;
  self->_int triggerPhrase = a3;
}

- (void)deleteAudioId
{
}

- (BOOL)hasAudioId
{
  return self->_audioId != 0;
}

- (void)deletePageNumber
{
  *(&self->_utteranceEnrollSuccess + 1) &= ~1u;
}

- (void)setHasPageNumber:(BOOL)a3
{
  *(&self->_utteranceEnrollSuccess + 1) = *(&self->_utteranceEnrollSuccess + 1) & 0xFE | a3;
}

- (BOOL)hasPageNumber
{
  return *(&self->_utteranceEnrollSuccess + 1);
}

- (void)setPageNumber:(unsigned int)a3
{
  *(&self->_utteranceEnrollSuccess + 1) |= 1u;
  self->_unsigned int pageNumber = a3;
}

@end