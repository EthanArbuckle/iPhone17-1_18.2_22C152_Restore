@interface ICAttachmentGalleryModel(ItemProviderWriting)
- (id)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:;
- (uint64_t)itemProviderUTI;
- (void)registerFileLoadHandlersOnItemProvider:()ItemProviderWriting;
@end

@implementation ICAttachmentGalleryModel(ItemProviderWriting)

- (uint64_t)itemProviderUTI
{
  return [(id)*MEMORY[0x263F1DBF0] identifier];
}

- (id)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)*MEMORY[0x263F1DBF0] identifier];
  int v9 = [v6 isEqualToString:v8];

  if (v9)
  {
    v10 = [a1 attachment];
    v11 = [v10 objectID];

    id v12 = objc_alloc_init(MEMORY[0x263F08AB8]);
    v13 = [MEMORY[0x263F5ACA0] sharedContext];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __109__ICAttachmentGalleryModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
    v20[3] = &unk_2640B81B8;
    id v21 = v11;
    id v14 = v12;
    id v22 = v14;
    id v23 = v7;
    id v15 = v11;
    [v13 performBackgroundTask:v20];

    v16 = v23;
    id v17 = v14;
  }
  else
  {
    v19.receiver = a1;
    v19.super_class = (Class)&off_26C1C49C0;
    objc_msgSendSuper2(&v19, sel_loadDataWithTypeIdentifier_forItemProviderCompletionHandler_, v6, v7);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void)registerFileLoadHandlersOnItemProvider:()ItemProviderWriting
{
  id v4 = a3;
  v5 = [a1 attachment];
  id v6 = [v5 objectID];

  id v7 = [a1 itemProviderUTI];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __88__ICAttachmentGalleryModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke;
  v9[3] = &unk_2640B8190;
  id v10 = v6;
  id v8 = v6;
  [v4 registerFileRepresentationForTypeIdentifier:v7 fileOptions:0 visibility:0 loadHandler:v9];
}

@end