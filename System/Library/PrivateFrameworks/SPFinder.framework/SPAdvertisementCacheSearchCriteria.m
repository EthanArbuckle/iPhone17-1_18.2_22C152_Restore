@interface SPAdvertisementCacheSearchCriteria
+ (BOOL)supportsSecureCoding;
- (SPAdvertisementCacheSearchCriteria)initWithCoder:(id)a3;
- (SPSearchResultMarker)searchResultMarker;
- (void)encodeWithCoder:(id)a3;
- (void)setSearchResultMarker:(id)a3;
@end

@implementation SPAdvertisementCacheSearchCriteria

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPAdvertisementCacheSearchCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchResultMarker"];

  [(SPAdvertisementCacheSearchCriteria *)self setSearchResultMarker:v5];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SPAdvertisementCacheSearchCriteria *)self searchResultMarker];
  [v4 encodeObject:v5 forKey:@"searchResultMarker"];
}

- (SPSearchResultMarker)searchResultMarker
{
  return self->_searchResultMarker;
}

- (void)setSearchResultMarker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end