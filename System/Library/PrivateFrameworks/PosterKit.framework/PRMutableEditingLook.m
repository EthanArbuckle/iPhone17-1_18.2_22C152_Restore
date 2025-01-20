@interface PRMutableEditingLook
- (NSString)displayName;
- (NSString)identifier;
- (PREditingLookProperties)initialProperties;
- (PRMutableEditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 initialTimeFontConfiguration:(id)a5 initialTitleColor:(id)a6;
- (PRTimeFontConfiguration)initialTimeFontConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initialTitleColor;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInitialProperties:(id)a3;
- (void)setInitialTimeFontConfiguration:(id)a3;
- (void)setInitialTitleColor:(id)a3;
@end

@implementation PRMutableEditingLook

- (PRMutableEditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 initialTimeFontConfiguration:(id)a5 initialTitleColor:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)PRMutableEditingLook;
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
    -[PRMutableEditingLook initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:](a2);
  }
  [v28 UTF8String];
  result = (PRMutableEditingLook *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (PRTimeFontConfiguration)initialTimeFontConfiguration
{
  v2 = [(PRMutableEditingLook *)self initialProperties];
  v3 = [v2 timeFontConfiguration];

  return (PRTimeFontConfiguration *)v3;
}

- (id)initialTitleColor
{
  v2 = [(PRMutableEditingLook *)self initialProperties];
  v3 = [v2 titlePosterColor];

  return v3;
}

- (void)setInitialTimeFontConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [PREditingLookProperties alloc];
  v6 = [(PRMutableEditingLook *)self initialProperties];
  v7 = [v6 titlePosterColor];
  v8 = [(PREditingLookProperties *)v5 initWithTimeFontConfiguration:v4 titlePosterColor:v7];

  [(PRMutableEditingLook *)self setInitialProperties:v8];
}

- (void)setInitialTitleColor:(id)a3
{
  id v14 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();
  if (isKindOfClass & 1) != 0 || !v14 || (v6)
  {
    if (v14)
    {
      if (v6) {
        v7 = (PRPosterColor *)v14;
      }
      else {
        v7 = [[PRPosterColor alloc] initWithColor:v14 preferredStyle:2];
      }
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
    v9 = [PREditingLookProperties alloc];
    v10 = [(PRMutableEditingLook *)self initialProperties];
    id v11 = [v10 timeFontConfiguration];
    id v12 = [(PREditingLookProperties *)v9 initWithTimeFontConfiguration:v11 titlePosterColor:v8];

    [(PRMutableEditingLook *)self setInitialProperties:v12];
  }
  else
  {
    id v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"isValidColor"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableEditingLook setInitialTitleColor:](a2);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRImmutableEditingLook alloc];
  return [(PREditingLook *)v4 initWithLook:self];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (PREditingLookProperties)initialProperties
{
  return self->_initialProperties;
}

- (void)setInitialProperties:(id)a3
{
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

- (void)setInitialTitleColor:(const char *)a1 .cold.1(const char *a1)
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