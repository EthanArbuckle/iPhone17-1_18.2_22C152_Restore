@interface PSThirdPartySettingsDetail
+ (id)preferencesURLForBundleID:(id)a3 forSettingType:(int64_t)a4;
@end

@implementation PSThirdPartySettingsDetail

+ (id)preferencesURLForBundleID:(id)a3 forSettingType:(int64_t)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v5 = (__CFString *)a3;
  v6 = _PSLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v46 = v5;
    __int16 v47 = 1024;
    int v48 = a4;
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "########### Find (%@) type (%d)", buf, 0x12u);
  }

  v7 = (__CFString **)MEMORY[0x1E4FA9A10];
  v8 = kTCCContactsID;
  switch(a4)
  {
    case 0:
      v9 = _PSLoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6597000, v9, OS_LOG_TYPE_DEFAULT, "########### PSSettingTypeTopLevel", buf, 2u);
      }

      v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      int v11 = [v10 applicationIsInstalled:v5];

      if (v11)
      {
        v12 = (void *)MEMORY[0x1E4F1CB10];
        [NSString stringWithFormat:@"app-prefs:%@", v5];
        goto LABEL_18;
      }
      v17 = 0;
      goto LABEL_46;
    case 1:
      v16 = +[PSNotificationSettingsController sharedInstance];
      v17 = [v16 sectionInfoForIdentifier:v5];

      if (v17)
      {
        v12 = (void *)MEMORY[0x1E4F1CB10];
        [NSString stringWithFormat:@"prefs:root=NOTIFICATIONS_ID&path=%@", v5];
LABEL_18:
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v17 = [v12 URLWithString:v14];
        goto LABEL_45;
      }
      goto LABEL_46;
    case 2:
      if ([(__CFString *)v5 isEqualToString:@"com.apple.weather"])
      {
        v15 = @"com.apple.locationd.bundle-/System/Library/PrivateFrameworks/Weather.framework";
LABEL_53:

        goto LABEL_56;
      }
      if ([(__CFString *)v5 isEqualToString:@"com.apple.AssistantServices"])
      {
        v15 = @"com.apple.locationd.bundle-/System/Library/PrivateFrameworks/AssistantServices.framework";
        goto LABEL_53;
      }
      v15 = v5;
LABEL_56:
      v5 = (__CFString *)CLCopyAppsUsingLocation();
      [(__CFString *)v5 allKeys];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v18 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = [(__CFString *)v18 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (!v31)
      {
LABEL_64:

        v14 = @"LOCATION";
        v24 = v5;
        v5 = v15;
        v15 = 0;
        goto LABEL_36;
      }
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v40;
      v14 = @"LOCATION";
LABEL_58:
      uint64_t v34 = 0;
      while (1)
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(v18);
        }
        if ([*(id *)(*((void *)&v39 + 1) + 8 * v34) isEqualToString:v15]) {
          break;
        }
        if (v32 == ++v34)
        {
          uint64_t v32 = [(__CFString *)v18 countByEnumeratingWithState:&v39 objects:v44 count:16];
          if (!v32) {
            goto LABEL_64;
          }
          goto LABEL_58;
        }
      }
LABEL_35:
      v24 = v18;
LABEL_36:

      v18 = v24;
      v25 = v5;
      v5 = v15;
LABEL_38:
      v26 = v5;

      v5 = v25;
LABEL_40:

      if ([(__CFString *)v14 length] && [(__CFString *)v26 length])
      {
        v27 = (void *)MEMORY[0x1E4F1CB10];
        v28 = [NSString stringWithFormat:@"prefs:root=Privacy&path=%@#%@", v14, v26];
        v17 = [v27 URLWithString:v28];
      }
      else
      {
        v17 = 0;
      }
      v5 = v26;
LABEL_45:

LABEL_46:
      v29 = _PSLoggingFacility();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v17;
        _os_log_impl(&dword_1A6597000, v29, OS_LOG_TYPE_DEFAULT, "########### URL (%@)", buf, 0xCu);
      }

      return v17;
    case 3:
      goto LABEL_25;
    case 4:
      v7 = (__CFString **)MEMORY[0x1E4FA9A30];
      v8 = kTCCCalendarsID;
      goto LABEL_25;
    case 5:
      v7 = (__CFString **)MEMORY[0x1E4FA9AF0];
      v8 = kTCCRemindersID;
      goto LABEL_25;
    case 6:
      v7 = (__CFString **)MEMORY[0x1E4FA9AE0];
      v8 = kTCCPhotosID;
      goto LABEL_25;
    case 7:
      v7 = (__CFString **)MEMORY[0x1E4FA9A28];
      v8 = kTCCBluetoothSharingID;
      goto LABEL_25;
    case 8:
      v7 = (__CFString **)MEMORY[0x1E4FA9AA8];
      v8 = kTCCMicrophoneID;
      goto LABEL_25;
    case 9:
      v7 = (__CFString **)MEMORY[0x1E4FA9B10];
      v8 = kTCCSpeechRecognitionID;
      goto LABEL_25;
    case 10:
      v7 = (__CFString **)MEMORY[0x1E4FA9A90];
      v8 = kTCCLiverpoolID;
      goto LABEL_25;
    case 11:
      v7 = (__CFString **)MEMORY[0x1E4FA9AC8];
      v8 = kTCCMotionID;
      goto LABEL_25;
    case 12:
      v7 = (__CFString **)MEMORY[0x1E4FA9A38];
      v8 = kTCCCameraID;
      goto LABEL_25;
    case 13:
      v7 = (__CFString **)MEMORY[0x1E4FA9AA0];
      v8 = kTCCMediaLibraryID;
      goto LABEL_25;
    case 14:
      v7 = (__CFString **)MEMORY[0x1E4FA9B38];
      v8 = kTCCWebKitIntelligentTrackingPreventionID;
LABEL_25:
      v14 = *v8;
      v13 = *v7;
      goto LABEL_26;
    default:
      v13 = &stru_1EFB51FD0;
      v14 = &stru_1EFB51FD0;
LABEL_26:
      if ([(__CFString *)v13 length])
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        v18 = (__CFString *)(id)TCCAccessCopyInformation();
        v15 = (__CFString *)[(__CFString *)v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (!v15) {
          goto LABEL_35;
        }
        uint64_t v19 = *(void *)v36;
        v20 = (void *)MEMORY[0x1E4FA99D8];
        while (1)
        {
          for (i = 0; i != v15; i = (__CFString *)((char *)i + 1))
          {
            if (*(void *)v36 != v19) {
              objc_enumerationMutation(v18);
            }
            v22 = CFBundleGetIdentifier((CFBundleRef)[*(id *)(*((void *)&v35 + 1) + 8 * i) objectForKey:*v20]);
            char v23 = [v22 isEqualToString:v5];

            if (v23)
            {
              v25 = v18;
              goto LABEL_38;
            }
          }
          v15 = (__CFString *)[(__CFString *)v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (!v15) {
            goto LABEL_35;
          }
        }
      }
      v26 = 0;
      goto LABEL_40;
  }
}

@end