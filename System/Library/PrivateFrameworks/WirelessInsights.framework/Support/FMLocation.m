@interface FMLocation
- (NSDate)timestamp;
- (double)accuracy;
- (double)latitude;
- (double)longitude;
- (id)description;
- (id)init:(id)a3 latitude:(double)a4 longitude:(double)a5 accuracy:(double)a6;
@end

@implementation FMLocation

- (id)init:(id)a3 latitude:(double)a4 longitude:(double)a5 accuracy:(double)a6
{
  id v11 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FMLocation;
  v12 = [(FMLocation *)&v16 init];
  v13 = (double *)v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_timestamp, a3);
    v13[2] = a4;
    v13[3] = a5;
    v13[4] = a6;
    v14 = v13;
  }

  return v13;
}

- (id)description
{
  v3 = [(FMLocation *)self timestamp];
  [(FMLocation *)self latitude];
  uint64_t v5 = v4;
  [(FMLocation *)self longitude];
  uint64_t v7 = v6;
  [(FMLocation *)self accuracy];
  v9 = +[NSString stringWithFormat:@"timestamp %@, latitude %lf, longitude %lf, accuracy %lf", v3, v5, v7, v8];

  return v9;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (void).cxx_destruct
{
}

@end