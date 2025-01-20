@interface INFERENCESchemaINFERENCEEuclidTrialParameters
- (BOOL)hasEuclidAsrConfidenceThreshold;
- (BOOL)hasEuclidModelVersion;
- (BOOL)hasEuclidScoreThreshold;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEEuclidTrialParameters)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEEuclidTrialParameters)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)euclidModelVersion;
- (float)euclidAsrConfidenceThreshold;
- (float)euclidScoreThreshold;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteEuclidAsrConfidenceThreshold;
- (void)deleteEuclidModelVersion;
- (void)deleteEuclidScoreThreshold;
- (void)setEuclidAsrConfidenceThreshold:(float)a3;
- (void)setEuclidModelVersion:(id)a3;
- (void)setEuclidScoreThreshold:(float)a3;
- (void)setHasEuclidAsrConfidenceThreshold:(BOOL)a3;
- (void)setHasEuclidModelVersion:(BOOL)a3;
- (void)setHasEuclidScoreThreshold:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEEuclidTrialParameters

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasEuclidModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (float)euclidAsrConfidenceThreshold
{
  return self->_euclidAsrConfidenceThreshold;
}

- (float)euclidScoreThreshold
{
  return self->_euclidScoreThreshold;
}

- (void)setEuclidModelVersion:(id)a3
{
}

- (NSString)euclidModelVersion
{
  return self->_euclidModelVersion;
}

- (INFERENCESchemaINFERENCEEuclidTrialParameters)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INFERENCESchemaINFERENCEEuclidTrialParameters;
  v5 = [(INFERENCESchemaINFERENCEEuclidTrialParameters *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"euclidModelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(INFERENCESchemaINFERENCEEuclidTrialParameters *)v5 setEuclidModelVersion:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"euclidScoreThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[INFERENCESchemaINFERENCEEuclidTrialParameters setEuclidScoreThreshold:](v5, "setEuclidScoreThreshold:");
    }
    v9 = [v4 objectForKeyedSubscript:@"euclidAsrConfidenceThreshold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[INFERENCESchemaINFERENCEEuclidTrialParameters setEuclidAsrConfidenceThreshold:](v5, "setEuclidAsrConfidenceThreshold:");
    }
    v10 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEEuclidTrialParameters)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEEuclidTrialParameters *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEEuclidTrialParameters *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = NSNumber;
    [(INFERENCESchemaINFERENCEEuclidTrialParameters *)self euclidAsrConfidenceThreshold];
    v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"euclidAsrConfidenceThreshold"];
  }
  if (self->_euclidModelVersion)
  {
    v6 = [(INFERENCESchemaINFERENCEEuclidTrialParameters *)self euclidModelVersion];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"euclidModelVersion"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = NSNumber;
    [(INFERENCESchemaINFERENCEEuclidTrialParameters *)self euclidScoreThreshold];
    v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"euclidScoreThreshold"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_euclidModelVersion hash];
  char has = (char)self->_has;
  if (has)
  {
    float euclidScoreThreshold = self->_euclidScoreThreshold;
    double v7 = euclidScoreThreshold;
    if (euclidScoreThreshold < 0.0) {
      double v7 = -euclidScoreThreshold;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0)
  {
    float euclidAsrConfidenceThreshold = self->_euclidAsrConfidenceThreshold;
    double v12 = euclidAsrConfidenceThreshold;
    if (euclidAsrConfidenceThreshold < 0.0) {
      double v12 = -euclidAsrConfidenceThreshold;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  return v5 ^ v3 ^ v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEEuclidTrialParameters *)self euclidModelVersion];
  v6 = [v4 euclidModelVersion];
  double v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v8 = [(INFERENCESchemaINFERENCEEuclidTrialParameters *)self euclidModelVersion];
    if (v8)
    {
      double v9 = (void *)v8;
      unint64_t v10 = [(INFERENCESchemaINFERENCEEuclidTrialParameters *)self euclidModelVersion];
      v11 = [v4 euclidModelVersion];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    $58C14582DE34C139B269CBF82246E7D5 has = self->_has;
    unsigned int v14 = v4[24];
    if ((*(unsigned char *)&has & 1) == (v14 & 1))
    {
      if (*(unsigned char *)&has)
      {
        float euclidScoreThreshold = self->_euclidScoreThreshold;
        [v4 euclidScoreThreshold];
        if (euclidScoreThreshold != v16) {
          goto LABEL_15;
        }
        $58C14582DE34C139B269CBF82246E7D5 has = self->_has;
        unsigned int v14 = v4[24];
      }
      int v17 = (*(unsigned int *)&has >> 1) & 1;
      if (v17 == ((v14 >> 1) & 1))
      {
        if (!v17
          || (float euclidAsrConfidenceThreshold = self->_euclidAsrConfidenceThreshold,
              [v4 euclidAsrConfidenceThreshold],
              euclidAsrConfidenceThreshold == v19))
        {
          BOOL v20 = 1;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
  }
LABEL_15:
  BOOL v20 = 0;
LABEL_16:

  return v20;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(INFERENCESchemaINFERENCEEuclidTrialParameters *)self euclidModelVersion];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  v6 = v7;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEEuclidTrialParametersReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteEuclidAsrConfidenceThreshold
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasEuclidAsrConfidenceThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEuclidAsrConfidenceThreshold
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEuclidAsrConfidenceThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float euclidAsrConfidenceThreshold = a3;
}

- (void)deleteEuclidScoreThreshold
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEuclidScoreThreshold:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEuclidScoreThreshold
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEuclidScoreThreshold:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float euclidScoreThreshold = a3;
}

- (void)deleteEuclidModelVersion
{
}

- (BOOL)hasEuclidModelVersion
{
  return self->_euclidModelVersion != 0;
}

@end