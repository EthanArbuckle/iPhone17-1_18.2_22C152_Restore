@interface NSItemProvider
@end

@implementation NSItemProvider

void __88__NSItemProvider_SocialLayer__sl_loadRepresentationForTypeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v26 = a2;
  v3 = [*(id *)(a1 + 32) typeIdentifier];
  v4 = [(id)*MEMORY[0x1E4F444F8] identifier];
  int v5 = [v3 isEqualToString:v4];

  v6 = v26;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E4F1CB10];
    v8 = [v26 data];
    v9 = [*(id *)(a1 + 32) typeIdentifier];
    v10 = [v7 objectWithItemProviderData:v8 typeIdentifier:v9 error:0];

    if (!v10)
    {
      v11 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v12 = objc_opt_class();
      v13 = [v26 data];
      v10 = [v11 unarchivedObjectOfClass:v12 fromData:v13 error:0];
    }
    if ([v10 isFileURL])
    {
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v10 readonly:0];
      [v26 setUrlWrapper:v14];
    }
    v6 = v26;
  }
  v15 = [v6 urlWrapper];
  if (v15)
  {
    v16 = [SLSecurityScopedURL alloc];
    v17 = [v26 urlWrapper];
    v18 = [v17 url];
    v19 = [v26 urlWrapper];
    v20 = -[SLSecurityScopedURL initWithURL:readonly:](v16, "initWithURL:readonly:", v18, [v19 isReadonly]);
  }
  else
  {
    v20 = 0;
  }

  v21 = [v26 data];
  uint64_t v22 = [v26 archivedObjectClass];
  uint64_t v23 = [v26 wasOpenedInPlace];
  v24 = [v26 error];
  v25 = +[SLShareableContentLoadResult resultWithData:v21 archivedObjectClass:v22 urlWrapper:v20 wasOpenedInPlace:v23 error:v24];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end