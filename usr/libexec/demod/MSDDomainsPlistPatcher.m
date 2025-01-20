@interface MSDDomainsPlistPatcher
+ (id)patchDomainsPlist:(id)a3;
@end

@implementation MSDDomainsPlistPatcher

+ (id)patchDomainsPlist:(id)a3
{
  id v3 = a3;
  int has_internal_content = os_variant_has_internal_content();
  v5 = +[NSMutableDictionary dictionaryWithContentsOfFile:v3];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKey:@"SystemDomains"];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = [v7 objectForKey:@"CameraRollDomain"];
      id v49 = v3;
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = [v8 objectForKey:@"RelativePathsNotToBackup"];
          if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [v9 removeObject:@"Media/PhotoData/Sync"];
            [v8 setObject:v9 forKey:@"RelativePathsNotToBackup"];
            [v7 setObject:v8 forKey:@"CameraRollDomain"];
          }
          else if (has_internal_content)
          {
            v41 = sub_100068600();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
              sub_1000C925C();
            }
            goto LABEL_181;
          }
          id v10 = [v8 objectForKey:@"RelativePathsToRemoveOnRestore"];

          if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [v10 removeObject:@"Media/PhotoData/Sync"];
            [v10 removeObject:@"Media/PhotoData/Metadata/PhotoData/Sync"];
            [v8 setObject:v10 forKey:@"RelativePathsToRemoveOnRestore"];
            [v7 setObject:v8 forKey:@"CameraRollDomain"];
          }
          else if (has_internal_content)
          {
            v36 = sub_100068600();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              sub_1000C9290();
            }
            goto LABEL_184;
          }
LABEL_16:
          v11 = [v7 objectForKey:@"HomeKitDomain"];

          if (!v11) {
            goto LABEL_39;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_39;
          }
          id v12 = [v11 objectForKey:@"RelativePathsToRemoveOnRestore"];

          if ((v12 || (id v12 = objc_alloc_init((Class)NSMutableArray)) != 0)
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [v12 addObject:@"Library/homed/protected-home.config"];
            [v12 addObject:@"Library/homed/datastore.sqlite"];
            [v12 addObject:@"Library/homed/datastore.sqlite-shm"];
            [v12 addObject:@"Library/homed/datastore.sqlite-wal"];
            [v11 setObject:v12 forKey:@"RelativePathsToRemoveOnRestore"];
            [v7 setObject:v11 forKey:@"HomeKitDomain"];
          }
          else if (has_internal_content)
          {
            v44 = sub_100068600();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
              sub_1000C9158();
            }
            goto LABEL_214;
          }
          id v10 = [v11 objectForKey:@"RelativePathsNotToBackupToService"];

          if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [v10 removeObject:@"Library/homed/datastore.sqlite"];
            [v10 removeObject:@"Library/homed/datastore.sqlite-shm"];
            [v10 removeObject:@"Library/homed/datastore.sqlite-wal"];
            [v11 setObject:v10 forKey:@"RelativePathsNotToBackupToService"];
            [v7 setObject:v11 forKey:@"HomeKitDomain"];
          }
          else if (has_internal_content)
          {
            v42 = sub_100068600();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              sub_1000C918C();
            }
LABEL_178:

LABEL_215:
            goto LABEL_224;
          }
          v13 = [v11 objectForKey:@"RelativePathsNotToBackupInMegaBackup"];

          if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [v13 removeObject:@"Library/homed/datastore.sqlite"];
            [v13 removeObject:@"Library/homed/datastore.sqlite-shm"];
            [v13 removeObject:@"Library/homed/datastore.sqlite-wal"];
            [v11 setObject:v13 forKey:@"RelativePathsNotToBackupInMegaBackup"];
            [v7 setObject:v11 forKey:@"HomeKitDomain"];
          }
          else if (has_internal_content)
          {
            v43 = sub_100068600();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
              sub_1000C91C0();
            }

            goto LABEL_215;
          }
          id v12 = [v11 objectForKey:@"RelativePathsToRestoreOnly"];

          if (v12)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v12 removeObject:@"Library/homed/protected-home.config"];
              [v12 removeObject:@"Library/homed/datastore.sqlite"];
              [v12 removeObject:@"Library/homed/datastore.sqlite-shm"];
              [v12 removeObject:@"Library/homed/datastore.sqlite-wal"];
              [v11 setObject:v12 forKey:@"RelativePathsToRestoreOnly"];
              [v7 setObject:v11 forKey:@"HomeKitDomain"];
              goto LABEL_35;
            }
          }
          if (!has_internal_content)
          {
LABEL_35:
            id v10 = [v11 objectForKey:@"RelativePathsToOnlyBackupEncrypted"];

            if (v10)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v10 removeObject:@"Library/homed/protected-home.config"];
                [v10 removeObject:@"Library/homed/datastore.sqlite"];
                [v10 removeObject:@"Library/homed/datastore.sqlite-shm"];
                [v10 removeObject:@"Library/homed/datastore.sqlite-wal"];
                [v11 setObject:v10 forKey:@"RelativePathsToOnlyBackupEncrypted"];
                [v7 setObject:v11 forKey:@"HomeKitDomain"];
                goto LABEL_39;
              }
            }
            if (!has_internal_content)
            {
LABEL_39:
              v8 = [v7 objectForKey:@"HomeDomain"];

              if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
              {
                if (!has_internal_content)
                {
                  v14 = 0;
                  goto LABEL_86;
                }
                v36 = sub_100068600();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                  sub_1000C8D14();
                }
                goto LABEL_184;
              }
              v9 = [v8 objectForKey:@"RelativePathsNotToBackup"];

              if (v9)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [v9 addObject:@"Library/Preferences/com.apple.identityservices.idstatuscache.plist"];
                  [v9 addObject:@"Library/Preferences/com.apple.identityservicesd.plist"];
                  [v9 addObject:@"Library/Preferences/com.apple.ids.deviceproperties.plist"];
                  [v9 addObject:@"Library/Preferences/com.apple.ids.subservices.plist"];
                  [v9 addObject:@"Library/Preferences/com.apple.ids.plist"];
                  [v9 removeObject:@"Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db"];
                  [v8 setObject:v9 forKey:@"RelativePathsNotToBackup"];
                  [v7 setObject:v8 forKey:@"HomeDomain"];
                  goto LABEL_47;
                }
              }
              if (!has_internal_content)
              {
LABEL_47:
                id v10 = [v8 objectForKey:@"RelativePathsToBackupAndRestore"];

                if (v10)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    [v10 removeObject:@"Library/Accounts"];
                    [v10 removeObject:@"Library/DeviceRegistry"];
                    [v10 removeObject:@"Library/DeviceRegistry.state"];
                    [v10 removeObject:@"Library/MobileBluetooth"];
                    [v10 addObject:@"Library/Application Support/ScreenSaverManager"];
                    v14 = [v8 objectForKey:@"RelativePathsToBackupToDriveAndStandardAccount"];
                    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v15 = [v10 arrayByAddingObjectsFromArray:v14];
                      id v16 = [v15 mutableCopy];

                      v17 = +[NSMutableArray array];
                      [v8 setObject:v17 forKey:@"RelativePathsToBackupToDriveAndStandardAccount"];

                      id v10 = v16;
                    }
                    else
                    {
                      v18 = sub_100068600();
                      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Cannot find RelativePathsToBackupToDriveAndStandardAccount under HomeDomain.", buf, 2u);
                      }
                    }
                    [v8 setObject:v10 forKey:@"RelativePathsToBackupAndRestore"];
                    [v7 setObject:v8 forKey:@"HomeDomain"];
LABEL_58:
                    id v19 = [v8 objectForKey:@"RelativePathsToBackupAndRestore"];

                    if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      [v19 addObject:@"Library/DoNotDisturb/DB/ModeConfigurations.json"];
                      [v19 addObject:@"Library/DoNotDisturb/DB/ModeConfigurationsSecure.json"];
                      [v8 setObject:v19 forKey:@"RelativePathsToBackupAndRestore"];
                      [v7 setObject:v8 forKey:@"HomeDomain"];
                    }
                    else if (has_internal_content)
                    {
                      v24 = sub_100068600();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                        sub_1000C8FEC();
                      }
                      goto LABEL_222;
                    }
                    id v10 = [v8 objectForKey:@"RelativePathsToRestoreOnly"];

                    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      [v10 removeObject:@"Library/DoNotDisturb/DB/ModeConfigurations.json"];
                      [v10 removeObject:@"Library/DoNotDisturb/DB/ModeConfigurationsSecure.json"];
                      [v8 setObject:v10 forKey:@"RelativePathsToRestoreOnly"];
                      [v7 setObject:v8 forKey:@"HomeDomain"];
                    }
                    else if (has_internal_content)
                    {
                      v45 = sub_100068600();
                      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                        sub_1000C9020();
                      }
                      goto LABEL_218;
                    }
                    id v19 = [v8 objectForKey:@"RelativePathsToOnlyBackupEncrypted"];

                    if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      [v19 removeObject:@"Library/DoNotDisturb/DB/ModeConfigurations.json"];
                      [v19 removeObject:@"Library/DoNotDisturb/DB/ModeConfigurationsSecure.json"];
                      [v8 setObject:v19 forKey:@"RelativePathsToOnlyBackupEncrypted"];
                      [v7 setObject:v8 forKey:@"HomeDomain"];
                    }
                    else if (has_internal_content)
                    {
                      v24 = sub_100068600();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                        sub_1000C9054();
                      }
                      goto LABEL_222;
                    }
                    id v10 = [v8 objectForKey:@"RelativePathsToBackupAndRestore"];

                    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      [v10 addObject:@"Library/Safari/SafariTabs.db"];
                      [v8 setObject:v10 forKey:@"RelativePathsToBackupAndRestore"];
                      [v7 setObject:v8 forKey:@"HomeDomain"];
                    }
                    else if (has_internal_content)
                    {
                      v45 = sub_100068600();
                      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                        sub_1000C9088();
                      }
                      goto LABEL_218;
                    }
                    id v19 = [v8 objectForKey:@"RelativePathsToRestoreOnly"];

                    if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      [v19 removeObject:@"Library/Safari/SafariTabs.db"];
                      [v8 setObject:v19 forKey:@"RelativePathsToRestoreOnly"];
                      [v7 setObject:v8 forKey:@"HomeDomain"];
                    }
                    else if (has_internal_content)
                    {
                      v24 = sub_100068600();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                        sub_1000C90BC();
                      }
                      goto LABEL_222;
                    }
                    v20 = [v8 objectForKey:@"RelativePathsToOnlyBackupEncrypted"];

                    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      [v20 removeObject:@"Library/Safari/SafariTabs.db"];
                      [v8 setObject:v20 forKey:@"RelativePathsToOnlyBackupEncrypted"];
                      [v7 setObject:v8 forKey:@"HomeDomain"];
                    }
                    else if (has_internal_content)
                    {
                      v47 = sub_100068600();
                      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
                        sub_1000C90F0();
                      }

                      goto LABEL_223;
                    }
                    id v10 = [v8 objectForKey:@"RelativePathsNotToBackupToService"];

                    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      [v10 removeObject:@"Library/Safari/SafariTabs.db"];
                      [v8 setObject:v10 forKey:@"RelativePathsNotToBackupToService"];
                      [v7 setObject:v8 forKey:@"HomeDomain"];
                    }
                    else if (has_internal_content)
                    {
                      v45 = sub_100068600();
                      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                        sub_1000C9124();
                      }
                      goto LABEL_218;
                    }
LABEL_86:
                    v21 = [v7 objectForKey:@"KeychainDomain"];

                    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v22 = +[NSMutableArray array];
                      [v21 setObject:v22 forKey:@"RelativePathsToBackupAndRestore"];

                      [v7 setObject:v21 forKey:@"KeychainDomain"];
                    }
                    else if (has_internal_content)
                    {
                      v37 = sub_100068600();
                      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
                        sub_1000C8D48();
                      }

LABEL_164:
LABEL_224:
                      id v32 = 0;
                      goto LABEL_137;
                    }
                    v23 = [v7 objectForKey:@"MediaDomain"];

                    if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      [v23 removeObjectForKey:@"RelativePathsNotToBackupToDrive"];
                      [v7 setObject:v23 forKey:@"MediaDomain"];
                      id v19 = [v23 objectForKey:@"RelativePathsToBackupAndRestore"];

                      if (v19)
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          [v19 removeObject:@"Media/iTunes_Control/Device/Trainer"];
                          [v19 removeObject:@"Media/iTunes_Control/iTunes/iTunesPrefs.plist"];
                          [v19 removeObject:@"Media/iTunes_Control/iTunes/MobileSync.plist"];
                          [v19 removeObject:@"Media/iTunes_Control/iTunes/iPhotoAlbumPrefs"];
                          [v19 removeObject:@"Media/iTunes_Control/iTunes/ApertureAlbumPrefs"];
                          [v19 removeObject:@"Media/iTunes_Control/iTunes/PSAlbumAlbums"];
                          [v19 removeObject:@"Media/iTunes_Control/iTunes/PSElementsAlbums"];
                          [v19 removeObject:@"Media/iTunes_Control/iTunes/PhotosFolderPrefs"];
                          [v19 removeObject:@"Media/iTunes_Control/iTunes/PhotosFolderAlbums"];
                          [v19 removeObject:@"Media/iTunes_Control/iTunes/PhotosFolderName"];
                          [v19 removeObject:@"Media/iTunes_Control/iTunes/MediaLibrary.sqlitedb"];
                          [v19 addObject:@"Media/iTunes_Control/iTunes"];
                          [v19 addObject:@"Media/iTunes_Control/Music"];
                          [v19 addObject:@"Media/iTunes_Control/Sync"];
                          [v19 addObject:@"Media/iTunes_Control/Artwork"];
                          [v19 addObject:@"Media/Books"];
                          [v19 addObject:@"Media/Music/Downloads"];
                          [v23 setObject:v19 forKey:@"RelativePathsToBackupAndRestore"];
                          [v7 setObject:v23 forKey:@"MediaDomain"];
                          goto LABEL_98;
                        }
                      }
                      if (!has_internal_content)
                      {
LABEL_98:
                        v8 = [v7 objectForKey:@"RootDomain"];

                        if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          if (!has_internal_content)
                          {
LABEL_121:
                            v25 = [v7 objectForKey:@"SystemPreferencesDomain"];

                            if (v25 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              v26 = [v25 objectForKey:@"RelativePathsNotToBackup"];

                              if (v26)
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  [v26 addObject:@"SystemConfiguration/com.apple.wifi.plist"];
                                  [v26 addObject:@"SystemConfiguration/com.apple.wifi-networks.plist"];
                                  [v25 setObject:v26 forKey:@"RelativePathsNotToBackup"];
                                  [v7 setObject:v25 forKey:@"SystemPreferencesDomain"];
                                  goto LABEL_129;
                                }
                              }
                              if (!has_internal_content)
                              {
LABEL_129:
                                v21 = [v7 objectForKey:@"KeyboardDomain"];

                                if (v21)
                                {
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    v27 = [v21 objectForKey:@"RelativePathsToBackupAndRestore"];

                                    if (v27)
                                    {
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass()) {
                                        [v27 addObject:@"Library/KeyboardServices"];
                                      }
                                    }
                                    goto LABEL_136;
                                  }
                                }
                                if (!has_internal_content)
                                {
                                  v27 = v26;
LABEL_136:
                                  id v28 = objc_alloc_init((Class)NSMutableDictionary);

                                  [v28 setObject:@"/var/MobileAsset" forKey:@"RootPath"];
                                  id v29 = objc_alloc_init((Class)NSMutableArray);

                                  [v29 addObject:@"AssetsV2/com_apple_MobileAsset_SystemEnvironmentAsset"];
                                  [v29 addObject:@"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_FM_GenerativeModels"];
                                  [v29 addObject:@"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_FM_Overrides"];
                                  [v29 addObject:@"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_Siri_Understanding"];
                                  [v29 addObject:@"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_Siri_UnderstandingNLOverrides"];
                                  [v29 addObject:@"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_IF_Planner"];
                                  [v29 addObject:@"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_IF_PlannerOverrides"];
                                  [v28 setObject:v29 forKey:@"RelativePathsToBackupAndRestore"];
                                  [v7 setObject:v28 forKey:@"MobileAssetDomain"];
                                  v30 = +[NSMutableDictionary dictionary];

                                  [v30 setObject:@"/var/mobile/XcodeBuiltProducts" forKey:@"RootPath"];
                                  v31 = +[NSMutableArray array];

                                  [v31 addObject:@"PressDemoScripts.xctestproducts"];
                                  [v30 setObject:v31 forKey:@"RelativePathsToBackupAndRestore"];
                                  [v7 setObject:v30 forKey:@"DemoPortalScriptsDomain"];
                                  [v6 setObject:v7 forKey:@"SystemDomains"];
                                  id v32 = v6;

LABEL_137:
                                  id v3 = v49;
                                  goto LABEL_138;
                                }
                                v40 = sub_100068600();
                                if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                                  sub_1000C8E18();
                                }

                                goto LABEL_164;
                              }
                              v48 = sub_100068600();
                              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
                                sub_1000C8E4C();
                              }
                            }
                            else
                            {
                              if (!has_internal_content)
                              {
                                v26 = v19;
                                goto LABEL_129;
                              }
                              v39 = sub_100068600();
                              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                                sub_1000C8DE4();
                              }
                            }
                            goto LABEL_224;
                          }
                          v24 = sub_100068600();
                          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                            sub_1000C8DB0();
                          }
                          goto LABEL_222;
                        }
                        id v10 = [v8 objectForKey:@"RelativePathsToRemoveOnRestore"];

                        if (v10 || (id v10 = objc_alloc_init((Class)NSMutableArray)) != 0)
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            [v10 addObject:@"Library/Preferences/com.apple.ASPCarryLog.plist"];
                            [v8 setObject:v10 forKey:@"RelativePathsToRemoveOnRestore"];
                            [v7 setObject:v8 forKey:@"RootDomain"];
LABEL_108:
                            id v19 = [v8 objectForKey:@"RelativePathsNotToRemoveIfNotRestored"];

                            if (v19 || (id v19 = objc_alloc_init((Class)NSMutableArray)) != 0)
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                [v19 addObject:@"Library/Preferences/com.apple.MobileAsset.plist"];
                                [v8 setObject:v19 forKey:@"RelativePathsNotToRemoveIfNotRestored"];
                                [v7 setObject:v8 forKey:@"RootDomain"];
                                goto LABEL_113;
                              }
                            }
                            if (!has_internal_content)
                            {
LABEL_113:
                              id v10 = [v8 objectForKey:@"RelativePathsNotToRestore"];

                              if (v10)
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  [v10 removeObject:@"Library/Preferences/com.apple.powerd.lowpowermode.state.plist"];
                                  [v8 setObject:v10 forKey:@"RelativePathsNotToRestore"];
                                  [v7 setObject:v8 forKey:@"RootDomain"];
                                  goto LABEL_117;
                                }
                              }
                              if (!has_internal_content)
                              {
LABEL_117:
                                id v19 = [v8 objectForKey:@"RelativePathsNotToBackup"];

                                if (v19)
                                {
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    [v19 removeObject:@"Library/Preferences/com.apple.powerd.lowpowermode.state.plist"];
                                    [v8 setObject:v19 forKey:@"RelativePathsNotToBackup"];
                                    [v7 setObject:v8 forKey:@"RootDomain"];
                                    goto LABEL_121;
                                  }
                                }
                                if (!has_internal_content) {
                                  goto LABEL_121;
                                }
                                v24 = sub_100068600();
                                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                                  sub_1000C8F1C();
                                }
                                goto LABEL_222;
                              }
                              v45 = sub_100068600();
                              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                                sub_1000C8EE8();
                              }
                              goto LABEL_218;
                            }
                            v24 = sub_100068600();
                            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                              sub_1000C8EB4();
                            }
LABEL_222:

                            goto LABEL_223;
                          }
                        }
                        if (!has_internal_content) {
                          goto LABEL_108;
                        }
                        v45 = sub_100068600();
                        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
                          sub_1000C8E80();
                        }
LABEL_218:

                        goto LABEL_219;
                      }
                      v46 = sub_100068600();
                      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
                        sub_1000C8F50();
                      }
                    }
                    else
                    {
                      if (!has_internal_content)
                      {
                        id v19 = v10;
                        goto LABEL_98;
                      }
                      v38 = sub_100068600();
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                        sub_1000C8D7C();
                      }
                    }
                    goto LABEL_224;
                  }
                }
                if (!has_internal_content)
                {
                  v14 = 0;
                  goto LABEL_58;
                }
                v36 = sub_100068600();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                  sub_1000C8FB8();
                }
LABEL_184:

LABEL_219:
                goto LABEL_223;
              }
              v41 = sub_100068600();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                sub_1000C8F84();
              }
LABEL_181:

LABEL_223:
              goto LABEL_224;
            }
            v42 = sub_100068600();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              sub_1000C9228();
            }
            goto LABEL_178;
          }
          v44 = sub_100068600();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            sub_1000C91F4();
          }
LABEL_214:

          goto LABEL_215;
        }
      }
      if (!has_internal_content)
      {
        id v10 = 0;
        goto LABEL_16;
      }
      v35 = sub_100068600();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_1000C8CE0();
      }
    }
    else
    {
      v34 = sub_100068600();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Cannot find system domains.", v51, 2u);
      }
    }
  }
  else
  {
    v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000C8C68((uint64_t)v3, v7);
    }
  }
  id v32 = 0;
LABEL_138:

  return v32;
}

@end