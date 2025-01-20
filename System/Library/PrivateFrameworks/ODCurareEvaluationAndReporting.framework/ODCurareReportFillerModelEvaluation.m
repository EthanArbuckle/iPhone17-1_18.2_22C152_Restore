@interface ODCurareReportFillerModelEvaluation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)metricName;
- (double)metricValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)numberOfPositiveSamples;
- (unsigned)numberOfSamples;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMetricName:(id)a3;
- (void)setMetricValue:(double)a3;
- (void)setNumberOfPositiveSamples:(unsigned int)a3;
- (void)setNumberOfSamples:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODCurareReportFillerModelEvaluation

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerModelEvaluation;
  v4 = [(ODCurareReportFillerModelEvaluation *)&v8 description];
  v5 = [(ODCurareReportFillerModelEvaluation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  metricName = self->_metricName;
  if (metricName) {
    [v3 setObject:metricName forKey:@"metricName"];
  }
  v6 = [NSNumber numberWithDouble:self->_metricValue];
  [v4 setObject:v6 forKey:@"metricValue"];

  v7 = [NSNumber numberWithUnsignedInt:self->_numberOfSamples];
  [v4 setObject:v7 forKey:@"numberOfSamples"];

  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_numberOfPositiveSamples];
  [v4 setObject:v8 forKey:@"numberOfPositiveSamples"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerModelEvaluationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_metricName) {
    -[ODCurareReportFillerModelEvaluation writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  metricName = self->_metricName;
  id v5 = a3;
  [v5 setMetricName:metricName];
  *((void *)v5 + 1) = *(void *)&self->_metricValue;
  *((_DWORD *)v5 + 7) = self->_numberOfSamples;
  *((_DWORD *)v5 + 6) = self->_numberOfPositiveSamples;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_metricName copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(double *)(v5 + 8) = self->_metricValue;
  *(_DWORD *)(v5 + 28) = self->_numberOfSamples;
  *(_DWORD *)(v5 + 24) = self->_numberOfPositiveSamples;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((metricName = self->_metricName, !((unint64_t)metricName | *((void *)v4 + 2)))
     || -[NSString isEqual:](metricName, "isEqual:"))
    && self->_metricValue == *((double *)v4 + 1)
    && self->_numberOfSamples == *((_DWORD *)v4 + 7)
    && self->_numberOfPositiveSamples == *((_DWORD *)v4 + 6);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_metricName hash];
  double metricValue = self->_metricValue;
  double v5 = -metricValue;
  if (metricValue >= 0.0) {
    double v5 = self->_metricValue;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  unint64_t v9 = v8 + (unint64_t)v7;
  double v10 = fabs(v7);
  if (v7 <= 0.0) {
    unint64_t v9 = v8;
  }
  unint64_t v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0) {
    unint64_t v11 = v9;
  }
  return v11 ^ v3 ^ (2654435761 * self->_numberOfSamples) ^ (2654435761 * self->_numberOfPositiveSamples);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2))
  {
    id v5 = v4;
    -[ODCurareReportFillerModelEvaluation setMetricName:](self, "setMetricName:");
    id v4 = v5;
  }
  self->_double metricValue = *((double *)v4 + 1);
  self->_numberOfSamples = *((_DWORD *)v4 + 7);
  self->_numberOfPositiveSamples = *((_DWORD *)v4 + 6);
}

- (NSString)metricName
{
  return self->_metricName;
}

- (void)setMetricName:(id)a3
{
}

- (double)metricValue
{
  return self->_metricValue;
}

- (void)setMetricValue:(double)a3
{
  self->_double metricValue = a3;
}

- (unsigned)numberOfSamples
{
  return self->_numberOfSamples;
}

- (void)setNumberOfSamples:(unsigned int)a3
{
  self->_numberOfSamples = a3;
}

- (unsigned)numberOfPositiveSamples
{
  return self->_numberOfPositiveSamples;
}

- (void)setNumberOfPositiveSamples:(unsigned int)a3
{
  self->_numberOfPositiveSamples = a3;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerModelEvaluation writeTo:]", "ODCurareReportFillerModelEvaluation.m", 93, "nil != self->_metricName");
}

@end