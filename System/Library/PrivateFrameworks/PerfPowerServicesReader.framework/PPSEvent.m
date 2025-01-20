@interface PPSEvent
+ (BOOL)supportsSecureCoding;
+ (PPSEvent)eventWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5;
+ (PPSEvent)eventWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5 groupId:(unint64_t)a6;
+ (PPSEvent)eventWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5 groupId:(unint64_t)a6 label:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEvent:(id)a3;
- (NSArray)metricKeys;
- (NSArray)metricValues;
- (NSDictionary)metricKeysAndValues;
- (NSMutableDictionary)metrics;
- (NSString)label;
- (PPSEvent)initWithCoder:(id)a3;
- (PPSEvent)initWithEvent:(id)a3;
- (PPSEvent)initWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5;
- (PPSEvent)initWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5 groupId:(unint64_t)a6;
- (double)epochTimestamp;
- (double)monotonicTimestamp;
- (double)timeOffset;
- (id)JSONRepresentation;
- (id)debugDescription;
- (id)description;
- (id)dictionaryRepresentation;
- (id)logLine;
- (id)metricValueForKey:(id)a3;
- (id)metricValuesForKeys:(id)a3;
- (id)valueForKey:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)count;
- (unint64_t)groupId;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMetrics:(id)a3;
@end

@implementation PPSEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PPSEvent;
  v5 = [(PPSEvent *)&v18 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"monotonicTimestamp"];
    v5->_monotonicTimestamp = v6;
    [v4 decodeDoubleForKey:@"timeOffset"];
    v5->_timeOffset = v7;
    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"metrics"];
    metrics = v5->_metrics;
    v5->_metrics = (NSMutableDictionary *)v13;

    v5->_groupId = [v4 decodeIntegerForKey:@"groupId"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(PPSEvent *)self monotonicTimestamp];
  objc_msgSend(v4, "encodeDouble:forKey:", @"monotonicTimestamp");
  [(PPSEvent *)self timeOffset];
  objc_msgSend(v4, "encodeDouble:forKey:", @"timeOffset");
  v5 = [(PPSEvent *)self metrics];
  [v4 encodeObject:v5 forKey:@"metrics"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PPSEvent groupId](self, "groupId"), @"groupId");
  id v6 = [(PPSEvent *)self label];
  [v4 encodeObject:v6 forKey:@"label"];
}

+ (PPSEvent)eventWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5
{
  id v7 = a5;
  v8 = [[PPSEvent alloc] initWithMonotonicTimestamp:v7 timeOffset:a3 dictionary:a4];

  return v8;
}

+ (PPSEvent)eventWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5 groupId:(unint64_t)a6
{
  id v9 = a5;
  uint64_t v10 = [[PPSEvent alloc] initWithMonotonicTimestamp:v9 timeOffset:a6 dictionary:a3 groupId:a4];

  return v10;
}

+ (PPSEvent)eventWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5 groupId:(unint64_t)a6 label:(id)a7
{
  id v11 = a7;
  id v12 = a5;
  uint64_t v13 = [[PPSEvent alloc] initWithMonotonicTimestamp:v12 timeOffset:a6 dictionary:a3 groupId:a4];

  [(PPSEvent *)v13 setLabel:v11];
  return v13;
}

- (PPSEvent)initWithEvent:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PPSEvent;
  v5 = [(PPSEvent *)&v14 init];
  if (v5)
  {
    [v4 monotonicTimestamp];
    v5->_monotonicTimestamp = v6;
    [v4 timeOffset];
    v5->_timeOffset = v7;
    v8 = [v4 metricKeysAndValues];
    uint64_t v9 = [v8 mutableCopy];
    metrics = v5->_metrics;
    v5->_metrics = (NSMutableDictionary *)v9;

    v5->_groupId = [v4 groupId];
    uint64_t v11 = [v4 label];
    label = v5->_label;
    v5->_label = (NSString *)v11;
  }
  return v5;
}

- (PPSEvent)initWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5
{
  return [(PPSEvent *)self initWithMonotonicTimestamp:a5 timeOffset:-1 dictionary:a3 groupId:a4];
}

- (PPSEvent)initWithMonotonicTimestamp:(double)a3 timeOffset:(double)a4 dictionary:(id)a5 groupId:(unint64_t)a6
{
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PPSEvent;
  uint64_t v11 = [(PPSEvent *)&v16 init];
  id v12 = v11;
  if (v11)
  {
    v11->_monotonicTimestamp = a3;
    v11->_timeOffset = a4;
    uint64_t v13 = [v10 mutableCopy];
    metrics = v12->_metrics;
    v12->_metrics = (NSMutableDictionary *)v13;

    v12->_groupId = a6;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      unsigned __int8 v6 = [(PPSEvent *)self isEqualToEvent:v4];
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)PPSEvent;
      unsigned __int8 v6 = [(PPSEvent *)&v9 isEqual:v4];
    }
    BOOL v7 = v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToEvent:(id)a3
{
  id v4 = (PPSEvent *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    [(PPSEvent *)self monotonicTimestamp];
    double v6 = v5;
    [(PPSEvent *)v4 monotonicTimestamp];
    if (v6 == v7
      && ([(PPSEvent *)self timeOffset], double v9 = v8, [(PPSEvent *)v4 timeOffset], v9 == v10))
    {
      uint64_t v11 = [(PPSEvent *)self metricKeysAndValues];
      id v12 = [(PPSEvent *)v4 metricKeysAndValues];
      char v13 = [v11 isEqualToDictionary:v12];
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  [(PPSEvent *)self monotonicTimestamp];
  double v6 = v5;
  [v4 monotonicTimestamp];
  if (v6 == v7)
  {
    int64_t v8 = 0;
  }
  else
  {
    [(PPSEvent *)self monotonicTimestamp];
    double v10 = v9;
    [v4 monotonicTimestamp];
    if (v10 > v11) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = -1;
    }
  }

  return v8;
}

- (unint64_t)count
{
  v2 = [(PPSEvent *)self metrics];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [(PPSEvent *)self description];
  double v7 = [v3 stringWithFormat:@"<%@ %p> %@", v5, self, v6];

  return v7;
}

- (id)description
{
  unint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = [(PPSEvent *)self metrics];
  double v5 = [v3 dictionaryWithDictionary:v4];

  double v6 = (void *)MEMORY[0x263EFF910];
  [(PPSEvent *)self epochTimestamp];
  double v7 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");
  [v5 setObject:v7 forKeyedSubscript:@"date"];

  int64_t v8 = NSNumber;
  [(PPSEvent *)self monotonicTimestamp];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  [v5 setObject:v9 forKeyedSubscript:@"monotonicTimestamp"];

  double v10 = NSNumber;
  [(PPSEvent *)self timeOffset];
  double v11 = objc_msgSend(v10, "numberWithDouble:");
  [v5 setObject:v11 forKeyedSubscript:@"timeOffset"];

  id v12 = [v5 description];

  return v12;
}

- (id)logLine
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = (void *)MEMORY[0x263EFF9A0];
  double v5 = [(PPSEvent *)self metrics];
  double v6 = [v4 dictionaryWithDictionary:v5];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __19__PPSEvent_logLine__block_invoke;
  v13[3] = &unk_265443318;
  id v14 = v3;
  id v7 = v3;
  [v6 enumerateKeysAndObjectsUsingBlock:v13];
  int64_t v8 = [v7 sortedArrayUsingSelector:sel_compare_];
  double v9 = [v8 componentsJoinedByString:@" "];

  double v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  double v11 = [v9 stringByTrimmingCharactersInSet:v10];

  return v11;
}

void __19__PPSEvent_logLine__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [NSString stringWithFormat:@"%@=%@;", a2, a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v4];
}

- (double)epochTimestamp
{
  [(PPSEvent *)self monotonicTimestamp];
  double v4 = v3;
  [(PPSEvent *)self timeOffset];
  return v4 + v5;
}

- (unint64_t)groupId
{
  return self->_groupId;
}

- (unint64_t)hash
{
  [(PPSEvent *)self monotonicTimestamp];
  unint64_t v4 = (unint64_t)v3;
  [(PPSEvent *)self timeOffset];
  unint64_t v6 = (unint64_t)v5;
  id v7 = [(PPSEvent *)self metrics];
  unint64_t v8 = v4 ^ ((unint64_t)([v7 hash] ^ v6) << 32);

  return v8;
}

- (NSArray)metricKeys
{
  v2 = [(PPSEvent *)self metrics];
  double v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (NSArray)metricValues
{
  v2 = [(PPSEvent *)self metrics];
  double v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (NSDictionary)metricKeysAndValues
{
  v2 = [(PPSEvent *)self metrics];
  double v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (id)dictionaryRepresentation
{
  double v3 = (void *)MEMORY[0x263EFF9A0];
  unint64_t v4 = [(PPSEvent *)self metrics];
  double v5 = [v3 dictionaryWithDictionary:v4];

  unint64_t v6 = NSNumber;
  [(PPSEvent *)self monotonicTimestamp];
  id v7 = objc_msgSend(v6, "numberWithDouble:");
  [v5 setObject:v7 forKeyedSubscript:@"monotonicTimestamp"];

  unint64_t v8 = NSNumber;
  [(PPSEvent *)self epochTimestamp];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  [v5 setObject:v9 forKeyedSubscript:@"epoch"];

  double v10 = (void *)[v5 copy];
  return v10;
}

- (id)JSONRepresentation
{
  v2 = (void *)MEMORY[0x263F08900];
  double v3 = [(PPSEvent *)self dictionaryRepresentation];
  id v8 = 0;
  unint64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  id v5 = v8;

  if (v5)
  {
    unint64_t v6 = PPSReaderLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(PPSTimeSeries *)(uint64_t)v5 JSONRepresentation];
    }
  }
  return v4;
}

- (id)metricValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PPSEvent *)self metrics];
  unint64_t v6 = [v5 valueForKey:v4];

  return v6;
}

- (id)metricValuesForKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(PPSEvent *)self metrics];
  unint64_t v6 = [MEMORY[0x263EFF9D0] null];
  id v7 = [v5 objectsForKeys:v4 notFoundMarker:v6];

  return v7;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"@"])
  {
    id v5 = [v4 substringFromIndex:objc_msgSend(@"@", "length")];
    v10.receiver = self;
    v10.super_class = (Class)PPSEvent;
    uint64_t v6 = [(PPSEvent *)&v10 valueForKey:v5];
LABEL_3:
    id v7 = (void *)v6;

    goto LABEL_8;
  }
  if (([v4 isEqualToString:@"monotonicTimestamp"] & 1) != 0
    || [v4 isEqualToString:@"timestamp"])
  {
    id v8 = NSNumber;
    [(PPSEvent *)self monotonicTimestamp];
  }
  else
  {
    if (![v4 isEqualToString:@"epochTimestamp"])
    {
      id v5 = [(PPSEvent *)self metrics];
      uint64_t v6 = [v5 objectForKey:v4];
      goto LABEL_3;
    }
    id v8 = NSNumber;
    [(PPSEvent *)self epochTimestamp];
  }
  id v7 = objc_msgSend(v8, "numberWithDouble:");
LABEL_8:

  return v7;
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (double)monotonicTimestamp
{
  return self->_monotonicTimestamp;
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (NSMutableDictionary)metrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetrics:(id)a3
{
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end