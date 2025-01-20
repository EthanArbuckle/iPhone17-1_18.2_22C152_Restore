@interface FMTSEventVisitStarted
- (FMTSEventVisitStarted)initWithTimestamp:(unint64_t)a3 andDict:(id)a4;
- (FMTSEventVisitStarted)initWithTimestamp:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 accuracy:(double)a6;
- (NSDictionary)detailsAsDict;
- (double)accuracy;
- (double)latitude;
- (double)longitude;
- (id)description;
- (signed)type;
@end

@implementation FMTSEventVisitStarted

- (FMTSEventVisitStarted)initWithTimestamp:(unint64_t)a3 latitude:(double)a4 longitude:(double)a5 accuracy:(double)a6
{
  v13.receiver = self;
  v13.super_class = (Class)FMTSEventVisitStarted;
  v9 = [(FMTSEvent *)&v13 initWithTimestamp:a3];
  v10 = v9;
  if (v9)
  {
    v9->_latitude = a4;
    v9->_longitude = a5;
    v9->_accuracy = a6;
    v11 = v9;
  }

  return v10;
}

- (FMTSEventVisitStarted)initWithTimestamp:(unint64_t)a3 andDict:(id)a4
{
  id v6 = a4;
  v7 = [v6 valueForKey:@"latitude"];
  v8 = [v6 valueForKey:@"longitude"];
  uint64_t v9 = [v6 valueForKey:@"accuracy"];
  v10 = (void *)v9;
  v11 = 0;
  if (v7 && v8 && v9)
  {
    [v7 doubleValue];
    double v13 = v12;
    [v8 doubleValue];
    double v15 = v14;
    [v10 doubleValue];
    self = [(FMTSEventVisitStarted *)self initWithTimestamp:a3 latitude:v13 longitude:v15 accuracy:v16];
    v11 = self;
  }

  return v11;
}

- (signed)type
{
  return 3;
}

- (NSDictionary)detailsAsDict
{
  v8[0] = @"latitude";
  [(FMTSEventVisitStarted *)self latitude];
  v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v9[0] = v3;
  v8[1] = @"longitude";
  [(FMTSEventVisitStarted *)self longitude];
  v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v9[1] = v4;
  v8[2] = @"accuracy";
  [(FMTSEventVisitStarted *)self accuracy];
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v9[2] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)FMTSEventVisitStarted;
  v3 = [(FMTSEvent *)&v11 description];
  [(FMTSEventVisitStarted *)self latitude];
  uint64_t v5 = v4;
  [(FMTSEventVisitStarted *)self longitude];
  uint64_t v7 = v6;
  [(FMTSEventVisitStarted *)self accuracy];
  uint64_t v9 = +[NSString stringWithFormat:@"FMTSEventVisitStarted: %@, latitude %f, longitude %f, accuracy %f", v3, v5, v7, v8];

  return v9;
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

@end