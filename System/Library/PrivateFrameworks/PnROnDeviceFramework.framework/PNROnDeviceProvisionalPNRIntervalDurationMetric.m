@interface PNROnDeviceProvisionalPNRIntervalDurationMetric
- (BOOL)hasEndTimestamp;
- (BOOL)hasEndTimestampEventName;
- (BOOL)hasMetricValue;
- (BOOL)hasStartTimestamp;
- (BOOL)hasStartTimestampEventName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)endTimestampEventName;
- (NSString)startTimestampEventName;
- (PNROnDeviceProvisionalPNRIntervalDurationMetric)initWithDictionary:(id)a3;
- (PNROnDeviceProvisionalPNRIntervalDurationMetric)initWithJSON:(id)a3;
- (double)metricValue;
- (id)dictionaryRepresentation;
- (int64_t)endTimestamp;
- (int64_t)startTimestamp;
- (unint64_t)hash;
- (void)deleteEndTimestamp;
- (void)deleteEndTimestampEventName;
- (void)deleteMetricValue;
- (void)deleteStartTimestamp;
- (void)deleteStartTimestampEventName;
- (void)setEndTimestamp:(int64_t)a3;
- (void)setEndTimestampEventName:(id)a3;
- (void)setHasEndTimestamp:(BOOL)a3;
- (void)setHasEndTimestampEventName:(BOOL)a3;
- (void)setHasMetricValue:(BOOL)a3;
- (void)setHasStartTimestamp:(BOOL)a3;
- (void)setHasStartTimestampEventName:(BOOL)a3;
- (void)setMetricValue:(double)a3;
- (void)setStartTimestamp:(int64_t)a3;
- (void)setStartTimestampEventName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PNROnDeviceProvisionalPNRIntervalDurationMetric

- (void)setMetricValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_metricValue = a3;
}

- (BOOL)hasMetricValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMetricValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)deleteMetricValue
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setStartTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_startTimestamp = a3;
}

- (BOOL)hasStartTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)deleteStartTimestamp
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (BOOL)hasStartTimestampEventName
{
  return self->_startTimestampEventName != 0;
}

- (void)deleteStartTimestampEventName
{
}

- (void)setEndTimestamp:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_endTimestamp = a3;
}

- (BOOL)hasEndTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasEndTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)deleteEndTimestamp
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (BOOL)hasEndTimestampEventName
{
  return self->_endTimestampEventName != 0;
}

- (void)deleteEndTimestampEventName
{
}

- (BOOL)readFrom:(id)a3
{
  return PNROnDeviceProvisionalPNRIntervalDurationMetricReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  v5 = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self startTimestampEventName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  v6 = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self endTimestampEventName];

  v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    v7 = v8;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $0E3904E41AD40F9058634FC779834D22 has = self->_has;
  unsigned int v6 = v4[48];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    double metricValue = self->_metricValue;
    [v4 metricValue];
    if (metricValue != v8) {
      goto LABEL_22;
    }
    $0E3904E41AD40F9058634FC779834D22 has = self->_has;
    unsigned int v6 = v4[48];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v9)
  {
    int64_t startTimestamp = self->_startTimestamp;
    if (startTimestamp != [v4 startTimestamp]) {
      goto LABEL_22;
    }
  }
  v11 = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self startTimestampEventName];
  v12 = [v4 startTimestampEventName];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_21;
  }
  uint64_t v13 = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self startTimestampEventName];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self startTimestampEventName];
    v16 = [v4 startTimestampEventName];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  int v18 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v18 != ((v4[48] >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v18)
  {
    int64_t endTimestamp = self->_endTimestamp;
    if (endTimestamp != [v4 endTimestamp]) {
      goto LABEL_22;
    }
  }
  v11 = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self endTimestampEventName];
  v12 = [v4 endTimestampEventName];
  if ((v11 == 0) != (v12 != 0))
  {
    uint64_t v20 = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self endTimestampEventName];
    if (!v20)
    {

LABEL_25:
      BOOL v25 = 1;
      goto LABEL_23;
    }
    v21 = (void *)v20;
    v22 = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self endTimestampEventName];
    v23 = [v4 endTimestampEventName];
    char v24 = [v22 isEqual:v23];

    if (v24) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v25 = 0;
LABEL_23:

  return v25;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double metricValue = self->_metricValue;
    double v6 = -metricValue;
    if (metricValue >= 0.0) {
      double v6 = self->_metricValue;
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
  if ((has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_startTimestamp;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_startTimestampEventName hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_endTimestamp;
  }
  else {
    uint64_t v11 = 0;
  }
  return v9 ^ v4 ^ v11 ^ v10 ^ [(NSString *)self->_endTimestampEventName hash];
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNROnDeviceProvisionalPNRIntervalDurationMetric endTimestamp](self, "endTimestamp"));
    [v3 setObject:v4 forKeyedSubscript:@"endTimestamp"];
  }
  if (self->_endTimestampEventName)
  {
    v5 = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self endTimestampEventName];
    double v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"endTimestampEventName"];
  }
  char has = (char)self->_has;
  if (has)
  {
    double v8 = NSNumber;
    [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self metricValue];
    uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v9 forKeyedSubscript:@"metricValue"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    NSUInteger v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PNROnDeviceProvisionalPNRIntervalDurationMetric startTimestamp](self, "startTimestamp"));
    [v3 setObject:v10 forKeyedSubscript:@"startTimestamp"];
  }
  if (self->_startTimestampEventName)
  {
    uint64_t v11 = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self startTimestampEventName];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"startTimestampEventName"];
  }
  [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (NSData)jsonData
{
  v2 = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    char v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    char v3 = 0;
  }

  return (NSData *)v3;
}

- (PNROnDeviceProvisionalPNRIntervalDurationMetric)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  unint64_t v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (PNROnDeviceProvisionalPNRIntervalDurationMetric)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PNROnDeviceProvisionalPNRIntervalDurationMetric;
  v5 = [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)&v15 init];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"metricValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      -[PNROnDeviceProvisionalPNRIntervalDurationMetric setMetricValue:](v5, "setMetricValue:");
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"startTimestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNROnDeviceProvisionalPNRIntervalDurationMetric setStartTimestamp:](v5, "setStartTimestamp:", [v7 longLongValue]);
    }
    double v8 = [v4 objectForKeyedSubscript:@"startTimestampEventName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = (void *)[v8 copy];
      [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)v5 setStartTimestampEventName:v9];
    }
    NSUInteger v10 = [v4 objectForKeyedSubscript:@"endTimestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PNROnDeviceProvisionalPNRIntervalDurationMetric setEndTimestamp:](v5, "setEndTimestamp:", [v10 longLongValue]);
    }
    uint64_t v11 = [v4 objectForKeyedSubscript:@"endTimestampEventName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(PNROnDeviceProvisionalPNRIntervalDurationMetric *)v5 setEndTimestampEventName:v12];
    }
    uint64_t v13 = v5;
  }
  return v5;
}

- (double)metricValue
{
  return self->_metricValue;
}

- (int64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (NSString)startTimestampEventName
{
  return self->_startTimestampEventName;
}

- (void)setStartTimestampEventName:(id)a3
{
}

- (int64_t)endTimestamp
{
  return self->_endTimestamp;
}

- (NSString)endTimestampEventName
{
  return self->_endTimestampEventName;
}

- (void)setEndTimestampEventName:(id)a3
{
}

- (void)setHasStartTimestampEventName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasEndTimestampEventName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimestampEventName, 0);
  objc_storeStrong((id *)&self->_startTimestampEventName, 0);
}

@end