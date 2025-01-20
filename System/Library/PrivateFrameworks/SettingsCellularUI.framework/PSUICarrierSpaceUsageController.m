@interface PSUICarrierSpaceUsageController
- (BOOL)hasMultipleDevicesOfTheSameType;
- (BOOL)hasMultiplePlansOfSameTypeForNetworkUsageLabel:(id)a3;
- (BOOL)hasMultiplePlansOfTheSameTypeInTheSameSectionCategory;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)shouldShowCalls:(id)a3;
- (BOOL)shouldShowData:(id)a3;
- (BOOL)shouldShowMessages:(id)a3;
- (BOOL)shouldShowOnlyRemainingCalls:(id)a3;
- (BOOL)shouldShowOnlyRemainingData:(id)a3;
- (BOOL)shouldShowOnlyRemainingMessages:(id)a3;
- (BOOL)shouldShowPlanSection:(id)a3;
- (BOOL)shouldShowRemainingCredit:(id)a3;
- (PSUICarrierSpaceUsageController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)barGraphColors;
- (id)callsDescription:(id)a3;
- (id)dataUsageDescription:(id)a3;
- (id)deviceTypeSectionLabelForAccountMetrics:(id)a3;
- (id)getLogger;
- (id)messagesDescription:(id)a3;
- (id)planCategorySectionLabelForPlanMetrics:(id)a3;
- (id)remainingCreditDescription:(id)a3;
- (id)specifiers;
- (id)usageCategories;
- (id)usageGraphSpecifierForSection:(id)a3;
- (id)usageSections;
- (void)carrierSpaceChanged;
- (void)simStatusChanged;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PSUICarrierSpaceUsageController

- (void)simStatusChanged
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(PSUICarrierSpaceUsageController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    v9 = "-[PSUICarrierSpaceUsageController simStatusChanged]";
    __int16 v10 = 2112;
    uint64_t v11 = 0x26D414D80;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", (uint8_t *)&v8, 0x16u);
  }

  v4 = [MEMORY[0x263F67EF0] sharedInstance];
  int v5 = [v4 isSIMMissing];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x263F5FE88]));
    id v7 = (id)[WeakRetained popViewControllerAnimated:1];
  }
}

- (void)carrierSpaceChanged
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [(PSUICarrierSpaceUsageController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    int v5 = "-[PSUICarrierSpaceUsageController carrierSpaceChanged]";
    __int16 v6 = 2112;
    uint64_t v7 = 0x26D414D60;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification: %@", (uint8_t *)&v4, 0x16u);
  }

  [(PSUICarrierSpaceUsageController *)self reloadSpecifiers];
}

- (PSUICarrierSpaceUsageController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PSUICarrierSpaceUsageController;
  int v4 = [(PSUICarrierSpaceUsageController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    int v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v4 selector:sel_simStatusChanged name:0x26D414D80 object:0];

    __int16 v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v4 selector:sel_carrierSpaceChanged name:0x26D414D60 object:0];
  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v5 = [(PSUICarrierSpaceUsageController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PSUICarrierSpaceUsageController viewDidAppear:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)PSUICarrierSpaceUsageController;
  [(PSUICarrierSpaceUsageController *)&v8 viewDidAppear:v3];
  __int16 v6 = @"com.apple.Preferences.CarrierSpaceUsageEvent";
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v7 = (void (*)(__CFString *, void))off_26AC32250;
  uint64_t v12 = off_26AC32250;
  if (!off_26AC32250)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v14 = __getAnalyticsSendEventSymbolLoc_block_invoke_0;
    v15 = &unk_2645E0D98;
    v16 = &v9;
    __getAnalyticsSendEventSymbolLoc_block_invoke_0((uint64_t)&buf);
    uint64_t v7 = (void (*)(__CFString *, void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v7)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v7(v6, MEMORY[0x263EFFA78]);
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (id)barGraphColors
{
  if (_MergedGlobals_58 != -1) {
    dispatch_once(&_MergedGlobals_58, &__block_literal_global_5);
  }
  v2 = (void *)qword_26AC32248;
  return v2;
}

void __49__PSUICarrierSpaceUsageController_barGraphColors__block_invoke()
{
  v7[5] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F825C8] colorWithRed:0.105882353 green:0.678431373 blue:0.97254902 alpha:1.0];
  v1 = objc_msgSend(MEMORY[0x263F825C8], "colorWithRed:green:blue:alpha:", 1.0, 0.8, 0.0, 1.0, v0);
  v7[1] = v1;
  v2 = [MEMORY[0x263F825C8] colorWithRed:0.8 green:0.450980392 blue:0.960784314 alpha:1.0];
  v7[2] = v2;
  BOOL v3 = [MEMORY[0x263F825C8] colorWithRed:1.0 green:0.584313725 blue:0.0 alpha:1.0];
  v7[3] = v3;
  int v4 = [MEMORY[0x263F825C8] colorWithRed:0.298039216 green:0.850980392 blue:0.392156863 alpha:1.0];
  v7[4] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:5];
  __int16 v6 = (void *)qword_26AC32248;
  qword_26AC32248 = v5;
}

- (id)usageCategories
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v19 = (id)objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = [(PSUICarrierSpaceUsageController *)self usageSections];
  uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(obj);
        }
        int v4 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v5 = v19;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (!v6)
        {

LABEL_18:
          v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v4, 0);
          [v5 addObject:v15];

          continue;
        }
        uint64_t v7 = v6;
        uint64_t v21 = i;
        char v22 = 0;
        uint64_t v8 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v7; ++j)
          {
            if (*(void *)v24 != v8) {
              objc_enumerationMutation(v5);
            }
            __int16 v10 = *(void **)(*((void *)&v23 + 1) + 8 * j);
            uint64_t v11 = [v10 objectAtIndexedSubscript:0];
            uint64_t v12 = [v11 accountMetrics];
            v13 = [v4 accountMetrics];
            int v14 = [v12 isEqual:v13];

            if (v14)
            {
              [v10 addObject:v4];
              char v22 = 1;
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v7);

        uint64_t i = v21;
        if ((v22 & 1) == 0) {
          goto LABEL_18;
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v20);
  }

  return v19;
}

- (id)usageSections
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  v61 = objc_opt_new();
  +[PSUICarrierSpaceManager sharedManager];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v55 = long long v85 = 0u;
  v2 = [v55 usageInfo];
  BOOL v3 = [v2 accountMetrics];

  obuint64_t j = v3;
  uint64_t v58 = [v3 countByEnumeratingWithState:&v82 objects:v91 count:16];
  if (v58)
  {
    uint64_t v57 = *(void *)v83;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v83 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v59 = v4;
        id v5 = *(void **)(*((void *)&v82 + 1) + 8 * v4);
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        v69 = v5;
        id v60 = [v5 applicablePlans];
        uint64_t v63 = [v60 countByEnumeratingWithState:&v78 objects:v90 count:16];
        if (v63)
        {
          uint64_t v62 = *(void *)v79;
          do
          {
            for (uint64_t i = 0; i != v63; ++i)
            {
              if (*(void *)v79 != v62) {
                objc_enumerationMutation(v60);
              }
              uint64_t v7 = *(void **)(*((void *)&v78 + 1) + 8 * i);
              uint64_t v8 = [v7 dataUsage];
              uint64_t v9 = [v8 sharedPlanIdentifier];

              __int16 v10 = [v7 dataUsage];
              uint64_t v11 = [v10 thisDeviceDataUsed];
              v68 = v7;
              uint64_t v12 = [v7 dataUsage];
              int64_t v13 = +[PSUICarrierSpaceManager bytesFromString:carrierSpaceUnits:](PSUICarrierSpaceManager, "bytesFromString:carrierSpaceUnits:", v11, [v12 units]);

              uint64_t v14 = [v69 networkUsageLabel];
              id v15 = objc_alloc(MEMORY[0x263F5FB10]);
              v16 = [v69 networkUsageLabel];
              uint64_t v17 = [MEMORY[0x263F825C8] greenColor];
              v66 = (void *)v14;
              v65 = (void *)[v15 initWithIdentifier:v16 title:v14 color:v17 bytes:v13];

              long long v76 = 0u;
              long long v77 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              id v18 = v61;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v74 objects:v89 count:16];
              if (!v19)
              {

                char v22 = 0;
                v34 = (void *)v14;
LABEL_32:
                v35 = v22;
                char v22 = objc_opt_new();

                if ([v69 localDevice])
                {
                  [v22 setSharedPlanIdentifier:v9];
                  [v22 setPrimaryMetrics:v68];
                }
                else
                {
                  v36 = [v22 otherMetrics];

                  if (!v36)
                  {
                    v37 = objc_opt_new();
                    [v22 setOtherMetrics:v37];
                  }
                  v38 = [v22 otherMetrics];
                  [v38 addObject:v68];
                }
                [v22 setAccountMetrics:v69];
                [v18 addObject:v22];
                goto LABEL_38;
              }
              uint64_t v20 = v19;
              uint64_t v64 = i;
              char v21 = 0;
              char v22 = 0;
              uint64_t v23 = *(void *)v75;
              do
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v75 != v23) {
                    objc_enumerationMutation(v18);
                  }
                  long long v25 = *(void **)(*((void *)&v74 + 1) + 8 * j);
                  long long v26 = [v25 sharedPlanIdentifier];
                  int v27 = [v9 isEqualToString:v26];

                  if (v27)
                  {
                    id v28 = v25;

                    if ([v69 localDevice])
                    {
                      long long v29 = [v28 primaryMetrics];

                      if (v29)
                      {
                        long long v30 = [(PSUICarrierSpaceUsageController *)self getLogger];
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)long long buf = 138412290;
                          v88 = v9;
                          _os_log_error_impl(&dword_221B17000, v30, OS_LOG_TYPE_ERROR, "More than one primary plan for shared plan identifier: %@", buf, 0xCu);
                        }
                      }
                      [v28 setPrimaryMetrics:v68];
                      [v28 setAccountMetrics:v69];
                    }
                    else
                    {
                      v31 = [v28 otherMetrics];

                      if (!v31)
                      {
                        v32 = objc_opt_new();
                        [v28 setOtherMetrics:v32];
                      }
                      uint64_t v33 = [v28 otherMetrics];
                      [v33 addObject:v68];
                    }
                    char v21 = 1;
                    char v22 = v28;
                  }
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v74 objects:v89 count:16];
              }
              while (v20);

              uint64_t i = v64;
              v34 = v66;
              if ((v21 & 1) == 0) {
                goto LABEL_32;
              }
LABEL_38:
              v39 = [v22 barCategories];

              if (!v39)
              {
                v40 = objc_opt_new();
                [v22 setBarCategories:v40];
              }
              v41 = [v22 barCategories];
              [v41 addObject:v65];
            }
            uint64_t v63 = [v60 countByEnumeratingWithState:&v78 objects:v90 count:16];
          }
          while (v63);
        }

        uint64_t v4 = v59 + 1;
      }
      while (v59 + 1 != v58);
      uint64_t v58 = [obj countByEnumeratingWithState:&v82 objects:v91 count:16];
    }
    while (v58);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v42 = v61;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v70 objects:v86 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v71;
    do
    {
      for (uint64_t k = 0; k != v44; ++k)
      {
        if (*(void *)v71 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v70 + 1) + 8 * k);
        v48 = [v47 primaryMetrics];
        if (v48)
        {
        }
        else
        {
          v49 = [v47 otherMetrics];
          uint64_t v50 = [v49 count];

          if (v50 == 1)
          {
            v51 = [v47 otherMetrics];
            v52 = [v51 objectAtIndexedSubscript:0];
            [v47 setPrimaryMetrics:v52];

            [v47 setOtherMetrics:0];
          }
        }
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v70 objects:v86 count:16];
    }
    while (v44);
  }

  v53 = (void *)[v42 copy];
  return v53;
}

- (id)deviceTypeSectionLabelForAccountMetrics:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 deviceType];
  switch(v5)
  {
    case 3:
      uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v7 = v6;
      uint64_t v8 = @"DEVICE_TYPE_APPLE_WATCH";
      goto LABEL_7;
    case 2:
      uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v7 = v6;
      uint64_t v8 = @"DEVICE_TYPE_IPAD";
      goto LABEL_7;
    case 1:
      uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v7 = v6;
      uint64_t v8 = @"DEVICE_TYPE_IPHONE";
LABEL_7:
      uint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];

      goto LABEL_11;
  }
  __int16 v10 = [(PSUICarrierSpaceUsageController *)self getLogger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "Using network usage label", v12, 2u);
  }

  uint64_t v9 = [v4 networkUsageLabel];
LABEL_11:

  return v9;
}

- (id)planCategorySectionLabelForPlanMetrics:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 planCategory];
  switch(v4)
  {
    case 3:
      uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      uint64_t v7 = @"PLAN_CATEGORY_INTERNATIONAL_ROAMING";
      goto LABEL_7;
    case 2:
      uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      uint64_t v7 = @"PLAN_CATEGORY_DOMESTIC_ROAMING";
      goto LABEL_7;
    case 1:
      uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v6 = v5;
      uint64_t v7 = @"PLAN_CATEGORY_DOMESTIC";
LABEL_7:
      uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];

      goto LABEL_9;
  }
  uint64_t v8 = [v3 planLabel];
LABEL_9:

  return v8;
}

- (BOOL)hasMultipleDevicesOfTheSameType
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = [(PSUICarrierSpaceUsageController *)self usageCategories];
  uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v25)
  {
    int v28 = 0;
    uint64_t v24 = *(void *)v34;
    unint64_t v4 = 0x263F08000uLL;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v5;
        uint64_t v6 = *(void **)(*((void *)&v33 + 1) + 8 * v5);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v27 = v6;
        uint64_t v7 = [v27 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v30 != v9) {
                objc_enumerationMutation(v27);
              }
              uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              uint64_t v12 = [v11 accountMetrics];
              int64_t v13 = [v12 networkUsageLabel];

              unint64_t v14 = v4;
              id v15 = *(void **)(v4 + 2584);
              v16 = [v11 accountMetrics];
              uint64_t v17 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "deviceType"));
              id v18 = [v3 objectForKeyedSubscript:v17];

              if (v18) {
                v28 |= [v18 isEqualToString:v13] ^ 1;
              }
              unint64_t v4 = v14;
              uint64_t v19 = *(void **)(v14 + 2584);
              uint64_t v20 = [v11 accountMetrics];
              char v21 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "deviceType"));
              [v3 setObject:v13 forKeyedSubscript:v21];
            }
            uint64_t v8 = [v27 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v8);
        }

        uint64_t v5 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v25);
  }
  else
  {
    LOBYTE(v28) = 0;
  }

  return v28 & 1;
}

- (BOOL)hasMultiplePlansOfTheSameTypeInTheSameSectionCategory
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = [(PSUICarrierSpaceUsageController *)self usageCategories];
  uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v24)
  {
    int v27 = 0;
    uint64_t v23 = *(void *)v33;
    unint64_t v2 = 0x263F08000uLL;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v3;
        unint64_t v4 = *(void **)(*((void *)&v32 + 1) + 8 * v3);
        uint64_t v5 = objc_opt_new();
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v26 = v4;
        uint64_t v6 = [v26 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v29 != v8) {
                objc_enumerationMutation(v26);
              }
              __int16 v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v11 = [v10 primaryMetrics];
              uint64_t v12 = [v11 planLabel];

              unint64_t v13 = v2;
              unint64_t v14 = *(void **)(v2 + 2584);
              id v15 = [v10 primaryMetrics];
              v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "planCategory"));
              uint64_t v17 = [v5 objectForKeyedSubscript:v16];

              if (v17) {
                v27 |= [v17 isEqualToString:v12] ^ 1;
              }
              unint64_t v2 = v13;
              id v18 = *(void **)(v13 + 2584);
              uint64_t v19 = [v10 primaryMetrics];
              uint64_t v20 = objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "planCategory"));
              [v5 setObject:v12 forKeyedSubscript:v20];
            }
            uint64_t v7 = [v26 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v7);
        }

        uint64_t v3 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v24);
  }
  else
  {
    LOBYTE(v27) = 0;
  }

  return v27 & 1;
}

- (BOOL)hasMultiplePlansOfSameTypeForNetworkUsageLabel:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    unint64_t v4 = objc_opt_new();
    +[PSUICarrierSpaceManager sharedManager];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v26 = v39 = 0u;
    uint64_t v5 = [v26 usageInfo];
    uint64_t v6 = [v5 accountMetrics];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      int v9 = 0;
      uint64_t v10 = *(void *)v37;
      uint64_t v27 = *(void *)v37;
      id v28 = v3;
      do
      {
        uint64_t v11 = 0;
        uint64_t v29 = v8;
        do
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * v11);
          unint64_t v13 = [v12 networkUsageLabel];
          int v14 = [v13 isEqualToString:v3];

          if (v14)
          {
            uint64_t v30 = v11;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            id v31 = [v12 applicablePlans];
            uint64_t v15 = [v31 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v33;
              do
              {
                for (uint64_t i = 0; i != v16; ++i)
                {
                  if (*(void *)v33 != v17) {
                    objc_enumerationMutation(v31);
                  }
                  uint64_t v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                  uint64_t v20 = [v19 planCategory];
                  char v21 = [v19 planLabel];
                  char v22 = [NSNumber numberWithInteger:v20];
                  uint64_t v23 = [v4 objectForKeyedSubscript:v22];

                  if (v23) {
                    v9 |= [v23 isEqualToString:v21] ^ 1;
                  }
                  uint64_t v24 = [NSNumber numberWithInteger:v20];
                  [v4 setObject:v21 forKeyedSubscript:v24];
                }
                uint64_t v16 = [v31 countByEnumeratingWithState:&v32 objects:v40 count:16];
              }
              while (v16);
            }

            uint64_t v10 = v27;
            id v3 = v28;
            uint64_t v8 = v29;
            uint64_t v11 = v30;
          }
          ++v11;
        }
        while (v11 != v8);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v8);
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9 & 1;
}

- (id)specifiers
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v93 = (int)*MEMORY[0x263F5FDB8];
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v5 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
    v99 = [v5 activeDataCarrierName];

    BOOL v98 = [(PSUICarrierSpaceUsageController *)self hasMultipleDevicesOfTheSameType];
    BOOL v100 = [(PSUICarrierSpaceUsageController *)self hasMultiplePlansOfTheSameTypeInTheSameSectionCategory];
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    obuint64_t j = [(PSUICarrierSpaceUsageController *)self usageCategories];
    uint64_t v96 = [obj countByEnumeratingWithState:&v113 objects:v120 count:16];
    if (!v96) {
      goto LABEL_83;
    }
    uint64_t v95 = *(void *)v114;
    uint64_t v106 = *MEMORY[0x263F600F8];
    v104 = v4;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v114 != v95) {
          objc_enumerationMutation(obj);
        }
        uint64_t v97 = v6;
        uint64_t v7 = *(void **)(*((void *)&v113 + 1) + 8 * v6);
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        id v103 = v7;
        uint64_t v8 = [v103 countByEnumeratingWithState:&v109 objects:v119 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v110;
          char v11 = 1;
          uint64_t v101 = *(void *)v110;
          do
          {
            uint64_t v12 = 0;
            uint64_t v102 = v9;
            do
            {
              if (*(void *)v110 != v10) {
                objc_enumerationMutation(v103);
              }
              unint64_t v13 = *(void **)(*((void *)&v109 + 1) + 8 * v12);
              int v14 = [v13 primaryMetrics];
              uint64_t v15 = [v13 accountMetrics];
              if ([(PSUICarrierSpaceUsageController *)self shouldShowPlanSection:v14])
              {
                uint64_t v16 = [(PSUICarrierSpaceUsageController *)self getLogger];
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t v118 = (uint64_t)v13;
                  _os_log_impl(&dword_221B17000, v16, OS_LOG_TYPE_DEFAULT, "Next Section: %@", buf, 0xCu);
                }

                v105 = v13;
                if (v11)
                {
                  uint64_t v17 = [v15 networkUsageLabel];
                  BOOL v18 = [(PSUICarrierSpaceUsageController *)self hasMultiplePlansOfSameTypeForNetworkUsageLabel:v17];

                  if (v18)
                  {
                    uint64_t v19 = [(PSUICarrierSpaceUsageController *)self getLogger];
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v20 = [v15 networkUsageLabel];
                      *(_DWORD *)long long buf = 138412290;
                      uint64_t v118 = (uint64_t)v20;
                      _os_log_impl(&dword_221B17000, v19, OS_LOG_TYPE_DEFAULT, "Multiple plans of same type for network usage label:%@, using plan label", buf, 0xCu);
                    }
                    goto LABEL_20;
                  }
                  if ([v13 isSharedPlan])
                  {
                    id v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    uint64_t v21 = [v28 localizedStringForKey:@"DEVICE_TYPE_SHARED" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];

                    char v22 = [(PSUICarrierSpaceUsageController *)self getLogger];
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)long long buf = 0;
                      uint64_t v23 = v22;
                      uint64_t v24 = "Section is shared plan";
                      goto LABEL_39;
                    }
                    goto LABEL_41;
                  }
                  if ([v15 localDevice])
                  {
                    uint64_t v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    uint64_t v30 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"THIS_DEVICE"];
                    uint64_t v21 = [v29 localizedStringForKey:v30 value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];

                    char v22 = [(PSUICarrierSpaceUsageController *)self getLogger];
                    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_41;
                    }
                    *(_WORD *)long long buf = 0;
                    uint64_t v23 = v22;
                    uint64_t v24 = "Using THIS_DEVICE name";
                    goto LABEL_39;
                  }
                  if (!v98)
                  {
                    uint64_t v21 = [(PSUICarrierSpaceUsageController *)self deviceTypeSectionLabelForAccountMetrics:v15];
                    char v22 = [(PSUICarrierSpaceUsageController *)self getLogger];
                    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_41;
                    }
                    *(_WORD *)long long buf = 0;
                    uint64_t v23 = v22;
                    uint64_t v24 = "Device type is not ambiguous, using device type";
                    goto LABEL_39;
                  }
                  uint64_t v21 = [v15 networkUsageLabel];
                  char v22 = [(PSUICarrierSpaceUsageController *)self getLogger];
                  if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_41;
                  }
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t v118 = (uint64_t)v15;
                  uint64_t v23 = v22;
                  uint64_t v24 = "Device type is ambiguous, using network usage label, account metrics: %@";
                  uint32_t v31 = 12;
                }
                else
                {
LABEL_20:
                  if (v100)
                  {
                    uint64_t v21 = [v14 planLabel];
                    char v22 = [(PSUICarrierSpaceUsageController *)self getLogger];
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)long long buf = 0;
                      uint64_t v23 = v22;
                      uint64_t v24 = "Plan type is ambiguous, using plan name";
                      goto LABEL_39;
                    }
                    goto LABEL_41;
                  }
                  uint64_t v25 = [v15 networkUsageLabel];
                  BOOL v26 = [(PSUICarrierSpaceUsageController *)self hasMultiplePlansOfSameTypeForNetworkUsageLabel:v25];

                  if (v26)
                  {
                    uint64_t v21 = [v14 planLabel];
                    char v22 = [(PSUICarrierSpaceUsageController *)self getLogger];
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v27 = [v15 networkUsageLabel];
                      *(_DWORD *)long long buf = 138412290;
                      uint64_t v118 = (uint64_t)v27;
                      _os_log_impl(&dword_221B17000, v22, OS_LOG_TYPE_DEFAULT, "Multiple same type plans for network usage label:%@, using plan name", buf, 0xCu);
                    }
                    goto LABEL_41;
                  }
                  uint64_t v21 = [(PSUICarrierSpaceUsageController *)self planCategorySectionLabelForPlanMetrics:v14];
                  char v22 = [(PSUICarrierSpaceUsageController *)self getLogger];
                  if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_41:

                    long long v32 = [(PSUICarrierSpaceUsageController *)self getLogger];
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      uint64_t v118 = v21;
                      _os_log_impl(&dword_221B17000, v32, OS_LOG_TYPE_DEFAULT, "Resolved group title: %@", buf, 0xCu);
                    }

                    v107 = (void *)v21;
                    long long v33 = [MEMORY[0x263F5FC40] groupSpecifierWithName:v21];
                    id v34 = objc_alloc_init(MEMORY[0x263F08790]);
                    [v34 setDoesRelativeDateFormatting:0];
                    [v34 setTimeStyle:1];
                    long long v35 = [v14 lastUpdatedAt];

                    v108 = v33;
                    if (v35)
                    {
                      long long v36 = [MEMORY[0x263EFF8F0] currentCalendar];
                      long long v37 = [v14 lastUpdatedAt];
                      int v38 = [v36 isDateInToday:v37];

                      if (v38)
                      {
                        [v34 setDateStyle:0];
                        long long v39 = [v14 lastUpdatedAt];
                        v40 = [v34 stringFromDate:v39];

                        v41 = NSString;
                        uint64_t v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                        uint64_t v43 = v42;
                        uint64_t v44 = @"LAST_UPDATE_FROM_CARRIER_%@_AT_%@";
                      }
                      else
                      {
                        [v34 setDateStyle:2];
                        v46 = [v14 lastUpdatedAt];
                        v40 = [v34 stringFromDate:v46];

                        v41 = NSString;
                        uint64_t v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                        uint64_t v43 = v42;
                        uint64_t v44 = @"LAST_UPDATE_FROM_CARRIER_%@_ON_%@";
                      }
                      v47 = [v42 localizedStringForKey:v44 value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
                      objc_msgSend(v41, "stringWithFormat:", v47, v99, v40);
                      id v45 = (id)objc_claimAutoreleasedReturnValue();

                      long long v33 = v108;
                      [v108 setProperty:v45 forKey:v106];
                    }
                    else
                    {
                      id v45 = 0;
                    }
                    v48 = [v15 billingCycleEndDate];

                    if (v48)
                    {
                      v49 = [MEMORY[0x263EFF8F0] currentCalendar];
                      uint64_t v50 = [v15 billingCycleEndDate];
                      int v51 = [v49 isDateInToday:v50];

                      if (v51)
                      {
                        [v34 setDateStyle:0];
                        v52 = [v15 billingCycleEndDate];
                        v53 = [v34 stringFromDate:v52];

                        v54 = NSString;
                        v55 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                        v56 = v55;
                        uint64_t v57 = @"BILLING_CYCLE_ENDS_AT_%@";
                      }
                      else
                      {
                        [v34 setDateStyle:2];
                        uint64_t v58 = [v15 billingCycleEndDate];
                        v53 = [v34 stringFromDate:v58];

                        v54 = NSString;
                        v55 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                        v56 = v55;
                        uint64_t v57 = @"BILLING_CYCLE_ENDS_ON_%@";
                      }
                      uint64_t v59 = [v55 localizedStringForKey:v57 value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
                      id v60 = objc_msgSend(v54, "stringWithFormat:", v59, v53);

                      if (v45)
                      {
                        uint64_t v61 = [NSString stringWithFormat:@"%@\n%@", v45, v60];

                        id v45 = (id)v61;
                      }
                      else
                      {
                        id v45 = v60;
                      }
                      id v4 = v104;
                      long long v33 = v108;
                      [v108 setProperty:v45 forKey:v106];
                    }
                    [v4 addObject:v33];
                    if ([(PSUICarrierSpaceUsageController *)self shouldShowData:v14])
                    {
                      uint64_t v62 = [v14 dataUsage];
                      uint64_t v63 = [v62 thisDeviceDataUsed];
                      int v64 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v63];

                      v65 = [v14 dataUsage];
                      v66 = [v65 capacity];
                      int v67 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v66];

                      if (v64 == 1 && v67 == 1)
                      {
                        v68 = [(PSUICarrierSpaceUsageController *)self usageGraphSpecifierForSection:v105];
                        id v4 = v104;
                        [v104 addObject:v68];
                      }
                      else
                      {
                        BOOL v69 = [(PSUICarrierSpaceUsageController *)self shouldShowOnlyRemainingData:v14];
                        long long v70 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                        long long v71 = v70;
                        if (v69) {
                          long long v72 = @"REMAINING_DATA";
                        }
                        else {
                          long long v72 = @"DATA";
                        }
                        v68 = [v70 localizedStringForKey:v72 value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];

                        long long v73 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v68 target:self set:0 get:sel_dataUsageDescription_ detail:0 cell:4 edit:0];
                        [v73 setProperty:v14 forKey:@"PSUICarrierSpaceMetricsKey"];
                        id v4 = v104;
                        [v104 addObject:v73];
                      }
                      long long v33 = v108;
                    }
                    if ([(PSUICarrierSpaceUsageController *)self shouldShowCalls:v14])
                    {
                      BOOL v74 = [(PSUICarrierSpaceUsageController *)self shouldShowOnlyRemainingCalls:v14];
                      long long v75 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                      long long v76 = v75;
                      if (v74) {
                        long long v77 = @"REMAINING_CALLS";
                      }
                      else {
                        long long v77 = @"CALLS";
                      }
                      long long v78 = [v75 localizedStringForKey:v77 value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];

                      long long v79 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v78 target:self set:0 get:sel_callsDescription_ detail:0 cell:4 edit:0];
                      [v79 setProperty:v14 forKey:@"PSUICarrierSpaceMetricsKey"];
                      [v4 addObject:v79];
                    }
                    if ([(PSUICarrierSpaceUsageController *)self shouldShowMessages:v14])
                    {
                      BOOL v80 = [(PSUICarrierSpaceUsageController *)self shouldShowOnlyRemainingMessages:v14];
                      long long v81 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                      long long v82 = v81;
                      if (v80) {
                        long long v83 = @"REMAINING_MESSAGES";
                      }
                      else {
                        long long v83 = @"MESSAGES";
                      }
                      long long v84 = [v81 localizedStringForKey:v83 value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];

                      long long v85 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v84 target:self set:0 get:sel_messagesDescription_ detail:0 cell:4 edit:0];
                      [v85 setProperty:v14 forKey:@"PSUICarrierSpaceMetricsKey"];
                      [v4 addObject:v85];
                    }
                    if ([(PSUICarrierSpaceUsageController *)self shouldShowRemainingCredit:v14])
                    {
                      v86 = (void *)MEMORY[0x263F5FC40];
                      v87 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                      [v87 localizedStringForKey:@"REMAINING_CREDIT" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
                      v89 = v88 = v15;
                      v90 = [v86 preferenceSpecifierNamed:v89 target:self set:0 get:sel_remainingCreditDescription_ detail:0 cell:4 edit:0];

                      uint64_t v15 = v88;
                      long long v33 = v108;

                      [v90 setProperty:v14 forKey:@"PSUICarrierSpaceMetricsKey"];
                      [v4 addObject:v90];
                    }
                    char v11 = 0;
                    uint64_t v10 = v101;
                    uint64_t v9 = v102;
                    goto LABEL_79;
                  }
                  *(_WORD *)long long buf = 0;
                  uint64_t v23 = v22;
                  uint64_t v24 = "Plan type is not ambiguous, using plan type";
LABEL_39:
                  uint32_t v31 = 2;
                }
                _os_log_impl(&dword_221B17000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v31);
                goto LABEL_41;
              }
LABEL_79:

              ++v12;
            }
            while (v9 != v12);
            uint64_t v9 = [v103 countByEnumeratingWithState:&v109 objects:v119 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v97 + 1;
      }
      while (v97 + 1 != v96);
      uint64_t v96 = [obj countByEnumeratingWithState:&v113 objects:v120 count:16];
      if (!v96)
      {
LABEL_83:

        [MEMORY[0x263F67F00] logSpecifiers:v4 origin:@"[PSUICarrierSpaceUsageController specifiers] end"];
        v91 = *(Class *)((char *)&self->super.super.super.super.super.isa + v93);
        *(Class *)((char *)&self->super.super.super.super.super.isa + v93) = (Class)v4;

        id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v93);
        break;
      }
    }
  }
  return v3;
}

- (id)usageGraphSpecifierForSection:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 primaryMetrics];
  uint64_t v58 = objc_opt_new();
  v54 = self;
  uint64_t v6 = [(PSUICarrierSpaceUsageController *)self barGraphColors];
  unint64_t v7 = [v6 count];

  uint64_t v8 = [v5 dataUsage];
  uint64_t v9 = [v8 thisDeviceDataUsed];
  uint64_t v10 = [v5 dataUsage];
  int64_t v11 = +[PSUICarrierSpaceManager bytesFromString:carrierSpaceUnits:](PSUICarrierSpaceManager, "bytesFromString:carrierSpaceUnits:", v9, [v10 units]);

  uint64_t v12 = [v5 dataUsage];
  unint64_t v13 = [v12 sharedDataUsed];
  int v14 = [v5 dataUsage];
  int64_t v15 = +[PSUICarrierSpaceManager bytesFromString:carrierSpaceUnits:](PSUICarrierSpaceManager, "bytesFromString:carrierSpaceUnits:", v13, [v14 units]);

  uint64_t v16 = [v5 dataUsage];
  uint64_t v17 = [v16 capacity];
  BOOL v18 = [v5 dataUsage];
  int64_t v57 = +[PSUICarrierSpaceManager bytesFromString:carrierSpaceUnits:](PSUICarrierSpaceManager, "bytesFromString:carrierSpaceUnits:", v17, [v18 units]);

  int v51 = v5;
  uint64_t v19 = [v5 dataUsage];
  uint64_t v20 = [v19 sharedDataUsed];
  if ([v20 length]) {
    int64_t v21 = v15;
  }
  else {
    int64_t v21 = v11;
  }

  [MEMORY[0x263F825C8] systemRedColor];
  uint64_t v53 = v52 = v4;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = [v4 barCategories];
  uint64_t v22 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    unint64_t v24 = 0;
    int64_t v25 = 0;
    uint64_t v26 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v60 != v26) {
          objc_enumerationMutation(obj);
        }
        id v28 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        if (v21 <= v57)
        {
          [(PSUICarrierSpaceUsageController *)v54 barGraphColors];
          v30 = int64_t v29 = v21;
          uint32_t v31 = [v30 objectAtIndexedSubscript:v24];
          [v28 setColor:v31];

          int64_t v21 = v29;
        }
        else
        {
          [*(id *)(*((void *)&v59 + 1) + 8 * i) setColor:v53];
        }
        [v58 addObject:v28];
        unint64_t v24 = (v24 + 1) % v7;
        v25 += [v28 bytes];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v23);
  }
  else
  {
    unint64_t v24 = 0;
    int64_t v25 = 0;
  }

  long long v32 = objc_opt_new();
  [v32 setCapacity:v57];
  [v32 setBytesUsed:v21];
  [v32 setSortStyle:0];
  [v32 setCategories:v58];
  BOOL v33 = (unint64_t)[v58 count] < 2;
  if (v21 > v57) {
    BOOL v33 = 1;
  }
  BOOL obja = v33;
  BOOL v34 = v21 > v25;
  int64_t v35 = v21;
  long long v36 = (void *)MEMORY[0x263F5FB18];
  long long v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v38 = [v37 localizedStringForKey:@"DATA" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
  long long v39 = [v36 specifierWithTitle:v38 useStandardFontSizeForSizeLabel:1];

  [v39 setProperty:v51 forKey:@"PSUICarrierSpaceMetricsKey"];
  v40 = [MEMORY[0x263F825C8] clearColor];
  [v39 setProperty:v40 forKey:*MEMORY[0x263F5FFB0]];

  v41 = [NSNumber numberWithBool:v34];
  [v39 setProperty:v41 forKey:*MEMORY[0x263F5FFB8]];

  uint64_t v42 = [NSNumber numberWithInt:obja];
  [v39 setProperty:v42 forKey:*MEMORY[0x263F5FF88]];

  if (v35 <= v57)
  {
    uint64_t v44 = v54;
    id v45 = [(PSUICarrierSpaceUsageController *)v54 barGraphColors];
    v46 = [v45 objectAtIndexedSubscript:v24];
    [v39 setProperty:v46 forKey:*MEMORY[0x263F5FFA0]];

    uint64_t v43 = (void *)v53;
  }
  else
  {
    uint64_t v43 = (void *)v53;
    [v39 setProperty:v53 forKey:*MEMORY[0x263F5FFA0]];
    uint64_t v44 = v54;
  }
  v47 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v48 = [v47 localizedStringForKey:@"OTHER" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
  [v39 setProperty:v48 forKey:*MEMORY[0x263F5FFA8]];

  v49 = [(PSUICarrierSpaceUsageController *)v44 dataUsageDescription:v39];
  [v39 setProperty:v49 forKey:*MEMORY[0x263F5FFC0]];

  [v39 setProperty:v32 forKey:*MEMORY[0x263F5FF80]];
  return v39;
}

- (BOOL)shouldShowPlanSection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PSUICarrierSpaceUsageController *)self shouldShowData:v4]
    || [(PSUICarrierSpaceUsageController *)self shouldShowCalls:v4]
    || [(PSUICarrierSpaceUsageController *)self shouldShowMessages:v4]
    || [(PSUICarrierSpaceUsageController *)self shouldShowRemainingCredit:v4];

  return v5;
}

- (BOOL)shouldShowData:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dataUsage];
  BOOL v5 = [v4 thisDeviceDataUsed];
  uint64_t v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v5];

  unint64_t v7 = [v3 dataUsage];

  uint64_t v8 = [v7 capacity];
  uint64_t v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v8];

  if (+[PSUICarrierSpaceManager isCarrierMetricTypeValid:v6])
  {
    return 1;
  }
  return +[PSUICarrierSpaceManager isCarrierMetricTypeValid:v9];
}

- (BOOL)shouldShowOnlyRemainingData:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dataUsage];
  BOOL v5 = [v4 thisDeviceDataUsed];
  int v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v5];

  unint64_t v7 = [v3 dataUsage];

  uint64_t v8 = [v7 capacity];
  int v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v8];

  return !v6 && v9 == 1;
}

- (id)dataUsageDescription:(id)a3
{
  id v3 = [a3 propertyForKey:@"PSUICarrierSpaceMetricsKey"];
  id v4 = +[PSUICarrierSpaceManager sharedManager];
  BOOL v5 = [v4 descriptionForPlanMetrics:v3];

  return v5;
}

- (BOOL)shouldShowCalls:(id)a3
{
  id v3 = a3;
  id v4 = [v3 voice];
  BOOL v5 = [v4 minutesUsed];
  uint64_t v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v5];

  unint64_t v7 = [v3 voice];

  uint64_t v8 = [v7 minutesCapacity];
  uint64_t v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v8];

  if (+[PSUICarrierSpaceManager isCarrierMetricTypeValid:v6])
  {
    return 1;
  }
  return +[PSUICarrierSpaceManager isCarrierMetricTypeValid:v9];
}

- (BOOL)shouldShowOnlyRemainingCalls:(id)a3
{
  id v3 = a3;
  id v4 = [v3 voice];
  BOOL v5 = [v4 minutesUsed];
  int v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v5];

  unint64_t v7 = [v3 voice];

  uint64_t v8 = [v7 minutesCapacity];
  int v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v8];

  return !v6 && v9 == 1;
}

- (id)callsDescription:(id)a3
{
  id v3 = [a3 propertyForKey:@"PSUICarrierSpaceMetricsKey"];
  id v4 = [v3 voice];
  BOOL v5 = [v4 minutesCapacity];
  int v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v5];

  unint64_t v7 = [v3 voice];
  uint64_t v8 = [v7 minutesUsed];
  int v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v8];

  if (v6 != 1)
  {
    if (v6 == 2)
    {
      uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int64_t v11 = [v10 localizedStringForKey:@"UNLIMITED" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
      goto LABEL_10;
    }
    uint64_t v12 = NSString;
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v14 = [v10 localizedStringForKey:@"%@_MINUTES" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
    int64_t v15 = [v3 voice];
    uint64_t v19 = [v15 minutesUsed];
    goto LABEL_8;
  }
  uint64_t v12 = NSString;
  unint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = v13;
  if (v9 != 1)
  {
    int v14 = [v13 localizedStringForKey:@"%@_MINUTES" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
    int64_t v15 = [v3 voice];
    uint64_t v19 = [v15 minutesCapacity];
LABEL_8:
    uint64_t v16 = (void *)v19;
    int64_t v11 = objc_msgSend(v12, "stringWithFormat:", v14, v19);
    goto LABEL_9;
  }
  int v14 = [v13 localizedStringForKey:@"USED_%@_OF_%@_MINUTES" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
  int64_t v15 = [v3 voice];
  uint64_t v16 = [v15 minutesUsed];
  uint64_t v17 = [v3 voice];
  BOOL v18 = [v17 minutesCapacity];
  int64_t v11 = objc_msgSend(v12, "stringWithFormat:", v14, v16, v18);

LABEL_9:
LABEL_10:

  return v11;
}

- (BOOL)shouldShowMessages:(id)a3
{
  id v3 = a3;
  id v4 = [v3 messages];
  BOOL v5 = [v4 used];
  uint64_t v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v5];

  unint64_t v7 = [v3 messages];

  uint64_t v8 = [v7 capacity];
  uint64_t v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v8];

  if (+[PSUICarrierSpaceManager isCarrierMetricTypeValid:v6])
  {
    return 1;
  }
  return +[PSUICarrierSpaceManager isCarrierMetricTypeValid:v9];
}

- (BOOL)shouldShowOnlyRemainingMessages:(id)a3
{
  id v3 = a3;
  id v4 = [v3 messages];
  BOOL v5 = [v4 used];
  int v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v5];

  unint64_t v7 = [v3 messages];

  uint64_t v8 = [v7 capacity];
  int v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v8];

  return !v6 && v9 == 1;
}

- (id)messagesDescription:(id)a3
{
  id v3 = [a3 propertyForKey:@"PSUICarrierSpaceMetricsKey"];
  id v4 = [v3 messages];
  BOOL v5 = [v4 capacity];
  int v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v5];

  unint64_t v7 = [v3 messages];
  uint64_t v8 = [v7 used];
  int v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:v8];

  if (v6 != 1)
  {
    if (v6 == 2)
    {
      uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int64_t v11 = [v10 localizedStringForKey:@"UNLIMITED" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
      goto LABEL_10;
    }
    uint64_t v12 = NSString;
    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v14 = [v10 localizedStringForKey:@"%@_MESSAGES" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
    int64_t v15 = [v3 messages];
    uint64_t v19 = [v15 used];
    goto LABEL_8;
  }
  uint64_t v12 = NSString;
  unint64_t v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v10 = v13;
  if (v9 != 1)
  {
    int v14 = [v13 localizedStringForKey:@"%@_MESSAGES" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
    int64_t v15 = [v3 messages];
    uint64_t v19 = [v15 capacity];
LABEL_8:
    uint64_t v16 = (void *)v19;
    int64_t v11 = objc_msgSend(v12, "stringWithFormat:", v14, v19);
    goto LABEL_9;
  }
  int v14 = [v13 localizedStringForKey:@"USED_%@_OF_%@_MESSAGES" value:&stru_26D410CA0 table:@"CarrierSpaceUsage"];
  int64_t v15 = [v3 messages];
  uint64_t v16 = [v15 used];
  uint64_t v17 = [v3 messages];
  BOOL v18 = [v17 capacity];
  int64_t v11 = objc_msgSend(v12, "stringWithFormat:", v14, v16, v18);

LABEL_9:
LABEL_10:

  return v11;
}

- (BOOL)shouldShowRemainingCredit:(id)a3
{
  id v3 = [a3 remainingBalance];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)remainingCreditDescription:(id)a3
{
  id v3 = [a3 propertyForKey:@"PSUICarrierSpaceMetricsKey"];
  BOOL v4 = [v3 remainingBalance];

  return v4;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CarrierSpaceUsageController"];
}

@end