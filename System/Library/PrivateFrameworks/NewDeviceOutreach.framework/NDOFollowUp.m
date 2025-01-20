@interface NDOFollowUp
+ (id)allPossibleFollowUpTargetBundleIdentifiers;
+ (id)followUpTargetBundleIDsForDevice:(id)a3;
+ (id)possibleUniqueIdentifiersForSerialNumber:(id)a3;
+ (id)uniqueFollowUpIdentifiersForDevice:(id)a3;
+ (id)uniqueIdentfierForSerialNumber:(id)a3 bundleId:(id)a4;
- (BOOL)_checkConversionEligibilityForDevice:(id)a3;
- (BOOL)_clearFollowUpForSerialNumber:(id)a3;
- (BOOL)_clearFollowUpsForDeviceSerialNumbers:(id)a3;
- (BOOL)_postFollowUpWithDevicesInfo:(id)a3 repostAllowed:(BOOL)a4;
- (BOOL)postFollowUpWithDevicesInfo:(id)a3;
- (NDOFollowUp)init;
- (NDOFollowUp)initWithFollowUpProvider:(id)a3;
- (NDOFollowUpProvider)followUpProvider;
- (id)_pendingFollowUpItemsForSerialNumber:(id)a3;
- (id)_setupFollowUpNotificationWithDeviceInfo:(id)a3;
- (id)followUpItemsForDeviceInfo:(id)a3;
- (id)followUpSaleFlowSourceForBundleId:(id)a3 device:(id)a4;
- (id)refreshALLFollowupsWithDeviceInfos:(id)a3 andForcePostFollowup:(BOOL)a4;
- (id)refreshFollowupWithDeviceInfo:(id)a3 andForcePostFollowup:(BOOL)a4;
- (id)refreshFollowupWithDeviceInfos:(id)a3 andForcePostFollowup:(BOOL)a4;
- (id)refreshFollowupWithDeviceInfos:(id)a3 clearUntrackedDeviceFollowups:(BOOL)a4 andForcePostFollowup:(BOOL)a5;
- (unint64_t)pendingFollowUpCount;
- (void)_clearFollowUpWithDevices:(id)a3;
- (void)_setupFollowUpItem:(id)a3 withDeviceInfo:(id)a4;
- (void)dismissFollowUpForSerialNumber:(id)a3;
- (void)dismissNotificationForSerialNumber:(id)a3;
- (void)migrateLegacyFollowUpIfNeededWithDeviceInfo:(id)a3;
- (void)postFollowUpWithDeviceInfo:(id)a3;
- (void)setFollowUpProvider:(id)a3;
@end

@implementation NDOFollowUp

- (NDOFollowUp)init
{
  v3 = objc_opt_new();
  v4 = [(NDOFollowUp *)self initWithFollowUpProvider:v3];

  return v4;
}

- (NDOFollowUp)initWithFollowUpProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NDOFollowUp;
  v5 = [(NDOFollowUp *)&v8 init];
  v6 = v5;
  if (v5) {
    [(NDOFollowUp *)v5 setFollowUpProvider:v4];
  }

  return v6;
}

+ (id)uniqueIdentfierForSerialNumber:(id)a3 bundleId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[NDOTypeChecking isNotEmptyString:v5]
    && +[NDOTypeChecking isNotEmptyString:v6]
    && +[NDOTypeChecking isNotEmptyString:@"com.apple.NewDeviceOutreach"])
  {
    v7 = [v5 sha256Hash];
    objc_super v8 = [@"com.apple.NewDeviceOutreach" stringByAppendingFormat:@".%@.%@", v6, v7];
  }
  else
  {
    v9 = _NDOLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[NDOFollowUp uniqueIdentfierForSerialNumber:bundleId:]();
    }

    objc_super v8 = 0;
  }

  return v8;
}

- (BOOL)postFollowUpWithDevicesInfo:(id)a3
{
  return [(NDOFollowUp *)self _postFollowUpWithDevicesInfo:a3 repostAllowed:0];
}

- (BOOL)_postFollowUpWithDevicesInfo:(id)a3 repostAllowed:(BOOL)a4
{
  id v6 = (void *)MEMORY[0x263EFF980];
  id v7 = a3;
  objc_super v8 = [v6 array];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__NDOFollowUp__postFollowUpWithDevicesInfo_repostAllowed___block_invoke;
  v12[3] = &unk_264E25F88;
  BOOL v14 = a4;
  v12[4] = self;
  id v13 = v8;
  id v9 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__NDOFollowUp__postFollowUpWithDevicesInfo_repostAllowed___block_invoke_61;
  v11[3] = &unk_264E25FB0;
  v11[4] = self;
  [v9 enumerateObjectsUsingBlock:v11];
  LOBYTE(self) = [v9 count] != 0;

  return (char)self;
}

void __58__NDOFollowUp__postFollowUpWithDevicesInfo_repostAllowed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 warranty];

  if (!v4)
  {
    v18 = _NDOLogSystem();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    v19 = [v3 device];
    int v37 = 136446467;
    v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
    __int16 v39 = 2113;
    v40 = v19;
    v20 = "%{public}s: No warranty downloaded for device. Don't post a followup for %{private}@";
LABEL_15:
    _os_log_impl(&dword_23C013000, v18, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v37, 0x16u);

    goto LABEL_31;
  }
  id v5 = [v3 warranty];
  int v6 = [v5 acOfferDisplay];

  if (!v6)
  {
    v18 = _NDOLogSystem();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    v19 = [v3 device];
    int v37 = 136446467;
    v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
    __int16 v39 = 2113;
    v40 = v19;
    v20 = "%{public}s: Device NOT eligible. Don't post a followup for %{private}@";
    goto LABEL_15;
  }
  id v7 = [v3 warranty];
  objc_super v8 = [v7 acOfferEligibleUntil];
  [v8 timeIntervalSinceNow];
  double v10 = v9;

  if (v10 <= 0.0)
  {
    v18 = _NDOLogSystem();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    v19 = [v3 device];
    int v37 = 136446467;
    v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
    __int16 v39 = 2113;
    v40 = v19;
    v20 = "%{public}s: Device no longer eligible. Don't post a followup for %{private}@";
    goto LABEL_15;
  }
  v11 = [v3 device];
  v12 = [v11 serialNumber];
  BOOL v13 = +[NDOFollowUpDismissalTracker followUpIsDismissedForSerial:v12];

  if (v13
    && !*(unsigned char *)(a1 + 48)
    && ![*(id *)(a1 + 32) _checkConversionEligibilityForDevice:v3])
  {
    v18 = _NDOLogSystem();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    v19 = [v3 device];
    int v37 = 136446467;
    v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
    __int16 v39 = 2113;
    v40 = v19;
    v20 = "%{public}s: Followup already dismissed for %{private}@, leaving unposted";
    goto LABEL_15;
  }
  BOOL v14 = [v3 warranty];
  v15 = [v14 acOfferFollowupDisplayDate];

  v16 = [v3 warranty];
  v17 = v16;
  if (v15)
  {
    v18 = [v16 acOfferFollowupDisplayDate];
  }
  else
  {
    v21 = [v16 acOfferEligibleUntil];
    v22 = [v3 warranty];
    [v22 acOfferDurationBeforeEndDate];
    v18 = [v21 dateByAddingTimeInterval:-v23];
  }
  v24 = [v3 device];
  v25 = [v24 activationDate];

  if (v25)
  {
    [v25 timeIntervalSinceNow];
    double v27 = v26;
    [v18 timeIntervalSinceNow];
    if (v27 > v28)
    {
      v29 = _NDOLogSystem();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 136446210;
        v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
        _os_log_impl(&dword_23C013000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s: Using initial postdate as it is later than FollowupDisplay Date", (uint8_t *)&v37, 0xCu);
      }

      v30 = v25;
      v18 = v30;
    }
  }
  [v18 timeIntervalSinceNow];
  if (v31 <= 0.0)
  {
    v35 = _NDOLogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = [v3 device];
      int v37 = 136446467;
      v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
      __int16 v39 = 2113;
      v40 = v36;
      _os_log_impl(&dword_23C013000, v35, OS_LOG_TYPE_DEFAULT, "%{public}s: Device eligible. Post new  followup for %{private}@", (uint8_t *)&v37, 0x16u);
    }
    [*(id *)(a1 + 40) addObject:v3];
  }
  else
  {
    [v18 timeIntervalSinceNow];
    if (v32 > 0.0)
    {
      v33 = _NDOLogSystem();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = [v3 device];
        int v37 = 136446723;
        v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
        __int16 v39 = 2113;
        v40 = v34;
        __int16 v41 = 2112;
        v42 = v18;
        _os_log_impl(&dword_23C013000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s: Device eligible with future post date. Cannot post followup for %{private}@ on: %@", (uint8_t *)&v37, 0x20u);
      }
    }
  }

LABEL_31:
}

uint64_t __58__NDOFollowUp__postFollowUpWithDevicesInfo_repostAllowed___block_invoke_61(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) postFollowUpWithDeviceInfo:a2];
}

+ (id)followUpTargetBundleIDsForDevice:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 deviceType];
  id v5 = objc_opt_new();
  int v6 = v5;
  switch(v4)
  {
    case 3:
      goto LABEL_4;
    case 1:
      [v5 addObject:*MEMORY[0x263F35290]];
      if (![v3 isActiveWatch]) {
        goto LABEL_11;
      }
      id v7 = (void *)MEMORY[0x263F35270];
      goto LABEL_7;
    case 0:
LABEL_4:
      id v7 = (void *)MEMORY[0x263F35290];
LABEL_7:
      [v6 addObject:*v7];
      goto LABEL_11;
  }
  objc_super v8 = _NDOLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[NDOFollowUp followUpTargetBundleIDsForDevice:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

LABEL_11:
  v16 = _NDOLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [NSNumber numberWithUnsignedInteger:v4];
    int v20 = 136446722;
    v21 = "+[NDOFollowUp followUpTargetBundleIDsForDevice:]";
    __int16 v22 = 2112;
    double v23 = v17;
    __int16 v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_23C013000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s DeviceType:%@ bundleIDs%@", (uint8_t *)&v20, 0x20u);
  }
  v18 = (void *)[v6 copy];

  return v18;
}

- (id)followUpItemsForDeviceInfo:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 warranty];
  id v5 = [v3 device];
  int v6 = [v5 serialNumber];

  if (v4 && [v4 acOfferDisplay] && v6)
  {
    __int16 v24 = v6;
    v25 = v4;
    id v7 = [v3 device];
    objc_super v8 = +[NDOFollowUp followUpTargetBundleIDsForDevice:v7];

    uint64_t v9 = _NDOLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v3 device];
      *(_DWORD *)buf = 136446722;
      v35 = "-[NDOFollowUp followUpItemsForDeviceInfo:]";
      __int16 v36 = 2112;
      int v37 = v8;
      __int16 v38 = 2112;
      __int16 v39 = v10;
      _os_log_impl(&dword_23C013000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s bundleIDs:%@ for deviceInfo:%@", buf, 0x20u);
    }
    double v27 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      uint64_t v15 = *MEMORY[0x263F352D0];
      obj = v11;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v18 = objc_alloc_init(MEMORY[0x263F35388]);
          v19 = [v3 device];
          int v20 = [v19 serialNumber];
          v21 = +[NDOFollowUp uniqueIdentfierForSerialNumber:v20 bundleId:v17];

          [v18 setUniqueIdentifier:v21];
          [v18 setGroupIdentifier:v15];
          [v18 setExtensionIdentifier:@"com.apple.NewDeviceOutreach.Extension"];
          [v18 setTargetBundleIdentifier:v17];
          [(NDOFollowUp *)self _setupFollowUpItem:v18 withDeviceInfo:v3];
          [v27 addObject:v18];
        }
        uint64_t v11 = obj;
        uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v13);
    }

    __int16 v22 = (void *)[v27 copy];
    int v6 = v24;
    uint64_t v4 = v25;
  }
  else
  {
    uint64_t v11 = _NDOLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[NDOFollowUp followUpItemsForDeviceInfo:]();
    }
    __int16 v22 = (void *)MEMORY[0x263EFFA68];
  }

  return v22;
}

- (void)postFollowUpWithDeviceInfo:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 warranty];
  v60 = v4;
  int v6 = [v4 device];
  id v7 = [v6 serialNumber];

  v63 = v5;
  if (v5 && [v5 acOfferDisplay] && v7)
  {
    [(NDOFollowUp *)self followUpItemsForDeviceInfo:v60];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    obj = long long v75 = 0u;
    uint64_t v8 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
    if (v8)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(void *)v73;
      unint64_t v12 = 0x263EFF000uLL;
      *(void *)&long long v9 = 136446722;
      long long v56 = v9;
      v57 = v7;
      v58 = self;
      uint64_t v59 = *(void *)v73;
      do
      {
        uint64_t v13 = 0;
        uint64_t v61 = v10;
        do
        {
          if (*(void *)v73 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v72 + 1) + 8 * v13);
          uint64_t v15 = [(NDOFollowUp *)self followUpProvider];
          id v71 = 0;
          int v16 = [v15 postFollowUpItem:v14 error:&v71];
          uint64_t v17 = (__CFString *)v71;

          id v18 = _NDOLogSystem();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v19 = @"success";
            if (!v16) {
              v19 = v17;
            }
            v77 = v7;
            __int16 v78 = 2112;
            v79 = v19;
            _os_log_impl(&dword_23C013000, v18, OS_LOG_TYPE_DEFAULT, "Posted follow-up: serialNumber:%@ -> %@", buf, 0x16u);
          }

          if (v16)
          {
            int v20 = (void *)MEMORY[0x263EFF980];
            v21 = [*(id *)(v12 + 2624) standardUserDefaults];
            uint64_t v22 = [v21 objectForKey:@"FollowupPostedSerialNumberHashes"];
            double v23 = (void *)v22;
            if (v22) {
              uint64_t v24 = v22;
            }
            else {
              uint64_t v24 = MEMORY[0x263EFFA68];
            }
            v25 = [v20 arrayWithArray:v24];

            uint64_t v26 = [v7 sha256Hash];
            char v27 = [v25 containsObject:v26];

            if ((v27 & 1) == 0)
            {
              double v28 = [v7 sha256Hash];
              [v25 addObject:v28];

              long long v29 = [*(id *)(v12 + 2624) standardUserDefaults];
              [v29 setObject:v25 forKey:@"FollowupPostedSerialNumberHashes"];

              v82 = @"devicetype";
              long long v30 = [v60 device];
              long long v31 = [v30 deviceTypeString];
              v83 = v31;
              long long v32 = [NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];

              uint64_t v66 = MEMORY[0x263EF8330];
              uint64_t v67 = 3221225472;
              v68 = __42__NDOFollowUp_postFollowUpWithDeviceInfo___block_invoke;
              v69 = &unk_264E25FD8;
              id v70 = v32;
              id v33 = v32;
              AnalyticsSendEventLazy();
            }
            v34 = [*(id *)(v12 + 2624) standardUserDefaults];
            v35 = [v34 dictionaryForKey:@"FollowupDisplayedSerialNumberHashesWithEvents"];
            __int16 v36 = (void *)[v35 mutableCopy];

            if (v36)
            {
              int v37 = [v36 allKeys];
              uint64_t v38 = [v37 count];

              if (v38)
              {
                __int16 v39 = (void *)MEMORY[0x263EFF9C0];
                uint64_t v40 = [v7 sha256Hash];
                uint64_t v41 = [v36 objectForKeyedSubscript:v40];
                v42 = (void *)v41;
                if (v41) {
                  uint64_t v43 = v41;
                }
                else {
                  uint64_t v43 = MEMORY[0x263EFFA68];
                }
                v44 = [v39 setWithArray:v43];

                self = v58;
                if (!v44)
                {
LABEL_27:
                  v44 = [MEMORY[0x263EFF9C0] set];
                }
                v46 = [v63 eligibilityEventId];
                BOOL v47 = +[NDOTypeChecking isNotEmptyString:v46];

                if (v47)
                {
                  v48 = [v63 eligibilityEventId];
                  [v44 addObject:v48];

                  v49 = [v44 allObjects];
                  v50 = [v60 device];
                  v51 = [v50 serialNumber];
                  v52 = [v51 sha256Hash];
                  [v36 setObject:v49 forKeyedSubscript:v52];

                  v53 = [MEMORY[0x263EFFA40] standardUserDefaults];
                  [v53 setObject:v36 forKey:@"FollowupDisplayedSerialNumberHashesWithEvents"];

                  v54 = _NDOLogSystem();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                  {
                    v55 = [v63 eligibilityEventId];
                    *(_DWORD *)buf = v56;
                    v77 = "-[NDOFollowUp postFollowUpWithDeviceInfo:]";
                    __int16 v78 = 2112;
                    v79 = v55;
                    __int16 v80 = 2112;
                    v81 = v44;
                    _os_log_debug_impl(&dword_23C013000, v54, OS_LOG_TYPE_DEBUG, "%{public}s: saving for event: %@ with events: %@", buf, 0x20u);
                  }
                  id v7 = v57;
                  self = v58;
                  uint64_t v10 = v61;
                }
                else
                {
                  v54 = _NDOLogSystem();
                  uint64_t v10 = v61;
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                    -[NDOFollowUp postFollowUpWithDeviceInfo:](&v64, v65);
                  }
                }

                uint64_t v11 = v59;
                unint64_t v12 = 0x263EFF000;
                goto LABEL_35;
              }
            }
            uint64_t v45 = objc_opt_new();

            __int16 v36 = (void *)v45;
            goto LABEL_27;
          }
LABEL_35:

          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [obj countByEnumeratingWithState:&v72 objects:v84 count:16];
      }
      while (v10);
    }
  }
  else
  {
    obj = _NDOLogSystem();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      -[NDOFollowUp postFollowUpWithDeviceInfo:]();
    }
  }
}

id __42__NDOFollowUp_postFollowUpWithDeviceInfo___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = @"com.apple.newdeviceoutreach.followupDisplayCount";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_23C013000, v2, OS_LOG_TYPE_DEFAULT, "Posting for event: %@ with value: %@", (uint8_t *)&v6, 0x16u);
  }

  id v4 = *(void **)(a1 + 32);
  return v4;
}

- (BOOL)_checkConversionEligibilityForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 device];
  id v5 = [v4 serialNumber];
  int v6 = [v5 sha256Hash];
  id v7 = [v6 stringByAppendingString:@".dismissed"];

  __int16 v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v9 = [v8 objectForKey:v7];

  if (!v9
    || ([v3 warranty],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [v10 acOfferFollowupDisplayDate],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
LABEL_7:
    BOOL v16 = 0;
    goto LABEL_8;
  }
  unint64_t v12 = [v3 warranty];
  uint64_t v13 = [v12 acOfferFollowupDisplayDate];
  uint64_t v14 = [v9 compare:v13];

  if (v14 != -1)
  {
    uint64_t v15 = _NDOLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      [(NDOFollowUp *)v3 _checkConversionEligibilityForDevice:v15];
    }

    goto LABEL_7;
  }
  id v18 = (void *)MEMORY[0x263EFF980];
  v19 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v20 = [v19 objectForKey:@"FollowupPostedSerialNumberHashes"];
  v21 = (void *)v20;
  if (v20) {
    uint64_t v22 = v20;
  }
  else {
    uint64_t v22 = MEMORY[0x263EFFA68];
  }
  double v23 = [v18 arrayWithArray:v22];

  uint64_t v24 = [v3 device];
  v25 = [v24 serialNumber];
  uint64_t v26 = [v25 sha256Hash];
  int v27 = [v23 containsObject:v26];

  if (v27)
  {
    double v28 = [v3 device];
    long long v29 = [v28 serialNumber];
    long long v30 = [v29 sha256Hash];
    [v23 removeObject:v30];

    long long v31 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v31 setObject:v23 forKey:@"FollowupPostedSerialNumberHashes"];
  }
  BOOL v16 = 1;
LABEL_8:

  return v16;
}

+ (id)uniqueFollowUpIdentifiersForDevice:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 serialNumber];

  if (v4)
  {
    id v5 = objc_opt_new();
    int v6 = +[NDOFollowUp followUpTargetBundleIDsForDevice:v3];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (+[NDOTypeChecking isNotEmptyString:v11])
          {
            unint64_t v12 = [v3 serialNumber];
            uint64_t v13 = +[NDOFollowUp uniqueIdentfierForSerialNumber:v12 bundleId:v11];
            [v5 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
    id v14 = [v5 copy];
  }
  else
  {
    id v5 = _NDOLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[NDOFollowUp uniqueFollowUpIdentifiersForDevice:]();
    }
    id v14 = (id)MEMORY[0x263EFFA68];
  }

  return v14;
}

+ (id)allPossibleFollowUpTargetBundleIdentifiers
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F35290];
  v5[0] = *MEMORY[0x263F35270];
  v5[1] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  return v3;
}

+ (id)possibleUniqueIdentifiersForSerialNumber:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[NDOTypeChecking isNotEmptyString:v4])
  {
    id v5 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v6 = objc_msgSend(a1, "allPossibleFollowUpTargetBundleIdentifiers", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [a1 uniqueIdentfierForSerialNumber:v4 bundleId:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    id v12 = [v5 copy];
  }
  else
  {
    id v5 = _NDOLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[NDOFollowUp possibleUniqueIdentifiersForSerialNumber:]();
    }
    id v12 = (id)MEMORY[0x263EFFA68];
  }

  return v12;
}

- (void)_clearFollowUpWithDevices:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = +[NDOFollowUp uniqueFollowUpIdentifiersForDevice:*(void *)(*((void *)&v18 + 1) + 8 * v10)];
        [v5 addObjectsFromArray:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  id v12 = [(NDOFollowUp *)self followUpProvider];
  id v17 = 0;
  int v13 = [v12 clearPendingFollowUpItemsWithUniqueIdentifiers:v5 error:&v17];
  long long v14 = (__CFString *)v17;

  long long v15 = _NDOLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = @"success";
    if (!v13) {
      long long v16 = v14;
    }
    *(_DWORD *)buf = 138412290;
    double v23 = v16;
    _os_log_impl(&dword_23C013000, v15, OS_LOG_TYPE_DEFAULT, "Cleared follow-up: %@", buf, 0xCu);
  }
}

- (id)_pendingFollowUpItemsForSerialNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(NDOFollowUp *)self followUpProvider];
  id v18 = 0;
  id v6 = [v5 pendingFollowUpItems:&v18];
  id v7 = v18;

  if (v7)
  {
    uint64_t v8 = _NDOLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NDOFollowUp _pendingFollowUpItemsForSerialNumber:]();
    }
    uint64_t v9 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F08A98];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    long long v15 = __52__NDOFollowUp__pendingFollowUpItemsForSerialNumber___block_invoke;
    long long v16 = &unk_264E26000;
    id v17 = v4;
    uint64_t v11 = [v10 predicateWithBlock:&v13];
    uint64_t v9 = objc_msgSend(v6, "filteredArrayUsingPredicate:", v11, v13, v14, v15, v16);

    uint64_t v8 = v17;
  }

  return v9;
}

uint64_t __52__NDOFollowUp__pendingFollowUpItemsForSerialNumber___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 userInfo];
  id v4 = [v3 objectForKey:@"FollowupSerialNumber"];
  if (+[NDOTypeChecking isNotEmptyString:v4]) {
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_clearFollowUpForSerialNumber:(id)a3
{
  id v4 = a3;
  if (+[NDOTypeChecking isNotEmptyString:v4])
  {
    uint64_t v5 = [MEMORY[0x263EFFA08] setWithObject:v4];
    BOOL v6 = [(NDOFollowUp *)self _clearFollowUpsForDeviceSerialNumbers:v5];
  }
  else
  {
    id v7 = _NDOLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NDOFollowUp _clearFollowUpForSerialNumber:]();
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_clearFollowUpsForDeviceSerialNumbers:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [(NDOFollowUp *)self followUpProvider];
  id v33 = 0;
  BOOL v6 = [v5 pendingFollowUpItems:&v33];
  id v7 = v33;

  if (v7)
  {
    uint64_t v8 = _NDOLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NDOFollowUp _clearFollowUpsForDeviceSerialNumbers:]();
    }
    LOBYTE(v9) = 0;
  }
  else
  {
    uint64_t v25 = self;
    uint64_t v10 = v4;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v26 = v6;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v17 = [v16 uniqueIdentifier];
          id v18 = [v16 userInfo];
          long long v19 = [v18 objectForKey:@"FollowupSerialNumber"];

          if (+[NDOTypeChecking isNotEmptyString:v17]
            && +[NDOTypeChecking isNotEmptyString:v19]
            && [v27 containsObject:v19])
          {
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v13);
    }

    id v4 = v10;
    if (![v10 count])
    {
      LOBYTE(v9) = 1;
      id v7 = 0;
      BOOL v6 = v26;
      goto LABEL_23;
    }
    long long v20 = [(NDOFollowUp *)v25 followUpProvider];
    long long v21 = (void *)[v10 copy];
    id v28 = 0;
    int v9 = [v20 clearPendingFollowUpItemsWithUniqueIdentifiers:v21 error:&v28];
    uint64_t v8 = v28;

    uint64_t v22 = _NDOLogSystem();
    id v7 = 0;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      double v23 = @"success";
      if (!v9) {
        double v23 = (__CFString *)v8;
      }
      *(_DWORD *)buf = 138412546;
      id v35 = v27;
      __int16 v36 = 2112;
      int v37 = v23;
      _os_log_impl(&dword_23C013000, v22, OS_LOG_TYPE_DEFAULT, "Clear follow-ups for serials:[%@] status:%@", buf, 0x16u);
    }

    BOOL v6 = v26;
  }

LABEL_23:
  return v9;
}

- (void)dismissFollowUpForSerialNumber:(id)a3
{
  id v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  [(NDOFollowUp *)self _clearFollowUpsForDeviceSerialNumbers:v4];
}

- (void)dismissNotificationForSerialNumber:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(NDOFollowUp *)self _pendingFollowUpItemsForSerialNumber:a3];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v6 = 138412546;
    long long v16 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
        id v11 = [(NDOFollowUp *)self followUpProvider];
        id v17 = 0;
        int v12 = [v11 clearNotificationForItem:v10 error:&v17];
        uint64_t v13 = (__CFString *)v17;

        uint64_t v14 = _NDOLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v16;
          long long v15 = @"success";
          if (!v12) {
            long long v15 = v13;
          }
          double v23 = v15;
          __int16 v24 = 2112;
          uint64_t v25 = v10;
          _os_log_impl(&dword_23C013000, v14, OS_LOG_TYPE_DEFAULT, "Cleared follow-up notification: %@ for item: %@", buf, 0x16u);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }
}

- (id)refreshFollowupWithDeviceInfo:(id)a3 andForcePostFollowup:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v11 = a3;
  long long v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a3;
  uint64_t v8 = [v6 arrayWithObjects:&v11 count:1];

  uint64_t v9 = -[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:](self, "refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:", v8, 0, v4, v11, v12);

  return v9;
}

- (id)refreshALLFollowupsWithDeviceInfos:(id)a3 andForcePostFollowup:(BOOL)a4
{
  return [(NDOFollowUp *)self refreshFollowupWithDeviceInfos:a3 clearUntrackedDeviceFollowups:1 andForcePostFollowup:a4];
}

- (id)refreshFollowupWithDeviceInfos:(id)a3 andForcePostFollowup:(BOOL)a4
{
  return [(NDOFollowUp *)self refreshFollowupWithDeviceInfos:a3 clearUntrackedDeviceFollowups:0 andForcePostFollowup:a4];
}

- (id)refreshFollowupWithDeviceInfos:(id)a3 clearUntrackedDeviceFollowups:(BOOL)a4 andForcePostFollowup:(BOOL)a5
{
  BOOL v5 = a4;
  uint64_t v139 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v102 = self;
  uint64_t v8 = [(NDOFollowUp *)self followUpProvider];
  id v125 = 0;
  uint64_t v9 = [v8 pendingFollowUpItems:&v125];
  id v10 = v125;

  if (v10)
  {
    id v11 = _NDOLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v103 = v10;
  v110 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v9, "count"));
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  obuint64_t j = v9;
  uint64_t v18 = [obj countByEnumeratingWithState:&v121 objects:v138 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v122;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v122 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = [*(id *)(*((void *)&v121 + 1) + 8 * i) userInfo];
        double v23 = [v22 objectForKeyedSubscript:@"FollowupSerialNumber"];

        if (v23) {
          [v110 addObject:v23];
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v121 objects:v138 count:16];
    }
    while (v19);
  }

  v108 = [MEMORY[0x263EFF980] array];
  uint64_t v24 = [MEMORY[0x263EFF980] array];
  [MEMORY[0x263EFF9C0] set];
  v112 = v111 = (void *)v24;
  if (v5)
  {
    uint64_t v25 = [MEMORY[0x263EFF9C0] setWithSet:v110];
  }
  else
  {
    uint64_t v25 = 0;
  }
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v26 = v7;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v117 objects:v137 count:16];
  v106 = v25;
  v107 = v26;
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v118;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v118 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = *(void **)(*((void *)&v117 + 1) + 8 * v30);
        long long v32 = [v31 device];
        id v33 = [v32 serialNumber];

        if (!v33)
        {
          v46 = _NDOLogSystem();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            -[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:](&v135, &v136);
          }
          goto LABEL_33;
        }
        if (v25)
        {
          v34 = [v31 device];
          id v35 = [v34 serialNumber];
          [v25 removeObject:v35];
        }
        __int16 v36 = [v31 warranty];
        int v37 = [v36 acOfferEligibleUntil];
        [v37 timeIntervalSinceNow];
        double v39 = v38;

        uint64_t v40 = [v31 warranty];
        LODWORD(v37) = [v40 acOfferDisplay];

        if (v37 && v39 > 0.0)
        {
          uint64_t v41 = [v31 device];
          v42 = [v41 serialNumber];
          int v43 = [v110 containsObject:v42];

          if (v43)
          {
            v44 = _NDOLogSystem();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v45 = [v31 device];
              *(_DWORD *)buf = 136446467;
              v128 = "-[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]";
              __int16 v129 = 2113;
              v130 = v45;
              _os_log_impl(&dword_23C013000, v44, OS_LOG_TYPE_DEFAULT, "%{public}s: Device eligible. Update the followup for %{private}@", buf, 0x16u);
            }
            [v108 addObject:v31];
          }
          else
          {
            long long v56 = [v31 warranty];
            if (![v56 scIntervalFollowupEligible]) {
              goto LABEL_46;
            }
            v57 = [v31 warranty];
            uint64_t v58 = [v57 eligibilityEventId];
            if (!v58)
            {

              uint64_t v25 = v106;
              id v26 = v107;
LABEL_46:

LABEL_47:
              v46 = _NDOLogSystem();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                long long v73 = [v31 device];
                *(_DWORD *)buf = 136446467;
                v128 = "-[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]";
                __int16 v129 = 2113;
                v130 = v73;
                _os_log_impl(&dword_23C013000, v46, OS_LOG_TYPE_DEFAULT, "%{public}s: Followup already dismissed/not present for %{private}@, leaving unposted", buf, 0x16u);
              }
LABEL_33:

              goto LABEL_37;
            }
            uint64_t v59 = (void *)v58;
            v60 = [v31 warranty];
            uint64_t v61 = [v60 eligibilityEventId];
            char v62 = [v61 isEqualToString:&stru_26EF9F650];

            uint64_t v25 = v106;
            id v26 = v107;
            if (v62) {
              goto LABEL_47;
            }
            v63 = [MEMORY[0x263EFFA40] standardUserDefaults];
            char v64 = [v63 dictionaryForKey:@"FollowupDisplayedSerialNumberHashesWithEvents"];

            v104 = v64;
            if (!v64) {
              goto LABEL_49;
            }
            v65 = [v31 device];
            uint64_t v66 = [v65 serialNumber];
            uint64_t v67 = [v66 sha256Hash];
            v68 = [v64 objectForKeyedSubscript:v67];

            if (v68)
            {
              v69 = [v31 device];
              id v70 = [v69 serialNumber];
              id v71 = [v70 sha256Hash];
              long long v72 = [v64 objectForKeyedSubscript:v71];
            }
            else
            {
LABEL_49:
              long long v72 = 0;
            }
            long long v74 = [v31 warranty];
            long long v75 = [v74 eligibilityEventId];
            int v76 = [v72 containsObject:v75];

            v77 = [v31 device];
            __int16 v78 = [v77 serialNumber];
            BOOL v79 = +[NDOFollowUpDismissalTracker followUpIsDismissedForSerial:v78];

            __int16 v80 = _NDOLogSystem();
            BOOL v81 = os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT);
            if (v76 && v79)
            {
              if (v81)
              {
                v82 = [v31 device];
                *(_DWORD *)buf = 136446467;
                v128 = "-[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]";
                __int16 v129 = 2113;
                v130 = v82;
                _os_log_impl(&dword_23C013000, v80, OS_LOG_TYPE_DEFAULT, "%{public}s: Followup already dismissed/not present/no eligible events found for %{private}@, leaving unposted", buf, 0x16u);
              }
            }
            else
            {
              if (v81)
              {
                v83 = [v31 device];
                *(_DWORD *)buf = 136446467;
                v128 = "-[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]";
                __int16 v129 = 2113;
                v130 = v83;
                _os_log_impl(&dword_23C013000, v80, OS_LOG_TYPE_DEFAULT, "%{public}s: Device eligible for re-post due to eligible event. Re-post the followup for %{private}@", buf, 0x16u);
              }
              [v111 addObject:v31];
            }

            uint64_t v25 = v106;
            id v26 = v107;
          }
        }
        else
        {
          BOOL v47 = _NDOLogSystem();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v48 = [v31 warranty];
            v49 = NSNumber;
            v50 = [v31 warranty];
            v51 = objc_msgSend(v49, "numberWithBool:", objc_msgSend(v50, "acOfferDisplay"));
            v52 = [v31 warranty];
            v53 = [v52 acOfferEligibleUntil];
            *(_DWORD *)buf = 136446978;
            v128 = "-[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]";
            __int16 v129 = 2112;
            v130 = v48;
            __int16 v131 = 2112;
            v132 = v51;
            __int16 v133 = 2112;
            v134 = v53;
            _os_log_impl(&dword_23C013000, v47, OS_LOG_TYPE_DEFAULT, "%{public}s: Device NOT eligible. Warranty:%@ acOfferDisplay:%@ eligibleUntil:%@", buf, 0x2Au);

            uint64_t v25 = v106;
            id v26 = v107;
          }

          v54 = [v31 device];
          v55 = [v54 serialNumber];
          [v112 addObject:v55];
        }
LABEL_37:
        ++v30;
      }
      while (v28 != v30);
      uint64_t v84 = [v26 countByEnumeratingWithState:&v117 objects:v137 count:16];
      uint64_t v28 = v84;
    }
    while (v84);
  }

  if ([v25 count])
  {
    uint64_t v85 = _NDOLogSystem();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v128 = (const char *)v25;
      _os_log_impl(&dword_23C013000, v85, OS_LOG_TYPE_DEFAULT, "No longer tracking serials: %{private}@", buf, 0xCu);
    }

    v86 = [v25 allObjects];
    [v112 addObjectsFromArray:v86];
  }
  v105 = [MEMORY[0x263EFF980] array];
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v87 = v108;
  uint64_t v88 = [v87 countByEnumeratingWithState:&v113 objects:v126 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v114;
    do
    {
      for (uint64_t j = 0; j != v89; ++j)
      {
        if (*(void *)v114 != v90) {
          objc_enumerationMutation(v87);
        }
        v92 = *(char **)(*((void *)&v113 + 1) + 8 * j);
        v93 = _NDOLogSystem();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v128 = v92;
          _os_log_impl(&dword_23C013000, v93, OS_LOG_TYPE_DEFAULT, "Device needs follow up update. Dismiss and repost for %@", buf, 0xCu);
        }

        v94 = [v92 device];
        v95 = [v94 serialNumber];
        [v112 addObject:v95];

        [v111 addObject:v92];
      }
      uint64_t v89 = [v87 countByEnumeratingWithState:&v113 objects:v126 count:16];
    }
    while (v89);
  }

  if ([v112 count])
  {
    v96 = _NDOLogSystem();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v128 = (const char *)v112;
      _os_log_impl(&dword_23C013000, v96, OS_LOG_TYPE_DEFAULT, "Clearing follow up for serial numbers: %{private}@", buf, 0xCu);
    }

    [(NDOFollowUp *)v102 _clearFollowUpsForDeviceSerialNumbers:v112];
  }
  if (v111 && [v111 count])
  {
    BOOL v97 = [(NDOFollowUp *)v102 _postFollowUpWithDevicesInfo:v111 repostAllowed:1];
    v98 = _NDOLogSystem();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      v99 = @"NO";
      if (v97) {
        v99 = @"success";
      }
      *(_DWORD *)buf = 138412290;
      v128 = (const char *)v99;
      _os_log_impl(&dword_23C013000, v98, OS_LOG_TYPE_DEFAULT, "Posted follow-up: %@", buf, 0xCu);
    }

    if (v97) {
      [v105 addObjectsFromArray:v111];
    }
  }
  v100 = (void *)[v105 copy];

  return v100;
}

- (unint64_t)pendingFollowUpCount
{
  uint64_t v2 = [(NDOFollowUp *)self followUpProvider];
  id v14 = 0;
  id v3 = [v2 pendingFollowUpItems:&v14];
  id v4 = v14;
  unint64_t v5 = [v3 count];

  if (v4)
  {
    long long v6 = _NDOLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return v5;
}

- (id)followUpSaleFlowSourceForBundleId:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 deviceType] == 1 && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x263F35290]) & 1) != 0)
    {
      uint64_t v8 = @"WATCH_SETTINGS_FOLLOWUP";
    }
    else
    {
      uint64_t v9 = NSString;
      uint64_t v10 = [v7 sourceFromDeviceType];
      uint64_t v8 = [v9 stringWithFormat:@"%@%@", v10, @"_FOLLOWUP"];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_setupFollowUpItem:(id)a3 withDeviceInfo:(id)a4
{
  v93[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446467;
    uint64_t v88 = "-[NDOFollowUp _setupFollowUpItem:withDeviceInfo:]";
    __int16 v89 = 2113;
    v90[0] = v6;
    _os_log_impl(&dword_23C013000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: %{private}@", buf, 0x16u);
  }

  uint64_t v8 = [v6 warranty];
  uint64_t v9 = [v8 acOfferEligibleUntil];
  uint64_t v10 = [v9 dateByAddingTimeInterval:-0.001];
  [v5 setExpirationDate:v10];

  uint64_t v11 = [v6 warranty];
  LODWORD(v9) = [v11 acOfferSettingsRowBadge];

  if (v9)
  {
    uint64_t v12 = [v6 warranty];
    uint64_t v13 = [v12 acOfferEligibleUntil];
    id v14 = [v6 warranty];
    [v14 acOfferBadgeDurationBeforeEndDate];
    uint64_t v16 = [v13 dateByAddingTimeInterval:-v15];

    uint64_t v17 = [MEMORY[0x263EFF910] date];
    if ([v16 compare:v17] == -1)
    {
      uint64_t v18 = [v6 warranty];
      uint64_t v19 = [v18 acOfferEligibleUntil];
      uint64_t v20 = [MEMORY[0x263EFF910] date];
      uint64_t v21 = [v19 compare:v20];

      if (v21 == 1)
      {
        int v84 = 1;
        uint64_t v22 = 2;
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  int v84 = 0;
  uint64_t v22 = 18;
LABEL_9:
  v86 = v5;
  [v5 setDisplayStyle:v22];
  id v23 = objc_alloc(MEMORY[0x263EFF9A0]);
  v92[0] = @"FollowupWarranty";
  uint64_t v24 = [v6 warranty];
  uint64_t v25 = [v24 dictionaryRepresentation];
  id v26 = v25;
  if (!v25) {
    id v26 = objc_opt_new();
  }
  v93[0] = v26;
  v92[1] = @"FollowupSerialNumber";
  uint64_t v27 = [v6 device];
  uint64_t v28 = [v27 serialNumber];
  uint64_t v29 = *MEMORY[0x263F35288];
  uint64_t v30 = *MEMORY[0x263F35280];
  v93[1] = v28;
  v93[2] = v30;
  uint64_t v31 = *MEMORY[0x263F35350];
  v92[2] = v29;
  v92[3] = v31;
  v93[3] = MEMORY[0x263EFFA88];
  long long v32 = [NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:4];
  id v33 = (void *)[v23 initWithDictionary:v32];

  if (!v25) {
  v34 = v5;
  }
  id v35 = [v5 targetBundleIdentifier];
  __int16 v36 = [v6 device];
  int v37 = [(NDOFollowUp *)self followUpSaleFlowSourceForBundleId:v35 device:v36];

  if (+[NDOTypeChecking isNotEmptyString:v37]) {
    [v33 setObject:v37 forKey:@"com.applecare.followup.saleflowsource"];
  }
  double v38 = [v6 warranty];
  double v39 = [v38 eligibilityEventId];
  BOOL v40 = +[NDOTypeChecking isNotEmptyString:v39];

  if (v40)
  {
    uint64_t v41 = [v6 warranty];
    v42 = [v41 eligibilityEventId];
    [v33 setObject:v42 forKey:@"FollowupEligibilityEventId"];
  }
  int v43 = [v6 warranty];
  v44 = [v43 acLocalizedOfferSingularDesc];

  if (v44)
  {
    uint64_t v45 = [v6 warranty];
    v46 = [v45 acLocalizedOfferSingularDesc];
    [v33 setObject:v46 forKey:*MEMORY[0x263F35360]];
  }
  else
  {
    uint64_t v45 = _NDOLogSystem();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      -[NDOFollowUp _setupFollowUpItem:withDeviceInfo:]();
    }
  }

  BOOL v47 = [v6 warranty];
  v48 = [v47 acLocalizedOfferPluralDescFormat];

  if (v48)
  {
    v49 = [v6 warranty];
    v50 = [v49 acLocalizedOfferPluralDescFormat];
    [v33 setObject:v50 forKey:*MEMORY[0x263F35358]];
  }
  else
  {
    v49 = _NDOLogSystem();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      -[NDOFollowUp _setupFollowUpItem:withDeviceInfo:]();
    }
  }

  v51 = [v6 warranty];
  uint64_t v52 = [v51 acLocalizedGroupedOfferFooterLabel];
  v53 = (void *)v52;
  if (v52) {
    v54 = (__CFString *)v52;
  }
  else {
    v54 = &stru_26EF9F650;
  }
  [v33 setObject:v54 forKey:*MEMORY[0x263F35338]];

  v55 = [v6 device];
  long long v56 = [v55 name];

  if (v56) {
    goto LABEL_29;
  }
  v60 = [v6 warranty];
  uint64_t v61 = [v60 acLocalizedOfferLongLabel];

  if (v61)
  {
    char v62 = [v6 warranty];
    long long v56 = [v62 acLocalizedOfferLongLabel];

    if (v56)
    {
LABEL_29:
      [v33 setObject:v56 forKey:*MEMORY[0x263F35340]];
    }
  }
  [v5 setUserInfo:v33];
  v57 = [v6 warranty];
  uint64_t v58 = [v57 acLocalizedGroupedOfferCTA];
  if (v58) {
    goto LABEL_31;
  }
  v63 = [v6 warranty];
  uint64_t v59 = [v63 acLocalizedOfferCTA];

  if (!v59)
  {
    v57 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
    uint64_t v58 = [v57 localizedStringForKey:@"FUP_ACTION_LABEL" value:&stru_26EF9F650 table:@"Localizable"];
LABEL_31:
    uint64_t v59 = (void *)v58;
  }
  char v64 = [MEMORY[0x263F35378] actionWithLabel:v59 url:0];
  [v64 setIdentifier:@"com.followup.ndo_followup_open_action"];
  v65 = [v6 warranty];
  uint64_t v66 = [v65 acLocalizedOfferLabel];
  [v5 setTitle:v66];

  uint64_t v67 = [v6 warranty];
  v68 = [v67 acLocalizedOfferDesc];
  [v5 setInformativeFooterText:v68];

  v91 = v64;
  v69 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
  [v5 setActions:v69];

  id v70 = [v6 warranty];
  LODWORD(v68) = [v70 showNotificationToggle];

  if (!v68)
  {
    LODWORD(v78) = 0;
    goto LABEL_45;
  }
  v83 = v37;
  id v71 = [v6 warranty];
  long long v72 = [v71 acOfferEligibleUntil];
  long long v73 = [v6 warranty];
  [v73 showNotificationBeforeEndDate];
  long long v75 = [v72 dateByAddingTimeInterval:-v74];

  int v76 = _NDOLogSystem();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v88 = "-[NDOFollowUp _setupFollowUpItem:withDeviceInfo:]";
    __int16 v89 = 2112;
    v90[0] = v75;
    _os_log_impl(&dword_23C013000, v76, OS_LOG_TYPE_DEFAULT, "%{public}s: NotificationDate: %@", buf, 0x16u);
  }

  v77 = [MEMORY[0x263EFF910] date];
  if ([v75 compare:v77] != -1)
  {

    LODWORD(v78) = 0;
    v34 = v86;
LABEL_44:
    int v37 = v83;

    goto LABEL_45;
  }
  BOOL v79 = [v6 warranty];
  __int16 v80 = [v79 acOfferEligibleUntil];
  BOOL v81 = [MEMORY[0x263EFF910] date];
  uint64_t v78 = [v80 compare:v81];

  if (v78 == 1)
  {
    long long v75 = [(NDOFollowUp *)self _setupFollowUpNotificationWithDeviceInfo:v6];
    v34 = v86;
    [v86 setNotification:v75];
    goto LABEL_44;
  }
  LODWORD(v78) = 0;
  v34 = v86;
  int v37 = v83;
LABEL_45:
  v82 = _NDOLogSystem();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v88 = "-[NDOFollowUp _setupFollowUpItem:withDeviceInfo:]";
    __int16 v89 = 1024;
    LODWORD(v90[0]) = v84;
    WORD2(v90[0]) = 1024;
    *(_DWORD *)((char *)v90 + 6) = v78;
    _os_log_impl(&dword_23C013000, v82, OS_LOG_TYPE_DEFAULT, "%{public}s: showRowBadge:%d showNotification:%d", buf, 0x18u);
  }
}

- (void)migrateLegacyFollowUpIfNeededWithDeviceInfo:(id)a3
{
  id v6 = a3;
  id v4 = [v6 device];
  id v5 = [v4 serialNumber];
  [(NDOFollowUp *)self dismissFollowUpForSerialNumber:v5];

  [(NDOFollowUp *)self postFollowUpWithDeviceInfo:v6];
}

- (id)_setupFollowUpNotificationWithDeviceInfo:(id)a3
{
  v30[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F35390]);
  id v5 = [v3 warranty];
  id v6 = [v5 acNotificationLocalizedOfferLabel];

  uint64_t v7 = [v3 warranty];
  uint64_t v8 = v7;
  if (v6) {
    [v7 acNotificationLocalizedOfferLabel];
  }
  else {
  uint64_t v9 = [v7 acLocalizedOfferLabel];
  }
  [v4 setTitle:v9];

  uint64_t v10 = [v3 warranty];
  uint64_t v11 = [v10 acLocalizedNotificationOfferDesc];

  if (v11)
  {
    uint64_t v12 = [v3 warranty];
    uint64_t v13 = [v12 acLocalizedNotificationOfferDesc];
    [v4 setInformativeText:v13];
  }
  id v14 = objc_alloc_init(MEMORY[0x263F35378]);
  double v15 = v14;
  if (v14)
  {
    [v14 setIdentifier:@"com.followup.ndo_notification_open_action"];
    uint64_t v16 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
    uint64_t v17 = [v16 localizedStringForKey:@"DETAILS" value:&stru_26EF9F650 table:@"Localizable"];
    [v15 setLabel:v17];

    [v4 setActivateAction:v15];
  }
  else
  {
    uint64_t v18 = _NDOLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[NDOFollowUp _setupFollowUpNotificationWithDeviceInfo:]();
    }
  }
  id v19 = objc_alloc_init(MEMORY[0x263F35378]);
  uint64_t v20 = v19;
  if (v19)
  {
    [v19 setIdentifier:@"com.followup.ndo_notification_clear_action"];
    uint64_t v21 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
    uint64_t v22 = [v21 localizedStringForKey:@"CLEAR_NOTIFICATION" value:&stru_26EF9F650 table:@"Localizable"];
    [v20 setLabel:v22];

    [v4 setClearAction:v20];
  }
  else
  {
    id v23 = _NDOLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[NDOFollowUp _setupFollowUpNotificationWithDeviceInfo:]();
    }
  }
  [v4 setFrequency:0.0];
  uint64_t v24 = [v4 options];
  uint64_t v25 = *MEMORY[0x263F35328];
  v30[0] = *MEMORY[0x263F35320];
  v30[1] = v25;
  uint64_t v26 = *MEMORY[0x263F35308];
  v30[2] = *MEMORY[0x263F35300];
  v30[3] = v26;
  uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
  uint64_t v28 = [v24 setByAddingObjectsFromArray:v27];
  [v4 setOptions:v28];

  return v4;
}

- (NDOFollowUpProvider)followUpProvider
{
  return (NDOFollowUpProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFollowUpProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)uniqueIdentfierForSerialNumber:bundleId:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x2Au);
}

+ (void)followUpTargetBundleIDsForDevice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)followUpItemsForDeviceInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x20u);
}

- (void)postFollowUpWithDeviceInfo:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

- (void)postFollowUpWithDeviceInfo:(unsigned char *)a1 .cold.2(unsigned char *a1, unsigned char *a2)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(v2, v3, v4, v5, v6, 2u);
}

- (void)_checkConversionEligibilityForDevice:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = [a1 device];
  uint64_t v7 = [a1 warranty];
  uint64_t v8 = [v7 acOfferFollowupDisplayDate];
  int v9 = 138478339;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  __int16 v13 = 2112;
  id v14 = v8;
  _os_log_debug_impl(&dword_23C013000, a3, OS_LOG_TYPE_DEBUG, "Device not eligible for conversion. %{private}@, followup dismissed date: %@, fup display date: %@", (uint8_t *)&v9, 0x20u);
}

+ (void)uniqueFollowUpIdentifiersForDevice:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23C013000, v0, v1, "@{public}s: no device serial. Cannot generate follow up IDs", v2, v3, v4, v5, v6);
}

+ (void)possibleUniqueIdentifiersForSerialNumber:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23C013000, v0, v1, "@{public}s: no serial. Cannot generate follow up IDs", v2, v3, v4, v5, v6);
}

- (void)_pendingFollowUpItemsForSerialNumber:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_23C013000, v0, v1, "%{public}s Failed to get pending follow ups. Err:%@", v2, v3, v4, v5, 2u);
}

- (void)_clearFollowUpForSerialNumber:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_23C013000, v0, v1, "%{public}s Error. Invalid serial: @{private}%@", v2, v3, v4, v5, 2u);
}

- (void)_clearFollowUpsForDeviceSerialNumbers:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_23C013000, v0, v1, "%{public}s Failed to get pending follow ups. Err:%@", v2, v3, v4, v5, 2u);
}

- (void)refreshFollowupWithDeviceInfos:(_DWORD *)a1 clearUntrackedDeviceFollowups:(void *)a2 andForcePostFollowup:.cold.1(_DWORD *a1, void *a2)
{
  *a1 = 136446210;
  *a2 = "-[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]";
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0xCu);
}

- (void)refreshFollowupWithDeviceInfos:(uint64_t)a3 clearUntrackedDeviceFollowups:(uint64_t)a4 andForcePostFollowup:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setupFollowUpItem:withDeviceInfo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23C013000, v0, v1, "Missing acLocalizedOfferPluralDescFormat value", v2, v3, v4, v5, v6);
}

- (void)_setupFollowUpItem:withDeviceInfo:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23C013000, v0, v1, "Missing acLocalizedOfferSingularDesc value", v2, v3, v4, v5, v6);
}

- (void)_setupFollowUpNotificationWithDeviceInfo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23C013000, v0, v1, "Failed to alloc clear action", v2, v3, v4, v5, v6);
}

- (void)_setupFollowUpNotificationWithDeviceInfo:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23C013000, v0, v1, "Failed to alloc open action", v2, v3, v4, v5, v6);
}

@end