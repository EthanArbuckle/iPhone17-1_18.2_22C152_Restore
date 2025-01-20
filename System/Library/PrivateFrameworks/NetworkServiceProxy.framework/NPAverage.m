@interface NPAverage
+ (BOOL)supportsSecureCoding;
- (BOOL)isAnyValid;
- (BOOL)isLastValid;
- (NPAverage)initWithCoder:(id)a3;
- (NPAverage)initWithSampleSize:(unint64_t)a3;
- (NSMutableArray)samples;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)shortDescription;
- (unint64_t)average;
- (unint64_t)size;
- (void)addSample:(unint64_t)a3;
- (void)addSamples:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSamples:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation NPAverage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPAverage)initWithSampleSize:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NPAverage;
  result = [(NPAverage *)&v6 init];
  if (result)
  {
    unint64_t v5 = 5;
    if (a3) {
      unint64_t v5 = a3;
    }
    result->_size = v5;
  }
  return result;
}

- (NPAverage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"AverageSampleSize"];
  objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"AverageSamples"];

  v10 = [(NPAverage *)self initWithSampleSize:v5];
  if (v10)
  {
    v11 = (void *)[v9 mutableCopy];
    [(NPAverage *)v10 setSamples:v11];
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NPAverage size](self, "size"), @"AverageSampleSize");
  id v5 = [(NPAverage *)self samples];
  [v4 encodeObject:v5 forKey:@"AverageSamples"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NPAverage allocWithZone:a3] init];
  [(NPAverage *)v4 setSize:[(NPAverage *)self size]];
  id v5 = [(NPAverage *)self samples];
  objc_super v6 = (void *)[v5 mutableCopy];
  [(NPAverage *)v4 setSamples:v6];

  return v4;
}

- (void)addSample:(unint64_t)a3
{
  samples = self->_samples;
  if (!samples)
  {
    objc_super v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_samples;
    self->_samples = v6;

    samples = self->_samples;
  }
  v8 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableArray *)samples addObject:v8];

  if ([(NSMutableArray *)self->_samples count] > self->_size)
  {
    v9 = self->_samples;
    [(NSMutableArray *)v9 removeObjectAtIndex:0];
  }
}

- (void)addSamples:(id)a3
{
  id v4 = a3;
  samples = self->_samples;
  id v8 = v4;
  if (!samples)
  {
    objc_super v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_samples;
    self->_samples = v6;

    id v4 = v8;
    samples = self->_samples;
  }
  [(NSMutableArray *)samples addObjectsFromArray:v4];
  while ([(NSMutableArray *)self->_samples count] > self->_size)
    [(NSMutableArray *)self->_samples removeObjectAtIndex:0];
}

- (unint64_t)average
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_samples count]) {
    return 0xFFFFFFFFLL;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v3 = self->_samples;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v42 objects:v48 count:16];
  double v5 = 0.0;
  double v6 = 0.0;
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v8 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v3);
        }
        double v6 = v6 + (double)(unint64_t)[*(id *)(*((void *)&v42 + 1) + 8 * i) unsignedIntegerValue];
      }
      uint64_t v7 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v7);
  }

  double v10 = v6 / (double)(unint64_t)[(NSMutableArray *)self->_samples count];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v11 = self->_samples;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    double v5 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        [v16 doubleValue];
        double v18 = v17 - v10;
        [v16 doubleValue];
        double v5 = v5 + v18 * (v19 - v10);
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v13);
  }

  unint64_t v20 = [(NSMutableArray *)self->_samples count];
  double v21 = 1.0;
  if ((unint64_t)[(NSMutableArray *)self->_samples count] >= 5)
  {
    double v21 = 2.0;
    if ((unint64_t)[(NSMutableArray *)self->_samples count] >= 5
      && (unint64_t)[(NSMutableArray *)self->_samples count] <= 9)
    {
      double v21 = (double)(unint64_t)[(NSMutableArray *)self->_samples count] / 5.0;
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v22 = self->_samples;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    unint64_t v25 = 0;
    uint64_t v26 = *(void *)v35;
    double v27 = sqrt(v5 / (double)v20) * v21;
    double v28 = 0.0;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(v22);
        }
        v30 = *(void **)(*((void *)&v34 + 1) + 8 * k);
        objc_msgSend(v30, "doubleValue", (void)v34);
        if (vabdd_f64(v31, v10) <= v27)
        {
          [v30 doubleValue];
          double v28 = v28 + v32;
          ++v25;
        }
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v24);

    if (v25) {
      return (unint64_t)(v28 / (double)v25);
    }
  }
  else
  {
  }
  return (unint64_t)v10;
}

- (BOOL)isLastValid
{
  v2 = [(NSMutableArray *)self->_samples lastObject];
  BOOL v3 = (unint64_t)[v2 unsignedIntegerValue] < 0xFFFFFFFF;

  return v3;
}

- (BOOL)isAnyValid
{
  BOOL v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_8];
  uint64_t v4 = [(NSMutableArray *)self->_samples filteredArrayUsingPredicate:v3];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

BOOL __23__NPAverage_isAnyValid__block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)[a2 unsignedIntegerValue] < 0xFFFFFFFF;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  samples = self->_samples;
  if (samples && [(NSMutableArray *)samples count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v5 = self->_samples;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v3, "appendFormat:", @"%lu | ", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9++), "unsignedIntegerValue"));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    objc_msgSend(v3, "appendFormat:", @"avg = %lu", -[NPAverage average](self, "average"));
  }
  if ([v3 length]) {
    double v10 = v3;
  }
  else {
    double v10 = 0;
  }
  id v11 = v10;

  return v11;
}

- (id)shortDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  samples = self->_samples;
  if (samples && [(NSMutableArray *)samples count])
  {
    BOOL v5 = [(NSMutableArray *)self->_samples lastObject];
    objc_msgSend(v3, "appendFormat:", @"%lu", objc_msgSend(v5, "unsignedIntegerValue"));
  }
  if ([v3 length]) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (NSMutableArray)samples
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSamples:(id)a3
{
}

- (void).cxx_destruct
{
}

@end