@interface FSDATaskMessage
- (BOOL)didCompletion;
- (NSError)exitError;
- (OS_dispatch_group)dispatch_group;
- (void)completed:(id)a3 replyHandler:(id)a4;
- (void)logMessage:(id)a3;
- (void)prompt:(id)a3 replyHandler:(id)a4;
- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4;
- (void)setDidCompletion:(BOOL)a3;
- (void)setDispatch_group:(id)a3;
- (void)setExitError:(id)a3;
@end

@implementation FSDATaskMessage

- (void)logMessage:(id)a3
{
}

- (void)prompt:(id)a3 replyHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, const __CFString *, void))a4;
  sub_100008B68("%s\n", (const char *)[v5 UTF8String]);
  v6[2](v6, @"Completed prompt", 0);
}

- (void)promptTrueFalse:(id)a3 replyHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, uint64_t, void))a4;
  sub_100008B68("%s\n", (const char *)[v5 UTF8String]);
  v6[2](v6, 1, 0);
}

- (void)completed:(id)a3 replyHandler:(id)a4
{
  id v9 = a3;
  v7 = (void (**)(id, void, id))a4;
  sub_100008B68("Completed task with error %@\n", v9);
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_dispatch_group && !v8->_didCompletion)
  {
    objc_storeStrong((id *)&v8->_exitError, a3);
    dispatch_group_leave((dispatch_group_t)v8->_dispatch_group);
  }
  v8->_didCompletion = 1;
  objc_sync_exit(v8);

  v7[2](v7, 0, v9);
}

- (OS_dispatch_group)dispatch_group
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDispatch_group:(id)a3
{
}

- (NSError)exitError
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExitError:(id)a3
{
}

- (BOOL)didCompletion
{
  return self->_didCompletion;
}

- (void)setDidCompletion:(BOOL)a3
{
  self->_didCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitError, 0);

  objc_storeStrong((id *)&self->_dispatch_group, 0);
}

@end