@interface _SiriIdleURLHandlingTask
- (void)performTask;
@end

@implementation _SiriIdleURLHandlingTask

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_SiriIdleURLHandlingTask has been run", v4, 2u);
  }

  [(URLHandlingTask *)self taskFailed];
}

@end