@interface SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted
- (BOOL)hasIsMaxNumContinuousZerosOverThreshold;
- (BOOL)hasLocale;
- (BOOL)hasMaxNumAllowedContinuousZeros;
- (BOOL)hasMaxNumContinuousZeros;
- (BOOL)hasPageNumber;
- (BOOL)hasPhraseId;
- (BOOL)hasStageStatus;
- (BOOL)hasVtAssetConfigVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMaxNumContinuousZerosOverThreshold;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)locale;
- (NSString)phraseId;
- (NSString)vtAssetConfigVersion;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted)initWithDictionary:(id)a3;
- (SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)stageStatus;
- (unint64_t)hash;
- (unsigned)maxNumAllowedContinuousZeros;
- (unsigned)maxNumContinuousZeros;
- (unsigned)pageNumber;
- (void)deleteIsMaxNumContinuousZerosOverThreshold;
- (void)deleteLocale;
- (void)deleteMaxNumAllowedContinuousZeros;
- (void)deleteMaxNumContinuousZeros;
- (void)deletePageNumber;
- (void)deletePhraseId;
- (void)deleteStageStatus;
- (void)deleteVtAssetConfigVersion;
- (void)setHasIsMaxNumContinuousZerosOverThreshold:(BOOL)a3;
- (void)setHasLocale:(BOOL)a3;
- (void)setHasMaxNumAllowedContinuousZeros:(BOOL)a3;
- (void)setHasMaxNumContinuousZeros:(BOOL)a3;
- (void)setHasPageNumber:(BOOL)a3;
- (void)setHasPhraseId:(BOOL)a3;
- (void)setHasStageStatus:(BOOL)a3;
- (void)setHasVtAssetConfigVersion:(BOOL)a3;
- (void)setIsMaxNumContinuousZerosOverThreshold:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setMaxNumAllowedContinuousZeros:(unsigned int)a3;
- (void)setMaxNumContinuousZeros:(unsigned int)a3;
- (void)setPageNumber:(unsigned int)a3;
- (void)setPhraseId:(id)a3;
- (void)setStageStatus:(int)a3;
- (void)setVtAssetConfigVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_vtAssetConfigVersion, 0);
  objc_storeStrong((id *)&self->_phraseId, 0);
}

- (void)setHasLocale:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasVtAssetConfigVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasPhraseId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)stageStatus
{
  return self->_stageStatus;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setVtAssetConfigVersion:(id)a3
{
}

- (NSString)vtAssetConfigVersion
{
  return self->_vtAssetConfigVersion;
}

- (BOOL)isMaxNumContinuousZerosOverThreshold
{
  return self->_isMaxNumContinuousZerosOverThreshold;
}

- (unsigned)maxNumAllowedContinuousZeros
{
  return self->_maxNumAllowedContinuousZeros;
}

- (unsigned)maxNumContinuousZeros
{
  return self->_maxNumContinuousZeros;
}

- (void)setPhraseId:(id)a3
{
}

- (NSString)phraseId
{
  return self->_phraseId;
}

- (unsigned)pageNumber
{
  return self->_pageNumber;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted;
  v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"pageNumber"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setPageNumber:](v5, "setPageNumber:", [v6 unsignedIntValue]);
    }
    v19 = v6;
    v7 = [v4 objectForKeyedSubscript:@"phraseId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)v5 setPhraseId:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"maxNumContinuousZeros"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setMaxNumContinuousZeros:](v5, "setMaxNumContinuousZeros:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"maxNumAllowedContinuousZeros"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setMaxNumAllowedContinuousZeros:](v5, "setMaxNumAllowedContinuousZeros:", [v10 unsignedIntValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isMaxNumContinuousZerosOverThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setIsMaxNumContinuousZerosOverThreshold:](v5, "setIsMaxNumContinuousZerosOverThreshold:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"vtAssetConfigVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)v5 setVtAssetConfigVersion:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"locale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)v5 setLocale:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"stageStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted setStageStatus:](v5, "setStageStatus:", [v16 intValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted isMaxNumContinuousZerosOverThreshold](self, "isMaxNumContinuousZerosOverThreshold"));
    [v3 setObject:v4 forKeyedSubscript:@"isMaxNumContinuousZerosOverThreshold"];
  }
  if (self->_locale)
  {
    v5 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self locale];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"locale"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted maxNumAllowedContinuousZeros](self, "maxNumAllowedContinuousZeros"));
    [v3 setObject:v13 forKeyedSubscript:@"maxNumAllowedContinuousZeros"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted maxNumContinuousZeros](self, "maxNumContinuousZeros"));
  [v3 setObject:v14 forKeyedSubscript:@"maxNumContinuousZeros"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted pageNumber](self, "pageNumber"));
    [v3 setObject:v8 forKeyedSubscript:@"pageNumber"];
  }
LABEL_9:
  if (self->_phraseId)
  {
    v9 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self phraseId];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"phraseId"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    unsigned int v11 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self stageStatus] - 1;
    if (v11 > 7) {
      v12 = @"SIRISETUPTRAININGMANAGERSTAGESTATUS_UNKNOWN";
    }
    else {
      v12 = off_1E5EB9FB0[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"stageStatus"];
  }
  if (self->_vtAssetConfigVersion)
  {
    v15 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self vtAssetConfigVersion];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"vtAssetConfigVersion"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_pageNumber;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_phraseId hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v5 = 2654435761 * self->_maxNumContinuousZeros;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_maxNumAllowedContinuousZeros;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_isMaxNumContinuousZerosOverThreshold;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v7 = 0;
LABEL_11:
  NSUInteger v8 = [(NSString *)self->_vtAssetConfigVersion hash];
  NSUInteger v9 = [(NSString *)self->_locale hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v10 = 2654435761 * self->_stageStatus;
  }
  else {
    uint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[60] & 1)) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int pageNumber = self->_pageNumber;
    if (pageNumber != [v4 pageNumber]) {
      goto LABEL_31;
    }
  }
  uint64_t v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self phraseId];
  uint64_t v7 = [v4 phraseId];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_30;
  }
  uint64_t v8 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self phraseId];
  if (v8)
  {
    NSUInteger v9 = (void *)v8;
    uint64_t v10 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self phraseId];
    unsigned int v11 = [v4 phraseId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  $057181A5B918859FBE6917C2319BC98B has = self->_has;
  int v14 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v15 = v4[60];
  if (v14 != ((v15 >> 1) & 1)) {
    goto LABEL_31;
  }
  if (v14)
  {
    unsigned int maxNumContinuousZeros = self->_maxNumContinuousZeros;
    if (maxNumContinuousZeros != [v4 maxNumContinuousZeros]) {
      goto LABEL_31;
    }
    $057181A5B918859FBE6917C2319BC98B has = self->_has;
    unsigned int v15 = v4[60];
  }
  int v17 = (*(unsigned int *)&has >> 2) & 1;
  if (v17 != ((v15 >> 2) & 1)) {
    goto LABEL_31;
  }
  if (v17)
  {
    unsigned int maxNumAllowedContinuousZeros = self->_maxNumAllowedContinuousZeros;
    if (maxNumAllowedContinuousZeros != [v4 maxNumAllowedContinuousZeros]) {
      goto LABEL_31;
    }
    $057181A5B918859FBE6917C2319BC98B has = self->_has;
    unsigned int v15 = v4[60];
  }
  int v19 = (*(unsigned int *)&has >> 3) & 1;
  if (v19 != ((v15 >> 3) & 1)) {
    goto LABEL_31;
  }
  if (v19)
  {
    int isMaxNumContinuousZerosOverThreshold = self->_isMaxNumContinuousZerosOverThreshold;
    if (isMaxNumContinuousZerosOverThreshold != [v4 isMaxNumContinuousZerosOverThreshold]) {
      goto LABEL_31;
    }
  }
  uint64_t v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self vtAssetConfigVersion];
  uint64_t v7 = [v4 vtAssetConfigVersion];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_30;
  }
  uint64_t v21 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self vtAssetConfigVersion];
  if (v21)
  {
    v22 = (void *)v21;
    v23 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self vtAssetConfigVersion];
    v24 = [v4 vtAssetConfigVersion];
    int v25 = [v23 isEqual:v24];

    if (!v25) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  uint64_t v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self locale];
  uint64_t v7 = [v4 locale];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v26 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self locale];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self locale];
    v29 = [v4 locale];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int v33 = (*(unsigned char *)&self->_has >> 4) & 1;
  if (v33 == ((v4[60] >> 4) & 1))
  {
    if (!v33 || (int stageStatus = self->_stageStatus, stageStatus == [v4 stageStatus]))
    {
      BOOL v31 = 1;
      goto LABEL_32;
    }
  }
LABEL_31:
  BOOL v31 = 0;
LABEL_32:

  return v31;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  NSUInteger v4 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self phraseId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
  uint64_t v6 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self vtAssetConfigVersion];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompleted *)self locale];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRISETUPSchemaSIRISETUPPHSEnrollmentDigitalZeroDetectionCompletedReadFrom(self, (uint64_t)a3);
}

- (void)deleteStageStatus
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasStageStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStageStatus
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setStageStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int stageStatus = a3;
}

- (void)deleteLocale
{
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (void)deleteVtAssetConfigVersion
{
}

- (BOOL)hasVtAssetConfigVersion
{
  return self->_vtAssetConfigVersion != 0;
}

- (void)deleteIsMaxNumContinuousZerosOverThreshold
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsMaxNumContinuousZerosOverThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsMaxNumContinuousZerosOverThreshold
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsMaxNumContinuousZerosOverThreshold:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isMaxNumContinuousZerosOverThreshold = a3;
}

- (void)deleteMaxNumAllowedContinuousZeros
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasMaxNumAllowedContinuousZeros:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMaxNumAllowedContinuousZeros
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMaxNumAllowedContinuousZeros:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int maxNumAllowedContinuousZeros = a3;
}

- (void)deleteMaxNumContinuousZeros
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMaxNumContinuousZeros:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxNumContinuousZeros
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMaxNumContinuousZeros:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unsigned int maxNumContinuousZeros = a3;
}

- (void)deletePhraseId
{
}

- (BOOL)hasPhraseId
{
  return self->_phraseId != 0;
}

- (void)deletePageNumber
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasPageNumber:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPageNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPageNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int pageNumber = a3;
}

@end