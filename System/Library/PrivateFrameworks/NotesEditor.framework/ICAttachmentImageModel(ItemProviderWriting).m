@interface ICAttachmentImageModel(ItemProviderWriting)
- (id)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:;
- (id)writableTypeIdentifiersForItemProvider;
- (void)registerFileLoadHandlersOnItemProvider:()ItemProviderWriting;
@end

@implementation ICAttachmentImageModel(ItemProviderWriting)

- (id)writableTypeIdentifiersForItemProvider
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = [a1 attachment];
  int v3 = [v2 isChildOfDocumentGallery];

  if (v3)
  {
    v4 = [(id)*MEMORY[0x263F1DB40] identifier];
    v8[0] = v4;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&off_26C1C4500;
    v5 = objc_msgSendSuper2(&v7, sel_writableTypeIdentifiersForItemProvider);
  }

  return v5;
}

- (id)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:*MEMORY[0x263F5AA90]])
  {
    v19.receiver = a1;
    v19.super_class = (Class)&off_26C1C4500;
    v8 = objc_msgSendSuper2(&v19, sel_loadDataWithTypeIdentifier_forItemProviderCompletionHandler_, v6, v7);
  }
  else
  {
    v9 = [a1 attachment];
    v10 = [v9 objectID];

    v11 = [MEMORY[0x263F5ACA0] sharedContext];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __107__ICAttachmentImageModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
    v14[3] = &unk_2640B8208;
    id v15 = v10;
    id v18 = v7;
    id v16 = v6;
    v17 = a1;
    id v12 = v10;
    [v11 performBackgroundTask:v14];

    v8 = 0;
  }

  return v8;
}

- (void)registerFileLoadHandlersOnItemProvider:()ItemProviderWriting
{
  id v4 = a3;
  v5 = [a1 attachment];
  char v6 = [v5 isChildOfDocumentGallery];

  if ((v6 & 1) == 0)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&off_26C1C4500;
    objc_msgSendSuper2(&v7, sel_registerFileLoadHandlersOnItemProvider_, v4);
  }
}

@end