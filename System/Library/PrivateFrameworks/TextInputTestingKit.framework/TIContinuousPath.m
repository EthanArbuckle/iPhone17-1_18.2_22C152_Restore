@interface TIContinuousPath
+ (BOOL)supportsSecureCoding;
- (NSArray)samples;
- (TIContinuousPath)init;
- (TIContinuousPath)initWithCoder:(id)a3;
- (TIContinuousPath)initWithJsonDictionary:(id)a3;
- (TIContinuousPath)initWithTimeStamp:(double)a3;
- (double)timeStamp;
- (id)description;
- (id)toJsonDictionary;
- (void)addSample:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIContinuousPath

- (void).cxx_destruct
{
}

- (NSArray)samples
{
  return &self->_samples->super;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_samples;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"; sample = %@", *(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [v3 appendString:@">"];
  return v3;
}

- (id)toJsonDictionary
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_samples;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "toJsonDictionary", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:@"samples"];
  return v3;
}

- (void)addSample:(id)a3
{
}

- (TIContinuousPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIContinuousPath;
  uint64_t v5 = [(TIContinuousPath *)&v13 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"samples"];
    uint64_t v10 = [v9 copy];
    samples = v5->_samples;
    v5->_samples = (NSMutableArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (double)timeStamp
{
  v2 = [(NSMutableArray *)self->_samples objectAtIndexedSubscript:0];
  [v2 timeStamp];
  double v4 = v3;

  return v4;
}

- (TIContinuousPath)initWithJsonDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TIContinuousPath;
  uint64_t v5 = [(TIContinuousPath *)&v19 init];
  if (v5)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    samples = v5->_samples;
    v5->_samples = v6;

    uint64_t v8 = [v4 objectForKey:@"samples"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_super v13 = [[TIContinuousPathSample alloc] initWithJsonDictionary:*(void *)(*((void *)&v15 + 1) + 8 * v12)];
          [(TIContinuousPath *)v5 addSample:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
  return v5;
}

- (TIContinuousPath)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIContinuousPath;
  v2 = [(TIContinuousPath *)&v6 init];
  if (v2)
  {
    double v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    samples = v2->_samples;
    v2->_samples = v3;
  }
  return v2;
}

- (TIContinuousPath)initWithTimeStamp:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TIContinuousPath;
  double v3 = [(TIContinuousPath *)&v7 init];
  if (v3)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    samples = v3->_samples;
    v3->_samples = v4;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end