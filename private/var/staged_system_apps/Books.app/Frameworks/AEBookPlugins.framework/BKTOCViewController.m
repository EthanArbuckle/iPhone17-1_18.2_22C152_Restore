@interface BKTOCViewController
- (BKPaginationController)paginationController;
- (BKTOCEventEngagementProtocol)eventEngagement;
- (BKTOCViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)fetchedResultsControllerAscendingOrder;
- (BOOL)isLandscape;
- (BOOL)isThemeFlowingBook;
- (BOOL)isVertical;
- (BOOL)scrollIndicatorsNeedToBeFlashed;
- (BOOL)shouldIgnoreViewLayoutUpdates;
- (BOOL)usesPopoverStyle;
- (NSFetchedResultsController)fetchedResultsController;
- (UIEdgeInsets)centeringInsets;
- (UIEdgeInsets)verticalCenteringInsets;
- (UIFont)chapterSubLevelFont;
- (UIFont)chapterTopLevelFont;
- (UIFont)pageLabelFont;
- (UIScrollView)scrollView;
- (double)calculateFontSize;
- (double)sizeOfCachedFonts;
- (id)title;
- (id)tocFetchedResultsController;
- (int64_t)tocContentType;
- (void)dealloc;
- (void)destroyFetchedResultsController;
- (void)establishChapterFonts;
- (void)paginationDataLoaded:(id)a3;
- (void)preferredContentSizeChanged:(id)a3;
- (void)releaseViews;
- (void)setCenteringInsets:(UIEdgeInsets)a3;
- (void)setChapterSubLevelFont:(id)a3;
- (void)setChapterTopLevelFont:(id)a3;
- (void)setDirectoryDelegate:(id)a3;
- (void)setEventEngagement:(id)a3;
- (void)setPaginationController:(id)a3;
- (void)setScrollIndicatorsNeedToBeFlashed:(BOOL)a3;
- (void)setShouldIgnoreViewLayoutUpdates:(BOOL)a3;
- (void)setSizeOfCachedFonts:(double)a3;
- (void)setTheme:(id)a3;
- (void)setTocContentType:(int64_t)a3;
- (void)setUsesPopoverStyle:(BOOL)a3;
- (void)setVertical:(BOOL)a3;
- (void)setVerticalCenteringInsets:(UIEdgeInsets)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKTOCViewController

- (void)releaseViews
{
  [(BKTOCViewController *)self destroyFetchedResultsController];
  v3.receiver = self;
  v3.super_class = (Class)BKTOCViewController;
  [(BKContentViewController *)&v3 releaseViews];
}

- (void)dealloc
{
  [(BKTOCViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)BKTOCViewController;
  [(BKContentViewController *)&v3 dealloc];
}

- (BKTOCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BKTOCViewController;
  return [(BKViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)BKTOCViewController;
  [(BKTOCViewController *)&v12 viewWillAppear:a3];
  v4 = [(BKTOCViewController *)self fetchedResultsController];
  id v11 = 0;
  unsigned __int8 v5 = [v4 performFetch:&v11];
  id v6 = v11;

  if ((v5 & 1) == 0)
  {
    v7 = BCIMLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1377EC(self, v6, v7);
    }
  }
  v8 = +[NSNotificationCenter defaultCenter];
  v9 = BKPaginationDataLoadedNotification;
  v10 = [(BKTOCViewController *)self paginationController];
  [v8 addObserver:self selector:"paginationDataLoaded:" name:v9 object:v10];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKTOCViewController;
  [(BKContentViewController *)&v6 viewDidAppear:a3];
  int v4 = *((unsigned __int8 *)&self->_tocFlags + 2);
  if (*((unsigned char *)&self->_tocFlags + 2))
  {
    unsigned __int8 v5 = [(BKTOCViewController *)self scrollView];
    [v5 flashScrollIndicators];
  }
  [(BKTOCViewController *)self setScrollIndicatorsNeedToBeFlashed:v4 == 0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKTOCViewController;
  [(BKContentViewController *)&v7 viewWillDisappear:a3];
  int v4 = +[NSNotificationCenter defaultCenter];
  unsigned __int8 v5 = BKPaginationDataLoadedNotification;
  objc_super v6 = [(BKTOCViewController *)self paginationController];
  [v4 removeObserver:self name:v5 object:v6];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKTOCViewController;
  [(BKContentViewController *)&v4 viewDidDisappear:a3];
  [(BKTOCViewController *)self destroyFetchedResultsController];
}

- (void)preferredContentSizeChanged:(id)a3
{
  [(BKTOCViewController *)self setChapterTopLevelFont:0];
  [(BKTOCViewController *)self setChapterSubLevelFont:0];
  [(BKTOCViewController *)self establishChapterFonts];

  [(BKTOCViewController *)self reload];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKTOCViewController;
  -[BKTOCViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = [(BKDirectoryContent *)self directoryDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(BKDirectoryContent *)self directoryDelegate];
    [v10 tocViewController:self willTransitionToSize:v7 withTransitionCoordinator:width, height];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_3B6E4;
  v11[3] = &unk_1DAA18;
  v11[4] = self;
  [v7 animateAlongsideTransition:0 completion:v11];
}

- (void)setTheme:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BKTOCViewController *)self theme];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)BKTOCViewController;
    [(BKContentViewController *)&v7 setTheme:v4];
    [(BKTOCViewController *)self invalidateFollowingThemeChange];
  }
}

- (id)title
{
  int64_t v2 = [(BKTOCViewController *)self tocContentType];
  if (v2 == 1)
  {
    objc_super v3 = AEBundle();
    id v4 = v3;
    CFStringRef v5 = @"Bookmarks";
  }
  else if (v2)
  {
    objc_super v3 = AEBundle();
    id v4 = v3;
    CFStringRef v5 = @"Notes";
  }
  else
  {
    objc_super v3 = AEBundle();
    id v4 = v3;
    CFStringRef v5 = @"Contents";
  }
  unsigned __int8 v6 = [v3 localizedStringForKey:v5 value:&stru_1DF0D8 table:0];

  return v6;
}

- (BOOL)isThemeFlowingBook
{
  objc_super v3 = [(BKTOCViewController *)self theme];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    CFStringRef v5 = [(BKTOCViewController *)self theme];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)setDirectoryDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKTOCViewController;
  id v5 = [(BKDirectoryContent *)&v11 directoryDelegate];

  if (v5 != v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)BKTOCViewController;
    [(BKDirectoryContent *)&v10 setDirectoryDelegate:v4];
    BYTE4(self->_fetchedResultsController) = BYTE4(self->_fetchedResultsController) & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    BYTE4(self->_fetchedResultsController) = BYTE4(self->_fetchedResultsController) & 0xFD | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    BYTE4(self->_fetchedResultsController) = BYTE4(self->_fetchedResultsController) & 0xFB | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 8;
    }
    else {
      char v8 = 0;
    }
    BYTE4(self->_fetchedResultsController) = BYTE4(self->_fetchedResultsController) & 0xF7 | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 16;
    }
    else {
      char v9 = 0;
    }
    BYTE4(self->_fetchedResultsController) = BYTE4(self->_fetchedResultsController) & 0xEF | v9;
  }
}

- (id)tocFetchedResultsController
{
  objc_super v3 = *(BKPaginationController **)((char *)&self->_paginationController + 4);
  if (!v3)
  {
    id v4 = [(BKContentViewController *)self book];
    id v5 = [v4 managedObjectContext];
    if (v5)
    {
      id v6 = objc_alloc_init((Class)NSFetchRequest);
      char v7 = [v4 objectID];
      char v8 = +[NSPredicate predicateWithFormat:@"bookInfo == %@", v7, 0];

      [v6 setPredicate:v8];
      char v9 = +[NSEntityDescription entityForName:@"BKNavigationInfo" inManagedObjectContext:v5];
      [v6 setEntity:v9];

      id v10 = objc_alloc((Class)NSArray);
      id v11 = [v10 initWithObjects:BKNavigationInfoPropertyIndentationLevel, BKNavigationInfoPropertyName, BKNavigationInfoPropertyHref, BKNavigationInfoPropertyHTMLName, 0];
      [v6 setPropertiesToFetch:v11];
      [v6 setReturnsObjectsAsFaults:0];
      id v12 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"absoluteOrder" ascending:[self fetchedResultsControllerAscendingOrder]];
      id v13 = [objc_alloc((Class)NSArray) initWithObjects:v12, 0];
      [v6 setSortDescriptors:v13];
      v14 = (BKPaginationController *)[objc_alloc((Class)NSFetchedResultsController) initWithFetchRequest:v6 managedObjectContext:v5 sectionNameKeyPath:0 cacheName:0];
      v15 = *(BKPaginationController **)((char *)&self->_paginationController + 4);
      *(BKPaginationController **)((char *)&self->_paginationController + 4) = v14;

      [*(id *)((char *)&self->_paginationController + 4) setDelegate:self];
      id v16 = [v5 countEntity:@"BKNavigationInfo" withPredicate:v8];
      [v6 setFetchLimit:v16];
      [v6 setFetchBatchSize:v16];
    }
    objc_super v3 = *(BKPaginationController **)((char *)&self->_paginationController + 4);
  }

  return v3;
}

- (BOOL)fetchedResultsControllerAscendingOrder
{
  return ![(BKTOCViewController *)self isVertical];
}

- (NSFetchedResultsController)fetchedResultsController
{
  return (NSFetchedResultsController *)[(BKTOCViewController *)self tocFetchedResultsController];
}

- (void)destroyFetchedResultsController
{
  [*(id *)((char *)&self->_paginationController + 4) setDelegate:0];
  objc_super v3 = *(BKPaginationController **)((char *)&self->_paginationController + 4);
  *(BKPaginationController **)((char *)&self->_paginationController + 4) = 0;
}

- (void)paginationDataLoaded:(id)a3
{
}

- (BOOL)isLandscape
{
  int64_t v2 = [(BKTOCViewController *)self bc_windowForViewController];
  objc_super v3 = [v2 windowScene];
  BOOL v4 = (char *)[v3 interfaceOrientation] - 3 < (unsigned char *)&dword_0 + 2;

  return v4;
}

- (double)calculateFontSize
{
  if (![(BKTOCViewController *)self isThemeFlowingBook])
  {
    BOOL v6 = isPad() == 0;
    double result = 16.0;
    double v7 = 17.0;
LABEL_7:
    if (!v6) {
      return v7;
    }
    return result;
  }
  if (![(BKTOCViewController *)self usesPopoverStyle]
    || (unsigned __int8 v4 = [(BKTOCViewController *)self isVertical], result = 10.0, (v4 & 1) == 0))
  {
    unsigned __int8 v5 = [(BKTOCViewController *)self isLandscape];
    double result = 14.0;
    if ((v5 & 1) == 0)
    {
      BOOL v6 = isPad() == 0;
      double result = 14.0;
      double v7 = 19.0;
      goto LABEL_7;
    }
  }
  return result;
}

- (void)establishChapterFonts
{
  if ([(BKTOCViewController *)self usesPopoverStyle])
  {
    uint64_t v3 = [(BKTOCViewController *)self chapterTopLevelFont];
    if (v3)
    {
      unsigned __int8 v4 = (void *)v3;
      unsigned __int8 v5 = [(BKTOCViewController *)self chapterSubLevelFont];

      if (v5) {
        return;
      }
    }
    BOOL v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [(BKTOCViewController *)self setChapterTopLevelFont:v6];

    id v15 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody weight:UIFontWeightMedium];
    -[BKTOCViewController setChapterSubLevelFont:](self, "setChapterSubLevelFont:");
    goto LABEL_11;
  }
  [(BKTOCViewController *)self calculateFontSize];
  double v8 = v7;
  [(BKTOCViewController *)self sizeOfCachedFonts];
  if (v9 != v8)
  {
    [(BKTOCViewController *)self setChapterTopLevelFont:0];
    [(BKTOCViewController *)self setChapterSubLevelFont:0];
    [(BKTOCViewController *)self setSizeOfCachedFonts:v8];
  }
  uint64_t v10 = [(BKTOCViewController *)self chapterTopLevelFont];
  if (!v10
    || (id v11 = (void *)v10,
        [(BKTOCViewController *)self chapterSubLevelFont],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    id v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v15 _scaledValueForValue:v8];
    id v13 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    [(BKTOCViewController *)self setChapterTopLevelFont:v13];

    [v15 _scaledValueForValue:v8];
    v14 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    [(BKTOCViewController *)self setChapterSubLevelFont:v14];

LABEL_11:
  }
}

- (UIFont)pageLabelFont
{
  uint64_t v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  if (![(BKTOCViewController *)self usesPopoverStyle])
  {
    [(BKTOCViewController *)self calculateFontSize];
    [v3 _scaledValueForValue:];
    uint64_t v4 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");

    uint64_t v3 = (void *)v4;
  }

  return (UIFont *)v3;
}

- (UIScrollView)scrollView
{
  return *(UIScrollView **)&self->_shouldIgnoreViewLayoutUpdates;
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (UIEdgeInsets)centeringInsets
{
  double v2 = *(double *)(&self->_vertical + 4);
  double v3 = *(double *)((char *)&self->_centeringInsets.top + 4);
  double v4 = *(double *)((char *)&self->_centeringInsets.left + 4);
  double v5 = *(double *)((char *)&self->_centeringInsets.bottom + 4);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setCenteringInsets:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)(&self->_vertical + 4) = a3;
}

- (int64_t)tocContentType
{
  return *(void *)((char *)&self->_centeringInsets.right + 4);
}

- (void)setTocContentType:(int64_t)a3
{
  *(void *)((char *)&self->_centeringInsets.right + 4) = a3;
}

- (BKPaginationController)paginationController
{
  return *(BKPaginationController **)((char *)&self->_tocContentType + 4);
}

- (void)setPaginationController:(id)a3
{
}

- (BOOL)shouldIgnoreViewLayoutUpdates
{
  return (BOOL)self->_tocFlags;
}

- (void)setShouldIgnoreViewLayoutUpdates:(BOOL)a3
{
  *(unsigned char *)&self->_tocFlags = a3;
}

- (BOOL)usesPopoverStyle
{
  return *((unsigned char *)&self->_tocFlags + 1);
}

- (void)setUsesPopoverStyle:(BOOL)a3
{
  *((unsigned char *)&self->_tocFlags + 1) = a3;
}

- (UIEdgeInsets)verticalCenteringInsets
{
  double v2 = *(double *)((char *)&self->_sizeOfCachedFonts + 4);
  double v3 = *(double *)((char *)&self->_verticalCenteringInsets.top + 4);
  double v4 = *(double *)((char *)&self->_verticalCenteringInsets.left + 4);
  double v5 = *(double *)((char *)&self->_verticalCenteringInsets.bottom + 4);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setVerticalCenteringInsets:(UIEdgeInsets)a3
{
  *(UIEdgeInsets *)((char *)&self->_sizeOfCachedFonts + 4) = a3;
}

- (BKTOCEventEngagementProtocol)eventEngagement
{
  return *(BKTOCEventEngagementProtocol **)((char *)&self->_scrollView + 4);
}

- (void)setEventEngagement:(id)a3
{
}

- (BOOL)scrollIndicatorsNeedToBeFlashed
{
  return *((unsigned char *)&self->_tocFlags + 2);
}

- (void)setScrollIndicatorsNeedToBeFlashed:(BOOL)a3
{
  *((unsigned char *)&self->_tocFlags + 2) = a3;
}

- (UIFont)chapterTopLevelFont
{
  return *(UIFont **)((char *)&self->_eventEngagement + 4);
}

- (void)setChapterTopLevelFont:(id)a3
{
}

- (UIFont)chapterSubLevelFont
{
  return *(UIFont **)((char *)&self->_chapterTopLevelFont + 4);
}

- (void)setChapterSubLevelFont:(id)a3
{
}

- (double)sizeOfCachedFonts
{
  return *(double *)((char *)&self->_chapterSubLevelFont + 4);
}

- (void)setSizeOfCachedFonts:(double)a3
{
  *(double *)((char *)&self->_chapterSubLevelFont + 4) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_chapterTopLevelFont + 4), 0);
  objc_storeStrong((id *)((char *)&self->_eventEngagement + 4), 0);
  objc_storeStrong((id *)((char *)&self->_scrollView + 4), 0);
  objc_storeStrong((id *)&self->_shouldIgnoreViewLayoutUpdates, 0);
  objc_storeStrong((id *)((char *)&self->_paginationController + 4), 0);

  objc_storeStrong((id *)((char *)&self->_tocContentType + 4), 0);
}

@end