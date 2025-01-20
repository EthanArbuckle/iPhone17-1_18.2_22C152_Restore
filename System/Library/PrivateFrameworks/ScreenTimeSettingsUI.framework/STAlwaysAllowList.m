@interface STAlwaysAllowList
- (BOOL)shouldAllowEditing;
- (NSArray)allowedBundleIDs;
- (STAlwaysAllowList)init;
- (STAlwaysAllowList)initWithBlueprint:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowedBundleIDs:(id)a3;
- (void)setShouldAllowEditing:(BOOL)a3;
@end

@implementation STAlwaysAllowList

- (STAlwaysAllowList)init
{
  return [(STAlwaysAllowList *)self initWithBlueprint:0];
}

- (STAlwaysAllowList)initWithBlueprint:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STAlwaysAllowList;
  v5 = [(STAlwaysAllowList *)&v18 init];
  if (v5)
  {
    v6 = [v4 configurations];
    v7 = [v6 anyObject];

    if (v7)
    {
      v8 = (void *)MEMORY[0x263F33370];
      v9 = [v7 payloadPlist];
      id v17 = 0;
      v10 = [v8 declarationForData:v9 error:&v17];
      id v11 = v17;

      if (v10)
      {
        v12 = [v10 payloadApps];
      }
      else
      {
        v13 = +[STUILog persistence];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          -[STAlwaysAllowList initWithBlueprint:]();
        }

        v12 = 0;
      }
      v14 = [v10 unknownPayloadKeys];
      v5->_shouldAllowEditing = [v14 count] == 0;
    }
    else
    {
      v12 = [MEMORY[0x263F67108] defaultAlwaysAllowBundleIDs];
      v5->_shouldAllowEditing = 1;
    }
    if (v12) {
      v15 = v12;
    }
    else {
      v15 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)&v5->_allowedBundleIDs, v15);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id v4 = objc_opt_new();
  uint64_t v5 = [(NSArray *)self->_allowedBundleIDs copy];
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSArray)allowedBundleIDs
{
  return self->_allowedBundleIDs;
}

- (void)setAllowedBundleIDs:(id)a3
{
}

- (BOOL)shouldAllowEditing
{
  return self->_shouldAllowEditing;
}

- (void)setShouldAllowEditing:(BOOL)a3
{
  self->_shouldAllowEditing = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithBlueprint:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "Error creating app declaration from plist: %{public}@", v2, v3, v4, v5, v6);
}

@end