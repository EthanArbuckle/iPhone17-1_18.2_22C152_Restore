@interface _UIScreenInitialDisplayConfigurationLoader
+ (_UIScreenInitialDisplayConfigurationLoader)sharedLoader;
- (UISDisplayContext)initialDisplayContext;
- (void)_startPreloadInitialDisplayContext;
@end

@implementation _UIScreenInitialDisplayConfigurationLoader

+ (_UIScreenInitialDisplayConfigurationLoader)sharedLoader
{
  if (qword_1EB25C550 != -1) {
    dispatch_once(&qword_1EB25C550, &__block_literal_global_290);
  }
  v2 = (void *)qword_1EB25C558;
  return (_UIScreenInitialDisplayConfigurationLoader *)v2;
}

- (void)_startPreloadInitialDisplayContext
{
  id v5 = +[_UIApplicationConfigurationLoader sharedLoader];
  [v5 startPreloadInitializationContext];
  if (!self->_hasRequestedPreload)
  {
    self->_hasRequestedPreload = 1;
    [v5 isFrontBoard];
    v3 = [MEMORY[0x1E4F39B60] displays];
    [v3 count];

    context = self->_context;
    self->_context = 0;
  }
}

- (UISDisplayContext)initialDisplayContext
{
  if (!self->_hasRequestedPreload) {
    [(_UIScreenInitialDisplayConfigurationLoader *)self _startPreloadInitialDisplayContext];
  }
  v3 = +[_UIApplicationConfigurationLoader sharedLoader];
  [v3 isFrontBoard];
  if (!self->_context)
  {
    v4 = [MEMORY[0x1E4F39B60] displays];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      v6 = [v3 applicationInitializationContext];
      if (!v6)
      {
        v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("DisplayConfigurationFetch", &initialDisplayContext___s_category)+ 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Failed to load a display context, even though we are not a headless app.", v14, 2u);
        }
      }
      v8 = [v6 mainDisplayContext];
      context = self->_context;
      self->_context = v8;

      if (!self->_context)
      {
        v10 = [MEMORY[0x1E4FB33E0] defaultContext];
        v11 = self->_context;
        self->_context = v10;
      }
    }
  }
  v12 = self->_context;

  return v12;
}

- (void).cxx_destruct
{
}

@end