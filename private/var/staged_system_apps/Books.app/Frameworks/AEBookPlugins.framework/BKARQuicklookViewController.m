@interface BKARQuicklookViewController
- (NSURL)ARModelDataURL;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)setARModelDataURL:(id)a3;
@end

@implementation BKARQuicklookViewController

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  v3 = [(BKARQuicklookViewController *)self ARModelDataURL];

  return v3 != 0;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  v4 = [(BKARQuicklookViewController *)self ARModelDataURL];
  v5 = BUProtocolCast();

  return v5;
}

- (NSURL)ARModelDataURL
{
  return self->_ARModelDataURL;
}

- (void)setARModelDataURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end