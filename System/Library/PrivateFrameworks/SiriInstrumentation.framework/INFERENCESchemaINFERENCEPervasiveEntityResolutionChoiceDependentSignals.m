@interface INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals
- (BOOL)hasChoice;
- (BOOL)hasFrequencyPercentage;
- (BOOL)hasIsModelPredictedChoice;
- (BOOL)hasIsUserSelectedChoice;
- (BOOL)hasLastContiguousCount;
- (BOOL)hasLocationAffinity156Kilometers;
- (BOOL)hasLocationAffinity2500Meters;
- (BOOL)hasLocationAffinity300Meters;
- (BOOL)hasLocationFrequencyCount156Kilometers;
- (BOOL)hasLocationFrequencyCount2500Meters;
- (BOOL)hasLocationFrequencyCount300Meters;
- (BOOL)hasRecencyRank;
- (BOOL)hasRecencySeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)frequencyPercentage;
- (float)locationAffinity156Kilometers;
- (float)locationAffinity2500Meters;
- (float)locationAffinity300Meters;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)isModelPredictedChoice;
- (int)isUserSelectedChoice;
- (int)lastContiguousCount;
- (int)recencyRank;
- (int)recencySeconds;
- (int64_t)choice;
- (int64_t)locationFrequencyCount156Kilometers;
- (int64_t)locationFrequencyCount2500Meters;
- (int64_t)locationFrequencyCount300Meters;
- (unint64_t)hash;
- (void)deleteChoice;
- (void)deleteFrequencyPercentage;
- (void)deleteIsModelPredictedChoice;
- (void)deleteIsUserSelectedChoice;
- (void)deleteLastContiguousCount;
- (void)deleteLocationAffinity156Kilometers;
- (void)deleteLocationAffinity2500Meters;
- (void)deleteLocationAffinity300Meters;
- (void)deleteLocationFrequencyCount156Kilometers;
- (void)deleteLocationFrequencyCount2500Meters;
- (void)deleteLocationFrequencyCount300Meters;
- (void)deleteRecencyRank;
- (void)deleteRecencySeconds;
- (void)setChoice:(int64_t)a3;
- (void)setFrequencyPercentage:(float)a3;
- (void)setHasChoice:(BOOL)a3;
- (void)setHasFrequencyPercentage:(BOOL)a3;
- (void)setHasIsModelPredictedChoice:(BOOL)a3;
- (void)setHasIsUserSelectedChoice:(BOOL)a3;
- (void)setHasLastContiguousCount:(BOOL)a3;
- (void)setHasLocationAffinity156Kilometers:(BOOL)a3;
- (void)setHasLocationAffinity2500Meters:(BOOL)a3;
- (void)setHasLocationAffinity300Meters:(BOOL)a3;
- (void)setHasLocationFrequencyCount156Kilometers:(BOOL)a3;
- (void)setHasLocationFrequencyCount2500Meters:(BOOL)a3;
- (void)setHasLocationFrequencyCount300Meters:(BOOL)a3;
- (void)setHasRecencyRank:(BOOL)a3;
- (void)setHasRecencySeconds:(BOOL)a3;
- (void)setIsModelPredictedChoice:(int)a3;
- (void)setIsUserSelectedChoice:(int)a3;
- (void)setLastContiguousCount:(int)a3;
- (void)setLocationAffinity156Kilometers:(float)a3;
- (void)setLocationAffinity2500Meters:(float)a3;
- (void)setLocationAffinity300Meters:(float)a3;
- (void)setLocationFrequencyCount156Kilometers:(int64_t)a3;
- (void)setLocationFrequencyCount2500Meters:(int64_t)a3;
- (void)setLocationFrequencyCount300Meters:(int64_t)a3;
- (void)setRecencyRank:(int)a3;
- (void)setRecencySeconds:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int64_t)locationFrequencyCount156Kilometers
{
  return self->_locationFrequencyCount156Kilometers;
}

- (int64_t)locationFrequencyCount2500Meters
{
  return self->_locationFrequencyCount2500Meters;
}

- (int64_t)locationFrequencyCount300Meters
{
  return self->_locationFrequencyCount300Meters;
}

- (float)locationAffinity156Kilometers
{
  return self->_locationAffinity156Kilometers;
}

- (float)locationAffinity2500Meters
{
  return self->_locationAffinity2500Meters;
}

- (float)locationAffinity300Meters
{
  return self->_locationAffinity300Meters;
}

- (int)lastContiguousCount
{
  return self->_lastContiguousCount;
}

- (int)recencyRank
{
  return self->_recencyRank;
}

- (int)recencySeconds
{
  return self->_recencySeconds;
}

- (float)frequencyPercentage
{
  return self->_frequencyPercentage;
}

- (int)isModelPredictedChoice
{
  return self->_isModelPredictedChoice;
}

- (int)isUserSelectedChoice
{
  return self->_isUserSelectedChoice;
}

- (int64_t)choice
{
  return self->_choice;
}

- (INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals;
  v5 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"choice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setChoice:](v5, "setChoice:", [v6 longLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isUserSelectedChoice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setIsUserSelectedChoice:](v5, "setIsUserSelectedChoice:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isModelPredictedChoice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setIsModelPredictedChoice:](v5, "setIsModelPredictedChoice:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"frequencyPercentage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setFrequencyPercentage:](v5, "setFrequencyPercentage:");
    }
    v10 = [v4 objectForKeyedSubscript:@"recencySeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setRecencySeconds:](v5, "setRecencySeconds:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"recencyRank"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setRecencyRank:](v5, "setRecencyRank:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"lastContiguousCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLastContiguousCount:](v5, "setLastContiguousCount:", [v12 intValue]);
    }
    v27 = v6;
    v13 = objc_msgSend(v4, "objectForKeyedSubscript:", @"locationAffinity300Meters", v12);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 floatValue];
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationAffinity300Meters:](v5, "setLocationAffinity300Meters:");
    }
    v26 = v7;
    v14 = [v4 objectForKeyedSubscript:@"locationAffinity2500Meters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationAffinity2500Meters:](v5, "setLocationAffinity2500Meters:");
    }
    v25 = v8;
    v15 = [v4 objectForKeyedSubscript:@"locationAffinity156Kilometers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 floatValue];
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationAffinity156Kilometers:](v5, "setLocationAffinity156Kilometers:");
    }
    v23 = v11;
    v24 = v9;
    v16 = [v4 objectForKeyedSubscript:@"locationFrequencyCount300Meters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationFrequencyCount300Meters:](v5, "setLocationFrequencyCount300Meters:", [v16 longLongValue]);
    }
    v17 = v10;
    v18 = [v4 objectForKeyedSubscript:@"locationFrequencyCount2500Meters"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationFrequencyCount2500Meters:](v5, "setLocationFrequencyCount2500Meters:", [v18 longLongValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"locationFrequencyCount156Kilometers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals setLocationFrequencyCount156Kilometers:](v5, "setLocationFrequencyCount156Kilometers:", [v19 longLongValue]);
    }
    v20 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals choice](self, "choice"));
    [v3 setObject:v7 forKeyedSubscript:@"choice"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v8 = NSNumber;
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals *)self frequencyPercentage];
  v9 = objc_msgSend(v8, "numberWithFloat:");
  [v3 setObject:v9 forKeyedSubscript:@"frequencyPercentage"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals isModelPredictedChoice](self, "isModelPredictedChoice"));
  [v3 setObject:v10 forKeyedSubscript:@"isModelPredictedChoice"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  v11 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals isUserSelectedChoice](self, "isUserSelectedChoice"));
  [v3 setObject:v11 forKeyedSubscript:@"isUserSelectedChoice"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  v12 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals lastContiguousCount](self, "lastContiguousCount"));
  [v3 setObject:v12 forKeyedSubscript:@"lastContiguousCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  v13 = NSNumber;
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals *)self locationAffinity156Kilometers];
  v14 = objc_msgSend(v13, "numberWithFloat:");
  [v3 setObject:v14 forKeyedSubscript:@"locationAffinity156Kilometers"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  v15 = NSNumber;
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals *)self locationAffinity2500Meters];
  v16 = objc_msgSend(v15, "numberWithFloat:");
  [v3 setObject:v16 forKeyedSubscript:@"locationAffinity2500Meters"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  v17 = NSNumber;
  [(INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals *)self locationAffinity300Meters];
  v18 = objc_msgSend(v17, "numberWithFloat:");
  [v3 setObject:v18 forKeyedSubscript:@"locationAffinity300Meters"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  v19 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals locationFrequencyCount156Kilometers](self, "locationFrequencyCount156Kilometers"));
  [v3 setObject:v19 forKeyedSubscript:@"locationFrequencyCount156Kilometers"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  v20 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals locationFrequencyCount2500Meters](self, "locationFrequencyCount2500Meters"));
  [v3 setObject:v20 forKeyedSubscript:@"locationFrequencyCount2500Meters"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  v21 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals locationFrequencyCount300Meters](self, "locationFrequencyCount300Meters"));
  [v3 setObject:v21 forKeyedSubscript:@"locationFrequencyCount300Meters"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  v22 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals recencyRank](self, "recencyRank"));
  [v3 setObject:v22 forKeyedSubscript:@"recencyRank"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignals recencySeconds](self, "recencySeconds"));
    [v3 setObject:v5 forKeyedSubscript:@"recencySeconds"];
  }
LABEL_15:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v33 = 2654435761 * self->_choice;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v32 = 2654435761 * self->_isUserSelectedChoice;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v4 = 0;
      if ((has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v9 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v33 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v32 = 0;
  if ((has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_isModelPredictedChoice;
  if ((has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  float frequencyPercentage = self->_frequencyPercentage;
  double v6 = frequencyPercentage;
  if (frequencyPercentage < 0.0) {
    double v6 = -frequencyPercentage;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_15:
  if ((has & 0x10) != 0)
  {
    uint64_t v10 = 2654435761 * self->_recencySeconds;
    if ((has & 0x20) != 0)
    {
LABEL_17:
      uint64_t v11 = 2654435761 * self->_recencyRank;
      if ((has & 0x40) != 0) {
        goto LABEL_18;
      }
LABEL_25:
      uint64_t v12 = 0;
      if ((has & 0x80) != 0) {
        goto LABEL_19;
      }
LABEL_26:
      unint64_t v17 = 0;
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_17;
    }
  }
  uint64_t v11 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_25;
  }
LABEL_18:
  uint64_t v12 = 2654435761 * self->_lastContiguousCount;
  if ((has & 0x80) == 0) {
    goto LABEL_26;
  }
LABEL_19:
  float locationAffinity300Meters = self->_locationAffinity300Meters;
  double v14 = locationAffinity300Meters;
  if (locationAffinity300Meters < 0.0) {
    double v14 = -locationAffinity300Meters;
  }
  long double v15 = floor(v14 + 0.5);
  double v16 = (v14 - v15) * 1.84467441e19;
  unint64_t v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
  if (v16 >= 0.0)
  {
    if (v16 > 0.0) {
      v17 += (unint64_t)v16;
    }
  }
  else
  {
    v17 -= (unint64_t)fabs(v16);
  }
LABEL_29:
  if ((has & 0x100) != 0)
  {
    float locationAffinity2500Meters = self->_locationAffinity2500Meters;
    double v20 = locationAffinity2500Meters;
    if (locationAffinity2500Meters < 0.0) {
      double v20 = -locationAffinity2500Meters;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v18 += (unint64_t)v22;
      }
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  if ((has & 0x200) != 0)
  {
    float locationAffinity156Kilometers = self->_locationAffinity156Kilometers;
    double v25 = locationAffinity156Kilometers;
    if (locationAffinity156Kilometers < 0.0) {
      double v25 = -locationAffinity156Kilometers;
    }
    long double v26 = floor(v25 + 0.5);
    double v27 = (v25 - v26) * 1.84467441e19;
    unint64_t v23 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0) {
        v23 += (unint64_t)v27;
      }
    }
    else
    {
      v23 -= (unint64_t)fabs(v27);
    }
  }
  else
  {
    unint64_t v23 = 0;
  }
  if ((has & 0x400) == 0)
  {
    uint64_t v28 = 0;
    if ((has & 0x800) != 0) {
      goto LABEL_47;
    }
LABEL_50:
    uint64_t v29 = 0;
    if ((has & 0x1000) != 0) {
      goto LABEL_48;
    }
LABEL_51:
    uint64_t v30 = 0;
    return v32 ^ v33 ^ v4 ^ v9 ^ v10 ^ v11 ^ v12 ^ v17 ^ v18 ^ v23 ^ v28 ^ v29 ^ v30;
  }
  uint64_t v28 = 2654435761 * self->_locationFrequencyCount300Meters;
  if ((has & 0x800) == 0) {
    goto LABEL_50;
  }
LABEL_47:
  uint64_t v29 = 2654435761 * self->_locationFrequencyCount2500Meters;
  if ((has & 0x1000) == 0) {
    goto LABEL_51;
  }
LABEL_48:
  uint64_t v30 = 2654435761 * self->_locationFrequencyCount156Kilometers;
  return v32 ^ v33 ^ v4 ^ v9 ^ v10 ^ v11 ^ v12 ^ v17 ^ v18 ^ v23 ^ v28 ^ v29 ^ v30;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_54;
  }
  $D53DA41881E011BA3EB1C05ABD6E62F8 has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_54;
  }
  if (*(unsigned char *)&has)
  {
    int64_t choice = self->_choice;
    if (choice != [v4 choice]) {
      goto LABEL_54;
    }
    $D53DA41881E011BA3EB1C05ABD6E62F8 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_54;
  }
  if (v8)
  {
    int isUserSelectedChoice = self->_isUserSelectedChoice;
    if (isUserSelectedChoice != [v4 isUserSelectedChoice]) {
      goto LABEL_54;
    }
    $D53DA41881E011BA3EB1C05ABD6E62F8 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_54;
  }
  if (v10)
  {
    int isModelPredictedChoice = self->_isModelPredictedChoice;
    if (isModelPredictedChoice != [v4 isModelPredictedChoice]) {
      goto LABEL_54;
    }
    $D53DA41881E011BA3EB1C05ABD6E62F8 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_54;
  }
  if (v12)
  {
    float frequencyPercentage = self->_frequencyPercentage;
    [v4 frequencyPercentage];
    if (frequencyPercentage != v14) {
      goto LABEL_54;
    }
    $D53DA41881E011BA3EB1C05ABD6E62F8 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v15 = (*(unsigned int *)&has >> 4) & 1;
  if (v15 != ((v6 >> 4) & 1)) {
    goto LABEL_54;
  }
  if (v15)
  {
    int recencySeconds = self->_recencySeconds;
    if (recencySeconds != [v4 recencySeconds]) {
      goto LABEL_54;
    }
    $D53DA41881E011BA3EB1C05ABD6E62F8 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v17 = (*(unsigned int *)&has >> 5) & 1;
  if (v17 != ((v6 >> 5) & 1)) {
    goto LABEL_54;
  }
  if (v17)
  {
    int recencyRank = self->_recencyRank;
    if (recencyRank != [v4 recencyRank]) {
      goto LABEL_54;
    }
    $D53DA41881E011BA3EB1C05ABD6E62F8 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v19 = (*(unsigned int *)&has >> 6) & 1;
  if (v19 != ((v6 >> 6) & 1)) {
    goto LABEL_54;
  }
  if (v19)
  {
    int lastContiguousCount = self->_lastContiguousCount;
    if (lastContiguousCount != [v4 lastContiguousCount]) {
      goto LABEL_54;
    }
    $D53DA41881E011BA3EB1C05ABD6E62F8 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v21 = (*(unsigned int *)&has >> 7) & 1;
  if (v21 != ((v6 >> 7) & 1)) {
    goto LABEL_54;
  }
  if (v21)
  {
    float locationAffinity300Meters = self->_locationAffinity300Meters;
    [v4 locationAffinity300Meters];
    if (locationAffinity300Meters != v23) {
      goto LABEL_54;
    }
    $D53DA41881E011BA3EB1C05ABD6E62F8 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v24 = (*(unsigned int *)&has >> 8) & 1;
  if (v24 != ((v6 >> 8) & 1)) {
    goto LABEL_54;
  }
  if (v24)
  {
    float locationAffinity2500Meters = self->_locationAffinity2500Meters;
    [v4 locationAffinity2500Meters];
    if (locationAffinity2500Meters != v26) {
      goto LABEL_54;
    }
    $D53DA41881E011BA3EB1C05ABD6E62F8 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v27 = (*(unsigned int *)&has >> 9) & 1;
  if (v27 != ((v6 >> 9) & 1)) {
    goto LABEL_54;
  }
  if (v27)
  {
    float locationAffinity156Kilometers = self->_locationAffinity156Kilometers;
    [v4 locationAffinity156Kilometers];
    if (locationAffinity156Kilometers != v29) {
      goto LABEL_54;
    }
    $D53DA41881E011BA3EB1C05ABD6E62F8 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v30 = (*(unsigned int *)&has >> 10) & 1;
  if (v30 != ((v6 >> 10) & 1)) {
    goto LABEL_54;
  }
  if (v30)
  {
    int64_t locationFrequencyCount300Meters = self->_locationFrequencyCount300Meters;
    if (locationFrequencyCount300Meters != [v4 locationFrequencyCount300Meters]) {
      goto LABEL_54;
    }
    $D53DA41881E011BA3EB1C05ABD6E62F8 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v32 = (*(unsigned int *)&has >> 11) & 1;
  if (v32 != ((v6 >> 11) & 1)) {
    goto LABEL_54;
  }
  if (v32)
  {
    int64_t locationFrequencyCount2500Meters = self->_locationFrequencyCount2500Meters;
    if (locationFrequencyCount2500Meters == [v4 locationFrequencyCount2500Meters])
    {
      $D53DA41881E011BA3EB1C05ABD6E62F8 has = self->_has;
      unsigned int v6 = v4[40];
      goto LABEL_50;
    }
LABEL_54:
    BOOL v36 = 0;
    goto LABEL_55;
  }
LABEL_50:
  int v34 = (*(unsigned int *)&has >> 12) & 1;
  if (v34 != ((v6 >> 12) & 1)) {
    goto LABEL_54;
  }
  if (v34)
  {
    int64_t locationFrequencyCount156Kilometers = self->_locationFrequencyCount156Kilometers;
    if (locationFrequencyCount156Kilometers != [v4 locationFrequencyCount156Kilometers]) {
      goto LABEL_54;
    }
  }
  BOOL v36 = 1;
LABEL_55:

  return v36;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
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
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
LABEL_14:
  }
    PBDataWriterWriteInt64Field();
LABEL_15:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEPervasiveEntityResolutionChoiceDependentSignalsReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteLocationFrequencyCount156Kilometers
{
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setHasLocationFrequencyCount156Kilometers:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasLocationFrequencyCount156Kilometers
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setLocationFrequencyCount156Kilometers:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_int64_t locationFrequencyCount156Kilometers = a3;
}

- (void)deleteLocationFrequencyCount2500Meters
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasLocationFrequencyCount2500Meters:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasLocationFrequencyCount2500Meters
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setLocationFrequencyCount2500Meters:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_int64_t locationFrequencyCount2500Meters = a3;
}

- (void)deleteLocationFrequencyCount300Meters
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasLocationFrequencyCount300Meters:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasLocationFrequencyCount300Meters
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setLocationFrequencyCount300Meters:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int64_t locationFrequencyCount300Meters = a3;
}

- (void)deleteLocationAffinity156Kilometers
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasLocationAffinity156Kilometers:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasLocationAffinity156Kilometers
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setLocationAffinity156Kilometers:(float)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_float locationAffinity156Kilometers = a3;
}

- (void)deleteLocationAffinity2500Meters
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasLocationAffinity2500Meters:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasLocationAffinity2500Meters
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setLocationAffinity2500Meters:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_float locationAffinity2500Meters = a3;
}

- (void)deleteLocationAffinity300Meters
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasLocationAffinity300Meters:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLocationAffinity300Meters
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setLocationAffinity300Meters:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_float locationAffinity300Meters = a3;
}

- (void)deleteLastContiguousCount
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasLastContiguousCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLastContiguousCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setLastContiguousCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int lastContiguousCount = a3;
}

- (void)deleteRecencyRank
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasRecencyRank:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasRecencyRank
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRecencyRank:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int recencyRank = a3;
}

- (void)deleteRecencySeconds
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasRecencySeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRecencySeconds
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRecencySeconds:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int recencySeconds = a3;
}

- (void)deleteFrequencyPercentage
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasFrequencyPercentage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasFrequencyPercentage
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setFrequencyPercentage:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_float frequencyPercentage = a3;
}

- (void)deleteIsModelPredictedChoice
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasIsModelPredictedChoice:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasIsModelPredictedChoice
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIsModelPredictedChoice:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int isModelPredictedChoice = a3;
}

- (void)deleteIsUserSelectedChoice
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasIsUserSelectedChoice:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasIsUserSelectedChoice
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setIsUserSelectedChoice:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int isUserSelectedChoice = a3;
}

- (void)deleteChoice
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasChoice:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasChoice
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setChoice:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int64_t choice = a3;
}

@end