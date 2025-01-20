@interface APPBGeofence
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)latitude;
- (double)longitude;
- (double)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setRadius:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBGeofence

+ (id)options
{
  if (qword_1002897C8 != -1) {
    dispatch_once(&qword_1002897C8, &stru_100234EF0);
  }
  v2 = (void *)qword_1002897C0;

  return v2;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBGeofence;
  v3 = [(APPBGeofence *)&v7 description];
  v4 = [(APPBGeofence *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithDouble:self->_latitude];
  [v3 setObject:v4 forKey:@"latitude"];

  v5 = +[NSNumber numberWithDouble:self->_longitude];
  [v3 setObject:v5 forKey:@"longitude"];

  v6 = +[NSNumber numberWithDouble:self->_radius];
  [v3 setObject:v6 forKey:@"radius"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBGeofenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_latitude;
  *((void *)a3 + 2) = *(void *)&self->_longitude;
  *((void *)a3 + 3) = *(void *)&self->_radius;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  *((void *)result + 1) = *(void *)&self->_latitude;
  *((void *)result + 2) = *(void *)&self->_longitude;
  *((void *)result + 3) = *(void *)&self->_radius;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_latitude == v4[1]
    && self->_longitude == v4[2]
    && self->_radius == v4[3];

  return v5;
}

- (unint64_t)hash
{
  double latitude = self->_latitude;
  double v4 = -latitude;
  if (latitude >= 0.0) {
    double v4 = self->_latitude;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  double longitude = self->_longitude;
  double v13 = -longitude;
  if (longitude >= 0.0) {
    double v13 = self->_longitude;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  double v16 = fmod(v14, 1.84467441e19);
  unint64_t v17 = 2654435761u * (unint64_t)v16;
  unint64_t v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0) {
    unint64_t v18 = 2654435761u * (unint64_t)v16;
  }
  unint64_t v19 = v17 - (unint64_t)fabs(v15);
  if (v15 < 0.0) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v18;
  }
  double radius = self->_radius;
  double v22 = -radius;
  if (radius >= 0.0) {
    double v22 = self->_radius;
  }
  long double v23 = floor(v22 + 0.5);
  double v24 = (v22 - v23) * 1.84467441e19;
  double v25 = fmod(v23, 1.84467441e19);
  unint64_t v26 = 2654435761u * (unint64_t)v25;
  unint64_t v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0) {
    unint64_t v27 = 2654435761u * (unint64_t)v25;
  }
  unint64_t v28 = v26 - (unint64_t)fabs(v24);
  if (v24 >= 0.0) {
    unint64_t v28 = v27;
  }
  return v20 ^ v11 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  self->_double latitude = *((double *)a3 + 1);
  self->_double longitude = *((double *)a3 + 2);
  self->_double radius = *((double *)a3 + 3);
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_double latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_double longitude = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_double radius = a3;
}

@end