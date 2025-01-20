@interface DMDConfigurationSourceEventsOperation
- (BOOL)isAsynchronous;
- (void)main;
@end

@implementation DMDConfigurationSourceEventsOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  v3 = [(DMDConfigurationSourceTaskOperation *)self controller];
  v4 = [v3 delegate];
  if (objc_opt_respondsToSelector())
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100035EBC;
    v6[3] = &unk_1000CABC0;
    v6[4] = self;
    [v4 configurationSourceController:v3 fetchEventsWithCompletionHandler:v6];
  }
  else
  {
    v5 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000824C4(v5);
    }

    [(DMDConfigurationSourceEventsOperation *)self endOperationWithResultObject:0];
  }
}

@end