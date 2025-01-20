@interface SFSuggestionEngagementFeedback(VisualIntelligence)
- (id)VI_searchSuggestionFactory;
- (id)VI_searchSuggestionForSuggestionType:()VisualIntelligence;
- (void)setVI_searchSuggestionFactory:()VisualIntelligence;
@end

@implementation SFSuggestionEngagementFeedback(VisualIntelligence)

- (id)VI_searchSuggestionFactory
{
  return objc_getAssociatedObject(a1, (const void *)SearchSuggestionFactoryKey);
}

- (void)setVI_searchSuggestionFactory:()VisualIntelligence
{
  v4 = (const void *)SearchSuggestionFactoryKey;
  id v5 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, v4, v5, (void *)3);
}

- (id)VI_searchSuggestionForSuggestionType:()VisualIntelligence
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "VI_searchSuggestionFactory");
  if (v5)
  {
    objc_msgSend(a1, "VI_searchSuggestionFactory");
    v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v7 = ((void (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    if (+[VILogger shouldLogMessage])
    {
      v8 = +[VILogger log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1DCCF9000, v8, OS_LOG_TYPE_ERROR, "searchSuggestionFactory was not set on SFSuggestionEngagementFeedback instance", v10, 2u);
      }
    }
    v7 = (void *)[a1 copy];
    [v7 setSuggestion:v4];
  }
  return v7;
}

@end