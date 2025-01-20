@interface UIApplication(PhotosUICore)
- (void)px_navigateToCollection:()PhotosUICore selectedObject:completionHandler:;
- (void)px_navigateToCollectionSubtype:()PhotosUICore completionHandler:;
- (void)px_navigateToForYouRevealingSharedLibrarySharingSuggestionsWithCompletionHandler:()PhotosUICore;
- (void)px_navigateToMomentsViewRevealingAsset:()PhotosUICore completionHandler:;
- (void)px_navigateToMomentsViewRevealingAssetWithUUID:()PhotosUICore openOneUp:completionHandler:;
- (void)px_navigateToMomentsViewRevealingDisplayAsset:()PhotosUICore openOneUp:completionHandler:;
- (void)px_navigateToOneUpShowingAsset:()PhotosUICore completionHandler:;
- (void)px_navigateToPhotosURL:()PhotosUICore completionHandler:;
- (void)px_navigateToRevealDroppedAsset:()PhotosUICore completionHandler:;
- (void)px_navigateToWelcomeCloudViewWithCompletionHandler:()PhotosUICore;
@end

@implementation UIApplication(PhotosUICore)

- (void)px_navigateToPhotosURL:()PhotosUICore completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[PXProgrammaticNavigationDestination alloc] initWithURL:v6];
  v9 = objc_msgSend(a1, "px_firstKeyWindow");
  v10 = [v9 rootViewController];

  if ([v10 routingOptionsForDestination:v8])
  {
    v11 = [PXProgrammaticNavigationRequest alloc];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__UIApplication_PhotosUICore__px_navigateToPhotosURL_completionHandler___block_invoke;
    v22[3] = &unk_1E5DCEE10;
    v12 = &v23;
    v13 = &v24;
    id v23 = v6;
    id v24 = v7;
    id v14 = v7;
    id v15 = v6;
    v16 = [(PXProgrammaticNavigationRequest *)v11 initWithDestination:v8 options:0 completionHandler:v22];
    PXProgrammaticNavigationRequestExecute(v16, v10);
  }
  else
  {
    v16 = dispatch_get_global_queue(25, 0);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__UIApplication_PhotosUICore__px_navigateToPhotosURL_completionHandler___block_invoke_268;
    v19[3] = &unk_1E5DD3280;
    v12 = &v20;
    v13 = &v21;
    id v20 = v6;
    id v21 = v7;
    id v17 = v7;
    id v18 = v6;
    dispatch_async(v16, v19);
  }
}

- (void)px_navigateToCollection:()PhotosUICore selectedObject:completionHandler:
{
  id v8 = a5;
  objc_msgSend(a3, "px_navigationURLWithSelectedObject:", a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v9, v8);
}

- (void)px_navigateToOneUpShowingAsset:()PhotosUICore completionHandler:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uuid];
  if ([v8 length])
  {
    id v9 = [MEMORY[0x1E4F29088] componentsWithString:@"photos://asset"];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"uuid" value:v8];
    [v10 addObject:v11];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"albumname" value:@"camera-roll"];
    [v10 addObject:v12];
    [v9 setQueryItems:v10];
    v13 = [v9 URL];
    objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v13, v7);
  }
  else
  {
    id v14 = PLUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "Unable to navigate to an asset without an asset UUID. Asset: %@", buf, 0xCu);
    }

    if (v7)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__UIApplication_PhotosUICore__px_navigateToOneUpShowingAsset_completionHandler___block_invoke;
      block[3] = &unk_1E5DD3128;
      id v16 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

- (void)px_navigateToRevealDroppedAsset:()PhotosUICore completionHandler:
{
  id v6 = (void *)MEMORY[0x1E4F29088];
  id v7 = a4;
  id v8 = a3;
  id v14 = [v6 componentsWithString:@"photos://album"];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"name" value:@"camera-roll"];
  [v9 addObject:v10];
  v11 = [v8 uuid];

  if ([v11 length])
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"assetuuid" value:v11];
    [v9 addObject:v12];
  }
  [v14 setQueryItems:v9];
  v13 = [v14 URL];
  objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v13, v7);
}

- (void)px_navigateToCollectionSubtype:()PhotosUICore completionHandler:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F38EE8];
  id v7 = a4;
  id v8 = objc_msgSend(v6, "px_builtInAlbumNameForSubtype:", a3);
  if (v8)
  {
    id v9 = [NSString stringWithFormat:@"photos://album?name=%@", v8];
    id v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v10, v7);
  }
  else
  {
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = @"Cannot obtain failed-to-upload album name";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXUIApplicationErrorDomain" code:-1 userInfo:v11];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

- (void)px_navigateToMomentsViewRevealingAssetWithUUID:()PhotosUICore openOneUp:completionHandler:
{
  id v12 = a3;
  id v8 = a5;
  if ([v12 length])
  {
    [@"photos://contentmode?id=photos" stringByAppendingFormat:@"&assetuuid=%@", v12];
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v9 = @"photos://contentmode?id=photos";
  if (a4)
  {
LABEL_3:
    uint64_t v10 = [(__CFString *)v9 stringByAppendingFormat:@"&oneUp=1"];

    id v9 = (__CFString *)v10;
  }
LABEL_4:
  v11 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
  objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v11, v8);
}

- (void)px_navigateToForYouRevealingSharedLibrarySharingSuggestionsWithCompletionHandler:()PhotosUICore
{
  v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = a3;
  [v4 URLWithString:@"photos://forYou?type=sharedLibrarySuggestions"];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v6, v5);
}

- (void)px_navigateToMomentsViewRevealingDisplayAsset:()PhotosUICore openOneUp:completionHandler:
{
  id v14 = a3;
  id v8 = a5;
  objc_opt_class();
  id v9 = v14;
  if (objc_opt_isKindOfClass())
  {
    id v10 = v14;
    v11 = [v10 photoLibrary];
    uint64_t v12 = [v11 wellKnownPhotoLibraryIdentifier];

    id v9 = v10;
    if (v12 == 3)
    {
      id v9 = PXAssetToRevealForSyndicationLibraryAsset(v10);
    }
  }
  uint64_t v13 = [v9 uuid];
  objc_msgSend(a1, "px_navigateToMomentsViewRevealingAssetWithUUID:openOneUp:completionHandler:", v13, a4, v8);
}

- (void)px_navigateToMomentsViewRevealingAsset:()PhotosUICore completionHandler:
{
  id v6 = a4;
  id v7 = [a3 uuid];
  objc_msgSend(a1, "px_navigateToMomentsViewRevealingAssetWithUUID:openOneUp:completionHandler:", v7, 0, v6);
}

- (void)px_navigateToWelcomeCloudViewWithCompletionHandler:()PhotosUICore
{
  v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = a3;
  id v6 = [v4 URLWithString:@"photos://show-welcome-cpl"];
  objc_msgSend(a1, "px_navigateToPhotosURL:completionHandler:", v6, v5);
}

@end