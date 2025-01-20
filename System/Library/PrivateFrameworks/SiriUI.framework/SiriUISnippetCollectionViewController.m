@interface SiriUISnippetCollectionViewController
- (SiriUISnippetCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (UICollectionView)collectionView;
- (UICollectionViewLayout)collectionViewLayout;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)loadView;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SiriUISnippetCollectionViewController

- (SiriUISnippetCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriUISnippetCollectionViewController;
  v6 = [(SiriUISnippetViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_collectionViewLayout, a3);
  }

  return v7;
}

- (void)loadView
{
  self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews = 1;
  id v3 = objc_alloc(MEMORY[0x263F1C4E0]);
  v4 = [(SiriUIBaseSnippetViewController *)self delegate];
  [v4 siriViewControllerExpectedWidth:self];
  double v6 = v5;
  v7 = [(SiriUISnippetCollectionViewController *)self collectionViewLayout];
  v8 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v7, 0.0, 0.0, v6, 0.0);
  collectionView = self->_collectionView;
  self->_collectionView = v8;

  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setScrollEnabled:0];
  [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
  v10 = self->_collectionView;
  v11 = [MEMORY[0x263F1C550] clearColor];
  [(UICollectionView *)v10 setBackgroundColor:v11];

  v12 = [MEMORY[0x263F285A0] sharedPreferences];
  LODWORD(v11) = [v12 enableDragAndDrop];

  if (v11) {
    [(UICollectionView *)self->_collectionView setDragDelegate:self];
  }
  v13 = self->_collectionView;
  [(SiriUISnippetCollectionViewController *)self setView:v13];
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)SiriUISnippetCollectionViewController;
  [(SiriUISnippetCollectionViewController *)&v14 viewWillLayoutSubviews];
  id v3 = [(SiriUISnippetCollectionViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (self->_previousBounds.size.width != v9 || self->_previousBounds.size.height != v11)
  {
    if (self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews)
    {
      v13 = [(UICollectionView *)self->_collectionView collectionViewLayout];
      [v13 invalidateLayout];
    }
    self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews = 1;
    self->_previousBounds.origin.x = v5;
    self->_previousBounds.origin.y = v7;
    self->_previousBounds.size.width = v9;
    self->_previousBounds.size.height = v11;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  double v8 = [(SiriUISnippetCollectionViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  if (v10 != width || v12 != height)
  {
    self->_needsToInvalidateCollectionViewLayoutOnViewWillLayoutSubviews = 0;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __92__SiriUISnippetCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v15[3] = &unk_26469F298;
    v15[4] = self;
    [v7 animateAlongsideTransition:v15 completion:0];
  }
  v14.receiver = self;
  v14.super_class = (Class)SiriUISnippetCollectionViewController;
  -[SiriUISnippetCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

void __92__SiriUISnippetCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 1224) collectionViewLayout];
  [v2 invalidateLayout];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__SiriUISnippetCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  block[3] = &unk_26469EFA8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __92__SiriUISnippetCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 siriViewControllerHeightDidChange:*(void *)(a1 + 32)];
}

- (UICollectionViewLayout)collectionViewLayout
{
  collectionViewLayout = self->_collectionViewLayout;
  if (!collectionViewLayout)
  {
    double v4 = objc_alloc_init(SiriUICollectionViewFlowLayout);
    [(UICollectionViewFlowLayout *)v4 setMinimumLineSpacing:0.0];
    [(UICollectionViewFlowLayout *)v4 setMinimumInteritemSpacing:0.0];
    CGFloat v5 = self->_collectionViewLayout;
    self->_collectionViewLayout = &v4->super.super;

    collectionViewLayout = self->_collectionViewLayout;
  }
  return collectionViewLayout;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return 0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  double v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"SiriUISnippetCollectionViewController.m", 105, @"SiriUISnippetCollectionViewController unexpectedly asked to provide a cell, subclass %@ should override", v8 object file lineNumber description];

  return 0;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "array", a3, a4, a5);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
}

@end