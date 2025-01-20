@interface SBDefaultIconModelStore
+ (SBDefaultIconModelStore)sharedInstance;
- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4;
- (SBDefaultIconModelStore)init;
- (id)loadCurrentIconState:(id *)a3;
- (id)loadDesiredIconState:(id *)a3;
- (void)_deleteLegacyState;
@end

@implementation SBDefaultIconModelStore

+ (SBDefaultIconModelStore)sharedInstance
{
  if (sharedInstance___once_9 != -1) {
    dispatch_once(&sharedInstance___once_9, &__block_literal_global_242);
  }
  v2 = (void *)sharedInstance___instance_8;
  return (SBDefaultIconModelStore *)v2;
}

uint64_t __41__SBDefaultIconModelStore_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBDefaultIconModelStore);
  v1 = (void *)sharedInstance___instance_8;
  sharedInstance___instance_8 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBDefaultIconModelStore)init
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [@"~/Library/SpringBoard/IconState.plist" stringByExpandingTildeInPath];
  v5 = [v3 fileURLWithPath:v4];
  v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = [@"~/Library/SpringBoard/DesiredIconState.plist" stringByExpandingTildeInPath];
  v8 = [v6 fileURLWithPath:v7];
  v9 = [(SBIconModelPropertyListFileStore *)self initWithIconStateURL:v5 desiredIconStateURL:v8];

  return v9;
}

- (id)loadCurrentIconState:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBDefaultIconModelStore;
  v3 = [(SBIconModelPropertyListFileStore *)&v7 loadCurrentIconState:a3];
  if (v3)
  {
    v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Read current icon state from disk.", v6, 2u);
    }
  }
  return v3;
}

- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBDefaultIconModelStore;
  BOOL v5 = [(SBIconModelPropertyListFileStore *)&v7 deleteDesiredIconStateWithOptions:a3 error:a4];
  if (v5) {
    [(SBDefaultIconModelStore *)self _deleteLegacyState];
  }
  return v5;
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBDefaultIconModelStore;
  BOOL v5 = [(SBIconModelPropertyListFileStore *)&v7 saveDesiredIconState:a3 error:a4];
  if (v5) {
    [(SBDefaultIconModelStore *)self _deleteLegacyState];
  }
  return v5;
}

- (id)loadDesiredIconState:(id *)a3
{
  BOOL v5 = +[SBDefaults localDefaults];
  v6 = [v5 iconDefaults];
  objc_super v7 = [v6 legacyIconState];

  if (v7)
  {
    v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "Read desired icon state from legacy user-defaults [1].";
LABEL_10:
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
    }
  }
  else
  {
    v10 = +[SBDefaults localDefaults];
    v11 = [v10 iconDefaults];
    objc_super v7 = [v11 legacyIconState2];

    if (v7)
    {
      v8 = SBLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v9 = "Read desired icon state from legacy user-defaults [2].";
        goto LABEL_10;
      }
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)SBDefaultIconModelStore;
      objc_super v7 = [(SBIconModelPropertyListFileStore *)&v13 loadDesiredIconState:a3];
      if (!v7) {
        goto LABEL_12;
      }
      v8 = SBLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v9 = "Read desired icon state from disk.";
        goto LABEL_10;
      }
    }
  }

LABEL_12:
  return v7;
}

- (void)_deleteLegacyState
{
  id v3 = +[SBDefaults localDefaults];
  v2 = [v3 iconDefaults];
  [v2 clearLegacyDefaults];
}

@end