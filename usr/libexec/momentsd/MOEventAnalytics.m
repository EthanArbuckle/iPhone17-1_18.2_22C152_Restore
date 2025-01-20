@interface MOEventAnalytics
+ (BOOL)supportsSecureCoding;
- (MOEventAnalytics)initWithCoder:(id)a3;
- (NSDictionary)patterns;
- (NSDictionary)trends;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)timeAtHomeSubType;
- (void)encodeWithCoder:(id)a3;
- (void)setPatterns:(id)a3;
- (void)setTimeAtHomeSubType:(unint64_t)a3;
- (void)setTrends:(id)a3;
@end

@implementation MOEventAnalytics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  trends = self->_trends;
  id v7 = a3;
  v5 = +[MODictionaryEncoder encodeDictionary:trends];
  [v7 encodeObject:v5 forKey:@"trends"];

  v6 = +[MODictionaryEncoder encodeDictionary:self->_patterns];
  [v7 encodeObject:v6 forKey:@"patterns"];

  [v7 encodeInteger:self->_timeAtHomeSubType forKey:@"timeAtHomeSubtype"];
}

- (MOEventAnalytics)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MOEventAnalytics;
  v5 = [(MOEventAnalytics *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trends"];
    uint64_t v7 = +[MODictionaryEncoder decodeToDictionary:v6];
    trends = v5->_trends;
    v5->_trends = (NSDictionary *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"patterns"];
    uint64_t v10 = +[MODictionaryEncoder decodeToDictionary:v9];
    patterns = v5->_patterns;
    v5->_patterns = (NSDictionary *)v10;

    v5->_timeAtHomeSubType = (unint64_t)[v4 decodeIntegerForKey:@"timeAtHomeSubtype"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOEventAnalytics);
  objc_storeStrong((id *)&v4->_trends, self->_trends);
  objc_storeStrong((id *)&v4->_patterns, self->_patterns);
  v4->_timeAtHomeSubType = self->_timeAtHomeSubType;
  return v4;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(NSDictionary *)self->_trends description];
  v5 = [(NSDictionary *)self->_patterns description];
  id v6 = [v3 initWithFormat:@"trends data, {%@}, @patterns data, %@", v4, v5];

  return v6;
}

- (NSDictionary)trends
{
  return self->_trends;
}

- (void)setTrends:(id)a3
{
}

- (NSDictionary)patterns
{
  return self->_patterns;
}

- (void)setPatterns:(id)a3
{
}

- (unint64_t)timeAtHomeSubType
{
  return self->_timeAtHomeSubType;
}

- (void)setTimeAtHomeSubType:(unint64_t)a3
{
  self->_timeAtHomeSubType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patterns, 0);

  objc_storeStrong((id *)&self->_trends, 0);
}

@end