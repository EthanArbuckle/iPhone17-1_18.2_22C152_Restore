@interface NSRESolarEvent
+ (id)sunriseEvent:(CLLocationCoordinate2D)a3 at:(id)a4;
+ (id)sunsetEvent:(CLLocationCoordinate2D)a3 at:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (NSDate)date;
- (NSRESolarEvent)initWithType:(unint64_t)a3 coordinate:(CLLocationCoordinate2D)a4 date:(id)a5;
- (unint64_t)type;
@end

@implementation NSRESolarEvent

+ (id)sunriseEvent:(CLLocationCoordinate2D)a3 at:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithType:coordinate:date:", 0, v7, latitude, longitude);

  return v8;
}

+ (id)sunsetEvent:(CLLocationCoordinate2D)a3 at:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithType:coordinate:date:", 1, v7, latitude, longitude);

  return v8;
}

- (NSRESolarEvent)initWithType:(unint64_t)a3 coordinate:(CLLocationCoordinate2D)a4 date:(id)a5
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NSRESolarEvent;
  v11 = [(NSRESolarEvent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v11->_coordinate.CLLocationDegrees latitude = latitude;
    v11->_coordinate.CLLocationDegrees longitude = longitude;
    objc_storeStrong((id *)&v11->_date, a5);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSRESolarEvent *)a3;
  if (self == v4)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(NSRESolarEvent *)self type];
      if (v6 == [(NSRESolarEvent *)v5 type]
        && ([(NSRESolarEvent *)self coordinate],
            double v8 = v7,
            [(NSRESolarEvent *)v5 coordinate],
            v8 == v9)
        && ([(NSRESolarEvent *)self coordinate],
            double v11 = v10,
            [(NSRESolarEvent *)v5 coordinate],
            v11 == v12))
      {
        v13 = [(NSRESolarEvent *)self date];
        objc_super v14 = [(NSRESolarEvent *)v5 date];
        char v15 = [v13 isEqualToDate:v14];
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)type
{
  return self->_type;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end