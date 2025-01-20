@interface PRImmutableEditingLook
- (PRImmutableEditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 initialTimeFontConfiguration:(id)a5 initialTitleColor:(id)a6;
- (id)displayName;
- (id)identifier;
- (id)initialProperties;
@end

@implementation PRImmutableEditingLook

- (PRImmutableEditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 initialTimeFontConfiguration:(id)a5 initialTitleColor:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)PRImmutableEditingLook;
  v15 = [(PREditingLook *)&v29 initWithIdentifier:v11 displayName:v12 initialTimeFontConfiguration:v13 initialTitleColor:v14];
  if (!v15)
  {
LABEL_12:

    return v15;
  }
  uint64_t v16 = [v12 copy];
  displayName = v15->_displayName;
  v15->_displayName = (NSString *)v16;

  uint64_t v18 = [v11 copy];
  identifier = v15->_identifier;
  v15->_identifier = (NSString *)v18;

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v21 = objc_opt_isKindOfClass();
  if (isKindOfClass & 1) != 0 || !v14 || (v21)
  {
    if (v14)
    {
      if (v21) {
        v22 = (PRPosterColor *)v14;
      }
      else {
        v22 = [[PRPosterColor alloc] initWithColor:v14 preferredStyle:2];
      }
      v23 = v22;
    }
    else
    {
      v23 = 0;
    }
    v24 = [[PREditingLookProperties alloc] initWithTimeFontConfiguration:v13 titlePosterColor:v23];
    uint64_t v25 = [(PREditingLookProperties *)v24 copy];
    initialProperties = v15->_initialProperties;
    v15->_initialProperties = (PREditingLookProperties *)v25;

    goto LABEL_12;
  }
  v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"isValidColor"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[PRImmutableEditingLook initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:](a2);
  }
  [v28 UTF8String];
  result = (PRImmutableEditingLook *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)identifier
{
  return self->_identifier;
}

- (id)displayName
{
  return self->_displayName;
}

- (id)initialProperties
{
  return self->_initialProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialProperties, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(const char *)a1 displayName:initialTimeFontConfiguration:initialTitleColor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end