@interface NTSectionPlaceholderDescriptor
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
- (NTSectionPlaceholderDescriptor)init;
- (NTSectionPlaceholderDescriptor)initWithName:(id)a3 nameColorLight:(id)a4 nameColorDark:(id)a5 minimumStoriesAllocation:(unint64_t)a6 maximumStoriesAllocation:(unint64_t)a7 backingTagID:(id)a8;
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
- (void)setPaywalledArticlesMaxCount:(unint64_t)a3;
@end

@implementation NTSectionPlaceholderDescriptor

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  v5 = [[NTFeedTransformationLimit alloc] initWithLimit:a4];

  return v5;
}

- (unint64_t)supplementalInterSectionFilterOptions
{
  return self->_supplementalInterSectionFilterOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorDark, 0);
  objc_storeStrong((id *)&self->_backgroundColorLight, 0);
  objc_storeStrong((id *)&self->_nameActionURL, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_referralBarName, 0);
  objc_storeStrong((id *)&self->_personalizationFeatureID, 0);
  objc_storeStrong((id *)&self->_nameColorLight, 0);
  objc_storeStrong((id *)&self->_nameColorDark, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_subidentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_compactName, 0);
  objc_storeStrong((id *)&self->_backingTagID, 0);

  objc_storeStrong((id *)&self->_actionTitle, 0);
}

- (unint64_t)maximumStoriesAllocation
{
  return self->_maximumStoriesAllocation;
}

- (unint64_t)supplementalIntraSectionFilterOptions
{
  return self->_supplementalIntraSectionFilterOptions;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)minimumStoriesAllocation
{
  return self->_minimumStoriesAllocation;
}

- (NSString)nameColorLight
{
  return self->_nameColorLight;
}

- (NTSectionPlaceholderDescriptor)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTSectionPlaceholderDescriptor init]";
    __int16 v9 = 2080;
    v10 = "NTSectionPlaceholderDescriptor.m";
    __int16 v11 = 1024;
    int v12 = 44;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTSectionPlaceholderDescriptor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTSectionPlaceholderDescriptor)initWithName:(id)a3 nameColorLight:(id)a4 nameColorDark:(id)a5 minimumStoriesAllocation:(unint64_t)a6 maximumStoriesAllocation:(unint64_t)a7 backingTagID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)NTSectionPlaceholderDescriptor;
  v18 = [(NTSectionPlaceholderDescriptor *)&v32 init];
  if (v18)
  {
    v19 = [MEMORY[0x263F08C38] UUID];
    uint64_t v20 = [v19 UUIDString];
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    name = v18->_name;
    v18->_name = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    nameColorLight = v18->_nameColorLight;
    v18->_nameColorLight = (NSString *)v24;

    if (v16) {
      v26 = v16;
    }
    else {
      v26 = v15;
    }
    uint64_t v27 = [v26 copy];
    nameColorDark = v18->_nameColorDark;
    v18->_nameColorDark = (NSString *)v27;

    v18->_maximumStoriesAllocation = a7;
    v18->_minimumStoriesAllocation = a6;
    uint64_t v29 = [v17 copy];
    backingTagID = v18->_backingTagID;
    v18->_backingTagID = (NSString *)v29;
  }
  return v18;
}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v10 = "-[NTSectionPlaceholderDescriptor assembleResultsWithCatchUpOperation:]";
    __int16 v11 = 2080;
    int v12 = "NTSectionPlaceholderDescriptor.m";
    __int16 v13 = 1024;
    int v14 = 76;
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTSectionPlaceholderDescriptor assembleResultsWithCatchUpOperation:]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  id v3 = [NTFeedTransformationItemFeedTransformation alloc];
  uint64_t v4 = [MEMORY[0x263F59488] sharedInstance];
  v5 = [(NTFeedTransformationItemFeedTransformation *)v3 initWithFeedItemTransformation:v4];

  return v5;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (NSString)backingTagID
{
  return self->_backingTagID;
}

- (unint64_t)cachedResultCutoffTime
{
  return self->_cachedResultCutoffTime;
}

- (NSString)compactName
{
  return self->_compactName;
}

- (unint64_t)fallbackOrder
{
  return self->_fallbackOrder;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)subidentifier
{
  return self->_subidentifier;
}

- (NSString)nameColorDark
{
  return self->_nameColorDark;
}

- (NSString)personalizationFeatureID
{
  return self->_personalizationFeatureID;
}

- (int)promotionCriterion
{
  return self->_promotionCriterion;
}

- (int)readArticlesFilterMethod
{
  return self->_readArticlesFilterMethod;
}

- (NSString)referralBarName
{
  return self->_referralBarName;
}

- (int)seenArticlesFilterMethod
{
  return self->_seenArticlesFilterMethod;
}

- (int64_t)seenArticlesMinimumTimeSinceFirstSeenToFilter
{
  return self->_seenArticlesMinimumTimeSinceFirstSeenToFilter;
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (NSURL)nameActionURL
{
  return self->_nameActionURL;
}

- (NSString)backgroundColorLight
{
  return self->_backgroundColorLight;
}

- (NSString)backgroundColorDark
{
  return self->_backgroundColorDark;
}

- (unint64_t)paywalledArticlesMaxCount
{
  return self->_paywalledArticlesMaxCount;
}

- (void)setPaywalledArticlesMaxCount:(unint64_t)a3
{
  self->_paywalledArticlesMaxCount = a3;
}

@end