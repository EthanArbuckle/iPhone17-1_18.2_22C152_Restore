@interface PPSHistogramRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)dimensions;
- (PPSHistogramRequest)initWithCoder:(id)a3;
- (PPSHistogramRequest)initWithDimensions:(id)a3 predicate:(id)a4 timeFilter:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSHistogramRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSHistogramRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSHistogramRequest;
  v5 = [(PPSDataRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"dimensions"];
    dimensions = v5->_dimensions;
    v5->_dimensions = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PPSHistogramRequest;
  id v4 = a3;
  [(PPSDataRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_dimensions, @"dimensions", v5.receiver, v5.super_class);
}

- (PPSHistogramRequest)initWithDimensions:(id)a3 predicate:(id)a4 timeFilter:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_super v12 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v9, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v23 + 1) + 8 * v17) metricName];
        [v12 addObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  v19 = (void *)[v12 copy];
  v22.receiver = self;
  v22.super_class = (Class)PPSHistogramRequest;
  v20 = [(PPSDataRequest *)&v22 initWithRequestType:1 metrics:v19 predicate:v10 timeFilter:v11];

  if (v20) {
    objc_storeStrong((id *)&v20->_dimensions, a3);
  }

  return v20;
}

- (id)description
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(PPSDataRequest *)self requestType];
  v6 = [(PPSDataRequest *)self metrics];
  uint64_t v7 = [(PPSDataRequest *)self predicate];
  v8 = [(PPSDataRequest *)self timeFilter];
  id v9 = [v3 stringWithFormat:@"<%@: %p { type: %ld, metrics: %@, predicate: %@, timeFilter: %@ ", v4, self, v5, v6, v7, v8];

  dimensions = self->_dimensions;
  if (dimensions)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obj = dimensions;
    uint64_t v32 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(obj);
          }
          objc_super v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v13 = [v12 edges];
          uint64_t v14 = [v13 count];

          if (v14)
          {
            uint64_t v33 = i;
            [v9 appendString:@"edges:["];
            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            uint64_t v15 = [v12 edges];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = 0;
              uint64_t v19 = *(void *)v36;
              do
              {
                uint64_t v20 = 0;
                uint64_t v34 = v18;
                uint64_t v21 = v18 + 1;
                do
                {
                  if (*(void *)v36 != v19) {
                    objc_enumerationMutation(v15);
                  }
                  [*(id *)(*((void *)&v35 + 1) + 8 * v20) doubleValue];
                  objc_msgSend(v9, "appendFormat:", @"%f", v22);
                  long long v23 = [v12 edges];
                  uint64_t v24 = [v23 count];

                  if (v21 + v20 != v24) {
                    [v9 appendString:@", "];
                  }
                  ++v20;
                }
                while (v17 != v20);
                uint64_t v18 = v34 + v17;
                uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
              }
              while (v17);
            }

            [v9 appendString:@"]"];
            uint64_t i = v33;
          }
          else
          {
            uint64_t v25 = [v12 size];
            [v12 range];
            uint64_t v27 = v26;
            [v12 range];
            objc_msgSend(v9, "appendFormat:", @"binCount:%lu minRange:%f maxRange:%f", v25, v27, v28);
          }
        }
        uint64_t v32 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v32);
    }
  }
  [v9 appendString:@" }>"];
  return v9;
}

- (NSArray)dimensions
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
}

@end