@interface NTNewsTodayResultsSourceFetchHelperSectionDescriptor
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
- (NTNewsTodayResultsSourceFetchHelperSectionDescriptor)init;
- (NTNewsTodayResultsSourceFetchHelperSectionDescriptor)initWithSectionDescriptor:(id)a3 parentSectionQueueDescriptor:(id)a4;
- (NTSectionDescriptor)sectionDescriptor;
- (NTSectionQueueDescriptor)parentSectionQueueDescriptor;
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
@end

@implementation NTNewsTodayResultsSourceFetchHelperSectionDescriptor

- (NTNewsTodayResultsSourceFetchHelperSectionDescriptor)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTNewsTodayResultsSourceFetchHelperSectionDescriptor init]";
    __int16 v9 = 2080;
    v10 = "NTNewsTodayResultsSourceFetchHelper.m";
    __int16 v11 = 1024;
    int v12 = 125;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTNewsTodayResultsSourceFetchHelperSectionDescriptor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTNewsTodayResultsSourceFetchHelperSectionDescriptor)initWithSectionDescriptor:(id)a3 parentSectionQueueDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor initWithSectionDescriptor:parentSectionQueueDescriptor:]();
    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsTodayResultsSourceFetchHelperSectionDescriptor initWithSectionDescriptor:parentSectionQueueDescriptor:]();
  }
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)NTNewsTodayResultsSourceFetchHelperSectionDescriptor;
  v8 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sectionDescriptor = v8->_sectionDescriptor;
    v8->_sectionDescriptor = (NTSectionDescriptor *)v9;

    uint64_t v11 = [v7 copy];
    parentSectionQueueDescriptor = v8->_parentSectionQueueDescriptor;
    v8->_parentSectionQueueDescriptor = (NTSectionQueueDescriptor *)v11;
  }
  return v8;
}

- (void)configureCatchUpOperationWithFetchRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  [v5 configureCatchUpOperationWithFetchRequest:v4];
}

- (id)assembleResultsWithCatchUpOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  id v6 = [v5 assembleResultsWithCatchUpOperation:v4];

  return v6;
}

- (id)incrementalSortTransformationWithFeedPersonalizer:(id)a3
{
  id v4 = a3;
  id v5 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  id v6 = [v5 incrementalSortTransformationWithFeedPersonalizer:v4];

  return v6;
}

- (id)incrementalLimitTransformationWithFeedPersonalizer:(id)a3 limit:(unint64_t)a4 priorFeedItems:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  uint64_t v11 = [v10 incrementalLimitTransformationWithFeedPersonalizer:v9 limit:a4 priorFeedItems:v8];

  return v11;
}

- (NSString)identifier
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)subidentifier
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  v3 = [v2 subidentifier];

  return (NSString *)v3;
}

- (NSString)personalizationFeatureID
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  v3 = [v2 personalizationFeatureID];

  return (NSString *)v3;
}

- (NSString)name
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)compactName
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  v3 = [v2 compactName];

  return (NSString *)v3;
}

- (NSString)referralBarName
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  v3 = [v2 referralBarName];

  return (NSString *)v3;
}

- (NSString)nameColorLight
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  v3 = [v2 nameColorLight];

  return (NSString *)v3;
}

- (NSString)nameColorDark
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  v3 = [v2 nameColorDark];

  return (NSString *)v3;
}

- (unint64_t)cachedResultCutoffTime
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  unint64_t v3 = [v2 cachedResultCutoffTime];

  return v3;
}

- (unint64_t)fallbackOrder
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  unint64_t v3 = [v2 fallbackOrder];

  return v3;
}

- (unint64_t)minimumStoriesAllocation
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  unint64_t v3 = [v2 minimumStoriesAllocation];

  return v3;
}

- (unint64_t)maximumStoriesAllocation
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  unint64_t v3 = [v2 maximumStoriesAllocation];

  return v3;
}

- (int)readArticlesFilterMethod
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  int v3 = [v2 readArticlesFilterMethod];

  return v3;
}

- (int)seenArticlesFilterMethod
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  int v3 = [v2 seenArticlesFilterMethod];

  return v3;
}

- (int64_t)seenArticlesMinimumTimeSinceFirstSeenToFilter
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  int64_t v3 = [v2 seenArticlesMinimumTimeSinceFirstSeenToFilter];

  return v3;
}

- (unint64_t)supplementalInterSectionFilterOptions
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  unint64_t v3 = [v2 supplementalInterSectionFilterOptions];

  return v3;
}

- (unint64_t)supplementalIntraSectionFilterOptions
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  unint64_t v3 = [v2 supplementalIntraSectionFilterOptions];

  return v3;
}

- (NSString)actionTitle
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  unint64_t v3 = [v2 actionTitle];

  return (NSString *)v3;
}

- (NSURL)actionURL
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  unint64_t v3 = [v2 actionURL];

  return (NSURL *)v3;
}

- (int)promotionCriterion
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  int v3 = [v2 promotionCriterion];

  return v3;
}

- (NSString)backingTagID
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  int v3 = [v2 backingTagID];

  return (NSString *)v3;
}

- (NSURL)nameActionURL
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  int v3 = [v2 nameActionURL];

  return (NSURL *)v3;
}

- (NSString)backgroundColorLight
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  int v3 = [v2 backgroundColorLight];

  return (NSString *)v3;
}

- (NSString)backgroundColorDark
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  int v3 = [v2 backgroundColorDark];

  return (NSString *)v3;
}

- (unint64_t)paywalledArticlesMaxCount
{
  v2 = [(NTNewsTodayResultsSourceFetchHelperSectionDescriptor *)self sectionDescriptor];
  unint64_t v3 = [v2 paywalledArticlesMaxCount];

  return v3;
}

- (NTSectionDescriptor)sectionDescriptor
{
  return self->_sectionDescriptor;
}

- (NTSectionQueueDescriptor)parentSectionQueueDescriptor
{
  return self->_parentSectionQueueDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentSectionQueueDescriptor, 0);

  objc_storeStrong((id *)&self->_sectionDescriptor, 0);
}

- (void)initWithSectionDescriptor:parentSectionQueueDescriptor:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"parentSectionQueueDescriptor", v6, 2u);
}

- (void)initWithSectionDescriptor:parentSectionQueueDescriptor:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionDescriptor", v6, 2u);
}

@end