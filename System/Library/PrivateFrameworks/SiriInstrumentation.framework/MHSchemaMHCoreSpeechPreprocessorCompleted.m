@interface MHSchemaMHCoreSpeechPreprocessorCompleted
- (BOOL)hasAboveNinetyFivepcOfMax;
- (BOOL)hasAbsMaxVal;
- (BOOL)hasBeepLocation;
- (BOOL)hasBeepPower;
- (BOOL)hasInitialContinousZeros;
- (BOOL)hasMaxContinousZeros;
- (BOOL)hasNumTotalInputSamples;
- (BOOL)hasNumTotalOutputSamples;
- (BOOL)hasOriginalPower;
- (BOOL)hasSignalPower;
- (BOOL)hasStatsComputed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHCoreSpeechPreprocessorCompleted)initWithDictionary:(id)a3;
- (MHSchemaMHCoreSpeechPreprocessorCompleted)initWithJSON:(id)a3;
- (NSArray)midSegmentContinousZeros;
- (NSData)jsonData;
- (float)aboveNinetyFivepcOfMax;
- (float)absMaxVal;
- (float)beepPower;
- (float)originalPower;
- (float)signalPower;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)midSegmentContinousZerosAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)beepLocation;
- (int)statsComputed;
- (unint64_t)hash;
- (unint64_t)initialContinousZeros;
- (unint64_t)maxContinousZeros;
- (unint64_t)midSegmentContinousZerosCount;
- (unint64_t)numTotalInputSamples;
- (unint64_t)numTotalOutputSamples;
- (void)addMidSegmentContinousZeros:(id)a3;
- (void)clearMidSegmentContinousZeros;
- (void)deleteAboveNinetyFivepcOfMax;
- (void)deleteAbsMaxVal;
- (void)deleteBeepLocation;
- (void)deleteBeepPower;
- (void)deleteInitialContinousZeros;
- (void)deleteMaxContinousZeros;
- (void)deleteNumTotalInputSamples;
- (void)deleteNumTotalOutputSamples;
- (void)deleteOriginalPower;
- (void)deleteSignalPower;
- (void)deleteStatsComputed;
- (void)setAboveNinetyFivepcOfMax:(float)a3;
- (void)setAbsMaxVal:(float)a3;
- (void)setBeepLocation:(int)a3;
- (void)setBeepPower:(float)a3;
- (void)setHasAboveNinetyFivepcOfMax:(BOOL)a3;
- (void)setHasAbsMaxVal:(BOOL)a3;
- (void)setHasBeepLocation:(BOOL)a3;
- (void)setHasBeepPower:(BOOL)a3;
- (void)setHasInitialContinousZeros:(BOOL)a3;
- (void)setHasMaxContinousZeros:(BOOL)a3;
- (void)setHasNumTotalInputSamples:(BOOL)a3;
- (void)setHasNumTotalOutputSamples:(BOOL)a3;
- (void)setHasOriginalPower:(BOOL)a3;
- (void)setHasSignalPower:(BOOL)a3;
- (void)setHasStatsComputed:(BOOL)a3;
- (void)setInitialContinousZeros:(unint64_t)a3;
- (void)setMaxContinousZeros:(unint64_t)a3;
- (void)setMidSegmentContinousZeros:(id)a3;
- (void)setNumTotalInputSamples:(unint64_t)a3;
- (void)setNumTotalOutputSamples:(unint64_t)a3;
- (void)setOriginalPower:(float)a3;
- (void)setSignalPower:(float)a3;
- (void)setStatsComputed:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHCoreSpeechPreprocessorCompleted

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MHSchemaMHCoreSpeechPreprocessorCompleted;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(MHSchemaMHCoreSpeechPreprocessorCompleted *)self midSegmentContinousZeros];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(MHSchemaMHCoreSpeechPreprocessorCompleted *)self setMidSegmentContinousZeros:v7];
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

- (void)setMidSegmentContinousZeros:(id)a3
{
}

- (NSArray)midSegmentContinousZeros
{
  return self->_midSegmentContinousZeros;
}

- (unint64_t)maxContinousZeros
{
  return self->_maxContinousZeros;
}

- (unint64_t)initialContinousZeros
{
  return self->_initialContinousZeros;
}

- (unint64_t)numTotalOutputSamples
{
  return self->_numTotalOutputSamples;
}

- (unint64_t)numTotalInputSamples
{
  return self->_numTotalInputSamples;
}

- (float)aboveNinetyFivepcOfMax
{
  return self->_aboveNinetyFivepcOfMax;
}

- (float)absMaxVal
{
  return self->_absMaxVal;
}

- (float)originalPower
{
  return self->_originalPower;
}

- (float)signalPower
{
  return self->_signalPower;
}

- (float)beepPower
{
  return self->_beepPower;
}

- (int)statsComputed
{
  return self->_statsComputed;
}

- (int)beepLocation
{
  return self->_beepLocation;
}

- (MHSchemaMHCoreSpeechPreprocessorCompleted)initWithDictionary:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)MHSchemaMHCoreSpeechPreprocessorCompleted;
  v5 = [(MHSchemaMHCoreSpeechPreprocessorCompleted *)&v46 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"beepLocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setBeepLocation:](v5, "setBeepLocation:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"statsComputed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setStatsComputed:](v5, "setStatsComputed:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"beepPower"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setBeepPower:](v5, "setBeepPower:");
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"signalPower"];
    objc_opt_class();
    v41 = v9;
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setSignalPower:](v5, "setSignalPower:");
    }
    v10 = [v4 objectForKeyedSubscript:@"originalPower"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 floatValue];
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setOriginalPower:](v5, "setOriginalPower:");
    }
    v40 = v7;
    v11 = [v4 objectForKeyedSubscript:@"absMaxVal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setAbsMaxVal:](v5, "setAbsMaxVal:");
    }
    v12 = v6;
    v13 = [v4 objectForKeyedSubscript:@"aboveNinetyFivepcOfMax"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 floatValue];
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setAboveNinetyFivepcOfMax:](v5, "setAboveNinetyFivepcOfMax:");
    }
    v14 = [v4 objectForKeyedSubscript:@"numTotalInputSamples"];
    objc_opt_class();
    v39 = v14;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setNumTotalInputSamples:](v5, "setNumTotalInputSamples:", [v14 unsignedLongLongValue]);
    }
    uint64_t v15 = [v4 objectForKeyedSubscript:@"numTotalOutputSamples"];
    objc_opt_class();
    v38 = (void *)v15;
    v16 = v12;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setNumTotalOutputSamples:](v5, "setNumTotalOutputSamples:", [v38 unsignedLongLongValue]);
    }
    v17 = v8;
    uint64_t v18 = [v4 objectForKeyedSubscript:@"initialContinousZeros"];
    objc_opt_class();
    v37 = (void *)v18;
    v19 = v40;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setInitialContinousZeros:](v5, "setInitialContinousZeros:", [v37 unsignedLongLongValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"maxContinousZeros"];
    objc_opt_class();
    v36 = v20;
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHCoreSpeechPreprocessorCompleted setMaxContinousZeros:](v5, "setMaxContinousZeros:", [v20 unsignedLongLongValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"midSegmentContinousZeros"];
    objc_opt_class();
    v22 = v41;
    if (objc_opt_isKindOfClass())
    {
      v32 = v13;
      v33 = v11;
      v34 = v10;
      v35 = v17;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v23 = v21;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v47 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v43 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v29 = [[MHSchemaMHCoreSpeechZeroFilterRunPair alloc] initWithDictionary:v28];
              [(MHSchemaMHCoreSpeechPreprocessorCompleted *)v5 addMidSegmentContinousZeros:v29];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v47 count:16];
        }
        while (v25);
      }

      v17 = v35;
      v19 = v40;
      v22 = v41;
      v11 = v33;
      v10 = v34;
      v13 = v32;
    }
    v30 = v5;
  }
  return v5;
}

- (MHSchemaMHCoreSpeechPreprocessorCompleted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHCoreSpeechPreprocessorCompleted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHCoreSpeechPreprocessorCompleted *)self dictionaryRepresentation];
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
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v17 = NSNumber;
    [(MHSchemaMHCoreSpeechPreprocessorCompleted *)self aboveNinetyFivepcOfMax];
    uint64_t v18 = objc_msgSend(v17, "numberWithFloat:");
    [v3 setObject:v18 forKeyedSubscript:@"aboveNinetyFivepcOfMax"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_31;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v19 = NSNumber;
  [(MHSchemaMHCoreSpeechPreprocessorCompleted *)self absMaxVal];
  v20 = objc_msgSend(v19, "numberWithFloat:");
  [v3 setObject:v20 forKeyedSubscript:@"absMaxVal"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
LABEL_31:
  v21 = objc_msgSend(NSNumber, "numberWithInt:", -[MHSchemaMHCoreSpeechPreprocessorCompleted beepLocation](self, "beepLocation"));
  [v3 setObject:v21 forKeyedSubscript:@"beepLocation"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x200) == 0) {
      goto LABEL_6;
    }
    goto LABEL_33;
  }
LABEL_32:
  v22 = NSNumber;
  [(MHSchemaMHCoreSpeechPreprocessorCompleted *)self beepPower];
  id v23 = objc_msgSend(v22, "numberWithFloat:");
  [v3 setObject:v23 forKeyedSubscript:@"beepPower"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_33:
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHCoreSpeechPreprocessorCompleted initialContinousZeros](self, "initialContinousZeros"));
  [v3 setObject:v24 forKeyedSubscript:@"initialContinousZeros"];

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHCoreSpeechPreprocessorCompleted maxContinousZeros](self, "maxContinousZeros"));
    [v3 setObject:v5 forKeyedSubscript:@"maxContinousZeros"];
  }
LABEL_8:
  if ([(NSArray *)self->_midSegmentContinousZeros count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v7 = self->_midSegmentContinousZeros;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"midSegmentContinousZeros"];
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x80) != 0)
  {
    uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHCoreSpeechPreprocessorCompleted numTotalInputSamples](self, "numTotalInputSamples"));
    [v3 setObject:v25 forKeyedSubscript:@"numTotalInputSamples"];

    __int16 v14 = (__int16)self->_has;
    if ((v14 & 0x100) == 0)
    {
LABEL_22:
      if ((v14 & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_22;
  }
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHCoreSpeechPreprocessorCompleted numTotalOutputSamples](self, "numTotalOutputSamples"));
  [v3 setObject:v26 forKeyedSubscript:@"numTotalOutputSamples"];

  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x10) == 0)
  {
LABEL_23:
    if ((v14 & 8) == 0) {
      goto LABEL_24;
    }
    goto LABEL_38;
  }
LABEL_37:
  v27 = NSNumber;
  [(MHSchemaMHCoreSpeechPreprocessorCompleted *)self originalPower];
  uint64_t v28 = objc_msgSend(v27, "numberWithFloat:");
  [v3 setObject:v28 forKeyedSubscript:@"originalPower"];

  __int16 v14 = (__int16)self->_has;
  if ((v14 & 8) == 0)
  {
LABEL_24:
    if ((v14 & 2) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_38:
  v29 = NSNumber;
  [(MHSchemaMHCoreSpeechPreprocessorCompleted *)self signalPower];
  v30 = objc_msgSend(v29, "numberWithFloat:");
  [v3 setObject:v30 forKeyedSubscript:@"signalPower"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_25:
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithInt:", -[MHSchemaMHCoreSpeechPreprocessorCompleted statsComputed](self, "statsComputed"));
    [v3 setObject:v15 forKeyedSubscript:@"statsComputed"];
  }
LABEL_26:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v5 = 0;
    if ((has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v10 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = 2654435761 * self->_beepLocation;
  if ((has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_statsComputed;
  if ((has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  float beepPower = self->_beepPower;
  double v7 = beepPower;
  if (beepPower < 0.0) {
    double v7 = -beepPower;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((has & 8) != 0)
  {
    float signalPower = self->_signalPower;
    double v13 = signalPower;
    if (signalPower < 0.0) {
      double v13 = -signalPower;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((has & 0x10) != 0)
  {
    float originalPower = self->_originalPower;
    double v18 = originalPower;
    if (originalPower < 0.0) {
      double v18 = -originalPower;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  if ((has & 0x20) != 0)
  {
    float absMaxVal = self->_absMaxVal;
    double v23 = absMaxVal;
    if (absMaxVal < 0.0) {
      double v23 = -absMaxVal;
    }
    long double v24 = floor(v23 + 0.5);
    double v25 = (v23 - v24) * 1.84467441e19;
    unint64_t v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0) {
        v21 += (unint64_t)v25;
      }
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    unint64_t v21 = 0;
  }
  if ((has & 0x40) != 0)
  {
    float aboveNinetyFivepcOfMax = self->_aboveNinetyFivepcOfMax;
    double v28 = aboveNinetyFivepcOfMax;
    if (aboveNinetyFivepcOfMax < 0.0) {
      double v28 = -aboveNinetyFivepcOfMax;
    }
    long double v29 = floor(v28 + 0.5);
    double v30 = (v28 - v29) * 1.84467441e19;
    unint64_t v26 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
    if (v30 >= 0.0)
    {
      if (v30 > 0.0) {
        v26 += (unint64_t)v30;
      }
    }
    else
    {
      v26 -= (unint64_t)fabs(v30);
    }
  }
  else
  {
    unint64_t v26 = 0;
  }
  if ((has & 0x80) != 0)
  {
    unint64_t v31 = 2654435761u * self->_numTotalInputSamples;
    if ((has & 0x100) != 0)
    {
LABEL_47:
      unint64_t v32 = 2654435761u * self->_numTotalOutputSamples;
      if ((has & 0x200) != 0) {
        goto LABEL_48;
      }
LABEL_52:
      unint64_t v33 = 0;
      if ((has & 0x400) != 0) {
        goto LABEL_49;
      }
LABEL_53:
      unint64_t v34 = 0;
      return v5 ^ v4 ^ v10 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31 ^ v32 ^ v33 ^ v34 ^ [(NSArray *)self->_midSegmentContinousZeros hash];
    }
  }
  else
  {
    unint64_t v31 = 0;
    if ((has & 0x100) != 0) {
      goto LABEL_47;
    }
  }
  unint64_t v32 = 0;
  if ((has & 0x200) == 0) {
    goto LABEL_52;
  }
LABEL_48:
  unint64_t v33 = 2654435761u * self->_initialContinousZeros;
  if ((has & 0x400) == 0) {
    goto LABEL_53;
  }
LABEL_49:
  unint64_t v34 = 2654435761u * self->_maxContinousZeros;
  return v5 ^ v4 ^ v10 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31 ^ v32 ^ v33 ^ v34 ^ [(NSArray *)self->_midSegmentContinousZeros hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_50;
  }
  $773EC1EEAAFF0EF4D71FA85389E340B7 has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_50;
  }
  if (*(unsigned char *)&has)
  {
    int beepLocation = self->_beepLocation;
    if (beepLocation != [v4 beepLocation]) {
      goto LABEL_50;
    }
    $773EC1EEAAFF0EF4D71FA85389E340B7 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int statsComputed = self->_statsComputed;
      if (statsComputed != [v4 statsComputed]) {
        goto LABEL_50;
      }
      $773EC1EEAAFF0EF4D71FA85389E340B7 has = self->_has;
      unsigned int v6 = v4[40];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        float beepPower = self->_beepPower;
        [v4 beepPower];
        if (beepPower != v12) {
          goto LABEL_50;
        }
        $773EC1EEAAFF0EF4D71FA85389E340B7 has = self->_has;
        unsigned int v6 = v4[40];
      }
      int v13 = (*(unsigned int *)&has >> 3) & 1;
      if (v13 == ((v6 >> 3) & 1))
      {
        if (v13)
        {
          float signalPower = self->_signalPower;
          [v4 signalPower];
          if (signalPower != v15) {
            goto LABEL_50;
          }
          $773EC1EEAAFF0EF4D71FA85389E340B7 has = self->_has;
          unsigned int v6 = v4[40];
        }
        int v16 = (*(unsigned int *)&has >> 4) & 1;
        if (v16 == ((v6 >> 4) & 1))
        {
          if (v16)
          {
            float originalPower = self->_originalPower;
            [v4 originalPower];
            if (originalPower != v18) {
              goto LABEL_50;
            }
            $773EC1EEAAFF0EF4D71FA85389E340B7 has = self->_has;
            unsigned int v6 = v4[40];
          }
          int v19 = (*(unsigned int *)&has >> 5) & 1;
          if (v19 == ((v6 >> 5) & 1))
          {
            if (v19)
            {
              float absMaxVal = self->_absMaxVal;
              [v4 absMaxVal];
              if (absMaxVal != v21) {
                goto LABEL_50;
              }
              $773EC1EEAAFF0EF4D71FA85389E340B7 has = self->_has;
              unsigned int v6 = v4[40];
            }
            int v22 = (*(unsigned int *)&has >> 6) & 1;
            if (v22 == ((v6 >> 6) & 1))
            {
              if (v22)
              {
                float aboveNinetyFivepcOfMax = self->_aboveNinetyFivepcOfMax;
                [v4 aboveNinetyFivepcOfMax];
                if (aboveNinetyFivepcOfMax != v24) {
                  goto LABEL_50;
                }
                $773EC1EEAAFF0EF4D71FA85389E340B7 has = self->_has;
                unsigned int v6 = v4[40];
              }
              int v25 = (*(unsigned int *)&has >> 7) & 1;
              if (v25 == ((v6 >> 7) & 1))
              {
                if (v25)
                {
                  unint64_t numTotalInputSamples = self->_numTotalInputSamples;
                  if (numTotalInputSamples != [v4 numTotalInputSamples]) {
                    goto LABEL_50;
                  }
                  $773EC1EEAAFF0EF4D71FA85389E340B7 has = self->_has;
                  unsigned int v6 = v4[40];
                }
                int v27 = (*(unsigned int *)&has >> 8) & 1;
                if (v27 == ((v6 >> 8) & 1))
                {
                  if (v27)
                  {
                    unint64_t numTotalOutputSamples = self->_numTotalOutputSamples;
                    if (numTotalOutputSamples != [v4 numTotalOutputSamples]) {
                      goto LABEL_50;
                    }
                    $773EC1EEAAFF0EF4D71FA85389E340B7 has = self->_has;
                    unsigned int v6 = v4[40];
                  }
                  int v29 = (*(unsigned int *)&has >> 9) & 1;
                  if (v29 == ((v6 >> 9) & 1))
                  {
                    if (v29)
                    {
                      unint64_t initialContinousZeros = self->_initialContinousZeros;
                      if (initialContinousZeros != [v4 initialContinousZeros]) {
                        goto LABEL_50;
                      }
                      $773EC1EEAAFF0EF4D71FA85389E340B7 has = self->_has;
                      unsigned int v6 = v4[40];
                    }
                    int v31 = (*(unsigned int *)&has >> 10) & 1;
                    if (v31 == ((v6 >> 10) & 1))
                    {
                      if (!v31
                        || (unint64_t maxContinousZeros = self->_maxContinousZeros,
                            maxContinousZeros == [v4 maxContinousZeros]))
                      {
                        unint64_t v33 = [(MHSchemaMHCoreSpeechPreprocessorCompleted *)self midSegmentContinousZeros];
                        unint64_t v34 = [v4 midSegmentContinousZeros];
                        v35 = v34;
                        if ((v33 == 0) != (v34 != 0))
                        {
                          uint64_t v36 = [(MHSchemaMHCoreSpeechPreprocessorCompleted *)self midSegmentContinousZeros];
                          if (!v36)
                          {

LABEL_53:
                            BOOL v41 = 1;
                            goto LABEL_51;
                          }
                          v37 = (void *)v36;
                          v38 = [(MHSchemaMHCoreSpeechPreprocessorCompleted *)self midSegmentContinousZeros];
                          v39 = [v4 midSegmentContinousZeros];
                          char v40 = [v38 isEqual:v39];

                          if (v40) {
                            goto LABEL_53;
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
            }
          }
        }
      }
    }
  }
LABEL_50:
  BOOL v41 = 0;
LABEL_51:

  return v41;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
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
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
LABEL_12:
  }
    PBDataWriterWriteUint64Field();
LABEL_13:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_midSegmentContinousZeros;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHCoreSpeechPreprocessorCompletedReadFrom(self, (uint64_t)a3, v3);
}

- (id)midSegmentContinousZerosAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_midSegmentContinousZeros objectAtIndexedSubscript:a3];
}

- (unint64_t)midSegmentContinousZerosCount
{
  return [(NSArray *)self->_midSegmentContinousZeros count];
}

- (void)addMidSegmentContinousZeros:(id)a3
{
  id v4 = a3;
  midSegmentContinousZeros = self->_midSegmentContinousZeros;
  id v8 = v4;
  if (!midSegmentContinousZeros)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_midSegmentContinousZeros;
    self->_midSegmentContinousZeros = v6;

    id v4 = v8;
    midSegmentContinousZeros = self->_midSegmentContinousZeros;
  }
  [(NSArray *)midSegmentContinousZeros addObject:v4];
}

- (void)clearMidSegmentContinousZeros
{
}

- (void)deleteMaxContinousZeros
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasMaxContinousZeros:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasMaxContinousZeros
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setMaxContinousZeros:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_unint64_t maxContinousZeros = a3;
}

- (void)deleteInitialContinousZeros
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasInitialContinousZeros:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasInitialContinousZeros
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setInitialContinousZeros:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unint64_t initialContinousZeros = a3;
}

- (void)deleteNumTotalOutputSamples
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasNumTotalOutputSamples:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumTotalOutputSamples
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumTotalOutputSamples:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unint64_t numTotalOutputSamples = a3;
}

- (void)deleteNumTotalInputSamples
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasNumTotalInputSamples:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumTotalInputSamples
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumTotalInputSamples:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unint64_t numTotalInputSamples = a3;
}

- (void)deleteAboveNinetyFivepcOfMax
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasAboveNinetyFivepcOfMax:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasAboveNinetyFivepcOfMax
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setAboveNinetyFivepcOfMax:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_float aboveNinetyFivepcOfMax = a3;
}

- (void)deleteAbsMaxVal
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasAbsMaxVal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAbsMaxVal
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAbsMaxVal:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_float absMaxVal = a3;
}

- (void)deleteOriginalPower
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasOriginalPower:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasOriginalPower
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setOriginalPower:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_float originalPower = a3;
}

- (void)deleteSignalPower
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasSignalPower:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSignalPower
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSignalPower:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_float signalPower = a3;
}

- (void)deleteBeepPower
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasBeepPower:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBeepPower
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setBeepPower:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_float beepPower = a3;
}

- (void)deleteStatsComputed
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasStatsComputed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasStatsComputed
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setStatsComputed:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int statsComputed = a3;
}

- (void)deleteBeepLocation
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasBeepLocation:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBeepLocation
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setBeepLocation:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int beepLocation = a3;
}

@end