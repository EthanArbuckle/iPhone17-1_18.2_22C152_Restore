@interface ICNoteBrowseCollectionView
- (BOOL)hasTagSection;
- (BOOL)shouldShowAccountName;
- (BOOL)shouldShowCellParticipantsInfo;
- (BOOL)shouldShowFolderAndOrAccountName;
- (BOOL)shouldShowFolderName;
- (BOOL)shouldShowRecentlyDeletedHeader;
- (BOOL)shouldShowSummaryFooter;
- (ICNoteBrowseCollectionView)initWithPresentingViewController:(id)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5 viewControllerManager:(id)a6;
- (NSArray)numberOfColumnsAdjustmentWidths;
- (id)createLayout;
- (id)footerLayoutItemWithEstimatedHeight:(double)a3;
- (id)headerLayoutItemWithAbsoluteHeight:(double)a3;
- (id)headerLayoutItemWithEstimatedHeight:(double)a3;
- (id)headerLayoutItemWithHeight:(double)a3 estimated:(BOOL)a4;
- (id)notesGallerySectionForSectionIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (id)notesListSectionForSectionIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (id)notesSectionForSectionIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (int64_t)noteContainerViewMode;
- (int64_t)noteListSectionHeaderModeForSectionIndex:(unint64_t)a3;
- (unint64_t)adjustedNumberOfGalleryColumnsForWidth:(double)a3;
- (unint64_t)wideModeNumberOfColumns;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadLayoutAnimated:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setNoteContainerViewMode:(int64_t)a3;
- (void)setShouldShowAccountName:(BOOL)a3;
- (void)setShouldShowCellParticipantsInfo:(BOOL)a3;
- (void)setShouldShowFolderName:(BOOL)a3;
- (void)setShouldShowRecentlyDeletedHeader:(BOOL)a3;
- (void)setShouldShowSummaryFooter:(BOOL)a3;
- (void)setWideModeNumberOfColumns:(unint64_t)a3;
- (void)setWideModeNumberOfColumns:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation ICNoteBrowseCollectionView

- (ICNoteBrowseCollectionView)initWithPresentingViewController:(id)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5 viewControllerManager:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)ICNoteBrowseCollectionView;
  v6 = [(ICCollectionView *)&v12 initWithPresentingViewController:a3 legacyManagedObjectContext:a4 modernManagedObjectContext:a5 viewControllerManager:a6];
  v7 = v6;
  if (v6)
  {
    numberOfColumnsAdjustmentWidths = v6->_numberOfColumnsAdjustmentWidths;
    v6->_numberOfColumnsAdjustmentWidths = (NSArray *)&off_10064B5A8;

    if (qword_1006AA180 != -1) {
      dispatch_once(&qword_1006AA180, &stru_100627A58);
    }
    [(ICNoteBrowseCollectionView *)v7 setPreservesSuperviewLayoutMargins:1];
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v7 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

    v10 = +[NSUserDefaults standardUserDefaults];
    [v10 ic_addObserver:v7 forKeyPath:@"ICNoteBrowseCollectionViewGalleryWideModeNumberOfColumnsKey" context:&off_100699820];
  }
  return v7;
}

- (id)createLayout
{
  objc_initWeak(&location, self);
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100096C08;
  v14 = &unk_100627A80;
  objc_copyWeak(&v15, &location);
  v3 = objc_retainBlock(&v11);
  id v4 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
  v5 = +[NSMutableArray array];
  if ([(ICNoteBrowseCollectionView *)self shouldShowRecentlyDeletedHeader])
  {
    +[ICRecentlyDeletedHeaderView heightForSuperview:self];
    v6 = [(ICNoteBrowseCollectionView *)self headerLayoutItemWithEstimatedHeight:"headerLayoutItemWithEstimatedHeight:"];
    [v5 addObject:v6];
  }
  if ([(ICNoteBrowseCollectionView *)self shouldShowSummaryFooter])
  {
    v7 = [(ICNoteBrowseCollectionView *)self footerLayoutItemWithEstimatedHeight:100.0];
    [v5 addObject:v7];
  }
  if ([v5 count])
  {
    id v8 = [v5 copy];
    [v4 setBoundarySupplementaryItems:v8];
  }
  id v9 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSectionProvider:v3 configuration:v4];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9;
}

- (void)setShouldShowSummaryFooter:(BOOL)a3
{
  if (self->_shouldShowSummaryFooter != a3)
  {
    self->_shouldShowSummaryFooter = a3;
    id v4 = [(ICNoteBrowseCollectionView *)self createLayout];
    [(ICNoteBrowseCollectionView *)self setCollectionViewLayout:v4];
  }
}

- (BOOL)shouldShowSummaryFooter
{
  return self->_shouldShowSummaryFooter;
}

- (BOOL)shouldShowRecentlyDeletedHeader
{
  return self->_shouldShowRecentlyDeletedHeader;
}

- (void)setShouldShowRecentlyDeletedHeader:(BOOL)a3
{
  if (self->_shouldShowRecentlyDeletedHeader != a3)
  {
    self->_shouldShowRecentlyDeletedHeader = a3;
    id v4 = [(ICNoteBrowseCollectionView *)self createLayout];
    [(ICNoteBrowseCollectionView *)self setCollectionViewLayout:v4];
  }
}

- (void)setShouldShowFolderName:(BOOL)a3
{
  self->_shouldShowFolderName = a3;
}

- (void)setShouldShowCellParticipantsInfo:(BOOL)a3
{
  self->_shouldShowCellParticipantsInfo = a3;
}

- (void)setShouldShowAccountName:(BOOL)a3
{
  self->_shouldShowAccountName = a3;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(ICNoteBrowseCollectionView *)self frame];
  double v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteBrowseCollectionView;
  -[ICNoteBrowseCollectionView setFrame:](&v11, "setFrame:", x, y, width, height);
  if (v9 != width)
  {
    if ([(ICNoteBrowseCollectionView *)self shouldShowRecentlyDeletedHeader])
    {
      v10 = [(ICNoteBrowseCollectionView *)self createLayout];
      [(ICNoteBrowseCollectionView *)self setCollectionViewLayout:v10];
    }
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 ic_removeObserver:self forKeyPath:@"ICNoteBrowseCollectionViewGalleryWideModeNumberOfColumnsKey" context:&off_100699820];

  v5.receiver = self;
  v5.super_class = (Class)ICNoteBrowseCollectionView;
  [(ICNoteBrowseCollectionView *)&v5 dealloc];
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  if ([(ICNoteBrowseCollectionView *)self shouldShowRecentlyDeletedHeader]
    || [(ICNoteBrowseCollectionView *)self hasTagSection])
  {
    id v4 = [(ICNoteBrowseCollectionView *)self createLayout];
    [(ICNoteBrowseCollectionView *)self setCollectionViewLayout:v4];
  }
}

- (id)notesSectionForSectionIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(ICNoteBrowseCollectionView *)self noteContainerViewMode];
  if (v7 == -1)
  {
    double v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_1004D3E98(v9);
    }
  }
  else
  {
    if (v7 == 1)
    {
      uint64_t v10 = [(ICNoteBrowseCollectionView *)self notesGallerySectionForSectionIndex:a3 layoutEnvironment:v6];
      goto LABEL_10;
    }
    if (v7)
    {
      double v8 = 0;
      goto LABEL_11;
    }
  }
  uint64_t v10 = [(ICNoteBrowseCollectionView *)self notesListSectionForSectionIndex:a3 layoutEnvironment:v6];
LABEL_10:
  double v8 = (void *)v10;
LABEL_11:

  return v8;
}

- (unint64_t)adjustedNumberOfGalleryColumnsForWidth:(double)a3
{
  objc_super v5 = [(ICCollectionView *)self viewControllerManager];
  if ([v5 hasCompactWidth])
  {

    int v6 = ICAccessibilityAccessibilityLargerTextSizesEnabled();
    goto LABEL_3;
  }
  if (+[UIDevice ic_isVision])
  {
    double v9 = [(ICCollectionView *)self viewControllerManager];
    unsigned int v10 = [v9 isMainSplitViewDisplayModeSecondaryOnly];

    int v6 = ICAccessibilityAccessibilityLargerTextSizesEnabled();
    if (v10)
    {
LABEL_3:
      if (v6) {
        unint64_t v7 = 2;
      }
      else {
        unint64_t v7 = 3;
      }
      goto LABEL_6;
    }
  }
  else
  {

    ICAccessibilityAccessibilityLargerTextSizesEnabled();
  }
  unint64_t v7 = [(ICNoteBrowseCollectionView *)self wideModeNumberOfColumns];
  objc_super v11 = [(ICNoteBrowseCollectionView *)self numberOfColumnsAdjustmentWidths];
  id v12 = [v11 count];

  if (+[UIDevice ic_isVision] && v12)
  {
    uint64_t v13 = 0;
    while (1)
    {
      v14 = [(ICNoteBrowseCollectionView *)self numberOfColumnsAdjustmentWidths];
      id v15 = [v14 objectAtIndexedSubscript:v13];
      [v15 floatValue];
      double v17 = v16;

      if (v17 > a3) {
        break;
      }
      if (++v13 == (void)v12) {
        goto LABEL_6;
      }
    }
    unint64_t v7 = v7 - (void)v12 + v13 - 1;
  }
LABEL_6:
  if (v7 <= 3) {
    return 3;
  }
  else {
    return v7;
  }
}

- (id)notesGallerySectionForSectionIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(ICCollectionView *)self diffableDataSource];
  double v8 = [v7 snapshot];

  v71 = [v8 sectionIdentifiers];
  int64_t v67 = a3;
  uint64_t v9 = [v71 objectAtIndexedSubscript:a3];
  unsigned int v10 = [(ICCollectionView *)self diffableDataSource];
  objc_super v11 = [v10 snapshotForSection:v9];

  v68 = [v11 items];
  uint64_t v12 = [v68 lastObject];
  uint64_t v13 = [v8 sectionIdentifiers];
  v65 = (char *)[v13 count];

  v70 = (void *)v9;
  id v57 = [v8 numberOfItemsInSection:v9];
  v69 = v11;
  if (v12)
  {
    v14 = [v11 parentOfChildItem:v12];
    BOOL v15 = v14 != 0;
  }
  else
  {
    BOOL v15 = 0;
  }
  v66 = (void *)v12;
  float v16 = [v6 container];
  [v16 effectiveContentSize];
  double v18 = v17;

  unint64_t v19 = [(ICNoteBrowseCollectionView *)self adjustedNumberOfGalleryColumnsForWidth:v18];
  double v20 = 0.0;
  if (v18 >= 1.0) {
    double v20 = 1.0 / (double)v19 + -16.0 / v18;
  }
  if (v20 == 0.0) {
    double v21 = 1.0;
  }
  else {
    double v21 = v20;
  }
  uint64_t v22 = +[NSCollectionLayoutDimension fractionalWidthDimension:v21];
  +[ICNoteResultsGalleryCollectionViewCell heightForItemWidth:[(ICNoteBrowseCollectionView *)self shouldShowCellParticipantsInfo] showsParticipantsInfo:[(ICNoteBrowseCollectionView *)self shouldShowFolderAndOrAccountName] showsFolderAndOrAccountName:v18 * v21];
  double v24 = v23;
  v63 = +[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:");
  v64 = (void *)v22;
  v62 = +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v22);
  uint64_t v25 = +[NSCollectionLayoutItem itemWithLayoutSize:"itemWithLayoutSize:"];
  uint64_t v26 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v59 = +[NSCollectionLayoutDimension absoluteDimension:v24];
  v60 = (void *)v26;
  uint64_t v27 = +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v26);
  v61 = (void *)v25;
  uint64_t v72 = v25;
  v28 = +[NSArray arrayWithObjects:&v72 count:1];
  v58 = (void *)v27;
  v29 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v27 subitems:v28];

  v30 = +[NSCollectionLayoutSpacing flexibleSpacing:16.0];
  [v29 setInterItemSpacing:v30];

  if (v15)
  {
    v55 = v8;
    id v56 = v6;
    uint64_t v31 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    v53 = +[NSCollectionLayoutDimension estimatedDimension:44.0];
    v54 = (void *)v31;
    v52 = +[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v31);
    v32 = +[NSCollectionLayoutItem itemWithLayoutSize:"itemWithLayoutSize:"];
    v33 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    v34 = +[NSCollectionLayoutDimension estimatedDimension:v24 + 60.0];
    v35 = +[NSCollectionLayoutSize sizeWithWidthDimension:v33 heightDimension:v34];
    v36 = +[NSMutableArray arrayWithObject:v32];
    if ((unint64_t)v57 <= 1) {
      uint64_t v37 = 1;
    }
    else {
      uint64_t v37 = (uint64_t)v57;
    }
    do
    {
      [v36 addObject:v29];
      --v37;
    }
    while (v37);
    id v38 = [v36 copy];
    v39 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v35 subitems:v38];

    v40 = +[NSCollectionLayoutSection sectionWithGroup:v39];

    double v8 = v55;
    id v6 = v56;
  }
  else
  {
    v40 = +[NSCollectionLayoutSection sectionWithGroup:v29];
  }
  [v40 setInterGroupSpacing:16.0];
  [(ICNoteBrowseCollectionView *)self directionalLayoutMargins];
  double v42 = v41;
  [(ICNoteBrowseCollectionView *)self ic_directionalSafeAreaInsets];
  double v44 = v42 - v43;
  [(ICNoteBrowseCollectionView *)self directionalLayoutMargins];
  double v46 = v45;
  [(ICNoteBrowseCollectionView *)self ic_directionalSafeAreaInsets];
  double v48 = v47;
  double v49 = v44 + -2.0;
  if (v65 - 1 != (char *)v67) {
    [v40 contentInsets];
  }
  double v50 = 0.0;
  if (v65 == (char *)1) {
    double v50 = v44 + -2.0;
  }
  [v40 setContentInsets:v50, v44, v49, v46 - v48];

  return v40;
}

- (BOOL)shouldShowFolderAndOrAccountName
{
  if ([(ICNoteBrowseCollectionView *)self shouldShowFolderName]) {
    return 1;
  }

  return [(ICNoteBrowseCollectionView *)self shouldShowAccountName];
}

- (id)notesListSectionForSectionIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6 = a4;
  id v7 = [(ICNoteBrowseCollectionView *)self ic_behavior];
  unsigned int v8 = +[UIDevice ic_isVision];
  unsigned int v9 = v8;
  if (v7 == (id)1) {
    int v10 = 1;
  }
  else {
    int v10 = v8;
  }
  if (v10) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = 2;
  }
  id v12 = [objc_alloc((Class)UICollectionLayoutListConfiguration) initWithAppearance:v11];
  if (v7 == (id)1)
  {
    uint64_t v13 = +[UIColor secondarySystemBackgroundColor];
    [v12 setBackgroundColor:v13];
    [(ICNoteBrowseCollectionView *)self setBackgroundColor:v13];

    [v12 setHeaderMode:[self noteListSectionHeaderModeForSectionIndex:a3]];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100097758;
    v18[3] = &unk_100627AA0;
    v18[4] = v11;
    [v12 setItemSeparatorHandler:v18];
  }
  else
  {
    [v12 setHeaderMode:[self noteListSectionHeaderModeForSectionIndex:a3]];
  }
  v14 = [(ICCollectionView *)self leadingSwipeActionsConfigurationProvider];
  [v12 setLeadingSwipeActionsConfigurationProvider:v14];

  BOOL v15 = [(ICCollectionView *)self trailingSwipeActionsConfigurationProvider];
  [v12 setTrailingSwipeActionsConfigurationProvider:v15];

  float v16 = +[NSCollectionLayoutSection sectionWithListConfiguration:v12 layoutEnvironment:v6];

  if (v9)
  {
    [v16 contentInsets];
    [v16 setContentInsets:0.0, 12.0, 0.0, 12.0];
  }

  return v16;
}

- (int64_t)noteListSectionHeaderModeForSectionIndex:(unint64_t)a3
{
  objc_super v5 = [(ICCollectionView *)self diffableDataSource];
  id v6 = [v5 snapshot];
  id v7 = [v6 sectionIdentifiers];

  if ((unint64_t)[v7 count] <= a3)
  {
    int64_t v10 = 0;
  }
  else
  {
    unsigned int v8 = [v7 objectAtIndexedSubscript:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v9 = (unint64_t)[v8 sectionType];
      int64_t v10 = 0;
      if (v9 <= 7)
      {
        if (((1 << v9) & 0xEE) != 0)
        {
          int64_t v10 = 2;
        }
        else if (v9 == 4)
        {
          if ([(ICNoteBrowseCollectionView *)self hasTagSection]) {
            unint64_t v12 = 2;
          }
          else {
            unint64_t v12 = 1;
          }
          int64_t v10 = 2 * ((unint64_t)[v7 count] > v12);
        }
      }
    }
    else
    {
      int64_t v10 = 0;
    }
  }
  return v10;
}

- (id)headerLayoutItemWithAbsoluteHeight:(double)a3
{
  return [(ICNoteBrowseCollectionView *)self headerLayoutItemWithHeight:0 estimated:a3];
}

- (id)headerLayoutItemWithEstimatedHeight:(double)a3
{
  return [(ICNoteBrowseCollectionView *)self headerLayoutItemWithHeight:1 estimated:a3];
}

- (id)footerLayoutItemWithEstimatedHeight:(double)a3
{
  id v4 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  objc_super v5 = +[NSCollectionLayoutDimension estimatedDimension:a3];
  id v6 = +[NSCollectionLayoutSize sizeWithWidthDimension:v4 heightDimension:v5];
  id v7 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v6 elementKind:UICollectionElementKindSectionFooter alignment:5];

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(ICNoteBrowseCollectionView *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/UI/Note/Browse/Views/ICNoteBrowseCollectionView.m"])
  {
    unsigned __int8 v13 = [(ICNoteBrowseCollectionView *)self ic_shouldIgnoreObserveValue:v10 ofObject:v11 forKeyPath:v12];

    if (a6 == &off_100699820 && (v13 & 1) == 0)
    {
      [(ICNoteBrowseCollectionView *)self reloadLayoutAnimated:1];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICNoteBrowseCollectionView;
    [(ICNoteBrowseCollectionView *)&v14 observeValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
  }
}

- (BOOL)hasTagSection
{
  v2 = [(ICCollectionView *)self diffableDataSource];
  v3 = [v2 snapshot];
  id v4 = [v3 sectionIdentifiers];
  unsigned __int8 v5 = [v4 ic_containsObjectPassingTest:&stru_100627AC0];

  return v5;
}

- (id)headerLayoutItemWithHeight:(double)a3 estimated:(BOOL)a4
{
  id v6 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  if (a4) {
    +[NSCollectionLayoutDimension estimatedDimension:a3];
  }
  else {
  id v7 = +[NSCollectionLayoutDimension absoluteDimension:a3];
  }
  unsigned int v8 = +[NSCollectionLayoutSize sizeWithWidthDimension:v6 heightDimension:v7];
  unint64_t v9 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v8 elementKind:UICollectionElementKindSectionHeader alignment:1];

  return v9;
}

- (unint64_t)wideModeNumberOfColumns
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:@"ICNoteBrowseCollectionViewGalleryWideModeNumberOfColumnsKey"];

  return (unint64_t)v3;
}

- (void)setWideModeNumberOfColumns:(unint64_t)a3
{
}

- (void)setWideModeNumberOfColumns:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = +[NSUserDefaults standardUserDefaults];
  [v7 setInteger:a3 forKey:@"ICNoteBrowseCollectionViewGalleryWideModeNumberOfColumnsKey"];

  [(ICNoteBrowseCollectionView *)self reloadLayoutAnimated:v4];
}

- (void)reloadLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(ICNoteBrowseCollectionView *)self createLayout];
  if (v3)
  {
    unsigned __int8 v5 = +[ICNoteBrowseCollectionViewAnimator animator];
    [(ICNoteBrowseCollectionView *)self setCollectionViewLayout:v6 withAnimator:v5];
  }
  else
  {
    [(ICNoteBrowseCollectionView *)self setCollectionViewLayout:v6];
  }
}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (void)setNoteContainerViewMode:(int64_t)a3
{
  self->_noteContainerViewMode = a3;
}

- (BOOL)shouldShowCellParticipantsInfo
{
  return self->_shouldShowCellParticipantsInfo;
}

- (BOOL)shouldShowFolderName
{
  return self->_shouldShowFolderName;
}

- (BOOL)shouldShowAccountName
{
  return self->_shouldShowAccountName;
}

- (NSArray)numberOfColumnsAdjustmentWidths
{
  return self->_numberOfColumnsAdjustmentWidths;
}

- (void).cxx_destruct
{
}

@end