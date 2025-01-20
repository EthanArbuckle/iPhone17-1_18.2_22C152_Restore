@interface NCAppPickerContentProvider
+ (NCAppPickerContentProvider)providerWithPreviousBundleIdentifiersSelection:(id)a3 numDaysForAverageNotificationCount:(id)a4 onMainQueue:(id)a5;
- (BOOL)isAbleToSortByAvgNumberOfNotifications;
- (BOOL)isSelectedForIndex:(unint64_t)a3;
- (BOOL)isSortedByAvgNumberOfNotifications;
- (NSArray)selectedBundleIdentifiers;
- (NSString)longestAppName;
- (id)_appForIndex:(unint64_t)a3;
- (id)_initWithATXDigestSetupEntities:(id)a3 containsMessageAndTimeSensitiveData:(BOOL)a4 numberOfDays:(unint64_t)a5 previousBundleIdentifiersSelection:(id)a6;
- (id)bundleIdentifierForIndex:(unint64_t)a3;
- (id)imageForIndex:(unint64_t)a3 size:(CGSize)a4;
- (id)nameForIndex:(unint64_t)a3;
- (unint64_t)avgNumberOfNotificationsForIndex:(unint64_t)a3;
- (unint64_t)maxAvgNumberOfNotifications;
- (unint64_t)selectedCount;
- (unint64_t)totalCount;
- (void)sortByAvgNumberOfNotifications;
- (void)sortByName;
- (void)toggleSelectedForIndex:(unint64_t)a3;
@end

@implementation NCAppPickerContentProvider

+ (NCAppPickerContentProvider)providerWithPreviousBundleIdentifiersSelection:(id)a3 numDaysForAverageNotificationCount:(id)a4 onMainQueue:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E4F4AFF8];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __124__NCAppPickerContentProvider_providerWithPreviousBundleIdentifiersSelection_numDaysForAverageNotificationCount_onMainQueue___block_invoke;
  v15[3] = &unk_1E6A94920;
  id v16 = v7;
  id v17 = v8;
  id v12 = v8;
  id v13 = v7;
  [v11 appsSortedByNotificationsReceivedInPreviousNumDaysRaw:v10 completionHandler:v15];

  return result;
}

void __124__NCAppPickerContentProvider_providerWithPreviousBundleIdentifiersSelection_numDaysForAverageNotificationCount_onMainQueue___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v7 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __124__NCAppPickerContentProvider_providerWithPreviousBundleIdentifiersSelection_numDaysForAverageNotificationCount_onMainQueue___block_invoke_2;
  block[3] = &unk_1E6A948F8;
  char v14 = a3;
  id v10 = v7;
  uint64_t v13 = a4;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __124__NCAppPickerContentProvider_providerWithPreviousBundleIdentifiersSelection_numDaysForAverageNotificationCount_onMainQueue___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = [[NCAppPickerContentProvider alloc] _initWithATXDigestSetupEntities:*(void *)(a1 + 32) containsMessageAndTimeSensitiveData:*(unsigned __int8 *)(a1 + 64) numberOfDays:*(void *)(a1 + 56) previousBundleIdentifiersSelection:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v2 = *MEMORY[0x1E4FB3788];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3788], OS_LOG_TYPE_ERROR)) {
      __124__NCAppPickerContentProvider_providerWithPreviousBundleIdentifiersSelection_numDaysForAverageNotificationCount_onMainQueue___block_invoke_2_cold_1(v2);
    }
  }
}

- (id)_initWithATXDigestSetupEntities:(id)a3 containsMessageAndTimeSensitiveData:(BOOL)a4 numberOfDays:(unint64_t)a5 previousBundleIdentifiersSelection:(id)a6
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a6;
  v81.receiver = self;
  v81.super_class = (Class)NCAppPickerContentProvider;
  v64 = [(NCAppPickerContentProvider *)&v81 init];
  if (v64)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F50CE8]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v58 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v77 objects:v88 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v78 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [*(id *)(*((void *)&v77 + 1) + 8 * i) bundleId];
          [v11 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v77 objects:v88 count:16];
      }
      while (v14);
    }

    v56 = v10;
    v18 = [v10 effectiveSectionInfoForSectionIDs:v11];
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    obuint64_t j = v18;
    uint64_t v20 = [obj countByEnumeratingWithState:&v73 objects:v87 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v74;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v74 != v22) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v73 + 1) + 8 * j);
          v25 = [v24 sectionID];
          [v19 setValue:v24 forKey:v25];
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v73 objects:v87 count:16];
      }
      while (v21);
    }

    v64->_unint64_t maxAvgNumberOfNotifications = 0;
    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    selectedApps = v64->_selectedApps;
    v64->_selectedApps = v26;

    if (v9)
    {
      v59 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    }
    else
    {
      v59 = 0;
    }
    v55 = v11;
    id v57 = v9;
    v61 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v67 = v12;
    uint64_t v28 = [v67 countByEnumeratingWithState:&v69 objects:v86 count:16];
    if (!v28)
    {
      v65 = 0;
      goto LABEL_49;
    }
    uint64_t v29 = v28;
    v65 = 0;
    uint64_t v30 = *(void *)v70;
    while (1)
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v70 != v30) {
          objc_enumerationMutation(v67);
        }
        v32 = *(void **)(*((void *)&v69 + 1) + 8 * k);
        v33 = [v32 bundleId];
        v34 = objc_msgSend(MEMORY[0x1E4F223C8], "unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:", v33);
        v35 = [v34 localizedName];
        if (v35)
        {
          if (v33)
          {
            v36 = [v19 objectForKey:v33];
            v37 = v36;
            if (v36
              && [v36 authorizationStatus] != 1
              && ([v37 suppressFromSettings] & 1) == 0
              && ([v37 isRestricted] & 1) == 0)
            {
              uint64_t v38 = [v32 numBasicNotifications];
              v39 = objc_alloc_init(NCAppPickerContentProviderAppObject);
              [(NCAppPickerContentProviderAppObject *)v39 setName:v35];
              v40 = v65;
              if (!v65 || (v62 = [v65 length], unint64_t v41 = objc_msgSend(v35, "length"), v40 = v65, v62 < v41))
              {
                v66 = v40;
                uint64_t v63 = v38;
                id v42 = v35;

                v65 = v42;
                uint64_t v38 = v63;
              }
              unint64_t v43 = 7 * v38 / a5;
              [(NCAppPickerContentProviderAppObject *)v39 setBundleIdentifier:v33];
              [(NCAppPickerContentProviderAppObject *)v39 setAvgNumberOfNotifications:v43];
              [(NSArray *)v61 addObject:v39];
              if ([v37 scheduledDeliverySetting] == 2
                || [v59 containsObject:v33])
              {
                [(NSMutableSet *)v64->_selectedApps addObject:v39];
              }
              unint64_t maxAvgNumberOfNotifications = v64->_maxAvgNumberOfNotifications;
              if (maxAvgNumberOfNotifications <= v43) {
                unint64_t maxAvgNumberOfNotifications = v43;
              }
              v64->_unint64_t maxAvgNumberOfNotifications = maxAvgNumberOfNotifications;

LABEL_44:
              goto LABEL_45;
            }
          }
          else
          {
            v37 = 0;
          }
          v46 = *MEMORY[0x1E4FB3788];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3788], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v83 = v33;
            _os_log_impl(&dword_1D7C04000, v46, OS_LOG_TYPE_DEFAULT, "Ignoring bundle %@ for digest onboarding since it is not authorized to post notifications", buf, 0xCu);
          }
          goto LABEL_44;
        }
        v45 = *MEMORY[0x1E4FB3788];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3788], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v83 = v33;
          __int16 v84 = 2112;
          uint64_t v85 = 0;
          _os_log_error_impl(&dword_1D7C04000, v45, OS_LOG_TYPE_ERROR, "Error getting LSApplicationRecord for %@. Error: %@", buf, 0x16u);
        }
LABEL_45:
      }
      uint64_t v29 = [v67 countByEnumeratingWithState:&v69 objects:v86 count:16];
      if (!v29)
      {
LABEL_49:

        uint64_t v47 = [v65 copy];
        longestAppName = v64->_longestAppName;
        v64->_longestAppName = (NSString *)v47;

        appsSortedByAvgNumberOfNotificationsDescending = v64->_appsSortedByAvgNumberOfNotificationsDescending;
        v64->_appsSortedByAvgNumberOfNotificationsDescending = v61;
        v50 = v61;

        uint64_t v51 = [(NSArray *)v50 sortedArrayUsingComparator:&__block_literal_global_37];
        appsSortedByNameAscending = v64->_appsSortedByNameAscending;
        v64->_appsSortedByNameAscending = (NSArray *)v51;

        BOOL v53 = v64->_maxAvgNumberOfNotifications != 0;
        v64->_ableToSortByAvgNumberOfNotifications = v53;
        v64->_sortedByAvgNumberOfNotifications = v53;

        id v9 = v57;
        id v8 = v58;
        break;
      }
    }
  }

  return v64;
}

uint64_t __146__NCAppPickerContentProvider__initWithATXDigestSetupEntities_containsMessageAndTimeSensitiveData_numberOfDays_previousBundleIdentifiersSelection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

- (unint64_t)totalCount
{
  return [(NSArray *)self->_appsSortedByNameAscending count];
}

- (unint64_t)selectedCount
{
  return [(NSMutableSet *)self->_selectedApps count];
}

- (NSArray)selectedBundleIdentifiers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_selectedApps;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "bundleIdentifier", (void)v12);
        id v10 = (void *)[v9 copy];
        [v3 addObject:v10];
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)nameForIndex:(unint64_t)a3
{
  id v3 = [(NCAppPickerContentProvider *)self _appForIndex:a3];
  id v4 = [v3 name];

  return v4;
}

- (unint64_t)avgNumberOfNotificationsForIndex:(unint64_t)a3
{
  id v3 = [(NCAppPickerContentProvider *)self _appForIndex:a3];
  unint64_t v4 = [v3 avgNumberOfNotifications];

  return v4;
}

- (id)imageForIndex:(unint64_t)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(NCAppPickerContentProvider *)self _appForIndex:a3];
  uint64_t v7 = [v6 bundleIdentifier];

  id v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  id v9 = objc_alloc(MEMORY[0x1E4F6F258]);
  [v8 scale];
  id v11 = objc_msgSend(v9, "initWithSize:scale:", width, height, v10);
  long long v12 = [v8 traitCollection];
  uint64_t v13 = [v12 userInterfaceStyle];

  if (v13 == 2) {
    [v11 setAppearance:1];
  }
  int v14 = [v7 isEqualToString:@"com.apple.mobilecal"];
  id v15 = objc_alloc(MEMORY[0x1E4F6F248]);
  id v16 = v15;
  if (v14)
  {
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] now];
    v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v19 = (void *)[v16 initWithDate:v17 calendar:v18 format:0];

    v27[0] = v11;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [v19 prepareImagesForImageDescriptors:v20];

    uint64_t v21 = [v19 imageForDescriptor:v11];

    if (v21)
    {
LABEL_5:
      uint64_t v22 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v23 = [v21 CGImage];
      [v21 scale];
      v24 = objc_msgSend(v22, "imageWithCGImage:scale:orientation:", v23, 0);
      goto LABEL_8;
    }
  }
  else
  {
    v25 = (void *)[v15 initWithBundleIdentifier:v7];
    uint64_t v21 = [v25 prepareImageForDescriptor:v11];

    if (v21) {
      goto LABEL_5;
    }
  }
  v24 = 0;
LABEL_8:

  return v24;
}

- (BOOL)isSelectedForIndex:(unint64_t)a3
{
  id v3 = self;
  unint64_t v4 = [(NCAppPickerContentProvider *)self _appForIndex:a3];
  LOBYTE(v3) = [(NSMutableSet *)v3->_selectedApps containsObject:v4];

  return (char)v3;
}

- (void)toggleSelectedForIndex:(unint64_t)a3
{
  id v6 = [(NCAppPickerContentProvider *)self _appForIndex:a3];
  int v4 = -[NSMutableSet containsObject:](self->_selectedApps, "containsObject:");
  selectedApps = self->_selectedApps;
  if (v4) {
    [(NSMutableSet *)selectedApps removeObject:v6];
  }
  else {
    [(NSMutableSet *)selectedApps addObject:v6];
  }
}

- (id)bundleIdentifierForIndex:(unint64_t)a3
{
  id v3 = [(NCAppPickerContentProvider *)self _appForIndex:a3];
  int v4 = [v3 bundleIdentifier];

  return v4;
}

- (void)sortByName
{
  if (self->_ableToSortByAvgNumberOfNotifications) {
    self->_sortedByAvgNumberOfNotifications = 0;
  }
}

- (void)sortByAvgNumberOfNotifications
{
  if (self->_ableToSortByAvgNumberOfNotifications) {
    self->_sortedByAvgNumberOfNotifications = 1;
  }
}

- (id)_appForIndex:(unint64_t)a3
{
  uint64_t v4 = 8;
  if (!self->_sortedByAvgNumberOfNotifications) {
    uint64_t v4 = 16;
  }
  id v5 = *(id *)((char *)&self->super.isa + v4);
  if ([v5 count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndex:a3];
  }

  return v6;
}

- (unint64_t)maxAvgNumberOfNotifications
{
  return self->_maxAvgNumberOfNotifications;
}

- (BOOL)isSortedByAvgNumberOfNotifications
{
  return self->_sortedByAvgNumberOfNotifications;
}

- (BOOL)isAbleToSortByAvgNumberOfNotifications
{
  return self->_ableToSortByAvgNumberOfNotifications;
}

- (NSString)longestAppName
{
  return self->_longestAppName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longestAppName, 0);
  objc_storeStrong((id *)&self->_selectedApps, 0);
  objc_storeStrong((id *)&self->_appsSortedByNameAscending, 0);

  objc_storeStrong((id *)&self->_appsSortedByAvgNumberOfNotificationsDescending, 0);
}

void __124__NCAppPickerContentProvider_providerWithPreviousBundleIdentifiersSelection_numDaysForAverageNotificationCount_onMainQueue___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7C04000, log, OS_LOG_TYPE_ERROR, "Error getting ATXDigestSetupResponses", v1, 2u);
}

@end