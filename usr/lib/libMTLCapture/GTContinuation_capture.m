@interface GTContinuation_capture
- (GTContinuation_capture)init;
- (GTContinuation_capture)initWithQueue:(id)a3 block:(id)a4;
- (void)dealloc;
- (void)dispatch;
@end

@implementation GTContinuation_capture

- (void)dispatch
{
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->queue);
  v3.receiver = self;
  v3.super_class = (Class)GTContinuation_capture;
  [(GTContinuation_capture *)&v3 dealloc];
}

- (GTContinuation_capture)initWithQueue:(id)a3 block:(id)a4
{
  if (!a3)
  {
    if (s_logUsingOsLog)
    {
      v8 = gt_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "fail: queue cannot be NULL";
        goto LABEL_12;
      }
LABEL_16:
      abort();
    }
    v10 = __stderrp;
    CFStringRef v11 = @"fail: queue cannot be NULL";
LABEL_15:
    fprintf(v10, "%s\n", [+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, a4) UTF8String]);
    goto LABEL_16;
  }
  if (!a4)
  {
    if (s_logUsingOsLog)
    {
      v8 = gt_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "fail: block cannot be NULL";
LABEL_12:
        _os_log_fault_impl(&def_CFBEC, v8, OS_LOG_TYPE_FAULT, v9, buf, 2u);
        abort();
      }
      goto LABEL_16;
    }
    v10 = __stderrp;
    CFStringRef v11 = @"fail: block cannot be NULL";
    goto LABEL_15;
  }
  v12.receiver = self;
  v12.super_class = (Class)GTContinuation_capture;
  v6 = [(GTContinuation_capture *)&v12 init];
  if (v6)
  {
    dispatch_retain((dispatch_object_t)a3);
    v6->queue = (OS_dispatch_queue *)a3;
    v6->block = [a4 copy];
  }
  return v6;
}

- (GTContinuation_capture)init
{
  return 0;
}

@end