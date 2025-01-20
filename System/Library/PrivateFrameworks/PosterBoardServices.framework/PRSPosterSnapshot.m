@interface PRSPosterSnapshot
+ (BOOL)supportsBSXPCSecureCoding;
- (CGImage)image;
- (IOSurface)surface;
- (PFServerPosterPath)homeScreenConfigurationPath;
- (PFServerPosterPath)switcherConfigurationPath;
- (PRSCodableImage)codableImage;
- (PRSPosterSnapshot)initWithBSXPCCoder:(id)a3;
- (PRSPosterSnapshot)initWithCodableImage:(id)a3;
- (PRSPosterSnapshot)initWithCodableImage:(id)a3 imageOrientation:(int64_t)a4 switcherConfigurationPath:(id)a5 homeScreenConfigurationPath:(id)a6 variant:(int64_t)a7 configurationType:(int64_t)a8;
- (PRSPosterSnapshot)initWithIOSurface:(id)a3;
- (PRSPosterSnapshot)initWithIOSurface:(id)a3 imageOrientation:(int64_t)a4 switcherConfigurationPath:(id)a5 homeScreenConfigurationPath:(id)a6 variant:(int64_t)a7 configurationType:(int64_t)a8;
- (int64_t)configurationType;
- (int64_t)imageOrientation;
- (int64_t)variant;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRSPosterSnapshot

- (PRSPosterSnapshot)initWithCodableImage:(id)a3
{
  return [(PRSPosterSnapshot *)self initWithCodableImage:a3 imageOrientation:0 switcherConfigurationPath:0 homeScreenConfigurationPath:0 variant:-1 configurationType:-1];
}

- (PRSPosterSnapshot)initWithCodableImage:(id)a3 imageOrientation:(int64_t)a4 switcherConfigurationPath:(id)a5 homeScreenConfigurationPath:(id)a6 variant:(int64_t)a7 configurationType:(int64_t)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = v16;
  if (v18)
  {
    NSClassFromString(&cfstr_Pfserverposter.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSPosterSnapshot initWithCodableImage:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:]();
      }
LABEL_13:
      [v23 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A78B3990);
    }
  }

  id v19 = v17;
  if (v19)
  {
    NSClassFromString(&cfstr_Pfserverposter.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSPosterSnapshot initWithCodableImage:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:]();
      }
      goto LABEL_13;
    }
  }

  v24.receiver = self;
  v24.super_class = (Class)PRSPosterSnapshot;
  v20 = [(PRSPosterSnapshot *)&v24 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_codableImage, a3);
    objc_storeStrong((id *)&v21->_switcherConfigurationPath, a5);
    objc_storeStrong((id *)&v21->_homeScreenConfigurationPath, a6);
    v21->_variant = a7;
    v21->_configurationType = a8;
    v21->_imageOrientation = a4;
  }

  return v21;
}

- (IOSurface)surface
{
  return (IOSurface *)[(PRSCodableImage *)self->_codableImage surfaceCreatingIfNecessary:1];
}

- (CGImage)image
{
  return [(PRSCodableImage *)self->_codableImage CGImage];
}

- (PRSPosterSnapshot)initWithIOSurface:(id)a3
{
  return [(PRSPosterSnapshot *)self initWithIOSurface:a3 imageOrientation:0 switcherConfigurationPath:0 homeScreenConfigurationPath:0 variant:-1 configurationType:-1];
}

- (PRSPosterSnapshot)initWithIOSurface:(id)a3 imageOrientation:(int64_t)a4 switcherConfigurationPath:(id)a5 homeScreenConfigurationPath:(id)a6 variant:(int64_t)a7 configurationType:(int64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = v14;
  if (v17)
  {
    NSClassFromString(&cfstr_Iosurface.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:IOSurfaceClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSPosterSnapshot initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:].cold.4();
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A78B3C70);
    }
  }

  id v18 = v15;
  if (v18)
  {
    NSClassFromString(&cfstr_Pfserverposter.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSPosterSnapshot initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:]();
      }
      [v27 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A78B3CD4);
    }
  }

  id v19 = v16;
  if (v19)
  {
    NSClassFromString(&cfstr_Pfserverposter.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSPosterSnapshot initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:]();
      }
LABEL_22:
      [v25 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A78B3C0CLL);
    }
  }

  v20 = [[PRSCodableImage alloc] initWithIOSurface:v17 scale:0 error:1.0];
  if (!v20)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"codableImage"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterSnapshot initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:]();
    }
    goto LABEL_22;
  }
  v21 = v20;
  v28.receiver = self;
  v28.super_class = (Class)PRSPosterSnapshot;
  v22 = [(PRSPosterSnapshot *)&v28 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_codableImage, v21);
    objc_storeStrong((id *)&v23->_switcherConfigurationPath, a5);
    objc_storeStrong((id *)&v23->_homeScreenConfigurationPath, a6);
    v23->_variant = a7;
    v23->_configurationType = a8;
    v23->_imageOrientation = a4;
  }

  return v23;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  codableImage = self->_codableImage;
  id v5 = a3;
  [v5 encodeObject:codableImage forKey:@"image"];
  [v5 encodeObject:self->_switcherConfigurationPath forKey:@"_switcherConfigurationPath"];
  [v5 encodeObject:self->_homeScreenConfigurationPath forKey:@"_homeScreenConfigurationPath"];
  [v5 encodeUInt64:self->_variant forKey:@"_variant"];
  [v5 encodeUInt64:self->_configurationType forKey:@"_configurationType"];
  [v5 encodeInt64:self->_imageOrientation forKey:@"_imageOrientation"];
}

- (PRSPosterSnapshot)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v6 = [v4 decodeObjectOfClass:v5 forKey:@"image"];

  v7 = self;
  v8 = [v4 decodeObjectOfClass:v7 forKey:@"_switcherConfigurationPath"];

  v9 = self;
  v10 = [v4 decodeObjectOfClass:v9 forKey:@"_homeScreenConfigurationPath"];

  uint64_t v11 = [v4 decodeUInt64ForKey:@"_variant"];
  uint64_t v12 = [v4 decodeUInt64ForKey:@"_configurationType"];
  uint64_t v13 = [v4 decodeInt64ForKey:@"_imageOrientation"];

  id v14 = [(PRSPosterSnapshot *)self initWithCodableImage:v6 imageOrientation:v13 switcherConfigurationPath:v8 homeScreenConfigurationPath:v10 variant:v11 configurationType:v12];
  return v14;
}

- (PFServerPosterPath)switcherConfigurationPath
{
  return self->_switcherConfigurationPath;
}

- (PFServerPosterPath)homeScreenConfigurationPath
{
  return self->_homeScreenConfigurationPath;
}

- (int64_t)variant
{
  return self->_variant;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (PRSCodableImage)codableImage
{
  return self->_codableImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codableImage, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigurationPath, 0);
  objc_storeStrong((id *)&self->_switcherConfigurationPath, 0);
}

- (void)initWithCodableImage:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:.cold.1()
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

- (void)initWithCodableImage:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:.cold.2()
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

- (void)initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:.cold.1()
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

- (void)initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:.cold.2()
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

- (void)initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:.cold.3()
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

- (void)initWithIOSurface:imageOrientation:switcherConfigurationPath:homeScreenConfigurationPath:variant:configurationType:.cold.4()
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