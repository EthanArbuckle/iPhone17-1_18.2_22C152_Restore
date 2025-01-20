@interface VTVoiceProfileMigration
+ (BOOL)checkIfMigrationNecessaryForCompatibilityVersion:(unint64_t)a3 forLanguageCode:(id)a4;
+ (BOOL)migrateVoiceProfileToVersion:(unint64_t)a3 forLanguageCode:(id)a4;
+ (unint64_t)getCurrentVoiceProfileVersionForLanguageCode:(id)a3;
+ (void)updateVoiceProfileVersionFileForLanguageCode:(id)a3;
@end

@implementation VTVoiceProfileMigration

+ (void)updateVoiceProfileVersionFileForLanguageCode:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[VTSpeakerIdUtilities getProfileVersionFilePathForLanguageCode:v3];
  v5 = [MEMORY[0x263F08850] defaultManager];
  char v40 = 0;
  v6 = +[VTUtilities deviceProductType];
  if (!v6
    || (unint64_t v7 = +[VTUtilities deviceCategoryForDeviceProductType:v6]) == 0)
  {
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v44 = v6;
      __int16 v45 = 2114;
      id v46 = v3;
      _os_log_error_impl(&dword_21844F000, v8, OS_LOG_TYPE_ERROR, "ERR: Unknown device-category for device: %{public}@, languageCode: %{public}@", buf, 0x16u);
    }
    unint64_t v7 = 0;
  }
  if ([v5 fileExistsAtPath:v4 isDirectory:&v40]) {
    BOOL v9 = v40 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    v21 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v4];
    id v39 = 0;
    v10 = [MEMORY[0x263F08900] JSONObjectWithData:v21 options:0 error:&v39];
    id v22 = v39;
    id v23 = v22;
    if (!v10 || v22)
    {
      v34 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v44 = v4;
        __int16 v45 = 2112;
        id v46 = v23;
        _os_log_error_impl(&dword_21844F000, v34, OS_LOG_TYPE_ERROR, "Could not read existing %@ file: err: %@", buf, 0x16u);
      }
      goto LABEL_27;
    }

    v20 = (void *)[v10 mutableCopy];
    v24 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
    [v20 setValue:v24 forKey:@"VoiceProfileCompatabiltyVersion"];

    v25 = +[VTUtilities deviceProductType];
    [v20 setValue:v25 forKey:@"VoiceProfileProductType"];

    v26 = +[VTUtilities deviceSoftwareVersion];
    [v20 setValue:v26 forKey:@"VoiceProfileSWVersion"];

    v27 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v7);
    [v20 setValue:v27 forKey:@"VoiceProfileCategoryType"];

    v19 = (void *)[v20 copy];
  }
  else
  {
    v41[0] = @"VoiceProfileCompatabiltyVersion";
    uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
    v42[0] = v35;
    v41[1] = @"VoiceProfileProductType";
    v10 = +[VTUtilities deviceProductType];
    v42[1] = v10;
    v41[2] = @"VoiceProfileSWVersion";
    v11 = +[VTUtilities deviceSoftwareVersion];
    v42[2] = v11;
    v41[3] = @"VoiceProfileCategoryType";
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v7);
    v42[3] = v12;
    v41[4] = @"VoiceProfileIdentifier";
    [MEMORY[0x263F08C38] UUID];
    v13 = v4;
    v14 = v6;
    v15 = v5;
    v17 = id v16 = v3;
    v18 = [v17 UUIDString];
    v42[4] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:5];

    id v3 = v16;
    v5 = v15;
    v6 = v14;
    v4 = v13;
    v20 = (void *)v35;
  }
  id v38 = 0;
  v21 = [MEMORY[0x263F08900] dataWithJSONObject:v19 options:1 error:&v38];
  id v28 = v38;
  id v23 = v28;
  if (!v21 || v28)
  {
    v32 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v19;
      __int16 v45 = 2112;
      id v46 = v23;
      v33 = "ERR: error creating updatedVoiceProfileJsonData from: %@, err: %@";
      goto LABEL_32;
    }
    goto LABEL_24;
  }
  if ([v5 fileExistsAtPath:v4 isDirectory:&v40])
  {
    if (!v40)
    {
      id v37 = 0;
      char v29 = [v5 removeItemAtPath:v4 error:&v37];
      id v23 = v37;
      if ((v29 & 1) == 0)
      {
        v32 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v44 = v4;
          __int16 v45 = 2112;
          id v46 = v23;
          v33 = "ERR: error removing voice profile version file at: %@, err: %@";
          goto LABEL_32;
        }
LABEL_24:
        v10 = v19;
LABEL_27:

        v19 = v10;
        goto LABEL_28;
      }
    }
  }
  v30 = v23;
  id v36 = v23;
  int v31 = [v21 writeToFile:v4 options:0 error:&v36];
  id v23 = v36;

  if (!v31 || v23)
  {
    v32 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v44 = v4;
      __int16 v45 = 2112;
      id v46 = v23;
      v33 = "ERR: Error writing voice profile version file at: %@, err:%@";
LABEL_32:
      _os_log_error_impl(&dword_21844F000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x16u);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
LABEL_28:
}

+ (BOOL)migrateVoiceProfileToVersion:(unint64_t)a3 forLanguageCode:(id)a4
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v5 = a4;
  unint64_t v6 = +[VTVoiceProfileMigration getCurrentVoiceProfileVersionForLanguageCode:v5];
  unint64_t v7 = v6;
  char v85 = 0;
  if (a3 != 1 || v6)
  {
    v58 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v87 = v5;
      __int16 v88 = 2048;
      unint64_t v89 = v7;
      __int16 v90 = 2048;
      unint64_t v91 = a3;
      _os_log_impl(&dword_21844F000, v58, OS_LOG_TYPE_DEFAULT, "Migrating Voice Profile for %{public}@ from %lu to %lu not supported", buf, 0x20u);
    }
  }
  else
  {
    v8 = +[VTSpeakerIdUtilities getSATDirectoryForLanguageCode:v5];
    unint64_t v9 = 0x263F08000uLL;
    v10 = [MEMORY[0x263F08850] defaultManager];
    id v84 = 0;
    v11 = [v10 contentsOfDirectoryAtPath:v8 error:&v84];
    id v12 = v84;

    v69 = +[VTSpeakerIdUtilities getSATDirectoryForModelType:1 forLanguageCode:v5];
    if (v12 || !v11)
    {
      v59 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v87 = v8;
        __int16 v88 = 2114;
        unint64_t v89 = (unint64_t)v12;
        _os_log_impl(&dword_21844F000, v59, OS_LOG_TYPE_DEFAULT, "Coudn't fetch the list of files at path: %{public}@ %{public}@", buf, 0x16u);
      }
    }
    else
    {
      id v13 = +[VTSpeakerIdUtilities createSATDirectoriesForType:1 forLanguageCode:v5];
      id v14 = +[VTSpeakerIdUtilities createSATDirectoriesForType:3 forLanguageCode:v5];
      id v62 = v5;
      id v15 = +[VTSpeakerIdUtilities createSATDirectoriesForType:2 forLanguageCode:v5];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      v61 = v11;
      id obj = v11;
      uint64_t v74 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
      id v12 = 0;
      if (v74)
      {
        uint64_t v73 = *(void *)v81;
        v63 = v8;
        do
        {
          for (uint64_t i = 0; i != v74; ++i)
          {
            if (*(void *)v81 != v73) {
              objc_enumerationMutation(obj);
            }
            v17 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            if (v17)
            {
              v18 = [v8 stringByAppendingPathComponent:*(void *)(*((void *)&v80 + 1) + 8 * i)];
              v19 = [v69 stringByAppendingPathComponent:v17];
              if (![v17 isEqualToString:@"audio"]) {
                goto LABEL_36;
              }
              v66 = v19;
              v20 = v12;
              uint64_t v21 = [v18 stringByAppendingPathComponent:@"meta_version.json"];
              v72 = [v18 stringByAppendingPathComponent:@"enrollment_migrated"];
              v68 = v18;
              uint64_t v67 = [v18 stringByAppendingPathComponent:@"enrollment_completed"];
              uint64_t v22 = [v8 stringByAppendingPathComponent:@"meta_version.json"];
              v71 = [v8 stringByAppendingPathComponent:@"enrollment_migrated"];
              id v23 = (void *)v21;
              v70 = [v8 stringByAppendingPathComponent:@"enrollment_completed"];
              v24 = [*(id *)(v9 + 2128) defaultManager];
              unint64_t v25 = v9;
              int v26 = [v24 fileExistsAtPath:v21 isDirectory:&v85];

              v65 = (void *)v22;
              if (v26)
              {
                v27 = [*(id *)(v25 + 2128) defaultManager];
                id v79 = v20;
                char v28 = [v27 moveItemAtPath:v21 toPath:v22 error:&v79];
                id v29 = v79;

                if ((v28 & 1) == 0)
                {
                  v30 = VTLogContextFacilityVoiceTrigger;
                  v19 = v66;
                  int v31 = v72;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543874;
                    id v87 = v23;
                    __int16 v88 = 2114;
                    unint64_t v89 = v22;
                    __int16 v90 = 2114;
                    unint64_t v91 = (unint64_t)v29;
                    _os_log_impl(&dword_21844F000, v30, OS_LOG_TYPE_DEFAULT, "ERR: Failed to move %{public}@ to %{public}@ with error %{public}@", buf, 0x20u);
                  }
                  v18 = v68;
LABEL_23:
                  unint64_t v9 = 0x263F08000uLL;
                  v32 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v61);
                  int v33 = [v32 fileExistsAtPath:v31 isDirectory:&v85];

                  if (v33)
                  {
                    v34 = [MEMORY[0x263F08850] defaultManager];
                    id v78 = v29;
                    char v35 = [v34 moveItemAtPath:v31 toPath:v71 error:&v78];
                    id v36 = v78;

                    if (v35)
                    {
                      id v37 = (void *)v67;
                    }
                    else
                    {
                      id v38 = VTLogContextFacilityVoiceTrigger;
                      id v37 = (void *)v67;
                      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543874;
                        id v87 = v72;
                        __int16 v88 = 2114;
                        unint64_t v89 = (unint64_t)v71;
                        __int16 v90 = 2114;
                        unint64_t v91 = (unint64_t)v36;
                        _os_log_impl(&dword_21844F000, v38, OS_LOG_TYPE_DEFAULT, "ERR: Failed to move %{public}@ to %{public}@ with error %{public}@", buf, 0x20u);
                      }
                    }
                  }
                  else
                  {
                    id v36 = v29;
                    id v37 = (void *)v67;
                  }
                  id v39 = [MEMORY[0x263F08850] defaultManager];
                  int v40 = [v39 fileExistsAtPath:v37 isDirectory:&v85];

                  if (v40)
                  {
                    v41 = [MEMORY[0x263F08850] defaultManager];
                    id v77 = v36;
                    char v42 = [v41 moveItemAtPath:v37 toPath:v70 error:&v77];
                    id v12 = v77;

                    if ((v42 & 1) == 0)
                    {
                      v43 = VTLogContextFacilityVoiceTrigger;
                      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543874;
                        id v87 = v37;
                        __int16 v88 = 2114;
                        unint64_t v89 = (unint64_t)v70;
                        __int16 v90 = 2114;
                        unint64_t v91 = (unint64_t)v12;
                        _os_log_impl(&dword_21844F000, v43, OS_LOG_TYPE_DEFAULT, "ERR: Failed to move %{public}@ to %{public}@ with error %{public}@", buf, 0x20u);
                      }
                    }
                    unint64_t v9 = 0x263F08000;
                  }
                  else
                  {
                    id v12 = v36;
                  }

                  v8 = v63;
LABEL_36:
                  if ((objc_msgSend(v17, "isEqualToString:", @"audio", v61) & 1) != 0
                    || ([v17 isEqualToString:@"model"] & 1) != 0
                    || [v17 isEqualToString:@"td-sr-model"])
                  {
                    v44 = [*(id *)(v9 + 2128) defaultManager];
                    int v45 = [v44 fileExistsAtPath:v19 isDirectory:&v85];

                    if (v45)
                    {
                      id v46 = [*(id *)(v9 + 2128) defaultManager];
                      id v76 = v12;
                      char v47 = [v46 removeItemAtPath:v19 error:&v76];
                      id v48 = v76;

                      if ((v47 & 1) == 0)
                      {
                        v49 = VTLogContextFacilityVoiceTrigger;
                        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138543618;
                          id v87 = v19;
                          __int16 v88 = 2114;
                          unint64_t v89 = (unint64_t)v48;
                          _os_log_impl(&dword_21844F000, v49, OS_LOG_TYPE_DEFAULT, "ERR: Failed to delete %{public}@ with error %{public}@", buf, 0x16u);
                        }
                      }
                    }
                    else
                    {
                      id v48 = v12;
                    }
                    v50 = [*(id *)(v9 + 2128) defaultManager];
                    id v75 = v48;
                    int v51 = [v50 moveItemAtPath:v18 toPath:v19 error:&v75];
                    id v12 = v75;

                    uint64_t v52 = VTLogContextFacilityVoiceTrigger;
                    BOOL v53 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
                    if (v51)
                    {
                      if (v53)
                      {
                        *(_DWORD *)buf = 138543618;
                        id v87 = v18;
                        __int16 v88 = 2114;
                        unint64_t v89 = (unint64_t)v19;
                        v54 = v52;
                        v55 = "Successfully moved %{public}@ to %{public}@";
                        uint32_t v56 = 22;
                        goto LABEL_9;
                      }
LABEL_10:

                      continue;
                    }
                    if (!v53) {
                      goto LABEL_10;
                    }
                    *(_DWORD *)buf = 138543874;
                    id v87 = v18;
                    __int16 v88 = 2114;
                    unint64_t v89 = (unint64_t)v19;
                    __int16 v90 = 2114;
                    unint64_t v91 = (unint64_t)v12;
                    v54 = v52;
                    v55 = "ERR: Failed to move %{public}@ to %{public}@ with error %{public}@";
                    uint32_t v56 = 32;
                  }
                  else
                  {
                    uint64_t v57 = VTLogContextFacilityVoiceTrigger;
                    if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_10;
                    }
                    *(_DWORD *)buf = 138543362;
                    id v87 = v18;
                    v54 = v57;
                    v55 = "Skipping moving of file %{public}@";
                    uint32_t v56 = 12;
                  }
LABEL_9:
                  _os_log_impl(&dword_21844F000, v54, OS_LOG_TYPE_DEFAULT, v55, buf, v56);
                  goto LABEL_10;
                }
              }
              else
              {
                id v29 = v20;
              }
              v19 = v66;
              v18 = v68;
              int v31 = v72;
              goto LABEL_23;
            }
          }
          uint64_t v74 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
        }
        while (v74);
      }

      id v5 = v62;
      +[VTVoiceProfileMigration updateVoiceProfileVersionFileForLanguageCode:v62];
      v11 = v61;
    }
  }
  return 1;
}

+ (BOOL)checkIfMigrationNecessaryForCompatibilityVersion:(unint64_t)a3 forLanguageCode:(id)a4
{
  return +[VTVoiceProfileMigration getCurrentVoiceProfileVersionForLanguageCode:a4] < a3;
}

+ (unint64_t)getCurrentVoiceProfileVersionForLanguageCode:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  unint64_t v6 = +[VTSpeakerIdUtilities getProfileVersionFilePathForLanguageCode:v4];

  char v19 = 0;
  if (![v5 fileExistsAtPath:v6 isDirectory:&v19])
  {
    unint64_t v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v6;
      _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ doesnt exist!!!", buf, 0xCu);
    }
    goto LABEL_7;
  }
  if (v19)
  {
    unint64_t v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v6;
      _os_log_error_impl(&dword_21844F000, v7, OS_LOG_TYPE_ERROR, "ERR:%{public}@ is a directory!!!", buf, 0xCu);
      v8 = 0;
      goto LABEL_8;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6];
  id v18 = 0;
  v8 = [MEMORY[0x263F08900] JSONObjectWithData:v11 options:0 error:&v18];
  id v14 = v18;
  if (v8) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (!v15)
  {
    id v16 = v14;
    v17 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v6;
      __int16 v22 = 2112;
      id v23 = v16;
      _os_log_error_impl(&dword_21844F000, v17, OS_LOG_TYPE_ERROR, "ERR: Could not read existing %@ file: err: %@", buf, 0x16u);
    }

    unint64_t v12 = 0;
    goto LABEL_10;
  }

LABEL_8:
  v10 = [v8 objectForKeyedSubscript:@"VoiceProfileCompatabiltyVersion"];

  if (!v10)
  {
    unint64_t v12 = 0;
    goto LABEL_12;
  }
  v11 = [v8 objectForKeyedSubscript:@"VoiceProfileCompatabiltyVersion"];
  unint64_t v12 = (int)[v11 intValue];
LABEL_10:

LABEL_12:
  return v12;
}

@end