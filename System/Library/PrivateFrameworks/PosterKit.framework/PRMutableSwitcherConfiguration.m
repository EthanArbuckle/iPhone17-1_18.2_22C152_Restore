@interface PRMutableSwitcherConfiguration
- (PRPosterConfiguration)desiredActiveConfiguration;
- (id)focusConfigurationForPoster:(id)a3;
- (id)homeConfigurationForPoster:(id)a3;
- (id)incomingPosterConfigurations;
- (id)incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)posterConfigurationsNeedingFocusConfigurationDeleted;
- (id)posterConfigurationsNeedingFocusConfigurationUpdates;
- (id)posterConfigurationsNeedingHomeScreenConfigurationUpdates;
- (void)ingestNewPosterConfiguration:(id)a3;
- (void)ingestNewPosterConfiguration:(id)a3 toBeAssociatedWithHomeScreenConfiguration:(id)a4;
- (void)ingestNewPosterConfiguration:(id)a3 toBeAssociatedWithUUID:(id)a4;
- (void)removeConfiguration:(id)a3;
- (void)setDesiredActiveConfiguration:(id)a3;
- (void)setFocusConfiguration:(id)a3 forPosterConfiguration:(id)a4;
- (void)setHomeConfiguration:(id)a3 forPosterConfiguration:(id)a4;
@end

@implementation PRMutableSwitcherConfiguration

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[PRMutableSwitcherConfiguration allocWithZone:a3];
  v5 = [(PRSwitcherConfiguration *)self configurations];
  v6 = (void *)[v5 copy];
  v7 = [(PRSwitcherConfiguration *)self selectedConfiguration];
  v8 = [(PRSwitcherConfiguration *)self activeConfiguration];
  v9 = [(PRSwitcherConfiguration *)self associatedHomeScreenConfigurationsForServerIdentity];
  v10 = (void *)[v9 copy];
  uint64_t v11 = [(PRSwitcherConfiguration *)v4 _initWithConfigurations:v6 selectedConfiguration:v7 activeConfiguration:v8 associatedHomeScreenConfigurations:v10];

  uint64_t v12 = [(NSMapTable *)self->_overriddenFocusConfigurationForPosterConfiguration copy];
  v13 = *(void **)(v11 + 56);
  *(void *)(v11 + 56) = v12;

  uint64_t v14 = [(NSMapTable *)self->_overriddenHomescreenConfigurationForPosterConfiguration copy];
  v15 = *(void **)(v11 + 64);
  *(void *)(v11 + 64) = v14;

  uint64_t v16 = [(NSMutableOrderedSet *)self->_pathsToIngest mutableCopy];
  v17 = *(void **)(v11 + 80);
  *(void *)(v11 + 80) = v16;

  objc_storeStrong((id *)(v11 + 88), self->_desiredActiveConfiguration);
  uint64_t v18 = [(NSMapTable *)self->_incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs copy];
  v19 = *(void **)(v11 + 72);
  *(void *)(v11 + 72) = v18;

  return (id)v11;
}

- (PRPosterConfiguration)desiredActiveConfiguration
{
  desiredActiveConfiguration = self->_desiredActiveConfiguration;
  if (desiredActiveConfiguration)
  {
    v3 = desiredActiveConfiguration;
  }
  else
  {
    v3 = [(PRSwitcherConfiguration *)self activeConfiguration];
  }
  return v3;
}

- (id)focusConfigurationForPoster:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_overriddenFocusConfigurationForPosterConfiguration objectForKey:v4];
  if (!v5
    || ([MEMORY[0x1E4F1CA98] null],
        v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqual:v6],
        v6,
        v7))
  {
    v10.receiver = self;
    v10.super_class = (Class)PRMutableSwitcherConfiguration;
    uint64_t v8 = [(PRSwitcherConfiguration *)&v10 focusConfigurationForPoster:v4];

    v5 = (void *)v8;
  }

  return v5;
}

- (void)setFocusConfiguration:(id)a3 forPosterConfiguration:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  overriddenFocusConfigurationForPosterConfiguration = self->_overriddenFocusConfigurationForPosterConfiguration;
  if (!overriddenFocusConfigurationForPosterConfiguration)
  {
    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v9 = self->_overriddenFocusConfigurationForPosterConfiguration;
    self->_overriddenFocusConfigurationForPosterConfiguration = v8;

    overriddenFocusConfigurationForPosterConfiguration = self->_overriddenFocusConfigurationForPosterConfiguration;
  }
  if (v11)
  {
    [(NSMapTable *)overriddenFocusConfigurationForPosterConfiguration setObject:v11 forKey:v6];
  }
  else
  {
    objc_super v10 = [MEMORY[0x1E4F1CA98] null];
    [(NSMapTable *)overriddenFocusConfigurationForPosterConfiguration setObject:v10 forKey:v6];
  }
}

- (id)homeConfigurationForPoster:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_overriddenHomescreenConfigurationForPosterConfiguration objectForKey:v4];
  if (!v5
    || ([MEMORY[0x1E4F1CA98] null],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqual:v6],
        v6,
        v7))
  {
    v10.receiver = self;
    v10.super_class = (Class)PRMutableSwitcherConfiguration;
    uint64_t v8 = [(PRSwitcherConfiguration *)&v10 homeConfigurationForPoster:v4];

    v5 = (void *)v8;
  }

  return v5;
}

- (void)setHomeConfiguration:(id)a3 forPosterConfiguration:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (!v11)
  {
    objc_super v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"homeConfiguration"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration setHomeConfiguration:forPosterConfiguration:]();
    }
LABEL_13:
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C272044);
  }
  if (!v6)
  {
    objc_super v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"posterConfiguration"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration setHomeConfiguration:forPosterConfiguration:]();
    }
    goto LABEL_13;
  }
  overriddenHomescreenConfigurationForPosterConfiguration = self->_overriddenHomescreenConfigurationForPosterConfiguration;
  if (!overriddenHomescreenConfigurationForPosterConfiguration)
  {
    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v9 = self->_overriddenHomescreenConfigurationForPosterConfiguration;
    self->_overriddenHomescreenConfigurationForPosterConfiguration = v8;

    overriddenHomescreenConfigurationForPosterConfiguration = self->_overriddenHomescreenConfigurationForPosterConfiguration;
  }
  [(NSMapTable *)overriddenHomescreenConfigurationForPosterConfiguration setObject:v11 forKey:v6];
}

- (void)removeConfiguration:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 _path];
  v5 = [v4 serverIdentity];
  id v6 = [v5 posterUUID];

  int v7 = [(PRSwitcherConfiguration *)self configurations];
  v33 = (void *)[v7 mutableCopy];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v32 = self;
  uint64_t v8 = [(PRSwitcherConfiguration *)self configurations];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v14 = [v13 _path];
        v15 = [v14 serverIdentity];
        uint64_t v16 = [v15 posterUUID];
        int v17 = [v16 isEqual:v6];

        if (v17)
        {
          [v33 removeObject:v13];
          uint64_t v18 = (void *)[v33 copy];
          [(PRSwitcherConfiguration *)v32 setConfigurations:v18];

          v19 = [(PRSwitcherConfiguration *)v32 collection];
          v20 = [(PRSwitcherConfiguration *)v32 selectedConfiguration];
          v21 = [v20 _path];
          v22 = [v21 serverIdentity];
          v23 = [v22 posterUUID];
          int v24 = [v23 isEqual:v6];

          v31 = v19;
          if (v24)
          {
            v25 = [v19 fallbackSelectedForSortedConfigurations:v33 reverse:0];
            [(PRSwitcherConfiguration *)v32 setSelectedConfiguration:v25];
          }
          else
          {
            v25 = 0;
          }
          v26 = [(PRSwitcherConfiguration *)v32 activeConfiguration];
          v27 = [v26 _path];
          v28 = [v27 serverIdentity];
          v29 = [v28 posterUUID];
          int v30 = [v29 isEqual:v6];

          if (v30) {
            [(PRSwitcherConfiguration *)v32 setActiveConfiguration:v25];
          }

          goto LABEL_16;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_16:
}

- (void)ingestNewPosterConfiguration:(id)a3
{
  id v14 = a3;
  if (![v14 incomingPosterType])
  {
    uint64_t v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[path incomingPosterType] != PRIncomingPosterTypeUnknown"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:]();
    }
LABEL_17:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C2724D8);
  }
  id v4 = [v14 role];
  char v5 = [v4 isEqual:@"PRPosterRoleLockScreen"];

  if ((v5 & 1) == 0)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[path role] isEqual:PRPosterRoleLockScreen]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C27253CLL);
  }
  id v6 = [v14 path];
  int v7 = [v6 role];
  char v8 = [v7 isEqual:@"PRPosterRoleLockScreen"];

  if ((v8 & 1) == 0)
  {
    uint64_t v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[[path path] role] isEqual:PRPosterRoleLockScreen]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:]();
    }
    goto LABEL_17;
  }
  pathsToIngest = self->_pathsToIngest;
  if (!pathsToIngest)
  {
    uint64_t v10 = (NSMutableOrderedSet *)objc_opt_new();
    uint64_t v11 = self->_pathsToIngest;
    self->_pathsToIngest = v10;

    pathsToIngest = self->_pathsToIngest;
  }
  [(NSMutableOrderedSet *)pathsToIngest addObject:v14];
}

- (id)incomingPosterConfigurations
{
  v2 = [(NSMutableOrderedSet *)self->_pathsToIngest array];
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)posterConfigurationsNeedingHomeScreenConfigurationUpdates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMapTable *)self->_overriddenHomescreenConfigurationForPosterConfiguration keyEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [(NSMapTable *)self->_overriddenHomescreenConfigurationForPosterConfiguration objectForKey:v9];
        if (v10) {
          [v3 setObject:v10 forKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)posterConfigurationsNeedingFocusConfigurationUpdates
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(NSMapTable *)self->_overriddenFocusConfigurationForPosterConfiguration keyEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v9 = [(NSMapTable *)self->_overriddenFocusConfigurationForPosterConfiguration objectForKey:v8];
        uint64_t v10 = objc_opt_class();
        id v11 = v9;
        if (v10)
        {
          if (objc_opt_isKindOfClass()) {
            long long v12 = v11;
          }
          else {
            long long v12 = 0;
          }
        }
        else
        {
          long long v12 = 0;
        }
        id v13 = v12;

        if (v13) {
          [v15 setObject:v13 forKey:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return v15;
}

- (id)posterConfigurationsNeedingFocusConfigurationDeleted
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v13 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(NSMapTable *)self->_overriddenFocusConfigurationForPosterConfiguration keyEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = [(NSMapTable *)self->_overriddenFocusConfigurationForPosterConfiguration objectForKey:v8];
        uint64_t v10 = [MEMORY[0x1E4F1CA98] null];

        if (v9 == v10) {
          [v13 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  id v11 = (void *)[v13 copy];
  return v11;
}

- (void)ingestNewPosterConfiguration:(id)a3 toBeAssociatedWithHomeScreenConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = v6;
  NSClassFromString(&cfstr_Princomingpost_0.isa);
  if (!v16)
  {
    id v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithHomeScreenConfiguration:]();
    }
LABEL_19:
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C272BF8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRIncomingPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithHomeScreenConfiguration:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C272C5CLL);
  }

  id v8 = v7;
  NSClassFromString(&cfstr_Prposterconfig.isa);
  if (!v8)
  {
    long long v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithHomeScreenConfiguration:]();
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C272CC0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithHomeScreenConfiguration:]();
    }
    goto LABEL_19;
  }

  uint64_t v9 = [(PRMutableSwitcherConfiguration *)self incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs];
  uint64_t v10 = [v8 _path];
  id v11 = [v10 serverIdentity];
  long long v12 = [v11 posterUUID];
  [v9 setObject:v16 forKey:v12];
}

- (void)ingestNewPosterConfiguration:(id)a3 toBeAssociatedWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 incomingPosterType] != 4 && objc_msgSend(v6, "incomingPosterType") != 5)
  {
    uint64_t v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[incomingPosterConfiguration incomingPosterType] == PRIncomingPosterTypeAssociatedNew || [incomingPosterConfiguration incomingPosterType] == PRIncomingPosterTypeAssociatedUpdate"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithUUID:].cold.5();
    }
LABEL_24:
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C272E84);
  }
  id v14 = v6;
  NSClassFromString(&cfstr_Princomingpost_0.isa);
  if (!v14)
  {
    uint64_t v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithUUID:]();
    }
    goto LABEL_24;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRIncomingPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithUUID:]();
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C272EE8);
  }

  id v8 = v7;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v8)
  {
    long long v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithUUID:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C272F4CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRMutableSwitcherConfiguration ingestNewPosterConfiguration:toBeAssociatedWithUUID:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C272FB0);
  }

  uint64_t v9 = [(PRMutableSwitcherConfiguration *)self incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs];
  [v9 setObject:v14 forKey:v8];
}

- (id)incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs
{
  incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs = self->_incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs;
  if (!incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v5 = self->_incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs;
    self->_incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs = v4;

    incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs = self->_incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs;
  }
  id v6 = incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs;
  return v6;
}

- (void)setDesiredActiveConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredActiveConfiguration, 0);
  objc_storeStrong((id *)&self->_pathsToIngest, 0);
  objc_storeStrong((id *)&self->_incomingPosterConfigurationsToBeAssocatedWithExistingPosterConfigurationsUUIDs, 0);
  objc_storeStrong((id *)&self->_overriddenHomescreenConfigurationForPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_overriddenFocusConfigurationForPosterConfiguration, 0);
}

- (void)setHomeConfiguration:forPosterConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setHomeConfiguration:forPosterConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)ingestNewPosterConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)ingestNewPosterConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)ingestNewPosterConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)ingestNewPosterConfiguration:toBeAssociatedWithHomeScreenConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)ingestNewPosterConfiguration:toBeAssociatedWithHomeScreenConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)ingestNewPosterConfiguration:toBeAssociatedWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)ingestNewPosterConfiguration:toBeAssociatedWithUUID:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)ingestNewPosterConfiguration:toBeAssociatedWithUUID:.cold.5()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end