@interface TPSAnalyticsEventSearchPerformed
+ (BOOL)supportsSecureCoding;
+ (id)eventWithSearchID:(id)a3 searchTerm:(id)a4 invocationMethod:(id)a5;
- (NSString)collectionID;
- (NSString)correlationID;
- (NSString)invocationMethod;
- (NSString)searchID;
- (NSString)searchTerm;
- (NSString)tipID;
- (TPSAnalyticsEventSearchPerformed)initWithCoder:(id)a3;
- (double)relevance;
- (id)_initWithSearchID:(id)a3 searchTerm:(id)a4 invocationMethod:(id)a5;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (int64_t)resultOrder;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setInvocationMethod:(id)a3;
- (void)setRelevance:(double)a3;
- (void)setResultOrder:(int64_t)a3;
- (void)setSearchID:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)setTipID:(id)a3;
@end

@implementation TPSAnalyticsEventSearchPerformed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventSearchPerformed)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TPSAnalyticsEventSearchPerformed;
  v5 = [(TPSAnalyticsEvent *)&v20 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"search_id"];
    searchID = v5->_searchID;
    v5->_searchID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"search_term"];
    searchTerm = v5->_searchTerm;
    v5->_searchTerm = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invocation_method"];
    invocationMethod = v5->_invocationMethod;
    v5->_invocationMethod = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_id"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_id"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collection_id"];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v16;

    [v4 decodeDoubleForKey:@"relevance"];
    v5->_relevance = v18;
    v5->_resultOrder = [v4 decodeIntegerForKey:@"result_place"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventSearchPerformed;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchID, @"search_id", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_searchTerm forKey:@"search_term"];
  [v4 encodeObject:self->_invocationMethod forKey:@"invocation_method"];
  [v4 encodeObject:self->_tipID forKey:@"tip_id"];
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_id"];
  [v4 encodeObject:self->_collectionID forKey:@"collection_id"];
  [v4 encodeDouble:@"relevance" forKey:self->_relevance];
  [v4 encodeInteger:self->_resultOrder forKey:@"result_place"];
}

- (id)_initWithSearchID:(id)a3 searchTerm:(id)a4 invocationMethod:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventSearchPerformed;
  v13 = [(TPSAnalyticsEvent *)&v15 initWithDate:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_searchID, a3);
    objc_storeStrong((id *)&v13->_searchTerm, a4);
    objc_storeStrong((id *)&v13->_invocationMethod, a5);
  }

  return v13;
}

+ (id)eventWithSearchID:(id)a3 searchTerm:(id)a4 invocationMethod:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) _initWithSearchID:v10 searchTerm:v9 invocationMethod:v8];

  return v11;
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"search_performed"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_searchID forKeyedSubscript:@"search_id"];
  [v3 setObject:self->_searchTerm forKeyedSubscript:@"search_term"];
  [v3 setObject:self->_invocationMethod forKeyedSubscript:@"invocation_method"];
  [v3 setObject:self->_tipID forKeyedSubscript:@"tip_id"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_id"];
  [v3 setObject:self->_collectionID forKeyedSubscript:@"collection_id"];
  id v4 = [NSNumber numberWithDouble:self->_relevance];
  [v3 setObject:v4 forKeyedSubscript:@"relevance"];

  objc_super v5 = [NSNumber numberWithInteger:self->_resultOrder];
  [v3 setObject:v5 forKeyedSubscript:@"result_place"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v6 forKeyedSubscript:@"u65_flag"];

  return v3;
}

- (NSString)searchID
{
  return self->_searchID;
}

- (void)setSearchID:(id)a3
{
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
}

- (NSString)invocationMethod
{
  return self->_invocationMethod;
}

- (void)setInvocationMethod:(id)a3
{
}

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (double)relevance
{
  return self->_relevance;
}

- (void)setRelevance:(double)a3
{
  self->_relevance = a3;
}

- (int64_t)resultOrder
{
  return self->_resultOrder;
}

- (void)setResultOrder:(int64_t)a3
{
  self->_resultOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
  objc_storeStrong((id *)&self->_invocationMethod, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_searchID, 0);
}

@end