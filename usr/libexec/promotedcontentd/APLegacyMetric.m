@interface APLegacyMetric
+ (BOOL)supportsSecureCoding;
- (APContentDataInternal)contentData;
- (APContext)context;
- (APLegacyMetric)init;
- (APLegacyMetric)initWithCoder:(id)a3;
- (APLegacyMetric)initWithPurpose:(int64_t)a3 metric:(int64_t)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 handle:(id)a7 branch:(id)a8 properties:(id)a9 internalProperties:(id)a10 relayData:(id)a11 environment:(id)a12 order:(int64_t)a13 options:(int64_t)a14;
- (APLegacyMetric)initWithPurpose:(int64_t)a3 metric:(int64_t)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 handle:(id)a7 properties:(id)a8 internalProperties:(id)a9 options:(int64_t)a10;
- (APLegacyMetric)initWithType:(int64_t)a3 purpose:(int64_t)a4 contentData:(id)a5 context:(id)a6 bundleIdentifier:(id)a7 properties:(id)a8;
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
- (void)setContentData:(id)a3;
- (void)setContext:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setHandle:(id)a3;
- (void)setInternalProperties:(id)a3;
- (void)setMetric:(int64_t)a3;
- (void)setProperties:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4 internal:(BOOL)a5;
- (void)setPurpose:(int64_t)a3;
- (void)setSource:(unsigned int)a3;
- (void)setTimestamp:(id)a3;
- (void)setTrace:(id)a3;
@end

@implementation APLegacyMetric

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (APLegacyMetric)initWithCoder:(id)a3
{
  return 0;
}

- (APLegacyMetric)initWithType:(int64_t)a3 purpose:(int64_t)a4 contentData:(id)a5 context:(id)a6 bundleIdentifier:(id)a7 properties:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  v30.receiver = self;
  v30.super_class = (Class)APLegacyMetric;
  v17 = [(APLegacyMetric *)&v30 init];
  if (v17)
  {
    uint64_t v18 = +[NSDate date];
    timestamp = v17->_timestamp;
    v17->_timestamp = (NSDate *)v18;

    v20 = +[NSUUID UUID];
    uint64_t v21 = [v20 UUIDString];
    handle = v17->handle;
    v17->handle = (NSString *)v21;

    v17->_metric = a3;
    objc_storeStrong((id *)&v17->_contentData, a5);
    objc_storeStrong((id *)&v17->_context, a6);
    uint64_t v23 = +[NSDictionary dictionary];
    properties = v17->_properties;
    v17->_properties = (NSDictionary *)v23;

    uint64_t v25 = +[NSDictionary dictionary];
    internalProperties = v17->_internalProperties;
    v17->_internalProperties = (NSDictionary *)v25;

    v17->_purpose = a4;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000D7068;
    v28[3] = &unk_100235BB0;
    v29 = v17;
    [v16 enumerateKeysAndObjectsUsingBlock:v28];
  }
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)setProperty:(id)a3 forKey:(id)a4 internal:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  id v8 = a4;
  if (v5) {
    [(APLegacyMetric *)self internalProperties];
  }
  else {
  v9 = [(APLegacyMetric *)self properties];
  }
  id v10 = [v9 mutableCopy];

  if (v12) {
    [v10 setObject:v12 forKey:v8];
  }
  else {
    [v10 removeObjectForKey:v8];
  }
  id v11 = [v10 copy];
  if (v5) {
    [(APLegacyMetric *)self setInternalProperties:v11];
  }
  else {
    [(APLegacyMetric *)self setProperties:v11];
  }
}

- (APLegacyMetric)initWithPurpose:(int64_t)a3 metric:(int64_t)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 handle:(id)a7 properties:(id)a8 internalProperties:(id)a9 options:(int64_t)a10
{
  return 0;
}

- (APLegacyMetric)initWithPurpose:(int64_t)a3 metric:(int64_t)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 handle:(id)a7 branch:(id)a8 properties:(id)a9 internalProperties:(id)a10 relayData:(id)a11 environment:(id)a12 order:(int64_t)a13 options:(int64_t)a14
{
  return 0;
}

- (APLegacyMetric)init
{
  v5.receiver = self;
  v5.super_class = (Class)APLegacyMetric;
  v2 = [(APLegacyMetric *)&v5 init];
  if (v2)
  {
    v3 = +[NSDate date];
    [(APLegacyMetric *)v2 setTimestamp:v3];
  }
  return v2;
}

- (NSString)contentIdentifier
{
  v2 = [(APLegacyMetric *)self contentData];
  v3 = [v2 content];
  v4 = [v3 identifier];

  return (NSString *)v4;
}

- (NSString)contextIdentifier
{
  v2 = [(APLegacyMetric *)self context];
  v3 = [v2 identifier];
  v4 = [v3 UUIDString];

  return (NSString *)v4;
}

- (int64_t)options
{
  return 0;
}

- (NSString)bundleIdentifier
{
  return self->bundleIdentifier;
}

- (NSString)trace
{
  return self->trace;
}

- (void)setTrace:(id)a3
{
}

- (NSDictionary)relayData
{
  return self->relayData;
}

- (int64_t)order
{
  return self->order;
}

- (NSString)handle
{
  return self->handle;
}

- (void)setHandle:(id)a3
{
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

- (unsigned)source
{
  return self->source;
}

- (void)setSource:(unsigned int)a3
{
  self->source = a3;
}

- (APContentDataInternal)contentData
{
  return (APContentDataInternal *)objc_getProperty(self, a2, 96, 1);
}

- (void)setContentData:(id)a3
{
}

- (APContext)context
{
  return (APContext *)objc_getProperty(self, a2, 104, 1);
}

- (void)setContext:(id)a3
{
}

- (int64_t)metric
{
  return self->_metric;
}

- (void)setMetric:(int64_t)a3
{
  self->_metric = a3;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSDictionary)internalProperties
{
  return self->_internalProperties;
}

- (void)setInternalProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalProperties, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contentData, 0);
  objc_storeStrong((id *)&self->branch, 0);
  objc_storeStrong((id *)&self->environment, 0);
  objc_storeStrong((id *)&self->handle, 0);
  objc_storeStrong((id *)&self->relayData, 0);
  objc_storeStrong((id *)&self->trace, 0);
  objc_storeStrong((id *)&self->contextIdentifier, 0);
  objc_storeStrong((id *)&self->contentIdentifier, 0);

  objc_storeStrong((id *)&self->bundleIdentifier, 0);
}

@end