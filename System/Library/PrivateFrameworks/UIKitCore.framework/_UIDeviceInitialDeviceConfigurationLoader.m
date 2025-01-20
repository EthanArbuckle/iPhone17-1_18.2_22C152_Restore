@interface _UIDeviceInitialDeviceConfigurationLoader
+ (_UIDeviceInitialDeviceConfigurationLoader)sharedLoader;
- (UISDeviceContext)initialDeviceContext;
- (void)_startPreloadInitialDeviceContext;
@end

@implementation _UIDeviceInitialDeviceConfigurationLoader

- (UISDeviceContext)initialDeviceContext
{
  if (!self->_hasRequestedPreload) {
    [(_UIDeviceInitialDeviceConfigurationLoader *)self _startPreloadInitialDeviceContext];
  }
  v3 = +[_UIApplicationConfigurationLoader sharedLoader];
  v4 = v3;
  if (!self->_context && ([v3 isFrontBoard] & 1) == 0)
  {
    v5 = [v4 applicationInitializationContext];
    if (!v5)
    {
      v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("DeviceConfigurationFetch", initialDeviceContext___s_category) + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Failed to load a device context.", v11, 2u);
      }
    }
    v7 = [v5 deviceContext];
    context = self->_context;
    self->_context = v7;
  }
  v9 = self->_context;

  return v9;
}

- (void)_startPreloadInitialDeviceContext
{
  id v7 = +[_UIApplicationConfigurationLoader sharedLoader];
  [v7 startPreloadInitializationContext];
  if (!self->_hasRequestedPreload)
  {
    self->_hasRequestedPreload = 1;
    if ([v7 usesLocalInitializationContext])
    {
      if (objc_opt_respondsToSelector())
      {
        v3 = objc_msgSend(MEMORY[0x1E4FB33D8], "__bootstrappingDeviceContext");
        if (v3) {
          objc_storeStrong((id *)&self->_context, v3);
        }
      }
      if (!self->_context)
      {
        v4 = [v7 applicationInitializationContext];
        v5 = [v4 deviceContext];
        context = self->_context;
        self->_context = v5;
      }
    }
  }
}

+ (_UIDeviceInitialDeviceConfigurationLoader)sharedLoader
{
  if (_MergedGlobals_1101 != -1) {
    dispatch_once(&_MergedGlobals_1101, &__block_literal_global_295);
  }
  v2 = (void *)qword_1EB261410;
  return (_UIDeviceInitialDeviceConfigurationLoader *)v2;
}

- (void).cxx_destruct
{
}

@end