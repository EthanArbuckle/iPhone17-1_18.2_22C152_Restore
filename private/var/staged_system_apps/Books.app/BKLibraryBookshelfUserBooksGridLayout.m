@interface BKLibraryBookshelfUserBooksGridLayout
- (BKLibraryBookshelfLayout)bookshelfLayout;
- (BKLibraryBookshelfUserBooksGridLayout)initWithLayout:(id)a3;
- (BKLibraryLayoutAttributes)noBooksAttr;
- (BOOL)allowOnlyVerticalDrags;
- (BOOL)hasSomeBooks;
- (BOOL)hideInfoBar;
- (BOOL)isSupplementalContentPDFPicker;
- (CGRect)_frameOfBookCellAtIndexPath:(id)a3;
- (CGRect)_frameOfSectionHeaderAtIndexPath:(id)a3;
- (NSMutableArray)sectionInfo;
- (double)booksAreaTop;
- (double)gutter;
- (double)layoutAreaLeftMargin;
- (double)layoutAreaWidth;
- (double)layoutWidth;
- (double)margins;
- (double)prepareLayoutForBooksSection:(double)a3;
- (double)totalHeightOfBooksSection;
- (double)vertical;
- (id)layoutAttributesForBooksInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (int64_t)_rowAtPos:(double)a3 inSection:(id)a4;
- (int64_t)_sectionAtPos:(double)a3;
- (int64_t)numColumns;
- (void)prepareLayoutForNoBooks;
- (void)prepareLayoutForUserCollectionBooksSection;
- (void)setBooksAreaTop:(double)a3;
- (void)setBookshelfLayout:(id)a3;
- (void)setGutter:(double)a3;
- (void)setHasSomeBooks:(BOOL)a3;
- (void)setHideInfoBar:(BOOL)a3;
- (void)setLayoutAreaLeftMargin:(double)a3;
- (void)setLayoutAreaWidth:(double)a3;
- (void)setLayoutWidth:(double)a3;
- (void)setMargins:(double)a3;
- (void)setNoBooksAttr:(id)a3;
- (void)setNumColumns:(int64_t)a3;
- (void)setSectionInfo:(id)a3;
- (void)setTotalHeightOfBooksSection:(double)a3;
- (void)setVertical:(double)a3;
@end

@implementation BKLibraryBookshelfUserBooksGridLayout

- (BKLibraryBookshelfUserBooksGridLayout)initWithLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfUserBooksGridLayout;
  v5 = [(BKLibraryBookshelfUserBooksGridLayout *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_bookshelfLayout, v4);
  }

  return v6;
}

- (BOOL)allowOnlyVerticalDrags
{
  return 0;
}

- (void)prepareLayoutForNoBooks
{
  v3 = off_100B20068;
  id v4 = +[NSIndexPath indexPathWithIndex:0];
  v5 = +[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v3 withIndexPath:v4];
  [(BKLibraryBookshelfUserBooksGridLayout *)self setNoBooksAttr:v5];

  [(BKLibraryBookshelfUserBooksGridLayout *)self layoutAreaLeftMargin];
  double v7 = v6;
  [(BKLibraryBookshelfUserBooksGridLayout *)self booksAreaTop];
  double v9 = v8;
  [(BKLibraryBookshelfUserBooksGridLayout *)self layoutAreaWidth];
  double v11 = v10;
  v12 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  v13 = [v12 collectionView];
  [v13 bounds];
  double v15 = v14 - v9;
  v16 = [(BKLibraryBookshelfUserBooksGridLayout *)self noBooksAttr];
  [v16 setFrame:v7, v9, v11, v15];

  v17 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  v18 = [v17 mainHeaderMetrics];
  v19 = [(BKLibraryBookshelfUserBooksGridLayout *)self noBooksAttr];
  [v19 setMainHeaderMetrics:v18];

  v20 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  v21 = [v20 metrics];
  id v22 = [v21 compactWidth];
  v23 = [(BKLibraryBookshelfUserBooksGridLayout *)self noBooksAttr];
  [v23 setCompactLayout:v22];

  v24 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  v25 = [v24 measuring];
  v26 = [(BKLibraryBookshelfUserBooksGridLayout *)self noBooksAttr];
  [v25 adjustHeight:v26];

  id v27 = [(BKLibraryBookshelfUserBooksGridLayout *)self noBooksAttr];
  [v27 frame];
  [(BKLibraryBookshelfUserBooksGridLayout *)self setTotalHeightOfBooksSection:CGRectGetMaxY(v29)];
}

- (BOOL)isSupplementalContentPDFPicker
{
  v2 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  v3 = [v2 delegate];
  id v4 = [v3 dataSourceAdaptor];
  v5 = [v4 supplementaryDataSource];
  unsigned __int8 v6 = [v5 supplementalContentPDFPicker];

  return v6;
}

- (double)prepareLayoutForBooksSection:(double)a3
{
  v5 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  unsigned __int8 v6 = [v5 columnMetrics];

  double v7 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  double v8 = [v7 collectionView];

  [v8 bounds];
  [(BKLibraryBookshelfUserBooksGridLayout *)self setLayoutWidth:v9];
  if ([(BKLibraryBookshelfUserBooksGridLayout *)self isSupplementalContentPDFPicker]) {
    [v6 smallMargins];
  }
  else {
    [v6 margins];
  }
  -[BKLibraryBookshelfUserBooksGridLayout setMargins:](self, "setMargins:");
  [(BKLibraryBookshelfUserBooksGridLayout *)self layoutWidth];
  double v11 = v10;
  [v6 maxWidth];
  if (v11 > v12)
  {
    [(BKLibraryBookshelfUserBooksGridLayout *)self layoutWidth];
    double v14 = v13;
    [v6 maxWidth];
    double v16 = (v14 - v15) * 0.5;
    [(BKLibraryBookshelfUserBooksGridLayout *)self margins];
    [(BKLibraryBookshelfUserBooksGridLayout *)self setMargins:v17 + v16];
  }
  if ([(BKLibraryBookshelfUserBooksGridLayout *)self isSupplementalContentPDFPicker]) {
    [v6 smallGutter];
  }
  else {
    [v6 gutter];
  }
  -[BKLibraryBookshelfUserBooksGridLayout setGutter:](self, "setGutter:");
  [v6 vertical];
  -[BKLibraryBookshelfUserBooksGridLayout setVertical:](self, "setVertical:");
  v18 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  -[BKLibraryBookshelfUserBooksGridLayout setHideInfoBar:](self, "setHideInfoBar:", [v18 editMode]);

  [(BKLibraryBookshelfUserBooksGridLayout *)self margins];
  [(BKLibraryBookshelfUserBooksGridLayout *)self setLayoutAreaLeftMargin:"setLayoutAreaLeftMargin:"];
  [(BKLibraryBookshelfUserBooksGridLayout *)self layoutWidth];
  double v20 = v19;
  [(BKLibraryBookshelfUserBooksGridLayout *)self margins];
  [(BKLibraryBookshelfUserBooksGridLayout *)self setLayoutAreaWidth:v20 + v21 * -2.0];
  [(BKLibraryBookshelfUserBooksGridLayout *)self setBooksAreaTop:a3];
  [(BKLibraryBookshelfUserBooksGridLayout *)self setTotalHeightOfBooksSection:a3];
  [(BKLibraryBookshelfUserBooksGridLayout *)self prepareLayoutForUserCollectionBooksSection];
  if ([(BKLibraryBookshelfUserBooksGridLayout *)self hasSomeBooks]) {
    [(BKLibraryBookshelfUserBooksGridLayout *)self setNoBooksAttr:0];
  }
  else {
    [(BKLibraryBookshelfUserBooksGridLayout *)self prepareLayoutForNoBooks];
  }
  [(BKLibraryBookshelfUserBooksGridLayout *)self totalHeightOfBooksSection];
  double v23 = v22;

  return v23;
}

- (void)prepareLayoutForUserCollectionBooksSection
{
  v3 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  id v57 = [v3 columnMetrics];

  objc_opt_class();
  id v4 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  v5 = [v4 cellMetrics];
  unsigned __int8 v6 = BUDynamicCast();

  double v7 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  double v8 = [v7 bookHeaderMetrics];

  double v9 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  double v10 = [v9 collectionView];

  if ([(BKLibraryBookshelfUserBooksGridLayout *)self isSupplementalContentPDFPicker])
  {
    id v11 = [v57 smallColumns];
  }
  else
  {
    [(BKLibraryBookshelfUserBooksGridLayout *)self layoutWidth];
    id v11 = [v57 columnsForContainingWidth:];
  }
  [(BKLibraryBookshelfUserBooksGridLayout *)self setNumColumns:v11];
  double v12 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  unsigned int v13 = [v12 hasSeriesSequenceLabel];

  if (v13)
  {
    [v6 seriesSequenceLabelTopMargin];
    double v15 = v14;
    [v6 seriesSequenceLabelHeight];
    double v55 = v15 + v16;
    [v6 seriesSequenceLabelBottomMargin];
    double v18 = v17;
  }
  else
  {
    [v6 infoBarSpacing];
    double v18 = v19;
    double v55 = 0.0;
  }
  double v20 = 0.0;
  if (![(BKLibraryBookshelfUserBooksGridLayout *)self hideInfoBar])
  {
    [v6 infoBarHeight];
    double v20 = v18 + v21;
  }
  [v6 cellAspect];
  double v23 = v22;
  [(BKLibraryBookshelfUserBooksGridLayout *)self layoutWidth];
  double v25 = v24;
  [(BKLibraryBookshelfUserBooksGridLayout *)self margins];
  double v27 = v26;
  [(BKLibraryBookshelfUserBooksGridLayout *)self gutter];
  double v29 = v28;
  uint64_t v30 = [(BKLibraryBookshelfUserBooksGridLayout *)self numColumns];
  [(BKLibraryBookshelfUserBooksGridLayout *)self gutter];
  double v32 = v31;
  [(BKLibraryBookshelfUserBooksGridLayout *)self vertical];
  double v34 = v33;
  [(BKLibraryBookshelfUserBooksGridLayout *)self setHasSomeBooks:0];
  uint64_t v35 = (uint64_t)[v10 numberOfSections];
  v36 = +[NSMutableArray array];
  [(BKLibraryBookshelfUserBooksGridLayout *)self setSectionInfo:v36];

  [(BKLibraryBookshelfUserBooksGridLayout *)self booksAreaTop];
  double v38 = v37;
  if (v35 >= 1)
  {
    uint64_t v39 = 0;
    double v40 = v34 + v20 + v56 + round(v23 * (round((v25 + v27 * -2.0 + v29) / (double)v30) - v32));
    while (1)
    {
      v41 = objc_alloc_init(BKLibrarySectionInfo);
      v42 = [(BKLibraryBookshelfUserBooksGridLayout *)self sectionInfo];
      [v42 addObject:v41];

      [(BKLibrarySectionInfo *)v41 setVertOffset:v38];
      -[BKLibrarySectionInfo setNumBooks:](v41, "setNumBooks:", [v10 numberOfItemsInSection:v39]);
      [(BKLibrarySectionInfo *)v41 setNumRows:vcvtpd_s64_f64((double)[(BKLibrarySectionInfo *)v41 numBooks]/ (double)[(BKLibraryBookshelfUserBooksGridLayout *)self numColumns])];
      if ([v6 sectionItemRowLimit])
      {
        if (v35 >= 2) {
          break;
        }
      }
      [(BKLibrarySectionInfo *)v41 setRowHeight:v40];
      double v46 = 0.0;
      if (v35 >= 2) {
        goto LABEL_18;
      }
LABEL_19:
      [(BKLibrarySectionInfo *)v41 setHeaderHeight:v46];
      double v47 = (double)[(BKLibrarySectionInfo *)v41 numRows];
      [(BKLibrarySectionInfo *)v41 rowHeight];
      double v49 = v48;
      [(BKLibrarySectionInfo *)v41 headerHeight];
      [(BKLibrarySectionInfo *)v41 setHeight:v50 + v47 * v49];
      [(BKLibrarySectionInfo *)v41 height];
      double v52 = v51;
      BOOL v53 = [(BKLibraryBookshelfUserBooksGridLayout *)self hasSomeBooks]
         || [(BKLibrarySectionInfo *)v41 numBooks] > 0;
      double v38 = v38 + v52;
      [(BKLibraryBookshelfUserBooksGridLayout *)self setHasSomeBooks:v53];

      if (v35 == ++v39) {
        goto LABEL_23;
      }
    }
    id v43 = [(BKLibrarySectionInfo *)v41 numRows];
    id v44 = [v6 sectionItemRowLimit];
    if ((uint64_t)v43 >= (uint64_t)v44) {
      id v45 = v44;
    }
    else {
      id v45 = v43;
    }
    [(BKLibrarySectionInfo *)v41 setNumRows:v45];
    [(BKLibrarySectionInfo *)v41 setRowHeight:v40];
LABEL_18:
    [v8 sectionHeaderHeight];
    goto LABEL_19;
  }
LABEL_23:
  [v8 bottomMargin];
  [(BKLibraryBookshelfUserBooksGridLayout *)self setTotalHeightOfBooksSection:v38 + v54];
}

- (CGRect)_frameOfSectionHeaderAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(BKLibraryBookshelfUserBooksGridLayout *)self sectionInfo];
  id v6 = [v4 section];

  double v7 = [v5 objectAtIndexedSubscript:v6];

  [v7 vertOffset];
  double v9 = v8;
  [v7 headerHeight];
  double v11 = v10;
  [(BKLibraryBookshelfUserBooksGridLayout *)self layoutWidth];
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
  objc_opt_class();
  v5 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  id v6 = [v5 cellMetrics];
  double v7 = BUDynamicCast();

  if ([(BKLibraryBookshelfUserBooksGridLayout *)self isSupplementalContentPDFPicker]) {
    [v7 smallCellSize];
  }
  else {
    [v7 cellSize];
  }
  if ([(BKLibraryBookshelfUserBooksGridLayout *)self isSupplementalContentPDFPicker]) {
    [v7 smallCellSize];
  }
  else {
    [v7 cellSize];
  }
  double v8 = [(BKLibraryBookshelfUserBooksGridLayout *)self sectionInfo];
  double v9 = [v8 objectAtIndex:[v4 section]];

  uint64_t v10 = [(BKLibraryBookshelfUserBooksGridLayout *)self numColumns];
  uint64_t v11 = (uint64_t)[v4 item];
  uint64_t v12 = (uint64_t)[v4 item];

  double v13 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  unsigned int v14 = [v13 rtlLayout];

  [v9 vertOffset];
  double v16 = v15;
  [v9 headerHeight];
  double v18 = v17;
  [v9 rowHeight];
  double v20 = v19;
  [(BKLibraryBookshelfUserBooksGridLayout *)self layoutWidth];
  double v22 = v21;
  [(BKLibraryBookshelfUserBooksGridLayout *)self margins];
  double v24 = v23;
  [(BKLibraryBookshelfUserBooksGridLayout *)self gutter];
  double v55 = v25;
  [v9 rowHeight];
  double v27 = v26;
  [(BKLibraryBookshelfUserBooksGridLayout *)self vertical];
  double v29 = v28;
  [(BKLibraryBookshelfUserBooksGridLayout *)self gutter];
  double v56 = v30;
  [(BKLibraryBookshelfUserBooksGridLayout *)self margins];
  double v32 = v31;
  unsigned __int8 v33 = [(BKLibraryBookshelfUserBooksGridLayout *)self hideInfoBar];
  double v34 = 0.0;
  if ((v33 & 1) == 0)
  {
    [v7 infoBarDateSpacing];
    double v54 = v24;
    double v35 = v29;
    double v36 = v22;
    double v37 = v27;
    double v38 = v20;
    double v39 = v18;
    double v40 = v16;
    double v42 = v41;
    [v7 infoBarExpectedDateHeight];
    double v34 = v42 + v43;
    double v16 = v40;
    double v18 = v39;
    double v20 = v38;
    double v27 = v37;
    double v22 = v36;
    double v29 = v35;
    double v24 = v54;
  }
  uint64_t v44 = v12 % v10;
  if (v14) {
    uint64_t v44 = v10 + ~(v12 % v10);
  }
  double v45 = round((v22 + v24 * -2.0 + v55) / (double)v10);
  double v46 = round(v32 + v45 * (double)v44);
  double v47 = round(v16 + v18 + (double)(v11 / v10) * v20);
  double v48 = v45 - v56;
  double v49 = v27 - v29 + v34;

  double v50 = v46;
  double v51 = v47;
  double v52 = v48;
  double v53 = v49;
  result.size.height = v53;
  result.size.width = v52;
  result.origin.y = v51;
  result.origin.x = v50;
  return result;
}

- (int64_t)_sectionAtPos:(double)a3
{
  v5 = [(BKLibraryBookshelfUserBooksGridLayout *)self sectionInfo];
  if ([v5 count])
  {
    id v6 = [(BKLibraryBookshelfUserBooksGridLayout *)self sectionInfo];
    double v7 = [v6 objectAtIndexedSubscript:0];
    [v7 vertOffset];
    double v9 = v8;

    uint64_t v10 = 0;
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
  uint64_t v11 = [(BKLibraryBookshelfUserBooksGridLayout *)self sectionInfo];
  uint64_t v12 = (char *)[v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    double v13 = v12;
    unsigned int v14 = 0;
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
            uint64_t v10 = &v16[(void)v14];
            goto LABEL_16;
          }
        }
        ++v16;
      }
      while (v13 != v16);
      double v13 = (char *)[v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      unsigned int v14 = v17;
      if (v13) {
        continue;
      }
      break;
    }
  }

  uint64_t v11 = [(BKLibraryBookshelfUserBooksGridLayout *)self sectionInfo];
  uint64_t v10 = (char *)[v11 count] - 1;
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
  uint64_t v12 = (char *)(v11 & ~(v11 >> 63));
  if ((uint64_t)v12 >= (uint64_t)[v5 numRows]) {
    uint64_t v12 = (char *)[v5 numRows] - 1;
  }

  return (int64_t)v12;
}

- (id)layoutAttributesForBooksInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  double v9 = [v8 collectionView];

  double v10 = +[NSMutableArray array];
  if ([(BKLibraryBookshelfUserBooksGridLayout *)self hasSomeBooks])
  {
    uint64_t v27 = (uint64_t)[v9 numberOfSections];
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    int64_t v11 = [(BKLibraryBookshelfUserBooksGridLayout *)self _sectionAtPos:CGRectGetMinY(v30)];
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    int64_t v28 = [(BKLibraryBookshelfUserBooksGridLayout *)self _sectionAtPos:CGRectGetMaxY(v31)];
    if ((v11 & 0x8000000000000000) == 0 && (v28 & 0x8000000000000000) == 0 && v11 <= v28)
    {
      do
      {
        if (v27 >= 2)
        {
          uint64_t v12 = +[NSIndexPath indexPathForItem:0 inSection:v11];
          double v13 = [(BKLibraryBookshelfUserBooksGridLayout *)self layoutAttributesForSupplementaryViewOfKind:off_100B20070 atIndexPath:v12];
          [v10 addObject:v13];
        }
        unsigned int v14 = [(BKLibraryBookshelfUserBooksGridLayout *)self sectionInfo];
        uint64_t v15 = [v14 objectAtIndexedSubscript:v11];

        v32.origin.CGFloat x = x;
        v32.origin.CGFloat y = y;
        v32.size.CGFloat width = width;
        v32.size.CGFloat height = height;
        int64_t v16 = [(BKLibraryBookshelfUserBooksGridLayout *)self _rowAtPos:v15 inSection:CGRectGetMinY(v32)];
        v33.origin.CGFloat x = x;
        v33.origin.CGFloat y = y;
        v33.size.CGFloat width = width;
        v33.size.CGFloat height = height;
        int64_t v17 = [(BKLibraryBookshelfUserBooksGridLayout *)self _rowAtPos:v15 inSection:CGRectGetMaxY(v33)];
        if (v16 <= v17)
        {
          int64_t v18 = v17;
          do
          {
            if ([(BKLibraryBookshelfUserBooksGridLayout *)self numColumns] >= 1)
            {
              uint64_t v19 = 0;
              do
              {
                uint64_t v20 = v19 + v16 * [(BKLibraryBookshelfUserBooksGridLayout *)self numColumns];
                if ((v20 & 0x8000000000000000) == 0 && v20 < (uint64_t)[v15 numBooks])
                {
                  double v21 = +[NSIndexPath indexPathForItem:v20 inSection:v11];
                  double v22 = [(BKLibraryBookshelfUserBooksGridLayout *)self layoutAttributesForItemAtIndexPath:v21];
                  [v22 frame];
                  v35.origin.CGFloat x = x;
                  v35.origin.CGFloat y = y;
                  v35.size.CGFloat width = width;
                  v35.size.CGFloat height = height;
                  if (CGRectIntersectsRect(v34, v35)) {
                    [v10 addObject:v22];
                  }
                }
                ++v19;
              }
              while (v19 < [(BKLibraryBookshelfUserBooksGridLayout *)self numColumns]);
            }
            BOOL v23 = v16++ == v18;
          }
          while (!v23);
        }

        BOOL v23 = v11++ == v28;
      }
      while (!v23);
    }
  }
  else
  {
    long long v24 = [(BKLibraryBookshelfUserBooksGridLayout *)self noBooksAttr];

    if (v24)
    {
      long long v25 = [(BKLibraryBookshelfUserBooksGridLayout *)self noBooksAttr];
      [v10 addObject:v25];
    }
  }

  return v10;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  double v6 = [v5 cellMetrics];
  double v7 = BUDynamicCast();

  double v8 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  double v9 = [v8 collectionView];

  double v10 = [v9 indexPathsForSelectedItems];
  unsigned int v11 = [v10 containsObject:v4];

  uint64_t v12 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  id v13 = [v12 editMode];

  unsigned int v14 = +[BKLibraryLayoutAttributes layoutAttributesForCellWithIndexPath:v4];
  [(BKLibraryBookshelfUserBooksGridLayout *)self _frameOfBookCellAtIndexPath:v4];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  [v14 setFrame:v16, v18, v20, v22];
  [v14 setCellMetrics:v7];
  BOOL v23 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  long long v24 = [v23 columnMetrics];
  [v14 setColumnMetrics:v24];

  [v14 setEditMode:v13];
  if (v13 && !v11)
  {
    [v7 dimmedScale];
    CGFloat v27 = v26;
    [v7 dimmedScale];
    CGAffineTransformMakeScale(&v32, v27, v28);
  }
  else
  {
    long long v25 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v32.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v32.c = v25;
    *(_OWORD *)&v32.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  CGAffineTransform v31 = v32;
  [v14 setTransform:&v31];
  double v29 = 1.0;
  if (((v13 ^ 1 | v11) & 1) == 0) {
    [v7 dimmedAlpha:1.0];
  }
  [v14 setAlpha:v29];

  return v14;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
  double v9 = [v8 bookHeaderMetrics];

  if ([v6 isEqualToString:off_100B20070])
  {
    id v10 = +[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v6 withIndexPath:v7];
    unsigned int v11 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
    [v10 setRtlLayout:[v11 rtlLayout]];

    [(BKLibraryBookshelfUserBooksGridLayout *)self _frameOfSectionHeaderAtIndexPath:v7];
    [v10 setFrame:];
    uint64_t v12 = [v9 headerFontAttributes];
    id v13 = [v12 attributes];
    [v10 setFontAttrs:v13];

    unsigned int v14 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
    double v15 = [v14 columnMetrics];
    [v10 setColumnMetrics:v15];

    double v16 = [(BKLibraryBookshelfUserBooksGridLayout *)self bookshelfLayout];
    double v17 = [v16 mainHeaderMetrics];
    [v10 setMainHeaderMetrics:v17];

    [v10 setFirstItem:[v7 section] == 0];
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

- (int64_t)numColumns
{
  return self->_numColumns;
}

- (void)setNumColumns:(int64_t)a3
{
  self->_numColumns = a3;
}

- (double)layoutWidth
{
  return self->_layoutWidth;
}

- (void)setLayoutWidth:(double)a3
{
  self->_layoutWidth = a3;
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

- (double)margins
{
  return self->_margins;
}

- (void)setMargins:(double)a3
{
  self->_margins = a3;
}

- (double)gutter
{
  return self->_gutter;
}

- (void)setGutter:(double)a3
{
  self->_gutter = a3;
}

- (double)vertical
{
  return self->_vertical;
}

- (void)setVertical:(double)a3
{
  self->_vertical = a3;
}

- (BOOL)hasSomeBooks
{
  return self->_hasSomeBooks;
}

- (void)setHasSomeBooks:(BOOL)a3
{
  self->_hasSomeBooks = a3;
}

- (BOOL)hideInfoBar
{
  return self->_hideInfoBar;
}

- (void)setHideInfoBar:(BOOL)a3
{
  self->_hideInfoBar = a3;
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