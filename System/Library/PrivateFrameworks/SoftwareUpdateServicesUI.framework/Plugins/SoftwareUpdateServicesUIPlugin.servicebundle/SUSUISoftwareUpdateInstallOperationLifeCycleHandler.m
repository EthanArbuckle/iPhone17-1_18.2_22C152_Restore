@interface SUSUISoftwareUpdateInstallOperationLifeCycleHandler
- (BOOL)used;
- (SUAutoInstallOperation)tryTonightOperation;
- (SUSUISoftwareUpdateInstallOperationLifeCycleHandler)initWithTryTonightInstallOperation:(id)a3;
- (void)_clearTryTonightOperationCancelling:(BOOL)a3 forReason:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)setUsed:(BOOL)a3;
@end

@implementation SUSUISoftwareUpdateInstallOperationLifeCycleHandler

- (SUSUISoftwareUpdateInstallOperationLifeCycleHandler)initWithTryTonightInstallOperation:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)SUSUISoftwareUpdateInstallOperationLifeCycleHandler;
  v6 = [(SUSUISoftwareUpdateInstallOperationLifeCycleHandler *)&v7 init];
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    objc_storeStrong((id *)&v9->_tryTonightOperation, location[0]);
    v9->_used = 0;
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(SUSUISoftwareUpdateInstallOperationLifeCycleHandler *)self _clearTryTonightOperationCancelling:!self->_used forReason:@"dealloc initiated cancel"];
  v2.receiver = v4;
  v2.super_class = (Class)SUSUISoftwareUpdateInstallOperationLifeCycleHandler;
  [(SUSUISoftwareUpdateInstallOperationLifeCycleHandler *)&v2 dealloc];
}

- (SUAutoInstallOperation)tryTonightOperation
{
  return self->_tryTonightOperation;
}

- (void)cancel
{
}

- (void)_clearTryTonightOperationCancelling:(BOOL)a3 forReason:(id)a4
{
  v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  if (v6 && v8->_tryTonightOperation && !v8->_used)
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_24660((uint64_t)v9, (uint64_t)v8->_tryTonightOperation, (uint64_t)location);
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "Cancelling auto install operation (%p) for reason: %@", v9, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(SUAutoInstallOperation *)v8->_tryTonightOperation cancel];
    objc_storeStrong((id *)&v8->_tryTonightOperation, 0);
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)used
{
  return self->_used;
}

- (void)setUsed:(BOOL)a3
{
  self->_used = a3;
}

- (void).cxx_destruct
{
}

@end