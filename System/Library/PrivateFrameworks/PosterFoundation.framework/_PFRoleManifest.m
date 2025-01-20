@interface _PFRoleManifest
- (NSSet)knownSupportedRoles;
- (NSSet)pf_supportedRoles;
- (NSSet)rawSupportedRoles;
- (NSString)derivedDefaultRole;
- (NSString)pf_defaultRole;
- (NSString)rawSpecifiedDefaultRole;
- (_PFRoleManifest)initWithInfoDictionary:(id)a3;
- (_PFRoleManifest)initWithPropertyList:(id)a3;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (void)_hydrate;
@end

@implementation _PFRoleManifest

- (_PFRoleManifest)initWithPropertyList:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Lspropertylist.isa);
  if (!v4)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_PFRoleManifest initWithPropertyList:]();
    }
LABEL_14:
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A088A70);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:LSPropertyListClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_PFRoleManifest initWithPropertyList:]();
    }
    goto LABEL_14;
  }

  v14.receiver = self;
  v14.super_class = (Class)_PFRoleManifest;
  v5 = [(_PFRoleManifest *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_propertyList, v4);
    uint64_t v7 = *MEMORY[0x263EFFB58];
    v8 = self;
    uint64_t v9 = [(_PFRoleManifest *)v6 objectForKey:v7 ofClass:v8];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v9;

    if (!v6->_bundleIdentifier)
    {
      v11 = 0;
      goto LABEL_8;
    }
    [(_PFRoleManifest *)v6 _hydrate];
    objc_storeWeak((id *)&v6->_propertyList, 0);
  }
  v11 = v6;
LABEL_8:

  return v11;
}

- (_PFRoleManifest)initWithInfoDictionary:(id)a3
{
  id v5 = a3;
  NSClassFromString(&cfstr_Nsdictionary.isa);
  if (!v5)
  {
    objc_super v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_PFRoleManifest initWithInfoDictionary:]();
    }
LABEL_11:
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A088C30);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[_PFRoleManifest initWithInfoDictionary:]();
    }
    goto LABEL_11;
  }

  v15.receiver = self;
  v15.super_class = (Class)_PFRoleManifest;
  v6 = [(_PFRoleManifest *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_infoDictionary, a3);
    uint64_t v8 = *MEMORY[0x263EFFB58];
    uint64_t v9 = self;
    uint64_t v10 = [(_PFRoleManifest *)v7 objectForKey:v8 ofClass:v9];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v10;

    [(_PFRoleManifest *)v7 _hydrate];
    infoDictionary = v7->_infoDictionary;
    v7->_infoDictionary = 0;
  }
  return v7;
}

- (NSSet)pf_supportedRoles
{
  v3 = [(_PFRoleManifest *)self rawSpecifiedDefaultRole];
  id v4 = [(_PFRoleManifest *)self rawSupportedRoles];
  if ([v4 count])
  {
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = [(_PFRoleManifest *)self knownSupportedRoles];
    if ([v5 count])
    {
      id v6 = v5;

      id v4 = v6;
    }

    if (!v3) {
      goto LABEL_8;
    }
  }
  if ([v4 containsObject:v3])
  {
LABEL_8:
    uint64_t v7 = v4;
    goto LABEL_13;
  }
  uint64_t v8 = v4;
  if (!v4)
  {
    uint64_t v8 = [MEMORY[0x263EFFA08] set];
  }
  uint64_t v7 = [v8 setByAddingObject:v3];

  if (!v4) {
LABEL_13:
  }

  return (NSSet *)v7;
}

- (NSString)pf_defaultRole
{
  v3 = [(_PFRoleManifest *)self rawSpecifiedDefaultRole];
  if (!v3)
  {
    id v6 = [(_PFRoleManifest *)self rawSupportedRoles];
    uint64_t v7 = [v6 count];

    if (v7 != 1
      || ([(_PFRoleManifest *)self rawSupportedRoles],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          [v8 anyObject],
          v3 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v3))
    {
      v3 = [(_PFRoleManifest *)self derivedDefaultRole];

      if (v3)
      {
        v3 = [(_PFRoleManifest *)self derivedDefaultRole];
      }
    }
  }
  id v4 = v3;

  return (NSString *)v4;
}

- (void)_hydrate
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (NSSet)rawSupportedRoles
{
  rawSupportedRoles = self->_rawSupportedRoles;
  if (!rawSupportedRoles)
  {
    uint64_t v4 = (void *)MEMORY[0x263EFFA08];
    uint64_t v5 = self;
    uint64_t v6 = [(_PFRoleManifest *)self objectForKey:@"PRSupportedRoles" ofClass:v5];
    uint64_t v7 = objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_134);
    uint64_t v8 = [v4 setWithArray:v7];
    uint8_t v9 = self->_rawSupportedRoles;
    self->_rawSupportedRoles = v8;

    rawSupportedRoles = self->_rawSupportedRoles;
  }
  uint64_t v10 = rawSupportedRoles;
  return v10;
}

- (NSSet)knownSupportedRoles
{
  knownSupportedRoles = self->_knownSupportedRoles;
  if (knownSupportedRoles)
  {
    v3 = knownSupportedRoles;
  }
  else
  {
    uint64_t v5 = *MEMORY[0x263EFFB58];
    uint64_t v6 = self;
    uint64_t v7 = [(_PFRoleManifest *)self objectForKey:v5 ofClass:v6];

    if (([v7 isEqualToString:@"com.apple.PosterBoard"] & 1) != 0
      || ([v7 isEqualToString:@"com.apple.PosterTester"] & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      uint64_t v8 = objc_opt_new();
      uint64_t v13 = MEMORY[0x263EF8330];
      uint64_t v14 = 3221225472;
      objc_super v15 = __38___PFRoleManifest_knownSupportedRoles__block_invoke;
      v16 = &unk_26546EB00;
      id v17 = v7;
      id v18 = v8;
      id v9 = v8;
      PFPosterRoleEnumerateAllRoles(&v13);
      uint64_t v10 = (NSSet *)objc_msgSend(v9, "copy", v13, v14, v15, v16);
      v11 = self->_knownSupportedRoles;
      self->_knownSupportedRoles = v10;

      v3 = self->_knownSupportedRoles;
    }
  }
  return v3;
}

- (NSString)rawSpecifiedDefaultRole
{
  p_rawSpecifiedDefaultRole = &self->_rawSpecifiedDefaultRole;
  rawSpecifiedDefaultRole = self->_rawSpecifiedDefaultRole;
  if (rawSpecifiedDefaultRole)
  {
    uint64_t v4 = rawSpecifiedDefaultRole;
  }
  else
  {
    uint64_t v6 = self;
    uint64_t v7 = [(_PFRoleManifest *)self objectForKey:@"PRDefaultRole" ofClass:v6];

    if (PFPosterRoleIsValid(v7))
    {
      objc_storeStrong((id *)p_rawSpecifiedDefaultRole, v7);
      uint64_t v4 = *p_rawSpecifiedDefaultRole;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

- (NSString)derivedDefaultRole
{
  v3 = [(_PFRoleManifest *)self knownSupportedRoles];
  if ([v3 count] == 1)
  {
    uint64_t v4 = [(_PFRoleManifest *)self knownSupportedRoles];
    uint64_t v5 = [v4 anyObject];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_propertyList);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_propertyList);
    id v9 = [v8 objectForKey:v6 ofClass:a4];
  }
  else
  {
    id v9 = [(NSDictionary *)self->_infoDictionary bs_safeObjectForKey:v6 ofType:a4];
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSpecifiedDefaultRole, 0);
  objc_storeStrong((id *)&self->_knownSupportedRoles, 0);
  objc_storeStrong((id *)&self->_rawSupportedRoles, 0);
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_destroyWeak((id *)&self->_propertyList);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)initWithPropertyList:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithInfoDictionary:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end