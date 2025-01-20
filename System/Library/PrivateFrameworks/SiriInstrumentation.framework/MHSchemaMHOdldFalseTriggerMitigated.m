@interface MHSchemaMHOdldFalseTriggerMitigated
- (BOOL)hasAnchorRequestId;
- (BOOL)hasAnchorSocialScore;
- (BOOL)hasConversationalOdldScore;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorMessage;
- (BOOL)hasModelVersion;
- (BOOL)hasOdldScore;
- (BOOL)hasOdldScoreThreshold;
- (BOOL)hasPreviousRequestId;
- (BOOL)hasSocialScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHOdldFalseTriggerMitigated)initWithDictionary:(id)a3;
- (MHSchemaMHOdldFalseTriggerMitigated)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)errorMessage;
- (NSString)modelVersion;
- (SISchemaUUID)anchorRequestId;
- (SISchemaUUID)previousRequestId;
- (float)anchorSocialScore;
- (float)conversationalOdldScore;
- (float)odldScore;
- (float)odldScoreThreshold;
- (float)socialScore;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)errorCode;
- (void)deleteAnchorRequestId;
- (void)deleteAnchorSocialScore;
- (void)deleteConversationalOdldScore;
- (void)deleteErrorCode;
- (void)deleteErrorMessage;
- (void)deleteModelVersion;
- (void)deleteOdldScore;
- (void)deleteOdldScoreThreshold;
- (void)deletePreviousRequestId;
- (void)deleteSocialScore;
- (void)setAnchorRequestId:(id)a3;
- (void)setAnchorSocialScore:(float)a3;
- (void)setConversationalOdldScore:(float)a3;
- (void)setErrorCode:(unsigned int)a3;
- (void)setErrorMessage:(id)a3;
- (void)setHasAnchorRequestId:(BOOL)a3;
- (void)setHasAnchorSocialScore:(BOOL)a3;
- (void)setHasConversationalOdldScore:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasErrorMessage:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasOdldScore:(BOOL)a3;
- (void)setHasOdldScoreThreshold:(BOOL)a3;
- (void)setHasPreviousRequestId:(BOOL)a3;
- (void)setHasSocialScore:(BOOL)a3;
- (void)setModelVersion:(id)a3;
- (void)setOdldScore:(float)a3;
- (void)setOdldScoreThreshold:(float)a3;
- (void)setPreviousRequestId:(id)a3;
- (void)setSocialScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHOdldFalseTriggerMitigated

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHOdldFalseTriggerMitigated;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(MHSchemaMHOdldFalseTriggerMitigated *)self anchorRequestId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(MHSchemaMHOdldFalseTriggerMitigated *)self deleteAnchorRequestId];
  }
  v9 = [(MHSchemaMHOdldFalseTriggerMitigated *)self previousRequestId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(MHSchemaMHOdldFalseTriggerMitigated *)self deletePreviousRequestId];
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
  objc_storeStrong((id *)&self->_previousRequestId, 0);
  objc_storeStrong((id *)&self->_anchorRequestId, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
}

- (void)setHasPreviousRequestId:(BOOL)a3
{
  self->_hasModelVersion = a3;
}

- (void)setHasAnchorRequestId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasErrorMessage:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)conversationalOdldScore
{
  return self->_conversationalOdldScore;
}

- (float)socialScore
{
  return self->_socialScore;
}

- (float)anchorSocialScore
{
  return self->_anchorSocialScore;
}

- (void)setPreviousRequestId:(id)a3
{
}

- (SISchemaUUID)previousRequestId
{
  return self->_previousRequestId;
}

- (void)setAnchorRequestId:(id)a3
{
}

- (SISchemaUUID)anchorRequestId
{
  return self->_anchorRequestId;
}

- (unsigned)errorCode
{
  return self->_errorCode;
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (float)odldScoreThreshold
{
  return self->_odldScoreThreshold;
}

- (float)odldScore
{
  return self->_odldScore;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (MHSchemaMHOdldFalseTriggerMitigated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MHSchemaMHOdldFalseTriggerMitigated;
  v5 = [(MHSchemaMHOdldFalseTriggerMitigated *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(MHSchemaMHOdldFalseTriggerMitigated *)v5 setModelVersion:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"odldScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[MHSchemaMHOdldFalseTriggerMitigated setOdldScore:](v5, "setOdldScore:");
    }
    v23 = v8;
    v9 = [v4 objectForKeyedSubscript:@"odldScoreThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[MHSchemaMHOdldFalseTriggerMitigated setOdldScoreThreshold:](v5, "setOdldScoreThreshold:");
    }
    v22 = v9;
    v10 = [v4 objectForKeyedSubscript:@"errorMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(MHSchemaMHOdldFalseTriggerMitigated *)v5 setErrorMessage:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"errorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHOdldFalseTriggerMitigated setErrorCode:](v5, "setErrorCode:", [v12 unsignedIntValue]);
    }
    objc_super v13 = [v4 objectForKeyedSubscript:@"anchorRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [[SISchemaUUID alloc] initWithDictionary:v13];
      [(MHSchemaMHOdldFalseTriggerMitigated *)v5 setAnchorRequestId:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"previousRequestId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[SISchemaUUID alloc] initWithDictionary:v15];
      [(MHSchemaMHOdldFalseTriggerMitigated *)v5 setPreviousRequestId:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"anchorSocialScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v17 floatValue];
      -[MHSchemaMHOdldFalseTriggerMitigated setAnchorSocialScore:](v5, "setAnchorSocialScore:");
    }
    v18 = [v4 objectForKeyedSubscript:@"socialScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 floatValue];
      -[MHSchemaMHOdldFalseTriggerMitigated setSocialScore:](v5, "setSocialScore:");
    }
    v19 = [v4 objectForKeyedSubscript:@"conversationalOdldScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v19 floatValue];
      -[MHSchemaMHOdldFalseTriggerMitigated setConversationalOdldScore:](v5, "setConversationalOdldScore:");
    }
    v20 = v5;
  }
  return v5;
}

- (MHSchemaMHOdldFalseTriggerMitigated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHOdldFalseTriggerMitigated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHOdldFalseTriggerMitigated *)self dictionaryRepresentation];
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
  if (self->_anchorRequestId)
  {
    id v4 = [(MHSchemaMHOdldFalseTriggerMitigated *)self anchorRequestId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"anchorRequestId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"anchorRequestId"];
    }
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v20 = NSNumber;
    [(MHSchemaMHOdldFalseTriggerMitigated *)self anchorSocialScore];
    v21 = objc_msgSend(v20, "numberWithFloat:");
    [v3 setObject:v21 forKeyedSubscript:@"anchorSocialScore"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_8:
      if ((has & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_8;
  }
  v22 = NSNumber;
  [(MHSchemaMHOdldFalseTriggerMitigated *)self conversationalOdldScore];
  v23 = objc_msgSend(v22, "numberWithFloat:");
  [v3 setObject:v23 forKeyedSubscript:@"conversationalOdldScore"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MHSchemaMHOdldFalseTriggerMitigated errorCode](self, "errorCode"));
    [v3 setObject:v8 forKeyedSubscript:@"errorCode"];
  }
LABEL_10:
  if (self->_errorMessage)
  {
    v9 = [(MHSchemaMHOdldFalseTriggerMitigated *)self errorMessage];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"errorMessage"];
  }
  if (self->_modelVersion)
  {
    int v11 = [(MHSchemaMHOdldFalseTriggerMitigated *)self modelVersion];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"modelVersion"];
  }
  char v13 = (char)self->_has;
  if (v13)
  {
    v14 = NSNumber;
    [(MHSchemaMHOdldFalseTriggerMitigated *)self odldScore];
    v15 = objc_msgSend(v14, "numberWithFloat:");
    [v3 setObject:v15 forKeyedSubscript:@"odldScore"];

    char v13 = (char)self->_has;
  }
  if ((v13 & 2) != 0)
  {
    v16 = NSNumber;
    [(MHSchemaMHOdldFalseTriggerMitigated *)self odldScoreThreshold];
    v17 = objc_msgSend(v16, "numberWithFloat:");
    [v3 setObject:v17 forKeyedSubscript:@"odldScoreThreshold"];
  }
  if (self->_previousRequestId)
  {
    v18 = [(MHSchemaMHOdldFalseTriggerMitigated *)self previousRequestId];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"previousRequestId"];
    }
    else
    {
      objc_super v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"previousRequestId"];
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v25 = NSNumber;
    [(MHSchemaMHOdldFalseTriggerMitigated *)self socialScore];
    v26 = objc_msgSend(v25, "numberWithFloat:");
    [v3 setObject:v26 forKeyedSubscript:@"socialScore"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v37 = [(NSString *)self->_modelVersion hash];
  char has = (char)self->_has;
  if (has)
  {
    float odldScore = self->_odldScore;
    double v6 = odldScore;
    if (odldScore < 0.0) {
      double v6 = -odldScore;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v35 = v4;
  if ((has & 2) != 0)
  {
    float odldScoreThreshold = self->_odldScoreThreshold;
    double v11 = odldScoreThreshold;
    if (odldScoreThreshold < 0.0) {
      double v11 = -odldScoreThreshold;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_errorMessage hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v15 = 0;
  }
  unint64_t v16 = [(SISchemaUUID *)self->_anchorRequestId hash];
  unint64_t v17 = [(SISchemaUUID *)self->_previousRequestId hash];
  char v18 = (char)self->_has;
  if ((v18 & 8) != 0)
  {
    float anchorSocialScore = self->_anchorSocialScore;
    double v21 = anchorSocialScore;
    if (anchorSocialScore < 0.0) {
      double v21 = -anchorSocialScore;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((v18 & 0x10) != 0)
  {
    float socialScore = self->_socialScore;
    double v26 = socialScore;
    if (socialScore < 0.0) {
      double v26 = -socialScore;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((v18 & 0x20) != 0)
  {
    float conversationalOdldScore = self->_conversationalOdldScore;
    double v31 = conversationalOdldScore;
    if (conversationalOdldScore < 0.0) {
      double v31 = -conversationalOdldScore;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  return v36 ^ v37 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v19 ^ v24 ^ v29;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  v5 = [(MHSchemaMHOdldFalseTriggerMitigated *)self modelVersion];
  double v6 = [v4 modelVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(MHSchemaMHOdldFalseTriggerMitigated *)self modelVersion];
  if (v7)
  {
    double v8 = (void *)v7;
    unint64_t v9 = [(MHSchemaMHOdldFalseTriggerMitigated *)self modelVersion];
    v10 = [v4 modelVersion];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  $54A6DA40AD7C0C64862EE2036E013312 has = self->_has;
  unsigned int v13 = v4[68];
  if ((*(unsigned char *)&has & 1) != (v13 & 1)) {
    goto LABEL_32;
  }
  if (*(unsigned char *)&has)
  {
    float odldScore = self->_odldScore;
    [v4 odldScore];
    if (odldScore != v15) {
      goto LABEL_32;
    }
    $54A6DA40AD7C0C64862EE2036E013312 has = self->_has;
    unsigned int v13 = v4[68];
  }
  int v16 = (*(unsigned int *)&has >> 1) & 1;
  if (v16 != ((v13 >> 1) & 1)) {
    goto LABEL_32;
  }
  if (v16)
  {
    float odldScoreThreshold = self->_odldScoreThreshold;
    [v4 odldScoreThreshold];
    if (odldScoreThreshold != v18) {
      goto LABEL_32;
    }
  }
  v5 = [(MHSchemaMHOdldFalseTriggerMitigated *)self errorMessage];
  double v6 = [v4 errorMessage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v19 = [(MHSchemaMHOdldFalseTriggerMitigated *)self errorMessage];
  if (v19)
  {
    v20 = (void *)v19;
    double v21 = [(MHSchemaMHOdldFalseTriggerMitigated *)self errorMessage];
    long double v22 = [v4 errorMessage];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  int v24 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v24 != ((v4[68] >> 2) & 1)) {
    goto LABEL_32;
  }
  if (v24)
  {
    unsigned int errorCode = self->_errorCode;
    if (errorCode != [v4 errorCode]) {
      goto LABEL_32;
    }
  }
  v5 = [(MHSchemaMHOdldFalseTriggerMitigated *)self anchorRequestId];
  double v6 = [v4 anchorRequestId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v26 = [(MHSchemaMHOdldFalseTriggerMitigated *)self anchorRequestId];
  if (v26)
  {
    long double v27 = (void *)v26;
    double v28 = [(MHSchemaMHOdldFalseTriggerMitigated *)self anchorRequestId];
    unint64_t v29 = [v4 anchorRequestId];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  v5 = [(MHSchemaMHOdldFalseTriggerMitigated *)self previousRequestId];
  double v6 = [v4 previousRequestId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v31 = [(MHSchemaMHOdldFalseTriggerMitigated *)self previousRequestId];
  if (v31)
  {
    long double v32 = (void *)v31;
    double v33 = [(MHSchemaMHOdldFalseTriggerMitigated *)self previousRequestId];
    v34 = [v4 previousRequestId];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  $54A6DA40AD7C0C64862EE2036E013312 v38 = self->_has;
  int v39 = (*(unsigned int *)&v38 >> 3) & 1;
  unsigned int v40 = v4[68];
  if (v39 == ((v40 >> 3) & 1))
  {
    if (v39)
    {
      float anchorSocialScore = self->_anchorSocialScore;
      [v4 anchorSocialScore];
      if (anchorSocialScore != v42) {
        goto LABEL_32;
      }
      $54A6DA40AD7C0C64862EE2036E013312 v38 = self->_has;
      unsigned int v40 = v4[68];
    }
    int v43 = (*(unsigned int *)&v38 >> 4) & 1;
    if (v43 == ((v40 >> 4) & 1))
    {
      if (v43)
      {
        float socialScore = self->_socialScore;
        [v4 socialScore];
        if (socialScore != v45) {
          goto LABEL_32;
        }
        $54A6DA40AD7C0C64862EE2036E013312 v38 = self->_has;
        unsigned int v40 = v4[68];
      }
      int v46 = (*(unsigned int *)&v38 >> 5) & 1;
      if (v46 == ((v40 >> 5) & 1))
      {
        if (!v46
          || (float conversationalOdldScore = self->_conversationalOdldScore,
              [v4 conversationalOdldScore],
              conversationalOdldScore == v48))
        {
          BOOL v36 = 1;
          goto LABEL_33;
        }
      }
    }
  }
LABEL_32:
  BOOL v36 = 0;
LABEL_33:

  return v36;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  unint64_t v4 = [(MHSchemaMHOdldFalseTriggerMitigated *)self modelVersion];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
  double v6 = [(MHSchemaMHOdldFalseTriggerMitigated *)self errorMessage];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  uint64_t v7 = [(MHSchemaMHOdldFalseTriggerMitigated *)self anchorRequestId];

  if (v7)
  {
    double v8 = [(MHSchemaMHOdldFalseTriggerMitigated *)self anchorRequestId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v9 = [(MHSchemaMHOdldFalseTriggerMitigated *)self previousRequestId];

  if (v9)
  {
    v10 = [(MHSchemaMHOdldFalseTriggerMitigated *)self previousRequestId];
    PBDataWriterWriteSubmessage();
  }
  char v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    char v11 = (char)self->_has;
  }
  long double v12 = v13;
  if ((v11 & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    long double v12 = v13;
    char v11 = (char)self->_has;
  }
  if ((v11 & 0x20) != 0)
  {
    PBDataWriterWriteFloatField();
    long double v12 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHOdldFalseTriggerMitigatedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteConversationalOdldScore
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasConversationalOdldScore:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasConversationalOdldScore
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setConversationalOdldScore:(float)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_float conversationalOdldScore = a3;
}

- (void)deleteSocialScore
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasSocialScore:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSocialScore
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSocialScore:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_float socialScore = a3;
}

- (void)deleteAnchorSocialScore
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasAnchorSocialScore:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAnchorSocialScore
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAnchorSocialScore:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_float anchorSocialScore = a3;
}

- (void)deletePreviousRequestId
{
}

- (BOOL)hasPreviousRequestId
{
  return self->_previousRequestId != 0;
}

- (void)deleteAnchorRequestId
{
}

- (BOOL)hasAnchorRequestId
{
  return self->_anchorRequestId != 0;
}

- (void)deleteErrorCode
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int errorCode = a3;
}

- (void)deleteErrorMessage
{
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (void)deleteOdldScoreThreshold
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasOdldScoreThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOdldScoreThreshold
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setOdldScoreThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float odldScoreThreshold = a3;
}

- (void)deleteOdldScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasOdldScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOdldScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setOdldScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float odldScore = a3;
}

- (void)deleteModelVersion
{
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

@end