@interface SBFMutablePhysicalButtonSceneTarget
+ (id)targetWithScene:(id)a3;
+ (id)targetWithSceneIdentity:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addButtonTarget:(id)a3;
- (void)removeButtonTargetForButton:(unint64_t)a3;
@end

@implementation SBFMutablePhysicalButtonSceneTarget

+ (id)targetWithScene:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v7 = (id *)objc_alloc((Class)a1);
    v8 = [v6 identity];
    v9 = -[SBFPhysicalButtonSceneTarget _initWithScene:sceneIdentity:targetsByButton:](v7, v6, v8, 0);

    return v9;
  }
  else
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[SBFMutablePhysicalButtonSceneTarget targetWithScene:(uint64_t)v11];
    }
    [v11 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)addButtonTarget:(id)a3
{
  if (a3)
  {
    targetsByButton = self->super._targetsByButton;
    v4 = NSNumber;
    id v5 = a3;
    objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "button"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableDictionary *)targetsByButton setObject:v5 forKey:v6];
  }
}

+ (id)targetWithSceneIdentity:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    v7 = -[SBFPhysicalButtonSceneTarget _initWithScene:sceneIdentity:targetsByButton:]((id *)objc_alloc((Class)a1), 0, v5, 0);

    return v7;
  }
  else
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"sceneIdentity != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[SBFMutablePhysicalButtonSceneTarget targetWithSceneIdentity:(uint64_t)v9];
    }
    [v9 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)removeButtonTargetForButton:(unint64_t)a3
{
  targetsByButton = self->super._targetsByButton;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)targetsByButton removeObjectForKey:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SBFPhysicalButtonSceneTarget alloc];
  id v5 = [(SBFPhysicalButtonSceneTarget *)self scene];
  id v6 = [(SBFPhysicalButtonSceneTarget *)self sceneIdentity];
  v7 = (void *)[(NSMutableDictionary *)self->super._targetsByButton mutableCopy];
  v8 = -[SBFPhysicalButtonSceneTarget _initWithScene:sceneIdentity:targetsByButton:]((id *)&v4->super.isa, v5, v6, v7);

  return v8;
}

+ (void)targetWithScene:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_6();
  v9 = @"SBFPhysicalButtonSceneTarget.m";
  __int16 v10 = 1024;
  int v11 = 190;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

+ (void)targetWithSceneIdentity:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_6();
  v9 = @"SBFPhysicalButtonSceneTarget.m";
  __int16 v10 = 1024;
  int v11 = 195;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_18B52E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end