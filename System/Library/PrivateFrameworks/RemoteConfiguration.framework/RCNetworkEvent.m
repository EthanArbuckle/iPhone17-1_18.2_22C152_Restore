@interface RCNetworkEvent
- (NSDate)startDate;
- (NSError)error;
- (NSHTTPURLResponse)response;
- (NSString)operationID;
- (NSString)requestID;
- (NSURLRequest)request;
- (NSURLSessionTaskTransactionMetrics)metrics;
- (RCNetworkEvent)initWithResultType:(int64_t)a3 request:(id)a4 startDate:(id)a5 operationID:(id)a6 requestID:(id)a7 response:(id)a8 metrics:(id)a9 error:(id)a10;
- (int64_t)resultType;
@end

@implementation RCNetworkEvent

- (RCNetworkEvent)initWithResultType:(int64_t)a3 request:(id)a4 startDate:(id)a5 operationID:(id)a6 requestID:(id)a7 response:(id)a8 metrics:(id)a9 error:(id)a10
{
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v16 = a9;
  id v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)RCNetworkEvent;
  v18 = [(RCNetworkEvent *)&v27 init];
  v19 = v18;
  if (v18)
  {
    v18->_resultType = a3;
    objc_storeStrong((id *)&v18->_request, a4);
    objc_storeStrong((id *)&v19->_startDate, a5);
    objc_storeStrong((id *)&v19->_operationID, a6);
    objc_storeStrong((id *)&v19->_requestID, a7);
    objc_storeStrong((id *)&v19->_response, a8);
    objc_storeStrong((id *)&v19->_metrics, a9);
    objc_storeStrong((id *)&v19->_error, a10);
  }

  return v19;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (NSString)operationID
{
  return self->_operationID;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (NSURLSessionTaskTransactionMetrics)metrics
{
  return self->_metrics;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_operationID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end