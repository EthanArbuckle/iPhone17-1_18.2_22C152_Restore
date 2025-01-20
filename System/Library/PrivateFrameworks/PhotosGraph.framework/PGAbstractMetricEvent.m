@interface PGAbstractMetricEvent
- (BOOL)shouldReportMetrics;
- (NSDictionary)payload;
- (NSString)description;
- (NSString)identifier;
@end

@implementation PGAbstractMetricEvent

- (BOOL)shouldReportMetrics
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  v9 = [v5 stringWithFormat:@"%@ must implement %@", v7, v8];
  v10 = (void *)[v3 initWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSString)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PGAbstractMetricEvent;
  uint64_t v4 = [(PGAbstractMetricEvent *)&v10 description];
  v5 = [(id)objc_opt_class() description];
  v6 = [(PGAbstractMetricEvent *)self identifier];
  v7 = [(PGAbstractMetricEvent *)self payload];
  v8 = [v3 stringWithFormat:@"%@ %@:\nIdentifier:%@\nPayload:%@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (NSDictionary)payload
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  v9 = [v5 stringWithFormat:@"%@ must implement %@", v7, v8];
  objc_super v10 = (void *)[v3 initWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSString)identifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  v9 = [v5 stringWithFormat:@"%@ must implement %@", v7, v8];
  objc_super v10 = (void *)[v3 initWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

@end