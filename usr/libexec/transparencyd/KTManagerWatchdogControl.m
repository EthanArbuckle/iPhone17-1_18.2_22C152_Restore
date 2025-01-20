@interface KTManagerWatchdogControl
- (BOOL)maybeDoFastExit;
- (BOOL)watchDogFastRudeExit;
- (BOOL)watchdogDisableDebuggerCheck;
- (KTManagerWatchdogControl)initWithDew:(id)a3;
- (double)watchdogInterval;
- (double)watchdogNiceWaitTime;
- (void)setMaybeDoFastExit:(BOOL)a3;
- (void)watchdogNiceExit;
- (void)watchdogRudeExitWithReason:(id)a3;
@end

@implementation KTManagerWatchdogControl

- (KTManagerWatchdogControl)initWithDew:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)KTManagerWatchdogControl;
  v5 = [(KTManagerWatchdogControl *)&v8 init];
  if (v5)
  {
    -[KTManagerWatchdogControl setMaybeDoFastExit:](v5, "setMaybeDoFastExit:", [v4 fastWatchdogExit]);
    v6 = v5;
  }

  return v5;
}

- (double)watchdogInterval
{
  return 300.0;
}

- (double)watchdogNiceWaitTime
{
  return 120.0;
}

- (BOOL)watchDogFastRudeExit
{
  return (os_variant_has_internal_diagnostics() & 1) != 0
      || [(KTManagerWatchdogControl *)self maybeDoFastExit] && !arc4random_uniform(0x3E8u);
}

- (void)watchdogNiceExit
{
  if (qword_100326790 != -1) {
    dispatch_once(&qword_100326790, &stru_1002B99F8);
  }
  v2 = qword_100326798;
  if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "watchdogNiceExit", v3, 2u);
  }
  xpc_transaction_exit_clean();
}

- (void)watchdogRudeExitWithReason:(id)a3
{
  id v3 = a3;
  if (qword_100326790 != -1) {
    goto LABEL_5;
  }
  while (1)
  {
    id v4 = qword_100326798;
    if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "watchdogRudeExit: %@", (uint8_t *)&v5, 0xCu);
    }
    [v3 UTF8String];
    abort_with_payload();
LABEL_5:
    dispatch_once(&qword_100326790, &stru_1002B9A18);
  }
}

- (BOOL)watchdogDisableDebuggerCheck
{
  return 0;
}

- (BOOL)maybeDoFastExit
{
  return self->_maybeDoFastExit;
}

- (void)setMaybeDoFastExit:(BOOL)a3
{
  self->_maybeDoFastExit = a3;
}

@end