@interface INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals
- (BOOL)hasAppContactAffinityScoreForPhoneCall;
- (BOOL)hasAppContactAffinityScoreForPhoneCallReceived;
- (BOOL)hasAppContactAffinityScoreForPhoneCallUsingSiri;
- (BOOL)hasAppContactFreqForPhoneCall;
- (BOOL)hasAppContactFreqForPhoneCall10Min;
- (BOOL)hasAppContactFreqForPhoneCall1Day;
- (BOOL)hasAppContactFreqForPhoneCall1Hr;
- (BOOL)hasAppContactFreqForPhoneCall28Day;
- (BOOL)hasAppContactFreqForPhoneCall2Min;
- (BOOL)hasAppContactFreqForPhoneCall6Hr;
- (BOOL)hasAppContactFreqForPhoneCall7Day;
- (BOOL)hasAppContactFreqForPhoneCallHaptic;
- (BOOL)hasAppContactFreqForPhoneCallInf;
- (BOOL)hasAppContactFreqForPhoneCallUsingSiri;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)appContactAffinityScoreForPhoneCall;
- (float)appContactAffinityScoreForPhoneCallReceived;
- (float)appContactAffinityScoreForPhoneCallUsingSiri;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appContactFreqForPhoneCall;
- (int)appContactFreqForPhoneCall10Min;
- (int)appContactFreqForPhoneCall1Day;
- (int)appContactFreqForPhoneCall1Hr;
- (int)appContactFreqForPhoneCall28Day;
- (int)appContactFreqForPhoneCall2Min;
- (int)appContactFreqForPhoneCall6Hr;
- (int)appContactFreqForPhoneCall7Day;
- (int)appContactFreqForPhoneCallHaptic;
- (int)appContactFreqForPhoneCallInf;
- (int)appContactFreqForPhoneCallUsingSiri;
- (unint64_t)hash;
- (void)deleteAppContactAffinityScoreForPhoneCall;
- (void)deleteAppContactAffinityScoreForPhoneCallReceived;
- (void)deleteAppContactAffinityScoreForPhoneCallUsingSiri;
- (void)deleteAppContactFreqForPhoneCall;
- (void)deleteAppContactFreqForPhoneCall10Min;
- (void)deleteAppContactFreqForPhoneCall1Day;
- (void)deleteAppContactFreqForPhoneCall1Hr;
- (void)deleteAppContactFreqForPhoneCall28Day;
- (void)deleteAppContactFreqForPhoneCall2Min;
- (void)deleteAppContactFreqForPhoneCall6Hr;
- (void)deleteAppContactFreqForPhoneCall7Day;
- (void)deleteAppContactFreqForPhoneCallHaptic;
- (void)deleteAppContactFreqForPhoneCallInf;
- (void)deleteAppContactFreqForPhoneCallUsingSiri;
- (void)setAppContactAffinityScoreForPhoneCall:(float)a3;
- (void)setAppContactAffinityScoreForPhoneCallReceived:(float)a3;
- (void)setAppContactAffinityScoreForPhoneCallUsingSiri:(float)a3;
- (void)setAppContactFreqForPhoneCall10Min:(int)a3;
- (void)setAppContactFreqForPhoneCall1Day:(int)a3;
- (void)setAppContactFreqForPhoneCall1Hr:(int)a3;
- (void)setAppContactFreqForPhoneCall28Day:(int)a3;
- (void)setAppContactFreqForPhoneCall2Min:(int)a3;
- (void)setAppContactFreqForPhoneCall6Hr:(int)a3;
- (void)setAppContactFreqForPhoneCall7Day:(int)a3;
- (void)setAppContactFreqForPhoneCall:(int)a3;
- (void)setAppContactFreqForPhoneCallHaptic:(int)a3;
- (void)setAppContactFreqForPhoneCallInf:(int)a3;
- (void)setAppContactFreqForPhoneCallUsingSiri:(int)a3;
- (void)setHasAppContactAffinityScoreForPhoneCall:(BOOL)a3;
- (void)setHasAppContactAffinityScoreForPhoneCallReceived:(BOOL)a3;
- (void)setHasAppContactAffinityScoreForPhoneCallUsingSiri:(BOOL)a3;
- (void)setHasAppContactFreqForPhoneCall10Min:(BOOL)a3;
- (void)setHasAppContactFreqForPhoneCall1Day:(BOOL)a3;
- (void)setHasAppContactFreqForPhoneCall1Hr:(BOOL)a3;
- (void)setHasAppContactFreqForPhoneCall28Day:(BOOL)a3;
- (void)setHasAppContactFreqForPhoneCall2Min:(BOOL)a3;
- (void)setHasAppContactFreqForPhoneCall6Hr:(BOOL)a3;
- (void)setHasAppContactFreqForPhoneCall7Day:(BOOL)a3;
- (void)setHasAppContactFreqForPhoneCall:(BOOL)a3;
- (void)setHasAppContactFreqForPhoneCallHaptic:(BOOL)a3;
- (void)setHasAppContactFreqForPhoneCallInf:(BOOL)a3;
- (void)setHasAppContactFreqForPhoneCallUsingSiri:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)appContactFreqForPhoneCallHaptic
{
  return self->_appContactFreqForPhoneCallHaptic;
}

- (int)appContactFreqForPhoneCallUsingSiri
{
  return self->_appContactFreqForPhoneCallUsingSiri;
}

- (int)appContactFreqForPhoneCall
{
  return self->_appContactFreqForPhoneCall;
}

- (int)appContactFreqForPhoneCallInf
{
  return self->_appContactFreqForPhoneCallInf;
}

- (int)appContactFreqForPhoneCall28Day
{
  return self->_appContactFreqForPhoneCall28Day;
}

- (int)appContactFreqForPhoneCall7Day
{
  return self->_appContactFreqForPhoneCall7Day;
}

- (int)appContactFreqForPhoneCall1Day
{
  return self->_appContactFreqForPhoneCall1Day;
}

- (int)appContactFreqForPhoneCall6Hr
{
  return self->_appContactFreqForPhoneCall6Hr;
}

- (int)appContactFreqForPhoneCall1Hr
{
  return self->_appContactFreqForPhoneCall1Hr;
}

- (int)appContactFreqForPhoneCall10Min
{
  return self->_appContactFreqForPhoneCall10Min;
}

- (int)appContactFreqForPhoneCall2Min
{
  return self->_appContactFreqForPhoneCall2Min;
}

- (float)appContactAffinityScoreForPhoneCallReceived
{
  return self->_appContactAffinityScoreForPhoneCallReceived;
}

- (float)appContactAffinityScoreForPhoneCallUsingSiri
{
  return self->_appContactAffinityScoreForPhoneCallUsingSiri;
}

- (float)appContactAffinityScoreForPhoneCall
{
  return self->_appContactAffinityScoreForPhoneCall;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals;
  v5 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appContactAffinityScoreForPhoneCall"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactAffinityScoreForPhoneCall:](v5, "setAppContactAffinityScoreForPhoneCall:");
    }
    v7 = [v4 objectForKeyedSubscript:@"appContactAffinityScoreForPhoneCallUsingSiri"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactAffinityScoreForPhoneCallUsingSiri:](v5, "setAppContactAffinityScoreForPhoneCallUsingSiri:");
    }
    v8 = [v4 objectForKeyedSubscript:@"appContactAffinityScoreForPhoneCallReceived"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactAffinityScoreForPhoneCallReceived:](v5, "setAppContactAffinityScoreForPhoneCallReceived:");
    }
    v9 = [v4 objectForKeyedSubscript:@"appContactFreqForPhoneCall2Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall2Min:](v5, "setAppContactFreqForPhoneCall2Min:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"appContactFreqForPhoneCall10Min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall10Min:](v5, "setAppContactFreqForPhoneCall10Min:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"appContactFreqForPhoneCall1Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall1Hr:](v5, "setAppContactFreqForPhoneCall1Hr:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"appContactFreqForPhoneCall6Hr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall6Hr:](v5, "setAppContactFreqForPhoneCall6Hr:", [v12 intValue]);
    }
    v29 = v6;
    v13 = [v4 objectForKeyedSubscript:@"appContactFreqForPhoneCall1Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall1Day:](v5, "setAppContactFreqForPhoneCall1Day:", [v13 intValue]);
    }
    v23 = v13;
    v28 = v7;
    v14 = [v4 objectForKeyedSubscript:@"appContactFreqForPhoneCall7Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall7Day:](v5, "setAppContactFreqForPhoneCall7Day:", [v14 intValue]);
    }
    v27 = v8;
    v15 = [v4 objectForKeyedSubscript:@"appContactFreqForPhoneCall28Day"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall28Day:](v5, "setAppContactFreqForPhoneCall28Day:", [v15 intValue]);
    }
    v26 = v9;
    v16 = [v4 objectForKeyedSubscript:@"appContactFreqForPhoneCallInf"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCallInf:](v5, "setAppContactFreqForPhoneCallInf:", [v16 intValue]);
    }
    v24 = v12;
    v25 = v10;
    v17 = [v4 objectForKeyedSubscript:@"appContactFreqForPhoneCall"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCall:](v5, "setAppContactFreqForPhoneCall:", [v17 intValue]);
    }
    v18 = v11;
    v19 = [v4 objectForKeyedSubscript:@"appContactFreqForPhoneCallUsingSiri"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCallUsingSiri:](v5, "setAppContactFreqForPhoneCallUsingSiri:", [v19 intValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"appContactFreqForPhoneCallHaptic"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals setAppContactFreqForPhoneCallHaptic:](v5, "setAppContactFreqForPhoneCallHaptic:", [v20 intValue]);
    }
    v21 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals *)self dictionaryRepresentation];
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
    [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals *)self appContactAffinityScoreForPhoneCall];
    v8 = objc_msgSend(v7, "numberWithFloat:");
    [v3 setObject:v8 forKeyedSubscript:@"appContactAffinityScoreForPhoneCall"];

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
  [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals *)self appContactAffinityScoreForPhoneCallReceived];
  v10 = objc_msgSend(v9, "numberWithFloat:");
  [v3 setObject:v10 forKeyedSubscript:@"appContactAffinityScoreForPhoneCallReceived"];

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
  [(INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals *)self appContactAffinityScoreForPhoneCallUsingSiri];
  v12 = objc_msgSend(v11, "numberWithFloat:");
  [v3 setObject:v12 forKeyedSubscript:@"appContactAffinityScoreForPhoneCallUsingSiri"];

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
  v13 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall](self, "appContactFreqForPhoneCall"));
  [v3 setObject:v13 forKeyedSubscript:@"appContactFreqForPhoneCall"];

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
  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall10Min](self, "appContactFreqForPhoneCall10Min"));
  [v3 setObject:v14 forKeyedSubscript:@"appContactFreqForPhoneCall10Min"];

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
  v15 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall1Day](self, "appContactFreqForPhoneCall1Day"));
  [v3 setObject:v15 forKeyedSubscript:@"appContactFreqForPhoneCall1Day"];

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
  v16 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall1Hr](self, "appContactFreqForPhoneCall1Hr"));
  [v3 setObject:v16 forKeyedSubscript:@"appContactFreqForPhoneCall1Hr"];

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
  v17 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall28Day](self, "appContactFreqForPhoneCall28Day"));
  [v3 setObject:v17 forKeyedSubscript:@"appContactFreqForPhoneCall28Day"];

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
  v18 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall2Min](self, "appContactFreqForPhoneCall2Min"));
  [v3 setObject:v18 forKeyedSubscript:@"appContactFreqForPhoneCall2Min"];

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
  v19 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall6Hr](self, "appContactFreqForPhoneCall6Hr"));
  [v3 setObject:v19 forKeyedSubscript:@"appContactFreqForPhoneCall6Hr"];

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
  v20 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCall7Day](self, "appContactFreqForPhoneCall7Day"));
  [v3 setObject:v20 forKeyedSubscript:@"appContactFreqForPhoneCall7Day"];

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
  v21 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCallHaptic](self, "appContactFreqForPhoneCallHaptic"));
  [v3 setObject:v21 forKeyedSubscript:@"appContactFreqForPhoneCallHaptic"];

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
  v22 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCallInf](self, "appContactFreqForPhoneCallInf"));
  [v3 setObject:v22 forKeyedSubscript:@"appContactFreqForPhoneCallInf"];

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_15:
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignals appContactFreqForPhoneCallUsingSiri](self, "appContactFreqForPhoneCallUsingSiri"));
    [v3 setObject:v5 forKeyedSubscript:@"appContactFreqForPhoneCallUsingSiri"];
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
    float appContactAffinityScoreForPhoneCall = self->_appContactAffinityScoreForPhoneCall;
    double v6 = appContactAffinityScoreForPhoneCall;
    if (appContactAffinityScoreForPhoneCall < 0.0) {
      double v6 = -appContactAffinityScoreForPhoneCall;
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
    float appContactAffinityScoreForPhoneCallUsingSiri = self->_appContactAffinityScoreForPhoneCallUsingSiri;
    double v11 = appContactAffinityScoreForPhoneCallUsingSiri;
    if (appContactAffinityScoreForPhoneCallUsingSiri < 0.0) {
      double v11 = -appContactAffinityScoreForPhoneCallUsingSiri;
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
    float appContactAffinityScoreForPhoneCallReceived = self->_appContactAffinityScoreForPhoneCallReceived;
    double v16 = appContactAffinityScoreForPhoneCallReceived;
    if (appContactAffinityScoreForPhoneCallReceived < 0.0) {
      double v16 = -appContactAffinityScoreForPhoneCallReceived;
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
    uint64_t v19 = 2654435761 * self->_appContactFreqForPhoneCall2Min;
    if ((has & 0x10) != 0)
    {
LABEL_27:
      uint64_t v20 = 2654435761 * self->_appContactFreqForPhoneCall10Min;
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
    uint64_t v21 = 2654435761 * self->_appContactFreqForPhoneCall1Hr;
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
    uint64_t v22 = 2654435761 * self->_appContactFreqForPhoneCall6Hr;
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
    uint64_t v23 = 2654435761 * self->_appContactFreqForPhoneCall1Day;
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
    uint64_t v24 = 2654435761 * self->_appContactFreqForPhoneCall7Day;
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
    uint64_t v25 = 2654435761 * self->_appContactFreqForPhoneCall28Day;
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
    uint64_t v26 = 2654435761 * self->_appContactFreqForPhoneCallInf;
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
    uint64_t v27 = 2654435761 * self->_appContactFreqForPhoneCall;
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
  uint64_t v28 = 2654435761 * self->_appContactFreqForPhoneCallUsingSiri;
  if ((has & 0x2000) == 0) {
    goto LABEL_47;
  }
LABEL_36:
  uint64_t v29 = 2654435761 * self->_appContactFreqForPhoneCallHaptic;
  return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_58;
  }
  if (*(unsigned char *)&has)
  {
    float appContactAffinityScoreForPhoneCall = self->_appContactAffinityScoreForPhoneCall;
    [v4 appContactAffinityScoreForPhoneCall];
    if (appContactAffinityScoreForPhoneCall != v8) {
      goto LABEL_58;
    }
    $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_58;
  }
  if (v9)
  {
    float appContactAffinityScoreForPhoneCallUsingSiri = self->_appContactAffinityScoreForPhoneCallUsingSiri;
    [v4 appContactAffinityScoreForPhoneCallUsingSiri];
    if (appContactAffinityScoreForPhoneCallUsingSiri != v11) {
      goto LABEL_58;
    }
    $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v12 = (*(unsigned int *)&has >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1)) {
    goto LABEL_58;
  }
  if (v12)
  {
    float appContactAffinityScoreForPhoneCallReceived = self->_appContactAffinityScoreForPhoneCallReceived;
    [v4 appContactAffinityScoreForPhoneCallReceived];
    if (appContactAffinityScoreForPhoneCallReceived != v14) {
      goto LABEL_58;
    }
    $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v15 = (*(unsigned int *)&has >> 3) & 1;
  if (v15 != ((v6 >> 3) & 1)) {
    goto LABEL_58;
  }
  if (v15)
  {
    int appContactFreqForPhoneCall2Min = self->_appContactFreqForPhoneCall2Min;
    if (appContactFreqForPhoneCall2Min != [v4 appContactFreqForPhoneCall2Min]) {
      goto LABEL_58;
    }
    $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v17 = (*(unsigned int *)&has >> 4) & 1;
  if (v17 != ((v6 >> 4) & 1)) {
    goto LABEL_58;
  }
  if (v17)
  {
    int appContactFreqForPhoneCall10Min = self->_appContactFreqForPhoneCall10Min;
    if (appContactFreqForPhoneCall10Min != [v4 appContactFreqForPhoneCall10Min]) {
      goto LABEL_58;
    }
    $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v19 = (*(unsigned int *)&has >> 5) & 1;
  if (v19 != ((v6 >> 5) & 1)) {
    goto LABEL_58;
  }
  if (v19)
  {
    int appContactFreqForPhoneCall1Hr = self->_appContactFreqForPhoneCall1Hr;
    if (appContactFreqForPhoneCall1Hr != [v4 appContactFreqForPhoneCall1Hr]) {
      goto LABEL_58;
    }
    $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v21 = (*(unsigned int *)&has >> 6) & 1;
  if (v21 != ((v6 >> 6) & 1)) {
    goto LABEL_58;
  }
  if (v21)
  {
    int appContactFreqForPhoneCall6Hr = self->_appContactFreqForPhoneCall6Hr;
    if (appContactFreqForPhoneCall6Hr != [v4 appContactFreqForPhoneCall6Hr]) {
      goto LABEL_58;
    }
    $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v23 = (*(unsigned int *)&has >> 7) & 1;
  if (v23 != ((v6 >> 7) & 1)) {
    goto LABEL_58;
  }
  if (v23)
  {
    int appContactFreqForPhoneCall1Day = self->_appContactFreqForPhoneCall1Day;
    if (appContactFreqForPhoneCall1Day != [v4 appContactFreqForPhoneCall1Day]) {
      goto LABEL_58;
    }
    $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v25 = (*(unsigned int *)&has >> 8) & 1;
  if (v25 != ((v6 >> 8) & 1)) {
    goto LABEL_58;
  }
  if (v25)
  {
    int appContactFreqForPhoneCall7Day = self->_appContactFreqForPhoneCall7Day;
    if (appContactFreqForPhoneCall7Day != [v4 appContactFreqForPhoneCall7Day]) {
      goto LABEL_58;
    }
    $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v27 = (*(unsigned int *)&has >> 9) & 1;
  if (v27 != ((v6 >> 9) & 1)) {
    goto LABEL_58;
  }
  if (v27)
  {
    int appContactFreqForPhoneCall28Day = self->_appContactFreqForPhoneCall28Day;
    if (appContactFreqForPhoneCall28Day != [v4 appContactFreqForPhoneCall28Day]) {
      goto LABEL_58;
    }
    $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v29 = (*(unsigned int *)&has >> 10) & 1;
  if (v29 != ((v6 >> 10) & 1)) {
    goto LABEL_58;
  }
  if (v29)
  {
    int appContactFreqForPhoneCallInf = self->_appContactFreqForPhoneCallInf;
    if (appContactFreqForPhoneCallInf != [v4 appContactFreqForPhoneCallInf]) {
      goto LABEL_58;
    }
    $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v31 = (*(unsigned int *)&has >> 11) & 1;
  if (v31 != ((v6 >> 11) & 1)) {
    goto LABEL_58;
  }
  if (v31)
  {
    int appContactFreqForPhoneCall = self->_appContactFreqForPhoneCall;
    if (appContactFreqForPhoneCall != [v4 appContactFreqForPhoneCall]) {
      goto LABEL_58;
    }
    $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v33 = (*(unsigned int *)&has >> 12) & 1;
  if (v33 != ((v6 >> 12) & 1)) {
    goto LABEL_58;
  }
  if (v33)
  {
    int appContactFreqForPhoneCallUsingSiri = self->_appContactFreqForPhoneCallUsingSiri;
    if (appContactFreqForPhoneCallUsingSiri == [v4 appContactFreqForPhoneCallUsingSiri])
    {
      $28840F1C26D087ABAB6994B29CBE6B64 has = self->_has;
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
    int appContactFreqForPhoneCallHaptic = self->_appContactFreqForPhoneCallHaptic;
    if (appContactFreqForPhoneCallHaptic != [v4 appContactFreqForPhoneCallHaptic]) {
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
  return INFERENCESchemaINFERENCECommsAppSelectionTrainingContactDependentPhoneCallSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteAppContactFreqForPhoneCallHaptic
{
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (void)setHasAppContactFreqForPhoneCallHaptic:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasAppContactFreqForPhoneCallHaptic
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setAppContactFreqForPhoneCallHaptic:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_int appContactFreqForPhoneCallHaptic = a3;
}

- (void)deleteAppContactFreqForPhoneCallUsingSiri
{
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setHasAppContactFreqForPhoneCallUsingSiri:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasAppContactFreqForPhoneCallUsingSiri
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setAppContactFreqForPhoneCallUsingSiri:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_int appContactFreqForPhoneCallUsingSiri = a3;
}

- (void)deleteAppContactFreqForPhoneCall
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasAppContactFreqForPhoneCall:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasAppContactFreqForPhoneCall
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setAppContactFreqForPhoneCall:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_int appContactFreqForPhoneCall = a3;
}

- (void)deleteAppContactFreqForPhoneCallInf
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasAppContactFreqForPhoneCallInf:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasAppContactFreqForPhoneCallInf
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setAppContactFreqForPhoneCallInf:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int appContactFreqForPhoneCallInf = a3;
}

- (void)deleteAppContactFreqForPhoneCall28Day
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasAppContactFreqForPhoneCall28Day:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasAppContactFreqForPhoneCall28Day
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAppContactFreqForPhoneCall28Day:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int appContactFreqForPhoneCall28Day = a3;
}

- (void)deleteAppContactFreqForPhoneCall7Day
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasAppContactFreqForPhoneCall7Day:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasAppContactFreqForPhoneCall7Day
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setAppContactFreqForPhoneCall7Day:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int appContactFreqForPhoneCall7Day = a3;
}

- (void)deleteAppContactFreqForPhoneCall1Day
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasAppContactFreqForPhoneCall1Day:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasAppContactFreqForPhoneCall1Day
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAppContactFreqForPhoneCall1Day:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int appContactFreqForPhoneCall1Day = a3;
}

- (void)deleteAppContactFreqForPhoneCall6Hr
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasAppContactFreqForPhoneCall6Hr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasAppContactFreqForPhoneCall6Hr
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setAppContactFreqForPhoneCall6Hr:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int appContactFreqForPhoneCall6Hr = a3;
}

- (void)deleteAppContactFreqForPhoneCall1Hr
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasAppContactFreqForPhoneCall1Hr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAppContactFreqForPhoneCall1Hr
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAppContactFreqForPhoneCall1Hr:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int appContactFreqForPhoneCall1Hr = a3;
}

- (void)deleteAppContactFreqForPhoneCall10Min
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasAppContactFreqForPhoneCall10Min:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAppContactFreqForPhoneCall10Min
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAppContactFreqForPhoneCall10Min:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int appContactFreqForPhoneCall10Min = a3;
}

- (void)deleteAppContactFreqForPhoneCall2Min
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasAppContactFreqForPhoneCall2Min:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasAppContactFreqForPhoneCall2Min
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setAppContactFreqForPhoneCall2Min:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int appContactFreqForPhoneCall2Min = a3;
}

- (void)deleteAppContactAffinityScoreForPhoneCallReceived
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasAppContactAffinityScoreForPhoneCallReceived:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAppContactAffinityScoreForPhoneCallReceived
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAppContactAffinityScoreForPhoneCallReceived:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_float appContactAffinityScoreForPhoneCallReceived = a3;
}

- (void)deleteAppContactAffinityScoreForPhoneCallUsingSiri
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasAppContactAffinityScoreForPhoneCallUsingSiri:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAppContactAffinityScoreForPhoneCallUsingSiri
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAppContactAffinityScoreForPhoneCallUsingSiri:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_float appContactAffinityScoreForPhoneCallUsingSiri = a3;
}

- (void)deleteAppContactAffinityScoreForPhoneCall
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasAppContactAffinityScoreForPhoneCall:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAppContactAffinityScoreForPhoneCall
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setAppContactAffinityScoreForPhoneCall:(float)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_float appContactAffinityScoreForPhoneCall = a3;
}

@end