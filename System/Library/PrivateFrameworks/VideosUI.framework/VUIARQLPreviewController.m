@interface VUIARQLPreviewController
- (ARQuickLookPreviewItem)quickLookPreviewItem;
- (ARQuickLookWebKitItem)quickLookWebKitItem;
- (VUIARQLPreviewController)initWithQuickLookPreviewItem:(id)a3;
- (VUIARQLPreviewController)initWithQuickLookWebKitItem:(id)a3;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)_commonInit;
- (void)setQuickLookPreviewItem:(id)a3;
- (void)setQuickLookWebKitItem:(id)a3;
@end

@implementation VUIARQLPreviewController

- (VUIARQLPreviewController)initWithQuickLookPreviewItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIARQLPreviewController;
  v5 = [(VUIARQLPreviewController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(VUIARQLPreviewController *)v5 _commonInit];
    [(VUIARQLPreviewController *)v6 setQuickLookPreviewItem:v4];
  }

  return v6;
}

- (VUIARQLPreviewController)initWithQuickLookWebKitItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIARQLPreviewController;
  v5 = [(VUIARQLPreviewController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(VUIARQLPreviewController *)v5 _commonInit];
    [(VUIARQLPreviewController *)v6 setQuickLookWebKitItem:v4];
  }

  return v6;
}

- (void)_commonInit
{
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  id v5 = a3;
  quickLookWebKitItem = self->_quickLookWebKitItem;
  if (quickLookWebKitItem || (quickLookWebKitItem = self->_quickLookPreviewItem) != 0)
  {
    id v7 = quickLookWebKitItem;
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:&stru_1F3E921E0];
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F14EF8]) initWithFileAtURL:v9];
  }
  return v7;
}

- (ARQuickLookWebKitItem)quickLookWebKitItem
{
  return self->_quickLookWebKitItem;
}

- (void)setQuickLookWebKitItem:(id)a3
{
}

- (ARQuickLookPreviewItem)quickLookPreviewItem
{
  return self->_quickLookPreviewItem;
}

- (void)setQuickLookPreviewItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLookPreviewItem, 0);
  objc_storeStrong((id *)&self->_quickLookWebKitItem, 0);
}

@end