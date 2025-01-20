@interface PKPaymentWebServicePaginatedRequest
- (NSDate)lastUpdated;
- (NSNumber)limit;
- (PKPaginatedWebServiceResponse)lastPageResponse;
- (void)setLastPageResponse:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setLimit:(id)a3;
@end

@implementation PKPaymentWebServicePaginatedRequest

- (PKPaginatedWebServiceResponse)lastPageResponse
{
  return self->_lastPageResponse;
}

- (void)setLastPageResponse:(id)a3
{
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (NSNumber)limit
{
  return self->_limit;
}

- (void)setLimit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_lastPageResponse, 0);
}

@end