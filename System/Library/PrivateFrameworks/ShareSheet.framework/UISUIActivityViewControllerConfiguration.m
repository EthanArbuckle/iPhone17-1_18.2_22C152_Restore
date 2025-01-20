@interface UISUIActivityViewControllerConfiguration
+ (BOOL)supportsSecureCoding;
+ (void)_unitTest_SetDisableExcludingSourceApplicationFromOpenActivities:(BOOL)a3;
- (BOOL)_unitTest_disableExcludingSourceApplicationFromOpenActivities;
- (BOOL)allowsEmbedding;
- (BOOL)canExcludeExtensionActivities;
- (BOOL)canShowShareSheetPlugIns;
- (BOOL)isCollaborative;
- (BOOL)isContentManaged;
- (BOOL)linkedBeforeYukon;
- (BOOL)requestPeopleSuggestionsData;
- (BOOL)shouldExcludeiCloudAddToDriveActivity;
- (BOOL)shouldExcludeiCloudSharingActivity;
- (BOOL)shouldMatchOnlyUserElectedExtensions;
- (BOOL)shouldSkipPeopleSuggestions;
- (BOOL)useSlotsForPeopleSuggestions;
- (BOOL)whitelistActionActivitiesOnly;
- (CGSize)iconSize;
- (NSArray)activityItemValueClassNames;
- (NSArray)activityItemValueExtensionMatchingDictionaries;
- (NSArray)activityTypeOrder;
- (NSArray)activityTypesToCreateInShareService;
- (NSArray)excludedActivityTypes;
- (NSArray)hostActivityConfigurations;
- (NSArray)hostHiddenActivityConfigurations;
- (NSArray)includedActivityTypes;
- (NSArray)initialPhotosAssetDetails;
- (NSArray)linkPresentationDataForActivityItems;
- (NSArray)preferredLocalizations;
- (NSArray)recipients;
- (NSArray)typeIdentifiersForShortcutsMatching;
- (NSArray)urlsBeingShared;
- (NSDirectionalEdgeInsets)hostLayoutMargins;
- (NSLocale)hostLocale;
- (NSString)sessionID;
- (UIColor)hostTintColor;
- (UISUIActivityViewControllerConfiguration)initWithCoder:(id)a3;
- (UISUISecurityContext)securityScopedURLsForMatching;
- (UITraitCollection)hostTraitCollection;
- (double)iconScale;
- (double)preferredWidth;
- (id)_contextForMatchingActivityItems:(id)a3 activityItemValues:(id)a4 activityItemValueClasses:(id)a5;
- (id)availableActivityItemValueClasses;
- (id)contextForMatchingByActivityItemValueClasses;
- (id)contextForMatchingByActivityItems:(id)a3 itemValues:(id)a4;
- (id)description;
- (int64_t)excludedActivityCategories;
- (int64_t)hostIdiom;
- (int64_t)numberOfVisibleActionActivities;
- (int64_t)numberOfVisibleSharingActivities;
- (int64_t)sharingStyle;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityItemValueClassNames:(id)a3;
- (void)setActivityItemValueExtensionMatchingDictionaries:(id)a3;
- (void)setActivityTypeOrder:(id)a3;
- (void)setActivityTypesToCreateInShareService:(id)a3;
- (void)setAllowsEmbedding:(BOOL)a3;
- (void)setCanExcludeExtensionActivities:(BOOL)a3;
- (void)setCanShowShareSheetPlugIns:(BOOL)a3;
- (void)setExcludedActivityCategories:(int64_t)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setHostActivityConfigurations:(id)a3;
- (void)setHostHiddenActivityConfigurations:(id)a3;
- (void)setHostIdiom:(int64_t)a3;
- (void)setHostLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setHostLocale:(id)a3;
- (void)setHostTintColor:(id)a3;
- (void)setHostTraitCollection:(id)a3;
- (void)setIconScale:(double)a3;
- (void)setIconSize:(CGSize)a3;
- (void)setIncludedActivityTypes:(id)a3;
- (void)setInitialPhotosAssetDetails:(id)a3;
- (void)setIsCollaborative:(BOOL)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setLinkPresentationDataForActivityItems:(id)a3;
- (void)setLinkedBeforeYukon:(BOOL)a3;
- (void)setNumberOfVisibleActionActivities:(int64_t)a3;
- (void)setNumberOfVisibleSharingActivities:(int64_t)a3;
- (void)setPreferredLocalizations:(id)a3;
- (void)setPreferredWidth:(double)a3;
- (void)setRecipients:(id)a3;
- (void)setRequestPeopleSuggestionsData:(BOOL)a3;
- (void)setSecurityScopedURLsForMatching:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setSharingStyle:(int64_t)a3;
- (void)setShouldExcludeiCloudAddToDriveActivity:(BOOL)a3;
- (void)setShouldExcludeiCloudSharingActivity:(BOOL)a3;
- (void)setShouldMatchOnlyUserElectedExtensions:(BOOL)a3;
- (void)setShouldSkipPeopleSuggestions:(BOOL)a3;
- (void)setTypeIdentifiersForShortcutsMatching:(id)a3;
- (void)setUrlsBeingShared:(id)a3;
- (void)setUseSlotsForPeopleSuggestions:(BOOL)a3;
- (void)setWhitelistActionActivitiesOnly:(BOOL)a3;
@end

@implementation UISUIActivityViewControllerConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISUIActivityViewControllerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UISUIActivityViewControllerConfiguration *)self init];
  if (v5)
  {
    v6 = share_sheet_log();
    v7 = share_sheet_log();
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, v5);

    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "UISUIAVCConfigurationDecode", (const char *)&unk_1A0BA1E03, buf, 2u);
    }

    v9 = NSStringFromSelector(sel_preferredWidth);
    [v4 decodeDoubleForKey:v9];
    -[UISUIActivityViewControllerConfiguration setPreferredWidth:](v5, "setPreferredWidth:");

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v13 = NSStringFromSelector(sel_hostActivityConfigurations);
    v14 = [v4 decodeObjectOfClasses:v12 forKey:v13];
    [(UISUIActivityViewControllerConfiguration *)v5 setHostActivityConfigurations:v14];

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = NSStringFromSelector(sel_hostHiddenActivityConfigurations);
    v19 = [v4 decodeObjectOfClasses:v17 forKey:v18];
    [(UISUIActivityViewControllerConfiguration *)v5 setHostHiddenActivityConfigurations:v19];

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v23 = NSStringFromSelector(sel_activityTypesToCreateInShareService);
    v24 = [v4 decodeObjectOfClasses:v22 forKey:v23];
    [(UISUIActivityViewControllerConfiguration *)v5 setActivityTypesToCreateInShareService:v24];

    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v28 = NSStringFromSelector(sel_activityItemValueClassNames);
    v29 = [v4 decodeObjectOfClasses:v27 forKey:v28];
    [(UISUIActivityViewControllerConfiguration *)v5 setActivityItemValueClassNames:v29];

    v30 = _UISecureStandardPropertyListClasses();
    v31 = NSStringFromSelector(sel_activityItemValueExtensionMatchingDictionaries);
    v32 = [v4 decodeObjectOfClasses:v30 forKey:v31];
    [(UISUIActivityViewControllerConfiguration *)v5 setActivityItemValueExtensionMatchingDictionaries:v32];

    uint64_t v33 = objc_opt_class();
    v34 = NSStringFromSelector(sel_securityScopedURLsForMatching);
    v35 = [v4 decodeObjectOfClass:v33 forKey:v34];
    [(UISUIActivityViewControllerConfiguration *)v5 setSecurityScopedURLsForMatching:v35];

    v36 = NSStringFromSelector(sel_allowsEmbedding);
    -[UISUIActivityViewControllerConfiguration setAllowsEmbedding:](v5, "setAllowsEmbedding:", [v4 decodeBoolForKey:v36]);

    v37 = NSStringFromSelector(sel_isContentManaged);
    -[UISUIActivityViewControllerConfiguration setIsContentManaged:](v5, "setIsContentManaged:", [v4 decodeBoolForKey:v37]);

    v38 = NSStringFromSelector(sel_shouldMatchOnlyUserElectedExtensions);
    -[UISUIActivityViewControllerConfiguration setShouldMatchOnlyUserElectedExtensions:](v5, "setShouldMatchOnlyUserElectedExtensions:", [v4 decodeBoolForKey:v38]);

    v39 = NSStringFromSelector(sel_shouldExcludeiCloudAddToDriveActivity);
    -[UISUIActivityViewControllerConfiguration setShouldExcludeiCloudAddToDriveActivity:](v5, "setShouldExcludeiCloudAddToDriveActivity:", [v4 decodeBoolForKey:v39]);

    v40 = NSStringFromSelector(sel_shouldExcludeiCloudSharingActivity);
    -[UISUIActivityViewControllerConfiguration setShouldExcludeiCloudSharingActivity:](v5, "setShouldExcludeiCloudSharingActivity:", [v4 decodeBoolForKey:v40]);

    v41 = NSStringFromSelector(sel_shouldSkipPeopleSuggestions);
    -[UISUIActivityViewControllerConfiguration setShouldSkipPeopleSuggestions:](v5, "setShouldSkipPeopleSuggestions:", [v4 decodeBoolForKey:v41]);

    v42 = NSStringFromSelector(sel_canExcludeExtensionActivities);
    -[UISUIActivityViewControllerConfiguration setCanExcludeExtensionActivities:](v5, "setCanExcludeExtensionActivities:", [v4 decodeBoolForKey:v42]);

    v43 = NSStringFromSelector(sel_canShowShareSheetPlugIns);
    -[UISUIActivityViewControllerConfiguration setCanShowShareSheetPlugIns:](v5, "setCanShowShareSheetPlugIns:", [v4 decodeBoolForKey:v43]);

    v44 = NSStringFromSelector(sel_whitelistActionActivitiesOnly);
    -[UISUIActivityViewControllerConfiguration setWhitelistActionActivitiesOnly:](v5, "setWhitelistActionActivitiesOnly:", [v4 decodeBoolForKey:v44]);

    v45 = NSStringFromSelector(sel_linkedBeforeYukon);
    -[UISUIActivityViewControllerConfiguration setLinkedBeforeYukon:](v5, "setLinkedBeforeYukon:", [v4 decodeBoolForKey:v45]);

    v46 = NSStringFromSelector(sel_numberOfVisibleSharingActivities);
    -[UISUIActivityViewControllerConfiguration setNumberOfVisibleSharingActivities:](v5, "setNumberOfVisibleSharingActivities:", [v4 decodeIntegerForKey:v46]);

    v47 = NSStringFromSelector(sel_numberOfVisibleActionActivities);
    -[UISUIActivityViewControllerConfiguration setNumberOfVisibleActionActivities:](v5, "setNumberOfVisibleActionActivities:", [v4 decodeIntegerForKey:v47]);

    v48 = NSStringFromSelector(sel_hostIdiom);
    -[UISUIActivityViewControllerConfiguration setHostIdiom:](v5, "setHostIdiom:", [v4 decodeIntegerForKey:v48]);

    v49 = NSStringFromSelector(sel_requestPeopleSuggestionsData);
    -[UISUIActivityViewControllerConfiguration setRequestPeopleSuggestionsData:](v5, "setRequestPeopleSuggestionsData:", [v4 decodeBoolForKey:v49]);

    v50 = NSStringFromSelector(sel_useSlotsForPeopleSuggestions);
    -[UISUIActivityViewControllerConfiguration setUseSlotsForPeopleSuggestions:](v5, "setUseSlotsForPeopleSuggestions:", [v4 decodeBoolForKey:v50]);

    v51 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v52 = objc_opt_class();
    v53 = objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
    v54 = NSStringFromSelector(sel_includedActivityTypes);
    v55 = [v4 decodeObjectOfClasses:v53 forKey:v54];
    [(UISUIActivityViewControllerConfiguration *)v5 setIncludedActivityTypes:v55];

    v56 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v57 = objc_opt_class();
    v58 = objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0);
    v59 = NSStringFromSelector(sel_excludedActivityTypes);
    v60 = [v4 decodeObjectOfClasses:v58 forKey:v59];
    [(UISUIActivityViewControllerConfiguration *)v5 setExcludedActivityTypes:v60];

    v61 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v62 = objc_opt_class();
    v63 = objc_msgSend(v61, "setWithObjects:", v62, objc_opt_class(), 0);
    v64 = NSStringFromSelector(sel_activityTypeOrder);
    v65 = [v4 decodeObjectOfClasses:v63 forKey:v64];
    [(UISUIActivityViewControllerConfiguration *)v5 setActivityTypeOrder:v65];

    v66 = NSStringFromSelector(sel_excludedActivityCategories);
    -[UISUIActivityViewControllerConfiguration setExcludedActivityCategories:](v5, "setExcludedActivityCategories:", [v4 decodeIntegerForKey:v66]);

    v67 = NSStringFromSelector(sel_sharingStyle);
    -[UISUIActivityViewControllerConfiguration setSharingStyle:](v5, "setSharingStyle:", [v4 decodeIntegerForKey:v67]);

    v68 = NSStringFromSelector(sel__unitTest_disableExcludingSourceApplicationFromOpenActivities);
    v5->__unitTest_disableExcludingSourceApplicationFromOpenActivities = [v4 decodeBoolForKey:v68];

    v69 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v70 = objc_opt_class();
    v71 = objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
    v72 = NSStringFromSelector(sel_urlsBeingShared);
    v73 = [v4 decodeObjectOfClasses:v71 forKey:v72];
    [(UISUIActivityViewControllerConfiguration *)v5 setUrlsBeingShared:v73];

    v74 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v75 = objc_opt_class();
    v76 = objc_msgSend(v74, "setWithObjects:", v75, objc_opt_class(), 0);
    v77 = NSStringFromSelector(sel_linkPresentationDataForActivityItems);
    v78 = [v4 decodeObjectOfClasses:v76 forKey:v77];
    [(UISUIActivityViewControllerConfiguration *)v5 setLinkPresentationDataForActivityItems:v78];

    uint64_t v79 = objc_opt_class();
    v80 = NSStringFromSelector(sel_hostTintColor);
    v81 = [v4 decodeObjectOfClass:v79 forKey:v80];
    [(UISUIActivityViewControllerConfiguration *)v5 setHostTintColor:v81];

    v82 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v83 = objc_opt_class();
    v84 = objc_msgSend(v82, "setWithObjects:", v83, objc_opt_class(), 0);
    v85 = NSStringFromSelector(sel_initialPhotosAssetDetails);
    v86 = [v4 decodeObjectOfClasses:v84 forKey:v85];
    [(UISUIActivityViewControllerConfiguration *)v5 setInitialPhotosAssetDetails:v86];

    uint64_t v87 = objc_opt_class();
    v88 = NSStringFromSelector(sel_sessionID);
    v89 = [v4 decodeObjectOfClass:v87 forKey:v88];
    [(UISUIActivityViewControllerConfiguration *)v5 setSessionID:v89];

    uint64_t v90 = objc_opt_class();
    v91 = NSStringFromSelector(sel_hostTraitCollection);
    v92 = [v4 decodeObjectOfClass:v90 forKey:v91];
    [(UISUIActivityViewControllerConfiguration *)v5 setHostTraitCollection:v92];

    uint64_t v93 = objc_opt_class();
    v94 = NSStringFromSelector(sel_hostLocale);
    v95 = [v4 decodeObjectOfClass:v93 forKey:v94];
    [(UISUIActivityViewControllerConfiguration *)v5 setHostLocale:v95];

    uint64_t v96 = objc_opt_class();
    v97 = NSStringFromSelector(sel_hostLayoutMargins);
    v98 = [v4 decodeObjectOfClass:v96 forKey:v97];
    NSDirectionalEdgeInsets v123 = NSDirectionalEdgeInsetsFromString(v98);
    -[UISUIActivityViewControllerConfiguration setHostLayoutMargins:](v5, "setHostLayoutMargins:", v123.top, v123.leading, v123.bottom, v123.trailing);

    v99 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v100 = objc_opt_class();
    v101 = objc_msgSend(v99, "setWithObjects:", v100, objc_opt_class(), 0);
    v102 = NSStringFromSelector(sel_typeIdentifiersForShortcutsMatching);
    v103 = [v4 decodeObjectOfClasses:v101 forKey:v102];
    [(UISUIActivityViewControllerConfiguration *)v5 setTypeIdentifiersForShortcutsMatching:v103];

    v104 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v105 = objc_opt_class();
    v106 = objc_msgSend(v104, "setWithObjects:", v105, objc_opt_class(), 0);
    v107 = NSStringFromSelector(sel_preferredLocalizations);
    v108 = [v4 decodeObjectOfClasses:v106 forKey:v107];
    [(UISUIActivityViewControllerConfiguration *)v5 setPreferredLocalizations:v108];

    v109 = NSStringFromSelector(sel_iconSize);
    [v4 decodeCGSizeForKey:v109];
    -[UISUIActivityViewControllerConfiguration setIconSize:](v5, "setIconSize:");

    v110 = NSStringFromSelector(sel_iconScale);
    [v4 decodeDoubleForKey:v110];
    -[UISUIActivityViewControllerConfiguration setIconScale:](v5, "setIconScale:");

    v111 = NSStringFromSelector(sel_isCollaborative);
    -[UISUIActivityViewControllerConfiguration setIsCollaborative:](v5, "setIsCollaborative:", [v4 decodeBoolForKey:v111]);

    v112 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v113 = objc_opt_class();
    v114 = objc_msgSend(v112, "setWithObjects:", v113, objc_opt_class(), 0);
    v115 = NSStringFromSelector(sel_recipients);
    v116 = [v4 decodeObjectOfClasses:v114 forKey:v115];
    [(UISUIActivityViewControllerConfiguration *)v5 setRecipients:v116];

    v117 = share_sheet_log();
    v118 = share_sheet_log();
    os_signpost_id_t v119 = os_signpost_id_make_with_pointer(v118, v5);

    if (v119 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v117))
    {
      *(_WORD *)v121 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v117, OS_SIGNPOST_INTERVAL_END, v119, "UISUIAVCConfigurationDecode", (const char *)&unk_1A0BA1E03, v121, 2u);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v93 = a3;
  [(UISUIActivityViewControllerConfiguration *)self preferredWidth];
  double v5 = v4;
  v6 = NSStringFromSelector(sel_preferredWidth);
  [v93 encodeDouble:v6 forKey:v5];

  v7 = [(UISUIActivityViewControllerConfiguration *)self hostActivityConfigurations];
  os_signpost_id_t v8 = NSStringFromSelector(sel_hostActivityConfigurations);
  [v93 encodeObject:v7 forKey:v8];

  v9 = [(UISUIActivityViewControllerConfiguration *)self hostHiddenActivityConfigurations];
  v10 = NSStringFromSelector(sel_hostHiddenActivityConfigurations);
  [v93 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(UISUIActivityViewControllerConfiguration *)self activityTypesToCreateInShareService];
  v12 = NSStringFromSelector(sel_activityTypesToCreateInShareService);
  [v93 encodeObject:v11 forKey:v12];

  v13 = [(UISUIActivityViewControllerConfiguration *)self activityItemValueClassNames];
  v14 = NSStringFromSelector(sel_activityItemValueClassNames);
  [v93 encodeObject:v13 forKey:v14];

  v15 = [(UISUIActivityViewControllerConfiguration *)self activityItemValueExtensionMatchingDictionaries];
  uint64_t v16 = NSStringFromSelector(sel_activityItemValueExtensionMatchingDictionaries);
  [v93 encodeObject:v15 forKey:v16];

  v17 = [(UISUIActivityViewControllerConfiguration *)self securityScopedURLsForMatching];
  v18 = NSStringFromSelector(sel_securityScopedURLsForMatching);
  [v93 encodeObject:v17 forKey:v18];

  BOOL v19 = [(UISUIActivityViewControllerConfiguration *)self allowsEmbedding];
  v20 = NSStringFromSelector(sel_allowsEmbedding);
  [v93 encodeBool:v19 forKey:v20];

  BOOL v21 = [(UISUIActivityViewControllerConfiguration *)self isContentManaged];
  v22 = NSStringFromSelector(sel_isContentManaged);
  [v93 encodeBool:v21 forKey:v22];

  BOOL v23 = [(UISUIActivityViewControllerConfiguration *)self shouldMatchOnlyUserElectedExtensions];
  v24 = NSStringFromSelector(sel_shouldMatchOnlyUserElectedExtensions);
  [v93 encodeBool:v23 forKey:v24];

  BOOL v25 = [(UISUIActivityViewControllerConfiguration *)self shouldExcludeiCloudAddToDriveActivity];
  uint64_t v26 = NSStringFromSelector(sel_shouldExcludeiCloudAddToDriveActivity);
  [v93 encodeBool:v25 forKey:v26];

  BOOL v27 = [(UISUIActivityViewControllerConfiguration *)self shouldExcludeiCloudSharingActivity];
  v28 = NSStringFromSelector(sel_shouldExcludeiCloudSharingActivity);
  [v93 encodeBool:v27 forKey:v28];

  BOOL v29 = [(UISUIActivityViewControllerConfiguration *)self shouldSkipPeopleSuggestions];
  v30 = NSStringFromSelector(sel_shouldSkipPeopleSuggestions);
  [v93 encodeBool:v29 forKey:v30];

  BOOL v31 = [(UISUIActivityViewControllerConfiguration *)self canExcludeExtensionActivities];
  v32 = NSStringFromSelector(sel_canExcludeExtensionActivities);
  [v93 encodeBool:v31 forKey:v32];

  BOOL v33 = [(UISUIActivityViewControllerConfiguration *)self canShowShareSheetPlugIns];
  v34 = NSStringFromSelector(sel_canShowShareSheetPlugIns);
  [v93 encodeBool:v33 forKey:v34];

  BOOL v35 = [(UISUIActivityViewControllerConfiguration *)self whitelistActionActivitiesOnly];
  v36 = NSStringFromSelector(sel_whitelistActionActivitiesOnly);
  [v93 encodeBool:v35 forKey:v36];

  BOOL v37 = [(UISUIActivityViewControllerConfiguration *)self linkedBeforeYukon];
  v38 = NSStringFromSelector(sel_linkedBeforeYukon);
  [v93 encodeBool:v37 forKey:v38];

  int64_t v39 = [(UISUIActivityViewControllerConfiguration *)self numberOfVisibleSharingActivities];
  v40 = NSStringFromSelector(sel_numberOfVisibleSharingActivities);
  [v93 encodeInteger:v39 forKey:v40];

  int64_t v41 = [(UISUIActivityViewControllerConfiguration *)self numberOfVisibleActionActivities];
  v42 = NSStringFromSelector(sel_numberOfVisibleActionActivities);
  [v93 encodeInteger:v41 forKey:v42];

  int64_t v43 = [(UISUIActivityViewControllerConfiguration *)self hostIdiom];
  v44 = NSStringFromSelector(sel_hostIdiom);
  [v93 encodeInteger:v43 forKey:v44];

  BOOL v45 = [(UISUIActivityViewControllerConfiguration *)self requestPeopleSuggestionsData];
  v46 = NSStringFromSelector(sel_requestPeopleSuggestionsData);
  [v93 encodeBool:v45 forKey:v46];

  BOOL v47 = [(UISUIActivityViewControllerConfiguration *)self useSlotsForPeopleSuggestions];
  v48 = NSStringFromSelector(sel_useSlotsForPeopleSuggestions);
  [v93 encodeBool:v47 forKey:v48];

  v49 = [(UISUIActivityViewControllerConfiguration *)self includedActivityTypes];
  v50 = NSStringFromSelector(sel_includedActivityTypes);
  [v93 encodeObject:v49 forKey:v50];

  v51 = [(UISUIActivityViewControllerConfiguration *)self excludedActivityTypes];
  uint64_t v52 = NSStringFromSelector(sel_excludedActivityTypes);
  [v93 encodeObject:v51 forKey:v52];

  v53 = [(UISUIActivityViewControllerConfiguration *)self activityTypeOrder];
  v54 = NSStringFromSelector(sel_activityTypeOrder);
  [v93 encodeObject:v53 forKey:v54];

  int64_t v55 = [(UISUIActivityViewControllerConfiguration *)self excludedActivityCategories];
  v56 = NSStringFromSelector(sel_excludedActivityCategories);
  [v93 encodeInteger:v55 forKey:v56];

  int64_t v57 = [(UISUIActivityViewControllerConfiguration *)self sharingStyle];
  v58 = NSStringFromSelector(sel_sharingStyle);
  [v93 encodeInteger:v57 forKey:v58];

  v59 = [(UISUIActivityViewControllerConfiguration *)self linkPresentationDataForActivityItems];
  v60 = NSStringFromSelector(sel_linkPresentationDataForActivityItems);
  [v93 encodeObject:v59 forKey:v60];

  if (_isUnitTesting_onceToken != -1) {
    dispatch_once(&_isUnitTesting_onceToken, &__block_literal_global_21);
  }
  if (_isUnitTesting_isUnitTesting)
  {
    uint64_t v61 = _unitTest_disableExcludingSourceApplicationFromOpenActivities_defaultValue;
    uint64_t v62 = NSStringFromSelector(sel__unitTest_disableExcludingSourceApplicationFromOpenActivities);
    [v93 encodeBool:v61 forKey:v62];
  }
  v63 = [(UISUIActivityViewControllerConfiguration *)self urlsBeingShared];
  v64 = NSStringFromSelector(sel_urlsBeingShared);
  [v93 encodeObject:v63 forKey:v64];

  v65 = [(UISUIActivityViewControllerConfiguration *)self hostTintColor];
  v66 = NSStringFromSelector(sel_hostTintColor);
  [v93 encodeObject:v65 forKey:v66];

  v67 = [(UISUIActivityViewControllerConfiguration *)self initialPhotosAssetDetails];
  v68 = NSStringFromSelector(sel_initialPhotosAssetDetails);
  [v93 encodeObject:v67 forKey:v68];

  v69 = [(UISUIActivityViewControllerConfiguration *)self sessionID];
  uint64_t v70 = NSStringFromSelector(sel_sessionID);
  [v93 encodeObject:v69 forKey:v70];

  v71 = [(UISUIActivityViewControllerConfiguration *)self hostTraitCollection];
  v72 = NSStringFromSelector(sel_hostTraitCollection);
  [v93 encodeObject:v71 forKey:v72];

  v73 = [(UISUIActivityViewControllerConfiguration *)self hostLocale];
  v74 = NSStringFromSelector(sel_hostLocale);
  [v93 encodeObject:v73 forKey:v74];

  [(UISUIActivityViewControllerConfiguration *)self hostLayoutMargins];
  uint64_t v75 = NSStringFromDirectionalEdgeInsets(v95);
  v76 = NSStringFromSelector(sel_hostLayoutMargins);
  [v93 encodeObject:v75 forKey:v76];

  v77 = [(UISUIActivityViewControllerConfiguration *)self typeIdentifiersForShortcutsMatching];
  v78 = NSStringFromSelector(sel_typeIdentifiersForShortcutsMatching);
  [v93 encodeObject:v77 forKey:v78];

  uint64_t v79 = [(UISUIActivityViewControllerConfiguration *)self preferredLocalizations];
  v80 = NSStringFromSelector(sel_preferredLocalizations);
  [v93 encodeObject:v79 forKey:v80];

  [(UISUIActivityViewControllerConfiguration *)self iconSize];
  double v82 = v81;
  double v84 = v83;
  v85 = NSStringFromSelector(sel_iconSize);
  objc_msgSend(v93, "encodeCGSize:forKey:", v85, v82, v84);

  [(UISUIActivityViewControllerConfiguration *)self iconScale];
  double v87 = v86;
  v88 = NSStringFromSelector(sel_iconScale);
  [v93 encodeDouble:v88 forKey:v87];

  BOOL v89 = [(UISUIActivityViewControllerConfiguration *)self isCollaborative];
  uint64_t v90 = NSStringFromSelector(sel_isCollaborative);
  [v93 encodeBool:v89 forKey:v90];

  v91 = [(UISUIActivityViewControllerConfiguration *)self recipients];
  v92 = NSStringFromSelector(sel_recipients);
  [v93 encodeObject:v91 forKey:v92];
}

- (id)description
{
  uint64_t v13 = objc_opt_class();
  NSAppendPrintF();
  id v18 = 0;
  v14 = [(UISUIActivityViewControllerConfiguration *)self sessionID];
  NSAppendPrintF();
  id v3 = v18;

  if ([(UISUIActivityViewControllerConfiguration *)self isContentManaged])
  {
    NSAppendPrintF();
    id v4 = v3;

    id v3 = v4;
  }
  double v5 = [(UISUIActivityViewControllerConfiguration *)self includedActivityTypes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v15 = [(UISUIActivityViewControllerConfiguration *)self includedActivityTypes];
    NSAppendPrintF();
    id v7 = v3;

    id v3 = v7;
  }
  os_signpost_id_t v8 = [(UISUIActivityViewControllerConfiguration *)self excludedActivityTypes];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v16 = [(UISUIActivityViewControllerConfiguration *)self excludedActivityTypes];
    NSAppendPrintF();
    id v10 = v3;

    id v3 = v10;
  }
  v17 = [(UISUIActivityViewControllerConfiguration *)self activityItemValueExtensionMatchingDictionaries];
  NSAppendPrintF();
  id v11 = v3;

  return v11;
}

- (id)contextForMatchingByActivityItemValueClasses
{
  id v3 = [(UISUIActivityViewControllerConfiguration *)self availableActivityItemValueClasses];
  id v4 = [(UISUIActivityViewControllerConfiguration *)self _contextForMatchingActivityItems:0 activityItemValues:0 activityItemValueClasses:v3];

  return v4;
}

- (id)contextForMatchingByActivityItems:(id)a3 itemValues:(id)a4
{
  return [(UISUIActivityViewControllerConfiguration *)self _contextForMatchingActivityItems:a3 activityItemValues:a4 activityItemValueClasses:0];
}

- (id)_contextForMatchingActivityItems:(id)a3 activityItemValues:(id)a4 activityItemValueClasses:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = (id)MEMORY[0x1E4F1CBF0];
  if (a3) {
    id v10 = a3;
  }
  id v11 = v10;
  v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v13 = v12;
  if (v8)
  {
    [v12 addObjectsFromArray:v8];
  }
  else
  {
    v14 = [(UISUIActivityViewControllerConfiguration *)self securityScopedURLsForMatching];

    if (v14)
    {
      id v30 = v9;
      v15 = [(UISUIActivityViewControllerConfiguration *)self securityScopedURLsForMatching];
      uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      BOOL v29 = v15;
      v17 = [v15 securityScopedResources];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v32 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = [*(id *)(*((void *)&v31 + 1) + 8 * i) url];
            [v16 addObject:v22];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v19);
      }

      [v13 addObjectsFromArray:v16];
      id v9 = v30;
    }
  }
  BOOL v23 = [[_UIActivityMatchingContext alloc] initWithActivityItems:v11 itemValues:v13];
  [(_UIActivityMatchingContext *)v23 setActivityItemValueClasses:v9];
  v24 = [(UISUIActivityViewControllerConfiguration *)self activityItemValueExtensionMatchingDictionaries];
  [(_UIActivityMatchingContext *)v23 setActivityItemValueExtensionMatchingDictionaries:v24];

  [(_UIActivityMatchingContext *)v23 setIsContentManaged:[(UISUIActivityViewControllerConfiguration *)self isContentManaged]];
  [(_UIActivityMatchingContext *)v23 setShouldMatchOnlyUserElectedExtensions:[(UISUIActivityViewControllerConfiguration *)self shouldMatchOnlyUserElectedExtensions]];
  [(_UIActivityMatchingContext *)v23 setShouldExcludeiCloudAddToDriveActivity:[(UISUIActivityViewControllerConfiguration *)self shouldExcludeiCloudAddToDriveActivity]];
  [(_UIActivityMatchingContext *)v23 setShouldExcludeiCloudSharingActivity:[(UISUIActivityViewControllerConfiguration *)self shouldExcludeiCloudSharingActivity]];
  [(_UIActivityMatchingContext *)v23 setWhitelistActionActivitiesOnly:[(UISUIActivityViewControllerConfiguration *)self whitelistActionActivitiesOnly]];
  BOOL v25 = [(UISUIActivityViewControllerConfiguration *)self activityTypeOrder];
  [(_UIActivityMatchingContext *)v23 setActivityTypeOrder:v25];

  uint64_t v26 = [(UISUIActivityViewControllerConfiguration *)self includedActivityTypes];
  [(_UIActivityMatchingContext *)v23 setIncludedActivityTypes:v26];

  BOOL v27 = [(UISUIActivityViewControllerConfiguration *)self excludedActivityTypes];
  [(_UIActivityMatchingContext *)v23 setExcludedActivityTypes:v27];

  [(_UIActivityMatchingContext *)v23 setExcludedActivityCategories:[(UISUIActivityViewControllerConfiguration *)self excludedActivityCategories]];
  [(_UIActivityMatchingContext *)v23 setCanExcludeExtensionActivities:[(UISUIActivityViewControllerConfiguration *)self canExcludeExtensionActivities]];
  [(_UIActivityMatchingContext *)v23 setSharingStyle:[(UISUIActivityViewControllerConfiguration *)self sharingStyle]];

  return v23;
}

- (id)availableActivityItemValueClasses
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(UISUIActivityViewControllerConfiguration *)self activityItemValueClassNames];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        Class v9 = NSClassFromString(*(NSString **)(*((void *)&v11 + 1) + 8 * i));
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (void)_unitTest_SetDisableExcludingSourceApplicationFromOpenActivities:(BOOL)a3
{
  _unitTest_disableExcludingSourceApplicationFromOpenActivities_defaultValue = a3;
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (NSArray)hostActivityConfigurations
{
  return self->_hostActivityConfigurations;
}

- (void)setHostActivityConfigurations:(id)a3
{
}

- (NSArray)hostHiddenActivityConfigurations
{
  return self->_hostHiddenActivityConfigurations;
}

- (void)setHostHiddenActivityConfigurations:(id)a3
{
}

- (NSArray)activityItemValueClassNames
{
  return self->_activityItemValueClassNames;
}

- (void)setActivityItemValueClassNames:(id)a3
{
}

- (NSArray)activityTypesToCreateInShareService
{
  return self->_activityTypesToCreateInShareService;
}

- (void)setActivityTypesToCreateInShareService:(id)a3
{
}

- (UISUISecurityContext)securityScopedURLsForMatching
{
  return self->_securityScopedURLsForMatching;
}

- (void)setSecurityScopedURLsForMatching:(id)a3
{
}

- (NSArray)activityItemValueExtensionMatchingDictionaries
{
  return self->_activityItemValueExtensionMatchingDictionaries;
}

- (void)setActivityItemValueExtensionMatchingDictionaries:(id)a3
{
}

- (NSArray)urlsBeingShared
{
  return self->_urlsBeingShared;
}

- (void)setUrlsBeingShared:(id)a3
{
}

- (NSArray)linkPresentationDataForActivityItems
{
  return self->_linkPresentationDataForActivityItems;
}

- (void)setLinkPresentationDataForActivityItems:(id)a3
{
}

- (NSArray)typeIdentifiersForShortcutsMatching
{
  return self->_typeIdentifiersForShortcutsMatching;
}

- (void)setTypeIdentifiersForShortcutsMatching:(id)a3
{
}

- (UIColor)hostTintColor
{
  return self->_hostTintColor;
}

- (void)setHostTintColor:(id)a3
{
}

- (NSArray)initialPhotosAssetDetails
{
  return self->_initialPhotosAssetDetails;
}

- (void)setInitialPhotosAssetDetails:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (UITraitCollection)hostTraitCollection
{
  return self->_hostTraitCollection;
}

- (void)setHostTraitCollection:(id)a3
{
}

- (NSDirectionalEdgeInsets)hostLayoutMargins
{
  double top = self->_hostLayoutMargins.top;
  double leading = self->_hostLayoutMargins.leading;
  double bottom = self->_hostLayoutMargins.bottom;
  double trailing = self->_hostLayoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setHostLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  self->_hostLayoutMargins = a3;
}

- (NSLocale)hostLocale
{
  return self->_hostLocale;
}

- (void)setHostLocale:(id)a3
{
}

- (NSArray)preferredLocalizations
{
  return self->_preferredLocalizations;
}

- (void)setPreferredLocalizations:(id)a3
{
}

- (int64_t)hostIdiom
{
  return self->_hostIdiom;
}

- (void)setHostIdiom:(int64_t)a3
{
  self->_hostIdiom = a3;
}

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (double)iconScale
{
  return self->_iconScale;
}

- (void)setIconScale:(double)a3
{
  self->_iconScale = a3;
}

- (int64_t)numberOfVisibleSharingActivities
{
  return self->_numberOfVisibleSharingActivities;
}

- (void)setNumberOfVisibleSharingActivities:(int64_t)a3
{
  self->_numberOfVisibleSharingActivities = a3;
}

- (int64_t)numberOfVisibleActionActivities
{
  return self->_numberOfVisibleActionActivities;
}

- (void)setNumberOfVisibleActionActivities:(int64_t)a3
{
  self->_numberOfVisibleActionActivities = a3;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (BOOL)allowsEmbedding
{
  return self->_allowsEmbedding;
}

- (void)setAllowsEmbedding:(BOOL)a3
{
  self->_allowsEmbedding = a3;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (BOOL)shouldMatchOnlyUserElectedExtensions
{
  return self->_shouldMatchOnlyUserElectedExtensions;
}

- (void)setShouldMatchOnlyUserElectedExtensions:(BOOL)a3
{
  self->_shouldMatchOnlyUserElectedExtensions = a3;
}

- (BOOL)shouldExcludeiCloudAddToDriveActivity
{
  return self->_shouldExcludeiCloudAddToDriveActivity;
}

- (void)setShouldExcludeiCloudAddToDriveActivity:(BOOL)a3
{
  self->_shouldExcludeiCloudAddToDriveActivity = a3;
}

- (BOOL)shouldExcludeiCloudSharingActivity
{
  return self->_shouldExcludeiCloudSharingActivity;
}

- (void)setShouldExcludeiCloudSharingActivity:(BOOL)a3
{
  self->_shouldExcludeiCloudSharingActivity = a3;
}

- (BOOL)shouldSkipPeopleSuggestions
{
  return self->_shouldSkipPeopleSuggestions;
}

- (void)setShouldSkipPeopleSuggestions:(BOOL)a3
{
  self->_shouldSkipPeopleSuggestions = a3;
}

- (BOOL)canExcludeExtensionActivities
{
  return self->_canExcludeExtensionActivities;
}

- (void)setCanExcludeExtensionActivities:(BOOL)a3
{
  self->_canExcludeExtensionActivities = a3;
}

- (BOOL)canShowShareSheetPlugIns
{
  return self->_canShowShareSheetPlugIns;
}

- (void)setCanShowShareSheetPlugIns:(BOOL)a3
{
  self->_canShowShareSheetPlugIns = a3;
}

- (BOOL)whitelistActionActivitiesOnly
{
  return self->_whitelistActionActivitiesOnly;
}

- (void)setWhitelistActionActivitiesOnly:(BOOL)a3
{
  self->_whitelistActionActivitiesOnly = a3;
}

- (BOOL)linkedBeforeYukon
{
  return self->_linkedBeforeYukon;
}

- (void)setLinkedBeforeYukon:(BOOL)a3
{
  self->_linkedBeforeYukon = a3;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (BOOL)requestPeopleSuggestionsData
{
  return self->_requestPeopleSuggestionsData;
}

- (void)setRequestPeopleSuggestionsData:(BOOL)a3
{
  self->_requestPeopleSuggestionsData = a3;
}

- (BOOL)useSlotsForPeopleSuggestions
{
  return self->_useSlotsForPeopleSuggestions;
}

- (void)setUseSlotsForPeopleSuggestions:(BOOL)a3
{
  self->_useSlotsForPeopleSuggestions = a3;
}

- (NSArray)includedActivityTypes
{
  return self->_includedActivityTypes;
}

- (void)setIncludedActivityTypes:(id)a3
{
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
}

- (NSArray)activityTypeOrder
{
  return self->_activityTypeOrder;
}

- (void)setActivityTypeOrder:(id)a3
{
}

- (int64_t)excludedActivityCategories
{
  return self->_excludedActivityCategories;
}

- (void)setExcludedActivityCategories:(int64_t)a3
{
  self->_excludedActivityCategories = a3;
}

- (int64_t)sharingStyle
{
  return self->_sharingStyle;
}

- (void)setSharingStyle:(int64_t)a3
{
  self->_sharingStyle = a3;
}

- (BOOL)_unitTest_disableExcludingSourceApplicationFromOpenActivities
{
  return self->__unitTest_disableExcludingSourceApplicationFromOpenActivities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypeOrder, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_includedActivityTypes, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_preferredLocalizations, 0);
  objc_storeStrong((id *)&self->_hostLocale, 0);
  objc_storeStrong((id *)&self->_hostTraitCollection, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_initialPhotosAssetDetails, 0);
  objc_storeStrong((id *)&self->_hostTintColor, 0);
  objc_storeStrong((id *)&self->_typeIdentifiersForShortcutsMatching, 0);
  objc_storeStrong((id *)&self->_linkPresentationDataForActivityItems, 0);
  objc_storeStrong((id *)&self->_urlsBeingShared, 0);
  objc_storeStrong((id *)&self->_activityItemValueExtensionMatchingDictionaries, 0);
  objc_storeStrong((id *)&self->_securityScopedURLsForMatching, 0);
  objc_storeStrong((id *)&self->_activityTypesToCreateInShareService, 0);
  objc_storeStrong((id *)&self->_activityItemValueClassNames, 0);
  objc_storeStrong((id *)&self->_hostHiddenActivityConfigurations, 0);
  objc_storeStrong((id *)&self->_hostActivityConfigurations, 0);
}

@end