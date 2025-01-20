@interface WFLocalStorageFileLocation
+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5;
+ (id)subpathFromURL:(id)a3;
+ (id)subpathFromURL:(id)a3 item:(id)a4;
- (BOOL)isSupportedOnCurrentPlatform;
- (BOOL)shouldShowUsersDuringDisplay:(id)a3;
- (id)resolveLocationWithError:(id *)a3;
@end

@implementation WFLocalStorageFileLocation

+ (id)subpathFromURL:(id)a3 item:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[WFFileLocationUtilities parentItemsForItem:v6];
  if ([v7 count]
    || ([v6 itemIdentifier],
        v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isEqualToString:*MEMORY[0x1E4F25C70]],
        v8,
        (v9 & 1) == 0))
  {
    v11 = [v5 pathComponents];
    v12 = [v11 reverseObjectEnumerator];
    v13 = [v12 allObjects];
    v14 = objc_msgSend(v13, "subarrayWithRange:", 1, objc_msgSend(v11, "count") - 1);

    v15 = (void *)MEMORY[0x1E4F1CA48];
    v16 = [v5 lastPathComponent];
    v17 = [v15 arrayWithObject:v16];

    if (v14)
    {
      unint64_t v18 = [v14 count] - 1;
      unint64_t v19 = [v7 count] - 1;
      if (v18 < v19) {
        unint64_t v19 = v18;
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __50__WFLocalStorageFileLocation_subpathFromURL_item___block_invoke;
      v24[3] = &unk_1E654C910;
      unint64_t v27 = v19;
      id v25 = v7;
      id v20 = v17;
      id v26 = v20;
      [v14 enumerateObjectsUsingBlock:v24];
      v21 = [v20 reverseObjectEnumerator];
      v22 = [v21 allObjects];
      v10 = [v22 componentsJoinedByString:@"/"];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = &stru_1F229A4D8;
  }

  return v10;
}

void __50__WFLocalStorageFileLocation_subpathFromURL_item___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 48) >= a3)
  {
    id v12 = v7;
    v8 = [*(id *)(a1 + 32) objectAtIndex:a3];
    char v9 = [v8 itemIdentifier];
    int v10 = [v9 isEqualToString:*MEMORY[0x1E4F25C70]];

    if (v10)
    {
      *a4 = 1;
    }
    else
    {
      v11 = [v8 filename];
      if ([v12 isEqualToString:v11]) {
        [*(id *)(a1 + 40) addObject:v12];
      }
      else {
        *a4 = 1;
      }
    }
    id v7 = v12;
  }
  else
  {
    *a4 = 1;
  }
}

+ (id)subpathFromURL:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFLocalStorageFileLocation;
  v3 = objc_msgSendSuper2(&v5, sel_subpathFromURL_, a3);
  return v3;
}

+ (BOOL)canRepresentURL:(id)a3 item:(id)a4 parentItems:(id)a5
{
  objc_super v5 = objc_msgSend(a4, "providerDomainID", a3);
  char v6 = [v5 isEqualToString:@"com.apple.FileProvider.LocalStorage"];

  return v6;
}

- (BOOL)shouldShowUsersDuringDisplay:(id)a3
{
  return 1;
}

- (id)resolveLocationWithError:(id *)a3
{
  v4 = [(WFFileProviderLocation *)self resolveCrossDeviceItemIDWithError:a3];
  if (!v4)
  {
    objc_super v5 = [(WFFileProviderLocation *)self appContainerBundleIdentifier];

    if (v5)
    {
      char v6 = [(WFFileProviderLocation *)self appContainerBundleIdentifier];
      +[WFFileLocationUtilities documentsURLForApplicationContainerBundleID:v6];
    }
    else
    {
      char v6 = [(WFFileProviderLocation *)self fileProviderDomainID];
      +[WFFileLocationUtilities fetchRootItemURLForDomainWithID:v6];
    id v7 = };

    if (v7)
    {
      v8 = [(WFFileLocation *)self relativeSubpath];
      v4 = [v7 URLByAppendingPathComponent:v8];
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (BOOL)isSupportedOnCurrentPlatform
{
  return 1;
}

@end