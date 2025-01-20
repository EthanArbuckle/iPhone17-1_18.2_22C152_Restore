@interface STTimeAllowancesCompatibilityController
+ (void)showOnDemandDowntimeCompatibilityAlertIfNeededForUser:(id)a3 alertPresenter:(id)a4 completionHandler:(id)a5;
@end

@implementation STTimeAllowancesCompatibilityController

+ (void)showOnDemandDowntimeCompatibilityAlertIfNeededForUser:(id)a3 alertPresenter:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(void))a5;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__5;
  v49 = __Block_byref_object_dispose__5;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5;
  v43 = __Block_byref_object_dispose__5;
  id v44 = 0;
  v10 = [v7 managedObjectContext];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __130__STTimeAllowancesCompatibilityController_showOnDemandDowntimeCompatibilityAlertIfNeededForUser_alertPresenter_completionHandler___block_invoke;
  v33[3] = &unk_264768578;
  v35 = &v55;
  id v11 = v7;
  id v34 = v11;
  v36 = &v51;
  v37 = &v45;
  v38 = &v39;
  [v10 performBlockAndWait:v33];

  v12 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.preferences.screentime"];
  v13 = [v12 dictionaryForKey:@"HasShownOnDemandDowntimeCompatibilityAlertByDSID"];
  v14 = [v13 objectForKeyedSubscript:v46[5]];
  char v15 = [v14 BOOLValue];

  if (*((unsigned char *)v52 + 24)) {
    char v16 = v15;
  }
  else {
    char v16 = 1;
  }
  if ((v16 & 1) == 0)
  {
    v17 = +[STScreenTimeSettingsUIBundle bundle];
    v18 = v17;
    if (*((unsigned char *)v56 + 24))
    {
      if (v40[5])
      {
        id v27 = v8;
        v19 = [v17 localizedStringForKey:@"UpdateChildDevicesAlertTitleFormat" value:&stru_26D9391A8 table:0];
        v20 = [MEMORY[0x263EFF960] currentLocale];
        id v21 = [NSString alloc];
        v22 = objc_msgSend(v21, "initWithFormat:locale:", v19, v20, v40[5]);
        v23 = [v18 localizedStringForKey:@"OnDemandDowntimeChildCompatibilityAlertMessageFormat" value:&stru_26D9391A8 table:0];
        id v24 = [NSString alloc];
        v25 = objc_msgSend(v24, "initWithFormat:locale:", v23, v20, v40[5]);

        id v8 = v27;
LABEL_12:
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __130__STTimeAllowancesCompatibilityController_showOnDemandDowntimeCompatibilityAlertIfNeededForUser_alertPresenter_completionHandler___block_invoke_2;
        v28[3] = &unk_2647685A0;
        id v29 = v13;
        v32 = &v45;
        id v30 = v12;
        v31 = v9;
        [v8 showAlertWithTitle:v22 message:v25 completion:v28];

        goto LABEL_13;
      }
      v22 = [v17 localizedStringForKey:@"UpdateChildDevicesAlertTitle" value:&stru_26D9391A8 table:0];
      uint64_t v26 = [v18 localizedStringForKey:@"OnDemandDowntimeChildCompatibilityAlertMessage" value:&stru_26D9391A8 table:0];
    }
    else
    {
      v22 = [v17 localizedStringForKey:@"UpdateOtherDevicesAlertTitle" value:&stru_26D9391A8 table:0];
      uint64_t v26 = [v18 localizedStringForKey:@"OnDemandDowntimeCompatibilityAlertMessage" value:&stru_26D9391A8 table:0];
    }
    v25 = (void *)v26;
    goto LABEL_12;
  }
  v9[2](v9);
LABEL_13:

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
}

uint64_t __130__STTimeAllowancesCompatibilityController_showOnDemandDowntimeCompatibilityAlertIfNeededForUser_alertPresenter_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) localUserDeviceState];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 == 0;

  BOOL v3 = ([*(id *)(a1 + 32) syncingEnabled] & 1) != 0
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  v4 = [*(id *)(a1 + 32) dsid];
  uint64_t v5 = [v4 stringValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [*(id *)(a1 + 32) givenName];
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v10 = *(void *)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return MEMORY[0x270F9A758](v8, v10);
}

void __130__STTimeAllowancesCompatibilityController_showOnDemandDowntimeCompatibilityAlertIfNeededForUser_alertPresenter_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    BOOL v3 = (void *)[v2 mutableCopy];
  }
  else
  {
    BOOL v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  }
  id v4 = v3;
  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [*(id *)(a1 + 40) setObject:v4 forKey:@"HasShownOnDemandDowntimeCompatibilityAlertByDSID"];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end