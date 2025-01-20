@interface ICPaperStyleSheetCollectionViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)accessibilityPerformEscape;
- (CGSize)preferredContentSize;
- (ICPaperStyleSheetCollectionViewController)initWithInitialPaperStyleType:(unint64_t)a3 delegate:(id)a4;
- (ICPaperStyleSheetCollectionViewControllerDelegate)paperStyleDelegate;
- (id)indexPathForInitialSelection;
- (unint64_t)initialPaperStyleType;
- (void)cancelAction:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setInitialPaperStyleType:(unint64_t)a3;
- (void)setPaperStyleDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICPaperStyleSheetCollectionViewController

- (ICPaperStyleSheetCollectionViewController)initWithInitialPaperStyleType:(unint64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICPaperStyleSheetCollectionViewController;
  v7 = [(ICPaperStyleCollectionViewController *)&v10 initWithLargeIcons:0 forPreferences:0];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_paperStyleDelegate, v6);
    v8->_initialPaperStyleType = a3;
  }

  return v8;
}

- (void)viewDidLoad
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)ICPaperStyleSheetCollectionViewController;
  [(ICPaperStyleCollectionViewController *)&v6 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelAction_];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [(ICPaperStyleSheetCollectionViewController *)self navigationItem];
  [v5 setLeftBarButtonItems:v4];
}

- (id)indexPathForInitialSelection
{
  unint64_t v3 = [(ICPaperStyleSheetCollectionViewController *)self initialPaperStyleType];
  return [(ICPaperStyleCollectionViewController *)self indexPathFromPaperStyleType:v3];
}

- (CGSize)preferredContentSize
{
  unint64_t v3 = [(ICPaperStyleSheetCollectionViewController *)self collectionView];
  v4 = [(ICPaperStyleSheetCollectionViewController *)self collectionViewLayout];
  [(ICPaperStyleCollectionViewController *)self collectionView:v3 layout:v4 referenceSizeForHeaderInSection:0];
  double v6 = v5;

  [(ICPaperStyleCollectionViewController *)self itemSize];
  double v8 = v7 * 3.0 + 128.0;
  [(ICPaperStyleCollectionViewController *)self itemSize];
  double v10 = v6 + v9 * 3.0 + 96.0;
  double v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)cancelAction:(id)a3
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    double v6 = [(ICPaperStyleSheetCollectionViewController *)self paperStyleDelegate];
    unint64_t v7 = [(ICPaperStyleCollectionViewController *)self paperStyleTypeFromIndexPath:v5];

    [v6 paperStyleSheetCollectionViewController:self didFinishWithPaperStyleType:v7];
  }
  [(ICPaperStyleSheetCollectionViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICPaperStyleSheetCollectionViewControllerDelegate)paperStyleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paperStyleDelegate);
  return (ICPaperStyleSheetCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setPaperStyleDelegate:(id)a3
{
}

- (unint64_t)initialPaperStyleType
{
  return self->_initialPaperStyleType;
}

- (void)setInitialPaperStyleType:(unint64_t)a3
{
  self->_initialPaperStyleType = a3;
}

- (void).cxx_destruct
{
}

@end