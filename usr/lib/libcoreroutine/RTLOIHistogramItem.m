@interface RTLOIHistogramItem
- (RTLOIHistogramItem)initWithLocationOfInterest:(id)a3 timeOfStay:(double)a4 andNumOfEvents:(int64_t)a5;
- (RTLocationOfInterest)locationOfInterest;
- (double)probability;
- (double)timeOfStay;
- (id)description;
- (int64_t)numOfEvents;
- (void)setLocationOfInterest:(id)a3;
- (void)setNumOfEvents:(int64_t)a3;
- (void)setProbability:(double)a3;
- (void)setTimeOfStay:(double)a3;
@end

@implementation RTLOIHistogramItem

- (RTLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (double)probability
{
  return self->_probability;
}

- (int64_t)numOfEvents
{
  return self->_numOfEvents;
}

- (RTLOIHistogramItem)initWithLocationOfInterest:(id)a3 timeOfStay:(double)a4 andNumOfEvents:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RTLOIHistogramItem;
  v10 = [(RTLOIHistogramItem *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_locationOfInterest, a3);
    v11->_timeOfStay = a4;
    v11->_probability = 0.0;
    v11->_numOfEvents = a5;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = [(RTLOIHistogramItem *)self locationOfInterest];
  [(RTLOIHistogramItem *)self timeOfStay];
  uint64_t v6 = v5;
  int64_t v7 = [(RTLOIHistogramItem *)self numOfEvents];
  [(RTLOIHistogramItem *)self probability];
  id v9 = [v3 stringWithFormat:@"loi, %@, timeOfStay, %f, numberOfEvents, %ld, probability, %f", v4, v6, v7, v8];

  return v9;
}

- (void)setLocationOfInterest:(id)a3
{
}

- (double)timeOfStay
{
  return self->_timeOfStay;
}

- (void)setTimeOfStay:(double)a3
{
  self->_timeOfStay = a3;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (void)setNumOfEvents:(int64_t)a3
{
  self->_numOfEvents = a3;
}

- (void).cxx_destruct
{
}

@end