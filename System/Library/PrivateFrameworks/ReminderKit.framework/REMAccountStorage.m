@interface REMAccountStorage
+ (BOOL)supportsSecureCoding;
+ (NSString)cdEntityName;
+ (id)listIDsMergeableOrderingReplicaIDSourceWithAccountID:(id)a3;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (BOOL)_isAddingExtraPrimaryCKAccountForTesting;
- (BOOL)daAllowsCalendarAddDeleteModify;
- (BOOL)daSupportsSharedCalendars;
- (BOOL)daWasMigrated;
- (BOOL)debugSyncDisabled;
- (BOOL)didChooseToMigrate;
- (BOOL)didChooseToMigrateLocally;
- (BOOL)didFinishMigration;
- (BOOL)hasDeserializedListIDsMergeableOrdering;
- (BOOL)inactive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnsupported;
- (BOOL)listsDADisplayOrderChanged;
- (BOOL)markedForRemoval;
- (NSData)listIDsMergeableOrderingData;
- (NSData)personIDSalt;
- (NSData)resolutionTokenMapData;
- (NSSet)listIDsToUndelete;
- (NSSet)smartListIDsToUndelete;
- (NSString)daConstraintsDescriptionPath;
- (NSString)daPushKey;
- (NSString)daSyncToken;
- (NSString)displayName;
- (NSString)externalIdentifier;
- (NSString)externalModificationTag;
- (NSString)name;
- (NSString)personID;
- (REMAccountStorage)initWithCoder:(id)a3;
- (REMAccountStorage)initWithObjectID:(id)a3 type:(int64_t)a4 name:(id)a5;
- (REMAccountStorage)initWithObjectID:(id)a3 type:(int64_t)a4 name:(id)a5 nullableListIDsMergeableOrdering:(id)a6;
- (REMCRMergeableOrderedSet)listIDsMergeableOrdering;
- (REMManualOrdering)pinnedListsManualOrdering;
- (REMManualOrdering)templatesManualOrdering;
- (REMObjectID)objectID;
- (REMResolutionTokenMap)resolutionTokenMap;
- (id)accountTypeHost;
- (id)cdKeyToStorageKeyMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)listIDsMergeableOrderingReplicaIDSource;
- (id)optionalObjectID;
- (id)serializedListIDsMergeableOrdering;
- (int64_t)effectiveMinimumSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (int64_t)persistenceCloudSchemaVersion;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)storeGeneration;
- (void)_setIsAddingExtraPrimaryCKAccountForTesting:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)listIDsMergeableOrdering;
- (void)resolutionTokenMap;
- (void)setDaAllowsCalendarAddDeleteModify:(BOOL)a3;
- (void)setDaConstraintsDescriptionPath:(id)a3;
- (void)setDaPushKey:(id)a3;
- (void)setDaSupportsSharedCalendars:(BOOL)a3;
- (void)setDaSyncToken:(id)a3;
- (void)setDaWasMigrated:(BOOL)a3;
- (void)setDebugSyncDisabled:(BOOL)a3;
- (void)setDidChooseToMigrate:(BOOL)a3;
- (void)setDidChooseToMigrateLocally:(BOOL)a3;
- (void)setDidFinishMigration:(BOOL)a3;
- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setInactive:(BOOL)a3;
- (void)setListIDsMergeableOrdering:(id)a3;
- (void)setListIDsMergeableOrderingData:(id)a3;
- (void)setListIDsToUndelete:(id)a3;
- (void)setListsDADisplayOrderChanged:(BOOL)a3;
- (void)setMarkedForRemoval:(BOOL)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setObjectID:(id)a3;
- (void)setPersistenceCloudSchemaVersion:(int64_t)a3;
- (void)setPersonID:(id)a3;
- (void)setPersonIDSalt:(id)a3;
- (void)setPinnedListsManualOrdering:(id)a3;
- (void)setResolutionTokenMap:(id)a3;
- (void)setResolutionTokenMapData:(id)a3;
- (void)setSmartListIDsToUndelete:(id)a3;
- (void)setStoreGenerationIfNeeded:(unint64_t)a3;
- (void)setTemplatesManualOrdering:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation REMAccountStorage

- (NSString)displayName
{
  v2 = [(REMAccountStorage *)self name];
  v3 = +[REMDisplayNameUtils displayNameFromAccountName:v2];

  return (NSString *)v3;
}

- (id)optionalObjectID
{
  return self->_objectID;
}

- (REMAccountStorage)initWithObjectID:(id)a3 type:(int64_t)a4 name:(id)a5 nullableListIDsMergeableOrdering:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v44.receiver = self;
  v44.super_class = (Class)REMAccountStorage;
  v14 = [(REMAccountStorage *)&v44 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_objectID, a3);
    v15->_type = a4;
    objc_storeStrong((id *)&v15->_name, a5);
    v15->_lock._os_unfair_lock_opaque = 0;
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__2;
    v42 = __Block_byref_object_dispose__2;
    id v43 = 0;
    os_unfair_lock_lock(&v15->_lock);
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __81__REMAccountStorage_initWithObjectID_type_name_nullableListIDsMergeableOrdering___block_invoke;
    v35 = &unk_1E61DCAF0;
    v37 = &v38;
    id v36 = v13;
    __81__REMAccountStorage_initWithObjectID_type_name_nullableListIDsMergeableOrdering___block_invoke((uint64_t)&v32);
    os_unfair_lock_unlock(&v15->_lock);

    v16 = (void *)v39[5];
    if (v16)
    {
      v17 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F1C9B8], "data", v32, v33);
      v17 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    listIDsMergeableOrderingData = v15->_listIDsMergeableOrderingData;
    v15->_listIDsMergeableOrderingData = v17;

    objc_storeStrong((id *)&v15->_listIDsMergeableOrdering, a6);
    pinnedListsManualOrdering = v15->_pinnedListsManualOrdering;
    v15->_pinnedListsManualOrdering = 0;

    templatesManualOrdering = v15->_templatesManualOrdering;
    v15->_templatesManualOrdering = 0;

    v21 = objc_alloc_init(REMResolutionTokenMap);
    resolutionTokenMap = v15->_resolutionTokenMap;
    v15->_resolutionTokenMap = v21;

    uint64_t v23 = [MEMORY[0x1E4F1C9B8] data];
    resolutionTokenMapData = v15->_resolutionTokenMapData;
    v15->_resolutionTokenMapData = (NSData *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CAD0] set];
    listIDsToUndelete = v15->_listIDsToUndelete;
    v15->_listIDsToUndelete = (NSSet *)v25;

    uint64_t v27 = [MEMORY[0x1E4F1CAD0] set];
    smartListIDsToUndelete = v15->_smartListIDsToUndelete;
    v15->_smartListIDsToUndelete = (NSSet *)v27;

    v15->_isAddingExtraPrimaryCKAccountForTesting = 0;
    *(void *)&v15->_listsDADisplayOrderChanged = 0x1000000000000;
    v29 = [(REMAccountStorage *)v15 accountTypeHost];
    char v30 = [v29 isCloudKit];

    v15->_daWasMigrated = v30;
    _Block_object_dispose(&v38, 8);
  }
  return v15;
}

- (id)accountTypeHost
{
  accountTypeHost = self->_accountTypeHost;
  if (!accountTypeHost
    || (uint64_t v4 = [(REMAccountTypeHost *)accountTypeHost _accountType],
        v4 != [(REMAccountStorage *)self type]))
  {
    v5 = [[REMAccountTypeHost alloc] initWithType:[(REMAccountStorage *)self type]];
    v6 = self->_accountTypeHost;
    self->_accountTypeHost = v5;
  }
  v7 = self->_accountTypeHost;

  return v7;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setStoreGenerationIfNeeded:(unint64_t)a3
{
  if (!self->_storeGeneration) {
    self->_storeGeneration = a3;
  }
}

uint64_t __81__REMAccountStorage_initWithObjectID_type_name_nullableListIDsMergeableOrdering___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) serializedData];

  return MEMORY[0x1F41817F8]();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (self->_listIDsMergeableOrdering)
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __37__REMAccountStorage_encodeWithCoder___block_invoke;
    v26 = &unk_1E61DCB18;
    id v27 = v4;
    v28 = self;
    __37__REMAccountStorage_encodeWithCoder___block_invoke((uint64_t)&v23);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    if (!self->_listIDsMergeableOrderingData)
    {
      v22 = +[REMLogStore utility];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[REMAccountStorage encodeWithCoder:](self, v22);
      }
    }
    [v4 encodeObject:0 forKey:@"listIDsMergeableOrdering"];
    [v4 encodeObject:self->_listIDsMergeableOrderingData forKey:@"listIDsMergeableOrderingData"];
  }
  v5 = [(REMAccountStorage *)self objectID];
  [v4 encodeObject:v5 forKey:@"objectID"];

  v6 = [(REMAccountStorage *)self externalIdentifier];
  [v4 encodeObject:v6 forKey:@"externalIdentifier"];

  v7 = [(REMAccountStorage *)self externalModificationTag];
  [v4 encodeObject:v7 forKey:@"externalModificationTag"];

  v8 = [(REMAccountStorage *)self daSyncToken];
  [v4 encodeObject:v8 forKey:@"daSyncToken"];

  v9 = [(REMAccountStorage *)self daPushKey];
  [v4 encodeObject:v9 forKey:@"daPushKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountStorage type](self, "type"), @"type");
  v10 = [(REMAccountStorage *)self name];
  [v4 encodeObject:v10 forKey:@"name"];

  id v11 = [(REMAccountStorage *)self personID];
  [v4 encodeObject:v11 forKey:@"personID"];

  id v12 = [(REMAccountStorage *)self personIDSalt];
  [v4 encodeObject:v12 forKey:@"personIDSalt"];

  id v13 = [(REMAccountStorage *)self pinnedListsManualOrdering];
  [v4 encodeObject:v13 forKey:@"pinnedListsManualOrdering"];

  v14 = [(REMAccountStorage *)self templatesManualOrdering];
  [v4 encodeObject:v14 forKey:@"templatesManualOrdering"];

  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage markedForRemoval](self, "markedForRemoval"), @"markedForRemoval");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage inactive](self, "inactive"), @"inactive");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage didChooseToMigrate](self, "didChooseToMigrate"), @"didChooseToMigrate");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage didChooseToMigrateLocally](self, "didChooseToMigrateLocally"), @"didChooseToMigrateLocally");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage didFinishMigration](self, "didFinishMigration"), @"didFinishMigration");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountStorage persistenceCloudSchemaVersion](self, "persistenceCloudSchemaVersion"), @"persistenceCloudSchemaVersion");
  v15 = [(REMAccountStorage *)self daConstraintsDescriptionPath];
  [v4 encodeObject:v15 forKey:@"daConstraintsDescriptionPath"];

  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage daAllowsCalendarAddDeleteModify](self, "daAllowsCalendarAddDeleteModify"), @"daAllowsCalendarAddDeleteModify");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage daSupportsSharedCalendars](self, "daSupportsSharedCalendars"), @"daSupportsSharedCalendars");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage daWasMigrated](self, "daWasMigrated"), @"daWasMigrated");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountStorage minimumSupportedVersion](self, "minimumSupportedVersion"), @"minimumSupportedVersion");
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMAccountStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"), @"effectiveMinimumSupportedVersion");
  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage debugSyncDisabled](self, "debugSyncDisabled"), @"debugSyncDisabled");
  v16 = [(REMAccountStorage *)self listIDsToUndelete];
  v17 = [v16 allObjects];
  [v4 encodeObject:v17 forKey:@"listIDsToUndelete"];

  v18 = [(REMAccountStorage *)self smartListIDsToUndelete];
  v19 = [v18 allObjects];
  [v4 encodeObject:v19 forKey:@"smartListIDsToUndelete"];

  objc_msgSend(v4, "encodeBool:forKey:", -[REMAccountStorage listsDADisplayOrderChanged](self, "listsDADisplayOrderChanged"), @"listsDADisplayOrderChanged");
  resolutionTokenMap = self->_resolutionTokenMap;
  if (resolutionTokenMap)
  {
    [v4 encodeObject:resolutionTokenMap forKey:@"resolutionTokenMap"];
    [v4 encodeObject:0 forKey:@"resolutionTokenMapData"];
  }
  else
  {
    [v4 encodeObject:0 forKey:@"resolutionTokenMap"];
    v21 = [(REMAccountStorage *)self resolutionTokenMapData];
    [v4 encodeObject:v21 forKey:@"resolutionTokenMapData"];
  }
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)didChooseToMigrate
{
  return self->_didChooseToMigrate;
}

- (REMManualOrdering)templatesManualOrdering
{
  return self->_templatesManualOrdering;
}

- (NSSet)smartListIDsToUndelete
{
  return self->_smartListIDsToUndelete;
}

- (NSData)resolutionTokenMapData
{
  return self->_resolutionTokenMapData;
}

- (REMManualOrdering)pinnedListsManualOrdering
{
  return self->_pinnedListsManualOrdering;
}

- (NSString)personID
{
  return self->_personID;
}

- (NSData)personIDSalt
{
  return self->_personIDSalt;
}

- (int64_t)persistenceCloudSchemaVersion
{
  return self->_persistenceCloudSchemaVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->minimumSupportedVersion;
}

- (BOOL)markedForRemoval
{
  return self->_markedForRemoval;
}

- (BOOL)listsDADisplayOrderChanged
{
  return self->_listsDADisplayOrderChanged;
}

- (NSSet)listIDsToUndelete
{
  return self->_listIDsToUndelete;
}

- (BOOL)inactive
{
  return self->_inactive;
}

- (NSString)externalModificationTag
{
  return self->externalModificationTag;
}

- (NSString)externalIdentifier
{
  return self->externalIdentifier;
}

- (int64_t)effectiveMinimumSupportedVersion
{
  return self->effectiveMinimumSupportedVersion;
}

- (BOOL)didFinishMigration
{
  return self->_didFinishMigration;
}

- (BOOL)didChooseToMigrateLocally
{
  return self->_didChooseToMigrateLocally;
}

- (BOOL)debugSyncDisabled
{
  return self->_debugSyncDisabled;
}

- (BOOL)daWasMigrated
{
  return self->_daWasMigrated;
}

- (NSString)daSyncToken
{
  return self->daSyncToken;
}

- (BOOL)daSupportsSharedCalendars
{
  return self->_daSupportsSharedCalendars;
}

- (NSString)daPushKey
{
  return self->daPushKey;
}

- (NSString)daConstraintsDescriptionPath
{
  return self->_daConstraintsDescriptionPath;
}

- (BOOL)daAllowsCalendarAddDeleteModify
{
  return self->_daAllowsCalendarAddDeleteModify;
}

- (void)setListIDsMergeableOrdering:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_listIDsMergeableOrdering, a3);
  if (v6)
  {
    listIDsMergeableOrderingData = self->_listIDsMergeableOrderingData;
    self->_listIDsMergeableOrderingData = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daConstraintsDescriptionPath, 0);
  objc_storeStrong((id *)&self->_personIDSalt, 0);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMapData, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMap, 0);
  objc_storeStrong((id *)&self->_smartListIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_listIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_templatesManualOrdering, 0);
  objc_storeStrong((id *)&self->_pinnedListsManualOrdering, 0);
  objc_storeStrong((id *)&self->_listIDsMergeableOrderingData, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->daPushKey, 0);
  objc_storeStrong((id *)&self->daSyncToken, 0);
  objc_storeStrong((id *)&self->externalModificationTag, 0);
  objc_storeStrong((id *)&self->externalIdentifier, 0);
  objc_storeStrong((id *)&self->_listIDsMergeableOrdering, 0);

  objc_storeStrong((id *)&self->_accountTypeHost, 0);
}

- (REMAccountStorage)initWithCoder:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
  uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalIdentifier"];
  v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalModificationTag"];
  v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daSyncToken"];
  v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daPushKey"];
  unint64_t v6 = [v4 decodeIntegerForKey:@"type"];
  if (v6 >= 8)
  {
    v7 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[REMAccountStorage initWithCoder:]();
    }

    unint64_t v6 = 0;
  }
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  unsigned int v42 = [v4 decodeBoolForKey:@"markedForRemoval"];
  v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pinnedListsManualOrdering"];
  v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"templatesManualOrdering"];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"listIDsToUndelete"];

  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v4 decodeObjectOfClasses:v15 forKey:@"smartListIDsToUndelete"];

  v17 = (void *)v8;
  v18 = (void *)v5;
  if (v6 && v5 && v8)
  {
    v19 = [(REMAccountStorage *)self initWithObjectID:v5 type:v6 name:v8 nullableListIDsMergeableOrdering:0];
    v20 = v19;
    v21 = (void *)v44;
    if (v19)
    {
      v41 = (void *)v8;
      [(REMAccountStorage *)v19 setExternalIdentifier:v44];
      [(REMAccountStorage *)v20 setExternalModificationTag:v50];
      [(REMAccountStorage *)v20 setDaSyncToken:v49];
      [(REMAccountStorage *)v20 setDaPushKey:v48];
      [(REMAccountStorage *)v20 setMarkedForRemoval:v42];
      v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listIDsMergeableOrdering"];
      id v43 = v22;
      if (v22)
      {
        objc_storeStrong((id *)&v20->_listIDsMergeableOrdering, v22);
        listIDsMergeableOrderingData = v20->_listIDsMergeableOrderingData;
        v20->_listIDsMergeableOrderingData = 0;
      }
      else
      {
        listIDsMergeableOrdering = v20->_listIDsMergeableOrdering;
        v20->_listIDsMergeableOrdering = 0;

        uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listIDsMergeableOrderingData"];
        listIDsMergeableOrderingData = v20->_listIDsMergeableOrderingData;
        v20->_listIDsMergeableOrderingData = (NSData *)v28;
      }

      if (!v20->_listIDsMergeableOrdering && !v20->_listIDsMergeableOrderingData)
      {
        uint64_t v40 = +[REMLogStore utility];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
          -[REMAccountStorage initWithCoder:]();
        }

        v21 = (void *)v44;
      }
      v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionTokenMapData"];
      char v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionTokenMap"];
      v45 = v29;
      if (v30)
      {
        objc_storeStrong((id *)&v20->_resolutionTokenMap, v30);
        resolutionTokenMapData = v20->_resolutionTokenMapData;
        v20->_resolutionTokenMapData = 0;
      }
      else
      {
        resolutionTokenMap = v20->_resolutionTokenMap;
        v20->_resolutionTokenMap = 0;

        uint64_t v33 = v29;
        resolutionTokenMapData = v20->_resolutionTokenMapData;
        v20->_resolutionTokenMapData = v33;
      }

      [(REMAccountStorage *)v20 setPinnedListsManualOrdering:v47];
      [(REMAccountStorage *)v20 setTemplatesManualOrdering:v46];
      v34 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
      [(REMAccountStorage *)v20 setListIDsToUndelete:v34];

      v35 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];
      [(REMAccountStorage *)v20 setSmartListIDsToUndelete:v35];

      -[REMAccountStorage setListsDADisplayOrderChanged:](v20, "setListsDADisplayOrderChanged:", [v4 decodeBoolForKey:@"listsDADisplayOrderChanged"]);
      id v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personID"];
      [(REMAccountStorage *)v20 setPersonID:v36];

      v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personIDSalt"];
      [(REMAccountStorage *)v20 setPersonIDSalt:v37];

      -[REMAccountStorage setInactive:](v20, "setInactive:", [v4 decodeBoolForKey:@"inactive"]);
      -[REMAccountStorage setDidChooseToMigrate:](v20, "setDidChooseToMigrate:", [v4 decodeBoolForKey:@"didChooseToMigrate"]);
      -[REMAccountStorage setDidChooseToMigrateLocally:](v20, "setDidChooseToMigrateLocally:", [v4 decodeBoolForKey:@"didChooseToMigrateLocally"]);
      -[REMAccountStorage setDidFinishMigration:](v20, "setDidFinishMigration:", [v4 decodeBoolForKey:@"didFinishMigration"]);
      -[REMAccountStorage setPersistenceCloudSchemaVersion:](v20, "setPersistenceCloudSchemaVersion:", [v4 decodeIntegerForKey:@"persistenceCloudSchemaVersion"]);
      uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"daConstraintsDescriptionPath"];
      [(REMAccountStorage *)v20 setDaConstraintsDescriptionPath:v38];

      -[REMAccountStorage setDaAllowsCalendarAddDeleteModify:](v20, "setDaAllowsCalendarAddDeleteModify:", [v4 decodeBoolForKey:@"daAllowsCalendarAddDeleteModify"]);
      -[REMAccountStorage setDaSupportsSharedCalendars:](v20, "setDaSupportsSharedCalendars:", [v4 decodeBoolForKey:@"daSupportsSharedCalendars"]);
      -[REMAccountStorage setDaWasMigrated:](v20, "setDaWasMigrated:", [v4 decodeBoolForKey:@"daWasMigrated"]);
      -[REMAccountStorage setMinimumSupportedVersion:](v20, "setMinimumSupportedVersion:", [v4 decodeIntegerForKey:@"minimumSupportedVersion"]);
      -[REMAccountStorage setEffectiveMinimumSupportedVersion:](v20, "setEffectiveMinimumSupportedVersion:", [v4 decodeIntegerForKey:@"effectiveMinimumSupportedVersion"]);
      -[REMAccountStorage setDebugSyncDisabled:](v20, "setDebugSyncDisabled:", [v4 decodeBoolForKey:@"debugSyncDisabled"]);

      v17 = v41;
    }
    self = v20;
    v26 = self;
  }
  else
  {
    uint64_t v24 = +[REMLogStore utility];
    v21 = (void *)v44;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138544130;
      v52 = v18;
      __int16 v53 = 2048;
      unint64_t v54 = v6;
      __int16 v55 = 2112;
      v56 = v17;
      __int16 v57 = 1024;
      BOOL v58 = [(REMAccountStorage *)self markedForRemoval];
      _os_log_fault_impl(&dword_1B9AA2000, v24, OS_LOG_TYPE_FAULT, "Attempted to decode REMAccount missing objectID, type or name {objectID: %{public}@, type: %ld, name: %@, markedForRemoval: %d}", buf, 0x26u);
    }

    uint64_t v25 = +[REMError internalErrorWithDebugDescription:@"REMAccount missing required fields"];
    [v4 failWithError:v25];

    v26 = 0;
  }

  return v26;
}

- (void)setPersonIDSalt:(id)a3
{
}

- (void)setPersonID:(id)a3
{
}

- (void)setPersistenceCloudSchemaVersion:(int64_t)a3
{
  self->_persistenceCloudSchemaVersion = a3;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  self->minimumSupportedVersion = a3;
}

- (void)setInactive:(BOOL)a3
{
  self->_inactive = a3;
}

- (void)setExternalModificationTag:(id)a3
{
}

- (void)setExternalIdentifier:(id)a3
{
}

- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3
{
  self->effectiveMinimumSupportedVersion = a3;
}

- (void)setDidFinishMigration:(BOOL)a3
{
  self->_didFinishMigration = a3;
}

- (void)setDidChooseToMigrateLocally:(BOOL)a3
{
  self->_didChooseToMigrateLocally = a3;
}

- (void)setDidChooseToMigrate:(BOOL)a3
{
  self->_didChooseToMigrate = a3;
}

- (void)setDebugSyncDisabled:(BOOL)a3
{
  self->_debugSyncDisabled = a3;
}

- (void)setDaWasMigrated:(BOOL)a3
{
  self->_daWasMigrated = a3;
}

- (void)setDaSyncToken:(id)a3
{
}

- (void)setDaSupportsSharedCalendars:(BOOL)a3
{
  self->_daSupportsSharedCalendars = a3;
}

- (void)setDaPushKey:(id)a3
{
}

- (void)setDaConstraintsDescriptionPath:(id)a3
{
}

- (void)setDaAllowsCalendarAddDeleteModify:(BOOL)a3
{
  self->_daAllowsCalendarAddDeleteModify = a3;
}

- (void)setTemplatesManualOrdering:(id)a3
{
}

- (void)setSmartListIDsToUndelete:(id)a3
{
}

- (void)setPinnedListsManualOrdering:(id)a3
{
}

- (void)setMarkedForRemoval:(BOOL)a3
{
  self->_markedForRemoval = a3;
}

- (void)setListsDADisplayOrderChanged:(BOOL)a3
{
  self->_listsDADisplayOrderChanged = a3;
}

- (void)setListIDsToUndelete:(id)a3
{
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 cdEntityName];
  unint64_t v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDAccount";
}

- (void)setResolutionTokenMapData:(id)a3
{
}

- (void)setResolutionTokenMap:(id)a3
{
}

- (void)setListIDsMergeableOrderingData:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAccountStorage)initWithObjectID:(id)a3 type:(int64_t)a4 name:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = +[REMAccountStorage listIDsMergeableOrderingReplicaIDSourceWithAccountID:v9];
  id v11 = [REMCRMergeableOrderedSet alloc];
  id v12 = [MEMORY[0x1E4F1CAA0] orderedSet];
  id v13 = [(REMCRMergeableOrderedSet *)v11 initWithReplicaIDSource:v10 orderedSet:v12];

  uint64_t v14 = [(REMAccountStorage *)self initWithObjectID:v9 type:a4 name:v8 listIDsMergeableOrdering:v13];
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [REMAccountStorage alloc];
  uint64_t v5 = [(REMAccountStorage *)self objectID];
  int64_t v6 = [(REMAccountStorage *)self type];
  v7 = [(REMAccountStorage *)self name];
  id v8 = [(REMAccountStorage *)v4 initWithObjectID:v5 type:v6 name:v7 nullableListIDsMergeableOrdering:0];

  id v9 = (void *)[(REMCRMergeableOrderedSet *)self->_listIDsMergeableOrdering copy];
  [(REMAccountStorage *)v8 setListIDsMergeableOrdering:v9];

  [(REMAccountStorage *)v8 setListIDsMergeableOrderingData:self->_listIDsMergeableOrderingData];
  uint64_t v10 = [(REMAccountStorage *)self externalIdentifier];
  [(REMAccountStorage *)v8 setExternalIdentifier:v10];

  id v11 = [(REMAccountStorage *)self externalModificationTag];
  [(REMAccountStorage *)v8 setExternalModificationTag:v11];

  id v12 = [(REMAccountStorage *)self daSyncToken];
  [(REMAccountStorage *)v8 setDaSyncToken:v12];

  id v13 = [(REMAccountStorage *)self daPushKey];
  [(REMAccountStorage *)v8 setDaPushKey:v13];

  uint64_t v14 = [(REMAccountStorage *)self pinnedListsManualOrdering];
  v15 = (void *)[v14 copy];
  [(REMAccountStorage *)v8 setPinnedListsManualOrdering:v15];

  v16 = [(REMAccountStorage *)self templatesManualOrdering];
  v17 = (void *)[v16 copy];
  [(REMAccountStorage *)v8 setTemplatesManualOrdering:v17];

  uint64_t v18 = [(REMResolutionTokenMap *)self->_resolutionTokenMap copy];
  resolutionTokenMap = v8->_resolutionTokenMap;
  v8->_resolutionTokenMap = (REMResolutionTokenMap *)v18;

  v20 = [(REMAccountStorage *)self resolutionTokenMapData];
  [(REMAccountStorage *)v8 setResolutionTokenMapData:v20];

  v21 = [(REMAccountStorage *)self listIDsToUndelete];
  v22 = (void *)[v21 copy];
  [(REMAccountStorage *)v8 setListIDsToUndelete:v22];

  uint64_t v23 = [(REMAccountStorage *)self smartListIDsToUndelete];
  uint64_t v24 = (void *)[v23 copy];
  [(REMAccountStorage *)v8 setSmartListIDsToUndelete:v24];

  [(REMAccountStorage *)v8 setListsDADisplayOrderChanged:[(REMAccountStorage *)self listsDADisplayOrderChanged]];
  uint64_t v25 = [(REMAccountStorage *)self personID];
  [(REMAccountStorage *)v8 setPersonID:v25];

  v26 = [(REMAccountStorage *)self personIDSalt];
  id v27 = (void *)[v26 copy];
  [(REMAccountStorage *)v8 setPersonIDSalt:v27];

  [(REMAccountStorage *)v8 setInactive:[(REMAccountStorage *)self inactive]];
  [(REMAccountStorage *)v8 setDidChooseToMigrate:[(REMAccountStorage *)self didChooseToMigrate]];
  [(REMAccountStorage *)v8 setDidChooseToMigrateLocally:[(REMAccountStorage *)self didChooseToMigrateLocally]];
  [(REMAccountStorage *)v8 setDidFinishMigration:[(REMAccountStorage *)self didFinishMigration]];
  [(REMAccountStorage *)v8 setPersistenceCloudSchemaVersion:[(REMAccountStorage *)self persistenceCloudSchemaVersion]];
  uint64_t v28 = [(REMAccountStorage *)self daConstraintsDescriptionPath];
  [(REMAccountStorage *)v8 setDaConstraintsDescriptionPath:v28];

  [(REMAccountStorage *)v8 setDaAllowsCalendarAddDeleteModify:[(REMAccountStorage *)self daAllowsCalendarAddDeleteModify]];
  [(REMAccountStorage *)v8 setDaSupportsSharedCalendars:[(REMAccountStorage *)self daSupportsSharedCalendars]];
  [(REMAccountStorage *)v8 setDaWasMigrated:[(REMAccountStorage *)self daWasMigrated]];
  [(REMAccountStorage *)v8 setMinimumSupportedVersion:[(REMAccountStorage *)self minimumSupportedVersion]];
  [(REMAccountStorage *)v8 setEffectiveMinimumSupportedVersion:[(REMAccountStorage *)self effectiveMinimumSupportedVersion]];
  [(REMAccountStorage *)v8 setDebugSyncDisabled:[(REMAccountStorage *)self debugSyncDisabled]];
  v8->_storeGeneration = self->_storeGeneration;
  v8->_copyGeneration = self->_copyGeneration + 1;
  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(REMAccountStorage *)self type];
  int64_t v6 = [(REMAccountStorage *)self objectID];
  v7 = [v3 stringWithFormat:@"<%@: %p type:%ld, %@>", v4, self, v5, v6];

  return v7;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t storeGeneration = self->_storeGeneration;
  unint64_t copyGeneration = self->_copyGeneration;
  int64_t v7 = [(REMAccountStorage *)self type];
  id v8 = [(REMAccountStorage *)self name];
  id v9 = [(REMAccountStorage *)self objectID];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p[%ld.%ld] type:%ld name:%@ %@>", v4, self, storeGeneration, copyGeneration, v7, v8, v9];

  return v10;
}

- (unint64_t)storeGeneration
{
  return self->_storeGeneration;
}

uint64_t __37__REMAccountStorage_encodeWithCoder___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 40) forKey:@"listIDsMergeableOrdering"];
  v2 = *(void **)(a1 + 32);

  return [v2 encodeObject:0 forKey:@"listIDsMergeableOrderingData"];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (REMAccountStorage *)a3;
  int64_t v5 = v4;
  if (v4 != self)
  {
    int64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v7 = [(REMAccountStorage *)self objectID];
      uint64_t v8 = [(REMAccountStorage *)v6 objectID];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        id v9 = (void *)v8;
        uint64_t v10 = [(REMAccountStorage *)self objectID];
        id v11 = [(REMAccountStorage *)v6 objectID];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_77;
        }
      }
      uint64_t v14 = [(REMAccountStorage *)self name];
      uint64_t v15 = [(REMAccountStorage *)v6 name];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(REMAccountStorage *)self name];
        uint64_t v18 = [(REMAccountStorage *)v6 name];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_77;
        }
      }
      int64_t v20 = [(REMAccountStorage *)self type];
      if (v20 != [(REMAccountStorage *)v6 type]) {
        goto LABEL_77;
      }
      BOOL v21 = [(REMAccountStorage *)self markedForRemoval];
      if (v21 != [(REMAccountStorage *)v6 markedForRemoval]) {
        goto LABEL_77;
      }
      v22 = [(REMAccountStorage *)self externalIdentifier];
      uint64_t v23 = [(REMAccountStorage *)v6 externalIdentifier];
      if (v22 == (void *)v23)
      {
      }
      else
      {
        uint64_t v24 = (void *)v23;
        uint64_t v25 = [(REMAccountStorage *)self externalIdentifier];
        v26 = [(REMAccountStorage *)v6 externalIdentifier];
        int v27 = [v25 isEqual:v26];

        if (!v27) {
          goto LABEL_77;
        }
      }
      uint64_t v28 = [(REMAccountStorage *)self externalModificationTag];
      uint64_t v29 = [(REMAccountStorage *)v6 externalModificationTag];
      if (v28 == (void *)v29)
      {
      }
      else
      {
        char v30 = (void *)v29;
        v31 = [(REMAccountStorage *)self externalModificationTag];
        uint64_t v32 = [(REMAccountStorage *)v6 externalModificationTag];
        int v33 = [v31 isEqual:v32];

        if (!v33) {
          goto LABEL_77;
        }
      }
      v34 = [(REMAccountStorage *)self daSyncToken];
      uint64_t v35 = [(REMAccountStorage *)v6 daSyncToken];
      if (v34 == (void *)v35)
      {
      }
      else
      {
        id v36 = (void *)v35;
        v37 = [(REMAccountStorage *)self daSyncToken];
        uint64_t v38 = [(REMAccountStorage *)v6 daSyncToken];
        int v39 = [v37 isEqual:v38];

        if (!v39) {
          goto LABEL_77;
        }
      }
      uint64_t v40 = [(REMAccountStorage *)self daPushKey];
      uint64_t v41 = [(REMAccountStorage *)v6 daPushKey];
      if (v40 == (void *)v41)
      {
      }
      else
      {
        unsigned int v42 = (void *)v41;
        id v43 = [(REMAccountStorage *)self daPushKey];
        uint64_t v44 = [(REMAccountStorage *)v6 daPushKey];
        int v45 = [v43 isEqual:v44];

        if (!v45) {
          goto LABEL_77;
        }
      }
      v46 = [(REMAccountStorage *)self pinnedListsManualOrdering];
      uint64_t v47 = [(REMAccountStorage *)v6 pinnedListsManualOrdering];
      if (v46 == (void *)v47)
      {
      }
      else
      {
        v48 = (void *)v47;
        v49 = [(REMAccountStorage *)self pinnedListsManualOrdering];
        v50 = [(REMAccountStorage *)v6 pinnedListsManualOrdering];
        int v51 = [v49 isEqual:v50];

        if (!v51) {
          goto LABEL_77;
        }
      }
      v52 = [(REMAccountStorage *)self templatesManualOrdering];
      uint64_t v53 = [(REMAccountStorage *)v6 templatesManualOrdering];
      if (v52 == (void *)v53)
      {
      }
      else
      {
        unint64_t v54 = (void *)v53;
        __int16 v55 = [(REMAccountStorage *)self templatesManualOrdering];
        v56 = [(REMAccountStorage *)v6 templatesManualOrdering];
        int v57 = [v55 isEqual:v56];

        if (!v57) {
          goto LABEL_77;
        }
      }
      BOOL v58 = [(REMAccountStorage *)self listIDsToUndelete];
      uint64_t v59 = [(REMAccountStorage *)v6 listIDsToUndelete];
      if (v58 == (void *)v59)
      {
      }
      else
      {
        v60 = (void *)v59;
        v61 = [(REMAccountStorage *)self listIDsToUndelete];
        v62 = [(REMAccountStorage *)v6 listIDsToUndelete];
        int v63 = [v61 isEqual:v62];

        if (!v63) {
          goto LABEL_77;
        }
      }
      v64 = [(REMAccountStorage *)self smartListIDsToUndelete];
      uint64_t v65 = [(REMAccountStorage *)v6 smartListIDsToUndelete];
      if (v64 == (void *)v65)
      {
      }
      else
      {
        v66 = (void *)v65;
        v67 = [(REMAccountStorage *)self smartListIDsToUndelete];
        v68 = [(REMAccountStorage *)v6 smartListIDsToUndelete];
        int v69 = [v67 isEqual:v68];

        if (!v69) {
          goto LABEL_77;
        }
      }
      BOOL v70 = [(REMAccountStorage *)self listsDADisplayOrderChanged];
      if (v70 == [(REMAccountStorage *)v6 listsDADisplayOrderChanged])
      {
        v71 = [(REMAccountStorage *)self personID];
        uint64_t v72 = [(REMAccountStorage *)v6 personID];
        if (v71 == (void *)v72)
        {
        }
        else
        {
          v73 = (void *)v72;
          v74 = [(REMAccountStorage *)self personID];
          v75 = [(REMAccountStorage *)v6 personID];
          int v76 = [v74 isEqual:v75];

          if (!v76) {
            goto LABEL_77;
          }
        }
        v77 = [(REMAccountStorage *)self personIDSalt];
        uint64_t v78 = [(REMAccountStorage *)v6 personIDSalt];
        if (v77 == (void *)v78)
        {
        }
        else
        {
          v79 = (void *)v78;
          v80 = [(REMAccountStorage *)self personIDSalt];
          v81 = [(REMAccountStorage *)v6 personIDSalt];
          int v82 = [v80 isEqual:v81];

          if (!v82) {
            goto LABEL_77;
          }
        }
        BOOL v83 = [(REMAccountStorage *)self inactive];
        if (v83 != [(REMAccountStorage *)v6 inactive]) {
          goto LABEL_77;
        }
        BOOL v84 = [(REMAccountStorage *)self didChooseToMigrate];
        if (v84 != [(REMAccountStorage *)v6 didChooseToMigrate]) {
          goto LABEL_77;
        }
        BOOL v85 = [(REMAccountStorage *)self didChooseToMigrateLocally];
        if (v85 != [(REMAccountStorage *)v6 didChooseToMigrateLocally]) {
          goto LABEL_77;
        }
        BOOL v86 = [(REMAccountStorage *)self didFinishMigration];
        if (v86 != [(REMAccountStorage *)v6 didFinishMigration]) {
          goto LABEL_77;
        }
        int64_t v87 = [(REMAccountStorage *)self persistenceCloudSchemaVersion];
        if (v87 != [(REMAccountStorage *)v6 persistenceCloudSchemaVersion]) {
          goto LABEL_77;
        }
        v88 = [(REMAccountStorage *)self daConstraintsDescriptionPath];
        uint64_t v89 = [(REMAccountStorage *)v6 daConstraintsDescriptionPath];
        if (v88 == (void *)v89)
        {
        }
        else
        {
          v90 = (void *)v89;
          v91 = [(REMAccountStorage *)self daConstraintsDescriptionPath];
          v92 = [(REMAccountStorage *)v6 daConstraintsDescriptionPath];
          int v93 = [v91 isEqual:v92];

          if (!v93) {
            goto LABEL_77;
          }
        }
        BOOL v94 = [(REMAccountStorage *)self daAllowsCalendarAddDeleteModify];
        if (v94 != [(REMAccountStorage *)v6 daAllowsCalendarAddDeleteModify]) {
          goto LABEL_77;
        }
        BOOL v95 = [(REMAccountStorage *)self daSupportsSharedCalendars];
        if (v95 != [(REMAccountStorage *)v6 daSupportsSharedCalendars]) {
          goto LABEL_77;
        }
        BOOL v96 = [(REMAccountStorage *)self daWasMigrated];
        if (v96 != [(REMAccountStorage *)v6 daWasMigrated]) {
          goto LABEL_77;
        }
        int64_t v97 = [(REMAccountStorage *)self minimumSupportedVersion];
        if (v97 != [(REMAccountStorage *)v6 minimumSupportedVersion]) {
          goto LABEL_77;
        }
        int64_t v98 = [(REMAccountStorage *)self effectiveMinimumSupportedVersion];
        if (v98 != [(REMAccountStorage *)v6 effectiveMinimumSupportedVersion]) {
          goto LABEL_77;
        }
        BOOL v99 = [(REMAccountStorage *)self debugSyncDisabled];
        if (v99 != [(REMAccountStorage *)v6 debugSyncDisabled]) {
          goto LABEL_77;
        }
        if (!self->_listIDsMergeableOrdering || v6->_listIDsMergeableOrdering)
        {
          v100 = +[REMLogStore utility];
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            v114 = (objc_class *)objc_opt_class();
            v115 = NSStringFromClass(v114);
            listIDsMergeableOrdering = self->_listIDsMergeableOrdering;
            v117 = v6->_listIDsMergeableOrdering;
            int v122 = 138543874;
            v123 = v115;
            __int16 v124 = 2112;
            v125 = listIDsMergeableOrdering;
            __int16 v126 = 2112;
            v127 = v117;
            _os_log_error_impl(&dword_1B9AA2000, v100, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the listIDsMergeableOrdering. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-idsOrdering: %@, other-idsOrdering: %@}", (uint8_t *)&v122, 0x20u);
          }
        }
        v101 = [(REMAccountStorage *)self listIDsMergeableOrdering];
        uint64_t v102 = [(REMAccountStorage *)v6 listIDsMergeableOrdering];
        if (v101 == (void *)v102)
        {
        }
        else
        {
          v103 = (void *)v102;
          v104 = [(REMAccountStorage *)self listIDsMergeableOrdering];
          v105 = [(REMAccountStorage *)v6 listIDsMergeableOrdering];
          int v106 = [v104 isEqual:v105];

          if (!v106) {
            goto LABEL_77;
          }
        }
        if (!self->_resolutionTokenMap || v6->_resolutionTokenMap)
        {
          v108 = +[REMLogStore utility];
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            v118 = (objc_class *)objc_opt_class();
            v119 = NSStringFromClass(v118);
            resolutionTokenMap = self->_resolutionTokenMap;
            v121 = v6->_resolutionTokenMap;
            int v122 = 138543874;
            v123 = v119;
            __int16 v124 = 2112;
            v125 = resolutionTokenMap;
            __int16 v126 = 2112;
            v127 = v121;
            _os_log_error_impl(&dword_1B9AA2000, v108, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the resolution token map from JSON data. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-map: %@, other-map: %@}", (uint8_t *)&v122, 0x20u);
          }
        }
        v109 = [(REMAccountStorage *)self resolutionTokenMap];
        uint64_t v110 = [(REMAccountStorage *)v6 resolutionTokenMap];
        if (v109 == (void *)v110)
        {
          char v13 = 1;
          v111 = v109;
        }
        else
        {
          v111 = (void *)v110;
          v112 = [(REMAccountStorage *)self resolutionTokenMap];
          v113 = [(REMAccountStorage *)v6 resolutionTokenMap];
          char v13 = [v112 isEqual:v113];
        }
        goto LABEL_78;
      }
    }
LABEL_77:
    char v13 = 0;
LABEL_78:

    goto LABEL_79;
  }
  char v13 = 1;
LABEL_79:

  return v13;
}

- (unint64_t)hash
{
  v2 = [(REMAccountStorage *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (REMCRMergeableOrderedSet)listIDsMergeableOrdering
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_listIDsMergeableOrdering = &self->_listIDsMergeableOrdering;
  uint64_t v4 = self->_listIDsMergeableOrdering;
  if (v4)
  {
    int64_t v5 = v4;
    goto LABEL_16;
  }
  int64_t v6 = [(REMAccountStorage *)self objectID];
  int64_t v7 = +[REMAccountStorage listIDsMergeableOrderingReplicaIDSourceWithAccountID:v6];

  uint64_t v8 = [(REMAccountStorage *)self listIDsMergeableOrderingData];
  id v9 = &off_1E61DB000;
  if (!v8)
  {
    v16 = +[REMLogStore utility];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      [(REMAccountStorage *)self listIDsMergeableOrdering];
    }

    id v11 = +[REMError internalErrorWithDebugDescription:@"listIDsMergeableOrderingData is nil when trying to deserialize from account storage"];
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  id v21 = 0;
  uint64_t v10 = [[REMCRMergeableOrderedSet alloc] initWithReplicaIDSource:v7 serializedData:v8 error:&v21];
  id v11 = v21;
  int v12 = +[REMLogStore utility];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    char v13 = [(REMAccountStorage *)self objectID];
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[REMCRMergeableOrderedSet count](v10, "count"));
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = self;
    __int16 v26 = 2112;
    int v27 = v14;
    _os_log_impl(&dword_1B9AA2000, v12, OS_LOG_TYPE_INFO, "REMAccountStorage listIDsMergeableOrdering deserialized {objectID: %{public}@, self: %p, orderedSet.count: %@}", buf, 0x20u);

    id v9 = &off_1E61DB000;
  }

  if (!v10 || v11)
  {
LABEL_12:
    v17 = +[REMLogStore utility];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[REMAccountStorage listIDsMergeableOrdering]();
    }

    id v18 = objc_alloc((Class)v9[157]);
    listIDsMergeableOrderingData = (NSData *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    uint64_t v19 = [v18 initWithReplicaIDSource:v7 orderedSet:listIDsMergeableOrderingData];

    uint64_t v10 = (REMCRMergeableOrderedSet *)v19;
    goto LABEL_15;
  }
  listIDsMergeableOrderingData = self->_listIDsMergeableOrderingData;
  self->_listIDsMergeableOrderingData = 0;
LABEL_15:

  objc_storeStrong((id *)p_listIDsMergeableOrdering, v10);
  int64_t v5 = v10;

LABEL_16:

  return v5;
}

- (id)serializedListIDsMergeableOrdering
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__2;
  int v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(REMCRMergeableOrderedSet *)self->_listIDsMergeableOrdering serializedData];
  int64_t v5 = (void *)v9[5];
  v9[5] = v4;

  os_unfair_lock_unlock(p_lock);
  id v6 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v6;
}

uint64_t __55__REMAccountStorage_serializedListIDsMergeableOrdering__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) serializedData];

  return MEMORY[0x1F41817F8]();
}

- (BOOL)hasDeserializedListIDsMergeableOrdering
{
  return self->_listIDsMergeableOrdering != 0;
}

+ (id)newObjectID
{
  unint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

- (BOOL)isUnsupported
{
  uint64_t v2 = [(REMAccountStorage *)self effectiveMinimumSupportedVersion];

  return rem_isUnsupportedVersionByRuntime(v2);
}

- (id)cdKeyToStorageKeyMap
{
  if (cdKeyToStorageKeyMap_onceToken != -1) {
    dispatch_once(&cdKeyToStorageKeyMap_onceToken, &__block_literal_global_3);
  }
  uint64_t v2 = (void *)cdKeyToStorageKeyMap_mapping;

  return v2;
}

- (REMResolutionTokenMap)resolutionTokenMap
{
  p_resolutionTokenMap = &self->_resolutionTokenMap;
  uint64_t v4 = self->_resolutionTokenMap;
  if (v4)
  {
    int64_t v5 = v4;
  }
  else
  {
    id v6 = [(REMAccountStorage *)self resolutionTokenMapData];
    if (!v6)
    {
      int64_t v7 = +[REMLogStore utility];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[REMAccountStorage resolutionTokenMap]();
      }
    }
    uint64_t v8 = [(REMAccountStorage *)self cdKeyToStorageKeyMap];
    id v9 = +[REMResolutionTokenMap resolutionTokenMapWithJSONData:v6 keyMap:v8];

    objc_storeStrong((id *)p_resolutionTokenMap, v9);
    int64_t v5 = v9;
  }

  return v5;
}

+ (id)listIDsMergeableOrderingReplicaIDSourceWithAccountID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[REMReplicaIDSource alloc] initWithAccountID:v3 objectID:v3 property:@"listIDsMergeableOrdering"];

  return v4;
}

- (id)listIDsMergeableOrderingReplicaIDSource
{
  uint64_t v2 = [(REMAccountStorage *)self objectID];
  id v3 = +[REMAccountStorage listIDsMergeableOrderingReplicaIDSourceWithAccountID:v2];

  return v3;
}

- (BOOL)_isAddingExtraPrimaryCKAccountForTesting
{
  return self->_isAddingExtraPrimaryCKAccountForTesting;
}

- (void)_setIsAddingExtraPrimaryCKAccountForTesting:(BOOL)a3
{
  self->_isAddingExtraPrimaryCKAccountForTesting = a3;
}

- (void)setObjectID:(id)a3
{
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setName:(id)a3
{
}

- (NSData)listIDsMergeableOrderingData
{
  return self->_listIDsMergeableOrderingData;
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2117;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1B9AA2000, v1, OS_LOG_TYPE_FAULT, "rem_log_fault_if (_listIDsMergeableOrdering == nil && _listIDsMergeableOrderingData == nil) -- Attempted to decode REMAccountStorage with both _listIDsMergeableOrdering and _listIDsMergeableOrderingData missing {objectID: %{public}@, name: %{sensitive}@}", v2, 0x16u);
}

- (void)initWithCoder:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_FAULT, "Unknown REMAccountType %ld", v1, 0xCu);
}

- (void)encodeWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 objectID];
  uint64_t v5 = [a1 name];
  int v6 = 138543619;
  int64_t v7 = v4;
  __int16 v8 = 2117;
  id v9 = v5;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "rem_log_fault_if (self->_listIDsMergeableOrderingData == nil) -- Attempted to encode REMAccountStorage with both _listIDsMergeableOrdering and _listIDsMergeableOrderingData missing {objectID: %{public}@, name: %{sensitive}@}", (uint8_t *)&v6, 0x16u);
}

- (void)listIDsMergeableOrdering
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Nil listIDsMergeableOrderingData when reading listIDsMergeableOrdering from account storage. Initialize an empty set {objectID: %{public}@}", v4, 0xCu);
}

- (void)resolutionTokenMap
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_ERROR, "Nil resolutionTokenMapData when reading resolutionTokenMap from account storage. Initialize an empty map {list: %@}", v1, 0xCu);
}

@end