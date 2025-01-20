@interface TISKSingleMetricSample
+ (BOOL)supportsSecureCoding;
+ (id)makeMetric;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)samples;
- (TISKSingleMetricSample)init;
- (TISKSingleMetricSample)initWithCoder:(id)a3;
- (double)average;
- (double)sum;
- (double)variance;
- (id)description;
- (id)generateDataForSR:(id)a3;
- (unint64_t)size;
- (void)addSample:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)merge:(id)a3;
- (void)setSamples:(id)a3;
@end

@implementation TISKSingleMetricSample

- (void).cxx_destruct
{
}

- (void)setSamples:(id)a3
{
}

- (NSMutableArray)samples
{
  return self->_samples;
}

- (id)generateDataForSR:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v4 = *(double *)[a3 metricDefinition];
  id v5 = objc_alloc_init((Class)getSRKeyboardProbabilityMetricClass());
  v6 = self->_samples;
  unint64_t v7 = [(NSMutableArray *)v6 count];
  if (v7 >= 2)
  {
    unint64_t v8 = v7;
    uint64_t v9 = 0;
    do
    {
      [(NSMutableArray *)v6 exchangeObjectAtIndex:v9 withObjectAtIndex:v9 + arc4random_uniform(v8)];
      ++v9;
      --v8;
    }
    while (v8 != 1);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v10 = self->_samples;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    float v13 = v4;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "floatValue", (void)v22);
        float v17 = roundf(v16 / v13) * v13;
        v18 = [v5 mutableSampleValues];
        *(float *)&double v19 = v17;
        v20 = [NSNumber numberWithFloat:v19];
        [v18 addObject:v20];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  return v5;
}

- (TISKSingleMetricSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TISKSingleMetricSample;
  id v5 = [(TISKSingleMetricSample *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"SingleMetricSample"];
    samples = v5->_samples;
    v5->_samples = (NSMutableArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)merge:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v5 = IXADefaultLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = NSString;
      samples = self->_samples;
      uint64_t v10 = [v4 samples];
      uint64_t v11 = [v8 stringWithFormat:@"%s [SensorKit] SingleMetricSample merge: other doesn't respond to sample selector %@ : %@", "-[TISKSingleMetricSample merge:]", samples, v10];
      *(_DWORD *)buf = 138412290;
      objc_super v13 = v11;
      _os_log_error_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  v6 = self->_samples;
  uint64_t v7 = [v4 samples];
  [(NSMutableArray *)v6 addObjectsFromArray:v7];
}

- (BOOL)isEmpty
{
  return [(NSMutableArray *)self->_samples count] == 0;
}

- (unint64_t)size
{
  return [(NSMutableArray *)self->_samples count];
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_samples;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) floatValue];
        objc_msgSend(v3, "appendFormat:", @"%f,", v9);
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  samples = self->_samples;
  id v4 = [a3 samples];
  LOBYTE(samples) = [(NSMutableArray *)samples isEqual:v4];

  return (char)samples;
}

- (double)sum
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_samples;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "doubleValue", (void)v10);
        double v6 = v6 + v8;
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (double)variance
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = self->_samples;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "doubleValue", (void)v13);
        double v7 = v7 + v9 * v9;
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  unint64_t v10 = [(NSMutableArray *)self->_samples count];
  [(TISKSingleMetricSample *)self average];
  return v7 / (double)v10 - v11 * v11;
}

- (double)average
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_samples;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "doubleValue", (void)v11);
        double v7 = v7 + v9;
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7 / (double)(unint64_t)[(NSMutableArray *)self->_samples count];
}

- (void)addSample:(id)a3
{
}

- (TISKSingleMetricSample)init
{
  v6.receiver = self;
  v6.super_class = (Class)TISKSingleMetricSample;
  v2 = [(TISKSingleMetricSample *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    samples = v2->_samples;
    v2->_samples = (NSMutableArray *)v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeMetric
{
  v2 = objc_alloc_init(TISKSingleMetricSample);

  return v2;
}

@end