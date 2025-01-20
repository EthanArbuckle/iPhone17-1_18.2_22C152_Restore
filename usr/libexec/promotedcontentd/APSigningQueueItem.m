@interface APSigningQueueItem
+ (id)createItemWithRequest:(id)a3 requestTimestamp:(id)a4 interval:(unint64_t)a5 jsonBody:(id)a6 startDate:(id)a7 deliveryStartDate:(id)a8 completionHandler:(id)a9;
- (APAttributionRequest)request;
- (NSData)jsonBody;
- (NSDate)deliveryStartDate;
- (NSDate)requestTimestamp;
- (NSDate)startDate;
- (id)handler;
- (unint64_t)intervalId;
- (void)setDeliveryStartDate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setIntervalId:(unint64_t)a3;
- (void)setJsonBody:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestTimestamp:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation APSigningQueueItem

+ (id)createItemWithRequest:(id)a3 requestTimestamp:(id)a4 interval:(unint64_t)a5 jsonBody:(id)a6 startDate:(id)a7 deliveryStartDate:(id)a8 completionHandler:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a4;
  id v20 = a3;
  v21 = objc_alloc_init(APSigningQueueItem);
  [(APSigningQueueItem *)v21 setRequest:v20];

  [(APSigningQueueItem *)v21 setRequestTimestamp:v19];
  [(APSigningQueueItem *)v21 setIntervalId:a5];
  [(APSigningQueueItem *)v21 setJsonBody:v18];

  [(APSigningQueueItem *)v21 setStartDate:v17];
  [(APSigningQueueItem *)v21 setHandler:v15];

  [(APSigningQueueItem *)v21 setDeliveryStartDate:v16];

  return v21;
}

- (APAttributionRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSDate)requestTimestamp
{
  return self->_requestTimestamp;
}

- (void)setRequestTimestamp:(id)a3
{
}

- (NSDate)deliveryStartDate
{
  return self->_deliveryStartDate;
}

- (void)setDeliveryStartDate:(id)a3
{
}

- (unint64_t)intervalId
{
  return self->_intervalId;
}

- (void)setIntervalId:(unint64_t)a3
{
  self->_intervalId = a3;
}

- (NSData)jsonBody
{
  return self->_jsonBody;
}

- (void)setJsonBody:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_jsonBody, 0);
  objc_storeStrong((id *)&self->_deliveryStartDate, 0);
  objc_storeStrong((id *)&self->_requestTimestamp, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end