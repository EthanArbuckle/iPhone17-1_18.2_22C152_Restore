@interface UICalendarView
+ (NSCopying)visualStyleRegistryIdentity;
- (BOOL)_canSelectItemAtIndexPath:(id)a3 forSelection:(BOOL)a4;
- (BOOL)_hasCellDecorations;
- (BOOL)_shouldUpdateDateViewForVisibleMonth:(id)a3;
- (BOOL)allowsMultipleSelection;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)wantsDateDecorations;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (NSCalendar)calendar;
- (NSDateComponents)visibleDateComponents;
- (NSDateInterval)availableDateRange;
- (NSLocale)locale;
- (NSTimeZone)timeZone;
- (UICalendarSelection)selectionBehavior;
- (UICalendarView)initWithCoder:(id)a3;
- (UICalendarView)initWithFrame:(CGRect)a3;
- (UICollectionView)collectionView;
- (UIFontDescriptorSystemDesign)fontDesign;
- (UIView)contentView;
- (_UICalendarHeaderView)headerView;
- (_UICalendarViewDecorationSystem)decorationSystem;
- (_UICalendarWeekdayView)weekdayView;
- (double)__dayAndWeekdayLabelWidth;
- (double)_preferredCollectionViewHeightForWidth:(double)a3;
- (id)_configuedCellForCollectionView:(id)a3 indexPath:(id)a4 day:(id)a5;
- (id)_contentSizeCategoryForContentWidth:(double)a3;
- (id)_dataModel;
- (id)_delegateDecorationForDay:(id)a3;
- (id)delegate;
- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize;
- (unint64_t)_selectionRoundedEdgeForDay:(id)a3;
- (void)_cleanupDataIfNecessary;
- (void)_configureMonthYearSelector;
- (void)_deselectDates:(id)a3 animated:(BOOL)a4;
- (void)_destroyMonthYearSelector;
- (void)_freezeContentOffset;
- (void)_performIfNotIgnoringScrollCallbacks:(id)a3;
- (void)_performIgnoringScrollCallbacks:(id)a3;
- (void)_reconfigureVisibleItems;
- (void)_reloadCollectionViewLayout;
- (void)_reloadDataSourceController;
- (void)_reloadDateFormatters;
- (void)_reloadEverythingIncludingLayout:(BOOL)a3;
- (void)_reloadPossibleDayValues;
- (void)_reloadVisibleMonthIfNeeded;
- (void)_restoreContentOffsetWithPageOffset:(int64_t)a3;
- (void)_selectDates:(id)a3 animated:(BOOL)a4;
- (void)_setNeedsCollectionViewScrollPositionUpdate;
- (void)_setNeedsCollectionViewSelectionUpdate;
- (void)_setNeedsUpdateSizing;
- (void)_setVisibleMonth:(id)a3;
- (void)_setVisibleMonth:(id)a3 animated:(BOOL)a4;
- (void)_setVisibleMonth:(id)a3 animated:(BOOL)a4 updateDataSource:(BOOL)a5 updateCollectionView:(BOOL)a6 notifyDelegate:(BOOL)a7;
- (void)_setupInitialValues;
- (void)_setupViewHierarchy;
- (void)_shouldDifferentiateWithoutColorUpdated:(id)a3;
- (void)_updateCollectionViewContentInsets;
- (void)_updateCollectionViewScrollPosition:(BOOL)a3;
- (void)_updateCollectionViewSelection:(BOOL)a3;
- (void)_updateContentSizeLimitations;
- (void)_updateDateViewForVisibleMonth:(id)a3 animated:(BOOL)a4;
- (void)_updateSizing;
- (void)_updateViewState:(int64_t)a3 animated:(BOOL)a4;
- (void)_updateVisibleMonth:(id)a3 animated:(BOOL)a4;
- (void)_updateVisibleMonthIfNecessary;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)headerViewDidSelect:(id)a3;
- (void)headerViewDidStepBackward:(id)a3;
- (void)headerViewDidStepForward:(id)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)monthYearSelector:(id)a3 didSelectMonth:(id)a4;
- (void)reloadDecorationsForDateComponents:(NSArray *)dates animated:(BOOL)animated;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAllowsMultipleSelection:(BOOL)a3;
- (void)setAvailableDateRange:(NSDateInterval *)availableDateRange;
- (void)setBounds:(CGRect)a3;
- (void)setCalendar:(NSCalendar *)calendar;
- (void)setCollectionView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDecorationSystem:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setFontDesign:(UIFontDescriptorSystemDesign)fontDesign;
- (void)setFrame:(CGRect)a3;
- (void)setHeaderView:(id)a3;
- (void)setLocale:(NSLocale *)locale;
- (void)setSelectionBehavior:(UICalendarSelection *)selectionBehavior;
- (void)setTimeZone:(NSTimeZone *)timeZone;
- (void)setVisibleDateComponents:(NSDateComponents *)dateComponents animated:(BOOL)animated;
- (void)setVisibleDateComponents:(NSDateComponents *)visibleDateComponents;
- (void)setWantsDateDecorations:(BOOL)wantsDateDecorations;
- (void)setWeekdayView:(id)a3;
@end

@implementation UICalendarView

- (UICalendarView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UICalendarView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UICalendarView *)v3 _setupInitialValues];
    [(UICalendarView *)v4 _setupViewHierarchy];
    [(UICalendarView *)v4 _reloadEverythingIncludingLayout:1];
  }
  return v4;
}

- (UICalendarView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UICalendarView;
  v3 = [(UIView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(UICalendarView *)v3 _setupInitialValues];
    [(UICalendarView *)v4 _setupViewHierarchy];
  }
  return v4;
}

- (void)_setupInitialValues
{
  v3 = (NSDateFormatter *)objc_opt_new();
  [(NSDateFormatter *)v3 setDateFormat:@"d"];
  [(NSDateFormatter *)v3 setFormattingContext:2];
  cellFormatter = self->_cellFormatter;
  self->_cellFormatter = v3;
  v5 = v3;

  self->_frozenContentOffset = (CGPoint)InvalidFrozenContentOffset;
  objc_super v6 = (_UICalendarDataModel *)objc_opt_new();
  dataModel = self->_dataModel;
  self->_dataModel = v6;

  self->_viewState = 0;
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)_reloadDateFormatters
{
  v3 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  [(NSDateFormatter *)self->_cellFormatter setCalendar:v3];

  v4 = [(_UICalendarDataModel *)self->_dataModel effectiveLocale];
  [(NSDateFormatter *)self->_cellFormatter setLocale:v4];

  id v5 = [(_UICalendarDataModel *)self->_dataModel effectiveTimeZone];
  [(NSDateFormatter *)self->_cellFormatter setTimeZone:v5];
}

- (void)_setupViewHierarchy
{
  v28[2] = *MEMORY[0x1E4F143B8];
  [(UIView *)self setPreservesSuperviewLayoutMargins:1];
  v3 = [(UIView *)self traitCollection];
  v4 = _UICalendarViewGetPlatformMetrics([v3 userInterfaceIdiom]);

  id v5 = [v4 headerViewLayoutMarginsForProposedLayoutMargins];
  [(UIView *)self layoutMargins];
  v5[2](v5);
  [(UIView *)self setLayoutMargins:"setLayoutMargins:"];

  objc_super v6 = [[_UICalendarHeaderView alloc] initWithDataModel:self->_dataModel delegate:self];
  headerView = self->_headerView;
  self->_headerView = v6;

  v8 = [[_UICalendarWeekdayView alloc] initWithDataModel:self->_dataModel];
  weekdayView = self->_weekdayView;
  self->_weekdayView = v8;

  v10 = (_UIDatePickerLinkedLabel *)objc_opt_new();
  daySizingLabel = self->_daySizingLabel;
  self->_daySizingLabel = v10;

  v12 = [UICollectionView alloc];
  v13 = objc_opt_new();
  v14 = -[UICollectionView initWithFrame:collectionViewLayout:](v12, "initWithFrame:collectionViewLayout:", v13, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  -[UICollectionView setLayoutMargins:](v14, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
  [(UIView *)v14 setClipsToBounds:0];
  [(UIView *)v14 setPreservesSuperviewLayoutMargins:1];
  [(UIScrollView *)v14 setPagingEnabled:1];
  [(UIScrollView *)v14 setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)v14 setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)v14 setAllowsFocus:0];
  [(UICollectionView *)v14 setBackgroundColor:0];
  [(UICollectionView *)v14 setDelegate:self];
  uint64_t v15 = objc_opt_class();
  v16 = +[_UICalendarDateViewCell reuseIdentifier];
  [(UICollectionView *)v14 registerClass:v15 forCellWithReuseIdentifier:v16];

  [(UIScrollView *)v14 _setAutomaticContentOffsetAdjustmentEnabled:0];
  objc_initWeak(&location, self);
  v17 = [UICollectionViewDiffableDataSource alloc];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __37__UICalendarView__setupViewHierarchy__block_invoke;
  v25[3] = &unk_1E52EEE30;
  objc_copyWeak(&v26, &location);
  v18 = [(UICollectionViewDiffableDataSource *)v17 initWithCollectionView:v14 cellProvider:v25];
  dataSource = self->_dataSource;
  self->_dataSource = v18;

  objc_storeStrong((id *)&self->_collectionView, v14);
  v20 = (UIView *)objc_opt_new();
  contentView = self->_contentView;
  self->_contentView = v20;

  [(UIView *)self->_contentView setPreservesSuperviewLayoutMargins:1];
  [(UIView *)self->_contentView setClipsToBounds:1];
  [(UIView *)self addSubview:self->_contentView];
  [(UIView *)self->_contentView addSubview:self->_headerView];
  [(UIView *)self->_contentView addSubview:self->_weekdayView];
  [(UIView *)self->_contentView addSubview:self->_collectionView];
  v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v22 addObserver:self selector:sel__shouldDifferentiateWithoutColorUpdated_ name:@"UIAccessibilityShouldDifferentiateWithoutColorDidChangeNotification" object:0];

  [(UICalendarView *)self _updateContentSizeLimitations];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  id v24 = [(UIView *)self registerForTraitChanges:v23 withHandler:&__block_literal_global_228];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

id __37__UICalendarView__setupViewHierarchy__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = [WeakRetained _configuedCellForCollectionView:v7 indexPath:v8 day:v9];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __37__UICalendarView__setupViewHierarchy__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setNeedsLayout];
  [v2 invalidateIntrinsicContentSize];
}

- (id)_dataModel
{
  return self->_dataModel;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v7.receiver = self;
  v7.super_class = (Class)UICalendarView;
  -[UIView setFrame:](&v7, sel_setFrame_, a3.origin.x, a3.origin.y);
  if (width != self->_lastKnownSize.width || height != self->_lastKnownSize.height)
  {
    self->_lastKnownSize.double width = width;
    self->_lastKnownSize.double height = height;
    [(UICalendarView *)self _setNeedsCollectionViewScrollPositionUpdate];
    [(UICalendarView *)self _setNeedsUpdateSizing];
    [(UICalendarView *)self _updateContentSizeLimitations];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v7.receiver = self;
  v7.super_class = (Class)UICalendarView;
  -[UIView setBounds:](&v7, sel_setBounds_, a3.origin.x, a3.origin.y);
  if (width != self->_lastKnownSize.width || height != self->_lastKnownSize.height)
  {
    self->_lastKnownSize.double width = width;
    self->_lastKnownSize.double height = height;
    [(UICalendarView *)self _setNeedsCollectionViewScrollPositionUpdate];
    [(UICalendarView *)self _setNeedsUpdateSizing];
    [(UICalendarView *)self _updateContentSizeLimitations];
  }
}

- (void)_setNeedsUpdateSizing
{
  *(unsigned char *)&self->_flags |= 4u;
  [(UIView *)self setNeedsLayout];
}

- (void)_updateSizing
{
  *(unsigned char *)&self->_flags &= ~4u;
  [(UICalendarView *)self __dayAndWeekdayLabelWidth];
  double v4 = v3;
  weekdayView = self->_weekdayView;
  if (v3 == self->_lastWeekdayLabelWidth)
  {
    [(UIView *)weekdayView invalidateIntrinsicContentSize];
    collectionView = self->_collectionView;
    [(UIView *)collectionView invalidateIntrinsicContentSize];
  }
  else
  {
    [(_UICalendarWeekdayView *)weekdayView setPreferredLabelWidth:v3];
    self->_lastWeekdayLabelWidth = v4;
    [(UICalendarView *)self _reloadCollectionViewLayout];
  }
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)UICalendarView;
  [(UIView *)&v47 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  v48.origin.double x = v4;
  v48.origin.CGFloat y = v6;
  v48.size.double width = v8;
  v48.size.double height = v10;
  if (CGRectGetWidth(v48) != 0.0)
  {
    v49.origin.double x = v4;
    v49.origin.CGFloat y = v6;
    v49.size.double width = v8;
    v49.size.double height = v10;
    if (CGRectGetHeight(v49) != 0.0)
    {
      v11 = [(UIView *)self traitCollection];
      v12 = _UICalendarViewGetPlatformMetrics([v11 userInterfaceIdiom]);

      [(UIView *)self layoutMargins];
      double v14 = v13;
      [(UIView *)self layoutMargins];
      CGFloat v16 = v10 - (v14 + v15);
      v17 = [v12 maximumContentWidthForLayoutMargins];
      [(UIView *)self layoutMargins];
      CGFloat v18 = fmax((v8 - v17[2](v17)) * 0.5, 0.0);
      v50.origin.double x = v4 + 0.0;
      v50.origin.CGFloat y = v6 + v14;
      v50.size.double width = v8;
      v50.size.double height = v16;
      CGRect v51 = CGRectInset(v50, v18, 0.0);
      double x = v51.origin.x;
      CGFloat y = v51.origin.y;
      double width = v51.size.width;
      double height = v51.size.height;
      CGRect remainder = v51;

      [v12 minimumLayoutWidth];
      double v24 = v23;
      if (width < v23)
      {
        double x = (width - v23) * 0.5;
        remainder.origin.double x = x;
        remainder.size.double width = v23;
        double v25 = v23;
      }
      else
      {
        double v25 = width;
      }
      -[_UICalendarWeekdayView sizeThatFits:](self->_weekdayView, "sizeThatFits:", v25, height);
      CGFloat v27 = v26;
      -[_UICalendarHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v25, height);
      CGFloat v29 = v28;
      [v12 minimumContentWidth];
      v30 = [v12 maximumContentWidthForLayoutMargins];
      [(UIView *)self layoutMargins];
      v30[2](v30);

      CGSize v31 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      slice.size = v31;
      double v32 = x;
      v31.double width = y;
      double v33 = v25;
      double v34 = height;
      CGRectDivide(*(CGRect *)((char *)&v31 - 8), &slice, &remainder, v29, CGRectMinYEdge);
      -[UIView setFrame:](self->_headerView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      remainder.origin.CGFloat y = remainder.origin.y + 16.0;
      remainder.size.double height = remainder.size.height + -16.0;
      [(UIView *)self->_monthYearSelector setFrame:remainder.origin.x];
      CGRectDivide(remainder, &slice, &remainder, v27, CGRectMinYEdge);
      -[UIView setFrame:](self->_weekdayView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
      [v12 weekdayViewVerticalSpacing];
      remainder.origin.CGFloat y = v35 + remainder.origin.y;
      remainder.size.double height = remainder.size.height - v35;
      [(UICalendarView *)self _preferredCollectionViewHeightForWidth:CGRectGetWidth(remainder)];
      double v37 = v36 + -32.0;
      double v38 = CGRectGetHeight(remainder);
      if (v38 < v37) {
        remainder.size.double height = fmax(v37, 0.0);
      }
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      CGRect v44 = remainder;
      v43[2] = __32__UICalendarView_layoutSubviews__block_invoke;
      v43[3] = &unk_1E52DA520;
      v43[4] = self;
      [(UICalendarView *)self _performIgnoringScrollCallbacks:v43];
      char flags = (char)self->_flags;
      if ((flags & 4) != 0)
      {
        [(UICalendarView *)self _updateSizing];
        char flags = (char)self->_flags;
        if ((flags & 1) == 0)
        {
LABEL_10:
          if ((flags & 2) == 0)
          {
LABEL_12:
            if (width >= v24 || v38 >= v37)
            {
              if (width >= v24)
              {
                if (v38 >= v37) {
                  goto LABEL_26;
                }
                v40 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICalendarView", &qword_1EB25C998) + 8);
                if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_26;
                }
                *(_WORD *)v42 = 0;
                v41 = "UICalendarView's height is smaller than it can render its content in; defaulting to the minimum height.";
                goto LABEL_25;
              }
              v40 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICalendarView", &qword_1EB25C990) + 8);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v42 = 0;
                v41 = "UICalendarView's width is smaller than it can render its content in; defaulting to the minimum width.";
                goto LABEL_25;
              }
            }
            else
            {
              v40 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICalendarView", &_MergedGlobals_5_9) + 8);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v42 = 0;
                v41 = "UICalendarView's size is smaller than it can render its content in; defaulting to the minimum size.";
LABEL_25:
                _os_log_impl(&dword_1853B0000, v40, OS_LOG_TYPE_ERROR, v41, v42, 2u);
              }
            }
LABEL_26:

            return;
          }
LABEL_11:
          [(UICalendarView *)self _updateCollectionViewScrollPosition:0];
          goto LABEL_12;
        }
      }
      else if ((*(unsigned char *)&self->_flags & 1) == 0)
      {
        goto LABEL_10;
      }
      [(UICalendarView *)self _updateCollectionViewSelection:0];
      if ((*(unsigned char *)&self->_flags & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
}

uint64_t __32__UICalendarView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 576), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)_contentSizeCategoryForContentWidth:(double)a3
{
  double v3 = (id *)&UIContentSizeCategoryExtraExtraLarge;
  if (a3 >= 280.0) {
    double v3 = (id *)&UIContentSizeCategoryExtraExtraExtraLarge;
  }
  if (a3 >= 330.0) {
    double v3 = (id *)&UIContentSizeCategoryAccessibilityMedium;
  }
  id v4 = *v3;
  return v4;
}

- (void)_updateContentSizeLimitations
{
  [(UIView *)self bounds];
  id v4 = [(UICalendarView *)self _contentSizeCategoryForContentWidth:v3];
  [(UIView *)self->_contentView setMaximumContentSizeCategory:v4];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 3;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(UIView *)self traitCollection];
  double v7 = _UICalendarViewGetPlatformMetrics([v6 userInterfaceIdiom]);

  double v8 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  [v8 maximumRangeOfUnit:4096];

  [v7 minimumContentWidth];
  double v10 = v9;
  v11 = [v7 maximumContentWidthForLayoutMargins];
  [(UIView *)self layoutMargins];
  double v12 = fmax(v10, fmin(width, v11[2](v11)));

  double v13 = [(UIView *)self->_contentView maximumContentSizeCategory];
  double v14 = [(UICalendarView *)self _contentSizeCategoryForContentWidth:v12];
  [(UIView *)self->_contentView setMaximumContentSizeCategory:v14];
  -[_UICalendarWeekdayView sizeThatFits:](self->_weekdayView, "sizeThatFits:", width, height);
  double v16 = v15;
  double v18 = v17;
  -[_UICalendarHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", width, height);
  double v20 = v19;
  double v22 = v21;
  [v7 minimumContentWidth];
  double v24 = v23;
  double v25 = [v7 maximumContentWidthForLayoutMargins];
  [(UIView *)self layoutMargins];
  double v26 = fmax(v24, fmin(fmax(v16, v20), v25[2](v25)));

  [(UIView *)self->_contentView setMaximumContentSizeCategory:v13];
  [(UICalendarView *)self _preferredCollectionViewHeightForWidth:v26];
  double v28 = v18 + 16.0 + v22 + v27;
  [(UIView *)self layoutMargins];
  double v30 = v28 + v29;
  [(UIView *)self layoutMargins];
  double v32 = v30 + v31 + 2.0;

  double v33 = v26;
  double v34 = v32;
  result.double height = v34;
  result.double width = v33;
  return result;
}

- (void)layoutMarginsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)UICalendarView;
  [(UIView *)&v5 layoutMarginsDidChange];
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UICalendarView *)self _setNeedsUpdateSizing];
  [(UICalendarView *)self _updateContentSizeLimitations];
  double v3 = [(UICalendarView *)self collectionView];
  id v4 = [v3 collectionViewLayout];
  [v4 invalidateLayout];
}

- (double)_preferredCollectionViewHeightForWidth:(double)a3
{
  if ([(UICalendarView *)self _hasCellDecorations])
  {
    id v4 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
    [v4 maximumRangeOfUnit:4096];

    objc_super v5 = [(UIView *)self->_contentView traitCollection];
    +[UICalendarViewDecoration _referenceHeightForTraitCollection:v5];
  }
  double v6 = [(UIView *)self traitCollection];
  double v7 = _UICalendarViewGetPlatformMetrics([v6 userInterfaceIdiom]);

  [v7 dateViewCellSpacing];
  if (v8 > 0.0)
  {
    double v9 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
    [v9 maximumRangeOfUnit:4096];

    [v7 dateViewCellBackgroundSize];
    [v7 dateViewCellSpacing];
  }
  UIRoundToViewScale(self);
  double v11 = v10;

  return v11;
}

- (double)__dayAndWeekdayLabelWidth
{
  double v3 = [(UIView *)self traitCollection];
  id v4 = _UICalendarViewGetPlatformMetrics([v3 userInterfaceIdiom]);

  objc_super v5 = [_UICalendarDateViewCellState alloc];
  double v6 = [(UIView *)self traitCollection];
  double v7 = [(_UICalendarDateViewCellState *)v5 initWithTraits:v6];

  [(_UICalendarDateViewCellState *)v7 setForceEmphasizedFont:1];
  double v8 = [v4 dateCellFontProvider];
  double v9 = [(_UICalendarDataModel *)self->_dataModel fontDesign];
  double v10 = [(UIView *)self->_contentView traitCollection];
  double v11 = ((void (**)(void, _UICalendarDateViewCellState *, void *, void *))v8)[2](v8, v7, v9, v10);
  [(_UIDatePickerLinkedLabel *)self->_daySizingLabel setFont:v11];

  double v12 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  double v13 = [v12 weekdaySymbols];
  uint64_t v14 = [v13 count];

  double v15 = [(_UICalendarWeekdayView *)self->_weekdayView sizingLabel];
  [(UIView *)self bounds];
  objc_msgSend(v15, "sizeThatFits:", v16, v17);
  double v19 = v18;

  daySizingLabel = self->_daySizingLabel;
  [(UIView *)self bounds];
  -[_UIDatePickerLinkedLabel sizeThatFits:](daySizingLabel, "sizeThatFits:", v21, v22);
  double v24 = v23;
  [(UIView *)self bounds];
  double Width = CGRectGetWidth(v31);
  [(UIView *)self layoutMargins];
  double v27 = Width - v26;
  [(UIView *)self layoutMargins];
  double v29 = fmax(v24, fmin(v19, (v27 - v28) / (double)v14));

  return v29;
}

- (BOOL)_shouldUpdateDateViewForVisibleMonth:(id)a3
{
  dataModel = self->_dataModel;
  id v4 = a3;
  objc_super v5 = [(_UICalendarDataModel *)dataModel visibleMonth];
  char v6 = [v5 isEqual:v4];

  return v6 ^ 1;
}

- (void)_updateDateViewForVisibleMonth:(id)a3 animated:(BOOL)a4
{
}

- (void)_updateVisibleMonth:(id)a3 animated:(BOOL)a4
{
  [(UICalendarView *)self _updateDateViewForVisibleMonth:a3 animated:a4];
  headerView = self->_headerView;
  [(_UICalendarHeaderView *)headerView didUpdateVisibleMonth];
}

- (void)headerViewDidStepForward:(id)a3
{
  id v4 = [a3 dataModel];
  objc_super v5 = [v4 visibleMonth];
  id v6 = [v5 nextMonth];

  [(UICalendarView *)self _updateVisibleMonth:v6 animated:1];
}

- (void)headerViewDidStepBackward:(id)a3
{
  id v4 = [a3 dataModel];
  objc_super v5 = [v4 visibleMonth];
  id v6 = [v5 previousMonth];

  [(UICalendarView *)self _updateVisibleMonth:v6 animated:1];
}

- (void)headerViewDidSelect:(id)a3
{
  [(UICalendarView *)self _updateViewState:self->_viewState == 0 animated:1];
}

- (void)_updateViewState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_viewState != a3)
  {
    BOOL v4 = a4;
    monthYearSelector = self->_monthYearSelector;
    BOOL v9 = a3 == 1;
    if (a3 == 1 && !monthYearSelector)
    {
      [(UICalendarView *)self _configureMonthYearSelector];
      monthYearSelector = self->_monthYearSelector;
    }
    [(UIView *)monthYearSelector setNeedsLayout];
    self->_viewState = a3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__UICalendarView__updateViewState_animated___block_invoke;
    aBlock[3] = &unk_1E52D9FC0;
    BOOL v16 = v9;
    aBlock[4] = self;
    double v10 = (void (**)(void))_Block_copy(aBlock);
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__UICalendarView__updateViewState_animated___block_invoke_2;
    v12[3] = &unk_1E52EEE78;
    objc_copyWeak(v13, &location);
    v13[1] = (id)a2;
    double v11 = (void (**)(void *, uint64_t))_Block_copy(v12);
    ++self->_stateUpdatesInFlight;
    if (v4)
    {
      +[UIView animateWithDuration:4 delay:v10 options:v11 animations:0.25 completion:0.0];
    }
    else
    {
      v10[2](v10);
      v11[2](v11, 1);
    }
    [(_UICalendarHeaderView *)self->_headerView setExpanded:a3 == 1 animated:v4];

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
}

uint64_t __44__UICalendarView__updateViewState_animated___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 448);
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  [v2 setAlpha:v3];
  [*(id *)(*(void *)(a1 + 32) + 576) setAlpha:v4];
  objc_super v5 = *(void **)(*(void *)(a1 + 32) + 568);
  return [v5 setAlpha:v4];
}

void __44__UICalendarView__updateViewState_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[55];
    if (v3 <= 0)
    {
      double v7 = WeakRetained;
      objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:*(void *)(a1 + 40) object:v7 file:@"UICalendarView.m" lineNumber:501 description:@"Internal inconsistency: finishing a state update with 0 state updates being tracked right now."];

      id WeakRetained = v7;
      uint64_t v3 = v7[55];
    }
    uint64_t v4 = v3 - 1;
    WeakRetained[55] = v4;
    if (!v4 && WeakRetained[66] != 1)
    {
      id v6 = WeakRetained;
      [WeakRetained _destroyMonthYearSelector];
      id WeakRetained = v6;
    }
  }
}

- (void)_destroyMonthYearSelector
{
  [(UIView *)self->_monthYearSelector removeFromSuperview];
  monthYearSelector = self->_monthYearSelector;
  self->_monthYearSelector = 0;
}

- (void)_configureMonthYearSelector
{
  if (!self->_monthYearSelector)
  {
    uint64_t v3 = [[_UICalendarMonthYearSelector alloc] initWithDataModel:self->_dataModel];
    [(_UICalendarMonthYearSelector *)v3 setDelegate:self];
    double v4 = 0.0;
    if (self->_viewState == 1) {
      double v4 = 1.0;
    }
    [(UIView *)v3 setAlpha:v4];
    [(UIView *)self addSubview:v3];
    monthYearSelector = self->_monthYearSelector;
    self->_monthYearSelector = v3;
  }
}

- (void)monthYearSelector:(id)a3 didSelectMonth:(id)a4
{
  selectionBehavior = self->_selectionBehavior;
  id v7 = a4;
  id v6 = [v7 components];
  [(UICalendarSelection *)selectionBehavior didChangeVisibleMonth:v6];

  [(UICalendarView *)self _updateVisibleMonth:v7 animated:0];
}

- (id)_configuedCellForCollectionView:(id)a3 indexPath:(id)a4 day:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  collectionView = self->_collectionView;
  double v10 = +[_UICalendarDateViewCell reuseIdentifier];
  double v11 = [(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v7];

  [v11 setCalendarView:self];
  if ([(UICalendarView *)self _hasCellDecorations])
  {
    uint64_t v12 = [(UICalendarView *)self _delegateDecorationForDay:v8];
    double v13 = (void *)v12;
    if (v12)
    {
      v21[0] = v12;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  objc_msgSend(v11, "setSelectionRoundedEdge:", -[UICalendarView _selectionRoundedEdgeForDay:](self, "_selectionRoundedEdgeForDay:", v8));
  cellFormatter = self->_cellFormatter;
  BOOL v16 = [(_UICalendarDataModel *)self->_dataModel fontDesign];
  uint64_t v17 = [(UICalendarView *)self _canSelectItemAtIndexPath:v7 forSelection:0] ^ 1;
  BOOL v18 = [(UICalendarSelection *)self->_selectionBehavior renderOverhangDays];
  LOBYTE(v20) = [(UICalendarSelection *)self->_selectionBehavior highlightsToday];
  [v11 configureWithDay:v8 formatter:cellFormatter fontDesign:v16 decorations:v14 outOfRange:v17 renderOverhangDays:v18 highlightsToday:v20];

  return v11;
}

- (id)_delegateDecorationForDay:(id)a3
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    id v5 = a3;
    id v6 = [(UICalendarView *)self delegate];
    id v7 = [v5 components];

    uint64_t v3 = [v6 calendarView:self decorationForDateComponents:v7];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (unint64_t)_selectionRoundedEdgeForDay:(id)a3
{
  id v4 = a3;
  id v5 = [(UICalendarView *)self selectionBehavior];

  if (v5)
  {
    id v6 = [(UICalendarView *)self selectionBehavior];
    id v7 = [v4 components];
    unint64_t v8 = [v6 roundedEdgeForDate:v7];
  }
  else
  {
    unint64_t v8 = 3;
  }

  return v8;
}

- (void)_reloadCollectionViewLayout
{
  uint64_t v3 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  [v3 maximumRangeOfUnit:512];
  id v5 = v4;
  [v3 maximumRangeOfUnit:4096];
  id v7 = (void *)(v6 - 1);
  self->_collectionViewAspectRatio = (double)(unint64_t)(v6 - 1) / (double)(unint64_t)v5;
  unint64_t v8 = objc_opt_new();
  [v8 setScrollDirection:1];
  objc_initWeak(&location, self);
  BOOL v9 = [UICollectionViewCompositionalLayout alloc];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__UICalendarView__reloadCollectionViewLayout__block_invoke;
  v15[3] = &unk_1E52EEEA0;
  objc_copyWeak(v17, &location);
  id v10 = v3;
  id v16 = v10;
  v17[1] = v5;
  v17[2] = v7;
  double v11 = [(UICollectionViewCompositionalLayout *)v9 initWithSectionProvider:v15 configuration:v8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  id v13[2] = __45__UICalendarView__reloadCollectionViewLayout__block_invoke_2;
  v13[3] = &unk_1E52D9F98;
  v13[4] = self;
  uint64_t v12 = v11;
  uint64_t v14 = v12;
  [(UICalendarView *)self _performIgnoringScrollCallbacks:v13];
  [(UICalendarView *)self _setNeedsCollectionViewScrollPositionUpdate];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

id __45__UICalendarView__reloadCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    v60 = v5;
    unint64_t v8 = [WeakRetained traitCollection];
    BOOL v9 = _UICalendarViewGetPlatformMetrics([v8 userInterfaceIdiom]);

    [v7 directionalLayoutMargins];
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [v7[53] snapshot];
    double v15 = [v14 sectionIdentifiers];
    id v16 = [v15 objectAtIndexedSubscript:a2];

    uint64_t v17 = *(void **)(a1 + 32);
    v59 = v16;
    BOOL v18 = [v16 date];
    [v17 rangeOfUnit:0x2000 inUnit:8 forDate:v18];
    unint64_t v20 = v19;

    [v9 dateViewCellSpacing];
    double v22 = v21;
    if (v21 <= 0.0)
    {
      [off_1E52D2B08 fractionalWidthDimension:1.0 / (double)*(unint64_t *)(a1 + 48)];
    }
    else
    {
      [v9 dateViewCellBackgroundSize];
      objc_msgSend(off_1E52D2B08, "absoluteDimension:");
    uint64_t v24 = };
    double v25 = [off_1E52D2B08 fractionalHeightDimension:1.0];
    uint64_t v26 = [off_1E52D2B30 sizeWithWidthDimension:v24 heightDimension:v25];

    v57 = (void *)v26;
    uint64_t v27 = [off_1E52D2B20 itemWithLayoutSize:v26];
    v58 = (void *)v24;
    if (v22 <= 0.0)
    {
      unint64_t v29 = *(void *)(a1 + 56);
      if (v29 <= v20) {
        unint64_t v29 = v20;
      }
      uint64_t v28 = [off_1E52D2B08 fractionalHeightDimension:1.0 / (double)v29];
    }
    else
    {
      [v9 dateViewCellBackgroundSize];
      uint64_t v28 = objc_msgSend(off_1E52D2B08, "absoluteDimension:");
    }
    double v30 = (void *)v28;
    CGRect v31 = [off_1E52D2B08 fractionalWidthDimension:1.0];
    v55 = v30;
    double v32 = [off_1E52D2B30 sizeWithWidthDimension:v31 heightDimension:v30];

    v56 = (void *)v27;
    v62[0] = v27;
    double v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
    double v34 = [off_1E52D2B18 horizontalGroupWithLayoutSize:v32 subitems:v33];

    if (v22 > 0.0)
    {
      [v9 dateViewCellSpacing];
      double v35 = objc_msgSend(off_1E52D2B38, "flexibleSpacing:");
      [v34 setInterItemSpacing:v35];
    }
    objc_msgSend(v7, "__dayAndWeekdayLabelWidth");
    double v37 = v36;
    double v38 = [v60 container];
    [v38 effectiveContentSize];
    double v40 = v39;

    double v41 = 0.0;
    if (v22 <= 0.0) {
      double v41 = (v40 - v11 - v13 - fmax(v37, 1.0) * (double)*(unint64_t *)(a1 + 48))
    }
          / (double)(unint64_t)(*(void *)(a1 + 48) - 1)
          * 0.5;
    v42 = [v32 widthDimension];
    v43 = [off_1E52D2B08 fractionalHeightDimension:1.0];
    CGRect v44 = [off_1E52D2B30 sizeWithWidthDimension:v42 heightDimension:v43];

    v61 = v34;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
    v46 = [off_1E52D2B18 verticalGroupWithLayoutSize:v44 subitems:v45];

    if (v22 > 0.0)
    {
      [v9 dateViewCellSpacing];
      if (v20 > *(void *)(a1 + 56)) {
        double v47 = 0.0;
      }
      CGRect v48 = [off_1E52D2B38 flexibleSpacing:v47];
      [v46 setInterItemSpacing:v48];
    }
    double v49 = v11 - v41;
    unint64_t v50 = *(void *)(a1 + 56);
    double v51 = 0.0;
    if (v20 > v50) {
      double v51 = (double)(v20 - v50) / ((double)v20 * (double)v50) * 0.5;
    }
    if (v49 < 0.5) {
      double v49 = 0.0;
    }
    if (v13 - v41 >= 0.5) {
      double v52 = v13 - v41;
    }
    else {
      double v52 = 0.0;
    }
    if (v51 >= 0.5) {
      double v53 = v51;
    }
    else {
      double v53 = 0.0;
    }
    objc_msgSend(v46, "setContentInsets:", v53, v49, v53, v52);
    double v23 = [off_1E52D2B28 sectionWithGroup:v46];
    objc_msgSend(v23, "setContentInsets:", 1.0, 0.0, 1.0, 0.0);

    id v5 = v60;
  }
  else
  {
    double v23 = 0;
  }

  return v23;
}

uint64_t __45__UICalendarView__reloadCollectionViewLayout__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 576) setCollectionViewLayout:*(void *)(a1 + 40) animated:0];
}

- (void)_reloadEverythingIncludingLayout:(BOOL)a3
{
  BOOL v3 = a3;
  [(UICalendarView *)self _reloadVisibleMonthIfNeeded];
  [(UICalendarView *)self _reloadDateFormatters];
  [(UICalendarView *)self _reloadPossibleDayValues];
  [(UICalendarView *)self _reloadDataSourceController];
  if (v3)
  {
    [(UICalendarView *)self _reloadCollectionViewLayout];
  }
}

- (void)_reloadVisibleMonthIfNeeded
{
  BOOL v3 = [(_UICalendarDataModel *)self->_dataModel availableDateRange];
  id v4 = [(_UICalendarDataModel *)self->_dataModel visibleMonth];
  char v5 = objc_msgSend(v3, "_ui_containsMonth:", v4);

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(_UICalendarDataModel *)self->_dataModel availableDateRange];
    id v7 = [(_UICalendarDataModel *)self->_dataModel visibleMonth];
    unint64_t v8 = [v7 date];
    objc_msgSend(v6, "_ui_dateInRangeForDate:", v8);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v9 = [_UIDatePickerCalendarMonth alloc];
    double v10 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
    double v11 = [(_UIDatePickerCalendarDateComponent *)v9 initWithDate:v12 calendar:v10];

    [(UICalendarView *)self _setVisibleMonth:v11 animated:0 updateDataSource:1 updateCollectionView:1 notifyDelegate:0];
  }
}

- (void)_reloadDataSourceController
{
  BOOL v3 = [(_UICalendarDataModel *)self->_dataModel visibleMonth];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __45__UICalendarView__reloadDataSourceController__block_invoke;
  unint64_t v8 = &unk_1E52D9F98;
  BOOL v9 = self;
  id v10 = v3;
  id v4 = v3;
  [(UICalendarView *)self _performIgnoringScrollCallbacks:&v5];
  -[UICalendarView _setVisibleMonth:](self, "_setVisibleMonth:", v4, v5, v6, v7, v8, v9);
}

uint64_t __45__UICalendarView__reloadDataSourceController__block_invoke(uint64_t a1)
{
  id v2 = [_UICalendarViewDataSourceController alloc];
  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 520) effectiveCalendar];
  uint64_t v4 = [(_UICalendarViewDataSourceController *)v2 initWithCalendar:v3 dataSource:*(void *)(*(void *)(a1 + 32) + 424)];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 432);
  *(void *)(v5 + 432) = v4;

  uint64_t v7 = *(void *)(a1 + 40);
  unint64_t v8 = *(void **)(*(void *)(a1 + 32) + 432);
  return [v8 reloadDataSourceAroundMonth:v7];
}

- (void)_reloadPossibleDayValues
{
  v14[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  uint64_t v4 = [(_UICalendarDataModel *)self->_dataModel effectiveLocale];
  [v3 setLocale:v4];

  uint64_t v5 = objc_opt_new();
  uint64_t v6 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  unint64_t v7 = [v6 maximumRangeOfUnit:16];
  uint64_t v9 = v8;

  if (v7 < v7 + v9)
  {
    do
    {
      id v10 = [NSNumber numberWithUnsignedInteger:v7];
      double v11 = [v3 stringFromNumber:v10];

      [v5 addObject:v11];
      ++v7;
      --v9;
    }
    while (v9);
  }
  id v12 = (void *)[v5 copy];
  v14[0] = v12;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [(_UIDatePickerLinkedLabel *)self->_daySizingLabel setPossibleTitles:v13];
}

- (void)setSelectionBehavior:(UICalendarSelection *)selectionBehavior
{
  unint64_t v7 = selectionBehavior;
  p_selectionBehavior = &self->_selectionBehavior;
  uint64_t v6 = self->_selectionBehavior;
  if (v6) {
    [(UICalendarSelection *)v6 setView:0];
  }
  objc_storeStrong((id *)&self->_selectionBehavior, selectionBehavior);
  if (*p_selectionBehavior) {
    [(UICalendarSelection *)*p_selectionBehavior setView:self];
  }
  [(UICalendarView *)self _reconfigureVisibleItems];
}

- (void)_selectDates:(id)a3 animated:(BOOL)a4
{
  BOOL v17 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  id v16 = v5;
  unint64_t v7 = _asCalendarDay(v5, v6, [(UICalendarSelection *)self->_selectionBehavior renderOverhangDays]);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_dataSource, "indexPathForItemIdentifier:", v13, v16);
        if (v14)
        {
          double v15 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v14];
          objc_msgSend(v15, "setSelectionRoundedEdge:", -[UICalendarView _selectionRoundedEdgeForDay:](self, "_selectionRoundedEdgeForDay:", v13));
          [(UICollectionView *)self->_collectionView selectItemAtIndexPath:v14 animated:v17 scrollPosition:0];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)_deselectDates:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  id v8 = _asCalendarDay(v6, v7, [(UICalendarSelection *)self->_selectionBehavior renderOverhangDays]);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = -[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_dataSource, "indexPathForItemIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * v13), (void)v15);
        [(UICollectionView *)self->_collectionView deselectItemAtIndexPath:v14 animated:v4];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (BOOL)allowsMultipleSelection
{
  return [(UICollectionView *)self->_collectionView allowsMultipleSelection];
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
}

- (_UICalendarViewDecorationSystem)decorationSystem
{
  decorationSystem = self->_decorationSystem;
  if (!decorationSystem)
  {
    BOOL v4 = (_UICalendarViewDecorationSystem *)objc_opt_new();
    id v5 = self->_decorationSystem;
    self->_decorationSystem = v4;

    decorationSystem = self->_decorationSystem;
  }
  return decorationSystem;
}

- (BOOL)_hasCellDecorations
{
  return (~*(unsigned char *)&self->_flags & 0x50) == 0;
}

- (void)_reconfigureVisibleItems
{
  [(UICalendarView *)self _reloadCollectionViewLayout];
  BOOL v3 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  BOOL v4 = [(UICollectionView *)self->_collectionView indexPathsForVisibleItems];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__UICalendarView__reconfigureVisibleItems__block_invoke;
  v6[3] = &unk_1E52EEEC8;
  v6[4] = self;
  id v5 = _UICalendarMap(v4, v6);

  [v3 reconfigureItemsWithIdentifiers:v5];
  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v3 animatingDifferences:0];
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
}

uint64_t __42__UICalendarView__reconfigureVisibleItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) itemIdentifierForIndexPath:a2];
}

- (void)setDelegate:(id)delegate
{
  id v4 = delegate;
  BOOL v5 = [(UICalendarView *)self _hasCellDecorations];
  objc_storeWeak((id *)&self->_delegate, v4);
  if (objc_opt_respondsToSelector()) {
    char v6 = 16;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xEF | v6;
  char v7 = objc_opt_respondsToSelector();

  if (v7) {
    char v8 = 32;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xDF | v8;
  if (v5 != [(UICalendarView *)self _hasCellDecorations])
  {
    [(UICalendarView *)self _reconfigureVisibleItems];
  }
}

- (BOOL)wantsDateDecorations
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (void)setWantsDateDecorations:(BOOL)wantsDateDecorations
{
  BOOL v3 = wantsDateDecorations;
  BOOL v5 = [(UICalendarView *)self _hasCellDecorations];
  if (v3) {
    char v6 = 64;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xBF | v6;
  if (v5 != [(UICalendarView *)self _hasCellDecorations])
  {
    if (![(UICalendarView *)self _hasCellDecorations]) {
      [(_UICalendarViewDecorationSystem *)self->_decorationSystem reset];
    }
    [(UICalendarView *)self _reconfigureVisibleItems];
  }
}

- (void)reloadDecorationsForDateComponents:(NSArray *)dates animated:(BOOL)animated
{
  BOOL v4 = animated;
  dataSource = self->_dataSource;
  char v7 = dates;
  id v14 = [(UICollectionViewDiffableDataSource *)dataSource snapshot];
  char v8 = [v14 itemIdentifiers];
  id v9 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  uint64_t v10 = _asCalendarDay(v7, v9, [(UICalendarSelection *)self->_selectionBehavior renderOverhangDays]);

  uint64_t v11 = [MEMORY[0x1E4F1CA80] setWithArray:v8];
  uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  [v11 intersectSet:v12];

  uint64_t v13 = [v11 allObjects];
  [v14 reconfigureItemsWithIdentifiers:v13];

  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshot:v14 animatingDifferences:v4];
}

- (BOOL)_canSelectItemAtIndexPath:(id)a3 forSelection:(BOOL)a4
{
  char v6 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:a3];
  if (([(UICalendarSelection *)self->_selectionBehavior renderOverhangDays]
     || ([v6 assignedMonth], char v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
    && ([(_UICalendarDataModel *)self->_dataModel availableDateRange],
        char v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = objc_msgSend(v8, "_ui_containsDay:", v6),
        v8,
        v9))
  {
    if (self->_selectionBehavior)
    {
      uint64_t v10 = [v6 components];
      uint64_t v11 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
      [v10 setCalendar:v11];

      BOOL v12 = [(UICalendarSelection *)self->_selectionBehavior canSelectDate:v10];
    }
    else
    {
      BOOL v12 = !a4;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return [(UICalendarView *)self _canSelectItemAtIndexPath:a4 forSelection:1];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return [(UICalendarView *)self _canSelectItemAtIndexPath:a4 forSelection:1];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:a4];
  BOOL v5 = [v7 components];
  char v6 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  [v5 setCalendar:v6];

  [(UICalendarSelection *)self->_selectionBehavior didSelectDate:v5];
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  BOOL v4 = self;
  BOOL v5 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:a4];
  char v6 = [v5 components];
  id v7 = [(_UICalendarDataModel *)v4->_dataModel effectiveCalendar];
  [v6 setCalendar:v7];

  LOBYTE(v4) = [(UICalendarSelection *)v4->_selectionBehavior shouldDeselectDate:v6];
  return (char)v4;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v7 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:a4];
  BOOL v5 = [v7 components];
  char v6 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  [v5 setCalendar:v6];

  [(UICalendarSelection *)self->_selectionBehavior didDeselectDate:v5];
}

- (NSCalendar)calendar
{
  return [(_UICalendarDataModel *)self->_dataModel calendar];
}

- (NSLocale)locale
{
  return [(_UICalendarDataModel *)self->_dataModel locale];
}

- (NSTimeZone)timeZone
{
  return [(_UICalendarDataModel *)self->_dataModel timeZone];
}

- (UIFontDescriptorSystemDesign)fontDesign
{
  return [(_UICalendarDataModel *)self->_dataModel fontDesign];
}

- (void)setCalendar:(NSCalendar *)calendar
{
  BOOL v4 = calendar;
  BOOL v5 = [(_UICalendarDataModel *)self->_dataModel calendar];
  char v8 = v4;
  char v6 = v5;
  if (v6 == v8)
  {

    goto LABEL_9;
  }
  if (!v8 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [(NSCalendar *)v8 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(_UICalendarDataModel *)self->_dataModel setCalendar:v8];
    [(_UICalendarHeaderView *)self->_headerView didUpdateCalendar];
    [(_UICalendarWeekdayView *)self->_weekdayView didUpdateCalendar];
    [(_UICalendarMonthYearSelector *)self->_monthYearSelector didUpdateCalendar];
    [(UICalendarSelection *)self->_selectionBehavior didChangeCalendar:v8];
    [(UICalendarView *)self _reloadEverythingIncludingLayout:1];
  }
LABEL_9:
}

- (void)setLocale:(NSLocale *)locale
{
  BOOL v4 = locale;
  BOOL v5 = [(_UICalendarDataModel *)self->_dataModel locale];
  char v8 = v4;
  char v6 = v5;
  if (v6 == v8)
  {

    goto LABEL_9;
  }
  if (!v8 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [(NSLocale *)v8 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(_UICalendarDataModel *)self->_dataModel setLocale:v8];
    [(_UICalendarHeaderView *)self->_headerView didUpdateLocale];
    [(_UICalendarWeekdayView *)self->_weekdayView didUpdateLocale];
    [(_UICalendarMonthYearSelector *)self->_monthYearSelector didUpdateLocale];
    [(UICalendarView *)self _reloadEverythingIncludingLayout:1];
  }
LABEL_9:
}

- (void)setTimeZone:(NSTimeZone *)timeZone
{
  BOOL v4 = timeZone;
  BOOL v5 = [(_UICalendarDataModel *)self->_dataModel timeZone];
  char v8 = v4;
  char v6 = v5;
  if (v6 == v8)
  {

    goto LABEL_9;
  }
  if (!v8 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [(NSTimeZone *)v8 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(_UICalendarDataModel *)self->_dataModel setTimeZone:v8];
    [(_UICalendarHeaderView *)self->_headerView didUpdateTimeZone];
    [(_UICalendarMonthYearSelector *)self->_monthYearSelector didUpdateTimeZone];
    [(UICalendarView *)self _reloadEverythingIncludingLayout:1];
  }
LABEL_9:
}

- (void)setFontDesign:(UIFontDescriptorSystemDesign)fontDesign
{
  BOOL v4 = fontDesign;
  BOOL v5 = [(_UICalendarDataModel *)self->_dataModel fontDesign];
  char v6 = v4;
  char v8 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSString *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(_UICalendarDataModel *)self->_dataModel setFontDesign:v8];
    [(_UICalendarHeaderView *)self->_headerView didUpdateFontDesign];
    [(_UICalendarWeekdayView *)self->_weekdayView didUpdateFontDesign];
    [(UICollectionView *)self->_collectionView reloadData];
    [(UICalendarSelection *)self->_selectionBehavior selectAllDatesAnimated:0];
  }
LABEL_9:
}

- (NSDateInterval)availableDateRange
{
  return [(_UICalendarDataModel *)self->_dataModel availableDateRange];
}

- (void)setAvailableDateRange:(NSDateInterval *)availableDateRange
{
  BOOL v4 = availableDateRange;
  BOOL v5 = [(_UICalendarDataModel *)self->_dataModel availableDateRange];
  char v6 = v4;
  char v8 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSDateInterval *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(_UICalendarDataModel *)self->_dataModel setAvailableDateRange:v8];
    [(UICalendarSelection *)self->_selectionBehavior didChangeAvailableDateRange:v8];
    [(_UICalendarHeaderView *)self->_headerView didUpdateDateRange];
    [(UICalendarView *)self _updateCollectionViewSelection:0];
    [(UICalendarView *)self _reloadEverythingIncludingLayout:0];
  }
LABEL_9:
}

- (NSDateComponents)visibleDateComponents
{
  BOOL v3 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  BOOL v4 = [(_UICalendarDataModel *)self->_dataModel visibleMonth];
  BOOL v5 = [v4 date];
  char v6 = [v3 components:1048590 fromDate:v5];

  return (NSDateComponents *)v6;
}

- (void)setVisibleDateComponents:(NSDateComponents *)visibleDateComponents
{
}

- (void)setVisibleDateComponents:(NSDateComponents *)dateComponents animated:(BOOL)animated
{
  BOOL v4 = animated;
  long long v18 = dateComponents;
  id v6 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  if (v18)
  {
    char v7 = (void *)[(NSDateComponents *)v18 copy];
    char v8 = [v7 calendar];

    if (!v8) {
      [v7 setCalendar:v6];
    }
    if (v6)
    {
      int v9 = [v7 calendar];
      char v10 = [v9 isEqual:v6];

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = [v7 calendar];
        BOOL v12 = [v11 dateFromComponents:v7];

        if (!v12)
        {
          long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
          long long v17 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDateComponents * _Nullable _UICalendarSanitizeWithCalendar(NSDateComponents * _Nonnull __strong, NSCalendar * _Nonnull __strong)");
          [v16 handleFailureInFunction:v17 file:@"_UICalendarViewHelper.h" lineNumber:92 description:@"Date components yielded an invalid NSDate"];
        }
        uint64_t v13 = [v6 components:1048606 fromDate:v12];

        char v7 = (void *)v13;
      }
    }
  }
  else
  {
    char v7 = 0;
  }

  id v14 = [v7 date];

  long long v15 = [(_UIDatePickerCalendarDateComponent *)[_UIDatePickerCalendarMonth alloc] initWithDate:v14 calendar:v6];
  [(UICalendarView *)self _setVisibleMonth:v15 animated:v4];
}

- (void)_freezeContentOffset
{
  p_frozenContentOffset = &self->_frozenContentOffset;
  double y = self->_frozenContentOffset.y;
  double v5 = INFINITY;
  if (self->_frozenContentOffset.x != INFINITY || y != INFINITY)
  {
    char v10 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", INFINITY, y);
    [v10 handleFailureInMethod:a2 object:self file:@"UICalendarView.m" lineNumber:1141 description:@"Frozen content offset found. You need to clear the current one out by calling _restoreContentOffsetWithPageOffset: first."];
  }
  [(UIScrollView *)self->_collectionView contentOffset];
  p_frozenContentOffset->double x = v7;
  p_frozenContentOffset->double y = v8;
}

- (void)_restoreContentOffsetWithPageOffset:(int64_t)a3
{
  p_frozenContentOffset = &self->_frozenContentOffset;
  double x = self->_frozenContentOffset.x;
  double y = self->_frozenContentOffset.y;
  if (x == INFINITY && y == INFINITY)
  {
    char v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"UICalendarView.m" lineNumber:1148 description:@"No content offset found to restore. You need to call _freezeContentOffset first."];
  }
  [(UIView *)self->_collectionView bounds];
  -[UICollectionView setContentOffset:](self->_collectionView, "setContentOffset:", x + CGRectGetWidth(v11) * (double)a3, y);
  CGPoint *p_frozenContentOffset = (CGPoint)InvalidFrozenContentOffset;
}

- (void)_setVisibleMonth:(id)a3
{
}

- (void)_setVisibleMonth:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  CGFloat v8 = [(_UICalendarDataModel *)self->_dataModel visibleMonth];
  char v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    char v10 = [(_UICalendarDataModel *)self->_dataModel availableDateRange];
    char v11 = objc_msgSend(v10, "_ui_containsMonth:", v7);

    if ((v11 & 1) == 0)
    {
      BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"UICalendarView.m" lineNumber:1171 description:@"Unable to set a visible month that is before the minimum or after the maximum date."];
    }
    [(UICalendarView *)self _setVisibleMonth:v7 animated:v4 updateDataSource:1 updateCollectionView:1 notifyDelegate:0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    id v13[2] = __44__UICalendarView__setVisibleMonth_animated___block_invoke;
    v13[3] = &unk_1E52D9F70;
    v13[4] = self;
    [(UICalendarView *)self _performIfNotIgnoringScrollCallbacks:v13];
  }
}

uint64_t __44__UICalendarView__setVisibleMonth_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupDataIfNecessary];
}

- (void)_setVisibleMonth:(id)a3 animated:(BOOL)a4 updateDataSource:(BOOL)a5 updateCollectionView:(BOOL)a6 notifyDelegate:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  uint64_t v13 = [(_UICalendarDataModel *)self->_dataModel availableDateRange];
  int v14 = objc_msgSend(v13, "_ui_containsMonth:", v12);

  if (v14)
  {
    long long v15 = [(UICalendarView *)self visibleDateComponents];
    [(_UICalendarDataModel *)self->_dataModel setVisibleMonth:v12];
    [(_UICalendarHeaderView *)self->_headerView didUpdateVisibleMonth];
    [(_UICalendarMonthYearSelector *)self->_monthYearSelector didUpdateVisibleMonth];
    if (a5 || v8)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      long long v21 = __97__UICalendarView__setVisibleMonth_animated_updateDataSource_updateCollectionView_notifyDelegate___block_invoke;
      double v22 = &unk_1E52D9F98;
      uint64_t v23 = self;
      id v24 = v12;
      [(UICalendarView *)self _performIgnoringScrollCallbacks:&v19];
      -[UICalendarView _updateCollectionViewSelection:](self, "_updateCollectionViewSelection:", 0, v19, v20, v21, v22, v23);
    }
    if (v8) {
      [(UICalendarView *)self _updateCollectionViewScrollPosition:v10];
    }
    long long v16 = [(UICalendarView *)self visibleDateComponents];
    char v17 = [v15 isEqual:v16];

    if (v7 && (v17 & 1) == 0 && (*(unsigned char *)&self->_flags & 0x20) != 0)
    {
      long long v18 = [(UICalendarView *)self delegate];
      [v18 calendarView:self didChangeVisibleDateComponentsFrom:v15];
    }
  }
}

uint64_t __97__UICalendarView__setVisibleMonth_animated_updateDataSource_updateCollectionView_notifyDelegate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _freezeContentOffset];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 432) prepareDataSourceWithScrollPositionIfNecessary:*(void *)(a1 + 40)];
  BOOL v3 = *(void **)(a1 + 32);
  return [v3 _restoreContentOffsetWithPageOffset:v2];
}

- (void)_shouldDifferentiateWithoutColorUpdated:(id)a3
{
}

- (void)_setNeedsCollectionViewSelectionUpdate
{
  *(unsigned char *)&self->_flags |= 1u;
  [(UIView *)self setNeedsLayout];
}

- (void)_setNeedsCollectionViewScrollPositionUpdate
{
  *(unsigned char *)&self->_flags |= 2u;
  [(UIView *)self setNeedsLayout];
}

- (void)_updateCollectionViewSelection:(BOOL)a3
{
  BOOL v3 = a3;
  *(unsigned char *)&self->_flags &= ~1u;
  [(UIView *)self->_collectionView bounds];
  if (v6 == 0.0 || v5 == 0.0)
  {
    [(UICalendarView *)self _setNeedsCollectionViewSelectionUpdate];
  }
  else
  {
    [(UICalendarSelection *)self->_selectionBehavior selectAllDatesAnimated:v3];
    [(UICalendarView *)self _updateCollectionViewContentInsets];
  }
}

- (void)_updateCollectionViewScrollPosition:(BOOL)a3
{
  BOOL v3 = a3;
  *(unsigned char *)&self->_flags &= ~2u;
  [(UIView *)self->_collectionView bounds];
  if (v7 == 0.0 || v6 == 0.0)
  {
    [(UICalendarView *)self _setNeedsCollectionViewScrollPositionUpdate];
  }
  else
  {
    id v14 = [(_UICalendarDataModel *)self->_dataModel visibleMonth];
    BOOL v8 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
    char v9 = [v8 sectionIdentifiers];
    uint64_t v10 = [v9 indexOfObject:v14];

    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"UICalendarView.m" lineNumber:1273 description:@"Trying to scroll to a month marked as visible that is not loaded."];
    }
    collectionView = self->_collectionView;
    id v12 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v10];
    [(UICollectionView *)collectionView scrollToItemAtIndexPath:v12 atScrollPosition:9 animated:v3];
  }
}

- (void)_updateCollectionViewContentInsets
{
  BOOL v4 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  id v17 = [v4 sectionIdentifiers];

  if ((unint64_t)[v17 count] <= 2)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UICalendarView.m", 1282, @"Internal inconsistency. Unable to set content insets, need at least 3 loaded months." object file lineNumber description];
  }
  if ([v17 count])
  {
    unint64_t v5 = 0;
    while (1)
    {
      double v6 = [(_UICalendarDataModel *)self->_dataModel availableDateRange];
      double v7 = [v17 objectAtIndexedSubscript:v5];
      char v8 = objc_msgSend(v6, "_ui_containsMonth:", v7);

      if (v8) {
        break;
      }
      if (++v5 >= [v17 count]) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v9 = [v17 count];
  while (--v9 >= 0)
  {
    uint64_t v10 = [(_UICalendarDataModel *)self->_dataModel availableDateRange];
    char v11 = [v17 objectAtIndexedSubscript:v9];
    int v12 = objc_msgSend(v10, "_ui_containsMonth:", v11);

    if (v12) {
      goto LABEL_13;
    }
  }
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"UICalendarView.m" lineNumber:1306 description:@"Invalid state. Unable to find a lower bounds in range."];
  }
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"UICalendarView.m" lineNumber:1307 description:@"Invalid state. Unable to find an upper bounds in range."];
  }
  [(UIView *)self->_collectionView bounds];
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", 0.0, -(v13 * (double)v5), 0.0, -(v13 * (double)(unint64_t)([v17 count] + ~v9)));
}

- (void)_performIgnoringScrollCallbacks:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  id v8 = v5;
  if ((flags & 8) != 0)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UICalendarView.m" lineNumber:1320 description:@"A block is already being executed while ignoring scroll callbacks. This guard is not reentrant safe."];

    id v5 = v8;
    char flags = (char)self->_flags;
  }
  *(unsigned char *)&self->_char flags = flags | 8;
  (*((void (**)(void))v5 + 2))();
  *(unsigned char *)&self->_flags &= ~8u;
}

- (void)_performIfNotIgnoringScrollCallbacks:(id)a3
{
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_updateVisibleMonthIfNecessary
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->_collectionView;
  if (![(UIScrollView *)v3 isScrollAnimating])
  {
    [(UIScrollView *)v3 contentOffset];
    double v5 = v4;
    CGFloat v7 = v6;
    [(UIView *)v3 bounds];
    double v8 = v5 + CGRectGetWidth(v34) * 0.5;
    [(UIView *)v3 bounds];
    unint64_t v9 = (unint64_t)(v8 / CGRectGetWidth(v35));
    uint64_t v10 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
    char v11 = [v10 sectionIdentifiers];

    if ([v11 count] > v9)
    {
      int v12 = [v11 objectAtIndexedSubscript:v9];
      double v13 = [(_UICalendarDataModel *)self->_dataModel visibleMonth];
      char v14 = [v13 isEqual:v12];

      if ((v14 & 1) == 0) {
        [(UICalendarView *)self _setVisibleMonth:v12 animated:0 updateDataSource:1 updateCollectionView:0 notifyDelegate:1];
      }

      goto LABEL_11;
    }
    if (os_variant_has_internal_diagnostics())
    {
      long long v16 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        goto LABEL_10;
      }
      [(UIView *)v3 bounds];
      v32.double width = v21;
      v32.double height = v22;
      uint64_t v19 = NSStringFromCGSize(v32);
      v33.double x = v5;
      v33.double y = v7;
      uint64_t v20 = NSStringFromCGPoint(v33);
      int v23 = 138412802;
      id v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v19;
      __int16 v27 = 2112;
      uint64_t v28 = v20;
      _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "[UIDatePicker] Calendar scroll offset is outside of available sections (%@). bounds.size: %@, contentOffset: %@", (uint8_t *)&v23, 0x20u);
    }
    else
    {
      long long v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateVisibleMonthIfNecessary___s_category) + 8);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        goto LABEL_12;
      }
      long long v16 = v15;
      [(UIView *)v3 bounds];
      v30.double width = v17;
      v30.double height = v18;
      uint64_t v19 = NSStringFromCGSize(v30);
      v31.double x = v5;
      v31.double y = v7;
      uint64_t v20 = NSStringFromCGPoint(v31);
      int v23 = 138412802;
      id v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v19;
      __int16 v27 = 2112;
      uint64_t v28 = v20;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "[UIDatePicker] Calendar scroll offset is outside of available sections (%@). bounds.size: %@, contentOffset: %@", (uint8_t *)&v23, 0x20u);
    }

LABEL_10:
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_cleanupDataIfNecessary
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__UICalendarView__cleanupDataIfNecessary__block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  [(UICalendarView *)self _performIgnoringScrollCallbacks:v3];
  [(UICalendarView *)self _updateCollectionViewSelection:0];
}

uint64_t __41__UICalendarView__cleanupDataIfNecessary__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _freezeContentOffset];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 432);
  double v4 = [*(id *)(v2 + 520) visibleMonth];
  uint64_t v5 = [v3 cleanupDataSourceWithScrollPositionIfNecessary:v4];

  double v6 = *(void **)(a1 + 32);
  return [v6 _restoreContentOffsetWithPageOffset:v5];
}

- (void)scrollViewDidScroll:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__UICalendarView_scrollViewDidScroll___block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  [(UICalendarView *)self _performIfNotIgnoringScrollCallbacks:v3];
}

uint64_t __38__UICalendarView_scrollViewDidScroll___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVisibleMonthIfNecessary];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__UICalendarView_scrollViewDidEndScrollingAnimation___block_invoke;
  v6[3] = &unk_1E52D9F98;
  id v7 = v4;
  double v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __53__UICalendarView_scrollViewDidEndScrollingAnimation___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isScrollAnimating];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) isTracking];
    if ((result & 1) == 0)
    {
      uint64_t result = [*(id *)(a1 + 32) isDecelerating];
      if ((result & 1) == 0)
      {
        uint64_t result = [*(id *)(a1 + 32) isDragging];
        if ((result & 1) == 0)
        {
          [*(id *)(a1 + 40) _updateVisibleMonthIfNecessary];
          BOOL v3 = *(void **)(a1 + 40);
          v4[0] = MEMORY[0x1E4F143A8];
          v4[1] = 3221225472;
          v4[2] = __53__UICalendarView_scrollViewDidEndScrollingAnimation___block_invoke_2;
          v4[3] = &unk_1E52D9F70;
          v4[4] = v3;
          return [v3 _performIfNotIgnoringScrollCallbacks:v4];
        }
      }
    }
  }
  return result;
}

uint64_t __53__UICalendarView_scrollViewDidEndScrollingAnimation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupDataIfNecessary];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__UICalendarView_scrollViewDidEndDecelerating___block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  [(UICalendarView *)self _performIfNotIgnoringScrollCallbacks:v3];
}

uint64_t __47__UICalendarView_scrollViewDidEndDecelerating___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupDataIfNecessary];
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)@"UICalendarView";
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (UICalendarSelection)selectionBehavior
{
  return self->_selectionBehavior;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (_UICalendarHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (_UICalendarWeekdayView)weekdayView
{
  return self->_weekdayView;
}

- (void)setWeekdayView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (void)setDecorationSystem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationSystem, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_weekdayView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_selectionBehavior, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataModel, 0);
  objc_storeStrong((id *)&self->_daySizingLabel, 0);
  objc_storeStrong((id *)&self->_monthYearSelector, 0);
  objc_storeStrong((id *)&self->_dataSourceController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_cellFormatter, 0);
}

@end