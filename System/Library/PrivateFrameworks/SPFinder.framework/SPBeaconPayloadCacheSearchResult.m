@interface SPBeaconPayloadCacheSearchResult
+ (BOOL)supportsSecureCoding;
- (NSArray)fileURLs;
- (NSError)error;
- (SPBeaconPayloadCacheSearchResult)initWithCoder:(id)a3;
- (SPBeaconPayloadCacheSearchResult)initWithFileURLs:(id)a3 searchResultMarker:(id)a4 error:(id)a5;
- (SPSearchResultMarker)searchResultMarker;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
- (void)setFileURLs:(id)a3;
- (void)setSearchResultMarker:(id)a3;
@end

@implementation SPBeaconPayloadCacheSearchResult

- (SPBeaconPayloadCacheSearchResult)initWithFileURLs:(id)a3 searchResultMarker:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SPBeaconPayloadCacheSearchResult;
  v11 = [(SPBeaconPayloadCacheSearchResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(SPBeaconPayloadCacheSearchResult *)v11 setFileURLs:v8];
    [(SPBeaconPayloadCacheSearchResult *)v12 setSearchResultMarker:v9];
    [(SPBeaconPayloadCacheSearchResult *)v12 setError:v10];
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPBeaconPayloadCacheSearchResult)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v7 = [v4 setWithArray:v6];
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"fileURLs"];
  [(SPBeaconPayloadCacheSearchResult *)self setFileURLs:v8];

  id v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"searchResultMarker"];
  [(SPBeaconPayloadCacheSearchResult *)self setSearchResultMarker:v9];

  id v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"error"];

  [(SPBeaconPayloadCacheSearchResult *)self setError:v10];
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SPBeaconPayloadCacheSearchResult *)self fileURLs];
  [v4 encodeObject:v5 forKey:@"fileURLs"];

  v6 = [(SPBeaconPayloadCacheSearchResult *)self searchResultMarker];
  [v4 encodeObject:v6 forKey:@"searchResultMarker"];

  id v7 = [(SPBeaconPayloadCacheSearchResult *)self error];
  [v4 encodeObject:v7 forKey:@"error"];
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSArray)fileURLs
{
  return self->_fileURLs;
}

- (void)setFileURLs:(id)a3
{
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
  objc_storeStrong((id *)&self->_searchResultMarker, 0);
  objc_storeStrong((id *)&self->_fileURLs, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end