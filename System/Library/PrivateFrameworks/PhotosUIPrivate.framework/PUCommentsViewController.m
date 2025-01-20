@interface PUCommentsViewController
+ (BOOL)canShowCommentsForAsset:(id)a3;
- (BOOL)_needsUpdateTableViewScrollPosition;
- (BOOL)contentAreaContainsPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (CGRect)contentBoundsInCoordinateSpace:(id)a3;
- (CGSize)minimumContentSize;
- (CGSize)preferredContentSize;
- (PUAccessoryContentViewControllerDelegate)accessoryContentViewControllerDelegate;
- (PUAssetViewModel)assetViewModel;
- (PUCommentsTableDataController)_tableDataController;
- (PUCommentsViewController)initWithAssetViewModel:(id)a3;
- (PUCommentsViewController)initWithCoder:(id)a3;
- (PUCommentsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIEdgeInsets)contentInsets;
- (UITableView)_tableView;
- (void)_setNeedsUpdateTableViewScrollPosition:(BOOL)a3;
- (void)_updateTableDataController;
- (void)commentsTableDataController:(id)a3 didChangeEditing:(BOOL)a4;
- (void)commentsTableDataController:(id)a3 presentViewController:(id)a4;
- (void)commentsTableDataController:(id)a3 tableViewDidScroll:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAccessoryContentViewControllerDelegate:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3 changeReason:(int64_t)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUCommentsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tableDataController, 0);
  objc_storeStrong((id *)&self->__tableView, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_destroyWeak((id *)&self->_accessoryContentViewControllerDelegate);
}

- (void)_setNeedsUpdateTableViewScrollPosition:(BOOL)a3
{
  self->__needsUpdateTableViewScrollPosition = a3;
}

- (BOOL)_needsUpdateTableViewScrollPosition
{
  return self->__needsUpdateTableViewScrollPosition;
}

- (PUCommentsTableDataController)_tableDataController
{
  return self->__tableDataController;
}

- (UITableView)_tableView
{
  return self->__tableView;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAccessoryContentViewControllerDelegate:(id)a3
{
}

- (PUAccessoryContentViewControllerDelegate)accessoryContentViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryContentViewControllerDelegate);
  return (PUAccessoryContentViewControllerDelegate *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PUExtendedTraitCollectionObservationContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PUCommentsViewController.m" lineNumber:209 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 2) != 0)
  {
    id v11 = v9;
    [(PUCommentsViewController *)self _updateTableDataController];
    id v9 = v11;
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "isInEditModeChanged", a3))
  {
    [(PUCommentsViewController *)self _updateTableDataController];
  }
}

- (CGSize)minimumContentSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  v3 = [(PUCommentsViewController *)self _tableDataController];
  [v3 minimumHeight];
  double v5 = v4;

  double v6 = v2;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGRect)contentBoundsInCoordinateSpace:(id)a3
{
  id v4 = a3;
  double v5 = [(PUCommentsViewController *)self _tableView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  [v5 contentOffset];
  double v11 = v7 - v10;
  double v13 = v9 - v12;
  [v5 contentSize];
  objc_msgSend(v5, "convertRect:toCoordinateSpace:", v4, v11, v13, v14, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  double v24 = round(*(double *)&PUMainScreenScale_screenScale * v21) / *(double *)&PUMainScreenScale_screenScale;
  double v25 = round(*(double *)&PUMainScreenScale_screenScale * v23) / *(double *)&PUMainScreenScale_screenScale;

  double v26 = v17;
  double v27 = v19;
  double v28 = v24;
  double v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (BOOL)contentAreaContainsPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(PUCommentsViewController *)self view];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v7, x, y);
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v23.origin.double x = v10;
  v23.origin.double y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  v22.double x = v18;
  v22.double y = v20;
  LOBYTE(v7) = CGRectContainsPoint(v23, v22);

  return (char)v7;
}

- (void)setContentInsets:(UIEdgeInsets)a3 changeReason:(int64_t)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    double v13 = [(PUCommentsViewController *)self _tableView];
    objc_msgSend(v13, "setContentInset:", top, left, bottom, right);
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      CGFloat v14 = (void *)MEMORY[0x1E4FB1EB0];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __58__PUCommentsViewController_setContentInsets_changeReason___block_invoke;
      v18[3] = &unk_1E5F2ED10;
      id v19 = v13;
      [v14 _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:v18 options:0 animations:0.0 completion:0.0];
      double v15 = [(PUCommentsViewController *)self accessoryContentViewControllerDelegate];
      [v15 accessoryContentViewControllerContentBoundsDidChange:self];
    }
    else
    {
      BOOL v16 = [(PUCommentsViewController *)self _needsUpdateTableViewScrollPosition];
      if (a4 == 1 || v16)
      {
        [(PUCommentsViewController *)self _setNeedsUpdateTableViewScrollPosition:0];
        objc_msgSend(v13, "setContentOffset:", 0.0, -top);
        double v17 = [(PUCommentsViewController *)self accessoryContentViewControllerDelegate];
        [v17 accessoryContentViewControllerContentBoundsDidChange:self];
      }
    }
  }
}

uint64_t __58__PUCommentsViewController_setContentInsets_changeReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_scrollToEdge:animated:", 3, 0);
}

- (void)commentsTableDataController:(id)a3 presentViewController:(id)a4
{
}

- (void)commentsTableDataController:(id)a3 tableViewDidScroll:(id)a4
{
  id v6 = a4;
  if (([v6 isDragging] & 1) != 0 || objc_msgSend(v6, "isDecelerating"))
  {
    double v5 = [(PUCommentsViewController *)self accessoryContentViewControllerDelegate];
    [v5 accessoryContentViewControllerContentBoundsDidChange:self];
  }
}

- (void)commentsTableDataController:(id)a3 didChangeEditing:(BOOL)a4
{
  double v5 = [(PUCommentsViewController *)self assetViewModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PUCommentsViewController_commentsTableDataController_didChangeEditing___block_invoke;
  v7[3] = &unk_1E5F2E120;
  BOOL v9 = a4;
  id v8 = v5;
  id v6 = v5;
  [v6 performChanges:v7];
}

uint64_t __73__PUCommentsViewController_commentsTableDataController_didChangeEditing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEditStyle:changeReason:");
}

- (void)_updateTableDataController
{
  v3 = [(PUCommentsViewController *)self px_extendedTraitCollection];
  BOOL v4 = [v3 layoutSizeClass] == 2;

  double v5 = [(PUCommentsViewController *)self assetViewModel];
  uint64_t v6 = [v5 isInEditMode];

  id v7 = [(PUCommentsViewController *)self _tableDataController];
  [v7 setShouldUseCompactCommentSeparators:v4];
  [v7 setEditing:v6];
}

- (CGSize)preferredContentSize
{
  if ([(PUCommentsViewController *)self isViewLoaded])
  {
    v3 = [(PUCommentsViewController *)self view];
    [(PUCommentsViewController *)self contentBoundsInCoordinateSpace:v3];
    double v5 = v4;
    uint64_t v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    *(double *)&uint64_t v7 = 100.0;
  }
  double v8 = v5;
  double v9 = *(double *)&v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUCommentsViewController;
  [(PUCommentsViewController *)&v4 viewDidDisappear:a3];
  [(PUCommentsViewController *)self _setNeedsUpdateTableViewScrollPosition:1];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)PUCommentsViewController;
  [(PUCommentsViewController *)&v14 viewDidLoad];
  objc_super v4 = [(PUCommentsViewController *)self view];
  id v5 = objc_alloc(MEMORY[0x1E4FB1D00]);
  [v4 bounds];
  uint64_t v6 = (UITableView *)objc_msgSend(v5, "initWithFrame:style:", 0);
  tableView = self->__tableView;
  self->__tableView = v6;

  [(UITableView *)self->__tableView setBackgroundView:0];
  [(UITableView *)self->__tableView setBackgroundColor:0];
  [(UITableView *)self->__tableView setClipsToBounds:1];
  [(UITableView *)self->__tableView setSeparatorStyle:0];
  [(UITableView *)self->__tableView _setAutomaticContentOffsetAdjustmentEnabled:0];
  [(UITableView *)self->__tableView setContentInsetAdjustmentBehavior:2];
  [(UITableView *)self->__tableView _setIndicatorInsetAdjustmentBehavior:1];
  [(UITableView *)self->__tableView setAutoresizingMask:18];
  [v4 addSubview:self->__tableView];
  double v8 = [(PUCommentsViewController *)self assetViewModel];
  double v9 = [v8 asset];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PUCommentsViewController.m" lineNumber:80 description:@"Comments can only be displayed for PHAsset"];
  }
  CGFloat v10 = [[PUCommentsTableDataController alloc] initWithTableView:self->__tableView];
  tableDataController = self->__tableDataController;
  self->__tableDataController = v10;

  [(PUCommentsTableDataController *)self->__tableDataController setAsset:v9];
  [(PUCommentsTableDataController *)self->__tableDataController setDelegate:self];
  [(PUCommentsViewController *)self _updateTableDataController];
  CGFloat v12 = [(PUCommentsViewController *)self parentViewController];
  [v12 preferredContentSizeDidChangeForChildContentContainer:self];

  [(PUCommentsViewController *)self _setNeedsUpdateTableViewScrollPosition:1];
}

- (PUCommentsViewController)initWithAssetViewModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUCommentsViewController;
  uint64_t v6 = [(PUCommentsViewController *)&v10 initWithNibName:0 bundle:0];
  uint64_t v7 = v6;
  if (v6)
  {
    [(PUCommentsViewController *)v6 px_enableExtendedTraitCollection];
    double v8 = [(PUCommentsViewController *)v7 px_extendedTraitCollection];
    [v8 registerChangeObserver:v7 context:PUExtendedTraitCollectionObservationContext];

    objc_storeStrong((id *)&v7->_assetViewModel, a3);
    [(PUAssetViewModel *)v7->_assetViewModel registerChangeObserver:v7];
  }

  return v7;
}

- (PUCommentsViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUCommentsViewController.m", 49, @"%s is not available as initializer", "-[PUCommentsViewController initWithCoder:]");

  abort();
}

- (PUCommentsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUCommentsViewController.m", 45, @"%s is not available as initializer", "-[PUCommentsViewController initWithNibName:bundle:]");

  abort();
}

+ (BOOL)canShowCommentsForAsset:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 isCloudSharedAsset];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

@end