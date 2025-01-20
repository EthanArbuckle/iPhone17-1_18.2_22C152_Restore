@interface FindOnPageCompletionProvider
- (FindOnPageCompletionProviderDataSource)dataSource;
- (id)completionsForQuery:(id)a3;
- (int64_t)parsecQueryID;
- (void)setDataSource:(id)a3;
- (void)setQueryToComplete:(id)a3;
@end

@implementation FindOnPageCompletionProvider

- (id)completionsForQuery:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FindOnPageCompletionProvider;
  v5 = [(CompletionProvider *)&v12 completionsForQuery:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [FindOnPageCompletionItem alloc];
    v9 = [v4 queryString];
    v10 = [(FindOnPageCompletionItem *)v8 initWithString:v9 numberOfMatches:*MEMORY[0x1E4F78A00] forQueryID:self->_parsecQueryID];

    v13[0] = v10;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  return v7;
}

- (void)setQueryToComplete:(id)a3
{
  p_dataSource = &self->_dataSource;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_dataSource);
  id v8 = [WeakRetained tabDocumentForFindOnPageCompletionProvider:self];

  self->_parsecQueryID = [v5 queryID];
  id v7 = [v5 queryString];

  [v8 findOnPageCompletionProvider:self setStringToComplete:v7];
}

- (FindOnPageCompletionProviderDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (FindOnPageCompletionProviderDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (int64_t)parsecQueryID
{
  return self->_parsecQueryID;
}

- (void).cxx_destruct
{
}

@end