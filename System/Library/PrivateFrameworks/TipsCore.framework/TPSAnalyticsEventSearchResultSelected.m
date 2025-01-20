@interface TPSAnalyticsEventSearchResultSelected
+ (BOOL)supportsSecureCoding;
+ (id)eventWithSearchID:(id)a3 searchTerm:(id)a4 tipID:(id)a5 collectionID:(id)a6 correlationID:(id)a7;
- (NSString)collectionID;
- (NSString)correlationID;
- (NSString)searchID;
- (NSString)searchTerm;
- (NSString)tipID;
- (TPSAnalyticsEventSearchResultSelected)initWithCoder:(id)a3;
- (id)_initWithSearchID:(id)a3 searchTerm:(id)a4 tipID:(id)a5 collectionID:(id)a6 correlationID:(id)a7;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setSearchID:(id)a3;
- (void)setSearchTerm:(id)a3;
- (void)setTipID:(id)a3;
@end

@implementation TPSAnalyticsEventSearchResultSelected

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventSearchResultSelected)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TPSAnalyticsEventSearchResultSelected;
  v5 = [(TPSAnalyticsEvent *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"search_id"];
    searchID = v5->_searchID;
    v5->_searchID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"search_term"];
    searchTerm = v5->_searchTerm;
    v5->_searchTerm = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_id"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collection_id"];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_id"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventSearchResultSelected;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchID, @"search_id", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_searchTerm forKey:@"search_term"];
  [v4 encodeObject:self->_tipID forKey:@"tip_id"];
  [v4 encodeObject:self->_collectionID forKey:@"collection_id"];
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_id"];
}

- (id)_initWithSearchID:(id)a3 searchTerm:(id)a4 tipID:(id)a5 collectionID:(id)a6 correlationID:(id)a7
{
  id v20 = a3;
  id v19 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [MEMORY[0x1E4F1C9C8] date];
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsEventSearchResultSelected;
  objc_super v17 = [(TPSAnalyticsEvent *)&v21 initWithDate:v16];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_searchID, a3);
    objc_storeStrong((id *)&v17->_searchTerm, a4);
    objc_storeStrong((id *)&v17->_tipID, a5);
    objc_storeStrong((id *)&v17->_collectionID, a6);
    objc_storeStrong((id *)&v17->_correlationID, a7);
  }

  return v17;
}

+ (id)eventWithSearchID:(id)a3 searchTerm:(id)a4 tipID:(id)a5 collectionID:(id)a6 correlationID:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  objc_super v17 = (void *)[objc_alloc((Class)a1) _initWithSearchID:v16 searchTerm:v15 tipID:v14 collectionID:v13 correlationID:v12];

  return v17;
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"search_result_selected"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_searchID forKeyedSubscript:@"search_id"];
  [v3 setObject:self->_searchTerm forKeyedSubscript:@"search_term"];
  [v3 setObject:self->_tipID forKeyedSubscript:@"tip_id"];
  [v3 setObject:self->_collectionID forKeyedSubscript:@"collection_id"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_id"];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v4 forKeyedSubscript:@"u65_flag"];

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

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_searchID, 0);
}

@end