@interface MockAPMetric
+ (BOOL)supportsSecureCoding;
- (MockAPMetric)initWithCoder:(id)a3;
- (MockAPMetric)initWithPurpose:(int64_t)a3 metric:(int64_t)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 handle:(id)a7 branch:(id)a8 properties:(id)a9 internalProperties:(id)a10 relayData:(id)a11 environment:(id)a12 order:(int64_t)a13 options:(int64_t)a14;
- (MockAPMetric)initWithPurpose:(int64_t)a3 metric:(int64_t)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 handle:(id)a7 properties:(id)a8 internalProperties:(id)a9 options:(int64_t)a10;
- (NSArray)branch;
- (NSArray)environment;
- (NSDate)timestamp;
- (NSDictionary)internalProperties;
- (NSDictionary)properties;
- (NSDictionary)relayData;
- (NSString)bundleIdentifier;
- (NSString)contentIdentifier;
- (NSString)contextIdentifier;
- (NSString)handle;
- (NSString)trace;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)metric;
- (int64_t)options;
- (int64_t)order;
- (int64_t)purpose;
- (unsigned)source;
- (void)setBranch:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setHandle:(id)a3;
- (void)setSource:(unsigned int)a3;
- (void)setTrace:(id)a3;
@end

@implementation MockAPMetric

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return @"nil";
}

- (MockAPMetric)initWithCoder:(id)a3
{
  return 0;
}

- (MockAPMetric)initWithPurpose:(int64_t)a3 metric:(int64_t)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 handle:(id)a7 properties:(id)a8 internalProperties:(id)a9 options:(int64_t)a10
{
  id v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)MockAPMetric;
  v13 = [(MockAPMetric *)&v16 init];
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_handle, a7);
  }

  return v14;
}

- (MockAPMetric)initWithPurpose:(int64_t)a3 metric:(int64_t)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 handle:(id)a7 branch:(id)a8 properties:(id)a9 internalProperties:(id)a10 relayData:(id)a11 environment:(id)a12 order:(int64_t)a13 options:(int64_t)a14
{
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MockAPMetric;
  v17 = [(MockAPMetric *)&v20 init];
  v18 = v17;
  if (v17) {
    objc_storeStrong((id *)&v17->_handle, a7);
  }

  return v18;
}

- (NSString)bundleIdentifier
{
  v2 = [(MockAPMetric *)self internalProperties];
  v3 = [v2 objectForKey:kAPMetricBundleIdentifierKey];

  return (NSString *)v3;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (int64_t)metric
{
  return self->_metric;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (NSDictionary)internalProperties
{
  return self->_internalProperties;
}

- (int64_t)options
{
  return self->_options;
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)trace
{
  return self->trace;
}

- (void)setTrace:(id)a3
{
}

- (unsigned)source
{
  return self->source;
}

- (void)setSource:(unsigned int)a3
{
  self->source = a3;
}

- (NSDictionary)relayData
{
  return self->relayData;
}

- (int64_t)order
{
  return self->order;
}

- (NSArray)environment
{
  return self->environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSArray)branch
{
  return self->branch;
}

- (void)setBranch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->branch, 0);
  objc_storeStrong((id *)&self->environment, 0);
  objc_storeStrong((id *)&self->relayData, 0);
  objc_storeStrong((id *)&self->trace, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_internalProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end