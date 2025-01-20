@interface SBKeyboardFocusTarget
+ (id)targetForFBScene:(id)a3;
+ (id)targetForSBWindowScene:(id)a3;
+ (id)targetForSceneIdentityToken:(id)a3 pid:(int)a4;
- (BOOL)isEqual:(id)a3;
- (FBSSceneIdentityToken)sceneIdentityToken;
- (id)deferringTarget;
- (id)deferringToken;
- (id)description;
- (id)focusChange;
- (int)pid;
- (uint64_t)_initWithSceneIdentityToken:(int)a3 pid:;
- (unint64_t)hash;
@end

@implementation SBKeyboardFocusTarget

- (void).cxx_destruct
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ pid:%d>", self->_sceneIdentityToken, self->_pid];
}

- (FBSSceneIdentityToken)sceneIdentityToken
{
  return self->_sceneIdentityToken;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if (BSEqualObjects()) {
      BOOL v6 = v5[4] == self->_pid;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (int)pid
{
  return self->_pid;
}

+ (id)targetForSBWindowScene:(id)a3
{
  if (a3)
  {
    id v4 = [a3 _FBSScene];
    v5 = [v4 identityToken];

    BOOL v6 = [a1 targetForSceneIdentityToken:v5 pid:getpid()];
  }
  else
  {
    BOOL v6 = 0;
  }
  return v6;
}

+ (id)targetForSceneIdentityToken:(id)a3 pid:(int)a4
{
  id v5 = a3;
  BOOL v6 = (void *)-[SBKeyboardFocusTarget _initWithSceneIdentityToken:pid:]([SBKeyboardFocusTarget alloc], v5, a4);

  return v6;
}

- (uint64_t)_initWithSceneIdentityToken:(int)a3 pid:
{
  id v6 = a2;
  if (!a1) {
    goto LABEL_5;
  }
  v10.receiver = a1;
  v10.super_class = (Class)SBKeyboardFocusTarget;
  id v7 = objc_msgSendSuper2(&v10, sel_init);
  a1 = v7;
  if (!v7) {
    goto LABEL_5;
  }
  if (a3 > 0)
  {
    objc_storeStrong((id *)v7 + 1, a2);
    a1[4] = a3;
LABEL_5:

    return (uint64_t)a1;
  }
  v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pid > 0"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBKeyboardFocusTarget _initWithSceneIdentityToken:pid:](sel__initWithSceneIdentityToken_pid_, (uint64_t)a1, (uint64_t)v9);
  }
  [v9 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)deferringTarget
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F4F368]);
    [v2 setPid:*(unsigned int *)(a1 + 16)];
    v3 = -[SBKeyboardFocusTarget deferringToken](a1);
    [v2 setToken:v3];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)deferringToken
{
  if (a1 && (v1 = *(void **)(a1 + 8)) != 0)
  {
    id v2 = (void *)MEMORY[0x1E4F4F290];
    v3 = [v1 stringRepresentation];
    id v4 = [v2 tokenForString:v3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)targetForFBScene:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 clientHandle];
    id v6 = [v5 processHandle];
    uint64_t v7 = [v6 pid];

    if ((int)v7 > 0)
    {
      v8 = [v4 identityToken];
      v9 = +[SBKeyboardFocusTarget targetForSceneIdentityToken:v8 pid:v7];

      goto LABEL_8;
    }
    objc_super v10 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[SBKeyboardFocusTarget targetForFBScene:]((uint64_t)v4, v10);
    }
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (id)focusChange
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F71DE0]) initWithSceneIdentity:self->_sceneIdentityToken pid:self->_pid];
  return v2;
}

- (unint64_t)hash
{
  uint64_t v3 = [(FBSSceneIdentityToken *)self->_sceneIdentityToken hash];
  id v4 = [NSNumber numberWithInt:self->_pid];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (void)_initWithSceneIdentityToken:(uint64_t)a3 pid:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBKeyboardFocusTarget.m";
  __int16 v16 = 1024;
  int v17 = 33;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

+ (void)targetForFBScene:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "invalid pid for scene %{public}@, returning nil target", (uint8_t *)&v2, 0xCu);
}

@end