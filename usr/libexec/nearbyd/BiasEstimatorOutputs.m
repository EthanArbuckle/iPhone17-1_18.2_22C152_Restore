@interface BiasEstimatorOutputs
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BiasEstimatorOutputs)initWithBiasEstimatorOutputs:(id)a3;
- (BiasEstimatorOutputs)initWithCoder:(id)a3;
- (BiasEstimatorOutputs)initWithOuputProbabilities:(id)a3 rawRange:(double)a4 correctedRange:(double)a5;
- (NSArray)outProbabilities;
- (double)correctedRange;
- (double)rawRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)populateOrderedBiasEstimatorOutputs;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCorrectedRange:(double)a3;
- (void)setOutProbabilities:(id)a3;
- (void)setRawRange:(double)a3;
@end

@implementation BiasEstimatorOutputs

- (BiasEstimatorOutputs)initWithOuputProbabilities:(id)a3 rawRange:(double)a4 correctedRange:(double)a5
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BiasEstimatorOutputs;
  v9 = [(BiasEstimatorOutputs *)&v22 init];
  if (v9)
  {
    id v10 = objc_alloc_init((Class)NSMutableArray);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          id v15 = *(id *)(*((void *)&v18 + 1) + 8 * (void)v14);
          [v15 doubleValue];
          v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v10 addObject:v16];

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }

    [(BiasEstimatorOutputs *)v9 setOutProbabilities:v10];
    [(BiasEstimatorOutputs *)v9 setRawRange:a4];
    [(BiasEstimatorOutputs *)v9 setCorrectedRange:a5];
  }
  return v9;
}

- (BiasEstimatorOutputs)initWithBiasEstimatorOutputs:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"UWBSignalFeatures.mm", 291, @"Invalid parameter not satisfying: %@", @"outputs" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)BiasEstimatorOutputs;
  v6 = [(BiasEstimatorOutputs *)&v14 init];
  if (v6)
  {
    v7 = [v5 outProbabilities];
    id v8 = (NSArray *)[v7 copy];
    outProbabilities = v6->_outProbabilities;
    v6->_outProbabilities = v8;

    [v5 rawRange];
    v6->_rawRange = v10;
    [v5 correctedRange];
    v6->_correctedRange = v11;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];

  return [v4 initWithBiasEstimatorOutputs:self];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_outProbabilities forKey:@"outputProbabilities"];
  [v4 encodeDouble:@"rawRange" forKey:self->_rawRange];
  [v4 encodeDouble:@"correctedRange" forKey:self->_correctedRange];
}

- (BiasEstimatorOutputs)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"outputProbabilities"];
  [v4 decodeDoubleForKey:@"rawRange"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"correctedRange"];
  double v9 = v8;
  v13.receiver = self;
  v13.super_class = (Class)BiasEstimatorOutputs;
  double v10 = [(BiasEstimatorOutputs *)&v13 init];
  double v11 = v10;
  if (v10)
  {
    [(BiasEstimatorOutputs *)v10 setOutProbabilities:v5];
    [(BiasEstimatorOutputs *)v11 setRawRange:v7];
    [(BiasEstimatorOutputs *)v11 setCorrectedRange:v9];
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (BiasEstimatorOutputs *)v4;
    double v6 = v5;
    if (v5 == self)
    {
      char v18 = 1;
LABEL_12:

      goto LABEL_13;
    }
    double rawRange = self->_rawRange;
    [(BiasEstimatorOutputs *)v5 rawRange];
    double v9 = v8;
    double correctedRange = self->_correctedRange;
    [(BiasEstimatorOutputs *)v6 correctedRange];
    double v12 = v11;
    outProbabilities = self->_outProbabilities;
    if (!outProbabilities)
    {
      objc_super v14 = [(BiasEstimatorOutputs *)v6 outProbabilities];

      if (!v14)
      {
        unsigned __int8 v16 = 1;
        goto LABEL_7;
      }
      outProbabilities = self->_outProbabilities;
    }
    id v15 = [(BiasEstimatorOutputs *)v6 outProbabilities];
    unsigned __int8 v16 = [(NSArray *)outProbabilities isEqualToArray:v15];

LABEL_7:
    BOOL v17 = rawRange == v9;
    if (correctedRange != v12) {
      BOOL v17 = 0;
    }
    char v18 = v17 & v16;
    goto LABEL_12;
  }
  char v18 = 0;
LABEL_13:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v3 = +[NSNumber numberWithDouble:self->_rawRange];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = +[NSNumber numberWithDouble:self->_correctedRange];
  unint64_t v6 = (unint64_t)[v5 hash];
  unint64_t v7 = v6 ^ v4 ^ (unint64_t)[(NSArray *)self->_outProbabilities hash];

  return v7;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  unint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@: ", v5];

  for (unint64_t i = 0; [(NSArray *)self->_outProbabilities count] > i; ++i)
  {
    double v8 = [(NSArray *)self->_outProbabilities objectAtIndex:i];
    [v8 doubleValue];
    [v6 appendFormat:@" out_prob_%d: %.6f,", i, v9];
  }
  double rawRange = self->_rawRange;
  double correctedRange = self->_correctedRange;
  [v6 appendFormat:@" rawRange: %.3f,", *(void *)&rawRange];
  [v6 appendFormat:@" bias_correction_estimate: %.3f,", correctedRange - rawRange];
  [v6 appendFormat:@" correctedRange: %.3f>", *(void *)&self->_correctedRange];

  return v6;
}

- (id)populateOrderedBiasEstimatorOutputs
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  for (unint64_t i = 0; [(NSArray *)self->_outProbabilities count] > i; ++i)
  {
    id v5 = [(NSArray *)self->_outProbabilities objectAtIndex:i];
    [v5 doubleValue];
    [v3 appendFormat:@" %.6f, ", v6];
  }
  [v3 appendFormat:@" %.3f, %.3f, %.3f", *(void *)&self->_rawRange, self->_correctedRange - self->_rawRange, *(void *)&self->_correctedRange];

  return v3;
}

- (NSArray)outProbabilities
{
  return self->_outProbabilities;
}

- (void)setOutProbabilities:(id)a3
{
}

- (double)rawRange
{
  return self->_rawRange;
}

- (void)setRawRange:(double)a3
{
  self->_double rawRange = a3;
}

- (double)correctedRange
{
  return self->_correctedRange;
}

- (void)setCorrectedRange:(double)a3
{
  self->_double correctedRange = a3;
}

- (void).cxx_destruct
{
}

@end