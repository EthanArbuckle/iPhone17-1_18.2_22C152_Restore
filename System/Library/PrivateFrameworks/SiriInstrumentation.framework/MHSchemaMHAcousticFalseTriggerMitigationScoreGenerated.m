@interface MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated
- (BOOL)hasAudioDurationInNs;
- (BOOL)hasScore;
- (BOOL)hasThreshold;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated)initWithDictionary:(id)a3;
- (MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated)initWithJSON:(id)a3;
- (NSData)jsonData;
- (float)score;
- (float)threshold;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)audioDurationInNs;
- (unint64_t)hash;
- (void)deleteAudioDurationInNs;
- (void)deleteScore;
- (void)deleteThreshold;
- (void)setAudioDurationInNs:(unint64_t)a3;
- (void)setHasAudioDurationInNs:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasThreshold:(BOOL)a3;
- (void)setScore:(float)a3;
- (void)setThreshold:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (float)threshold
{
  return self->_threshold;
}

- (unint64_t)audioDurationInNs
{
  return self->_audioDurationInNs;
}

- (float)score
{
  return self->_score;
}

- (MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated;
  v5 = [(MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated setScore:](v5, "setScore:");
    }
    v7 = [v4 objectForKeyedSubscript:@"audioDurationInNs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated setAudioDurationInNs:](v5, "setAudioDurationInNs:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"threshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated setThreshold:](v5, "setThreshold:");
    }
    v9 = v5;
  }
  return v5;
}

- (MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated *)self dictionaryRepresentation];
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
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated audioDurationInNs](self, "audioDurationInNs"));
    [v3 setObject:v8 forKeyedSubscript:@"audioDurationInNs"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v9 = NSNumber;
  [(MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated *)self score];
  v10 = objc_msgSend(v9, "numberWithFloat:");
  [v3 setObject:v10 forKeyedSubscript:@"score"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = NSNumber;
    [(MHSchemaMHAcousticFalseTriggerMitigationScoreGenerated *)self threshold];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"threshold"];
  }
LABEL_5:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    float score = self->_score;
    double v6 = score;
    if (score < 0.0) {
      double v6 = -score;
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
    unint64_t v9 = 2654435761u * self->_audioDurationInNs;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v14 = 0;
    return v9 ^ v4 ^ v14;
  }
  unint64_t v9 = 0;
  if ((has & 4) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  float threshold = self->_threshold;
  double v11 = threshold;
  if (threshold < 0.0) {
    double v11 = -threshold;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
  return v9 ^ v4 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  $37A4565187484B8D455B7FFABF87F840 has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&has)
  {
    float score = self->_score;
    [v4 score];
    if (score != v8) {
      goto LABEL_13;
    }
    $37A4565187484B8D455B7FFABF87F840 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      unint64_t audioDurationInNs = self->_audioDurationInNs;
      if (audioDurationInNs != [v4 audioDurationInNs]) {
        goto LABEL_13;
      }
      $37A4565187484B8D455B7FFABF87F840 has = self->_has;
      unsigned int v6 = v4[28];
    }
    int v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 == ((v6 >> 2) & 1))
    {
      if (!v11 || (float threshold = self->_threshold, [v4 threshold], threshold == v13))
      {
        BOOL v14 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_13:
  BOOL v14 = 0;
LABEL_14:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAcousticFalseTriggerMitigationScoreGeneratedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteThreshold
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasThreshold
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_float threshold = a3;
}

- (void)deleteAudioDurationInNs
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAudioDurationInNs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAudioDurationInNs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAudioDurationInNs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t audioDurationInNs = a3;
}

- (void)deleteScore
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float score = a3;
}

@end