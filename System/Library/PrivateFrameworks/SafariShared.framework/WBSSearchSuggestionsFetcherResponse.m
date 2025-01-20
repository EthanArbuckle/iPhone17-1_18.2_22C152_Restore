@interface WBSSearchSuggestionsFetcherResponse
+ (BOOL)supportsSecureCoding;
- (NSArray)suggestions;
- (NSDictionary)timingData;
- (WBSSearchSuggestionsFetcherResponse)init;
- (WBSSearchSuggestionsFetcherResponse)initWithCoder:(id)a3;
- (WBSSearchSuggestionsFetcherResponse)initWithSuggestions:(id)a3 sizeInBytes:(int64_t)a4 statusCode:(int64_t)a5 timingData:(id)a6;
- (int64_t)sizeInBytes;
- (int64_t)statusCode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSSearchSuggestionsFetcherResponse

- (WBSSearchSuggestionsFetcherResponse)init
{
  return 0;
}

- (WBSSearchSuggestionsFetcherResponse)initWithSuggestions:(id)a3 sizeInBytes:(int64_t)a4 statusCode:(int64_t)a5 timingData:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WBSSearchSuggestionsFetcherResponse;
  v12 = [(WBSSearchSuggestionsFetcherResponse *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    suggestions = v12->_suggestions;
    v12->_suggestions = (NSArray *)v13;

    v12->_sizeInBytes = a4;
    v12->_statusCode = a5;
    uint64_t v15 = [v11 copy];
    timingData = v12->_timingData;
    v12->_timingData = (NSDictionary *)v15;

    v17 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSSearchSuggestionsFetcherResponse)initWithCoder:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"suggestions"];

  uint64_t v8 = [v4 decodeInt64ForKey:@"sizeInBytes"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"statusCode"];
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
  v17 = [v4 decodeObjectOfClasses:v16 forKey:@"timingData"];

  v18 = [(WBSSearchSuggestionsFetcherResponse *)self initWithSuggestions:v7 sizeInBytes:v8 statusCode:v9 timingData:v17];
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  suggestions = self->_suggestions;
  id v5 = a3;
  [v5 encodeObject:suggestions forKey:@"suggestions"];
  [v5 encodeInt64:self->_sizeInBytes forKey:@"sizeInBytes"];
  [v5 encodeInteger:self->_statusCode forKey:@"statusCode"];
  [v5 encodeObject:self->_timingData forKey:@"timingData"];
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (int64_t)sizeInBytes
{
  return self->_sizeInBytes;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSDictionary)timingData
{
  return self->_timingData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end