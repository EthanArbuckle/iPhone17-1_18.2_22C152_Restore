@interface INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals
- (BOOL)hasAppAffinityScoreForPhoneCall;
- (BOOL)hasAppAffinityScoreForPhoneCallReceived;
- (BOOL)hasAppAffinityScoreForPhoneCallUsingSiri;
- (BOOL)hasAppFreqForPhoneCall;
- (BOOL)hasAppFreqForPhoneCallForCountryCode;
- (BOOL)hasAppFreqForPhoneCallUsingSiri;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)appAffinityScoreForPhoneCall;
- (float)appAffinityScoreForPhoneCallReceived;
- (float)appAffinityScoreForPhoneCallUsingSiri;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appFreqForPhoneCall;
- (int)appFreqForPhoneCallForCountryCode;
- (int)appFreqForPhoneCallUsingSiri;
- (unint64_t)hash;
- (void)deleteAppAffinityScoreForPhoneCall;
- (void)deleteAppAffinityScoreForPhoneCallReceived;
- (void)deleteAppAffinityScoreForPhoneCallUsingSiri;
- (void)deleteAppFreqForPhoneCall;
- (void)deleteAppFreqForPhoneCallForCountryCode;
- (void)deleteAppFreqForPhoneCallUsingSiri;
- (void)setAppAffinityScoreForPhoneCall:(float)a3;
- (void)setAppAffinityScoreForPhoneCallReceived:(float)a3;
- (void)setAppAffinityScoreForPhoneCallUsingSiri:(float)a3;
- (void)setAppFreqForPhoneCall:(int)a3;
- (void)setAppFreqForPhoneCallForCountryCode:(int)a3;
- (void)setAppFreqForPhoneCallUsingSiri:(int)a3;
- (void)setHasAppAffinityScoreForPhoneCall:(BOOL)a3;
- (void)setHasAppAffinityScoreForPhoneCallReceived:(BOOL)a3;
- (void)setHasAppAffinityScoreForPhoneCallUsingSiri:(BOOL)a3;
- (void)setHasAppFreqForPhoneCall:(BOOL)a3;
- (void)setHasAppFreqForPhoneCallForCountryCode:(BOOL)a3;
- (void)setHasAppFreqForPhoneCallUsingSiri:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)appFreqForPhoneCallForCountryCode
{
  return self->_appFreqForPhoneCallForCountryCode;
}

- (int)appFreqForPhoneCallUsingSiri
{
  return self->_appFreqForPhoneCallUsingSiri;
}

- (int)appFreqForPhoneCall
{
  return self->_appFreqForPhoneCall;
}

- (float)appAffinityScoreForPhoneCallReceived
{
  return self->_appAffinityScoreForPhoneCallReceived;
}

- (float)appAffinityScoreForPhoneCallUsingSiri
{
  return self->_appAffinityScoreForPhoneCallUsingSiri;
}

- (float)appAffinityScoreForPhoneCall
{
  return self->_appAffinityScoreForPhoneCall;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals;
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appAffinityScoreForPhoneCall"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppAffinityScoreForPhoneCall:](v5, "setAppAffinityScoreForPhoneCall:");
    }
    v7 = [v4 objectForKeyedSubscript:@"appAffinityScoreForPhoneCallUsingSiri"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppAffinityScoreForPhoneCallUsingSiri:](v5, "setAppAffinityScoreForPhoneCallUsingSiri:");
    }
    v8 = [v4 objectForKeyedSubscript:@"appAffinityScoreForPhoneCallReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppAffinityScoreForPhoneCallReceived:](v5, "setAppAffinityScoreForPhoneCallReceived:");
    }
    v9 = [v4 objectForKeyedSubscript:@"appFreqForPhoneCall"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppFreqForPhoneCall:](v5, "setAppFreqForPhoneCall:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"appFreqForPhoneCallUsingSiri"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppFreqForPhoneCallUsingSiri:](v5, "setAppFreqForPhoneCallUsingSiri:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"appFreqForPhoneCallForCountryCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals setAppFreqForPhoneCallForCountryCode:](v5, "setAppFreqForPhoneCallForCountryCode:", [v11 intValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals *)self dictionaryRepresentation];
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
    uint64_t v7 = NSNumber;
    [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals *)self appAffinityScoreForPhoneCall];
    v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"appAffinityScoreForPhoneCall"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v9 = NSNumber;
  [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals *)self appAffinityScoreForPhoneCallReceived];
  v10 = objc_msgSend(v9, "numberWithFloat:");
  [v3 setObject:v10 forKeyedSubscript:@"appAffinityScoreForPhoneCallReceived"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v11 = NSNumber;
  [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals *)self appAffinityScoreForPhoneCallUsingSiri];
  v12 = objc_msgSend(v11, "numberWithFloat:");
  [v3 setObject:v12 forKeyedSubscript:@"appAffinityScoreForPhoneCallUsingSiri"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v13 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals appFreqForPhoneCall](self, "appFreqForPhoneCall"));
  [v3 setObject:v13 forKeyedSubscript:@"appFreqForPhoneCall"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  objc_super v14 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals appFreqForPhoneCallForCountryCode](self, "appFreqForPhoneCallForCountryCode"));
  [v3 setObject:v14 forKeyedSubscript:@"appFreqForPhoneCallForCountryCode"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignals appFreqForPhoneCallUsingSiri](self, "appFreqForPhoneCallUsingSiri"));
    [v3 setObject:v5 forKeyedSubscript:@"appFreqForPhoneCallUsingSiri"];
  }
LABEL_8:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    float appAffinityScoreForPhoneCall = self->_appAffinityScoreForPhoneCall;
    double v6 = appAffinityScoreForPhoneCall;
    if (appAffinityScoreForPhoneCall < 0.0) {
      double v6 = -appAffinityScoreForPhoneCall;
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
  if ((has & 2) != 0)
  {
    float appAffinityScoreForPhoneCallUsingSiri = self->_appAffinityScoreForPhoneCallUsingSiri;
    double v11 = appAffinityScoreForPhoneCallUsingSiri;
    if (appAffinityScoreForPhoneCallUsingSiri < 0.0) {
      double v11 = -appAffinityScoreForPhoneCallUsingSiri;
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
  if ((has & 4) != 0)
  {
    float appAffinityScoreForPhoneCallReceived = self->_appAffinityScoreForPhoneCallReceived;
    double v16 = appAffinityScoreForPhoneCallReceived;
    if (appAffinityScoreForPhoneCallReceived < 0.0) {
      double v16 = -appAffinityScoreForPhoneCallReceived;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 8) == 0)
  {
    uint64_t v19 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_27;
    }
LABEL_30:
    uint64_t v20 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_28;
    }
LABEL_31:
    uint64_t v21 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21;
  }
  uint64_t v19 = 2654435761 * self->_appFreqForPhoneCall;
  if ((has & 0x10) == 0) {
    goto LABEL_30;
  }
LABEL_27:
  uint64_t v20 = 2654435761 * self->_appFreqForPhoneCallUsingSiri;
  if ((has & 0x20) == 0) {
    goto LABEL_31;
  }
LABEL_28:
  uint64_t v21 = 2654435761 * self->_appFreqForPhoneCallForCountryCode;
  return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  $8AEBDE0173A10569ADE4F41E3EDCEE00 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&has)
  {
    float appAffinityScoreForPhoneCall = self->_appAffinityScoreForPhoneCall;
    [v4 appAffinityScoreForPhoneCall];
    if (appAffinityScoreForPhoneCall != v8) {
      goto LABEL_26;
    }
    $8AEBDE0173A10569ADE4F41E3EDCEE00 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_26;
  }
  if (v9)
  {
    float appAffinityScoreForPhoneCallUsingSiri = self->_appAffinityScoreForPhoneCallUsingSiri;
    [v4 appAffinityScoreForPhoneCallUsingSiri];
    if (appAffinityScoreForPhoneCallUsingSiri != v11) {
      goto LABEL_26;
    }
    $8AEBDE0173A10569ADE4F41E3EDCEE00 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v12 = (*(unsigned int *)&has >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1)) {
    goto LABEL_26;
  }
  if (v12)
  {
    float appAffinityScoreForPhoneCallReceived = self->_appAffinityScoreForPhoneCallReceived;
    [v4 appAffinityScoreForPhoneCallReceived];
    if (appAffinityScoreForPhoneCallReceived != v14) {
      goto LABEL_26;
    }
    $8AEBDE0173A10569ADE4F41E3EDCEE00 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v15 = (*(unsigned int *)&has >> 3) & 1;
  if (v15 != ((v6 >> 3) & 1)) {
    goto LABEL_26;
  }
  if (v15)
  {
    int appFreqForPhoneCall = self->_appFreqForPhoneCall;
    if (appFreqForPhoneCall != [v4 appFreqForPhoneCall]) {
      goto LABEL_26;
    }
    $8AEBDE0173A10569ADE4F41E3EDCEE00 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v17 = (*(unsigned int *)&has >> 4) & 1;
  if (v17 != ((v6 >> 4) & 1)) {
    goto LABEL_26;
  }
  if (v17)
  {
    int appFreqForPhoneCallUsingSiri = self->_appFreqForPhoneCallUsingSiri;
    if (appFreqForPhoneCallUsingSiri == [v4 appFreqForPhoneCallUsingSiri])
    {
      $8AEBDE0173A10569ADE4F41E3EDCEE00 has = self->_has;
      unsigned int v6 = v4[32];
      goto LABEL_22;
    }
LABEL_26:
    BOOL v21 = 0;
    goto LABEL_27;
  }
LABEL_22:
  int v19 = (*(unsigned int *)&has >> 5) & 1;
  if (v19 != ((v6 >> 5) & 1)) {
    goto LABEL_26;
  }
  if (v19)
  {
    int appFreqForPhoneCallForCountryCode = self->_appFreqForPhoneCallForCountryCode;
    if (appFreqForPhoneCallForCountryCode != [v4 appFreqForPhoneCallForCountryCode]) {
      goto LABEL_26;
    }
  }
  BOOL v21 = 1;
LABEL_27:

  return v21;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentPhoneCallSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteAppFreqForPhoneCallForCountryCode
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasAppFreqForPhoneCallForCountryCode:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAppFreqForPhoneCallForCountryCode
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAppFreqForPhoneCallForCountryCode:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int appFreqForPhoneCallForCountryCode = a3;
}

- (void)deleteAppFreqForPhoneCallUsingSiri
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasAppFreqForPhoneCallUsingSiri:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAppFreqForPhoneCallUsingSiri
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAppFreqForPhoneCallUsingSiri:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int appFreqForPhoneCallUsingSiri = a3;
}

- (void)deleteAppFreqForPhoneCall
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasAppFreqForPhoneCall:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAppFreqForPhoneCall
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAppFreqForPhoneCall:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int appFreqForPhoneCall = a3;
}

- (void)deleteAppAffinityScoreForPhoneCallReceived
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAppAffinityScoreForPhoneCallReceived:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAppAffinityScoreForPhoneCallReceived
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAppAffinityScoreForPhoneCallReceived:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float appAffinityScoreForPhoneCallReceived = a3;
}

- (void)deleteAppAffinityScoreForPhoneCallUsingSiri
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAppAffinityScoreForPhoneCallUsingSiri:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAppAffinityScoreForPhoneCallUsingSiri
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAppAffinityScoreForPhoneCallUsingSiri:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float appAffinityScoreForPhoneCallUsingSiri = a3;
}

- (void)deleteAppAffinityScoreForPhoneCall
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAppAffinityScoreForPhoneCall:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppAffinityScoreForPhoneCall
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAppAffinityScoreForPhoneCall:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float appAffinityScoreForPhoneCall = a3;
}

@end