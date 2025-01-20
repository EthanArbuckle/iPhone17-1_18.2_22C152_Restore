@interface SHSDualSIMToneHelper
+ (BOOL)alertTypeSupportsSIMBasedToneCustomization:(int64_t)a3;
+ (BOOL)hasMultipleCTSubscriptionsInUse;
+ (BOOL)shouldShowSIMBasedToneCustomizationForAlertType:(int64_t)a3;
+ (id)fetchCTSubscriptionsInUse;
+ (id)fetchLocalizedPhoneNumberForContext:(id)a3;
+ (id)fetchShortLabelForContext:(id)a3;
+ (void)fetchCTSubscriptionsInUse;
@end

@implementation SHSDualSIMToneHelper

+ (id)fetchCTSubscriptionsInUse
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = _SHSCTClient();
  id v19 = 0;
  v3 = [v2 getSubscriptionInfoWithError:&v19];
  id v4 = v19;

  v5 = SHSLogForCategory(0);
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SHSDualSIMToneHelper fetchCTSubscriptionsInUse];
    }
    id v7 = 0;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v3 subscriptionsInUse];
      *(_DWORD *)buf = 136315394;
      v22 = "+[SHSDualSIMToneHelper fetchCTSubscriptionsInUse]";
      __int16 v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_237305000, v6, OS_LOG_TYPE_DEFAULT, "%s: Received subscriptionsInUse: %@", buf, 0x16u);
    }
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = objc_msgSend(v3, "subscriptionsInUse", 0);
    uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v6);
          }
          v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (([v13 isSimHidden] & 1) == 0 && (objc_msgSend(v13, "isSimDataOnly") & 1) == 0) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }

  return v7;
}

+ (id)fetchShortLabelForContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = _SHSCTClient();
  id v10 = 0;
  v5 = [v4 getShortLabel:v3 error:&v10];
  id v6 = v10;

  id v7 = 0;
  if (!v6)
  {
    v8 = SHSLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "+[SHSDualSIMToneHelper fetchShortLabelForContext:]";
      __int16 v13 = 2112;
      v14 = v5;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_237305000, v8, OS_LOG_TYPE_DEFAULT, "%s: Received shortLabel: %@ for Context: %@", buf, 0x20u);
    }

    id v7 = v5;
  }

  return v7;
}

+ (id)fetchLocalizedPhoneNumberForContext:(id)a3
{
  id v3 = a3;
  id v4 = _SHSCTClient();
  id v45 = 0;
  v5 = [v4 getPhoneNumber:v3 error:&v45];
  id v6 = v45;

  if (v5)
  {
    id v7 = [v5 number];
    if (!v7)
    {
      v8 = SHSLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[SHSDualSIMToneHelper fetchLocalizedPhoneNumberForContext:].cold.4(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      id v16 = &stru_26EA42AA8;
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v17 = SHSLogForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[SHSDualSIMToneHelper fetchLocalizedPhoneNumberForContext:]((uint64_t)v6, v17);
    }

    id v7 = 0;
  }
  v8 = v7;
  long long v18 = _SHSCTClient();
  uint64_t v44 = 0;
  id v19 = [v18 getMobileSubscriberHomeCountryList:v3 error:&v44];
  uint64_t v20 = v44;

  v21 = &stru_26EA42AA8;
  if (!v20)
  {
    v21 = [v19 firstObject];
  }
  uint64_t v22 = CFPhoneNumberCreate();
  if (v22)
  {
    __int16 v23 = (const void *)v22;
    String = (__CFString *)CFPhoneNumberCreateString();

    if (!String)
    {
      uint64_t v25 = SHSLogForCategory(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[SHSDualSIMToneHelper fetchLocalizedPhoneNumberForContext:](v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
    CFRelease(v23);
  }
  else
  {
    v33 = SHSLogForCategory(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      +[SHSDualSIMToneHelper fetchLocalizedPhoneNumberForContext:](v33, v34, v35, v36, v37, v38, v39, v40);
    }

    String = (__CFString *)v8;
  }
  uint64_t v41 = [(__CFString *)String length];
  if (v8) {
    v42 = (__CFString *)v8;
  }
  else {
    v42 = &stru_26EA42AA8;
  }
  if (v41) {
    v42 = String;
  }
  id v16 = v42;

LABEL_26:
  return v16;
}

+ (BOOL)shouldShowSIMBasedToneCustomizationForAlertType:(int64_t)a3
{
  int v4 = [a1 alertTypeSupportsSIMBasedToneCustomization:a3];
  if (v4)
  {
    LOBYTE(v4) = [a1 hasMultipleCTSubscriptionsInUse];
  }
  return v4;
}

+ (BOOL)hasMultipleCTSubscriptionsInUse
{
  v2 = [a1 fetchCTSubscriptionsInUse];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

+ (BOOL)alertTypeSupportsSIMBasedToneCustomization:(int64_t)a3
{
  return a3 == 1;
}

+ (void)fetchCTSubscriptionsInUse
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  BOOL v3 = "+[SHSDualSIMToneHelper fetchCTSubscriptionsInUse]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_237305000, a2, OS_LOG_TYPE_ERROR, "%s Error: %@", (uint8_t *)&v2, 0x16u);
}

+ (void)fetchLocalizedPhoneNumberForContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)fetchLocalizedPhoneNumberForContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)fetchLocalizedPhoneNumberForContext:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  BOOL v3 = "+[SHSDualSIMToneHelper fetchLocalizedPhoneNumberForContext:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_237305000, a2, OS_LOG_TYPE_ERROR, "getPhoneNumber:error: in %s failed: %{public}@", (uint8_t *)&v2, 0x16u);
}

+ (void)fetchLocalizedPhoneNumberForContext:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_237305000, a1, a3, "getPhoneNumber:error: in %s returned nil displayPhoneNumber", a5, a6, a7, a8, 2u);
}

@end