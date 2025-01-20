@interface ICPaperStyleCollectionViewController
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)forPreferences;
- (BOOL)needsUpdateItemSpacing;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)itemSize;
- (ICPaperStyleCollectionViewController)init;
- (ICPaperStyleCollectionViewController)initWithLargeIcons:(BOOL)a3 forPreferences:(BOOL)a4;
- (ICPaperStyleHeaderView)headerViewMeasuringCell;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIEdgeInsets)sectionInsets;
- (UIEdgeInsets)titleInsets;
- (double)itemSpacing;
- (double)itemSpacingVertical;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)indexPathForInitialSelection;
- (id)indexPathFromPaperStyleType:(unint64_t)a3;
- (id)indexPathFromSetting:(id)a3;
- (id)settingFromIndexPath:(id)a3;
- (id)titleForHeaderView;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)paperStyleTypeFromIndexPath:(id)a3;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)setForPreferences:(BOOL)a3;
- (void)setHeaderViewMeasuringCell:(id)a3;
- (void)setItemSize:(CGSize)a3;
- (void)setItemSpacing:(double)a3;
- (void)setItemSpacingVertical:(double)a3;
- (void)setNeedsUpdateItemSpacing:(BOOL)a3;
- (void)setSectionInsets:(UIEdgeInsets)a3;
- (void)setTitleInsets:(UIEdgeInsets)a3;
- (void)updateItemSpacing;
- (void)updateSettings;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICPaperStyleCollectionViewController

- (ICPaperStyleCollectionViewController)init
{
  return 0;
}

- (ICPaperStyleCollectionViewController)initWithLargeIcons:(BOOL)a3 forPreferences:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    double v6 = 134.0;
    double v7 = 164.0;
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
      double v7 = 156.0;
    }
    else {
      double v7 = 132.0;
    }
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
      double v6 = 125.0;
    }
    else {
      double v6 = 108.0;
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  objc_msgSend(v8, "setItemSize:", v7, v6);
  [v8 setScrollDirection:0];
  v19.receiver = self;
  v19.super_class = (Class)ICPaperStyleCollectionViewController;
  v9 = [(ICPaperStyleCollectionViewController *)&v19 initWithCollectionViewLayout:v8];
  v10 = v9;
  if (v9)
  {
    [(ICPaperStyleCollectionViewController *)v9 setForPreferences:v4];
    -[ICPaperStyleCollectionViewController setItemSize:](v10, "setItemSize:", v7, v6);
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
      double v11 = 32.0;
    }
    else {
      double v11 = 16.0;
    }
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
      double v12 = 32.0;
    }
    else {
      double v12 = 16.0;
    }
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
      double v13 = 32.0;
    }
    else {
      double v13 = 16.0;
    }
    -[ICPaperStyleCollectionViewController setSectionInsets:](v10, "setSectionInsets:", v11, v12, 0.0, v13);
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
      double v14 = 0.0;
    }
    else {
      double v14 = 21.0;
    }
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
      double v15 = 32.0;
    }
    else {
      double v15 = 16.0;
    }
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
      double v16 = 32.0;
    }
    else {
      double v16 = 16.0;
    }
    -[ICPaperStyleCollectionViewController setTitleInsets:](v10, "setTitleInsets:", v14, v15, 16.0, v16);
    [(ICPaperStyleCollectionViewController *)v10 setHeaderViewMeasuringCell:0];
    [(ICPaperStyleCollectionViewController *)v10 setNeedsUpdateItemSpacing:1];
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v10 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v10;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)ICPaperStyleCollectionViewController;
  [(ICPaperStyleCollectionViewController *)&v10 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] ICGroupedBackgroundColor];
  BOOL v4 = [(ICPaperStyleCollectionViewController *)self collectionView];
  [v4 setBackgroundColor:v3];

  v5 = [(ICPaperStyleCollectionViewController *)self collectionView];
  [v5 setDelegate:self];

  double v6 = [(ICPaperStyleCollectionViewController *)self collectionView];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PaperStyleCell"];

  double v7 = [(ICPaperStyleCollectionViewController *)self collectionView];
  [v7 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"HeaderView"];

  id v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Lines & Grids" value:@"Lines & Grids" table:0 allowSiri:1];
  v9 = [(ICPaperStyleCollectionViewController *)self navigationItem];
  [v9 setTitle:v8];
}

- (id)indexPathForInitialSelection
{
  v3 = [MEMORY[0x1E4F837D0] objectForKey:@"PaperStyle"];
  BOOL v4 = [(ICPaperStyleCollectionViewController *)self indexPathFromSetting:v3];

  return v4;
}

- (void)viewWillLayoutSubviews
{
  if ([(ICPaperStyleCollectionViewController *)self needsUpdateItemSpacing])
  {
    [(ICPaperStyleCollectionViewController *)self setNeedsUpdateItemSpacing:0];
    [(ICPaperStyleCollectionViewController *)self updateItemSpacing];
    objc_opt_class();
    v3 = [(ICPaperStyleCollectionViewController *)self collectionViewLayout];
    ICCheckedDynamicCast();
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    [v4 invalidateLayout];
  }
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)ICPaperStyleCollectionViewController;
  [(ICPaperStyleCollectionViewController *)&v8 viewDidLayoutSubviews];
  v3 = [(ICPaperStyleCollectionViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    double v6 = [(ICPaperStyleCollectionViewController *)self indexPathForInitialSelection];
    if (v6)
    {
      double v7 = [(ICPaperStyleCollectionViewController *)self collectionView];
      [v7 selectItemAtIndexPath:v6 animated:0 scrollPosition:0];
    }
  }
}

- (void)updateItemSpacing
{
  objc_opt_class();
  v3 = [(ICPaperStyleCollectionViewController *)self collectionViewLayout];
  ICCheckedDynamicCast();
  id v69 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [(ICPaperStyleCollectionViewController *)self view];
  [v4 bounds];
  double v6 = v5;

  [(ICPaperStyleCollectionViewController *)self itemSize];
  double v8 = v7;
  int v9 = objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision");
  double v10 = 192.0;
  if (v9) {
    double v10 = 128.0;
  }
  if (v6 <= v10 + v8 * 3.0)
  {
    [(ICPaperStyleCollectionViewController *)self itemSize];
    double v22 = v21;
    int v23 = objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision");
    double v24 = 64.0;
    if (v23) {
      double v24 = 128.0;
    }
    double v25 = v24 + v22 * 3.0;
    [(ICPaperStyleCollectionViewController *)self itemSize];
    double v27 = -v26;
    if (v6 >= v25)
    {
      double v28 = (v6 + v27 * 3.0) * 0.25;
      unint64_t v19 = 3;
    }
    else
    {
      double v28 = (v6 + v27 * 2.0) / 3.0;
      unint64_t v19 = 4;
    }
    [(ICPaperStyleCollectionViewController *)self setItemSpacing:floor(v28)];
    [(ICPaperStyleCollectionViewController *)self itemSpacing];
    double v30 = v29;
    [(ICPaperStyleCollectionViewController *)self itemSpacing];
    double v32 = v31;
    [(ICPaperStyleCollectionViewController *)self itemSpacing];
    -[ICPaperStyleCollectionViewController setSectionInsets:](self, "setSectionInsets:", v30, v32, 0.0, v33);
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
      double v18 = 0.0;
    }
    else {
      double v18 = 21.0;
    }
    [(ICPaperStyleCollectionViewController *)self itemSpacing];
    double v17 = v34;
    [(ICPaperStyleCollectionViewController *)self itemSpacing];
    double v20 = v35;
  }
  else
  {
    int v11 = objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision");
    double v12 = 48.0;
    if (v11) {
      double v12 = 32.0;
    }
    [(ICPaperStyleCollectionViewController *)self setItemSpacing:v12];
    [(ICPaperStyleCollectionViewController *)self itemSize];
    double v14 = v13;
    int v15 = objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision");
    double v16 = 96.0;
    if (v15) {
      double v16 = 64.0;
    }
    double v17 = (v6 - (v16 + v14 * 3.0)) * 0.5;
    [(ICPaperStyleCollectionViewController *)self itemSpacing];
    double v18 = 0.0;
    -[ICPaperStyleCollectionViewController setSectionInsets:](self, "setSectionInsets:");
    if (!objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
      double v18 = 21.0;
    }
    unint64_t v19 = 3;
    double v20 = v17;
  }
  -[ICPaperStyleCollectionViewController setTitleInsets:](self, "setTitleInsets:", v18, v17, 16.0, v20);
  [(ICPaperStyleCollectionViewController *)self itemSpacing];
  -[ICPaperStyleCollectionViewController setItemSpacingVertical:](self, "setItemSpacingVertical:");
  v36 = [(ICPaperStyleCollectionViewController *)self view];
  [v36 bounds];
  double v38 = v37;

  [(UIViewController *)self ic_safeAreaDistanceFromTop];
  double v40 = v39;
  v41 = [(ICPaperStyleCollectionViewController *)self collectionView];
  [(ICPaperStyleCollectionViewController *)self collectionView:v41 layout:v69 referenceSizeForHeaderInSection:0];
  double v43 = v38 - (v40 + v42);

  [(ICPaperStyleCollectionViewController *)self itemSpacingVertical];
  double v45 = v44;
  int v46 = objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision");
  double v47 = 60.0;
  if (!v46) {
    double v47 = 28.0;
  }
  if (v45 >= v47) {
    double v48 = v45;
  }
  else {
    double v48 = v47;
  }
  [(ICPaperStyleCollectionViewController *)self itemSpacingVertical];
  double v50 = v49;
  double v51 = (double)(v19 - 1);
  [(ICPaperStyleCollectionViewController *)self itemSize];
  if (v48 + v52 * (double)v19 + v50 * v51 > v43)
  {
    [(ICPaperStyleCollectionViewController *)self itemSize];
    double v54 = floor((v43 - (v48 + v53 * (double)v19)) / v51);
    int v55 = objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision");
    double v56 = 32.0;
    if (!v55) {
      double v56 = 16.0;
    }
    if (v54 >= v56) {
      double v56 = v54;
    }
    [(ICPaperStyleCollectionViewController *)self setItemSpacingVertical:v56];
    [(ICPaperStyleCollectionViewController *)self itemSpacingVertical];
    double v58 = v57;
    int v59 = objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision");
    double v60 = 60.0;
    if (!v59) {
      double v60 = 28.0;
    }
    if (v58 >= v60) {
      double v48 = v58;
    }
    else {
      double v48 = v60;
    }
    [(ICPaperStyleCollectionViewController *)self sectionInsets];
    [(ICPaperStyleCollectionViewController *)self itemSpacingVertical];
    -[ICPaperStyleCollectionViewController setSectionInsets:](self, "setSectionInsets:");
  }
  [(ICPaperStyleCollectionViewController *)self itemSpacing];
  if (v48 >= v61) {
    double v62 = v61;
  }
  else {
    double v62 = v48;
  }
  v63 = [(ICPaperStyleCollectionViewController *)self collectionView];
  objc_msgSend(v63, "setContentInset:", 0.0, 0.0, v62, 0.0);

  objc_opt_class();
  v64 = [(ICPaperStyleCollectionViewController *)self collectionView];
  uint64_t v65 = *MEMORY[0x1E4FB2770];
  v66 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  v67 = [v64 supplementaryViewForElementKind:v65 atIndexPath:v66];
  v68 = ICDynamicCast();

  [(ICPaperStyleCollectionViewController *)self titleInsets];
  objc_msgSend(v68, "setTitleInsets:");
}

- (void)updateSettings
{
  v3 = [(ICPaperStyleCollectionViewController *)self collectionView];
  id v4 = [v3 indexPathsForSelectedItems];
  id v8 = [v4 firstObject];

  double v5 = v8;
  if (v8)
  {
    double v6 = (void *)MEMORY[0x1E4F837D0];
    double v7 = [(ICPaperStyleCollectionViewController *)self settingFromIndexPath:v8];
    [v6 setObject:v7 forKey:@"PaperStyle"];

    double v5 = v8;
  }
}

- (id)settingFromIndexPath:(id)a3
{
  v3 = NSNumber;
  unint64_t v4 = [(ICPaperStyleCollectionViewController *)self paperStyleTypeFromIndexPath:a3];
  return (id)[v3 numberWithUnsignedInteger:v4];
}

- (unint64_t)paperStyleTypeFromIndexPath:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (!v3 || ![v3 section])
  {
LABEL_8:
    unint64_t v6 = 1;
    goto LABEL_9;
  }
  unint64_t v5 = [v4 item];
  if (v5 >= 6)
  {
    double v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ICPaperStyleCollectionViewController paperStyleTypeFromIndexPath:](v4, v7);
    }

    goto LABEL_8;
  }
  unint64_t v6 = qword_1B0B98F10[v5];
LABEL_9:

  return v6;
}

- (id)indexPathFromSetting:(id)a3
{
  uint64_t v4 = [a3 unsignedIntegerValue];
  return [(ICPaperStyleCollectionViewController *)self indexPathFromPaperStyleType:v4];
}

- (id)indexPathFromPaperStyleType:(unint64_t)a3
{
  if (a3 > 1)
  {
    if (a3 - 2 >= 6)
    {
      double v7 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ICPaperStyleCollectionViewController indexPathFromPaperStyleType:](a3, v7);
      }

      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = qword_1B0B98F40[a3 - 2];
    }
    id v3 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v5 = 1;
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F28D58];
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  id v8 = [v3 indexPathForItem:v4 inSection:v5];
  return v8;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)ICPaperStyleCollectionViewController;
  id v7 = a4;
  -[ICPaperStyleCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  [(ICPaperStyleCollectionViewController *)self setNeedsUpdateItemSpacing:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__ICPaperStyleCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E5FDDD68;
  v8[4] = self;
  [v7 animateAlongsideTransition:&__block_literal_global_80 completion:v8];
}

uint64_t __91__ICPaperStyleCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateItemSpacing];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  objc_opt_class();
  uint64_t v4 = [(ICPaperStyleCollectionViewController *)self collectionView];
  uint64_t v5 = *MEMORY[0x1E4FB2770];
  unint64_t v6 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  id v7 = [v4 supplementaryViewForElementKind:v5 atIndexPath:v6];
  ICDynamicCast();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [v11 contentSizeCategoryDidChange];
  [(ICPaperStyleCollectionViewController *)self setNeedsUpdateItemSpacing:1];
  objc_opt_class();
  id v8 = [(ICPaperStyleCollectionViewController *)self collectionViewLayout];
  objc_super v9 = ICCheckedDynamicCast();

  [v9 invalidateLayout];
  double v10 = [(ICPaperStyleCollectionViewController *)self view];
  [v10 setNeedsLayout];
}

- (id)titleForHeaderView
{
  if ([(ICPaperStyleCollectionViewController *)self forPreferences]) {
    v2 = @"Choose your preferred line or grid style for handwriting in new notes.";
  }
  else {
    v2 = @"Change the line or grid style for handwriting in this note.";
  }
  id v3 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:v2 value:v2 table:0 allowSiri:1];
  return v3;
}

- (ICPaperStyleHeaderView)headerViewMeasuringCell
{
  headerViewMeasuringCell = self->_headerViewMeasuringCell;
  if (!headerViewMeasuringCell)
  {
    uint64_t v4 = [ICPaperStyleHeaderView alloc];
    uint64_t v5 = -[ICPaperStyleHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    unint64_t v6 = self->_headerViewMeasuringCell;
    self->_headerViewMeasuringCell = v5;

    id v7 = [(ICPaperStyleCollectionViewController *)self titleForHeaderView];
    [(ICPaperStyleHeaderView *)self->_headerViewMeasuringCell setTitle:v7];

    [(ICPaperStyleCollectionViewController *)self titleInsets];
    -[ICPaperStyleHeaderView setTitleInsets:](self->_headerViewMeasuringCell, "setTitleInsets:");
    headerViewMeasuringCell = self->_headerViewMeasuringCell;
  }
  return headerViewMeasuringCell;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4) {
    return 6;
  }
  else {
    return 1;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v24[6] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"PaperStyleCell" forIndexPath:v5];

  id v8 = ICCheckedDynamicCast();

  if (![v5 section])
  {
    objc_super v9 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Blank paper" value:@"Blank paper" table:0 allowSiri:1];
    [v8 setAccessibilityLabel:v9];
  }
  if ([v5 section] == 1)
  {
    double v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Horizontal lines with small line spacing" value:@"Horizontal lines with small line spacing" table:0 allowSiri:1];
    v24[0] = v10;
    id v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Horizontal lines with medium line spacing" value:@"Horizontal lines with medium line spacing" table:0 allowSiri:1];
    v24[1] = v11;
    double v12 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Horizontal lines with large line spacing" value:@"Horizontal lines with large line spacing" table:0 allowSiri:1];
    v24[2] = v12;
    double v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Grid lines with small tiles" value:@"Grid lines with small tiles" table:0 allowSiri:1];
    v24[3] = v13;
    double v14 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Grid lines with medium tiles" value:@"Grid lines with medium tiles" table:0 allowSiri:1];
    v24[4] = v14;
    int v15 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Grid lines with large tiles" value:@"Grid lines with large tiles" table:0 allowSiri:1];
    v24[5] = v15;
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:6];

    unint64_t v17 = [v5 item];
    if (v17 < [&unk_1F09A3FF8 count])
    {
      double v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      unint64_t v19 = objc_msgSend(&unk_1F09A3FF8, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
      double v20 = [MEMORY[0x1E4FB1818] imageNamed:v19 inBundle:v18 compatibleWithTraitCollection:0];
      double v21 = [v8 imageView];
      [v21 setImage:v20];

      double v22 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));
      [v8 setAccessibilityLabel:v22];
    }
  }

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:*MEMORY[0x1E4FB2770]] && !objc_msgSend(v10, "section"))
  {
    id v11 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"HeaderView" forIndexPath:v10];
    double v12 = [(ICPaperStyleCollectionViewController *)self titleForHeaderView];
    [v11 setTitle:v12];

    [(ICPaperStyleCollectionViewController *)self titleInsets];
    objc_msgSend(v11, "setTitleInsets:");
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 1;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [(ICPaperStyleCollectionViewController *)self sectionInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  if (!a5)
  {
    [(ICPaperStyleCollectionViewController *)self collectionView:v8 layout:v9 referenceSizeForHeaderInSection:0];
    double v11 = v11 - v18;
    if (v11 < 0.0) {
      double v11 = 0.0;
    }
  }

  double v19 = v11;
  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  double v5 = *MEMORY[0x1E4F1DB30];
  if (a5)
  {
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    [a3 bounds];
    double v9 = v8;
    [(ICPaperStyleCollectionViewController *)self sectionInsets];
    double v11 = v10;
    [(ICPaperStyleCollectionViewController *)self sectionInsets];
    double v13 = v9 - (v11 + v12);
    double v14 = [(ICPaperStyleCollectionViewController *)self headerViewMeasuringCell];
    LODWORD(v15) = 1148846080;
    LODWORD(v16) = 1112014848;
    objc_msgSend(v14, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v13, *(double *)(MEMORY[0x1E4FB2C68] + 8), v15, v16);
    double v18 = v17;

    int v19 = objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision");
    double v20 = 21.0;
    if (v19) {
      double v20 = 0.0;
    }
    double v6 = v18 + v20 + 16.0;
  }
  double v21 = v5;
  result.double height = v6;
  result.double width = v21;
  return result;
}

- (BOOL)forPreferences
{
  return self->_forPreferences;
}

- (void)setForPreferences:(BOOL)a3
{
  self->_forPreferences = a3;
}

- (BOOL)needsUpdateItemSpacing
{
  return self->_needsUpdateItemSpacing;
}

- (void)setNeedsUpdateItemSpacing:(BOOL)a3
{
  self->_needsUpdateItemSpacing = a3;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  self->_itemSpacing = a3;
}

- (double)itemSpacingVertical
{
  return self->_itemSpacingVertical;
}

- (void)setItemSpacingVertical:(double)a3
{
  self->_itemSpacingVertical = a3;
}

- (CGSize)itemSize
{
  double width = self->_itemSize.width;
  double height = self->_itemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setItemSize:(CGSize)a3
{
  self->_itemSize = a3;
}

- (UIEdgeInsets)sectionInsets
{
  double top = self->_sectionInsets.top;
  double left = self->_sectionInsets.left;
  double bottom = self->_sectionInsets.bottom;
  double right = self->_sectionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSectionInsets:(UIEdgeInsets)a3
{
  self->_sectionInsets = a3;
}

- (UIEdgeInsets)titleInsets
{
  double top = self->_titleInsets.top;
  double left = self->_titleInsets.left;
  double bottom = self->_titleInsets.bottom;
  double right = self->_titleInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTitleInsets:(UIEdgeInsets)a3
{
  self->_titleInsets = a3;
}

- (void)setHeaderViewMeasuringCell:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)paperStyleTypeFromIndexPath:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 item];
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Unknown index for paper style %ld", (uint8_t *)&v3, 0xCu);
}

- (void)indexPathFromPaperStyleType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Unknown paper style %ld", (uint8_t *)&v2, 0xCu);
}

@end