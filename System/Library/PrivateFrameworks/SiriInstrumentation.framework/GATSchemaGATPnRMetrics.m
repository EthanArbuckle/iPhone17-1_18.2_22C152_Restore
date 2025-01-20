@interface GATSchemaGATPnRMetrics
- (BOOL)hasGenerativeRequestDurationInSeconds;
- (BOOL)hasGenerativeResultCharactersCount;
- (BOOL)hasImageResizingDurationInSeconds;
- (BOOL)hasImageResizingRateKBsPerSecond;
- (BOOL)hasLoadScreenContentDurationInSeconds;
- (BOOL)hasLoadScreenContentRateKBsPerSecond;
- (BOOL)hasRegisterMediaDurationInSeconds;
- (BOOL)hasRegisterMediaRateKBsPerSecond;
- (BOOL)hasStartSiriSessionDurationInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GATSchemaGATPnRMetrics)initWithDictionary:(id)a3;
- (GATSchemaGATPnRMetrics)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)generativeRequestDurationInSeconds;
- (double)imageResizingDurationInSeconds;
- (double)imageResizingRateKBsPerSecond;
- (double)loadScreenContentDurationInSeconds;
- (double)loadScreenContentRateKBsPerSecond;
- (double)registerMediaDurationInSeconds;
- (double)registerMediaRateKBsPerSecond;
- (double)startSiriSessionDurationInSeconds;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)generativeResultCharactersCount;
- (void)deleteGenerativeRequestDurationInSeconds;
- (void)deleteGenerativeResultCharactersCount;
- (void)deleteImageResizingDurationInSeconds;
- (void)deleteImageResizingRateKBsPerSecond;
- (void)deleteLoadScreenContentDurationInSeconds;
- (void)deleteLoadScreenContentRateKBsPerSecond;
- (void)deleteRegisterMediaDurationInSeconds;
- (void)deleteRegisterMediaRateKBsPerSecond;
- (void)deleteStartSiriSessionDurationInSeconds;
- (void)setGenerativeRequestDurationInSeconds:(double)a3;
- (void)setGenerativeResultCharactersCount:(unsigned int)a3;
- (void)setHasGenerativeRequestDurationInSeconds:(BOOL)a3;
- (void)setHasGenerativeResultCharactersCount:(BOOL)a3;
- (void)setHasImageResizingDurationInSeconds:(BOOL)a3;
- (void)setHasImageResizingRateKBsPerSecond:(BOOL)a3;
- (void)setHasLoadScreenContentDurationInSeconds:(BOOL)a3;
- (void)setHasLoadScreenContentRateKBsPerSecond:(BOOL)a3;
- (void)setHasRegisterMediaDurationInSeconds:(BOOL)a3;
- (void)setHasRegisterMediaRateKBsPerSecond:(BOOL)a3;
- (void)setHasStartSiriSessionDurationInSeconds:(BOOL)a3;
- (void)setImageResizingDurationInSeconds:(double)a3;
- (void)setImageResizingRateKBsPerSecond:(double)a3;
- (void)setLoadScreenContentDurationInSeconds:(double)a3;
- (void)setLoadScreenContentRateKBsPerSecond:(double)a3;
- (void)setRegisterMediaDurationInSeconds:(double)a3;
- (void)setRegisterMediaRateKBsPerSecond:(double)a3;
- (void)setStartSiriSessionDurationInSeconds:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GATSchemaGATPnRMetrics

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (double)imageResizingRateKBsPerSecond
{
  return self->_imageResizingRateKBsPerSecond;
}

- (unsigned)generativeResultCharactersCount
{
  return self->_generativeResultCharactersCount;
}

- (double)registerMediaRateKBsPerSecond
{
  return self->_registerMediaRateKBsPerSecond;
}

- (double)loadScreenContentRateKBsPerSecond
{
  return self->_loadScreenContentRateKBsPerSecond;
}

- (double)registerMediaDurationInSeconds
{
  return self->_registerMediaDurationInSeconds;
}

- (double)imageResizingDurationInSeconds
{
  return self->_imageResizingDurationInSeconds;
}

- (double)loadScreenContentDurationInSeconds
{
  return self->_loadScreenContentDurationInSeconds;
}

- (double)generativeRequestDurationInSeconds
{
  return self->_generativeRequestDurationInSeconds;
}

- (double)startSiriSessionDurationInSeconds
{
  return self->_startSiriSessionDurationInSeconds;
}

- (GATSchemaGATPnRMetrics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GATSchemaGATPnRMetrics;
  v5 = [(GATSchemaGATPnRMetrics *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startSiriSessionDurationInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[GATSchemaGATPnRMetrics setStartSiriSessionDurationInSeconds:](v5, "setStartSiriSessionDurationInSeconds:");
    }
    v7 = [v4 objectForKeyedSubscript:@"generativeRequestDurationInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[GATSchemaGATPnRMetrics setGenerativeRequestDurationInSeconds:](v5, "setGenerativeRequestDurationInSeconds:");
    }
    v8 = [v4 objectForKeyedSubscript:@"loadScreenContentDurationInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[GATSchemaGATPnRMetrics setLoadScreenContentDurationInSeconds:](v5, "setLoadScreenContentDurationInSeconds:");
    }
    v9 = objc_msgSend(v4, "objectForKeyedSubscript:", @"imageResizingDurationInSeconds", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[GATSchemaGATPnRMetrics setImageResizingDurationInSeconds:](v5, "setImageResizingDurationInSeconds:");
    }
    v10 = [v4 objectForKeyedSubscript:@"registerMediaDurationInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      -[GATSchemaGATPnRMetrics setRegisterMediaDurationInSeconds:](v5, "setRegisterMediaDurationInSeconds:");
    }
    v11 = [v4 objectForKeyedSubscript:@"loadScreenContentRateKBsPerSecond"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 doubleValue];
      -[GATSchemaGATPnRMetrics setLoadScreenContentRateKBsPerSecond:](v5, "setLoadScreenContentRateKBsPerSecond:");
    }
    v19 = v7;
    v12 = [v4 objectForKeyedSubscript:@"registerMediaRateKBsPerSecond"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 doubleValue];
      -[GATSchemaGATPnRMetrics setRegisterMediaRateKBsPerSecond:](v5, "setRegisterMediaRateKBsPerSecond:");
    }
    v13 = v6;
    v14 = [v4 objectForKeyedSubscript:@"generativeResultCharactersCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[GATSchemaGATPnRMetrics setGenerativeResultCharactersCount:](v5, "setGenerativeResultCharactersCount:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"imageResizingRateKBsPerSecond"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v15 doubleValue];
      -[GATSchemaGATPnRMetrics setImageResizingRateKBsPerSecond:](v5, "setImageResizingRateKBsPerSecond:");
    }
    v16 = v5;
  }
  return v5;
}

- (GATSchemaGATPnRMetrics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(GATSchemaGATPnRMetrics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(GATSchemaGATPnRMetrics *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    v8 = NSNumber;
    [(GATSchemaGATPnRMetrics *)self generativeRequestDurationInSeconds];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"generativeRequestDurationInSeconds"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GATSchemaGATPnRMetrics generativeResultCharactersCount](self, "generativeResultCharactersCount"));
  [v3 setObject:v10 forKeyedSubscript:@"generativeResultCharactersCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v11 = NSNumber;
  [(GATSchemaGATPnRMetrics *)self imageResizingDurationInSeconds];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  [v3 setObject:v12 forKeyedSubscript:@"imageResizingDurationInSeconds"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v13 = NSNumber;
  [(GATSchemaGATPnRMetrics *)self imageResizingRateKBsPerSecond];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  [v3 setObject:v14 forKeyedSubscript:@"imageResizingRateKBsPerSecond"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v15 = NSNumber;
  [(GATSchemaGATPnRMetrics *)self loadScreenContentDurationInSeconds];
  v16 = objc_msgSend(v15, "numberWithDouble:");
  [v3 setObject:v16 forKeyedSubscript:@"loadScreenContentDurationInSeconds"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v17 = NSNumber;
  [(GATSchemaGATPnRMetrics *)self loadScreenContentRateKBsPerSecond];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  [v3 setObject:v18 forKeyedSubscript:@"loadScreenContentRateKBsPerSecond"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v19 = NSNumber;
  [(GATSchemaGATPnRMetrics *)self registerMediaDurationInSeconds];
  objc_super v20 = objc_msgSend(v19, "numberWithDouble:");
  [v3 setObject:v20 forKeyedSubscript:@"registerMediaDurationInSeconds"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v21 = NSNumber;
  [(GATSchemaGATPnRMetrics *)self registerMediaRateKBsPerSecond];
  v22 = objc_msgSend(v21, "numberWithDouble:");
  [v3 setObject:v22 forKeyedSubscript:@"registerMediaRateKBsPerSecond"];

  if (*(_WORD *)&self->_has)
  {
LABEL_10:
    v5 = NSNumber;
    [(GATSchemaGATPnRMetrics *)self startSiriSessionDurationInSeconds];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"startSiriSessionDurationInSeconds"];
  }
LABEL_11:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    double startSiriSessionDurationInSeconds = self->_startSiriSessionDurationInSeconds;
    double v6 = -startSiriSessionDurationInSeconds;
    if (startSiriSessionDurationInSeconds >= 0.0) {
      double v6 = self->_startSiriSessionDurationInSeconds;
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
    double generativeRequestDurationInSeconds = self->_generativeRequestDurationInSeconds;
    double v11 = -generativeRequestDurationInSeconds;
    if (generativeRequestDurationInSeconds >= 0.0) {
      double v11 = self->_generativeRequestDurationInSeconds;
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
    double loadScreenContentDurationInSeconds = self->_loadScreenContentDurationInSeconds;
    double v16 = -loadScreenContentDurationInSeconds;
    if (loadScreenContentDurationInSeconds >= 0.0) {
      double v16 = self->_loadScreenContentDurationInSeconds;
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
    double imageResizingDurationInSeconds = self->_imageResizingDurationInSeconds;
    double v21 = -imageResizingDurationInSeconds;
    if (imageResizingDurationInSeconds >= 0.0) {
      double v21 = self->_imageResizingDurationInSeconds;
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
  if ((has & 0x10) != 0)
  {
    double registerMediaDurationInSeconds = self->_registerMediaDurationInSeconds;
    double v26 = -registerMediaDurationInSeconds;
    if (registerMediaDurationInSeconds >= 0.0) {
      double v26 = self->_registerMediaDurationInSeconds;
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
  unint64_t v49 = v24;
  if ((has & 0x20) != 0)
  {
    double loadScreenContentRateKBsPerSecond = self->_loadScreenContentRateKBsPerSecond;
    double v31 = -loadScreenContentRateKBsPerSecond;
    if (loadScreenContentRateKBsPerSecond >= 0.0) {
      double v31 = self->_loadScreenContentRateKBsPerSecond;
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
  unint64_t v34 = v19;
  unint64_t v35 = v14;
  if ((has & 0x40) != 0)
  {
    double registerMediaRateKBsPerSecond = self->_registerMediaRateKBsPerSecond;
    double v39 = -registerMediaRateKBsPerSecond;
    if (registerMediaRateKBsPerSecond >= 0.0) {
      double v39 = self->_registerMediaRateKBsPerSecond;
    }
    long double v40 = floor(v39 + 0.5);
    double v41 = (v39 - v40) * 1.84467441e19;
    unint64_t v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    unint64_t v36 = v9;
    if (v41 >= 0.0)
    {
      if (v41 > 0.0) {
        v37 += (unint64_t)v41;
      }
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    unint64_t v36 = v9;
    unint64_t v37 = 0;
  }
  if ((has & 0x80) != 0)
  {
    uint64_t v42 = 2654435761 * self->_generativeResultCharactersCount;
    if ((has & 0x100) != 0) {
      goto LABEL_59;
    }
LABEL_64:
    unint64_t v47 = 0;
    return v36 ^ v4 ^ v35 ^ v34 ^ v49 ^ v29 ^ v37 ^ v42 ^ v47;
  }
  uint64_t v42 = 0;
  if ((has & 0x100) == 0) {
    goto LABEL_64;
  }
LABEL_59:
  double imageResizingRateKBsPerSecond = self->_imageResizingRateKBsPerSecond;
  double v44 = -imageResizingRateKBsPerSecond;
  if (imageResizingRateKBsPerSecond >= 0.0) {
    double v44 = self->_imageResizingRateKBsPerSecond;
  }
  long double v45 = floor(v44 + 0.5);
  double v46 = (v44 - v45) * 1.84467441e19;
  unint64_t v47 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
  if (v46 >= 0.0)
  {
    if (v46 > 0.0) {
      v47 += (unint64_t)v46;
    }
  }
  else
  {
    v47 -= (unint64_t)fabs(v46);
  }
  return v36 ^ v4 ^ v35 ^ v34 ^ v49 ^ v29 ^ v37 ^ v42 ^ v47;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  $94177518D4FE8A284550A0F64FC7C779 has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_37;
  }
  if (*(unsigned char *)&has)
  {
    double startSiriSessionDurationInSeconds = self->_startSiriSessionDurationInSeconds;
    [v4 startSiriSessionDurationInSeconds];
    if (startSiriSessionDurationInSeconds != v8) {
      goto LABEL_37;
    }
    $94177518D4FE8A284550A0F64FC7C779 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      double generativeRequestDurationInSeconds = self->_generativeRequestDurationInSeconds;
      [v4 generativeRequestDurationInSeconds];
      if (generativeRequestDurationInSeconds != v11) {
        goto LABEL_37;
      }
      $94177518D4FE8A284550A0F64FC7C779 has = self->_has;
      unsigned int v6 = v4[40];
    }
    int v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (v12)
      {
        double loadScreenContentDurationInSeconds = self->_loadScreenContentDurationInSeconds;
        [v4 loadScreenContentDurationInSeconds];
        if (loadScreenContentDurationInSeconds != v14) {
          goto LABEL_37;
        }
        $94177518D4FE8A284550A0F64FC7C779 has = self->_has;
        unsigned int v6 = v4[40];
      }
      int v15 = (*(unsigned int *)&has >> 3) & 1;
      if (v15 == ((v6 >> 3) & 1))
      {
        if (v15)
        {
          double imageResizingDurationInSeconds = self->_imageResizingDurationInSeconds;
          [v4 imageResizingDurationInSeconds];
          if (imageResizingDurationInSeconds != v17) {
            goto LABEL_37;
          }
          $94177518D4FE8A284550A0F64FC7C779 has = self->_has;
          unsigned int v6 = v4[40];
        }
        int v18 = (*(unsigned int *)&has >> 4) & 1;
        if (v18 == ((v6 >> 4) & 1))
        {
          if (v18)
          {
            double registerMediaDurationInSeconds = self->_registerMediaDurationInSeconds;
            [v4 registerMediaDurationInSeconds];
            if (registerMediaDurationInSeconds != v20) {
              goto LABEL_37;
            }
            $94177518D4FE8A284550A0F64FC7C779 has = self->_has;
            unsigned int v6 = v4[40];
          }
          int v21 = (*(unsigned int *)&has >> 5) & 1;
          if (v21 == ((v6 >> 5) & 1))
          {
            if (v21)
            {
              double loadScreenContentRateKBsPerSecond = self->_loadScreenContentRateKBsPerSecond;
              [v4 loadScreenContentRateKBsPerSecond];
              if (loadScreenContentRateKBsPerSecond != v23) {
                goto LABEL_37;
              }
              $94177518D4FE8A284550A0F64FC7C779 has = self->_has;
              unsigned int v6 = v4[40];
            }
            int v24 = (*(unsigned int *)&has >> 6) & 1;
            if (v24 == ((v6 >> 6) & 1))
            {
              if (v24)
              {
                double registerMediaRateKBsPerSecond = self->_registerMediaRateKBsPerSecond;
                [v4 registerMediaRateKBsPerSecond];
                if (registerMediaRateKBsPerSecond != v26) {
                  goto LABEL_37;
                }
                $94177518D4FE8A284550A0F64FC7C779 has = self->_has;
                unsigned int v6 = v4[40];
              }
              int v27 = (*(unsigned int *)&has >> 7) & 1;
              if (v27 == ((v6 >> 7) & 1))
              {
                if (v27)
                {
                  unsigned int generativeResultCharactersCount = self->_generativeResultCharactersCount;
                  if (generativeResultCharactersCount != [v4 generativeResultCharactersCount])goto LABEL_37; {
                  $94177518D4FE8A284550A0F64FC7C779 has = self->_has;
                  }
                  unsigned int v6 = v4[40];
                }
                int v29 = (*(unsigned int *)&has >> 8) & 1;
                if (v29 == ((v6 >> 8) & 1))
                {
                  if (!v29
                    || (double imageResizingRateKBsPerSecond = self->_imageResizingRateKBsPerSecond,
                        [v4 imageResizingRateKBsPerSecond],
                        imageResizingRateKBsPerSecond == v31))
                  {
                    BOOL v32 = 1;
                    goto LABEL_38;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_37:
  BOOL v32 = 0;
LABEL_38:

  return v32;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    PBDataWriterWriteDoubleField();
LABEL_11:
}

- (BOOL)readFrom:(id)a3
{
  return GATSchemaGATPnRMetricsReadFrom(self, (uint64_t)a3);
}

- (void)deleteImageResizingRateKBsPerSecond
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasImageResizingRateKBsPerSecond:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasImageResizingRateKBsPerSecond
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setImageResizingRateKBsPerSecond:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_double imageResizingRateKBsPerSecond = a3;
}

- (void)deleteGenerativeResultCharactersCount
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasGenerativeResultCharactersCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasGenerativeResultCharactersCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setGenerativeResultCharactersCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unsigned int generativeResultCharactersCount = a3;
}

- (void)deleteRegisterMediaRateKBsPerSecond
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasRegisterMediaRateKBsPerSecond:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRegisterMediaRateKBsPerSecond
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRegisterMediaRateKBsPerSecond:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_double registerMediaRateKBsPerSecond = a3;
}

- (void)deleteLoadScreenContentRateKBsPerSecond
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasLoadScreenContentRateKBsPerSecond:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLoadScreenContentRateKBsPerSecond
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setLoadScreenContentRateKBsPerSecond:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_double loadScreenContentRateKBsPerSecond = a3;
}

- (void)deleteRegisterMediaDurationInSeconds
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasRegisterMediaDurationInSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRegisterMediaDurationInSeconds
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRegisterMediaDurationInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_double registerMediaDurationInSeconds = a3;
}

- (void)deleteImageResizingDurationInSeconds
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasImageResizingDurationInSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasImageResizingDurationInSeconds
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setImageResizingDurationInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_double imageResizingDurationInSeconds = a3;
}

- (void)deleteLoadScreenContentDurationInSeconds
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasLoadScreenContentDurationInSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasLoadScreenContentDurationInSeconds
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setLoadScreenContentDurationInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_double loadScreenContentDurationInSeconds = a3;
}

- (void)deleteGenerativeRequestDurationInSeconds
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasGenerativeRequestDurationInSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasGenerativeRequestDurationInSeconds
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setGenerativeRequestDurationInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_double generativeRequestDurationInSeconds = a3;
}

- (void)deleteStartSiriSessionDurationInSeconds
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasStartSiriSessionDurationInSeconds:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasStartSiriSessionDurationInSeconds
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setStartSiriSessionDurationInSeconds:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_double startSiriSessionDurationInSeconds = a3;
}

@end