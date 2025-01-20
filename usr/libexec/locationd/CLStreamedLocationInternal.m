@interface CLStreamedLocationInternal
- (BOOL)hasRawCoordinateLatitude;
- (BOOL)hasRawCoordinateLongitude;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLStreamedLocationInternal)initWithDaemonLocation:(const CLDaemonLocation *)a3;
- (double)rawCoordinateLatitude;
- (double)rawCoordinateLongitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)mergeIntoDaemonLocation:(CLDaemonLocation *)a3;
- (void)setHasRawCoordinateLatitude:(BOOL)a3;
- (void)setHasRawCoordinateLongitude:(BOOL)a3;
- (void)setRawCoordinateLatitude:(double)a3;
- (void)setRawCoordinateLongitude:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLStreamedLocationInternal

- (CLStreamedLocationInternal)initWithDaemonLocation:(const CLDaemonLocation *)a3
{
  v4 = [(CLStreamedLocationInternal *)self init];
  v5 = v4;
  if (v4)
  {
    if (*(double *)((char *)&a3->lifespan + 4) != 0.0) {
      -[CLStreamedLocationInternal setRawCoordinateLatitude:](v4, "setRawCoordinateLatitude:");
    }
    if (*(double *)(&a3->type + 1) != 0.0) {
      -[CLStreamedLocationInternal setRawCoordinateLongitude:](v5, "setRawCoordinateLongitude:");
    }
  }
  return v5;
}

- (void)mergeIntoDaemonLocation:(CLDaemonLocation *)a3
{
  if ([(CLStreamedLocationInternal *)self hasRawCoordinateLatitude])
  {
    [(CLStreamedLocationInternal *)self rawCoordinateLatitude];
    *(void *)((char *)&a3->lifespan + 4) = v5;
  }
  if ([(CLStreamedLocationInternal *)self hasRawCoordinateLongitude])
  {
    [(CLStreamedLocationInternal *)self rawCoordinateLongitude];
    *(void *)(&a3->type + 1) = v6;
  }
}

- (void)setRawCoordinateLatitude:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_rawCoordinateLatitude = a3;
}

- (void)setHasRawCoordinateLatitude:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRawCoordinateLatitude
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRawCoordinateLongitude:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rawCoordinateLongitude = a3;
}

- (void)setHasRawCoordinateLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRawCoordinateLongitude
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CLStreamedLocationInternal;
  return +[NSString stringWithFormat:@"%@ %@", [(CLStreamedLocationInternal *)&v3 description], [(CLStreamedLocationInternal *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rawCoordinateLatitude)] forKey:@"rawCoordinateLatitude"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rawCoordinateLongitude)] forKey:@"rawCoordinateLongitude"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10108D054((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
LABEL_5:
    *((void *)a3 + 2) = *(void *)&self->_rawCoordinateLongitude;
    *((unsigned char *)a3 + 24) |= 2u;
    return;
  }
  *((void *)a3 + 1) = *(void *)&self->_rawCoordinateLatitude;
  *((unsigned char *)a3 + 24) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = *(void *)&self->_rawCoordinateLatitude;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_rawCoordinateLongitude;
    *((unsigned char *)result + 24) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_rawCoordinateLatitude != *((double *)a3 + 1)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_rawCoordinateLongitude != *((double *)a3 + 2)) {
        goto LABEL_11;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double rawCoordinateLatitude = self->_rawCoordinateLatitude;
    double v6 = -rawCoordinateLatitude;
    if (rawCoordinateLatitude >= 0.0) {
      double v6 = self->_rawCoordinateLatitude;
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
    double rawCoordinateLongitude = self->_rawCoordinateLongitude;
    double v11 = -rawCoordinateLongitude;
    if (rawCoordinateLongitude >= 0.0) {
      double v11 = self->_rawCoordinateLongitude;
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
  return v9 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 24) & 1) == 0)
  {
    if ((*((unsigned char *)a3 + 24) & 2) == 0) {
      return;
    }
LABEL_5:
    self->_double rawCoordinateLongitude = *((double *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
  self->_double rawCoordinateLatitude = *((double *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 24) & 2) != 0) {
    goto LABEL_5;
  }
}

- (double)rawCoordinateLatitude
{
  return self->_rawCoordinateLatitude;
}

- (double)rawCoordinateLongitude
{
  return self->_rawCoordinateLongitude;
}

@end