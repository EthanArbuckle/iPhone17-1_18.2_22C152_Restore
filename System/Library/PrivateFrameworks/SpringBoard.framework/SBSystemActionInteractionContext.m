@interface SBSystemActionInteractionContext
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (uint64_t)initWithPreciseTimestamp:(uint64_t)a3 type:(void *)a4 suppressionStatus:;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation SBSystemActionInteractionContext

- (uint64_t)initWithPreciseTimestamp:(uint64_t)a3 type:(void *)a4 suppressionStatus:
{
  id v8 = a2;
  id v9 = a4;
  if (!a1) {
    goto LABEL_5;
  }
  if (v8)
  {
    v13.receiver = (id)a1;
    v13.super_class = (Class)SBSystemActionInteractionContext;
    v10 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = (uint64_t)v10;
    if (v10)
    {
      objc_storeStrong(v10 + 1, a2);
      *(void *)(a1 + 16) = a3;
      objc_storeStrong((id *)(a1 + 24), a4);
    }
LABEL_5:

    return a1;
  }
  v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"timestamp != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBSystemActionInteractionContext initWithPreciseTimestamp:type:suppressionStatus:](sel_initWithPreciseTimestamp_type_suppressionStatus_, a1, (uint64_t)v12);
  }
  [v12 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SBSystemActionInteractionContext_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __65__SBSystemActionInteractionContext_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"preciseTimestamp"];
  v3 = *(void **)(a1 + 32);
  id v4 = NSStringFromSBSystemActionInteractionType(*(void *)(*(void *)(a1 + 40) + 16));
  [v3 appendString:v4 withName:@"type"];

  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"suppressionStatus"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSystemActionInteractionContext *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      if ([(NSDate *)self->_preciseTimestamp isEqualToDate:v7->_preciseTimestamp]
        && self->_type == v7->_type)
      {
        char v8 = BSEqualObjects();
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_preciseTimestamp hash];
  suppressionStatus = self->_suppressionStatus;
  unint64_t v5 = self->_type + v3;
  return v5 + [(SBSystemActionSuppressionStatus *)suppressionStatus hash];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressionStatus, 0);
  objc_storeStrong((id *)&self->_preciseTimestamp, 0);
}

- (void)initWithPreciseTimestamp:(const char *)a1 type:(uint64_t)a2 suppressionStatus:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBSystemActionInteractionContext.m";
  __int16 v16 = 1024;
  int v17 = 36;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end