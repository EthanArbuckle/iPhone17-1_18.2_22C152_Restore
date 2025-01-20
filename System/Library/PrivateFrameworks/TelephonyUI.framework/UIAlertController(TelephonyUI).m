@interface UIAlertController(TelephonyUI)
+ (id)callEndStewieControllerWithDialRequest:()TelephonyUI dialAction:title:buttonTitle:;
+ (id)enableWiFiCallingAlertControllerWithPreferredStyle:()TelephonyUI;
+ (id)networkUnavailableAlertControllerWithCallProvider:()TelephonyUI dialType:senderIdentityUUID:;
+ (id)telephonyAccountUnavailableAlertControllerWithSenderIdentities:()TelephonyUI preferredStyle:completion:;
+ (uint64_t)enableWiFiCallingAlertController;
@end

@implementation UIAlertController(TelephonyUI)

+ (uint64_t)enableWiFiCallingAlertController
{
  return [a1 enableWiFiCallingAlertControllerWithPreferredStyle:1];
}

+ (id)enableWiFiCallingAlertControllerWithPreferredStyle:()TelephonyUI
{
  if ([MEMORY[0x1E4FADA88] supportsWiFiCalling])
  {
    v4 = TelephonyUIBundle();
    v5 = TUStringKeyForNetwork();
    v6 = [v4 localizedStringForKey:v5 value:&stru_1F1E807C8 table:@"General"];

    v7 = TelephonyUIBundle();
    v8 = TUStringKeyForNetwork();
    v9 = [v7 localizedStringForKey:v8 value:&stru_1F1E807C8 table:@"General"];

    v10 = [MEMORY[0x1E4F61758] sharedInstance];
    int v11 = [v10 wiFiActiveAndReachable];

    v12 = 0;
    if (([MEMORY[0x1E4FADA88] isWiFiCallingEnabled] & 1) == 0 && v11)
    {
      v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v6 preferredStyle:a3];
      v13 = +[TPAlertAction actionWithType:5];
      [v12 addAction:v13];

      v14 = +[TPAlertAction actionWithType:1];
      [v12 addAction:v14];
    }
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (id)networkUnavailableAlertControllerWithCallProvider:()TelephonyUI dialType:senderIdentityUUID:
{
  id v7 = a3;
  id v8 = a5;
  v9 = TelephonyUIBundle();
  v10 = [v9 localizedStringForKey:@"ALERT_TITLE_NETWORK_UNAVAILABLE" value:&stru_1F1E807C8 table:@"General"];

  if ([v7 isTelephonyProvider])
  {
    int v11 = TelephonyUIBundle();
    v12 = [v11 localizedStringForKey:@"ALERT_MESSAGE_TELEPHONY_NO_LOCAL_CELLULAR" value:&stru_1F1E807C8 table:@"General"];

    if (v8)
    {
      v13 = [MEMORY[0x1E4FADA88] senderIdentityCapabilitiesWithUUID:v8];
      v14 = v13;
      if (a4 == 1) {
        char v15 = [v13 canAttemptEmergencyCallsWithoutCellularConnection];
      }
      else {
        char v15 = [v13 canAttemptTelephonyCallsWithoutCellularConnection];
      }
      char v28 = v15;

      if (v28) {
        goto LABEL_12;
      }
      goto LABEL_17;
    }
    if (a4 == 1)
    {
      if (([MEMORY[0x1E4FADA88] canAttemptEmergencyCallsWithoutCellularConnection] & 1) == 0)
      {
LABEL_17:
        if ([MEMORY[0x1E4FADA88] supportsWiFiCalling])
        {
          v37 = TelephonyUIBundle();
          v38 = TUStringKeyForNetwork();
          uint64_t v39 = [v37 localizedStringForKey:v38 value:&stru_1F1E807C8 table:@"General"];

          if ([MEMORY[0x1E4FADA88] isWiFiCallingEnabled])
          {
            v40 = [MEMORY[0x1E4F61758] sharedInstance];
            int v41 = [v40 networkReachable];

            if (v41) {
              uint64_t v32 = 0;
            }
            else {
              uint64_t v32 = 8;
            }
          }
          else
          {
            uint64_t v32 = 16;
          }
          v12 = (void *)v39;
        }
        else
        {
          uint64_t v32 = 0;
        }
        goto LABEL_25;
      }
    }
    else if (![MEMORY[0x1E4FADA88] canAttemptTelephonyCallsWithoutCellularConnection])
    {
      goto LABEL_17;
    }
LABEL_12:
    v29 = TelephonyUIBundle();
    v30 = TUStringKeyForNetwork();
    uint64_t v31 = [v29 localizedStringForKey:v30 value:&stru_1F1E807C8 table:@"General"];

    uint64_t v32 = 8;
    v12 = (void *)v31;
    goto LABEL_25;
  }
  id v54 = v8;
  v16 = [MEMORY[0x1E4F61740] sharedInstance];
  v17 = [v7 displayAppBundleIdentifier];
  int v18 = [v16 wifiAllowedForBundleId:v17];

  v19 = NSString;
  v20 = TelephonyUIBundle();
  v21 = TUStringKeyForNetwork();
  v22 = [v20 localizedStringForKey:v21 value:&stru_1F1E807C8 table:@"General"];
  v23 = [v7 localizedName];
  v12 = objc_msgSend(v19, "stringWithFormat:", v22, v23);

  v24 = [MEMORY[0x1E4F61740] sharedInstance];
  v25 = [v7 displayAppBundleIdentifier];
  LODWORD(v22) = [v24 nonWifiAvailableForBundleId:v25];

  if (v22)
  {
    v26 = NSString;
    v27 = TelephonyUIBundle();
    v33 = TUStringKeyForNetwork();
    v34 = [v27 localizedStringForKey:v33 value:&stru_1F1E807C8 table:@"General"];
    v35 = [v7 localizedName];
    uint64_t v36 = objc_msgSend(v26, "stringWithFormat:", v34, v35);

    v12 = (void *)v36;
  }
  id v8 = v54;
  if (v18) {
    uint64_t v32 = 8;
  }
  else {
    uint64_t v32 = 32;
  }
LABEL_25:
  id v42 = objc_alloc_init(MEMORY[0x1E4F4BE78]);
  if ([v42 airplaneMode])
  {
    LOBYTE(v32) = v32 | 2;
    goto LABEL_30;
  }
  v43 = [MEMORY[0x1E4F61740] sharedInstance];
  v44 = [v7 displayAppBundleIdentifier];
  char v45 = [v43 nonWifiAvailableForBundleId:v44];

  if (v45)
  {
    LOBYTE(v32) = v32 | 4;
    goto LABEL_30;
  }
  if (v32)
  {
LABEL_30:
    v46 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v10 message:v12 preferredStyle:1];
    if ((v32 & 8) != 0)
    {
      v50 = +[TPAlertAction actionWithType:4];
      [v46 addAction:v50];

      if ((v32 & 0x10) == 0)
      {
LABEL_32:
        if ((v32 & 2) == 0) {
          goto LABEL_33;
        }
        goto LABEL_42;
      }
    }
    else if ((v32 & 0x10) == 0)
    {
      goto LABEL_32;
    }
    v51 = +[TPAlertAction actionWithType:5];
    [v46 addAction:v51];

    if ((v32 & 2) == 0)
    {
LABEL_33:
      if ((v32 & 4) == 0) {
        goto LABEL_34;
      }
      goto LABEL_43;
    }
LABEL_42:
    v52 = +[TPAlertAction actionWithType:2];
    [v46 addAction:v52];

    if ((v32 & 4) == 0)
    {
LABEL_34:
      if ((v32 & 0x20) == 0)
      {
LABEL_36:
        v48 = +[TPAlertAction actionWithType:1];
        [v46 addAction:v48];

        goto LABEL_37;
      }
LABEL_35:
      v47 = +[TPAlertAction actionWithType:6];
      [v46 addAction:v47];

      goto LABEL_36;
    }
LABEL_43:
    v53 = +[TPAlertAction actionWithType:3];
    [v46 addAction:v53];

    if ((v32 & 0x20) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  v46 = 0;
LABEL_37:

  return v46;
}

+ (id)telephonyAccountUnavailableAlertControllerWithSenderIdentities:()TelephonyUI preferredStyle:completion:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v45 = a5;
  id v8 = TelephonyUIBundle();
  v9 = [v8 localizedStringForKey:@"TELEPHONY_ACCOUNT_UNAVAILABLE_ALERT_TITLE" value:&stru_1F1E807C8 table:@"General"];

  v10 = &off_1C2F72000;
  if ((unint64_t)[v7 count] >= 2)
  {
    int v11 = (void *)MEMORY[0x1E4FB1418];
    v12 = TelephonyUIBundle();
    v13 = [v12 localizedStringForKey:@"TELEPHONY_ACCOUNT_UNAVAILABLE_ALERT_MESSAGE" value:&stru_1F1E807C8 table:@"General"];
    v43 = v9;
    v14 = [v11 alertControllerWithTitle:v9 message:v13 preferredStyle:a4];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v7;
    uint64_t v15 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          v19 = v14;
          if (*(void *)v54 != v17) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x1E4FB1410];
          v22 = [v20 localizedName];
          v51[0] = MEMORY[0x1E4F143A8];
          v51[1] = 3221225472;
          v51[2] = __123__UIAlertController_TelephonyUI__telephonyAccountUnavailableAlertControllerWithSenderIdentities_preferredStyle_completion___block_invoke;
          v51[3] = &unk_1E647C0C0;
          id v23 = v45;
          v51[4] = v20;
          id v52 = v23;
          v24 = [v21 actionWithTitle:v22 style:0 handler:v51];

          v14 = v19;
          [v19 addAction:v24];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v16);
    }

    v25 = [v14 actions];
    v26 = [v25 firstObject];
    [v14 setPreferredAction:v26];

    v9 = v43;
    v10 = &off_1C2F72000;
    goto LABEL_12;
  }
  if ([v7 count] == 1)
  {
    v27 = (void *)MEMORY[0x1E4FB1418];
    char v28 = TelephonyUIBundle();
    v29 = [v28 localizedStringForKey:@"TELEPHONY_ACCOUNT_UNAVAILABLE_ALERT_MESSAGE_SINGLE" value:&stru_1F1E807C8 table:@"General"];
    v30 = [v27 alertControllerWithTitle:v9 message:v29 preferredStyle:a4];

    uint64_t v31 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v32 = TelephonyUIBundle();
    v14 = v30;
    v33 = [v32 localizedStringForKey:@"TELEPHONY_ACCOUNT_UNAVAILABLE_ALERT_ACTION_TITLE_CALL" value:&stru_1F1E807C8 table:@"General"];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __123__UIAlertController_TelephonyUI__telephonyAccountUnavailableAlertControllerWithSenderIdentities_preferredStyle_completion___block_invoke_2;
    v48[3] = &unk_1E647C0C0;
    id v50 = v45;
    id v49 = v7;
    v34 = [v31 actionWithTitle:v33 style:0 handler:v48];

    [v30 addAction:v34];
    v35 = [v30 actions];
    uint64_t v36 = [v35 firstObject];
    [v30 setPreferredAction:v36];

    v25 = v50;
LABEL_12:

    goto LABEL_14;
  }
  v14 = 0;
LABEL_14:
  v37 = (void *)MEMORY[0x1E4FB1410];
  v38 = TelephonyUIBundle();
  uint64_t v39 = [v38 localizedStringForKey:@"TELEPHONY_ACCOUNT_UNAVAILABLE_ALERT_ACTION_TITLE_CANCEL" value:&stru_1F1E807C8 table:@"General"];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = *((void *)v10 + 373);
  v46[2] = __123__UIAlertController_TelephonyUI__telephonyAccountUnavailableAlertControllerWithSenderIdentities_preferredStyle_completion___block_invoke_3;
  v46[3] = &unk_1E647C0E8;
  id v47 = v45;
  id v40 = v45;
  int v41 = [v37 actionWithTitle:v39 style:1 handler:v46];

  [v14 addAction:v41];
  return v14;
}

+ (id)callEndStewieControllerWithDialRequest:()TelephonyUI dialAction:title:buttonTitle:
{
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E4FB1418];
  id v10 = a6;
  int v11 = [v9 alertControllerWithTitle:a5 message:0 preferredStyle:0];
  v12 = (void *)MEMORY[0x1E4FB1410];
  v13 = TelephonyUIBundle();
  v14 = [v13 localizedStringForKey:@"CANCEL" value:&stru_1F1E807C8 table:@"General"];
  uint64_t v15 = [v12 actionWithTitle:v14 style:1 handler:&__block_literal_global_0];

  [v11 addAction:v15];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __102__UIAlertController_TelephonyUI__callEndStewieControllerWithDialRequest_dialAction_title_buttonTitle___block_invoke_2;
  v19[3] = &unk_1E647C0E8;
  id v20 = v8;
  id v16 = v8;
  uint64_t v17 = +[TPAlertAction actionWithTitle:v10 style:0 handler:v19];

  [v11 addAction:v17];
  return v11;
}

@end