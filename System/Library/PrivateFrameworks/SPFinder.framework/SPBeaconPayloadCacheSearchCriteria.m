@interface SPBeaconPayloadCacheSearchCriteria
+ (BOOL)supportsSecureCoding;
- (NSNumber)fetchLimit;
- (SPBeaconPayloadCacheSearchCriteria)initWithCoder:(id)a3;
- (SPSearchResultMarker)searchResultMarker;
- (void)encodeWithCoder:(id)a3;
- (void)setFetchLimit:(id)a3;
- (void)setSearchResultMarker:(id)a3;
@end

@implementation SPBeaconPayloadCacheSearchCriteria

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconPayloadCacheSearchCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchResultMarker"];
  [(SPBeaconPayloadCacheSearchCriteria *)self setSearchResultMarker:v5];

  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fetchLimit"];

  [(SPBeaconPayloadCacheSearchCriteria *)self setFetchLimit:v6];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SPBeaconPayloadCacheSearchCriteria *)self searchResultMarker];
  [v4 encodeObject:v5 forKey:@"searchResultMarker"];

  id v6 = [(SPBeaconPayloadCacheSearchCriteria *)self fetchLimit];
  [v4 encodeObject:v6 forKey:@"fetchLimit"];
}

- (SPSearchResultMarker)searchResultMarker
{
  return self->_searchResultMarker;
}

- (void)setSearchResultMarker:(id)a3
{
}

- (NSNumber)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchLimit, 0);
  objc_storeStrong((id *)&self->_searchResultMarker, 0);
}

@end