@interface ICURLResponse
- (ICURLAggregatedPerformanceMetrics)aggregatedPerformanceMetrics;
- (ICURLPerformanceMetrics)performanceMetrics;
- (ICURLResponse)initWithURLResponse:(id)a3 urlRequest:(id)a4 bodyData:(id)a5 performanceMetrics:(id)a6;
- (ICURLResponse)initWithURLResponse:(id)a3 urlRequest:(id)a4 bodyDataURL:(id)a5 performanceMetrics:(id)a6;
- (NSData)bodyData;
- (NSDate)expirationDate;
- (NSURL)bodyDataURL;
- (NSURLRequest)urlRequest;
- (NSURLResponse)urlResponse;
- (id)parsedBody;
- (id)parsedBodyArray;
- (id)parsedBodyDictionary;
- (id)parsedBodyText;
- (int64_t)statusCode;
- (void)_prepareParsedBodyResponse;
@end

@implementation ICURLResponse

- (NSURLResponse)urlResponse
{
  return self->_urlResponse;
}

- (id)parsedBodyDictionary
{
  [(ICURLResponse *)self _prepareParsedBodyResponse];
  if (self->_parsedBodyResponseType == 2) {
    id v3 = self->_parsedBodyResponse;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)_prepareParsedBodyResponse
{
  if (!self->_parsedBodyResponseType)
  {
    id v3 = self->_urlResponse;
    v4 = [(NSURLResponse *)v3 ic_valueForHTTPHeaderField:@"Content-Type"];
    v5 = v4;
    if (v4 && [v4 rangeOfString:@"application/json" options:1] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = 0;
    }
    else
    {
      bodyData = self->_bodyData;
      id v13 = 0;
      v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:bodyData options:0 error:&v13];
      id v6 = v13;
      if (v8) {
        goto LABEL_10;
      }
    }
    v9 = v6;
    v10 = self->_bodyData;
    id v12 = 0;
    v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v10 options:0 format:0 error:&v12];
    id v6 = v12;

    if (!v8)
    {
      if ([v5 rangeOfString:@"text/html" options:1] == 0x7FFFFFFFFFFFFFFFLL) {
        v8 = 0;
      }
      else {
        v8 = (void *)[[NSString alloc] initWithData:self->_bodyData encoding:4];
      }
    }
LABEL_10:
    if (_NSIsNSDictionary())
    {
      int64_t v11 = 2;
    }
    else if (_NSIsNSArray())
    {
      int64_t v11 = 3;
    }
    else
    {
      if (!_NSIsNSString())
      {
        int64_t v11 = 1;
        goto LABEL_17;
      }
      int64_t v11 = 4;
    }
    objc_storeStrong(&self->_parsedBodyResponse, v8);
LABEL_17:
    self->_parsedBodyResponseType = v11;
  }
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (ICURLPerformanceMetrics)performanceMetrics
{
  v2 = [(ICURLAggregatedPerformanceMetrics *)self->_aggregatedPerformanceMetrics urlMetrics];
  id v3 = [v2 lastObject];

  return (ICURLPerformanceMetrics *)v3;
}

- (ICURLResponse)initWithURLResponse:(id)a3 urlRequest:(id)a4 bodyData:(id)a5 performanceMetrics:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICURLResponse;
  v15 = [(ICURLResponse *)&v19 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    urlRequest = v15->_urlRequest;
    v15->_urlRequest = (NSURLRequest *)v16;

    objc_storeStrong((id *)&v15->_urlResponse, a3);
    objc_storeStrong((id *)&v15->_bodyData, a5);
    objc_storeStrong((id *)&v15->_aggregatedPerformanceMetrics, a6);
  }

  return v15;
}

- (int64_t)statusCode
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  urlResponse = self->_urlResponse;

  return [(NSURLResponse *)urlResponse statusCode];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregatedPerformanceMetrics, 0);
  objc_storeStrong((id *)&self->_bodyDataURL, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);

  objc_storeStrong(&self->_parsedBodyResponse, 0);
}

- (ICURLAggregatedPerformanceMetrics)aggregatedPerformanceMetrics
{
  return self->_aggregatedPerformanceMetrics;
}

- (NSURL)bodyDataURL
{
  return self->_bodyDataURL;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (id)parsedBody
{
  [(ICURLResponse *)self _prepareParsedBodyResponse];
  id parsedBodyResponse = self->_parsedBodyResponse;

  return parsedBodyResponse;
}

- (id)parsedBodyText
{
  int64_t parsedBodyResponseType = self->_parsedBodyResponseType;
  id parsedBodyResponse = self->_parsedBodyResponse;
  if (parsedBodyResponseType == 4)
  {
    id v4 = parsedBodyResponse;
  }
  else
  {
    id v4 = [parsedBodyResponse description];
  }

  return v4;
}

- (id)parsedBodyArray
{
  [(ICURLResponse *)self _prepareParsedBodyResponse];
  if (self->_parsedBodyResponseType == 3) {
    id v3 = self->_parsedBodyResponse;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (NSDate)expirationDate
{
  [(NSURLResponse *)self->_urlResponse _calculatedExpiration];
  if (v2 <= 0.00000011920929)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  }

  return (NSDate *)v3;
}

- (ICURLResponse)initWithURLResponse:(id)a3 urlRequest:(id)a4 bodyDataURL:(id)a5 performanceMetrics:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICURLResponse;
  v15 = [(ICURLResponse *)&v19 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    urlRequest = v15->_urlRequest;
    v15->_urlRequest = (NSURLRequest *)v16;

    objc_storeStrong((id *)&v15->_urlResponse, a3);
    objc_storeStrong((id *)&v15->_bodyDataURL, a5);
    objc_storeStrong((id *)&v15->_aggregatedPerformanceMetrics, a6);
  }

  return v15;
}

@end