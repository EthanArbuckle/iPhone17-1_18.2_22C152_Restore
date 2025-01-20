@interface WFScreenTimeHelper
+ (id)restrictedURLErrorWithHostname:(id)a3;
+ (void)isContentDestinationAllowedByScreenTimeSettings:(id)a3 completionHandler:(id)a4;
@end

@implementation WFScreenTimeHelper

+ (id)restrictedURLErrorWithHostname:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28C58];
  v12[0] = *MEMORY[0x1E4F28568];
  v4 = NSString;
  id v5 = a3;
  v6 = WFLocalizedString(@"The action could not run because “%@” was blocked by the Content Restrictions on this device.");
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, v5, v12[0]);

  v13[0] = v7;
  v12[1] = *MEMORY[0x1E4F285A0];
  v8 = WFLocalizedString(@"You can change this in the Screen Time settings.");
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = [v3 errorWithDomain:@"WFScreenTimeHelperErrorDomain" code:1000 userInfo:v9];

  return v10;
}

+ (void)isContentDestinationAllowedByScreenTimeSettings:(id)a3 completionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void, void *))a4;
  id v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2050000000;
    v8 = (void *)getWFUserSettingsClass_softClass;
    uint64_t v34 = getWFUserSettingsClass_softClass;
    if (!getWFUserSettingsClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getWFUserSettingsClass_block_invoke;
      v37 = &unk_1E6558B78;
      v38 = &v31;
      __getWFUserSettingsClass_block_invoke((uint64_t)buf);
      v8 = (void *)v32[3];
    }
    v25 = v6;
    v9 = v8;
    _Block_object_dispose(&v31, 8);
    id v10 = [v9 alloc];
    v11 = NSUserName();
    v26 = (void *)[v10 initWithUserName:v11];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v12 = [v7 hostnames];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x1E4F1CB10];
          v18 = [NSString stringWithFormat:@"https://%@", v16];
          v19 = [v17 URLWithString:v18];

          if (v19)
          {
            if (([v26 contentFilterListsAllowURL:v19] & 1) == 0)
            {
              v22 = getWFSecurityLogObject();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = "+[WFScreenTimeHelper isContentDestinationAllowedByScreenTimeSettings:completionHandler:]";
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v7;
                _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_INFO, "%s Content destination %@ is being prohibited by Screen Time.", buf, 0x16u);
              }

              v24 = [(id)objc_opt_class() restrictedURLErrorWithHostname:v16];
              v25[2](v25, 0, v24);

              goto LABEL_25;
            }
          }
          else
          {
            v20 = getWFSecurityLogObject();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = "+[WFScreenTimeHelper isContentDestinationAllowedByScreenTimeSettings:completionHandler:]";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v16;
              _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_ERROR, "%s Could not verify Screen Time configuration of invalid hostname %@", buf, 0x16u);
            }
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    v21 = getWFSecurityLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[WFScreenTimeHelper isContentDestinationAllowedByScreenTimeSettings:completionHandler:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_DEBUG, "%s Screen Time is allowing URL content destination: %@", buf, 0x16u);
    }

    v25[2](v25, 1, 0);
LABEL_25:

    v6 = v25;
  }
  else
  {

    v6[2](v6, 1, 0);
  }
}

@end