@interface INFERENCESchemaINFERENCEEuclidScoreStatistics
- (BOOL)hasMaxScore;
- (BOOL)hasMeanScore;
- (BOOL)hasMedianScore;
- (BOOL)hasMinScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEEuclidScoreStatistics)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEEuclidScoreStatistics)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)maxScore;
- (float)meanScore;
- (float)medianScore;
- (float)minScore;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteMaxScore;
- (void)deleteMeanScore;
- (void)deleteMedianScore;
- (void)deleteMinScore;
- (void)setHasMaxScore:(BOOL)a3;
- (void)setHasMeanScore:(BOOL)a3;
- (void)setHasMedianScore:(BOOL)a3;
- (void)setHasMinScore:(BOOL)a3;
- (void)setMaxScore:(float)a3;
- (void)setMeanScore:(float)a3;
- (void)setMedianScore:(float)a3;
- (void)setMinScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEEuclidScoreStatistics

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)meanScore
{
  return self->_meanScore;
}

- (float)medianScore
{
  return self->_medianScore;
}

- (float)maxScore
{
  return self->_maxScore;
}

- (float)minScore
{
  return self->_minScore;
}

- (INFERENCESchemaINFERENCEEuclidScoreStatistics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INFERENCESchemaINFERENCEEuclidScoreStatistics;
  v5 = [(INFERENCESchemaINFERENCEEuclidScoreStatistics *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"minScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[INFERENCESchemaINFERENCEEuclidScoreStatistics setMinScore:](v5, "setMinScore:");
    }
    v7 = [v4 objectForKeyedSubscript:@"maxScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[INFERENCESchemaINFERENCEEuclidScoreStatistics setMaxScore:](v5, "setMaxScore:");
    }
    v8 = [v4 objectForKeyedSubscript:@"medianScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[INFERENCESchemaINFERENCEEuclidScoreStatistics setMedianScore:](v5, "setMedianScore:");
    }
    v9 = [v4 objectForKeyedSubscript:@"meanScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[INFERENCESchemaINFERENCEEuclidScoreStatistics setMeanScore:](v5, "setMeanScore:");
    }
    v10 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEEuclidScoreStatistics)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEEuclidScoreStatistics *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEEuclidScoreStatistics *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    v8 = NSNumber;
    [(INFERENCESchemaINFERENCEEuclidScoreStatistics *)self maxScore];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"maxScore"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v10 = NSNumber;
  [(INFERENCESchemaINFERENCEEuclidScoreStatistics *)self meanScore];
  v11 = objc_msgSend(v10, "numberWithFloat:");
  [v3 setObject:v11 forKeyedSubscript:@"meanScore"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  objc_super v12 = NSNumber;
  [(INFERENCESchemaINFERENCEEuclidScoreStatistics *)self medianScore];
  v13 = objc_msgSend(v12, "numberWithFloat:");
  [v3 setObject:v13 forKeyedSubscript:@"medianScore"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v5 = NSNumber;
    [(INFERENCESchemaINFERENCEEuclidScoreStatistics *)self minScore];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"minScore"];
  }
LABEL_6:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    float minScore = self->_minScore;
    double v6 = minScore;
    if (minScore < 0.0) {
      double v6 = -minScore;
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
    float maxScore = self->_maxScore;
    double v11 = maxScore;
    if (maxScore < 0.0) {
      double v11 = -maxScore;
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
    float medianScore = self->_medianScore;
    double v16 = medianScore;
    if (medianScore < 0.0) {
      double v16 = -medianScore;
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
    float meanScore = self->_meanScore;
    double v21 = meanScore;
    if (meanScore < 0.0) {
      double v21 = -meanScore;
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
  return v9 ^ v4 ^ v14 ^ v19;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  $5011D2D92284F9F883878F94E33FF1D2 has = self->_has;
  unsigned int v6 = v4[24];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    float minScore = self->_minScore;
    [v4 minScore];
    if (minScore != v8) {
      goto LABEL_17;
    }
    $5011D2D92284F9F883878F94E33FF1D2 has = self->_has;
    unsigned int v6 = v4[24];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      float maxScore = self->_maxScore;
      [v4 maxScore];
      if (maxScore != v11) {
        goto LABEL_17;
      }
      $5011D2D92284F9F883878F94E33FF1D2 has = self->_has;
      unsigned int v6 = v4[24];
    }
    int v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (v12)
      {
        float medianScore = self->_medianScore;
        [v4 medianScore];
        if (medianScore != v14) {
          goto LABEL_17;
        }
        $5011D2D92284F9F883878F94E33FF1D2 has = self->_has;
        unsigned int v6 = v4[24];
      }
      int v15 = (*(unsigned int *)&has >> 3) & 1;
      if (v15 == ((v6 >> 3) & 1))
      {
        if (!v15 || (float meanScore = self->_meanScore, [v4 meanScore], meanScore == v17))
        {
          BOOL v18 = 1;
          goto LABEL_18;
        }
      }
    }
  }
LABEL_17:
  BOOL v18 = 0;
LABEL_18:

  return v18;
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
      goto LABEL_11;
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
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteFloatField();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEEuclidScoreStatisticsReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteMeanScore
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasMeanScore:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMeanScore
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMeanScore:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_float meanScore = a3;
}

- (void)deleteMedianScore
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasMedianScore:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMedianScore
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMedianScore:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float medianScore = a3;
}

- (void)deleteMaxScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMaxScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMaxScore:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float maxScore = a3;
}

- (void)deleteMinScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasMinScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMinScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMinScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float minScore = a3;
}

@end