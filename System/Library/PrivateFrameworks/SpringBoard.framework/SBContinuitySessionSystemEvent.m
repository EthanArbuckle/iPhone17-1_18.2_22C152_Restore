@interface SBContinuitySessionSystemEvent
+ (id)eventWithType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (SBContinuitySessionSystemEvent)init;
- (SBContinuitySessionSystemEvent)initWithType:(int64_t)a3;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation SBContinuitySessionSystemEvent

+ (id)eventWithType:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithType:a3];
  return v3;
}

- (SBContinuitySessionSystemEvent)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBContinuitySessionSystemEvent;
  result = [(SBContinuitySessionSystemEvent *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (SBContinuitySessionSystemEvent)init
{
  v4 = [NSString stringWithFormat:@"-init is not allowed for SBContinuitySessionSystemEvent"];
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
    v16 = @"SBContinuitySessionSystemEvent.m";
    __int16 v17 = 1024;
    int v18 = 27;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (SBContinuitySessionSystemEvent *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_type == v4[1];

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

@end