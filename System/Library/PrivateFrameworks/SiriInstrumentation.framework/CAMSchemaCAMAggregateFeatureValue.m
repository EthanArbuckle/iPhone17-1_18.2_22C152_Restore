@interface CAMSchemaCAMAggregateFeatureValue
- (BOOL)hasMean;
- (BOOL)hasNumInteractions;
- (BOOL)hasVariance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CAMSchemaCAMAggregateFeatureValue)initWithDictionary:(id)a3;
- (CAMSchemaCAMAggregateFeatureValue)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)mean;
- (double)variance;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)numInteractions;
- (void)deleteMean;
- (void)deleteNumInteractions;
- (void)deleteVariance;
- (void)setHasMean:(BOOL)a3;
- (void)setHasNumInteractions:(BOOL)a3;
- (void)setHasVariance:(BOOL)a3;
- (void)setMean:(double)a3;
- (void)setNumInteractions:(unsigned int)a3;
- (void)setVariance:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAMSchemaCAMAggregateFeatureValue

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)numInteractions
{
  return self->_numInteractions;
}

- (double)variance
{
  return self->_variance;
}

- (double)mean
{
  return self->_mean;
}

- (CAMSchemaCAMAggregateFeatureValue)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CAMSchemaCAMAggregateFeatureValue;
  v5 = [(CAMSchemaCAMAggregateFeatureValue *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"mean"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[CAMSchemaCAMAggregateFeatureValue setMean:](v5, "setMean:");
    }
    v7 = [v4 objectForKeyedSubscript:@"variance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[CAMSchemaCAMAggregateFeatureValue setVariance:](v5, "setVariance:");
    }
    v8 = [v4 objectForKeyedSubscript:@"numInteractions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CAMSchemaCAMAggregateFeatureValue setNumInteractions:](v5, "setNumInteractions:", [v8 unsignedIntValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (CAMSchemaCAMAggregateFeatureValue)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CAMSchemaCAMAggregateFeatureValue *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CAMSchemaCAMAggregateFeatureValue *)self dictionaryRepresentation];
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
    v8 = NSNumber;
    [(CAMSchemaCAMAggregateFeatureValue *)self mean];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"mean"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CAMSchemaCAMAggregateFeatureValue numInteractions](self, "numInteractions"));
  [v3 setObject:v10 forKeyedSubscript:@"numInteractions"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = NSNumber;
    [(CAMSchemaCAMAggregateFeatureValue *)self variance];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"variance"];
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
    double mean = self->_mean;
    double v6 = -mean;
    if (mean >= 0.0) {
      double v6 = self->_mean;
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
    double variance = self->_variance;
    double v11 = -variance;
    if (variance >= 0.0) {
      double v11 = self->_variance;
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
  if ((has & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_numInteractions;
  }
  else {
    uint64_t v14 = 0;
  }
  return v9 ^ v4 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  $295280EE8465769CEA813BC5362DD9E9 has = self->_has;
  unsigned int v6 = v4[28];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&has)
  {
    double mean = self->_mean;
    [v4 mean];
    if (mean != v8) {
      goto LABEL_14;
    }
    $295280EE8465769CEA813BC5362DD9E9 has = self->_has;
    unsigned int v6 = v4[28];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_14;
  }
  if (v9)
  {
    double variance = self->_variance;
    [v4 variance];
    if (variance == v11)
    {
      $295280EE8465769CEA813BC5362DD9E9 has = self->_has;
      unsigned int v6 = v4[28];
      goto LABEL_10;
    }
LABEL_14:
    BOOL v14 = 0;
    goto LABEL_15;
  }
LABEL_10:
  int v12 = (*(unsigned int *)&has >> 2) & 1;
  if (v12 != ((v6 >> 2) & 1)) {
    goto LABEL_14;
  }
  if (v12)
  {
    unsigned int numInteractions = self->_numInteractions;
    if (numInteractions != [v4 numInteractions]) {
      goto LABEL_14;
    }
  }
  BOOL v14 = 1;
LABEL_15:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteDoubleField();
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
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return CAMSchemaCAMAggregateFeatureValueReadFrom(self, (uint64_t)a3);
}

- (void)deleteNumInteractions
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNumInteractions:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumInteractions
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumInteractions:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int numInteractions = a3;
}

- (void)deleteVariance
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasVariance:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVariance
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setVariance:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double variance = a3;
}

- (void)deleteMean
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasMean:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMean
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMean:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double mean = a3;
}

@end