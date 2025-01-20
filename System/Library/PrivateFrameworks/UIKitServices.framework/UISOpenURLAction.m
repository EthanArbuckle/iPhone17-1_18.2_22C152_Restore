@interface UISOpenURLAction
- (BOOL)isKindOfClass:(Class)a3;
- (BSProcessHandle)workspaceOriginatingProcess;
- (NSURL)url;
- (UISOpenURLAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (UISOpenURLAction)initWithURL:(id)a3;
- (UISOpenURLAction)initWithURL:(id)a3 workspaceOriginatingProcess:(id)a4;
- (UISOpenURLAction)initWithURL:(id)a3 workspaceOriginatingProcess:(id)a4 responder:(id)a5;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
@end

@implementation UISOpenURLAction

- (UISOpenURLAction)initWithURL:(id)a3
{
  return [(UISOpenURLAction *)self initWithURL:a3 workspaceOriginatingProcess:0];
}

- (UISOpenURLAction)initWithURL:(id)a3 workspaceOriginatingProcess:(id)a4
{
  return [(UISOpenURLAction *)self initWithURL:a3 workspaceOriginatingProcess:a4 responder:0];
}

- (UISOpenURLAction)initWithURL:(id)a3 workspaceOriginatingProcess:(id)a4 responder:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"UISOpenURLAction.m", 35, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F62860]);
  v13 = (void *)[v9 copy];
  [v12 setObject:v13 forSetting:1];

  [v12 setObject:v10 forSetting:2];
  v17.receiver = self;
  v17.super_class = (Class)UISOpenURLAction;
  v14 = [(UISOpenURLAction *)&v17 initWithInfo:v12 responder:v11];

  return v14;
}

- (UISOpenURLAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [v7 objectForSetting:1];
  if (NSClassFromString(&cfstr_Nsurl.isa))
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;
  id v11 = v10;
  if (v8 && !v10)
  {
    id v12 = BSLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136446466;
      v21 = "[info objectForSetting:1]";
      __int16 v22 = 2082;
      v23 = "NSURL";
      _os_log_impl(&dword_191ABF000, v12, OS_LOG_TYPE_DEFAULT, "BSSafeCast: \"%{public}s\" was not of expected class \"%{public}s\"", (uint8_t *)&v20, 0x16u);
    }
  }
  v13 = [v7 objectForSetting:2];

  if (NSClassFromString(&cfstr_Bsprocesshandl.isa))
  {
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }
  id v15 = v14;
  v16 = v15;
  if (v13 && !v15)
  {
    objc_super v17 = BSLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136446466;
      v21 = "[info objectForSetting:2]";
      __int16 v22 = 2082;
      v23 = "BSProcessHandle";
      _os_log_impl(&dword_191ABF000, v17, OS_LOG_TYPE_DEFAULT, "BSSafeCast: \"%{public}s\" was not of expected class \"%{public}s\"", (uint8_t *)&v20, 0x16u);
    }
  }
  v18 = [(UISOpenURLAction *)self initWithURL:v11 workspaceOriginatingProcess:v16];

  return v18;
}

- (BSProcessHandle)workspaceOriginatingProcess
{
  v2 = [(UISOpenURLAction *)self info];
  v3 = [v2 objectForSetting:2];

  return (BSProcessHandle *)v3;
}

- (NSURL)url
{
  v2 = [(UISOpenURLAction *)self info];
  id v3 = [v2 objectForSetting:1];

  return (NSURL *)v3;
}

- (int64_t)UIActionType
{
  return 1;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"url";
  }
  else {
    return 0;
  }
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISOpenURLAction;
  if (-[UISOpenURLAction isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  }
}

@end