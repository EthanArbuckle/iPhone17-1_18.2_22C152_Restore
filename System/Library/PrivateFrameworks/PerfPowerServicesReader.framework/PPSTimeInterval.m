@interface PPSTimeInterval
+ (BOOL)supportsSecureCoding;
- (BOOL)containsTimeInterval:(id)a3;
- (BOOL)containsTimestamp:(double)a3;
- (BOOL)intersectsTimeInterval:(id)a3;
- (BOOL)isAdjacentToTimeInterval:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)dictionary;
- (NSDictionary)payload;
- (PPSTimeInterval)initWithCoder:(id)a3;
- (PPSTimeInterval)initWithStartTimestamp:(double)a3 endTimestamp:(double)a4 payload:(id)a5;
- (double)duration;
- (double)endTimestamp;
- (double)startTimestamp;
- (id)JSONRepresentation;
- (id)debugDescription;
- (id)description;
- (id)intersectionWithTimeInterval:(id)a3;
- (id)subtractTimeInterval:(id)a3;
- (id)unionWithTimeInterval:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSTimeInterval

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [(PPSTimeInterval *)self endTimestamp];
  objc_msgSend(v5, "encodeDouble:forKey:", @"endTimestamp");
  [(PPSTimeInterval *)self startTimestamp];
  objc_msgSend(v5, "encodeDouble:forKey:", @"startTimestamp");
  v4 = [(PPSTimeInterval *)self payload];
  [v5 encodeObject:v4 forKey:@"payload"];
}

- (PPSTimeInterval)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSTimeInterval;
  id v5 = [(PPSTimeInterval *)&v11 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"endTimestamp"];
    v5->_endTimestamp = v6;
    [v4 decodeDoubleForKey:@"startTimestamp"];
    v5->_startTimestamp = v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSTimeInterval)initWithStartTimestamp:(double)a3 endTimestamp:(double)a4 payload:(id)a5
{
  id v8 = a5;
  if (a3 >= a4)
  {
    v12 = PPSReaderLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PPSTimeInterval initWithStartTimestamp:endTimestamp:payload:]((uint64_t)self, v12);
    }

    v10 = 0;
    goto LABEL_7;
  }
  v14.receiver = self;
  v14.super_class = (Class)PPSTimeInterval;
  v9 = [(PPSTimeInterval *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_startTimestamp = a3;
    v9->_endTimestamp = a4;
    objc_super v11 = (NSDictionary *)v8;
    self = (PPSTimeInterval *)v10->_payload;
    v10->_payload = v11;
LABEL_7:
  }
  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF910];
  [(PPSTimeInterval *)self startTimestamp];
  double v6 = objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
  double v7 = (void *)MEMORY[0x263EFF910];
  [v4 startTimestamp];
  id v8 = objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
  int64_t v9 = [v6 compare:v8];

  return v9;
}

- (unint64_t)hash
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(PPSTimeInterval *)self startTimestamp];
  if (v3 == 0.0) {
    unint64_t v4 = 2654435769;
  }
  else {
    unint64_t v4 = *(void *)&v3 + 2654435769;
  }
  [(PPSTimeInterval *)self endTimestamp];
  long long v14 = 0u;
  long long v15 = 0u;
  if (v5 == 0.0) {
    uint64_t v6 = 2654435769;
  }
  else {
    uint64_t v6 = *(void *)&v5 + 2654435769;
  }
  long long v16 = 0uLL;
  long long v17 = 0uLL;
  double v7 = [(PPSTimeInterval *)self payload];
  id v8 = [v7 allValues];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  unint64_t v10 = (v6 + (v4 << 6) + (v4 >> 2)) ^ v4;
  if (v9)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v10 ^= (v10 << 6) + 2654435769u + (v10 >> 2) + [*(id *)(*((void *)&v14 + 1) + 8 * i) hash];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unsigned __int8 v7 = 0;
    goto LABEL_18;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    id v8 = (PPSTimeInterval *)v5;
    if (self == v8)
    {
      unsigned __int8 v7 = 1;
    }
    else
    {
      [(PPSTimeInterval *)self startTimestamp];
      double v10 = v9;
      [(PPSTimeInterval *)v8 startTimestamp];
      if (v10 == v11)
      {
        [(PPSTimeInterval *)self endTimestamp];
        double v13 = v12;
        [(PPSTimeInterval *)v8 endTimestamp];
        if (v13 == v14)
        {
          long long v15 = [(PPSTimeInterval *)self payload];
          if (v15
            || ([(PPSTimeInterval *)v8 payload], (double v3 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            long long v16 = [(PPSTimeInterval *)self payload];
            long long v17 = [(PPSTimeInterval *)v8 payload];
            unsigned __int8 v7 = [v16 isEqualToDictionary:v17];

            if (v15)
            {
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {
            unsigned __int8 v7 = 1;
          }

          goto LABEL_16;
        }
      }
      unsigned __int8 v7 = 0;
    }
LABEL_17:

    goto LABEL_18;
  }
  v19.receiver = self;
  v19.super_class = (Class)PPSTimeInterval;
  unsigned __int8 v7 = [(PPSTimeInterval *)&v19 isEqual:v5];
LABEL_18:

  return v7;
}

- (id)JSONRepresentation
{
  v2 = (void *)MEMORY[0x263F08900];
  double v3 = [(PPSTimeInterval *)self dictionary];
  id v8 = 0;
  unint64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (v5)
  {
    uint64_t v6 = PPSReaderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(PPSTimeSeries *)(uint64_t)v5 JSONRepresentation];
    }
  }
  return v4;
}

- (id)debugDescription
{
  double v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PPSTimeInterval *)self description];
  unsigned __int8 v7 = [v3 stringWithFormat:@"<%@ %p> %@", v5, self, v6];

  return v7;
}

- (id)description
{
  v2 = [(PPSTimeInterval *)self dictionary];
  double v3 = [v2 description];

  return v3;
}

- (NSDictionary)dictionary
{
  v12[3] = *MEMORY[0x263EF8340];
  v11[0] = @"endTimestamp";
  double v3 = NSNumber;
  [(PPSTimeInterval *)self startTimestamp];
  unint64_t v4 = objc_msgSend(v3, "numberWithDouble:");
  v12[0] = v4;
  v11[1] = @"startTimestamp";
  id v5 = NSNumber;
  [(PPSTimeInterval *)self endTimestamp];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  v12[1] = v6;
  v11[2] = @"payload";
  unsigned __int8 v7 = [(PPSTimeInterval *)self payload];
  id v8 = (void *)[v7 copy];
  v12[2] = v8;
  double v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  return (NSDictionary *)v9;
}

- (double)duration
{
  [(PPSTimeInterval *)self endTimestamp];
  double v4 = v3;
  [(PPSTimeInterval *)self startTimestamp];
  return v4 - v5;
}

- (BOOL)containsTimeInterval:(id)a3
{
  id v4 = a3;
  [(PPSTimeInterval *)self startTimestamp];
  double v6 = v5;
  [v4 startTimestamp];
  if (v6 <= v7)
  {
    [(PPSTimeInterval *)self endTimestamp];
    double v10 = v9;
    [v4 endTimestamp];
    BOOL v8 = v10 >= v11;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)containsTimestamp:(double)a3
{
  [(PPSTimeInterval *)self startTimestamp];
  if (v5 > a3) {
    return 0;
  }
  [(PPSTimeInterval *)self endTimestamp];
  return v7 > a3;
}

- (id)intersectionWithTimeInterval:(id)a3
{
  id v4 = a3;
  if ([(PPSTimeInterval *)self intersectsTimeInterval:v4])
  {
    id v5 = objc_alloc((Class)objc_opt_class());
    [(PPSTimeInterval *)self startTimestamp];
    double v7 = v6;
    [v4 startTimestamp];
    double v9 = v8;
    [(PPSTimeInterval *)self endTimestamp];
    double v11 = v10;
    [v4 endTimestamp];
    double v13 = v12;
    double v14 = [(PPSTimeInterval *)self payload];
    long long v15 = objc_msgSend(v5, "initWithStartTimestamp:endTimestamp:payload:", v14, fmax(v7, v9), fmin(v11, v13));
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (BOOL)intersectsTimeInterval:(id)a3
{
  id v4 = a3;
  [v4 endTimestamp];
  double v6 = v5;
  [(PPSTimeInterval *)self startTimestamp];
  if (v6 <= v7)
  {
    BOOL v11 = 0;
  }
  else
  {
    [(PPSTimeInterval *)self endTimestamp];
    double v9 = v8;
    [v4 startTimestamp];
    BOOL v11 = v9 > v10;
  }

  return v11;
}

- (BOOL)isAdjacentToTimeInterval:(id)a3
{
  id v4 = a3;
  [(PPSTimeInterval *)self startTimestamp];
  double v6 = v5;
  [v4 endTimestamp];
  if (v6 == v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    [v4 startTimestamp];
    double v10 = v9;
    [(PPSTimeInterval *)self endTimestamp];
    BOOL v8 = v10 == v11;
  }

  return v8;
}

- (id)subtractTimeInterval:(id)a3
{
  v49[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(PPSTimeInterval *)self intersectsTimeInterval:v4])
  {
    v49[0] = self;
    double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:1];
    goto LABEL_19;
  }
  if ([v4 containsTimeInterval:self])
  {
    double v5 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_19;
  }
  double v6 = [(PPSTimeInterval *)self intersectionWithTimeInterval:v4];
  int64_t v7 = [(PPSTimeInterval *)self compare:v4];
  if (v7 == -1)
  {
    id v19 = objc_alloc((Class)objc_opt_class());
    [(PPSTimeInterval *)self startTimestamp];
    double v21 = v20;
    [v6 startTimestamp];
    double v23 = v22;
    v24 = [(PPSTimeInterval *)self payload];
    long long v17 = (void *)[v19 initWithStartTimestamp:v24 endTimestamp:v21 payload:v23];

    [(PPSTimeInterval *)self endTimestamp];
    double v26 = v25;
    [v4 endTimestamp];
    if (v26 > v27)
    {
      id v28 = objc_alloc((Class)objc_opt_class());
      [v6 endTimestamp];
      double v30 = v29;
      [(PPSTimeInterval *)self endTimestamp];
      double v32 = v31;
      v33 = [(PPSTimeInterval *)self payload];
      v34 = (void *)[v28 initWithStartTimestamp:v33 endTimestamp:v30 payload:v32];

      v47[0] = v17;
      v47[1] = v34;
      double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];

LABEL_17:
      goto LABEL_18;
    }
    v48 = v17;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
LABEL_16:
    double v5 = (void *)v18;
    goto LABEL_17;
  }
  if (v7)
  {
    if (v7 == 1)
    {
      [(PPSTimeInterval *)self endTimestamp];
      double v9 = v8;
      [v4 endTimestamp];
      if (v9 > v10)
      {
        id v11 = objc_alloc((Class)objc_opt_class());
        [v6 endTimestamp];
        double v13 = v12;
        [(PPSTimeInterval *)self endTimestamp];
        double v15 = v14;
        long long v16 = [(PPSTimeInterval *)self payload];
        long long v17 = (void *)[v11 initWithStartTimestamp:v16 endTimestamp:v13 payload:v15];

        v45 = v17;
        uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
        goto LABEL_16;
      }
    }
  }
  else
  {
    [v4 endTimestamp];
    double v36 = v35;
    [(PPSTimeInterval *)self endTimestamp];
    if (v36 > v37)
    {
      id v38 = objc_alloc((Class)objc_opt_class());
      [v6 endTimestamp];
      double v40 = v39;
      [v4 endTimestamp];
      double v42 = v41;
      v43 = [v4 payload];
      long long v17 = (void *)[v38 initWithStartTimestamp:v43 endTimestamp:v40 payload:v42];

      v46 = v17;
      uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
      goto LABEL_16;
    }
  }
  double v5 = (void *)MEMORY[0x263EFFA68];
LABEL_18:

LABEL_19:
  return v5;
}

- (id)unionWithTimeInterval:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = (PPSTimeInterval *)a3;
  int64_t v5 = [(PPSTimeInterval *)self compare:v4];
  if ([(PPSTimeInterval *)self intersectsTimeInterval:v4]
    || [(PPSTimeInterval *)self isAdjacentToTimeInterval:v4])
  {
    [(PPSTimeInterval *)self startTimestamp];
    double v7 = v6;
    [(PPSTimeInterval *)v4 startTimestamp];
    double v9 = v8;
    [(PPSTimeInterval *)self endTimestamp];
    double v11 = v10;
    [(PPSTimeInterval *)v4 endTimestamp];
    double v13 = v12;
    id v14 = objc_alloc((Class)objc_opt_class());
    double v15 = [(PPSTimeInterval *)self payload];
    long long v16 = objc_msgSend(v14, "initWithStartTimestamp:endTimestamp:payload:", v15, fmin(v7, v9), fmax(v11, v13));
    v22[0] = v16;
    long long v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  }
  else
  {
    if (v5 == -1)
    {
      double v21 = self;
      uint64_t v18 = &v21;
      self = v4;
    }
    else
    {
      double v20 = v4;
      uint64_t v18 = &v20;
    }
    v18[1] = self;
    long long v17 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v20);
  }

  return v17;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (NSDictionary)payload
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (void).cxx_destruct
{
}

- (void)initWithStartTimestamp:(uint64_t)a1 endTimestamp:(NSObject *)a2 payload:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_258F16000, a2, OS_LOG_TYPE_DEBUG, "Couldn't initialize <PPSTimeInterval>: %p> due to invalid boundaries", (uint8_t *)&v2, 0xCu);
}

@end