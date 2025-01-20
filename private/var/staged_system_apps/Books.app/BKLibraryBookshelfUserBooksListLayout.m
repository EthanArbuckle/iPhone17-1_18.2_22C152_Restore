@interface BKLibraryBookshelfUserBooksListLayout
- (BKLibraryBookshelfLayout)bookshelfLayout;
- (BKLibraryBookshelfUserBooksListLayout)initWithLayout:(id)a3;
- (BKLibraryLayoutAttributes)noBooksAttr;
- (BOOL)allowOnlyVerticalDrags;
- (BOOL)hasSomeBooks;
- (BOOL)isSupplementalContentPDFPicker;
- (CGRect)_frameOfBookCellAtIndexPath:(id)a3;
- (CGRect)_frameOfSectionHeaderAtIndexPath:(id)a3;
- (NSMutableArray)sectionInfo;
- (double)booksAreaTop;
- (double)layoutAreaLeftMargin;
- (double)layoutAreaWidth;
- (double)layoutLeftMargin;
- (double)layoutWidth;
- (double)prepareLayoutForBooksSection:(double)a3;
- (double)totalHeightOfBooksSection;
- (id)layoutAttributesForBooksInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (int64_t)_rowAtPos:(double)a3 inSection:(id)a4;
- (int64_t)_sectionAtPos:(double)a3;
- (int64_t)totalNumBooks;
- (void)prepareLayoutForNoBooks;
- (void)prepareLayoutForUserCollectionBooksSection;
- (void)setBooksAreaTop:(double)a3;
- (void)setBookshelfLayout:(id)a3;
- (void)setHasSomeBooks:(BOOL)a3;
- (void)setLayoutAreaLeftMargin:(double)a3;
- (void)setLayoutAreaWidth:(double)a3;
- (void)setLayoutLeftMargin:(double)a3;
- (void)setLayoutWidth:(double)a3;
- (void)setNoBooksAttr:(id)a3;
- (void)setSectionInfo:(id)a3;
- (void)setTotalHeightOfBooksSection:(double)a3;
- (void)setTotalNumBooks:(int64_t)a3;
@end

@implementation BKLibraryBookshelfUserBooksListLayout

- (BKLibraryBookshelfUserBooksListLayout)initWithLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfUserBooksListLayout;
  v5 = [(BKLibraryBookshelfUserBooksListLayout *)&v8 init];
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

- (BOOL)isSupplementalContentPDFPicker
{
  v2 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  v3 = [v2 delegate];
  id v4 = [v3 dataSourceAdaptor];
  v5 = [v4 supplementaryDataSource];
  unsigned __int8 v6 = [v5 supplementalContentPDFPicker];

  return v6;
}

- (void)prepareLayoutForNoBooks
{
  v3 = off_100B20068;
  id v4 = +[NSIndexPath indexPathWithIndex:0];
  v5 = +[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v3 withIndexPath:v4];
  [(BKLibraryBookshelfUserBooksListLayout *)self setNoBooksAttr:v5];

  [(BKLibraryBookshelfUserBooksListLayout *)self layoutAreaLeftMargin];
  double v7 = v6;
  [(BKLibraryBookshelfUserBooksListLayout *)self booksAreaTop];
  double v9 = v8;
  [(BKLibraryBookshelfUserBooksListLayout *)self layoutAreaWidth];
  double v11 = v10;
  v12 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  v13 = [v12 collectionView];
  [v13 bounds];
  double v15 = v14 - v9;
  v16 = [(BKLibraryBookshelfUserBooksListLayout *)self noBooksAttr];
  [v16 setFrame:v7, v9, v11, v15];

  v17 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  v18 = [v17 mainHeaderMetrics];
  v19 = [(BKLibraryBookshelfUserBooksListLayout *)self noBooksAttr];
  [v19 setMainHeaderMetrics:v18];

  v20 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  v21 = [v20 metrics];
  id v22 = [v21 compactWidth];
  v23 = [(BKLibraryBookshelfUserBooksListLayout *)self noBooksAttr];
  [v23 setCompactLayout:v22];

  v24 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  v25 = [v24 measuring];
  v26 = [(BKLibraryBookshelfUserBooksListLayout *)self noBooksAttr];
  [v25 adjustHeight:v26];

  id v27 = [(BKLibraryBookshelfUserBooksListLayout *)self noBooksAttr];
  [v27 frame];
  [(BKLibraryBookshelfUserBooksListLayout *)self setTotalHeightOfBooksSection:CGRectGetMaxY(v29)];
}

- (double)prepareLayoutForBooksSection:(double)a3
{
  v5 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  double v6 = [v5 columnMetrics];

  double v7 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  double v8 = [v7 collectionView];

  [v8 bounds];
  double v10 = v9;
  [v6 margins];
  double v12 = v11;
  [(BKLibraryBookshelfUserBooksListLayout *)self setLayoutWidth:v10];
  [(BKLibraryBookshelfUserBooksListLayout *)self setLayoutLeftMargin:0.0];
  [(BKLibraryBookshelfUserBooksListLayout *)self setLayoutAreaLeftMargin:v12 + 0.0];
  [(BKLibraryBookshelfUserBooksListLayout *)self layoutWidth];
  double v14 = v13;
  [v6 margins];
  [(BKLibraryBookshelfUserBooksListLayout *)self setLayoutAreaWidth:v14 + v15 * -2.0];
  [(BKLibraryBookshelfUserBooksListLayout *)self setBooksAreaTop:a3];
  [(BKLibraryBookshelfUserBooksListLayout *)self setTotalHeightOfBooksSection:a3];
  [(BKLibraryBookshelfUserBooksListLayout *)self prepareLayoutForUserCollectionBooksSection];
  if ([(BKLibraryBookshelfUserBooksListLayout *)self hasSomeBooks]) {
    [(BKLibraryBookshelfUserBooksListLayout *)self setNoBooksAttr:0];
  }
  else {
    [(BKLibraryBookshelfUserBooksListLayout *)self prepareLayoutForNoBooks];
  }
  [(BKLibraryBookshelfUserBooksListLayout *)self totalHeightOfBooksSection];
  double v17 = v16;

  return v17;
}

- (void)prepareLayoutForUserCollectionBooksSection
{
  v3 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  id v4 = [v3 cellMetrics];
  BUProtocolCast();
  id v27 = (id)objc_claimAutoreleasedReturnValue();

  v5 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  double v6 = [v5 bookHeaderMetrics];

  double v7 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  double v8 = [v7 collectionView];

  if ([(BKLibraryBookshelfUserBooksListLayout *)self isSupplementalContentPDFPicker]) {
    [v27 smallCellHeight];
  }
  else {
    [v27 cellHeight];
  }
  double v10 = v9;
  [(BKLibraryBookshelfUserBooksListLayout *)self setHasSomeBooks:0];
  [(BKLibraryBookshelfUserBooksListLayout *)self setTotalNumBooks:0];
  uint64_t v11 = (uint64_t)[v8 numberOfSections];
  double v12 = +[NSMutableArray array];
  [(BKLibraryBookshelfUserBooksListLayout *)self setSectionInfo:v12];

  [(BKLibraryBookshelfUserBooksListLayout *)self booksAreaTop];
  double v14 = v13;
  if (v11 >= 1)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      double v16 = objc_alloc_init(BKLibraryListSectionInfo);
      double v17 = [(BKLibraryBookshelfUserBooksListLayout *)self sectionInfo];
      [v17 addObject:v16];

      [(BKLibraryListSectionInfo *)v16 setVertOffset:v14];
      -[BKLibraryListSectionInfo setNumBooks:](v16, "setNumBooks:", [v8 numberOfItemsInSection:i]);
      [(BKLibraryListSectionInfo *)v16 setNumRows:[(BKLibraryListSectionInfo *)v16 numBooks]];
      [(BKLibraryListSectionInfo *)v16 setRowHeight:v10];
      double v18 = 0.0;
      if (v11 >= 2) {
        [v6 sectionHeaderHeight];
      }
      [(BKLibraryListSectionInfo *)v16 setHeaderHeight:v18];
      double v19 = (double)[(BKLibraryListSectionInfo *)v16 numRows];
      [(BKLibraryListSectionInfo *)v16 rowHeight];
      double v21 = v20;
      [(BKLibraryListSectionInfo *)v16 headerHeight];
      [(BKLibraryListSectionInfo *)v16 setHeight:v22 + v19 * v21];
      [(BKLibraryListSectionInfo *)v16 height];
      double v24 = v23;
      [(BKLibraryBookshelfUserBooksListLayout *)self setTotalNumBooks:(char *)[(BKLibraryListSectionInfo *)v16 numBooks]+ [(BKLibraryBookshelfUserBooksListLayout *)self totalNumBooks]];
      BOOL v25 = [(BKLibraryBookshelfUserBooksListLayout *)self hasSomeBooks]
         || [(BKLibraryListSectionInfo *)v16 numBooks] > 0;
      double v14 = v14 + v24;
      [(BKLibraryBookshelfUserBooksListLayout *)self setHasSomeBooks:v25];
    }
  }
  [v6 bottomMargin];
  [(BKLibraryBookshelfUserBooksListLayout *)self setTotalHeightOfBooksSection:v14 + v26];
}

- (CGRect)_frameOfSectionHeaderAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(BKLibraryBookshelfUserBooksListLayout *)self sectionInfo];
  id v6 = [v4 section];

  double v7 = [v5 objectAtIndexedSubscript:v6];

  [v7 vertOffset];
  double v9 = v8;
  [v7 headerHeight];
  double v11 = v10;
  [(BKLibraryBookshelfUserBooksListLayout *)self layoutWidth];
  double v13 = v12;

  double v14 = 0.0;
  double v15 = v9;
  double v16 = v13;
  double v17 = v11;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_frameOfBookCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  id v6 = [(BKLibraryBookshelfUserBooksListLayout *)self sectionInfo];
  id v7 = [v6 count];

  if (v5 >= v7)
  {
    CGFloat x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  else
  {
    double v8 = [(BKLibraryBookshelfUserBooksListLayout *)self sectionInfo];
    double v9 = [v8 objectAtIndex:[v4 section]];

    id v10 = [v4 item];
    [v9 vertOffset];
    double v12 = v11;
    [v9 headerHeight];
    double v14 = v12 + v13;
    [v9 rowHeight];
    double v16 = v14 + (double)(uint64_t)v10 * v15;
    [(BKLibraryBookshelfUserBooksListLayout *)self layoutLeftMargin];
    CGFloat x = v17;
    double y = round(v16);
    [(BKLibraryBookshelfUserBooksListLayout *)self layoutWidth];
    CGFloat width = v20;
    [v9 rowHeight];
    CGFloat height = v22;
  }
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.double y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (int64_t)_sectionAtPos:(double)a3
{
  id v5 = [(BKLibraryBookshelfUserBooksListLayout *)self sectionInfo];
  if ([v5 count])
  {
    id v6 = [(BKLibraryBookshelfUserBooksListLayout *)self sectionInfo];
    id v7 = [v6 objectAtIndexedSubscript:0];
    [v7 vertOffset];
    double v9 = v8;

    id v10 = 0;
    if (v9 > a3) {
      return (int64_t)v10;
    }
  }
  else
  {
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v11 = [(BKLibraryBookshelfUserBooksListLayout *)self sectionInfo];
  double v12 = (char *)[v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    double v13 = v12;
    double v14 = 0;
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      double v16 = 0;
      double v17 = &v13[(void)v14];
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v11);
        }
        double v18 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v16);
        [v18 vertOffset];
        if (v19 <= a3)
        {
          [v18 vertOffset];
          double v21 = v20;
          [v18 height];
          if (v21 + v22 > a3)
          {
            id v10 = &v16[(void)v14];
            goto LABEL_16;
          }
        }
        ++v16;
      }
      while (v13 != v16);
      double v13 = (char *)[v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      double v14 = v17;
      if (v13) {
        continue;
      }
      break;
    }
  }

  double v11 = [(BKLibraryBookshelfUserBooksListLayout *)self sectionInfo];
  id v10 = (char *)[v11 count] - 1;
LABEL_16:

  return (int64_t)v10;
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
  double v8 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  double v9 = [v8 collectionView];

  double v10 = +[NSMutableArray array];
  if ([(BKLibraryBookshelfUserBooksListLayout *)self hasSomeBooks])
  {
    uint64_t v28 = [v9 numberOfSections:v9];
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    int64_t v11 = [(BKLibraryBookshelfUserBooksListLayout *)self _sectionAtPos:CGRectGetMinY(v30)];
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    int64_t v12 = [(BKLibraryBookshelfUserBooksListLayout *)self _sectionAtPos:CGRectGetMaxY(v31)];
    if ((v11 & 0x8000000000000000) == 0)
    {
      int64_t v13 = v12;
      if ((v12 & 0x8000000000000000) == 0 && v11 <= v12)
      {
        do
        {
          if (v28 >= 2)
          {
            double v14 = +[NSIndexPath indexPathForItem:0 inSection:v11];
            uint64_t v15 = [(BKLibraryBookshelfUserBooksListLayout *)self layoutAttributesForSupplementaryViewOfKind:off_100B20070 atIndexPath:v14];
            [v10 addObject:v15];
          }
          double v16 = [(BKLibraryBookshelfUserBooksListLayout *)self sectionInfo];
          double v17 = [v16 objectAtIndexedSubscript:v11];

          v32.origin.CGFloat x = x;
          v32.origin.CGFloat y = y;
          v32.size.CGFloat width = width;
          v32.size.CGFloat height = height;
          uint64_t v18 = [(BKLibraryBookshelfUserBooksListLayout *)self _rowAtPos:v17 inSection:CGRectGetMinY(v32)];
          v33.origin.CGFloat x = x;
          v33.origin.CGFloat y = y;
          v33.size.CGFloat width = width;
          v33.size.CGFloat height = height;
          int64_t v19 = [(BKLibraryBookshelfUserBooksListLayout *)self _rowAtPos:v17 inSection:CGRectGetMaxY(v33)];
          if (v18 <= v19)
          {
            int64_t v20 = v19 + 1;
            do
            {
              if ((v18 & 0x8000000000000000) == 0 && v18 < (uint64_t)[v17 numBooks])
              {
                double v21 = +[NSIndexPath indexPathForItem:v18 inSection:v11];
                double v22 = [(BKLibraryBookshelfUserBooksListLayout *)self layoutAttributesForItemAtIndexPath:v21];
                [v22 frame];
                v35.origin.CGFloat x = x;
                v35.origin.CGFloat y = y;
                v35.size.CGFloat width = width;
                v35.size.CGFloat height = height;
                if (CGRectIntersectsRect(v34, v35)) {
                  [v10 addObject:v22];
                }
              }
              ++v18;
            }
            while (v20 != v18);
          }
        }
        while (v11++ != v13);
      }
    }
  }
  else
  {
    long long v24 = [(BKLibraryBookshelfUserBooksListLayout *)self noBooksAttr];

    if (v24)
    {
      long long v25 = [(BKLibraryBookshelfUserBooksListLayout *)self noBooksAttr];
      [v10 addObject:v25];
    }
  }

  return v10;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[(BKLibraryBookshelfUserBooksListLayout *)self totalNumBooks] - 1;
  double v6 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  double v7 = [v6 cellMetrics];
  double v8 = BUProtocolCast();

  double v9 = +[BKLibraryLayoutAttributes layoutAttributesForCellWithIndexPath:v4];
  [(BKLibraryBookshelfUserBooksListLayout *)self _frameOfBookCellAtIndexPath:v4];
  [v9 setFrame:];
  [v9 setCellMetrics:v8];
  double v10 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  int64_t v11 = [v10 columnMetrics];
  [v9 setColumnMetrics:v11];

  int64_t v12 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  [v9 setEditMode:[v12 editMode]];

  [v9 setFirstItem:[v4 item] == 0];
  int64_t v13 = (char *)[v4 item];

  [v9 setLastItem:v13 == v5];
  double v14 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  [v9 setEditable:[v14 reorderableCollection]];

  return v9;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
  double v9 = [v8 bookHeaderMetrics];

  if ([v6 isEqualToString:off_100B20070])
  {
    id v10 = +[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v6 withIndexPath:v7];
    int64_t v11 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
    [v10 setRtlLayout:[v11 rtlLayout]];

    [(BKLibraryBookshelfUserBooksListLayout *)self _frameOfSectionHeaderAtIndexPath:v7];
    [v10 setFrame:];
    int64_t v12 = [v9 headerFontAttributes];
    int64_t v13 = [v12 attributes];
    [v10 setFontAttrs:v13];

    double v14 = [(BKLibraryBookshelfUserBooksListLayout *)self bookshelfLayout];
    uint64_t v15 = [v14 columnMetrics];
    [v10 setColumnMetrics:v15];

    [v10 setMainHeaderMetrics:0];
    [v10 setUseAllCaps:1];
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

- (int64_t)totalNumBooks
{
  return self->_totalNumBooks;
}

- (void)setTotalNumBooks:(int64_t)a3
{
  self->_totalNumBooks = a3;
}

- (NSMutableArray)sectionInfo
{
  return self->_sectionInfo;
}

- (void)setSectionInfo:(id)a3
{
}

- (BKLibraryLayoutAttributes)noBooksAttr
{
  return self->_noBooksAttr;
}

- (void)setNoBooksAttr:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noBooksAttr, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);

  objc_destroyWeak((id *)&self->_bookshelfLayout);
}

@end