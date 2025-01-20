@interface _PBFComplicationSnapshotResult
- (NSError)error;
- (UIImage)snapshot;
- (_PBFComplicationSnapshotResult)initWithSnapshot:(id)a3 error:(id)a4;
@end

@implementation _PBFComplicationSnapshotResult

- (_PBFComplicationSnapshotResult)initWithSnapshot:(id)a3 error:(id)a4
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (v8 | v9)
  {
    v10 = (void *)v9;
    v15.receiver = self;
    v15.super_class = (Class)_PBFComplicationSnapshotResult;
    v11 = [(_PBFComplicationSnapshotResult *)&v15 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_snapshot, a3);
      objc_storeStrong((id *)&v12->_error, a4);
    }

    return v12;
  }
  else
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"snapshot || error"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_PBFComplicationSnapshotResult initWithSnapshot:error:](a2);
    }
    [v14 UTF8String];
    result = (_PBFComplicationSnapshotResult *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (NSError)error
{
  return self->_error;
}

- (UIImage)snapshot
{
  return self->_snapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)initWithSnapshot:(const char *)a1 error:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end