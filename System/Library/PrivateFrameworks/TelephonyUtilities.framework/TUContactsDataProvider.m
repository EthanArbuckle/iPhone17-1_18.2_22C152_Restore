@interface TUContactsDataProvider
+ (id)defaultContactKeyDescriptors;
+ (id)familyNameFirstLocaleCountryCodes;
+ (id)keysByCombiningDefaultKeysWithKeysToFetch:(id)a3;
+ (id)numberFormatter;
+ (id)unsupportedLocalesForPrefixHint;
- (BOOL)isHandleEligibleForScreenSharingRequests:(id)a3;
- (BOOL)shouldIgnoreHandle:(id)a3 withFetchRequest:(id)a4;
- (BOOL)shouldUseFamilyNameFirst;
- (BOOL)shouldUseGivenName;
- (NSDate)deviceSetupDate;
- (NSUserDefaults)userDefaults;
- (TUContactsDataProvider)init;
- (TUContactsDataProvider)initWithContactsDataSource:(id)a3;
- (TUContactsDataProviderAppleCareHandles)appleCareHandles;
- (TUContactsDataSource)contactsDataSource;
- (id)ISOCountryCodeForHandle:(id)a3 fetchRequest:(id)a4;
- (id)compositeNameForContacts:(id)a3;
- (id)compositeNameForFetchRequest:(id)a3;
- (id)contactLabelForContacts:(id)a3 matchingHandle:(id)a4 countryCode:(id)a5;
- (id)contactWithIdentifier:(id)a3 keysToFetch:(id)a4;
- (id)contactsForHandle:(id)a3 countryCode:(id)a4 keysToFetch:(id)a5 prefixHint:(id)a6;
- (id)executeBatchFetchRequests:(id)a3;
- (id)executeFetchRequest:(id)a3;
- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4;
- (id)getDeviceSetupDate;
- (id)labeledHandlesForContactWithIdentifier:(id)a3;
- (id)labeledHandlesForContacts:(id)a3;
- (id)localeSupportsPrefixHintForFetchRequest;
- (id)localizedCompositeNameForContact:(id)a3 secondContact:(id)a4;
- (id)nameForContact:(id)a3;
- (id)prefixHintForFetchRequest:(id)a3;
- (id)processBatchFetchRequests:(id)a3;
- (id)resultForSingleHandleFetchRequest:(id)a3 fetchedContacts:(id)a4;
- (id)unifiedContactsForFetchRequest:(id)a3;
- (int)personIDForContact:(id)a3;
- (void)setAppleCareHandles:(id)a3;
- (void)setDeviceSetupDate:(id)a3;
- (void)setLocaleSupportsPrefixHintForFetchRequest:(id)a3;
- (void)setUseFamilyNameFirst:(BOOL)a3;
- (void)setUseGivenName:(BOOL)a3;
- (void)setUserDefaults:(id)a3;
@end

@implementation TUContactsDataProvider

- (TUContactsDataProvider)init
{
  v3 = objc_msgSend(MEMORY[0x1E4F1B980], "tu_contactStore");
  v4 = [(TUContactsDataProvider *)self initWithContactsDataSource:v3];

  return v4;
}

- (TUContactsDataProvider)initWithContactsDataSource:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TUContactsDataProvider;
  v6 = [(TUContactsDataProvider *)&v25 init];
  if (v6)
  {
    v7 = TUDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[TUContactsDataProvider initWithContactsDataSource:]((uint64_t)v5, v7);
    }

    objc_storeStrong((id *)&v6->_contactsDataSource, a3);
    v8 = [(id)objc_opt_class() familyNameFirstLocaleCountryCodes];
    v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    v10 = [v9 countryCode];
    v11 = [v10 lowercaseString];
    v6->_useFamilyNameFirst = [v8 containsObject:v11];

    objc_initWeak(&location, v6);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __53__TUContactsDataProvider_initWithContactsDataSource___block_invoke;
    v22 = &unk_1E58E6F30;
    objc_copyWeak(&v23, &location);
    v12 = _Block_copy(&v19);
    id localeSupportsPrefixHintForFetchRequest = v6->_localeSupportsPrefixHintForFetchRequest;
    v6->_id localeSupportsPrefixHintForFetchRequest = v12;

    v14 = objc_alloc_init(TUContactsDataProviderAppleCareHandles);
    appleCareHandles = v6->_appleCareHandles;
    v6->_appleCareHandles = v14;

    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CB18], "tu_defaults", v19, v20, v21, v22);
    userDefaults = v6->_userDefaults;
    v6->_userDefaults = (NSUserDefaults *)v16;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __53__TUContactsDataProvider_initWithContactsDataSource___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 useNetworkCountryCode])
  {
    v3 = TUNetworkCountryCode();
    v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      TUHomeCountryCode();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    v6 = TUHomeCountryCode();
    if (!v6)
    {
LABEL_8:
      v7 = [MEMORY[0x1E4F1CA20] currentLocale];
      v8 = [v7 countryCode];
      v6 = [v8 lowercaseString];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = [(id)objc_opt_class() unsupportedLocalesForPrefixHint];
  uint64_t v11 = [v10 containsObject:v6] ^ 1;

  return v11;
}

- (id)processBatchFetchRequests:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v33 = [MEMORY[0x1E4F1CA48] array];
  v6 = [MEMORY[0x1E4F1CA48] array];
  v32 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
        v13 = [v12 handles];
        uint64_t v14 = [v13 count];

        if (v14 != 1)
        {
          v15 = [NSString stringWithFormat:@"Fetch request does not contain exactly one handle %@", v12];
          NSLog(&cfstr_TuassertionFai.isa, v15);

          if (_TUAssertShouldCrashApplication())
          {
            uint64_t v16 = [v12 handles];
            uint64_t v17 = [v16 count];

            if (v17 != 1)
            {
              id v23 = [MEMORY[0x1E4F28B00] currentHandler];
              [v23 handleFailureInMethod:a2, self, @"TUContactsDataProvider.m", 99, @"Fetch request does not contain exactly one handle %@", v12 object file lineNumber description];
            }
          }
        }
        [v12 removePsuedHandles];
        v18 = [v12 handles];
        uint64_t v19 = [v18 firstObject];

        if (!v19)
        {
          v21 = TUDefaultLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v12;
            _os_log_error_impl(&dword_19C496000, v21, OS_LOG_TYPE_ERROR, "Fetch request did not contain any handles or only contained one pseudonym handle: %@ ", buf, 0xCu);
          }
          goto LABEL_17;
        }
        [v5 setObject:v12 forKeyedSubscript:v19];
        [v6 addObject:v19];
        if ([(TUContactsDataProvider *)self shouldIgnoreHandle:v19 withFetchRequest:v12])
        {
          uint64_t v20 = TUDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v19;
            _os_log_impl(&dword_19C496000, v20, OS_LOG_TYPE_DEFAULT, "Not looking up contact for %@ because it is in our apple care handles", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v22 = [v19 type];
          if ((unint64_t)(v22 - 2) >= 2)
          {
            if (v22 == 1)
            {
              v21 = [(TUContactsDataProvider *)self executeFetchRequest:v12];
              [v32 setObject:v21 forKeyedSubscript:v19];
LABEL_17:
            }
          }
          else
          {
            [v33 addObject:v19];
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v9);
  }

  v24 = [TUBatchFetchRequestProcessingResult alloc];
  objc_super v25 = (void *)[v5 copy];
  v26 = (void *)[v33 copy];
  v27 = (void *)[v6 copy];
  v28 = (void *)[v32 copy];
  v29 = [(TUBatchFetchRequestProcessingResult *)v24 initWithHandleToFetchRequest:v25 handlesToBatchFetch:v26 allHandlesFromFetchRequests:v27 fetchRequestResults:v28];

  return v29;
}

- (id)executeBatchFetchRequests:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(TUContactsDataProvider *)self processBatchFetchRequests:v4];
    v6 = [v5 fetchRequestResults];
    v30 = (void *)[v6 mutableCopy];

    id v7 = objc_opt_class();
    id v27 = v4;
    uint64_t v8 = [v4 firstObject];
    uint64_t v9 = [v8 auxiliaryKeysToFetch];
    uint64_t v10 = [v7 keysByCombiningDefaultKeysWithKeysToFetch:v9];

    v29 = self;
    uint64_t v11 = [(TUContactsDataProvider *)self contactsDataSource];
    v12 = [v5 handlesToBatchFetch];
    v26 = (void *)v10;
    v13 = objc_msgSend(v11, "tu_contactsForHandles:keyDescriptors:error:", v12, v10, 0);

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v14 = v5;
    id obj = [v5 allHandlesFromFetchRequests];
    uint64_t v15 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v20 = [v13 objectForKeyedSubscript:v19];
          if (!v20)
          {
            uint64_t v20 = [MEMORY[0x1E4F1C978] array];
          }
          v21 = [v14 handleToFetchRequest];
          uint64_t v22 = [v21 objectForKeyedSubscript:v19];
          id v23 = [(TUContactsDataProvider *)v29 resultForSingleHandleFetchRequest:v22 fetchedContacts:v20];
          [v30 setObject:v23 forKeyedSubscript:v19];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v16);
    }

    v24 = (void *)[v30 copy];
    id v4 = v27;
  }
  else
  {
    v24 = [MEMORY[0x1E4F1C9E8] dictionary];
  }

  return v24;
}

- (id)executeFetchRequest:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v87 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Executing fetch request: %@", buf, 0xCu);
  }

  v6 = objc_alloc_init(TUContactsDataProviderResult);
  [v4 removePsuedHandles];
  if ([v4 isConversation])
  {
    id v7 = [v4 handles];
    unint64_t v8 = [v7 count];

    if (v8 >= 2)
    {
      v62 = v6;
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      v63 = [MEMORY[0x1E4F1CA48] array];
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      uint64_t v10 = [v4 handles];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v78 objects:v85 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v79;
        v65 = v10;
        id v66 = v4;
        uint64_t v64 = *(void *)v79;
        do
        {
          uint64_t v14 = 0;
          uint64_t v70 = v12;
          do
          {
            if (*(void *)v79 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v72 = v14;
            uint64_t v15 = *(void **)(*((void *)&v78 + 1) + 8 * v14);
            uint64_t v16 = [v15 value];
            char v17 = [v16 destinationIdIsPseudonym];

            if ((v17 & 1) == 0)
            {
              v18 = [(TUContactsDataProvider *)self ISOCountryCodeForHandle:v15 fetchRequest:v4];
              uint64_t v19 = [(id)objc_opt_class() defaultContactKeyDescriptors];
              uint64_t v20 = [(TUContactsDataProvider *)self contactsForHandle:v15 countryCode:v18 keysToFetch:v19 prefixHint:0];

              v21 = v20;
              if ([v20 count])
              {
                long long v76 = 0u;
                long long v77 = 0u;
                long long v74 = 0u;
                long long v75 = 0u;
                id v22 = v20;
                uint64_t v23 = [v22 countByEnumeratingWithState:&v74 objects:v84 count:16];
                if (v23)
                {
                  uint64_t v24 = v23;
                  v68 = v21;
                  v69 = v18;
                  uint64_t v25 = *(void *)v75;
                  do
                  {
                    for (uint64_t i = 0; i != v24; ++i)
                    {
                      if (*(void *)v75 != v25) {
                        objc_enumerationMutation(v22);
                      }
                      id v27 = *(void **)(*((void *)&v74 + 1) + 8 * i);
                      v83 = v27;
                      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
                      v29 = [(TUContactsDataProvider *)self compositeNameForContacts:v28];

                      if (v29)
                      {
                        v30 = [v27 givenName];
                        [v9 addObject:v30];
                      }
                    }
                    uint64_t v24 = [v22 countByEnumeratingWithState:&v74 objects:v84 count:16];
                  }
                  while (v24);
                  uint64_t v10 = v65;
                  id v4 = v66;
                  uint64_t v13 = v64;
                  v21 = v68;
                  v18 = v69;
                }
              }
              else
              {
                id v22 = [(TUContactsDataProvider *)self formattedNameForHandle:v15 countryCode:v18];
                [(TUContactsDataProviderResult *)v63 addObject:v22];
              }

              uint64_t v12 = v70;
            }
            uint64_t v14 = v72 + 1;
          }
          while (v72 + 1 != v12);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v78 objects:v85 count:16];
        }
        while (v12);
      }

      [v9 sortUsingComparator:&__block_literal_global_22];
      v6 = v63;
      [(TUContactsDataProviderResult *)v63 sortUsingComparator:&__block_literal_global_55];
      long long v31 = [MEMORY[0x1E4F1CA48] arrayWithArray:v9];
      [v31 addObjectsFromArray:v63];
      long long v32 = TUBundle();
      long long v33 = [v32 localizedStringForKey:@"UNKNOWN" value:&stru_1EECEA668 table:@"TelephonyUtilities"];

      if ([v31 count] == 1)
      {
        uint64_t v34 = [v31 objectAtIndexedSubscript:0];
        goto LABEL_41;
      }
      if ([v31 count] == 2)
      {
        v40 = NSString;
        uint64_t v41 = TUBundle();
        v42 = [v41 localizedStringForKey:@"%@_AND_%@" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
        [v31 objectAtIndexedSubscript:0];
        v44 = id v43 = v4;
        v45 = [v31 objectAtIndexedSubscript:1];
        uint64_t v34 = objc_msgSend(v40, "stringWithFormat:", v42, v44, v45);

        id v4 = v43;
      }
      else
      {
        if ([v31 count] == 3)
        {
          v46 = NSString;
          v47 = TUBundle();
          uint64_t v41 = v47;
          v48 = @"%@_%@_AND_%@";
        }
        else
        {
          if ([v31 count] != 4)
          {
            if ((unint64_t)[v31 count] < 5)
            {
              v39 = v62;
              goto LABEL_42;
            }
            v54 = [(id)objc_opt_class() numberFormatter];
            v55 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "count") - 3);
            uint64_t v71 = [v54 stringFromNumber:v55];

            v56 = NSString;
            v73 = TUBundle();
            v57 = [v73 localizedStringForKey:@"%@_%@_%@_AND_%@_OTHERS" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
            v58 = [v31 objectAtIndexedSubscript:0];
            v59 = [v31 objectAtIndexedSubscript:1];
            [v31 objectAtIndexedSubscript:2];
            v61 = id v60 = v4;
            uint64_t v34 = objc_msgSend(v56, "stringWithFormat:", v57, v58, v59, v61, v71);

            id v4 = v60;
            v6 = v63;
            long long v33 = (void *)v71;
LABEL_41:
            v39 = v62;

            long long v33 = (void *)v34;
LABEL_42:
            [v39 setLocalizedName:v33];

            goto LABEL_43;
          }
          v46 = NSString;
          v47 = TUBundle();
          uint64_t v41 = v47;
          v48 = @"%@_%@_%@_AND_ONE_OTHER";
        }
        [v47 localizedStringForKey:v48 value:&stru_1EECEA668 table:@"TelephonyUtilities"];
        v49 = id v67 = v4;
        v50 = [v31 objectAtIndexedSubscript:0];
        v51 = [v31 objectAtIndexedSubscript:1];
        v52 = [v31 objectAtIndexedSubscript:2];
        uint64_t v34 = objc_msgSend(v46, "stringWithFormat:", v49, v50, v51, v52);

        id v4 = v67;
      }
      long long v33 = v41;
      v6 = v63;
      goto LABEL_41;
    }
  }
  long long v35 = [v4 contactIdentifier];

  if (!v35) {
    goto LABEL_31;
  }
  uint64_t v36 = [v4 contactIdentifier];
  long long v37 = [v4 auxiliaryKeysToFetch];
  v38 = [(TUContactsDataProvider *)self contactWithIdentifier:v36 keysToFetch:v37];

  if (!v38
    || (v82 = v38,
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v38,
        !v9))
  {
LABEL_31:
    uint64_t v9 = [(TUContactsDataProvider *)self unifiedContactsForFetchRequest:v4];
  }
  v39 = [(TUContactsDataProvider *)self resultForSingleHandleFetchRequest:v4 fetchedContacts:v9];
LABEL_43:

  return v39;
}

uint64_t __46__TUContactsDataProvider_executeFetchRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:");
}

uint64_t __46__TUContactsDataProvider_executeFetchRequest___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:");
}

- (id)resultForSingleHandleFetchRequest:(id)a3 fetchedContacts:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = objc_alloc_init(TUContactsDataProviderResult);
  if ([v7 count])
  {
    uint64_t v9 = [v7 firstObject];
    [(TUContactsDataProviderResult *)v8 setLegacyAddressBookIdentifier:[(TUContactsDataProvider *)self personIDForContact:v9]];
  }
  if ([v7 count])
  {
    uint64_t v10 = [(TUContactsDataProvider *)self compositeNameForContacts:v7];
    [(TUContactsDataProviderResult *)v8 setLocalizedName:v10];

    uint64_t v11 = [v6 handles];
    uint64_t v12 = [v11 count];

    if (v12 == 1)
    {
      uint64_t v13 = [v6 handles];
      uint64_t v14 = [v13 firstObject];

      uint64_t v15 = [(TUContactsDataProvider *)self ISOCountryCodeForHandle:v14 fetchRequest:v6];
      uint64_t v16 = [(TUContactsDataProvider *)self contactLabelForContacts:v7 matchingHandle:v14 countryCode:v15];
      [(TUContactsDataProviderResult *)v8 setContactLabel:v16];
    }
    if ([v7 count] == 1)
    {
      char v17 = [v7 firstObject];
      v18 = [v17 organizationName];
      [(TUContactsDataProviderResult *)v8 setCompanyName:v18];
    }
  }
  uint64_t v19 = [(TUContactsDataProviderResult *)v8 localizedName];

  if (!v19)
  {
    uint64_t v20 = TUDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [v6 handles];
      *(_DWORD *)long long v35 = 138412290;
      *(void *)&v35[4] = v21;
      _os_log_impl(&dword_19C496000, v20, OS_LOG_TYPE_DEFAULT, "Finding the appropriate localized name to use for handles: %@", v35, 0xCu);
    }
    id v22 = [(TUContactsDataProvider *)self compositeNameForFetchRequest:v6];
    if (v22)
    {
      [(TUContactsDataProviderResult *)v8 setLocalizedName:v22];
      uint64_t v23 = TUDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [(TUContactsDataProviderResult *)v8 localizedName];
        *(_DWORD *)long long v35 = 138412290;
        *(void *)&v35[4] = v24;
        uint64_t v25 = "     - using formatted destination ID '%@'";
LABEL_22:
        _os_log_impl(&dword_19C496000, v23, OS_LOG_TYPE_DEFAULT, v25, v35, 0xCu);
      }
    }
    else if ([v6 isEmergency])
    {
      v26 = TUBundle();
      id v27 = [v26 localizedStringForKey:@"EMERGENCY_SERVICES" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
      [(TUContactsDataProviderResult *)v8 setLocalizedName:v27];

      uint64_t v23 = TUDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [(TUContactsDataProviderResult *)v8 localizedName];
        *(_DWORD *)long long v35 = 138412290;
        *(void *)&v35[4] = v24;
        uint64_t v25 = "     - call is to emergency services, we'll use the emergency services string: '%@'";
        goto LABEL_22;
      }
    }
    else
    {
      int v28 = [v6 isBlocked];
      v29 = TUBundle();
      v30 = v29;
      if (v28)
      {
        long long v31 = [v29 localizedStringForKey:@"BLOCKED" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
        [(TUContactsDataProviderResult *)v8 setLocalizedName:v31];

        uint64_t v23 = TUDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [(TUContactsDataProviderResult *)v8 localizedName];
          *(_DWORD *)long long v35 = 138412290;
          *(void *)&v35[4] = v24;
          uint64_t v25 = "     - call is blocked, we'll use the blocked string: '%@'";
          goto LABEL_22;
        }
      }
      else
      {
        long long v32 = [v29 localizedStringForKey:@"UNKNOWN" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
        [(TUContactsDataProviderResult *)v8 setLocalizedName:v32];

        uint64_t v23 = TUDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [(TUContactsDataProviderResult *)v8 localizedName];
          *(_DWORD *)long long v35 = 138412290;
          *(void *)&v35[4] = v24;
          uint64_t v25 = "     - falling back to the unknown string: '%@'";
          goto LABEL_22;
        }
      }
    }
  }
  -[TUContactsDataProviderResult setContacts:](v8, "setContacts:", v7, *(_OWORD *)v35);
  long long v33 = TUDefaultLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long v35 = 138412290;
    *(void *)&v35[4] = v8;
    _os_log_impl(&dword_19C496000, v33, OS_LOG_TYPE_DEFAULT, "Determined dataProviderResult: %@", v35, 0xCu);
  }

  return v8;
}

- (id)contactLabelForContacts:(id)a3 matchingHandle:(id)a4 countryCode:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  [(TUContactsDataProvider *)self labeledHandlesForContacts:a3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "handle", (void)v18);
        int v16 = [v15 isCanonicallyEqualToHandle:v8 isoCountryCode:v9];

        if (v16)
        {
          uint64_t v11 = [v14 label];
          goto LABEL_11;
        }
      }
      uint64_t v11 = (void *)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v11;
}

- (id)labeledHandlesForContactWithIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v5 = [(TUContactsDataProvider *)self contactWithIdentifier:a3 keysToFetch:MEMORY[0x1E4F1CBF0]];
  id v6 = (void *)v5;
  if (v5)
  {
    v9[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v4 = [(TUContactsDataProvider *)self labeledHandlesForContacts:v7];
  }

  return v4;
}

- (id)labeledHandlesForContacts:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v3;
  uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v52;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v52 != v39) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v51 + 1) + 8 * v5);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v41 = v6;
        uint64_t v42 = v5;
        id v7 = [v6 phoneNumbers];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v48 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              uint64_t v13 = [TUHandle alloc];
              uint64_t v14 = [v12 value];
              uint64_t v15 = [v14 unformattedInternationalStringValue];
              int v16 = [(TUHandle *)v13 initWithType:2 value:v15];

              char v17 = [TULabeledHandle alloc];
              long long v18 = (void *)MEMORY[0x1E4F1BA20];
              long long v19 = [v12 label];
              long long v20 = [v18 localizedStringForLabel:v19];
              long long v21 = -[TULabeledHandle initWithHandle:label:isSuggested:](v17, "initWithHandle:label:isSuggested:", v16, v20, [v12 tuIsSuggested]);

              [v4 addObject:v21];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v9);
        }

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v22 = [v41 emailAddresses];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v44;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v44 != v25) {
                objc_enumerationMutation(v22);
              }
              id v27 = *(void **)(*((void *)&v43 + 1) + 8 * j);
              int v28 = [TUHandle alloc];
              v29 = [v27 value];
              v30 = [(TUHandle *)v28 initWithType:3 value:v29];

              long long v31 = [TULabeledHandle alloc];
              long long v32 = (void *)MEMORY[0x1E4F1BA20];
              long long v33 = [v27 label];
              uint64_t v34 = [v32 localizedStringForLabel:v33];
              long long v35 = -[TULabeledHandle initWithHandle:label:isSuggested:](v31, "initWithHandle:label:isSuggested:", v30, v34, [v27 tuIsSuggested]);

              [v4 addObject:v35];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v43 objects:v55 count:16];
          }
          while (v24);
        }

        uint64_t v5 = v42 + 1;
      }
      while (v42 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v40);
  }

  uint64_t v36 = (void *)[v4 copy];

  return v36;
}

- (id)contactWithIdentifier:(id)a3 keysToFetch:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TUContactsDataProvider *)self contactsDataSource];
  uint64_t v9 = [(id)objc_opt_class() keysByCombiningDefaultKeysWithKeysToFetch:v7];

  id v15 = 0;
  uint64_t v10 = [v8 unifiedContactWithIdentifier:v6 keysToFetch:v9 error:&v15];
  id v11 = v15;

  if (v10)
  {
    uint64_t v12 = TUDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      char v17 = v10;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, "Found contact: %@ for contactIdentifier %@: ", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v12 = [v11 domain];
    if ([v12 isEqualToString:*MEMORY[0x1E4F1AFD8]])
    {
      uint64_t v13 = [v11 code];

      if (v13 == 200) {
        goto LABEL_9;
      }
      uint64_t v12 = TUDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[TUContactsDataProvider contactWithIdentifier:keysToFetch:]();
      }
    }
  }

LABEL_9:

  return v10;
}

- (id)unifiedContactsForFetchRequest:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 auxiliaryKeysToFetch];
  id v22 = [v5 keysByCombiningDefaultKeysWithKeysToFetch:v6];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [v4 handles];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v24;
    *(void *)&long long v9 = 138412546;
    long long v20 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        if (-[TUContactsDataProvider shouldIgnoreHandle:withFetchRequest:](self, "shouldIgnoreHandle:withFetchRequest:", v13, v4, v20))
        {
          uint64_t v14 = TUDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v28 = v13;
            _os_log_impl(&dword_19C496000, v14, OS_LOG_TYPE_DEFAULT, "Not looking up contact for %@ because it is in our apple care handles", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v14 = [(TUContactsDataProvider *)self ISOCountryCodeForHandle:v13 fetchRequest:v4];
          id v15 = [(TUContactsDataProvider *)self prefixHintForFetchRequest:v4];
          int v16 = [(TUContactsDataProvider *)self contactsForHandle:v13 countryCode:v14 keysToFetch:v22 prefixHint:v15];

          if (v16)
          {
            [v21 addObjectsFromArray:v16];
          }
          else
          {
            char v17 = TUDefaultLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v20;
              uint64_t v28 = v13;
              __int16 v29 = 2112;
              uint64_t v30 = 0;
              _os_log_error_impl(&dword_19C496000, v17, OS_LOG_TYPE_ERROR, "Error while fetching contacts for handle %@: %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v10);
  }

  __int16 v18 = (void *)[v21 copy];

  return v18;
}

- (id)contactsForHandle:(id)a3 countryCode:(id)a4 keysToFetch:(id)a5 prefixHint:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 type];
  switch(v14)
  {
    case 1:
      id v21 = objc_alloc(MEMORY[0x1E4F1BAC0]);
      id v22 = [v10 value];
      id v15 = (void *)[v21 initWithUrlString:0 username:v22 userIdentifier:0 service:0];

      char v17 = [(TUContactsDataProvider *)self contactsDataSource];
      __int16 v18 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingSocialProfile:v15];
      long long v23 = [(id)objc_opt_class() defaultContactKeyDescriptors];
      id v29 = 0;
      id v19 = [v17 unifiedContactsMatchingPredicate:v18 keysToFetch:v23 error:&v29];
      id v24 = v29;

      goto LABEL_8;
    case 2:
      long long v25 = (void *)MEMORY[0x1E4F1BA70];
      long long v26 = [v10 value];
      id v15 = [v25 phoneNumberWithDigits:v26 countryCode:v11];

      char v17 = [(TUContactsDataProvider *)self contactsDataSource];
      __int16 v18 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v15 prefixHint:v13];
      uint64_t v30 = 0;
      id v19 = [v17 unifiedContactsMatchingPredicate:v18 keysToFetch:v12 error:&v30];
      long long v20 = v30;
      goto LABEL_7;
    case 3:
      id v15 = [(TUContactsDataProvider *)self contactsDataSource];
      int v16 = (void *)MEMORY[0x1E4F1B8F8];
      char v17 = [v10 value];
      __int16 v18 = [v16 predicateForContactsMatchingEmailAddress:v17];
      long long v31 = 0;
      id v19 = [v15 unifiedContactsMatchingPredicate:v18 keysToFetch:v12 error:&v31];
      long long v20 = v31;
LABEL_7:
      id v24 = v20;
LABEL_8:

      if (v19) {
        goto LABEL_14;
      }
      goto LABEL_11;
  }
  id v24 = 0;
LABEL_11:
  id v27 = TUDefaultLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    -[TUContactsDataProvider contactsForHandle:countryCode:keysToFetch:prefixHint:]();
  }

  id v19 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_14:

  return v19;
}

- (id)nameForContact:(id)a3
{
  id v4 = a3;
  if ([(TUContactsDataProvider *)self shouldUseGivenName]) {
    [v4 givenName];
  }
  else {
  uint64_t v5 = [MEMORY[0x1E4F1B910] stringFromContact:v4 style:0];
  }

  return v5;
}

- (id)localizedCompositeNameForContact:(id)a3 secondContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 givenName];
  if (!v8) {
    goto LABEL_12;
  }
  long long v9 = (void *)v8;
  uint64_t v10 = [v6 familyName];
  if (!v10) {
    goto LABEL_11;
  }
  id v11 = (void *)v10;
  uint64_t v12 = [v7 givenName];
  if (!v12)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    long long v23 = [(TUContactsDataProvider *)self nameForContact:v6];
    uint64_t v28 = [(TUContactsDataProvider *)self nameForContact:v7];
    id v24 = (void *)v28;
    if (!v23 || !v28)
    {
      if (v23) {
        long long v31 = v23;
      }
      else {
        long long v31 = (void *)v28;
      }
      id v30 = v31;
      goto LABEL_21;
    }
    id v29 = NSString;
    long long v25 = TUBundle();
    long long v26 = [v25 localizedStringForKey:@"%@_OR_%@" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
    uint64_t v27 = objc_msgSend(v29, "stringWithFormat:", v26, v23, v24);
    goto LABEL_15;
  }
  id v13 = (void *)v12;
  uint64_t v14 = [v7 familyName];
  if (!v14)
  {

    goto LABEL_10;
  }
  id v15 = (void *)v14;
  int v16 = [v7 familyName];
  char v17 = [v6 familyName];
  uint64_t v18 = [v16 localizedCaseInsensitiveCompare:v17];

  if (v18) {
    goto LABEL_12;
  }
  id v19 = [v7 givenName];
  long long v20 = [v6 givenName];
  uint64_t v21 = [v19 localizedCaseInsensitiveCompare:v20];

  if (v21)
  {
    if (![(TUContactsDataProvider *)self shouldUseGivenName])
    {
      BOOL v33 = [(TUContactsDataProvider *)self shouldUseFamilyNameFirst];
      uint64_t v34 = NSString;
      if (v33)
      {
        id v35 = [NSString alloc];
        long long v23 = TUBundle();
        id v24 = [v23 localizedStringForKey:@"%@_%@_OR_%@_%@" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
        long long v25 = [v7 familyName];
        long long v26 = [v6 givenName];
        uint64_t v36 = [v7 familyName];
        long long v37 = [v7 givenName];
        id v30 = (id)objc_msgSend(v35, "initWithFormat:", v24, v25, v26, v36, v37);
      }
      else
      {
        long long v23 = TUBundle();
        id v24 = [v23 localizedStringForKey:@"%@_OR_%@_%@" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
        long long v25 = [v6 givenName];
        long long v26 = [v7 givenName];
        uint64_t v36 = [v7 familyName];
        objc_msgSend(v34, "stringWithFormat:", v24, v25, v26, v36);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_16;
    }
    id v22 = [NSString alloc];
    long long v23 = TUBundle();
    id v24 = [v23 localizedStringForKey:@"%@_OR_%@" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
    long long v25 = [v6 givenName];
    long long v26 = [v7 givenName];
    uint64_t v27 = objc_msgSend(v22, "initWithFormat:", v24, v25, v26);
LABEL_15:
    id v30 = (id)v27;
LABEL_16:

LABEL_21:
    goto LABEL_22;
  }
  id v30 = [(TUContactsDataProvider *)self nameForContact:v6];
LABEL_22:

  return v30;
}

- (id)compositeNameForContacts:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 firstObject];
  if ([v4 count] == 1)
  {
    id v6 = [(TUContactsDataProvider *)self nameForContact:v5];
  }
  else if ([v4 count] == 2)
  {
    id v7 = [v4 objectAtIndexedSubscript:1];
    id v6 = [(TUContactsDataProvider *)self localizedCompositeNameForContact:v5 secondContact:v7];
  }
  else
  {
    if ((unint64_t)[v4 count] >= 3)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v24 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = [(TUContactsDataProvider *)self nameForContact:*(void *)(*((void *)&v23 + 1) + 8 * i)];
            if (v13)
            {
              uint64_t v14 = (void *)v13;

              id v15 = NSString;
              int v16 = TUBundle();
              char v17 = [v16 localizedStringForKey:@"%@_OR_%@_OTHERS" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
              uint64_t v18 = [(id)objc_opt_class() numberFormatter];
              id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count") - 1);
              long long v20 = [v18 stringFromNumber:v19];
              id v6 = objc_msgSend(v15, "stringWithFormat:", v17, v14, v20, (void)v23);

              goto LABEL_17;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
    }
    id v6 = 0;
  }
LABEL_17:
  uint64_t v21 = TUDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = v6;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_19C496000, v21, OS_LOG_TYPE_DEFAULT, "Determined compositeName: %@ for contacts: %@", buf, 0x16u);
  }

  return v6;
}

- (id)compositeNameForFetchRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 handles];
  if ([v5 count] == 1)
  {
    id v6 = [v5 firstObject];
    id v7 = [(TUContactsDataProvider *)self ISOCountryCodeForHandle:v6 fetchRequest:v4];
    id v8 = [v5 firstObject];
    uint64_t v9 = [(TUContactsDataProvider *)self formattedNameForHandle:v8 countryCode:v7];
LABEL_7:

    goto LABEL_8;
  }
  if ([v5 count] == 2)
  {
    id v6 = [v5 firstObject];
    id v7 = [(TUContactsDataProvider *)self ISOCountryCodeForHandle:v6 fetchRequest:v4];
    uint64_t v10 = [v4 handles];
    id v8 = [v10 lastObject];

    long long v20 = [(TUContactsDataProvider *)self ISOCountryCodeForHandle:v8 fetchRequest:v4];
    id v22 = NSString;
    uint64_t v11 = TUBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"%@_AND_%@" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
    uint64_t v13 = [(TUContactsDataProvider *)self formattedNameForHandle:v6 countryCode:v7];
    uint64_t v14 = [(TUContactsDataProvider *)self formattedNameForHandle:v8 countryCode:v20];
    uint64_t v9 = objc_msgSend(v22, "stringWithFormat:", v12, v13, v14);

    goto LABEL_7;
  }
  if ((unint64_t)[v5 count] >= 3)
  {
    id v6 = [v5 firstObject];
    id v7 = [(TUContactsDataProvider *)self ISOCountryCodeForHandle:v6 fetchRequest:v4];
    long long v23 = NSString;
    id v8 = TUBundle();
    uint64_t v21 = [v8 localizedStringForKey:@"%@_AND_%@_OTHERS" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
    id v19 = [(TUContactsDataProvider *)self formattedNameForHandle:v6 countryCode:v7];
    id v15 = [(id)objc_opt_class() numberFormatter];
    int v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count") - 1);
    char v17 = [v15 stringFromNumber:v16];
    uint64_t v9 = objc_msgSend(v23, "stringWithFormat:", v21, v19, v17);

    goto LABEL_7;
  }
  uint64_t v9 = 0;
LABEL_8:

  return v9;
}

- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 value];
  if (![v7 length])
  {
    uint64_t v8 = [v5 normalizedValue];

    id v7 = (void *)v8;
  }
  uint64_t v9 = [v5 type];
  uint64_t v10 = TUDefaultLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9 == 2)
  {
    if (v11)
    {
      int v15 = 138412546;
      int v16 = v7;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "     - we'll format the destinationID '%@' with the country code '%@'", (uint8_t *)&v15, 0x16u);
    }

    TUFormattedPhoneNumber(v7, v6);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11)
    {
      int v15 = 138412290;
      int v16 = v7;
      _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "     - handle can't/shouldn't be formatted as a phone number, so using the unmodified destination ID '%@'", (uint8_t *)&v15, 0xCu);
    }

    id v12 = v7;
  }
  uint64_t v13 = v12;

  return v13;
}

- (BOOL)shouldIgnoreHandle:(id)a3 withFetchRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isIncoming] && (objc_msgSend(v7, "isVerified") & 1) == 0)
  {
    uint64_t v9 = [(TUContactsDataProvider *)self appleCareHandles];
    char v8 = [v9 contains:v6];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)getDeviceSetupDate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(TUContactsDataProvider *)self deviceSetupDate];

  if (v3)
  {
    id v4 = [(TUContactsDataProvider *)self deviceSetupDate];
    goto LABEL_12;
  }
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v5 = (void *)getBYSetupUserDispositionClass_softClass;
  uint64_t v14 = getBYSetupUserDispositionClass_softClass;
  if (!getBYSetupUserDispositionClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    int v16 = __getBYSetupUserDispositionClass_block_invoke;
    __int16 v17 = &unk_1E58E5F90;
    id v18 = &v11;
    __getBYSetupUserDispositionClass_block_invoke((uint64_t)&buf);
    id v5 = (void *)v12[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v11, 8);
  id v7 = objc_msgSend(v6, "current", v11);
  char v8 = [v7 date];

  uint64_t v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "BYSetupUserDisposition: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v8)
  {
    id v4 = v8;
LABEL_10:
    [(TUContactsDataProvider *)self setDeviceSetupDate:v4];
    goto LABEL_11;
  }
  id v4 = (id)CFPreferencesCopyValue(@"SetupLastExit", @"com.apple.purplebuddy", @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v4) {
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:

  return v4;
}

- (BOOL)isHandleEligibleForScreenSharingRequests:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_TUIsInternalInstall()
    && ([(TUContactsDataProvider *)self userDefaults],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 BOOLForKey:@"ignoreContactCreationDateKey"],
        v5,
        v6))
  {
    TUDefaultLog();
    id v7 = (TUContactsDataProviderFetchRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19C496000, &v7->super, OS_LOG_TYPE_DEFAULT, "Handle is eligible for screen sharing because ignoreContactCreationDateKey is YES", buf, 2u);
    }
    BOOL v8 = 1;
  }
  else
  {
    id v7 = [[TUContactsDataProviderFetchRequest alloc] initWithHandle:v4];
    [(TUContactsDataProviderFetchRequest *)v7 setAuxiliaryKeysToFetch:&unk_1EED245D0];
    uint64_t v9 = [(TUContactsDataProvider *)self executeFetchRequest:v7];
    uint64_t v10 = TUDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v9 contacts];
      *(_DWORD *)long long buf = 138412290;
      long long v46 = v11;
      _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Found contacts %@", buf, 0xCu);
    }
    id v12 = [v9 contacts];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
      id v15 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v15 setDay:-1];
      int v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      __int16 v17 = [v16 dateByAddingComponents:v15 toDate:v14 options:0];
      id v18 = [(TUContactsDataProvider *)self getDeviceSetupDate];
      uint64_t v19 = TUDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        long long v46 = v18;
        _os_log_impl(&dword_19C496000, v19, OS_LOG_TYPE_DEFAULT, "Got device setup date %@", buf, 0xCu);
      }

      if (v18 && [v18 compare:v17] == 1)
      {
        BOOL v8 = 1;
      }
      else
      {
        id v39 = v4;
        uint64_t v40 = v16;
        long long v20 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v21 = objc_msgSend(v9, "contacts", v18, v15, v14);
        id v22 = objc_msgSend(v20, "arrayWithCapacity:", objc_msgSend(v21, "count"));

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        v38 = v9;
        long long v23 = [v9 contacts];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v42;
          while (2)
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v42 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              __int16 v29 = [v28 creationDate];
              [v22 addObject:v29];

              id v30 = [v28 creationDate];
              uint64_t v31 = [v30 compare:v17];

              if (v31 == -1)
              {
                uint64_t v32 = TUDefaultLog();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  BOOL v33 = [v28 creationDate];
                  *(_DWORD *)long long buf = 138412546;
                  long long v46 = v28;
                  __int16 v47 = 2112;
                  long long v48 = v33;
                  _os_log_impl(&dword_19C496000, v32, OS_LOG_TYPE_DEFAULT, "Found contact %@ with creation date %@", buf, 0x16u);
                }
                BOOL v8 = 1;
                goto LABEL_29;
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v41 objects:v49 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

        long long v23 = TUDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          long long v46 = v22;
          _os_log_impl(&dword_19C496000, v23, OS_LOG_TYPE_DEFAULT, "No contact had a creation date > 24 hours ago. Creation dates: %@", buf, 0xCu);
        }
        BOOL v8 = 0;
LABEL_29:
        uint64_t v9 = v38;
        id v4 = v39;
        id v15 = v36;
        uint64_t v14 = v37;
        id v18 = v35;

        int v16 = v40;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (int)personIDForContact:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUContactsDataProvider *)self contactsDataSource];
  int v6 = (const void *)[v5 personFromContact:v4];

  if (v6)
  {
    ABRecordID RecordID = ABRecordGetRecordID(v6);
  }
  else
  {
    BOOL v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Could not look up legacy ABPerson for contact: %@", (uint8_t *)&v10, 0xCu);
    }

    ABRecordID RecordID = -1;
  }

  return RecordID;
}

+ (id)keysByCombiningDefaultKeysWithKeysToFetch:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = [(id)objc_opt_class() defaultContactKeyDescriptors];
    int v6 = [v5 arrayByAddingObjectsFromArray:v3];
    id v7 = [v4 setWithArray:v6];
    BOOL v8 = [v7 allObjects];
  }
  else
  {
    BOOL v8 = [(id)objc_opt_class() defaultContactKeyDescriptors];
  }

  return v8;
}

+ (id)numberFormatter
{
  if (numberFormatter_onceToken_0 != -1) {
    dispatch_once(&numberFormatter_onceToken_0, &__block_literal_global_125);
  }
  v2 = (void *)numberFormatter_numberFormatter_0;

  return v2;
}

uint64_t __41__TUContactsDataProvider_numberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)numberFormatter_numberFormatter_0;
  numberFormatter_numberFormatter_0 = (uint64_t)v0;

  v2 = (void *)numberFormatter_numberFormatter_0;

  return [v2 setNumberStyle:1];
}

+ (id)defaultContactKeyDescriptors
{
  if (defaultContactKeyDescriptors_onceToken != -1) {
    dispatch_once(&defaultContactKeyDescriptors_onceToken, &__block_literal_global_128);
  }
  v2 = (void *)defaultContactKeyDescriptors_defaultContactKeyDescriptors;

  return v2;
}

void __54__TUContactsDataProvider_defaultContactKeyDescriptors__block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  id v0 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1];
  v5[0] = v0;
  v1 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v2 = *MEMORY[0x1E4F1AEE0];
  v5[1] = v1;
  v5[2] = v2;
  v5[3] = *MEMORY[0x1E4F1ADC8];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  id v4 = (void *)defaultContactKeyDescriptors_defaultContactKeyDescriptors;
  defaultContactKeyDescriptors_defaultContactKeyDescriptors = v3;
}

- (id)prefixHintForFetchRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(TUContactsDataProvider *)self localeSupportsPrefixHintForFetchRequest];
  if (((unsigned int (**)(void, id))v5)[2](v5, v4))
  {
    int v6 = [v4 phoneNumberPrefixHint];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

+ (id)unsupportedLocalesForPrefixHint
{
  if (unsupportedLocalesForPrefixHint_onceToken != -1) {
    dispatch_once(&unsupportedLocalesForPrefixHint_onceToken, &__block_literal_global_130);
  }
  uint64_t v2 = (void *)unsupportedLocalesForPrefixHint_unsupportedLocalesForPrefixHint;

  return v2;
}

uint64_t __57__TUContactsDataProvider_unsupportedLocalesForPrefixHint__block_invoke()
{
  unsupportedLocalesForPrefixHint_unsupportedLocalesForPrefixHint = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EED245E8];

  return MEMORY[0x1F41817F8]();
}

+ (id)familyNameFirstLocaleCountryCodes
{
  if (familyNameFirstLocaleCountryCodes_onceToken != -1) {
    dispatch_once(&familyNameFirstLocaleCountryCodes_onceToken, &__block_literal_global_153);
  }
  uint64_t v2 = (void *)familyNameFirstLocaleCountryCodes_familyNameFirstLocaleCountryCodes;

  return v2;
}

uint64_t __59__TUContactsDataProvider_familyNameFirstLocaleCountryCodes__block_invoke()
{
  familyNameFirstLocaleCountryCodes_familyNameFirstLocaleCountryCodes = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EED24600];

  return MEMORY[0x1F41817F8]();
}

- (id)ISOCountryCodeForHandle:(id)a3 fetchRequest:(id)a4
{
  id v5 = a4;
  int v6 = [a3 isoCountryCode];
  if (![v6 length])
  {
    id v7 = [v5 isoCountryCode];

    if ([v7 length])
    {
      int v6 = v7;
    }
    else
    {
      if ([v5 useNetworkCountryCode])
      {
        BOOL v8 = TUNetworkCountryCode();
        uint64_t v9 = v8;
        if (v8)
        {
          id v10 = v8;
        }
        else
        {
          TUHomeCountryCode();
          id v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        int v6 = v10;
      }
      else
      {
        int v6 = TUHomeCountryCode();
        uint64_t v9 = v7;
      }
    }
  }

  return v6;
}

- (BOOL)shouldUseGivenName
{
  return self->_useGivenName;
}

- (void)setUseGivenName:(BOOL)a3
{
  self->_useGivenName = a3;
}

- (BOOL)shouldUseFamilyNameFirst
{
  return self->_useFamilyNameFirst;
}

- (void)setUseFamilyNameFirst:(BOOL)a3
{
  self->_useFamilyNameFirst = a3;
}

- (id)localeSupportsPrefixHintForFetchRequest
{
  return self->_localeSupportsPrefixHintForFetchRequest;
}

- (void)setLocaleSupportsPrefixHintForFetchRequest:(id)a3
{
}

- (TUContactsDataSource)contactsDataSource
{
  return self->_contactsDataSource;
}

- (TUContactsDataProviderAppleCareHandles)appleCareHandles
{
  return self->_appleCareHandles;
}

- (void)setAppleCareHandles:(id)a3
{
}

- (NSDate)deviceSetupDate
{
  return self->_deviceSetupDate;
}

- (void)setDeviceSetupDate:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_deviceSetupDate, 0);
  objc_storeStrong((id *)&self->_appleCareHandles, 0);
  objc_storeStrong((id *)&self->_contactsDataSource, 0);

  objc_storeStrong(&self->_localeSupportsPrefixHintForFetchRequest, 0);
}

- (void)initWithContactsDataSource:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  int v6 = v4;
  _os_log_debug_impl(&dword_19C496000, a2, OS_LOG_TYPE_DEBUG, "TUContactsDataProvider: source is a '%{public}@'", (uint8_t *)&v5, 0xCu);
}

- (void)contactWithIdentifier:keysToFetch:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19C496000, v0, v1, "Error while fetching contact with identifier %@: %@");
}

- (void)contactsForHandle:countryCode:keysToFetch:prefixHint:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19C496000, v0, v1, "Error while fetching contacts for handle %@: %@");
}

@end