@interface VISLabeledPRPoint
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)label;
- (NSString)readable_label;
- (VISLabeledPRPoint)initWithDictionary:(id)a3;
- (VISLabeledPRPoint)initWithJSON:(id)a3;
- (float)confidence;
- (float)precision;
- (float)recall;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setConfidence:(float)a3;
- (void)setLabel:(id)a3;
- (void)setPrecision:(float)a3;
- (void)setReadable_label:(id)a3;
- (void)setRecall:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VISLabeledPRPoint

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (void)setPrecision:(float)a3
{
  self->_precision = a3;
}

- (void)setRecall:(float)a3
{
  self->_recall = a3;
}

- (void)setLabel:(id)a3
{
  self->_label = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setReadable_label:(id)a3
{
  self->_readable_label = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (BOOL)readFrom:(id)a3
{
  return VISLabeledPRPointReadFrom(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  [(VISLabeledPRPoint *)self confidence];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISLabeledPRPoint *)self precision];
  if (v5 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  [(VISLabeledPRPoint *)self recall];
  if (v6 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  v7 = [(VISLabeledPRPoint *)self label];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  v8 = [(VISLabeledPRPoint *)self readable_label];
  if (v8) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  float confidence = self->_confidence;
  [v4 confidence];
  if (confidence != v6) {
    goto LABEL_15;
  }
  float precision = self->_precision;
  [v4 precision];
  if (precision != v8) {
    goto LABEL_15;
  }
  float recall = self->_recall;
  [v4 recall];
  if (recall != v10) {
    goto LABEL_15;
  }
  v11 = [(VISLabeledPRPoint *)self label];
  v12 = [v4 label];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_14;
  }
  uint64_t v13 = [(VISLabeledPRPoint *)self label];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(VISLabeledPRPoint *)self label];
    v16 = [v4 label];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  v11 = [(VISLabeledPRPoint *)self readable_label];
  v12 = objc_msgSend(v4, "readable_label");
  if ((v11 == 0) != (v12 != 0))
  {
    uint64_t v18 = [(VISLabeledPRPoint *)self readable_label];
    if (!v18)
    {

LABEL_18:
      BOOL v23 = 1;
      goto LABEL_16;
    }
    v19 = (void *)v18;
    v20 = [(VISLabeledPRPoint *)self readable_label];
    v21 = objc_msgSend(v4, "readable_label");
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_14:
  }
LABEL_15:
  BOOL v23 = 0;
LABEL_16:

  return v23;
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
  NSUInteger v24 = v16 ^ v9 ^ v23 ^ [(NSString *)self->_label hash];
  return v24 ^ [(NSString *)self->_readable_label hash];
}

- (id)dictionaryRepresentation
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_confidence != 0.0)
  {
    BOOL v4 = NSNumber;
    [(VISLabeledPRPoint *)self confidence];
    double v5 = objc_msgSend(v4, "numberWithFloat:");
    [v3 setObject:v5 forKeyedSubscript:@"confidence"];
  }
  if (self->_label)
  {
    double v6 = [(VISLabeledPRPoint *)self label];
    long double v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"label"];
  }
  if (self->_precision != 0.0)
  {
    double v8 = NSNumber;
    [(VISLabeledPRPoint *)self precision];
    unint64_t v9 = objc_msgSend(v8, "numberWithFloat:");
    [v3 setObject:v9 forKeyedSubscript:@"precision"];
  }
  if (self->_readable_label)
  {
    float v10 = [(VISLabeledPRPoint *)self readable_label];
    BOOL v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"readableLabel"];
  }
  if (self->_recall != 0.0)
  {
    double v12 = NSNumber;
    [(VISLabeledPRPoint *)self recall];
    double v13 = objc_msgSend(v12, "numberWithFloat:");
    [v3 setObject:v13 forKeyedSubscript:@"recall"];
  }
  return v3;
}

- (NSData)jsonData
{
  v2 = [(VISLabeledPRPoint *)self dictionaryRepresentation];
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

- (VISLabeledPRPoint)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  BOOL v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = 0;
  }
  else
  {
    self = [(VISLabeledPRPoint *)self initWithDictionary:v4];
    double v5 = self;
  }

  return v5;
}

- (VISLabeledPRPoint)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VISLabeledPRPoint;
  double v5 = [(VISLabeledPRPoint *)&v15 init];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"confidence"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 floatValue];
      -[VISLabeledPRPoint setConfidence:](v5, "setConfidence:");
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"precision"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 floatValue];
      -[VISLabeledPRPoint setPrecision:](v5, "setPrecision:");
    }
    double v8 = [v4 objectForKeyedSubscript:@"recall"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      -[VISLabeledPRPoint setRecall:](v5, "setRecall:");
    }
    unint64_t v9 = [v4 objectForKeyedSubscript:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v10 = (void *)[v9 copy];
      [(VISLabeledPRPoint *)v5 setLabel:v10];
    }
    BOOL v11 = [v4 objectForKeyedSubscript:@"readableLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v12 = (void *)[v11 copy];
      [(VISLabeledPRPoint *)v5 setReadable_label:v12];
    }
    double v13 = v5;
  }
  return v5;
}

- (float)confidence
{
  return self->_confidence;
}

- (float)precision
{
  return self->_precision;
}

- (float)recall
{
  return self->_recall;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)readable_label
{
  return self->_readable_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readable_label, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end