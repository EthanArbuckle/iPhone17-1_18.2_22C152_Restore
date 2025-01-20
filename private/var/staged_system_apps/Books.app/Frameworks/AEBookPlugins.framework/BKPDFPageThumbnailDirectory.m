@interface BKPDFPageThumbnailDirectory
- (BKTOCBookmarksDescription)noBookmarksView;
- (BOOL)showBookmarks;
- (BOOL)showBookmarksOnly;
- (NSArray)bookmarkedPages;
- (PDFDocument)pdfDocument;
- (id)_noBookmarksView;
- (id)locationAtIndex:(unint64_t)a3;
- (int64_t)indexForPageNumber:(unint64_t)a3;
- (int64_t)leftPageNumberAtIndex:(unint64_t)a3;
- (int64_t)numberOfCellsInGridView:(id)a3;
- (int64_t)pageNumberForCellIndex:(unint64_t)a3;
- (int64_t)rightPageNumberAtIndex:(unint64_t)a3;
- (unint64_t)indexForLocation:(id)a3;
- (unint64_t)pageCount;
- (void)calculatePageCount;
- (void)configureCell:(id)a3 atIndex:(unint64_t)a4;
- (void)reloadData;
- (void)setBookmarkedPages:(id)a3;
- (void)setNoBookmarksView:(id)a3;
- (void)setPageCount:(unint64_t)a3;
- (void)setPdfDocument:(id)a3;
- (void)setShowBookmarks:(BOOL)a3;
- (void)setShowBookmarksOnly:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BKPDFPageThumbnailDirectory

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKPDFPageThumbnailDirectory *)self calculatePageCount];
  v5.receiver = self;
  v5.super_class = (Class)BKPDFPageThumbnailDirectory;
  [(BKThumbnailDirectory *)&v5 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BKPDFPageThumbnailDirectory;
  [(BKContentViewController *)&v3 viewDidDisappear:a3];
}

- (void)setPdfDocument:(id)a3
{
  objc_super v5 = (PDFDocument *)a3;
  p_pdfDocument = &self->_pdfDocument;
  if (self->_pdfDocument != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_pdfDocument, a3);
    p_pdfDocument = (PDFDocument **)[(BKPDFPageThumbnailDirectory *)self calculatePageCount];
    objc_super v5 = v7;
  }

  _objc_release_x1(p_pdfDocument, v5);
}

- (void)setShowBookmarksOnly:(BOOL)a3
{
  if (self->_showBookmarksOnly != a3)
  {
    self->_showBookmarksOnly = a3;
    [(BKPDFPageThumbnailDirectory *)self calculatePageCount];
  }
}

- (void)calculatePageCount
{
  objc_super v3 = [(BKPDFPageThumbnailDirectory *)self pdfDocument];

  if (v3)
  {
    v4 = [(BKPDFPageThumbnailDirectory *)self pdfDocument];
    id v5 = [v4 pageCount];

    if (v5 && [(BKPDFPageThumbnailDirectory *)self showBookmarksOnly])
    {
      v6 = [(BKPDFPageThumbnailDirectory *)self pdfDocument];
      v7 = [v6 bookmarkedPages];

      +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
      v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472;
      v11 = sub_C6E34;
      v12 = &unk_1DD1D8;
      v13 = self;
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v8 = v14;
      [v7 enumerateIndexesUsingBlock:&v9];
      -[BKPDFPageThumbnailDirectory setBookmarkedPages:](self, "setBookmarkedPages:", v8, v9, v10, v11, v12, v13);
      id v5 = [v8 count];
    }
  }
  else
  {
    id v5 = 0;
  }
  if (self->_pageCount != v5)
  {
    self->_pageCount = (unint64_t)v5;
    [(BKPDFPageThumbnailDirectory *)self reloadData];
  }
}

- (int64_t)numberOfCellsInGridView:(id)a3
{
  unsigned int v4 = [(BKThumbnailDirectory *)self showSpreads];
  int64_t result = [(BKPDFPageThumbnailDirectory *)self pageCount];
  if (v4) {
    return vcvtps_s32_f32((float)(unint64_t)(result + 1) * 0.5);
  }
  return result;
}

- (int64_t)leftPageNumberAtIndex:(unint64_t)a3
{
  if ([(BKViewController *)self layoutDirection])
  {
    unint64_t v5 = (2 * a3) | 1;
    if (v5 <= [(BKPDFPageThumbnailDirectory *)self pageCount]) {
      return v5;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else if (a3)
  {
    return 2 * a3;
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)rightPageNumberAtIndex:(unint64_t)a3
{
  if ([(BKViewController *)self layoutDirection])
  {
    if (a3) {
      return 2 * a3;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    unint64_t v6 = (2 * a3) | 1;
    if (v6 <= [(BKPDFPageThumbnailDirectory *)self pageCount]) {
      return v6;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
}

- (int64_t)pageNumberForCellIndex:(unint64_t)a3
{
  if ([(BKThumbnailDirectory *)self showSpreads])
  {
    if ([(BKViewController *)self layoutDirection])
    {
      int64_t result = [(BKPDFPageThumbnailDirectory *)self rightPageNumberAtIndex:a3];
      if (result == 0x7FFFFFFFFFFFFFFFLL)
      {
        return [(BKPDFPageThumbnailDirectory *)self leftPageNumberAtIndex:a3];
      }
    }
    else
    {
      int64_t result = [(BKPDFPageThumbnailDirectory *)self leftPageNumberAtIndex:a3];
      if (result == 0x7FFFFFFFFFFFFFFFLL)
      {
        return [(BKPDFPageThumbnailDirectory *)self rightPageNumberAtIndex:a3];
      }
    }
  }
  else if ([(BKPDFPageThumbnailDirectory *)self showBookmarksOnly])
  {
    unint64_t v6 = [(BKPDFPageThumbnailDirectory *)self bookmarkedPages];
    id v7 = [v6 count];

    if ((unint64_t)v7 <= a3)
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      id v8 = [(BKPDFPageThumbnailDirectory *)self bookmarkedPages];
      v9 = [v8 objectAtIndex:a3];

      uint64_t v10 = [(BKPDFPageThumbnailDirectory *)self pdfDocument];
      id v11 = [v10 indexForPage:v9];

      int64_t v12 = +[BKPDFModernBookViewController pageNumberForPageIndex:v11];
      return v12;
    }
  }
  else
  {
    return +[BKPDFModernBookViewController pageNumberForPageIndex:a3];
  }
  return result;
}

- (int64_t)indexForPageNumber:(unint64_t)a3
{
  if ([(BKThumbnailDirectory *)self showSpreads]) {
    int64_t v5 = a3 >> 1;
  }
  else {
    int64_t v5 = a3 - 1;
  }
  if (v5 < 0
    || v5 >= [(BKPDFPageThumbnailDirectory *)self numberOfCellsInGridView:self->super._gridView])
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (id)locationAtIndex:(unint64_t)a3
{
  int64_t v4 = [(BKPDFPageThumbnailDirectory *)self pageNumberForCellIndex:a3];

  return [(BKDirectoryContent *)self locationForPageNumber:v4];
}

- (unint64_t)indexForLocation:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(BKPDFPageThumbnailDirectory *)self showBookmarksOnly])
  {
    unint64_t v5 = +[BKPDFModernBookViewController pageIndexForPageNumber:[(BKDirectoryContent *)self pageNumberForLocation:v4]];
    unint64_t v6 = [(BKPDFPageThumbnailDirectory *)self pdfDocument];
    id v7 = [v6 pageAtIndex:v5];

    id v8 = [(BKPDFPageThumbnailDirectory *)self bookmarkedPages];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_C7360;
    v12[3] = &unk_1DD200;
    id v9 = v7;
    id v13 = v9;
    id v14 = &v15;
    [v8 enumerateObjectsUsingBlock:v12];

    unint64_t v10 = v16[3];
  }
  else
  {
    unint64_t v10 = [(BKPDFPageThumbnailDirectory *)self indexForPageNumber:[(BKDirectoryContent *)self pageNumberForLocation:v4]];
    v16[3] = v10;
  }
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)configureCell:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKPDFPageThumbnailDirectory;
  [(BKThumbnailDirectory *)&v9 configureCell:v6 atIndex:a4];
  if ([(BKPDFPageThumbnailDirectory *)self showBookmarks])
  {
    if ([(BKPDFPageThumbnailDirectory *)self showBookmarksOnly])
    {
      [v6 setHasRibbon:1];
    }
    else
    {
      id v7 = [(BKPDFPageThumbnailDirectory *)self pdfDocument];
      id v8 = [v7 pageAtIndex:a4];

      if ([v8 isBookmarked]) {
        [v6 setHasRibbon:1];
      }
    }
  }
}

- (id)_noBookmarksView
{
  noBookmarksView = self->_noBookmarksView;
  if (!noBookmarksView)
  {
    id v4 = -[BKTOCBookmarksDescription initWithFrame:]([BKTOCBookmarksDescription alloc], "initWithFrame:", 0.0, 0.0, 320.0, 480.0);
    unint64_t v5 = self->_noBookmarksView;
    self->_noBookmarksView = v4;

    id v6 = +[UIColor clearColor];
    [(BKTOCBookmarksDescription *)self->_noBookmarksView setBackgroundColor:v6];

    [(BKTOCBookmarksDescription *)self->_noBookmarksView setAutoresizingMask:18];
    int v7 = isPad();
    double v8 = 27.0;
    if (!v7) {
      double v8 = 17.0;
    }
    objc_super v9 = +[UIFont systemFontOfSize:v8];
    unint64_t v10 = [(BKTOCBookmarksDescription *)self->_noBookmarksView titleLabel];
    [v10 setFont:v9];

    int v11 = isPad();
    double v12 = 13.0;
    if (v11) {
      double v12 = 17.0;
    }
    id v13 = +[UIFont systemFontOfSize:v12];
    id v14 = [(BKTOCBookmarksDescription *)self->_noBookmarksView descriptionLabel];
    [v14 setFont:v13];

    uint64_t v15 = [(BKTOCBookmarksDescription *)self->_noBookmarksView titleLabel];
    v16 = AEBundle();
    uint64_t v17 = [v16 localizedStringForKey:@"Adding Bookmarks…" value:&stru_1DF0D8 table:0];
    [v15 setText:v17];

    uint64_t v18 = +[UIColor bc_booksLabelColor];
    [v15 setTextColor:v18];

    v19 = AEBundle();
    v20 = [v19 localizedStringForKey:@"When you’re reading a PDF,\ntap the Bookmark button to\nmark the current page." value:&stru_1DF0D8 table:0];

    v21 = [(BKTOCBookmarksDescription *)self->_noBookmarksView descriptionLabel];
    [v21 setText:v20];
    v22 = +[UIColor bc_booksLabelColor];
    [v21 setTextColor:v22];

    [v21 setNumberOfLines:0];
    noBookmarksView = self->_noBookmarksView;
  }

  return noBookmarksView;
}

- (void)reloadData
{
  v10.receiver = self;
  v10.super_class = (Class)BKPDFPageThumbnailDirectory;
  [(BKThumbnailDirectory *)&v10 reloadData];
  if ([(BKPDFPageThumbnailDirectory *)self isViewLoaded])
  {
    if (![(BKPDFPageThumbnailDirectory *)self showBookmarksOnly]) {
      goto LABEL_5;
    }
    uint64_t v3 = [(BKPDFPageThumbnailDirectory *)self bookmarkedPages];
    if (!v3) {
      goto LABEL_6;
    }
    id v4 = (void *)v3;
    unint64_t v5 = [(BKPDFPageThumbnailDirectory *)self bookmarkedPages];
    id v6 = [v5 count];

    if (v6)
    {
LABEL_5:
      [(BKTOCBookmarksDescription *)self->_noBookmarksView removeFromSuperview];
      noBookmarksView = self->_noBookmarksView;
      self->_noBookmarksView = 0;
    }
    else
    {
LABEL_6:
      noBookmarksView = [(BKPDFPageThumbnailDirectory *)self _noBookmarksView];
      double v8 = [(BKPDFPageThumbnailDirectory *)self view];
      [v8 bounds];
      [noBookmarksView setFrame:];

      objc_super v9 = [(BKPDFPageThumbnailDirectory *)self view];
      [v9 addSubview:noBookmarksView];
    }
  }
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->_pageCount = a3;
}

- (PDFDocument)pdfDocument
{
  return self->_pdfDocument;
}

- (BOOL)showBookmarksOnly
{
  return self->_showBookmarksOnly;
}

- (BOOL)showBookmarks
{
  return self->_showBookmarks;
}

- (void)setShowBookmarks:(BOOL)a3
{
  self->_showBookmarks = a3;
}

- (NSArray)bookmarkedPages
{
  return self->_bookmarkedPages;
}

- (void)setBookmarkedPages:(id)a3
{
}

- (BKTOCBookmarksDescription)noBookmarksView
{
  return self->_noBookmarksView;
}

- (void)setNoBookmarksView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noBookmarksView, 0);
  objc_storeStrong((id *)&self->_bookmarkedPages, 0);

  objc_storeStrong((id *)&self->_pdfDocument, 0);
}

@end