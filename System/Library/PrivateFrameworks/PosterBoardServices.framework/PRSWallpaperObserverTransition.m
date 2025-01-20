@interface PRSWallpaperObserverTransition
- (PRSWallpaperObserverTransition)init;
- (id)_initWithChanged:(unint64_t)a3;
- (id)description;
- (unint64_t)changed;
- (void)setChanged:(unint64_t)a3;
@end

@implementation PRSWallpaperObserverTransition

- (PRSWallpaperObserverTransition)init
{
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"-init is not allowed on %@", v6];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v8 = NSStringFromSelector(a2);
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138544642;
    v13 = v8;
    __int16 v14 = 2114;
    v15 = v10;
    __int16 v16 = 2048;
    v17 = self;
    __int16 v18 = 2114;
    v19 = @"PRSWallpaperObserver.m";
    __int16 v20 = 1024;
    int v21 = 145;
    __int16 v22 = 2114;
    v23 = v7;
    _os_log_error_impl(&dword_1A78AC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v7 UTF8String];
  result = (PRSWallpaperObserverTransition *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithChanged:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PRSWallpaperObserverTransition;
  id result = [(PRSWallpaperObserverTransition *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = PRSWallpaperObserverLocationsDescription(self->_changed);
  v7 = [v3 stringWithFormat:@"<%@:%p changed=(%@)>", v5, self, v6];

  return v7;
}

- (unint64_t)changed
{
  return self->_changed;
}

- (void)setChanged:(unint64_t)a3
{
  self->_changed = a3;
}

@end