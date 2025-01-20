@interface TSFlowHelper
+ (BOOL)handleStartOverAgainstNoPlan:(id)a3 navigationController:(id)a4 completion:(id)a5;
+ (BOOL)hasTransferablePlanWithSameCarrierName:(id)a3 transferablePlans:(id)a4 inBuddy:(BOOL)a5 matchingSODACarrierWebsheetTransferPlanIndex:(id)a6;
+ (id)getAccountMemberTransferablePlanWithSameCarrierName:(id)a3 transferablePlans:(id)a4;
+ (id)sortIndexesInDescending:(id)a3;
+ (id)unregisteredSelectedPlanItems:(id)a3;
+ (int64_t)_slotForPlanItem:(id)a3;
+ (void)registerIMessageWithPlanItems:(id)a3;
@end

@implementation TSFlowHelper

+ (id)unregisteredSelectedPlanItems:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  v22 = +[TSIDSSubscriptionSelector activeIMessageSlots];
  if ([v22 count])
  {
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    id v21 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isInstalling", v21) & 1) == 0)
          {
            if (![v11 isSelected]) {
              continue;
            }
            v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "_slotForPlanItem:", v11));
            char v13 = [v22 containsObject:v12];

            if (v13) {
              continue;
            }
          }
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v8);
    }

    v14 = _TSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[TSFlowHelper unregisteredSelectedPlanItems:]();
    }
    id v4 = v21;
  }
  else
  {
    long long v29 = 0uLL;
    long long v30 = 0uLL;
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    v14 = v4;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          if ([v19 isSelected]) {
            [v5 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v16);
    }
  }

  return v5;
}

+ (void)registerIMessageWithPlanItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "_slotForPlanItem:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13));
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  +[TSIDSSubscriptionSelector registerSlotsForIMessage:v5];
  v12 = _TSLogDomain();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    +[TSFlowHelper registerIMessageWithPlanItems:]();
  }
}

+ (BOOL)hasTransferablePlanWithSameCarrierName:(id)a3 transferablePlans:(id)a4 inBuddy:(BOOL)a5 matchingSODACarrierWebsheetTransferPlanIndex:(id)a6
{
  BOOL v7 = a5;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!v9
    || ([v9 plans],
        v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 count],
        v12,
        !v13))
  {
    BOOL v26 = 0;
    goto LABEL_27;
  }
  long long v14 = [v9 plans];
  long long v15 = [v14 objectAtIndexedSubscript:0];
  v35 = [v15 carrierName];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (!v17)
  {
    BOOL v26 = 0;
    goto LABEL_26;
  }
  uint64_t v18 = v17;
  BOOL v32 = v7;
  uint64_t v33 = v11;
  id v34 = v10;
  uint64_t v19 = *(void *)v37;
  while (2)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v37 != v19) {
        objc_enumerationMutation(v16);
      }
      id v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      v22 = [v21 objectForKeyedSubscript:@"planItem"];
      long long v23 = [v22 carrierName];
      BOOL v24 = +[TSUtilities isCaseInsensitiveEqual:v35 withString:v23];

      if (v24)
      {
        uint64_t v25 = [v16 indexOfObject:v21];
        if ([v22 isAccountMemberTransferablePlan])
        {
          long long v27 = _TSLogDomain();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v41 = "+[TSFlowHelper hasTransferablePlanWithSameCarrierName:transferablePlans:inBuddy:matchingSODACarrierWeb"
                  "sheetTransferPlanIndex:]";
            _os_log_impl(&dword_227A17000, v27, OS_LOG_TYPE_DEFAULT, "Account member has a transferrable plan with a SODA tether @%s", buf, 0xCu);
          }

          long long v28 = [NSNumber numberWithUnsignedInteger:v25];
          id v11 = v33;
          [v33 addObject:v28];
          BOOL v26 = 0;
        }
        else
        {
          if (![v22 isOneClickTransferablePlan])
          {
            if (![v22 isWebsheetTransferablePlan]) {
              goto LABEL_12;
            }
            long long v30 = _TSLogDomain();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = @"post buddy";
              if (v32) {
                v31 = @"in buddy";
              }
              *(_DWORD *)buf = 138412802;
              v41 = v35;
              __int16 v42 = 2112;
              v43 = (const char *)v31;
              __int16 v44 = 2080;
              v45 = "+[TSFlowHelper hasTransferablePlanWithSameCarrierName:transferablePlans:inBuddy:matchingSODACarrierW"
                    "ebsheetTransferPlanIndex:]";
              _os_log_impl(&dword_227A17000, v30, OS_LOG_TYPE_DEFAULT, "Websheet transferrable plan exists with same carrier name [%@] %@ @%s", buf, 0x20u);
            }

            id v10 = v34;
            if (!v32)
            {
              BOOL v26 = 1;
              id v11 = v33;
              goto LABEL_25;
            }
            long long v28 = [NSNumber numberWithUnsignedInteger:v25];
            id v11 = v33;
            [v33 addObject:v28];
            BOOL v26 = 0;
LABEL_24:

LABEL_25:
            goto LABEL_26;
          }
          long long v28 = _TSLogDomain();
          id v11 = v33;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v41 = v35;
            __int16 v42 = 2080;
            v43 = "+[TSFlowHelper hasTransferablePlanWithSameCarrierName:transferablePlans:inBuddy:matchingSODACarrierWeb"
                  "sheetTransferPlanIndex:]";
            _os_log_impl(&dword_227A17000, v28, OS_LOG_TYPE_DEFAULT, "One click transferrable plan exists with same carrier name [%@] @%s", buf, 0x16u);
          }
          BOOL v26 = 1;
        }
        id v10 = v34;
        goto LABEL_24;
      }
LABEL_12:
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v18) {
      continue;
    }
    break;
  }
  BOOL v26 = 0;
  id v10 = v34;
  id v11 = v33;
LABEL_26:

LABEL_27:
  return v26;
}

+ (id)getAccountMemberTransferablePlanWithSameCarrierName:(id)a3 transferablePlans:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v27 = [MEMORY[0x263EFF980] array];
  if (v5)
  {
    BOOL v7 = [v5 plans];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v26 = v5;
      id v9 = [v5 plans];
      id v10 = [v9 objectAtIndexedSubscript:0];
      id v11 = [v10 carrierName];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v25 = v6;
      id v12 = v6;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v29 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v18 = objc_msgSend(v17, "objectForKeyedSubscript:", @"planItem", v25);
            uint64_t v19 = [v18 carrierName];
            uint64_t v20 = [v11 caseInsensitiveCompare:v19];

            if (!v20)
            {
              uint64_t v21 = [v12 indexOfObject:v17];
              if ([v18 isAccountMemberTransferablePlan])
              {
                v22 = _TSLogDomain();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  uint64_t v33 = "+[TSFlowHelper getAccountMemberTransferablePlanWithSameCarrierName:transferablePlans:]";
                  _os_log_impl(&dword_227A17000, v22, OS_LOG_TYPE_DEFAULT, "Account member has a transferrable plan with a SODA tether @%s", buf, 0xCu);
                }

                long long v23 = [NSNumber numberWithUnsignedInteger:v21];
                [v27 addObject:v23];
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v14);
      }

      id v6 = v25;
      id v5 = v26;
    }
  }

  return v27;
}

+ (int64_t)_slotForPlanItem:(id)a3
{
  v3 = [a3 uuid];
  int v4 = [v3 integerValue];

  if (v4 >= 0) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (BOOL)handleStartOverAgainstNoPlan:(id)a3 navigationController:(id)a4 completion:(id)a5
{
  v23[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = (TSCellularPlanIntroViewController *)v7;
    if ([(TSCellularPlanIntroViewController *)v10 entryPoint] == 2)
    {
      id v11 = [TSSubFlowViewController alloc];
      v22[0] = @"FlowTypeKey";
      v22[1] = @"IsFirstViewKey";
      v23[0] = &unk_26DC14608;
      v23[1] = MEMORY[0x263EFFA88];
      id v12 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      uint64_t v13 = [(TSSubFlowViewController *)v11 initWithOptions:v12 navigationController:v8];

      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __77__TSFlowHelper_handleStartOverAgainstNoPlan_navigationController_completion___block_invoke;
      v19[3] = &unk_264828730;
      uint64_t v20 = v13;
      id v21 = v9;
      uint64_t v14 = v13;
      [(TSCellularPlanIntroViewController *)v14 prepare:v19];
    }
    else
    {
      if ([(TSCellularPlanIntroViewController *)v10 entryPoint] != 1)
      {
        (*((void (**)(id, void))v9 + 2))(v9, 0);
        goto LABEL_16;
      }
      uint64_t v16 = _os_feature_enabled_impl();
      if (+[TSUtilities isPad]) {
        uint64_t v16 = _os_feature_enabled_impl();
      }
      uint64_t v14 = [[TSCellularPlanIntroViewController alloc] initWithShowTransferOption:v16 requireDelayBluetoothConnection:0];
      (*((void (**)(id, TSCellularPlanIntroViewController *))v9 + 2))(v9, v14);
    }

LABEL_16:
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v7 entryPoint] != 1)
    {
LABEL_17:
      BOOL v17 = 1;
      goto LABEL_18;
    }
    uint64_t v15 = _os_feature_enabled_impl();
    if (+[TSUtilities isPad]) {
      uint64_t v15 = _os_feature_enabled_impl();
    }
    id v10 = [[TSCellularPlanIntroViewController alloc] initWithShowTransferOption:v15 requireDelayBluetoothConnection:0];
    (*((void (**)(id, TSCellularPlanIntroViewController *))v9 + 2))(v9, v10);
    goto LABEL_16;
  }
  BOOL v17 = 0;
LABEL_18:

  return v17;
}

uint64_t __77__TSFlowHelper_handleStartOverAgainstNoPlan_navigationController_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)sortIndexesInDescending:(id)a3
{
  id v3 = a3;
  [v3 sortUsingComparator:&__block_literal_global_23];
  int v4 = (void *)[v3 copy];

  return v4;
}

uint64_t __40__TSFlowHelper_sortIndexesInDescending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 unsignedIntegerValue];
  unint64_t v6 = [v4 unsignedIntegerValue];

  if (v5 <= v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = -1;
  }
  if (v5 < v6) {
    return 1;
  }
  else {
    return v7;
  }
}

+ (void)unregisteredSelectedPlanItems:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  v2 = "+[TSFlowHelper unregisteredSelectedPlanItems:]";
  _os_log_debug_impl(&dword_227A17000, v0, OS_LOG_TYPE_DEBUG, "[Db] %@ @%s", v1, 0x16u);
}

+ (void)registerIMessageWithPlanItems:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  v2 = "+[TSFlowHelper registerIMessageWithPlanItems:]";
  _os_log_debug_impl(&dword_227A17000, v0, OS_LOG_TYPE_DEBUG, "[Db] %@ @%s", v1, 0x16u);
}

@end