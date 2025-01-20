@interface CLFenceAnalyticsMotionActivityHistogram
- (NSMutableDictionary)bins;
- (double)totalInterval;
- (id)binsSortedByInterval;
- (id)initActivityHistogramWithActivities:(id)a3 dateInterval:(id)a4;
- (void)addInterval:(double)a3 type:(unint64_t)a4 confidence:(int64_t)a5;
- (void)dealloc;
- (void)setBins:(id)a3;
- (void)setTotalInterval:(double)a3;
@end

@implementation CLFenceAnalyticsMotionActivityHistogram

- (id)initActivityHistogramWithActivities:(id)a3 dateInterval:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CLFenceAnalyticsMotionActivityHistogram;
  v6 = [(CLFenceAnalyticsMotionActivityHistogram *)&v15 init];
  if (v6)
  {
    v6->_bins = (NSMutableDictionary *)objc_opt_new();
    v6->_totalInterval = 0.0;
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3052000000;
    v12 = sub_100177AE8;
    v13 = sub_10017741C;
    id v14 = 0;
    id v14 = [[objc_msgSend(a4, "endDate") copy];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1008B9BC4;
    v8[3] = &unk_1022CFD00;
    v8[5] = v6;
    v8[6] = &v9;
    v8[4] = a4;
    [a3 enumerateObjectsWithOptions:2 usingBlock:v8];

    _Block_object_dispose(&v9, 8);
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLFenceAnalyticsMotionActivityHistogram;
  [(CLFenceAnalyticsMotionActivityHistogram *)&v3 dealloc];
}

- (id)binsSortedByInterval
{
  id v2 = [(NSMutableDictionary *)[(CLFenceAnalyticsMotionActivityHistogram *)self bins] allValues];

  return [v2 sortedArrayUsingComparator:&stru_1022CFD40];
}

- (void)addInterval:(double)a3 type:(unint64_t)a4 confidence:(int64_t)a5
{
  id v9 = [(NSMutableDictionary *)[(CLFenceAnalyticsMotionActivityHistogram *)self bins] objectForKey:+[NSNumber numberWithUnsignedInteger:a4]];
  if (v9)
  {
    v10 = v9;
    [v9 addInterval:a3];
    [v10 updateConfidence:a5];
  }
  else
  {
    [(NSMutableDictionary *)[(CLFenceAnalyticsMotionActivityHistogram *)self bins] setObject:[[CLFenceAnalyticsMotionActivityHistogramBin alloc] initWithInterval:a4 motionActivityType:a5 motionActivityConfidence:a3] forKey:+[NSNumber numberWithUnsignedInteger:a4]];
  }
  [(CLFenceAnalyticsMotionActivityHistogram *)self totalInterval];
  double v12 = v11 + a3;

  [(CLFenceAnalyticsMotionActivityHistogram *)self setTotalInterval:v12];
}

- (NSMutableDictionary)bins
{
  return self->_bins;
}

- (void)setBins:(id)a3
{
}

- (double)totalInterval
{
  return self->_totalInterval;
}

- (void)setTotalInterval:(double)a3
{
  self->_totalInterval = a3;
}

@end