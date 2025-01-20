@interface INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals
- (BOOL)hasAppAffinityScoreForMessages;
- (BOOL)hasAppAffinityScoreForMessagesReceived;
- (BOOL)hasAppAffinityScoreForMessagesUsingSiri;
- (BOOL)hasAppFreqForMessages;
- (BOOL)hasAppFreqForMessagesForCountryCode;
- (BOOL)hasAppFreqForMessagesUsingSiri;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)appAffinityScoreForMessages;
- (float)appAffinityScoreForMessagesReceived;
- (float)appAffinityScoreForMessagesUsingSiri;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appFreqForMessages;
- (int)appFreqForMessagesForCountryCode;
- (int)appFreqForMessagesUsingSiri;
- (unint64_t)hash;
- (void)deleteAppAffinityScoreForMessages;
- (void)deleteAppAffinityScoreForMessagesReceived;
- (void)deleteAppAffinityScoreForMessagesUsingSiri;
- (void)deleteAppFreqForMessages;
- (void)deleteAppFreqForMessagesForCountryCode;
- (void)deleteAppFreqForMessagesUsingSiri;
- (void)setAppAffinityScoreForMessages:(float)a3;
- (void)setAppAffinityScoreForMessagesReceived:(float)a3;
- (void)setAppAffinityScoreForMessagesUsingSiri:(float)a3;
- (void)setAppFreqForMessages:(int)a3;
- (void)setAppFreqForMessagesForCountryCode:(int)a3;
- (void)setAppFreqForMessagesUsingSiri:(int)a3;
- (void)setHasAppAffinityScoreForMessages:(BOOL)a3;
- (void)setHasAppAffinityScoreForMessagesReceived:(BOOL)a3;
- (void)setHasAppAffinityScoreForMessagesUsingSiri:(BOOL)a3;
- (void)setHasAppFreqForMessages:(BOOL)a3;
- (void)setHasAppFreqForMessagesForCountryCode:(BOOL)a3;
- (void)setHasAppFreqForMessagesUsingSiri:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)appFreqForMessagesForCountryCode
{
  return self->_appFreqForMessagesForCountryCode;
}

- (int)appFreqForMessagesUsingSiri
{
  return self->_appFreqForMessagesUsingSiri;
}

- (int)appFreqForMessages
{
  return self->_appFreqForMessages;
}

- (float)appAffinityScoreForMessagesReceived
{
  return self->_appAffinityScoreForMessagesReceived;
}

- (float)appAffinityScoreForMessagesUsingSiri
{
  return self->_appAffinityScoreForMessagesUsingSiri;
}

- (float)appAffinityScoreForMessages
{
  return self->_appAffinityScoreForMessages;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals;
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appAffinityScoreForMessages"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppAffinityScoreForMessages:](v5, "setAppAffinityScoreForMessages:");
    }
    v7 = [v4 objectForKeyedSubscript:@"appAffinityScoreForMessagesUsingSiri"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppAffinityScoreForMessagesUsingSiri:](v5, "setAppAffinityScoreForMessagesUsingSiri:");
    }
    v8 = [v4 objectForKeyedSubscript:@"appAffinityScoreForMessagesReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppAffinityScoreForMessagesReceived:](v5, "setAppAffinityScoreForMessagesReceived:");
    }
    v9 = [v4 objectForKeyedSubscript:@"appFreqForMessages"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppFreqForMessages:](v5, "setAppFreqForMessages:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"appFreqForMessagesUsingSiri"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppFreqForMessagesUsingSiri:](v5, "setAppFreqForMessagesUsingSiri:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"appFreqForMessagesForCountryCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals setAppFreqForMessagesForCountryCode:](v5, "setAppFreqForMessagesForCountryCode:", [v11 intValue]);
    }
    v12 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals *)self dictionaryRepresentation];
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
    [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals *)self appAffinityScoreForMessages];
    v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"appAffinityScoreForMessages"];

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
  [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals *)self appAffinityScoreForMessagesReceived];
  v10 = objc_msgSend(v9, "numberWithFloat:");
  [v3 setObject:v10 forKeyedSubscript:@"appAffinityScoreForMessagesReceived"];

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
  [(INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals *)self appAffinityScoreForMessagesUsingSiri];
  v12 = objc_msgSend(v11, "numberWithFloat:");
  [v3 setObject:v12 forKeyedSubscript:@"appAffinityScoreForMessagesUsingSiri"];

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
  v13 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals appFreqForMessages](self, "appFreqForMessages"));
  [v3 setObject:v13 forKeyedSubscript:@"appFreqForMessages"];

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
  objc_super v14 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals appFreqForMessagesForCountryCode](self, "appFreqForMessagesForCountryCode"));
  [v3 setObject:v14 forKeyedSubscript:@"appFreqForMessagesForCountryCode"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignals appFreqForMessagesUsingSiri](self, "appFreqForMessagesUsingSiri"));
    [v3 setObject:v5 forKeyedSubscript:@"appFreqForMessagesUsingSiri"];
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
    float appAffinityScoreForMessages = self->_appAffinityScoreForMessages;
    double v6 = appAffinityScoreForMessages;
    if (appAffinityScoreForMessages < 0.0) {
      double v6 = -appAffinityScoreForMessages;
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
    float appAffinityScoreForMessagesUsingSiri = self->_appAffinityScoreForMessagesUsingSiri;
    double v11 = appAffinityScoreForMessagesUsingSiri;
    if (appAffinityScoreForMessagesUsingSiri < 0.0) {
      double v11 = -appAffinityScoreForMessagesUsingSiri;
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
    float appAffinityScoreForMessagesReceived = self->_appAffinityScoreForMessagesReceived;
    double v16 = appAffinityScoreForMessagesReceived;
    if (appAffinityScoreForMessagesReceived < 0.0) {
      double v16 = -appAffinityScoreForMessagesReceived;
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
  uint64_t v19 = 2654435761 * self->_appFreqForMessages;
  if ((has & 0x10) == 0) {
    goto LABEL_30;
  }
LABEL_27:
  uint64_t v20 = 2654435761 * self->_appFreqForMessagesUsingSiri;
  if ((has & 0x20) == 0) {
    goto LABEL_31;
  }
LABEL_28:
  uint64_t v21 = 2654435761 * self->_appFreqForMessagesForCountryCode;
  return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  $97BAB581C1C24BB6F04EA563899E340F has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&has)
  {
    float appAffinityScoreForMessages = self->_appAffinityScoreForMessages;
    [v4 appAffinityScoreForMessages];
    if (appAffinityScoreForMessages != v8) {
      goto LABEL_26;
    }
    $97BAB581C1C24BB6F04EA563899E340F has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_26;
  }
  if (v9)
  {
    float appAffinityScoreForMessagesUsingSiri = self->_appAffinityScoreForMessagesUsingSiri;
    [v4 appAffinityScoreForMessagesUsingSiri];
    if (appAffinityScoreForMessagesUsingSiri != v11) {
      goto LABEL_26;
    }
    $97BAB581C1C24BB6F04EA563899E340F has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v12 = (*(unsigned int *)&has >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1)) {
    goto LABEL_26;
  }
  if (v12)
  {
    float appAffinityScoreForMessagesReceived = self->_appAffinityScoreForMessagesReceived;
    [v4 appAffinityScoreForMessagesReceived];
    if (appAffinityScoreForMessagesReceived != v14) {
      goto LABEL_26;
    }
    $97BAB581C1C24BB6F04EA563899E340F has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v15 = (*(unsigned int *)&has >> 3) & 1;
  if (v15 != ((v6 >> 3) & 1)) {
    goto LABEL_26;
  }
  if (v15)
  {
    int appFreqForMessages = self->_appFreqForMessages;
    if (appFreqForMessages != [v4 appFreqForMessages]) {
      goto LABEL_26;
    }
    $97BAB581C1C24BB6F04EA563899E340F has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v17 = (*(unsigned int *)&has >> 4) & 1;
  if (v17 != ((v6 >> 4) & 1)) {
    goto LABEL_26;
  }
  if (v17)
  {
    int appFreqForMessagesUsingSiri = self->_appFreqForMessagesUsingSiri;
    if (appFreqForMessagesUsingSiri == [v4 appFreqForMessagesUsingSiri])
    {
      $97BAB581C1C24BB6F04EA563899E340F has = self->_has;
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
    int appFreqForMessagesForCountryCode = self->_appFreqForMessagesForCountryCode;
    if (appFreqForMessagesForCountryCode != [v4 appFreqForMessagesForCountryCode]) {
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
  return INFERENCESchemaINFERENCECommsAppSelectionTrainingAppDependentMessageSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteAppFreqForMessagesForCountryCode
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasAppFreqForMessagesForCountryCode:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAppFreqForMessagesForCountryCode
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAppFreqForMessagesForCountryCode:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int appFreqForMessagesForCountryCode = a3;
}

- (void)deleteAppFreqForMessagesUsingSiri
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasAppFreqForMessagesUsingSiri:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAppFreqForMessagesUsingSiri
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAppFreqForMessagesUsingSiri:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int appFreqForMessagesUsingSiri = a3;
}

- (void)deleteAppFreqForMessages
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasAppFreqForMessages:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAppFreqForMessages
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAppFreqForMessages:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int appFreqForMessages = a3;
}

- (void)deleteAppAffinityScoreForMessagesReceived
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAppAffinityScoreForMessagesReceived:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAppAffinityScoreForMessagesReceived
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAppAffinityScoreForMessagesReceived:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float appAffinityScoreForMessagesReceived = a3;
}

- (void)deleteAppAffinityScoreForMessagesUsingSiri
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAppAffinityScoreForMessagesUsingSiri:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAppAffinityScoreForMessagesUsingSiri
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAppAffinityScoreForMessagesUsingSiri:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float appAffinityScoreForMessagesUsingSiri = a3;
}

- (void)deleteAppAffinityScoreForMessages
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAppAffinityScoreForMessages:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppAffinityScoreForMessages
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAppAffinityScoreForMessages:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float appAffinityScoreForMessages = a3;
}

@end