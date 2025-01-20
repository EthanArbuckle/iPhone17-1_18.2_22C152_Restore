@interface RPNWActivityMetrics
+ (id)metricsUsingToken:(id)a3;
- (OS_nw_activity)nwActivity;
- (id)_initWithNWActivity:(id)a3;
- (id)_metricsDictionary;
- (void)_withLock:(os_unfair_lock_s *)a1;
- (void)submitMetrics;
@end

@implementation RPNWActivityMetrics

+ (id)metricsUsingToken:(id)a3
{
  id v4 = a3;
  v5 = +[RPNWActivityUtils activityFromToken:v4];
  if (v5)
  {
    v6 = (void *)[objc_alloc((Class)a1) _initWithNWActivity:v5];
  }
  else
  {
    if (gLogCategory_RPNWActivity <= 90 && (gLogCategory_RPNWActivity != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v6 = 0;
  }

  return v6;
}

- (void)submitMetrics
{
  id v5 = [(RPNWActivityMetrics *)self _metricsDictionary];
  v3 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v3)
  {
    id v4 = [(RPNWActivityMetrics *)self nwActivity];
    nw_activity_submit_metrics();
  }
  else if (gLogCategory_RPNWActivity <= 90 {
         && (gLogCategory_RPNWActivity != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (id)_initWithNWActivity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPNWActivityMetrics;
  v6 = [(RPNWActivityMetrics *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_nwActivity, a3);
  }

  return v7;
}

- (id)_metricsDictionary
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)_withLock:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    v2 = a1 + 2;
    v3 = a2;
    os_unfair_lock_lock(v2);
    v3[2](v3);

    os_unfair_lock_unlock(v2);
  }
}

- (OS_nw_activity)nwActivity
{
  return self->_nwActivity;
}

- (void).cxx_destruct
{
}

@end