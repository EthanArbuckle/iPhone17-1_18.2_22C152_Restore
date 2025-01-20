@interface BKLibraryBookshelfFinishedBooksLayout
- (BKLibraryBookshelfFinishedBooksLayout)initWithLayout:(id)a3;
- (BKLibraryBookshelfLayout)bookshelfLayout;
- (BKLibraryLayoutAttributes)noBooksAttr;
- (BKLibraryNonDatedListSectionInfo)nonDatedSectionInfo;
- (BOOL)allowOnlyVerticalDrags;
- (BOOL)hasSomeBooks;
- (BOOL)lastEditMode;
- (CGRect)_frameOfDatedBookCellForFinishedCollectionAtRow:(int64_t)a3;
- (CGRect)_frameOfNonDatedBookCellForFinishedCollectionAtRow:(int64_t)a3;
- (CGRect)_frameOfNonDatedSectionHeader;
- (CGRect)lastBounds;
- (NSMutableArray)datedRowInfos;
- (double)booksAreaTop;
- (double)layoutAreaLeftMargin;
- (double)layoutAreaWidth;
- (double)layoutLeftMargin;
- (double)layoutWidth;
- (double)prepareLayoutForBooksSection:(double)a3;
- (double)totalHeightOfBooksSection;
- (id)_nonDatedCellMetrics;
- (id)layoutAttributesForBooksInRect:(CGRect)a3;
- (id)layoutAttributesForDatedItemAtIndexPath:(id)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForNonDatedItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (int64_t)_rowAtPos:(double)a3 inSection:(id)a4;
- (int64_t)nonDatedBooksSectionIndex;
- (int64_t)totalNumDatedBooks;
- (int64_t)totalNumNonDatedBooks;
- (void)prepareLayoutForFinishedCollectionBooksSection;
- (void)prepareLayoutForNoBooks;
- (void)setBooksAreaTop:(double)a3;
- (void)setBookshelfLayout:(id)a3;
- (void)setDatedRowInfos:(id)a3;
- (void)setHasSomeBooks:(BOOL)a3;
- (void)setLastBounds:(CGRect)a3;
- (void)setLastEditMode:(BOOL)a3;
- (void)setLayoutAreaLeftMargin:(double)a3;
- (void)setLayoutAreaWidth:(double)a3;
- (void)setLayoutLeftMargin:(double)a3;
- (void)setLayoutWidth:(double)a3;
- (void)setNoBooksAttr:(id)a3;
- (void)setNonDatedBooksSectionIndex:(int64_t)a3;
- (void)setNonDatedSectionInfo:(id)a3;
- (void)setTotalHeightOfBooksSection:(double)a3;
- (void)setTotalNumDatedBooks:(int64_t)a3;
- (void)setTotalNumNonDatedBooks:(int64_t)a3;
@end

@implementation BKLibraryBookshelfFinishedBooksLayout

- (BKLibraryBookshelfFinishedBooksLayout)initWithLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfFinishedBooksLayout;
  v5 = [(BKLibraryBookshelfFinishedBooksLayout *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_bookshelfLayout, v4);
  }

  return v6;
}

- (BOOL)allowOnlyVerticalDrags
{
  return 1;
}

- (void)prepareLayoutForNoBooks
{
  v3 = off_100B20068;
  id v4 = +[NSIndexPath indexPathWithIndex:0];
  v5 = +[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v3 withIndexPath:v4];
  [(BKLibraryBookshelfFinishedBooksLayout *)self setNoBooksAttr:v5];

  [(BKLibraryBookshelfFinishedBooksLayout *)self layoutAreaLeftMargin];
  double v7 = v6;
  [(BKLibraryBookshelfFinishedBooksLayout *)self booksAreaTop];
  double v9 = v8;
  [(BKLibraryBookshelfFinishedBooksLayout *)self layoutAreaWidth];
  double v11 = v10;
  v12 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  v13 = [v12 collectionView];
  [v13 bounds];
  double v15 = v14 - v9;
  v16 = [(BKLibraryBookshelfFinishedBooksLayout *)self noBooksAttr];
  [v16 setFrame:v7, v9, v11, v15];

  v17 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  v18 = [v17 mainHeaderMetrics];
  v19 = [(BKLibraryBookshelfFinishedBooksLayout *)self noBooksAttr];
  [v19 setMainHeaderMetrics:v18];

  v20 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  v21 = [v20 metrics];
  id v22 = [v21 compactWidth];
  v23 = [(BKLibraryBookshelfFinishedBooksLayout *)self noBooksAttr];
  [v23 setCompactLayout:v22];

  v24 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  v25 = [v24 measuring];
  v26 = [(BKLibraryBookshelfFinishedBooksLayout *)self noBooksAttr];
  [v25 adjustHeight:v26];

  id v27 = [(BKLibraryBookshelfFinishedBooksLayout *)self noBooksAttr];
  [v27 frame];
  [(BKLibraryBookshelfFinishedBooksLayout *)self setTotalHeightOfBooksSection:CGRectGetMaxY(v29)];
}

- (double)prepareLayoutForBooksSection:(double)a3
{
  v5 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  double v6 = [v5 collectionView];

  double v7 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  unsigned int v8 = [v7 metricsHaveChanged];

  if (v8)
  {
    double v9 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
    double v10 = [v9 measuring];
    [v10 bookCellHeightFor:0 editMode:0 metrics:0 clearCache:1];
  }
  double v11 = +[NSMutableArray array];
  [(BKLibraryBookshelfFinishedBooksLayout *)self setDatedRowInfos:v11];

  [(BKLibraryBookshelfFinishedBooksLayout *)self setNonDatedSectionInfo:0];
  [(BKLibraryBookshelfFinishedBooksLayout *)self setTotalNumDatedBooks:0];
  [(BKLibraryBookshelfFinishedBooksLayout *)self setTotalNumNonDatedBooks:0];
  [(BKLibraryBookshelfFinishedBooksLayout *)self setNonDatedBooksSectionIndex:-1];
  if ((uint64_t)[v6 numberOfSections] < 2)
  {
    if ([v6 numberOfSections] == (id)1)
    {
      uint64_t v12 = (uint64_t)[v6 numberOfItemsInSection:0];
      if (v12 >= 1)
      {
        uint64_t v13 = v12;
        double v14 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
        double v15 = [v14 delegate];
        v16 = [v15 dataSourceAdaptor];
        v17 = [v16 booksDataSource];
        v18 = +[NSIndexPath indexPathForItem:0 inSection:0];
        v19 = [v17 representedObjectForIndexPath:v18];

        id v20 = [v19 hasSpecifiedFinishedDate];
        if (v20) {
          uint64_t v21 = v13;
        }
        else {
          uint64_t v21 = 0;
        }
        if (v20) {
          uint64_t v13 = 0;
        }
        uint64_t v22 = (uint64_t)((void)v20 << 63) >> 63;
        [(BKLibraryBookshelfFinishedBooksLayout *)self setTotalNumDatedBooks:v21];
        [(BKLibraryBookshelfFinishedBooksLayout *)self setTotalNumNonDatedBooks:v13];
        [(BKLibraryBookshelfFinishedBooksLayout *)self setNonDatedBooksSectionIndex:v22];
      }
    }
  }
  else
  {
    -[BKLibraryBookshelfFinishedBooksLayout setTotalNumDatedBooks:](self, "setTotalNumDatedBooks:", [v6 numberOfItemsInSection:0]);
    -[BKLibraryBookshelfFinishedBooksLayout setTotalNumNonDatedBooks:](self, "setTotalNumNonDatedBooks:", [v6 numberOfItemsInSection:1]);
    [(BKLibraryBookshelfFinishedBooksLayout *)self setNonDatedBooksSectionIndex:1];
  }
  v23 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  v24 = [v23 columnMetrics];

  [v6 bounds];
  double v26 = v25;
  [v24 margins];
  double v28 = v27;
  [(BKLibraryBookshelfFinishedBooksLayout *)self setLayoutWidth:v26];
  [(BKLibraryBookshelfFinishedBooksLayout *)self setLayoutLeftMargin:0.0];
  [(BKLibraryBookshelfFinishedBooksLayout *)self setLayoutAreaLeftMargin:v28 + 0.0];
  [(BKLibraryBookshelfFinishedBooksLayout *)self layoutWidth];
  [(BKLibraryBookshelfFinishedBooksLayout *)self setLayoutAreaWidth:v29 + v28 * -2.0];
  [(BKLibraryBookshelfFinishedBooksLayout *)self setBooksAreaTop:a3];
  [(BKLibraryBookshelfFinishedBooksLayout *)self setTotalHeightOfBooksSection:a3];
  [(BKLibraryBookshelfFinishedBooksLayout *)self prepareLayoutForFinishedCollectionBooksSection];
  if ([(BKLibraryBookshelfFinishedBooksLayout *)self hasSomeBooks]) {
    [(BKLibraryBookshelfFinishedBooksLayout *)self setNoBooksAttr:0];
  }
  else {
    [(BKLibraryBookshelfFinishedBooksLayout *)self prepareLayoutForNoBooks];
  }
  [(BKLibraryBookshelfFinishedBooksLayout *)self totalHeightOfBooksSection];
  double v31 = v30;

  return v31;
}

- (id)_nonDatedCellMetrics
{
  v2 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  v3 = [v2 metrics];
  id v4 = [v3 computedMetrics];
  v5 = [v4 objectForKeyedSubscript:@"bookCellListUser"];
  double v6 = BUProtocolCast();

  return v6;
}

- (void)prepareLayoutForFinishedCollectionBooksSection
{
  v3 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  id v51 = [v3 measuring];

  objc_opt_class();
  id v4 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  v5 = [v4 cellMetrics];
  double v6 = BUDynamicCast();

  double v7 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  unsigned int v8 = [v7 collectionView];

  [(BKLibraryBookshelfFinishedBooksLayout *)self layoutAreaWidth];
  double v10 = v9;
  double v11 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  uint64_t v12 = [v11 columnMetrics];
  [v12 margins];
  [v6 setCellWidth:v10 + v13 * -2.0];

  double v14 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  unsigned int v15 = [v14 editMode];

  unsigned int v16 = v15 ^ [(BKLibraryBookshelfFinishedBooksLayout *)self lastEditMode];
  v17 = v6;
  [v6 cellHeight];
  unsigned int v50 = v15;
  if (v18 == 0.0) {
    unsigned int v15 = 0;
  }
  [(BKLibraryBookshelfFinishedBooksLayout *)self lastBounds];
  if (!CGRectIsEmpty(v53))
  {
    [(BKLibraryBookshelfFinishedBooksLayout *)self lastBounds];
    double v20 = v19;
    [v8 bounds];
    if (v20 == v21)
    {
      [(BKLibraryBookshelfFinishedBooksLayout *)self lastBounds];
      double v23 = v22;
      [v8 bounds];
      if (v23 != v24) {
        unsigned int v16 = 1;
      }
    }
    else
    {
      unsigned int v16 = 1;
    }
  }
  [v8 bounds];
  -[BKLibraryBookshelfFinishedBooksLayout setLastBounds:](self, "setLastBounds:");
  [(BKLibraryBookshelfFinishedBooksLayout *)self setLastEditMode:v50];
  if (v16) {
    [v51 bookCellHeightFor:0 editMode:0 metrics:0 clearCache:1];
  }
  v49 = v8;
  uint64_t v25 = [(BKLibraryBookshelfFinishedBooksLayout *)self totalNumDatedBooks];
  int64_t v47 = [(BKLibraryBookshelfFinishedBooksLayout *)self totalNumNonDatedBooks];
  if ((v47 + v25 < 0) ^ __OFADD__(v47, v25) | (v47 + v25 == 0)) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = 1;
  }
  -[BKLibraryBookshelfFinishedBooksLayout setHasSomeBooks:](self, "setHasSomeBooks:", v26, v47);
  [(BKLibraryBookshelfFinishedBooksLayout *)self booksAreaTop];
  double v28 = v27;
  if (v25 >= 1)
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      double v30 = +[NSIndexPath indexPathForItem:i inSection:0];
      if (v15) {
        [v17 cellHeight];
      }
      else {
        [v51 bookCellHeightFor:v30 editMode:v50 metrics:v17 clearCache:0];
      }
      double v32 = v31;
      v33 = objc_alloc_init(FinishedRowInfo);
      [(FinishedRowInfo *)v33 setTopOfCell:v28];
      double v28 = v28 + v32;
      [(FinishedRowInfo *)v33 setBottomOfCell:v28];
      v34 = [(BKLibraryBookshelfFinishedBooksLayout *)self datedRowInfos];
      [v34 addObject:v33];
    }
  }
  v35 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  v36 = [v35 bookHeaderMetrics];

  if (v48 <= 0)
  {
    double v46 = 0.0;
  }
  else
  {
    v37 = [(BKLibraryBookshelfFinishedBooksLayout *)self _nonDatedCellMetrics];
    [v37 cellHeight];
    double v39 = v38;
    v40 = objc_alloc_init(BKLibraryNonDatedListSectionInfo);
    [(BKLibraryBookshelfFinishedBooksLayout *)self setNonDatedSectionInfo:v40];
    [(BKLibraryNonDatedListSectionInfo *)v40 setVertOffset:v28];
    [(BKLibraryNonDatedListSectionInfo *)v40 setNumBooks:v48];
    [(BKLibraryNonDatedListSectionInfo *)v40 setNumRows:[(BKLibraryNonDatedListSectionInfo *)v40 numBooks]];
    [(BKLibraryNonDatedListSectionInfo *)v40 setRowHeight:v39];
    [v36 sectionHeaderHeight];
    -[BKLibraryNonDatedListSectionInfo setHeaderHeight:](v40, "setHeaderHeight:");
    double v41 = (double)[(BKLibraryNonDatedListSectionInfo *)v40 numRows];
    [(BKLibraryNonDatedListSectionInfo *)v40 rowHeight];
    double v43 = v42;
    [(BKLibraryNonDatedListSectionInfo *)v40 headerHeight];
    [(BKLibraryNonDatedListSectionInfo *)v40 setHeight:v44 + v41 * v43];
    [(BKLibraryNonDatedListSectionInfo *)v40 height];
    double v28 = v28 + v45;

    [v36 bottomMargin];
  }
  [(BKLibraryBookshelfFinishedBooksLayout *)self setTotalHeightOfBooksSection:v28 + v46];
}

- (CGRect)_frameOfDatedBookCellForFinishedCollectionAtRow:(int64_t)a3
{
  v5 = [(BKLibraryBookshelfFinishedBooksLayout *)self datedRowInfos];
  double v6 = [v5 objectAtIndex:a3];

  [(BKLibraryBookshelfFinishedBooksLayout *)self layoutLeftMargin];
  double v8 = v7;
  [v6 topOfCell];
  double v10 = v9;
  [(BKLibraryBookshelfFinishedBooksLayout *)self layoutWidth];
  double v12 = v11;
  [v6 bottomOfCell];
  double v14 = v13;
  [v6 topOfCell];
  double v16 = v14 - v15;

  double v17 = v8;
  double v18 = v10;
  double v19 = v12;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_frameOfNonDatedBookCellForFinishedCollectionAtRow:(int64_t)a3
{
  v5 = [(BKLibraryBookshelfFinishedBooksLayout *)self nonDatedSectionInfo];
  [v5 vertOffset];
  double v7 = v6;
  [v5 headerHeight];
  double v9 = v7 + v8;
  [v5 rowHeight];
  double v11 = v9 + (double)a3 * v10;
  [(BKLibraryBookshelfFinishedBooksLayout *)self layoutLeftMargin];
  double v13 = v12;
  [(BKLibraryBookshelfFinishedBooksLayout *)self layoutWidth];
  double v15 = v14;
  [v5 rowHeight];
  double v17 = v16;

  double v18 = v13;
  double v19 = round(v11);
  double v20 = v15;
  double v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_frameOfNonDatedSectionHeader
{
  v3 = [(BKLibraryBookshelfFinishedBooksLayout *)self nonDatedSectionInfo];
  [v3 vertOffset];
  double v5 = v4;
  [v3 headerHeight];
  double v7 = v6;
  [(BKLibraryBookshelfFinishedBooksLayout *)self layoutWidth];
  double v9 = v8;

  double v10 = 0.0;
  double v11 = v5;
  double v12 = v9;
  double v13 = v7;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (int64_t)_rowAtPos:(double)a3 inSection:(id)a4
{
  id v5 = a4;
  [v5 vertOffset];
  double v7 = v6;
  [v5 headerHeight];
  double v9 = a3 - (v7 + v8);
  [v5 rowHeight];
  uint64_t v11 = vcvtmd_s64_f64(v9 / v10);
  double v12 = (char *)(v11 & ~(v11 >> 63));
  if ((uint64_t)v12 >= (uint64_t)[v5 numRows]) {
    double v12 = (char *)[v5 numRows] - 1;
  }

  return (int64_t)v12;
}

- (id)layoutAttributesForBooksInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = +[NSMutableArray array];
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v40);
  if ([(BKLibraryBookshelfFinishedBooksLayout *)self hasSomeBooks])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v11 = [(BKLibraryBookshelfFinishedBooksLayout *)self datedRowInfos];
    id v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v11);
          }
          double v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          [v17 topOfCell];
          if (v18 < MaxY)
          {
            [v17 bottomOfCell];
            if (v19 > MinY)
            {
              double v20 = +[NSIndexPath indexPathForItem:(char *)i + v14 inSection:0];
              double v21 = [(BKLibraryBookshelfFinishedBooksLayout *)self layoutAttributesForItemAtIndexPath:v20];
              [v21 frame];
              v44.origin.CGFloat x = x;
              v44.origin.CGFloat y = y;
              v44.size.CGFloat width = width;
              v44.size.CGFloat height = height;
              if (CGRectIntersectsRect(v41, v44)) {
                [v8 addObject:v21];
              }
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
        v14 += (uint64_t)i;
      }
      while (v13);
    }

    double v22 = [(BKLibraryBookshelfFinishedBooksLayout *)self nonDatedSectionInfo];
    if (v22)
    {
      double v23 = +[NSIndexPath indexPathForItem:0 inSection:[(BKLibraryBookshelfFinishedBooksLayout *)self nonDatedBooksSectionIndex]];
      double v24 = [(BKLibraryBookshelfFinishedBooksLayout *)self layoutAttributesForSupplementaryViewOfKind:off_100B20070 atIndexPath:v23];
      [v24 frame];
      v45.origin.CGFloat x = x;
      v45.origin.CGFloat y = y;
      v45.size.CGFloat width = width;
      v45.size.CGFloat height = height;
      if (CGRectIntersectsRect(v42, v45)) {
        [v8 addObject:v24];
      }
      uint64_t v25 = [(BKLibraryBookshelfFinishedBooksLayout *)self _rowAtPos:v22 inSection:MinY];
      int64_t v26 = [(BKLibraryBookshelfFinishedBooksLayout *)self _rowAtPos:v22 inSection:MaxY];
      if (v25 <= v26)
      {
        int64_t v27 = v26 + 1;
        do
        {
          if ((v25 & 0x8000000000000000) == 0 && v25 < (uint64_t)[v22 numBooks])
          {
            double v28 = +[NSIndexPath indexPathForItem:v25 inSection:[(BKLibraryBookshelfFinishedBooksLayout *)self nonDatedBooksSectionIndex]];
            double v29 = [(BKLibraryBookshelfFinishedBooksLayout *)self layoutAttributesForItemAtIndexPath:v28];
            [v29 frame];
            v46.origin.CGFloat x = x;
            v46.origin.CGFloat y = y;
            v46.size.CGFloat width = width;
            v46.size.CGFloat height = height;
            if (CGRectIntersectsRect(v43, v46)) {
              [v8 addObject:v29];
            }
          }
          ++v25;
        }
        while (v27 != v25);
      }
    }
  }
  else
  {
    double v30 = [(BKLibraryBookshelfFinishedBooksLayout *)self noBooksAttr];

    if (v30)
    {
      double v31 = [(BKLibraryBookshelfFinishedBooksLayout *)self noBooksAttr];
      [v8 addObject:v31];
    }
  }

  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  if (v5 == (id)[(BKLibraryBookshelfFinishedBooksLayout *)self nonDatedBooksSectionIndex]) {
    [(BKLibraryBookshelfFinishedBooksLayout *)self layoutAttributesForNonDatedItemAtIndexPath:v4];
  }
  else {
  double v6 = [(BKLibraryBookshelfFinishedBooksLayout *)self layoutAttributesForDatedItemAtIndexPath:v4];
  }

  return v6;
}

- (id)layoutAttributesForDatedItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[(BKLibraryBookshelfFinishedBooksLayout *)self totalNumDatedBooks] - 1;
  objc_opt_class();
  double v6 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  double v7 = [v6 cellMetrics];
  double v8 = BUDynamicCast();

  double v9 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  double v10 = [v9 collectionView];

  uint64_t v11 = +[BKLibraryLayoutAttributes layoutAttributesForCellWithIndexPath:v4];
  id v12 = [v10 indexPathsForSelectedItems];
  unsigned __int8 v13 = [v12 containsObject:v4];

  -[BKLibraryBookshelfFinishedBooksLayout _frameOfDatedBookCellForFinishedCollectionAtRow:](self, "_frameOfDatedBookCellForFinishedCollectionAtRow:", [v4 item]);
  [v11 setFrame:];
  [v11 setCellMetrics:v8];
  uint64_t v14 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  uint64_t v15 = [v14 columnMetrics];
  [v11 setColumnMetrics:v15];

  double v16 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  [v11 setEditMode:[v16 editMode]];

  [v11 setFirstItem:([v4 item] == 0)];
  double v17 = (char *)[v4 item];

  [v11 setLastItem:v17 == v5];
  double v18 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  unsigned int v19 = [v18 editMode];
  double v20 = 1.0;
  if (v19 && (v13 & 1) == 0) {
    [v8 shrinkAlpha:1.0];
  }
  [v11 setAlpha:v20];

  return v11;
}

- (id)layoutAttributesForNonDatedItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[(BKLibraryBookshelfFinishedBooksLayout *)self totalNumNonDatedBooks] - 1;
  double v6 = [(BKLibraryBookshelfFinishedBooksLayout *)self _nonDatedCellMetrics];
  double v7 = +[BKLibraryLayoutAttributes layoutAttributesForCellWithIndexPath:v4];
  -[BKLibraryBookshelfFinishedBooksLayout _frameOfNonDatedBookCellForFinishedCollectionAtRow:](self, "_frameOfNonDatedBookCellForFinishedCollectionAtRow:", [v4 item]);
  [v7 setFrame:];
  [v7 setCellMetrics:v6];
  double v8 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  double v9 = [v8 columnMetrics];
  [v7 setColumnMetrics:v9];

  double v10 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  [v7 setEditMode:[v10 editMode]];

  [v7 setFirstItem:[v4 item] == 0];
  uint64_t v11 = (char *)[v4 item];

  [v7 setLastItem:v11 == v5];
  id v12 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  [v7 setEditable:[v12 reorderableCollection]];

  return v7;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
  double v9 = [v8 bookHeaderMetrics];

  if ([v6 isEqualToString:off_100B20070])
  {
    id v10 = +[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v6 withIndexPath:v7];
    uint64_t v11 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
    [v10 setRtlLayout:[v11 rtlLayout]];

    [(BKLibraryBookshelfFinishedBooksLayout *)self _frameOfNonDatedSectionHeader];
    [v10 setFrame:];
    id v12 = [v9 largeHeaderFontAttributes];
    unsigned __int8 v13 = [v12 attributes];
    [v10 setFontAttrs:v13];

    uint64_t v14 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
    uint64_t v15 = [v14 columnMetrics];
    [v10 setColumnMetrics:v15];

    double v16 = [(BKLibraryBookshelfFinishedBooksLayout *)self bookshelfLayout];
    double v17 = [v16 mainHeaderMetrics];
    [v10 setMainHeaderMetrics:v17];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BKLibraryBookshelfLayout)bookshelfLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bookshelfLayout);

  return (BKLibraryBookshelfLayout *)WeakRetained;
}

- (void)setBookshelfLayout:(id)a3
{
}

- (double)totalHeightOfBooksSection
{
  return self->_totalHeightOfBooksSection;
}

- (void)setTotalHeightOfBooksSection:(double)a3
{
  self->_totalHeightOfBooksSection = a3;
}

- (double)booksAreaTop
{
  return self->_booksAreaTop;
}

- (void)setBooksAreaTop:(double)a3
{
  self->_booksAreaTop = a3;
}

- (int64_t)totalNumDatedBooks
{
  return self->_totalNumDatedBooks;
}

- (void)setTotalNumDatedBooks:(int64_t)a3
{
  self->_totalNumDatedBooks = a3;
}

- (int64_t)totalNumNonDatedBooks
{
  return self->_totalNumNonDatedBooks;
}

- (void)setTotalNumNonDatedBooks:(int64_t)a3
{
  self->_totalNumNonDatedBooks = a3;
}

- (int64_t)nonDatedBooksSectionIndex
{
  return self->_nonDatedBooksSectionIndex;
}

- (void)setNonDatedBooksSectionIndex:(int64_t)a3
{
  self->_nonDatedBooksSectionIndeCGFloat x = a3;
}

- (double)layoutWidth
{
  return self->_layoutWidth;
}

- (void)setLayoutWidth:(double)a3
{
  self->_layoutWidth = a3;
}

- (double)layoutLeftMargin
{
  return self->_layoutLeftMargin;
}

- (void)setLayoutLeftMargin:(double)a3
{
  self->_layoutLeftMargin = a3;
}

- (double)layoutAreaLeftMargin
{
  return self->_layoutAreaLeftMargin;
}

- (void)setLayoutAreaLeftMargin:(double)a3
{
  self->_layoutAreaLeftMargin = a3;
}

- (double)layoutAreaWidth
{
  return self->_layoutAreaWidth;
}

- (void)setLayoutAreaWidth:(double)a3
{
  self->_layoutAreaWidth = a3;
}

- (BOOL)hasSomeBooks
{
  return self->_hasSomeBooks;
}

- (void)setHasSomeBooks:(BOOL)a3
{
  self->_hasSomeBooks = a3;
}

- (BKLibraryLayoutAttributes)noBooksAttr
{
  return self->_noBooksAttr;
}

- (void)setNoBooksAttr:(id)a3
{
}

- (NSMutableArray)datedRowInfos
{
  return self->_datedRowInfos;
}

- (void)setDatedRowInfos:(id)a3
{
}

- (BKLibraryNonDatedListSectionInfo)nonDatedSectionInfo
{
  return self->_nonDatedSectionInfo;
}

- (void)setNonDatedSectionInfo:(id)a3
{
}

- (CGRect)lastBounds
{
  double x = self->_lastBounds.origin.x;
  double y = self->_lastBounds.origin.y;
  double width = self->_lastBounds.size.width;
  double height = self->_lastBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastBounds:(CGRect)a3
{
  self->_lastBounds = a3;
}

- (BOOL)lastEditMode
{
  return self->_lastEditMode;
}

- (void)setLastEditMode:(BOOL)a3
{
  self->_lastEditMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonDatedSectionInfo, 0);
  objc_storeStrong((id *)&self->_datedRowInfos, 0);
  objc_storeStrong((id *)&self->_noBooksAttr, 0);

  objc_destroyWeak((id *)&self->_bookshelfLayout);
}

@end