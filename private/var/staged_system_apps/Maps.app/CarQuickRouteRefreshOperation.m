@interface CarQuickRouteRefreshOperation
+ (BOOL)isFullThrottleEngaged;
+ (id)throttleStateDescription;
+ (unint64_t)throttlePreventionLevel;
+ (unint64_t)throttlePreventionLevelForAvailableRequestCount:(unsigned int)a3;
+ (void)engageFullThrottleForInterval:(double)a3;
+ (void)initialize;
+ (void)suspendQueues:(BOOL)a3;
- (CarQuickRouteRefreshOperation)initWithQuickRoute:(id)a3;
- (NSOperationQueue)operationQueue;
- (_MKQuickRouteManager)quickRouteManager;
- (id)description;
- (void)main;
- (void)setOperationQueue:(id)a3;
- (void)setQuickRouteManager:(id)a3;
@end

@implementation CarQuickRouteRefreshOperation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)qword_10160EC38;
    qword_10160EC38 = v2;

    [(id)qword_10160EC38 setName:@"SharedETARefresh"];
    [(id)qword_10160EC38 setQualityOfService:25];
    uint64_t v4 = objc_opt_new();
    v5 = (void *)qword_10160EC40;
    qword_10160EC40 = v4;

    [(id)qword_10160EC40 setName:@"SharedDelayedETARefresh"];
    [(id)qword_10160EC40 setQualityOfService:9];
    [(id)qword_10160EC40 setSuspended:1];
    v6 = (void *)qword_10160EC48;
    qword_10160EC48 = (uint64_t)&off_1013AD560;
  }
}

+ (unint64_t)throttlePreventionLevelForAvailableRequestCount:(unsigned int)a3
{
  unint64_t v4 = 30;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)qword_10160EC48;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = (30 - a3) & ~((30 - a3) >> 63);
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
      unint64_t v4 = [v11 unsignedIntegerValue];
      if ((unint64_t)[v11 unsignedIntegerValue] >= v8) {
        break;
      }
      if (v7 == (id)++v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v4;
}

+ (unint64_t)throttlePreventionLevel
{
  double v10 = 0.0;
  unsigned int v9 = 0;
  v3 = +[GEOThrottlerRequester sharedRequester];
  [v3 getThrottleStateFor:672 nextSafeRequestTime:&v10 availableRequestCount:&v9 error:0];

  double v4 = v10;
  double v5 = v4 - CFAbsoluteTimeGetCurrent();
  if (v5 >= 0.0) {
    double v6 = v5;
  }
  else {
    double v6 = 0.0;
  }
  double v7 = (double)(unint64_t)[a1 throttlePreventionLevelForAvailableRequestCount:v9];
  if (v6 <= v7) {
    return (unint64_t)v6;
  }
  return (unint64_t)v7;
}

+ (id)throttleStateDescription
{
  double v17 = 0.0;
  unsigned int v16 = 0;
  v3 = +[GEOThrottlerRequester sharedRequester];
  [v3 getThrottleStateFor:672 nextSafeRequestTime:&v17 availableRequestCount:&v16 error:0];

  id v4 = [a1 throttlePreventionLevelForAvailableRequestCount:v16];
  double v5 = v17;
  double v6 = v5 - CFAbsoluteTimeGetCurrent();
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  else {
    double v7 = 0.0;
  }
  unint64_t v8 = +[CarQuickRouteRefreshOperation throttlePreventionLevel];
  if (byte_10160EC30) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  id v10 = [(id)qword_10160EC38 operationCount];
  if ([(id)qword_10160EC38 isSuspended]) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  id v12 = [(id)qword_10160EC40 operationCount];
  if ([(id)qword_10160EC40 isSuspended]) {
    CFStringRef v13 = @"YES";
  }
  else {
    CFStringRef v13 = @"NO";
  }
  long long v14 = +[NSString stringWithFormat:@"<ThrottlePreventionLevel=%lu FullThrottleEngaged=%@ throttleState: (Level=%lu ResetTimeRemaining=%f)  PrimaryQueue: (count=%lu suspended=%@) DelayedQueue: (count=%lu suspended=%@)>", v8, v9, v4, *(void *)&v7, v10, v11, v12, v13];

  return v14;
}

+ (void)suspendQueues:(BOOL)a3
{
  if (byte_10160EC30 != 1 || a3)
  {
    BOOL v4 = a3;
    if ([(id)qword_10160EC38 isSuspended] != a3
      || [(id)qword_10160EC40 isSuspended] != v4)
    {
      [(id)qword_10160EC38 setSuspended:v4];
      if (v4
        || ![(id)qword_10160EC38 operationCount]
        && +[CarQuickRouteRefreshOperation throttlePreventionLevel] <= 4)
      {
        double v5 = (void *)qword_10160EC40;
        [v5 setSuspended:v4];
      }
    }
  }
}

+ (void)engageFullThrottleForInterval:(double)a3
{
  if ((byte_10160EC30 & 1) == 0)
  {
    byte_10160EC30 = 1;
    +[CarQuickRouteRefreshOperation suspendQueues:1];
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)((a3 + 1.0) * 1000000000.0));
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, &stru_1012E9438);
  }
}

+ (BOOL)isFullThrottleEngaged
{
  return byte_10160EC30;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  dispatch_time_t v4 = [(CarQuickRouteRefreshOperation *)self quickRouteManager];
  if (objc_msgSend(v4, "_Car_isVisible")) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  double v6 = [(CarQuickRouteRefreshOperation *)self quickRouteManager];
  double v7 = [v6 mapItem];
  unint64_t v8 = [v7 name];
  CFStringRef v9 = +[NSString stringWithFormat:@"<%@: %p quickRouteManager isVisible=%@ name=%@>", v3, self, v5, v8];

  return v9;
}

- (CarQuickRouteRefreshOperation)initWithQuickRoute:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarQuickRouteRefreshOperation;
  double v6 = [(CarQuickRouteRefreshOperation *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_quickRouteManager, a3);
    [(CarQuickRouteRefreshOperation *)v7 setCompletionBlock:&stru_1012E9458];
  }

  return v7;
}

- (void)main
{
  uint64_t v3 = +[NSOperationQueue currentQueue];
  dispatch_time_t v4 = v3;
  if (v3 == (void *)qword_10160EC38)
  {
    id v5 = [(CarQuickRouteRefreshOperation *)self quickRouteManager];
    unsigned __int8 v6 = [v5 _Car_isVisible];

    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  double v7 = +[NSOperationQueue currentQueue];
  unint64_t v8 = v7;
  if (v7 == (void *)qword_10160EC40)
  {
    unint64_t v9 = +[CarQuickRouteRefreshOperation throttlePreventionLevel];

    if (v9 < 5) {
      goto LABEL_9;
    }
    [(id)qword_10160EC40 setSuspended:1];
LABEL_8:
    id v11 = [(CarQuickRouteRefreshOperation *)self quickRouteManager];
    [v11 _Car_queueUpdateETA];
    goto LABEL_10;
  }

LABEL_9:
  id v10 = [(CarQuickRouteRefreshOperation *)self quickRouteManager];
  [v10 updateETA];

  id v11 = [(CarQuickRouteRefreshOperation *)self quickRouteManager];
  [v11 set_Car_refreshOperation:0];
LABEL_10:
}

- (_MKQuickRouteManager)quickRouteManager
{
  return self->_quickRouteManager;
}

- (void)setQuickRouteManager:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operationQueue);

  return (NSOperationQueue *)WeakRetained;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_operationQueue);

  objc_storeStrong((id *)&self->_quickRouteManager, 0);
}

@end