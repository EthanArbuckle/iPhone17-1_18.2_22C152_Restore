@interface NSSNewsTerminationItem
- (NSSNewsTerminationItem)init;
- (NSSNewsTerminationItem)initWithProcessType:(unint64_t)a3 bundleID:(id)a4;
- (NSString)bundleID;
- (unint64_t)processType;
- (void)setBundleID:(id)a3;
- (void)setProcessType:(unint64_t)a3;
@end

@implementation NSSNewsTerminationItem

- (NSSNewsTerminationItem)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NSSNewsTerminationItem init]";
    __int16 v9 = 2080;
    v10 = "NSSNewsTermination.m";
    __int16 v11 = 1024;
    int v12 = 36;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1E0102000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NSSNewsTerminationItem init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSSNewsTerminationItem)initWithProcessType:(unint64_t)a3 bundleID:(id)a4
{
  id v6 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSSNewsTerminationItem initWithProcessType:bundleID:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)NSSNewsTerminationItem;
  v7 = [(NSSNewsTerminationItem *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_processType = a3;
    uint64_t v9 = [v6 copy];
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v9;
  }
  return v8;
}

- (unint64_t)processType
{
  return self->_processType;
}

- (void)setProcessType:(unint64_t)a3
{
  self->_processType = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithProcessType:bundleID:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E0102000, MEMORY[0x1E4F14500], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);
}

@end