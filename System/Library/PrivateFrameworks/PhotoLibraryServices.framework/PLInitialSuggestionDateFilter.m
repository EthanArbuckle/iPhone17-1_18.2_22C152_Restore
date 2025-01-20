@interface PLInitialSuggestionDateFilter
- (PLInitialSuggestionDateFilter)initWithTemplateDateType:(unint64_t)a3 psiDateFilter:(id)a4;
- (PSIDateFilter)psiDateFilter;
- (__CFArray)assetIds;
- (id)description;
- (unint64_t)templateDateType;
- (void)dealloc;
- (void)setAssetIds:(__CFArray *)a3;
@end

@implementation PLInitialSuggestionDateFilter

- (PLInitialSuggestionDateFilter)initWithTemplateDateType:(unint64_t)a3 psiDateFilter:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLInitialSuggestionDateFilter;
  v8 = [(PLInitialSuggestionDateFilter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_templateDateType = a3;
    objc_storeStrong((id *)&v8->_psiDateFilter, a4);
  }

  return v9;
}

- (PSIDateFilter)psiDateFilter
{
  return self->_psiDateFilter;
}

- (void).cxx_destruct
{
}

- (unint64_t)templateDateType
{
  return self->_templateDateType;
}

- (void)setAssetIds:(__CFArray *)a3
{
}

- (__CFArray)assetIds
{
  return self->_assetIds;
}

- (id)description
{
  if ([(PLInitialSuggestionDateFilter *)self assetIds]) {
    CFIndex Count = CFArrayGetCount([(PLInitialSuggestionDateFilter *)self assetIds]);
  }
  else {
    CFIndex Count = 0;
  }
  unint64_t v4 = [(PLInitialSuggestionDateFilter *)self templateDateType];
  if (v4 - 1 > 8) {
    v5 = @"PLSearchSuggestionDateTemplateCategoryTypeNone";
  }
  else {
    v5 = off_1E5862470[v4 - 1];
  }
  v6 = v5;
  id v7 = NSString;
  v8 = [(PLInitialSuggestionDateFilter *)self psiDateFilter];
  v9 = [v7 stringWithFormat:@"template date type: %@, date filter: %@, assetIds: %tu", v6, v8, Count];

  return v9;
}

- (void)dealloc
{
  assetIds = self->_assetIds;
  if (assetIds) {
    CFRelease(assetIds);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLInitialSuggestionDateFilter;
  [(PLInitialSuggestionDateFilter *)&v4 dealloc];
}

@end