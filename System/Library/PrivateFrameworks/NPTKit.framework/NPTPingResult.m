@interface NPTPingResult
+ (BOOL)supportsSecureCoding;
- (NPTPingResult)init;
- (NPTPingResult)initWithCoder:(id)a3;
- (NPTPingResult)initWithPings:(id)a3 usingAddress:(id)a4;
- (NSArray)pings;
- (NSDictionary)asDictionary;
- (NSError)error;
- (NSString)address;
- (double)calculateStandardDeviation;
- (double)maxLatency;
- (double)meanLatency;
- (double)minLatency;
- (double)percentLost;
- (double)standardDeviation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)populateFields;
- (void)setAddress:(id)a3;
- (void)setError:(id)a3;
- (void)setMaxLatency:(double)a3;
- (void)setMeanLatency:(double)a3;
- (void)setMinLatency:(double)a3;
- (void)setPercentLost:(double)a3;
- (void)setPings:(id)a3;
- (void)setStandardDeviation:(double)a3;
@end

@implementation NPTPingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTPingResult)init
{
  v5.receiver = self;
  v5.super_class = (Class)NPTPingResult;
  v2 = [(NPTPingResult *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF8C0]);
    [(NPTPingResult *)v2 setPings:v3];

    [(NPTPingResult *)v2 setAddress:&stru_26CAC3728];
  }
  return v2;
}

- (NPTPingResult)initWithPings:(id)a3 usingAddress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NPTPingResult;
  v8 = [(NPTPingResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(NPTPingResult *)v8 setPings:v6];
    [(NPTPingResult *)v9 setAddress:v7];
    [(NPTPingResult *)v9 populateFields];
  }

  return v9;
}

- (void)populateFields
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  [(NPTPingResult *)self setMinLatency:INFINITY];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = [(NPTPingResult *)self pings];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v26;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v10 latency];
        double v12 = v11;
        [(NPTPingResult *)self minLatency];
        if (v12 < v13)
        {
          [v10 latency];
          if (v14 > 0.0)
          {
            [v10 latency];
            -[NPTPingResult setMinLatency:](self, "setMinLatency:");
          }
        }
        [v10 latency];
        double v16 = v15;
        [(NPTPingResult *)self maxLatency];
        if (v16 > v17)
        {
          [v10 latency];
          -[NPTPingResult setMaxLatency:](self, "setMaxLatency:");
        }
        if ([v10 wasSuccessful])
        {
          [v10 latency];
          double v8 = v8 + v18;
        }
        else
        {
          ++v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
    double v8 = 0.0;
  }

  [(NPTPingResult *)self minLatency];
  if (v19 == INFINITY) {
    [(NPTPingResult *)self setMinLatency:0.0];
  }
  v20 = [(NPTPingResult *)self pings];
  uint64_t v21 = [v20 count];

  if (v21 == v6)
  {
    [(NPTPingResult *)self setMeanLatency:0.0];
  }
  else
  {
    v22 = [(NPTPingResult *)self pings];
    -[NPTPingResult setMeanLatency:](self, "setMeanLatency:", v8 / (double)(unint64_t)([v22 count] - v6));
  }
  v23 = [(NPTPingResult *)self pings];
  if ([v23 count])
  {
    v24 = [(NPTPingResult *)self pings];
    -[NPTPingResult setPercentLost:](self, "setPercentLost:", (double)v6 / (double)(unint64_t)[v24 count] * 100.0);
  }
  else
  {
    [(NPTPingResult *)self setPercentLost:0.0];
  }

  [(NPTPingResult *)self calculateStandardDeviation];
  -[NPTPingResult setStandardDeviation:](self, "setStandardDeviation:");
}

- (double)calculateStandardDeviation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = [(NPTPingResult *)self pings];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  double v5 = 0.0;
  if (v4)
  {
    uint64_t v6 = v4;
    int v7 = 0;
    uint64_t v8 = *(void *)v20;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v3);
        }
        double v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v11 wasSuccessful])
        {
          [v11 latency];
          double v13 = v12;
          [(NPTPingResult *)self meanLatency];
          double v9 = v9 + (v13 - v14) * (v13 - v14);
        }
        else
        {
          ++v7;
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
  else
  {
    int v7 = 0;
    double v9 = 0.0;
  }

  double v15 = [(NPTPingResult *)self pings];
  uint64_t v16 = [v15 count];

  if (v16 != v7)
  {
    double v17 = [(NPTPingResult *)self pings];
    double v5 = sqrt(v9 / (double)(unint64_t)([v17 count] - v7));
  }
  return v5;
}

- (NSDictionary)asDictionary
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  double v5 = [(NPTPingResult *)self pings];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v32 + 1) + 8 * i) dictionary];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v7);
  }

  [v3 setValue:v4 forKey:@"pings"];
  double v11 = [(NPTPingResult *)self address];
  [v3 setValue:v11 forKey:@"address"];

  double v12 = NSNumber;
  [(NPTPingResult *)self minLatency];
  double v13 = objc_msgSend(v12, "numberWithDouble:");
  [v3 setValue:v13 forKey:@"min_latency"];

  double v14 = NSNumber;
  [(NPTPingResult *)self maxLatency];
  double v15 = objc_msgSend(v14, "numberWithDouble:");
  [v3 setValue:v15 forKey:@"max_latency"];

  uint64_t v16 = NSNumber;
  [(NPTPingResult *)self meanLatency];
  double v17 = objc_msgSend(v16, "numberWithDouble:");
  [v3 setValue:v17 forKey:@"mean_latency"];

  double v18 = NSNumber;
  [(NPTPingResult *)self standardDeviation];
  long long v19 = objc_msgSend(v18, "numberWithDouble:");
  [v3 setValue:v19 forKey:@"standard_deviation"];

  long long v20 = NSNumber;
  [(NPTPingResult *)self percentLost];
  long long v21 = objc_msgSend(v20, "numberWithDouble:");
  [v3 setValue:v21 forKey:@"loss_percent"];

  long long v22 = [(NPTPingResult *)self error];

  if (v22)
  {
    v23 = [(NPTPingResult *)self error];
    uint64_t v24 = [v23 localizedDescription];
    [v3 setValue:v24 forKey:@"error"];

    long long v25 = [(NPTPingResult *)self error];
    long long v26 = [v25 domain];
    [v3 setValue:v26 forKey:@"error_domain"];

    long long v27 = NSNumber;
    long long v28 = [(NPTPingResult *)self error];
    v29 = objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v28, "code"));
    [v3 setValue:v29 forKey:@"error_code"];
  }
  uint64_t v30 = [NSDictionary dictionaryWithDictionary:v3];

  return (NSDictionary *)v30;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(NPTPingResult *)self address];
  [v4 encodeObject:v5 forKey:@"address"];

  [(NPTPingResult *)self minLatency];
  objc_msgSend(v4, "encodeDouble:forKey:", @"minLatency");
  [(NPTPingResult *)self maxLatency];
  objc_msgSend(v4, "encodeDouble:forKey:", @"maxLatency");
  [(NPTPingResult *)self meanLatency];
  objc_msgSend(v4, "encodeDouble:forKey:", @"meanLatency");
  [(NPTPingResult *)self standardDeviation];
  objc_msgSend(v4, "encodeDouble:forKey:", @"standardDeviation");
  [(NPTPingResult *)self percentLost];
  objc_msgSend(v4, "encodeDouble:forKey:", @"percentLost");
  uint64_t v6 = [(NPTPingResult *)self pings];
  [v4 encodeObject:v6 forKey:@"pings"];

  id v7 = [(NPTPingResult *)self error];
  [v4 encodeObject:v7 forKey:@"error"];
}

- (NPTPingResult)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NPTPingResult;
  id v3 = a3;
  id v4 = [(NPTPingResult *)&v9 init];
  double v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"address", v9.receiver, v9.super_class);
  [(NPTPingResult *)v4 setAddress:v5];

  [v3 decodeDoubleForKey:@"minLatency"];
  -[NPTPingResult setMinLatency:](v4, "setMinLatency:");
  [v3 decodeDoubleForKey:@"maxLatency"];
  -[NPTPingResult setMaxLatency:](v4, "setMaxLatency:");
  [v3 decodeDoubleForKey:@"meanLatency"];
  -[NPTPingResult setMeanLatency:](v4, "setMeanLatency:");
  [v3 decodeDoubleForKey:@"standardDeviation"];
  -[NPTPingResult setStandardDeviation:](v4, "setStandardDeviation:");
  [v3 decodeDoubleForKey:@"percentLost"];
  -[NPTPingResult setPercentLost:](v4, "setPercentLost:");
  uint64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"pings"];
  [(NPTPingResult *)v4 setPings:v6];

  id v7 = [v3 decodeObjectForKey:@"error"];

  [(NPTPingResult *)v4 setError:v7];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NPTPingResult allocWithZone:a3] init];
  double v5 = [(NPTPingResult *)self address];
  [(NPTPingResult *)v4 setAddress:v5];

  [(NPTPingResult *)self minLatency];
  -[NPTPingResult setMinLatency:](v4, "setMinLatency:");
  [(NPTPingResult *)self maxLatency];
  -[NPTPingResult setMaxLatency:](v4, "setMaxLatency:");
  [(NPTPingResult *)self meanLatency];
  -[NPTPingResult setMeanLatency:](v4, "setMeanLatency:");
  [(NPTPingResult *)self standardDeviation];
  -[NPTPingResult setStandardDeviation:](v4, "setStandardDeviation:");
  [(NPTPingResult *)self percentLost];
  -[NPTPingResult setPercentLost:](v4, "setPercentLost:");
  uint64_t v6 = [(NPTPingResult *)self pings];
  [(NPTPingResult *)v4 setPings:v6];

  id v7 = [(NPTPingResult *)self error];
  [(NPTPingResult *)v4 setError:v7];

  return v4;
}

- (NSArray)pings
{
  return self->_pings;
}

- (void)setPings:(id)a3
{
}

- (double)minLatency
{
  return self->_minLatency;
}

- (void)setMinLatency:(double)a3
{
  self->_minLatency = a3;
}

- (double)maxLatency
{
  return self->_maxLatency;
}

- (void)setMaxLatency:(double)a3
{
  self->_maxLatency = a3;
}

- (double)meanLatency
{
  return self->_meanLatency;
}

- (void)setMeanLatency:(double)a3
{
  self->_meanLatency = a3;
}

- (double)standardDeviation
{
  return self->_standardDeviation;
}

- (void)setStandardDeviation:(double)a3
{
  self->_standardDeviation = a3;
}

- (double)percentLost
{
  return self->_percentLost;
}

- (void)setPercentLost:(double)a3
{
  self->_percentLost = a3;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_pings, 0);
}

@end