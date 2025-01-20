@interface MCMigrator
+ (BOOL)payloadHasHardwareBoundKey:(id)a3;
+ (id)stringWithContext:(int)a3;
- (BOOL)_applyAccountTagsToProfile:(id)a3;
- (BOOL)_copyAlmostAtomicallyItemAtPath:(id)a3 toPath:(id)a4 error:(id *)a5;
- (BOOL)_isDirectoryEmptyAtPath:(id)a3;
- (BOOL)_isLegacyProfileStoragePresent;
- (BOOL)_isMultiUserMode;
- (BOOL)_shouldAttemptToMigrateLegacyProfileStorage;
- (BOOL)systemProfileStorageWasMigratedFromLegacyStorage;
- (MCMigrator)init;
- (MCNotifier)notifier;
- (NSFileManager)fileManager;
- (id)_attributeDictionaryForProfileStorageWithPosixPermissions:(unint64_t)a3;
- (id)_attributesForSystemProfileStorageItems;
- (id)_attributesForUserProfileStorageItem;
- (id)_generatedManifestIfNeededFromOrderedProfiles:(id)a3 hiddenProfiles:(id)a4 existingManifest:(id)a5;
- (id)_lastSystemMigratedBuildVersion;
- (id)_lastUserMigratedBuildVersion;
- (id)_profilesFromManifestAtPath:(id)a3;
- (id)_removeOrphanedManifestEntriesFromManifestInDirectory:(id)a3;
- (id)_updateProfileRestrictionsForProfileRestrictions:(id)a3;
- (id)systemMetadataDictionary;
- (id)userMetadataDictionary;
- (void)_applyDefaultSettings;
- (void)_applyImpliedSettings;
- (void)_checkValidUserEnrollment;
- (void)_cleanUpAppConfiguration;
- (void)_correctCloudConfigurationIfNecessary;
- (void)_correctInstallOptionsOnProfileStubs;
- (void)_correctMDMConfigurationFile;
- (void)_createDirectories;
- (void)_createDirectoryAtPath:(id)a3;
- (void)_createDirectoryAtPath:(id)a3 attributes:(id)a4;
- (void)_createStubs;
- (void)_createSystemGroupContainerAndMoveFiles;
- (void)_createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary;
- (void)_fixDirectoryAtPath:(id)a3 permissions:(id)a4;
- (void)_fixManifestFromStubsIfNecessary;
- (void)_fixManifestFromStubsIfNecessaryWithStubPath:(id)a3 manifestPath:(id)a4;
- (void)_fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents;
- (void)_migrateBoolRestrictions:(id)a3 withAppID:(id)a4 forKey:(id)a5 valuesToRestrictions:(id)a6 currentBoolUserSettings:(id)a7;
- (void)_migrateBoolValueToFeature:(id)a3 withAppID:(id)a4 forKey:(id)a5 synchronize:(BOOL)a6;
- (void)_migrateClientRestrictions;
- (void)_migrateExtensibleSSO;
- (void)_migrateLegacySystemProfileStorage;
- (void)_migrateLostModeLastLocationRequestDate;
- (void)_migrateManifestLocation;
- (void)_migrateOTAProfiles;
- (void)_migratePasscodeDidRestore:(BOOL)a3 passcodeWasSet:(BOOL)a4 historyRequired:(BOOL)a5;
- (void)_migrateProfileStubsForNetworkExtension;
- (void)_migrateSettings;
- (void)_migrateSharedDeviceConfiguration;
- (void)_migrateSupervisionSettings;
- (void)_migrateValueRestrictions:(id)a3 withAppID:(id)a4 forKey:(id)a5 keysToRestricitons:(id)a6 currentValueUserSettings:(id)a7;
- (void)_moveFilesToPublicDirectories;
- (void)_moveSignerCertificatesInProfileStubDictionary:(id)a3;
- (void)_profilesFromStubsAtPath:(id)a3 orderedProfiles:(id *)a4 hiddenProfiles:(id *)a5;
- (void)_removeDuplicatedHiddenIdentifiers;
- (void)_removeExistingSystemProfileStorageDirectoryBlockingMigration;
- (void)_removeHardwareBoundPayloads;
- (void)_removeInvalidOptionsFromLegacyCloudConfiguration;
- (void)_removeLegacyAPNConfigurations;
- (void)_removeLegacyProfileStorageDirectory;
- (void)_removeMDMProfileIfDataSeparated;
- (void)_removeOSXServerPayloadAccount;
- (void)_removeOriginalCopies;
- (void)_removeOrphanedManifestEntries;
- (void)_removeSupervisionProfiles;
- (void)_removeUnmanageableApps;
- (void)_removeUnusedManifestArrays;
- (void)_removeiPCUCertificates;
- (void)_sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage;
- (void)_setAttributesOnSystemProfileStorageDirectory;
- (void)_tagIMAPAccountsWithProfileAndPayloadProperties;
- (void)_tagManagedAccounts;
- (void)_tellAMFIIfWeAreSupervised;
- (void)_transferInstallationDatesFromOriginalProfiles;
- (void)_transferRemovalPasswordsFromOriginalProfiles;
- (void)_transferSignerCertificates;
- (void)_transferTagsToProfileStubs;
- (void)_updateClientRestrictions;
- (void)_updateProfileRestrictions;
- (void)_validateCloudConfiguration;
- (void)_wakeDaemonsPostMigration;
- (void)migrateCleanupMigratorWithContext:(int)a3;
- (void)migratePostDataMigratorWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4;
- (void)migrateWithPostMigrationTaskQueue:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setNotifier:(id)a3;
- (void)setSystemMetadataDictionary:(id)a3;
- (void)setSystemProfileStorageWasMigratedFromLegacyStorage:(BOOL)a3;
- (void)setUserMetadataDictionary:(id)a3;
@end

@implementation MCMigrator

- (MCMigrator)init
{
  v8.receiver = self;
  v8.super_class = (Class)MCMigrator;
  v2 = [(MCMigrator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    fileManager = v2->_fileManager;
    v2->_fileManager = (NSFileManager *)v3;

    uint64_t v5 = objc_opt_new();
    notifier = v2->_notifier;
    v2->_notifier = (MCNotifier *)v5;

    v2->_systemProfileStorageWasMigratedFromLegacyStorage = 0;
  }
  return v2;
}

- (id)systemMetadataDictionary
{
  v2 = MCSystemMetadataFilePath();
  uint64_t v3 = +[NSData dataWithContentsOfFile:v2];
  v4 = +[NSPropertyListSerialization MCSafePropertyListWithData:v3 options:1 format:0 error:0];

  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = +[NSMutableDictionary dictionary];

    v4 = (void *)v5;
  }

  return v4;
}

- (void)setSystemMetadataDictionary:(id)a3
{
  id v3 = a3;
  MCSystemMetadataFilePath();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 MCWriteToBinaryFile:v4];
}

- (id)userMetadataDictionary
{
  v2 = MCUserMetadataFilePath();
  id v3 = +[NSData dataWithContentsOfFile:v2];
  id v4 = +[NSPropertyListSerialization MCSafePropertyListWithData:v3 options:1 format:0 error:0];

  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = +[NSMutableDictionary dictionary];

    id v4 = (void *)v5;
  }

  return v4;
}

- (void)setUserMetadataDictionary:(id)a3
{
  id v3 = a3;
  MCUserMetadataFilePath();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 MCWriteToBinaryFile:v4];
}

- (id)_lastSystemMigratedBuildVersion
{
  v2 = [(MCMigrator *)self systemMetadataDictionary];
  id v3 = [v2 objectForKey:kMCMetaLastMigratedBuildKey];

  return v3;
}

- (id)_lastUserMigratedBuildVersion
{
  v2 = [(MCMigrator *)self userMetadataDictionary];
  id v3 = [v2 objectForKey:kMCMetaLastMigratedBuildKey];

  return v3;
}

- (void)_migratePasscodeDidRestore:(BOOL)a3 passcodeWasSet:(BOOL)a4 historyRequired:(BOOL)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  v9 = _MCLogObjects[12];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Migrating passcode...", buf, 2u);
  }
  if (v7 && v6)
  {
    if (MKBGetDeviceLockState() == 3)
    {
      v10 = +[NSData data];
      v11 = MCBackupContainsPasscodeFilePath();
      [v10 writeToFile:v11 atomically:1];
    }
    else
    {
      v10 = [(MCMigrator *)self fileManager];
      v11 = MCBackupContainsPasscodeFilePath();
      [v10 removeItemAtPath:v11 error:0];
    }
  }
  if (!a5)
  {
    v12 = +[MCPasscodeManagerWriter sharedManager];
    [v12 clearPasscodeHistory];
  }
  v13 = +[MCPasscodeManagerWriter sharedManager];
  [v13 migratePasscodeMetadata];

  v14 = _MCLogObjects[12];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Completed migrating passcode.", v15, 2u);
  }
}

- (BOOL)_isMultiUserMode
{
  v2 = MCCloudConfigurationDetailsFilePath();
  id v3 = +[NSMutableDictionary dictionaryWithContentsOfFile:v2];

  id v4 = [v3 objectForKeyedSubscript:kCCIsMultiUserKey];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (void)_removeiPCUCertificates
{
  id v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing iPCU associations...", buf, 2u);
  }
  id v4 = MCiPCUKeychainMapPath();
  unsigned __int8 v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [v6 objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15];
        +[MCKeychain removeItemWithPersistentID:v11 useSystemKeychain:1];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }

  v12 = [(MCMigrator *)self fileManager];
  v13 = MCiPCUKeychainMapPath();
  [v12 removeItemAtPath:v13 error:0];

  v14 = _MCLogObjects[12];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Finished removing iPCU associations.", buf, 2u);
  }
}

- (void)_removeOSXServerPayloadAccount
{
  v2 = +[MCManifest sharedManifest];
  [v2 allInstalledProfileIdentifiers];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v29 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v29)
  {
    uint64_t v3 = *(void *)v37;
    uint64_t v24 = *(void *)v37;
    v25 = v2;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v37 != v3) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v5 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v7 = [v2 installedProfileWithIdentifier:v5];
        id v8 = v7;
        if (v7)
        {
          v27 = v5;
          v30 = v6;
          id v9 = [v7 createHandler];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v31 = v8;
          v10 = [v8 payloads];
          id v11 = [v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
          if (!v11) {
            goto LABEL_23;
          }
          id v12 = v11;
          v28 = i;
          char v13 = 0;
          uint64_t v14 = *(void *)v33;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v33 != v14) {
                objc_enumerationMutation(v10);
              }
              long long v16 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v17 = [v16 UUID];
                [v9 convertPayloadWithUUIDToUnknownPayload:v17];

                os_log_t v18 = _MCLogObjects[12];
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  v19 = v18;
                  v20 = [v16 UUID];
                  *(_DWORD *)buf = 138543362;
                  v41 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Removed macOS Server Accounts payload with UUID: %{public}@", buf, 0xCu);
                }
                char v13 = 1;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v32 objects:v42 count:16];
          }
          while (v12);

          uint64_t v3 = v24;
          v2 = v25;
          i = v28;
          if (v13)
          {
            if ([v31 isInstalledForUser]) {
              MCUserProfileStorageDirectory();
            }
            else {
            v10 = MCSystemProfileStorageDirectory();
            }
            v21 = [v27 MCHashedFilenameWithExtension:@"stub" :v24 :v25];
            v22 = [v10 stringByAppendingPathComponent:v21];

            v23 = [v9 profile];
            [v23 writeStubToPath:v22];

            i = v28;
LABEL_23:
          }
          id v6 = v30;
          id v8 = v31;
        }
      }
      id v29 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v29);
  }
}

- (void)_removeHardwareBoundPayloads
{
  v76 = +[MCManifest sharedManifest];
  [v76 allInstalledProfileIdentifiers];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v97 objects:v108 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v98;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v98 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = [v76 installedProfileWithIdentifier:*(void *)(*((void *)&v97 + 1) + 8 * v6)];
      id v8 = [v7 payloadsWithClass:objc_opt_class()];
      id v9 = [v8 count];

      if (v9) {
        break;
      }

      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v97 objects:v108 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v7 = 0;
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v10 = [v7 payloads];
  id v11 = [v10 countByEnumeratingWithState:&v93 objects:v107 count:16];
  id v12 = &selRef_verifiedMDMProfileIdentifierWithCompletion_;
  v66 = v7;
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v94;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v94 != v14) {
          objc_enumerationMutation(v10);
        }
        if (+[MCMigrator payloadHasHardwareBoundKey:*(void *)(*((void *)&v93 + 1) + 8 * i)])
        {
          long long v16 = _MCLogObjects[12];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: Unenrolling from MDM because identity was hardware-bound", buf, 2u);
          }
          long long v17 = +[MCInstaller sharedInstaller];
          os_log_t v18 = [v7 identifier];
          [v17 removeProfileWithIdentifier:v18 installType:[v7 installType] source:@"Hardware-bound Profile Removal"];

          uint64_t v19 = [v76 allInstalledProfileIdentifiers];

          int v64 = 1;
          id v2 = (id)v19;
          goto LABEL_22;
        }
      }
      id v13 = [v10 countByEnumeratingWithState:&v93 objects:v107 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  int v64 = 0;
LABEL_22:

  v68 = +[NSMutableArray array];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = v2;
  id v70 = [obj countByEnumeratingWithState:&v89 objects:v106 count:16];
  if (v70)
  {
    uint64_t v69 = *(void *)v90;
    uint64_t v20 = kAppSSOKerberosExtensionID;
    uint64_t v73 = kAppSSOKerberosExtensionID;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v90 != v69) {
          objc_enumerationMutation(obj);
        }
        uint64_t v72 = v21;
        v22 = [v76 installedProfileWithIdentifier:*(void *)(*((void *)&v89 + 1) + 8 * v21)];
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        v23 = [v22 payloads];
        id v24 = [v23 countByEnumeratingWithState:&v85 objects:v105 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v86;
          v71 = v22;
          uint64_t v74 = *(void *)v86;
          v75 = v23;
          while (2)
          {
            for (j = 0; j != v25; j = (char *)j + 1)
            {
              if (*(void *)v86 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = *(void **)(*((void *)&v85 + 1) + 8 * (void)j);
              if ([v12 + 482 payloadHasHardwareBoundKey:v28])
              {
                v22 = v71;
                [v68 addObject:v71];
                goto LABEL_54;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v29 = v28;
                v30 = [v29 esso_extensionIdentifier];
                unsigned int v31 = [v30 isEqualToString:v20];

                if (v31)
                {
                  long long v32 = [v29 esso_extensionData];
                  long long v33 = [v32 objectForKeyedSubscript:@"certificateUUID"];

                  if (v33)
                  {
                    long long v83 = 0u;
                    long long v84 = 0u;
                    long long v81 = 0u;
                    long long v82 = 0u;
                    long long v34 = [v76 allInstalledProfileIdentifiers];
                    id v35 = [v34 countByEnumeratingWithState:&v81 objects:v104 count:16];
                    if (v35)
                    {
                      id v36 = v35;
                      uint64_t v37 = *(void *)v82;
LABEL_38:
                      uint64_t v38 = 0;
                      while (1)
                      {
                        if (*(void *)v82 != v37) {
                          objc_enumerationMutation(v34);
                        }
                        long long v39 = [v76 installedProfileWithIdentifier:*(void *)(*((void *)&v81 + 1) + 8 * v38)];
                        uint64_t v40 = [v39 payloadWithUUID:v33];
                        if (v40) {
                          break;
                        }

                        if (v36 == (id)++v38)
                        {
                          id v36 = [v34 countByEnumeratingWithState:&v81 objects:v104 count:16];
                          id v12 = &selRef_verifiedMDMProfileIdentifierWithCompletion_;
                          if (v36) {
                            goto LABEL_38;
                          }
                          goto LABEL_47;
                        }
                      }
                      v41 = (void *)v40;
                      id v12 = &selRef_verifiedMDMProfileIdentifierWithCompletion_;
                      if (!+[MCMigrator payloadHasHardwareBoundKey:v40])
                      {

                        goto LABEL_47;
                      }
                      v22 = v71;
                      [v68 addObject:v71];

                      uint64_t v20 = v73;
                      v23 = v75;
                      goto LABEL_54;
                    }
LABEL_47:

                    uint64_t v20 = v73;
                    uint64_t v26 = v74;
                    v23 = v75;
                  }
                }
              }
            }
            id v25 = [v23 countByEnumeratingWithState:&v85 objects:v105 count:16];
            v22 = v71;
            if (v25) {
              continue;
            }
            break;
          }
        }
LABEL_54:

        uint64_t v21 = v72 + 1;
      }
      while ((id)(v72 + 1) != v70);
      id v42 = [obj countByEnumeratingWithState:&v89 objects:v106 count:16];
      id v70 = v42;
    }
    while (v42);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v43 = v68;
  id v44 = [v43 countByEnumeratingWithState:&v77 objects:v103 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v78;
    do
    {
      for (k = 0; k != v45; k = (char *)k + 1)
      {
        if (*(void *)v78 != v46) {
          objc_enumerationMutation(v43);
        }
        v48 = *(void **)(*((void *)&v77 + 1) + 8 * (void)k);
        v49 = [v48 identifier];
        v50 = _MCLogObjects[12];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v102 = v49;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: Removing profile with PayloadIdentifier %@ because it referenced a hardware-bound key", buf, 0xCu);
        }
        v51 = +[MCInstaller sharedInstaller];
        [v51 removeProfileWithIdentifier:v49 installType:[v48 installType] source:@"Hardware-bound Profile Removal"];
      }
      id v45 = [v43 countByEnumeratingWithState:&v77 objects:v103 count:16];
    }
    while (v45);
  }

  if (v64)
  {
    v52 = MCCloudConfigurationDetailsFilePath();
    v53 = +[NSMutableDictionary dictionaryWithContentsOfFile:v52];

    if (v53)
    {
      v54 = [v53 objectForKeyedSubscript:kCCConfigurationSourceKey];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v54 intValue] == 1)
      {
        v55 = _MCLogObjects[12];
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: Removing cloud configuration for DEP device that was unenrolled due to hardware-bound key", buf, 2u);
        }
        v56 = +[NSFileManager defaultManager];
        v57 = MCCloudConfigurationDetailsFilePath();
        [v56 removeItemAtPath:v57 error:0];

        v58 = +[NSFileManager defaultManager];
        v59 = MCLegacyCloudConfigurationDetailsFilePath();
        [v58 removeItemAtPath:v59 error:0];

        MCSendCloudConfigurationDetailsChangedNotification();
        v60 = +[NSFileManager defaultManager];
        v61 = MCPostSetupAutoInstallProfilePath();
        [v60 removeItemAtPath:v61 error:0];

        v62 = +[NSFileManager defaultManager];
        v63 = MCLegacyPostSetupAutoInstallProfilePath();
        [v62 removeItemAtPath:v63 error:0];
      }
    }
  }
}

+ (BOOL)payloadHasHardwareBoundKey:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 isHardwareBound];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (id)stringWithContext:(int)a3
{
  if (a3 > 3) {
    return @"Unknown!";
  }
  else {
    return *(&off_1000EB9A8 + a3);
  }
}

- (void)migratePostDataMigratorWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-MigratePostDataMigrator"];
  id v8 = +[MCMigrator stringWithContext:v5];
  id v9 = _MCLogObjects[12];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138543618;
    v27 = v8;
    __int16 v28 = 1024;
    BOOL v29 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Beginning post-DataMigrator migration. Context: %{public}@, passcode was set in backup: %d", (uint8_t *)&v26, 0x12u);
  }
  [(MCMigrator *)self _tellAMFIIfWeAreSupervised];
  v10 = +[MCRestrictionManager sharedManager];
  id v11 = [v10 valueForFeature:MCFeaturePasscodeHistoryCount];
  BOOL v12 = [v11 unsignedIntValue] != 0;

  [(MCMigrator *)self _migratePasscodeDidRestore:(v5 & 0xFFFFFFFE) == 2 passcodeWasSet:v4 historyRequired:v12];
  id v13 = +[MCRestrictionManagerWriter sharedManager];
  [v13 notifyClientsToRecomputeCompliance];
  if (v5 == 3) {
    [(MCMigrator *)self _removeiPCUCertificates];
  }
  uint64_t v14 = +[MCServerSideHacks sharedHacks];
  [v14 recomputeAppRulesForNetworkExtension];

  long long v15 = +[MCServerSideHacks sharedHacks];
  long long v16 = [v13 effectiveUserSettings];
  [v15 recomputeAppOptionsEffectiveUserSettings:v16 outEffectiveChangeDetected:0];

  long long v17 = +[MCServerSideHacks sharedHacks];
  os_log_t v18 = [v13 effectiveUserSettings];
  [v17 recomputeWebContentFilterEffectiveUserSettings:v18 outEffectiveChangeDetected:0 outMechanismChangedDetected:0];

  uint64_t v19 = +[MCServerSideHacks sharedHacks];
  id v20 = [v19 recomputeAccountVPNAssociations];

  CFStringRef v21 = (const __CFString *)kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey;
  CFStringRef v22 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  v23 = (void *)CFPreferencesCopyAppValue(kMCPreferencesLockdownActivationIndicatesCloudConfigurationAvailableKey, kMCNotBackedUpPreferencesDomain);
  id v24 = (void *)CFPreferencesCopyAppValue(kMCPreferencesLockdownCloudConfigurationAvailableKey, v22);
  if ([v24 BOOLValue] && !v23)
  {
    CFPreferencesSetAppValue(v21, kCFBooleanTrue, v22);
    CFPreferencesAppSynchronize(v22);
  }
  if (v5 == 2)
  {
    [v13 clearAllPasscodeComplianceCaches];
    [v13 recomputeNagMetadata];
    MCSendClientTruthChangedNotification();
  }
  id v25 = _MCLogObjects[12];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Post-DataMigrator migration complete.", (uint8_t *)&v26, 2u);
  }
}

- (void)_tellAMFIIfWeAreSupervised
{
  id v2 = MCCloudConfigurationDetailsFilePath();
  id v3 = +[NSDictionary dictionaryWithContentsOfFile:v2];

  if (v3)
  {
    BOOL v4 = [v3 objectForKeyedSubscript:kCCIsSupervisedKey];
    unsigned int v5 = [v4 BOOLValue];

    if (v5)
    {
      uint64_t v6 = _MCLogObjects[12];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Informing AMFI that this device is supervised.", v7, 2u);
      }
      +[MCCloudConfigurationWriter setAMFISupervisionFromCloudConfiguration:v3];
    }
  }
}

- (void)_removeMDMProfileIfDataSeparated
{
  id v2 = +[MCInstaller sharedInstaller];
  id v3 = [v2 verifiedMDMProfileIdentifierWithCleanUp];

  if (v3)
  {
    BOOL v4 = +[MCManifest installedProfileWithIdentifier:v3];
    if (!v4)
    {
      v10 = _MCLogObjects[12];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138543362;
        long long v16 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MCCleanupMigrator: could not create MDM profile from identifier %{public}@", (uint8_t *)&v15, 0xCu);
      }
      goto LABEL_20;
    }
    unsigned int v5 = [v4 payloadsWithClass:objc_opt_class()];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = [v5 count];
      if (v7 == (id)1)
      {
        id v11 = [v6 objectAtIndexedSubscript:0];
        BOOL v12 = [v11 personaID];

        if (v12)
        {
          id v13 = +[MCInstaller sharedInstaller];
          [v13 removeProfileWithIdentifier:v3 installType:[v4 installType] source:@"User Enrollment Profile Removal"];

          uint64_t v14 = _MCLogObjects[12];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v15) = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: Removed data separated (PDUE/ADUE/ADDE) MDM profile", (uint8_t *)&v15, 2u);
          }
        }

        goto LABEL_19;
      }
      if (v7)
      {
        id v8 = _MCLogObjects[12];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v15) = 0;
          id v9 = "MCCleanupMigrator: MDM profile contains more than one MDM payload";
          goto LABEL_18;
        }
      }
      else
      {
        id v8 = _MCLogObjects[12];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v15) = 0;
          id v9 = "MCCleanupMigrator: MDM profile contains no MDM payloads";
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v15, 2u);
        }
      }
    }
    else
    {
      id v8 = _MCLogObjects[12];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15) = 0;
        id v9 = "MCCleanupMigrator: payloadsWithClass: unexpectedly returned nil for MDM profile";
        goto LABEL_18;
      }
    }
LABEL_19:

LABEL_20:
  }
}

- (void)migrateCleanupMigratorWithContext:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-MigrationCleanup"];
  uint64_t v6 = +[MCMigrator stringWithContext:v3];
  id v7 = _MCLogObjects[12];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v54 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: work beginning, context: %{public}@", buf, 0xCu);
  }
  id v8 = MCProductBuildVersion();
  id v9 = [(MCMigrator *)self systemMetadataDictionary];
  [v9 setObject:v8 forKey:kMCMetaLastMDMMigratedBuildKey];
  [(MCMigrator *)self setSystemMetadataDictionary:v9];
  v10 = +[MCInstaller sharedInstaller];
  if (v3 == 2)
  {
    int v40 = 2;
    [(MCMigrator *)self _removeMDMProfileIfDataSeparated];
    uint64_t v3 = +[MDMClient sharedClient];
    [(id)v3 scheduleTokenUpdate];
  }
  else
  {
    if (v3 != 3) {
      goto LABEL_26;
    }
    int v40 = 3;
    uint64_t v37 = self;
    uint64_t v38 = v6;
    id v39 = v5;
    id v11 = _MCLogObjects[12];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: removing profiles", buf, 2u);
    }
    BOOL v12 = [v10 identifiersOfInstalledProfilesWithFilterFlags:19, v9];
    uint64_t v51 = kMCRemoveProfileOptionRemovedDueToMigrationFromOtherDevice;
    v52 = &__kCFBooleanTrue;
    id v13 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v3 = v12;
    id v14 = [(id)v3 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v46;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v46 != v16) {
            objc_enumerationMutation((id)v3);
          }
          uint64_t v18 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          [v10 removeProfileWithIdentifier:v18 installationType:1 options:v13 source:@"Migrator System Profile Removal"];
        }
        id v15 = [(id)v3 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v15);
    }
    id v36 = v8;

    [v10 identifiersOfInstalledProfilesWithFilterFlags:9];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = [v20 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v42;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v42 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v41 + 1) + 8 * (void)j);
          [v10 removeProfileWithIdentifier:v25 installationType:2 options:v13 source:@"Migrator User Profile Removal"];
        }
        id v22 = [v20 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v22);
    }

    SecTrustStoreForDomain();
    int v27 = SecTrustStoreRemoveAll();
    __int16 v28 = _MCLogObjects[12];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v54) = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "MCCleanupMigrator: removed all certificate trust settings (%i)", buf, 8u);
    }

    uint64_t v6 = v38;
    id v5 = v39;
    id v8 = v36;
    self = v37;
    id v9 = v35;
  }

  LODWORD(v3) = v40;
LABEL_26:
  BOOL v29 = +[MCProfileConnection sharedConnection];
  [v29 checkCarrierProfile];

  if ((v3 - 1) <= 1) {
    [(MCMigrator *)self _removeOSXServerPayloadAccount];
  }
  if ((v3 & 0xFFFFFFFE) == 2)
  {
    [(MCMigrator *)self _removeHardwareBoundPayloads];
    v30 = +[MCRestrictionManagerWriter sharedManager];
    [v30 setBoolValue:1 forSetting:MCFeatureDefaultBrowserPromptingAllowed sender:@"MCCleanupMigrator.migrateCleanupMigratorWithContext"];
  }
  else if (!v3)
  {
    goto LABEL_34;
  }
  unsigned int v31 = _MCLogObjects[9];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Fixing orphaned accounts...", buf, 2u);
  }
  +[MCAccountUtilities checkAccountConsistencyAndReleaseOrphanedAccounts];
  +[DMCEnrollmentAccountUtilities removeOrphanedEnrollmentAccounts];
LABEL_34:
  long long v32 = +[MCProfileConnection sharedConnection];
  long long v33 = [v32 unverifiedInstalledMDMProfileIdentifier];

  if (v33) {
    +[MDMProvisioningProfileTrust didEnrollInMDMWithPasscode:0 duringMigration:1];
  }
  [(MCNotifier *)self->_notifier sendCleanupMigrationFinishedNotification];
  long long v34 = _MCLogObjects[12];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "MCCleanupMigrator: work complete", buf, 2u);
  }
}

- (void)migrateWithPostMigrationTaskQueue:(id)a3
{
  BOOL v4 = a3;
  id v28 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"profiled-MigrateWithPostMigrationTask"];
  id v5 = [(MCMigrator *)self _lastSystemMigratedBuildVersion];

  uint64_t v6 = _MCLogObjects[12];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = "NO";
    if (!v5) {
      id v7 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    unsigned int v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Managed Configuration migrating (erase = %s) ...", buf, 0xCu);
  }
  [(MCMigrator *)self _createDirectories];
  +[MCServerSideHacks setAllowHacksToCallExternalComponents:0];
  if (v5)
  {
    [(MCMigrator *)self _removeInvalidOptionsFromLegacyCloudConfiguration];
    [(MCMigrator *)self _createSystemGroupContainerAndMoveFiles];
    [(MCMigrator *)self _moveFilesToPublicDirectories];
    [(MCMigrator *)self _migrateManifestLocation];
    [(MCMigrator *)self _removeUnusedManifestArrays];
    [(MCMigrator *)self _removeDuplicatedHiddenIdentifiers];
    [(MCMigrator *)self _createStubs];
    [(MCMigrator *)self _removeOrphanedManifestEntries];
    [(MCMigrator *)self _transferSignerCertificates];
    [(MCMigrator *)self _transferRemovalPasswordsFromOriginalProfiles];
    [(MCMigrator *)self _migrateOTAProfiles];
    [(MCMigrator *)self _transferInstallationDatesFromOriginalProfiles];
    [(MCMigrator *)self _transferTagsToProfileStubs];
    [(MCMigrator *)self _removeOriginalCopies];
  }
  else
  {
    [(MCMigrator *)self _createSystemGroupContainerAndMoveFiles];
  }
  [(MCMigrator *)self _applyDefaultSettings];
  if (![(MCMigrator *)self _isMultiUserMode]) {
    [(MCMigrator *)self _migrateSettings];
  }
  if (v5)
  {
    [(MCMigrator *)self _migrateClientRestrictions];
    [(MCMigrator *)self _updateClientRestrictions];
    [(MCMigrator *)self _updateProfileRestrictions];
    [(MCMigrator *)self _applyImpliedSettings];
    [(MCMigrator *)self _migrateSharedDeviceConfiguration];
    [(MCMigrator *)self _migrateLostModeLastLocationRequestDate];
    [(MCMigrator *)self _fixManifestFromStubsIfNecessary];
    id v8 = +[MCManifest sharedManifest];
    [v8 invalidateCache];

    [(MCMigrator *)self _migrateSupervisionSettings];
    [(MCMigrator *)self _removeSupervisionProfiles];
    [(MCMigrator *)self _cleanUpAppConfiguration];
    [(MCMigrator *)self _removeUnmanageableApps];
  }
  else
  {
    [(MCMigrator *)self _updateClientRestrictions];
    [(MCMigrator *)self _updateProfileRestrictions];
    [(MCMigrator *)self _applyImpliedSettings];
    [(MCMigrator *)self _fixManifestFromStubsIfNecessary];
  }
  v10 = +[MCInstaller sharedInstaller];
  [v10 recomputeProfileRestrictionsWithCompletionBlock:&stru_1000EB918];

  id v11 = +[MCRestrictionManager sharedManager];
  BOOL v12 = [v11 systemUserSettings];
  id v13 = [v12 mutableCopy];

  id v14 = +[MCHacks sharedHacks];
  [v14 _applyInternalDiagnosticEnforcementToSettings:v13];

  id v15 = +[MCHacks sharedHacks];
  uint64_t v16 = +[MCRestrictionManager sharedManager];
  long long v17 = [v16 currentRestrictions];
  [v15 _applyImpliedSettingsToSettingsDictionary:v13 currentSettings:v13 restrictions:v17];

  uint64_t v18 = +[MCRestrictionManagerWriter sharedManager];
  [v18 setParametersForSettingsByType:v13 sender:@"MCMigrator.Migrate"];

  if (v5)
  {
    [(MCMigrator *)self _migrateProfileStubsForNetworkExtension];
    [(MCMigrator *)self _migrateExtensibleSSO];
    GSFontInitialize();
    uint64_t v19 = +[MCHacks sharedHacks];
    id v20 = +[MCRestrictionManagerWriter sharedManager];
    id v21 = [v20 effectiveUserSettings];
    [v19 _setRequriesEncryptedBackupInLockdownWithEffectiveUserSettings:v21];

    [(MCMigrator *)self _correctInstallOptionsOnProfileStubs];
    [(MCMigrator *)self _tagManagedAccounts];
    [(MCMigrator *)self _tagIMAPAccountsWithProfileAndPayloadProperties];
    [(MCMigrator *)self _correctCloudConfigurationIfNecessary];
    [(MCMigrator *)self _validateCloudConfiguration];
    [(MCMigrator *)self _removeLegacyAPNConfigurations];
    [(MCMigrator *)self _correctMDMConfigurationFile];
    [(MCMigrator *)self _checkValidUserEnrollment];
  }
  else
  {
    [(MCMigrator *)self _migrateExtensibleSSO];
    GSFontInitialize();
  }
  +[MCServerSideHacks setAllowHacksToCallExternalComponents:1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003333C;
  block[3] = &unk_1000EAC80;
  block[4] = self;
  dispatch_async(v4, block);
  id v22 = +[MCProvisioningProfileJanitor sharedJanitor];
  [v22 updateMISTrust];

  uint64_t v23 = MCProductBuildVersion();
  id v24 = [(MCMigrator *)self systemMetadataDictionary];
  uint64_t v25 = kMCMetaLastMigratedBuildKey;
  [v24 setObject:v23 forKey:kMCMetaLastMigratedBuildKey];
  [(MCMigrator *)self setSystemMetadataDictionary:v24];
  int v26 = [(MCMigrator *)self userMetadataDictionary];
  [v26 setObject:v23 forKey:v25];
  [(MCMigrator *)self setUserMetadataDictionary:v26];
  int v27 = _MCLogObjects[12];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Managed Configuration completed migration.", buf, 2u);
  }
}

- (void)_createDirectoryAtPath:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(MCMigrator *)self fileManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:v7];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(MCMigrator *)self fileManager];
    [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
  }
}

- (void)_createDirectoryAtPath:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MCMigrator *)self fileManager];
  unsigned __int8 v9 = [v8 fileExistsAtPath:v6];

  if ((v9 & 1) == 0)
  {
    v10 = [(MCMigrator *)self fileManager];
    id v13 = 0;
    [v10 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v7 error:&v13];
    id v11 = v13;

    if (v11)
    {
      BOOL v12 = _MCLogObjects[12];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to create directory with error %{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)_fixDirectoryAtPath:(id)a3 permissions:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(MCMigrator *)self fileManager];
  unsigned int v8 = [v7 fileExistsAtPath:v10];

  if (v8)
  {
    unsigned __int8 v9 = [(MCMigrator *)self fileManager];
    [v9 setAttributes:v6 ofItemAtPath:v10 error:0];
  }
}

- (void)_createDirectories
{
  BOOL v4 = MCSystemPreferencesDirectory();
  [(MCMigrator *)self _createDirectoryAtPath:v4];

  unsigned __int8 v5 = +[NSNumber numberWithUnsignedLong:493];
  id v6 = +[NSDictionary dictionaryWithObject:v5 forKey:NSFilePosixPermissions];

  id v7 = MCLegacyProfileStorageDirectory();
  [(MCMigrator *)self _fixDirectoryAtPath:v7 permissions:v6];

  unsigned int v8 = MCSystemPreferencesDirectory();
  [(MCMigrator *)self _fixDirectoryAtPath:v8 permissions:v6];

  unsigned __int8 v9 = MCLegacyPublicInfoDirectory();
  [(MCMigrator *)self _fixDirectoryAtPath:v9 permissions:v6];
}

- (void)_removeInvalidOptionsFromLegacyCloudConfiguration
{
  BOOL v4 = [(MCMigrator *)self fileManager];
  unsigned __int8 v5 = MCLegacyCloudConfigurationDetailsFilePath();
  unsigned int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    id v7 = MCLegacyCloudConfigurationDetailsFilePath();
    unsigned int v8 = +[NSMutableDictionary dictionaryWithContentsOfFile:v7];

    uint64_t v9 = kCCIsMultiUserKey;
    id v10 = [v8 objectForKeyedSubscript:kCCIsMultiUserKey];
    unsigned int v11 = [v10 BOOLValue];

    if (v11)
    {
      [v8 removeObjectForKey:v9];
      BOOL v12 = _MCLogObjects[12];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removing invalid options from legacy cloud configuration...", v14, 2u);
      }
      id v13 = MCLegacyCloudConfigurationDetailsFilePath();
      [v8 MCWriteToBinaryFile:v13];
    }
  }
}

- (void)_createSystemGroupContainerAndMoveFiles
{
  BOOL v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Migrating legacy profile storage directory to system group container...", buf, 2u);
  }
  [(MCMigrator *)self _createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary];
  unsigned __int8 v5 = MCSystemPublicInfoDirectory();
  unsigned int v6 = [(MCMigrator *)self _attributesForSystemProfileStorageItems];
  [(MCMigrator *)self _createDirectoryAtPath:v5 attributes:v6];

  id v7 = MCUserProfileStorageDirectory();
  unsigned int v8 = [(MCMigrator *)self _attributesForUserProfileStorageItem];
  [(MCMigrator *)self _createDirectoryAtPath:v7 attributes:v8];

  uint64_t v9 = MCUserPublicInfoDirectory();
  id v10 = [(MCMigrator *)self _attributesForUserProfileStorageItem];
  [(MCMigrator *)self _createDirectoryAtPath:v9 attributes:v10];

  [(MCMigrator *)self _fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents];
  [(MCMigrator *)self _sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage];
  unsigned int v11 = _MCLogObjects[12];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Completed system group container migration.", v12, 2u);
  }
}

- (void)_fixPermissionsOnTheSystemProfileLibraryDirectoryAndContents
{
  id v2 = [(MCMigrator *)self fileManager];
  uint64_t v3 = MCSystemProfileLibraryDirectory();
  char v4 = MCFixPermissionsOfSystemGroupContainerDirectoryAndContentsFM();
  id v5 = 0;

  if ((v4 & 1) == 0)
  {
    if ([v5 count])
    {
      unsigned int v6 = _MCLogObjects[12];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v8 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to fix permissions of device profile library with errors %{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)_sendCloudConfigurationChangedNotificationIfWeMigratedLegacyProfileStorage
{
  if ([(MCMigrator *)self systemProfileStorageWasMigratedFromLegacyStorage])
  {
    id v3 = [(MCMigrator *)self notifier];
    [v3 sendCloudConfigurationDetailsChangedNotification];
  }
}

- (void)_createSystemProfileStorageDirectoryMigratingFromLegacyStorageIfNecessary
{
  [(MCMigrator *)self setSystemProfileStorageWasMigratedFromLegacyStorage:0];
  if ([(MCMigrator *)self _shouldAttemptToMigrateLegacyProfileStorage]) {
    [(MCMigrator *)self _migrateLegacySystemProfileStorage];
  }
  id v3 = [(MCMigrator *)self fileManager];
  char v4 = MCSystemProfileStorageDirectory();
  unsigned __int8 v5 = [v3 fileExistsAtPath:v4];

  if ((v5 & 1) == 0)
  {
    unsigned int v6 = MCSystemProfileStorageDirectory();
    id v7 = [(MCMigrator *)self _attributesForSystemProfileStorageItems];
    [(MCMigrator *)self _createDirectoryAtPath:v6 attributes:v7];
  }

  [(MCMigrator *)self _removeLegacyProfileStorageDirectory];
}

- (void)_migrateLegacySystemProfileStorage
{
  [(MCMigrator *)self _removeExistingSystemProfileStorageDirectoryBlockingMigration];
  id v3 = MCLegacyProfileStorageDirectory();
  char v4 = MCSystemProfileStorageDirectory();
  id v11 = 0;
  unsigned __int8 v5 = [(MCMigrator *)self _copyAlmostAtomicallyItemAtPath:v3 toPath:v4 error:&v11];
  id v6 = v11;

  if ((v5 & 1) == 0)
  {
    id v7 = _MCLogObjects[12];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to move legacy profile storage with error %{public}@", buf, 0xCu);
    }
  }
  id v8 = [(MCMigrator *)self fileManager];
  uint64_t v9 = MCSystemProfileStorageDirectory();
  unsigned int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    [(MCMigrator *)self _setAttributesOnSystemProfileStorageDirectory];
    [(MCMigrator *)self setSystemProfileStorageWasMigratedFromLegacyStorage:1];
  }
}

- (void)_removeExistingSystemProfileStorageDirectoryBlockingMigration
{
  id v2 = [(MCMigrator *)self fileManager];
  id v3 = MCSystemProfileStorageDirectory();
  id v11 = 0;
  unsigned int v4 = [v2 removeItemAtPath:v3 error:&v11];
  id v5 = v11;

  id v6 = _MCLogObjects[12];
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v7 = "Removed the system profile storage directory blocking migration from legacy directory";
      id v8 = v6;
      os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, buf, v10);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    id v7 = "Failed to remove the system profile storage directory blocking migration from legacy directory, error: %{public}@";
    id v8 = v6;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
}

- (void)_setAttributesOnSystemProfileStorageDirectory
{
  id v3 = [(MCMigrator *)self fileManager];
  unsigned int v4 = [(MCMigrator *)self _attributesForSystemProfileStorageItems];
  id v5 = MCSystemProfileStorageDirectory();
  id v9 = 0;
  unsigned __int8 v6 = [v3 setAttributes:v4 ofItemAtPath:v5 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    id v8 = _MCLogObjects[12];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to set permissions on new profile storage directory with error %{public}@", buf, 0xCu);
    }
  }
}

- (id)_attributesForSystemProfileStorageItems
{
  return [(MCMigrator *)self _attributeDictionaryForProfileStorageWithPosixPermissions:511];
}

- (id)_attributesForUserProfileStorageItem
{
  return [(MCMigrator *)self _attributeDictionaryForProfileStorageWithPosixPermissions:493];
}

- (id)_attributeDictionaryForProfileStorageWithPosixPermissions:(unint64_t)a3
{
  v6[0] = NSFilePosixPermissions;
  id v3 = +[NSNumber numberWithUnsignedLong:a3];
  v6[1] = NSFileProtectionKey;
  v7[0] = v3;
  v7[1] = NSFileProtectionNone;
  unsigned int v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (BOOL)_copyAlmostAtomicallyItemAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint32_t v10 = [v8 stringByDeletingLastPathComponent];
  id v11 = [v8 lastPathComponent];
  BOOL v12 = [v11 stringByAppendingString:@".temporary"];
  id v13 = [v10 stringByAppendingPathComponent:v12];
  if ((MCDestinationPathIsSafeFromSymlinkAttacks() & 1) == 0)
  {
    id v14 = _MCLogObjects[12];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Destination path contains suspicious symlink: %{public}@", buf, 0xCu);
    }
  }
  id v15 = [(MCMigrator *)self fileManager];
  [v15 removeItemAtPath:v13 error:0];

  uint64_t v16 = [(MCMigrator *)self fileManager];
  id v30 = 0;
  unsigned __int8 v17 = [v16 copyItemAtPath:v9 toPath:v13 error:&v30];

  id v18 = v30;
  if (v17)
  {
    int v27 = a5;
    uint64_t v19 = [(MCMigrator *)self fileManager];
    id v29 = 0;
    unsigned __int8 v20 = [v19 moveItemAtPath:v13 toPath:v8 error:&v29];
    id v21 = v29;

    if ((v20 & 1) == 0)
    {
      id v22 = [(MCMigrator *)self fileManager];
      id v28 = 0;
      unsigned __int8 v23 = [v22 removeItemAtPath:v13 error:&v28];
      id v26 = v28;

      if ((v23 & 1) == 0)
      {
        id v24 = _MCLogObjects[12];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v32 = v26;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to clean up temporary item when copy failed, error %{public}@", buf, 0xCu);
        }
      }
      if (v27) {
        id *v27 = v21;
      }
    }
  }
  else
  {
    unsigned __int8 v20 = 0;
    if (a5) {
      *a5 = v18;
    }
  }

  return v20;
}

- (BOOL)_shouldAttemptToMigrateLegacyProfileStorage
{
  if ([(MCMigrator *)self _isLegacyProfileStoragePresent])
  {
    id v3 = MCLegacyProfileStorageDirectory();
    unsigned int v4 = ![(MCMigrator *)self _isDirectoryEmptyAtPath:v3];
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_isLegacyProfileStoragePresent
{
  char v6 = 0;
  id v2 = [(MCMigrator *)self fileManager];
  id v3 = MCLegacyProfileStorageDirectory();
  unsigned __int8 v4 = [v2 fileExistsAtPath:v3 isDirectory:&v6];

  if (v6) {
    return v4;
  }
  else {
    return 0;
  }
}

- (BOOL)_isDirectoryEmptyAtPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MCMigrator *)self fileManager];
  char v6 = [v5 contentsOfDirectoryAtPath:v4 error:0];

  if (v6) {
    BOOL v7 = [v6 count] == 0;
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)_removeLegacyProfileStorageDirectory
{
  id v2 = [(MCMigrator *)self fileManager];
  id v3 = MCLegacyProfileStorageDirectory();
  id v9 = 0;
  unsigned __int8 v4 = [v2 removeItemAtPath:v3 error:&v9];
  id v5 = v9;

  if ((v4 & 1) == 0)
  {
    char v6 = [v5 domain];
    if ([v6 isEqualToString:NSCocoaErrorDomain])
    {
      id v7 = [v5 code];

      if (v7 == (id)4) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    id v8 = _MCLogObjects[12];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to delete legacy profile storage with error %{public}@", buf, 0xCu);
    }
  }
LABEL_8:
}

- (void)_moveFilesToPublicDirectories
{
  unsigned __int8 v4 = MCSystemProfileStorageDirectory();
  id v5 = [v4 stringByAppendingPathComponent:@"Truth.plist"];

  char v6 = [(MCMigrator *)self fileManager];
  id v7 = MCRestrictionsFilePath();
  [v6 moveItemAtPath:v5 toPath:v7 error:0];

  id v8 = [(MCMigrator *)self fileManager];
  id v9 = MCEffectiveUserSettingsFilePath();
  [v8 removeItemAtPath:v9 error:0];

  uint32_t v10 = [(MCMigrator *)self fileManager];
  id v11 = MCPublicEffectiveUserSettingsFilePath();
  [v10 removeItemAtPath:v11 error:0];

  BOOL v12 = MCSystemProfileStorageDirectory();
  id v13 = [v12 stringByAppendingPathComponent:@"MCMeta.plist"];

  id v14 = [(MCMigrator *)self fileManager];
  id v15 = MCSystemMetadataFilePath();
  [v14 moveItemAtPath:v13 toPath:v15 error:0];
}

- (void)_migrateManifestLocation
{
  unsigned __int8 v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning manifest migration...", buf, 2u);
  }
  id v5 = MCSystemProfileStorageDirectory();
  char v6 = [v5 stringByAppendingPathComponent:@"PayloadManifest.plist"];

  id v7 = MCSystemProfileStorageDirectory();
  id v8 = [v7 stringByAppendingPathComponent:@"PayloadManifest2.plist"];

  id v9 = [(MCMigrator *)self fileManager];
  unsigned int v10 = [v9 fileExistsAtPath:v6];

  id v11 = [(MCMigrator *)self fileManager];
  unsigned int v12 = [v11 fileExistsAtPath:v8];

  if ((v10 & 1) != 0 || v12)
  {
    if (v10)
    {
      id v13 = +[NSData dataWithContentsOfFile:v6];
      if (v13)
      {
        id v14 = +[NSPropertyListSerialization MCSafePropertyListWithData:v13 options:0 format:0 error:0];
        if (v14)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v15 = 1;
            int v16 = 2;
            goto LABEL_14;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v16 = 1;
            char v15 = 1;
LABEL_14:

            if (v12)
            {
              uint64_t v17 = +[NSDictionary dictionaryWithContentsOfFile:v8];
              if (v17)
              {
                id v18 = (void *)v17;
                uint64_t v19 = _MCLogObjects[12];
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)id v32 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Migrating manifest from new path", v32, 2u);
                }
                unsigned __int8 v20 = MCSystemManifestPath();
                [v18 MCWriteToBinaryFile:v20];

                id v21 = [(MCMigrator *)self fileManager];
                [v21 removeItemAtPath:v8 error:0];

LABEL_28:
                id v28 = _MCLogObjects[12];
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)id v29 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Completed manifest migration.", v29, 2u);
                }

                goto LABEL_31;
              }
              id v22 = [(MCMigrator *)self fileManager];
              [v22 removeItemAtPath:v8 error:0];
            }
            unsigned __int8 v23 = _MCLogObjects[12];
            BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
            char v25 = v15 ^ 1;
            if (v16 != 1) {
              char v25 = 1;
            }
            if (v25)
            {
              if (v24)
              {
                *(_WORD *)id v30 = 0;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Not migrating manifest", v30, 2u);
              }
            }
            else
            {
              if (v24)
              {
                *(_WORD *)unsigned int v31 = 0;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Migrating old-format manifest", v31, 2u);
              }
              id v26 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:1];
              [v26 setObject:v14 forKey:@"OrderedProfiles"];
              int v27 = MCSystemManifestPath();
              [v26 MCWriteToBinaryFile:v27];
            }
            goto LABEL_28;
          }
        }
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
    id v13 = [(MCMigrator *)self fileManager];
    [v13 removeItemAtPath:v6 error:0];
    int v16 = 0;
    char v15 = 0;
    goto LABEL_14;
  }
LABEL_31:
}

- (void)_removeUnusedManifestArrays
{
  unsigned __int8 v4 = MCSystemProfileStorageDirectory();
  id v5 = [v4 stringByAppendingPathComponent:@"PayloadManifest.plist"];

  char v6 = +[NSData dataWithContentsOfFile:v5];
  id v7 = +[NSPropertyListSerialization MCSafePropertyListWithData:v6 options:2 format:0 error:0];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v7 removeObjectForKey:@"DisabledProfiles"];
    [v7 removeObjectForKey:@"MissingProfiles"];
    [v7 MCWriteToBinaryFile:v5];
  }
  else
  {
    id v8 = [(MCMigrator *)self fileManager];
    [v8 removeItemAtPath:v5 error:0];
  }
}

- (void)_removeDuplicatedHiddenIdentifiers
{
  unsigned __int8 v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing duplicated hidden profile identifiers...", buf, 2u);
  }
  id v5 = MCSystemProfileStorageDirectory();
  char v6 = [v5 stringByAppendingPathComponent:@"PayloadManifest.plist"];

  id v7 = +[NSData dataWithContentsOfFile:v6];
  id v8 = +[NSPropertyListSerialization MCSafePropertyListWithData:v7 options:2 format:0 error:0];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = [v8 objectForKey:@"OrderedProfiles"];
    unsigned int v10 = [v8 objectForKey:@"HiddenProfiles"];
    id v11 = v10;
    if (v9 && v10)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v11);
            }
            [v9 removeObject:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          }
          id v13 = [v11 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v13);
      }
      [v8 MCWriteToBinaryFile:v6];
    }
  }
  else
  {
    id v9 = [(MCMigrator *)self fileManager];
    [v9 removeItemAtPath:v6 error:0];
  }

  int v16 = _MCLogObjects[12];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Completed removing duplicated hidden profile identifiers.", buf, 2u);
  }
}

- (void)_createStubs
{
  id v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating stubs...", buf, 2u);
  }
  unsigned __int8 v4 = MCSystemProfileStorageDirectory();
  id v5 = [v4 stringByAppendingPathComponent:@"PayloadManifest.plist"];

  char v6 = +[NSData dataWithContentsOfFile:v5];
  id v7 = +[NSPropertyListSerialization MCSafePropertyListWithData:v6 options:0 format:0 error:0];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v36 = v5;
      uint64_t v37 = v2;
      id v8 = [v7 objectForKey:@"HiddenProfiles"];
      id v9 = [v8 mutableCopy];

      id v35 = v7;
      unsigned int v10 = [v7 objectForKey:@"OrderedProfiles"];
      [v9 addObjectsFromArray:v10];

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = v9;
      id v11 = &os_unfair_lock_unlock_ptr;
      id v40 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
      if (!v40) {
        goto LABEL_21;
      }
      uint64_t v39 = *(void *)v44;
      while (1)
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v44 != v39) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          char v15 = MCSystemProfileStorageDirectory();
          int v16 = [v13 MCOldStyleSafeFilenameHash];
          long long v17 = [v15 stringByAppendingPathComponent:v16];

          long long v18 = MCSystemProfileStorageDirectory();
          long long v19 = [v13 MCOldStyleSafeFilenameHashWithExtension:@"stub"];
          long long v20 = [v18 stringByAppendingPathComponent:v19];

          id v21 = MCSystemProfileStorageDirectory();
          id v22 = [v13 MCHashedFilenameWithExtension:@"stub"];
          unsigned __int8 v23 = [v21 stringByAppendingPathComponent:v22];

          BOOL v24 = [(MCMigrator *)self fileManager];
          LODWORD(v22) = [v24 fileExistsAtPath:v17];

          if (v22)
          {
            char v25 = [v11[443] dataWithContentsOfFile:v17];
            id v26 = +[MCProfile profileWithData:v25 outError:0];

            if (v26)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v26 writeStubToPath:v23];
              }
            }
          }
          else
          {
            int v27 = [(MCMigrator *)self fileManager];
            unsigned int v28 = [v27 fileExistsAtPath:v20];

            if (!v28) {
              goto LABEL_19;
            }
            id v29 = [(MCMigrator *)self fileManager];
            id v42 = 0;
            [v29 moveItemAtPath:v20 toPath:v23 error:&v42];
            id v26 = v42;

            if (v26)
            {
              os_log_t v30 = _MCLogObjects[12];
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                unsigned int v31 = v30;
                id v32 = [v26 code];
                long long v33 = [v26 domain];
                *(_DWORD *)buf = 138544130;
                long long v48 = v20;
                __int16 v49 = 2114;
                v50 = v23;
                __int16 v51 = 2048;
                id v52 = v32;
                __int16 v53 = 2114;
                v54 = v33;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Could not move profile from %{public}@ to %{public}@. Error: %ld / %{public}@", buf, 0x2Au);

                id v11 = &os_unfair_lock_unlock_ptr;
              }
            }
          }

LABEL_19:
        }
        id v40 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (!v40)
        {
LABEL_21:

          long long v34 = _MCLogObjects[12];
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Completed creating stubs.", buf, 2u);
          }

          id v5 = v36;
          id v2 = v37;
          id v7 = v35;
          break;
        }
      }
    }
  }
}

- (void)_removeOrphanedManifestEntries
{
  unsigned __int8 v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing orphaned profiles...", buf, 2u);
  }
  id v5 = MCSystemProfileStorageDirectory();
  char v6 = [(MCMigrator *)self _removeOrphanedManifestEntriesFromManifestInDirectory:v5];

  if (v6)
  {
    id v7 = MCSystemManifestPath();
    [v6 MCWriteToBinaryFile:v7];
  }
  id v8 = MCUserProfileStorageDirectory();
  id v9 = [(MCMigrator *)self _removeOrphanedManifestEntriesFromManifestInDirectory:v8];

  if (v9)
  {
    unsigned int v10 = MCUserManifestPath();
    [v9 MCWriteToBinaryFile:v10];
  }
  id v11 = _MCLogObjects[12];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Completed removing orphaned profiles...", v12, 2u);
  }
}

- (id)_removeOrphanedManifestEntriesFromManifestInDirectory:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 stringByAppendingPathComponent:@"PayloadManifest.plist"];
  id v5 = +[NSData dataWithContentsOfFile:v4];
  char v6 = +[NSPropertyListSerialization MCSafePropertyListWithData:v5 options:1 format:0 error:0];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v31 = v4;
    id v32 = v6;
    id v7 = [v6 objectForKey:@"OrderedProfiles"];
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v40;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v14 = [v13 MCHashedFilenameWithExtension:@"stub"];
          char v15 = [v3 stringByAppendingPathComponent:v14];

          int v16 = +[NSData dataWithContentsOfFile:v15];
          long long v17 = +[MCProfile profileWithData:v16 outError:0];

          if (v17) {
            [obj addObject:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v10);
    }

    [v32 setObject:obj forKey:@"OrderedProfiles"];
    long long v18 = [v32 objectForKey:@"HiddenProfiles"];
    long long v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v18 count]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obja = v18;
    id v20 = [obja countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v36;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(obja);
          }
          BOOL v24 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
          char v25 = [v24 MCHashedFilenameWithExtension:@"stub"];
          id v26 = [v3 stringByAppendingPathComponent:v25];

          int v27 = +[NSData dataWithContentsOfFile:v26];
          unsigned int v28 = +[MCProfile profileWithData:v27 outError:0];

          if (v28) {
            [v19 addObject:v24];
          }
        }
        id v21 = [obja countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v21);
    }

    char v6 = v32;
    [v32 setObject:v19 forKey:@"HiddenProfiles"];

    id v29 = v32;
    unsigned __int8 v4 = v31;
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (void)_moveSignerCertificatesInProfileStubDictionary:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 objectForKeyedSubscript:@"ProfileData"];
  if (v4)
  {
    id v20 = 0;
    id v5 = +[MCProfile dataFromCMSEncodedData:v4 outSignerCertificates:&v20];
    id v6 = v20;
    if ([v6 count])
    {
      id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          id v12 = 0;
          do
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(__SecCertificate **)(*((void *)&v16 + 1) + 8 * (void)v12);
            CFDataRef v15 = SecCertificateCopyData(v13);
            if (v15) {
              [v7 addObject:v15, v16];
            }

            id v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v10);
      }

      [v3 setObject:v7 forKeyedSubscript:@"SignerCerts"];
    }
    [v3 removeObjectForKey:@"ProfileData" v16];
    [v3 removeObjectForKey:@"SignerSummary"];
  }
}

- (void)_transferSignerCertificates
{
  unsigned __int8 v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Transferring profile signer certificates...", buf, 2u);
  }
  id v5 = MCSystemProfileStorageDirectory();
  id v6 = [v5 stringByAppendingPathComponent:@"PayloadManifest.plist"];

  id v7 = &os_unfair_lock_unlock_ptr;
  id v8 = +[NSData dataWithContentsOfFile:v6];
  id v9 = +[NSPropertyListSerialization MCSafePropertyListWithData:v8 options:0 format:0 error:0];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v46 = v6;
      long long v47 = v3;
      v50 = self;
      id v10 = [v9 objectForKey:@"HiddenProfiles"];
      id v11 = [v10 mutableCopy];

      long long v45 = v9;
      id v12 = [v9 objectForKey:@"OrderedProfiles"];
      [v11 addObjectsFromArray:v12];

      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id obj = v11;
      id v13 = &os_unfair_lock_unlock_ptr;
      id v51 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (v51)
      {
        uint64_t v14 = *(void *)v59;
        uint64_t v48 = *(void *)v59;
        do
        {
          for (i = 0; i != v51; i = (char *)i + 1)
          {
            if (*(void *)v59 != v14) {
              objc_enumerationMutation(obj);
            }
            long long v16 = *(void **)(*((void *)&v58 + 1) + 8 * i);
            long long v18 = MCSystemProfileStorageDirectory();
            long long v19 = [v16 MCOldStyleSafeFilenameHash];
            id v20 = [v18 stringByAppendingPathComponent:v19];

            id v21 = MCSystemProfileStorageDirectory();
            uint64_t v22 = [v16 MCHashedFilenameWithExtension:@"stub"];
            unsigned __int8 v23 = [v21 stringByAppendingPathComponent:v22];

            BOOL v24 = [v7[443] dataWithContentsOfFile:v23];
            char v25 = +[MCProfile profileWithData:v24 outError:0];

            id v26 = [v7[443] dataWithContentsOfFile:v20];
            if (v26) {
              BOOL v27 = v25 == 0;
            }
            else {
              BOOL v27 = 1;
            }
            if (!v27)
            {
              id v57 = 0;
              id v28 = +[MCProfile dataFromCMSEncodedData:v26 outSignerCertificates:&v57];
              id v29 = v57;
              if (!v28) {
                id v28 = v26;
              }
              os_log_t v30 = [v13[462] MCSafePropertyListWithData:v28 options:0 format:0 error:0];
              if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                unsigned int v31 = [v30 objectForKey:@"EncryptedPayloadContent"];

                BOOL v27 = v31 == 0;
                id v13 = &os_unfair_lock_unlock_ptr;
                uint64_t v32 = !v27;
              }
              else
              {
                uint64_t v32 = 0;
              }
              [v25 setEncrypted:v32];
              if ([v29 count]) {
                [v25 setSignerCertificates:v29];
              }
              [v25 writeStubToPath:v23];

              id v7 = &os_unfair_lock_unlock_ptr;
              uint64_t v14 = v48;
            }
          }
          id v51 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
        }
        while (v51);
      }

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v52 = obj;
      id v33 = [v52 countByEnumeratingWithState:&v53 objects:v63 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v54;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(void *)v54 != v35) {
              objc_enumerationMutation(v52);
            }
            long long v37 = *(void **)(*((void *)&v53 + 1) + 8 * (void)j);
            long long v38 = MCSystemProfileStorageDirectory();
            long long v39 = [v37 MCHashedFilenameWithExtension:@"stub"];
            long long v40 = [v38 stringByAppendingPathComponent:v39];

            long long v41 = +[NSMutableDictionary dictionaryWithContentsOfFile:v40];
            if (v41)
            {
              [(MCMigrator *)v50 _moveSignerCertificatesInProfileStubDictionary:v41];
              long long v42 = [v41 objectForKeyedSubscript:@"OTAProfileStub"];
              id v43 = [v42 mutableCopy];

              if (v43)
              {
                [(MCMigrator *)v50 _moveSignerCertificatesInProfileStubDictionary:v43];
                [v41 setObject:v43 forKeyedSubscript:@"OTAProfileStub"];
              }
              [v41 MCWriteToBinaryFile:v40];
            }
          }
          id v34 = [v52 countByEnumeratingWithState:&v53 objects:v63 count:16];
        }
        while (v34);
      }

      long long v44 = _MCLogObjects[12];
      id v6 = v46;
      id v3 = v47;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Completed transferring profile signer certificates.", buf, 2u);
      }

      id v9 = v45;
    }
  }
}

- (void)_transferRemovalPasswordsFromOriginalProfiles
{
  id v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Migrating profile removal passwords...", buf, 2u);
  }
  id v3 = +[MCInstaller sharedInstaller];
  unsigned __int8 v4 = [v3 identifiersOfInstalledProfilesWithFilterFlags:3];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v4;
  id v34 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v41;
    id v5 = &os_unfair_lock_unlock_ptr;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v9 = MCSystemProfileStorageDirectory();
        id v10 = [v7 MCOldStyleSafeFilenameHash];
        id v11 = [v9 stringByAppendingPathComponent:v10];

        id v12 = [v5[443] dataWithContentsOfFile:v11];
        if (v12)
        {
          uint64_t v35 = v8;
          id v13 = +[MCProfile profileWithData:v12 outError:0];
          uint64_t v14 = MCSystemProfileStorageDirectory();
          CFDataRef v15 = [v7 MCHashedFilenameWithExtension:@"stub"];
          long long v16 = [v14 stringByAppendingPathComponent:v15];

          long long v17 = [v5[443] dataWithContentsOfFile:v16];
          long long v18 = +[MCProfile profileWithData:v17 outError:0];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && v18)
          {
            [v18 setLocked:[v13 isLocked]];
            long long v19 = [v13 removalPasscode];
            if (v19)
            {
              unsigned int v31 = v13;
              [v18 setRemovalPasscode:v19];
              long long v38 = 0u;
              long long v39 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              id v20 = [v18 payloads];
              id v21 = [v20 countByEnumeratingWithState:&v36 objects:v45 count:16];
              if (v21)
              {
                id v22 = v21;
                uint64_t v23 = *(void *)v37;
                os_log_t v30 = v19;
                while (2)
                {
                  for (j = 0; j != v22; j = (char *)j + 1)
                  {
                    if (*(void *)v37 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    char v25 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v19 = v30;
                      [v25 setRemovalPasscode:v30];
                      goto LABEL_25;
                    }
                  }
                  id v22 = [v20 countByEnumeratingWithState:&v36 objects:v45 count:16];
                  long long v19 = v30;
                  if (v22) {
                    continue;
                  }
                  break;
                }
              }
LABEL_25:

              BOOL v27 = [v18 UUID];
              +[MCKeychain setString:forService:account:label:description:useSystemKeychain:outError:](MCKeychain, "setString:forService:account:label:description:useSystemKeychain:outError:", v19, @"MCProfileRemovalPasscode", v27, 0, 0, [v18 isInstalledForSystem], 0, context);

              id v13 = v31;
            }
            [v18 writeStubToPath:v16];
          }
          else
          {
            id v26 = _MCLogObjects[12];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "The original profile cannot be decrypted. Removing the lock on the profile.", buf, 2u);
            }
            [v18 setLocked:0];
            [v18 writeStubToPath:v16];
          }
          id v8 = v35;

          id v5 = &os_unfair_lock_unlock_ptr;
        }
      }
      id v34 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v34);
  }

  id v28 = _MCLogObjects[12];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Completed migrating profile removal passwords.", buf, 2u);
  }
}

- (void)_migrateOTAProfiles
{
  unsigned __int8 v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Migrating OTA profiles...", buf, 2u);
  }
  id v5 = MCSystemProfileStorageDirectory();
  id v6 = [v5 stringByAppendingPathComponent:@"ProfileService"];

  id v7 = MCSystemProfileStorageDirectory();
  id v8 = [v7 stringByAppendingPathComponent:@"PayloadManifest.plist"];

  id v9 = +[NSData dataWithContentsOfFile:v6];
  id v10 = +[NSPropertyListSerialization MCSafePropertyListWithData:v9 options:2 format:0 error:0];

  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v75 = [v10 objectForKey:@"Profile"];
      long long v80 = [v10 objectForKey:@"Service"];
      uint64_t v72 = [v10 objectForKey:@"SCEP"];
      id v11 = +[NSData dataWithContentsOfFile:v8];
      id v12 = +[NSPropertyListSerialization MCSafePropertyListWithData:v11 options:2 format:0 error:0];

      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = [v12 objectForKey:@"HiddenProfiles"];
          id v14 = [v13 mutableCopy];

          v63 = v12;
          CFDataRef v15 = [v12 objectForKey:@"OrderedProfiles"];
          id v16 = [v15 mutableCopy];

          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          id v17 = v14;
          id v18 = [v17 countByEnumeratingWithState:&v88 objects:v95 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v89;
            do
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v89 != v20) {
                  objc_enumerationMutation(v17);
                }
                [v16 removeObject:*(void *)(*((void *)&v88 + 1) + 8 * i)];
              }
              id v19 = [v17 countByEnumeratingWithState:&v88 objects:v95 count:16];
            }
            while (v19);
          }
          v67 = self;
          v68 = v10;
          v65 = v3;
          v66 = v8;
          int v64 = v6;
          uint64_t v69 = v17;

          id v70 = +[NSMutableArray array];
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id obj = v16;
          id v22 = v75;
          id v82 = [obj countByEnumeratingWithState:&v84 objects:v94 count:16];
          if (v82)
          {
            uint64_t v81 = *(void *)v85;
            do
            {
              for (j = 0; j != v82; j = (char *)j + 1)
              {
                if (*(void *)v85 != v81) {
                  objc_enumerationMutation(obj);
                }
                BOOL v24 = *(void **)(*((void *)&v84 + 1) + 8 * (void)j);
                id v26 = MCSystemProfileStorageDirectory();
                BOOL v27 = [v24 MCHashedFilenameWithExtension:@"stub"];
                id v28 = [v26 stringByAppendingPathComponent:v27];

                id v29 = +[NSMutableDictionary dictionaryWithContentsOfFile:v28];
                os_log_t v30 = [v29 objectForKey:@"PayloadUUID"];
                unsigned int v31 = [v22 objectForKey:v30];
                if (v31)
                {
                  uint64_t v32 = [v80 objectForKey:v31];
                  id v33 = [v32 MCMutableDeepCopy];

                  if (v33)
                  {
                    id v34 = +[NSNumber numberWithBool:1];
                    [v33 setObject:v34 forKey:@"MCProfileIsRemovalStub"];

                    uint64_t v35 = [v33 objectForKey:@"PayloadContent"];
                    long long v36 = v35;
                    if (v35)
                    {
                      long long v37 = [v35 objectForKey:@"SCEP"];
                      if (v37)
                      {
                        long long v38 = [v72 objectForKey:v37];
                        if (v38)
                        {
                          id v73 = v38;
                          long long v39 = [v38 objectForKey:@"Persistent Reference"];
                          if (v39)
                          {
                            v76 = v39;
                            [v70 addObject:v39];
                            [v36 setObject:v76 forKey:@"EnrollmentIdentityPersistentID"];
                            [v36 removeObjectForKey:@"SCEP"];
                            [v29 setObject:v33 forKey:@"OTAProfileStub"];
                            [v29 MCWriteToBinaryFile:v28];
                            log = _MCLogObjects[12];
                            BOOL v40 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
                            long long v39 = v76;
                            if (v40)
                            {
                              *(_DWORD *)buf = 138543362;
                              long long v93 = v24;
                              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Migrated OTA profile %{public}@", buf, 0xCu);
                              long long v39 = v76;
                            }
                          }

                          long long v38 = v73;
                        }
                      }
                      id v22 = v75;
                    }
                  }
                }
              }
              id v82 = [obj countByEnumeratingWithState:&v84 objects:v94 count:16];
            }
            while (v82);
          }

          long long v41 = v69;
          id v8 = v66;
          self = v67;
          id v10 = v68;
          long long v42 = &os_unfair_lock_unlock_ptr;
          if ([v69 count])
          {
            unint64_t v43 = 0;
            do
            {
              long long v45 = [v41 objectAtIndex:v43];
              long long v46 = MCSystemProfileStorageDirectory();
              long long v47 = [v45 MCHashedFilenameWithExtension:@"stub"];
              uint64_t v48 = [v46 stringByAppendingPathComponent:v47];

              __int16 v49 = [v42[446] dictionaryWithContentsOfFile:v48];
              if (v49 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v50 = [v49 objectForKey:@"PayloadContent"];
                if (v50 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v50 count])
                {
                  uint64_t v51 = [v50 objectAtIndex:0];
                  long long v83 = (void *)v51;
                  if (v51 && (id v52 = (void *)v51, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    long long v53 = [v52 objectForKey:@"PERSISTENT_REF"];
                    if (v53 && [v70 containsObject:v53])
                    {
                      long long v54 = _MCLogObjects[12];
                      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138543362;
                        long long v93 = v45;
                        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Removing unused hidden profile %{public}@", buf, 0xCu);
                      }
                      [v69 removeObjectAtIndex:v43];
                      long long v55 = [(MCMigrator *)self fileManager];
                      long long v77 = MCSystemProfileStorageDirectory();
                      long long v56 = [v45 MCOldStyleSafeFilenameHash];
                      id v57 = [v77 stringByAppendingPathComponent:v56];
                      [v55 removeItemAtPath:v57 error:0];

                      id v74 = [(MCMigrator *)v67 fileManager];
                      long long v78 = MCSystemProfileStorageDirectory();
                      long long v58 = [v45 MCHashedFilenameWithExtension:@"stub"];
                      long long v59 = [v78 stringByAppendingPathComponent:v58];
                      [v74 removeItemAtPath:v59 error:0];

                      self = v67;
                      uint64_t v60 = 0;
                      id v8 = v66;
                    }
                    else
                    {
                      uint64_t v60 = 1;
                    }

                    id v10 = v68;
                  }
                  else
                  {
                    uint64_t v60 = 1;
                  }
                }
                else
                {
                  uint64_t v60 = 1;
                }

                long long v42 = &os_unfair_lock_unlock_ptr;
              }
              else
              {
                uint64_t v60 = 1;
              }

              v43 += v60;
              long long v41 = v69;
            }
            while (v43 < (unint64_t)[v69 count]);
          }
          id v12 = v63;
          [v63 setObject:v41 forKey:@"HiddenProfiles"];
          [v63 setObject:obj forKey:@"OrderedProfiles"];
          [v63 MCWriteToBinaryFile:v8];

          id v6 = v64;
          id v3 = v65;
        }
      }
    }
  }

  long long v61 = [(MCMigrator *)self fileManager];
  [v61 removeItemAtPath:v6 error:0];

  v62 = _MCLogObjects[12];
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Completed migrating OTA profiles.", buf, 2u);
  }
}

- (void)_transferInstallationDatesFromOriginalProfiles
{
  id v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Transferring installation dates...", buf, 2u);
  }
  unsigned __int8 v4 = +[MCInstaller sharedInstaller];
  id v5 = [v4 identifiersOfInstalledProfilesWithFilterFlags:3];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    id v28 = self;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v12 = MCSystemProfileStorageDirectory();
        id v13 = [v10 MCOldStyleSafeFilenameHash];
        id v14 = [v12 stringByAppendingPathComponent:v13];

        CFDataRef v15 = MCSystemProfileStorageDirectory();
        id v16 = [v10 MCHashedFilenameWithExtension:@"stub"];
        id v17 = [v15 stringByAppendingPathComponent:v16];

        id v18 = +[NSMutableDictionary dictionaryWithContentsOfFile:v17];
        id v19 = v18;
        if (v18)
        {
          uint64_t v20 = [v18 objectForKey:@"InstallDate"];

          if (!v20)
          {
            id v21 = [(MCMigrator *)self fileManager];
            id v22 = [v21 attributesOfItemAtPath:v14 error:0];

            if (v22)
            {
              uint64_t v23 = [v22 objectForKey:NSFileCreationDate];
              if (!v23)
              {
                uint64_t v23 = [v22 objectForKey:NSFileModificationDate];
                if (!v23) {
                  goto LABEL_20;
                }
              }
            }
            else
            {
              BOOL v24 = [(MCMigrator *)self fileManager];
              char v25 = [v24 attributesOfItemAtPath:v17 error:0];

              if (v25)
              {
                uint64_t v23 = [v25 objectForKey:NSFileCreationDate];
                if (!v23)
                {
                  uint64_t v23 = [v25 objectForKey:NSFileModificationDate];
                }
              }
              else
              {
                uint64_t v23 = 0;
              }

              self = v28;
              if (!v23) {
                goto LABEL_20;
              }
            }
            [v19 setObject:v23 forKey:@"InstallDate"];
            [v19 MCWriteToBinaryFile:v17];

LABEL_20:
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  id v26 = _MCLogObjects[12];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Completed transferring installation dates.", buf, 2u);
  }
}

- (BOOL)_applyAccountTagsToProfile:(id)a3
{
  id v3 = a3;
  if (qword_1001058B0 != -1) {
    dispatch_once(&qword_1001058B0, &stru_1000EB938);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v16 = v3;
  unsigned __int8 v4 = [v3 payloads];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v5)
  {
    char v7 = 0;
    goto LABEL_22;
  }
  id v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v18;
  do
  {
    id v9 = 0;
    do
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v9);
      id v11 = (void *)qword_1001058B8;
      id v12 = [v10 UUID];
      id v13 = [v11 objectForKey:v12];

      if ([v13 length])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          [v10 performSelector:"setAccountPersistentUUID:" withObject:v13];
LABEL_14:
          char v7 = 1;
          goto LABEL_15;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v10 setPersistentResourceID:v13];
          goto LABEL_14;
        }
      }
LABEL_15:

      id v9 = (char *)v9 + 1;
    }
    while (v6 != v9);
    id v14 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    id v6 = v14;
  }
  while (v14);
LABEL_22:

  return v7 & 1;
}

- (void)_transferTagsToProfileStubs
{
  id v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Transferring tags to profiles...", buf, 2u);
  }
  id v3 = +[MCInstaller sharedInstaller];
  unsigned __int8 v4 = [v3 identifiersOfInstalledProfilesWithFilterFlags:3];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v11 = MCSystemProfileStorageDirectory();
        id v12 = [v9 MCHashedFilenameWithExtension:@"stub"];
        id v13 = [v11 stringByAppendingPathComponent:v12];

        id v14 = +[NSData dataWithContentsOfFile:v13];
        CFDataRef v15 = +[MCProfile profileWithData:v14 outError:0];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [(MCMigrator *)self _applyAccountTagsToProfile:v15])
        {
          [v15 writeStubToPath:v13];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  id v16 = [(MCMigrator *)self fileManager];
  long long v17 = MCTagsMappingFilePath();
  [v16 removeItemAtPath:v17 error:0];

  long long v18 = _MCLogObjects[12];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Completed transferring tags.", buf, 2u);
  }
}

- (void)_removeOriginalCopies
{
  unsigned __int8 v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing old profile copies...", buf, 2u);
  }
  id v5 = +[MCInstaller sharedInstaller];
  id v6 = [v5 identifiersOfInstalledProfilesWithFilterFlags:3];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v14 = MCSystemProfileStorageDirectory();
        CFDataRef v15 = [v12 MCOldStyleSafeFilenameHash:v19];
        id v16 = [v14 stringByAppendingPathComponent:v15];

        long long v17 = [(MCMigrator *)self fileManager];
        [v17 removeItemAtPath:v16 error:0];
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v9);
  }

  long long v18 = _MCLogObjects[12];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Completed removing old profile copies.", buf, 2u);
  }
}

- (void)_applyDefaultSettings
{
  unsigned __int8 v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Applying default user settings...", buf, 2u);
  }
  id v5 = +[MCHacks sharedHacks];
  id v6 = [v5 _deviceSpecificDefaultSettings];

  if (v6)
  {
    long long v61 = self;
    v68 = +[MCRestrictionManagerWriter sharedManager];
    id v7 = [v68 systemUserSettings];
    id v8 = [v7 MCMutableDeepCopy];

    uint64_t v9 = MCRestrictedBoolKey;
    uint64_t v10 = [v8 objectForKey:MCRestrictedBoolKey];
    if (!v10)
    {
      uint64_t v10 = +[NSMutableDictionary dictionary];
      [v8 setObject:v10 forKey:v9];
    }
    uint64_t v11 = MCRestrictedValueKey;
    id v12 = [v8 objectForKey:MCRestrictedValueKey];
    if (!v12)
    {
      id v12 = +[NSMutableDictionary dictionary];
      [v8 setObject:v12 forKey:v11];
    }
    uint64_t v13 = MCAssignedObjectKey;
    id v70 = [v8 objectForKey:MCAssignedObjectKey];
    if (!v70)
    {
      id v70 = +[NSMutableDictionary dictionary];
      [v8 setObject:forKey:];
    }
    uint64_t v64 = v13;
    uint64_t v14 = MCIntersectionKey;
    v71 = [v8 objectForKey:MCIntersectionKey];
    if (!v71)
    {
      v71 = +[NSMutableDictionary dictionary];
      [v8 setObject:forKey:];
    }
    uint64_t v63 = v14;
    uint64_t v15 = MCUnionKey;
    uint64_t v16 = [v8 objectForKey:MCUnionKey];
    if (!v16)
    {
      uint64_t v16 = +[NSMutableDictionary dictionary];
      [v8 setObject:v16 forKey:v15];
    }
    uint64_t v66 = v15;
    v67 = (void *)v16;
    uint64_t v69 = [v6 objectForKey:v9];
    v62 = v3;
    if (v69)
    {
      [v10 MCDeepCopyMissingEntriesFromDictionary:v69];
      uint64_t v17 = MCFeatureDiagnosticsSubmissionModificationAllowed;
      long long v18 = [v69 objectForKey:MCFeatureDiagnosticsSubmissionModificationAllowed];
      uint64_t v19 = [v10 objectForKey:v17];
      long long v20 = (void *)v19;
      if (v18 && v19)
      {
        uint64_t v21 = MCSettingParameterValueKey;
        long long v22 = [v18 objectForKey:MCSettingParameterValueKey];
        long long v23 = v12;
        long long v24 = v10;
        id v25 = [v22 copy];
        [v20 setObject:v25 forKey:v21];

        uint64_t v10 = v24;
        id v12 = v23;

        id v3 = v62;
      }
    }
    id v26 = [v6 objectForKey:v11];
    if (v26)
    {
      [v12 MCDeepCopyMissingEntriesFromDictionary:v26];
      uint64_t v27 = MCFeatureAutoLockTime;
      id v28 = [v26 objectForKey:MCFeatureAutoLockTime];
      uint64_t v29 = [v12 objectForKey:v27];
      long long v30 = (void *)v29;
      if (v28 && v29)
      {
        uint64_t v31 = MCSettingParameterRangeMinimumKey;
        [v28 objectForKey:MCSettingParameterRangeMinimumKey];
        v33 = long long v32 = v10;
        id v34 = [v33 copy];
        [v30 setObject:v34 forKey:v31];

        uint64_t v10 = v32;
      }
      uint64_t v35 = MCFeaturePasscodeKeyboardComplexity;
      long long v36 = [v26 objectForKey:MCFeaturePasscodeKeyboardComplexity];
      uint64_t v37 = [v12 objectForKey:v35];
      long long v38 = (void *)v37;
      if (v36 && v37)
      {
        uint64_t v60 = v10;
        uint64_t v39 = MCSettingParameterValueKey;
        [v36 objectForKey:MCSettingParameterValueKey];
        BOOL v40 = v59 = v26;
        long long v41 = v6;
        long long v42 = v12;
        id v43 = [v40 copy];
        uint64_t v44 = v39;
        uint64_t v10 = v60;
        [v38 setObject:v43 forKey:v44];

        id v12 = v42;
        id v6 = v41;

        id v26 = v59;
      }

      id v3 = v62;
    }
    v65 = v12;
    long long v45 = v26;
    long long v46 = [v6 objectForKey:v64];
    if (v46) {
      [v70 MCDeepCopyMissingEntriesFromDictionary:v46];
    }
    long long v47 = [v6 objectForKey:v63];
    if (!v47) {
      goto LABEL_37;
    }
    [v71 MCDeepCopyMissingEntriesFromDictionary:v47];
    uint64_t v48 = [(MCMigrator *)v61 _lastUserMigratedBuildVersion];
    if ([v48 compare:@"15G77" options:64] == (id)1)
    {
      __int16 v49 = [(MCMigrator *)v61 _lastUserMigratedBuildVersion];
      v50 = v10;
      uint64_t v51 = (char *)[v49 compare:@"17B1" options:64];

      BOOL v52 = v51 + 1 == 0;
      uint64_t v10 = v50;
      if (!v52) {
        goto LABEL_37;
      }
      long long v53 = _MCLogObjects[12];
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v73 = 0;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Clearing leaked WebContentFilter overrides...", v73, 2u);
      }
      uint64_t v54 = MCFeatureWebContentFilterWhitelistedURLs;
      long long v55 = [v47 objectForKeyedSubscript:MCFeatureWebContentFilterWhitelistedURLs];
      [v71 setObject:v55 forKeyedSubscript:v54];

      uint64_t v56 = MCFeatureWebContentFilterAutoPermittedURLs;
      uint64_t v48 = [v47 objectForKeyedSubscript:MCFeatureWebContentFilterAutoPermittedURLs];
      [v71 setObject:v48 forKeyedSubscript:v56];
    }

LABEL_37:
    id v57 = [v6 objectForKey:v66];
    if (v57) {
      [v67 MCDeepCopyMissingEntriesFromDictionary:v57];
    }
    [v68 setParametersForSettingsByType:v8 sender:@"MCMigrator.ApplyDefaultSettings"];
  }
  long long v58 = _MCLogObjects[12];
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v72 = 0;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Completed applying default user settings.", v72, 2u);
  }
}

- (void)_migrateBoolRestrictions:(id)a3 withAppID:(id)a4 forKey:(id)a5 valuesToRestrictions:(id)a6 currentBoolUserSettings:(id)a7
{
  id v36 = a3;
  CFStringRef v11 = (const __CFString *)a4;
  CFStringRef v12 = (const __CFString *)a5;
  id v13 = a6;
  id v14 = a7;
  key = (__CFString *)v12;
  applicationID = (__CFString *)v11;
  uint64_t v15 = (void *)CFPreferencesCopyAppValue(v12, v11);
  long long v38 = +[NSMutableArray arrayWithCapacity:0];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v40;
    uint64_t v20 = MCRestrictedBoolValueKey;
    do
    {
      uint64_t v21 = 0;
      id v37 = v18;
      do
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v21);
        long long v23 = [v13 objectForKey:v22];
        if (v23)
        {
          long long v24 = [v14 objectForKey:v23];
          id v25 = [v24 objectForKey:v20];

          if (!v25)
          {
            +[NSNumber numberWithBool:0];
            uint64_t v26 = v19;
            id v27 = v13;
            uint64_t v28 = v20;
            id v29 = v14;
            uint64_t v31 = v30 = v16;
            long long v32 = +[NSDictionary dictionaryWithObject:v31 forKey:@"value"];

            id v16 = v30;
            id v14 = v29;
            uint64_t v20 = v28;
            id v13 = v27;
            uint64_t v19 = v26;
            id v18 = v37;
            [v36 setObject:v32 forKey:v23];
          }
        }
        else
        {
          [v38 addObject:v22];
        }

        uint64_t v21 = (char *)v21 + 1;
      }
      while (v18 != v21);
      id v18 = [v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v18);
  }

  if ([v38 count]) {
    long long v33 = v38;
  }
  else {
    long long v33 = 0;
  }
  CFPreferencesSetAppValue(key, v33, applicationID);
}

- (void)_migrateValueRestrictions:(id)a3 withAppID:(id)a4 forKey:(id)a5 keysToRestricitons:(id)a6 currentValueUserSettings:(id)a7
{
  id v30 = a3;
  CFStringRef v11 = (const __CFString *)a4;
  CFStringRef v12 = (const __CFString *)a5;
  id v13 = a6;
  id v32 = a7;
  uint64_t v28 = (__CFString *)v12;
  id v29 = (__CFString *)v11;
  id v14 = (void *)CFPreferencesCopyAppValue(v12, v11);
  uint64_t v31 = +[NSMutableDictionary dictionaryWithCapacity:0];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v34;
    uint64_t v19 = MCRestrictedValueValueKey;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v22 = [v15 objectForKey:v21];
        long long v23 = [v13 objectForKey:v21];
        if (v23)
        {
          long long v24 = [v32 objectForKey:v23];
          id v25 = [v24 objectForKey:v19];

          if (!v25)
          {
            uint64_t v26 = +[NSDictionary dictionaryWithObject:v22 forKey:@"value"];
            [v30 setObject:v26 forKey:v23];
          }
        }
        else
        {
          [v31 setObject:v22 forKey:v21];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v17);
  }

  if ([v31 count]) {
    id v27 = v31;
  }
  else {
    id v27 = 0;
  }
  CFPreferencesSetAppValue(v28, v27, v29);
}

- (void)_migrateBoolValueToFeature:(id)a3 withAppID:(id)a4 forKey:(id)a5 synchronize:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  uint64_t v10 = (__CFString *)a4;
  CFStringRef v11 = (__CFString *)a5;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v11, v10, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    int v13 = AppBooleanValue;
    id v14 = +[MCRestrictionManagerWriter sharedManager];
    [v14 setBoolValue:v13 != 0 forSetting:v9 sender:@"MCMigrator.MigrateBoolValueToFeature"];
  }
  CFPreferencesSetAppValue(v11, 0, v10);
  if (v6) {
    CFPreferencesAppSynchronize(v10);
  }
}

- (void)_migrateSettings
{
  id v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Migrating settings...", buf, 2u);
  }
  buf[0] = 0;
  CFStringRef v4 = (const __CFString *)MCSpringboardBundleIdentifier;
  uint64_t AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SBSensitiveJibblerEnabled", MCSpringboardBundleIdentifier, buf);
  CFPreferencesSetAppValue(@"SBSensitiveJibblerEnabled", 0, @"com.apple.springboard");
  uint64_t v6 = MCRestrictedBoolKey;
  if (buf[0])
  {
    uint64_t v131 = MCRestrictedBoolKey;
    uint64_t v129 = MCFeatureAllowVoiceDialing;
    uint64_t v127 = MCSettingParameterValueKey;
    id v7 = +[NSNumber numberWithUnsignedChar:AppBooleanValue];
    v128 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
    v130 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
    v132 = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];

    CFStringRef v11 = +[MCRestrictionManagerWriter sharedManager];
    [v11 setParametersForSettingsByType:v10 sender:@"MCMigrator.MigrateSettings"];
  }
  CFStringRef v12 = +[MCRestrictionManagerWriter sharedManager];
  int v13 = [v12 systemUserSettings];

  uint64_t v14 = [v13 objectForKey:v6];
  uint64_t v15 = MCRestrictedValueKey;
  v104 = v13;
  v102 = [v13 objectForKey:MCRestrictedValueKey];
  +[NSMutableDictionary dictionary];
  v17 = uint64_t v16 = v6;
  uint64_t v18 = +[NSMutableDictionary dictionary];
  uint64_t v100 = v16;
  [v17 setObject:v18 forKey:v16];
  uint64_t v19 = +[NSMutableDictionary dictionary];
  uint64_t v108 = v15;
  [v17 setObject:v19 forKey:v15];
  v125[0] = @"explicitContent";
  v125[1] = @"applicationInstallation";
  uint64_t v20 = MCFeatureAppInstallationAllowed;
  v126[0] = MCFeatureExplicitContentAllowed;
  v126[1] = MCFeatureAppInstallationAllowed;
  v125[2] = @"camera";
  v125[3] = @"screenShot";
  uint64_t v21 = MCFeatureCameraAllowed;
  v126[2] = MCFeatureCameraAllowed;
  v126[3] = MCFeatureScreenShotAllowed;
  v125[4] = @"inAppPurchases";
  v126[4] = MCFeatureInAppPurchasesAllowed;
  uint64_t v22 = +[NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:5];
  [(MCMigrator *)self _migrateBoolRestrictions:v18 withAppID:v4 forKey:@"SBParentalControlsCapabilities" valuesToRestrictions:v22 currentBoolUserSettings:v14];
  CFPreferencesSetAppValue(@"SBParentalControlsMCCapabilities", 0, v4);
  v123[0] = MCSafariBundleIdentifier;
  v123[1] = MCCameraBundleIdentifier;
  v124[0] = MCFeatureSafariAllowed;
  v124[1] = v21;
  v123[2] = @"com.apple.youtube";
  v123[3] = MCFeatureITunesAllowed;
  v124[2] = MCFeatureYouTubeAllowed;
  v124[3] = MCFeatureITunesAllowed;
  v123[4] = MCAppStoreBundleIdentifier;
  v124[4] = v20;
  long long v23 = +[NSDictionary dictionaryWithObjects:v124 forKeys:v123 count:5];
  v103 = (void *)v14;
  [(MCMigrator *)self _migrateBoolRestrictions:v18 withAppID:v4 forKey:@"SBParentalControlsApplications" valuesToRestrictions:v23 currentBoolUserSettings:v14];
  CFPreferencesSetAppValue(@"SBParentalControlsMCApplications", 0, v4);
  v121[0] = @"apps";
  v121[1] = @"tvshows";
  uint64_t v106 = MCFeatureMaximumAppsRating;
  v122[0] = MCFeatureMaximumAppsRating;
  v122[1] = MCFeatureMaximumTVShowsRating;
  v121[2] = @"movies";
  v122[2] = MCFeatureMaximumMoviesRating;
  long long v24 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:3];
  v105 = self;
  [(MCMigrator *)self _migrateValueRestrictions:v19 withAppID:v4 forKey:@"SBParentalControlsMCContentRestrictions" keysToRestricitons:v24 currentValueUserSettings:v102];
  id v25 = [v102 objectForKeyedSubscript:MCFeatureMaximumFailedPasscodeAttempts];
  uint64_t v101 = MCRestrictedValueValueKey;
  uint64_t v26 = [v25 objectForKeyedSubscript:];

  if (v26)
  {
    if (MCGestaltHasSEP())
    {
      id v27 = [v26 unsignedIntegerValue];
      if (v27 != (id)MCKeybagCurrentMaximumFailedPasscodeAttempts())
      {
        uint64_t v28 = MCKeybagSetMaximumFailedPasscodeAttempts();
        if (v28)
        {
          log = _MCLogObjects[12];
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v28;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to migrate maximum failed passcode attempts. Error: %{public}@", buf, 0xCu);
          }
        }
      }
    }
  }
  id v29 = +[MCRestrictionManagerWriter sharedManager];
  [v29 setParametersForSettingsByType:v17 sender:@"MCMigrator.MigrateSettings"];

  id v30 = +[NSMutableDictionary dictionary];
  uint64_t v31 = +[NSMutableDictionary dictionary];
  [v30 setObject:v31 forKey:v108];
  CFNumberRef v32 = (const __CFNumber *)CFPreferencesCopyAppValue(@"SBAutoLockTime", v4);
  long long v33 = &os_unfair_lock_unlock_ptr;
  if (v32)
  {
    CFNumberRef v34 = v32;
    CFTypeID v35 = CFGetTypeID(v32);
    if (v35 == CFNumberGetTypeID())
    {
      *(_DWORD *)buf = 0;
      CFNumberGetValue(v34, kCFNumberIntType, buf);
      if ((*(_DWORD *)buf & 0x80000000) != 0) {
        *(_DWORD *)buf = 0x7FFFFFFF;
      }
      uint64_t v119 = v101;
      long long v36 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      v120 = v36;
      id v37 = +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
      [v31 setObject:v37 forKeyedSubscript:MCFeatureAutoLockTime];
    }
    CFRelease(v34);
  }
  CFNumberRef v38 = (const __CFNumber *)CFPreferencesCopyAppValue(@"SBDeviceLockGracePeriod", v4);
  if (v38)
  {
    CFNumberRef v39 = v38;
    *(void *)buf = 0;
    CFNumberGetValue(v38, kCFNumberLongType, buf);
    uint64_t v117 = v101;
    long long v40 = +[NSNumber numberWithUnsignedLong:*(void *)buf];
    v118 = v40;
    long long v41 = +[NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
    [v31 setObject:v41 forKeyedSubscript:MCFeaturePasscodeLockGraceTime];

    CFRelease(v39);
  }
  CFPreferencesSetAppValue(@"SBAutoLockTime", 0, v4);
  CFPreferencesSetAppValue(@"SBDeviceLockGracePeriod", 0, v4);
  long long v42 = +[MCRestrictionManagerWriter sharedManager];
  [v42 setParametersForSettingsByType:v30 sender:@"MCMigrator.MigrateSettings"];

  id v43 = +[NSMutableDictionary dictionary];
  uint64_t v44 = +[NSMutableDictionary dictionary];
  [v43 setObject:v44 forKey:MCUnionKey];
  CFPropertyListRef v45 = CFPreferencesCopyAppValue(@"SBTrustedCodeSigningIdentities", v4);
  if (v45)
  {
    long long v46 = v45;
    CFTypeID v47 = CFGetTypeID(v45);
    if (v47 == CFArrayGetTypeID())
    {
      uint64_t v48 = +[MCRestrictionManagerWriter sharedManager];
      [v48 setUnionValues:v46 forSetting:MCFeatureTrustedCodeSigningIdentities sender:@"MCMigrator.MigrateSettings"];
    }
    CFRelease(v46);
  }
  CFPreferencesSetAppValue(@"SBTrustedCodeSigningIdentities", 0, v4);

  buf[0] = 0;
  int v49 = CFPreferencesGetAppBooleanValue(@"Disable While Passcode Locked", @"com.apple.assistant", buf);
  if (buf[0])
  {
    int v50 = v49;
    uint64_t v51 = +[NSMutableDictionary dictionary];
    BOOL v52 = +[NSMutableDictionary dictionary];
    [v51 setObject:v52 forKey:v100];
    long long v53 = +[NSMutableDictionary dictionary];
    [v52 setObject:v53 forKey:MCFeatureAssistantWhileLockedAllowed];
    uint64_t v54 = +[NSNumber numberWithBool:v50 == 0];
    [v53 setObject:v54 forKey:MCRestrictedBoolValueKey];

    long long v55 = +[MCRestrictionManagerWriter sharedManager];
    [v55 setParametersForSettingsByType:v51 sender:@"MCMigrator.MigrateSettings"];
  }
  CFPreferencesSetAppValue(@"Disable While Passcode Locked", 0, @"com.apple.assistant");
  CFPreferencesAppSynchronize(@"com.apple.assistant");
  CFPreferencesAppSynchronize(v4);
  buf[0] = 0;
  int v56 = CFPreferencesGetAppBooleanValue(@"enabled", @"com.apple.adtracking", buf);
  if (buf[0])
  {
    int v57 = v56;
    long long v58 = +[MCRestrictionManagerWriter sharedManager];
    [v58 setBoolValue:v57 == 0 forSetting:MCFeatureLimitAdTrackingForced sender:@"MCMigrator.MigrateSettings"];
  }
  CFPreferencesSetAppValue(@"enabled", 0, @"com.apple.adtracking");
  CFPreferencesAppSynchronize(@"com.apple.adtracking");
  [(MCMigrator *)v105 _migrateBoolValueToFeature:MCFeatureAutoCorrectionAllowed withAppID:@"com.apple.Preferences" forKey:@"KeyboardAutocorrection" synchronize:0];
  [(MCMigrator *)v105 _migrateBoolValueToFeature:MCFeatureSmartPunctuationAllowed withAppID:@"com.apple.Preferences" forKey:@"SmartPunctuation" synchronize:0];
  [(MCMigrator *)v105 _migrateBoolValueToFeature:MCFeaturePredictiveKeyboardAllowed withAppID:@"com.apple.Preferences" forKey:@"KeyboardPrediction" synchronize:0];
  [(MCMigrator *)v105 _migrateBoolValueToFeature:MCFeatureSpellCheckAllowed withAppID:@"com.apple.Preferences" forKey:@"KeyboardCheckSpelling" synchronize:1];
  long long v59 = (void *)CFPreferencesCopyAppValue(@"CookieAcceptPolicy", @"com.apple.WebUI");
  if (v59)
  {
    objc_opt_class();
    float v60 = 1.5;
    if (objc_opt_isKindOfClass())
    {
      float v60 = 2.0;
      if (([v59 isEqualToString:kMCSafariCookieAcceptPolicyAlways] & 1) == 0)
      {
        float v60 = 1.5;
        if (([v59 isEqualToString:kMCSafariCookieAcceptPolicyOnlyFromMainDocumentDomain] & 1) == 0)
        {
          float v60 = 1.0;
          if (([v59 isEqualToString:kMCSafariCookieAcceptPolicyExclusivelyFromMainDocumentDomain] & 1) == 0)
          {
            if ([v59 isEqualToString:kMCSafariCookieAcceptPolicyNever]) {
              float v60 = 0.0;
            }
            else {
              float v60 = 1.0;
            }
          }
        }
      }
    }
  }
  else
  {
    long long v61 = (void *)CFPreferencesCopyAppValue(@"NSHTTPAcceptCookies", @"com.apple.WebFoundation");
    float v60 = 1.5;
    if (v61)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        float v60 = 2.0;
        if (([v61 isEqualToString:@"always"] & 1) == 0)
        {
          if ([v61 isEqualToString:@"never"]) {
            float v60 = 0.0;
          }
          else {
            float v60 = 1.5;
          }
        }
        CFPreferencesSetAppValue(@"NSHTTPAcceptCookies", 0, @"com.apple.WebFoundation");
        CFPreferencesAppSynchronize(@"com.apple.WebFoundation");
      }
    }
  }
  v62 = +[MCRestrictionManager sharedManager];
  uint64_t v63 = MCFeatureSafariAcceptCookies;
  uint64_t v64 = [v62 effectiveValueForSetting:MCFeatureSafariAcceptCookies];

  if (!v64 || ([v64 floatValue], v65 != v60))
  {
    uint64_t v66 = +[MCRestrictionManagerWriter sharedManager];
    *(float *)&double v67 = v60;
    v68 = +[NSNumber numberWithFloat:v67];
    [v66 setValue:v68 forSetting:v63 sender:@"MCMigrator.MigrateSettings"];

    uint64_t v69 = _MCLogObjects[12];
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Migrated safari cookie policy.", buf, 2u);
    }
  }

  id v70 = MCSystemRootDirectory();
  v71 = [v70 stringByAppendingPathComponent:@"/System/Library/OnBoardingBundles/com.apple.onboarding.improvehealth.bundle/ImproveHealth.plist"];

  uint64_t v72 = +[NSURL fileURLWithPath:v71 isDirectory:0];
  id v109 = 0;
  id v73 = +[NSDictionary dictionaryWithContentsOfURL:v72 error:&v109];
  id v74 = v109;
  if (v73)
  {
    v75 = [v73 objectForKeyedSubscript:@"ContentVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v76 = [v75 integerValue];
      long long v77 = (void *)CFPreferencesCopyAppValue(@"MCFeatureHealthDataSubmissionAllowedVersion", @"com.apple.managedconfiguration.profiled");
      id v78 = [v77 integerValue];

      long long v79 = _MCLogObjects[12];
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v76;
        __int16 v115 = 2048;
        id v116 = v78;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "ImproveHealth currentContentVersion: %ld lastResetVersion: %ld", buf, 0x16u);
      }
      BOOL v80 = (uint64_t)v78 < (uint64_t)v76;
      long long v33 = &os_unfair_lock_unlock_ptr;
      if (!v80) {
        goto LABEL_61;
      }
      uint64_t v81 = +[MCRestrictionManagerWriter sharedManager];
      [v81 removeBoolSetting:MCFeatureHealthDataSubmissionAllowed sender:@"MCMigrator.MigrateSettings"];

      long long v33 = &os_unfair_lock_unlock_ptr;
      CFPreferencesSetAppValue(@"MCFeatureHealthDataSubmissionAllowedVersion", +[NSNumber numberWithInteger:v76], @"com.apple.managedconfiguration.profiled");
      id v82 = _MCLogObjects[12];
      if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_61;
      }
      *(_WORD *)buf = 0;
      long long v83 = "Reset Allow Health Data Submission.";
      long long v84 = v82;
      os_log_type_t v85 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      long long v87 = _MCLogObjects[12];
      if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
LABEL_61:

        goto LABEL_62;
      }
      *(_WORD *)buf = 0;
      long long v83 = "Failed to read ContentVersion from OnBoardingBundle.";
      long long v84 = v87;
      os_log_type_t v85 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl((void *)&_mh_execute_header, v84, v85, v83, buf, 2u);
    goto LABEL_61;
  }
  long long v86 = _MCLogObjects[12];
  if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v74;
    _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "Failed to load ImproveHealth OnBoardingBundle. Error: %{public}@", buf, 0xCu);
  }
LABEL_62:

  long long v88 = +[MCRestrictionManager sharedManager];
  long long v89 = [v88 userSettings];
  uint64_t v90 = [v89 objectForKeyedSubscript:v108];
  long long v91 = [(id)v90 objectForKeyedSubscript:v106];
  id v92 = [v91 mutableCopy];

  uint64_t v93 = MCSettingParameterRangeMaximumKey;
  long long v94 = [v92 objectForKeyedSubscript:MCSettingParameterRangeMaximumKey];
  LOBYTE(v90) = [v94 isEqualToNumber:&off_1000F51E8];

  if ((v90 & 1) == 0)
  {
    [v92 setObject:&off_1000F51E8 forKeyedSubscript:v93];
    id v111 = v92;
    uint64_t v112 = v108;
    uint64_t v110 = v106;
    long long v95 = [v33[446] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
    v113 = v95;
    long long v96 = [v33[446] dictionaryWithObjects:&v113 forKeys:&v112 count:1];

    long long v97 = +[MCRestrictionManagerWriter sharedManager];
    [v97 setParametersForSettingsByType:v96 sender:@"MCMigrator.MigrateSettings"];
  }
  long long v98 = _MCLogObjects[12];
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Completed migrating settings.", buf, 2u);
  }
}

- (void)_migrateClientRestrictions
{
  id v3 = +[MCRestrictionManagerWriter sharedManager];
  CFStringRef v4 = [v3 systemClientRestrictions];

  long long v53 = v4;
  if ([v4 count])
  {
    id v5 = [v4 MCMutableDeepCopy];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v6 = [v53 keyEnumerator];
    id v7 = [v6 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v7)
    {
      id v8 = v7;
      CFTypeID v47 = v2;
      char v9 = 0;
      uint64_t v10 = *(void *)v56;
      uint64_t v11 = kMCClientRestrictionsTruth;
      uint64_t v50 = kMCClientRestrictionsType;
      uint64_t v49 = kEASAccountClientType;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v56 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void *)(*((void *)&v55 + 1) + 8 * i);
          uint64_t v14 = [v53 objectForKey:v13];
          uint64_t v15 = [v14 objectForKey:v11];
          if (v15)
          {
            [v5 setObject:v14 forKey:v13];
          }
          else
          {
            v59[0] = v11;
            v59[1] = v50;
            v60[0] = v14;
            v60[1] = v49;
            uint64_t v16 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
            [v5 setObject:v16 forKeyedSubscript:v13];

            char v9 = 1;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v8);

      id v2 = v47;
      if ((v9 & 1) == 0) {
        goto LABEL_15;
      }
      uint64_t v6 = +[MCRestrictionManagerWriter sharedManager];
      [v6 setAllClientRestrictions:v5 sender:@"MCMigrator.MigrateClientRestrictions" outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:0];
    }

LABEL_15:
  }
  id v17 = +[MCRestrictionManagerWriter sharedManager];
  uint64_t v18 = MCNewsBundleIdentifier;
  uint64_t v19 = [v17 clientRestrictionsForClientUUID:MCNewsBundleIdentifier];

  if (v19)
  {
    uint64_t v20 = +[MCRestrictionManagerWriter sharedManager];
    [v20 setClientRestrictions:&__NSDictionary0__struct clientType:v18 clientUUID:v18 sender:@"MCMigrator.MigrateClientRestrictions" localizedClientDescription:@"News" localizedWarning:0 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:0];
  }
  uint64_t v21 = +[MCRestrictionManagerWriter sharedManager];
  uint64_t v22 = kMCLSSystemAppRemovalClientType;
  long long v23 = [v21 clientRestrictionsForClientUUID:kMCLSSystemAppRemovalClientType];

  if ([v23 count])
  {
    uint64_t v24 = MCFeatureRemovedSystemAppBundleIDs;
    id v25 = +[MCRestrictionManager unionValuesForFeature:MCFeatureRemovedSystemAppBundleIDs withRestrictionsDictionary:v23];
    uint64_t v26 = +[MCRestrictionManager unionValuesForFeature:MCFeatureBlacklistedAppBundleIDs withRestrictionsDictionary:v23];
    id v27 = +[MCRestrictionManager unionValuesForFeature:MCFeatureBlockedAppBundleIDs withRestrictionsDictionary:v23];
    if (![v25 count] && (objc_msgSend(v26, "count") || objc_msgSend(v27, "count")))
    {
      uint64_t v51 = v19;
      uint64_t v48 = v2;
      uint64_t v28 = objc_opt_new();
      uint64_t v29 = +[NSSet setWithArray:v26];
      id v30 = +[NSMutableSet setWithArray:v27];
      long long v46 = (void *)v29;
      [v30 unionSet:v29];
      uint64_t v31 = [v30 allObjects];
      [v28 MCSetUnionRestriction:v24 values:v31];
      CFNumberRef v32 = +[MCRestrictionManagerWriter sharedManager];
      [v32 setClientRestrictions:v28 clientType:v22 clientUUID:v22 sender:@"MCMigrator.MigrateClientRestrictions" localizedClientDescription:&stru_1000ECAD0 localizedWarning:0 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:0];

      long long v33 = _MCLogObjects[12];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Migrated original removed system apps.", buf, 2u);
      }

      id v2 = v48;
      long long v23 = v28;
      uint64_t v19 = v51;
    }
  }
  CFStringRef v34 = (const __CFString *)MCiCloudDriveBundleIdentifier;
  CFTypeID v35 = (void *)CFPreferencesCopyAppValue(@"SBIconVisibility", MCiCloudDriveBundleIdentifier);
  long long v36 = v35;
  if (!v35 || ([v35 BOOLValue] & 1) == 0)
  {
    BOOL v52 = v19;
    id v37 = v2;
    uint64_t v38 = MCFeatureRemovedSystemAppBundleIDs;
    CFNumberRef v39 = +[MCRestrictionManager unionValuesForFeature:MCFeatureRemovedSystemAppBundleIDs withRestrictionsDictionary:v23];
    long long v40 = +[NSMutableSet setWithObject:v34];
    long long v41 = v40;
    if (v39) {
      [v40 addObjectsFromArray:v39];
    }
    long long v42 = +[NSMutableDictionary dictionary];
    id v43 = [v41 allObjects];
    [v42 MCSetUnionRestriction:v38 values:v43];

    uint64_t v44 = +[MCRestrictionManagerWriter sharedManager];
    [v44 setClientRestrictions:v42 clientType:v22 clientUUID:v22 sender:@"MCMigrator.MigrateClientRestrictions" localizedClientDescription:&stru_1000ECAD0 localizedWarning:0 outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:0];

    CFPreferencesSetAppValue(@"SBIconVisibility", kCFBooleanTrue, v34);
    CFPreferencesAppSynchronize(v34);
    CFPropertyListRef v45 = _MCLogObjects[12];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Migrated iCloud Drive app.", buf, 2u);
    }

    id v2 = v37;
    uint64_t v19 = v52;
  }
}

- (void)_updateClientRestrictions
{
  id v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Updating client restrictions...", buf, 2u);
  }
  id v3 = +[MCRestrictionManagerWriter sharedManager];
  CFStringRef v4 = [v3 systemClientRestrictions];

  id v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        CFStringRef v12 = [v6 objectForKey:v11];
        id v13 = [v12 mutableCopy];
        uint64_t v14 = +[MCHacks sharedHacks];
        [v14 _applyHeuristicsToRestrictions:v13 forProfile:0 ignoresUnrestrictableApps:0];

        [v5 setObject:v13 forKey:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }

  uint64_t v15 = +[MCRestrictionManagerWriter sharedManager];
  [v15 setAllClientRestrictions:v5 sender:@"MCMigrator.UpdateClientRestrictions" outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outRecomputedNag:0 outError:0];

  os_log_t v16 = _MCLogObjects[12];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v16;
    unsigned int v18 = [v5 count];
    *(_DWORD *)buf = 67109120;
    unsigned int v25 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Done updating. %d client restrictions processed.", buf, 8u);
  }
}

- (id)_updateProfileRestrictionsForProfileRestrictions:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v5 objectForKey:v10];
        id v12 = [v11 mutableCopy];
        id v13 = +[MCHacks sharedHacks];
        [v13 _applyHeuristicsToRestrictions:v12 forProfile:0 ignoresUnrestrictableApps:0];

        [v4 setObject:v12 forKey:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_updateProfileRestrictions
{
  CFStringRef v4 = _MCLogObjects[12];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating profile restrictions...", buf, 2u);
  }
  id v5 = +[MCRestrictionManagerWriter sharedManager];
  id v6 = [v5 systemProfileRestrictions];

  id v7 = [(MCMigrator *)self _updateProfileRestrictionsForProfileRestrictions:v6];
  uint64_t v8 = +[MCRestrictionManagerWriter sharedManager];
  uint64_t v9 = [v8 userProfileRestrictions];

  uint64_t v10 = [(MCMigrator *)self _updateProfileRestrictionsForProfileRestrictions:v9];
  uint64_t v11 = +[MCRestrictionManagerWriter sharedManager];
  [v11 setSystemProfileRestrictions:v7 userProfileRestrictions:v10 sender:@"MCMigrator.UpdateProfileRestrictions" outRestrictionsChanged:0 outEffectiveSettingsChanged:0 outAppWhitelistSettingsChanged:0 outRecomputedNag:0 outError:0];

  id v12 = +[MCInstaller sharedInstaller];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003A490;
  v15[3] = &unk_1000EB960;
  id v16 = v7;
  id v17 = v10;
  id v13 = v10;
  id v14 = v7;
  [v12 recomputeProfileRestrictionsWithCompletionBlock:v15];
}

- (void)_applyImpliedSettings
{
  id v3 = _MCLogObjects[12];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating implied settings...", buf, 2u);
  }
  CFStringRef v4 = +[MCRestrictionManager sharedManager];
  unsigned int v5 = [v4 effectiveRestrictedBoolForSetting:MCFeatureDiagnosticsSubmissionAllowed];

  if (v5 == 2)
  {
    id v6 = +[MCRestrictionManagerWriter sharedManager];
    [v6 setBoolValue:0 forSetting:MCFeatureAppAnalyticsAllowed sender:@"MCMigrator.ApplyImpliedSettings"];
  }
  id v7 = _MCLogObjects[12];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Done updating.", v8, 2u);
  }
}

- (void)_migrateProfileStubsForNetworkExtension
{
  if (!MCNEProfileIngestionClass())
  {
    unsigned int v5 = _MCLogObjects[12];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v44 = "Skipping migrating NetworkExtension settings: not applicable";
LABEL_48:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v44, buf, 2u);
    goto LABEL_49;
  }
  Class v3 = NSClassFromString(@"NEProfileIngestion");
  char v4 = objc_opt_respondsToSelector();
  unsigned int v5 = _MCLogObjects[12];
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) == 0)
  {
    if (!v6) {
      goto LABEL_49;
    }
    *(_WORD *)buf = 0;
    uint64_t v44 = "Skipping migrating NetworkExtension settings: nothing to do";
    goto LABEL_48;
  }
  CFPropertyListRef v45 = v2;
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Migrating NetworkExtension settings to profiles...", buf, 2u);
  }
  id v7 = +[MCInstaller sharedInstaller];
  uint64_t v8 = [v7 identifiersOfInstalledProfilesWithFilterFlags:3];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = &os_unfair_lock_unlock_ptr;
    id v12 = &os_unfair_lock_unlock_ptr;
    uint64_t v13 = *(void *)v58;
    uint64_t v47 = *(void *)v58;
    do
    {
      uint64_t v14 = 0;
      id v46 = v10;
      do
      {
        if (*(void *)v58 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v51 = v14;
        long long v15 = *(void **)(*((void *)&v57 + 1) + 8 * v14);
        id v16 = MCSystemProfileStorageDirectory();
        id v17 = [v15 MCHashedFilenameWithExtension:@"stub"];
        uint64_t v18 = [v16 stringByAppendingPathComponent:v17];

        uint64_t v19 = v11[406];
        BOOL v52 = (void *)v18;
        long long v20 = [v12[443] dataWithContentsOfFile:v18];
        long long v21 = [v19 profileWithData:v20 outError:0];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v22 = [v21 payloads];
          id v23 = [v22 countByEnumeratingWithState:&v53 objects:v63 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v49 = v21;
            char v25 = 0;
            uint64_t v26 = *(void *)v54;
            do
            {
              for (i = 0; i != v24; i = (char *)i + 1)
              {
                if (*(void *)v54 != v26) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v28 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                uint64_t v29 = +[NSMutableDictionary dictionaryWithCapacity:4];
                id v30 = [v28 type];

                if (v30)
                {
                  uint64_t v31 = [v28 type];
                  [v29 setObject:v31 forKey:@"PayloadType"];
                }
                CFNumberRef v32 = [v28 UUID];

                if (v32)
                {
                  long long v33 = [v28 UUID];
                  [v29 setObject:v33 forKey:@"PayloadUUID"];
                }
                CFStringRef v34 = [v28 identifier];

                if (v34)
                {
                  CFTypeID v35 = [v28 identifier];
                  [v29 setObject:v35 forKey:@"PayloadIdentifier"];
                }
                long long v36 = [v28 displayName];

                if (v36)
                {
                  id v37 = [v28 displayName];
                  [v29 setObject:v37 forKey:@"PayloadDisplayName"];
                }
                uint64_t v38 = [v28 persistentResourceID];

                if (v38)
                {
                  CFNumberRef v39 = [v28 persistentResourceID];
                  [v29 setObject:v39 forKey:@"IdentificationUUID"];
                }
                if ([v28 version])
                {
                  long long v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", [v28 version]);
                  [v29 setObject:v40 forKey:@"PayloadVersion"];
                }
                long long v41 = [(objc_class *)v3 performSelector:"getServiceIDForPayload:" withObject:v29];
                if (v41)
                {
                  [v28 setPersistentResourceID:v41];
                  char v25 = 1;
                }
              }
              id v24 = [v22 countByEnumeratingWithState:&v53 objects:v63 count:16];
            }
            while (v24);

            uint64_t v11 = &os_unfair_lock_unlock_ptr;
            id v10 = v46;
            uint64_t v13 = v47;
            id v12 = &os_unfair_lock_unlock_ptr;
            long long v21 = v49;
            if (v25)
            {
              long long v42 = _MCLogObjects[12];
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v62 = v52;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Migrating NetworkExtension: updating profile stub %{public}@", buf, 0xCu);
              }
              long long v21 = v49;
              [v49 writeStubToPath:v52];
            }
          }
          else
          {

            uint64_t v13 = v47;
          }
        }

        uint64_t v14 = v51 + 1;
      }
      while ((id)(v51 + 1) != v10);
      id v10 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v10);
  }

  if (objc_opt_respondsToSelector()) {
    [(objc_class *)v3 performSelector:"profileMigrationComplete"];
  }
  id v43 = _MCLogObjects[12];
  id v2 = v45;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Completed migrating NetworkExtension settings.", buf, 2u);
  }

LABEL_49:
}

- (void)_migrateExtensibleSSO
{
  Class v3 = +[MCManifest sharedManifest];
  char v4 = [v3 allInstalledPayloadsOfClass:objc_opt_class()];

  if ([v4 count])
  {
    id v15 = 0;
    unsigned int v5 = +[MCExtensibleSingleSignOnPayloadHandler rebuildConfigurationIncludingPayloads:v4 excludingPayloads:0 error:&v15];
    id v6 = v15;
    os_log_t v7 = _MCLogObjects[12];
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = v7;
        id v9 = [v4 count];
        *(_DWORD *)buf = 134217984;
        id v17 = v9;
        id v10 = "Rebuilt Extensible SSO configuration from %ld payload(s)";
        uint64_t v11 = v8;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
        uint32_t v13 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v7;
      id v14 = [v4 count];
      *(_DWORD *)buf = 134218242;
      id v17 = v14;
      __int16 v18 = 2114;
      id v19 = v6;
      id v10 = "Failed to rebuild Extensible SSO configuration from %ld payload(s): %{public}@";
      uint64_t v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
      goto LABEL_7;
    }
  }
}

- (void)_migrateSharedDeviceConfiguration
{
  Class v3 = MCSharedDeviceConfigurationFilePath();
  char v4 = +[NSMutableDictionary dictionaryWithContentsOfFile:v3];
  unsigned int v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"IfLostReturnToMessage"];
    if (v6)
    {
      [v5 setObject:v6 forKeyedSubscript:kMCSharedDeviceLockScreenFootnoteKey];
      [v5 removeObjectForKey:@"IfLostReturnToMessage"];
      [v5 MCWriteToBinaryFile:v3];
    }
  }
  os_log_t v7 = _MCLogObjects[12];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Completed migrating Shared Device Configuration keys.", v8, 2u);
  }
}

- (void)_migrateLostModeLastLocationRequestDate
{
  CFStringRef v3 = (const __CFString *)kMCMDMLostModeLastLocationRequestDateKey;
  CFStringRef v4 = (const __CFString *)kMCNotBackedUpPreferencesDomain;
  id v5 = (id)CFPreferencesCopyAppValue(kMCMDMLostModeLastLocationRequestDateKey, kMCNotBackedUpPreferencesDomain);
  if (v5 || (MCConfigurationProfilesSystemGroupContainer(), (id v5 = (id)_CFPreferencesCopyValueWithContainer()) != 0))
  {
    id v6 = _MCLogObjects[12];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Migrating the Lost Mode last location request date.", buf, 2u);
    }
    id v7 = objc_alloc((Class)NSURL);
    uint64_t v8 = MCSystemLostModeRequestPath();
    id v9 = [v7 initFileURLWithPath:v8 isDirectory:0];

    *(void *)buf = 0;
    id v19 = buf;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    id v10 = objc_opt_new();
    id v16 = buf;
    id v17 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003B334;
    v14[3] = &unk_1000EB988;
    id v5 = v5;
    id v15 = v5;
    [v10 coordinateWritingItemAtURL:v9 options:0 error:&v17 byAccessor:v14];
    id v11 = v17;

    if (!v19[24])
    {
      os_log_type_t v12 = _MCLogObjects[12];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v22 = 138543362;
        id v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Could not read device lost mode last location for migration: %{public}@", v22, 0xCu);
      }
    }
    MCConfigurationProfilesSystemGroupContainer();
    _CFPreferencesSetValueWithContainer();
    MCConfigurationProfilesSystemGroupContainer();
    _CFPreferencesSynchronizeWithContainer();
    CFPreferencesSetValue(v3, 0, v4, kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
    CFPreferencesSynchronize(v4, kCFPreferencesAnyUser, kCFPreferencesCurrentHost);
    CFPreferencesSetAppValue(v3, 0, v4);
    CFPreferencesAppSynchronize(v4);

    _Block_object_dispose(buf, 8);
  }
  uint32_t v13 = _MCLogObjects[12];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Completed migrating the Lost Mode last location request date.", buf, 2u);
  }
}

- (void)_fixManifestFromStubsIfNecessary
{
  CFStringRef v4 = MCSystemProfileStorageDirectory();
  id v5 = MCSystemManifestPath();
  [(MCMigrator *)self _fixManifestFromStubsIfNecessaryWithStubPath:v4 manifestPath:v5];

  id v6 = MCUserProfileStorageDirectory();
  id v7 = MCUserManifestPath();
  [(MCMigrator *)self _fixManifestFromStubsIfNecessaryWithStubPath:v6 manifestPath:v7];
}

- (void)_fixManifestFromStubsIfNecessaryWithStubPath:(id)a3 manifestPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    id v9 = [(MCMigrator *)self _profilesFromManifestAtPath:v7];
    id v19 = 0;
    id v20 = 0;
    [(MCMigrator *)self _profilesFromStubsAtPath:v6 orderedProfiles:&v20 hiddenProfiles:&v19];
    id v10 = v20;
    id v11 = v19;
    os_log_type_t v12 = [(MCMigrator *)self _generatedManifestIfNeededFromOrderedProfiles:v10 hiddenProfiles:v11 existingManifest:v9];
    uint32_t v13 = _MCLogObjects[12];
    if (v12)
    {
      if (os_log_type_enabled(_MCLogObjects[12], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Fixing incomplete profile manifest at path: %@", buf, 0xCu);
      }
      if ([v12 MCWriteToBinaryFile:v8]) {
        goto LABEL_14;
      }
      id v14 = _MCLogObjects[12];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      id v15 = "Could not write replacement manifest file to path: %@";
      id v16 = v14;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      if (!os_log_type_enabled(_MCLogObjects[12], OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        goto LABEL_15;
      }
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      id v15 = "Profile manifest is complete, not rewriting, path: %@";
      id v16 = v13;
      os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, 0xCu);
    goto LABEL_14;
  }
  __int16 v18 = _MCLogObjects[12];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "stub path (%@) or manifest path (%@) is nil", buf, 0x16u);
  }
LABEL_15:
}

- (id)_profilesFromManifestAtPath:(id)a3
{
  CFStringRef v3 = +[NSData dataWithContentsOfFile:a3];
  CFStringRef v4 = +[NSPropertyListSerialization MCSafePropertyListWithData:v3 options:0 format:0 error:0];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = objc_opt_new();
    id v6 = [v4 objectForKeyedSubscript:@"OrderedProfiles"];
    id v7 = v6;
    if (v6)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v27;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v27 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v5 addObject:v12];
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v9);
      }
    }
    uint32_t v13 = [v4 objectForKeyedSubscript:@"HiddenProfiles"];
    id v14 = v13;
    if (v13)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v23;
        do
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v23 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v5 addObject:v19];
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v16);
      }
    }
    id v20 = [v5 copy];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void)_profilesFromStubsAtPath:(id)a3 orderedProfiles:(id *)a4 hiddenProfiles:(id *)a5
{
  id v8 = a3;
  id v9 = [(MCMigrator *)self fileManager];
  id v41 = 0;
  CFTypeID v35 = v8;
  uint64_t v10 = [v9 contentsOfDirectoryAtPath:v8 error:&v41];
  id v11 = v41;

  if (v10)
  {
    id v28 = v11;
    long long v29 = a4;
    uint64_t v31 = a5;
    long long v33 = objc_opt_new();
    CFNumberRef v32 = objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v30 = v10;
    id obj = v10;
    id v12 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v38;
      uint64_t v34 = kMCInstallProfileOptionFilterFlag;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v17 = [v16 pathExtension];
          unsigned int v18 = [v17 isEqualToString:@"stub"];

          if (v18)
          {
            uint64_t v19 = [v8 stringByAppendingPathComponent:v16];
            id v20 = +[NSData dataWithContentsOfFile:v19];
            char v21 = +[MCProfile profileWithData:v20 outError:0];
            long long v22 = [v21 installOptions];
            long long v23 = [v22 objectForKeyedSubscript:v34];
            unsigned __int8 v24 = [v23 intValue];

            long long v25 = [v21 identifier];
            if (v25)
            {
              if ((v24 & 2) != 0) {
                long long v26 = v33;
              }
              else {
                long long v26 = v32;
              }
              [v26 addObject:v25];
            }
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v13);
    }

    *long long v29 = [v32 copy];
    id *v31 = [v33 copy];

    uint64_t v10 = v30;
    id v11 = v28;
  }
  else
  {
    long long v27 = _MCLogObjects[12];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v44 = v35;
      __int16 v45 = 2112;
      id v46 = v11;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Cannot read directory for profiles stubs: %@: %@", buf, 0x16u);
    }
    *a4 = 0;
    *a5 = 0;
  }
}

- (id)_generatedManifestIfNeededFromOrderedProfiles:(id)a3 hiddenProfiles:(id)a4 existingManifest:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v7 || v8 || v9)
  {
    id v12 = objc_opt_new();
    id v13 = v12;
    if (v7)
    {
      uint64_t v14 = [v12 setByAddingObjectsFromSet:v7];

      id v13 = (void *)v14;
    }
    if (v8)
    {
      uint64_t v15 = [v13 setByAddingObjectsFromSet:v8];

      id v13 = (void *)v15;
    }
    if (v10 && ([v13 isSubsetOfSet:v10] & 1) != 0)
    {
      id v11 = 0;
    }
    else
    {
      id v16 = objc_opt_new();
      if (v7)
      {
        uint64_t v17 = [v7 allObjects];
        [v16 setObject:v17 forKeyedSubscript:@"OrderedProfiles"];
      }
      if (v8)
      {
        unsigned int v18 = [v8 allObjects];
        [v16 setObject:v18 forKeyedSubscript:@"HiddenProfiles"];
      }
      id v11 = [v16 copy];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_migrateSupervisionSettings
{
  if ((MCGestaltIsAppleTV() & 1) == 0)
  {
    CFStringRef v4 = MCSystemPublicInfoDirectory();
    id v5 = [v4 stringByAppendingPathComponent:@"Chaperone.plist"];

    id v6 = [(MCMigrator *)self fileManager];
    id v7 = MCCloudConfigurationDetailsFilePath();
    unsigned int v8 = [v6 fileExistsAtPath:v7 isDirectory:0];

    if (v8)
    {
      id v9 = _MCLogObjects[12];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Supervision settings have been migrated.", buf, 2u);
      }
    }
    else
    {
      uint64_t v10 = [(MCMigrator *)self fileManager];
      unsigned int v11 = [v10 fileExistsAtPath:v5 isDirectory:0];

      id v12 = 0;
      if (v11)
      {
        id v13 = _MCLogObjects[12];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Migrating supervision settings...", buf, 2u);
        }
        uint64_t v14 = +[NSDictionary dictionaryWithContentsOfFile:v5];
        uint64_t v47 = [v14 objectForKeyedSubscript:@"organization"];
        uint64_t v15 = +[MCManifest sharedManifest];
        id v16 = [v15 allInstalledProfileIdentifiers];

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id obj = v16;
        id v17 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
        uint64_t v48 = v14;
        if (v17)
        {
          __int16 v45 = v5;
          uint64_t v18 = *(void *)v55;
          while (2)
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v55 != v18) {
                objc_enumerationMutation(obj);
              }
              uint64_t v20 = *(void *)(*((void *)&v54 + 1) + 8 * i);
              long long v22 = +[MCManifest sharedManifest];
              long long v23 = [v22 installedProfileWithIdentifier:v20];

              if ([v23 containsPayloadOfClass:objc_opt_class()])
              {
                long long v52 = 0u;
                long long v53 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                long long v25 = [v23 payloads];
                id v26 = [v25 countByEnumeratingWithState:&v50 objects:v60 count:16];
                if (v26)
                {
                  id v27 = v26;
                  uint64_t v44 = v3;
                  uint64_t v28 = *(void *)v51;
                  while (2)
                  {
                    for (j = 0; j != v27; j = (char *)j + 1)
                    {
                      if (*(void *)v51 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      id v30 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
                      objc_opt_class();
                      LOBYTE(v17) = objc_opt_isKindOfClass();
                      if (v17)
                      {
                        id v32 = v30;
                        long long v33 = _MCLogObjects[12];
                        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Supervision profile found. Using information in profile for migration.", buf, 2u);
                        }
                        unsigned int v46 = [v32 nonChaperonePairingAllowed];
                        uint64_t v24 = [v32 pairingCertificateData];

                        goto LABEL_30;
                      }
                    }
                    id v27 = [v25 countByEnumeratingWithState:&v50 objects:v60 count:16];
                    if (v27) {
                      continue;
                    }
                    break;
                  }
                  uint64_t v24 = 0;
                  unsigned int v46 = 1;
LABEL_30:
                  CFStringRef v3 = v44;
                }
                else
                {
                  uint64_t v24 = 0;
                  LOBYTE(v17) = 0;
                  unsigned int v46 = 1;
                }

                goto LABEL_33;
              }
            }
            id v17 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
            if (v17) {
              continue;
            }
            break;
          }
          uint64_t v24 = 0;
          unsigned int v46 = 1;
LABEL_33:
          id v5 = v45;
        }
        else
        {
          uint64_t v24 = 0;
          unsigned int v46 = 1;
        }
        id v12 = (void *)v24;

        uint64_t v34 = [(MCMigrator *)self fileManager];
        [v34 removeItemAtPath:v5 error:0];

        CFTypeID v35 = +[NSMutableDictionary dictionary];
        long long v36 = v35;
        if (v47) {
          [v35 setObject:v47 forKeyedSubscript:kCCOrganizationNameKey];
        }
        long long v37 = +[NSNumber numberWithBool:v17 & 1];
        [v36 setObject:v37 forKeyedSubscript:kCCIsSupervisedKey];

        long long v38 = +[NSNumber numberWithBool:v46];
        [v36 setObject:v38 forKeyedSubscript:kCCAllowPairingKey];

        if (v12)
        {
          long long v59 = v12;
          long long v39 = +[NSArray arrayWithObjects:&v59 count:1];
          [v36 setObject:v39 forKeyedSubscript:kCCSupervisorHostCertificatesKey];
        }
        [v36 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCIsMandatoryKey];
        [v36 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCCloudConfigurationUICompleteKey];
        [v36 setObject:&__kCFBooleanTrue forKeyedSubscript:kCCPostSetupProfileWasInstalledKey];
        long long v40 = MCCloudConfigurationDetailsFilePath();
        [v36 MCWriteToBinaryFile:v40];

        MCSendCloudConfigurationDetailsChangedNotification();
        id v41 = +[MCRestrictionManagerWriter sharedManager];
        [v41 setBoolValue:v46 forSetting:MCFeatureHostPairingAllowed sender:@"MCMigrator.MigrateSupervisionSettings"];
      }
      long long v42 = _MCLogObjects[12];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Finished migrating supervision settings.", buf, 2u);
      }
    }
    id v43 = [(MCMigrator *)self fileManager];
    [v43 removeItemAtPath:v5 error:0];
  }
}

- (void)_removeSupervisionProfiles
{
  id v2 = +[MCManifest sharedManifest];
  CFStringRef v3 = [v2 allInstalledProfileIdentifiers];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        unsigned int v11 = +[MCManifest sharedManifest];
        id v12 = [v11 installedProfileWithIdentifier:v9];

        if ([v12 containsPayloadOfClass:objc_opt_class()])
        {
          id v13 = +[MCInstaller sharedInstaller];
          [v13 removeProfileWithIdentifier:v9 installType:[v12 installType] source:@"Supervision Profile Removal"];

          uint64_t v14 = _MCLogObjects[12];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removed supervision profile.", buf, 2u);
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)_cleanUpAppConfiguration
{
  id v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up app configuration.", buf, 2u);
  }
  CFStringRef v3 = +[NSMutableSet set];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v4 = +[MCManifest sharedManifest];
  id v5 = [v4 allInstalledProfileIdentifiers];

  id v49 = [v5 countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v66;
    do
    {
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(void *)v66 != v48) {
          objc_enumerationMutation(v5);
        }
        uint64_t v7 = *(void *)(*((void *)&v65 + 1) + 8 * i);
        unsigned int v8 = +[MCManifest sharedManifest];
        uint64_t v9 = [v8 installedProfileWithIdentifier:v7];

        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v10 = [v9 payloads];
        id v11 = [v10 countByEnumeratingWithState:&v61 objects:v73 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v62;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v62 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v61 + 1) + 8 * (void)j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v17 = [v15 domains];
                [v3 addObjectsFromArray:v17];
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v61 objects:v73 count:16];
          }
          while (v12);
        }
      }
      id v49 = [v5 countByEnumeratingWithState:&v65 objects:v74 count:16];
    }
    while (v49);
  }

  long long v18 = MDMAppManagementFilePath();
  long long v19 = +[NSDictionary dictionaryWithContentsOfFile:v18];

  contexta = v19;
  long long v20 = [v19 objectForKeyedSubscript:kMDMManagedAppMetadataByBundleIDKey];
  uint64_t v21 = [v20 allKeys];

  long long v50 = (void *)v21;
  [v3 addObjectsFromArray:v21];
  long long v22 = +[MCManagedPreferencesManager globalManagedPreferencesDomain];
  [v3 addObject:v22];

  long long v23 = +[NSMutableArray array];
  uint64_t v24 = [v46 fileManager];
  long long v25 = MCSystemPreferencesDirectory();
  id v26 = [v24 contentsOfDirectoryAtPath:v25 error:0];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v27 = v26;
  id v28 = [v27 countByEnumeratingWithState:&v57 objects:v72 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v58;
    do
    {
      for (k = 0; k != v29; k = (char *)k + 1)
      {
        if (*(void *)v58 != v30) {
          objc_enumerationMutation(v27);
        }
        id v32 = *(void **)(*((void *)&v57 + 1) + 8 * (void)k);
        uint64_t v34 = [v32 stringByDeletingPathExtension];
        if (([v34 rangeOfString:@"com.apple." options:8]
           || ([v34 isEqualToString:@"com.apple.Numbers"] & 1) != 0
           || ([v34 isEqualToString:@"com.apple.Pages"] & 1) != 0
           || [v34 isEqualToString:@"com.apple.Keynote"])
          && ([v3 containsObject:v34] & 1) == 0)
        {
          [v23 addObject:v34];
        }
      }
      id v29 = [v27 countByEnumeratingWithState:&v57 objects:v72 count:16];
    }
    while (v29);
  }

  if ([v23 count])
  {
    os_log_t v35 = _MCLogObjects[12];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      long long v36 = v35;
      id v37 = [v23 count];
      *(_DWORD *)buf = 134217984;
      id v71 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Removing %lu unused managed default domains.", buf, 0xCu);
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v38 = v23;
    id v39 = [v38 countByEnumeratingWithState:&v53 objects:v69 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v54;
      do
      {
        for (m = 0; m != v40; m = (char *)m + 1)
        {
          if (*(void *)v54 != v41) {
            objc_enumerationMutation(v38);
          }
          id v43 = *(void **)(*((void *)&v53 + 1) + 8 * (void)m);
          if ([v43 length]) {
            +[MCManagedPreferencesManager setManagedPreferences:&__NSDictionary0__struct forDomain:v43];
          }
        }
        id v40 = [v38 countByEnumeratingWithState:&v53 objects:v69 count:16];
      }
      while (v40);
    }
  }
  uint64_t v44 = _MCLogObjects[12];
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Finished cleaning up app configuration.", buf, 2u);
  }
}

- (void)_removeUnmanageableApps
{
  v34[0] = MCiBooksBundleIdentifier;
  v34[1] = MCShortcutsOldBundleIdentifier;
  CFStringRef v3 = +[NSArray arrayWithObjects:v34 count:2];
  id v4 = +[NSSet setWithArray:v3];

  id v5 = MDMAppManagementFilePath();
  id v6 = +[NSDictionary dictionaryWithContentsOfFile:v5];

  if ([v6 count])
  {
    uint64_t v7 = kMDMManagedAppMetadataByBundleIDKey;
    unsigned int v8 = [v6 objectForKeyedSubscript:kMDMManagedAppMetadataByBundleIDKey];
    id v9 = [v8 mutableCopy];

    if ([v9 count])
    {
      uint64_t v10 = _MCLogObjects[12];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cleaning up managed apps...", buf, 2u);
      }
      uint64_t v24 = v7;
      id v26 = v2;
      id v11 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v9 count]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v25 = v9;
      id v12 = v9;
      id v13 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v13)
      {
        id v14 = v13;
        int v15 = 0;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            if ([v4 containsObject:v18])
            {
              ++v15;
            }
            else
            {
              long long v19 = [v12 objectForKeyedSubscript:v18];
              [v11 setObject:v19 forKeyedSubscript:v18];
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v27 objects:v33 count:16];
        }
        while (v14);
      }
      else
      {
        int v15 = 0;
      }

      if (([v12 isEqualToDictionary:v11] & 1) == 0)
      {
        id v20 = [v6 mutableCopy];
        [v20 setObject:v11 forKeyedSubscript:v24];
        uint64_t v21 = MDMAppManagementFilePath();
        [v20 MCWriteToBinaryFile:v21];

        long long v22 = _MCLogObjects[12];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v32 = v15;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Removed %d apps.", buf, 8u);
        }
      }
      long long v23 = _MCLogObjects[12];
      id v9 = v25;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Finished cleaning up managed apps.", buf, 2u);
      }

      id v2 = v26;
    }
  }
}

- (void)_correctInstallOptionsOnProfileStubs
{
  id v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Correcting stubs with incorrect install options...", buf, 2u);
  }
  CFStringRef v3 = +[MCManifest sharedManifest];
  id v4 = [v3 allInstalledProfileIdentifiers];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v29 = *(void *)v31;
    uint64_t v7 = kMCInstallProfileOptionIsInstalledByMDM;
    uint64_t v28 = kMCInstallProfileOptionsIsInstalledByDeclarativeManagement;
    uint64_t v8 = kMCInstallProfileOptionManagingProfileIdentifier;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v31 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v12 = +[MCManifest sharedManifest];
        id v13 = [v12 installedProfileWithIdentifier:v10];

        id v14 = [v13 installOptions];
        int v15 = [v14 objectForKeyedSubscript:v7];
        LODWORD(v12) = [v15 BOOLValue];

        uint64_t v16 = [v14 objectForKeyedSubscript:v28];
        unsigned __int8 v17 = [v16 BOOLValue];

        uint64_t v18 = [v14 objectForKeyedSubscript:v8];
        long long v19 = (void *)v18;
        if (v12) {
          BOOL v20 = v18 == 0;
        }
        else {
          BOOL v20 = 0;
        }
        if (v20 && (v17 & 1) == 0)
        {
          id v21 = [v14 mutableCopy];
          [v21 removeObjectForKey:v7];
          id v22 = [v21 copy];
          [v13 setInstallOptions:v22];

          if ([v13 isInstalledForUser]) {
            MCUserProfileStorageDirectory();
          }
          else {
          long long v23 = MCSystemProfileStorageDirectory();
          }
          [v13 writeStubToDirectory:v23];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  uint64_t v24 = _MCLogObjects[12];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Completed install options corrections.", buf, 2u);
  }
}

- (void)_tagManagedAccounts
{
  id v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Tagging managed accounts...", buf, 2u);
  }
  CFStringRef v3 = +[ACAccountStore defaultStore];
  BOOL v20 = +[MCDependencyManager sharedManager];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unsigned __int8 v17 = v3;
  id obj = [v3 accounts];
  id v4 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v22;
    uint64_t v8 = kMCDMManagedProfileToManagingProfileKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = [v10 mcProfileUUID];
        if (v11)
        {
          id v12 = [v20 dependentsOfParent:v11 inDomain:v8];
          id v13 = [v12 count];

          BOOL v14 = v13 != 0;
          if (v13) {
            ++v6;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
        int v15 = +[NSNumber numberWithBool:v14];
        [v10 setAccountProperty:v15 forKey:@"MCAccountIsManaged"];
      }
      id v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }

  uint64_t v16 = _MCLogObjects[12];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Completed tagging %d accounts as managed.", buf, 8u);
  }
}

- (void)_tagIMAPAccountsWithProfileAndPayloadProperties
{
  id v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Adding missing tags to IMAP accounts...", buf, 2u);
  }
  id v39 = +[MailAccount mailAccounts];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  CFStringRef v3 = +[MCManifest sharedManifest];
  id v4 = [v3 allInstalledProfileIdentifiers];

  id obj = v4;
  id v36 = [v4 countByEnumeratingWithState:&v59 objects:v67 count:16];
  int v5 = 0;
  if (v36)
  {
    uint64_t v35 = *(void *)v60;
    uint64_t v6 = MailAccountManagedTag;
    uint64_t v45 = kMCAccountProfileUUIDKey;
    uint64_t v43 = MailAccountManagedTag;
    uint64_t v44 = kMCAccountPayloadUUIDKey;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v60 != v35)
        {
          uint64_t v8 = v7;
          objc_enumerationMutation(obj);
          uint64_t v7 = v8;
        }
        uint64_t v38 = v7;
        uint64_t v9 = *(void *)(*((void *)&v59 + 1) + 8 * v7);
        uint64_t v10 = +[MCManifest sharedManifest];
        id v11 = [v10 installedProfileWithIdentifier:v9];

        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        unsigned int v46 = v11;
        id v42 = [v11 payloads];
        id v12 = [v42 countByEnumeratingWithState:&v55 objects:v66 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v56;
          uint64_t v40 = *(void *)v56;
          do
          {
            int v15 = 0;
            id v41 = v13;
            do
            {
              if (*(void *)v56 != v14) {
                objc_enumerationMutation(v42);
              }
              uint64_t v16 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v15);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v48 = v16;
                uint64_t v18 = [v48 persistentResourceID];
                long long v51 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                long long v54 = 0u;
                id v49 = v39;
                id v19 = [v49 countByEnumeratingWithState:&v51 objects:v65 count:16];
                if (v19)
                {
                  id v20 = v19;
                  uint64_t v21 = *(void *)v52;
                  uint64_t v47 = v18;
                  do
                  {
                    for (i = 0; i != v20; i = (char *)i + 1)
                    {
                      if (*(void *)v52 != v21) {
                        objc_enumerationMutation(v49);
                      }
                      long long v23 = *(void **)(*((void *)&v51 + 1) + 8 * i);
                      long long v24 = [v23 accountPropertyForKey:v6];
                      id v25 = v24;
                      if (v24 && [v24 isEqualToString:v18])
                      {
                        [v46 UUID];
                        int v26 = v50 = v5;
                        [v23 setAccountProperty:v26 forKey:v45];

                        long long v27 = [v48 UUID];
                        [v23 setAccountProperty:v27 forKey:v44];

                        uint64_t v28 = [v23 deliveryAccount];
                        uint64_t v29 = [v46 UUID];
                        [v28 setAccountProperty:v29 forKey:v45];

                        long long v30 = [v48 UUID];
                        [v28 setAccountProperty:v30 forKey:v44];

                        uint64_t v6 = v43;
                        uint64_t v18 = v47;
                        int v5 = v50 + 1;
                      }
                    }
                    id v20 = [v49 countByEnumeratingWithState:&v51 objects:v65 count:16];
                  }
                  while (v20);
                }

                uint64_t v14 = v40;
                id v13 = v41;
              }
              int v15 = (char *)v15 + 1;
            }
            while (v15 != v13);
            id v13 = [v42 countByEnumeratingWithState:&v55 objects:v66 count:16];
          }
          while (v13);
        }

        uint64_t v7 = v38 + 1;
      }
      while ((id)(v38 + 1) != v36);
      id v36 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v36);
  }

  long long v31 = _MCLogObjects[12];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v64 = v5;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Done adding missing tags to %d IMAP accounts.", buf, 8u);
  }
}

- (void)_validateCloudConfiguration
{
  CFStringRef v3 = +[MCCloudConfigurationWriter sharedInstance];
  id v4 = MCCloudConfigurationDetailsFilePath();
  int v5 = +[NSMutableDictionary dictionaryWithContentsOfFile:v4];

  id v18 = 0;
  unsigned int v6 = [v3 _validateDetails:v5 outReasonWhyInvalid:&v18];
  id v7 = v18;
  uint64_t v8 = _MCLogObjects[12];
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "Cloud configuration is valid";
      uint64_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Cloud configuration is invalid: %{public}@", buf, 0xCu);
    }

    [v5 removeObjectForKey:kCCSkipSetupKey];
    id v17 = 0;
    unsigned int v13 = [v3 _validateDetails:v5 outReasonWhyInvalid:&v17];
    id v7 = v17;
    uint64_t v14 = _MCLogObjects[12];
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Fixed cloud configuration by deleting skip keys", buf, 2u);
      }
      uint64_t v16 = MCCloudConfigurationDetailsFilePath();
      [v5 MCWriteToBinaryFile:v16];

      MCSendCloudConfigurationDetailsChangedNotification();
    }
    else if (v15)
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v7;
      uint64_t v9 = "Unable to fix cloud configuration: %{public}@";
      uint64_t v10 = v14;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 12;
      goto LABEL_12;
    }
  }
}

- (void)_correctCloudConfigurationIfNecessary
{
}

- (void)_wakeDaemonsPostMigration
{
  id v2 = _MCLogObjects[12];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Waking daemons post migration", v4, 2u);
  }
  CFStringRef v3 = MCPowerlogControlReadMode();
  MCPowerlogControlSwitchMode();
}

- (void)_removeLegacyAPNConfigurations
{
  id v2 = +[MCAPNPayload apnDomainName];
  CFStringRef v3 = +[MCManagedPreferencesManager managedPreferencesForDomain:v2];

  if (v3)
  {
    id v4 = _MCLogObjects[12];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      int v26 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MCMigrator removing APN defaults: %@", buf, 0xCu);
    }
    int v5 = [v3 allKeys];
    unsigned int v6 = +[MCAPNPayload apnDomainName];
    +[MCManagedPreferencesManager removeManagedPreferences:v5 fromDomain:v6];
  }
  id v7 = +[MCManifest sharedManifest];
  uint64_t v8 = [v7 allInstalledProfileIdentifiers];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        BOOL v15 = +[MCManifest sharedManifest];
        uint64_t v16 = [v15 installedProfileWithIdentifier:v14];

        if ([v16 containsPayloadOfClass:objc_opt_class()])
        {
          id v17 = +[MCInstaller sharedInstaller];
          [v17 removeProfileWithIdentifier:v14 installType:[v16 installType] source:@"migrator APN cleanup"];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
}

- (void)_correctMDMConfigurationFile
{
  CFStringRef v3 = MDMFilePath();
  id v4 = +[NSData dataWithContentsOfFile:v3];

  int v5 = +[NSPropertyListSerialization DMCSafePropertyListWithData:v4 options:1 format:0 error:0];
  unsigned int v6 = v5;
  if (v5)
  {
    uint64_t v7 = kMDMIsProfileLockedKey;
    uint64_t v8 = [v5 objectForKeyedSubscript:kMDMIsProfileLockedKey];

    if (!v8)
    {
      id v9 = +[MCInstaller sharedInstaller];
      id v10 = [v9 verifiedMDMProfileIdentifierWithCleanUp];

      if (v10)
      {
        id v11 = +[MCManifest installedProfileWithIdentifier:v10];
        uint64_t v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isLocked]);
        [v6 setObject:v12 forKeyedSubscript:v7];
      }
      else
      {
        [v6 setObject:&__kCFBooleanFalse forKeyedSubscript:v7];
      }

      unsigned int v13 = MDMFilePath();
      [v6 DMCWriteToBinaryFile:v13];
    }
  }
}

- (void)_checkValidUserEnrollment
{
  CFStringRef v3 = +[MCManifest sharedManifest];
  id v4 = [v3 installedMDMProfile];

  if (v4)
  {
    int v5 = [v4 payloadsWithClass:objc_opt_class()];
    unsigned int v6 = [v5 firstObject];

    if (v6)
    {
      if (([v6 isUserEnrollment] & 1) == 0)
      {
        uint64_t v7 = [v6 enrollmentID];

        if (v7)
        {
          uint64_t v8 = _MCLogObjects[12];
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v18 = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Fixing UserEnrollment in profile stub and MDM.plist", v18, 2u);
          }
          [v6 setIsUserEnrollment:1];
          if ([v4 isInstalledForUser]) {
            MCUserProfileStorageDirectory();
          }
          else {
          id v9 = MCSystemProfileStorageDirectory();
          }
          [v4 writeStubToDirectory:v9];
          id v10 = MDMFilePath();
          id v11 = +[NSDictionary MCDictionaryFromFile:v10];
          id v12 = [v11 mutableCopy];

          [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:kMDMUserEnrollmentKey];
          unsigned int v13 = [v6 enrollmentID];
          [v12 setObject:v13 forKeyedSubscript:kMDMEnrollmentIDKey];

          uint64_t v14 = [v6 iCloudEnrollmentID];
          [v12 setObject:v14 forKeyedSubscript:kMDMiCloudEnrollmentIDKey];

          BOOL v15 = [v6 easEnrollmentID];
          [v12 setObject:v15 forKeyedSubscript:kMDMEASEnrollmentIDKey];

          uint64_t v16 = MDMFilePath();
          [v12 MCWriteToBinaryFile:v16];

          id v17 = +[MDMConfiguration sharedConfiguration];
          [v17 refreshDetailsFromDisk];
        }
      }
    }
  }
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (MCNotifier)notifier
{
  return self->_notifier;
}

- (void)setNotifier:(id)a3
{
}

- (BOOL)systemProfileStorageWasMigratedFromLegacyStorage
{
  return self->_systemProfileStorageWasMigratedFromLegacyStorage;
}

- (void)setSystemProfileStorageWasMigratedFromLegacyStorage:(BOOL)a3
{
  self->_systemProfileStorageWasMigratedFromLegacyStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifier, 0);

  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end