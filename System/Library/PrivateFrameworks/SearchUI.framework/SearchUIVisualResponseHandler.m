@interface SearchUIVisualResponseHandler
- (SearchUIVisualResponseHandler)init;
- (VRXVisualResponseProvider)provider;
- (id)buildResponseView:(id)a3 delegate:(id)a4;
- (void)setProvider:(id)a3;
@end

@implementation SearchUIVisualResponseHandler

- (SearchUIVisualResponseHandler)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FA55D0]);
  [(SearchUIVisualResponseHandler *)self setProvider:v3];

  return self;
}

- (id)buildResponseView:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SearchUIVisualResponseHandler *)self provider];
  v9 = [v8 viewForModel:v7 mode:1];

  if (v9)
  {
    [v9 setInteractionDelegate:v6];
    id v10 = v9;
  }
  else
  {
    v11 = SearchUIGeneralLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SearchUIVisualResponseHandler buildResponseView:delegate:](v11);
    }
  }
  return v9;
}

- (VRXVisualResponseProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)buildResponseView:(os_log_t)log delegate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "Failed to get View from data using SnippetUI", v1, 2u);
}

@end