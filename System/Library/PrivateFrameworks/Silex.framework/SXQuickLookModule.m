@interface SXQuickLookModule
- (SXQuickLookModule)initWithResolver:(id)a3;
- (TFResolver)resolver;
- (id)createViewControllerWithFile:(id)a3;
@end

@implementation SXQuickLookModule

- (SXQuickLookModule)initWithResolver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXQuickLookModule;
  v6 = [(SXQuickLookModule *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resolver, a3);
  }

  return v7;
}

- (id)createViewControllerWithFile:(id)a3
{
  id v4 = a3;
  id v5 = [(SXQuickLookModule *)self resolver];
  uint64_t v6 = objc_opt_class();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__SXQuickLookModule_createViewControllerWithFile___block_invoke;
  v10[3] = &unk_264652F28;
  id v11 = v4;
  id v7 = v4;
  v8 = [v5 resolveClass:v6 contextBlock:v10];

  return v8;
}

void __50__SXQuickLookModule_createViewControllerWithFile___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 useObject:v2 forClass:objc_opt_class()];
}

- (TFResolver)resolver
{
  return self->_resolver;
}

- (void).cxx_destruct
{
}

@end