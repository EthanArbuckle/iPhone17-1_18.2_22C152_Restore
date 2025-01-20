@interface PBFPosterRoleCoordinatorGenericTransitionContext
- (BOOL)isInitialUpdate;
- (BOOL)pbf_transitionFromIncomingFocusModeChange;
- (NSDictionary)pbf_extensionStoreCoordinatorForProvider;
- (NSString)description;
- (PBFPosterRoleCoordinatorGenericTransitionContext)initWithActiveFocusMode:(id)a3 activeChargerIdentifier:(id)a4 extensionStoreCoordinators:(id)a5 currentActivePosterForRole:(id)a6;
- (PBFPosterRoleCoordinatorGenericTransitionContext)initWithActiveFocusMode:(id)a3 activeChargerIdentifier:(id)a4 extensionStoreCoordinators:(id)a5 currentActivePosterForRole:(id)a6 affectedRoles:(id)a7;
- (id)pbf_activeChargerIdentifier;
- (id)pbf_activeFocusMode;
- (id)pbf_currentActivePosterForRole:(id)a3;
- (id)pbf_desiredActiveConfigurationForRole:(id)a3;
- (id)pbf_transitionAffectedRoles;
- (id)pbf_transitionContextIdentifier;
- (void)setDesiredActiveConfiguration:(id)a3 forRole:(id)a4;
- (void)setInitialUpdate:(BOOL)a3;
- (void)setTransitionFromIncomingFocusModeChange:(BOOL)a3;
@end

@implementation PBFPosterRoleCoordinatorGenericTransitionContext

- (PBFPosterRoleCoordinatorGenericTransitionContext)initWithActiveFocusMode:(id)a3 activeChargerIdentifier:(id)a4 extensionStoreCoordinators:(id)a5 currentActivePosterForRole:(id)a6
{
  v10 = (void *)MEMORY[0x1E4F28BD0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [v10 set];
  v16 = [(PBFPosterRoleCoordinatorGenericTransitionContext *)self initWithActiveFocusMode:v14 activeChargerIdentifier:v13 extensionStoreCoordinators:v12 currentActivePosterForRole:v11 affectedRoles:v15];

  return v16;
}

- (PBFPosterRoleCoordinatorGenericTransitionContext)initWithActiveFocusMode:(id)a3 activeChargerIdentifier:(id)a4 extensionStoreCoordinators:(id)a5 currentActivePosterForRole:(id)a6 affectedRoles:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)PBFPosterRoleCoordinatorGenericTransitionContext;
  v18 = [(PBFPosterRoleCoordinatorGenericTransitionContext *)&v30 init];
  if (v18)
  {
    uint64_t v19 = [v15 copy];
    extensionStoreCoordinatorForProviderIdentifier = v18->_extensionStoreCoordinatorForProviderIdentifier;
    v18->_extensionStoreCoordinatorForProviderIdentifier = (NSDictionary *)v19;

    uint64_t v21 = [v16 copy];
    currentActivePosterForRole = v18->_currentActivePosterForRole;
    v18->_currentActivePosterForRole = (NSDictionary *)v21;

    objc_storeStrong((id *)&v18->_activeFocusMode, a3);
    uint64_t v23 = [MEMORY[0x1E4F29128] UUID];
    transitionContextIdentifier = v18->_transitionContextIdentifier;
    v18->_transitionContextIdentifier = (NSUUID *)v23;

    uint64_t v25 = [v14 copy];
    activeChargerIdentifier = v18->_activeChargerIdentifier;
    v18->_activeChargerIdentifier = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    affectedRoles = v18->_affectedRoles;
    v18->_affectedRoles = (NSCountedSet *)v27;
  }
  return v18;
}

- (id)pbf_activeChargerIdentifier
{
  return self->_activeChargerIdentifier;
}

- (id)pbf_activeFocusMode
{
  return self->_activeFocusMode;
}

- (void)setDesiredActiveConfiguration:(id)a3 forRole:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  desiredActivePosterConfigurationForRole = v7->_desiredActivePosterConfigurationForRole;
  if (!desiredActivePosterConfigurationForRole)
  {
    uint64_t v9 = objc_opt_new();
    v10 = v7->_desiredActivePosterConfigurationForRole;
    v7->_desiredActivePosterConfigurationForRole = (NSMutableDictionary *)v9;

    desiredActivePosterConfigurationForRole = v7->_desiredActivePosterConfigurationForRole;
  }
  [(NSMutableDictionary *)desiredActivePosterConfigurationForRole setObject:v11 forKeyedSubscript:v6];
  objc_sync_exit(v7);
}

- (id)pbf_desiredActiveConfigurationForRole:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_desiredActivePosterConfigurationForRole objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)setTransitionFromIncomingFocusModeChange:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_transitionFromIncomingFocusModeChange = a3;
  objc_sync_exit(obj);
}

- (BOOL)pbf_transitionFromIncomingFocusModeChange
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL transitionFromIncomingFocusModeChange = v2->_transitionFromIncomingFocusModeChange;
  objc_sync_exit(v2);

  return transitionFromIncomingFocusModeChange;
}

- (id)pbf_transitionContextIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_transitionContextIdentifier;
  objc_sync_exit(v2);

  return v3;
}

- (NSDictionary)pbf_extensionStoreCoordinatorForProvider
{
  return self->_extensionStoreCoordinatorForProviderIdentifier;
}

- (id)pbf_currentActivePosterForRole:(id)a3
{
  return [(NSDictionary *)self->_currentActivePosterForRole objectForKey:a3];
}

- (id)pbf_transitionAffectedRoles
{
  return self->_affectedRoles;
}

- (NSString)description
{
  description = self->_description;
  if (description)
  {
    v3 = description;
  }
  else
  {
    v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
    id v6 = self;
    objc_sync_enter(v6);
    v7 = [(NSUUID *)v6->_transitionContextIdentifier UUIDString];
    v8 = [v7 substringToIndex:7];
    [v5 appendString:v8 withName:@"id"];

    [v5 appendString:v6->_activeChargerIdentifier withName:@"activeChargerIdentifier"];
    id v9 = (id)[v5 appendBool:v6->_transitionFromIncomingFocusModeChange withName:@"fromFocusModeChange" ifEqualTo:1];
    id v10 = (id)[v5 appendBool:v6->_initialUpdate withName:@"isInitialUpdate" ifEqualTo:1];
    id v11 = [(FCActivityDescribing *)v6->_activeFocusMode activityUniqueIdentifier];
    id v12 = [v11 UUIDString];
    id v13 = [v12 substringToIndex:7];
    id v14 = (id)[v5 appendObject:v13 withName:@"_activeFocusMode" skipIfNil:1];

    [v5 appendDictionarySection:v6->_desiredActivePosterConfigurationForRole withName:@"desiredActiveConfigurationFromRole" skipIfEmpty:1];
    [v5 appendDictionarySection:v6->_currentActivePosterForRole withName:@"currentActivePosterForRole" skipIfEmpty:1];
    [v5 appendDictionarySection:v6->_extensionStoreCoordinatorForProviderIdentifier withName:@"extensionStoreCoordinatorForProviderIdentifier" skipIfEmpty:1];
    objc_sync_exit(v6);

    id v15 = [v5 build];
    id v16 = self->_description;
    self->_description = v15;

    v3 = self->_description;
  }
  return v3;
}

- (BOOL)isInitialUpdate
{
  return self->_initialUpdate;
}

- (void)setInitialUpdate:(BOOL)a3
{
  self->_initialUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affectedRoles, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_activeChargerIdentifier, 0);
  objc_storeStrong((id *)&self->_transitionContextIdentifier, 0);
  objc_storeStrong((id *)&self->_activeFocusMode, 0);
  objc_storeStrong((id *)&self->_currentActivePosterForRole, 0);
  objc_storeStrong((id *)&self->_desiredActivePosterConfigurationForRole, 0);
  objc_storeStrong((id *)&self->_extensionStoreCoordinatorForProviderIdentifier, 0);
}

@end