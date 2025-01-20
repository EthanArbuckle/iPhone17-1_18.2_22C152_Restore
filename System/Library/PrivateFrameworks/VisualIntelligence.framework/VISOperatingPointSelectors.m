@interface VISOperatingPointSelectors
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (VISOperatingPointSelectors)initWithDictionary:(id)a3;
- (VISOperatingPointSelectors)initWithJSON:(id)a3;
- (float)confidence;
- (float)f_beta;
- (float)precision;
- (float)recall;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)whichSelectors;
- (void)setConfidence:(float)a3;
- (void)setF_beta:(float)a3;
- (void)setPrecision:(float)a3;
- (void)setRecall:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VISOperatingPointSelectors

- (void)setConfidence:(float)a3
{
  self->_precision = 0.0;
  self->_recall = 0.0;
  self->_f_beta = 0.0;
  self->_whichSelectors = 1;
  self->_confidence = a3;
}

- (float)confidence
{
  float result = 0.0;
  if (self->_whichSelectors == 1) {
    return self->_confidence;
  }
  return result;
}

- (void)setPrecision:(float)a3
{
  self->_confidence = 0.0;
  self->_recall = 0.0;
  self->_f_beta = 0.0;
  self->_whichSelectors = 2;
  self->_precision = a3;
}

- (float)precision
{
  float result = 0.0;
  if (self->_whichSelectors == 2) {
    return self->_precision;
  }
  return result;
}

- (void)setRecall:(float)a3
{
  self->_confidence = 0.0;
  self->_precision = 0.0;
  self->_f_beta = 0.0;
  self->_whichSelectors = 3;
  self->_recall = a3;
}

- (float)recall
{
  float result = 0.0;
  if (self->_whichSelectors == 3) {
    return self->_recall;
  }
  return result;
}

- (void)setF_beta:(float)a3
{
  self->_confidence = 0.0;
  self->_precision = 0.0;
  self->_recall = 0.0;
  self->_whichSelectors = 4;
  self->_f_beta = a3;
}

- (float)f_beta
{
  float result = 0.0;
  if (self->_whichSelectors == 4) {
    return self->_f_beta;
  }
  return result;
}

- (BOOL)readFrom:(id)a3
{
  return VISOperatingPointSelectorsReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  [(VISOperatingPointSelectors *)self confidence];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISOperatingPointSelectors *)self precision];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISOperatingPointSelectors *)self recall];
  if (v6 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISOperatingPointSelectors *)self f_beta];
  v7 = v9;
  if (v8 != 0.0)
  {
    PBDataWriterWriteFloatField();
    v7 = v9;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (float confidence = self->_confidence, [v4 confidence], confidence == v6)
    && (float precision = self->_precision, [v4 precision], precision == v8)
    && (float recall = self->_recall, [v4 recall], recall == v10))
  {
    float f_beta = self->_f_beta;
    objc_msgSend(v4, "f_beta");
    BOOL v11 = f_beta == v14;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  float confidence = self->_confidence;
  BOOL v4 = confidence < 0.0;
  if (confidence == 0.0)
  {
    unint64_t v9 = 0;
  }
  else
  {
    double v5 = confidence;
    double v6 = -v5;
    if (!v4) {
      double v6 = v5;
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
  }
  float precision = self->_precision;
  BOOL v11 = precision < 0.0;
  if (precision == 0.0)
  {
    unint64_t v16 = 0;
  }
  else
  {
    double v12 = precision;
    double v13 = -v12;
    if (!v11) {
      double v13 = v12;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v16 += (unint64_t)v15;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v15);
    }
  }
  float recall = self->_recall;
  BOOL v18 = recall < 0.0;
  if (recall == 0.0)
  {
    unint64_t v23 = 0;
  }
  else
  {
    double v19 = recall;
    double v20 = -v19;
    if (!v18) {
      double v20 = v19;
    }
    long double v21 = floor(v20 + 0.5);
    double v22 = (v20 - v21) * 1.84467441e19;
    unint64_t v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v23 += (unint64_t)v22;
      }
    }
    else
    {
      v23 -= (unint64_t)fabs(v22);
    }
  }
  float f_beta = self->_f_beta;
  BOOL v25 = f_beta < 0.0;
  if (f_beta == 0.0)
  {
    unint64_t v30 = 0;
  }
  else
  {
    double v26 = f_beta;
    double v27 = -v26;
    if (!v25) {
      double v27 = v26;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v30 += (unint64_t)v29;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v29);
    }
  }
  return v16 ^ v9 ^ v23 ^ v30;
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_confidence != 0.0)
  {
    BOOL v4 = NSNumber;
    [(VISOperatingPointSelectors *)self confidence];
    double v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"confidence"];
  }
  if (self->_f_beta != 0.0)
  {
    double v6 = NSNumber;
    [(VISOperatingPointSelectors *)self f_beta];
    long double v7 = objc_msgSend(v6, "numberWithFloat:");
    [v3 setObject:v7 forKeyedSubscript:@"fBeta"];
  }
  if (self->_precision != 0.0)
  {
    double v8 = NSNumber;
    [(VISOperatingPointSelectors *)self precision];
    unint64_t v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"precision"];
  }
  if (self->_recall != 0.0)
  {
    float v10 = NSNumber;
    [(VISOperatingPointSelectors *)self recall];
    BOOL v11 = objc_msgSend(v10, "numberWithFloat:");
    [v3 setObject:v11 forKeyedSubscript:@"recall"];
  }
  return v3;
}

- (NSData)jsonData
{
  v2 = [(VISOperatingPointSelectors *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    double v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    double v3 = 0;
  }

  return (NSData *)v3;
}

- (VISOperatingPointSelectors)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  BOOL v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = 0;
  }
  else
  {
    self = [(VISOperatingPointSelectors *)self initWithDictionary:v4];
    double v5 = self;
  }

  return v5;
}

- (VISOperatingPointSelectors)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VISOperatingPointSelectors;
  double v5 = [(VISOperatingPointSelectors *)&v12 init];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"confidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[VISOperatingPointSelectors setConfidence:](v5, "setConfidence:");
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"precision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[VISOperatingPointSelectors setPrecision:](v5, "setPrecision:");
    }
    double v8 = [v4 objectForKeyedSubscript:@"recall"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[VISOperatingPointSelectors setRecall:](v5, "setRecall:");
    }
    unint64_t v9 = [v4 objectForKeyedSubscript:@"f_beta"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[VISOperatingPointSelectors setF_beta:](v5, "setF_beta:");
    }
    float v10 = v5;
  }
  return v5;
}

- (unint64_t)whichSelectors
{
  return self->_whichSelectors;
}

@end