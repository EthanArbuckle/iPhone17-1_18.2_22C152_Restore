@interface APPBAggregateScalarMetric
+ (id)options;
- (BOOL)hasBundleID;
- (BOOL)hasCount;
- (BOOL)hasMetric;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleID;
- (NSString)metric;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)count;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCount:(int)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setMetric:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAggregateScalarMetric

+ (id)options
{
  if (qword_100289A50 != -1) {
    dispatch_once(&qword_100289A50, &stru_100235CE8);
  }
  v2 = (void *)qword_100289A48;

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
  *(unsigned char *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAggregateScalarMetric;
  v3 = [(APPBAggregateScalarMetric *)&v7 description];
  v4 = [(APPBAggregateScalarMetric *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  metric = self->_metric;
  if (metric) {
    [v3 setObject:metric forKey:@"metric"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v4 setObject:bundleID forKey:@"bundleID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_count];
    [v4 setObject:v7 forKey:@"count"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAggregateScalarMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_metric)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_metric)
  {
    [v4 setMetric:];
    id v4 = v5;
  }
  if (self->_bundleID)
  {
    [v5 setBundleID:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_count;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_metric copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_bundleID copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_count;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  metric = self->_metric;
  if ((unint64_t)metric | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](metric, "isEqual:")) {
      goto LABEL_10;
    }
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_count == *((_DWORD *)v4 + 4))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_metric hash];
  NSUInteger v4 = [(NSString *)self->_bundleID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_count;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[APPBAggregateScalarMetric setMetric:](self, "setMetric:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[APPBAggregateScalarMetric setBundleID:](self, "setBundleID:");
    NSUInteger v4 = v5;
  }
  if (v4[8])
  {
    self->_count = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end