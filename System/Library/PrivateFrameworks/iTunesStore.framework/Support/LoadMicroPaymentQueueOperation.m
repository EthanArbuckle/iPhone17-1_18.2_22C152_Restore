@interface LoadMicroPaymentQueueOperation
- (BOOL)_getQueueCount:(int64_t *)a3 error:(id *)a4;
- (BOOL)_loadPaymentsWithExpectedCount:(int64_t)a3 error:(id *)a4;
- (MicroPaymentQueueRequest)request;
- (MicroPaymentQueueResponse)response;
- (NSDate)lastQueueCheckDate;
- (NSString)queueCountURLBagKey;
- (NSString)queuePaymentsURLBagKey;
- (int64_t)expectedCount;
- (void)dealloc;
- (void)run;
- (void)setExpectedCount:(int64_t)a3;
- (void)setLastQueueCheckDate:(id)a3;
- (void)setQueueCountURLBagKey:(id)a3;
- (void)setQueuePaymentsURLBagKey:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation LoadMicroPaymentQueueOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LoadMicroPaymentQueueOperation;
  [(LoadMicroPaymentQueueOperation *)&v3 dealloc];
}

- (void)run
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  if ([(LoadMicroPaymentQueueOperation *)self _getQueueCount:&v6 error:&v7])
  {
    objc_super v3 = (void *)v6;
    if (v6 < 1 || v3 == (void *)[(LoadMicroPaymentQueueOperation *)self expectedCount])
    {
      v4 = objc_alloc_init(MicroPaymentQueueResponse);
      [(MicroPaymentQueueResponse *)v4 setServerPaymentCount:v6];
      [(LoadMicroPaymentQueueOperation *)self setResponse:v4];

      BOOL v5 = 1;
    }
    else
    {
      BOOL v5 = [(LoadMicroPaymentQueueOperation *)self _loadPaymentsWithExpectedCount:v6 error:&v7];
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  [(LoadMicroPaymentQueueOperation *)self setError:v7];
  [(LoadMicroPaymentQueueOperation *)self setSuccess:v5];
}

- (BOOL)_getQueueCount:(int64_t *)a3 error:(id *)a4
{
  v11 = 0;
  uint64_t v7 = objc_alloc_init(LoadMicroPaymentQueueCountOperation);
  [(LoadMicroPaymentQueueCountOperation *)v7 setLastQueueCheckDate:[(LoadMicroPaymentQueueOperation *)self lastQueueCheckDate]];
  [(LoadMicroPaymentQueueCountOperation *)v7 setRequest:[(LoadMicroPaymentQueueOperation *)self request]];
  [(LoadMicroPaymentQueueCountOperation *)v7 setURLBagKey:[(LoadMicroPaymentQueueOperation *)self queueCountURLBagKey]];
  unsigned int v8 = [(LoadMicroPaymentQueueOperation *)self runSubOperation:v7 returningError:&v11];
  int64_t v9 = 0;
  if (v8) {
    int64_t v9 = [(LoadMicroPaymentQueueCountOperation *)v7 queueItemCount];
  }

  if (a3) {
    *a3 = v9;
  }
  if (a4) {
    *a4 = v11;
  }
  return v8;
}

- (BOOL)_loadPaymentsWithExpectedCount:(int64_t)a3 error:(id *)a4
{
  v11 = 0;
  uint64_t v7 = objc_alloc_init(LoadMicroPaymentQueuePaymentsOperation);
  [(LoadMicroPaymentQueuePaymentsOperation *)v7 setRequest:[(LoadMicroPaymentQueueOperation *)self request]];
  [(LoadMicroPaymentQueuePaymentsOperation *)v7 setURLBagKey:[(LoadMicroPaymentQueueOperation *)self queuePaymentsURLBagKey]];
  unsigned int v8 = [(LoadMicroPaymentQueueOperation *)self runSubOperation:v7 returningError:&v11];
  if (v8)
  {
    int64_t v9 = [(LoadMicroPaymentQueuePaymentsOperation *)v7 response];
    [(MicroPaymentQueueResponse *)v9 setServerPaymentCount:a3];
    [(LoadMicroPaymentQueueOperation *)self setResponse:v9];
  }

  if (a4) {
    *a4 = v11;
  }
  return v8;
}

- (int64_t)expectedCount
{
  return self->_expectedCount;
}

- (void)setExpectedCount:(int64_t)a3
{
  self->_expectedCount = a3;
}

- (NSDate)lastQueueCheckDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLastQueueCheckDate:(id)a3
{
}

- (NSString)queueCountURLBagKey
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setQueueCountURLBagKey:(id)a3
{
}

- (NSString)queuePaymentsURLBagKey
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setQueuePaymentsURLBagKey:(id)a3
{
}

- (MicroPaymentQueueRequest)request
{
  return (MicroPaymentQueueRequest *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRequest:(id)a3
{
}

- (MicroPaymentQueueResponse)response
{
  return (MicroPaymentQueueResponse *)objc_getProperty(self, a2, 136, 1);
}

- (void)setResponse:(id)a3
{
}

@end