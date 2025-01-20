@interface APMockedAMSURLResult
- (NSData)mockData;
- (NSDictionary)mockResponseHeaders;
- (id)data;
- (id)responseHeaders;
- (int64_t)mockResponseStatusCode;
- (int64_t)responseStatusCode;
- (void)setMockData:(id)a3;
- (void)setMockResponseHeaders:(id)a3;
- (void)setMockResponseStatusCode:(int64_t)a3;
@end

@implementation APMockedAMSURLResult

- (id)data
{
  return [(APMockedAMSURLResult *)self mockData];
}

- (int64_t)responseStatusCode
{
  return [(APMockedAMSURLResult *)self mockResponseStatusCode];
}

- (id)responseHeaders
{
  return [(APMockedAMSURLResult *)self mockResponseHeaders];
}

- (NSData)mockData
{
  return self->_mockData;
}

- (void)setMockData:(id)a3
{
}

- (int64_t)mockResponseStatusCode
{
  return self->_mockResponseStatusCode;
}

- (void)setMockResponseStatusCode:(int64_t)a3
{
  self->_mockResponseStatusCode = a3;
}

- (NSDictionary)mockResponseHeaders
{
  return self->_mockResponseHeaders;
}

- (void)setMockResponseHeaders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockResponseHeaders, 0);

  objc_storeStrong((id *)&self->_mockData, 0);
}

@end