@interface FMDRequestQueueCheck
- (BOOL)canReplace:(id)a3;
- (BOOL)shutdownActivityPending;
- (FMDRequestQueueCheck)initWithAccount:(id)a3 shutdownActivityPending:(BOOL)a4;
- (double)maxRetryInterval;
- (id)requestBody;
- (id)urlTemplateType;
- (int64_t)maxConsecutiveNetworkNotificationRetries;
- (int64_t)maxNonNetworkRelatedRetries;
- (void)setShutdownActivityPending:(BOOL)a3;
@end

@implementation FMDRequestQueueCheck

- (FMDRequestQueueCheck)initWithAccount:(id)a3 shutdownActivityPending:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)FMDRequestQueueCheck;
  v5 = [(FMDRequest *)&v8 initWithAccount:a3];
  v6 = v5;
  if (v5) {
    [(FMDRequestQueueCheck *)v5 setShutdownActivityPending:v4];
  }
  return v6;
}

- (id)urlTemplateType
{
  return @"qc";
}

- (id)requestBody
{
  v6.receiver = self;
  v6.super_class = (Class)FMDRequestQueueCheck;
  v3 = [(FMDRequest *)&v6 requestBody];
  if ([(FMDRequestQueueCheck *)self shutdownActivityPending])
  {
    BOOL v4 = +[NSNumber numberWithBool:[(FMDRequestQueueCheck *)self shutdownActivityPending]];
    [v3 setObject:v4 forKeyedSubscript:@"willShutdownSoon"];
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
  return 0;
}

- (BOOL)shutdownActivityPending
{
  return self->_shutdownActivityPending;
}

- (void)setShutdownActivityPending:(BOOL)a3
{
  self->_shutdownActivityPending = a3;
}

@end