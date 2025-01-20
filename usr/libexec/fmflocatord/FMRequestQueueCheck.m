@interface FMRequestQueueCheck
- (BOOL)canReplace:(id)a3;
- (FMRequestQueueCheck)initWithProvider:(id)a3 andServerContext:(id)a4;
- (NSDictionary)serverContext;
- (double)maxRetryInterval;
- (id)requestBody;
- (id)requestUrl;
- (int64_t)maxConsecutiveNetworkNotificationRetries;
- (int64_t)maxNonNetworkRelatedRetries;
- (void)deinitializeRequest;
- (void)setServerContext:(id)a3;
@end

@implementation FMRequestQueueCheck

- (void)deinitializeRequest
{
  v3.receiver = self;
  v3.super_class = (Class)FMRequestQueueCheck;
  [(FMRequest *)&v3 deinitializeRequest];
  [(FMRequestQueueCheck *)self setServerContext:0];
}

- (FMRequestQueueCheck)initWithProvider:(id)a3 andServerContext:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMRequestQueueCheck;
  v7 = [(FMRequest *)&v10 initWithProvider:a3];
  v8 = v7;
  if (v7) {
    [(FMRequestQueueCheck *)v7 setServerContext:v6];
  }

  return v8;
}

- (id)requestUrl
{
  v2 = [(FMRequest *)self provider];
  objc_super v3 = [v2 formattedURLForTemplate:@"${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/qc"];

  return v3;
}

- (id)requestBody
{
  v11.receiver = self;
  v11.super_class = (Class)FMRequestQueueCheck;
  objc_super v3 = [(FMRequest *)&v11 requestBody];
  v4 = [(FMRequest *)self provider];
  v5 = [v4 standardDeviceContext];
  [v3 setObject:v5 forKeyedSubscript:@"deviceContext"];

  id v6 = [(FMRequest *)self provider];
  v7 = [v6 fullDeviceInfo];

  [v3 setObject:v7 forKeyedSubscript:@"deviceInfo"];
  v8 = [(FMRequestQueueCheck *)self serverContext];

  if (v8)
  {
    v9 = [(FMRequestQueueCheck *)self serverContext];
    [v3 setObject:v9 forKeyedSubscript:@"serverContext"];
  }

  return v3;
}

- (double)maxRetryInterval
{
  return 3600.0;
}

- (int64_t)maxNonNetworkRelatedRetries
{
  return -1;
}

- (int64_t)maxConsecutiveNetworkNotificationRetries
{
  return -1;
}

- (BOOL)canReplace:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(FMRequest *)self delegate];
      v7 = [v5 delegate];
      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSDictionary)serverContext
{
  return self->_serverContext;
}

- (void)setServerContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end