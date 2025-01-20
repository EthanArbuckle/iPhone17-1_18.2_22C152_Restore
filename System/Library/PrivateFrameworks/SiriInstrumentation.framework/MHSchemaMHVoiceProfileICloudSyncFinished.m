@interface MHSchemaMHVoiceProfileICloudSyncFinished
- (BOOL)hasEnrollmentId;
- (BOOL)hasIsVoiceProfileSyncSuccess;
- (BOOL)hasLocale;
- (BOOL)hasVoiceProfileSyncFailureReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVoiceProfileSyncSuccess;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHVoiceProfileICloudSyncFinished)initWithDictionary:(id)a3;
- (MHSchemaMHVoiceProfileICloudSyncFinished)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)enrollmentId;
- (NSString)voiceProfileSyncFailureReason;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)locale;
- (unint64_t)hash;
- (void)deleteEnrollmentId;
- (void)deleteIsVoiceProfileSyncSuccess;
- (void)deleteLocale;
- (void)deleteVoiceProfileSyncFailureReason;
- (void)setEnrollmentId:(id)a3;
- (void)setHasEnrollmentId:(BOOL)a3;
- (void)setHasIsVoiceProfileSyncSuccess:(BOOL)a3;
- (void)setHasLocale:(BOOL)a3;
- (void)setHasVoiceProfileSyncFailureReason:(BOOL)a3;
- (void)setIsVoiceProfileSyncSuccess:(BOOL)a3;
- (void)setLocale:(int)a3;
- (void)setVoiceProfileSyncFailureReason:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHVoiceProfileICloudSyncFinished

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceProfileSyncFailureReason, 0);
  objc_storeStrong((id *)&self->_enrollmentId, 0);
}

- (void)setHasVoiceProfileSyncFailureReason:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasEnrollmentId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)locale
{
  return self->_locale;
}

- (void)setVoiceProfileSyncFailureReason:(id)a3
{
}

- (NSString)voiceProfileSyncFailureReason
{
  return self->_voiceProfileSyncFailureReason;
}

- (BOOL)isVoiceProfileSyncSuccess
{
  return self->_isVoiceProfileSyncSuccess;
}

- (void)setEnrollmentId:(id)a3
{
}

- (NSString)enrollmentId
{
  return self->_enrollmentId;
}

- (MHSchemaMHVoiceProfileICloudSyncFinished)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MHSchemaMHVoiceProfileICloudSyncFinished;
  v5 = [(MHSchemaMHVoiceProfileICloudSyncFinished *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"enrollmentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(MHSchemaMHVoiceProfileICloudSyncFinished *)v5 setEnrollmentId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"isVoiceProfileSyncSuccess"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceProfileICloudSyncFinished setIsVoiceProfileSyncSuccess:](v5, "setIsVoiceProfileSyncSuccess:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"voiceProfileSyncFailureReason"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(MHSchemaMHVoiceProfileICloudSyncFinished *)v5 setVoiceProfileSyncFailureReason:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceProfileICloudSyncFinished setLocale:](v5, "setLocale:", [v11 intValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (MHSchemaMHVoiceProfileICloudSyncFinished)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHVoiceProfileICloudSyncFinished *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHVoiceProfileICloudSyncFinished *)self dictionaryRepresentation];
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
  if (self->_enrollmentId)
  {
    id v4 = [(MHSchemaMHVoiceProfileICloudSyncFinished *)self enrollmentId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"enrollmentId"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[MHSchemaMHVoiceProfileICloudSyncFinished isVoiceProfileSyncSuccess](self, "isVoiceProfileSyncSuccess"));
    [v3 setObject:v7 forKeyedSubscript:@"isVoiceProfileSyncSuccess"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v8 = [(MHSchemaMHVoiceProfileICloudSyncFinished *)self locale] - 1;
    if (v8 > 0x3D) {
      v9 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v9 = off_1E5EC01D8[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"locale"];
  }
  if (self->_voiceProfileSyncFailureReason)
  {
    v10 = [(MHSchemaMHVoiceProfileICloudSyncFinished *)self voiceProfileSyncFailureReason];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"voiceProfileSyncFailureReason"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_enrollmentId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_isVoiceProfileSyncSuccess;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_voiceProfileSyncFailureReason hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_locale;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  NSUInteger v5 = [(MHSchemaMHVoiceProfileICloudSyncFinished *)self enrollmentId];
  uint64_t v6 = [v4 enrollmentId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(MHSchemaMHVoiceProfileICloudSyncFinished *)self enrollmentId];
  if (v7)
  {
    unsigned int v8 = (void *)v7;
    v9 = [(MHSchemaMHVoiceProfileICloudSyncFinished *)self enrollmentId];
    v10 = [v4 enrollmentId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[36] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isVoiceProfileSyncSuccess = self->_isVoiceProfileSyncSuccess;
    if (isVoiceProfileSyncSuccess != [v4 isVoiceProfileSyncSuccess]) {
      goto LABEL_15;
    }
  }
  NSUInteger v5 = [(MHSchemaMHVoiceProfileICloudSyncFinished *)self voiceProfileSyncFailureReason];
  uint64_t v6 = [v4 voiceProfileSyncFailureReason];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v13 = [(MHSchemaMHVoiceProfileICloudSyncFinished *)self voiceProfileSyncFailureReason];
  if (v13)
  {
    objc_super v14 = (void *)v13;
    v15 = [(MHSchemaMHVoiceProfileICloudSyncFinished *)self voiceProfileSyncFailureReason];
    v16 = [v4 voiceProfileSyncFailureReason];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v20 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v20 == ((v4[36] >> 1) & 1))
  {
    if (!v20 || (int locale = self->_locale, locale == [v4 locale]))
    {
      BOOL v18 = 1;
      goto LABEL_16;
    }
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(MHSchemaMHVoiceProfileICloudSyncFinished *)self enrollmentId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  NSUInteger v5 = [(MHSchemaMHVoiceProfileICloudSyncFinished *)self voiceProfileSyncFailureReason];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  uint64_t v6 = v7;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceProfileICloudSyncFinishedReadFrom(self, (uint64_t)a3);
}

- (void)deleteLocale
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasLocale:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocale
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int locale = a3;
}

- (void)deleteVoiceProfileSyncFailureReason
{
}

- (BOOL)hasVoiceProfileSyncFailureReason
{
  return self->_voiceProfileSyncFailureReason != 0;
}

- (void)deleteIsVoiceProfileSyncSuccess
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsVoiceProfileSyncSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsVoiceProfileSyncSuccess
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsVoiceProfileSyncSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isVoiceProfileSyncSuccess = a3;
}

- (void)deleteEnrollmentId
{
}

- (BOOL)hasEnrollmentId
{
  return self->_enrollmentId != 0;
}

@end