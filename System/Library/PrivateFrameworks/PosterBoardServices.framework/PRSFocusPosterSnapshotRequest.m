@interface PRSFocusPosterSnapshotRequest
- (NSString)focusModeUUID;
- (PRSFocusPosterSnapshotRequest)init;
- (PRSFocusPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 configurationType:(int64_t)a4 variant:(int64_t)a5 options:(unint64_t)a6 imageScaleRelativeToScreen:(double)a7 maxCount:(unint64_t)a8;
- (PRSFocusPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 configurationType:(int64_t)a4 variant:(int64_t)a5 options:(unint64_t)a6 imageScaleRelativeToScreen:(double)a7 orientation:(int64_t)a8 maxCount:(unint64_t)a9;
- (PRSFocusPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 configurationType:(int64_t)a4 variant:(int64_t)a5 options:(unint64_t)a6 maxCount:(unint64_t)a7;
- (PRSFocusPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 maxCount:(unint64_t)a4;
- (PRSFocusPosterSnapshotRequest)initWithPosterRequest:(id)a3;
- (double)imageScaleRelativeToScreen;
- (int64_t)configurationType;
- (int64_t)orientation;
- (int64_t)variant;
- (unint64_t)maxCount;
- (unint64_t)options;
- (void)setImageScaleRelativeToScreen:(double)a3;
@end

@implementation PRSFocusPosterSnapshotRequest

- (PRSFocusPosterSnapshotRequest)init
{
  v4 = [NSString stringWithFormat:@"Please use the designated initializer"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"PRSPosterSnapshotRequest.m";
    __int16 v17 = 1024;
    int v18 = 426;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A78AC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (PRSFocusPosterSnapshotRequest *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (PRSFocusPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 maxCount:(unint64_t)a4
{
  return [(PRSFocusPosterSnapshotRequest *)self initWithFocusModeUUID:a3 configurationType:1 variant:0 options:0 imageScaleRelativeToScreen:1 orientation:a4 maxCount:0.333333343];
}

- (PRSFocusPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 configurationType:(int64_t)a4 variant:(int64_t)a5 options:(unint64_t)a6 maxCount:(unint64_t)a7
{
  return [(PRSFocusPosterSnapshotRequest *)self initWithFocusModeUUID:a3 configurationType:a4 variant:a5 options:a6 imageScaleRelativeToScreen:1 orientation:a7 maxCount:0.333333343];
}

- (PRSFocusPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 configurationType:(int64_t)a4 variant:(int64_t)a5 options:(unint64_t)a6 imageScaleRelativeToScreen:(double)a7 maxCount:(unint64_t)a8
{
  return [(PRSFocusPosterSnapshotRequest *)self initWithFocusModeUUID:a3 configurationType:a4 variant:a5 options:a6 imageScaleRelativeToScreen:1 orientation:a8 maxCount:a7];
}

- (PRSFocusPosterSnapshotRequest)initWithFocusModeUUID:(id)a3 configurationType:(int64_t)a4 variant:(int64_t)a5 options:(unint64_t)a6 imageScaleRelativeToScreen:(double)a7 orientation:(int64_t)a8 maxCount:(unint64_t)a9
{
  id v16 = a3;
  if (v16)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:].cold.4();
      }
LABEL_22:
      [v22 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A78D94A8);
    }
  }

  if ((unint64_t)(a4 - 2) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"configurationType >= PRSPosterSnapshotRequestConfigurationTypeNone && configurationType <= PRSPosterSnapshotRequestConfigurationTypeActive"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:]();
    }
    goto LABEL_22;
  }
  if ((unint64_t)(a5 - 2) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"variant >= PRSPosterSnapshotRequestVariantNone && variant <= PRSPosterSnapshotRequestVariantHomeScreen"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D950CLL);
  }
  if (!a9)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"maxCount > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSFocusPosterSnapshotRequest initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:]();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D9570);
  }
  v25.receiver = self;
  v25.super_class = (Class)PRSFocusPosterSnapshotRequest;
  __int16 v17 = [(PRSFocusPosterSnapshotRequest *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v16 copy];
    focusModeUUID = v17->_focusModeUUID;
    v17->_focusModeUUID = (NSString *)v18;

    v17->_configurationType = a4;
    v17->_variant = a5;
    double v20 = 0.333333343;
    if (a7 > 0.0) {
      double v20 = a7;
    }
    v17->_imageScaleRelativeToScreen = v20;
    v17->_orientation = a8;
    v17->_options = a6;
    v17->_maxCount = a9;
  }

  return v17;
}

- (PRSFocusPosterSnapshotRequest)initWithPosterRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 requestOptions];
  v6 = [v5 objectForKey:@"PRSPosterSnapshotRequestOptionFocusUUID"];
  v7 = [v6 UUIDString];

  v8 = [v4 requestOptions];
  int v9 = [v8 objectForKey:@"PRSPosterSnapshotRequestOptionLegacyConfigurationType"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  __int16 v11 = [v4 requestOptions];
  v12 = [v11 objectForKey:@"PRSPosterSnapshotRequestOptionLegacyVariant"];
  uint64_t v13 = [v12 unsignedIntegerValue];

  v14 = [v4 requestOptions];
  __int16 v15 = [v14 objectForKey:@"PRSPosterSnapshotRequestOptionOptionsEnum"];
  uint64_t v16 = [v15 unsignedIntegerValue];

  __int16 v17 = [v4 requestOptions];
  uint64_t v18 = [v17 objectForKey:@"PRSPosterSnapshotRequestOptionLegacyImageScaleRelativeToScreen"];
  [v18 doubleValue];
  double v20 = v19;

  v21 = [v4 requestOptions];
  v22 = [v21 objectForKey:@"PRSPosterSnapshotRequestOptionLegacyMaxCount"];
  uint64_t v23 = [v22 unsignedIntegerValue];

  uint64_t v24 = [v4 orientation];
  objc_super v25 = [(PRSFocusPosterSnapshotRequest *)self initWithFocusModeUUID:v7 configurationType:v10 variant:v13 options:v16 imageScaleRelativeToScreen:v24 orientation:v23 maxCount:v20];

  return v25;
}

- (void)setImageScaleRelativeToScreen:(double)a3
{
  self->_imageScaleRelativeToScreen = a3;
}

- (NSString)focusModeUUID
{
  return self->_focusModeUUID;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (int64_t)variant
{
  return self->_variant;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (double)imageScaleRelativeToScreen
{
  return self->_imageScaleRelativeToScreen;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
}

- (void)initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithFocusModeUUID:configurationType:variant:options:imageScaleRelativeToScreen:orientation:maxCount:.cold.4()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end