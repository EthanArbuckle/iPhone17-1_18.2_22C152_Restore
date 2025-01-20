@interface WFNetworkEvent
- (NSDate)startDate;
- (WFNetworkEvent)initWithEventType:(int64_t)a3 metrics:(id)a4;
- (WFNetworkEvent)initWithEventType:(int64_t)a3 startDate:(id)a4 DNSDuration:(double)a5 connectDuration:(double)a6 requestDuration:(double)a7 responseDuration:(double)a8 responseSize:(unint64_t)a9 HTTPStatusCode:(unint64_t)a10 errorCode:(int64_t)a11;
- (WFNetworkEvent)initWithEventType:(int64_t)a3 startDate:(id)a4 error:(id)a5;
- (double)DNSDuration;
- (double)connectDuration;
- (double)requestDuration;
- (double)responseDuration;
- (int64_t)errorCode;
- (int64_t)eventType;
- (unint64_t)HTTPStatusCode;
- (unint64_t)responseSize;
@end

@implementation WFNetworkEvent

- (WFNetworkEvent)initWithEventType:(int64_t)a3 startDate:(id)a4 DNSDuration:(double)a5 connectDuration:(double)a6 requestDuration:(double)a7 responseDuration:(double)a8 responseSize:(unint64_t)a9 HTTPStatusCode:(unint64_t)a10 errorCode:(int64_t)a11
{
  id v21 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WFNetworkEvent;
  v22 = [(WFNetworkEvent *)&v25 init];
  v23 = v22;
  if (v22)
  {
    v22->_eventType = a3;
    objc_storeStrong((id *)&v22->_startDate, a4);
    v23->_DNSDuration = a5;
    v23->_connectDuration = a6;
    v23->_requestDuration = a7;
    v23->_responseDuration = a8;
    v23->_responseSize = a9;
    v23->_HTTPStatusCode = a10;
    v23->_errorCode = a11;
  }

  return v23;
}

- (WFNetworkEvent)initWithEventType:(int64_t)a3 metrics:(id)a4
{
  id v4 = a4;
  v5 = [v4 response];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = [v4 response];
  }
  else
  {
    v26 = 0;
  }

  v6 = [v4 fetchStartDate];
  v23 = [v4 domainLookupEndDate];
  v22 = [v4 domainLookupStartDate];
  [v23 timeIntervalSinceDate:v22];
  double v8 = v7;
  v9 = [v4 secureConnectionEndDate];
  v10 = [v4 secureConnectionStartDate];
  [v9 timeIntervalSinceDate:v10];
  double v12 = v11;
  v13 = [v4 requestEndDate];
  v14 = [v4 requestStartDate];
  [v13 timeIntervalSinceDate:v14];
  double v16 = v15;
  v17 = [v4 responseEndDate];
  v18 = [v4 responseStartDate];
  [v17 timeIntervalSinceDate:v18];
  v20 = -[WFNetworkEvent initWithEventType:startDate:DNSDuration:connectDuration:requestDuration:responseDuration:responseSize:HTTPStatusCode:errorCode:](self, "initWithEventType:startDate:DNSDuration:connectDuration:requestDuration:responseDuration:responseSize:HTTPStatusCode:errorCode:", a3, v6, [v4 countOfResponseBodyBytesReceived], objc_msgSend(v26, "statusCode"), 0, v8, v12, v16, v19);

  return v20;
}

- (WFNetworkEvent)initWithEventType:(int64_t)a3 startDate:(id)a4 error:(id)a5
{
  id v8 = a4;
  v9 = -[WFNetworkEvent initWithEventType:startDate:DNSDuration:connectDuration:requestDuration:responseDuration:responseSize:HTTPStatusCode:errorCode:](self, "initWithEventType:startDate:DNSDuration:connectDuration:requestDuration:responseDuration:responseSize:HTTPStatusCode:errorCode:", a3, v8, 0, 0, [a5 code], 0.0, 0.0, 0.0, 0.0);

  return v9;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (double)DNSDuration
{
  return self->_DNSDuration;
}

- (double)connectDuration
{
  return self->_connectDuration;
}

- (double)requestDuration
{
  return self->_requestDuration;
}

- (double)responseDuration
{
  return self->_responseDuration;
}

- (unint64_t)responseSize
{
  return self->_responseSize;
}

- (unint64_t)HTTPStatusCode
{
  return self->_HTTPStatusCode;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void).cxx_destruct
{
}

@end