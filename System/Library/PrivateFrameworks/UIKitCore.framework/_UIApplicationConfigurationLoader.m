@interface _UIApplicationConfigurationLoader
+ (_UIApplicationConfigurationLoader)sharedLoader;
- (BOOL)isFrontBoard;
- (BOOL)usesLocalInitializationContext;
- (UISApplicationInitializationContext)applicationInitializationContext;
- (id)_appInitializationContextFactoryClass;
- (id)_init;
- (id)_loadInitializationContext;
- (void)dealloc;
- (void)startPreloadInitializationContext;
@end

@implementation _UIApplicationConfigurationLoader

+ (_UIApplicationConfigurationLoader)sharedLoader
{
  if (qword_1EB2613D0 != -1) {
    dispatch_once(&qword_1EB2613D0, &__block_literal_global_293);
  }
  v2 = (void *)qword_1EB2613C8;
  return (_UIApplicationConfigurationLoader *)v2;
}

- (UISApplicationInitializationContext)applicationInitializationContext
{
  v2 = [(_UIApplicationConfigurationLoader *)self _loadInitializationContext];
  if (!v2)
  {
    if (qword_1EB2613F0 != -1) {
      dispatch_once(&qword_1EB2613F0, &__block_literal_global_46_1);
    }
    if (!_MergedGlobals_1099)
    {
      v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("ApplicationEnviromentLoading", &qword_1EB2613E8) + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Failed to initialize application enviroment context", v5, 2u);
      }
    }
  }
  return (UISApplicationInitializationContext *)v2;
}

- (id)_loadInitializationContext
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63___UIApplicationConfigurationLoader__loadInitializationContext__block_invoke;
  v4[3] = &unk_1E52D9CD0;
  v4[4] = self;
  v4[5] = a2;
  if (_loadInitializationContext_load_once != -1) {
    dispatch_once(&_loadInitializationContext_load_once, v4);
  }
  return self->_applicationInitializationContext;
}

- (void)startPreloadInitializationContext
{
  if ([(_UIApplicationConfigurationLoader *)self usesLocalInitializationContext])
  {
    id v3 = [(_UIApplicationConfigurationLoader *)self _loadInitializationContext];
  }
  else if (!self->_hasRequestedPreload)
  {
    v4 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70___UIApplicationConfigurationLoader_startPreloadInitializationContext__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_async(v4, block);

    self->_hasRequestedPreload = 1;
  }
}

- (BOOL)usesLocalInitializationContext
{
  if (qword_1EB2613F0 != -1) {
    dispatch_once(&qword_1EB2613F0, &__block_literal_global_46_1);
  }
  if (_MergedGlobals_1099) {
    return 1;
  }
  v4 = [(_UIApplicationConfigurationLoader *)self _appInitializationContextFactoryClass];
  BOOL v3 = v4 != 0;

  return v3;
}

- (id)_appInitializationContextFactoryClass
{
  if (qword_1EB2613E0 != -1) {
    dispatch_once(&qword_1EB2613E0, &__block_literal_global_9_1);
  }
  v2 = (void *)qword_1EB2613D8;
  return v2;
}

- (BOOL)isFrontBoard
{
  if (qword_1EB2613F0 != -1) {
    dispatch_once(&qword_1EB2613F0, &__block_literal_global_46_1);
  }
  return _MergedGlobals_1099;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIApplicationConfigurationLoader;
  return [(_UIApplicationConfigurationLoader *)&v3 init];
}

- (void)dealloc
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIApplicationConfigurationLoader.m" lineNumber:83 description:@"This is a singleton that should never be deallocated"];

  v5.receiver = self;
  v5.super_class = (Class)_UIApplicationConfigurationLoader;
  [(_UIApplicationConfigurationLoader *)&v5 dealloc];
}

- (void).cxx_destruct
{
}

@end