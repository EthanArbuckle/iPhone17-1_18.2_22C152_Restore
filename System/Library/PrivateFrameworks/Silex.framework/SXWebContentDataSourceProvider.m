@interface SXWebContentDataSourceProvider
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXResourceDataSourceProvider)resourceDataSourceProvider;
- (SXWebContentDataSourceProvider)initWithDOMObjectProvider:(id)a3 resourceDataSourceProvider:(id)a4;
- (id)dataSourcesForReferences:(id)a3;
@end

@implementation SXWebContentDataSourceProvider

- (SXWebContentDataSourceProvider)initWithDOMObjectProvider:(id)a3 resourceDataSourceProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXWebContentDataSourceProvider;
  v9 = [(SXWebContentDataSourceProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v10->_resourceDataSourceProvider, a4);
  }

  return v10;
}

- (id)dataSourcesForReferences:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __59__SXWebContentDataSourceProvider_dataSourcesForReferences___block_invoke;
    objc_super v12 = &unk_264654068;
    v13 = self;
    id v6 = v5;
    id v14 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:&v9];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

void __59__SXWebContentDataSourceProvider_dataSourcesForReferences___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 DOMObjectProvider];
  id v8 = [v6 resourceIdentifier];

  uint64_t v9 = [v7 resourceForIdentifier:v8];

  uint64_t v10 = [v9 URL];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [*(id *)(a1 + 32) resourceDataSourceProvider];
    objc_super v12 = [v11 resourceDataSource];
    uint64_t v13 = [v12 translateURL:v10];

    uint64_t v10 = (void *)v13;
  }
  if (v10) {
    [*(id *)(a1 + 40) setObject:v10 forKey:v14];
  }
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXResourceDataSourceProvider)resourceDataSourceProvider
{
  return self->_resourceDataSourceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceDataSourceProvider, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end