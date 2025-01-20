@interface SBKeyboardFocusResolutionContext
+ (id)build:(id)a3;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isScreenDim;
- (BOOL)isSiriVisible;
- (BOOL)isSpotlightVisible;
- (NSString)description;
- (SBKeyboardFocusResolutionContext)init;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_init;
- (void)_initWithCopyOf:(void *)a1;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation SBKeyboardFocusResolutionContext

- (BOOL)isScreenDim
{
  return self->_screenDim;
}

+ (id)build:(id)a3
{
  v3 = (void (**)(id, id))a3;
  id v4 = -[SBKeyboardFocusResolutionContext _init]([SBMutableKeyboardFocusResolutionContext alloc]);
  v3[2](v3, v4);

  v5 = (void *)[v4 copy];
  return v5;
}

- (id)_init
{
  if (result)
  {
    v1 = result;
    uint64_t v2 = objc_opt_class();
    if (v2 == objc_opt_class() || (uint64_t v3 = objc_opt_class(), v3 == objc_opt_class()))
    {
      v5.receiver = v1;
      v5.super_class = (Class)SBKeyboardFocusResolutionContext;
      return objc_msgSendSuper2(&v5, sel_init);
    }
    else
    {
      id v4 = [NSString stringWithFormat:@"SBKeyboardFocusResolutionContext cannot be subclassed"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        [(SBKeyboardFocusResolutionContext *)sel__init _init];
      }
      [v4 UTF8String];
      result = (id)_bs_set_crash_log_message();
      __break(0);
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SBKeyboardFocusResolutionContext alloc];
  return -[SBKeyboardFocusResolutionContext _initWithCopyOf:](v4, self);
}

- (void)_initWithCopyOf:(void *)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    id v4 = -[SBKeyboardFocusResolutionContext _init](a1);
    a1 = v4;
    if (v4)
    {
      v4[10] = v3[10];
      v4[9] = v3[9];
      v4[8] = v3[8];
    }
  }

  return a1;
}

- (SBKeyboardFocusResolutionContext)init
{
  id v4 = [NSString stringWithFormat:@"cannot directly allocate SBKeyboardFocusResolutionContext"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_super v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"SBKeyboardFocusResolutionContext.m";
    __int16 v17 = 1024;
    int v18 = 30;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (SBKeyboardFocusResolutionContext *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)new
{
  id v4 = [NSString stringWithFormat:@"cannot directly allocate SBKeyboardFocusResolutionContext"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    objc_super v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    v16 = @"SBKeyboardFocusResolutionContext.m";
    __int16 v17 = 1024;
    int v18 = 35;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (unint64_t)hash
{
  uint64_t v3 = [NSNumber numberWithBool:self->_screenDim];
  uint64_t v4 = [v3 hash];

  objc_super v5 = [NSNumber numberWithBool:self->_siriVisible];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [NSNumber numberWithBool:self->_spotlightVisible];
  unint64_t v8 = v6 ^ [v7 hash];

  unint64_t v9 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v8 ^ (v8 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v8 ^ (v8 >> 30))) >> 27));
  return v9 ^ (v9 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = (unsigned __int8 *)v4;
    BOOL v6 = v5[10] == self->_screenDim && v5[8] == self->_spotlightVisible && v5[9] == self->_siriVisible;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [SBMutableKeyboardFocusResolutionContext alloc];
  return -[SBKeyboardFocusResolutionContext _initWithCopyOf:](v4, self);
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v7 = a3;
  id v4 = (id)[v7 appendBool:self->_screenDim withName:@"screenDim"];
  id v5 = (id)[v7 appendBool:self->_siriVisible withName:@"siriVisible"];
  id v6 = (id)[v7 appendBool:self->_spotlightVisible withName:@"spotlightVisible"];
}

- (BOOL)isSiriVisible
{
  return self->_siriVisible;
}

- (BOOL)isSpotlightVisible
{
  return self->_spotlightVisible;
}

- (void)_init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  unint64_t v9 = v5;
  __int16 v10 = 2114;
  __int16 v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  __int16 v15 = @"SBKeyboardFocusResolutionContext.m";
  __int16 v16 = 1024;
  int v17 = 41;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end