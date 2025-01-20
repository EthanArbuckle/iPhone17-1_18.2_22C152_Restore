@interface APPBSegmentUpdateResponse
+ (id)options;
- (BOOL)hasIdDebug;
- (BOOL)hasMaxSegmentUpdateIntervalInSeconds;
- (BOOL)hasSegmentRefreshIntervalInSeconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)idDebug;
- (double)maxSegmentUpdateIntervalInSeconds;
- (double)segmentRefreshIntervalInSeconds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMaxSegmentUpdateIntervalInSeconds:(BOOL)a3;
- (void)setHasSegmentRefreshIntervalInSeconds:(BOOL)a3;
- (void)setIdDebug:(id)a3;
- (void)setMaxSegmentUpdateIntervalInSeconds:(double)a3;
- (void)setSegmentRefreshIntervalInSeconds:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBSegmentUpdateResponse

+ (id)options
{
  if (qword_100289A40 != -1) {
    dispatch_once(&qword_100289A40, &stru_100235CC8);
  }
  v2 = (void *)qword_100289A38;

  return v2;
}

- (BOOL)hasIdDebug
{
  return self->_idDebug != 0;
}

- (void)setSegmentRefreshIntervalInSeconds:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_segmentRefreshIntervalInSeconds = a3;
}

- (void)setHasSegmentRefreshIntervalInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSegmentRefreshIntervalInSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMaxSegmentUpdateIntervalInSeconds:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxSegmentUpdateIntervalInSeconds = a3;
}

- (void)setHasMaxSegmentUpdateIntervalInSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxSegmentUpdateIntervalInSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBSegmentUpdateResponse;
  char v3 = [(APPBSegmentUpdateResponse *)&v7 description];
  v4 = [(APPBSegmentUpdateResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  idDebug = self->_idDebug;
  if (idDebug) {
    [v3 setObject:idDebug forKey:@"idDebug"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithDouble:self->_segmentRefreshIntervalInSeconds];
    [v4 setObject:v7 forKey:@"segmentRefreshIntervalInSeconds"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v8 = +[NSNumber numberWithDouble:self->_maxSegmentUpdateIntervalInSeconds];
    [v4 setObject:v8 forKey:@"maxSegmentUpdateIntervalInSeconds"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBSegmentUpdateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_idDebug)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_idDebug)
  {
    id v6 = v4;
    [v4 setIdDebug:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_segmentRefreshIntervalInSeconds;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_maxSegmentUpdateIntervalInSeconds;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = [(NSString *)self->_idDebug copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = *(void *)&self->_segmentRefreshIntervalInSeconds;
    *((unsigned char *)v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[1] = *(void *)&self->_maxSegmentUpdateIntervalInSeconds;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  idDebug = self->_idDebug;
  if ((unint64_t)idDebug | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](idDebug, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_segmentRefreshIntervalInSeconds != *((double *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_maxSegmentUpdateIntervalInSeconds != *((double *)v4 + 1)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_idDebug hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double segmentRefreshIntervalInSeconds = self->_segmentRefreshIntervalInSeconds;
    double v7 = -segmentRefreshIntervalInSeconds;
    if (segmentRefreshIntervalInSeconds >= 0.0) {
      double v7 = self->_segmentRefreshIntervalInSeconds;
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
  if (has)
  {
    double maxSegmentUpdateIntervalInSeconds = self->_maxSegmentUpdateIntervalInSeconds;
    double v12 = -maxSegmentUpdateIntervalInSeconds;
    if (maxSegmentUpdateIntervalInSeconds >= 0.0) {
      double v12 = self->_maxSegmentUpdateIntervalInSeconds;
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

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  if (*((void *)v4 + 3))
  {
    BOOL v6 = v4;
    -[APPBSegmentUpdateResponse setIdDebug:](self, "setIdDebug:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_double segmentRefreshIntervalInSeconds = v4[2];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if (v5)
  {
    self->_double maxSegmentUpdateIntervalInSeconds = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)idDebug
{
  return self->_idDebug;
}

- (void)setIdDebug:(id)a3
{
}

- (double)segmentRefreshIntervalInSeconds
{
  return self->_segmentRefreshIntervalInSeconds;
}

- (double)maxSegmentUpdateIntervalInSeconds
{
  return self->_maxSegmentUpdateIntervalInSeconds;
}

- (void).cxx_destruct
{
}

@end