@interface APPBAssetMetric
+ (id)options;
- (BOOL)hasTime;
- (BOOL)hasURL;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)uRL;
- (NSString)uniqueIdentifier;
- (double)time;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTime:(BOOL)a3;
- (void)setTime:(double)a3;
- (void)setURL:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAssetMetric

+ (id)options
{
  if (qword_100289818 != -1) {
    dispatch_once(&qword_100289818, &stru_100235020);
  }
  v2 = (void *)qword_100289810;

  return v2;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasURL
{
  return self->_uRL != 0;
}

- (void)setTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_time = a3;
}

- (void)setHasTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAssetMetric;
  v3 = [(APPBAssetMetric *)&v7 description];
  v4 = [(APPBAssetMetric *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v3 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }
  uRL = self->_uRL;
  if (uRL) {
    [v4 setObject:uRL forKey:@"URL"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v7 = +[NSNumber numberWithDouble:self->_time];
    [v4 setObject:v7 forKey:@"time"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAssetMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_uRL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueIdentifier)
  {
    [v4 setUniqueIdentifier:];
    id v4 = v5;
  }
  if (self->_uRL)
  {
    [v5 setURL:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_time;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_uRL copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = *(void *)&self->_time;
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
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:")) {
      goto LABEL_10;
    }
  }
  uRL = self->_uRL;
  if ((unint64_t)uRL | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](uRL, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_time == *((double *)v4 + 1))
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
  NSUInteger v3 = [(NSString *)self->_uniqueIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_uRL hash];
  if (*(unsigned char *)&self->_has)
  {
    double time = self->_time;
    double v7 = -time;
    if (time >= 0.0) {
      double v7 = self->_time;
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
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (double *)a3;
  unint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[APPBAssetMetric setUniqueIdentifier:](self, "setUniqueIdentifier:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[APPBAssetMetric setURL:](self, "setURL:");
    NSUInteger v4 = v5;
  }
  if ((_BYTE)v4[4])
  {
    self->_double time = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)uRL
{
  return self->_uRL;
}

- (void)setURL:(id)a3
{
}

- (double)time
{
  return self->_time;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_uRL, 0);
}

@end