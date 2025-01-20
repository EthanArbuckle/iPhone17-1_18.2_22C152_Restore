@interface MultiTouchDiagnostic
- (BOOL)runWithTimeout:(double)a3;
- (void)handleNotification:(id)a3;
@end

@implementation MultiTouchDiagnostic

- (BOOL)runWithTimeout:(double)a3
{
  self->_BOOL success = 0;
  v5 = +[NSDistributedNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"handleNotification:" name:@"com.apple.hidswdebug.mtrecorder.write.complete" object:0];
  [v5 postNotificationName:@"com.apple.hidswdebug.mtrecorder.write.start" object:0 userInfo:0 options:3];
  v6 = (OS_dispatch_group *)dispatch_group_create();
  waitgroup = self->_waitgroup;
  self->_waitgroup = v6;

  v8 = self->_waitgroup;
  if (v8)
  {
    dispatch_group_enter((dispatch_group_t)v8);
    v9 = self->_waitgroup;
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_group_wait((dispatch_group_t)v9, v10);
    [v5 removeObserver:self];
    BOOL success = self->_success;
  }
  else
  {
    BOOL success = 0;
  }

  return success;
}

- (void)handleNotification:(id)a3
{
  self->_BOOL success = 1;
  dispatch_group_leave((dispatch_group_t)self->_waitgroup);
}

- (void).cxx_destruct
{
}

@end