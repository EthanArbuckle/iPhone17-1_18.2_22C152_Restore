@interface TFFeedbackHandle
- (NSString)logKey;
- (SBSRemoteAlertHandle)internalHandle;
- (TFFeedbackHandle)initWithConfiguration:(id)a3;
- (TFFeedbackHandleConfiguration)configuration;
- (void)invalidateFeedbackViewController;
- (void)presentFeedbackViewController;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setInternalHandle:(id)a3;
@end

@implementation TFFeedbackHandle

- (TFFeedbackHandle)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TFFeedbackHandle;
  v5 = [(TFFeedbackHandle *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (TFFeedbackHandleConfiguration *)v6;

    uint64_t v8 = AMSGenerateLogCorrelationKey();
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v8;
  }
  return v5;
}

- (void)presentFeedbackViewController
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = +[TFLogConfiguration defaultConfiguration];
  id v4 = [v3 generatedLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    v7 = [(TFFeedbackHandle *)self logKey];
    uint64_t v8 = [(TFFeedbackHandle *)self configuration];
    v9 = [v8 bundleIdentifier];
    int v18 = 138543874;
    v19 = v5;
    __int16 v20 = 2112;
    v21 = v7;
    __int16 v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_223064000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: presentFeedbackViewController bundleIdentifier=%@", (uint8_t *)&v18, 0x20u);
  }
  v10 = (void *)[objc_alloc(MEMORY[0x263F79410]) initWithServiceName:@"com.apple.ios.StoreKitUIService" viewControllerClassName:@"ServiceTFFeedbackFormHostViewController"];
  id v11 = objc_alloc_init(MEMORY[0x263F79408]);
  v12 = [(TFFeedbackHandle *)self configuration];
  v13 = [v12 encodedAsUserInfo];
  [v11 setUserInfo:v13];

  v14 = (void *)[MEMORY[0x263F79428] newHandleWithDefinition:v10 configurationContext:v11];
  [(TFFeedbackHandle *)self setInternalHandle:v14];

  v15 = [(TFFeedbackHandle *)self internalHandle];
  [v15 addObserver:self];

  id v16 = objc_alloc_init(MEMORY[0x263F793F8]);
  v17 = [(TFFeedbackHandle *)self internalHandle];
  [v17 activateWithContext:v16];
}

- (void)invalidateFeedbackViewController
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = +[TFLogConfiguration defaultConfiguration];
  id v4 = [v3 generatedLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    v7 = [(TFFeedbackHandle *)self logKey];
    uint64_t v8 = [(TFFeedbackHandle *)self configuration];
    v9 = [v8 bundleIdentifier];
    int v11 = 138543874;
    v12 = v5;
    __int16 v13 = 2112;
    v14 = v7;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl(&dword_223064000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: invalidateFeedbackViewController bundleIdentifier=%@", (uint8_t *)&v11, 0x20u);
  }
  v10 = [(TFFeedbackHandle *)self internalHandle];
  [v10 invalidate];
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[TFLogConfiguration defaultConfiguration];
  id v6 = [v5 generatedLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_opt_class();
    id v8 = v7;
    v9 = [(TFFeedbackHandle *)self logKey];
    int v10 = 138543618;
    int v11 = v7;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl(&dword_223064000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: remoteAlertHandleDidDeactivate", (uint8_t *)&v10, 0x16u);
  }
  [v4 removeObserver:self];

  [(TFFeedbackHandle *)self setInternalHandle:0];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[TFLogConfiguration defaultConfiguration];
  v7 = [v6 generatedLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    int v10 = [(TFFeedbackHandle *)self logKey];
    int v11 = 138543618;
    __int16 v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    _os_log_impl(&dword_223064000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [%@]: remoteAlertHandle:didInvalidateWithError:", (uint8_t *)&v11, 0x16u);
  }
  [v5 removeObserver:self];

  [(TFFeedbackHandle *)self setInternalHandle:0];
}

- (TFFeedbackHandleConfiguration)configuration
{
  return self->_configuration;
}

- (SBSRemoteAlertHandle)internalHandle
{
  return self->_internalHandle;
}

- (void)setInternalHandle:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_internalHandle, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end