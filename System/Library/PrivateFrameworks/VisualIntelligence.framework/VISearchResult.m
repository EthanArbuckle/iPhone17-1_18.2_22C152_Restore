@interface VISearchResult
+ (id)empty;
- (BOOL)isEqual:(id)a3;
- (NSArray)regionOfInterestResults;
- (NSData)userFeedbackPayload;
- (VISearchResult)initWithRegionOfInterestResults:(id)a3;
- (VISearchResult)initWithRegionOfInterestResults:(id)a3 userFeedbackPayload:(id)a4;
- (unint64_t)hash;
@end

@implementation VISearchResult

- (VISearchResult)initWithRegionOfInterestResults:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VISearchResult;
  v5 = [(VISearchResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    regionOfInterestResults = v5->_regionOfInterestResults;
    v5->_regionOfInterestResults = (NSArray *)v6;
  }
  return v5;
}

- (VISearchResult)initWithRegionOfInterestResults:(id)a3 userFeedbackPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VISearchResult;
  v8 = [(VISearchResult *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    regionOfInterestResults = v8->_regionOfInterestResults;
    v8->_regionOfInterestResults = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    userFeedbackPayload = v8->_userFeedbackPayload;
    v8->_userFeedbackPayload = (NSData *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v15 = v5;
  uint64_t v16 = v3;
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  regionOfInterestResults = self->_regionOfInterestResults;
  v13 = objc_msgSend(v11, "regionOfInterestResults", v6, v15, v4, v16, v7, v8);
  LOBYTE(regionOfInterestResults) = VIObjectIsEqual((unint64_t)regionOfInterestResults, (uint64_t)v13);

  return (char)regionOfInterestResults;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_regionOfInterestResults hash];
}

+ (id)empty
{
  v2 = [VISearchResult alloc];
  uint64_t v3 = [(VISearchResult *)v2 initWithRegionOfInterestResults:MEMORY[0x1E4F1CBF0]];
  return v3;
}

- (NSArray)regionOfInterestResults
{
  return self->_regionOfInterestResults;
}

- (NSData)userFeedbackPayload
{
  return self->_userFeedbackPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFeedbackPayload, 0);
  objc_storeStrong((id *)&self->_regionOfInterestResults, 0);
}

@end