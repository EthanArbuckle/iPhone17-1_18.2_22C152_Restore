@interface RTMapsSupportOptions
- (NSDateInterval)dateInterval;
- (RTLocation)location;
- (RTMapsSupportOptions)init;
- (RTMapsSupportOptions)initWithDateInterval:(id)a3;
- (RTMapsSupportOptions)initWithDateInterval:(id)a3 location:(id)a4 distance:(double)a5;
- (double)distance;
@end

@implementation RTMapsSupportOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (RTMapsSupportOptions)initWithDateInterval:(id)a3 location:(id)a4 distance:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTMapsSupportOptions;
  v11 = [(RTMapsSupportOptions *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dateInterval, a3);
    objc_storeStrong((id *)&v12->_location, a4);
    v12->_distance = a5;
  }

  return v12;
}

- (RTMapsSupportOptions)initWithDateInterval:(id)a3
{
  return [(RTMapsSupportOptions *)self initWithDateInterval:a3 location:0 distance:1.79769313e308];
}

- (RTLocation)location
{
  return self->_location;
}

- (double)distance
{
  return self->_distance;
}

- (RTMapsSupportOptions)init
{
  return [(RTMapsSupportOptions *)self initWithDateInterval:0 location:0 distance:1.79769313e308];
}

@end