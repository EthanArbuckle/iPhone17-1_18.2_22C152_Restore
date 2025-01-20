@interface SXQuickLookPreviewViewController
- (SXQuickLookFile)file;
- (SXQuickLookPreviewViewController)initWithFile:(id)a3 transitionContext:(id)a4;
- (SXQuickLookTransitionContext)transitionContext;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation SXQuickLookPreviewViewController

- (SXQuickLookPreviewViewController)initWithFile:(id)a3 transitionContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXQuickLookPreviewViewController;
  v9 = [(QLPreviewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_file, a3);
    objc_storeStrong((id *)&v10->_transitionContext, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SXQuickLookPreviewViewController;
  [(QLPreviewController *)&v3 viewDidLoad];
  [(QLPreviewController *)self setDelegate:self];
  [(QLPreviewController *)self setDataSource:self];
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  v4 = [(SXQuickLookPreviewViewController *)self transitionContext];
  v5 = [v4 originView];

  return v5;
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  id v5 = objc_alloc(MEMORY[0x263EF8FB8]);
  v6 = [(SXQuickLookPreviewViewController *)self file];
  id v7 = [v6 fileURL];
  id v8 = (void *)[v5 initWithFileAtURL:v7];

  v9 = [(SXQuickLookPreviewViewController *)self file];
  v10 = [v9 shareURL];
  [v8 setCanonicalWebPageURL:v10];

  return v8;
}

- (SXQuickLookFile)file
{
  return self->_file;
}

- (SXQuickLookTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

@end