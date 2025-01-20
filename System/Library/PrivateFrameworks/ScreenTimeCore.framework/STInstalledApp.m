@interface STInstalledApp
+ (NSString)serializableClassName;
+ (id)bundleIdentifiersInstalledForAltDSID:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)bundleIdentifiersInstalledForDSID:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)bundleIdentifiersInstalledForPredicate:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)fetchRequest;
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (NSString)description;
- (id)computeUniqueIdentifier;
- (id)dictionaryRepresentation;
- (void)didChangeValueForKey:(id)a3;
- (void)setUserDeviceState:(id)a3;
- (void)updateIconDataWithURL:(id)a3;
@end

@implementation STInstalledApp

+ (id)bundleIdentifiersInstalledForDSID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 longLongValue]) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"userDeviceState.user.dsid", v7];
  }
  else {
  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"userDeviceState.user.localUserDeviceState", v12);
  }
  v10 = +[STInstalledApp bundleIdentifiersInstalledForPredicate:v9 inContext:v8 error:a5];

  return v10;
}

+ (id)bundleIdentifiersInstalledForAltDSID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 length]) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"userDeviceState.user.altDSID", v7];
  }
  else {
  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"userDeviceState.user.localUserDeviceState", v12);
  }
  v10 = +[STInstalledApp bundleIdentifiersInstalledForPredicate:v9 inContext:v8 error:a5];

  return v10;
}

+ (id)bundleIdentifiersInstalledForPredicate:(id)a3 inContext:(id)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[STInstalledApp fetchRequest];
  [v7 setResultType:2];
  [v7 setReturnsDistinctResults:1];
  v17[0] = @"bundleIdentifier";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v7 setPropertiesToFetch:v8];

  [v7 setPredicate:v6];
  id v16 = 0;
  v9 = [v7 execute:&v16];
  id v10 = v16;
  v11 = v10;
  if (v9)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    v13 = [v9 valueForKey:@"bundleIdentifier"];
    v14 = [v12 setWithArray:v13];
  }
  else
  {
    v14 = 0;
    if (a5 && v10)
    {
      v14 = 0;
      *a5 = v10;
    }
  }

  return v14;
}

- (void)setUserDeviceState:(id)a3
{
  id v5 = a3;
  v4 = [v5 localDevice];
  [(STInstalledApp *)self setInstalledLocally:v4 != 0];

  [(STInstalledApp *)self managedObjectOriginal_setUserDeviceState:v5];
}

+ (id)fetchRequest
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___STInstalledApp;
  v2 = objc_msgSendSuper2(&v4, sel_fetchRequest);
  return v2;
}

- (void)didChangeValueForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"bundleIdentifier"] & 1) != 0
    || [v4 isEqualToString:@"userDeviceState"])
  {
    [(STUniquedManagedObject *)self updateUniqueIdentifier];
  }
  v5.receiver = self;
  v5.super_class = (Class)STInstalledApp;
  [(STInstalledApp *)&v5 didChangeValueForKey:v4];
}

- (id)computeUniqueIdentifier
{
  v3 = NSString;
  id v4 = [(id)objc_opt_class() serializableClassName];
  objc_super v5 = [(STInstalledApp *)self bundleIdentifier];
  id v6 = [(STInstalledApp *)self userDeviceState];
  id v7 = [v6 uniqueIdentifier];
  id v8 = [v3 stringWithFormat:@"%@:%@-%@", v4, v5, v7];

  return v8;
}

- (id)dictionaryRepresentation
{
  v18.receiver = self;
  v18.super_class = (Class)STInstalledApp;
  v3 = [(STUniquedManagedObject *)&v18 dictionaryRepresentation];
  id v4 = [(STInstalledApp *)self adamID];
  [v3 setObject:v4 forKeyedSubscript:@"adamID"];

  objc_super v5 = [(STInstalledApp *)self betaVersionIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"betaVersionIdentifier"];

  id v6 = [(STInstalledApp *)self bundleIdentifier];
  [v3 setObject:v6 forKeyedSubscript:@"bundleIdentifier"];

  id v7 = [(STInstalledApp *)self displayName];
  [v3 setObject:v7 forKeyedSubscript:@"displayName"];

  id v8 = [(STInstalledApp *)self distributorID];
  [v3 setObject:v8 forKeyedSubscript:@"distributorID"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[STInstalledApp distributorIsThirdParty](self, "distributorIsThirdParty"));
  [v3 setObject:v9 forKeyedSubscript:@"distributorIsThirdParty"];

  id v10 = [(STInstalledApp *)self iconData];
  [v3 setObject:v10 forKeyedSubscript:@"iconData"];

  v11 = [(STInstalledApp *)self versionIdentifier];
  [v3 setObject:v11 forKeyedSubscript:@"versionIdentifier"];

  uint64_t v12 = [(STInstalledApp *)self userDeviceState];
  v13 = [v12 uniqueIdentifier];

  if (v13)
  {
    v14 = [(STInstalledApp *)self userDeviceState];
    v15 = [v14 uniqueIdentifier];
    [v3 setObject:v15 forKeyedSubscript:@"userDeviceState"];
  }
  id v16 = (void *)[v3 copy];

  return v16;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 objectForKeyedSubscript:@"adamID"];
  [(STInstalledApp *)self setAdamID:v5];

  id v6 = [v4 objectForKeyedSubscript:@"betaVersionIdentifier"];
  [(STInstalledApp *)self setBetaVersionIdentifier:v6];

  id v7 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
  [(STInstalledApp *)self setBundleIdentifier:v7];

  id v8 = [v4 objectForKeyedSubscript:@"versionIdentifier"];
  [(STInstalledApp *)self setVersionIdentifier:v8];

  v9 = [v4 objectForKeyedSubscript:@"distributorIsThirdParty"];
  -[STInstalledApp setDistributorIsThirdParty:](self, "setDistributorIsThirdParty:", [v9 BOOLValue]);

  id v10 = [v4 objectForKeyedSubscript:@"displayName"];
  if (v10) {
    [(STInstalledApp *)self setDisplayName:v10];
  }
  v11 = [v4 objectForKeyedSubscript:@"distributorID"];
  if (v11) {
    [(STInstalledApp *)self setDistributorID:v11];
  }
  uint64_t v12 = [v4 objectForKeyedSubscript:@"iconData"];
  if (v12) {
    [(STInstalledApp *)self setIconData:v12];
  }
  v13 = [v4 objectForKeyedSubscript:@"userDeviceState"];
  if (v13)
  {
    v14 = +[STUserDeviceState fetchRequest];
    v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uniqueIdentifier", v13];
    [v14 setPredicate:v15];

    id v26 = 0;
    id v16 = [v14 execute:&v26];
    id v17 = v26;
    objc_super v18 = [v16 firstObject];
    [(STInstalledApp *)self setUserDeviceState:v18];
  }
  else
  {
    [(STInstalledApp *)self setUserDeviceState:0];
    id v17 = 0;
  }
  v19 = [(STInstalledApp *)self userDeviceState];

  if (v19)
  {
    char v20 = 1;
  }
  else
  {
    uint64_t v21 = _os_feature_enabled_impl();
    v22 = +[STLog appMonitor];
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23) {
        -[STInstalledApp updateWithDictionaryRepresentation:](self);
      }
    }
    else
    {
      if (v23) {
        -[STInstalledApp updateWithDictionaryRepresentation:](self);
      }

      v24 = +[STLog screentime];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v28 = "-[STInstalledApp updateWithDictionaryRepresentation:]";
        __int16 v29 = 2112;
        v30 = self;
        _os_log_impl(&dword_1DA519000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s: Deleting installed app (%@)", buf, 0x16u);
      }

      v22 = [(STInstalledApp *)self managedObjectContext];
      [v22 deleteObject:self];
    }
    char v20 = v21 ^ 1;
  }
  return v20;
}

- (NSString)description
{
  v2 = [(STInstalledApp *)self dictionaryRepresentation];
  v3 = [v2 description];

  return (NSString *)v3;
}

+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a3 objectForKeyedSubscript:@"uniqueIdentifier"];
  id v10 = [a1 fetchRequest];
  v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uniqueIdentifier", v9];
  [v10 setPredicate:v11];

  uint64_t v12 = [v10 execute:a5];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 firstObject];
    if (!v14) {
      v14 = [[STInstalledApp alloc] initWithContext:v8];
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (NSString)serializableClassName
{
  return (NSString *)@"app";
}

- (void)updateIconDataWithURL:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  MGGetFloat32Answer();
  float v6 = v5;
  double v7 = v5;
  double v8 = 87.0 / v5;
  uint64_t v23 = 29 * (uint64_t)v5;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithURL:v4];

  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v8, v8, v7);
  v26[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v9 prepareImagesForImageDescriptors:v11];

  uint64_t v12 = [v9 imageForDescriptor:v10];
  v13 = (CGImage *)[v12 CGImage];
  v14 = (__CFData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:4096];
  v15 = [(id)*MEMORY[0x1E4F44460] identifier];
  id v16 = CGImageDestinationCreateWithData(v14, v15, 1uLL, 0);

  float valuePtr = v6 * 72.0;
  CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFNumberRef v18 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloatType, &valuePtr);
  CFNumberRef v19 = CFNumberCreate(v17, kCFNumberLongType, &v23);
  char v20 = (void *)*MEMORY[0x1E4F2F6A8];
  keys[0] = *(void **)MEMORY[0x1E4F2F6B0];
  keys[1] = v20;
  keys[2] = *(void **)MEMORY[0x1E4F2F428];
  values[0] = v18;
  values[1] = v18;
  values[2] = v19;
  CFDictionaryRef v21 = CFDictionaryCreate(v17, (const void **)keys, (const void **)values, 3, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  CFRelease(v18);
  CFRelease(v19);
  CGImageDestinationAddImage(v16, v13, v21);
  CFRelease(v21);
  CGImageDestinationFinalize(v16);
  [(STInstalledApp *)self setIconData:v14];
  CFRelease(v16);
}

- (void)updateWithDictionaryRepresentation:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_1DA519000, v2, v3, "InstalledApp %@ without a UserDeviceState: %{public}@", v4, v5, v6, v7, v8);
}

- (void)updateWithDictionaryRepresentation:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_4(&dword_1DA519000, v2, v3, "Deleted orphaned InstalledApp %@ without a UserDeviceState: %{public}@", v4, v5, v6, v7, v8);
}

@end