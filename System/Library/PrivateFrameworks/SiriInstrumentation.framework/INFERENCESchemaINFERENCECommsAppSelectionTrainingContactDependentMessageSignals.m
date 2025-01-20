@interface INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals
- (BOOL)hasAppContactAffinityScoreForMessages;
- (BOOL)hasAppContactAffinityScoreForMessagesReceived;
- (BOOL)hasAppContactAffinityScoreForMessagesUsingSiri;
- (BOOL)hasAppContactFreqForMessages;
- (BOOL)hasAppContactFreqForMessages10Min;
- (BOOL)hasAppContactFreqForMessages1Day;
- (BOOL)hasAppContactFreqForMessages1Hr;
- (BOOL)hasAppContactFreqForMessages28Day;
- (BOOL)hasAppContactFreqForMessages2Min;
- (BOOL)hasAppContactFreqForMessages6Hr;
- (BOOL)hasAppContactFreqForMessages7Day;
- (BOOL)hasAppContactFreqForMessagesHaptic;
- (BOOL)hasAppContactFreqForMessagesInf;
- (BOOL)hasAppContactFreqForMessagesUsingSiri;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)appContactAffinityScoreForMessages;
- (float)appContactAffinityScoreForMessagesReceived;
- (float)appContactAffinityScoreForMessagesUsingSiri;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appContactFreqForMessages;
- (int)appContactFreqForMessages10Min;
- (int)appContactFreqForMessages1Day;
- (int)appContactFreqForMessages1Hr;
- (int)appContactFreqForMessages28Day;
- (int)appContactFreqForMessages2Min;
- (int)appContactFreqForMessages6Hr;
- (int)appContactFreqForMessages7Day;
- (int)appContactFreqForMessagesHaptic;
- (int)appContactFreqForMessagesInf;
- (int)appContactFreqForMessagesUsingSiri;
- (unint64_t)hash;
- (void)deleteAppContactAffinityScoreForMessages;
- (void)deleteAppContactAffinityScoreForMessagesReceived;
- (void)deleteAppContactAffinityScoreForMessagesUsingSiri;
- (void)deleteAppContactFreqForMessages;
- (void)deleteAppContactFreqForMessages10Min;
- (void)deleteAppContactFreqForMessages1Day;
- (void)deleteAppContactFreqForMessages1Hr;
- (void)deleteAppContactFreqForMessages28Day;
- (void)deleteAppContactFreqForMessages2Min;
- (void)deleteAppContactFreqForMessages6Hr;
- (void)deleteAppContactFreqForMessages7Day;
- (void)deleteAppContactFreqForMessagesHaptic;
- (void)deleteAppContactFreqForMessagesInf;
- (void)deleteAppContactFreqForMessagesUsingSiri;
- (void)setAppContactAffinityScoreForMessages:(float)a3;
- (void)setAppContactAffinityScoreForMessagesReceived:(float)a3;
- (void)setAppContactAffinityScoreForMessagesUsingSiri:(float)a3;
- (void)setAppContactFreqForMessages10Min:(int)a3;
- (void)setAppContactFreqForMessages1Day:(int)a3;
- (void)setAppContactFreqForMessages1Hr:(int)a3;
- (void)setAppContactFreqForMessages28Day:(int)a3;
- (void)setAppContactFreqForMessages2Min:(int)a3;
- (void)setAppContactFreqForMessages6Hr:(int)a3;
- (void)setAppContactFreqForMessages7Day:(int)a3;
- (void)setAppContactFreqForMessages:(int)a3;
- (void)setAppContactFreqForMessagesHaptic:(int)a3;
- (void)setAppContactFreqForMessagesInf:(int)a3;
- (void)setAppContactFreqForMessagesUsingSiri:(int)a3;
- (void)setHasAppContactAffinityScoreForMessages:(BOOL)a3;
- (void)setHasAppContactAffinityScoreForMessagesReceived:(BOOL)a3;
- (void)setHasAppContactAffinityScoreForMessagesUsingSiri:(BOOL)a3;
- (void)setHasAppContactFreqForMessages10Min:(BOOL)a3;
- (void)setHasAppContactFreqForMessages1Day:(BOOL)a3;
- (void)setHasAppContactFreqForMessages1Hr:(BOOL)a3;
- (void)setHasAppContactFreqForMessages28Day:(BOOL)a3;
- (void)setHasAppContactFreqForMessages2Min:(BOOL)a3;
- (void)setHasAppContactFreqForMessages6Hr:(BOOL)a3;
- (void)setHasAppContactFreqForMessages7Day:(BOOL)a3;
- (void)setHasAppContactFreqForMessages:(BOOL)a3;
- (void)setHasAppContactFreqForMessagesHaptic:(BOOL)a3;
- (void)setHasAppContactFreqForMessagesInf:(BOOL)a3;
- (void)setHasAppContactFreqForMessagesUsingSiri:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)appContactFreqForMessagesHaptic
{
  return self->_appContactFreqForMessagesHaptic;
}

- (int)appContactFreqForMessagesUsingSiri
{
  return self->_appContactFreqForMessagesUsingSiri;
}

- (int)appContactFreqForMessages
{
  return self->_appContactFreqForMessages;
}

- (int)appContactFreqForMessagesInf
{
  return self->_appContactFreqForMessagesInf;
}

- (int)appContactFreqForMessages28Day
{
  return self->_appContactFreqForMessages28Day;
}

- (int)appContactFreqForMessages7Day
{
  return self->_appContactFreqForMessages7Day;
}

- (int)appContactFreqForMessages1Day
{
  return self->_appContactFreqForMessages1Day;
}

- (int)appContactFreqForMessages6Hr
{
  return self->_appContactFreqForMessages6Hr;
}

- (int)appContactFreqForMessages1Hr
{
  return self->_appContactFreqForMessages1Hr;
}

- (int)appContactFreqForMessages10Min
{
  return self->_appContactFreqForMessages10Min;
}

- (int)appContactFreqForMessages2Min
{
  return self->_appContactFreqForMessages2Min;
}

- (float)appContactAffinityScoreForMessagesReceived
{
  return self->_appContactAffinityScoreForMessagesReceived;
}

- (float)appContactAffinityScoreForMessagesUsingSiri
{
  return self->_appContactAffinityScoreForMessagesUsingSiri;
}

- (float)appContactAffinityScoreForMessages
{
  return self->_appContactAffinityScoreForMessages;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals;
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appContactAffinityScoreForMessages"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactAffinityScoreForMessages:](v5, "setAppContactAffinityScoreForMessages:");
    }
    v7 = [v4 objectForKeyedSubscript:@"appContactAffinityScoreForMessagesUsingSiri"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactAffinityScoreForMessagesUsingSiri:](v5, "setAppContactAffinityScoreForMessagesUsingSiri:");
    }
    v8 = [v4 objectForKeyedSubscript:@"appContactAffinityScoreForMessagesReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactAffinityScoreForMessagesReceived:](v5, "setAppContactAffinityScoreForMessagesReceived:");
    }
    v9 = [v4 objectForKeyedSubscript:@"appContactFreqForMessages2Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages2Min:](v5, "setAppContactFreqForMessages2Min:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"appContactFreqForMessages10Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages10Min:](v5, "setAppContactFreqForMessages10Min:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"appContactFreqForMessages1Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages1Hr:](v5, "setAppContactFreqForMessages1Hr:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"appContactFreqForMessages6Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages6Hr:](v5, "setAppContactFreqForMessages6Hr:", [v12 intValue]);
    }
    v29 = v6;
    v13 = [v4 objectForKeyedSubscript:@"appContactFreqForMessages1Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages1Day:](v5, "setAppContactFreqForMessages1Day:", [v13 intValue]);
    }
    v23 = v13;
    v28 = v7;
    v14 = [v4 objectForKeyedSubscript:@"appContactFreqForMessages7Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages7Day:](v5, "setAppContactFreqForMessages7Day:", [v14 intValue]);
    }
    v27 = v8;
    v15 = [v4 objectForKeyedSubscript:@"appContactFreqForMessages28Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages28Day:](v5, "setAppContactFreqForMessages28Day:", [v15 intValue]);
    }
    v26 = v9;
    v16 = [v4 objectForKeyedSubscript:@"appContactFreqForMessagesInf"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessagesInf:](v5, "setAppContactFreqForMessagesInf:", [v16 intValue]);
    }
    v24 = v12;
    v25 = v10;
    v17 = [v4 objectForKeyedSubscript:@"appContactFreqForMessages"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessages:](v5, "setAppContactFreqForMessages:", [v17 intValue]);
    }
    v18 = v11;
    v19 = [v4 objectForKeyedSubscript:@"appContactFreqForMessagesUsingSiri"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessagesUsingSiri:](v5, "setAppContactFreqForMessagesUsingSiri:", [v19 intValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"appContactFreqForMessagesHaptic"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals setAppContactFreqForMessagesHaptic:](v5, "setAppContactFreqForMessagesHaptic:", [v20 intValue]);
    }
    v21 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals *)self dictionaryRepresentation];
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
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v7 = NSNumber;
    [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals *)self appContactAffinityScoreForMessages];
    v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"appContactAffinityScoreForMessages"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  v9 = NSNumber;
  [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals *)self appContactAffinityScoreForMessagesReceived];
  v10 = objc_msgSend(v9, "numberWithFloat:");
  [v3 setObject:v10 forKeyedSubscript:@"appContactAffinityScoreForMessagesReceived"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x800) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  v11 = NSNumber;
  [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals *)self appContactAffinityScoreForMessagesUsingSiri];
  v12 = objc_msgSend(v11, "numberWithFloat:");
  [v3 setObject:v12 forKeyedSubscript:@"appContactAffinityScoreForMessagesUsingSiri"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  v13 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages](self, "appContactFreqForMessages"));
  [v3 setObject:v13 forKeyedSubscript:@"appContactFreqForMessages"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages10Min](self, "appContactFreqForMessages10Min"));
  [v3 setObject:v14 forKeyedSubscript:@"appContactFreqForMessages10Min"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  v15 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages1Day](self, "appContactFreqForMessages1Day"));
  [v3 setObject:v15 forKeyedSubscript:@"appContactFreqForMessages1Day"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  v16 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages1Hr](self, "appContactFreqForMessages1Hr"));
  [v3 setObject:v16 forKeyedSubscript:@"appContactFreqForMessages1Hr"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  v17 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages28Day](self, "appContactFreqForMessages28Day"));
  [v3 setObject:v17 forKeyedSubscript:@"appContactFreqForMessages28Day"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  v18 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages2Min](self, "appContactFreqForMessages2Min"));
  [v3 setObject:v18 forKeyedSubscript:@"appContactFreqForMessages2Min"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  v19 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages6Hr](self, "appContactFreqForMessages6Hr"));
  [v3 setObject:v19 forKeyedSubscript:@"appContactFreqForMessages6Hr"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  v20 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessages7Day](self, "appContactFreqForMessages7Day"));
  [v3 setObject:v20 forKeyedSubscript:@"appContactFreqForMessages7Day"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_13:
    if ((has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  v21 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessagesHaptic](self, "appContactFreqForMessagesHaptic"));
  [v3 setObject:v21 forKeyedSubscript:@"appContactFreqForMessagesHaptic"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_14:
    if ((has & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  v22 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessagesInf](self, "appContactFreqForMessagesInf"));
  [v3 setObject:v22 forKeyedSubscript:@"appContactFreqForMessagesInf"];

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_15:
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignals appContactFreqForMessagesUsingSiri](self, "appContactFreqForMessagesUsingSiri"));
    [v3 setObject:v5 forKeyedSubscript:@"appContactFreqForMessagesUsingSiri"];
  }
LABEL_16:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    float appContactAffinityScoreForMessages = self->_appContactAffinityScoreForMessages;
    double v6 = appContactAffinityScoreForMessages;
    if (appContactAffinityScoreForMessages < 0.0) {
      double v6 = -appContactAffinityScoreForMessages;
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
    float appContactAffinityScoreForMessagesUsingSiri = self->_appContactAffinityScoreForMessagesUsingSiri;
    double v11 = appContactAffinityScoreForMessagesUsingSiri;
    if (appContactAffinityScoreForMessagesUsingSiri < 0.0) {
      double v11 = -appContactAffinityScoreForMessagesUsingSiri;
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
    float appContactAffinityScoreForMessagesReceived = self->_appContactAffinityScoreForMessagesReceived;
    double v16 = appContactAffinityScoreForMessagesReceived;
    if (appContactAffinityScoreForMessagesReceived < 0.0) {
      double v16 = -appContactAffinityScoreForMessagesReceived;
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
  if ((has & 8) != 0)
  {
    uint64_t v19 = 2654435761 * self->_appContactFreqForMessages2Min;
    if ((has & 0x10) != 0)
    {
LABEL_27:
      uint64_t v20 = 2654435761 * self->_appContactFreqForMessages10Min;
      if ((has & 0x20) != 0) {
        goto LABEL_28;
      }
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_27;
    }
  }
  uint64_t v20 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_28:
    uint64_t v21 = 2654435761 * self->_appContactFreqForMessages1Hr;
    if ((has & 0x40) != 0) {
      goto LABEL_29;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v21 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_29:
    uint64_t v22 = 2654435761 * self->_appContactFreqForMessages6Hr;
    if ((has & 0x80) != 0) {
      goto LABEL_30;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v22 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_30:
    uint64_t v23 = 2654435761 * self->_appContactFreqForMessages1Day;
    if ((has & 0x100) != 0) {
      goto LABEL_31;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v23 = 0;
  if ((has & 0x100) != 0)
  {
LABEL_31:
    uint64_t v24 = 2654435761 * self->_appContactFreqForMessages7Day;
    if ((has & 0x200) != 0) {
      goto LABEL_32;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v24 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_32:
    uint64_t v25 = 2654435761 * self->_appContactFreqForMessages28Day;
    if ((has & 0x400) != 0) {
      goto LABEL_33;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v25 = 0;
  if ((has & 0x400) != 0)
  {
LABEL_33:
    uint64_t v26 = 2654435761 * self->_appContactFreqForMessagesInf;
    if ((has & 0x800) != 0) {
      goto LABEL_34;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v26 = 0;
  if ((has & 0x800) != 0)
  {
LABEL_34:
    uint64_t v27 = 2654435761 * self->_appContactFreqForMessages;
    if ((has & 0x1000) != 0) {
      goto LABEL_35;
    }
LABEL_46:
    uint64_t v28 = 0;
    if ((has & 0x2000) != 0) {
      goto LABEL_36;
    }
LABEL_47:
    uint64_t v29 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_45:
  uint64_t v27 = 0;
  if ((has & 0x1000) == 0) {
    goto LABEL_46;
  }
LABEL_35:
  uint64_t v28 = 2654435761 * self->_appContactFreqForMessagesUsingSiri;
  if ((has & 0x2000) == 0) {
    goto LABEL_47;
  }
LABEL_36:
  uint64_t v29 = 2654435761 * self->_appContactFreqForMessagesHaptic;
  return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_58;
  }
  if (*(unsigned char *)&has)
  {
    float appContactAffinityScoreForMessages = self->_appContactAffinityScoreForMessages;
    [v4 appContactAffinityScoreForMessages];
    if (appContactAffinityScoreForMessages != v8) {
      goto LABEL_58;
    }
    $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_58;
  }
  if (v9)
  {
    float appContactAffinityScoreForMessagesUsingSiri = self->_appContactAffinityScoreForMessagesUsingSiri;
    [v4 appContactAffinityScoreForMessagesUsingSiri];
    if (appContactAffinityScoreForMessagesUsingSiri != v11) {
      goto LABEL_58;
    }
    $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v12 = (*(unsigned int *)&has >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1)) {
    goto LABEL_58;
  }
  if (v12)
  {
    float appContactAffinityScoreForMessagesReceived = self->_appContactAffinityScoreForMessagesReceived;
    [v4 appContactAffinityScoreForMessagesReceived];
    if (appContactAffinityScoreForMessagesReceived != v14) {
      goto LABEL_58;
    }
    $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v15 = (*(unsigned int *)&has >> 3) & 1;
  if (v15 != ((v6 >> 3) & 1)) {
    goto LABEL_58;
  }
  if (v15)
  {
    int appContactFreqForMessages2Min = self->_appContactFreqForMessages2Min;
    if (appContactFreqForMessages2Min != [v4 appContactFreqForMessages2Min]) {
      goto LABEL_58;
    }
    $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v17 = (*(unsigned int *)&has >> 4) & 1;
  if (v17 != ((v6 >> 4) & 1)) {
    goto LABEL_58;
  }
  if (v17)
  {
    int appContactFreqForMessages10Min = self->_appContactFreqForMessages10Min;
    if (appContactFreqForMessages10Min != [v4 appContactFreqForMessages10Min]) {
      goto LABEL_58;
    }
    $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v19 = (*(unsigned int *)&has >> 5) & 1;
  if (v19 != ((v6 >> 5) & 1)) {
    goto LABEL_58;
  }
  if (v19)
  {
    int appContactFreqForMessages1Hr = self->_appContactFreqForMessages1Hr;
    if (appContactFreqForMessages1Hr != [v4 appContactFreqForMessages1Hr]) {
      goto LABEL_58;
    }
    $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v21 = (*(unsigned int *)&has >> 6) & 1;
  if (v21 != ((v6 >> 6) & 1)) {
    goto LABEL_58;
  }
  if (v21)
  {
    int appContactFreqForMessages6Hr = self->_appContactFreqForMessages6Hr;
    if (appContactFreqForMessages6Hr != [v4 appContactFreqForMessages6Hr]) {
      goto LABEL_58;
    }
    $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v23 = (*(unsigned int *)&has >> 7) & 1;
  if (v23 != ((v6 >> 7) & 1)) {
    goto LABEL_58;
  }
  if (v23)
  {
    int appContactFreqForMessages1Day = self->_appContactFreqForMessages1Day;
    if (appContactFreqForMessages1Day != [v4 appContactFreqForMessages1Day]) {
      goto LABEL_58;
    }
    $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v25 = (*(unsigned int *)&has >> 8) & 1;
  if (v25 != ((v6 >> 8) & 1)) {
    goto LABEL_58;
  }
  if (v25)
  {
    int appContactFreqForMessages7Day = self->_appContactFreqForMessages7Day;
    if (appContactFreqForMessages7Day != [v4 appContactFreqForMessages7Day]) {
      goto LABEL_58;
    }
    $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v27 = (*(unsigned int *)&has >> 9) & 1;
  if (v27 != ((v6 >> 9) & 1)) {
    goto LABEL_58;
  }
  if (v27)
  {
    int appContactFreqForMessages28Day = self->_appContactFreqForMessages28Day;
    if (appContactFreqForMessages28Day != [v4 appContactFreqForMessages28Day]) {
      goto LABEL_58;
    }
    $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v29 = (*(unsigned int *)&has >> 10) & 1;
  if (v29 != ((v6 >> 10) & 1)) {
    goto LABEL_58;
  }
  if (v29)
  {
    int appContactFreqForMessagesInf = self->_appContactFreqForMessagesInf;
    if (appContactFreqForMessagesInf != [v4 appContactFreqForMessagesInf]) {
      goto LABEL_58;
    }
    $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v31 = (*(unsigned int *)&has >> 11) & 1;
  if (v31 != ((v6 >> 11) & 1)) {
    goto LABEL_58;
  }
  if (v31)
  {
    int appContactFreqForMessages = self->_appContactFreqForMessages;
    if (appContactFreqForMessages != [v4 appContactFreqForMessages]) {
      goto LABEL_58;
    }
    $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v33 = (*(unsigned int *)&has >> 12) & 1;
  if (v33 != ((v6 >> 12) & 1)) {
    goto LABEL_58;
  }
  if (v33)
  {
    int appContactFreqForMessagesUsingSiri = self->_appContactFreqForMessagesUsingSiri;
    if (appContactFreqForMessagesUsingSiri == [v4 appContactFreqForMessagesUsingSiri])
    {
      $2EA63C89BC5A9B1EE519CE982F073168 has = self->_has;
      unsigned int v6 = v4[32];
      goto LABEL_54;
    }
LABEL_58:
    BOOL v37 = 0;
    goto LABEL_59;
  }
LABEL_54:
  int v35 = (*(unsigned int *)&has >> 13) & 1;
  if (v35 != ((v6 >> 13) & 1)) {
    goto LABEL_58;
  }
  if (v35)
  {
    int appContactFreqForMessagesHaptic = self->_appContactFreqForMessagesHaptic;
    if (appContactFreqForMessagesHaptic != [v4 appContactFreqForMessagesHaptic]) {
      goto LABEL_58;
    }
  }
  BOOL v37 = 1;
LABEL_59:

  return v37;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
LABEL_15:
  }
    PBDataWriterWriteInt32Field();
LABEL_16:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentMessageSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteAppContactFreqForMessagesHaptic
{
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (void)setHasAppContactFreqForMessagesHaptic:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasAppContactFreqForMessagesHaptic
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setAppContactFreqForMessagesHaptic:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_int appContactFreqForMessagesHaptic = a3;
}

- (void)deleteAppContactFreqForMessagesUsingSiri
{
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setHasAppContactFreqForMessagesUsingSiri:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasAppContactFreqForMessagesUsingSiri
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setAppContactFreqForMessagesUsingSiri:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_int appContactFreqForMessagesUsingSiri = a3;
}

- (void)deleteAppContactFreqForMessages
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasAppContactFreqForMessages:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasAppContactFreqForMessages
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setAppContactFreqForMessages:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_int appContactFreqForMessages = a3;
}

- (void)deleteAppContactFreqForMessagesInf
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasAppContactFreqForMessagesInf:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasAppContactFreqForMessagesInf
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setAppContactFreqForMessagesInf:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int appContactFreqForMessagesInf = a3;
}

- (void)deleteAppContactFreqForMessages28Day
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasAppContactFreqForMessages28Day:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasAppContactFreqForMessages28Day
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAppContactFreqForMessages28Day:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int appContactFreqForMessages28Day = a3;
}

- (void)deleteAppContactFreqForMessages7Day
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasAppContactFreqForMessages7Day:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasAppContactFreqForMessages7Day
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setAppContactFreqForMessages7Day:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int appContactFreqForMessages7Day = a3;
}

- (void)deleteAppContactFreqForMessages1Day
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasAppContactFreqForMessages1Day:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasAppContactFreqForMessages1Day
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAppContactFreqForMessages1Day:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int appContactFreqForMessages1Day = a3;
}

- (void)deleteAppContactFreqForMessages6Hr
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasAppContactFreqForMessages6Hr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasAppContactFreqForMessages6Hr
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setAppContactFreqForMessages6Hr:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int appContactFreqForMessages6Hr = a3;
}

- (void)deleteAppContactFreqForMessages1Hr
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasAppContactFreqForMessages1Hr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAppContactFreqForMessages1Hr
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAppContactFreqForMessages1Hr:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int appContactFreqForMessages1Hr = a3;
}

- (void)deleteAppContactFreqForMessages10Min
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasAppContactFreqForMessages10Min:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAppContactFreqForMessages10Min
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAppContactFreqForMessages10Min:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int appContactFreqForMessages10Min = a3;
}

- (void)deleteAppContactFreqForMessages2Min
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasAppContactFreqForMessages2Min:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAppContactFreqForMessages2Min
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAppContactFreqForMessages2Min:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int appContactFreqForMessages2Min = a3;
}

- (void)deleteAppContactAffinityScoreForMessagesReceived
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasAppContactAffinityScoreForMessagesReceived:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAppContactAffinityScoreForMessagesReceived
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAppContactAffinityScoreForMessagesReceived:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_float appContactAffinityScoreForMessagesReceived = a3;
}

- (void)deleteAppContactAffinityScoreForMessagesUsingSiri
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasAppContactAffinityScoreForMessagesUsingSiri:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAppContactAffinityScoreForMessagesUsingSiri
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAppContactAffinityScoreForMessagesUsingSiri:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_float appContactAffinityScoreForMessagesUsingSiri = a3;
}

- (void)deleteAppContactAffinityScoreForMessages
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasAppContactAffinityScoreForMessages:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAppContactAffinityScoreForMessages
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setAppContactAffinityScoreForMessages:(float)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_float appContactAffinityScoreForMessages = a3;
}

@end