@interface APPBAggregateDistributionMetric
+ (id)options;
- (BOOL)hasAverage;
- (BOOL)hasBundleID;
- (BOOL)hasCount;
- (BOOL)hasMetric;
- (BOOL)hasStandardDeviation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleID;
- (NSString)metric;
- (float)average;
- (float)standardDeviation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)count;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAverage:(float)a3;
- (void)setBundleID:(id)a3;
- (void)setCount:(int)a3;
- (void)setHasAverage:(BOOL)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasStandardDeviation:(BOOL)a3;
- (void)setMetric:(id)a3;
- (void)setStandardDeviation:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAggregateDistributionMetric

+ (id)options
{
  if (qword_100289920 != -1) {
    dispatch_once(&qword_100289920, &stru_100235620);
  }
  v2 = (void *)qword_100289918;

  return v2;
}

- (BOOL)hasMetric
{
  return self->_metric != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setCount:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAverage:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_average = a3;
}

- (void)setHasAverage:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAverage
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStandardDeviation:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_standardDeviation = a3;
}

- (void)setHasStandardDeviation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStandardDeviation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAggregateDistributionMetric;
  char v3 = [(APPBAggregateDistributionMetric *)&v7 description];
  v4 = [(APPBAggregateDistributionMetric *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v5 = v3;
  metric = self->_metric;
  if (metric) {
    [v3 setObject:metric forKey:@"metric"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v5 setObject:bundleID forKey:@"bundleID"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = +[NSNumber numberWithInt:self->_count];
    [v5 setObject:v11 forKey:@"count"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *(float *)&double v4 = self->_average;
  v12 = +[NSNumber numberWithFloat:v4];
  [v5 setObject:v12 forKey:@"average"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    *(float *)&double v4 = self->_standardDeviation;
    v9 = +[NSNumber numberWithFloat:v4];
    [v5 setObject:v9 forKey:@"standardDeviation"];
  }
LABEL_9:

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAggregateDistributionMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_metric)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteFloatField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_9:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_metric)
  {
    [v4 setMetric:];
    id v4 = v6;
  }
  if (self->_bundleID)
  {
    [v6 setBundleID:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_count;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 2) = LODWORD(self->_average);
  *((unsigned char *)v4 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 10) = LODWORD(self->_standardDeviation);
    *((unsigned char *)v4 + 44) |= 4u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = [(NSString *)self->_metric copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_bundleID copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v5 + 2) = LODWORD(self->_average);
    *((unsigned char *)v5 + 44) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 6) = self->_count;
  *((unsigned char *)v5 + 44) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 10) = LODWORD(self->_standardDeviation);
    *((unsigned char *)v5 + 44) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  metric = self->_metric;
  if ((unint64_t)metric | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](metric, "isEqual:")) {
      goto LABEL_20;
    }
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_count != *((_DWORD *)v4 + 6)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
LABEL_20:
    BOOL v7 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_average != *((float *)v4 + 2)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_20;
  }
  BOOL v7 = (*((unsigned char *)v4 + 44) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_standardDeviation != *((float *)v4 + 10)) {
      goto LABEL_20;
    }
    BOOL v7 = 1;
  }
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_metric hash];
  NSUInteger v4 = [(NSString *)self->_bundleID hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_count;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v11 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float average = self->_average;
  float v8 = -average;
  if (average >= 0.0) {
    float v8 = self->_average;
  }
  float v9 = floorf(v8 + 0.5);
  float v10 = (float)(v8 - v9) * 1.8447e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabsf(v10);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    float standardDeviation = self->_standardDeviation;
    float v14 = -standardDeviation;
    if (standardDeviation >= 0.0) {
      float v14 = self->_standardDeviation;
    }
    float v15 = floorf(v14 + 0.5);
    float v16 = (float)(v14 - v15) * 1.8447e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmodf(v15, 1.8447e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabsf(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[APPBAggregateDistributionMetric setMetric:](self, "setMetric:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[APPBAggregateDistributionMetric setBundleID:](self, "setBundleID:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_count = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 1) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 1) == 0)
  {
    goto LABEL_7;
  }
  self->_float average = *((float *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
LABEL_8:
    self->_float standardDeviation = *((float *)v4 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_9:
}

- (NSString)metric
{
  return self->_metric;
}

- (void)setMetric:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (int)count
{
  return self->_count;
}

- (float)average
{
  return self->_average;
}

- (float)standardDeviation
{
  return self->_standardDeviation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end