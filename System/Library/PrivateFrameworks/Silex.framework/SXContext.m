@interface SXContext
+ (void)prewarm;
- (NSString)identifier;
- (SXContext)initWithIdentifier:(id)a3 shareURL:(id)a4 JSONData:(id)a5 resourceDataSource:(id)a6 host:(id)a7 error:(id *)a8;
- (SXDocumentController)documentController;
- (SXHost)host;
- (SXResourceDataSource)resourceDataSource;
- (SXTextContentProvider)textContentProvider;
@end

@implementation SXContext

- (SXContext)initWithIdentifier:(id)a3 shareURL:(id)a4 JSONData:(id)a5 resourceDataSource:(id)a6 host:(id)a7 error:(id *)a8
{
  v38[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v34 = a4;
  id v15 = a5;
  id v16 = a6;
  id v33 = a7;
  v36.receiver = self;
  v36.super_class = (Class)SXContext;
  v17 = [(SXContext *)&v36 init];
  if (v17)
  {
    if (!v15)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"SXContextErrorDomain" code:1 userInfo:0];
      objc_claimAutoreleasedReturnValue();
      id v28 = [MEMORY[0x263EFF940] exceptionWithName:@"InvalidJSON" reason:@"No JSON to parse" userInfo:0];
      objc_exception_throw(v28);
    }
    id v35 = 0;
    v18 = [MEMORY[0x263F08900] JSONObjectWithData:v15 options:0 error:&v35];
    id v19 = v35;
    if (v19)
    {
      v29 = (void *)MEMORY[0x263F087E8];
      uint64_t v37 = *MEMORY[0x263F08608];
      v38[0] = v19;
      v30 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
      [v29 errorWithDomain:@"SXContextErrorDomain" code:2 userInfo:v30];
      objc_claimAutoreleasedReturnValue();

      id v31 = [MEMORY[0x263EFF940] exceptionWithName:@"InvalidJSON" reason:@"Error while parsing JSON" userInfo:0];
      objc_exception_throw(v31);
    }
    v20 = [SXDocument alloc];
    v21 = [v18 objectForKey:@"specVersion"];
    v22 = [(SXDocument *)v20 initWithIdentifier:v14 JSONObject:v18 andVersion:v21];

    if (!v22)
    {
      v27 = 0;
      goto LABEL_10;
    }
    v23 = [[SXDocumentController alloc] initWithDocument:v22 shareURL:v34];
    documentController = v17->_documentController;
    v17->_documentController = v23;

    v25 = [[SXDocumentTextContentProvider alloc] initWithDocument:v22];
    textContentProvider = v17->_textContentProvider;
    v17->_textContentProvider = (SXTextContentProvider *)v25;

    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeWeak((id *)&v17->_resourceDataSource, v16);
    objc_storeStrong((id *)&v17->_host, a7);
  }
  v27 = v17;
LABEL_10:

  return v27;
}

+ (void)prewarm
{
  v2 = objc_alloc_init(SXJSONObject);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SXHost)host
{
  return self->_host;
}

- (SXDocumentController)documentController
{
  return self->_documentController;
}

- (SXTextContentProvider)textContentProvider
{
  return self->_textContentProvider;
}

- (SXResourceDataSource)resourceDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resourceDataSource);
  return (SXResourceDataSource *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_resourceDataSource);
  objc_storeStrong((id *)&self->_textContentProvider, 0);
  objc_storeStrong((id *)&self->_documentController, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log shareURL:JSONData:resourceDataSource:host:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_222AC5000, log, OS_LOG_TYPE_ERROR, "An error occurred while parsing document: %{public}@ error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end