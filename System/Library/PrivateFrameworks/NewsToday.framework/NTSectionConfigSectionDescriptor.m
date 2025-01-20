@interface NTSectionConfigSectionDescriptor
- (NSString)actionTitle;
- (NSString)backgroundColorDark;
- (NSString)backgroundColorLight;
- (NSString)backingTagID;
- (NSString)compactName;
- (NSString)identifier;
- (NSString)name;
- (NSString)nameColorDark;
- (NSString)nameColorLight;
- (NSString)personalizationFeatureID;
- (NSString)referralBarName;
- (NSString)subidentifier;
- (NSURL)actionURL;
- (NSURL)nameActionURL;
- (NTSectionConfigSectionDescriptor)init;
- (NTSectionConfigSectionDescriptor)initWithSectionConfig:(id)a3 appConfiguration:(id)a4 topStoriesChannelID:(id)a5 hiddenFeedIDs:(id)a6 allowPaidBundleFeed:(BOOL)a7 todayData:(id)a8 supplementalFeedFilterOptions:(unint64_t)a9;
- (NTSectionFetchDescriptor)fetchDescriptor;
- (id)assembleResultsWithCatchUpOperation:(id)a3;
- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5;
- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3;
- (int)promotionCriterion;
- (int)readArticlesFilterMethod;
- (int)seenArticlesFilterMethod;
- (int64_t)seenArticlesMinimumTimeSinceFirstSeenToFilter;
- (unint64_t)cachedResultCutoffTime;
- (unint64_t)fallbackOrder;
- (unint64_t)maximumStoriesAllocation;
- (unint64_t)minimumStoriesAllocation;
- (unint64_t)paywalledArticlesMaxCount;
- (unint64_t)supplementalInterSectionFilterOptions;
- (unint64_t)supplementalIntraSectionFilterOptions;
- (void)configureCatchUpOperationWithFetchRequest:(id)a3;
- (void)setFetchDescriptor:(id)a3;
- (void)setPaywalledArticlesMaxCount:(unint64_t)a3;
@end

@implementation NTSectionConfigSectionDescriptor

- (NTSectionConfigSectionDescriptor)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTSectionConfigSectionDescriptor init]";
    __int16 v9 = 2080;
    v10 = "NTSectionConfigSectionDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 55;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTSectionConfigSectionDescriptor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTSectionConfigSectionDescriptor)initWithSectionConfig:(id)a3 appConfiguration:(id)a4 topStoriesChannelID:(id)a5 hiddenFeedIDs:(id)a6 allowPaidBundleFeed:(BOOL)a7 todayData:(id)a8 supplementalFeedFilterOptions:(unint64_t)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  if (!v15 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSectionConfigSectionDescriptor initWithSectionConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:todayData:supplementalFeedFilterOptions:]();
  }
  v100.receiver = self;
  v100.super_class = (Class)NTSectionConfigSectionDescriptor;
  v20 = [(NTSectionConfigSectionDescriptor *)&v100 init];
  if (v20)
  {
    v98 = v19;
    v21 = [v15 identifier];
    uint64_t v22 = [v21 copy];
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v22;

    v24 = [v15 subidentifier];
    uint64_t v25 = [v24 copy];
    subidentifier = v20->_subidentifier;
    v20->_subidentifier = (NSString *)v25;

    v27 = [v15 personalizationFeatureID];
    uint64_t v28 = [v27 copy];
    personalizationFeatureID = v20->_personalizationFeatureID;
    v20->_personalizationFeatureID = (NSString *)v28;

    v30 = [v15 name];
    uint64_t v31 = [v30 copy];
    name = v20->_name;
    v20->_name = (NSString *)v31;

    v33 = [v15 compactName];
    uint64_t v34 = [v33 copy];
    compactName = v20->_compactName;
    v20->_compactName = (NSString *)v34;

    v36 = [v15 referralBarName];
    uint64_t v37 = [v36 copy];
    referralBarName = v20->_referralBarName;
    v20->_referralBarName = (NSString *)v37;

    v39 = [v15 nameColorLight];
    uint64_t v40 = [v39 copy];
    nameColorLight = v20->_nameColorLight;
    v20->_nameColorLight = (NSString *)v40;

    v42 = [v15 nameColorDark];
    uint64_t v43 = [v42 copy];
    nameColorDark = v20->_nameColorDark;
    v20->_nameColorDark = (NSString *)v43;

    v20->_cachedResultCutoffTime = [v15 cachedResultCutoffTime];
    v20->_fallbackOrder = [v15 fallbackOrder];
    v20->_minimumStoriesAllocation = [v15 minimumStoriesAllocation];
    v20->_maximumStoriesAllocation = [v15 maximumStoriesAllocation];
    v20->_readArticlesFilterMethod = [v15 readArticlesFilterMethod];
    v20->_seenArticlesFilterMethod = [v15 seenArticlesFilterMethod];
    v20->_seenArticlesMinimumTimeSinceFirstSeenToFilter = [v15 seenArticlesMinimumTimeSinceFirstSeenToFilter];
    v20->_supplementalIntraSectionFilterOptions = [v15 intraSectionFilteringOptions] | a9;
    v20->_supplementalInterSectionFilterOptions = [v15 interSectionFilteringOptions];
    uint64_t v45 = [v15 groupActionTitle];
    actionTitle = v20->_actionTitle;
    v20->_actionTitle = (NSString *)v45;

    v47 = [v15 groupActionUrl];
    id v99 = v16;
    id v97 = v17;
    if (v47)
    {
      v48 = NSURL;
      v49 = [v15 groupActionUrl];
      uint64_t v50 = [v48 URLWithString:v49];
      actionURL = v20->_actionURL;
      v20->_actionURL = (NSURL *)v50;
    }
    else
    {
      v49 = v20->_actionURL;
      v20->_actionURL = 0;
    }
    BOOL v96 = v10;

    v20->_promotionCriterion = [v15 promotionCriterion];
    v52 = [v15 tagTodaySectionConfig];
    v53 = [v52 tagID];

    objc_storeStrong((id *)&v20->_backingTagID, v53);
    v54 = [v15 groupNameActionUrl];
    if (v54)
    {
      v55 = NSURL;
      v56 = [v15 groupNameActionUrl];
      v57 = [v55 URLWithString:v56];
    }
    else
    {
      v57 = 0;
    }
    id v19 = v98;

    if (v53)
    {
      v58 = objc_msgSend(NSURL, "fc_NewsURLForTagID:", v53);
    }
    else
    {
      v58 = 0;
    }
    if (v57) {
      v59 = v57;
    }
    else {
      v59 = v58;
    }
    objc_storeStrong((id *)&v20->_nameActionURL, v59);
    uint64_t v60 = [v15 backgroundColorDark];
    backgroundColorDark = v20->_backgroundColorDark;
    v20->_backgroundColorDark = (NSString *)v60;

    uint64_t v62 = [v15 backgroundColorLight];
    backgroundColorLight = v20->_backgroundColorLight;
    v20->_backgroundColorLight = (NSString *)v62;

    v20->_paywalledArticlesMaxCount = [v15 paywalledStoriesMaxCount];
    v64 = 0;
    switch([v15 sectionType])
    {
      case 0u:
        v65 = [NTArticleListSectionFetchDescriptor alloc];
        v66 = [v15 articleListTodaySectionConfig];
        uint64_t v67 = [(NTArticleListSectionFetchDescriptor *)v65 initWithArticleListConfiguration:v66];
        goto LABEL_24;
      case 1u:
        v66 = [v98 localNewsTagID];
        v68 = [v98 mutedTagIDs];
        v69 = v68;
        if (v68) {
          id v70 = v68;
        }
        else {
          id v70 = (id)objc_opt_new();
        }
        v94 = v70;

        v77 = [v98 purchasedTagIDs];
        v78 = v77;
        if (v77) {
          id v79 = v77;
        }
        else {
          id v79 = (id)objc_opt_new();
        }
        v93 = v79;

        v82 = [v98 rankedAllSubscribedTagIDs];
        v83 = v82;
        if (v82) {
          id v84 = v82;
        }
        else {
          id v84 = (id)objc_opt_new();
        }
        id v85 = v84;
        v92 = v84;

        v91 = [NTForYouSectionFetchDescriptor alloc];
        v90 = [v15 forYouTodaySectionConfig];
        [MEMORY[0x263EFFA08] setWithArray:v18];
        v86 = id v95 = v18;
        id v19 = v98;
        v64 = [(NTForYouSectionFetchDescriptor *)v91 initWithForYouConfiguration:v90 appConfiguration:v99 topStoriesChannelID:v97 localNewsTagID:v66 hiddenFeedIDs:v86 allowPaidBundleFeed:v96 mutedTagIDs:v94 purchasedTagIDs:v93 rankedAllSubscribedTagIDs:v85 bundleSubscriptionProvider:v98];

        id v18 = v95;
        goto LABEL_37;
      case 3u:
        v71 = [NTArticleIDsSectionFetchDescriptor alloc];
        v66 = [v15 articleIDsTodaySectionConfig];
        uint64_t v67 = [(NTArticleIDsSectionFetchDescriptor *)v71 initWithArticleIDsConfiguration:v66];
        goto LABEL_24;
      case 4u:
        v72 = [NTPersonalizedSectionFetchDescriptor alloc];
        v66 = [v15 personalizedTodaySectionConfig];
        uint64_t v67 = [(NTPersonalizedSectionFetchDescriptor *)v72 initWithPersonalizedConfiguration:v66];
        goto LABEL_24;
      case 5u:
        v73 = [NTItemsSectionFetchDescriptor alloc];
        v66 = [v15 itemsTodaySectionConfig];
        uint64_t v67 = [(NTItemsSectionFetchDescriptor *)v73 initWithItemsConfiguration:v66];
LABEL_24:
        v64 = (NTForYouSectionFetchDescriptor *)v67;
        goto LABEL_37;
      case 6u:
        v74 = [v98 purchasedTagIDs];
        v75 = v74;
        if (v74) {
          id v76 = v74;
        }
        else {
          id v76 = (id)objc_opt_new();
        }
        v66 = v76;

        v80 = [NTTagSectionFetchDescriptor alloc];
        v81 = [v15 tagTodaySectionConfig];
        v64 = [(NTTagSectionFetchDescriptor *)v80 initWithTagConfiguration:v81 appConfiguration:v99 purchasedTagIDs:v66 bundleSubscriptionProvider:v98];

        id v19 = v98;
LABEL_37:

        break;
      default:
        break;
    }
    uint64_t v87 = [(NTForYouSectionFetchDescriptor *)v64 copy];
    fetchDescriptor = v20->_fetchDescriptor;
    v20->_fetchDescriptor = (NTSectionFetchDescriptor *)v87;

    id v16 = v99;
    id v17 = v97;
  }

  return v20;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSectionConfigSectionDescriptor configureCatchUpOperationWithFetchRequest:]();
  }
  v5 = [(NTSectionConfigSectionDescriptor *)self fetchDescriptor];
  [v5 configureCatchUpOperationWithFetchRequest:v4];
}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSectionConfigSectionDescriptor assembleResultsWithCatchUpOperation:]();
  }
  v5 = [(NTSectionConfigSectionDescriptor *)self fetchDescriptor];
  id v6 = [v5 assembleResultsWithCatchUpOperation:v4];

  return v6;
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSectionConfigSectionDescriptor incrementalSortTransformationWithFeedPersonalizer:]();
  }
  v5 = [(NTSectionConfigSectionDescriptor *)self fetchDescriptor];
  id v6 = [v5 incrementalSortTransformationWithFeedPersonalizer:v4];

  return v6;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTSectionConfigSectionDescriptor incrementalLimitTransformationWithFeedPersonalizer:limit:priorFeedItems:]();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTSectionConfigSectionDescriptor incrementalLimitTransformationWithFeedPersonalizer:limit:priorFeedItems:]();
  }
LABEL_6:
  BOOL v10 = [(NTSectionConfigSectionDescriptor *)self fetchDescriptor];
  __int16 v11 = [v10 incrementalLimitTransformationWithFeedPersonalizer:v8 limit:a4 priorFeedItems:v9];

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)subidentifier
{
  return self->_subidentifier;
}

- (NSString)personalizationFeatureID
{
  return self->_personalizationFeatureID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)compactName
{
  return self->_compactName;
}

- (NSString)referralBarName
{
  return self->_referralBarName;
}

- (NSString)nameColorLight
{
  return self->_nameColorLight;
}

- (NSString)nameColorDark
{
  return self->_nameColorDark;
}

- (unint64_t)cachedResultCutoffTime
{
  return self->_cachedResultCutoffTime;
}

- (unint64_t)minimumStoriesAllocation
{
  return self->_minimumStoriesAllocation;
}

- (unint64_t)maximumStoriesAllocation
{
  return self->_maximumStoriesAllocation;
}

- (int)readArticlesFilterMethod
{
  return self->_readArticlesFilterMethod;
}

- (int)seenArticlesFilterMethod
{
  return self->_seenArticlesFilterMethod;
}

- (int64_t)seenArticlesMinimumTimeSinceFirstSeenToFilter
{
  return self->_seenArticlesMinimumTimeSinceFirstSeenToFilter;
}

- (unint64_t)fallbackOrder
{
  return self->_fallbackOrder;
}

- (unint64_t)supplementalInterSectionFilterOptions
{
  return self->_supplementalInterSectionFilterOptions;
}

- (unint64_t)supplementalIntraSectionFilterOptions
{
  return self->_supplementalIntraSectionFilterOptions;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (NSURL)nameActionURL
{
  return self->_nameActionURL;
}

- (int)promotionCriterion
{
  return self->_promotionCriterion;
}

- (NSString)backingTagID
{
  return self->_backingTagID;
}

- (NSString)backgroundColorDark
{
  return self->_backgroundColorDark;
}

- (NSString)backgroundColorLight
{
  return self->_backgroundColorLight;
}

- (unint64_t)paywalledArticlesMaxCount
{
  return self->_paywalledArticlesMaxCount;
}

- (void)setPaywalledArticlesMaxCount:(unint64_t)a3
{
  self->_paywalledArticlesMaxCount = a3;
}

- (NTSectionFetchDescriptor)fetchDescriptor
{
  return self->_fetchDescriptor;
}

- (void)setFetchDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchDescriptor, 0);
  objc_storeStrong((id *)&self->_backgroundColorLight, 0);
  objc_storeStrong((id *)&self->_backgroundColorDark, 0);
  objc_storeStrong((id *)&self->_backingTagID, 0);
  objc_storeStrong((id *)&self->_nameActionURL, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_nameColorDark, 0);
  objc_storeStrong((id *)&self->_nameColorLight, 0);
  objc_storeStrong((id *)&self->_referralBarName, 0);
  objc_storeStrong((id *)&self->_compactName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_personalizationFeatureID, 0);
  objc_storeStrong((id *)&self->_subidentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithSectionConfig:appConfiguration:topStoriesChannelID:hiddenFeedIDs:allowPaidBundleFeed:todayData:supplementalFeedFilterOptions:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionConfig", v6, 2u);
}

- (void)configureCatchUpOperationWithFetchRequest:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"catchUpOperation", v6, 2u);
}

- (void)assembleResultsWithCatchUpOperation:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"catchUpOperation", v6, 2u);
}

- (void)incrementalSortTransformationWithFeedPersonalizer:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedPersonalizer", v6, 2u);
}

- (void)incrementalLimitTransformationWithFeedPersonalizer:limit:priorFeedItems:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"priorFeedItems", v6, 2u);
}

- (void)incrementalLimitTransformationWithFeedPersonalizer:limit:priorFeedItems:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedPersonalizer", v6, 2u);
}

@end