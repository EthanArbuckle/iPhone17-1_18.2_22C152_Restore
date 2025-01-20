@interface STShowMapsSearchResultsRequest
+ (BOOL)supportsSecureCoding;
- (STShowMapsSearchResultsRequest)initWithCoder:(id)a3;
- (id)_initWithLocation:(id)a3 extSessionGuid:(id)a4 extSessionGuidCreatedTimestamp:(id)a5;
- (id)createResponse;
- (id)extSessionGuid;
- (id)extSessionGuidCreatedTimestamp;
- (id)searchResults;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STShowMapsSearchResultsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extSessionGuidCreatedTimestamp, 0);
  objc_storeStrong((id *)&self->_extSessionGuid, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
}

- (STShowMapsSearchResultsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STShowMapsSearchResultsRequest;
  v5 = [(AFSiriRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSTShowMapsSearchResultsRequestResultsKey"];
    searchResults = v5->_searchResults;
    v5->_searchResults = (STSiriLocation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSTShowMapsSearchResultsRequestExtSessionGuidKey"];
    extSessionGuid = v5->_extSessionGuid;
    v5->_extSessionGuid = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSTShowMapsSearchResultsRequestExtSessionGuidCreatedTimestampKey"];
    extSessionGuidCreatedTimestamp = v5->_extSessionGuidCreatedTimestamp;
    v5->_extSessionGuidCreatedTimestamp = (NSDate *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowMapsSearchResultsRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchResults, @"kSTShowMapsSearchResultsRequestResultsKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_extSessionGuid forKey:@"kSTShowMapsSearchResultsRequestExtSessionGuidKey"];
  [v4 encodeObject:self->_extSessionGuidCreatedTimestamp forKey:@"kSTShowMapsSearchResultsRequestExtSessionGuidCreatedTimestampKey"];
}

- (id)createResponse
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  return v2;
}

- (id)extSessionGuidCreatedTimestamp
{
  return self->_extSessionGuidCreatedTimestamp;
}

- (id)extSessionGuid
{
  return self->_extSessionGuid;
}

- (id)searchResults
{
  return self->_searchResults;
}

- (id)_initWithLocation:(id)a3 extSessionGuid:(id)a4 extSessionGuidCreatedTimestamp:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STShowMapsSearchResultsRequest;
  v12 = [(AFSiriRequest *)&v15 init];
  p_isa = (id *)&v12->super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_searchResults, a3);
    objc_storeStrong(p_isa + 6, a4);
    objc_storeStrong(p_isa + 7, a5);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end