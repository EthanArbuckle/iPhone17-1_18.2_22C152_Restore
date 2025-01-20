@interface MHSchemaMHVoiceTriggerFirstPassStatistic
- (BOOL)hasFirstPassPeakScoreHS;
- (BOOL)hasFirstPassPeakScoreJS;
- (BOOL)hasFirstPassTriggerSource;
- (BOOL)hasInvocationTypeId;
- (BOOL)hasKeywordThresholdHS;
- (BOOL)hasKeywordThresholdJS;
- (BOOL)hasMitigationScore;
- (BOOL)hasRecognizerScoreHS;
- (BOOL)hasRecognizerScoreJS;
- (BOOL)hasRepetitionSimilarityScore;
- (BOOL)hasSecondsSinceEpoch;
- (BOOL)hasTdSpeakerRecognizerCombinedScore;
- (BOOL)hasTdSpeakerRecognizerCombinedThresholdHS;
- (BOOL)hasTdSpeakerRecognizerCombinedThresholdJS;
- (BOOL)hasTriggerScoreHS;
- (BOOL)hasTriggerScoreJS;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHVoiceTriggerFirstPassStatistic)initWithDictionary:(id)a3;
- (MHSchemaMHVoiceTriggerFirstPassStatistic)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)firstPassPeakScoreHS;
- (float)firstPassPeakScoreJS;
- (float)keywordThresholdHS;
- (float)keywordThresholdJS;
- (float)mitigationScore;
- (float)recognizerScoreHS;
- (float)recognizerScoreJS;
- (float)repetitionSimilarityScore;
- (float)tdSpeakerRecognizerCombinedScore;
- (float)tdSpeakerRecognizerCombinedThresholdHS;
- (float)tdSpeakerRecognizerCombinedThresholdJS;
- (float)triggerScoreHS;
- (float)triggerScoreJS;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)firstPassTriggerSource;
- (int)invocationTypeId;
- (int64_t)secondsSinceEpoch;
- (unint64_t)hash;
- (void)deleteFirstPassPeakScoreHS;
- (void)deleteFirstPassPeakScoreJS;
- (void)deleteFirstPassTriggerSource;
- (void)deleteInvocationTypeId;
- (void)deleteKeywordThresholdHS;
- (void)deleteKeywordThresholdJS;
- (void)deleteMitigationScore;
- (void)deleteRecognizerScoreHS;
- (void)deleteRecognizerScoreJS;
- (void)deleteRepetitionSimilarityScore;
- (void)deleteSecondsSinceEpoch;
- (void)deleteTdSpeakerRecognizerCombinedScore;
- (void)deleteTdSpeakerRecognizerCombinedThresholdHS;
- (void)deleteTdSpeakerRecognizerCombinedThresholdJS;
- (void)deleteTriggerScoreHS;
- (void)deleteTriggerScoreJS;
- (void)setFirstPassPeakScoreHS:(float)a3;
- (void)setFirstPassPeakScoreJS:(float)a3;
- (void)setFirstPassTriggerSource:(int)a3;
- (void)setHasFirstPassPeakScoreHS:(BOOL)a3;
- (void)setHasFirstPassPeakScoreJS:(BOOL)a3;
- (void)setHasFirstPassTriggerSource:(BOOL)a3;
- (void)setHasInvocationTypeId:(BOOL)a3;
- (void)setHasKeywordThresholdHS:(BOOL)a3;
- (void)setHasKeywordThresholdJS:(BOOL)a3;
- (void)setHasMitigationScore:(BOOL)a3;
- (void)setHasRecognizerScoreHS:(BOOL)a3;
- (void)setHasRecognizerScoreJS:(BOOL)a3;
- (void)setHasRepetitionSimilarityScore:(BOOL)a3;
- (void)setHasSecondsSinceEpoch:(BOOL)a3;
- (void)setHasTdSpeakerRecognizerCombinedScore:(BOOL)a3;
- (void)setHasTdSpeakerRecognizerCombinedThresholdHS:(BOOL)a3;
- (void)setHasTdSpeakerRecognizerCombinedThresholdJS:(BOOL)a3;
- (void)setHasTriggerScoreHS:(BOOL)a3;
- (void)setHasTriggerScoreJS:(BOOL)a3;
- (void)setInvocationTypeId:(int)a3;
- (void)setKeywordThresholdHS:(float)a3;
- (void)setKeywordThresholdJS:(float)a3;
- (void)setMitigationScore:(float)a3;
- (void)setRecognizerScoreHS:(float)a3;
- (void)setRecognizerScoreJS:(float)a3;
- (void)setRepetitionSimilarityScore:(float)a3;
- (void)setSecondsSinceEpoch:(int64_t)a3;
- (void)setTdSpeakerRecognizerCombinedScore:(float)a3;
- (void)setTdSpeakerRecognizerCombinedThresholdHS:(float)a3;
- (void)setTdSpeakerRecognizerCombinedThresholdJS:(float)a3;
- (void)setTriggerScoreHS:(float)a3;
- (void)setTriggerScoreJS:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHVoiceTriggerFirstPassStatistic

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)tdSpeakerRecognizerCombinedThresholdJS
{
  return self->_tdSpeakerRecognizerCombinedThresholdJS;
}

- (float)tdSpeakerRecognizerCombinedThresholdHS
{
  return self->_tdSpeakerRecognizerCombinedThresholdHS;
}

- (float)keywordThresholdJS
{
  return self->_keywordThresholdJS;
}

- (float)keywordThresholdHS
{
  return self->_keywordThresholdHS;
}

- (float)tdSpeakerRecognizerCombinedScore
{
  return self->_tdSpeakerRecognizerCombinedScore;
}

- (float)repetitionSimilarityScore
{
  return self->_repetitionSimilarityScore;
}

- (int64_t)secondsSinceEpoch
{
  return self->_secondsSinceEpoch;
}

- (int)invocationTypeId
{
  return self->_invocationTypeId;
}

- (float)mitigationScore
{
  return self->_mitigationScore;
}

- (float)triggerScoreJS
{
  return self->_triggerScoreJS;
}

- (float)triggerScoreHS
{
  return self->_triggerScoreHS;
}

- (float)recognizerScoreJS
{
  return self->_recognizerScoreJS;
}

- (float)recognizerScoreHS
{
  return self->_recognizerScoreHS;
}

- (int)firstPassTriggerSource
{
  return self->_firstPassTriggerSource;
}

- (float)firstPassPeakScoreJS
{
  return self->_firstPassPeakScoreJS;
}

- (float)firstPassPeakScoreHS
{
  return self->_firstPassPeakScoreHS;
}

- (MHSchemaMHVoiceTriggerFirstPassStatistic)initWithDictionary:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MHSchemaMHVoiceTriggerFirstPassStatistic;
  v5 = [(MHSchemaMHVoiceTriggerFirstPassStatistic *)&v36 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"firstPassPeakScoreHS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setFirstPassPeakScoreHS:](v5, "setFirstPassPeakScoreHS:");
    }
    v7 = [v4 objectForKeyedSubscript:@"firstPassPeakScoreJS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setFirstPassPeakScoreJS:](v5, "setFirstPassPeakScoreJS:");
    }
    v8 = [v4 objectForKeyedSubscript:@"firstPassTriggerSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setFirstPassTriggerSource:](v5, "setFirstPassTriggerSource:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"recognizerScoreHS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setRecognizerScoreHS:](v5, "setRecognizerScoreHS:");
    }
    v32 = v8;
    v10 = [v4 objectForKeyedSubscript:@"recognizerScoreJS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setRecognizerScoreJS:](v5, "setRecognizerScoreJS:");
    }
    v11 = v7;
    v12 = [v4 objectForKeyedSubscript:@"triggerScoreHS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 floatValue];
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setTriggerScoreHS:](v5, "setTriggerScoreHS:");
    }
    v13 = v6;
    v14 = [v4 objectForKeyedSubscript:@"triggerScoreJS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setTriggerScoreJS:](v5, "setTriggerScoreJS:");
    }
    v15 = [v4 objectForKeyedSubscript:@"mitigationScore"];
    objc_opt_class();
    v35 = v15;
    if (objc_opt_isKindOfClass())
    {
      [v15 floatValue];
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setMitigationScore:](v5, "setMitigationScore:");
    }
    v34 = v13;
    v16 = [v4 objectForKeyedSubscript:@"invocationTypeId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setInvocationTypeId:](v5, "setInvocationTypeId:", [v16 intValue]);
    }
    v33 = v11;
    v17 = [v4 objectForKeyedSubscript:@"secondsSinceEpoch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setSecondsSinceEpoch:](v5, "setSecondsSinceEpoch:", [v17 longLongValue]);
    }
    v27 = v17;
    v18 = [v4 objectForKeyedSubscript:@"repetitionSimilarityScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 floatValue];
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setRepetitionSimilarityScore:](v5, "setRepetitionSimilarityScore:");
    }
    v31 = v9;
    v19 = [v4 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinedScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v19 floatValue];
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setTdSpeakerRecognizerCombinedScore:](v5, "setTdSpeakerRecognizerCombinedScore:");
    }
    v30 = v10;
    v20 = [v4 objectForKeyedSubscript:@"keywordThresholdHS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v20 floatValue];
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setKeywordThresholdHS:](v5, "setKeywordThresholdHS:");
    }
    v28 = v16;
    v29 = v12;
    v21 = [v4 objectForKeyedSubscript:@"keywordThresholdJS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v21 floatValue];
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setKeywordThresholdJS:](v5, "setKeywordThresholdJS:");
    }
    v22 = v14;
    v23 = [v4 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinedThresholdHS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v23 floatValue];
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setTdSpeakerRecognizerCombinedThresholdHS:](v5, "setTdSpeakerRecognizerCombinedThresholdHS:");
    }
    v24 = [v4 objectForKeyedSubscript:@"tdSpeakerRecognizerCombinedThresholdJS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v24 floatValue];
      -[MHSchemaMHVoiceTriggerFirstPassStatistic setTdSpeakerRecognizerCombinedThresholdJS:](v5, "setTdSpeakerRecognizerCombinedThresholdJS:");
    }
    v25 = v5;
  }
  return v5;
}

- (MHSchemaMHVoiceTriggerFirstPassStatistic)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self dictionaryRepresentation];
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
    v8 = NSNumber;
    [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self firstPassPeakScoreHS];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"firstPassPeakScoreHS"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = NSNumber;
  [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self firstPassPeakScoreJS];
  v11 = objc_msgSend(v10, "numberWithFloat:");
  [v3 setObject:v11 forKeyedSubscript:@"firstPassPeakScoreJS"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_23:
  unsigned int v12 = [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self firstPassTriggerSource] - 1;
  if (v12 > 9) {
    v13 = @"MHVOICETRIGGERFIRSTPASSSOURCE_UNKNOWN";
  }
  else {
    v13 = off_1E5EB1910[v12];
  }
  [v3 setObject:v13 forKeyedSubscript:@"firstPassTriggerSource"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[MHSchemaMHVoiceTriggerFirstPassStatistic invocationTypeId](self, "invocationTypeId"));
  [v3 setObject:v14 forKeyedSubscript:@"invocationTypeId"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  v15 = NSNumber;
  [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self keywordThresholdHS];
  v16 = objc_msgSend(v15, "numberWithFloat:");
  [v3 setObject:v16 forKeyedSubscript:@"keywordThresholdHS"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  v17 = NSNumber;
  [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self keywordThresholdJS];
  v18 = objc_msgSend(v17, "numberWithFloat:");
  [v3 setObject:v18 forKeyedSubscript:@"keywordThresholdJS"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  v19 = NSNumber;
  [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self mitigationScore];
  v20 = objc_msgSend(v19, "numberWithFloat:");
  [v3 setObject:v20 forKeyedSubscript:@"mitigationScore"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  v21 = NSNumber;
  [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self recognizerScoreHS];
  v22 = objc_msgSend(v21, "numberWithFloat:");
  [v3 setObject:v22 forKeyedSubscript:@"recognizerScoreHS"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  v23 = NSNumber;
  [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self recognizerScoreJS];
  v24 = objc_msgSend(v23, "numberWithFloat:");
  [v3 setObject:v24 forKeyedSubscript:@"recognizerScoreJS"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  v25 = NSNumber;
  [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self repetitionSimilarityScore];
  v26 = objc_msgSend(v25, "numberWithFloat:");
  [v3 setObject:v26 forKeyedSubscript:@"repetitionSimilarityScore"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  v27 = objc_msgSend(NSNumber, "numberWithLongLong:", -[MHSchemaMHVoiceTriggerFirstPassStatistic secondsSinceEpoch](self, "secondsSinceEpoch"));
  [v3 setObject:v27 forKeyedSubscript:@"secondsSinceEpoch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  v28 = NSNumber;
  [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self tdSpeakerRecognizerCombinedScore];
  v29 = objc_msgSend(v28, "numberWithFloat:");
  [v3 setObject:v29 forKeyedSubscript:@"tdSpeakerRecognizerCombinedScore"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_14:
    if ((has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  v30 = NSNumber;
  [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self tdSpeakerRecognizerCombinedThresholdHS];
  v31 = objc_msgSend(v30, "numberWithFloat:");
  [v3 setObject:v31 forKeyedSubscript:@"tdSpeakerRecognizerCombinedThresholdHS"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x8000) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  v32 = NSNumber;
  [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self tdSpeakerRecognizerCombinedThresholdJS];
  v33 = objc_msgSend(v32, "numberWithFloat:");
  [v3 setObject:v33 forKeyedSubscript:@"tdSpeakerRecognizerCombinedThresholdJS"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_16:
    if ((has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_38:
  v34 = NSNumber;
  [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self triggerScoreHS];
  v35 = objc_msgSend(v34, "numberWithFloat:");
  [v3 setObject:v35 forKeyedSubscript:@"triggerScoreHS"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_17:
    v5 = NSNumber;
    [(MHSchemaMHVoiceTriggerFirstPassStatistic *)self triggerScoreJS];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"triggerScoreJS"];
  }
LABEL_18:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    float firstPassPeakScoreHS = self->_firstPassPeakScoreHS;
    double v6 = firstPassPeakScoreHS;
    if (firstPassPeakScoreHS < 0.0) {
      double v6 = -firstPassPeakScoreHS;
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
    float firstPassPeakScoreJS = self->_firstPassPeakScoreJS;
    double v11 = firstPassPeakScoreJS;
    if (firstPassPeakScoreJS < 0.0) {
      double v11 = -firstPassPeakScoreJS;
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
    uint64_t v80 = 2654435761 * self->_firstPassTriggerSource;
    if ((has & 8) != 0) {
      goto LABEL_19;
    }
LABEL_24:
    unint64_t v18 = 0;
    goto LABEL_25;
  }
  uint64_t v80 = 0;
  if ((has & 8) == 0) {
    goto LABEL_24;
  }
LABEL_19:
  float recognizerScoreHS = self->_recognizerScoreHS;
  double v15 = recognizerScoreHS;
  if (recognizerScoreHS < 0.0) {
    double v15 = -recognizerScoreHS;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_25:
  if ((has & 0x10) != 0)
  {
    float recognizerScoreJS = self->_recognizerScoreJS;
    double v21 = recognizerScoreJS;
    if (recognizerScoreJS < 0.0) {
      double v21 = -recognizerScoreJS;
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
  if ((has & 0x20) != 0)
  {
    float triggerScoreHS = self->_triggerScoreHS;
    double v26 = triggerScoreHS;
    if (triggerScoreHS < 0.0) {
      double v26 = -triggerScoreHS;
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
  if ((has & 0x40) != 0)
  {
    float triggerScoreJS = self->_triggerScoreJS;
    double v31 = triggerScoreJS;
    if (triggerScoreJS < 0.0) {
      double v31 = -triggerScoreJS;
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
  if ((has & 0x80) != 0)
  {
    float mitigationScore = self->_mitigationScore;
    double v36 = mitigationScore;
    if (mitigationScore < 0.0) {
      double v36 = -mitigationScore;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((has & 0x100) != 0)
  {
    uint64_t v79 = 2654435761 * self->_invocationTypeId;
    if ((has & 0x200) != 0)
    {
LABEL_61:
      uint64_t v78 = 2654435761 * self->_secondsSinceEpoch;
      if ((has & 0x400) != 0) {
        goto LABEL_62;
      }
LABEL_68:
      unint64_t v84 = 0;
      goto LABEL_72;
    }
  }
  else
  {
    uint64_t v79 = 0;
    if ((has & 0x200) != 0) {
      goto LABEL_61;
    }
  }
  uint64_t v78 = 0;
  if ((has & 0x400) == 0) {
    goto LABEL_68;
  }
LABEL_62:
  float repetitionSimilarityScore = self->_repetitionSimilarityScore;
  double v40 = repetitionSimilarityScore;
  if (repetitionSimilarityScore < 0.0) {
    double v40 = -repetitionSimilarityScore;
  }
  long double v41 = floor(v40 + 0.5);
  double v42 = (v40 - v41) * 1.84467441e19;
  double v43 = fmod(v41, 1.84467441e19);
  if (v42 >= 0.0)
  {
    unint64_t v84 = 2654435761u * (unint64_t)v43;
    if (v42 <= 0.0) {
      goto LABEL_72;
    }
    unint64_t v44 = v84 + (unint64_t)v42;
  }
  else
  {
    unint64_t v44 = 2654435761u * (unint64_t)v43 - (unint64_t)fabs(v42);
  }
  unint64_t v84 = v44;
LABEL_72:
  if ((has & 0x800) == 0)
  {
    unint64_t v83 = 0;
    goto LABEL_81;
  }
  float tdSpeakerRecognizerCombinedScore = self->_tdSpeakerRecognizerCombinedScore;
  double v46 = tdSpeakerRecognizerCombinedScore;
  if (tdSpeakerRecognizerCombinedScore < 0.0) {
    double v46 = -tdSpeakerRecognizerCombinedScore;
  }
  long double v47 = floor(v46 + 0.5);
  double v48 = (v46 - v47) * 1.84467441e19;
  double v49 = fmod(v47, 1.84467441e19);
  if (v48 >= 0.0)
  {
    unint64_t v83 = 2654435761u * (unint64_t)v49;
    if (v48 <= 0.0) {
      goto LABEL_81;
    }
    unint64_t v50 = v83 + (unint64_t)v48;
  }
  else
  {
    unint64_t v50 = 2654435761u * (unint64_t)v49 - (unint64_t)fabs(v48);
  }
  unint64_t v83 = v50;
LABEL_81:
  unint64_t v81 = v29;
  v85 = self;
  if ((has & 0x1000) != 0)
  {
    float keywordThresholdHS = self->_keywordThresholdHS;
    double v53 = keywordThresholdHS;
    if (keywordThresholdHS < 0.0) {
      double v53 = -keywordThresholdHS;
    }
    long double v54 = floor(v53 + 0.5);
    double v55 = (v53 - v54) * 1.84467441e19;
    unint64_t v51 = 2654435761u * (unint64_t)fmod(v54, 1.84467441e19);
    if (v55 >= 0.0)
    {
      if (v55 > 0.0) {
        v51 += (unint64_t)v55;
      }
    }
    else
    {
      v51 -= (unint64_t)fabs(v55);
    }
  }
  else
  {
    unint64_t v51 = 0;
  }
  unint64_t v82 = v4;
  if ((has & 0x2000) != 0)
  {
    float keywordThresholdJS = v85->_keywordThresholdJS;
    double v58 = keywordThresholdJS;
    if (keywordThresholdJS < 0.0) {
      double v58 = -keywordThresholdJS;
    }
    long double v59 = floor(v58 + 0.5);
    double v60 = (v58 - v59) * 1.84467441e19;
    unint64_t v56 = 2654435761u * (unint64_t)fmod(v59, 1.84467441e19);
    if (v60 >= 0.0)
    {
      if (v60 > 0.0) {
        v56 += (unint64_t)v60;
      }
    }
    else
    {
      v56 -= (unint64_t)fabs(v60);
    }
  }
  else
  {
    unint64_t v56 = 0;
  }
  unint64_t v61 = v34;
  unint64_t v62 = v19;
  unint64_t v63 = v18;
  if ((has & 0x4000) != 0)
  {
    unint64_t v64 = v9;
    float tdSpeakerRecognizerCombinedThresholdHS = v85->_tdSpeakerRecognizerCombinedThresholdHS;
    double v67 = tdSpeakerRecognizerCombinedThresholdHS;
    if (tdSpeakerRecognizerCombinedThresholdHS < 0.0) {
      double v67 = -tdSpeakerRecognizerCombinedThresholdHS;
    }
    long double v68 = floor(v67 + 0.5);
    double v69 = (v67 - v68) * 1.84467441e19;
    unint64_t v65 = 2654435761u * (unint64_t)fmod(v68, 1.84467441e19);
    if (v69 >= 0.0)
    {
      if (v69 > 0.0) {
        v65 += (unint64_t)v69;
      }
    }
    else
    {
      v65 -= (unint64_t)fabs(v69);
    }
  }
  else
  {
    unint64_t v64 = v9;
    unint64_t v65 = 0;
  }
  if ((has & 0x8000) == 0)
  {
    unint64_t v70 = 0;
LABEL_111:
    unint64_t v76 = v83;
    unint64_t v75 = v84;
    return v64 ^ v82 ^ v80 ^ v63 ^ v62 ^ v24 ^ v81 ^ v61 ^ v79 ^ v78 ^ v75 ^ v76 ^ v51 ^ v56 ^ v65 ^ v70;
  }
  float tdSpeakerRecognizerCombinedThresholdJS = v85->_tdSpeakerRecognizerCombinedThresholdJS;
  double v72 = tdSpeakerRecognizerCombinedThresholdJS;
  if (tdSpeakerRecognizerCombinedThresholdJS < 0.0) {
    double v72 = -tdSpeakerRecognizerCombinedThresholdJS;
  }
  long double v73 = floor(v72 + 0.5);
  double v74 = (v72 - v73) * 1.84467441e19;
  unint64_t v70 = 2654435761u * (unint64_t)fmod(v73, 1.84467441e19);
  if (v74 < 0.0)
  {
    v70 -= (unint64_t)fabs(v74);
    goto LABEL_111;
  }
  unint64_t v76 = v83;
  unint64_t v75 = v84;
  if (v74 > 0.0) {
    v70 += (unint64_t)v74;
  }
  return v64 ^ v82 ^ v80 ^ v63 ^ v62 ^ v24 ^ v81 ^ v61 ^ v79 ^ v78 ^ v75 ^ v76 ^ v51 ^ v56 ^ v65 ^ v70;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_65;
  }
  $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_65;
  }
  if (*(unsigned char *)&has)
  {
    float firstPassPeakScoreHS = self->_firstPassPeakScoreHS;
    [v4 firstPassPeakScoreHS];
    if (firstPassPeakScoreHS != v8) {
      goto LABEL_65;
    }
    $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      float firstPassPeakScoreJS = self->_firstPassPeakScoreJS;
      [v4 firstPassPeakScoreJS];
      if (firstPassPeakScoreJS != v11) {
        goto LABEL_65;
      }
      $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
      unsigned int v6 = v4[40];
    }
    int v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (v12)
      {
        int firstPassTriggerSource = self->_firstPassTriggerSource;
        if (firstPassTriggerSource != [v4 firstPassTriggerSource]) {
          goto LABEL_65;
        }
        $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
        unsigned int v6 = v4[40];
      }
      int v14 = (*(unsigned int *)&has >> 3) & 1;
      if (v14 == ((v6 >> 3) & 1))
      {
        if (v14)
        {
          float recognizerScoreHS = self->_recognizerScoreHS;
          [v4 recognizerScoreHS];
          if (recognizerScoreHS != v16) {
            goto LABEL_65;
          }
          $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
          unsigned int v6 = v4[40];
        }
        int v17 = (*(unsigned int *)&has >> 4) & 1;
        if (v17 == ((v6 >> 4) & 1))
        {
          if (v17)
          {
            float recognizerScoreJS = self->_recognizerScoreJS;
            [v4 recognizerScoreJS];
            if (recognizerScoreJS != v19) {
              goto LABEL_65;
            }
            $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
            unsigned int v6 = v4[40];
          }
          int v20 = (*(unsigned int *)&has >> 5) & 1;
          if (v20 == ((v6 >> 5) & 1))
          {
            if (v20)
            {
              float triggerScoreHS = self->_triggerScoreHS;
              [v4 triggerScoreHS];
              if (triggerScoreHS != v22) {
                goto LABEL_65;
              }
              $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
              unsigned int v6 = v4[40];
            }
            int v23 = (*(unsigned int *)&has >> 6) & 1;
            if (v23 == ((v6 >> 6) & 1))
            {
              if (v23)
              {
                float triggerScoreJS = self->_triggerScoreJS;
                [v4 triggerScoreJS];
                if (triggerScoreJS != v25) {
                  goto LABEL_65;
                }
                $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
                unsigned int v6 = v4[40];
              }
              int v26 = (*(unsigned int *)&has >> 7) & 1;
              if (v26 == ((v6 >> 7) & 1))
              {
                if (v26)
                {
                  float mitigationScore = self->_mitigationScore;
                  [v4 mitigationScore];
                  if (mitigationScore != v28) {
                    goto LABEL_65;
                  }
                  $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
                  unsigned int v6 = v4[40];
                }
                int v29 = (*(unsigned int *)&has >> 8) & 1;
                if (v29 == ((v6 >> 8) & 1))
                {
                  if (v29)
                  {
                    int invocationTypeId = self->_invocationTypeId;
                    if (invocationTypeId != [v4 invocationTypeId]) {
                      goto LABEL_65;
                    }
                    $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
                    unsigned int v6 = v4[40];
                  }
                  int v31 = (*(unsigned int *)&has >> 9) & 1;
                  if (v31 == ((v6 >> 9) & 1))
                  {
                    if (v31)
                    {
                      int64_t secondsSinceEpoch = self->_secondsSinceEpoch;
                      if (secondsSinceEpoch != [v4 secondsSinceEpoch]) {
                        goto LABEL_65;
                      }
                      $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
                      unsigned int v6 = v4[40];
                    }
                    int v33 = (*(unsigned int *)&has >> 10) & 1;
                    if (v33 == ((v6 >> 10) & 1))
                    {
                      if (v33)
                      {
                        float repetitionSimilarityScore = self->_repetitionSimilarityScore;
                        [v4 repetitionSimilarityScore];
                        if (repetitionSimilarityScore != v35) {
                          goto LABEL_65;
                        }
                        $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
                        unsigned int v6 = v4[40];
                      }
                      int v36 = (*(unsigned int *)&has >> 11) & 1;
                      if (v36 == ((v6 >> 11) & 1))
                      {
                        if (v36)
                        {
                          float tdSpeakerRecognizerCombinedScore = self->_tdSpeakerRecognizerCombinedScore;
                          [v4 tdSpeakerRecognizerCombinedScore];
                          if (tdSpeakerRecognizerCombinedScore != v38) {
                            goto LABEL_65;
                          }
                          $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
                          unsigned int v6 = v4[40];
                        }
                        int v39 = (*(unsigned int *)&has >> 12) & 1;
                        if (v39 == ((v6 >> 12) & 1))
                        {
                          if (v39)
                          {
                            float keywordThresholdHS = self->_keywordThresholdHS;
                            [v4 keywordThresholdHS];
                            if (keywordThresholdHS != v41) {
                              goto LABEL_65;
                            }
                            $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
                            unsigned int v6 = v4[40];
                          }
                          int v42 = (*(unsigned int *)&has >> 13) & 1;
                          if (v42 == ((v6 >> 13) & 1))
                          {
                            if (v42)
                            {
                              float keywordThresholdJS = self->_keywordThresholdJS;
                              [v4 keywordThresholdJS];
                              if (keywordThresholdJS != v44) {
                                goto LABEL_65;
                              }
                              $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
                              unsigned int v6 = v4[40];
                            }
                            int v45 = (*(unsigned int *)&has >> 14) & 1;
                            if (v45 == ((v6 >> 14) & 1))
                            {
                              if (v45)
                              {
                                float tdSpeakerRecognizerCombinedThresholdHS = self->_tdSpeakerRecognizerCombinedThresholdHS;
                                [v4 tdSpeakerRecognizerCombinedThresholdHS];
                                if (tdSpeakerRecognizerCombinedThresholdHS != v47) {
                                  goto LABEL_65;
                                }
                                $BDD9DD6230064E189ACABF0793086A9C has = self->_has;
                                unsigned int v6 = v4[40];
                              }
                              if (((v6 ^ *(_DWORD *)&has) & 0x8000) == 0)
                              {
                                if ((*(_WORD *)&has & 0x8000) == 0
                                  || (float tdSpeakerRecognizerCombinedThresholdJS = self->_tdSpeakerRecognizerCombinedThresholdJS,
                                      [v4 tdSpeakerRecognizerCombinedThresholdJS],
                                      tdSpeakerRecognizerCombinedThresholdJS == v49))
                                {
                                  BOOL v50 = 1;
                                  goto LABEL_66;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_65:
  BOOL v50 = 0;
LABEL_66:

  return v50;
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
      goto LABEL_22;
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
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_14:
    if ((has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_15:
    if ((has & 0x4000) == 0) {
      goto LABEL_16;
    }
LABEL_34:
    PBDataWriterWriteFloatField();
    if ((*(_WORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_33:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) != 0) {
    goto LABEL_34;
  }
LABEL_16:
  if ((has & 0x8000) == 0) {
    goto LABEL_17;
  }
LABEL_35:
  PBDataWriterWriteFloatField();
LABEL_17:
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHVoiceTriggerFirstPassStatisticReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteTdSpeakerRecognizerCombinedThresholdJS
{
  *(_WORD *)&self->_has &= ~0x8000u;
}

- (void)setHasTdSpeakerRecognizerCombinedThresholdJS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasTdSpeakerRecognizerCombinedThresholdJS
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setTdSpeakerRecognizerCombinedThresholdJS:(float)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_float tdSpeakerRecognizerCombinedThresholdJS = a3;
}

- (void)deleteTdSpeakerRecognizerCombinedThresholdHS
{
  *(_WORD *)&self->_has &= ~0x4000u;
}

- (void)setHasTdSpeakerRecognizerCombinedThresholdHS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedThresholdHS
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setTdSpeakerRecognizerCombinedThresholdHS:(float)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_float tdSpeakerRecognizerCombinedThresholdHS = a3;
}

- (void)deleteKeywordThresholdJS
{
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (void)setHasKeywordThresholdJS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasKeywordThresholdJS
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setKeywordThresholdJS:(float)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_float keywordThresholdJS = a3;
}

- (void)deleteKeywordThresholdHS
{
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setHasKeywordThresholdHS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasKeywordThresholdHS
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setKeywordThresholdHS:(float)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_float keywordThresholdHS = a3;
}

- (void)deleteTdSpeakerRecognizerCombinedScore
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasTdSpeakerRecognizerCombinedScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTdSpeakerRecognizerCombinedScore
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTdSpeakerRecognizerCombinedScore:(float)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_float tdSpeakerRecognizerCombinedScore = a3;
}

- (void)deleteRepetitionSimilarityScore
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasRepetitionSimilarityScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRepetitionSimilarityScore
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRepetitionSimilarityScore:(float)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_float repetitionSimilarityScore = a3;
}

- (void)deleteSecondsSinceEpoch
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasSecondsSinceEpoch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSecondsSinceEpoch
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSecondsSinceEpoch:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int64_t secondsSinceEpoch = a3;
}

- (void)deleteInvocationTypeId
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasInvocationTypeId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasInvocationTypeId
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setInvocationTypeId:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int invocationTypeId = a3;
}

- (void)deleteMitigationScore
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasMitigationScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMitigationScore
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setMitigationScore:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_float mitigationScore = a3;
}

- (void)deleteTriggerScoreJS
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasTriggerScoreJS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTriggerScoreJS
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTriggerScoreJS:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_float triggerScoreJS = a3;
}

- (void)deleteTriggerScoreHS
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasTriggerScoreHS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTriggerScoreHS
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTriggerScoreHS:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_float triggerScoreHS = a3;
}

- (void)deleteRecognizerScoreJS
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasRecognizerScoreJS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRecognizerScoreJS
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRecognizerScoreJS:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_float recognizerScoreJS = a3;
}

- (void)deleteRecognizerScoreHS
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasRecognizerScoreHS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRecognizerScoreHS
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setRecognizerScoreHS:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_float recognizerScoreHS = a3;
}

- (void)deleteFirstPassTriggerSource
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasFirstPassTriggerSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFirstPassTriggerSource
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setFirstPassTriggerSource:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int firstPassTriggerSource = a3;
}

- (void)deleteFirstPassPeakScoreJS
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasFirstPassPeakScoreJS:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasFirstPassPeakScoreJS
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setFirstPassPeakScoreJS:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_float firstPassPeakScoreJS = a3;
}

- (void)deleteFirstPassPeakScoreHS
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasFirstPassPeakScoreHS:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasFirstPassPeakScoreHS
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setFirstPassPeakScoreHS:(float)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_float firstPassPeakScoreHS = a3;
}

@end