@interface FCTagRecordSource
+ (id)defaultCachePolicy;
- (FCTagRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 desiredTagRecordFieldOptions:(unint64_t)a7;
- (FCTagRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 experimentalizableFieldsPostfix:(id)a7 activeTreatmentID:(id)a8;
- (id)alwaysLocalizedKeys;
- (id)experimentalizableKeys;
- (id)localizableExperimentalizableKeys;
- (id)localizableKeys;
- (id)localizableLanguageSpecificKeys;
- (id)nonLocalizableKeys;
- (id)recordFromCKRecord:(id)a3 base:(id)a4;
- (id)recordIDPrefixes;
- (id)recordType;
- (id)saveTagRecords:(id)a3;
- (id)storeFilename;
- (int)pbRecordType;
- (unint64_t)desiredFieldOptions;
- (unint64_t)highThresholdDataSizeLimit;
- (unint64_t)lowThresholdDataSizeLimit;
- (unint64_t)storeVersion;
- (void)setDesiredFieldOptions:(unint64_t)a3;
@end

@implementation FCTagRecordSource

- (id)recordIDPrefixes
{
  return &unk_1EF8D8B50;
}

- (id)recordType
{
  return @"Tag";
}

- (unint64_t)storeVersion
{
  return 49;
}

- (id)storeFilename
{
  return @"tag-record-source";
}

- (int)pbRecordType
{
  return 2;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 10000000;
}

- (FCTagRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 desiredTagRecordFieldOptions:(unint64_t)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentDatabase");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCTagRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:desiredTagR"
          "ecordFieldOptions:]";
    __int16 v26 = 2080;
    v27 = "FCTagRecordSource.m";
    __int16 v28 = 1024;
    int v29 = 191;
    __int16 v30 = 2114;
    v31 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v13) {
      goto LABEL_6;
    }
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentDirectory");
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCTagRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:desiredTagR"
          "ecordFieldOptions:]";
    __int16 v26 = 2080;
    v27 = "FCTagRecordSource.m";
    __int16 v28 = 1024;
    int v29 = 192;
    __int16 v30 = 2114;
    v31 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v23.receiver = self;
  v23.super_class = (Class)FCTagRecordSource;
  v16 = [(FCRecordSource *)&v23 initWithContentDatabase:v12 contentDirectory:v13 appActivityMonitor:v14 backgroundTaskable:v15 experimentalizableFieldsPostfix:0 activeTreatmentID:0];
  v17 = v16;
  if (v16)
  {
    v16->_desiredFieldOptions = a7;
    uint64_t v18 = FCTagRecordSourceDesiredKeysFromDesiredFieldOptions(a7);
    nonLocalizableKeys = v17->_nonLocalizableKeys;
    v17->_nonLocalizableKeys = (NSArray *)v18;
  }
  return v17;
}

- (FCTagRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 experimentalizableFieldsPostfix:(id)a7 activeTreatmentID:(id)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCTagRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimenta"
          "lizableFieldsPostfix:activeTreatmentID:]";
    __int16 v26 = 2080;
    v27 = "FCTagRecordSource.m";
    __int16 v28 = 1024;
    int v29 = 182;
    __int16 v30 = 2114;
    v31 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v20 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v21 = *MEMORY[0x1E4F1C3B8];
  v22 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTagRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimentalizableFieldsPostfix:activeTreatmentID:]"];
  id v23 = [v20 exceptionWithName:v21 reason:v22 userInfo:0];

  objc_exception_throw(v23);
}

- (id)experimentalizableKeys
{
  if (qword_1EB5D0E70 != -1) {
    dispatch_once(&qword_1EB5D0E70, &__block_literal_global_19_0);
  }
  v2 = (void *)_MergedGlobals_10;
  return v2;
}

uint64_t __43__FCTagRecordSource_experimentalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"activeExperimentID", @"publisherSpecifiedArticleIDs", 0);
  uint64_t v1 = _MergedGlobals_10;
  _MergedGlobals_10 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)localizableExperimentalizableKeys
{
  if (qword_1EB5D0E80 != -1) {
    dispatch_once(&qword_1EB5D0E80, &__block_literal_global_23_1);
  }
  v2 = (void *)qword_1EB5D0E78;
  return v2;
}

uint64_t __54__FCTagRecordSource_localizableExperimentalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"groupingAvailability", @"superfeedConfigResourceID", 0);
  uint64_t v1 = qword_1EB5D0E78;
  qword_1EB5D0E78 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)localizableKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__FCTagRecordSource_localizableKeys__block_invoke;
  block[3] = &unk_1E5B4C018;
  block[4] = self;
  if (qword_1EB5D0E90 != -1) {
    dispatch_once(&qword_1EB5D0E90, block);
  }
  return (id)qword_1EB5D0E88;
}

void __36__FCTagRecordSource_localizableKeys__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__FCTagRecordSource_localizableKeys__block_invoke_2;
  v3[3] = &unk_1E5B4BF30;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v3);
  v2 = (void *)qword_1EB5D0E88;
  qword_1EB5D0E88 = v1;
}

void __36__FCTagRecordSource_localizableKeys__block_invoke_2(uint64_t a1, void *a2)
{
  v5[12] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) desiredFieldOptions] & 2) != 0) {
    [v3 addObject:@"name"];
  }
  v5[0] = @"publisherPaidOfferableConfig";
  v5[1] = @"publisherPaidDescriptionStrings";
  v5[2] = @"isHidden";
  v5[3] = @"paidBundleSubscriptionButtonConfig";
  v5[4] = @"articleRecirculationConfiguration";
  v5[5] = @"superfeedConfigResourceID";
  v5[6] = @"sportsRecommendationMappings";
  v5[7] = @"isSportsRecommendable";
  v5[8] = @"highlightsArticleListID";
  v5[9] = @"sportsData";
  v5[10] = @"subscriptionRate";
  v5[11] = @"groupingAvailability";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:12];
  [v3 addObjectsFromArray:v4];
}

- (id)alwaysLocalizedKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__FCTagRecordSource_alwaysLocalizedKeys__block_invoke;
  block[3] = &unk_1E5B4C018;
  block[4] = self;
  if (qword_1EB5D0EA0 != -1) {
    dispatch_once(&qword_1EB5D0EA0, block);
  }
  return (id)qword_1EB5D0E98;
}

void __40__FCTagRecordSource_alwaysLocalizedKeys__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__FCTagRecordSource_alwaysLocalizedKeys__block_invoke_2;
  v3[3] = &unk_1E5B4BF30;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v3);
  v2 = (void *)qword_1EB5D0E98;
  qword_1EB5D0E98 = v1;
}

void __40__FCTagRecordSource_alwaysLocalizedKeys__block_invoke_2(uint64_t a1, void *a2)
{
  v5[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([*(id *)(a1 + 32) desiredFieldOptions] & 0x200) != 0) {
    [v3 addObject:@"stocksFeedConfiguration"];
  }
  v5[0] = @"feedConfiguration";
  v5[1] = @"propertyFlagsLocalized";
  v5[2] = @"sectionFeedConfiguration";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  [v3 addObjectsFromArray:v4];
}

- (id)localizableLanguageSpecificKeys
{
  if (qword_1EB5D0EB0 != -1) {
    dispatch_once(&qword_1EB5D0EB0, &__block_literal_global_28_2);
  }
  v2 = (void *)qword_1EB5D0EA8;
  return v2;
}

uint64_t __52__FCTagRecordSource_localizableLanguageSpecificKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"name", 0);
  uint64_t v1 = qword_1EB5D0EA8;
  qword_1EB5D0EA8 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 5000000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  uint64_t v263 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v246 = objc_alloc_init(MEMORY[0x1E4F82BE8]);
  v248 = v7;
  [v246 setBase:v7];
  v8 = [(FCRecordSource *)self localizedKeysByOriginalKey];
  v9 = [v8 objectForKeyedSubscript:@"name"];
  v233 = [v6 objectForKey:v9];

  v10 = [v8 objectForKeyedSubscript:@"nameCompact"];
  v11 = [v6 objectForKey:v10];

  id v12 = objc_msgSend(v8, "objectForKeyedSubscript:");
  v243 = [v6 objectForKey:v12];

  id v13 = objc_msgSend(v8, "objectForKeyedSubscript:");
  v242 = [v6 objectForKey:v13];

  id v14 = objc_msgSend(v8, "objectForKeyedSubscript:");
  v241 = [v6 objectForKey:v14];

  id v15 = objc_msgSend(v8, "objectForKeyedSubscript:");
  v240 = [v6 objectForKey:v15];

  id v16 = objc_msgSend(v8, "objectForKeyedSubscript:");
  v239 = [v6 objectForKey:v16];

  id v17 = objc_msgSend(v8, "objectForKeyedSubscript:");
  v238 = [v6 objectForKey:v17];

  uint64_t v18 = -[FCRecordSource resolveLocalizableExperimentalizableFieldforKey:inRecord:activeExperimentIDKey:](self, "resolveLocalizableExperimentalizableFieldforKey:inRecord:activeExperimentIDKey:");
  v19 = objc_msgSend(v8, "objectForKeyedSubscript:");
  v237 = [v6 objectForKey:v19];

  v20 = objc_msgSend(v8, "objectForKeyedSubscript:");
  v236 = [v6 objectForKey:v20];

  uint64_t v21 = objc_msgSend(v8, "objectForKeyedSubscript:");
  v230 = [v6 objectForKey:v21];

  v244 = v8;
  v22 = objc_msgSend(v8, "objectForKeyedSubscript:");
  v235 = [v6 objectForKey:v22];

  id v23 = [(FCRecordSource *)self experimentalizedKeysByOriginalKey];
  v24 = [v23 objectForKeyedSubscript:@"activeExperimentID"];
  v25 = [v6 objectForKey:v24];

  v229 = v23;
  __int16 v26 = [v23 objectForKeyedSubscript:@"publisherSpecifiedArticleIDs"];
  v27 = [v6 objectForKey:v26];

  __int16 v28 = [v6 objectForKey:@"publisherSpecifiedArticleIDs"];
  v231 = (void *)v18;
  v227 = v27;
  v228 = v25;
  v226 = v28;
  v234 = self;
  if ([v27 count])
  {
    int v29 = [(FCRecordSource *)self activeTreatmentID];
    if ([v25 isEqualToString:v29]) {
      __int16 v30 = v27;
    }
    else {
      __int16 v30 = v28;
    }
    id v31 = v30;
  }
  else
  {
    id v31 = v28;
  }
  v225 = v31;
  uint64_t v32 = (void *)[v31 mutableCopy];
  [v246 setPublisherSpecifiedArticleIDs:v32];

  v33 = [v6 objectForKey:@"publisherSpecifiedArticles"];
  [v246 setPublisherSpecifiedArticlesJson:v33];

  objc_opt_class();
  v34 = [v6 objectForKey:@"publisherSpecifiedArticleIDsModifiedDate"];
  v35 = v11;
  if (v34)
  {
    if (objc_opt_isKindOfClass()) {
      v36 = v34;
    }
    else {
      v36 = 0;
    }
  }
  else
  {
    v36 = 0;
  }
  id v37 = v36;
  v38 = [v37 pbDate];
  [v246 setPublisherSpecifiedArticleIDsModifiedDate:v38];

  v224 = [(FCRecordSource *)self localizedLanguageSpecificKeysByOriginalKey];
  v39 = [v224 objectForKeyedSubscript:@"name"];
  v40 = [v6 objectForKey:v39];

  v41 = [v6 objectForKey:@"hideAccessoryText"];
  objc_msgSend(v246, "setHideAccessoryText:", objc_msgSend(v41, "BOOLValue"));

  v223 = v40;
  if ([v40 length] || (v40 = v233, objc_msgSend(v233, "length")))
  {
    [v246 setName:v40];
  }
  else
  {
    v218 = [v6 objectForKey:@"name"];
    [v246 setName:v218];
  }
  if ([v11 length])
  {
    v42 = v246;
    [v246 setNameCompact:v11];
  }
  else
  {
    v43 = [v6 objectForKey:@"nameCompact"];
    v42 = v246;
    [v246 setNameCompact:v43];
  }
  v44 = [v6 objectForKey:@"type"];
  [v42 setType:PBTagTypeFromString(v44)];

  v45 = [v6 objectForKey:@"primaryAudience"];
  [v42 setPrimaryAudience:v45];

  v46 = [v6 objectForKey:@"primaryAudience"];
  objc_msgSend(v42, "setIsExplicitContent:", objc_msgSend(v46, "isEqualToString:", @"MATURE"));

  v47 = [v6 objectForKey:@"contentProvider"];
  objc_msgSend(v42, "setContentProvider:", objc_msgSend(v47, "unsignedLongLongValue"));

  v48 = [v6 objectForKey:@"isPublic"];
  objc_msgSend(v42, "setIsPublic:", objc_msgSend(v48, "BOOLValue"));

  v49 = [v6 objectForKey:@"isDeprecated"];
  objc_msgSend(v42, "setIsDeprecated:", objc_msgSend(v49, "BOOLValue"));

  v50 = [v6 objectForKey:@"replacementID"];
  [v42 setReplacementID:v50];

  v51 = [v6 objectForKey:@"parent"];
  v52 = [v51 recordID];
  v53 = [v52 recordName];
  [v42 setParentID:v53];

  v54 = [v6 objectForKey:@"defaultSectionTagID"];
  [v42 setChannelDefaultSectionID:v54];

  v55 = [v6 objectForKey:@"sectionTagIDs"];
  v56 = (void *)[v55 mutableCopy];
  [v42 setChannelSectionIDs:v56];

  unint64_t v57 = 0x1E4F29000uLL;
  objc_opt_class();
  v58 = [v6 objectForKey:@"logoImage"];
  if (v58)
  {
    if (objc_opt_isKindOfClass()) {
      v59 = v58;
    }
    else {
      v59 = 0;
    }
  }
  else
  {
    v59 = 0;
  }
  id v60 = v59;
  v61 = v246;
  [v246 setLogoURL:v60];

  v62 = [v6 objectForKey:@"iAdCategories"];
  v63 = (void *)[v62 mutableCopy];
  [v246 setIAdCategories:v63];

  v64 = [v6 objectForKey:@"iAdKeywords"];
  v65 = (void *)[v64 mutableCopy];
  [v246 setIAdKeywords:v65];

  v66 = [v6 objectForKey:@"blockedStorefrontIDs"];
  v67 = (void *)[v66 mutableCopy];
  [v246 setBlockedStorefrontIDs:v67];

  v68 = [v6 objectForKey:@"allowedStorefrontIDs"];
  v69 = (void *)[v68 mutableCopy];
  [v246 setAllowedStorefrontIDs:v69];

  uint64_t v70 = [v243 length];
  v71 = (void *)MEMORY[0x1E4F82A48];
  if (v70)
  {
    v72 = [MEMORY[0x1E4F82A48] feedConfigurationFromJSON:v243];
    [v246 setFeedConfiguration:v72];
  }
  else
  {
    v72 = [v6 objectForKey:@"feedConfiguration"];
    v73 = [v71 feedConfigurationFromJSON:v72];
    [v246 setFeedConfiguration:v73];
  }
  objc_opt_class();
  v74 = [v6 objectForKey:@"nameImage"];
  if (v74)
  {
    if (objc_opt_isKindOfClass()) {
      v75 = v74;
    }
    else {
      v75 = 0;
    }
  }
  else
  {
    v75 = 0;
  }
  id v76 = v75;
  [v246 setNameImageURL:v76];

  objc_opt_class();
  v77 = [v6 objectForKey:@"nameImageCompact"];
  if (v77)
  {
    if (objc_opt_isKindOfClass()) {
      v78 = v77;
    }
    else {
      v78 = 0;
    }
  }
  else
  {
    v78 = 0;
  }
  id v79 = v78;
  [v246 setNameImageCompactURL:v79];

  objc_opt_class();
  v80 = [v6 objectForKey:@"nameImageForDarkBackground"];
  if (v80)
  {
    if (objc_opt_isKindOfClass()) {
      v81 = v80;
    }
    else {
      v81 = 0;
    }
  }
  else
  {
    v81 = 0;
  }
  id v82 = v81;
  [v246 setNameImageForDarkBackgroundURL:v82];

  objc_opt_class();
  v83 = [v6 objectForKey:@"nameImageMask"];
  if (v83)
  {
    if (objc_opt_isKindOfClass()) {
      v84 = v83;
    }
    else {
      v84 = 0;
    }
  }
  else
  {
    v84 = 0;
  }
  id v85 = v84;
  [v246 setNameImageMaskURL:v85];

  v86 = [v6 objectForKey:@"nameImageMetadata"];
  [v246 setNameImageMetadata:v86];

  v87 = [v6 objectForKey:@"nameImageCompactMetadata"];
  [v246 setNameImageCompactMetadata:v87];

  v88 = [v6 objectForKey:@"nameImageMaskWidgetSmall"];
  [v246 setNameImageMaskWidgetLQURL:v88];

  v89 = [v6 objectForKey:@"nameImageMaskWidgetLarge"];
  [v246 setNameImageMaskWidgetHQURL:v89];

  v90 = [v6 objectForKey:@"nameImageLarge"];
  [v246 setNameImageLargeURL:v90];

  v91 = [v6 objectForKey:@"nameImageLargeMask"];
  [v246 setNameImageLargeMaskURL:v91];

  v92 = [v6 objectForKey:@"navigationChromeBackgroundImage"];
  [v246 setNavigationChromeBackgroundImageURL:v92];

  v93 = [v6 objectForKey:@"navigationChromeBackgroundDarkModeImage"];
  [v246 setDarkStyleNavigationChromeBackgroundImageURL:v93];

  v94 = [v6 objectForKey:@"navigationChromeBackgroundImageCompact"];
  [v246 setNavigationChromeBackgroundImageCompactURL:v94];

  v95 = [v6 objectForKey:@"navigationChromeBackgroundDarkModeImageCompact"];
  [v246 setDarkStyleNavigationChromeBackgroundImageCompactURL:v95];

  v96 = [v6 objectForKey:@"navigationChromeBackgroundImageLarge"];
  [v246 setNavigationChromeBackgroundImageLargeURL:v96];

  v97 = [v6 objectForKey:@"navigationChromeBackgroundDarkModeImageLarge"];
  [v246 setDarkStyleNavigationChromeBackgroundImageLargeURL:v97];

  objc_opt_class();
  v98 = [v6 objectForKey:@"coverImage"];
  if (v98)
  {
    if (objc_opt_isKindOfClass()) {
      v99 = v98;
    }
    else {
      v99 = 0;
    }
  }
  else
  {
    v99 = 0;
  }
  id v100 = v99;
  [v246 setCoverImageURL:v100];

  objc_opt_class();
  v101 = [v6 objectForKey:@"feedNavImage"];
  if (v101)
  {
    if (objc_opt_isKindOfClass()) {
      v102 = v101;
    }
    else {
      v102 = 0;
    }
  }
  else
  {
    v102 = 0;
  }
  id v103 = v102;
  [v246 setFeedNavImageURL:v103];

  objc_opt_class();
  v104 = [v6 objectForKey:@"feedNavImageHQ"];
  if (v104)
  {
    if (objc_opt_isKindOfClass()) {
      v105 = v104;
    }
    else {
      v105 = 0;
    }
  }
  else
  {
    v105 = 0;
  }
  id v106 = v105;
  [v246 setFeedNavImageHQURL:v106];

  objc_opt_class();
  v107 = [v6 objectForKey:@"language"];
  if (v107)
  {
    if (objc_opt_isKindOfClass()) {
      v108 = v107;
    }
    else {
      v108 = 0;
    }
  }
  else
  {
    v108 = 0;
  }
  id v109 = v108;
  [v246 setLanguage:v109];

  objc_opt_class();
  v110 = [v6 objectForKey:@"magazineGenre"];
  if (v110)
  {
    if (objc_opt_isKindOfClass()) {
      v111 = v110;
    }
    else {
      v111 = 0;
    }
  }
  else
  {
    v111 = 0;
  }
  id v112 = v111;
  [v246 setMagazineGenre:v112];

  v113 = [v6 objectForKey:@"template"];
  [v246 setTemplateJson:v113];

  v114 = [v6 objectForKey:@"score"];
  objc_msgSend(v246, "setScore:", objc_msgSend(v114, "unsignedLongLongValue"));

  v115 = [v6 objectForKey:@"minNewsVersion"];
  objc_msgSend(v246, "setMinimumNewsVersion:", +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v115));

  v116 = [v6 objectForKey:@"isNotificationEnabled"];
  objc_msgSend(v246, "setIsNotificationEnabled:", objc_msgSend(v116, "BOOLValue"));

  objc_opt_class();
  v117 = [v6 objectForKey:@"subtitle"];
  if (v117)
  {
    if (objc_opt_isKindOfClass()) {
      v118 = v117;
    }
    else {
      v118 = 0;
    }
  }
  else
  {
    v118 = 0;
  }
  id v119 = v118;
  [v246 setSubtitle:v119];

  v120 = [v6 objectForKey:@"latestIssueIDs"];
  [v246 setLatestIssueIDs:v120];

  v121 = [v6 objectForKey:@"recentIssueIDs"];
  [v246 setRecentIssueIDs:v121];

  v122 = [v244 objectForKeyedSubscript:@"highlightsArticleListID"];
  v123 = [v6 objectForKey:v122];
  [v246 setHighlightsArticleListID:v123];

  v124 = [v6 objectForKey:@"archiveIssueListID"];
  [v246 setArchiveIssueListID:v124];

  if (v235)
  {
    [v235 doubleValue];
    objc_msgSend(v246, "setSubscriptionRate:");
  }
  else
  {
    v125 = [v6 objectForKey:@"subscriptionRate"];
    [v125 doubleValue];
    objc_msgSend(v246, "setSubscriptionRate:");
  }
  v126 = [v6 objectForKey:@"adTargetingKeywords"];
  v127 = (void *)[v126 mutableCopy];
  [v246 setAdTargetingKeywords:v127];

  if ([v240 length])
  {
    id v128 = v240;
  }
  else
  {
    id v128 = [v6 objectForKey:@"sectionFeedConfiguration"];
  }
  v222 = v128;
  v129 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionaryFromJSON:", v128);
  uint64_t v130 = [v129 objectForKey:@"sectionFeedConfigurations"];

  v245 = v6;
  v232 = v35;
  v249 = (void *)v130;
  if (v130)
  {
    v131 = [MEMORY[0x1E4F1CA48] array];
    long long v250 = 0u;
    long long v251 = 0u;
    long long v252 = 0u;
    long long v253 = 0u;
    v132 = [v246 channelSectionIDs];
    uint64_t v133 = [v132 countByEnumeratingWithState:&v250 objects:v262 count:16];
    if (v133)
    {
      uint64_t v134 = v133;
      uint64_t v135 = *(void *)v251;
      do
      {
        for (uint64_t i = 0; i != v134; ++i)
        {
          if (*(void *)v251 != v135) {
            objc_enumerationMutation(v132);
          }
          v137 = *(char **)(*((void *)&v250 + 1) + 8 * i);
          v138 = (void *)MEMORY[0x1E4F82A48];
          v139 = [v249 objectForKeyedSubscript:v137];
          v140 = [v138 feedConfigurationFromDict:v139];

          if (v140)
          {
            [v131 addObject:v140];
          }
          else
          {
            v141 = (void *)FCRecordSourceLog;
            if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_ERROR))
            {
              v142 = v141;
              v143 = [v248 identifier];
              *(_DWORD *)buf = 138412546;
              v255 = v143;
              __int16 v256 = 2112;
              v257 = v137;
              _os_log_error_impl(&dword_1A460D000, v142, OS_LOG_TYPE_ERROR, "channel %@ is missing a feed configuration for section %@", buf, 0x16u);
            }
          }
        }
        uint64_t v134 = [v132 countByEnumeratingWithState:&v250 objects:v262 count:16];
      }
      while (v134);
    }

    v61 = v246;
    [v246 setChannelSectionFeedConfigurations:v131];

    unint64_t v57 = 0x1E4F29000;
  }
  else
  {
    v144 = [v246 channelSectionIDs];
    uint64_t v145 = [v144 count];

    if (v145)
    {
      v146 = (void *)FCRecordSourceLog;
      if (os_log_type_enabled((os_log_t)FCRecordSourceLog, OS_LOG_TYPE_ERROR))
      {
        v220 = v146;
        v221 = [v248 identifier];
        *(_DWORD *)buf = 138412290;
        v255 = v221;
        _os_log_error_impl(&dword_1A460D000, v220, OS_LOG_TYPE_ERROR, "channel %@ is missing section feed configurations", buf, 0xCu);
      }
    }
  }
  if ([v239 length])
  {
    [v61 setStocksFeedConfigurationJson:v239];
  }
  else
  {
    v147 = [v6 objectForKey:@"stocksFeedConfiguration"];
    [v61 setStocksFeedConfigurationJson:v147];
  }
  objc_opt_class();
  v148 = [v6 objectForKey:@"publisherPaidAuthorizationURL"];
  if (v148)
  {
    if (objc_opt_isKindOfClass()) {
      v149 = v148;
    }
    else {
      v149 = 0;
    }
  }
  else
  {
    v149 = 0;
  }
  id v150 = v149;
  [v61 setPublisherPaidAuthorizationURL:v150];

  objc_opt_class();
  v151 = [v6 objectForKey:@"publisherPaidVerificationURL"];
  if (v151)
  {
    if (objc_opt_isKindOfClass()) {
      v152 = v151;
    }
    else {
      v152 = 0;
    }
  }
  else
  {
    v152 = 0;
  }
  id v153 = v152;
  [v61 setPublisherPaidVerificationURL:v153];

  objc_opt_class();
  v154 = [v6 objectForKey:@"publisherPaidWebAccessURL"];
  if (v154)
  {
    if (objc_opt_isKindOfClass()) {
      v155 = v154;
    }
    else {
      v155 = 0;
    }
  }
  else
  {
    v155 = 0;
  }
  id v156 = v155;
  [v61 setPublisherPaidWebaccessURL:v156];

  uint64_t v157 = [v242 length];
  v158 = (void *)MEMORY[0x1E4F82B68];
  if (v157)
  {
    v159 = [MEMORY[0x1E4F82B68] purchaseOfferableConfigurationsFromJSON:v242];
    [v61 setPurchaseOfferableConfigurations:v159];
  }
  else
  {
    v159 = [v6 objectForKey:@"publisherPaidOfferableConfig"];
    v160 = [v158 purchaseOfferableConfigurationsFromJSON:v159];
    [v61 setPurchaseOfferableConfigurations:v160];
  }
  uint64_t v161 = [v241 length];
  v162 = (void *)MEMORY[0x1E4F82B50];
  if (v161)
  {
    v163 = [MEMORY[0x1E4F82B50] publisherPaidDescriptionStringsFromJSON:v241];
    [v61 setPublisherPaidDescriptionStrings:v163];
  }
  else
  {
    v163 = [v6 objectForKey:@"publisherPaidDescriptionStrings"];
    v164 = [v162 publisherPaidDescriptionStringsFromJSON:v163];
    [v61 setPublisherPaidDescriptionStrings:v164];
  }
  v165 = [v6 objectForKey:@"publisherPaidFeldsparablePurchaseIDs"];
  v166 = (void *)[v165 mutableCopy];
  [v61 setPublisherPaidFeldsparablePurchaseIDs:v166];

  v167 = [v6 objectForKey:@"publisherPaidBundlePurchaseIDs"];
  v168 = (void *)[v167 mutableCopy];
  [v61 setPublisherPaidBundlePurchaseIDs:v168];

  v169 = [v6 objectForKey:@"publisherPaidLeakyPaywallOptOut"];
  objc_msgSend(v61, "setPublisherPaidLeakyPaywallOptOut:", objc_msgSend(v169, "BOOLValue"));

  v170 = [v61 publisherPaidWebaccessURL];
  objc_msgSend(v61, "setPublisherPaidWebOptIn:", objc_msgSend(v170, "length") != 0);

  objc_opt_class();
  v171 = [v244 objectForKeyedSubscript:@"paidBundleSubscriptionButtonConfig"];
  v172 = [v6 objectForKey:v171];
  if (v172)
  {
    if (objc_opt_isKindOfClass()) {
      v173 = v172;
    }
    else {
      v173 = 0;
    }
  }
  else
  {
    v173 = 0;
  }
  id v174 = v173;

  objc_opt_class();
  v175 = [v6 objectForKey:@"paidBundleSubscriptionButtonConfig"];
  if (v175)
  {
    if (objc_opt_isKindOfClass()) {
      v176 = v175;
    }
    else {
      v176 = 0;
    }
  }
  else
  {
    v176 = 0;
  }
  unint64_t v177 = v57;
  id v178 = v176;

  uint64_t v179 = [v174 length];
  id v180 = v174;
  if (!v179)
  {
    if (objc_msgSend(v178, "length", v174)) {
      id v180 = v178;
    }
    else {
      id v180 = 0;
    }
  }
  v247 = v178;
  [v61 setPaidBundlePaywallConfigurationJson:v180];
  v181 = [v61 allowedStorefrontIDs];
  [v181 removeObject:&stru_1EF8299B8];

  v182 = [v6 objectForKey:@"nameImageScaleFactor"];
  [v182 doubleValue];
  objc_msgSend(v61, "setNameImageScaleFactor:");

  v183 = [v6 objectForKey:@"nameImageBaselineShift"];
  objc_msgSend(v61, "setNameImageBaselineShift:", objc_msgSend(v183, "integerValue"));

  v184 = [(FCRecordSource *)v234 resolveLocalizableExperimentalizableFieldforKey:@"groupingAvailability" inRecord:v6 activeExperimentIDKey:@"activeExperimentID"];
  v185 = v184;
  if (v184)
  {
    unint64_t v186 = [v184 integerValue];
    if (v186 < 4)
    {
      unint64_t v187 = v186;
      goto LABEL_142;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v219 = (void *)[objc_alloc(*(Class *)(v177 + 24)) initWithFormat:@"Encountered an unknown grouping availability value %@", v185];
      *(_DWORD *)buf = 136315906;
      v255 = "-[FCTagRecordSource recordFromCKRecord:base:]";
      __int16 v256 = 2080;
      v257 = "FCTagRecordSource.m";
      __int16 v258 = 1024;
      int v259 = 485;
      __int16 v260 = 2114;
      v261 = v219;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
  unint64_t v187 = 0;
LABEL_142:
  [v61 setGroupingAvailability:v187];
  if (v238)
  {
    objc_msgSend(v61, "setIsHidden:", objc_msgSend(v238, "BOOLValue"));
  }
  else
  {
    v188 = [v6 objectForKey:@"isHidden"];
    objc_msgSend(v61, "setIsHidden:", objc_msgSend(v188, "BOOLValue"));
  }
  v189 = [v6 objectForKey:@"behaviorFlags"];
  objc_msgSend(v61, "setBehaviorFlags:", objc_msgSend(v189, "unsignedLongLongValue"));

  v190 = [v6 objectForKey:@"propertyFlags"];
  objc_msgSend(v61, "setPropertyFlags:", objc_msgSend(v190, "unsignedLongLongValue"));

  v191 = [v244 objectForKeyedSubscript:@"propertyFlagsLocalized"];
  v192 = [v6 objectForKey:v191];
  objc_msgSend(v61, "setPropertyFlagsLocalized:", objc_msgSend(v192, "unsignedLongLongValue"));

  objc_opt_class();
  v193 = [v244 objectForKeyedSubscript:@"articleRecirculationConfiguration"];
  v194 = [v6 objectForKey:v193];
  if (v194)
  {
    if (objc_opt_isKindOfClass()) {
      v195 = v194;
    }
    else {
      v195 = 0;
    }
  }
  else
  {
    v195 = 0;
  }
  id v196 = v195;

  objc_opt_class();
  v197 = [v245 objectForKey:@"articleRecirculationConfiguration"];
  if (v197)
  {
    if (objc_opt_isKindOfClass()) {
      v198 = v197;
    }
    else {
      v198 = 0;
    }
  }
  else
  {
    v198 = 0;
  }
  id v199 = v198;

  if (v196) {
    id v200 = v196;
  }
  else {
    id v200 = v199;
  }
  [v61 setArticleRecirculationConfiguration:v200];
  v201 = [v245 objectForKey:@"superGroupKnobs"];
  v202 = (void *)[v201 mutableCopy];
  [v61 setSupergroupKnobsJson:v202];

  v203 = [v245 objectForKey:@"superGroupConfig"];
  v204 = (void *)[v203 mutableCopy];
  [v61 setSupergroupConfigJson:v204];

  if (v231)
  {
    [v61 setSuperfeedConfigResourceID:v231];
  }
  else
  {
    v205 = [v245 objectForKey:@"superfeedConfigResourceID"];
    [v61 setSuperfeedConfigResourceID:v205];
  }
  if (v237)
  {
    objc_msgSend(v61, "setSportsRecommendationMappingsJson:");
  }
  else
  {
    v206 = [v245 objectForKey:@"sportsRecommendationMappings"];
    [v61 setSportsRecommendationMappingsJson:v206];
  }
  v207 = v236;
  if (!v236)
  {
    v207 = [v245 objectForKey:@"isSportsRecommendable"];
  }
  objc_msgSend(v61, "setIsSportsRecommendable:", objc_msgSend(v207, "BOOLValue"));
  if (!v236) {

  }
  if (v230)
  {
    [v61 setSportsData:v230];
    v208 = v245;
  }
  else
  {
    v208 = v245;
    v209 = [v245 objectForKey:@"sportsData"];
    [v61 setSportsData:v209];
  }
  v210 = [v208 objectForKey:@"sportsTheme"];
  [v61 setSportsTheme:v210];

  v211 = [v208 objectForKey:@"sportsLogoImage"];
  [v61 setSportsLogoImageURL:v211];

  v212 = [v208 objectForKey:@"sportsLogoImageCompact"];
  [v61 setSportsLogoImageCompactURL:v212];

  v213 = [v208 objectForKey:@"sportsLogoImageLarge"];
  [v61 setSportsLogoImageLargeURL:v213];

  v214 = [v208 objectForKey:@"sportsLogoAltImage"];
  [v61 setSportsLogoAltImageURL:v214];

  v215 = [v208 objectForKey:@"sportsLogoAltImageCompact"];
  [v61 setSportsLogoAltImageCompactURL:v215];

  v216 = [v208 objectForKey:@"sportsLogoAltImageLarge"];
  [v61 setSportsLogoAltImageLargeURL:v216];

  return v61;
}

+ (id)defaultCachePolicy
{
  if (qword_1EB5D0EC0 != -1) {
    dispatch_once(&qword_1EB5D0EC0, &__block_literal_global_50_3);
  }
  v2 = (void *)qword_1EB5D0EB8;
  return v2;
}

uint64_t __39__FCTagRecordSource_defaultCachePolicy__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1EB5D0EB8;
  qword_1EB5D0EB8 = v0;

  [(id)qword_1EB5D0EB8 setCachePolicy:4];
  v2 = NewsCoreUserDefaults();
  int v3 = [v2 BOOLForKey:@"reduce_tags_cache_refresh"];

  v4 = (void *)qword_1EB5D0EB8;
  double v5 = 604800.0;
  if (v3) {
    double v5 = 180.0;
  }
  return [v4 setMaximumCachedAge:v5];
}

- (id)saveTagRecords:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCTagRecordSource;
  int v3 = [(FCRecordSource *)&v5 saveRecords:a3];
  return v3;
}

- (id)nonLocalizableKeys
{
  return self->_nonLocalizableKeys;
}

- (unint64_t)desiredFieldOptions
{
  return self->_desiredFieldOptions;
}

- (void)setDesiredFieldOptions:(unint64_t)a3
{
  self->_desiredFieldOptions = a3;
}

- (void).cxx_destruct
{
}

@end