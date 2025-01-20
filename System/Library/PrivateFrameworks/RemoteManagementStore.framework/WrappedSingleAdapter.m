@interface WrappedSingleAdapter
- (RMConfigurationSingleAdapter)wrappedAdapter;
- (WrappedSingleAdapter)initWithAdapter:(id)a3;
- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)beginProcessingConfigurationsForScope:(int64_t)a3 completionHandler:(id)a4;
- (void)endProcessingConfigurations:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)removeDeclarationKey:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation WrappedSingleAdapter

- (WrappedSingleAdapter)initWithAdapter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WrappedSingleAdapter;
  v6 = [(WrappedSingleAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrappedAdapter, a3);
  }

  return v7;
}

- (void)beginProcessingConfigurationsForScope:(int64_t)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, id))a4;
  v7 = [(WrappedSingleAdapter *)self wrappedAdapter];
  char v8 = objc_opt_respondsToSelector();

  objc_super v9 = [(WrappedSingleAdapter *)self wrappedAdapter];
  v10 = v9;
  if (v8)
  {
    [v9 beginProcessingConfigurationsForScope:a3 completionHandler:v6];
  }
  else
  {
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [(WrappedSingleAdapter *)self wrappedAdapter];
      id v14 = 0;
      [v12 beginProcessingConfigurationsForScope:a3 error:&v14];
      id v13 = v14;

      v6[2](v6, v13);
    }
    else
    {
      v6[2](v6, 0);
    }
  }
}

- (void)endProcessingConfigurations:(BOOL)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  char v8 = (void (**)(id, id))a5;
  objc_super v9 = [(WrappedSingleAdapter *)self wrappedAdapter];
  char v10 = objc_opt_respondsToSelector();

  char v11 = [(WrappedSingleAdapter *)self wrappedAdapter];
  v12 = v11;
  if (v10)
  {
    [v11 endProcessingConfigurations:v6 scope:a4 completionHandler:v8];
  }
  else
  {
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = [(WrappedSingleAdapter *)self wrappedAdapter];
      id v16 = 0;
      [v14 endProcessingConfigurations:v6 scope:a4 error:&v16];
      id v15 = v16;

      v8[2](v8, v15);
    }
    else
    {
      v8[2](v8, 0);
    }
  }
}

- (void)allDeclarationKeysForScope:(int64_t)a3 completionHandler:(id)a4
{
  BOOL v6 = (void (**)(id, uint64_t, id))a4;
  v7 = [(WrappedSingleAdapter *)self wrappedAdapter];
  char v8 = objc_opt_respondsToSelector();

  objc_super v9 = [(WrappedSingleAdapter *)self wrappedAdapter];
  char v10 = v9;
  if ((v8 & 1) == 0)
  {
    char v11 = objc_opt_respondsToSelector();

    v12 = [(WrappedSingleAdapter *)self wrappedAdapter];
    char v13 = v12;
    if (v11)
    {
      id v22 = 0;
      id v14 = [v12 installedDeclarationKeyForScope:a3 error:&v22];
      id v15 = v22;

      if (v14)
      {
        uint64_t v16 = [MEMORY[0x263EFFA08] setWithObject:v14];
      }
      else
      {
        uint64_t v16 = objc_opt_new();
      }
      v20 = (void *)v16;
      v6[2](v6, v16, v15);
    }
    else
    {
      char v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) == 0) {
        goto LABEL_14;
      }
      v18 = [(WrappedSingleAdapter *)self wrappedAdapter];
      id v14 = [v18 installedDeclarationKey];

      if (v14)
      {
        uint64_t v19 = [MEMORY[0x263EFFA08] setWithObject:v14];
      }
      else
      {
        uint64_t v19 = objc_opt_new();
      }
      v21 = (void *)v19;
      v6[2](v6, v19, 0);
    }
    goto LABEL_14;
  }
  [v9 allDeclarationKeysForScope:a3 completionHandler:v6];

LABEL_14:
}

- (void)applyConfiguration:(id)a3 replaceKey:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, id, id))a6;
  char v13 = [(WrappedSingleAdapter *)self wrappedAdapter];
  char v14 = objc_opt_respondsToSelector();

  id v15 = [(WrappedSingleAdapter *)self wrappedAdapter];
  uint64_t v16 = v15;
  if (v14)
  {
    [v15 applyConfiguration:v10 replaceKey:v11 scope:a5 completionHandler:v12];
  }
  else
  {
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      v18 = [(WrappedSingleAdapter *)self wrappedAdapter];
      id v21 = 0;
      id v22 = 0;
      [v18 applyConfiguration:v10 scope:a5 returningReasons:&v22 error:&v21];
      id v19 = v22;
      id v20 = v21;

      v12[2](v12, v19, v20);
    }
  }
}

- (void)removeDeclarationKey:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  objc_super v9 = (void (**)(id, id))a5;
  id v10 = [(WrappedSingleAdapter *)self wrappedAdapter];
  char v11 = objc_opt_respondsToSelector();

  v12 = [(WrappedSingleAdapter *)self wrappedAdapter];
  char v13 = v12;
  if (v11)
  {
    [v12 removeDeclarationKey:v8 scope:a4 completionHandler:v9];
  }
  else
  {
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = [(WrappedSingleAdapter *)self wrappedAdapter];
      id v17 = 0;
      [v15 removeDeclarationKey:v8 scope:a4 error:&v17];
      id v16 = v17;

      v9[2](v9, v16);
    }
  }
}

- (RMConfigurationSingleAdapter)wrappedAdapter
{
  return self->_wrappedAdapter;
}

- (void).cxx_destruct
{
}

@end