@interface INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals
- (BOOL)hasDisambiguationAppsOrder;
- (BOOL)hasDisambiguationReasons;
- (BOOL)hasModelVersion;
- (BOOL)hasNumDisambiguationApps;
- (BOOL)hasTrialDeploymentId;
- (BOOL)hasTrialTreatmentId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (SISchemaUUID)trialTreatmentId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)disambiguationAppsOrder;
- (int)disambiguationReasons;
- (int)numDisambiguationApps;
- (int64_t)modelVersion;
- (int64_t)trialDeploymentId;
- (unint64_t)hash;
- (void)deleteDisambiguationAppsOrder;
- (void)deleteDisambiguationReasons;
- (void)deleteModelVersion;
- (void)deleteNumDisambiguationApps;
- (void)deleteTrialDeploymentId;
- (void)deleteTrialTreatmentId;
- (void)setDisambiguationAppsOrder:(int)a3;
- (void)setDisambiguationReasons:(int)a3;
- (void)setHasDisambiguationAppsOrder:(BOOL)a3;
- (void)setHasDisambiguationReasons:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasNumDisambiguationApps:(BOOL)a3;
- (void)setHasTrialDeploymentId:(BOOL)a3;
- (void)setHasTrialTreatmentId:(BOOL)a3;
- (void)setModelVersion:(int64_t)a3;
- (void)setNumDisambiguationApps:(int)a3;
- (void)setTrialDeploymentId:(int64_t)a3;
- (void)setTrialTreatmentId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *)self trialTreatmentId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *)self deleteTrialTreatmentId];
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

- (void)setHasTrialTreatmentId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setTrialTreatmentId:(id)a3
{
}

- (SISchemaUUID)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (int64_t)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (int)numDisambiguationApps
{
  return self->_numDisambiguationApps;
}

- (int64_t)modelVersion
{
  return self->_modelVersion;
}

- (int)disambiguationReasons
{
  return self->_disambiguationReasons;
}

- (int)disambiguationAppsOrder
{
  return self->_disambiguationAppsOrder;
}

- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals;
  v5 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"disambiguationAppsOrder"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setDisambiguationAppsOrder:](v5, "setDisambiguationAppsOrder:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"disambiguationReasons"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setDisambiguationReasons:](v5, "setDisambiguationReasons:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setModelVersion:](v5, "setModelVersion:", [v8 longLongValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"numDisambiguationApps"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setNumDisambiguationApps:](v5, "setNumDisambiguationApps:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"trialDeploymentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals setTrialDeploymentId:](v5, "setTrialDeploymentId:", [v10 longLongValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"trialTreatmentId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[SISchemaUUID alloc] initWithDictionary:v11];
      [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *)v5 setTrialTreatmentId:v12];
    }
    v13 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *)self dictionaryRepresentation];
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
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals disambiguationAppsOrder](self, "disambiguationAppsOrder"));
    [v3 setObject:v8 forKeyedSubscript:@"disambiguationAppsOrder"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_super v9 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals disambiguationReasons](self, "disambiguationReasons"));
  [v3 setObject:v9 forKeyedSubscript:@"disambiguationReasons"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals modelVersion](self, "modelVersion"));
  [v3 setObject:v10 forKeyedSubscript:@"modelVersion"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals numDisambiguationApps](self, "numDisambiguationApps"));
  [v3 setObject:v11 forKeyedSubscript:@"numDisambiguationApps"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals trialDeploymentId](self, "trialDeploymentId"));
    [v3 setObject:v5 forKeyedSubscript:@"trialDeploymentId"];
  }
LABEL_7:
  if (self->_trialTreatmentId)
  {
    v6 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *)self trialTreatmentId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"trialTreatmentId"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"trialTreatmentId"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_disambiguationAppsOrder;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_disambiguationReasons;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_modelVersion;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ [(SISchemaUUID *)self->_trialTreatmentId hash];
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_numDisambiguationApps;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_trialDeploymentId;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ [(SISchemaUUID *)self->_trialTreatmentId hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  $3816F60C6D45B941EFFABFC1855A65ED has = self->_has;
  unsigned int v6 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&has)
  {
    int disambiguationAppsOrder = self->_disambiguationAppsOrder;
    if (disambiguationAppsOrder != [v4 disambiguationAppsOrder]) {
      goto LABEL_26;
    }
    $3816F60C6D45B941EFFABFC1855A65ED has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int disambiguationReasons = self->_disambiguationReasons;
      if (disambiguationReasons != [v4 disambiguationReasons]) {
        goto LABEL_26;
      }
      $3816F60C6D45B941EFFABFC1855A65ED has = self->_has;
      unsigned int v6 = v4[48];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        int64_t modelVersion = self->_modelVersion;
        if (modelVersion != [v4 modelVersion]) {
          goto LABEL_26;
        }
        $3816F60C6D45B941EFFABFC1855A65ED has = self->_has;
        unsigned int v6 = v4[48];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (v12)
        {
          int numDisambiguationApps = self->_numDisambiguationApps;
          if (numDisambiguationApps != [v4 numDisambiguationApps]) {
            goto LABEL_26;
          }
          $3816F60C6D45B941EFFABFC1855A65ED has = self->_has;
          unsigned int v6 = v4[48];
        }
        int v14 = (*(unsigned int *)&has >> 4) & 1;
        if (v14 == ((v6 >> 4) & 1))
        {
          if (!v14
            || (int64_t trialDeploymentId = self->_trialDeploymentId, trialDeploymentId == [v4 trialDeploymentId]))
          {
            v16 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *)self trialTreatmentId];
            v17 = [v4 trialTreatmentId];
            v18 = v17;
            if ((v16 == 0) != (v17 != 0))
            {
              uint64_t v19 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *)self trialTreatmentId];
              if (!v19)
              {

LABEL_29:
                BOOL v24 = 1;
                goto LABEL_27;
              }
              v20 = (void *)v19;
              v21 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *)self trialTreatmentId];
              v22 = [v4 trialTreatmentId];
              char v23 = [v21 isEqual:v22];

              if (v23) {
                goto LABEL_29;
              }
            }
            else
            {
            }
          }
        }
      }
    }
  }
LABEL_26:
  BOOL v24 = 0;
LABEL_27:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt64Field();
LABEL_7:
  uint64_t v5 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *)self trialTreatmentId];

  unsigned int v6 = v8;
  if (v5)
  {
    uint64_t v7 = [(INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignals *)self trialTreatmentId];
    PBDataWriterWriteSubmessage();

    unsigned int v6 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEVideoSmartAppSelectionDisambiguationIndependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteTrialTreatmentId
{
}

- (BOOL)hasTrialTreatmentId
{
  return self->_trialTreatmentId != 0;
}

- (void)deleteTrialDeploymentId
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasTrialDeploymentId:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTrialDeploymentId
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTrialDeploymentId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int64_t trialDeploymentId = a3;
}

- (void)deleteNumDisambiguationApps
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasNumDisambiguationApps:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumDisambiguationApps
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumDisambiguationApps:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int numDisambiguationApps = a3;
}

- (void)deleteModelVersion
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasModelVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModelVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setModelVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int64_t modelVersion = a3;
}

- (void)deleteDisambiguationReasons
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDisambiguationReasons:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDisambiguationReasons
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDisambiguationReasons:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int disambiguationReasons = a3;
}

- (void)deleteDisambiguationAppsOrder
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasDisambiguationAppsOrder:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisambiguationAppsOrder
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDisambiguationAppsOrder:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int disambiguationAppsOrder = a3;
}

@end