@interface PUIPosterSnapshotterResult
+ (BOOL)supportsSecureCoding;
- (PFPosterPath)outputPath;
- (PUIPosterSnapshotBundle)snapshotBundle;
- (PUIPosterSnapshotRequest)request;
- (PUIPosterSnapshotterResult)initWithCoder:(id)a3;
- (PUIPosterSnapshotterResult)initWithRequest:(id)a3 snapshotBundle:(id)a4 executionTime:(double)a5;
- (PUIPosterSnapshotterResult)initWithRequest:(id)a3 snapshotBundleBuilder:(id)a4 executionTime:(double)a5;
- (double)executionTime;
- (id)_snapshotBundleURL;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)finalizeWithError:(id *)a3;
- (void)invalidate;
@end

@implementation PUIPosterSnapshotterResult

- (PUIPosterSnapshotterResult)initWithRequest:(id)a3 snapshotBundleBuilder:(id)a4 executionTime:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v9;
  NSClassFromString(&cfstr_Puipostersnaps_0.isa);
  if (!v11)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotterResult initWithRequest:snapshotBundleBuilder:executionTime:]();
    }
LABEL_21:
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0CC4D4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PUIPosterSnapshotRequestClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotterResult initWithRequest:snapshotBundleBuilder:executionTime:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0CC538);
  }

  id v12 = v10;
  NSClassFromString(&cfstr_Puipostersnaps_2.isa);
  if (!v12)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotterResult initWithRequest:snapshotBundleBuilder:executionTime:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0CC59CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PUIPosterSnapshotBundleBuilderClass]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[PUIPosterSnapshotterResult initWithRequest:snapshotBundleBuilder:executionTime:]();
    }
    goto LABEL_21;
  }

  v24.receiver = self;
  v24.super_class = (Class)PUIPosterSnapshotterResult;
  v13 = [(PUIPosterSnapshotterResult *)&v24 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_request, a3);
    if ([v11 output] == 1)
    {
      v15 = (void *)MEMORY[0x263F5F438];
      v16 = [v11 path];
      v17 = [v16 role];
      uint64_t v18 = [v15 temporaryPathForTask:@"com.apple.PosterUIFoundation.snapshot" role:v17];
      outputPath = v14->_outputPath;
      v14->_outputPath = (BSInvalidatable *)v18;
    }
    objc_storeStrong((id *)&v14->_snapshotBundleBuilder, a4);
    v14->_executionTime = a5;
  }

  return v14;
}

- (PUIPosterSnapshotterResult)initWithRequest:(id)a3 snapshotBundle:(id)a4 executionTime:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [[PUIPosterSnapshotBundleBuilder alloc] initWithSnapshotBundle:v8];

  id v11 = [(PUIPosterSnapshotterResult *)self initWithRequest:v9 snapshotBundleBuilder:v10 executionTime:a5];
  return v11;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_outputPath invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PUIPosterSnapshotterResult;
  [(PUIPosterSnapshotterResult *)&v3 dealloc];
}

- (void)invalidate
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIPosterSnapshotterResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PUIPosterSnapshotterResult;
  v5 = [(PUIPosterSnapshotterResult *)&v17 init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"_request"];
    request = v5->_request;
    v5->_request = (PUIPosterSnapshotRequest *)v7;

    id v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"_outputPath"];
    outputPath = v5->_outputPath;
    v5->_outputPath = (BSInvalidatable *)v10;

    if (!v5->_outputPath)
    {
      id v12 = self;
      uint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"_snapshotBundle"];
      snapshotBundle = v5->_snapshotBundle;
      v5->_snapshotBundle = (PUIPosterSnapshotBundle *)v13;
    }
    [v4 decodeDoubleForKey:@"_executionTime"];
    v5->_executionTime = v15;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(PUIPosterSnapshotterResult *)self request];
  [v8 encodeObject:v4 forKey:@"_request"];

  outputPath = self->_outputPath;
  if (outputPath)
  {
    v6 = [(BSInvalidatable *)outputPath extendContentsReadAccessToAuditToken:0 error:0];
    uint64_t v7 = @"_outputPath";
  }
  else
  {
    v6 = [(PUIPosterSnapshotterResult *)self snapshotBundle];
    uint64_t v7 = @"_snapshotBundle";
  }
  [v8 encodeObject:v6 forKey:v7];

  [v8 encodeDouble:@"_executionTime" forKey:self->_executionTime];
}

- (void)finalizeWithError:(id *)a3
{
  if (!self->_snapshotBundle)
  {
    snapshotBundleBuilder = self->_snapshotBundleBuilder;
    if (self->_outputPath)
    {
      v6 = [(PUIPosterSnapshotterResult *)self _snapshotBundleURL];
      uint64_t v7 = +[PUIImageOnDiskFormat defaultFormat];
      id v8 = [(PUIPosterSnapshotBundleBuilder *)snapshotBundleBuilder buildWithOutputURL:v6 diskFormat:v7 error:a3];
      snapshotBundle = self->_snapshotBundle;
      self->_snapshotBundle = v8;
    }
    else
    {
      uint64_t v10 = [(PUIPosterSnapshotBundleBuilder *)self->_snapshotBundleBuilder buildWithError:a3];
      v6 = self->_snapshotBundle;
      self->_snapshotBundle = v10;
    }

    if (self->_snapshotBundle)
    {
      id v11 = self->_snapshotBundleBuilder;
      self->_snapshotBundleBuilder = 0;
    }
  }
}

- (PUIPosterSnapshotBundle)snapshotBundle
{
  snapshotBundle = self->_snapshotBundle;
  if (!snapshotBundle)
  {
    id v4 = [(PUIPosterSnapshotterResult *)self request];
    uint64_t v5 = [v4 output];

    if (v5 == 1)
    {
      v6 = [PUIPosterSnapshotBundle alloc];
      uint64_t v7 = [(PUIPosterSnapshotterResult *)self _snapshotBundleURL];
      id v8 = [(PUIPosterSnapshotBundle *)v6 initWithURL:v7];
      id v9 = self->_snapshotBundle;
      self->_snapshotBundle = v8;
    }
    snapshotBundle = self->_snapshotBundle;
  }
  uint64_t v10 = snapshotBundle;
  return v10;
}

- (id)_snapshotBundleURL
{
  v2 = [(BSInvalidatable *)self->_outputPath contentsURL];
  objc_super v3 = [v2 URLByAppendingPathComponent:@"Snapshot"];
  id v4 = [v3 URLByAppendingPathExtension:@"pks"];

  return v4;
}

- (PUIPosterSnapshotRequest)request
{
  return self->_request;
}

- (double)executionTime
{
  return self->_executionTime;
}

- (PFPosterPath)outputPath
{
  return self->_outputPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_snapshotBundle, 0);
  objc_storeStrong((id *)&self->_snapshotBundleBuilder, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
}

- (void)initWithRequest:snapshotBundleBuilder:executionTime:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithRequest:snapshotBundleBuilder:executionTime:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_25A0AF000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end