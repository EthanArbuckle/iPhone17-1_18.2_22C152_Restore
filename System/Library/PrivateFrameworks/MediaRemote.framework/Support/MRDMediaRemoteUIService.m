@interface MRDMediaRemoteUIService
- (BOOL)isValid;
- (MRDMediaRemoteUIService)initWithConfiguration:(id)a3 endpoint:(id)a4;
- (MRDMediaRemoteUIService)initWithConfigurationData:(id)a3 endpoint:(id)a4;
- (NSData)configurationData;
- (NSString)bundleIdentifier;
- (OS_xpc_object)endpoint;
- (SBSRemoteAlertHandle)remoteAlertHandle;
- (id)completion;
- (void)_createRemoteAlertHandleIfNeeded;
- (void)dealloc;
- (void)presentWithCompletion:(id)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setConfigurationData:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setRemoteAlertHandle:(id)a3;
@end

@implementation MRDMediaRemoteUIService

- (MRDMediaRemoteUIService)initWithConfiguration:(id)a3 endpoint:(id)a4
{
  id v6 = a4;
  v7 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  v8 = [(MRDMediaRemoteUIService *)self initWithConfigurationData:v7 endpoint:v6];

  return v8;
}

- (MRDMediaRemoteUIService)initWithConfigurationData:(id)a3 endpoint:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRDMediaRemoteUIService;
  v9 = [(MRDMediaRemoteUIService *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configurationData, a3);
    objc_storeStrong((id *)&v10->_endpoint, a4);
    [(MRDMediaRemoteUIService *)v10 _createRemoteAlertHandleIfNeeded];
  }

  return v10;
}

- (void)dealloc
{
  id completion = self->_completion;
  self->_id completion = 0;

  [(SBSRemoteAlertHandle *)self->_remoteAlertHandle unregisterObserver:self];
  [(SBSRemoteAlertHandle *)self->_remoteAlertHandle invalidate];
  v4.receiver = self;
  v4.super_class = (Class)MRDMediaRemoteUIService;
  [(MRDMediaRemoteUIService *)&v4 dealloc];
}

- (BOOL)isValid
{
  return [(SBSRemoteAlertHandle *)self->_remoteAlertHandle isValid];
}

- (void)presentWithCompletion:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id completion = self->_completion;
  self->_id completion = v4;

  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting to activate remote alert handle.", v10, 2u);
  }

  [(MRDMediaRemoteUIService *)self _createRemoteAlertHandleIfNeeded];
  id v7 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  id v8 = [(NSString *)self->_bundleIdentifier lowercaseString];
  unsigned int v9 = [v8 isEqualToString:@"com.apple.siri"];

  if (v9) {
    [v7 setActivatingForSiri:1];
  }
  [(SBSRemoteAlertHandle *)self->_remoteAlertHandle activateWithContext:v7];
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Remote alert handle did activate.", v6, 2u);
  }

  id completion = (void (**)(id, void))self->_completion;
  if (completion) {
    completion[2](completion, 0);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remote alert handle did deactivate.", v4, 2u);
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a4;
  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100330DB8((uint64_t)v5, v6);
  }

  id completion = (void (**)(id, id))self->_completion;
  if (completion) {
    completion[2](completion, v5);
  }
}

- (void)_createRemoteAlertHandleIfNeeded
{
  remoteAlertHandle = self->_remoteAlertHandle;
  if (!remoteAlertHandle || ([(SBSRemoteAlertHandle *)remoteAlertHandle isValid] & 1) == 0)
  {
    id v4 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    id v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      CFStringRef v11 = @"MusicUIServiceNowPlayingViewController";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Creating remote alert handle for remote view controller: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    id v6 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.MusicUIService" viewControllerClassName:@"MusicUIServiceNowPlayingViewController"];
    id v7 = +[NSDictionary dictionaryWithObject:self->_configurationData forKey:kMRMediaRemoteMediaControlsConfigurationKey];
    [v4 setUserInfo:v7];

    [v4 setXpcEndpoint:self->_endpoint];
    id v8 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:v6 configurationContext:v4];
    unsigned int v9 = self->_remoteAlertHandle;
    self->_remoteAlertHandle = v8;

    [(SBSRemoteAlertHandle *)self->_remoteAlertHandle registerObserver:self];
  }
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSData)configurationData
{
  return self->_configurationData;
}

- (void)setConfigurationData:(id)a3
{
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (SBSRemoteAlertHandle)remoteAlertHandle
{
  return self->_remoteAlertHandle;
}

- (void)setRemoteAlertHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end