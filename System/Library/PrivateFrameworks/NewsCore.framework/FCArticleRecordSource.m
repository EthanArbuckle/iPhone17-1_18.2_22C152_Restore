@interface FCArticleRecordSource
+ (BOOL)supportsDeletions;
+ (id)canaryRecordName;
+ (id)changeTagFromCKRecord:(id)a3;
+ (id)identifierFromCKRecord:(id)a3;
+ (id)modificationDateFromCKRecord:(id)a3;
- (FCArticleRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 desiredArticleRecordFieldOptions:(unint64_t)a7 experimentalizableFieldsPostfix:(id)a8 engagementCohortsExpField:(id)a9 conversionCohortsExpField:(id)a10 activeTreatmentID:(id)a11;
- (FCArticleRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 experimentalizableFieldsPostfix:(id)a7 activeTreatmentID:(id)a8;
- (NFUnfairLock)experimentalFieldsLock;
- (NSArray)articleTagMetadataRecordKeys;
- (NSArray)conversionRecordKeys;
- (NSArray)embeddingRecordKeys;
- (NSArray)engagementRecordKeys;
- (NSArray)topicFlagsRecordKeys;
- (NSString)conversionCohortsExpField;
- (NSString)engagementCohortsExpField;
- (id)alwaysLocalizedKeys;
- (id)articleTagMetadataFromCKRecord:(id)a3;
- (id)articleTopicsFromCKRecord:(id)a3 engagement:(id)a4 conversionStats:(id)a5 tagMetadata:(id)a6;
- (id)conversionStatsFromCKRecord:(id)a3;
- (id)engagementFromCKRecord:(id)a3;
- (id)experimentalizableKeys;
- (id)localizableExperimentalizableKeys;
- (id)localizableKeys;
- (id)nonLocalizableKeys;
- (id)recordFromCKRecord:(id)a3 base:(id)a4;
- (id)recordIDPrefixes;
- (id)recordType;
- (id)saveArticleRecords:(id)a3;
- (id)storeFilename;
- (id)topicFlagsFromCKRecord:(id)a3;
- (id)urlStringForThumbnailKey:(id)a3 inRecord:(id)a4;
- (int)pbRecordType;
- (unint64_t)desiredArticleRecordFieldOptions;
- (unint64_t)highThresholdDataSizeLimit;
- (unint64_t)lowThresholdDataSizeLimit;
- (unint64_t)storeVersion;
- (void)_setEngagementCohortsExpField:(id)a3 conversionCohortsExpField:(id)a4;
- (void)setArticleTagMetadataRecordKeys:(id)a3;
- (void)setConversionCohortsExpField:(id)a3;
- (void)setConversionRecordKeys:(id)a3;
- (void)setDesiredArticleRecordFieldOptions:(unint64_t)a3;
- (void)setEmbeddingRecordKeys:(id)a3;
- (void)setEngagementCohortsExpField:(id)a3;
- (void)setEngagementRecordKeys:(id)a3;
- (void)setExperimentalFieldsLock:(id)a3;
- (void)setTopicFlagsRecordKeys:(id)a3;
- (void)updateEngagementCohortsExpField:(id)a3 conversionCohortsExpField:(id)a4;
@end

@implementation FCArticleRecordSource

- (id)recordIDPrefixes
{
  return &unk_1EF8D8B20;
}

- (id)recordType
{
  return @"Article";
}

- (unint64_t)storeVersion
{
  return 45;
}

- (id)storeFilename
{
  return @"article-record-source";
}

- (id)alwaysLocalizedKeys
{
  int v2 = [(FCArticleRecordSource *)self desiredArticleRecordFieldOptions];
  return FCArticleRecordSourceAlwaysLocalizedKeysFromDesiredFieldOptions(v2);
}

- (id)localizableKeys
{
  [(FCArticleRecordSource *)self desiredArticleRecordFieldOptions];
  return __FCArticleRecordSourceLocalizableKeysFromDesiredFieldOptions_block_invoke();
}

- (unint64_t)desiredArticleRecordFieldOptions
{
  return self->_desiredArticleRecordFieldOptions;
}

- (id)nonLocalizableKeys
{
  int v3 = [(FCArticleRecordSource *)self desiredArticleRecordFieldOptions];
  v4 = [(FCArticleRecordSource *)self engagementCohortsExpField];
  v5 = [(FCArticleRecordSource *)self conversionCohortsExpField];
  v6 = FCArticleRecordSourceDesiredKeysFromDesiredFieldOptions(v3, v4, v5);

  return v6;
}

- (id)localizableExperimentalizableKeys
{
  if (qword_1EB5D0F70 != -1) {
    dispatch_once(&qword_1EB5D0F70, &__block_literal_global_82);
  }
  int v2 = (void *)qword_1EB5D0F68;
  return v2;
}

- (id)experimentalizableKeys
{
  if (qword_1EB5D0F60 != -1) {
    dispatch_once(&qword_1EB5D0F60, &__block_literal_global_78);
  }
  int v2 = (void *)qword_1EB5D0F58;
  return v2;
}

- (NSString)engagementCohortsExpField
{
  return self->_engagementCohortsExpField;
}

- (NSString)conversionCohortsExpField
{
  return self->_conversionCohortsExpField;
}

- (int)pbRecordType
{
  return 1;
}

- (FCArticleRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 desiredArticleRecordFieldOptions:(unint64_t)a7 experimentalizableFieldsPostfix:(id)a8 engagementCohortsExpField:(id)a9 conversionCohortsExpField:(id)a10 activeTreatmentID:(id)a11
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentDatabase");
    *(_DWORD *)buf = 136315906;
    v34 = "-[FCArticleRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:desired"
          "ArticleRecordFieldOptions:experimentalizableFieldsPostfix:engagementCohortsExpField:conversionCohortsExpField:"
          "activeTreatmentID:]";
    __int16 v35 = 2080;
    v36 = "FCArticleRecordSource.m";
    __int16 v37 = 1024;
    int v38 = 363;
    __int16 v39 = 2114;
    v40 = v30;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18) {
      goto LABEL_6;
    }
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "contentDirectory");
    *(_DWORD *)buf = 136315906;
    v34 = "-[FCArticleRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:desired"
          "ArticleRecordFieldOptions:experimentalizableFieldsPostfix:engagementCohortsExpField:conversionCohortsExpField:"
          "activeTreatmentID:]";
    __int16 v35 = 2080;
    v36 = "FCArticleRecordSource.m";
    __int16 v37 = 1024;
    int v38 = 364;
    __int16 v39 = 2114;
    v40 = v31;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v32.receiver = self;
  v32.super_class = (Class)FCArticleRecordSource;
  v25 = [(FCRecordSource *)&v32 initWithContentDatabase:v17 contentDirectory:v18 appActivityMonitor:v19 backgroundTaskable:v20 experimentalizableFieldsPostfix:v21 activeTreatmentID:v24];
  v26 = v25;
  if (v25)
  {
    v25->_desiredArticleRecordFieldOptions = a7;
    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    experimentalFieldsLock = v26->_experimentalFieldsLock;
    v26->_experimentalFieldsLock = (NFUnfairLock *)v27;

    [(FCArticleRecordSource *)v26 _setEngagementCohortsExpField:v22 conversionCohortsExpField:v23];
  }

  return v26;
}

- (void)_setEngagementCohortsExpField:(id)a3 conversionCohortsExpField:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(FCArticleRecordSource *)self experimentalFieldsLock];
  [v8 lock];

  v9 = (NSString *)[v7 copy];
  engagementCohortsExpField = self->_engagementCohortsExpField;
  self->_engagementCohortsExpField = v9;

  v11 = (NSString *)[v6 copy];
  conversionCohortsExpField = self->_conversionCohortsExpField;
  self->_conversionCohortsExpField = v11;

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__FCArticleRecordSource__setEngagementCohortsExpField_conversionCohortsExpField___block_invoke;
  v19[3] = &unk_1E5B4BF30;
  v19[4] = self;
  objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v19);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  engagementRecordKeys = self->_engagementRecordKeys;
  self->_engagementRecordKeys = v13;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__FCArticleRecordSource__setEngagementCohortsExpField_conversionCohortsExpField___block_invoke_2;
  v18[3] = &unk_1E5B4BF30;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v18);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  conversionRecordKeys = self->_conversionRecordKeys;
  self->_conversionRecordKeys = v15;

  id v17 = [(FCArticleRecordSource *)self experimentalFieldsLock];
  [v17 unlock];
}

- (NFUnfairLock)experimentalFieldsLock
{
  return self->_experimentalFieldsLock;
}

void __81__FCArticleRecordSource__setEngagementCohortsExpField_conversionCohortsExpField___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 208);
  id v4 = a2;
  objc_msgSend(v4, "fc_safelyAddObject:", v3);
  id v6 = [*(id *)(a1 + 32) localizedKeysByOriginalKey];
  v5 = [v6 objectForKeyedSubscript:@"conversionCohortsBaseline"];
  objc_msgSend(v4, "fc_safelyAddObject:", v5);
}

void __81__FCArticleRecordSource__setEngagementCohortsExpField_conversionCohortsExpField___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 200);
  id v8 = a2;
  objc_msgSend(v8, "fc_safelyAddObject:", v3);
  id v4 = [*(id *)(a1 + 32) localizedKeysByOriginalKey];
  v5 = [v4 objectForKeyedSubscript:@"engagementCohortsBaseline"];
  objc_msgSend(v8, "fc_safelyAddObject:", v5);

  id v6 = [*(id *)(a1 + 32) localizedKeysByOriginalKey];
  id v7 = [v6 objectForKeyedSubscript:@"scores"];
  objc_msgSend(v8, "fc_safelyAddObject:", v7);

  [v8 addObject:@"scores"];
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 10000000;
}

uint64_t __47__FCArticleRecordSource_experimentalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"activeExperimentID", 0);
  uint64_t v1 = qword_1EB5D0F58;
  qword_1EB5D0F58 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __58__FCArticleRecordSource_localizableExperimentalizableKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"topicFlags", 0);
  uint64_t v1 = qword_1EB5D0F68;
  qword_1EB5D0F68 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (FCArticleRecordSource)initWithContentDatabase:(id)a3 contentDirectory:(id)a4 appActivityMonitor:(id)a5 backgroundTaskable:(id)a6 experimentalizableFieldsPostfix:(id)a7 activeTreatmentID:(id)a8
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
    id v19 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v25 = "-[FCArticleRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experim"
          "entalizableFieldsPostfix:activeTreatmentID:]";
    __int16 v26 = 2080;
    uint64_t v27 = "FCArticleRecordSource.m";
    __int16 v28 = 1024;
    int v29 = 350;
    __int16 v30 = 2114;
    v31 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v20 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v21 = *MEMORY[0x1E4F1C3B8];
  id v22 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCArticleRecordSource initWithContentDatabase:contentDirectory:appActivityMonitor:backgroundTaskable:experimentalizableFieldsPostfix:activeTreatmentID:]"];
  id v23 = [v20 exceptionWithName:v21 reason:v22 userInfo:0];

  objc_exception_throw(v23);
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 4000000;
}

- (id)urlStringForThumbnailKey:(id)a3 inRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([(id)objc_opt_class() useTaggedImages])
  {
    id v7 = [v5 stringByAppendingString:@"2"];
    id v8 = [v6 objectForKey:v7];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v6 objectForKey:v5];
    }
    v11 = v10;
  }
  else
  {
    v11 = [v6 objectForKey:v5];
  }

  return v11;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (objc_class *)MEMORY[0x1E4F829B0];
  id v8 = a4;
  id v9 = objc_alloc_init(v7);
  [v9 setBase:v8];

  id v10 = [(FCRecordSource *)self localizedKeysByOriginalKey];
  v11 = [v6 objectForKey:@"title"];
  [v9 setTitle:v11];

  v12 = [v6 objectForKey:@"titleCompact"];
  [v9 setTitleCompact:v12];

  id v13 = [v6 objectForKey:@"titlesExperimental"];
  [v9 setExperimentalTitles:v13];

  id v14 = [v6 objectForKey:@"sourceChannelTagID"];
  [v9 setSourceChannelTagID:v14];

  id v15 = [v6 objectForKey:@"publishDate"];
  id v16 = [v15 pbDate];
  [v9 setPublishDate:v16];

  id v17 = [v6 objectForKey:@"publisherArticleVersion"];
  objc_msgSend(v9, "setPublisherArticleVersion:", objc_msgSend(v17, "longLongValue"));

  id v18 = [v6 objectForKey:@"backendArticleVersion"];
  objc_msgSend(v9, "setBackendArticleVersion:", objc_msgSend(v18, "longLongValue"));

  id v19 = [v6 objectForKey:@"thumbnailFocalFrame"];
  objc_msgSend(v9, "setThumbnailFocalFrame:", objc_msgSend(v19, "unsignedLongLongValue"));

  id v20 = [v6 objectForKey:@"thumbnailPerceptualHash"];
  [v9 setThumbnailPerceptualHash:v20];

  uint64_t v21 = [v6 objectForKey:@"thumbnailLQMetadata"];
  objc_msgSend(v9, "setThumbnailLQMetadata:", objc_msgSend(v21, "unsignedLongLongValue"));

  id v22 = [v6 objectForKey:@"thumbnailMetadata"];
  objc_msgSend(v9, "setThumbnailMetadata:", objc_msgSend(v22, "unsignedLongLongValue"));

  id v23 = [v6 objectForKey:@"thumbnailMediumMetadata"];
  objc_msgSend(v9, "setThumbnailMediumMetadata:", objc_msgSend(v23, "unsignedLongLongValue"));

  id v24 = [v6 objectForKey:@"thumbnailHQMetadata"];
  objc_msgSend(v9, "setThumbnailHQMetadata:", objc_msgSend(v24, "unsignedLongLongValue"));

  v25 = [v6 objectForKey:@"thumbnailUltraHQMetadata"];
  objc_msgSend(v9, "setThumbnailUltraHQMetadata:", objc_msgSend(v25, "unsignedLongLongValue"));

  __int16 v26 = [v6 objectForKey:@"thumbnailWidgetLQMetadata"];
  objc_msgSend(v9, "setThumbnailWidgetLQMetadata:", objc_msgSend(v26, "unsignedLongLongValue"));

  uint64_t v27 = [v6 objectForKey:@"thumbnailWidgetMetadata"];
  objc_msgSend(v9, "setThumbnailWidgetMetadata:", objc_msgSend(v27, "unsignedLongLongValue"));

  __int16 v28 = [v6 objectForKey:@"thumbnailWidgetHQMetadata"];
  objc_msgSend(v9, "setThumbnailWidgetHQMetadata:", objc_msgSend(v28, "unsignedLongLongValue"));

  int v29 = [(FCArticleRecordSource *)self urlStringForThumbnailKey:@"thumbnailLQ" inRecord:v6];
  [v9 setThumbnailLQURL:v29];

  __int16 v30 = [(FCArticleRecordSource *)self urlStringForThumbnailKey:@"thumbnail" inRecord:v6];
  [v9 setThumbnailURL:v30];

  v31 = [(FCArticleRecordSource *)self urlStringForThumbnailKey:@"thumbnailMedium" inRecord:v6];
  [v9 setThumbnailMediumURL:v31];

  uint64_t v32 = [(FCArticleRecordSource *)self urlStringForThumbnailKey:@"thumbnailHQ" inRecord:v6];
  [v9 setThumbnailHQURL:v32];

  v33 = [(FCArticleRecordSource *)self urlStringForThumbnailKey:@"thumbnailUltraHQ" inRecord:v6];
  [v9 setThumbnailUltraHQURL:v33];

  int v34 = [(id)objc_opt_class() useTaggedImages];
  if (v34)
  {
    __int16 v35 = [v6 objectForKey:@"thumbnailWidgetLQ2"];
    if (v35) {
      v36 = @"thumbnailWidgetLQ2";
    }
    else {
      v36 = @"thumbnailWidgetLQ";
    }
    __int16 v37 = [v6 objectForKey:v36];
    [v9 setThumbnailWidgetLQURL:v37];

    uint64_t v38 = [v6 objectForKey:@"thumbnailWidget2"];
    if (v38)
    {
      __int16 v39 = (void *)v38;
      v40 = [v6 objectForKey:@"thumbnailWidget2"];
      [v9 setThumbnailWidgetURL:v40];

      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v41 = [v6 objectForKey:@"thumbnailWidgetLQ"];
    [v9 setThumbnailWidgetLQURL:v41];
  }
  v42 = [v6 objectForKey:@"thumbnailWidget"];
  [v9 setThumbnailWidgetURL:v42];

  if (!v34)
  {
    v43 = [v6 objectForKey:@"thumbnailWidgetHQ"];
    [v9 setThumbnailWidgetHQURL:v43];
    goto LABEL_14;
  }
LABEL_9:
  v43 = [v6 objectForKey:@"thumbnailWidgetHQ2"];
  if (v43) {
    v44 = @"thumbnailWidgetHQ2";
  }
  else {
    v44 = @"thumbnailWidgetHQ";
  }
  v45 = [v6 objectForKey:v44];
  [v9 setThumbnailWidgetHQURL:v45];

LABEL_14:
  v46 = [v6 objectForKey:@"thumbnailPrimaryColor"];
  [v9 setThumbnailPrimaryColor:v46];

  v47 = [v6 objectForKey:@"thumbnailBackgroundColor"];
  [v9 setThumbnailBackgroundColor:v47];

  v48 = [v6 objectForKey:@"thumbnailTextColor"];
  [v9 setThumbnailTextColor:v48];

  v49 = [v6 objectForKey:@"thumbnailAccentColor"];
  [v9 setThumbnailAccentColor:v49];

  v50 = [v6 objectForKey:@"shortExcerpt"];
  [v9 setShortExcerpt:v50];

  v51 = [v6 objectForKey:@"accessoryText"];
  [v9 setAccessoryText:v51];

  v52 = [v6 objectForKey:@"contentURL"];
  [v9 setContentURL:v52];

  v53 = [v6 objectForKey:@"contentType"];
  [v9 setContentType:PBArticleContentTypeFromString(v53)];

  v54 = [v6 objectForKey:@"clusterID"];
  [v9 setClusterID:v54];

  objc_opt_class();
  v55 = [v6 objectForKey:@"flintDocument"];
  if (v55)
  {
    if (objc_opt_isKindOfClass()) {
      v56 = v55;
    }
    else {
      v56 = 0;
    }
  }
  else
  {
    v56 = 0;
  }
  id v57 = v56;
  [v9 setFlintDocumentURL:v57];

  v58 = [v6 objectForKey:@"flintFontResourceIDs"];
  v59 = objc_msgSend(v58, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_92_0);

  v60 = (void *)[v59 mutableCopy];
  [v9 setFlintFontResourceIDs:v60];

  v61 = [v6 objectForKey:@"videoURL"];
  [v9 setVideoURL:v61];

  v62 = [v6 objectForKey:@"videoStillImage"];
  [v9 setVideoStillImageURL:v62];

  v63 = [v6 objectForKey:@"videoDuration"];
  [v63 doubleValue];
  objc_msgSend(v9, "setVideoDuration:");

  v64 = [v6 objectForKey:@"videoType"];
  [v9 setVideoType:v64];

  v65 = [v6 objectForKey:@"sportsEventIDs"];
  v66 = (void *)[v65 mutableCopy];
  [v9 setSportsEventIDs:v66];

  v67 = [v6 objectForKey:@"isFeature"];
  objc_msgSend(v9, "setIsFeatureCandidate:", objc_msgSend(v67, "BOOLValue"));

  v68 = [v6 objectForKey:@"isSponsored"];
  objc_msgSend(v9, "setIsSponsored:", objc_msgSend(v68, "BOOLValue"));

  v69 = [v6 objectForKey:@"iAdCategories"];
  v70 = (void *)[v69 mutableCopy];
  [v9 setIAdCategories:v70];

  v71 = [v6 objectForKey:@"iAdKeywords"];
  v72 = (void *)[v71 mutableCopy];
  [v9 setIAdKeywords:v72];

  v73 = [v6 objectForKey:@"iAdSectionTagIDs"];
  v74 = (void *)[v73 mutableCopy];
  [v9 setIAdSectionIDs:v74];

  v75 = [v6 objectForKey:@"blockedStorefrontIDs"];
  v76 = (void *)[v75 mutableCopy];
  [v9 setBlockedStorefrontIDs:v76];

  v77 = [v6 objectForKey:@"allowedStorefrontIDs"];
  v78 = (void *)[v77 mutableCopy];
  [v9 setAllowedStorefrontIDs:v78];

  v79 = [v6 objectForKey:@"isDraft"];
  objc_msgSend(v9, "setIsDraft:", objc_msgSend(v79, "BOOLValue"));

  v80 = [v6 objectForKey:@"primaryAudience"];
  [v9 setPrimaryAudience:v80];

  v81 = [v6 objectForKey:@"referencedArticleID"];
  [v9 setReferencedArticleID:v81];

  v82 = [v6 objectForKey:@"relatedArticleIDs2"];
  v83 = (void *)[v82 mutableCopy];
  [v9 setRelatedArticleIDs:v83];

  v84 = [v6 objectForKey:@"moreFromPublisherArticleIDs"];
  v85 = (void *)[v84 mutableCopy];
  [v9 setMoreFromPublisherArticleIDs:v85];

  v86 = [v6 objectForKey:@"parentIssueID"];
  [v9 setParentIssueID:v86];

  v87 = [v6 objectForKey:@"halfLifeMillis"];
  objc_msgSend(v9, "setHalfLifeMilliseconds:", objc_msgSend(v87, "unsignedLongLongValue"));

  v88 = [v6 objectForKey:@"halfLifeMillisOverride"];
  objc_msgSend(v9, "setHalfLifeMillisecondsOverride:", objc_msgSend(v88, "unsignedLongLongValue"));

  v89 = [v6 objectForKey:@"linkedArticleIDs"];
  v90 = (void *)[v89 mutableCopy];
  [v9 setLinkedArticleIDs:v90];

  v91 = [v6 objectForKey:@"linkedIssueIDs"];
  v92 = (void *)[v91 mutableCopy];
  [v9 setLinkedIssueIDs:v92];

  v93 = [v6 objectForKey:@"bodyTextLength"];
  objc_msgSend(v9, "setBodyTextLength:", objc_msgSend(v93, "longLongValue"));

  v94 = [v6 objectForKey:@"storyType"];
  [v9 setStoryType:PBArticleStoryTypeFromString(v94)];

  v95 = [v6 objectForKey:@"role"];
  [v9 setRole:PBArticleRoleFromString(v95)];

  v96 = [v6 objectForKey:@"behaviorFlags"];
  objc_msgSend(v9, "setBehaviorFlags:", objc_msgSend(v96, "unsignedLongLongValue"));

  v97 = [v6 objectForKey:@"minNewsVersion"];
  objc_msgSend(v9, "setMinimumNewsVersion:", +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v97));

  v98 = [v6 objectForKey:@"coverArt"];
  [v9 setCoverArt:v98];

  v99 = [v6 objectForKey:@"videoCallToActionTitle"];
  [v9 setVideoCallToActionTitle:v99];

  v100 = [v6 objectForKey:@"videoCallToActionURL"];
  [v9 setVideoCallToActionURL:v100];

  v101 = [v6 objectForKey:@"isPaid"];
  objc_msgSend(v9, "setIsPaid:", objc_msgSend(v101, "BOOLValue"));

  v102 = [v6 objectForKey:@"isBundlePaid"];
  objc_msgSend(v9, "setIsBundlePaid:", objc_msgSend(v102, "BOOLValue"));

  v103 = [v6 objectForKey:@"isIssueOnly"];
  objc_msgSend(v9, "setIsIssueOnly:", objc_msgSend(v103, "BOOLValue"));

  v104 = [v6 objectForKey:@"clusterIDStocks"];
  [v9 setStocksClusterID:v104];

  v105 = [v10 objectForKeyedSubscript:@"stocksMetadata"];
  v106 = [v6 objectForKey:v105];
  if (v106)
  {
    [v9 setStocksMetadata:v106];
  }
  else
  {
    v107 = [v6 objectForKey:@"stocksMetadata"];
    [v9 setStocksMetadata:v107];
  }
  v108 = [v10 objectForKeyedSubscript:@"stocksScores"];
  v109 = [v6 objectForKey:v108];
  if (v109)
  {
    [v9 setStocksScores:v109];
  }
  else
  {
    v110 = [v6 objectForKey:@"stocksScores"];
    [v9 setStocksScores:v110];
  }
  v111 = [v6 objectForKey:@"language"];
  [v9 setLanguage:v111];

  v112 = [v6 objectForKey:@"narrativeTrackMetadata"];
  [v9 setNarrativeTrackMetadata:v112];

  v113 = [v6 objectForKey:@"narrativeTrackFullURL"];
  [v9 setNarrativeTrackFullURL:v113];

  v114 = [v6 objectForKey:@"narrativeTrackSampleURL"];
  [v9 setNarrativeTrackSampleURL:v114];

  v115 = [v6 objectForKey:@"narrativeTrackTextRanges"];
  [v9 setNarrativeTrackTextRanges:v115];

  v116 = [v6 objectForKey:@"authors"];
  [v9 setAuthors:v116];

  v117 = [v6 objectForKey:@"layeredCover"];
  [v9 setLayeredCover:v117];

  v118 = [v6 objectForKey:@"layeredCoverAspectRatio"];
  [v118 doubleValue];
  objc_msgSend(v9, "setLayeredCoverAspectRatio:");

  v119 = [v6 objectForKey:@"float16TitleEncoding"];
  [v9 setFloat16TitleEncoding:v119];

  v120 = [v6 objectForKey:@"float16FullBodyEncoding"];
  [v9 setFloat16FullBodyEncoding:v120];

  v121 = [(FCArticleRecordSource *)self engagementFromCKRecord:v6];
  v122 = [v121 globalCohorts];
  [v9 setGlobalCohorts:v122];

  v123 = [v121 sourceChannelCohorts];
  [v9 setSourceChannelCohorts:v123];

  v124 = [(FCArticleRecordSource *)self conversionStatsFromCKRecord:v6];
  v125 = [v124 globalConversionStats];
  [v9 setGlobalConversionStats:v125];

  v126 = [v124 channelConversionStats];
  [v9 setChannelConversionStats:v126];

  v127 = [(FCArticleRecordSource *)self articleTagMetadataFromCKRecord:v6];
  v128 = [v127 channelTagMetadata];
  [v9 setChannelTagMetadata:v128];

  v129 = [v127 topicTagMetadatas];
  v130 = [(FCArticleRecordSource *)self articleTopicsFromCKRecord:v6 engagement:v121 conversionStats:v124 tagMetadata:v129];
  [v9 setTopics:v130];

  v131 = [v9 allowedStorefrontIDs];
  [v131 removeObject:&stru_1EF8299B8];

  v132 = [v6 objectForKey:@"schemaFlags"];
  objc_msgSend(v9, "setSchemaFlags:", objc_msgSend(v132, "integerValue"));

  v133 = [v10 objectForKeyedSubscript:@"articleRecirculationConfigurationAsset"];
  v134 = [v6 objectForKey:v133];
  [v9 setArticleRecirculationConfigurationURL:v134];

  v135 = [v6 objectForKey:@"publisherSpecifiedArticleIDs"];
  [v9 setPublisherSpecifiedArticleIDs:v135];

  id v136 = objc_alloc(MEMORY[0x1E4F82920]);
  v137 = [v6 objectForKey:@"expirationData"];
  v138 = (void *)[v136 initWithData:v137];
  [v9 setExpirationData:v138];

  v139 = [v6 objectForKey:@"routeURL"];
  [v9 setRouteURL:v139];

  if ([v9 contentType] == 2)
  {
    v140 = [v9 flintDocumentURL];

    if (!v140 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      id v142 = [NSString alloc];
      v146 = [v9 base];
      v143 = [v146 identifier];
      v144 = [v6 recordType];
      v145 = (void *)[v142 initWithFormat:@"an ANF article record should always have a document URL, id=%@, type=%@", v143, v144];
      *(_DWORD *)buf = 136315906;
      v148 = "-[FCArticleRecordSource recordFromCKRecord:base:]";
      __int16 v149 = 2080;
      v150 = "FCArticleRecordSource.m";
      __int16 v151 = 1024;
      int v152 = 648;
      __int16 v153 = 2114;
      v154 = v145;
      _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingANFDocument) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }

  return v9;
}

uint64_t __49__FCArticleRecordSource_recordFromCKRecord_base___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)identifierFromCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordType];
  if ([v5 isEqualToString:@"FeedItemAndArticle"])
  {
    uint64_t v6 = [v4 objectForKey:@"articleID"];
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___FCArticleRecordSource;
    uint64_t v6 = objc_msgSendSuper2(&v9, sel_identifierFromCKRecord_, v4);
  }
  id v7 = (void *)v6;

  return v7;
}

+ (id)changeTagFromCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordType];
  if ([v5 isEqualToString:@"FeedItemAndArticle"])
  {
    uint64_t v6 = [v4 objectForKey:@"articleETag"];
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___FCArticleRecordSource;
    uint64_t v6 = objc_msgSendSuper2(&v9, sel_changeTagFromCKRecord_, v4);
  }
  id v7 = (void *)v6;

  return v7;
}

+ (id)modificationDateFromCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordType];
  if ([v5 isEqualToString:@"FeedItemAndArticle"])
  {
    uint64_t v6 = [v4 objectForKey:@"articleModDate"];
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___FCArticleRecordSource;
    uint64_t v6 = objc_msgSendSuper2(&v9, sel_modificationDateFromCKRecord_, v4);
  }
  id v7 = (void *)v6;

  return v7;
}

- (NSArray)topicFlagsRecordKeys
{
  uint64_t v3 = [(FCRecordSource *)self experimentalizedKeysByOriginalKey];
  id v4 = [(FCRecordSource *)self localizedExperimentalizedKeysByOriginalKey];
  id v5 = [(FCRecordSource *)self localizedKeysByOriginalKey];
  v11[0] = (id)MEMORY[0x1E4F143A8];
  v11[1] = (id)3221225472;
  v11[2] = __45__FCArticleRecordSource_topicFlagsRecordKeys__block_invoke;
  v11[3] = &unk_1E5B54EA0;
  id v12 = v5;
  id v13 = v4;
  id v14 = v3;
  id v6 = v3;
  id v7 = v4;
  id v8 = v5;
  objc_super v9 = __45__FCArticleRecordSource_topicFlagsRecordKeys__block_invoke(v11);

  return (NSArray *)v9;
}

id __45__FCArticleRecordSource_topicFlagsRecordKeys__block_invoke(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FCArticleRecordSource_topicFlagsRecordKeys__block_invoke_2;
  block[3] = &unk_1E5B4C738;
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  if (qword_1EB5D0F80 != -1) {
    dispatch_once(&qword_1EB5D0F80, block);
  }
  id v2 = (id)qword_1EB5D0F78;

  return v2;
}

void __45__FCArticleRecordSource_topicFlagsRecordKeys__block_invoke_2(id *a1)
{
  id v2 = (void *)MEMORY[0x1E4F1C978];
  id v7 = [a1[4] objectForKeyedSubscript:@"topicFlags"];
  uint64_t v3 = [a1[5] objectForKeyedSubscript:@"topicFlags"];
  id v4 = [a1[6] objectForKeyedSubscript:@"activeExperimentID"];
  uint64_t v5 = objc_msgSend(v2, "arrayWithObjects:", @"topicTagIDs", @"topicFlags", v7, v3, v4, 0);
  id v6 = (void *)qword_1EB5D0F78;
  qword_1EB5D0F78 = v5;
}

- (id)topicFlagsFromCKRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCRecordSource *)self experimentalizedKeysByOriginalKey];
  id v6 = [v5 objectForKeyedSubscript:@"activeExperimentID"];
  id v7 = [v4 objectForKey:v6];

  id v8 = [(FCRecordSource *)self localizedExperimentalizedKeysByOriginalKey];
  objc_super v9 = [v8 objectForKeyedSubscript:@"topicFlags"];
  id v10 = [v4 objectForKey:v9];

  v11 = [(FCRecordSource *)self localizedKeysByOriginalKey];
  id v12 = [v11 objectForKeyedSubscript:@"topicFlags"];
  id v13 = [v4 objectForKey:v12];

  uint64_t v14 = [v10 count];
  if (v14
    && ([(FCRecordSource *)self activeTreatmentID],
        self = (FCArticleRecordSource *)objc_claimAutoreleasedReturnValue(),
        [v7 isEqualToString:self]))
  {
    id v15 = v10;
  }
  else
  {
    if ([v13 count])
    {
      id v16 = v13;
    }
    else
    {
      id v16 = [v4 objectForKey:@"topicFlags"];
    }
    id v15 = v16;
    if (!v14) {
      goto LABEL_9;
    }
  }

LABEL_9:
  return v15;
}

- (NSArray)articleTagMetadataRecordKeys
{
  id v2 = [(FCRecordSource *)self localizedKeysByOriginalKey];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__FCArticleRecordSource_articleTagMetadataRecordKeys__block_invoke;
  v6[3] = &unk_1E5B505B0;
  id v7 = v2;
  id v3 = v2;
  id v4 = __53__FCArticleRecordSource_articleTagMetadataRecordKeys__block_invoke((uint64_t)v6);

  return (NSArray *)v4;
}

id __53__FCArticleRecordSource_articleTagMetadataRecordKeys__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__FCArticleRecordSource_articleTagMetadataRecordKeys__block_invoke_2;
  block[3] = &unk_1E5B4C018;
  id v4 = *(id *)(a1 + 32);
  if (qword_1EB5D0F90 != -1) {
    dispatch_once(&qword_1EB5D0F90, block);
  }
  id v1 = (id)qword_1EB5D0F88;

  return v1;
}

void __53__FCArticleRecordSource_articleTagMetadataRecordKeys__block_invoke_2(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x1E4F1C978];
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"tagMetadata"];
  uint64_t v2 = objc_msgSend(v1, "arrayWithObjects:", v4, @"tagMetadata", 0);
  id v3 = (void *)qword_1EB5D0F88;
  qword_1EB5D0F88 = v2;
}

- (id)articleTagMetadataFromCKRecord:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(FCArticleRecordSource *)self articleTagMetadataRecordKeys];
  id v6 = (void *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [v4 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v9)
        {
          id v10 = (void *)v9;
          id v6 = (void *)[objc_alloc(MEMORY[0x1E4F82938]) initWithData:v9];

          goto LABEL_11;
        }
      }
      id v6 = (void *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)articleTopicsFromCKRecord:(id)a3 engagement:(id)a4 conversionStats:(id)a5 tagMetadata:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [v10 objectForKey:@"scoresTopicTagIDs"];
  long long v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
  id v16 = [v11 topicCohortScores];

  v47 = v14;
  if (v16)
  {
    uint64_t v17 = [v11 topicCohortScores];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke;
    v60[3] = &unk_1E5B54EC8;
    id v61 = v15;
    [v17 enumerateObjectsUsingBlock:v60];

    id v18 = v61;
LABEL_3:

    goto LABEL_4;
  }
  __int16 v37 = [v11 topicCohorts];

  if (v37)
  {
    uint64_t v38 = [v14 count];
    __int16 v39 = [v11 topicCohorts];
    uint64_t v40 = [v39 count];

    if (v38 == v40)
    {
      uint64_t v41 = [v11 topicCohorts];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_2;
      v58[3] = &unk_1E5B54EF0;
      id v59 = v15;
      objc_msgSend(v47, "fc_enumerateSideBySideWithArray:reverse:block:", v41, 0, v58);

      id v18 = v59;
      goto LABEL_3;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v42 = [NSString alloc];
      v43 = [v11 topicCohorts];
      v44 = (void *)[v42 initWithFormat:@"Found non nil topicCohorts, but the count doesn't match scoresTopicIDs.\nscoresTopicIDs : %@\nscores.topicCohorts : %@", v47, v43];
      *(_DWORD *)buf = 136315906;
      v63 = "-[FCArticleRecordSource articleTopicsFromCKRecord:engagement:conversionStats:tagMetadata:]";
      __int16 v64 = 2080;
      v65 = "FCArticleRecordSource.m";
      __int16 v66 = 1024;
      int v67 = 756;
      __int16 v68 = 2114;
      v69 = v44;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
LABEL_4:
  v46 = v11;
  id v19 = (void *)MEMORY[0x1E4F1C9E8];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_116;
  v56[3] = &unk_1E5B4BF78;
  id v45 = v12;
  id v57 = v45;
  id v20 = objc_msgSend(v19, "fc_dictionary:", v56);
  uint64_t v21 = [v10 objectForKey:@"topicTagIDs"];
  id v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
  uint64_t v23 = [v21 count];
  id v24 = v13;
  if (v23 == [v13 count])
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_3;
    v54[3] = &unk_1E5B54F40;
    id v55 = v22;
    objc_msgSend(v21, "fc_enumerateSideBySideWithArray:reverse:block:", v13, 0, v54);
  }
  v25 = [(FCArticleRecordSource *)self topicFlagsFromCKRecord:v10];
  __int16 v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_4;
  v48[3] = &unk_1E5B54F68;
  id v49 = v15;
  id v50 = v20;
  id v51 = v22;
  id v52 = v25;
  id v27 = v26;
  id v53 = v27;
  id v28 = v25;
  id v29 = v22;
  id v30 = v20;
  id v31 = v15;
  [v21 enumerateObjectsUsingBlock:v48];
  uint64_t v32 = v10;
  v33 = v24;
  int v34 = v53;
  id v35 = v27;

  return v35;
}

void __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 cohorts];
  id v4 = [v3 tagId];

  [v2 setObject:v5 forKey:v4];
}

uint64_t __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

void __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_116(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) topicConversionStats];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_2_117;
  v6[3] = &unk_1E5B54F18;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_2_117(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 conversionStats];
  id v4 = [v3 tagId];

  [v2 setObject:v5 forKey:v4];
}

uint64_t __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

void __90__FCArticleRecordSource_articleTopicsFromCKRecord_engagement_conversionStats_tagMetadata___block_invoke_4(id *a1, void *a2, unint64_t a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F829B8];
  id v6 = a2;
  id v16 = objc_alloc_init(v5);
  [v16 setTagID:v6];
  id v7 = [a1[4] objectForKeyedSubscript:v6];
  [v16 setCohorts:v7];

  id v8 = [a1[5] objectForKeyedSubscript:v6];
  [v16 setConversionStats:v8];

  uint64_t v9 = [a1[6] objectForKeyedSubscript:v6];

  if (v9)
  {
    if ([v9 hasFlowRate])
    {
      [v9 flowRate];
      [v16 setFlowRate:v10];
    }
    if ([v9 hasSubscriptionRate])
    {
      [v9 subscriptionRate];
      [v16 setSubscriptionRate:v11];
    }
    if ([v9 hasQuality])
    {
      [v9 quality];
      [v16 setQuality:v12];
    }
    if ([v9 hasOntologyLevel]) {
      objc_msgSend(v16, "setOntologyLevel:", (int)objc_msgSend(v9, "ontologyLevel"));
    }
    if ([v9 hasContentAndRelevanceInfo])
    {
      id v13 = [v9 contentAndRelevanceInfo];
      [v16 setContentAndRelevanceInfo:v13];
    }
  }
  if ([a1[7] count] <= a3) {
    goto LABEL_22;
  }
  long long v14 = [a1[7] objectAtIndexedSubscript:a3];
  char v15 = [v14 unsignedLongLongValue];

  if (v15)
  {
    [v16 setIsHidden:1];
    if ((v15 & 2) == 0)
    {
LABEL_15:
      if ((v15 & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_27;
    }
  }
  else if ((v15 & 2) == 0)
  {
    goto LABEL_15;
  }
  [v16 setIsEligibleForGrouping:1];
  if ((v15 & 4) == 0)
  {
LABEL_16:
    if ((v15 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v16 setIsEligibleForGroupingIfFavorited:1];
  if ((v15 & 8) == 0)
  {
LABEL_17:
    if ((v15 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v16 setIsEligibleForGroupingIfAutofavorited:1];
  if ((v15 & 0x10) == 0)
  {
LABEL_18:
    if ((v15 & 0x20) == 0) {
      goto LABEL_19;
    }
LABEL_30:
    [v16 setIsManagedTopicWinner:1];
    if ((v15 & 0x40) == 0)
    {
LABEL_20:
      if ((v15 & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    goto LABEL_31;
  }
LABEL_29:
  [v16 setIsManagedTopic:1];
  if ((v15 & 0x20) != 0) {
    goto LABEL_30;
  }
LABEL_19:
  if ((v15 & 0x40) == 0) {
    goto LABEL_20;
  }
LABEL_31:
  [v16 setIsDisallowedFromGrouping:1];
  if (v15 < 0) {
LABEL_21:
  }
    [v16 setHardFollowRequiredForGrouping:1];
LABEL_22:
  [a1[8] addObject:v16];
}

- (NSArray)engagementRecordKeys
{
  id v3 = [(FCArticleRecordSource *)self experimentalFieldsLock];
  [v3 lock];

  id v4 = self->_engagementRecordKeys;
  id v5 = [(FCArticleRecordSource *)self experimentalFieldsLock];
  [v5 unlock];

  return v4;
}

- (NSArray)conversionRecordKeys
{
  id v3 = [(FCArticleRecordSource *)self experimentalFieldsLock];
  [v3 lock];

  id v4 = self->_conversionRecordKeys;
  id v5 = [(FCArticleRecordSource *)self experimentalFieldsLock];
  [v5 unlock];

  return v4;
}

- (NSArray)embeddingRecordKeys
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__FCArticleRecordSource_embeddingRecordKeys__block_invoke;
  v4[3] = &unk_1E5B4BF30;
  v4[4] = self;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v4);
  return (NSArray *)v2;
}

void __44__FCArticleRecordSource_embeddingRecordKeys__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) desiredArticleRecordFieldOptions] & 0x10000000) != 0) {
    [v3 addObject:@"float16TitleEncoding"];
  }
  if (([*(id *)(a1 + 32) desiredArticleRecordFieldOptions] & 0x20000000) != 0) {
    [v3 addObject:@"float16FullBodyEncoding"];
  }
}

- (id)engagementFromCKRecord:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(FCArticleRecordSource *)self engagementRecordKeys];
  id v6 = (void *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [v4 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v9)
        {
          float v10 = (void *)v9;
          id v6 = (void *)[objc_alloc(MEMORY[0x1E4F82930]) initWithData:v9];

          goto LABEL_11;
        }
      }
      id v6 = (void *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)conversionStatsFromCKRecord:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(FCArticleRecordSource *)self conversionRecordKeys];
  id v6 = (void *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [v4 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v9)
        {
          float v10 = (void *)v9;
          id v6 = (void *)[objc_alloc(MEMORY[0x1E4F82928]) initWithData:v9];

          goto LABEL_11;
        }
      }
      id v6 = (void *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)supportsDeletions
{
  return 1;
}

+ (id)canaryRecordName
{
  return @"A-canary";
}

- (id)saveArticleRecords:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FCArticleRecordSource;
  id v3 = [(FCRecordSource *)&v5 saveRecords:a3];
  return v3;
}

- (void)updateEngagementCohortsExpField:(id)a3 conversionCohortsExpField:(id)a4
{
  [(FCArticleRecordSource *)self _setEngagementCohortsExpField:a3 conversionCohortsExpField:a4];
  v5.receiver = self;
  v5.super_class = (Class)FCArticleRecordSource;
  [(FCRecordSource *)&v5 forceRefreshDesiredKeys];
}

- (void)setEngagementRecordKeys:(id)a3
{
}

- (void)setConversionRecordKeys:(id)a3
{
}

- (void)setTopicFlagsRecordKeys:(id)a3
{
}

- (void)setArticleTagMetadataRecordKeys:(id)a3
{
}

- (void)setEmbeddingRecordKeys:(id)a3
{
}

- (void)setExperimentalFieldsLock:(id)a3
{
}

- (void)setDesiredArticleRecordFieldOptions:(unint64_t)a3
{
  self->_desiredArticleRecordFieldOptions = a3;
}

- (void)setEngagementCohortsExpField:(id)a3
{
}

- (void)setConversionCohortsExpField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionCohortsExpField, 0);
  objc_storeStrong((id *)&self->_engagementCohortsExpField, 0);
  objc_storeStrong((id *)&self->_experimentalFieldsLock, 0);
  objc_storeStrong((id *)&self->_embeddingRecordKeys, 0);
  objc_storeStrong((id *)&self->_articleTagMetadataRecordKeys, 0);
  objc_storeStrong((id *)&self->_topicFlagsRecordKeys, 0);
  objc_storeStrong((id *)&self->_conversionRecordKeys, 0);
  objc_storeStrong((id *)&self->_engagementRecordKeys, 0);
}

@end