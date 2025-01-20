@interface WiFi3BarsResponse
+ (BOOL)supportsSecureCoding;
- (NSDictionary)results;
- (WiFi3BarsResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation WiFi3BarsResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFi3BarsResponse)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WiFi3BarsResponse;
  id v3 = a3;
  v4 = [(WiFi3BarsResponse *)&v11 init];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  uint64_t v8 = [v3 decodeObjectOfClasses:v7 forKey:@"results"];

  results = v4->_results;
  v4->_results = (NSDictionary *)v8;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end