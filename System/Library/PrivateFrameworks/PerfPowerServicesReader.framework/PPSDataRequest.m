@interface PPSDataRequest
+ (BOOL)supportsSecureCoding;
- (NSDateInterval)timeFilter;
- (NSPredicate)predicate;
- (NSPredicate)valueFilter;
- (NSSet)metrics;
- (NSString)category;
- (NSString)subsystem;
- (PPSDataRequest)initWithCoder:(id)a3;
- (PPSDataRequest)initWithRequestType:(int64_t)a3 metrics:(id)a4 predicate:(id)a5 timeFilter:(id)a6;
- (id)description;
- (int64_t)requestType;
- (void)encodeWithCoder:(id)a3;
- (void)setMetrics:(id)a3;
@end

@implementation PPSDataRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSDataRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PPSDataRequest;
  v5 = [(PPSDataRequest *)&v16 init];
  if (v5)
  {
    v5->_requestType = [v4 decodeIntegerForKey:@"type"];
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"metrics"];
    metrics = v5->_metrics;
    v5->_metrics = (NSSet *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeFilter"];
    timeFilter = v5->_timeFilter;
    v5->_timeFilter = (NSDateInterval *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PPSDataRequest requestType](self, "requestType"), @"type");
  v5 = [(PPSDataRequest *)self metrics];
  [v4 encodeObject:v5 forKey:@"metrics"];

  v6 = [(PPSDataRequest *)self predicate];
  [v4 encodeObject:v6 forKey:@"predicate"];

  id v7 = [(PPSDataRequest *)self timeFilter];
  [v4 encodeObject:v7 forKey:@"timeFilter"];
}

- (PPSDataRequest)initWithRequestType:(int64_t)a3 metrics:(id)a4 predicate:(id)a5 timeFilter:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PPSDataRequest;
  v14 = [(PPSDataRequest *)&v19 init];
  v15 = v14;
  if (v14)
  {
    v14->_requestType = a3;
    objc_storeStrong((id *)&v14->_metrics, a4);
    uint64_t v16 = +[PPSPredicateUtilities predicateByReplacingNilWithEmptyString:v12];
    predicate = v15->_predicate;
    v15->_predicate = (NSPredicate *)v16;

    objc_storeStrong((id *)&v15->_timeFilter, a6);
  }

  return v15;
}

- (NSString)category
{
  v2 = [(PPSDataRequest *)self predicate];
  v3 = +[PPSPredicateUtilities constantValueForLeftKeyPath:@"category" inPredicate:v2];

  return (NSString *)v3;
}

- (NSString)subsystem
{
  v2 = [(PPSDataRequest *)self predicate];
  v3 = +[PPSPredicateUtilities constantValueForLeftKeyPath:@"subsystem" inPredicate:v2];

  return (NSString *)v3;
}

- (NSPredicate)valueFilter
{
  v2 = [(PPSDataRequest *)self predicate];
  v3 = +[PPSPredicateUtilities predicateByRemovingSubpredicateWithLeftKeyPath:@"subsystem" fromPredicate:v2];

  id v4 = +[PPSPredicateUtilities predicateByRemovingSubpredicateWithLeftKeyPath:@"category" fromPredicate:v3];

  return (NSPredicate *)v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(PPSDataRequest *)self requestType];
  v6 = [(PPSDataRequest *)self metrics];
  id v7 = [(PPSDataRequest *)self predicate];
  v8 = [(PPSDataRequest *)self timeFilter];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p { type: %ld, metrics: %@, predicate: %@, timeFilter: %@ }>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (NSSet)metrics
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetrics:(id)a3
{
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 24, 1);
}

- (NSDateInterval)timeFilter
{
  return (NSDateInterval *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeFilter, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end