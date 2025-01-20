@interface MSDSignedManifestV7
+ (id)signedManifestFromManifestData:(id)a3;
- (BOOL)checkPlatformTypeForAllComponents;
- (BOOL)hasSystemContainerBackupInRange:(_NSRange)a3;
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
- (MSDSignedManifestV7)initWithManifestData:(id)a3;
- (NSSet)nonContainerizedContentRoots;
- (NSString)localeCodeStr;
- (id)appIdentifierFromOrderItem:(id)a3;
- (id)configurationProfileIdentifierFromOrderItem:(id)a3;
- (id)getAllFileHash;
- (id)getAppDependecies:(id)a3;
- (id)getAppFileSize:(id)a3;
- (id)getAppList;
- (id)getAppManifest:(id)a3;
- (id)getAppPrivacyPermissions:(id)a3;
- (id)getAppRealSize:(id)a3;
- (id)getBackupList;
- (id)getBackupSectionName;
- (id)getComponentDataList:(id)a3;
- (id)getComponentVersion:(id)a3;
- (id)getContainerTypeFromComponentName:(id)a3;
- (id)getDataComponentRealSizeFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getDataSectionKeys;
- (id)getInstallationOrderAppsPrefix;
- (id)getInstallationOrderSystemApps;
- (id)getLocaleCode;
- (id)getManifestDataFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getManifestInfoFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getSettingsDataFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getSettingsFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getSettingsInfoFromSection:(id)a3 forIdentifier:(id)a4;
- (id)getSharedDataList;
- (id)getStandAlonePackageFileSize:(id)a3;
- (id)getStandAlonePackageList;
- (id)getStandAlonePackageRealSize:(id)a3;
- (id)getStandAlonePackageVersion:(id)a3;
- (id)getSystemAppDataList;
- (id)getSystemAppDependecies:(id)a3;
- (id)getSystemAppPrivacyPermissions:(id)a3;
- (id)getUserDataList;
- (id)mergedBackupManifest:(_NSRange)a3;
- (id)originServerForBackupManifest:(_NSRange)a3;
- (id)parseAllFileHash;
- (id)parseSectionForContentRoot:(id)a3;
- (id)standAlonePackageIdentifierFromOrderItem:(id)a3;
- (int64_t)getAppType:(id)a3;
- (void)parseLocaleCode;
- (void)parseNonContainerizedContentRootSet;
- (void)setLocaleCodeStr:(id)a3;
- (void)setNonContainerizedContentRoots:(id)a3;
@end

@implementation MSDSignedManifestV7

+ (id)signedManifestFromManifestData:(id)a3
{
  id v3 = a3;
  v4 = [[MSDSignedManifestV7 alloc] initWithManifestData:v3];

  return v4;
}

- (MSDSignedManifestV7)initWithManifestData:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v119.receiver = self;
  v119.super_class = (Class)MSDSignedManifestV7;
  v6 = [(MSDSignedManifestV7 *)&v119 init];
  if (!v6)
  {
    v7 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_12;
  }
  v7 = [v4 objectForKey:@"Info"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v8 = sub_100027250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002B264(v8, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_95;
  }
  if (+[MSDPlatform iOSHub])
  {
    v8 = [v7 objectForKey:@"Product"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v56 = sub_100027250();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_10002B2DC(v56, v57, v58, v59, v60, v61, v62, v63);
      }

      goto LABEL_95;
    }
    v9 = +[MSDPlatform sharedInstance];
    [v9 setPlatformWithManifestProductList:v8];

    Class v10 = NSClassFromString(@"MSDHubTestConfiguration");
    if (v10)
    {
      v11 = [(objc_class *)v10 sharedInstance];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([v11 shouldRunManifestRigorousTest] & 1) == 0)
      {
        v16 = sub_100027250();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v121 = "-[MSDSignedManifestV7 initWithManifestData:]";
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s - Will not run rigorous testing on iOS hub.", buf, 0xCu);
        }

        v12 = &__kCFBooleanFalse;
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  v17 = [(MSDSignedManifest *)v6 manifestVerifier];

  if (!v17)
  {
    v18 = +[MSDDemoManifestCheck sharedInstance];
    [(MSDSignedManifest *)v6 setManifestVerifier:v18];

    v19 = [(MSDSignedManifest *)v6 manifestVerifier];

    if (!v19)
    {
      v8 = sub_100027250();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10002B354(v8, v105, v106, v107, v108, v109, v110, v111);
      }
LABEL_95:
      v13 = 0;
      v14 = 0;
      goto LABEL_96;
    }
  }
  v14 = [v4 objectForKey:@"Version"];
  if (v12) {
    [v5 setObject:v12 forKey:@"RigorousTestingOverride"];
  }
  v20 = [(MSDSignedManifest *)v6 manifestVerifier];
  v21 = [(MSDSignedManifestV7 *)v6 getDataSectionKeys];
  v8 = [v20 verifyManifestSignature:v4 forDataSectionKeys:v21 withOptions:v5];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v118 = v14;
      v22 = [v8 objectForKey:@"InstallationOrder"];
      if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v23 = [v22 objectForKey:@"CriticalComponents"];
        v117 = v23;
        if (v23) {
          v24 = (char *)[v23 count];
        }
        else {
          v24 = 0;
        }
        v25 = [v22 objectForKey:@"Components"];
        v26 = v25;
        if (v25) {
          v24 = &v24[(void)[v25 count]];
        }
        v27 = [v8 objectForKey:@"BackupData"];
        if (v27)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v115 = v26;
            v116 = v5;
            v28 = (char *)[v27 count];
            v13 = [v8 objectForKey:@"Apps"];
            v114 = v27;
            if (v13)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v73 = sub_100027250();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                  sub_10002B6F0(v73, v74, v75, v76, v77, v78, v79, v80);
                }

                goto LABEL_87;
              }
              v28 = &v28[(void)[v13 count]];
            }
            v29 = [v8 objectForKey:@"SystemApps"];
            if (v29)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v81 = sub_100027250();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
                  sub_10002B678(v81, v82, v83, v84, v85, v86, v87, v88);
                }

LABEL_86:
LABEL_87:
                v15 = 0;
LABEL_92:
                v5 = v116;
                goto LABEL_52;
              }
              if ([v29 count]) {
                ++v28;
              }
            }
            v30 = [v8 objectForKey:@"Packages"];
            id v113 = v4;
            if (!v30) {
              goto LABEL_45;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v28 = &v28[(void)[v30 count]];
LABEL_45:
              v31 = [v8 objectForKey:@"ConfigurationProfiles"];
              if (v31)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v97 = sub_100027250();
                  if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
                    sub_10002B588(v97, v98, v99, v100, v101, v102, v103, v104);
                  }

LABEL_91:
                  v15 = 0;
                  id v4 = v113;
                  goto LABEL_92;
                }
                v28 = &v28[(void)[v31 count]];
              }
              if (v24 == v28)
              {
                [(MSDSignedManifest *)v6 setSigningKey:@"MultipleContentSignings"];
                [(MSDSignedManifest *)v6 setPayload:v8];
                v5 = v116;
                if ([(MSDSignedManifestV7 *)v6 checkPlatformTypeForAllComponents])
                {
                  [(MSDSignedManifestV7 *)v6 parseNonContainerizedContentRootSet];
                  [(MSDSignedManifest *)v6 parseInstallationOrder];
                  [(MSDSignedManifest *)v6 parseBundleID:v7];
                  [(MSDSignedManifestV7 *)v6 parseLocaleCode];
                  +[MSDSignedManifest setSignedManifest:v6];
                  v15 = v6;
                }
                else
                {
                  v72 = sub_100027250();
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
                    sub_10002B4BC(v72);
                  }

                  v15 = 0;
                }
                id v4 = v113;
                goto LABEL_52;
              }
              v112 = sub_100027250();
              if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
                sub_10002B500((uint64_t)v24, (uint64_t)v28, v112);
              }

              goto LABEL_91;
            }
            v89 = sub_100027250();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
              sub_10002B600(v89, v90, v91, v92, v93, v94, v95, v96);
            }

            goto LABEL_86;
          }
        }
        v48 = sub_100027250();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_10002B444(v48, v49, v50, v51, v52, v53, v54, v55);
        }
      }
      else
      {
        v40 = sub_100027250();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_10002B3CC(v40, v41, v42, v43, v44, v45, v46, v47);
        }
      }
      v13 = 0;
      v15 = 0;
LABEL_52:
      v14 = v118;
LABEL_53:

      goto LABEL_54;
    }
    v64 = sub_100027250();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      sub_10002B768(v64, v65, v66, v67, v68, v69, v70, v71);
    }

    v13 = 0;
LABEL_96:
    v15 = 0;
    goto LABEL_53;
  }
  v13 = 0;
LABEL_12:
  v15 = 0;
LABEL_54:

  return v15;
}

- (BOOL)isItemBackup:(id)a3
{
  return [a3 hasPrefix:@"/BackupData/"];
}

- (BOOL)isItemBaseBackup:(id)a3
{
  return [a3 hasPrefix:@"/BackupData/baseBackup"];
}

- (BOOL)isItemGreyMatterBackup:(id)a3
{
  return [a3 hasPrefix:@"/BackupData/greyMatter"];
}

- (BOOL)isItemSystemContainerBackup:(id)a3
{
  return [a3 hasPrefix:@"/BackupData/systemContainer"];
}

- (BOOL)isItemProvisioningProfileBackup:(id)a3
{
  return [a3 hasPrefix:@"/BackupData/provisioningProfile."];
}

- (BOOL)isItemConfigurationProfileBackup:(id)a3
{
  return [a3 hasPrefix:@"/BackupData/configurationProfile"];
}

- (BOOL)isItemCriticalSytemPreferencesBackup:(id)a3
{
  return [a3 hasPrefix:@"criticalSystemPreferences"];
}

- (BOOL)isItemSystemAppData:(id)a3
{
  return [a3 hasPrefix:@"/SystemApps"];
}

- (BOOL)isItemApp:(id)a3
{
  return [a3 hasPrefix:@"/Apps/"];
}

- (BOOL)isItemStandAlonePackage:(id)a3
{
  return [a3 hasPrefix:@"/Packages/"];
}

- (BOOL)isItemDeviceSettings:(id)a3
{
  id v3 = [(MSDSignedManifestV7 *)self getSettingsFromSection:@"BackupData" forIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)appIdentifierFromOrderItem:(id)a3
{
  id v4 = a3;
  if ([(MSDSignedManifestV7 *)self isItemApp:v4])
  {
    v5 = [v4 substringFromIndex:[@"/Apps/" length]];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)standAlonePackageIdentifierFromOrderItem:(id)a3
{
  id v4 = a3;
  if ([(MSDSignedManifestV7 *)self isItemStandAlonePackage:v4])
  {
    v5 = [v4 substringFromIndex:[@"/Packages/" length]];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isItemConfigurationProfile:(id)a3
{
  return [a3 hasPrefix:@"/ConfigurationProfiles/"];
}

- (id)configurationProfileIdentifierFromOrderItem:(id)a3
{
  id v4 = a3;
  if ([(MSDSignedManifestV7 *)self isItemConfigurationProfile:v4])
  {
    v5 = [v4 substringFromIndex:[@"/ConfigurationProfiles/" length]];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getLocaleCode
{
  return [(MSDSignedManifestV7 *)self localeCodeStr];
}

- (id)getBackupList
{
  v2 = [(MSDSignedManifest *)self payload];
  id v3 = [v2 objectForKey:@"BackupData"];

  return v3;
}

- (id)getAppDependecies:(id)a3
{
  id v4 = a3;
  v5 = [(MSDSignedManifest *)self payload];
  v6 = [v5 objectForKey:@"Apps"];

  v7 = [v6 objectForKey:v4];

  v8 = [v7 objectForKey:@"Manifest"];
  v9 = [v8 objectForKey:@"Dependencies"];

  return v9;
}

- (id)getSystemAppDependecies:(id)a3
{
  id v4 = a3;
  v5 = [(MSDSignedManifest *)self payload];
  v6 = [v5 objectForKey:@"SystemApps"];

  v7 = [v6 objectForKey:v4];

  v8 = [v7 objectForKey:@"Manifest"];
  v9 = [v8 objectForKey:@"Dependencies"];

  return v9;
}

- (id)getAppPrivacyPermissions:(id)a3
{
  id v4 = a3;
  v5 = [(MSDSignedManifestV7 *)self getAppList];
  v6 = [v5 objectForKey:v4];

  v7 = [v6 objectForKey:@"Manifest"];
  v8 = [v7 objectForKey:@"Info"];

  v9 = [v8 objectForKey:@"AppPrivacyPermissions"];

  return v9;
}

- (id)getSystemAppPrivacyPermissions:(id)a3
{
  id v4 = a3;
  v5 = [(MSDSignedManifestV7 *)self getSystemAppDataList];
  v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [v6 objectForKeyedSubscript:@"Manifest"];
  v8 = [v7 objectForKeyedSubscript:@"Info"];
  v9 = [v8 objectForKeyedSubscript:@"AppPrivacyPermissions"];

  return v9;
}

- (int64_t)getAppType:(id)a3
{
  id v4 = a3;
  v5 = +[MSDPlatform sharedInstance];
  unsigned int v6 = [v5 macOS];

  if (v6)
  {
    v7 = [(MSDSignedManifest *)self payload];
    v8 = [v7 objectForKey:@"Apps"];

    v9 = [v8 objectForKey:v4];

    if (v9)
    {
      Class v10 = [v8 objectForKey:v4];
      v11 = [v10 objectForKey:@"Manifest"];

      v12 = [v11 objectForKey:@"Info"];
      v13 = [v12 objectForKey:@"AppType"];

      if (v13)
      {
        v14 = [v11 objectForKey:@"Info"];
        v15 = [v14 objectForKey:@"AppType"];

        int64_t v16 = (int64_t)[v15 unsignedIntegerValue];
      }
      else
      {
        int64_t v16 = 0;
      }
    }
    else
    {
      int64_t v16 = 0;
    }
  }
  else
  {
    int64_t v16 = 2;
  }

  return v16;
}

- (id)getAppFileSize:(id)a3
{
  id v4 = a3;
  v5 = [(MSDSignedManifest *)self payload];
  unsigned int v6 = [v5 objectForKey:@"Apps"];

  v7 = [v6 objectForKey:v4];

  v8 = [v7 objectForKey:@"Manifest"];
  v9 = [v8 objectForKey:@"Info"];

  Class v10 = [v9 objectForKey:@"Size"];

  return v10;
}

- (id)getAppRealSize:(id)a3
{
  id v4 = a3;
  v5 = [(MSDSignedManifest *)self payload];
  unsigned int v6 = [v5 objectForKey:@"Apps"];

  v7 = [v6 objectForKey:v4];
  v8 = [v7 objectForKey:@"Manifest"];
  v9 = [v8 objectForKey:@"Info"];

  if (!v9)
  {
    v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002B7E0();
    }
    goto LABEL_14;
  }
  Class v10 = [v9 objectForKey:@"RealSize"];
  if (v10) {
    goto LABEL_6;
  }
  v11 = [v9 objectForKey:@"Size"];
  v12 = v11;
  if (!v11)
  {
    v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002B854();
    }

LABEL_14:
    Class v10 = 0;
    goto LABEL_5;
  }
  Class v10 = +[NSNumber numberWithUnsignedLongLong:2 * (void)[v11 unsignedLongLongValue]];
LABEL_5:

LABEL_6:

  return v10;
}

- (id)getStandAlonePackageFileSize:(id)a3
{
  id v4 = a3;
  v5 = [(MSDSignedManifest *)self payload];
  unsigned int v6 = [v5 objectForKey:@"Packages"];

  v7 = [v6 objectForKey:v4];

  v8 = [v7 objectForKey:@"Manifest"];
  v9 = [v8 objectForKey:@"Info"];

  Class v10 = [v9 objectForKey:@"Size"];

  return v10;
}

- (id)getStandAlonePackageRealSize:(id)a3
{
  id v4 = a3;
  v5 = [(MSDSignedManifest *)self payload];
  unsigned int v6 = [v5 objectForKey:@"Packages"];

  v7 = [v6 objectForKey:v4];
  v8 = [v7 objectForKey:@"Manifest"];
  v9 = [v8 objectForKey:@"Info"];

  if (!v9)
  {
    v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002B8C8();
    }
    goto LABEL_14;
  }
  Class v10 = [v9 objectForKey:@"RealSize"];
  if (v10) {
    goto LABEL_6;
  }
  v11 = [v9 objectForKey:@"Size"];
  v12 = v11;
  if (!v11)
  {
    v14 = sub_100027250();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002B93C();
    }

LABEL_14:
    Class v10 = 0;
    goto LABEL_5;
  }
  Class v10 = +[NSNumber numberWithUnsignedLongLong:2 * (void)[v11 unsignedLongLongValue]];
LABEL_5:

LABEL_6:

  return v10;
}

- (id)getDataComponentRealSizeFromSection:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MSDSignedManifestV7 *)self getManifestDataFromSection:v6 forIdentifier:v7];
  v9 = v8;
  if (v8)
  {
    id v26 = v7;
    id v27 = v6;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v25 = v8;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          v18 = [v10 objectForKey:v16];
          v19 = [v18 objectForKey:@"MSDManifestFileAttributes"];

          if (v19)
          {
            v20 = [v19 fileType];
            unsigned int v21 = [v20 isEqualToString:NSFileTypeRegular];

            if (v21) {
              v13 += (uint64_t)[v19 fileSize];
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v12);
    }
    else
    {
      uint64_t v13 = 0;
    }

    v22 = +[NSNumber numberWithUnsignedLongLong:v13];
    id v7 = v26;
    id v6 = v27;
    v9 = v25;
  }
  else
  {
    v24 = sub_100027250();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10002B9B0();
    }

    v22 = 0;
  }

  return v22;
}

- (id)mergedBackupManifest:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = sub_100027250();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v25.NSUInteger location = location;
    v25.NSUInteger length = length;
    id v7 = NSStringFromRange(v25);
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
      id v10 = [v9 substringFromIndex:([@"/BackupData/" length])];
      id v11 = [(MSDSignedManifestV7 *)self getBackupList];
      id v12 = [v11 objectForKey:v10];
      uint64_t v13 = [v12 objectForKey:@"Manifest"];
      uint64_t v14 = [v13 objectForKey:@"Data"];

      if ([(MSDSignedManifestV7 *)self isItemSystemContainerBackup:v10])
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

          goto LABEL_13;
        }
        if (v18)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "System container backup found. Start restoring UUID paths...", buf, 2u);
        }

        uint64_t v19 = +[NSString restoreSystemContainerUUIDPathsInDict:v14];

        uint64_t v14 = (void *)v19;
      }
      [v21 addEntriesFromDictionary:v14];
LABEL_13:

      ++location;
      --length;
    }
    while (length);
  }

  return v21;
}

- (BOOL)hasSystemContainerBackupInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if ([(MSDSignedManifest *)self getVersion] < 5) {
    return 0;
  }
  id v6 = +[MSDPlatform sharedInstance];
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
    id v11 = [v8 objectAtIndex:location];
    unsigned __int8 v12 = [v11 isEqualToString:@"/BackupData/systemContainer"];

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
        unsigned int v18 = [v17 isEqualToString:@"/BackupData/systemContainer"];

        NSUInteger v14 = v16 + 1;
        --v15;
      }
      while (!v18);
      BOOL v13 = v16 < v10;
    }
  }

  return v13;
}

- (id)getComponentVersion:(id)a3
{
  id v4 = a3;
  v5 = [(MSDSignedManifestV7 *)self getAppList];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    v8 = sub_100027250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002BA2C();
    }
    goto LABEL_14;
  }
  unsigned int v7 = [v6 objectForKey:@"Manifest"];
  v8 = [v7 objectForKey:@"Info"];

  v9 = [v8 objectForKey:@"CFBundleShortVersionString"];
  NSUInteger v10 = sub_100027250();
  id v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002BAA0();
    }

LABEL_14:
    unsigned __int8 v12 = 0;
    goto LABEL_6;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    NSUInteger v15 = "-[MSDSignedManifestV7 getComponentVersion:]";
    __int16 v16 = 2114;
    id v17 = v4;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s - appName:%{public}@ componentVersion:%{public}@", (uint8_t *)&v14, 0x20u);
  }

  unsigned __int8 v12 = v9;
  v8 = v12;
LABEL_6:

  return v12;
}

- (id)getAppManifest:(id)a3
{
  id v4 = a3;
  v5 = [(MSDSignedManifestV7 *)self getAppList];
  id v6 = [v5 objectForKey:v4];

  unsigned int v7 = [v6 objectForKey:@"Manifest"];
  v8 = [v7 objectForKey:@"Info"];

  return v8;
}

- (id)getBackupSectionName
{
  return @"BackupData";
}

- (id)getStandAlonePackageVersion:(id)a3
{
  id v4 = a3;
  v5 = [(MSDSignedManifestV7 *)self getStandAlonePackageList];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    v8 = sub_100027250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002BB14();
    }
    goto LABEL_14;
  }
  unsigned int v7 = [v6 objectForKey:@"Manifest"];
  v8 = [v7 objectForKey:@"Info"];

  v9 = [v8 objectForKey:@"Version"];
  NSUInteger v10 = sub_100027250();
  id v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002BB88();
    }

LABEL_14:
    unsigned __int8 v12 = 0;
    goto LABEL_6;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    NSUInteger v15 = "-[MSDSignedManifestV7 getStandAlonePackageVersion:]";
    __int16 v16 = 2114;
    id v17 = v4;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s - pkgName:%{public}@ pkgVersion:%{public}@", (uint8_t *)&v14, 0x20u);
  }

  unsigned __int8 v12 = v9;
  v8 = v12;
LABEL_6:

  return v12;
}

- (id)getStandAlonePackageList
{
  v2 = [(MSDSignedManifest *)self payload];
  id v3 = [v2 objectForKey:@"Packages"];

  return v3;
}

- (id)getAppList
{
  v2 = [(MSDSignedManifest *)self payload];
  id v3 = [v2 objectForKey:@"Apps"];

  return v3;
}

- (id)getInstallationOrderAppsPrefix
{
  return @"/Apps/";
}

- (id)getInstallationOrderSystemApps
{
  return @"/SystemApps";
}

- (BOOL)checkPlatformTypeForAllComponents
{
  if (+[MSDPlatform iOSHub]) {
    return 1;
  }
  id v4 = +[MSDPlatform sharedInstance];
  uint64_t v38 = [v4 platformType];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v5 = [(MSDSignedManifest *)self payload];
  id v6 = [v5 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v44;
    uint64_t v36 = v5;
    uint64_t v33 = *(void *)v44;
    uint64_t v34 = self;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(v5);
        }
        NSUInteger v10 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v9);
        id v11 = [(MSDSignedManifest *)self payload];
        id v12 = [v11 objectForKey:v10];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || ([v10 isEqualToString:@"Info"] & 1) != 0
          || ([v10 isEqualToString:@"InstallationOrder"] & 1) != 0)
        {
          goto LABEL_11;
        }
        unsigned __int8 v13 = [v10 isEqualToString:@"Certificates"];

        if ((v13 & 1) == 0)
        {
          id v37 = v7;
          int v14 = [(MSDSignedManifest *)self payload];
          uint64_t v35 = v10;
          NSUInteger v15 = [v14 objectForKey:v10];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v12 = v15;
          id v16 = [v12 countByEnumeratingWithState:&v39 objects:v55 count:16];
          if (!v16)
          {
            id v11 = v12;
            goto LABEL_28;
          }
          id v17 = v16;
          uint64_t v18 = *(void *)v40;
LABEL_17:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v40 != v18) {
              objc_enumerationMutation(v12);
            }
            uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * v19);
            id v21 = [v12 objectForKey:v20];
            CFStringRef v22 = @"Manifest";
            v23 = [v21 objectForKey:@"Manifest"];

            if (!v23)
            {
              CFStringRef v22 = @"Settings";
              v24 = [v21 objectForKey:@"Settings"];

              if (!v24) {
                break;
              }
            }
            NSRange v25 = [v21 objectForKey:v22];
            id v26 = [v25 objectForKey:@"Info"];

            if (!v26) {
              break;
            }
            id v27 = [v26 objectForKey:@"PlatformType"];
            unsigned __int8 v28 = [v38 isEqualToString:v27];

            if ((v28 & 1) == 0)
            {
              long long v31 = sub_100027250();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                v32 = [v26 objectForKey:@"PlatformType"];
                *(_DWORD *)buf = 138544130;
                v48 = v32;
                __int16 v49 = 2114;
                uint64_t v50 = v38;
                __int16 v51 = 2114;
                uint64_t v52 = v20;
                __int16 v53 = 2114;
                uint64_t v54 = v35;
                _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "PlatformType (%{public}@) in the manifest does not match the one that we are running on (%{public}@) for item: %{public}@ under component: %{public}@", buf, 0x2Au);
              }
LABEL_33:
              v5 = v36;

              BOOL v3 = 0;
              goto LABEL_34;
            }

            if (v17 == (id)++v19)
            {
              id v17 = [v12 countByEnumeratingWithState:&v39 objects:v55 count:16];
              if (v17) {
                goto LABEL_17;
              }
              id v11 = v12;
              v5 = v36;
              uint64_t v8 = v33;
              self = v34;
LABEL_28:
              id v7 = v37;
LABEL_11:

              goto LABEL_12;
            }
          }
          id v26 = sub_100027250();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_10002BBFC();
          }
          goto LABEL_33;
        }
LABEL_12:
        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v29 = [v5 countByEnumeratingWithState:&v43 objects:v56 count:16];
      id v7 = v29;
    }
    while (v29);
  }
  BOOL v3 = 1;
LABEL_34:

  return v3;
}

- (id)getComponentDataList:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(MSDSignedManifest *)self payload];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    uint64_t v8 = sub_100027250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002BC64(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)getSystemAppDataList
{
  v2 = [(MSDSignedManifest *)self payload];
  BOOL v3 = [v2 objectForKey:@"SystemApps"];

  return v3;
}

- (id)getSharedDataList
{
  v2 = [(MSDSignedManifest *)self payload];
  BOOL v3 = [v2 objectForKey:@"SharedAppData"];

  return v3;
}

- (id)getUserDataList
{
  v2 = [(MSDSignedManifest *)self payload];
  BOOL v3 = [v2 objectForKey:@"UserData"];

  return v3;
}

- (id)getDataSectionKeys
{
  return +[NSSet setWithArray:&off_100052040];
}

- (id)getAllFileHash
{
  return [(MSDSignedManifestV7 *)self parseAllFileHash];
}

- (BOOL)isPathUnderNonContainerizedContentRoot:(id)a3
{
  id v4 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_100007E28;
  v12[4] = sub_100007E38;
  uint64_t v13 = &stru_10004D8B8;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v5 = [v4 pathComponents];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007E40;
  v7[3] = &unk_10004CBF8;
  v7[4] = self;
  v7[5] = v12;
  v7[6] = &v8;
  [v5 enumerateObjectsUsingBlock:v7];

  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v12, 8);

  return (char)self;
}

- (id)getManifestDataFromSection:(id)a3 forIdentifier:(id)a4
{
  id v4 = [(MSDSignedManifest *)self getManifestFromSection:a3 forIdentifier:a4];
  v5 = [v4 objectForKey:@"Data"];

  return v5;
}

- (id)getManifestInfoFromSection:(id)a3 forIdentifier:(id)a4
{
  id v4 = [(MSDSignedManifest *)self getManifestFromSection:a3 forIdentifier:a4];
  v5 = [v4 objectForKey:@"Info"];

  return v5;
}

- (id)getSettingsFromSection:(id)a3 forIdentifier:(id)a4
{
  id v4 = [(MSDSignedManifest *)self getDictFromSection:a3 forIdentifier:a4];
  v5 = [v4 objectForKey:@"Settings"];

  return v5;
}

- (id)getSettingsDataFromSection:(id)a3 forIdentifier:(id)a4
{
  id v4 = [(MSDSignedManifestV7 *)self getSettingsFromSection:a3 forIdentifier:a4];
  v5 = [v4 objectForKey:@"Data"];

  return v5;
}

- (id)getSettingsInfoFromSection:(id)a3 forIdentifier:(id)a4
{
  id v4 = [(MSDSignedManifestV7 *)self getSettingsFromSection:a3 forIdentifier:a4];
  v5 = [v4 objectForKey:@"Info"];

  return v5;
}

- (id)originServerForBackupManifest:(_NSRange)a3
{
  NSUInteger location = a3.location;
  v5 = [(MSDSignedManifest *)self installationOrder];
  id v6 = [v5 objectAtIndex:location];

  id v7 = [v6 lastPathComponent];
  if (v7)
  {
    uint64_t v8 = [(MSDSignedManifestV7 *)self getBackupList];
    uint64_t v9 = [v8 objectForKey:v7];

    uint64_t v10 = [v9 objectForKey:@"OriginServer"];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)getContainerTypeFromComponentName:(id)a3
{
  id v4 = a3;
  v5 = [v4 componentsSeparatedByString:@"."];
  id v6 = [v5 objectAtIndex:0];
  id v7 = [(MSDSignedManifestV7 *)self getDataSectionKeys];
  if ([v7 containsObject:v6])
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v10 = sub_100027250();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002BCDC();
    }

    id v8 = 0;
  }

  return v8;
}

- (void)parseNonContainerizedContentRootSet
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v4 = [(MSDSignedManifestV7 *)self getDataSectionKeys];
  v5 = [v4 allObjects];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (!-[MSDSignedManifest isContainerizedComponent:](self, "isContainerizedComponent:", v11, (void)v16))
        {
          uint64_t v12 = [(MSDSignedManifest *)self payload];
          uint64_t v13 = [v12 objectForKey:v11];

          uint64_t v14 = [(MSDSignedManifestV7 *)self parseSectionForContentRoot:v13];
          uint64_t v15 = v14;
          if (v14 && [v14 count]) {
            [v3 unionSet:v15];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  [(MSDSignedManifestV7 *)self setNonContainerizedContentRoots:v3];
}

- (id)parseSectionForContentRoot:(id)a3
{
  id v3 = a3;
  id v27 = objc_alloc_init((Class)NSMutableSet);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v24 = v3;
  id obj = [v3 allKeys];
  id v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v25)
  {
    CFStringRef v4 = @"/";
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v5;
        id v6 = [v24 objectForKey:*(void *)(*((void *)&v33 + 1) + 8 * v5)];
        id v7 = [v6 objectForKey:@"Manifest"];
        id v8 = [v7 objectForKey:@"Data"];

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        unsigned __int8 v28 = v8;
        uint64_t v9 = [v8 allKeys];
        id v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v30;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              if (([v14 isEqualToString:v4] & 1) == 0)
              {
                CFStringRef v16 = v4;
                long long v17 = [v28 objectForKey:v14];
                long long v18 = [v17 objectForKey:@"MSDManifestFileExtendedAttributes"];
                long long v19 = [v18 objectForKey:@"MSDAnnotation"];

                if (v19)
                {
                  id v20 = [objc_alloc((Class)NSString) initWithData:v19 encoding:4];
                  if ([v20 isEqualToString:@"ContentRoot"]) {
                    [v27 addObject:v14];
                  }
                }
                CFStringRef v4 = v16;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v11);
        }

        uint64_t v5 = v26 + 1;
      }
      while ((id)(v26 + 1) != v25);
      id v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v25);
  }

  return v27;
}

- (void)parseLocaleCode
{
  [(MSDSignedManifestV7 *)self setLocaleCodeStr:0];
  id v3 = [(MSDSignedManifestV7 *)self getSettingsDataFromSection:@"BackupData" forIdentifier:@"locale"];
  CFStringRef v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKey:@"language"];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = [v4 objectForKey:@"region"];
      if (v7)
      {
        id v8 = (void *)v7;
        uint64_t v9 = +[NSString stringWithFormat:@"%@_%@", v6, v7];
        [(MSDSignedManifestV7 *)self setLocaleCodeStr:v9];
      }
      else
      {
        id v10 = sub_100027250();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10002BE4C();
        }
      }
    }
    else
    {
      id v6 = sub_100027250();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10002BDC8();
      }
    }
  }
  else
  {
    id v6 = sub_100027250();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002BD44();
    }
  }
}

- (id)parseAllFileHash
{
  v2 = objc_opt_new();
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v54 = [&off_100052058 countByEnumeratingWithState:&v78 objects:v86 count:16];
  if (v54)
  {
    uint64_t v52 = *(void *)v79;
    CFStringRef v3 = @"Manifest";
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v79 != v52) {
          objc_enumerationMutation(&off_100052058);
        }
        uint64_t v58 = v4;
        uint64_t v5 = *(void *)(*((void *)&v78 + 1) + 8 * v4);
        id v6 = [(MSDSignedManifest *)self payload];
        uint64_t v7 = [v6 objectForKey:v5];

        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v8 = v7;
        id v9 = [v8 countByEnumeratingWithState:&v74 objects:v85 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v75;
          id v60 = v8;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v75 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v74 + 1) + 8 * i);
              uint64_t v15 = [v8 objectForKey:v13];
              CFStringRef v16 = [v15 objectForKey:v3];
              long long v17 = v16;
              if (v16)
              {
                long long v18 = [v16 objectForKey:@"Info"];
                long long v19 = v18;
                if (v18)
                {
                  id v20 = v10;
                  uint64_t v21 = v11;
                  CFStringRef v22 = v3;
                  uint64_t v23 = [v18 objectForKey:@"Hash"];
                  if (v23) {
                    [v2 addObject:v23];
                  }

                  CFStringRef v3 = v22;
                  uint64_t v11 = v21;
                  id v10 = v20;
                  id v8 = v60;
                }
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v74 objects:v85 count:16];
          }
          while (v10);
        }

        uint64_t v4 = v58 + 1;
      }
      while ((id)(v58 + 1) != v54);
      id v54 = [&off_100052058 countByEnumeratingWithState:&v78 objects:v86 count:16];
    }
    while (v54);
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v47 = [&off_100052070 countByEnumeratingWithState:&v70 objects:v84 count:16];
  if (v47)
  {
    uint64_t v46 = *(void *)v71;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v71 != v46) {
          objc_enumerationMutation(&off_100052070);
        }
        uint64_t v49 = v24;
        uint64_t v25 = *(void *)(*((void *)&v70 + 1) + 8 * v24);
        uint64_t v26 = [(MSDSignedManifest *)self payload];
        id v27 = [v26 objectForKey:v25];

        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v28 = v27;
        id v55 = [v28 countByEnumeratingWithState:&v66 objects:v83 count:16];
        if (v55)
        {
          id v51 = v28;
          uint64_t v53 = *(void *)v67;
          do
          {
            for (j = 0; j != v55; j = (char *)j + 1)
            {
              if (*(void *)v67 != v53) {
                objc_enumerationMutation(v28);
              }
              uint64_t v30 = *(void *)(*((void *)&v66 + 1) + 8 * (void)j);
              long long v32 = [v28 objectForKey:v30];
              long long v33 = [v32 objectForKey:@"Manifest"];
              if (v33)
              {
                uint64_t v59 = v32;
                uint64_t v61 = v31;
                contexta = v33;
                long long v34 = [v33 objectForKey:@"Data"];
                long long v62 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                long long v65 = 0u;
                id v35 = v34;
                id v36 = [v35 countByEnumeratingWithState:&v62 objects:v82 count:16];
                if (v36)
                {
                  id v37 = v36;
                  uint64_t v38 = *(void *)v63;
                  do
                  {
                    for (k = 0; k != v37; k = (char *)k + 1)
                    {
                      if (*(void *)v63 != v38) {
                        objc_enumerationMutation(v35);
                      }
                      uint64_t v40 = *(void *)(*((void *)&v62 + 1) + 8 * (void)k);
                      long long v42 = [v35 objectForKey:v40];
                      long long v43 = [v42 objectForKey:@"MSDManifestFileHash"];
                      if (v43) {
                        [v2 addObject:v43];
                      }
                    }
                    id v37 = [v35 countByEnumeratingWithState:&v62 objects:v82 count:16];
                  }
                  while (v37);
                }

                id v28 = v51;
                long long v32 = v59;
                long long v31 = v61;
                long long v33 = contexta;
              }
            }
            id v55 = [v28 countByEnumeratingWithState:&v66 objects:v83 count:16];
          }
          while (v55);
        }

        uint64_t v24 = v49 + 1;
      }
      while ((id)(v49 + 1) != v47);
      id v47 = [&off_100052070 countByEnumeratingWithState:&v70 objects:v84 count:16];
    }
    while (v47);
  }
  long long v44 = +[NSSet setWithSet:v2];

  return v44;
}

- (NSString)localeCodeStr
{
  return self->_localeCodeStr;
}

- (void)setLocaleCodeStr:(id)a3
{
}

- (NSSet)nonContainerizedContentRoots
{
  return self->_nonContainerizedContentRoots;
}

- (void)setNonContainerizedContentRoots:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonContainerizedContentRoots, 0);

  objc_storeStrong((id *)&self->_localeCodeStr, 0);
}

@end