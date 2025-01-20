@interface ICAttachmentPaperDocumentModel(ItemProviderWriting)
- (uint64_t)itemProviderUTI;
- (void)registerFileLoadHandlersOnItemProvider:()ItemProviderWriting;
@end

@implementation ICAttachmentPaperDocumentModel(ItemProviderWriting)

- (uint64_t)itemProviderUTI
{
  return [(id)*MEMORY[0x263F1DBF0] identifier];
}

- (void)registerFileLoadHandlersOnItemProvider:()ItemProviderWriting
{
  id v4 = a3;
  v5 = [a1 attachment];
  v6 = [v5 objectID];

  uint64_t v7 = *MEMORY[0x263F1DBF0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __94__ICAttachmentPaperDocumentModel_ItemProviderWriting__registerFileLoadHandlersOnItemProvider___block_invoke;
  v9[3] = &unk_2640B8190;
  id v10 = v6;
  id v8 = v6;
  [v4 registerFileRepresentationForContentType:v7 visibility:0 openInPlace:0 loadHandler:v9];
}

@end