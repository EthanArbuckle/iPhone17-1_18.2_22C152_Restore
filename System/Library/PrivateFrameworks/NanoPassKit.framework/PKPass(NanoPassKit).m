@interface PKPass(NanoPassKit)
+ (void)npkClearTransitValuePendingStateIfNecessaryForPassWithID:()NanoPassKit withBalanceFields:commutePlanFields:;
+ (void)npkHandleTransitValuePendingAmount:()NanoPassKit forBalanceField:passWithUniqueID:;
+ (void)npkHandleTransitValuePendingExpiryDate:()NanoPassKit forCommutePlanField:passWithUniqueID:;
- (BOOL)npkIsAddValuePending;
- (BOOL)npkSupportsHidingAccessory;
- (id)npkCompleteHashForWatchOSVersion:()NanoPassKit;
- (id)npkPendingAddValueStateExpireDateForBalanceFieldWithIdentifier:()NanoPassKit currentBalance:;
- (id)npkPendingAddValueStateExpireDateForCommutePlanFieldWithIdentifier:()NanoPassKit expiryDate:rawCountValue:;
- (uint64_t)_hasPlanUpdatedWithFieldIdentifier:()NanoPassKit fieldInfo:renewalDate:expiryDate:rawCountValue:;
- (uint64_t)hasLogoImageSet;
- (uint64_t)npkAccessoryType;
- (uint64_t)npkCompleteHash;
- (uint64_t)npkHasValidNFCPayload;
- (uint64_t)npkIsDefaultPassEligible;
- (uint64_t)npkIsHomeKeyUWB;
@end

@implementation PKPass(NanoPassKit)

- (uint64_t)npkAccessoryType
{
  if ([a1 style] == 7) {
    return 2;
  }
  v3 = [a1 barcode];
  uint64_t v4 = [v3 messageData];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [a1 barcode];
    v7 = [v6 messageData];
    BOOL v2 = [v7 length] != 0;
  }
  else
  {

    return 0;
  }
  return v2;
}

- (BOOL)npkSupportsHidingAccessory
{
  if (NPKShowRedesignedUI()) {
    return 1;
  }
  if ([a1 npkAccessoryType] != 1) {
    return [a1 npkAccessoryType] != 2;
  }
  v3 = [a1 nfcPayload];
  BOOL v2 = v3 != 0;

  return v2;
}

- (uint64_t)npkCompleteHash
{
  return [a1 npkCompleteHashForWatchOSVersion:2];
}

- (id)npkCompleteHashForWatchOSVersion:()NanoPassKit
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 1) >= 2)
  {
    v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v18 = 136446978;
        *(void *)&v18[4] = "-[PKPass(NanoPassKit) npkCompleteHashForWatchOSVersion:]";
        __int16 v19 = 2082;
        v20 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/PKPass+NanoPassKit.m";
        __int16 v21 = 2048;
        uint64_t v22 = 117;
        __int16 v23 = 2048;
        uint64_t v24 = a3;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Cannot calculate npk complete hash for version %llu)", v18, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  v8 = [a1 manifestHash];

  if (v8)
  {
    v9 = (void *)MEMORY[0x263EFF990];
    v10 = [a1 manifestHash];
    v11 = [v9 dataWithData:v10];

    if (a3 == 1)
    {
      v18[0] = [a1 settings] & 1;
      v12 = v11;
      uint64_t v13 = 1;
    }
    else
    {
      char v15 = [a1 settings];
      __int16 v16 = [a1 settings] & 0x20 | v15 & 1;
      *(_WORD *)v18 = v16 | [a1 settings] & 0x10;
      v12 = v11;
      uint64_t v13 = 2;
    }
    objc_msgSend(v12, "appendBytes:length:", v18, v13, *(void *)v18);
    v14 = [MEMORY[0x263EFF8F8] dataWithData:v11];
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (uint64_t)hasLogoImageSet
{
  return [a1 isImageSetLoaded:4];
}

- (uint64_t)npkHasValidNFCPayload
{
  v1 = [a1 nfcPayload];
  BOOL v2 = [v1 message];
  if (v2)
  {
    v3 = [v1 encryptionPublicKeyData];
    if (v3) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = PKNFCPassKeyOptional();
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)npkIsDefaultPassEligible
{
  v1 = [a1 secureElementPass];
  BOOL v2 = v1;
  if (v1
    && ![v1 contactlessActivationState]
    && [v2 supportsDefaultCardSelection]
    && ([v2 effectiveContactlessPaymentApplicationState],
        PKPaymentApplicationStateIsPersonalized())
    && ([v2 isAccessPass] & 1) == 0)
  {
    uint64_t v3 = [v2 isIdentityPass] ^ 1;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)npkIsHomeKeyUWB
{
  BOOL v2 = [a1 secureElementPass];
  if (([v2 npkSupportsBluetooth] & 1) != 0 || NPKMockUWBHomeKey())
  {
    uint64_t v3 = [a1 secureElementPass];
    uint64_t v4 = [v3 isHomeKeyPass];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)npkIsAddValuePending
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nanopassbook"];
  uint64_t v3 = [v2 objectForKey:NPKTransitValuePendingDefaultsKey];
  uint64_t v4 = [a1 uniqueID];
  v5 = [v3 objectForKeyedSubscript:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    BOOL v7 = 0;
    goto LABEL_15;
  }
  if (!__isLegacyPassInfo(v5))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = objc_msgSend(v5, "allValues", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * v12) objectForKeyedSubscript:@"date"];

          if (v13)
          {

            BOOL v7 = 1;
            goto LABEL_15;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    goto LABEL_13;
  }
  BOOL v6 = [v5 objectForKeyedSubscript:@"date"];
  BOOL v7 = v6 != 0;

LABEL_15:
  return v7;
}

- (id)npkPendingAddValueStateExpireDateForBalanceFieldWithIdentifier:()NanoPassKit currentBalance:
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 uniqueID];
  uint64_t v9 = __pendingFieldValueInfo(v8, v6);

  uint64_t v10 = [v9 objectForKey:@"date"];
  uint64_t v11 = [v9 objectForKey:@"balance"];
  uint64_t v12 = v11;
  BOOL v13 = 0;
  BOOL v14 = 1;
  if (v7 && v11)
  {
    uint64_t v15 = [v11 compare:v7];
    BOOL v14 = v15 != -1;
    BOOL v13 = v15 == -1;
  }
  long long v16 = 0;
  if (v14 && v10)
  {
    long long v16 = [v10 dateByAddingTimeInterval:600.0];
  }
  long long v17 = pk_Payment_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    __int16 v19 = pk_Payment_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [a1 uniqueID];
      int v22 = 138413058;
      __int16 v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v20;
      __int16 v26 = 2112;
      id v27 = v6;
      __int16 v28 = 1024;
      BOOL v29 = v13;
      _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Notice: PendingAddValueStateExpireDate: %@ for pass %@ field:%@ balanceUpdated:%d", (uint8_t *)&v22, 0x26u);
    }
  }

  return v16;
}

- (id)npkPendingAddValueStateExpireDateForCommutePlanFieldWithIdentifier:()NanoPassKit expiryDate:rawCountValue:
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [a1 uniqueID];
  uint64_t v12 = __pendingFieldValueInfo(v11, v8);

  BOOL v13 = [v12 objectForKey:@"date"];
  int v14 = [a1 _hasPlanUpdatedWithFieldIdentifier:v8 fieldInfo:v12 renewalDate:v13 expiryDate:v10 rawCountValue:v9];

  uint64_t v15 = 0;
  if (v13 && (v14 & 1) == 0)
  {
    uint64_t v15 = [v13 dateByAddingTimeInterval:600.0];
  }
  long long v16 = pk_Payment_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    BOOL v18 = pk_Payment_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = [a1 uniqueID];
      int v21 = 138413314;
      int v22 = v15;
      __int16 v23 = 2112;
      __int16 v24 = v19;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 1024;
      int v28 = v14;
      __int16 v29 = 2112;
      uint64_t v30 = v13;
      _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: PendingAddValueStateExpireDate: %@ for pass %@ field:%@ planUpdated:%d renewalDate: %@", (uint8_t *)&v21, 0x30u);
    }
  }

  return v15;
}

- (uint64_t)_hasPlanUpdatedWithFieldIdentifier:()NanoPassKit fieldInfo:renewalDate:expiryDate:rawCountValue:
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = a7;
  id v13 = a4;
  int v14 = [v13 objectForKey:@"planExpiry"];
  uint64_t v15 = [v13 objectForKey:@"planTripCount"];

  BOOL v16 = 0;
  if (v11 && v14) {
    BOOL v16 = [v14 compare:v11] == -1;
  }
  BOOL v17 = 0;
  if (v12 && v15) {
    BOOL v17 = [v15 compare:v12] == -1;
  }
  BOOL v18 = pk_Payment_log();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

  if (v19)
  {
    uint64_t v20 = pk_Payment_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412802;
      id v23 = v10;
      __int16 v24 = 1024;
      BOOL v25 = v16;
      __int16 v26 = 1024;
      BOOL v27 = v17;
      _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: PendingAddValueStateExpireDate for field:%@ expiryDateDidUpdate:%d tripCountDidUpdate: %d", (uint8_t *)&v22, 0x18u);
    }
  }
  return v16 | v17;
}

+ (void)npkHandleTransitValuePendingAmount:()NanoPassKit forBalanceField:passWithUniqueID:
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412802;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: addValuePending: npkHandleTransitValuePendingAmount %@ withField:%@ forPassWithID %@", (uint8_t *)&v18, 0x20u);
    }
  }
  id v13 = [v8 balance];
  int v14 = [v13 value];

  if (v9)
  {
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    BOOL v16 = [MEMORY[0x263EFF910] date];
    [v15 setObject:v16 forKey:@"date"];

    if (v7) {
      [v15 setObject:v7 forKey:@"amount"];
    }
    if (v14) {
      [v15 setObject:v14 forKey:@"balance"];
    }
    BOOL v17 = [v8 identifier];
    __setPendingFieldValueInfo(v15, v9, v17);
  }
}

+ (void)npkHandleTransitValuePendingExpiryDate:()NanoPassKit forCommutePlanField:passWithUniqueID:
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 usageDateRange];
  BOOL v11 = [v10 expiryDate];

  id v12 = [v8 rawCountValue];
  id v13 = pk_Payment_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v15 = pk_Payment_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138413314;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      __int16 v26 = v11;
      __int16 v27 = 2112;
      uint64_t v28 = v12;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: addValuePending: npkHandleTransitValuePendingExpiryDate %@ withField:%@ forPassWithID %@ currentExpiry: %@, tripCount: %@", (uint8_t *)&v19, 0x34u);
    }
  }
  if (v9)
  {
    id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    BOOL v17 = [MEMORY[0x263EFF910] date];
    [v16 setObject:v17 forKey:@"date"];

    if (v11) {
      [v16 setObject:v11 forKey:@"planExpiry"];
    }
    if (v12) {
      [v16 setObject:v12 forKey:@"planTripCount"];
    }
    int v18 = [v8 identifier];
    __setPendingFieldValueInfo(v16, v9, v18);
  }
}

+ (void)npkClearTransitValuePendingStateIfNecessaryForPassWithID:()NanoPassKit withBalanceFields:commutePlanFields:
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v57 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = pk_Payment_log();
  LODWORD(a4) = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (a4)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v69 = v57;
      __int16 v70 = 2112;
      id v71 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: addValuePending: npkClearTransitValuePendingStateIfNecessaryForPassWithID %@ fields %@", buf, 0x16u);
    }
  }
  if (v57)
  {
    id v52 = v7;
    v53 = v8;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v63;
      id v15 = @"balance";
      id obj = v11;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v63 != v14) {
            objc_enumerationMutation(v11);
          }
          BOOL v17 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          int v18 = [v17 identifier];
          int v19 = __pendingFieldValueInfo(v57, v18);

          if (v19)
          {
            id v20 = [v19 objectForKey:v15];
            __int16 v21 = [v17 balance];
            id v22 = [v21 value];

            if (v20) {
              BOOL v23 = v22 == 0;
            }
            else {
              BOOL v23 = 1;
            }
            if (!v23 && [v20 compare:v22] == -1)
            {
              id v24 = v15;
              __int16 v25 = pk_Payment_log();
              BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

              if (v26)
              {
                __int16 v27 = pk_Payment_log();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_DEFAULT, "Notice: addValuePending: Balance is greater than before pending top up, clearing value pending state", buf, 2u);
                }
              }
              uint64_t v28 = (void *)[v19 mutableCopy];
              [v28 removeObjectForKey:@"date"];
              [v28 removeObjectForKey:v24];
              uint64_t v29 = [v17 identifier];
              __setPendingFieldValueInfo(v28, v57, v29);

              id v15 = v24;
              id v11 = obj;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v62 objects:v67 count:16];
      }
      while (v13);
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obja = v53;
    uint64_t v30 = [obja countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v59;
      do
      {
        uint64_t v33 = 0;
        uint64_t v54 = v31;
        do
        {
          if (*(void *)v59 != v32) {
            objc_enumerationMutation(obja);
          }
          v34 = *(void **)(*((void *)&v58 + 1) + 8 * v33);
          v35 = [v34 identifier];
          v36 = __pendingFieldValueInfo(v57, v35);

          if (v36)
          {
            v37 = [v36 objectForKey:@"planExpiry"];
            v38 = [v34 usageDateRange];
            v39 = [v38 expiryDate];

            v40 = [v36 objectForKey:@"planTripCount"];
            v41 = [v34 rawCountValue];
            if (v37) {
              BOOL v42 = v39 == 0;
            }
            else {
              BOOL v42 = 1;
            }
            BOOL v43 = !v42 && [v37 compare:v39] == -1;
            if (v40) {
              BOOL v44 = v41 == 0;
            }
            else {
              BOOL v44 = 1;
            }
            BOOL v45 = !v44 && [v40 compare:v41] == -1;
            if (v43 || v45)
            {
              uint64_t v46 = v32;
              v47 = pk_Payment_log();
              BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

              if (v48)
              {
                v49 = pk_Payment_log();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21E92F000, v49, OS_LOG_TYPE_DEFAULT, "Notice: addValuePending: expiration date or trip count is greater than before pending renew, clearing value pending state", buf, 2u);
                }
              }
              v50 = (void *)[v36 mutableCopy];
              [v50 removeObjectForKey:@"date"];
              [v50 removeObjectForKey:@"planExpiry"];
              [v50 removeObjectForKey:@"planTripCount"];
              v51 = [v34 identifier];
              __setPendingFieldValueInfo(v50, v57, v51);

              uint64_t v32 = v46;
              uint64_t v31 = v54;
            }
          }
          ++v33;
        }
        while (v31 != v33);
        uint64_t v31 = [obja countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v31);
    }

    id v7 = v52;
    id v8 = v53;
  }
}

@end