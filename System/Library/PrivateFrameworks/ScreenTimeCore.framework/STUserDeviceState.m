@interface STUserDeviceState
+ (BOOL)isUnitTestRunning;
+ (NSString)serializableClassName;
+ (id)_getCoreDuetIdentifier;
+ (id)fetchLocalUserDeviceStateInContext:(id)a3 error:(id *)a4;
+ (id)fetchOrCreateLocalUserDeviceStateInContext:(id)a3 error:(id *)a4;
+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)fetchRequest;
+ (id)fetchRequestMatchingLocalUserDeviceState;
+ (void)_getCoreDuetIdentifier;
- (BOOL)_validateCoreDuetIdentifier:(id)a3;
- (BOOL)_validateLocalUserDeviceState:(id)a3;
- (BOOL)_validateNumberOfLocalUserDeviceStates:(id)a3;
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (id)computeUniqueIdentifier;
- (id)dictionaryRepresentation;
- (void)dictionaryRepresentation;
- (void)didChangeValueForKey:(id)a3;
@end

@implementation STUserDeviceState

+ (id)fetchRequest
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___STUserDeviceState;
  v2 = objc_msgSendSuper2(&v4, sel_fetchRequest);
  return v2;
}

+ (id)fetchRequestMatchingLocalUserDeviceState
{
  v2 = [a1 fetchRequest];
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"localUser");
  [v2 setPredicate:v3];

  return v2;
}

+ (id)fetchOrCreateLocalUserDeviceStateInContext:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (_os_feature_enabled_impl()) {
    [MEMORY[0x1E4F1CA00] raise:@"cannot fetch or create Local User Device state with simplified agent" format:@"cannot fetch or create Local User Device state with simplified agent"];
  }
  v7 = +[STCoreDevice fetchOrCreateLocalDeviceInContext:v6 error:a4];
  if (v7)
  {
    v8 = [a1 fetchLocalUserDeviceStateInContext:v6 error:a4];
    if (v8)
    {
      v9 = v8;
      [v8 setDevice:v7];
      [v9 setLocalDevice:v7];
      v10 = v9;
    }
    else
    {
      v11 = +[STCoreUser fetchRequest];
      v12 = (void *)MEMORY[0x1E4F28F60];
      v13 = +[STUserDescription currentUser];
      v14 = [v13 userDSID];
      v15 = [v12 predicateWithFormat:@"%K == %@ OR %K == %@", @"dsid", &unk_1F349ECE0, @"dsid", v14];
      [v11 setPredicate:v15];

      v16 = [v6 executeFetchRequest:v11 error:a4];
      v17 = v16;
      if (v16)
      {
        v18 = [v16 firstObject];
        if (!v18) {
          v18 = [[STCoreUser alloc] initWithContext:v6];
        }
        v19 = +[STLog screentime];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = [(STCoreUser *)v18 dsid];
          v21 = [v7 identifier];
          *(_DWORD *)buf = 136446722;
          v28 = "+[STUserDeviceState fetchOrCreateLocalUserDeviceStateInContext:error:]";
          __int16 v29 = 2112;
          v30 = v20;
          __int16 v31 = 2112;
          v32 = v21;
          _os_log_impl(&dword_1DA519000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s: Creating UserDeviceState for user: (%@), deviceIdentifier: (%@)", buf, 0x20u);
        }
        v22 = [[STUserDeviceState alloc] initWithContext:v6];
        [(STUserDeviceState *)v22 setUser:v18];
        [(STUserDeviceState *)v22 setLocalUser:v18];
        [(STUserDeviceState *)v22 setDevice:v7];
        [(STUserDeviceState *)v22 setLocalDevice:v7];
        v23 = [a1 _getCoreDuetIdentifier];
        if (v23)
        {
          v24 = [(STUserDeviceState *)v22 coreDuetIdentifier];
          char v25 = [v23 isEqual:v24];

          if ((v25 & 1) == 0) {
            [(STUserDeviceState *)v22 setCoreDuetIdentifier:v23];
          }
        }
        v10 = v22;
      }
      else
      {
        v10 = 0;
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)fetchLocalUserDeviceStateInContext:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = objc_msgSend(a1, "fetchRequestMatchingLocalUserDeviceState", a3);
  v7 = [v6 execute:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 firstObject];
    if (v9)
    {
      v10 = [a1 _getCoreDuetIdentifier];
      if (v10)
      {
        v11 = [v9 coreDuetIdentifier];
        char v12 = [v10 isEqual:v11];

        if ((v12 & 1) == 0) {
          [v9 setCoreDuetIdentifier:v10];
        }
      }
      id v13 = v9;
    }
    else if (a4)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18[0] = @"No local user device state found in the database";
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      *a4 = [v14 errorWithDomain:@"STErrorDomain" code:12 userInfo:v15];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_getCoreDuetIdentifier
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (+[STUserDeviceState isUnitTestRunning])
  {
    v2 = @"testCoreDuetIndentifier";
  }
  else
  {
    id v7 = 0;
    v2 = [MEMORY[0x1E4FB3678] getLocalDeviceIdentifierAndReturnError:&v7];
    id v3 = v7;
    objc_super v4 = +[STLog usage];
    v5 = v4;
    if (v2)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v9 = v2;
        _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "STUserDeviceState setting coreduetIdentifier %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      +[STUserDeviceState _getCoreDuetIdentifier];
    }
  }
  return v2;
}

- (void)didChangeValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"device"])
  {
    [(STUniquedManagedObject *)self updateUniqueIdentifier];
  }
  else if ([v4 isEqualToString:@"uniqueIdentifier"])
  {
    v5 = [(STUserDeviceState *)self installedApps];
    [v5 makeObjectsPerformSelector:sel_updateUniqueIdentifier];
  }
  v6.receiver = self;
  v6.super_class = (Class)STUserDeviceState;
  [(STUserDeviceState *)&v6 didChangeValueForKey:v4];
}

- (id)computeUniqueIdentifier
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() serializableClassName];
  v5 = [(STUserDeviceState *)self user];
  objc_super v6 = [v5 dsid];
  id v7 = [v6 stringValue];
  v8 = [(STUserDeviceState *)self device];
  v9 = [v8 identifier];
  uint64_t v10 = [v3 stringWithFormat:@"%@:%@:%@", v4, v7, v9];

  return v10;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"capabilitiesPlist"];
  [(STUserDeviceState *)self setCapabilitiesPlist:v5];

  objc_super v6 = [v4 objectForKeyedSubscript:@"coreDuetIdentifier"];
  [(STUserDeviceState *)self setCoreDuetIdentifier:v6];

  id v7 = [v4 objectForKeyedSubscript:@"deviceInfoPlist"];
  [(STUserDeviceState *)self setDeviceInfoPlist:v7];

  v8 = [v4 objectForKeyedSubscript:@"managementEnabled"];
  -[STUserDeviceState setManagementEnabled:](self, "setManagementEnabled:", [v8 BOOLValue]);

  v9 = [v4 objectForKeyedSubscript:@"passcodeOwner"];
  [(STUserDeviceState *)self setPasscodeOwner:v9];

  uint64_t v10 = [v4 objectForKeyedSubscript:@"screenTimeEnabled"];
  -[STUserDeviceState setScreenTimeEnabled:](self, "setScreenTimeEnabled:", [v10 BOOLValue]);

  v11 = [v4 objectForKeyedSubscript:@"lastFamilyCheckinDate"];
  [(STUserDeviceState *)self setLastFamilyCheckinDate:v11];

  char v12 = [v4 objectForKeyedSubscript:@"isLegacyUsageDisabled"];
  id v13 = v12;
  if (v12) {
    -[STUserDeviceState setIsLegacyUsageDisabled:](self, "setIsLegacyUsageDisabled:", [v12 BOOLValue]);
  }
  v14 = [v4 objectForKeyedSubscript:@"device"];
  v15 = [v14 objectForKeyedSubscript:@"name"];
  v16 = [v14 objectForKeyedSubscript:@"platform"];
  uint64_t v17 = [v4 objectForKeyedSubscript:@"fromCloud"];
  v18 = v17;
  if (v17)
  {
    int v19 = [v17 BOOLValue] ^ 1;
  }
  else
  {
    v20 = [(STUserDeviceState *)self user];
    int v19 = [v20 isManaged];
  }
  v21 = [(STUserDeviceState *)self device];
  [v21 setName:v15];
  if ([v21 platform])
  {
    if (!v19) {
      goto LABEL_41;
    }
  }
  else
  {
    objc_msgSend(v21, "setPlatform:", (__int16)objc_msgSend(v16, "integerValue"));
    if (!v19) {
      goto LABEL_41;
    }
  }
  uint64_t v22 = [v4 objectForKeyedSubscript:@"installedApps"];
  objc_opt_class();
  v72 = v4;
  v68 = v14;
  v69 = v13;
  v65 = v18;
  v66 = v16;
  v63 = (void *)v22;
  v64 = v21;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v22];
  }
  else
  {
    uint64_t v23 = objc_opt_new();
  }
  v24 = (void *)v23;
  v67 = v15;
  char v25 = [(STUserDeviceState *)self installedApps];
  v26 = [v25 valueForKeyPath:@"bundleIdentifier"];
  v27 = (void *)[v26 mutableCopy];

  v70 = v27;
  v28 = (void *)[v27 mutableCopy];
  v71 = v24;
  [v28 minusSet:v24];
  __int16 v29 = [(STUserDeviceState *)self installedApps];
  v62 = v28;
  v30 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"bundleIdentifier", v28];
  __int16 v31 = [v29 filteredSetUsingPredicate:v30];

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v31;
  uint64_t v32 = [obj countByEnumeratingWithState:&v82 objects:v92 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v83 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = *(void *)(*((void *)&v82 + 1) + 8 * i);
        v37 = +[STLog screentime];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v89 = "-[STUserDeviceState updateWithDictionaryRepresentation:]";
          __int16 v90 = 2112;
          uint64_t v91 = v36;
          _os_log_impl(&dword_1DA519000, v37, OS_LOG_TYPE_DEFAULT, "%{public}s: Deleting app (%@)", buf, 0x16u);
        }

        v38 = [(STUserDeviceState *)self managedObjectContext];
        [v38 deleteObject:v36];
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v82 objects:v92 count:16];
    }
    while (v33);
  }

  v39 = (void *)[v71 mutableCopy];
  [v39 minusSet:v70];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v40 = v39;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v78 objects:v87 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v79;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v79 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void *)(*((void *)&v78 + 1) + 8 * j);
        v46 = [STInstalledApp alloc];
        v47 = [(STUserDeviceState *)self managedObjectContext];
        v48 = [(STInstalledApp *)v46 initWithContext:v47];

        [(STInstalledApp *)v48 setBundleIdentifier:v45];
        [(STInstalledApp *)v48 setUserDeviceState:self];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v78 objects:v87 count:16];
    }
    while (v42);
  }

  v49 = [NSString stringWithFormat:@"%@.metadata", @"installedApps"];
  v50 = [v72 objectForKeyedSubscript:v49];

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v51 = [(STUserDeviceState *)self installedApps];
  uint64_t v52 = [v51 countByEnumeratingWithState:&v74 objects:v86 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v75;
    do
    {
      for (uint64_t k = 0; k != v53; ++k)
      {
        if (*(void *)v75 != v54) {
          objc_enumerationMutation(v51);
        }
        v56 = *(void **)(*((void *)&v74 + 1) + 8 * k);
        v57 = [v56 displayName];

        if (!v57)
        {
          v58 = [v56 bundleIdentifier];
          v59 = [v50 objectForKeyedSubscript:v58];

          v60 = [v59 objectForKeyedSubscript:@"displayName"];
          if (v60) {
            [v56 setDisplayName:v60];
          }
        }
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v74 objects:v86 count:16];
    }
    while (v53);
  }

  id v4 = v72;
  v14 = v68;
  id v13 = v69;
  v16 = v66;
  v15 = v67;
  v21 = v64;
  v18 = v65;
LABEL_41:

  return 1;
}

- (id)dictionaryRepresentation
{
  v55[3] = *MEMORY[0x1E4F143B8];
  v51.receiver = self;
  v51.super_class = (Class)STUserDeviceState;
  id v3 = [(STUniquedManagedObject *)&v51 dictionaryRepresentation];
  id v4 = [(STUserDeviceState *)self capabilitiesPlist];
  [v3 setObject:v4 forKeyedSubscript:@"capabilitiesPlist"];

  v5 = [(STUserDeviceState *)self coreDuetIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"coreDuetIdentifier"];

  objc_super v6 = objc_msgSend(NSNumber, "numberWithBool:", -[STUserDeviceState isLegacyUsageDisabled](self, "isLegacyUsageDisabled"));
  [v3 setObject:v6 forKeyedSubscript:@"isLegacyUsageDisabled"];

  id v7 = [(STUserDeviceState *)self deviceInfoPlist];
  [v3 setObject:v7 forKeyedSubscript:@"deviceInfoPlist"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[STUserDeviceState managementEnabled](self, "managementEnabled"));
  [v3 setObject:v8 forKeyedSubscript:@"managementEnabled"];

  v9 = [(STUserDeviceState *)self passcodeOwner];
  [v3 setObject:v9 forKeyedSubscript:@"passcodeOwner"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[STUserDeviceState screenTimeEnabled](self, "screenTimeEnabled"));
  [v3 setObject:v10 forKeyedSubscript:@"screenTimeEnabled"];

  v11 = [(STUserDeviceState *)self lastFamilyCheckinDate];
  [v3 setObject:v11 forKeyedSubscript:@"lastFamilyCheckinDate"];

  char v12 = [(STUserDeviceState *)self device];
  id v13 = v12;
  if (!v12)
  {
    v15 = +[STLog screentime];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      [(STUserDeviceState *)(uint64_t)self dictionaryRepresentation];
    }
    goto LABEL_7;
  }
  v14 = [v12 identifier];

  if (!v14)
  {
    v15 = +[STLog screentime];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      [(STUserDeviceState *)(uint64_t)self dictionaryRepresentation];
    }
LABEL_7:
  }
  v54[0] = @"identifier";
  v16 = [v13 identifier];
  v55[0] = v16;
  v54[1] = @"name";
  uint64_t v17 = [v13 name];
  v55[1] = v17;
  v54[2] = @"platform";
  v18 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v13, "platform"));
  v55[2] = v18;
  int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
  [v3 setObject:v19 forKeyedSubscript:@"device"];

  v20 = [(STUserDeviceState *)self user];
  v21 = [v20 dsid];
  [v3 setObject:v21 forKeyedSubscript:@"user"];

  if ((_os_feature_enabled_impl() & 1) != 0
    || ([(STUserDeviceState *)self user],
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        int v23 = [v22 isManaged],
        v22,
        v23))
  {
    uint64_t v45 = v13;
    uint64_t v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
    char v25 = [(STUserDeviceState *)self installedApps];
    v26 = [v25 valueForKeyPath:@"bundleIdentifier"];

    v44 = (void *)v24;
    uint64_t v53 = v24;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    v28 = [v26 sortedArrayUsingDescriptors:v27];
    v46 = v3;
    [v3 setObject:v28 forKeyedSubscript:@"installedApps"];

    uint64_t v43 = v26;
    __int16 v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v30 = [(STUserDeviceState *)self installedApps];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v48 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v36 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
          v37 = [v35 displayName];
          [v36 setObject:v37 forKeyedSubscript:@"displayName"];

          v38 = (void *)[v36 copy];
          v39 = [v35 bundleIdentifier];
          [v29 setObject:v38 forKeyedSubscript:v39];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v32);
    }

    id v40 = [NSString stringWithFormat:@"%@.metadata", @"installedApps"];
    id v3 = v46;
    [v46 setObject:v29 forKeyedSubscript:v40];

    id v13 = v45;
  }
  uint64_t v41 = (void *)[v3 copy];

  return v41;
}

+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 objectForKeyedSubscript:@"user"];
  v11 = [v9 objectForKeyedSubscript:@"device"];

  char v12 = [v11 objectForKeyedSubscript:@"identifier"];
  if ([v10 isEqualToNumber:&unk_1F349ECE0]) {
    +[STCoreUser fetchLocalUserInContext:v8 error:a5];
  }
  else {
  id v13 = +[STCoreUser fetchUserWithDSID:v10 inContext:v8 error:a5];
  }
  if (!v13)
  {
    v18 = 0;
    goto LABEL_14;
  }
  v14 = [a1 fetchRequest];
  v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ AND %K == %@", @"user", v13, @"device.identifier", v12];
  [v14 setPredicate:v15];

  v16 = [v14 execute:a5];
  uint64_t v17 = v16;
  if (!v14)
  {
LABEL_12:
    v18 = 0;
    goto LABEL_13;
  }
  v18 = [v16 firstObject];
  if (!v18)
  {
    uint64_t v19 = +[STCoreDevice fetchOrCreateDeviceWithIdentifier:v12 inContext:v8 error:a5];
    if (v19)
    {
      v20 = (void *)v19;
      v21 = [[STUsage alloc] initWithContext:v8];
      uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
      [(STUsage *)v21 setLastUpdatedDate:v22];

      [(STUsage *)v21 setDevice:v20];
      [(STUsage *)v21 setUser:v13];
      int v23 = +[STLog screentime];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [v13 dsid];
        v27 = v21;
        [v20 identifier];
        *(_DWORD *)buf = 136446722;
        __int16 v29 = "+[STUserDeviceState fetchOrCreateWithDictionaryRepresentation:inContext:error:]";
        __int16 v30 = 2112;
        uint64_t v31 = v26;
        uint64_t v33 = v32 = 2112;
        uint64_t v24 = (void *)v33;
        _os_log_impl(&dword_1DA519000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s: Creating UserDeviceState for user: (%@), deviceIdentifier: (%@)", buf, 0x20u);

        v21 = v27;
      }

      v18 = [[STUserDeviceState alloc] initWithContext:v8];
      [(STUserDeviceState *)v18 setUser:v13];
      [(STUserDeviceState *)v18 setDevice:v20];

      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_13:

LABEL_14:
  return v18;
}

+ (NSString)serializableClassName
{
  return (NSString *)@"uds";
}

+ (BOOL)isUnitTestRunning
{
  return NSClassFromString(&cfstr_Xctestprobe.isa) != 0;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)STUserDeviceState;
  if (!-[STUserDeviceState validateForUpdate:](&v12, sel_validateForUpdate_))
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STUserDeviceState validateForUpdate:]((uint64_t *)a3, v5);
    }
    BOOL v7 = 0;
    goto LABEL_16;
  }
  if (_os_feature_enabled_impl())
  {
    v5 = objc_opt_new();
    [(STUserDeviceState *)self _validateCoreDuetIdentifier:v5];
    [(STUserDeviceState *)self _validateNumberOfLocalUserDeviceStates:v5];
    objc_super v6 = [(STUserDeviceState *)self localUser];
    if (v6)
    {
    }
    else
    {
      id v8 = [(STUserDeviceState *)self localDevice];

      if (!v8)
      {
LABEL_11:
        if ([v5 count])
        {
          id v9 = +[STLog coreDataValidation];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            -[STUserDeviceState validateForUpdate:]();
          }
        }
        v11.receiver = self;
        v11.super_class = (Class)STUserDeviceState;
        BOOL v7 = [(NSManagedObject *)&v11 parseValidationErrors:a3 otherErrors:v5];
LABEL_16:

        return v7;
      }
    }
    [(STUserDeviceState *)self _validateLocalUserDeviceState:v5];
    goto LABEL_11;
  }
  return 1;
}

- (BOOL)validateForInsert:(id *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)STUserDeviceState;
  if (!-[STUserDeviceState validateForInsert:](&v12, sel_validateForInsert_)) {
    return 0;
  }
  if (!_os_feature_enabled_impl()) {
    return 1;
  }
  v5 = objc_opt_new();
  [(STUserDeviceState *)self _validateCoreDuetIdentifier:v5];
  [(STUserDeviceState *)self _validateNumberOfLocalUserDeviceStates:v5];
  objc_super v6 = [(STUserDeviceState *)self localUser];
  if (v6)
  {

LABEL_8:
    [(STUserDeviceState *)self _validateLocalUserDeviceState:v5];
    goto LABEL_9;
  }
  id v8 = [(STUserDeviceState *)self localDevice];

  if (v8) {
    goto LABEL_8;
  }
LABEL_9:
  if ([v5 count])
  {
    id v9 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[STUserDeviceState validateForInsert:]();
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)STUserDeviceState;
  BOOL v7 = [(NSManagedObject *)&v11 parseValidationErrors:a3 otherErrors:v5];

  return v7;
}

- (BOOL)validateForDelete:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STUserDeviceState;
  if (!-[STUserDeviceState validateForDelete:](&v10, sel_validateForDelete_)) {
    return 0;
  }
  if (!_os_feature_enabled_impl()) {
    return 1;
  }
  v5 = objc_opt_new();
  [(STUserDeviceState *)self _validateNumberOfLocalUserDeviceStates:v5];
  if ([v5 count])
  {
    objc_super v6 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[STUserDeviceState validateForDelete:]();
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)STUserDeviceState;
  BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];

  return v7;
}

- (BOOL)_validateLocalUserDeviceState:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(STUserDeviceState *)self device];
  objc_super v6 = [(STUserDeviceState *)self localDevice];

  BOOL v7 = (uint64_t *)MEMORY[0x1E4F28568];
  if (v5 != v6)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21[0] = @"The local device must match the device of the UserDeviceState.";
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    objc_super v10 = [v8 errorWithDomain:@"STErrorDomain" code:527 userInfo:v9];
    [v4 addObject:v10];
  }
  objc_super v11 = [(STUserDeviceState *)self user];
  objc_super v12 = [(STUserDeviceState *)self localUser];

  if (v11 != v12)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *v7;
    uint64_t v19 = @"The local user must match the user of the UserDeviceState.";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v15 = [v13 errorWithDomain:@"STErrorDomain" code:527 userInfo:v14];
    [v4 addObject:v15];
  }
  BOOL v16 = [v4 count] == 0;

  return v16;
}

- (BOOL)_validateNumberOfLocalUserDeviceStates:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[STUserDeviceState fetchRequest];
  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL OR %K != NULL", @"localUser", @"localDevice");
  [v4 setPredicate:v5];

  id v16 = 0;
  objc_super v6 = [v4 execute:&v16];
  id v7 = v16;
  if (!v6)
  {
    [v3 addObject:v7];
LABEL_9:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  if ((unint64_t)[v6 count] >= 2)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"There must be one and only local UserDeviceState.";
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    objc_super v10 = v8;
    uint64_t v11 = 529;
LABEL_8:
    v14 = [v10 errorWithDomain:@"STErrorDomain" code:v11 userInfo:v9];
    [v3 addObject:v14];

    goto LABEL_9;
  }
  if (![v6 count])
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v18 = @"There must be a local user device state.";
    objc_super v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    objc_super v10 = v13;
    uint64_t v11 = 528;
    goto LABEL_8;
  }
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

- (BOOL)_validateCoreDuetIdentifier:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = [(STUserDeviceState *)self device];
  int v7 = [v6 platform];
  if (v7 != 2)
  {
    id v3 = [(STUserDeviceState *)self device];
    if ([v3 platform] != 1)
    {

LABEL_8:
      BOOL v13 = 1;
      goto LABEL_9;
    }
  }
  id v8 = [(STUserDeviceState *)self coreDuetIdentifier];
  uint64_t v9 = [v8 length];

  if (v7 != 2) {
  if (v9)
  }
    goto LABEL_8;
  objc_super v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v15 = *MEMORY[0x1E4F28568];
  v16[0] = @"There must be a CoreDuet identifier for UserDeviceStates.";
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  BOOL v12 = [v10 errorWithDomain:@"STErrorDomain" code:530 userInfo:v11];
  [v5 addObject:v12];

  BOOL v13 = 0;
LABEL_9:

  return v13;
}

+ (void)_getCoreDuetIdentifier
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "STUserDeviceState failed to fetch coreduetIdentifier %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)dictionaryRepresentation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DA519000, a2, OS_LOG_TYPE_FAULT, "-[STUserDeviceState dictionaryRepresentation] called when device.identifier = nil : %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)validateForUpdate:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for update on UserDeviceState failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForUpdate:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 136446466;
  uint64_t v4 = "-[STUserDeviceState validateForUpdate:]";
  __int16 v5 = 2114;
  uint64_t v6 = v2;
  _os_log_fault_impl(&dword_1DA519000, a2, OS_LOG_TYPE_FAULT, "%{public}s Built-in CoreData Validation for update on UserDeviceState failed with: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)validateForInsert:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for insert on UserDeviceState failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForDelete:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1DA519000, v0, v1, "%{public}s Validate for delete on UserDeviceState failed with error: %{public}@", v2, v3, v4, v5, 2u);
}

@end