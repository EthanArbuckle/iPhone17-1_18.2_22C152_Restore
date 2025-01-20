@interface ICPostToInstagramAction
- (WFFileRepresentation)instagramRepresentation;
- (id)inputContentClasses;
- (void)appDidResume:(id)a3;
- (void)dealloc;
- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7;
- (void)setInstagramRepresentation:(id)a3;
- (void)shareAsALAssetWithItem:(id)a3 caption:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7;
- (void)shareAsImageFileWithItem:(id)a3 caption:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7;
@end

@implementation ICPostToInstagramAction

- (void).cxx_destruct
{
}

- (void)setInstagramRepresentation:(id)a3
{
}

- (WFFileRepresentation)instagramRepresentation
{
  return self->_instagramRepresentation;
}

- (void)shareAsImageFileWithItem:(id)a3 caption:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__ICPostToInstagramAction_shareAsImageFileWithItem_caption_userInterface_successHandler_errorHandler___block_invoke;
  v17[3] = &unk_1E65548D8;
  v17[4] = self;
  id v18 = v11;
  id v19 = v13;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v13;
  [a3 getFileRepresentation:v17 forType:0];
}

void __102__ICPostToInstagramAction_shareAsImageFileWithItem_caption_userInterface_successHandler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 wfName];
    v6 = [v5 stringByAppendingPathExtension:@"ig"];

    v7 = [MEMORY[0x1E4F5AA28] proposedTemporaryFileURLForFilename:v6];
    id v23 = 0;
    [v4 writeToFileURL:v7 overwriting:0 error:&v23];
    id v8 = v23;
    v9 = (void *)MEMORY[0x1E4F5A900];
    v10 = [MEMORY[0x1E4FB4718] typeWithString:@"com.instagram.photo"];
    id v11 = [v9 fileWithURL:v7 options:1 ofType:v10];

    if (!v11) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = getUIApplicationWillEnterForegroundNotification();
    [v12 addObserver:v13 selector:sel_appDidResume_ name:v14 object:0];

    [*(id *)(a1 + 32) setInstagramRepresentation:v11];
    uint64_t v15 = *(void *)(a1 + 40);
    v24 = @"InstagramCaption";
    v25[0] = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v17 = [(objc_class *)getUIPasteboardClass_47944() generalPasteboard];
    [v17 setString:*(void *)(a1 + 40)];

    id v18 = [*(id *)(a1 + 32) app];
    id v19 = [v11 fileURL];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __102__ICPostToInstagramAction_shareAsImageFileWithItem_caption_userInterface_successHandler_errorHandler___block_invoke_2;
    v20[3] = &unk_1E65548B0;
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 48);
    [v18 openFile:v19 withAnnotation:v16 completionHandler:v20];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __102__ICPostToInstagramAction_shareAsImageFileWithItem_caption_userInterface_successHandler_errorHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)shareAsALAssetWithItem:(id)a3 caption:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [a3 asset];
  id v14 = [v13 ALAssetURL];

  uint64_t v15 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  id v16 = (void *)[v15 mutableCopy];

  [v16 removeCharactersInString:@"?&="];
  v17 = (void *)MEMORY[0x1E4F1CB10];
  id v18 = NSString;
  id v19 = [v14 absoluteString];
  id v20 = [v19 stringByAddingPercentEncodingWithAllowedCharacters:v16];
  id v21 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v16];
  id v22 = [v18 stringWithFormat:@"instagram://library?AssetPath=%@&InstagramCaption=%@", v20, v21];
  id v23 = [v17 URLWithString:v22];

  v24 = [(objc_class *)getUIPasteboardClass_47944() generalPasteboard];
  [v24 setString:v12];

  v25 = [MEMORY[0x1E4F5A7A0] sharedContext];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __100__ICPostToInstagramAction_shareAsALAssetWithItem_caption_userInterface_successHandler_errorHandler___block_invoke;
  v27[3] = &unk_1E6558110;
  id v28 = v10;
  id v26 = v10;
  [v25 openURL:v23 withBundleIdentifier:@"com.burbn.instagram" userInterface:v11 completionHandler:v27];
}

uint64_t __100__ICPostToInstagramAction_shareAsALAssetWithItem_caption_userInterface_successHandler_errorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __103__ICPostToInstagramAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke;
  v23[3] = &unk_1E65599D0;
  id v24 = v12;
  id v25 = v13;
  id v26 = self;
  id v27 = v14;
  id v28 = v16;
  id v29 = v15;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v16;
  id v22 = v12;
  [v22 generateCollectionByCoercingToItemClasses:v17 completionHandler:v23];
}

void __103__ICPostToInstagramAction_performActionWithInput_parameters_userInterface_successHandler_errorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a2 items];
  id v8 = [v7 firstObject];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 40) objectForKey:@"InstagramCaption"];
    id v10 = (void *)v9;
    id v11 = &stru_1F229A4D8;
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    id v12 = v11;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v8 preferredFileType],
          id v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v13 conformsToUTType:*MEMORY[0x1E4F44400]],
          v13,
          (v14 & 1) == 0))
    {
      [*(id *)(a1 + 48) shareAsALAssetWithItem:v8 caption:v12 userInterface:*(void *)(a1 + 56) successHandler:*(void *)(a1 + 72) errorHandler:*(void *)(a1 + 64)];
    }
    else
    {
      [*(id *)(a1 + 48) shareAsImageFileWithItem:v8 caption:v12 userInterface:*(void *)(a1 + 56) successHandler:*(void *)(a1 + 72) errorHandler:*(void *)(a1 + 64)];
    }
  }
  else
  {
    id v15 = [*(id *)(a1 + 32) collectionByFilteringToItemClass:objc_opt_class() excludedItems:0];
    uint64_t v16 = [v15 numberOfItems];

    uint64_t v17 = *(void *)(a1 + 64);
    if (!v16)
    {
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v6);
      goto LABEL_11;
    }
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28798];
    v23[0] = *MEMORY[0x1E4F28588];
    WFLocalizedString(@"Could Not Post Video");
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v24[0] = v12;
    v23[1] = *MEMORY[0x1E4F28568];
    id v20 = WFLocalizedString(@"Shortcuts can only post video on Instagram if the video is in a photo album.\n\nTry putting a “Save to Photos” action before “Post on Instagram.”");
    v24[1] = v20;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    id v22 = [v18 errorWithDomain:v19 code:79 userInfo:v21];
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v22);
  }
LABEL_11:
}

- (id)inputContentClasses
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (void)appDidResume:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  v5 = getUIApplicationWillEnterForegroundNotification();
  [v4 removeObserver:self name:v5 object:0];

  [(ICPostToInstagramAction *)self setInstagramRepresentation:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = getUIApplicationWillEnterForegroundNotification();
  [v3 removeObserver:self name:v4 object:0];

  v5.receiver = self;
  v5.super_class = (Class)ICPostToInstagramAction;
  [(ICPostToInstagramAction *)&v5 dealloc];
}

@end