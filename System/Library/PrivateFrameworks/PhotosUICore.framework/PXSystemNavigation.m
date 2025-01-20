@interface PXSystemNavigation
+ (id)_urlForDestination:(int64_t)a3;
+ (void)navigateToDestination:(int64_t)a3 completion:(id)a4;
@end

@implementation PXSystemNavigation

+ (void)navigateToDestination:(int64_t)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, uint64_t, id))a4;
  if (a3 <= 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PXSystemNavigation.m", 219, @"Invalid parameter not satisfying: %@", @"destination > PXSystemNavigationDestinationInvalid" object file lineNumber description];
  }
  else
  {
    if ((unint64_t)a3 < 0xE) {
      goto LABEL_3;
    }
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PXSystemNavigation.m", 220, @"Invalid parameter not satisfying: %@", @"destination < PXSystemNavigationDestinationEndMarker" object file lineNumber description];
  }

LABEL_3:
  v8 = [(id)objc_opt_class() _urlForDestination:a3];
  v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v10 = *MEMORY[0x1E4F62688];
  v22[0] = *MEMORY[0x1E4F626A0];
  v22[1] = v10;
  v23[0] = MEMORY[0x1E4F1CC38];
  v23[1] = MEMORY[0x1E4F1CC38];
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  id v21 = 0;
  uint64_t v12 = [v9 openSensitiveURL:v8 withOptions:v11 error:&v21];
  id v13 = v21;

  if ((v12 & 1) == 0)
  {
    id v14 = v8;
    id v15 = v13;
    v16 = PLUIGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = PXSystemNavigationDestinationDescription(a3);
      v18 = [v15 domain];
      uint64_t v19 = [v15 code];
      *(_DWORD *)buf = 138544386;
      v25 = v17;
      __int16 v26 = 2114;
      id v27 = v14;
      __int16 v28 = 2114;
      v29 = v18;
      __int16 v30 = 2048;
      uint64_t v31 = v19;
      __int16 v32 = 2112;
      id v33 = v15;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "Failed to navigate to destination: %{public}@, url: %{public}@, error: <%{public}@:%ld> (%@)", buf, 0x34u);
    }
  }
  if (v7) {
    v7[2](v7, v12, v13);
  }
}

+ (id)_urlForDestination:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 14:
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:a1 file:@"PXSystemNavigation.m" lineNumber:177 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      v6 = @"prefs:";
      break;
    case 2:
      v6 = @"prefs:root=General&path=STORAGE_MGMT";
      break;
    case 3:
      v6 = @"prefs:root=APPLE_ACCOUNT";
      break;
    case 4:
      v6 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE";
      break;
    case 5:
      v6 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/PHOTOS";
      break;
    case 6:
      v6 = @"prefs:root=Photos&path=SharedLibrarySettingsButton";
      break;
    case 7:
      v6 = @"prefs:root=Photos";
      break;
    case 8:
      v6 = @"prefs:root=ACCOUNTS_AND_PASSWORDS&path=ADD_ACCOUNT";
      break;
    case 9:
      v6 = @"prefs:root=MOBILE_DATA_SETTINGS_ID&path=SHOW_ALL";
      break;
    case 10:
      v6 = @"prefs:root=ROOT#AIRPLANE_MODE";
      break;
    case 11:
      v6 = @"https://icq.icloud.com?context=ZXh0ZXJuYWxBcHBfY29tLmFwcGxlLm1vYmlsZXNsaWRlc2hvdw==";
      break;
    case 12:
      v6 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/BACKUP";
      break;
    case 13:
      v6 = @"prefs:root=Privacy&path=MEDIALIBRARY";
      break;
    default:
      v6 = 0;
      break;
  }
  v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = PXSystemNavigationDestinationDescription(a3);
    [v9 handleFailureInMethod:a2, a1, @"PXSystemNavigation.m", 210, @"No URL for destination: %@", v10 object file lineNumber description];
  }
  return v7;
}

@end