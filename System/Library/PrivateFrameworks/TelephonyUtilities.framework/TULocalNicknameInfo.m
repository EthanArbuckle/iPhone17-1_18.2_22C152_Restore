@interface TULocalNicknameInfo
- (NSString)shortNickname;
- (TULocalNicknameInfo)init;
- (id)appleTVNicknameForDeviceName:(id)a3;
- (id)formattedDisplayNameForIMNickname:(id)a3 style:(int64_t)a4;
- (id)nicknameWithFormatterStyle:(int64_t)a3;
@end

@implementation TULocalNicknameInfo

- (TULocalNicknameInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)TULocalNicknameInfo;
  v2 = [(TULocalNicknameInfo *)&v6 init];
  if (v2)
  {
    v3 = (void *)CUTWeakLinkClass();
    if (v3)
    {
      v4 = [v3 sharedInstance];
      [v4 connectToDaemon];
    }
  }
  return v2;
}

- (NSString)shortNickname
{
  return (NSString *)[(TULocalNicknameInfo *)self nicknameWithFormatterStyle:1];
}

- (id)appleTVNicknameForDeviceName:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(TULocalNicknameInfo *)self shortNickname], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v6 = (void *)v5;
    v7 = NSString;
    v8 = TUBundle();
    v9 = [v8 localizedStringForKey:@"%@_APPLE_TV_DEVICE_NAME_%@" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
    v10 = objc_msgSend(v7, "stringWithFormat:", v9, v6, v4);
  }
  else
  {
    objc_super v6 = TUBundle();
    v10 = [v6 localizedStringForKey:@"APPLE_TV" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
  }

  return v10;
}

- (id)nicknameWithFormatterStyle:(int64_t)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)CUTWeakLinkClass();
  if (!v5) {
    goto LABEL_11;
  }
  objc_super v6 = [v5 sharedInstance];
  *(void *)&long long v34 = 0;
  *((void *)&v34 + 1) = &v34;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__0;
  v37 = __Block_byref_object_dispose__0;
  id v38 = [v6 personalNickname];
  uint64_t v7 = *(void *)(*((void *)&v34 + 1) + 40);
  if (!v7)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __50__TULocalNicknameInfo_nicknameWithFormatterStyle___block_invoke;
    v28[3] = &unk_1E58E5F68;
    v30 = &v34;
    v9 = v8;
    v29 = v9;
    [v6 fetchPersonalNicknameWithCompletion:v28];
    dispatch_time_t v10 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v9, v10))
    {
      v11 = TUDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[TULocalNicknameInfo nicknameWithFormatterStyle:](v11);
      }
    }
    uint64_t v7 = *(void *)(*((void *)&v34 + 1) + 40);
  }
  v12 = [(TULocalNicknameInfo *)self formattedDisplayNameForIMNickname:v7 style:a3];
  v13 = TUDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v12;
    _os_log_impl(&dword_19C496000, v13, OS_LOG_TYPE_DEFAULT, "Local nickame info retrieved from SNaP: %@", buf, 0xCu);
  }

  _Block_object_dispose(&v34, 8);
  if (!v12)
  {
LABEL_11:
    v14 = (void *)MEMORY[0x1E4F1B990];
    v15 = [MEMORY[0x1E4F28B50] mainBundle];
    v16 = [v15 bundleIdentifier];
    if (v16)
    {
      v17 = objc_msgSend(v14, "tu_contactStoreConfigurationForBundleIdentifier:", v16);
    }
    else
    {
      v18 = TUPreferredFaceTimeBundleIdentifier();
      v17 = objc_msgSend(v14, "tu_contactStoreConfigurationForBundleIdentifier:", v18);
    }
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v17];
    v31[0] = *MEMORY[0x1E4F1AE08];
    v20 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    v31[1] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    id v27 = 0;
    v22 = [v19 _crossPlatformUnifiedMeContactWithKeysToFetch:v21 error:&v27];
    id v23 = v27;

    if (v23)
    {
      v24 = TUDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[TULocalNicknameInfo nicknameWithFormatterStyle:]((uint64_t)v23, v24);
      }

      v12 = 0;
    }
    else
    {
      v12 = TUNameForContactWithFormatterStyle(v22, 1);
    }
    v25 = TUDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v34) = 138412290;
      *(void *)((char *)&v34 + 4) = v12;
      _os_log_impl(&dword_19C496000, v25, OS_LOG_TYPE_DEFAULT, "Local nickame info retrieved from MeContact: %@", (uint8_t *)&v34, 0xCu);
    }
  }

  return v12;
}

void __50__TULocalNicknameInfo_nicknameWithFormatterStyle___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)formattedDisplayNameForIMNickname:(id)a3 style:(int64_t)a4
{
  if (a3)
  {
    id v5 = a3;
    objc_super v6 = objc_opt_new();
    uint64_t v7 = [v5 firstName];
    [v6 setGivenName:v7];

    dispatch_semaphore_t v8 = [v5 lastName];

    [v6 setFamilyName:v8];
    v9 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v6 style:a4 options:0];
    dispatch_time_t v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v11 = [v9 stringByTrimmingCharactersInSet:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)nicknameWithFormatterStyle:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch meContact for local nickname info with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)nicknameWithFormatterStyle:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19C496000, log, OS_LOG_TYPE_ERROR, "Timeout occurred waiting for IMCore to fetch nickname!", v1, 2u);
}

@end