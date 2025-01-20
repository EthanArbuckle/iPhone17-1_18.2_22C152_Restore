@interface UIEnumerateApplicationsInPreferredOrderForOpeningDocument
@end

@implementation UIEnumerateApplicationsInPreferredOrderForOpeningDocument

void ___UIEnumerateApplicationsInPreferredOrderForOpeningDocument_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 applicationIdentifier];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0)
  {
    v6 = [v3 applicationIdentifier];
    if ([v6 isEqualToString:*(void *)(a1 + 40)])
    {
      char v7 = [v3 supportsOpenInPlace];

      if ((v7 & 1) == 0) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    uint64_t v8 = [v3 sdkVersion];
    v9 = (void *)v8;
    v10 = @"1.0";
    if (v8) {
      v10 = (__CFString *)v8;
    }
    v11 = v10;

    v12 = [*(id *)(a1 + 48) URL];
    id v16 = 0;
    [v12 getResourceValue:&v16 forKey:*MEMORY[0x1E4F1C858] error:0];
    id v13 = v16;

    if (!v13
      || ([v13 BOOLValue] & 1) != 0
      || ([MEMORY[0x1E4F223E0] defaultWorkspace],
          v14 = objc_claimAutoreleasedReturnValue(),
          int v15 = [v14 isVersion:v11 greaterThanOrEqualToVersion:@"13.0"],
          v14,
          v15))
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
LABEL_13:
}

@end