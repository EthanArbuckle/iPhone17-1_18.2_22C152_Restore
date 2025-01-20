@interface RPNWActivityMetrics
+ (id)metricsUsingToken:(id)a3;
- (OS_nw_activity)nwActivity;
- (id)_initWithNWActivity:(id)a3;
- (id)_metricsDictionary;
- (void)submitMetrics;
@end

@implementation RPNWActivityMetrics

+ (id)metricsUsingToken:(id)a3
{
  id v4 = a3;
  v5 = +[RPNWActivityUtils activityFromToken:v4];
  if (v5)
  {
    id v6 = [objc_alloc((Class)a1) _initWithNWActivity:v5];
  }
  else
  {
    if (dword_100141C00 <= 90 && (dword_100141C00 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v6 = 0;
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
  else if (dword_100141C00 <= 90 && (dword_100141C00 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (id)_initWithNWActivity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPNWActivityMetrics;
  id v6 = [(RPNWActivityMetrics *)&v9 init];
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
  return &__NSDictionary0__struct;
}

- (OS_nw_activity)nwActivity
{
  return self->_nwActivity;
}

- (void).cxx_destruct
{
}

@end