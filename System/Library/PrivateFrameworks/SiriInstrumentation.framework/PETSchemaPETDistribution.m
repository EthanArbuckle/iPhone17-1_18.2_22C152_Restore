@interface PETSchemaPETDistribution
- (BOOL)hasMax;
- (BOOL)hasMean;
- (BOOL)hasMin;
- (BOOL)hasVariance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PETSchemaPETDistribution)initWithDictionary:(id)a3;
- (PETSchemaPETDistribution)initWithJSON:(id)a3;
- (double)max;
- (double)mean;
- (double)min;
- (double)variance;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteMax;
- (void)deleteMean;
- (void)deleteMin;
- (void)deleteVariance;
- (void)setHasMax:(BOOL)a3;
- (void)setHasMean:(BOOL)a3;
- (void)setHasMin:(BOOL)a3;
- (void)setHasVariance:(BOOL)a3;
- (void)setMax:(double)a3;
- (void)setMean:(double)a3;
- (void)setMin:(double)a3;
- (void)setVariance:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation PETSchemaPETDistribution

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (double)variance
{
  return self->_variance;
}

- (double)mean
{
  return self->_mean;
}

- (double)max
{
  return self->_max;
}

- (double)min
{
  return self->_min;
}

- (PETSchemaPETDistribution)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PETSchemaPETDistribution;
  v5 = [(PETSchemaPETDistribution *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"min"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[PETSchemaPETDistribution setMin:](v5, "setMin:");
    }
    v7 = [v4 objectForKeyedSubscript:@"max"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      -[PETSchemaPETDistribution setMax:](v5, "setMax:");
    }
    v8 = [v4 objectForKeyedSubscript:@"mean"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 doubleValue];
      -[PETSchemaPETDistribution setMean:](v5, "setMean:");
    }
    v9 = [v4 objectForKeyedSubscript:@"variance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[PETSchemaPETDistribution setVariance:](v5, "setVariance:");
    }
    v10 = v5;
  }
  return v5;
}

- (PETSchemaPETDistribution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PETSchemaPETDistribution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PETSchemaPETDistribution *)self dictionaryRepresentation];
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
    [(PETSchemaPETDistribution *)self max];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"max"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v10 = NSNumber;
  [(PETSchemaPETDistribution *)self mean];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"mean"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  objc_super v12 = NSNumber;
  [(PETSchemaPETDistribution *)self min];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  [v3 setObject:v13 forKeyedSubscript:@"min"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = NSNumber;
    [(PETSchemaPETDistribution *)self variance];
    v6 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v6 forKeyedSubscript:@"variance"];
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
    double min = self->_min;
    double v6 = -min;
    if (min >= 0.0) {
      double v6 = self->_min;
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
    double max = self->_max;
    double v11 = -max;
    if (max >= 0.0) {
      double v11 = self->_max;
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
    double mean = self->_mean;
    double v16 = -mean;
    if (mean >= 0.0) {
      double v16 = self->_mean;
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
    double variance = self->_variance;
    double v21 = -variance;
    if (variance >= 0.0) {
      double v21 = self->_variance;
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
  $F24AAE7391E9563EE5E23ADB8AA5D10A has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&has)
  {
    double min = self->_min;
    [v4 min];
    if (min != v8) {
      goto LABEL_17;
    }
    $F24AAE7391E9563EE5E23ADB8AA5D10A has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v6 >> 1) & 1))
  {
    if (v9)
    {
      double max = self->_max;
      [v4 max];
      if (max != v11) {
        goto LABEL_17;
      }
      $F24AAE7391E9563EE5E23ADB8AA5D10A has = self->_has;
      unsigned int v6 = v4[40];
    }
    int v12 = (*(unsigned int *)&has >> 2) & 1;
    if (v12 == ((v6 >> 2) & 1))
    {
      if (v12)
      {
        double mean = self->_mean;
        [v4 mean];
        if (mean != v14) {
          goto LABEL_17;
        }
        $F24AAE7391E9563EE5E23ADB8AA5D10A has = self->_has;
        unsigned int v6 = v4[40];
      }
      int v15 = (*(unsigned int *)&has >> 3) & 1;
      if (v15 == ((v6 >> 3) & 1))
      {
        if (!v15 || (double variance = self->_variance, [v4 variance], variance == v17))
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
    PBDataWriterWriteDoubleField();
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
  PBDataWriterWriteDoubleField();
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
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteDoubleField();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return PETSchemaPETDistributionReadFrom(self, (uint64_t)a3);
}

- (void)deleteVariance
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasVariance:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasVariance
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setVariance:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_double variance = a3;
}

- (void)deleteMean
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasMean:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMean
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMean:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double mean = a3;
}

- (void)deleteMax
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMax:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMax
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMax:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double max = a3;
}

- (void)deleteMin
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasMin:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMin
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMin:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double min = a3;
}

@end