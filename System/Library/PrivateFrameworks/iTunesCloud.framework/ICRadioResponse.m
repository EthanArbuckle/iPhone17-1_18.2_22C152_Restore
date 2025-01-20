@interface ICRadioResponse
- (ICRadioResponse)initWithResponseDictionary:(id)a3 expirationDate:(id)a4;
- (ICRadioResponse)initWithURLResponse:(id)a3;
- (ICStoreDialogResponse)dialog;
- (ICURLAggregatedPerformanceMetrics)performanceMetrics;
- (NSDate)expirationDate;
- (NSDictionary)contentDictionary;
- (NSDictionary)responseDictionary;
- (NSError)serverError;
- (int64_t)version;
- (void)setPerformanceMetrics:(id)a3;
@end

@implementation ICRadioResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);

  objc_storeStrong((id *)&self->_expirationDate, 0);
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void)setPerformanceMetrics:(id)a3
{
}

- (ICURLAggregatedPerformanceMetrics)performanceMetrics
{
  return self->_performanceMetrics;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSError)serverError
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"error"];
  if (!_NSIsNSDictionary()) {
    goto LABEL_8;
  }
  v3 = [v2 objectForKey:@"error-value"];
  if ((objc_opt_respondsToSelector() & 1) == 0 || (uint64_t v4 = [v3 integerValue]) == 0)
  {

LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = v4;
  v6 = [v2 objectForKey:@"error-message"];
  if ((_NSIsNSString() & 1) == 0)
  {

    v7 = (void *)MEMORY[0x1E4F28C58];
    goto LABEL_13;
  }
  v7 = (void *)MEMORY[0x1E4F28C58];
  if (!v6)
  {
LABEL_13:
    v9 = [v7 errorWithDomain:@"ICRadioServerError" code:v5 userInfo:0];
    goto LABEL_14;
  }
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = v6;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v7 errorWithDomain:@"ICRadioServerError" code:v5 userInfo:v8];

LABEL_14:
LABEL_9:

  return (NSError *)v9;
}

- (ICStoreDialogResponse)dialog
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"dialog"];
  if (_NSIsNSDictionary()) {
    v3 = [[ICStoreDialogResponse alloc] initWithResponseDictionary:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (int64_t)version
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"version"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 5;
  }

  return v3;
}

- (NSDictionary)contentDictionary
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"content"];
  if (_NSIsNSDictionary()) {
    id v3 = v2;
  }
  else {
    id v3 = (id)MEMORY[0x1E4F1CC08];
  }

  return (NSDictionary *)v3;
}

- (ICRadioResponse)initWithResponseDictionary:(id)a3 expirationDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICRadioResponse;
  v8 = [(ICRadioResponse *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    responseDictionary = v8->_responseDictionary;
    v8->_responseDictionary = (NSDictionary *)v9;

    uint64_t v11 = [v7 copy];
    expirationDate = v8->_expirationDate;
    v8->_expirationDate = (NSDate *)v11;
  }
  return v8;
}

- (ICRadioResponse)initWithURLResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 parsedBodyDictionary];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CC08];
  }
  v8 = [v4 expirationDate];
  uint64_t v9 = [(ICRadioResponse *)self initWithResponseDictionary:v7 expirationDate:v8];

  if (v9)
  {
    v10 = [v4 performanceMetrics];

    if (v10)
    {
      uint64_t v11 = [v4 aggregatedPerformanceMetrics];
      performanceMetrics = v9->_performanceMetrics;
      v9->_performanceMetrics = (ICURLAggregatedPerformanceMetrics *)v11;
    }
  }

  return v9;
}

@end