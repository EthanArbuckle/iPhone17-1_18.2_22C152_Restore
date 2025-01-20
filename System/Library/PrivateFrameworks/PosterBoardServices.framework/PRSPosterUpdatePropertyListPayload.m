@interface PRSPosterUpdatePropertyListPayload
+ (BOOL)supportsSecureCoding;
- (NSData)propertyListData;
- (PRSPosterUpdatePropertyListPayload)initWithCoder:(id)a3;
- (PRSPosterUpdatePropertyListPayload)initWithPropertyList:(id)a3;
- (PRSPosterUpdatePropertyListPayload)initWithPropertyListData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)propertyListRoot;
- (id)rawValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterUpdatePropertyListPayload

- (PRSPosterUpdatePropertyListPayload)initWithPropertyListData:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Nsdata.isa);
  if (!v4)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdatePropertyListPayload initWithPropertyListData:]();
    }
LABEL_11:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D5B00);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDataClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdatePropertyListPayload initWithPropertyListData:]();
    }
    goto LABEL_11;
  }

  v10.receiver = self;
  v10.super_class = (Class)PRSPosterUpdatePropertyListPayload;
  v5 = [(PRSPosterUpdatePayload *)&v10 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    propertyListData = v5->_propertyListData;
    v5->_propertyListData = (NSData *)v6;
  }
  return v5;
}

- (PRSPosterUpdatePropertyListPayload)initWithPropertyList:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"propertyListRoot"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdatePropertyListPayload initWithPropertyList:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
LABEL_16:
    JUMPOUT(0x1A78D5CB4);
  }
  uint64_t v6 = v5;
  if (([MEMORY[0x1E4F28F98] propertyList:v5 isValidForFormat:200] & 1) == 0)
  {
    v12 = [NSString stringWithFormat:@"propertyListRoot needs to be serializable"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdatePropertyListPayload initWithPropertyList:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D5D0CLL);
  }
  id v15 = 0;
  v7 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:&v15];
  if (v15)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"nil == serializationError"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSPosterUpdatePropertyListPayload initWithPropertyList:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_16;
  }
  v14.receiver = self;
  v14.super_class = (Class)PRSPosterUpdatePropertyListPayload;
  v8 = [(PRSPosterUpdatePayload *)&v14 _init];
  v9 = (PRSPosterUpdatePropertyListPayload *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 1, v7);
    objc_storeStrong(&v9->_propertyListRoot, a3);
  }

  return v9;
}

- (id)propertyListRoot
{
  id propertyListRoot = self->_propertyListRoot;
  if (!propertyListRoot)
  {
    id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:self->_propertyListData options:0 format:0 error:0];
    id v5 = self->_propertyListRoot;
    self->_id propertyListRoot = v4;

    id propertyListRoot = self->_propertyListRoot;
  }
  id v6 = propertyListRoot;
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  propertyListData = self->_propertyListData;
  return (id)[v4 initWithPropertyListData:propertyListData];
}

- (PRSPosterUpdatePropertyListPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PRSPosterUpdatePayload *)self _init];
  if (v5)
  {
    id v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"_propertyListData"];
    propertyListData = v5->_propertyListData;
    v5->_propertyListData = (NSData *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rawValue
{
  v2 = (void *)[(NSData *)self->_propertyListData copy];
  return v2;
}

- (NSData)propertyListData
{
  return self->_propertyListData;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_propertyListRoot, 0);
  objc_storeStrong((id *)&self->_propertyListData, 0);
}

- (void)initWithPropertyListData:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithPropertyList:.cold.1()
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

- (void)initWithPropertyList:.cold.2()
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

- (void)initWithPropertyList:.cold.3()
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