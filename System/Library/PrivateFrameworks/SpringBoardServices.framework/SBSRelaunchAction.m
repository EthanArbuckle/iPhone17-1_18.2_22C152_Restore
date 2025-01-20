@interface SBSRelaunchAction
+ (id)actionWithReason:(id)a3 options:(unint64_t)a4 targetURL:(id)a5;
- (NSString)reason;
- (NSURL)targetURL;
- (SBSRelaunchAction)initWithReason:(id)a3 options:(unint64_t)a4 targetURL:(id)a5;
- (unint64_t)options;
@end

@implementation SBSRelaunchAction

+ (id)actionWithReason:(id)a3 options:(unint64_t)a4 targetURL:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithReason:v9 options:a4 targetURL:v8];

  return v10;
}

- (SBSRelaunchAction)initWithReason:(id)a3 options:(unint64_t)a4 targetURL:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = v9;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v11)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSRelaunchAction initWithReason:options:targetURL:](a2);
    }
LABEL_16:
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18FBDCFD8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSRelaunchAction initWithReason:options:targetURL:](a2);
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18FBDD03CLL);
  }

  id v12 = v10;
  if (v12)
  {
    NSClassFromString(&cfstr_Nsurl.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SBSRelaunchAction initWithReason:options:targetURL:](a2);
      }
      goto LABEL_16;
    }
  }

  id v13 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v14 = (void *)[v11 copy];
  [v13 setObject:v14 forSetting:1];

  v15 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  [v13 setObject:v15 forSetting:2];

  if (v12) {
    [v13 setObject:v12 forSetting:3];
  }
  v20.receiver = self;
  v20.super_class = (Class)SBSRelaunchAction;
  v16 = [(SBSRelaunchAction *)&v20 initWithInfo:v13 responder:0];

  return v16;
}

- (NSString)reason
{
  v2 = [(SBSRelaunchAction *)self info];
  v3 = [v2 objectForSetting:1];

  return (NSString *)v3;
}

- (unint64_t)options
{
  v2 = [(SBSRelaunchAction *)self info];
  v3 = [v2 objectForSetting:2];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (NSURL)targetURL
{
  v2 = [(SBSRelaunchAction *)self info];
  v3 = [v2 objectForSetting:3];

  return (NSURL *)v3;
}

- (void)initWithReason:(const char *)a1 options:targetURL:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_18FBC5000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithReason:(const char *)a1 options:targetURL:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_18FBC5000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end