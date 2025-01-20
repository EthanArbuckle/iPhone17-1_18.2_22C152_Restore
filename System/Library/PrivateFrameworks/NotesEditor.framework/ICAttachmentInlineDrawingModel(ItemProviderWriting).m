@interface ICAttachmentInlineDrawingModel(ItemProviderWriting)
- (id)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:;
- (id)writableTypeIdentifiersForItemProvider;
@end

@implementation ICAttachmentInlineDrawingModel(ItemProviderWriting)

- (id)writableTypeIdentifiersForItemProvider
{
  v2 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
  v3 = [a1 attachment];
  v4 = [v3 typeUTI];
  objc_msgSend(v2, "ic_addNonNilObject:", v4);

  v5 = [MEMORY[0x263F5AB78] fallbackImageUTI];
  objc_msgSend(v2, "ic_addNonNilObject:", v5);

  v6 = [MEMORY[0x263F5AB78] fallbackPDFUTI];
  objc_msgSend(v2, "ic_addNonNilObject:", v6);

  v7 = (void *)[v2 copy];

  return v7;
}

- (id)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:*MEMORY[0x263F5AA90]])
  {
    v18.receiver = a1;
    v18.super_class = (Class)&off_26C1C4AE8;
    v8 = objc_msgSendSuper2(&v18, sel_loadDataWithTypeIdentifier_forItemProviderCompletionHandler_, v6, v7);
  }
  else
  {
    v9 = [a1 attachment];
    v10 = [v9 objectID];

    v11 = [MEMORY[0x263F5ACA0] sharedContext];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __115__ICAttachmentInlineDrawingModel_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
    v14[3] = &unk_2640B81B8;
    id v15 = v10;
    id v16 = v6;
    id v17 = v7;
    id v12 = v10;
    [v11 performBackgroundTask:v14];

    v8 = 0;
  }

  return v8;
}

@end