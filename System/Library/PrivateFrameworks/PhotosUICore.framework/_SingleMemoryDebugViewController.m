@interface _SingleMemoryDebugViewController
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation _SingleMemoryDebugViewController

- (void).cxx_destruct
{
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_SingleMemoryDebugViewController;
  [(_SingleMemoryDebugViewController *)&v3 viewWillLayoutSubviews];
  [(_SingleMemoryDebugViewController *)self view];
  [(id)objc_claimAutoreleasedReturnValue() bounds];
  PXEdgeInsetsMake();
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)_SingleMemoryDebugViewController;
  [(_SingleMemoryDebugViewController *)&v21 viewDidLoad];
  objc_super v3 = [(_SingleMemoryDebugViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  [(UIViewController *)self px_enableExtendedTraitCollection];
  v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v6 = [(PXMemoriesFeedDataSourceManagerBase *)[PXMemoriesFeedWidgetDataSourceManager alloc] initWithPhotoLibrary:v5];
  [(PXMemoriesFeedWidgetDataSourceManager *)v6 setMaxCount:1];
  [(PXMemoriesFeedWidgetDataSourceManager *)v6 startGeneratingMemories];
  v7 = [(PXSectionedDataSourceManager *)v6 dataSource];
  v8 = v7;
  long long v19 = 0u;
  long long v20 = 0u;
  if (v7)
  {
    [v7 firstItemIndexPath];
    uint64_t v9 = v19;
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (v9 != *(void *)off_1E5DAAED8)
  {
    v18[0] = v19;
    v18[1] = v20;
    uint64_t v10 = [v8 objectAtIndexPath:v18];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_alloc_init(PXMemoryViewModel);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __47___SingleMemoryDebugViewController_viewDidLoad__block_invoke;
      v16[3] = &unk_1E5DCE318;
      id v17 = v11;
      id v13 = v11;
      [(PXMemoryViewModel *)v12 performChanges:v16];
      v14 = objc_alloc_init(PXMemoryView);
      memoryView = self->_memoryView;
      self->_memoryView = v14;

      [(PXMemoryView *)self->_memoryView setViewModel:v12];
      [v3 addSubview:self->_memoryView];
    }
  }
}

@end