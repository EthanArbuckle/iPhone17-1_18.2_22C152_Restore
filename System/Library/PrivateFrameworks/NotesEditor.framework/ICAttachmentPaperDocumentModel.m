@interface ICAttachmentPaperDocumentModel
@end

@implementation ICAttachmentPaperDocumentModel

uint64_t __94__ICAttachmentPaperDocumentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x263F5ACA0] sharedContext];
  v5 = [v4 workerManagedObjectContext];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __94__ICAttachmentPaperDocumentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2;
  v9[3] = &unk_2640B8230;
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v12 = v3;
  id v6 = v3;
  id v7 = v5;
  [v7 performBlock:v9];

  return 0;
}

void __94__ICAttachmentPaperDocumentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke_2(void *a1)
{
  objc_msgSend(MEMORY[0x263F5AB78], "ic_existingObjectWithID:context:", a1[4], a1[5]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = a1[6];
  id v3 = [v4 previewItemURL];
  (*(void (**)(uint64_t, void *, void, void))(v2 + 16))(v2, v3, 0, 0);
}

@end