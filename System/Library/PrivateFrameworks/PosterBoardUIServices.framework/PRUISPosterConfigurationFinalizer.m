@interface PRUISPosterConfigurationFinalizer
+ (id)finalizedConfigurationForAttributes:(id)a3 withConfiguredProperties:(id)a4 error:(id *)a5;
+ (id)finalizerErrorWithCode:(int64_t)a3 underlyingError:(id)a4;
@end

@implementation PRUISPosterConfigurationFinalizer

+ (id)finalizerErrorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F08608];
  v12[0] = a4;
  v6 = NSDictionary;
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v5 errorWithDomain:@"PRUISPosterConfigurationFinalizerErrorDomain" code:a3 userInfo:v8];

  return v9;
}

+ (id)finalizedConfigurationForAttributes:(id)a3 withConfiguredProperties:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_opt_new();
  v10 = [v8 path];
  uint64_t v11 = (void *)MEMORY[0x263F5F440];
  v12 = [v8 extensionIdentifier];
  v13 = [v8 role];
  v14 = [v8 posterUUID];
  v15 = [v11 configurationIdentityWithProvider:v12 identifier:0 role:v13 posterUUID:v14 version:0 supplement:0];

  v16 = (void *)MEMORY[0x263F5F448];
  v17 = [v8 providerURL];

  v18 = [v16 pathWithProviderURL:v17 identity:v15];

  v19 = [v18 instanceURL];
  v20 = PFFileProtectionNoneAttributes();
  id v33 = 0;
  [v9 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:v20 error:&v33];
  id v21 = v33;

  if (v21) {
    goto LABEL_6;
  }
  v22 = [v18 contentsURL];
  v23 = PFFileProtectionNoneAttributes();
  id v32 = 0;
  [v9 createDirectoryAtURL:v22 withIntermediateDirectories:1 attributes:v23 error:&v32];
  id v21 = v32;

  if (v21) {
    goto LABEL_6;
  }
  id v31 = 0;
  [v18 copyContentsOfPath:v10 error:&v31];
  id v24 = v31;
  if (v24) {
    goto LABEL_4;
  }
  v25 = [v18 supplementURL];
  v26 = PFFileProtectionNoneAttributes();
  id v30 = 0;
  [v9 createDirectoryAtURL:v25 withIntermediateDirectories:1 attributes:v26 error:&v30];
  id v21 = v30;

  if (v21) {
    goto LABEL_6;
  }
  id v29 = 0;
  [MEMORY[0x263F5F500] storeConfiguredPropertiesForPath:v18 configuredProperties:v7 error:&v29];
  id v24 = v29;
  if (v24)
  {
LABEL_4:
    id v21 = v24;
LABEL_6:
    *a5 = [(id)objc_opt_class() finalizerErrorWithCode:2 underlyingError:v21];

    v27 = 0;
    goto LABEL_7;
  }
  v27 = (void *)[objc_alloc(MEMORY[0x263F5F350]) _initWithPath:v18];
LABEL_7:

  return v27;
}

@end