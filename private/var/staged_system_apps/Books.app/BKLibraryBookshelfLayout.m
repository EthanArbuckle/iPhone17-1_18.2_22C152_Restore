@interface BKLibraryBookshelfLayout
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
- (BKLibraryBookshelfActionBarMetrics)actionBarMetrics;
- (BKLibraryBookshelfBookHeaderMetrics)bookHeaderMetrics;
- (BKLibraryBookshelfBooksLayoutProtocol)booksLayout;
- (BKLibraryBookshelfCellMetrics)cellMetrics;
- (BKLibraryBookshelfColumnMetrics)columnMetrics;
- (BKLibraryBookshelfLayoutDelegate)delegate;
- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics;
- (BKLibraryBookshelfMeasuring)measuring;
- (BKLibraryBookshelfMetrics)metrics;
- (BKLibraryCollectionsListMetrics)collectionsListMetrics;
- (BKLibraryLayoutAttributes)collectionInfoFooterAttr;
- (BKLibraryLayoutAttributes)collectionsHeaderAttr;
- (BKLibraryLayoutAttributes)collectionsSeparatorLine;
- (BKLibraryLayoutAttributes)titleHeaderAttr;
- (BKLibraryLayoutAttributes)topSeparatorLine;
- (BOOL)allowOnlyVerticalDrags;
- (BOOL)coverAnimationRunningHack;
- (BOOL)editMode;
- (BOOL)editableCollection;
- (BOOL)hasSeriesSequenceLabel;
- (BOOL)hasSomeBooks;
- (BOOL)includeCollectionInfo;
- (BOOL)includeReadingListsButton;
- (BOOL)isInteractivelyReordering;
- (BOOL)isSupplementalContentPDFPicker;
- (BOOL)metricsHaveChanged;
- (BOOL)reorderableCollection;
- (BOOL)rtlLayout;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4;
- (BOOL)supportsReadingListsButton;
- (BOOL)titleEditable;
- (BOOL)titleShouldBeEditable;
- (BOOL)wantsSortControl;
- (BOOL)wantsStackedSortControl;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGRect)layoutBoundsForRTLAdjustment;
- (CGSize)collectionViewContentSize;
- (NSIndexPath)firstVisibleItemIndex;
- (NSMutableArray)deleteIndexPaths;
- (NSMutableArray)insertIndexPaths;
- (double)layoutAreaLeftMargin;
- (double)layoutAreaWidth;
- (double)layoutLeftMargin;
- (double)layoutWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (int64_t)booksAreaBottom;
- (int64_t)booksAreaTop;
- (int64_t)totalHeight;
- (int64_t)totalHeightExcludingFooter;
- (unint64_t)collectionType;
- (unint64_t)viewMode;
- (void)finalizeCollectionViewUpdates;
- (void)layoutCollectionInfoFooter;
- (void)layoutMainHeaderCollections;
- (void)layoutMainHeaderTitle;
- (void)layoutSeparatorLines;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareLayout;
- (void)setActionBarMetrics:(id)a3;
- (void)setBookHeaderMetrics:(id)a3;
- (void)setBooksAreaBottom:(int64_t)a3;
- (void)setBooksAreaTop:(int64_t)a3;
- (void)setBooksLayout:(id)a3;
- (void)setCellMetrics:(id)a3;
- (void)setCollectionInfoFooterAttr:(id)a3;
- (void)setCollectionType:(unint64_t)a3;
- (void)setCollectionsHeaderAttr:(id)a3;
- (void)setCollectionsListMetrics:(id)a3;
- (void)setCollectionsSeparatorLine:(id)a3;
- (void)setColumnMetrics:(id)a3;
- (void)setCoverAnimationRunningHack:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteIndexPaths:(id)a3;
- (void)setEditMode:(BOOL)a3;
- (void)setEditableCollection:(BOOL)a3;
- (void)setFirstVisibleItemIndex:(id)a3;
- (void)setIncludeCollectionInfo:(BOOL)a3;
- (void)setIncludeReadingListsButton:(BOOL)a3;
- (void)setInsertIndexPaths:(id)a3;
- (void)setIsInteractivelyReordering:(BOOL)a3;
- (void)setLayoutAreaLeftMargin:(double)a3;
- (void)setLayoutAreaWidth:(double)a3;
- (void)setLayoutLeftMargin:(double)a3;
- (void)setLayoutWidth:(double)a3;
- (void)setMainHeaderMetrics:(id)a3;
- (void)setMeasuring:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setMetricsHaveChanged:(BOOL)a3;
- (void)setReorderableCollection:(BOOL)a3;
- (void)setRtlLayout:(BOOL)a3;
- (void)setSupportsReadingListsButton:(BOOL)a3;
- (void)setTitleHeaderAttr:(id)a3;
- (void)setTopSeparatorLine:(id)a3;
- (void)setTotalHeight:(int64_t)a3;
- (void)setTotalHeightExcludingFooter:(int64_t)a3;
- (void)setViewMode:(unint64_t)a3;
- (void)setWantsSortControl:(BOOL)a3;
- (void)setWantsStackedSortControl:(BOOL)a3;
- (void)updateMetricsWithViewController:(id)a3;
@end

@implementation BKLibraryBookshelfLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(BKLibraryBookshelfLayout);
  v5 = [(BKLibraryBookshelfLayout *)self delegate];
  [(BKLibraryBookshelfLayout *)v4 setDelegate:v5];

  v6 = [(BKLibraryBookshelfLayout *)self measuring];
  [(BKLibraryBookshelfLayout *)v4 setMeasuring:v6];

  v7 = [(BKLibraryBookshelfLayout *)self metrics];
  [(BKLibraryBookshelfLayout *)v4 setMetrics:v7];

  v8 = [(BKLibraryBookshelfLayout *)self bookHeaderMetrics];
  [(BKLibraryBookshelfLayout *)v4 setBookHeaderMetrics:v8];

  v9 = [(BKLibraryBookshelfLayout *)self columnMetrics];
  [(BKLibraryBookshelfLayout *)v4 setColumnMetrics:v9];

  v10 = [(BKLibraryBookshelfLayout *)self mainHeaderMetrics];
  [(BKLibraryBookshelfLayout *)v4 setMainHeaderMetrics:v10];

  v11 = [(BKLibraryBookshelfLayout *)self cellMetrics];
  [(BKLibraryBookshelfLayout *)v4 setCellMetrics:v11];

  v12 = [(BKLibraryBookshelfLayout *)self actionBarMetrics];
  [(BKLibraryBookshelfLayout *)v4 setActionBarMetrics:v12];

  v13 = [(BKLibraryBookshelfLayout *)self collectionsListMetrics];
  [(BKLibraryBookshelfLayout *)v4 setCollectionsListMetrics:v13];

  [(BKLibraryBookshelfLayout *)v4 setCollectionType:[(BKLibraryBookshelfLayout *)self collectionType]];
  [(BKLibraryBookshelfLayout *)v4 setEditableCollection:[(BKLibraryBookshelfLayout *)self editableCollection]];
  [(BKLibraryBookshelfLayout *)v4 setReorderableCollection:[(BKLibraryBookshelfLayout *)self reorderableCollection]];
  [(BKLibraryBookshelfLayout *)v4 setSupportsReadingListsButton:[(BKLibraryBookshelfLayout *)self supportsReadingListsButton]];
  [(BKLibraryBookshelfLayout *)v4 setIncludeReadingListsButton:[(BKLibraryBookshelfLayout *)self includeReadingListsButton]];
  [(BKLibraryBookshelfLayout *)v4 setIncludeCollectionInfo:[(BKLibraryBookshelfLayout *)self includeCollectionInfo]];
  [(BKLibraryBookshelfLayout *)v4 setRtlLayout:[(BKLibraryBookshelfLayout *)self rtlLayout]];
  [(BKLibraryBookshelfLayout *)v4 setViewMode:[(BKLibraryBookshelfLayout *)self viewMode]];
  [(BKLibraryBookshelfLayout *)v4 setEditMode:[(BKLibraryBookshelfLayout *)self editMode]];
  [(BKLibraryBookshelfLayout *)v4 setWantsStackedSortControl:[(BKLibraryBookshelfLayout *)self wantsStackedSortControl]];
  [(BKLibraryBookshelfLayout *)v4 setWantsSortControl:[(BKLibraryBookshelfLayout *)self wantsSortControl]];
  [(BKLibraryBookshelfLayout *)v4 setIsInteractivelyReordering:[(BKLibraryBookshelfLayout *)self isInteractivelyReordering]];
  return v4;
}

- (BOOL)allowOnlyVerticalDrags
{
  v2 = [(BKLibraryBookshelfLayout *)self booksLayout];
  unsigned __int8 v3 = [v2 allowOnlyVerticalDrags];

  return v3;
}

- (void)setViewMode:(unint64_t)a3
{
  self->_viewMode = a3;
  [(BKLibraryBookshelfLayout *)self setBooksLayout:0];
  [(BKLibraryBookshelfLayout *)self setBookHeaderMetrics:0];
  [(BKLibraryBookshelfLayout *)self setColumnMetrics:0];
  [(BKLibraryBookshelfLayout *)self setMainHeaderMetrics:0];
  [(BKLibraryBookshelfLayout *)self setCellMetrics:0];
  [(BKLibraryBookshelfLayout *)self setActionBarMetrics:0];
  [(BKLibraryBookshelfLayout *)self setCollectionsListMetrics:0];
  id v4 = [(BKLibraryBookshelfLayout *)self metrics];
  [v4 invalidate];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(BKLibraryBookshelfLayout *)self collectionView];
  v9 = [v8 indexPathsForVisibleItems];
  v10 = [v9 sortedArrayUsingSelector:"compare:"];
  v11 = [v10 firstObject];
  [(BKLibraryBookshelfLayout *)self setFirstVisibleItemIndex:v11];

  [(BKLibraryBookshelfLayout *)self layoutWidth];
  if (v12 != width) {
    return 1;
  }
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookshelfLayout;
  return -[BKLibraryBookshelfLayout shouldInvalidateLayoutForBoundsChange:](&v14, "shouldInvalidateLayoutForBoundsChange:", x, y, width, height);
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryBookshelfLayout;
  return [(BKLibraryBookshelfLayout *)&v5 shouldInvalidateLayoutForPreferredLayoutAttributes:a3 withOriginalAttributes:a4];
}

- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryBookshelfLayout;
  id v4 = [(BKLibraryBookshelfLayout *)&v6 invalidationContextForPreferredLayoutAttributes:a3 withOriginalAttributes:a4];

  return v4;
}

- (BOOL)titleShouldBeEditable
{
  BOOL v3 = [(BKLibraryBookshelfLayout *)self editableCollection];
  if (v3)
  {
    LOBYTE(v3) = [(BKLibraryBookshelfLayout *)self editMode];
  }
  return v3;
}

- (void)layoutMainHeaderTitle
{
  if (![(BKLibraryBookshelfLayout *)self isInteractivelyReordering])
  {
    BOOL v3 = off_100B20050;
    id v4 = +[NSIndexPath indexPathWithIndex:0];
    objc_super v5 = +[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v3 withIndexPath:v4];
    [(BKLibraryBookshelfLayout *)self setTitleHeaderAttr:v5];

    objc_super v6 = [(BKLibraryBookshelfLayout *)self columnMetrics];
    [v6 margins];
    double v8 = v7;

    [(BKLibraryBookshelfLayout *)self layoutWidth];
    double v10 = v9 - v8;
    [(BKLibraryBookshelfLayout *)self layoutAreaLeftMargin];
    double v12 = v11;
    if ([(BKLibraryBookshelfLayout *)self isSupplementalContentPDFPicker]) {
      double v13 = 0.0;
    }
    else {
      double v13 = -1.0;
    }
    objc_super v14 = [(BKLibraryBookshelfLayout *)self titleHeaderAttr];
    [v14 setFrame:v12, v13, v10, 0.0];

    v15 = [(BKLibraryBookshelfLayout *)self mainHeaderMetrics];
    v16 = [(BKLibraryBookshelfLayout *)self titleHeaderAttr];
    [v16 setMainHeaderMetrics:v15];

    v17 = [(BKLibraryBookshelfLayout *)self columnMetrics];
    v18 = [(BKLibraryBookshelfLayout *)self titleHeaderAttr];
    [v18 setColumnMetrics:v17];

    BOOL v19 = [(BKLibraryBookshelfLayout *)self titleShouldBeEditable];
    v20 = [(BKLibraryBookshelfLayout *)self titleHeaderAttr];
    [v20 setEditable:v19];

    BOOL v21 = [(BKLibraryBookshelfLayout *)self editMode];
    v22 = [(BKLibraryBookshelfLayout *)self titleHeaderAttr];
    [v22 setEditMode:v21];

    id v24 = [(BKLibraryBookshelfLayout *)self measuring];
    v23 = [(BKLibraryBookshelfLayout *)self titleHeaderAttr];
    [v24 adjustHeight:v23];
  }
}

- (CGRect)layoutBoundsForRTLAdjustment
{
  [(BKLibraryBookshelfLayout *)self layoutLeftMargin];
  double v4 = v3;
  [(BKLibraryBookshelfLayout *)self layoutWidth];
  double v6 = v5;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = v4;
  result.size.double height = v8;
  result.size.double width = v6;
  result.origin.double y = v7;
  result.origin.double x = v9;
  return result;
}

- (void)layoutMainHeaderCollections
{
  if (![(BKLibraryBookshelfLayout *)self isInteractivelyReordering])
  {
    if ([(BKLibraryBookshelfLayout *)self includeReadingListsButton])
    {
      double v3 = off_100B20058;
      double v4 = +[NSIndexPath indexPathWithIndex:0];
      double v5 = +[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v3 withIndexPath:v4];
      [(BKLibraryBookshelfLayout *)self setCollectionsHeaderAttr:v5];

      double v6 = [(BKLibraryBookshelfLayout *)self titleHeaderAttr];
      [v6 frame];
      CGRectGetMaxY(v24);
      [(BKLibraryBookshelfLayout *)self layoutWidth];
      double v7 = [(BKLibraryBookshelfLayout *)self mainHeaderMetrics];
      [v7 readingListHeight];

      [(BKLibraryBookshelfLayout *)self rtlLayout];
      [(BKLibraryBookshelfLayout *)self layoutBoundsForRTLAdjustment];
      IMRectFlippedForRTL();
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      v16 = [(BKLibraryBookshelfLayout *)self collectionsHeaderAttr];
      [v16 setFrame:v9, v11, v13, v15];

      v17 = [(BKLibraryBookshelfLayout *)self mainHeaderMetrics];
      v18 = [(BKLibraryBookshelfLayout *)self collectionsHeaderAttr];
      [v18 setMainHeaderMetrics:v17];

      BOOL v19 = [(BKLibraryBookshelfLayout *)self columnMetrics];
      v20 = [(BKLibraryBookshelfLayout *)self collectionsHeaderAttr];
      [v20 setColumnMetrics:v19];

      BOOL v21 = [(BKLibraryBookshelfLayout *)self editMode];
      id v22 = [(BKLibraryBookshelfLayout *)self collectionsHeaderAttr];
      [v22 setEditMode:v21];
    }
    else
    {
      [(BKLibraryBookshelfLayout *)self setCollectionsHeaderAttr:0];
    }
  }
}

- (void)layoutSeparatorLines
{
  if (![(BKLibraryBookshelfLayout *)self isInteractivelyReordering])
  {
    double v3 = [(BKLibraryBookshelfLayout *)self titleHeaderAttr];
    [v3 frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    double v12 = off_100B20078;
    double v13 = +[NSIndexPath indexPathWithIndex:0];
    double v14 = +[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v12 withIndexPath:v13];
    [(BKLibraryBookshelfLayout *)self setTopSeparatorLine:v14];

    double v15 = [(BKLibraryBookshelfLayout *)self collectionsHeaderAttr];
    [v15 frame];

    [(BKLibraryBookshelfLayout *)self layoutAreaLeftMargin];
    [(BKLibraryBookshelfLayout *)self layoutAreaWidth];
    v57.origin.double x = v5;
    v57.origin.double y = v7;
    v57.size.double width = v9;
    v57.size.double height = v11;
    double Height = CGRectGetHeight(v57);
    if (Height > 0.0)
    {
      v58.origin.double x = v5;
      v58.origin.double y = v7;
      v58.size.double width = v9;
      v58.size.double height = v11;
      double Height = CGRectGetMaxY(v58);
    }
    v17 = [(BKLibraryBookshelfLayout *)self mainHeaderMetrics];
    v18 = [v17 separatorLineColor];
    BOOL v19 = [(BKLibraryBookshelfLayout *)self topSeparatorLine];
    [v19 setForegroundColor:v18];

    [(BKLibraryBookshelfLayout *)self rtlLayout];
    [(BKLibraryBookshelfLayout *)self layoutBoundsForRTLAdjustment];
    IMRectFlippedForRTL();
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = [(BKLibraryBookshelfLayout *)self topSeparatorLine];
    [v28 setFrame:v21, v23, v25, v27];

    v29 = [(BKLibraryBookshelfLayout *)self topSeparatorLine];
    [v29 setZIndex:1];

    v30 = [(BKLibraryBookshelfLayout *)self collectionsHeaderAttr];

    if (v30)
    {
      v31 = off_100B20080;
      v32 = +[NSIndexPath indexPathWithIndex:0];
      v33 = +[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v31 withIndexPath:v32];
      [(BKLibraryBookshelfLayout *)self setCollectionsSeparatorLine:v33];

      v34 = [(BKLibraryBookshelfLayout *)self collectionsHeaderAttr];
      [v34 frame];
      CGFloat v36 = v35;
      CGFloat v38 = v37;
      CGFloat v40 = v39;
      CGFloat v42 = v41;

      v59.origin.double x = v36;
      v59.origin.double y = v38;
      v59.size.double width = v40;
      v59.size.double height = v42;
      CGRectGetMaxY(v59);
      [(BKLibraryBookshelfLayout *)self layoutAreaLeftMargin];
      [(BKLibraryBookshelfLayout *)self layoutAreaWidth];
      v43 = [(BKLibraryBookshelfLayout *)self mainHeaderMetrics];
      v44 = [v43 separatorLineColor];
      v45 = [(BKLibraryBookshelfLayout *)self collectionsSeparatorLine];
      [v45 setForegroundColor:v44];

      v46 = [(BKLibraryBookshelfLayout *)self collectionsSeparatorLine];
      [v46 setZIndex:1];

      [(BKLibraryBookshelfLayout *)self rtlLayout];
      [(BKLibraryBookshelfLayout *)self layoutBoundsForRTLAdjustment];
      IMRectFlippedForRTL();
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      id v55 = [(BKLibraryBookshelfLayout *)self collectionsSeparatorLine];
      [v55 setFrame:v48, v50, v52, v54];
    }
    else
    {
      [(BKLibraryBookshelfLayout *)self setCollectionsSeparatorLine:0];
    }
  }
}

- (void)layoutCollectionInfoFooter
{
  if (![(BKLibraryBookshelfLayout *)self isInteractivelyReordering])
  {
    if ([(BKLibraryBookshelfLayout *)self includeCollectionInfo]
      && [(BKLibraryBookshelfLayout *)self shouldAllowHeaders]
      && ![(BKLibraryBookshelfLayout *)self editMode])
    {
      double v3 = off_100B20060;
      double v4 = +[NSIndexPath indexPathWithIndex:0];
      CGFloat v5 = +[BKLibraryLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v3 withIndexPath:v4];
      [(BKLibraryBookshelfLayout *)self setCollectionInfoFooterAttr:v5];

      [(BKLibraryBookshelfLayout *)self layoutAreaWidth];
      double v6 = (double)[(BKLibraryBookshelfLayout *)self totalHeightExcludingFooter];
      CGFloat v7 = [(BKLibraryBookshelfLayout *)self collectionView];
      [v7 bounds];
      double v9 = v8;
      double v10 = [(BKLibraryBookshelfLayout *)self collectionView];
      [v10 safeAreaInsets];
      double v12 = v9 - v11;
      double v13 = [(BKLibraryBookshelfLayout *)self collectionView];
      [v13 adjustedContentInset];
      if (v12 - v14 < v6)
      {
        double v23 = (double)[(BKLibraryBookshelfLayout *)self totalHeightExcludingFooter];
      }
      else
      {
        double v15 = [(BKLibraryBookshelfLayout *)self collectionView];
        [v15 bounds];
        double v17 = v16;
        v18 = [(BKLibraryBookshelfLayout *)self collectionView];
        [v18 safeAreaInsets];
        double v20 = v17 - v19;
        double v21 = [(BKLibraryBookshelfLayout *)self collectionView];
        [v21 adjustedContentInset];
        double v23 = v20 - v22;
      }
      [(BKLibraryBookshelfLayout *)self layoutAreaLeftMargin];
      [(BKLibraryBookshelfLayout *)self rtlLayout];
      [(BKLibraryBookshelfLayout *)self layoutBoundsForRTLAdjustment];
      IMRectFlippedForRTL();
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      v32 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];
      [v32 setFrame:v25, v27, v29, v31];

      v33 = [(BKLibraryBookshelfLayout *)self mainHeaderMetrics];
      v34 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];
      [v34 setMainHeaderMetrics:v33];

      double v35 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];
      [v35 setZIndex:-2];

      CGFloat v36 = [(BKLibraryBookshelfLayout *)self measuring];
      double v37 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];
      [v36 adjustHeight:v37];

      if (v23 != (double)[(BKLibraryBookshelfLayout *)self totalHeightExcludingFooter])
      {
        CGFloat v38 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];
        [v38 frame];
        double v40 = v39;
        double v42 = v41;
        double v44 = v43;
        double v46 = v45;

        double v47 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];
        [v47 setFrame:v40, v42 - v46, v44, v46];
      }
      double v48 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];
      [v48 frame];
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      double v56 = v55;

      id v57 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];
      [v57 setFrame:v50, v52 + -11.0, v54, v56];
    }
    else
    {
      [(BKLibraryBookshelfLayout *)self setCollectionInfoFooterAttr:0];
    }
  }
}

- (void)prepareLayout
{
  v35.receiver = self;
  v35.super_class = (Class)BKLibraryBookshelfLayout;
  [(BKLibraryBookshelfLayout *)&v35 prepareLayout];
  double v3 = +[UIApplication sharedApplication];
  -[BKLibraryBookshelfLayout setRtlLayout:](self, "setRtlLayout:", [v3 userInterfaceLayoutDirection] == (id)1);

  double v4 = [(BKLibraryBookshelfLayout *)self booksLayout];

  if (!v4)
  {
    unint64_t v5 = [(BKLibraryBookshelfLayout *)self collectionType] - 1;
    if (v5 >= 3)
    {
      unint64_t v7 = [(BKLibraryBookshelfLayout *)self viewMode];
      double v6 = off_100A3C028;
      if (v7 == 2) {
        double v6 = &off_100A3C030;
      }
    }
    else
    {
      double v6 = (&off_100A49058)[v5];
    }
    id v8 = [objc_alloc(*v6) initWithLayout:self];
    [(BKLibraryBookshelfLayout *)self setBooksLayout:v8];
  }
  double v9 = [(BKLibraryBookshelfLayout *)self collectionView];
  [v9 bounds];
  double v11 = v10;

  double v12 = [(BKLibraryBookshelfLayout *)self columnMetrics];
  [v12 margins];
  double v14 = v13;

  [(BKLibraryBookshelfLayout *)self setLayoutWidth:v11];
  double Height = 0.0;
  [(BKLibraryBookshelfLayout *)self setLayoutLeftMargin:0.0];
  [(BKLibraryBookshelfLayout *)self setLayoutAreaLeftMargin:v14 + 0.0];
  [(BKLibraryBookshelfLayout *)self layoutWidth];
  [(BKLibraryBookshelfLayout *)self setLayoutAreaWidth:v16 + v14 * -2.0];
  [(BKLibraryBookshelfLayout *)self layoutMainHeaderTitle];
  [(BKLibraryBookshelfLayout *)self layoutMainHeaderCollections];
  [(BKLibraryBookshelfLayout *)self layoutSeparatorLines];
  if ([(BKLibraryBookshelfLayout *)self shouldAllowHeaders])
  {
    if ((id)[(BKLibraryBookshelfLayout *)self viewMode] != (id)2
      || (id)[(BKLibraryBookshelfLayout *)self collectionType] == (id)2)
    {
      double v17 = [(BKLibraryBookshelfLayout *)self bookHeaderMetrics];
      [v17 topMargin];
      double Height = v18;
    }
    double v19 = [(BKLibraryBookshelfLayout *)self collectionsHeaderAttr];

    if (v19) {
      [(BKLibraryBookshelfLayout *)self collectionsHeaderAttr];
    }
    else {
    double v25 = [(BKLibraryBookshelfLayout *)self titleHeaderAttr];
    }
    [v25 frame];
    double MaxY = CGRectGetMaxY(v38);

    [(BKLibraryBookshelfLayout *)self setBooksAreaTop:(uint64_t)(Height + MaxY)];
  }
  else
  {
    if ([(BKLibraryBookshelfLayout *)self includeReadingListsButton])
    {
      double v20 = [(BKLibraryBookshelfLayout *)self collectionsHeaderAttr];
      [v20 frame];
      double Height = CGRectGetHeight(v36);
    }
    double v21 = [(BKLibraryBookshelfLayout *)self bookHeaderMetrics];
    [v21 topMargin];
    double v23 = v22;
    double v24 = [(BKLibraryBookshelfLayout *)self titleHeaderAttr];
    [v24 frame];
    [(BKLibraryBookshelfLayout *)self setBooksAreaTop:(uint64_t)(Height + v23 + CGRectGetMaxY(v37))];
  }
  double v27 = [(BKLibraryBookshelfLayout *)self booksLayout];
  [v27 prepareLayoutForBooksSection:-[BKLibraryBookshelfLayout booksAreaTop]];
  [(BKLibraryBookshelfLayout *)self setTotalHeightExcludingFooter:(uint64_t)v28];

  [(BKLibraryBookshelfLayout *)self layoutCollectionInfoFooter];
  double v29 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];

  if (v29)
  {
    double v30 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];
    [v30 frame];
    [(BKLibraryBookshelfLayout *)self setBooksAreaBottom:(uint64_t)CGRectGetMinY(v39)];

    double v31 = (double)[(BKLibraryBookshelfLayout *)self totalHeightExcludingFooter];
    v32 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];
    [v32 bounds];
    [(BKLibraryBookshelfLayout *)self setTotalHeight:(uint64_t)(v33 + v31)];
  }
  else
  {
    [(BKLibraryBookshelfLayout *)self setTotalHeight:[(BKLibraryBookshelfLayout *)self totalHeightExcludingFooter]];
  }
  v34 = [(BKLibraryBookshelfLayout *)self delegate];
  [v34 didUpdateLibraryBookshelfLayout:self];

  [(BKLibraryBookshelfLayout *)self setMetricsHaveChanged:0];
}

- (void)updateMetricsWithViewController:(id)a3
{
  id v32 = a3;
  double v4 = [v32 viewIfLoaded];
  unint64_t v5 = [v4 traitCollection];
  uint64_t v6 = [v4 window];
  unint64_t v7 = (void *)v6;
  if (v4 && v5 && v6)
  {
    id v8 = objc_alloc((Class)TUIEnvironment);
    [v4 bounds];
    double v10 = v9;
    double v12 = v11;
    [v7 bounds];
    id v13 = [v8 initWithTraitCollection:v5 viewController:v32 viewSize:v10 windowSize:v12];
    if ((id)[(BKLibraryBookshelfLayout *)self viewMode] == (id)2) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }
    double v15 = [(BKLibraryBookshelfLayout *)self metrics];
    unsigned int v16 = [v15 updateIfNeededWithEnvironment:v13 bookshelfLayoutMode:v14 editMode:[self editMode] isPopover:0];

    if (v16)
    {
      double v17 = [(BKLibraryBookshelfLayout *)self metrics];
      double v18 = [v17 computedMetrics];

      double v19 = +[BKLibraryBookshelfBookHeaderMetrics sectionName];
      double v20 = [v18 objectForKey:v19];
      [(BKLibraryBookshelfLayout *)self setBookHeaderMetrics:v20];

      double v21 = +[BKLibraryBookshelfColumnMetrics sectionName];
      double v22 = [v18 objectForKey:v21];
      [(BKLibraryBookshelfLayout *)self setColumnMetrics:v22];

      double v23 = +[BKLibraryBookshelfMainHeaderMetrics sectionName];
      double v24 = [v18 objectForKey:v23];
      [(BKLibraryBookshelfLayout *)self setMainHeaderMetrics:v24];

      double v25 = +[BKLibraryBookshelfCellMetrics sectionNameForCollectionType:[(BKLibraryBookshelfLayout *)self collectionType] layoutMode:v14];
      double v26 = [v18 objectForKey:v25];
      [(BKLibraryBookshelfLayout *)self setCellMetrics:v26];

      double v27 = +[BKLibraryBookshelfActionBarMetrics sectionName];
      double v28 = [v18 objectForKey:v27];
      [(BKLibraryBookshelfLayout *)self setActionBarMetrics:v28];

      double v29 = +[BKLibraryCollectionsListMetrics sectionName];
      double v30 = [v18 objectForKey:v29];
      [(BKLibraryBookshelfLayout *)self setCollectionsListMetrics:v30];

      if ([(BKLibraryBookshelfLayout *)self supportsReadingListsButton]) {
        BOOL v31 = [v13 widthClass] == (id)1;
      }
      else {
        BOOL v31 = 0;
      }
      [(BKLibraryBookshelfLayout *)self setIncludeReadingListsButton:v31];
      [(BKLibraryBookshelfLayout *)self setMetricsHaveChanged:1];
      [(BKLibraryBookshelfLayout *)self invalidateLayout];
    }
  }
}

- (void)setEditMode:(BOOL)a3
{
  if (self->_editMode != a3)
  {
    self->_editMode = a3;
    [(BKLibraryBookshelfLayout *)self invalidateLayout];
  }
}

- (CGSize)collectionViewContentSize
{
  double v3 = [(BKLibraryBookshelfLayout *)self collectionView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v23.origin.double x = v5;
  v23.origin.double y = v7;
  v23.size.double width = v9;
  v23.size.double height = v11;
  CGFloat Width = CGRectGetWidth(v23);
  v24.origin.double x = v5;
  v24.origin.double y = v7;
  v24.size.double width = v9;
  v24.size.double height = v11;
  double Height = CGRectGetHeight(v24);
  uint64_t v14 = [(BKLibraryBookshelfLayout *)self collectionView];
  [v14 adjustedContentInset];
  double v16 = Height - v15;
  double v17 = [(BKLibraryBookshelfLayout *)self collectionView];
  [v17 adjustedContentInset];
  double v19 = v16 - v18;

  if (v19 < (double)[(BKLibraryBookshelfLayout *)self totalHeight]) {
    double v19 = (double)[(BKLibraryBookshelfLayout *)self totalHeight];
  }
  double v20 = Width;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = +[NSMutableArray array];
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  double MinY = CGRectGetMinY(v29);
  if (MinY < (double)[(BKLibraryBookshelfLayout *)self booksAreaTop])
  {
    double v10 = [(BKLibraryBookshelfLayout *)self titleHeaderAttr];
    [v8 addObject:v10];

    uint64_t v11 = [(BKLibraryBookshelfLayout *)self topSeparatorLine];
    if (v11)
    {
      double v12 = (void *)v11;
      id v13 = [(BKLibraryBookshelfLayout *)self delegate];
      uint64_t v14 = [v13 dataSourceAdaptor];
      double v15 = [v14 supplementaryDataSource];
      unsigned __int8 v16 = [v15 hideTopSeparatorLine];

      if ((v16 & 1) == 0)
      {
        double v17 = [(BKLibraryBookshelfLayout *)self topSeparatorLine];
        [v8 addObject:v17];
      }
    }
    if ([(BKLibraryBookshelfLayout *)self includeReadingListsButton])
    {
      double v18 = [(BKLibraryBookshelfLayout *)self collectionsHeaderAttr];
      [v8 addObject:v18];
    }
    double v19 = [(BKLibraryBookshelfLayout *)self collectionsSeparatorLine];

    if (v19)
    {
      double v20 = [(BKLibraryBookshelfLayout *)self collectionsSeparatorLine];
      [v8 addObject:v20];
    }
  }
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  double MaxY = CGRectGetMaxY(v30);
  if (MaxY > (double)[(BKLibraryBookshelfLayout *)self booksAreaTop])
  {
    double v22 = [(BKLibraryBookshelfLayout *)self booksLayout];
    CGRect v23 = [v22 layoutAttributesForBooksInRect:x, y, width, height];

    [v8 addObjectsFromArray:v23];
  }
  v31.origin.double x = x;
  v31.origin.double y = y;
  v31.size.double width = width;
  v31.size.double height = height;
  double v24 = CGRectGetMaxY(v31);
  if (v24 > (double)[(BKLibraryBookshelfLayout *)self booksAreaBottom])
  {
    if ([(BKLibraryBookshelfLayout *)self shouldAllowHeaders])
    {
      if ([(BKLibraryBookshelfLayout *)self includeCollectionInfo])
      {
        double v25 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];

        if (v25)
        {
          double v26 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];
          [v8 addObject:v26];
        }
      }
    }
  }

  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(BKLibraryBookshelfLayout *)self booksLayout];
  double v6 = [v5 layoutAttributesForItemAtIndexPath:v4];

  return v6;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section]
    || [v7 item] != (id)0x7FFFFFFFFFFFFFFFLL
    || ([v6 isEqualToString:off_100B20070] & 1) != 0)
  {
    double v8 = [(BKLibraryBookshelfLayout *)self booksLayout];
    CGFloat v9 = [v8 layoutAttributesForSupplementaryViewOfKind:v6 atIndexPath:v7];

    goto LABEL_5;
  }
  if ([v6 isEqualToString:off_100B20050])
  {
    [(BKLibraryBookshelfLayout *)self layoutMainHeaderTitle];
    uint64_t v11 = [(BKLibraryBookshelfLayout *)self titleHeaderAttr];
LABEL_23:
    CGFloat v9 = (void *)v11;
    goto LABEL_5;
  }
  if ([v6 isEqualToString:off_100B20058])
  {
    [(BKLibraryBookshelfLayout *)self layoutMainHeaderTitle];
    [(BKLibraryBookshelfLayout *)self layoutMainHeaderCollections];
    uint64_t v11 = [(BKLibraryBookshelfLayout *)self collectionsHeaderAttr];
    goto LABEL_23;
  }
  if ([v6 isEqualToString:off_100B20060])
  {
    [(BKLibraryBookshelfLayout *)self layoutMainHeaderTitle];
    [(BKLibraryBookshelfLayout *)self layoutMainHeaderCollections];
    [(BKLibraryBookshelfLayout *)self layoutCollectionInfoFooter];
    uint64_t v11 = [(BKLibraryBookshelfLayout *)self collectionInfoFooterAttr];
    goto LABEL_23;
  }
  if (([v6 isEqualToString:off_100B20068] & 1) == 0)
  {
    if ([v6 isEqualToString:off_100B20078])
    {
      if (![(BKLibraryBookshelfLayout *)self isInteractivelyReordering])
      {
        [(BKLibraryBookshelfLayout *)self layoutMainHeaderTitle];
        [(BKLibraryBookshelfLayout *)self layoutMainHeaderCollections];
        [(BKLibraryBookshelfLayout *)self layoutSeparatorLines];
      }
      uint64_t v11 = [(BKLibraryBookshelfLayout *)self topSeparatorLine];
      goto LABEL_23;
    }
    if ([v6 isEqualToString:off_100B20080])
    {
      if (![(BKLibraryBookshelfLayout *)self isInteractivelyReordering])
      {
        [(BKLibraryBookshelfLayout *)self layoutMainHeaderTitle];
        [(BKLibraryBookshelfLayout *)self layoutMainHeaderCollections];
        [(BKLibraryBookshelfLayout *)self layoutSeparatorLines];
      }
      uint64_t v11 = [(BKLibraryBookshelfLayout *)self collectionsSeparatorLine];
      goto LABEL_23;
    }
  }
  CGFloat v9 = 0;
LABEL_5:

  return v9;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return 0;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4 = a3;
  CGFloat v5 = +[NSMutableArray array];
  [(BKLibraryBookshelfLayout *)self setDeleteIndexPaths:v5];

  id v6 = +[NSMutableArray array];
  [(BKLibraryBookshelfLayout *)self setInsertIndexPaths:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "updateAction", (void)v16) == (id)1)
        {
          id v13 = [(BKLibraryBookshelfLayout *)self deleteIndexPaths];
          uint64_t v14 = [v12 indexPathBeforeUpdate];
        }
        else
        {
          if ([v12 updateAction]) {
            continue;
          }
          id v13 = [(BKLibraryBookshelfLayout *)self insertIndexPaths];
          uint64_t v14 = [v12 indexPathAfterUpdate];
        }
        double v15 = (void *)v14;
        [v13 addObject:v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)finalizeCollectionViewUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookshelfLayout;
  [(BKLibraryBookshelfLayout *)&v3 finalizeCollectionViewUpdates];
  [(BKLibraryBookshelfLayout *)self setDeleteIndexPaths:0];
  [(BKLibraryBookshelfLayout *)self setInsertIndexPaths:0];
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryBookshelfLayout;
  id v4 = a3;
  CGFloat v5 = [(BKLibraryBookshelfLayout *)&v9 initialLayoutAttributesForAppearingItemAtIndexPath:v4];
  id v6 = [(BKLibraryBookshelfLayout *)self insertIndexPaths];
  unsigned int v7 = [v6 containsObject:v4];

  if (v7) {
    [v5 setAlpha:0.0];
  }

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryBookshelfLayout;
  id v4 = a3;
  CGFloat v5 = [(BKLibraryBookshelfLayout *)&v9 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
  id v6 = [(BKLibraryBookshelfLayout *)self deleteIndexPaths];
  unsigned int v7 = [v6 containsObject:v4];

  if (v7) {
    [v5 setAlpha:0.0];
  }

  return v5;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(BKLibraryBookshelfLayout *)self coverAnimationRunningHack])
  {
    uint64_t v8 = [(BKLibraryBookshelfLayout *)self firstVisibleItemIndex];
    if (v8)
    {
      objc_super v9 = (void *)v8;
      uint64_t v10 = [(BKLibraryBookshelfLayout *)self collectionView];
      if (([v10 isDecelerating] & 1) == 0
        && ![(BKLibraryBookshelfLayout *)self isInteractivelyReordering])
      {
        uint64_t v11 = [(BKLibraryBookshelfLayout *)self collectionView];
        if (![v11 hasActiveDrag])
        {
          double v12 = [(BKLibraryBookshelfLayout *)self collectionView];
          unsigned __int8 v13 = [v12 hasActiveDrop];

          if ((v13 & 1) == 0)
          {
            uint64_t v14 = [(BKLibraryBookshelfLayout *)self collectionView];
            [v14 bounds];
            double v16 = v15;

            long long v17 = [(BKLibraryBookshelfLayout *)self firstVisibleItemIndex];
            long long v18 = [(BKLibraryBookshelfLayout *)self layoutAttributesForItemAtIndexPath:v17];
            [v18 frame];
            double MinY = CGRectGetMinY(v23);

            if (y > v16 || MinY > v16)
            {
              [(BKLibraryBookshelfLayout *)self setFirstVisibleItemIndex:0];
              double y = MinY;
            }
          }
          goto LABEL_9;
        }
      }
    }
LABEL_9:
    -[BKLibraryBookshelfLayout targetContentOffsetForProposedContentOffset:](&v20, "targetContentOffsetForProposedContentOffset:", x, y, self, BKLibraryBookshelfLayout, v21.receiver, v21.super_class);
    goto LABEL_14;
  }
  -[BKLibraryBookshelfLayout targetContentOffsetForProposedContentOffset:](&v21, "targetContentOffsetForProposedContentOffset:", x, y, v20.receiver, v20.super_class, self, BKLibraryBookshelfLayout);
LABEL_14:
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (BOOL)hasSomeBooks
{
  v2 = [(BKLibraryBookshelfLayout *)self collectionView];
  uint64_t v3 = (uint64_t)[v2 numberOfSections];
  BOOL v4 = v3 >= 1 && (v3 != 1 || (uint64_t)[v2 numberOfItemsInSection:0] > 0);

  return v4;
}

- (BOOL)hasSeriesSequenceLabel
{
  v2 = [(BKLibraryBookshelfLayout *)self delegate];
  uint64_t v3 = [v2 dataSourceAdaptor];
  BOOL v4 = [v3 booksDataSource];
  unsigned __int8 v5 = [v4 hasSeriesSequenceLabel];

  return v5;
}

- (BOOL)isSupplementalContentPDFPicker
{
  v2 = [(BKLibraryBookshelfLayout *)self delegate];
  uint64_t v3 = [v2 dataSourceAdaptor];
  BOOL v4 = [v3 supplementaryDataSource];
  unsigned __int8 v5 = [v4 supplementalContentPDFPicker];

  return v5;
}

- (BKLibraryBookshelfLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKLibraryBookshelfLayoutDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BKLibraryBookshelfMeasuring)measuring
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_measuring);

  return (BKLibraryBookshelfMeasuring *)WeakRetained;
}

- (void)setMeasuring:(id)a3
{
}

- (BKLibraryBookshelfMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (BKLibraryBookshelfBookHeaderMetrics)bookHeaderMetrics
{
  return self->_bookHeaderMetrics;
}

- (void)setBookHeaderMetrics:(id)a3
{
}

- (BKLibraryBookshelfColumnMetrics)columnMetrics
{
  return self->_columnMetrics;
}

- (void)setColumnMetrics:(id)a3
{
}

- (BKLibraryBookshelfMainHeaderMetrics)mainHeaderMetrics
{
  return self->_mainHeaderMetrics;
}

- (void)setMainHeaderMetrics:(id)a3
{
}

- (BKLibraryBookshelfCellMetrics)cellMetrics
{
  return self->_cellMetrics;
}

- (void)setCellMetrics:(id)a3
{
}

- (BKLibraryBookshelfActionBarMetrics)actionBarMetrics
{
  return self->_actionBarMetrics;
}

- (void)setActionBarMetrics:(id)a3
{
}

- (BKLibraryCollectionsListMetrics)collectionsListMetrics
{
  return self->_collectionsListMetrics;
}

- (void)setCollectionsListMetrics:(id)a3
{
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (void)setCollectionType:(unint64_t)a3
{
  self->_collectionType = a3;
}

- (BOOL)editableCollection
{
  return self->_editableCollection;
}

- (void)setEditableCollection:(BOOL)a3
{
  self->_editableCollection = a3;
}

- (BOOL)reorderableCollection
{
  return self->_reorderableCollection;
}

- (void)setReorderableCollection:(BOOL)a3
{
  self->_reorderableCollection = a3;
}

- (BOOL)supportsReadingListsButton
{
  return self->_supportsReadingListsButton;
}

- (void)setSupportsReadingListsButton:(BOOL)a3
{
  self->_supportsReadingListsButton = a3;
}

- (BOOL)includeReadingListsButton
{
  return self->_includeReadingListsButton;
}

- (void)setIncludeReadingListsButton:(BOOL)a3
{
  self->_includeReadingListsButton = a3;
}

- (BOOL)includeCollectionInfo
{
  return self->_includeCollectionInfo;
}

- (void)setIncludeCollectionInfo:(BOOL)a3
{
  self->_includeCollectionInfo = a3;
}

- (BOOL)rtlLayout
{
  return self->_rtlLayout;
}

- (void)setRtlLayout:(BOOL)a3
{
  self->_rtlLayout = a3;
}

- (unint64_t)viewMode
{
  return self->_viewMode;
}

- (BOOL)editMode
{
  return self->_editMode;
}

- (BOOL)wantsStackedSortControl
{
  return self->_wantsStackedSortControl;
}

- (void)setWantsStackedSortControl:(BOOL)a3
{
  self->_wantsStackedSortControl = a3;
}

- (BOOL)wantsSortControl
{
  return self->_wantsSortControl;
}

- (void)setWantsSortControl:(BOOL)a3
{
  self->_wantsSortControl = a3;
}

- (BOOL)isInteractivelyReordering
{
  return self->_isInteractivelyReordering;
}

- (void)setIsInteractivelyReordering:(BOOL)a3
{
  self->_isInteractivelyReordering = a3;
}

- (BOOL)titleEditable
{
  return self->_titleEditable;
}

- (BOOL)metricsHaveChanged
{
  return self->_metricsHaveChanged;
}

- (void)setMetricsHaveChanged:(BOOL)a3
{
  self->_metricsHaveChanged = a3;
}

- (BOOL)coverAnimationRunningHack
{
  return self->_coverAnimationRunningHack;
}

- (void)setCoverAnimationRunningHack:(BOOL)a3
{
  self->_coverAnimationRunningHack = a3;
}

- (int64_t)booksAreaTop
{
  return self->_booksAreaTop;
}

- (void)setBooksAreaTop:(int64_t)a3
{
  self->_booksAreaTop = a3;
}

- (int64_t)booksAreaBottom
{
  return self->_booksAreaBottom;
}

- (void)setBooksAreaBottom:(int64_t)a3
{
  self->_booksAreaBottom = a3;
}

- (int64_t)totalHeight
{
  return self->_totalHeight;
}

- (void)setTotalHeight:(int64_t)a3
{
  self->_totaldouble Height = a3;
}

- (int64_t)totalHeightExcludingFooter
{
  return self->_totalHeightExcludingFooter;
}

- (void)setTotalHeightExcludingFooter:(int64_t)a3
{
  self->_totalHeightExcludingFooter = a3;
}

- (double)layoutWidth
{
  return self->_layoutWidth;
}

- (void)setLayoutWidth:(double)a3
{
  self->_layoutCGFloat Width = a3;
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
  self->_layoutAreaCGFloat Width = a3;
}

- (NSIndexPath)firstVisibleItemIndex
{
  return self->_firstVisibleItemIndex;
}

- (void)setFirstVisibleItemIndex:(id)a3
{
}

- (BKLibraryBookshelfBooksLayoutProtocol)booksLayout
{
  return self->_booksLayout;
}

- (void)setBooksLayout:(id)a3
{
}

- (BKLibraryLayoutAttributes)titleHeaderAttr
{
  return self->_titleHeaderAttr;
}

- (void)setTitleHeaderAttr:(id)a3
{
}

- (BKLibraryLayoutAttributes)collectionsHeaderAttr
{
  return self->_collectionsHeaderAttr;
}

- (void)setCollectionsHeaderAttr:(id)a3
{
}

- (BKLibraryLayoutAttributes)collectionInfoFooterAttr
{
  return self->_collectionInfoFooterAttr;
}

- (void)setCollectionInfoFooterAttr:(id)a3
{
}

- (BKLibraryLayoutAttributes)topSeparatorLine
{
  return self->_topSeparatorLine;
}

- (void)setTopSeparatorLine:(id)a3
{
}

- (BKLibraryLayoutAttributes)collectionsSeparatorLine
{
  return self->_collectionsSeparatorLine;
}

- (void)setCollectionsSeparatorLine:(id)a3
{
}

- (NSMutableArray)deleteIndexPaths
{
  return self->_deleteIndexPaths;
}

- (void)setDeleteIndexPaths:(id)a3
{
}

- (NSMutableArray)insertIndexPaths
{
  return self->_insertIndexPaths;
}

- (void)setInsertIndexPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertIndexPaths, 0);
  objc_storeStrong((id *)&self->_deleteIndexPaths, 0);
  objc_storeStrong((id *)&self->_collectionsSeparatorLine, 0);
  objc_storeStrong((id *)&self->_topSeparatorLine, 0);
  objc_storeStrong((id *)&self->_collectionInfoFooterAttr, 0);
  objc_storeStrong((id *)&self->_collectionsHeaderAttr, 0);
  objc_storeStrong((id *)&self->_titleHeaderAttr, 0);
  objc_storeStrong((id *)&self->_booksLayout, 0);
  objc_storeStrong((id *)&self->_firstVisibleItemIndex, 0);
  objc_storeStrong((id *)&self->_collectionsListMetrics, 0);
  objc_storeStrong((id *)&self->_actionBarMetrics, 0);
  objc_storeStrong((id *)&self->_cellMetrics, 0);
  objc_storeStrong((id *)&self->_mainHeaderMetrics, 0);
  objc_storeStrong((id *)&self->_columnMetrics, 0);
  objc_storeStrong((id *)&self->_bookHeaderMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_measuring);

  objc_destroyWeak((id *)&self->_delegate);
}

@end