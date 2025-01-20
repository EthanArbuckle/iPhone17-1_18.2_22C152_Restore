@interface CompletionGroup
- (CompletionGroup)initWithTitle:(id)a3 completions:(id)a4 maximumNumberOfCompletions:(unint64_t)a5;
- (CompletionGroup)initWithTitle:(id)a3 completions:(id)a4 query:(id)a5 maximumNumberOfCompletions:(unint64_t)a6;
- (NSArray)completions;
- (NSString)defaultHeaderTitle;
- (NSString)headerViewReuseIdentifier;
- (WBSCompletionQuery)query;
- (id)headerView;
- (void)configureHeaderView:(id)a3 forCompletionList:(id)a4;
- (void)setCompletions:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation CompletionGroup

- (CompletionGroup)initWithTitle:(id)a3 completions:(id)a4 maximumNumberOfCompletions:(unint64_t)a5
{
  return [(CompletionGroup *)self initWithTitle:a3 completions:a4 query:0 maximumNumberOfCompletions:a5];
}

- (CompletionGroup)initWithTitle:(id)a3 completions:(id)a4 query:(id)a5 maximumNumberOfCompletions:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CompletionGroup;
  v13 = [(SFResultSection *)&v25 init];
  v14 = v13;
  if (v13)
  {
    [(SFResultSection *)v13 setTitle:v10];
    [(SFResultSection *)v14 setMaxInitiallyVisibleResults:a6];
    [(CompletionGroup *)v14 setCompletions:v11];
    v15 = [(NSArray *)v14->_completions firstObject];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v15 needsSectionHeader]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = [v15 completionTableHeaderViewReuseIdentifier];
      uint64_t v17 = [v16 copy];
      headerViewReuseIdentifier = v14->_headerViewReuseIdentifier;
      v14->_headerViewReuseIdentifier = (NSString *)v17;
    }
    v19 = [v11 firstObject];
    v20 = [v19 sfSearchResultValue];
    v21 = [v20 sectionBundleIdentifier];

    if (!v21)
    {
      v22 = WBS_LOG_CHANNEL_PREFIXParsec();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[CompletionGroup initWithTitle:completions:query:maximumNumberOfCompletions:](v22);
      }
    }
    [(SFResultSection *)v14 setBundleIdentifier:v21];
    [(CompletionGroup *)v14 setQuery:v12];
    v23 = v14;
  }
  return v14;
}

- (id)headerView
{
  v2 = [(NSArray *)self->_completions firstObject];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 completionTableHeaderView];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)configureHeaderView:(id)a3 forCompletionList:(id)a4
{
  id v6 = a3;
  v5 = [(NSArray *)self->_completions firstObject];
  if (objc_opt_respondsToSelector()) {
    [v5 configureCompletionTableHeaderView:v6 forCompletionListGroup:self];
  }
}

- (NSString)defaultHeaderTitle
{
  v3 = [(NSArray *)self->_completions firstObject];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v3 usesDefaultHeaderView])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(SFResultSection *)self title];
  }

  return (NSString *)v4;
}

- (void)setCompletions:(id)a3
{
  v4 = (NSArray *)a3;
  if (self->_completions != v4)
  {
    v9 = v4;
    unint64_t v5 = [(SFResultSection *)self maxInitiallyVisibleResults];
    if (v5 && v5 < [(NSArray *)v9 count])
    {
      -[NSArray subarrayWithRange:](v9, "subarrayWithRange:", 0, [(SFResultSection *)self maxInitiallyVisibleResults]);
      id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = (NSArray *)[(NSArray *)v9 copy];
    }
    completions = self->_completions;
    self->_completions = v6;

    v8 = [(NSArray *)self->_completions safari_mapObjectsUsingBlock:&__block_literal_global_15];
    [(SFResultSection *)self setResults:v8];

    v4 = v9;
  }
}

uint64_t __34__CompletionGroup_setCompletions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sfSearchResultValue];
}

- (void)setQuery:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_query, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(CompletionGroup *)self completions];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 setQuery:v5];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (WBSCompletionQuery)query
{
  return self->_query;
}

- (NSString)headerViewReuseIdentifier
{
  return self->_headerViewReuseIdentifier;
}

- (NSArray)completions
{
  return self->_completions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_headerViewReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (void)initWithTitle:(os_log_t)log completions:query:maximumNumberOfCompletions:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Result had no bundle identifier", v1, 2u);
}

@end