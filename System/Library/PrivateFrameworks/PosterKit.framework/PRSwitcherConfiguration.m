@interface PRSwitcherConfiguration
- (BOOL)activeConfigurationDueToIncomingFocusModeChange;
- (NSArray)configurations;
- (NSMapTable)associatedHomeScreenConfigurationsForServerIdentity;
- (NSSet)heldAssociatedConfigurations;
- (PRPosterCollection)collection;
- (PRPosterConfiguration)activeConfiguration;
- (PRPosterConfiguration)selectedConfiguration;
- (id)_childPosterConfigurationForConfiguration:(id)a3;
- (id)_childPosterConfigurationForConfigurationUUID:(id)a3;
- (id)_initWithCollection:(id)a3 activeConfiguration:(id)a4;
- (id)_initWithConfigurations:(id)a3 selectedConfiguration:(id)a4 activeConfiguration:(id)a5 associatedHomeScreenConfigurations:(id)a6;
- (id)_posterConfigurationForUUID:(id)a3;
- (id)configuredPropertiesForPoster:(id)a3;
- (id)focusConfigurationForPoster:(id)a3;
- (id)homeConfigurationForPoster:(id)a3;
- (id)homeScreenPosterConfigurationForPosterConfiguration:(id)a3;
- (id)lastModifiedDateForPoster:(id)a3;
- (id)metadataForPoster:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)primaryPosterIdentityForHomeScreenPosterConfiguration:(id)a3;
- (id)suggestionMetadataForPoster:(id)a3;
- (void)setActiveConfiguration:(id)a3;
- (void)setActiveConfigurationDueToIncomingFocusModeChange:(BOOL)a3;
- (void)setCollection:(id)a3;
- (void)setConfigurations:(id)a3;
- (void)setSelectedConfiguration:(id)a3;
@end

@implementation PRSwitcherConfiguration

- (id)_initWithConfigurations:(id)a3 selectedConfiguration:(id)a4 activeConfiguration:(id)a5 associatedHomeScreenConfigurations:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v10;
  NSClassFromString(&cfstr_Nsarray.isa);
  if (!v14)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:]();
    }
LABEL_29:
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C270CA8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C270D04);
  }

  id v15 = v11;
  if (v15)
  {
    NSClassFromString(&cfstr_Prposterconfig.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:].cold.5();
      }
      [v29 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18C270E18);
    }
  }

  id v16 = v12;
  if (v16)
  {
    NSClassFromString(&cfstr_Prposterconfig.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:].cold.4();
      }
      goto LABEL_29;
    }
  }

  id v17 = v13;
  NSClassFromString(&cfstr_Nsmaptable.isa);
  if (!v17)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C270D60);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSMapTableClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C270DBCLL);
  }

  v30.receiver = self;
  v30.super_class = (Class)PRSwitcherConfiguration;
  v18 = [(PRSwitcherConfiguration *)&v30 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_activeConfiguration, a5);
    objc_storeStrong((id *)&v19->_selectedConfiguration, a4);
    uint64_t v20 = [v14 copy];
    configurations = v19->_configurations;
    v19->_configurations = (NSArray *)v20;

    uint64_t v22 = [v17 copy];
    associatedHomeScreenConfigurationsForServerIdentity = v19->_associatedHomeScreenConfigurationsForServerIdentity;
    v19->_associatedHomeScreenConfigurationsForServerIdentity = (NSMapTable *)v22;
  }
  return v19;
}

- (id)_initWithCollection:(id)a3 activeConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 selectedPoster];

  v9 = 0;
  if (v7 && v8)
  {
    id v10 = [v6 orderedPosters];
    id v11 = [v10 array];
    id v12 = [v6 selectedPoster];
    id v13 = [v6 associatedHomeScreenConfigurationsMap];
    id v14 = [(PRSwitcherConfiguration *)self _initWithConfigurations:v11 selectedConfiguration:v12 activeConfiguration:v7 associatedHomeScreenConfigurations:v13];

    if (v14) {
      [v14 setCollection:v6];
    }
    self = (PRSwitcherConfiguration *)v14;
    v9 = self;
  }

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[PRMutableSwitcherConfiguration allocWithZone:a3];
  v5 = (void *)[(NSArray *)self->_configurations copy];
  selectedConfiguration = self->_selectedConfiguration;
  activeConfiguration = self->_activeConfiguration;
  v8 = (void *)[(NSMapTable *)self->_associatedHomeScreenConfigurationsForServerIdentity copy];
  id v9 = [(PRSwitcherConfiguration *)v4 _initWithConfigurations:v5 selectedConfiguration:selectedConfiguration activeConfiguration:activeConfiguration associatedHomeScreenConfigurations:v8];

  [v9 setCollection:self->_collection];
  return v9;
}

- (PRPosterCollection)collection
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  collection = self->_collection;
  if (collection)
  {
    v3 = collection;
  }
  else
  {
    v28 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v5 = [(PRSwitcherConfiguration *)self configurations];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v11 = [(PRSwitcherConfiguration *)self associatedHomeScreenConfigurationsForServerIdentity];
          id v12 = [v10 _path];
          id v13 = [v12 serverIdentity];
          id v14 = [v11 objectForKey:v13];

          if (v14)
          {
            id v15 = [v10 _path];
            int v16 = [v15 isServerPosterPath];

            if (v16)
            {
              id v17 = [v10 _path];
              v18 = [v17 serverIdentity];
              v19 = [v18 posterUUID];
              [v28 setObject:v14 forKey:v19];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v7);
    }

    uint64_t v20 = [PRPosterCollection alloc];
    v21 = [(PRSwitcherConfiguration *)self selectedConfiguration];
    uint64_t v22 = (void *)MEMORY[0x1E4F1CAA0];
    v23 = [(PRSwitcherConfiguration *)self configurations];
    v24 = [v22 orderedSetWithArray:v23];
    v25 = [(PRPosterCollection *)v20 initWithSelectedPoster:v21 posters:v24 associatedPosterMap:v28 attributeProvider:0];
    v26 = self->_collection;
    self->_collection = v25;

    v3 = self->_collection;
  }
  return v3;
}

- (id)focusConfigurationForPoster:(id)a3
{
  id v4 = a3;
  v5 = [(PRSwitcherConfiguration *)self collection];
  uint64_t v6 = [v5 attributeForPoster:v4 ofType:@"PRPosterRoleAttributeTypeFocusConfiguration"];

  return v6;
}

- (id)homeConfigurationForPoster:(id)a3
{
  id v4 = a3;
  v5 = [(PRSwitcherConfiguration *)self collection];
  uint64_t v6 = [v5 attributeForPoster:v4 ofType:@"PRPosterRoleAttributeTypeHomeScreenConfiguration"];

  return v6;
}

- (id)homeScreenPosterConfigurationForPosterConfiguration:(id)a3
{
  associatedHomeScreenConfigurationsForServerIdentity = self->_associatedHomeScreenConfigurationsForServerIdentity;
  id v4 = [a3 _path];
  v5 = [v4 serverIdentity];
  uint64_t v6 = [(NSMapTable *)associatedHomeScreenConfigurationsForServerIdentity objectForKey:v5];

  return v6;
}

- (id)metadataForPoster:(id)a3
{
  id v4 = a3;
  v5 = [(PRSwitcherConfiguration *)self collection];
  uint64_t v6 = [v5 attributeForPoster:v4 ofType:@"PRPosterRoleAttributeTypeMetadata"];

  return v6;
}

- (id)suggestionMetadataForPoster:(id)a3
{
  id v4 = a3;
  v5 = [(PRSwitcherConfiguration *)self collection];
  uint64_t v6 = [v5 attributeForPoster:v4 ofType:@"PRPosterRoleAttributeTypeSuggestionMetadata"];

  return v6;
}

- (id)lastModifiedDateForPoster:(id)a3
{
  id v4 = a3;
  v5 = [(PRSwitcherConfiguration *)self collection];
  uint64_t v6 = [v5 attributeForPoster:v4 ofType:@"PRPosterRoleAttributeTypeUsageMetadata"];

  uint64_t v7 = [v6 lastModifiedDate];

  return v7;
}

- (id)configuredPropertiesForPoster:(id)a3
{
  return (id)[a3 loadConfiguredPropertiesWithError:0];
}

- (id)primaryPosterIdentityForHomeScreenPosterConfiguration:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_associatedHomeScreenConfigurationsForServerIdentity;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = -[NSMapTable objectForKey:](self->_associatedHomeScreenConfigurationsForServerIdentity, "objectForKey:", v10, (void)v14);
        if ([v11 isEqual:v4])
        {
          id v12 = v10;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (NSSet)heldAssociatedConfigurations
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSMapTable *)self->_associatedHomeScreenConfigurationsForServerIdentity objectEnumerator];
  uint64_t v4 = [v3 allObjects];
  v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v7 = [v2 setWithArray:v6];

  return (NSSet *)v7;
}

- (NSMapTable)associatedHomeScreenConfigurationsForServerIdentity
{
  v2 = (void *)[(NSMapTable *)self->_associatedHomeScreenConfigurationsForServerIdentity copy];
  return (NSMapTable *)v2;
}

- (id)_childPosterConfigurationForConfiguration:(id)a3
{
  associatedHomeScreenConfigurationsForServerIdentity = self->_associatedHomeScreenConfigurationsForServerIdentity;
  uint64_t v4 = [a3 _path];
  v5 = [v4 serverIdentity];
  uint64_t v6 = [(NSMapTable *)associatedHomeScreenConfigurationsForServerIdentity objectForKey:v5];

  return v6;
}

- (id)_childPosterConfigurationForConfigurationUUID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(NSMapTable *)self->_associatedHomeScreenConfigurationsForServerIdentity keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 posterUUID];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v13 = [(NSMapTable *)self->_associatedHomeScreenConfigurationsForServerIdentity objectForKey:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)_posterConfigurationForUUID:(id)a3
{
  id v4 = a3;
  configurations = self->_configurations;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PRSwitcherConfiguration__posterConfigurationForUUID___block_invoke;
  v9[3] = &unk_1E54DC780;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSArray *)configurations bs_firstObjectPassingTest:v9];

  return v7;
}

uint64_t __55__PRSwitcherConfiguration__posterConfigurationForUUID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 _path];
  id v4 = [v3 serverIdentity];
  v5 = [v4 posterUUID];
  uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];

  return v6;
}

- (void)setCollection:(id)a3
{
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
}

- (BOOL)activeConfigurationDueToIncomingFocusModeChange
{
  return self->_activeConfigurationDueToIncomingFocusModeChange;
}

- (void)setActiveConfigurationDueToIncomingFocusModeChange:(BOOL)a3
{
  self->_activeConfigurationDueToIncomingFocusModeChange = a3;
}

- (PRPosterConfiguration)selectedConfiguration
{
  return self->_selectedConfiguration;
}

- (void)setSelectedConfiguration:(id)a3
{
}

- (PRPosterConfiguration)activeConfiguration
{
  return self->_activeConfiguration;
}

- (void)setActiveConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConfiguration, 0);
  objc_storeStrong((id *)&self->_selectedConfiguration, 0);
  objc_storeStrong((id *)&self->_associatedHomeScreenConfigurationsForServerIdentity, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

- (void)_initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:.cold.1()
{
  v0 = [NSString stringWithUTF8String:"-[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:]"];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_18C1C4000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

- (void)_initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:.cold.2()
{
  v0 = [NSString stringWithUTF8String:"-[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:]"];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_18C1C4000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

- (void)_initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:.cold.4()
{
  v0 = [NSString stringWithUTF8String:"-[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:]"];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_18C1C4000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

- (void)_initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:.cold.5()
{
  v0 = [NSString stringWithUTF8String:"-[PRSwitcherConfiguration _initWithConfigurations:selectedConfiguration:activeConfiguration:associatedHomeScreenConfigurations:]"];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_18C1C4000, MEMORY[0x1E4F14500], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);
}

@end