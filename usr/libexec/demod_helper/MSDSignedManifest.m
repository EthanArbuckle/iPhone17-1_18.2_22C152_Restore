@interface MSDSignedManifest
+ (MSDSignedManifest)signedManifest;
+ (id)appsPrefixForManifestVersion:(id)a3;
+ (id)getComponentFromPath:(id)a3 forManifestVersion:(id)a4;
+ (id)signedManifestFromManifestData:(id)a3;
+ (void)setSignedManifest:(id)a3;
- (BOOL)hasSystemContainerBackupInRange:(_NSRange)a3;
- (BOOL)isContainerizedComponent:(id)a3;
- (BOOL)isItemApp:(id)a3;
- (BOOL)isItemBackup:(id)a3;
- (BOOL)isItemBaseBackup:(id)a3;
- (BOOL)isItemConfigurationProfile:(id)a3;
- (BOOL)isItemConfigurationProfileBackup:(id)a3;
- (BOOL)isItemCriticalSytemPreferencesBackup:(id)a3;
- (BOOL)isItemDeviceSettings:(id)a3;
- (BOOL)isItemGreyMatterBackup:(id)a3;
- (BOOL)isItemProvisioningProfileBackup:(id)a3;
- (BOOL)isItemStandAlonePackage:(id)a3;
- (BOOL)isItemSystemAppData:(id)a3;
- (BOOL)isItemSystemContainerBackup:(id)a3;
- (BOOL)isPathUnderNonContainerizedContentRoot:(id)a3;
- (BOOL)parseBundleID:(id)a3;
- (BOOL)staggeredContentUpdateEnabled;
- (BOOL)validateInstallationOrder;
- (MSDDemoManifestCheck)manifestVerifier;
- (MSDSignedManifest)initWithManifestData:(id)a3;
- (NSArray)criticalComponents;
- (NSArray)installationOrder;
- (NSDictionary)getAppDataList;
- (NSDictionary)getAppList;
- (NSDictionary)getBackup;
- (NSDictionary)getBackupList;
- (NSDictionary)getGroupDataList;
- (NSDictionary)getInfo;
- (NSDictionary)getPlugInDataList;
- (NSDictionary)getSharedDataList;
- (NSDictionary)getSystemAppDataList;
- (NSDictionary)getUserDataList;
- (NSDictionary)payload;
- (NSSet)getAllFileHash;
- (NSString)bundleID;
- (NSString)getInstallationOrderAppsPrefix;
- (NSString)getInstallationOrderSystemApps;
- (NSString)getLocaleCode;
- (NSString)signingKey;
- (_NSRange)rangeOfGroupedBackups:(int64_t)a3;
- (id)allContentRootPaths;
- (id)appIdentifierFromOrderItem:(id)a3;
- (id)configurationProfileIdentifierFromOrderItem:(id)a3;
- (id)getAppDependecies:(id)a3;
- (id)getAppFileSize:(id)a3;
- (id)getAppManifest:(id)a3;
- (id)getAppPrivacyPermissions:(id)a3;
- (id)getAppRealSize:(id)a3;
- (id)getBackupSectionName;
- (id)getComponentDataList:(id)a3;
- (id)getComponentVersion:(id)a3;
- (id)getContainerTypeFromComponentName:(id)a3;
- (id)getDataComponentRealSizeFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getDataSectionKeys;
- (id)getDictFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getManifestFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getOriginServerFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getSettingsDataFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getSettingsInfoFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getStandAlonePackageFileSize:(id)a3;
- (id)getStandAlonePackageRealSize:(id)a3;
- (id)getStandAlonePackageVersion:(id)a3;
- (id)getSystemAppDependecies:(id)a3;
- (id)getSystemAppPrivacyPermissions:(id)a3;
- (id)itemAtIndexInManifest:(int64_t)a3;
- (id)mergedBackupManifest:(_NSRange)a3;
- (id)originServerForApp:(id)a3;
- (id)originServerForBackupManifest:(_NSRange)a3;
- (id)standAlonePackageIdentifierFromOrderItem:(id)a3;
- (int)getVersion;
- (int64_t)getAppType:(id)a3;
- (void)dealloc;
- (void)parseInstallationOrder;
- (void)setBundleID:(id)a3;
- (void)setCriticalComponents:(id)a3;
- (void)setInstallationOrder:(id)a3;
- (void)setManifestVerifier:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSigningKey:(id)a3;
- (void)setStaggeredContentUpdateEnabled:(BOOL)a3;
@end

@implementation MSDSignedManifest

+ (MSDSignedManifest)signedManifest
{
  return (MSDSignedManifest *)(id)qword_100057DC0;
}

+ (void)setSignedManifest:(id)a3
{
}

+ (id)signedManifestFromManifestData:(id)a3
{
  id v3 = a3;
  v4 = [[MSDSignedManifest alloc] initWithManifestData:v3];

  return v4;
}

- (MSDSignedManifest)initWithManifestData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v84.receiver = self;
  v84.super_class = (Class)MSDSignedManifest;
  v6 = [(MSDSignedManifest *)&v84 init];
  if (!v6)
  {
    v8 = 0;
    v14 = 0;
    v7 = 0;
    goto LABEL_12;
  }
  v7 = [v4 objectForKey:@"Version"];
  v8 = [v4 objectForKey:@"Info"];
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9 = sub_100027250();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002D7BC(v9, v36, v37, v38, v39, v40, v41, v42);
    }
    goto LABEL_63;
  }
  if (+[MSDPlatform iOSHub])
  {
    v9 = [v8 objectForKey:@"Product"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v51 = sub_100027250();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_10002D834(v51, v52, v53, v54, v55, v56, v57, v58);
      }

      goto LABEL_63;
    }
    v10 = +[MSDPlatform sharedInstance];
    [v10 setPlatformWithManifestProductList:v9];

    Class v11 = NSClassFromString(@"MSDHubTestConfiguration");
    if (v11)
    {
      v12 = [(objc_class *)v11 sharedInstance];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([v12 shouldRunManifestRigorousTest] & 1) == 0)
      {
        v16 = sub_100027250();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v88 = "-[MSDSignedManifest initWithManifestData:]";
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s - Will not run rigorous testing on iOS hub.", buf, 0xCu);
        }

        v13 = &__kCFBooleanFalse;
      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  v17 = +[MSDDemoManifestCheck sharedInstance];
  [(MSDSignedManifest *)v6 setManifestVerifier:v17];

  v18 = [(MSDSignedManifest *)v6 manifestVerifier];

  if (!v18)
  {
    v9 = sub_100027250();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002D8AC();
    }
LABEL_63:
    v14 = 0;
LABEL_75:
    v15 = 0;
    goto LABEL_51;
  }
  v19 = [(MSDSignedManifest *)v6 manifestVerifier];
  v20 = [(MSDSignedManifest *)v6 getDataSectionKeys];
  CFStringRef v85 = @"RigorousTestingOverride";
  v86 = v13;
  v21 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
  v14 = [v19 verifyManifestSignature:v4 forDataSectionKeys:v20 withOptions:v21];

  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = sub_100027250();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002DAE4(v9, v59, v60, v61, v62, v63, v64, v65);
      }
      goto LABEL_75;
    }
    v9 = [v14 objectForKey:@"InstallationOrder"];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v66 = sub_100027250();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            sub_10002DA6C(v66, v74, v75, v76, v77, v78, v79, v80);
          }
LABEL_74:

          goto LABEL_75;
        }
      }
      v83 = v8;
      v22 = [v14 objectForKey:@"Backup"];
      if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v43 = sub_100027250();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_10002D948(v43, v44, v45, v46, v47, v48, v49, v50);
        }

        v15 = 0;
        goto LABEL_79;
      }
      v81 = v7;
      v23 = [v14 objectForKey:@"App"];
      id v82 = v4;
      id v24 = v5;
      if (v23)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v33 = sub_100027250();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_10002D9F4(v33, v67, v68, v69, v70, v71, v72, v73);
          }
          goto LABEL_78;
        }
        v25 = (char *)[v23 count];
      }
      else
      {
        v25 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v26 = [v9 objectForKey:@"CriticalComponents"];

        if (v26)
        {
          v27 = [v9 objectForKey:@"CriticalComponents"];
          [v5 addObjectsFromArray:v27];
        }
        v28 = [v9 objectForKey:@"Components"];

        if (v28)
        {
          v29 = [v9 objectForKey:@"Components"];
          [v5 addObjectsFromArray:v29];
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v5 addObjectsFromArray:v9];
        }
      }
      unsigned int v30 = [v5 containsObject:@"systemappdata"];
      id v24 = v5;
      v31 = (char *)[v5 count];
      v32 = (char *)[v22 count];
      if (v30)
      {
        if (v31 != &v32[(void)v25 + 1])
        {
          v33 = sub_100027250();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            goto LABEL_77;
          }
          goto LABEL_78;
        }
      }
      else if (v31 != &v25[(void)v32])
      {
        v33 = sub_100027250();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
LABEL_77:
        }
          sub_10002D9C0();
LABEL_78:

        v15 = 0;
        id v5 = v24;
        v7 = v81;
        id v4 = v82;
LABEL_79:
        v8 = v83;
        goto LABEL_51;
      }

      v7 = v81;
      id v4 = v82;
      v8 = v83;
    }
    if ((int)[v7 intValue] > 4)
    {
      [(MSDSignedManifest *)v6 setSigningKey:@"MultipleContentSignings"];
    }
    else
    {
      v34 = [v4 objectForKey:@"SigningKey"];
      [(MSDSignedManifest *)v6 setSigningKey:v34];
    }
    [(MSDSignedManifest *)v6 setPayload:v14];
    [(MSDSignedManifest *)v6 parseInstallationOrder];
    if ([(MSDSignedManifest *)v6 validateInstallationOrder])
    {
      if ([(MSDSignedManifest *)v6 parseBundleID:v8])
      {
        +[MSDSignedManifest setSignedManifest:v6];
        v15 = v6;
LABEL_51:

        goto LABEL_52;
      }
      v66 = sub_100027250();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        sub_10002D8E0();
      }
    }
    else
    {
      v66 = sub_100027250();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        sub_10002D914();
      }
    }
    goto LABEL_74;
  }
LABEL_12:
  v15 = 0;
LABEL_52:

  return v15;
}

- (void)dealloc
{
  [(MSDSignedManifest *)self setPayload:0];
  v3.receiver = self;
  v3.super_class = (Class)MSDSignedManifest;
  [(MSDSignedManifest *)&v3 dealloc];
}

- (NSString)getInstallationOrderAppsPrefix
{
  return (NSString *)@"app.";
}

- (NSString)getInstallationOrderSystemApps
{
  return (NSString *)@"systemappdata";
}

- (int)getVersion
{
  v2 = [(MSDSignedManifest *)self payload];
  objc_super v3 = [v2 objectForKey:@"Version"];

  LODWORD(v2) = [v3 intValue];
  return (int)v2;
}

- (NSString)getLocaleCode
{
  return 0;
}

- (NSDictionary)getInfo
{
  v2 = [(MSDSignedManifest *)self payload];
  objc_super v3 = [v2 objectForKey:@"Info"];

  return (NSDictionary *)v3;
}

- (NSDictionary)getAppList
{
  v2 = [(MSDSignedManifest *)self payload];
  objc_super v3 = [v2 objectForKey:@"App"];

  return (NSDictionary *)v3;
}

- (NSDictionary)getAppDataList
{
  v2 = [(MSDSignedManifest *)self payload];
  objc_super v3 = [v2 objectForKey:@"AppData"];

  return (NSDictionary *)v3;
}

- (NSDictionary)getGroupDataList
{
  v2 = [(MSDSignedManifest *)self payload];
  objc_super v3 = [v2 objectForKey:@"GroupData"];

  return (NSDictionary *)v3;
}

- (NSDictionary)getPlugInDataList
{
  v2 = [(MSDSignedManifest *)self payload];
  objc_super v3 = [v2 objectForKey:@"ExtensionData"];

  return (NSDictionary *)v3;
}

- (id)getAppDependecies:(id)a3
{
  return 0;
}

- (id)getSystemAppDependecies:(id)a3
{
  return 0;
}

- (int64_t)getAppType:(id)a3
{
  return 3;
}

- (id)getAppFileSize:(id)a3
{
  return 0;
}

- (id)getAppRealSize:(id)a3
{
  return 0;
}

- (id)getStandAlonePackageFileSize:(id)a3
{
  return 0;
}

- (id)getStandAlonePackageRealSize:(id)a3
{
  return 0;
}

- (id)getDataComponentRealSizeFromSection:(id)a3 forIdentifier:(id)a4
{
  return 0;
}

- (NSDictionary)getSharedDataList
{
  return 0;
}

- (NSDictionary)getUserDataList
{
  return 0;
}

- (id)getComponentDataList:(id)a3
{
  return 0;
}

- (NSDictionary)getSystemAppDataList
{
  return 0;
}

- (NSSet)getAllFileHash
{
  return 0;
}

- (id)allContentRootPaths
{
  return 0;
}

- (BOOL)isPathUnderNonContainerizedContentRoot:(id)a3
{
  return 0;
}

- (id)getContainerTypeFromComponentName:(id)a3
{
  return 0;
}

- (id)getAppPrivacyPermissions:(id)a3
{
  return 0;
}

- (id)getSystemAppPrivacyPermissions:(id)a3
{
  return 0;
}

- (BOOL)isContainerizedComponent:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"AppData"] & 1) != 0
    || ([v3 isEqualToString:@"GroupData"] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:@"ExtensionData"];
  }

  return v4;
}

- (id)getSettingsDataFromSection:(id)a3 forIdentifier:(id)a4
{
  return 0;
}

- (id)getSettingsInfoFromSection:(id)a3 forIdentifier:(id)a4
{
  return 0;
}

- (id)getOriginServerFromSection:(id)a3 forIdentifier:(id)a4
{
  unsigned __int8 v4 = [(MSDSignedManifest *)self getDictFromSection:a3 forIdentifier:a4];
  id v5 = [v4 objectForKey:@"OriginServer"];

  return v5;
}

- (NSDictionary)getBackup
{
  if ([(MSDSignedManifest *)self getVersion] >= 5)
  {
    v6 = sub_100027250();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002DB5C();
    }

    unsigned __int8 v4 = 0;
  }
  else
  {
    id v3 = [(MSDSignedManifest *)self payload];
    unsigned __int8 v4 = [v3 objectForKey:@"Backup"];
  }

  return (NSDictionary *)v4;
}

- (NSDictionary)getBackupList
{
  if ([(MSDSignedManifest *)self getVersion] < 5)
  {
    id v3 = [(MSDSignedManifest *)self getBackup];
    +[NSDictionary dictionaryWithObject:v3 forKey:@"backup.BaseBackup"];
  }
  else
  {
    id v3 = [(MSDSignedManifest *)self payload];
    [v3 objectForKey:@"Backup"];
  unsigned __int8 v4 = };

  return (NSDictionary *)v4;
}

- (id)itemAtIndexInManifest:(int64_t)a3
{
  unsigned __int8 v4 = [(MSDSignedManifest *)self installationOrder];
  id v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (_NSRange)rangeOfGroupedBackups:(int64_t)a3
{
  [(MSDSignedManifest *)self getVersion];
  NSUInteger v4 = a3;
  NSUInteger v5 = 1;
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)mergedBackupManifest:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ([(MSDSignedManifest *)self getVersion] <= 4)
  {
    id v21 = [(MSDSignedManifest *)self getBackup];
    goto LABEL_19;
  }
  v6 = sub_100027250();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v25.NSUInteger location = location;
    v25.NSUInteger length = length;
    v7 = NSStringFromRange(v25);
    *(_DWORD *)buf = 138543362;
    v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Merging manifest item %{public}@", buf, 0xCu);
  }
  id v21 = +[NSMutableDictionary dictionary];
  v8 = [(MSDSignedManifest *)self installationOrder];
  if (location < location + length)
  {
    do
    {
      v9 = [v8 objectAtIndex:location];
      v10 = [(MSDSignedManifest *)self getBackupList];
      Class v11 = [v10 objectForKey:v9];

      v12 = [v11 objectForKey:@"Manifest"];
      v13 = v12;
      if (v12)
      {
        id v14 = v12;

        Class v11 = v14;
      }
      if ([(MSDSignedManifest *)self isItemSystemContainerBackup:v9])
      {
        v15 = +[MSDPlatform sharedInstance];
        unsigned int v16 = [v15 watchOS];

        v17 = sub_100027250();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (!v16)
        {
          if (v18)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "System container backup only allowed on Watch devices.", buf, 2u);
          }

          goto LABEL_17;
        }
        if (v18)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "System container backup found. Start restoring UUID paths...", buf, 2u);
        }

        uint64_t v19 = +[NSString restoreSystemContainerUUIDPathsInDict:v11];

        Class v11 = (void *)v19;
      }
      [v21 addEntriesFromDictionary:v11];
LABEL_17:

      ++location;
      --length;
    }
    while (length);
  }

LABEL_19:

  return v21;
}

- (BOOL)hasSystemContainerBackupInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ([(MSDSignedManifest *)self getVersion] < 5) {
    return 0;
  }
  v6 = +[MSDPlatform sharedInstance];
  unsigned int v7 = [v6 watchOS];

  if (!v7) {
    return 0;
  }
  v8 = [(MSDSignedManifest *)self installationOrder];
  v9 = v8;
  NSUInteger v10 = location + length;
  if (location >= location + length)
  {
    BOOL v13 = 0;
  }
  else
  {
    Class v11 = [v8 objectAtIndex:location];
    unsigned __int8 v12 = [v11 isEqualToString:@"backup.SystemContainer"];

    if (v12)
    {
      BOOL v13 = 1;
    }
    else
    {
      NSUInteger v14 = location + 1;
      NSUInteger v15 = length - 1;
      do
      {
        NSUInteger v16 = v14;
        if (!v15) {
          break;
        }
        v17 = [v9 objectAtIndex:v14];
        unsigned int v18 = [v17 isEqualToString:@"backup.SystemContainer"];

        NSUInteger v14 = v16 + 1;
        --v15;
      }
      while (!v18);
      BOOL v13 = v16 < v10;
    }
  }

  return v13;
}

- (id)originServerForBackupManifest:(_NSRange)a3
{
  NSUInteger location = a3.location;
  if ([(MSDSignedManifest *)self getVersion] >= 5)
  {
    v6 = [(MSDSignedManifest *)self installationOrder];
    unsigned int v7 = [v6 objectAtIndex:location];

    v8 = [(MSDSignedManifest *)self getBackupList];
    v9 = [v8 objectForKey:v7];

    NSUInteger v5 = [v9 objectForKey:@"OriginServer"];
  }
  else
  {
    NSUInteger v5 = 0;
  }

  return v5;
}

- (id)originServerForApp:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(MSDSignedManifest *)self getAppList];
  v6 = [v5 objectForKey:v4];

  if (v6)
  {
    unsigned int v7 = [v5 objectForKey:v4];
    v6 = [v7 objectForKey:@"OriginServer"];
  }

  return v6;
}

- (BOOL)isItemBackup:(id)a3
{
  return [a3 hasPrefix:@"backup."];
}

- (BOOL)isItemBaseBackup:(id)a3
{
  return [a3 hasPrefix:@"backup.BaseBackup"];
}

- (BOOL)isItemGreyMatterBackup:(id)a3
{
  return 0;
}

- (BOOL)isItemSystemContainerBackup:(id)a3
{
  return [a3 hasPrefix:@"backup.SystemContainer"];
}

- (BOOL)isItemProvisioningProfileBackup:(id)a3
{
  return [a3 hasPrefix:@"backup.ProvisioningProfile"];
}

- (BOOL)isItemConfigurationProfileBackup:(id)a3
{
  return 0;
}

- (BOOL)isItemCriticalSytemPreferencesBackup:(id)a3
{
  return 0;
}

- (BOOL)isItemSystemAppData:(id)a3
{
  return [a3 hasPrefix:@"systemappdata"];
}

- (BOOL)isItemApp:(id)a3
{
  return [a3 hasPrefix:@"app."];
}

- (BOOL)isItemStandAlonePackage:(id)a3
{
  return 0;
}

- (BOOL)isItemConfigurationProfile:(id)a3
{
  return 0;
}

- (BOOL)isItemDeviceSettings:(id)a3
{
  return 0;
}

- (id)appIdentifierFromOrderItem:(id)a3
{
  id v4 = a3;
  if ([(MSDSignedManifest *)self isItemApp:v4])
  {
    NSUInteger v5 = [v4 substringFromIndex:[@"app." length]];
  }
  else
  {
    NSUInteger v5 = 0;
  }

  return v5;
}

- (id)standAlonePackageIdentifierFromOrderItem:(id)a3
{
  return 0;
}

- (id)configurationProfileIdentifierFromOrderItem:(id)a3
{
  return 0;
}

+ (id)appsPrefixForManifestVersion:(id)a3
{
  unsigned int v3 = [a3 intValue];
  CFStringRef v4 = @"/Apps/";
  if (v3 != 7) {
    CFStringRef v4 = 0;
  }
  if (v3 == 6) {
    return @"app.";
  }
  else {
    return (id)v4;
  }
}

+ (id)getComponentFromPath:(id)a3 forManifestVersion:(id)a4
{
  id v5 = a3;
  unsigned int v6 = [a4 intValue];
  if (v6 != 7)
  {
    if (v6 != 6) {
      goto LABEL_19;
    }
    if ([v5 hasPrefix:@"app."])
    {
      unsigned int v7 = @"app.";
LABEL_15:
      uint64_t v8 = (uint64_t)[(__CFString *)v7 length];
      v9 = v5;
LABEL_16:
      id v10 = [v9 substringFromIndex:v8];
      goto LABEL_20;
    }
    if ([v5 hasPrefix:@"backup."])
    {
      unsigned int v7 = @"backup.";
      goto LABEL_15;
    }
  }
  if ([v5 hasPrefix:@"/Apps/"])
  {
    unsigned int v7 = @"/Apps/";
    goto LABEL_15;
  }
  if ([v5 hasPrefix:@"/BackupData/"])
  {
    unsigned int v7 = @"/BackupData/";
    goto LABEL_15;
  }
  if ([v5 hasPrefix:@"/Packages/"])
  {
    unsigned int v7 = @"/Packages/";
    goto LABEL_15;
  }
  if ([v5 hasPrefix:@"/ConfigurationProfiles/"])
  {
    unsigned int v7 = @"/ConfigurationProfiles/";
    goto LABEL_15;
  }
  if ([v5 hasPrefix:@"/SystemApps"])
  {
    v9 = v5;
    uint64_t v8 = 1;
    goto LABEL_16;
  }
LABEL_19:
  id v10 = v5;
LABEL_20:
  Class v11 = v10;

  return v11;
}

- (id)getComponentVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDSignedManifest *)self getAppList];
  unsigned int v6 = [v5 objectForKey:v4];

  unsigned int v7 = [v6 objectForKey:@"Manifest"];
  uint64_t v8 = [v7 objectForKey:@"CFBundleShortVersionString"];

  v9 = sub_100027250();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v4;
    __int16 v13 = 2114;
    NSUInteger v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "appName:%{public}@ componentVersion:%{public}@", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (id)getAppManifest:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDSignedManifest *)self getAppList];
  unsigned int v6 = [v5 objectForKey:v4];

  unsigned int v7 = [v6 objectForKey:@"Manifest"];

  return v7;
}

- (id)getBackupSectionName
{
  return @"Backup";
}

- (id)getStandAlonePackageVersion:(id)a3
{
  unsigned int v3 = sub_100027250();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    unsigned int v6 = "-[MSDSignedManifest getStandAlonePackageVersion:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s - getStandAlonePackageVersion is applicable to manifest V7 only.", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (id)getDataSectionKeys
{
  return +[NSSet setWithArray:&off_1000520A0];
}

- (void)parseInstallationOrder
{
  id v7 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v3 = [(MSDSignedManifest *)self payload];
  id v4 = [v3 objectForKey:@"InstallationOrder"];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = [v4 objectForKey:@"CriticalComponents"];
      unsigned int v6 = [v4 objectForKey:@"Components"];
      if (v5)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v7 addObjectsFromArray:v5];
          [(MSDSignedManifest *)self setStaggeredContentUpdateEnabled:1];
          [(MSDSignedManifest *)self setCriticalComponents:v5];
        }
      }
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v7 addObjectsFromArray:v6];
        }
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_13;
      }
      int v5 = v7;
      id v7 = [v4 mutableCopy];
    }
  }
LABEL_13:
  [(MSDSignedManifest *)self setInstallationOrder:v7];
}

- (BOOL)validateInstallationOrder
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(MSDSignedManifest *)self installationOrder];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v2 = v5;
    char v6 = 0;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ([(MSDSignedManifest *)self isItemProvisioningProfileBackup:v9]
          || [(MSDSignedManifest *)self isItemBaseBackup:v9])
        {
          char v6 = 1;
        }
        else if ([(MSDSignedManifest *)self isItemApp:v9])
        {
          if (v6)
          {
            char v10 = 0;
            LOBYTE(v2) = 1;
          }
          else
          {
            int v11 = sub_100027250();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)__int16 v13 = 0;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cannot place app before provisioning profile or base backup.", v13, 2u);
            }

            LOBYTE(v2) = 0;
            char v10 = 0;
          }
          goto LABEL_18;
        }
      }
      id v2 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
  char v10 = 1;
LABEL_18:

  return (v2 | v10) & 1;
}

- (id)getDictFromSection:(id)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(MSDSignedManifest *)self payload];
  uint64_t v9 = [v8 objectForKey:v7];

  char v10 = [v9 objectForKey:v6];

  return v10;
}

- (id)getManifestFromSection:(id)a3 forIdentifier:(id)a4
{
  id v4 = [(MSDSignedManifest *)self getDictFromSection:a3 forIdentifier:a4];
  id v5 = [v4 objectForKey:@"Manifest"];

  return v5;
}

- (BOOL)parseBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"PartNumber"];
  id v6 = [v4 objectForKey:@"Revision"];

  if (!v5)
  {
    char v10 = sub_100027250();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002DB90(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_9;
  }
  if (!v6)
  {
    char v10 = sub_100027250();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002DC08(v10, v18, v19, v20, v21, v22, v23, v24);
    }
LABEL_9:

    BOOL v8 = 0;
    goto LABEL_4;
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%d", v5, [v6 intValue]);
  [(MSDSignedManifest *)self setBundleID:v7];

  BOOL v8 = 1;
LABEL_4:

  return v8;
}

- (NSString)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSArray)installationOrder
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInstallationOrder:(id)a3
{
}

- (NSArray)criticalComponents
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCriticalComponents:(id)a3
{
}

- (NSDictionary)payload
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPayload:(id)a3
{
}

- (MSDDemoManifestCheck)manifestVerifier
{
  return (MSDDemoManifestCheck *)objc_getProperty(self, a2, 56, 1);
}

- (void)setManifestVerifier:(id)a3
{
}

- (BOOL)staggeredContentUpdateEnabled
{
  return self->_staggeredContentUpdateEnabled;
}

- (void)setStaggeredContentUpdateEnabled:(BOOL)a3
{
  self->_staggeredContentUpdateEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestVerifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_criticalComponents, 0);
  objc_storeStrong((id *)&self->_installationOrder, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_signingKey, 0);
}

@end