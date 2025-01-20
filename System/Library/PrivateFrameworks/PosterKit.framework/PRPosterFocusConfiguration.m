@interface PRPosterFocusConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)decodeObjectWithJSON:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFocusConfiguration:(id)a3;
- (NSString)activityIdentifier;
- (NSString)attributeType;
- (NSString)description;
- (NSUUID)activityUUID;
- (PRPosterFocusConfiguration)initWithActivityIdentifier:(id)a3 activityUUID:(id)a4;
- (PRPosterFocusConfiguration)initWithBSXPCCoder:(id)a3;
- (PRPosterFocusConfiguration)initWithCoder:(id)a3;
- (id)encodeJSON;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterFocusConfiguration

- (PRPosterFocusConfiguration)initWithActivityIdentifier:(id)a3 activityUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v8)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterFocusConfiguration initWithActivityIdentifier:activityUUID:]();
    }
LABEL_19:
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C279164);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterFocusConfiguration initWithActivityIdentifier:activityUUID:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C2791C8);
  }

  id v9 = v7;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v9)
  {
    v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterFocusConfiguration initWithActivityIdentifier:activityUUID:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C27922CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRPosterFocusConfiguration initWithActivityIdentifier:activityUUID:]();
    }
    goto LABEL_19;
  }

  v19.receiver = self;
  v19.super_class = (Class)PRPosterFocusConfiguration;
  v10 = [(PRPosterFocusConfiguration *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    activityIdentifier = v10->_activityIdentifier;
    v10->_activityIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    activityUUID = v10->_activityUUID;
    v10->_activityUUID = (NSUUID *)v13;
  }
  return v10;
}

- (PRPosterFocusConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"activityIdentifier"];

  id v7 = self;
  id v8 = [v4 decodeObjectOfClass:v7 forKey:@"activityUUID"];

  id v9 = [(PRPosterFocusConfiguration *)self initWithActivityIdentifier:v6 activityUUID:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PRPosterFocusConfiguration *)self activityIdentifier];
  [v4 encodeObject:v5 forKey:@"activityIdentifier"];

  id v6 = [(PRPosterFocusConfiguration *)self activityUUID];
  [v4 encodeObject:v6 forKey:@"activityUUID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterFocusConfiguration *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PRPosterFocusConfiguration *)self isEqualToFocusConfiguration:v4];
  }

  return v5;
}

- (BOOL)isEqualToFocusConfiguration:(id)a3
{
  id v4 = (PRPosterFocusConfiguration *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else if (v4)
  {
    id v6 = [(PRPosterFocusConfiguration *)self activityIdentifier];
    id v7 = [(PRPosterFocusConfiguration *)v5 activityIdentifier];
    if (BSEqualObjects())
    {
      id v8 = [(PRPosterFocusConfiguration *)self activityUUID];
      id v9 = [(PRPosterFocusConfiguration *)v5 activityUUID];
      char v10 = BSEqualObjects();
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(PRPosterFocusConfiguration *)self activityIdentifier];
  id v4 = [(PRPosterFocusConfiguration *)self activityUUID];
  BOOL v5 = [MEMORY[0x1E4F4F758] builder];
  id v6 = (id)[v5 appendString:v3];
  id v7 = (id)[v5 appendObject:v4];
  unint64_t v8 = [v5 hash];

  return v8;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(PRPosterFocusConfiguration *)self activityUUID];
  id v5 = (id)[v3 appendObject:v4 withName:@"activityUUID"];

  id v6 = [(PRPosterFocusConfiguration *)self activityIdentifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"activityIdentifier"];

  unint64_t v8 = [v3 build];

  return (NSString *)v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterFocusConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"activityIdentifier"];

  id v7 = self;
  unint64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"activityUUID"];

  id v9 = [(PRPosterFocusConfiguration *)self initWithActivityIdentifier:v6 activityUUID:v8];
  return v9;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PRPosterFocusConfiguration *)self activityIdentifier];
  [v4 encodeObject:v5 forKey:@"activityIdentifier"];

  id v6 = [(PRPosterFocusConfiguration *)self activityUUID];
  [v4 encodeObject:v6 forKey:@"activityUUID"];
}

- (id)encodeJSON
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(PRPosterFocusConfiguration *)self activityIdentifier];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, @"activityIdentifier");

  id v5 = [(PRPosterFocusConfiguration *)self activityUUID];
  id v6 = [v5 UUIDString];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, @"activityUUID");

  id v7 = [(PRPosterFocusConfiguration *)self attributeType];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v7, @"attributeType");

  id v12 = 0;
  unint64_t v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v12];
  id v9 = v12;
  if (v9)
  {
    char v10 = PRLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(PRPosterMetadata *)(uint64_t)self encodeJSON];
    }
  }
  return v8;
}

+ (id)decodeObjectWithJSON:(id)a3
{
  id v12 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v12];
  id v4 = v12;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    id v6 = [v3 objectForKeyedSubscript:@"activityUUID"];
    id v7 = [v5 initWithUUIDString:v6];

    unint64_t v8 = [PRPosterFocusConfiguration alloc];
    id v9 = [v3 objectForKeyedSubscript:@"activityIdentifier"];
    char v10 = [(PRPosterFocusConfiguration *)v8 initWithActivityIdentifier:v9 activityUUID:v7];
  }
  else
  {
    id v7 = PRLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[PRPosterMetadata decodeObjectWithJSON:]((uint64_t)v4, v7);
    }
    char v10 = 0;
  }

  return v10;
}

- (NSString)attributeType
{
  return (NSString *)@"PRPosterRoleAttributeTypeFocusConfiguration";
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (NSUUID)activityUUID
{
  return self->_activityUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityUUID, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
}

- (void)initWithActivityIdentifier:activityUUID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithActivityIdentifier:activityUUID:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end