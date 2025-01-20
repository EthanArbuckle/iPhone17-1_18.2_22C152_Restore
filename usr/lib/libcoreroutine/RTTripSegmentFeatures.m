@interface RTTripSegmentFeatures
- (NSDateInterval)dateInterval;
- (NSUUID)tripId;
- (RTTripSegmentFeatures)initWithTransitionIndex:(unint64_t)a3 tripId:(id)a4 mode:(int64_t)a5 dateInterval:(id)a6;
- (id)description;
- (int64_t)mode;
- (unint64_t)transitionIndex;
- (void)setDateInterval:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setTransitionIndex:(unint64_t)a3;
- (void)setTripId:(id)a3;
@end

@implementation RTTripSegmentFeatures

- (RTTripSegmentFeatures)initWithTransitionIndex:(unint64_t)a3 tripId:(id)a4 mode:(int64_t)a5 dateInterval:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)RTTripSegmentFeatures;
  v13 = [(RTTripSegmentFeatures *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_transitionIndex = a3;
    objc_storeStrong((id *)&v13->_tripId, a4);
    v14->_mode = a5;
    objc_storeStrong((id *)&v14->_dateInterval, a6);
  }

  return v14;
}

- (id)description
{
  v3 = NSString;
  v4 = [(RTTripSegmentFeatures *)self dateInterval];
  v5 = [(RTTripSegmentFeatures *)self tripId];
  v6 = [v3 stringWithFormat:@"dateInterval,%@,tripId,%@,mode,%zd,transitionIdx,%tu", v4, v5, -[RTTripSegmentFeatures mode](self, "mode"), -[RTTripSegmentFeatures transitionIndex](self, "transitionIndex")];

  return v6;
}

- (unint64_t)transitionIndex
{
  return self->_transitionIndex;
}

- (void)setTransitionIndex:(unint64_t)a3
{
  self->_transitionIndex = a3;
}

- (NSUUID)tripId
{
  return self->_tripId;
}

- (void)setTripId:(id)a3
{
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_tripId, 0);
}

@end