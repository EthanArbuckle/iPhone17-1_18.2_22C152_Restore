@interface WFContentCollection(QLPreviewControllerDataSource)
- (id)previewController:()QLPreviewControllerDataSource previewItemAtIndex:;
- (uint64_t)numberOfPreviewItemsInPreviewController:()QLPreviewControllerDataSource;
@end

@implementation WFContentCollection(QLPreviewControllerDataSource)

- (id)previewController:()QLPreviewControllerDataSource previewItemAtIndex:
{
  id v6 = a3;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __91__WFContentCollection_QLPreviewControllerDataSource__previewController_previewItemAtIndex___block_invoke;
  v15 = &unk_264C50C48;
  id v16 = v6;
  uint64_t v17 = a4;
  id v7 = v6;
  v8 = _Block_copy(&v12);
  v9 = _Block_copy(v8);
  v10 = objc_msgSend(a1, "previewProxyItemAtIndex:refreshBlock:", a4, v9, v12, v13, v14, v15);

  return v10;
}

- (uint64_t)numberOfPreviewItemsInPreviewController:()QLPreviewControllerDataSource
{
  v1 = [a1 items];
  uint64_t v2 = [v1 count];

  return v2;
}

@end