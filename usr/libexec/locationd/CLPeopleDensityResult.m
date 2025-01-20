@interface CLPeopleDensityResult
- (BOOL)isEqual:(id)a3;
- (CLPeopleDensityResult)initWithState:(int64_t)a3 confidence:(double)a4 observationInterval:(id)a5 additionalInfo:(id)a6;
- (NSDateInterval)observationInterval;
- (NSDictionary)additionalInfo;
- (double)confidence;
- (int64_t)peopleDensityState;
- (void)dealloc;
- (void)setConfidence:(double)a3;
- (void)setPeopleDensityState:(int64_t)a3;
@end

@implementation CLPeopleDensityResult

- (CLPeopleDensityResult)initWithState:(int64_t)a3 confidence:(double)a4 observationInterval:(id)a5 additionalInfo:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)CLPeopleDensityResult;
  v10 = [(CLPeopleDensityResult *)&v14 init];
  v11 = v10;
  if (v10)
  {
    if (a4 < 0.0 || a5 == 0)
    {
      return 0;
    }
    else
    {
      v10->_peopleDensityState = a3;
      v10->_confidence = a4;
      v10->_observationInterval = (NSDateInterval *)[a5 copy];
      if (a6) {
        v11->_additionalInfo = (NSDictionary *)[a6 copy];
      }
    }
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (id v5 = [(CLPeopleDensityResult *)self peopleDensityState],
        v5 != [a3 peopleDensityState])
    || (-[CLPeopleDensityResult confidence](self, "confidence"), double v7 = v6, [a3 confidence], v7 != v8))
  {
    LOBYTE(v10) = 0;
    return (char)v10;
  }
  v9 = [(CLPeopleDensityResult *)self observationInterval];
  if (v9 == [a3 observationInterval]
    || (LODWORD(v10) = -[NSDateInterval isEqual:](-[CLPeopleDensityResult observationInterval](self, "observationInterval"), "isEqual:", [a3 observationInterval]), v10))
  {
    v11 = [(CLPeopleDensityResult *)self additionalInfo];
    if (v11 != [a3 additionalInfo])
    {
      v10 = [(CLPeopleDensityResult *)self additionalInfo];
      if (v10)
      {
        v12 = [(CLPeopleDensityResult *)self additionalInfo];
        id v13 = [a3 additionalInfo];
        LOBYTE(v10) = [(NSDictionary *)v12 isEqual:v13];
      }
      return (char)v10;
    }
LABEL_13:
    LOBYTE(v10) = 1;
  }
  return (char)v10;
}

- (void)dealloc
{
  additionalInfo = self->_additionalInfo;
  if (additionalInfo) {

  }
  v4.receiver = self;
  v4.super_class = (Class)CLPeopleDensityResult;
  [(CLPeopleDensityResult *)&v4 dealloc];
}

- (int64_t)peopleDensityState
{
  return self->_peopleDensityState;
}

- (void)setPeopleDensityState:(int64_t)a3
{
  self->_peopleDensityState = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (NSDateInterval)observationInterval
{
  return self->_observationInterval;
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

@end