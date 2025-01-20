@interface PRSPosterUpdateHomeScreenAppearancePayload
+ (BOOL)supportsSecureCoding;
- (NSString)homeProviderIdentifier;
- (PRSPosterUpdateColorPayload)gradientColorAppearance;
- (PRSPosterUpdateColorPayload)solidColorAppearance;
- (PRSPosterUpdateHomeScreenAppearancePayload)init;
- (PRSPosterUpdateHomeScreenAppearancePayload)initWithCoder:(id)a3;
- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3;
- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3 gradientColorAppearance:(id)a4;
- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3 solidColorAppearance:(id)a4;
- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3 updateHomePoster:(id)a4 homeProviderIdentifier:(id)a5;
- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3 updateSwitcherPoster:(id)a4;
- (PRSPosterUpdateSessionInfo)homeProviderUpdateSessionInfo;
- (PRSPosterUpdateSessionInfo)switcherProviderUpdateSessionInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)rawValue;
- (unint64_t)updatedAppearanceType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterUpdateHomeScreenAppearancePayload

- (PRSPosterUpdateHomeScreenAppearancePayload)init
{
  v3.receiver = self;
  v3.super_class = (Class)PRSPosterUpdateHomeScreenAppearancePayload;
  result = [(PRSPosterUpdatePayload *)&v3 _init];
  if (result) {
    result->_updatedAppearanceType = 0;
  }
  return result;
}

- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3
{
  result = [(PRSPosterUpdateHomeScreenAppearancePayload *)self init];
  if (result)
  {
    if (a3 > 4)
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"Undefined apperance type specified %lu", a3);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:]();
      }
      [v5 UTF8String];
      result = (PRSPosterUpdateHomeScreenAppearancePayload *)_bs_set_crash_log_message();
      __break(0);
    }
    else
    {
      result->_updatedAppearanceType = a3;
    }
  }
  return result;
}

- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3 solidColorAppearance:(id)a4
{
  id v6 = a4;
  NSClassFromString(&cfstr_Prsposterupdat_19.isa);
  if (!v6)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:solidColorAppearance:]();
    }
LABEL_11:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D6178);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateColorPayloadClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:solidColorAppearance:]();
    }
    goto LABEL_11;
  }

  v7 = [(PRSPosterUpdateHomeScreenAppearancePayload *)self initWithUpdatedAppearanceType:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    solidColorAppearance = v7->_solidColorAppearance;
    v7->_solidColorAppearance = (PRSPosterUpdateColorPayload *)v8;
  }
  return v7;
}

- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3 gradientColorAppearance:(id)a4
{
  id v6 = a4;
  NSClassFromString(&cfstr_Prsposterupdat_19.isa);
  if (!v6)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:gradientColorAppearance:]();
    }
LABEL_11:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D62E0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateColorPayloadClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:gradientColorAppearance:]();
    }
    goto LABEL_11;
  }

  v7 = [(PRSPosterUpdateHomeScreenAppearancePayload *)self initWithUpdatedAppearanceType:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    gradientColorAppearance = v7->_gradientColorAppearance;
    v7->_gradientColorAppearance = (PRSPosterUpdateColorPayload *)v8;
  }
  return v7;
}

- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3 updateSwitcherPoster:(id)a4
{
  id v7 = a4;
  NSClassFromString(&cfstr_Prsposterupdat_18.isa);
  if (!v7)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateSwitcherPoster:]();
    }
LABEL_11:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D644CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateSwitcherPoster:]();
    }
    goto LABEL_11;
  }

  uint64_t v8 = [(PRSPosterUpdateHomeScreenAppearancePayload *)self initWithUpdatedAppearanceType:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_switcherProviderUpdateSessionInfo, a4);
  }

  return v9;
}

- (PRSPosterUpdateHomeScreenAppearancePayload)initWithUpdatedAppearanceType:(unint64_t)a3 updateHomePoster:(id)a4 homeProviderIdentifier:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  NSClassFromString(&cfstr_Prsposterupdat_18.isa);
  if (!v11)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:]();
    }
LABEL_19:
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D661CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D6680);
  }

  id v12 = v10;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v12)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D66E4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdateHomeScreenAppearancePayload initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:]();
    }
    goto LABEL_19;
  }

  v13 = [(PRSPosterUpdateHomeScreenAppearancePayload *)self initWithUpdatedAppearanceType:a3];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    homeProviderIdentifier = v13->_homeProviderIdentifier;
    v13->_homeProviderIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_homeProviderUpdateSessionInfo, a4);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithUpdatedAppearanceType:", self->_updatedAppearanceType);
  uint64_t v5 = [(PRSPosterUpdateColorPayload *)self->_solidColorAppearance copy];
  id v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(PRSPosterUpdateColorPayload *)self->_gradientColorAppearance copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  objc_storeStrong((id *)(v4 + 32), self->_switcherProviderUpdateSessionInfo);
  objc_storeStrong((id *)(v4 + 48), self->_homeProviderUpdateSessionInfo);
  uint64_t v9 = [(NSString *)self->_homeProviderIdentifier copy];
  id v10 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v9;

  return (id)v4;
}

- (PRSPosterUpdateHomeScreenAppearancePayload)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PRSPosterUpdatePayload *)self _init];
  if (v5)
  {
    v5->_updatedAppearanceType = [v4 decodeIntegerForKey:@"_updatedAppearanceType"];
    id v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"_solidColorAppearance"];
    solidColorAppearance = v5->_solidColorAppearance;
    v5->_solidColorAppearance = (PRSPosterUpdateColorPayload *)v7;

    uint64_t v9 = self;
    uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"_gradientColorAppearance"];
    gradientColorAppearance = v5->_gradientColorAppearance;
    v5->_gradientColorAppearance = (PRSPosterUpdateColorPayload *)v10;

    id v12 = self;
    uint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"_switcherProviderUpdateSessionInfo"];
    switcherProviderUpdateSessionInfo = v5->_switcherProviderUpdateSessionInfo;
    v5->_switcherProviderUpdateSessionInfo = (PRSPosterUpdateSessionInfo *)v13;

    v15 = self;
    uint64_t v16 = [v4 decodeObjectOfClass:v15 forKey:@"_homeProviderIdentifier"];
    homeProviderIdentifier = v5->_homeProviderIdentifier;
    v5->_homeProviderIdentifier = (NSString *)v16;

    v18 = self;
    uint64_t v19 = [v4 decodeObjectOfClass:v18 forKey:@"_homeProviderUpdateSessionInfo"];
    homeProviderUpdateSessionInfo = v5->_homeProviderUpdateSessionInfo;
    v5->_homeProviderUpdateSessionInfo = (PRSPosterUpdateSessionInfo *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t updatedAppearanceType = self->_updatedAppearanceType;
  id v5 = a3;
  [v5 encodeInteger:updatedAppearanceType forKey:@"_updatedAppearanceType"];
  [v5 encodeObject:self->_solidColorAppearance forKey:@"_solidColorAppearance"];
  [v5 encodeObject:self->_gradientColorAppearance forKey:@"_gradientColorAppearance"];
  [v5 encodeObject:self->_switcherProviderUpdateSessionInfo forKey:@"_switcherProviderUpdateSessionInfo"];
  [v5 encodeObject:self->_homeProviderIdentifier forKey:@"_homeProviderIdentifier"];
  [v5 encodeObject:self->_homeProviderUpdateSessionInfo forKey:@"_homeProviderUpdateSessionInfo"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rawValue
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_updatedAppearanceType];
  id v5 = [v3 dictionaryWithObject:v4 forKey:@"_updatedAppearanceType"];

  solidColorAppearance = self->_solidColorAppearance;
  if (solidColorAppearance)
  {
    uint64_t v7 = [(PRSPosterUpdateColorPayload *)solidColorAppearance color];
    [v5 setObject:v7 forKeyedSubscript:@"_solidColorAppearance"];
  }
  gradientColorAppearance = self->_gradientColorAppearance;
  if (gradientColorAppearance)
  {
    uint64_t v9 = [(PRSPosterUpdateColorPayload *)gradientColorAppearance color];
    [v5 setObject:v9 forKeyedSubscript:@"_gradientColorAppearance"];
  }
  homeProviderIdentifier = self->_homeProviderIdentifier;
  if (homeProviderIdentifier)
  {
    id v11 = (void *)[(NSString *)homeProviderIdentifier copy];
    [v5 setObject:v11 forKeyedSubscript:@"_homeProviderIdentifier"];
  }
  switcherProviderUpdateSessionInfo = self->_switcherProviderUpdateSessionInfo;
  if (switcherProviderUpdateSessionInfo) {
    [v5 setObject:switcherProviderUpdateSessionInfo forKeyedSubscript:@"_switcherProviderUpdateSessionInfo"];
  }
  if (self->_homeProviderUpdateSessionInfo) {
    [v5 setObject:self->_switcherProviderUpdateSessionInfo forKeyedSubscript:@"_homeProviderUpdateSessionInfo"];
  }
  return v5;
}

- (unint64_t)updatedAppearanceType
{
  return self->_updatedAppearanceType;
}

- (PRSPosterUpdateColorPayload)solidColorAppearance
{
  return self->_solidColorAppearance;
}

- (PRSPosterUpdateColorPayload)gradientColorAppearance
{
  return self->_gradientColorAppearance;
}

- (PRSPosterUpdateSessionInfo)switcherProviderUpdateSessionInfo
{
  return self->_switcherProviderUpdateSessionInfo;
}

- (NSString)homeProviderIdentifier
{
  return self->_homeProviderIdentifier;
}

- (PRSPosterUpdateSessionInfo)homeProviderUpdateSessionInfo
{
  return self->_homeProviderUpdateSessionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeProviderUpdateSessionInfo, 0);
  objc_storeStrong((id *)&self->_homeProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_switcherProviderUpdateSessionInfo, 0);
  objc_storeStrong((id *)&self->_gradientColorAppearance, 0);
  objc_storeStrong((id *)&self->_solidColorAppearance, 0);
}

- (void)initWithUpdatedAppearanceType:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatedAppearanceType:solidColorAppearance:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatedAppearanceType:gradientColorAppearance:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatedAppearanceType:updateSwitcherPoster:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatedAppearanceType:updateHomePoster:homeProviderIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end