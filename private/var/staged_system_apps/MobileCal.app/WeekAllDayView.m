@interface WeekAllDayView
+ (UIEdgeInsets)occurrencePaddingForSizeClass:(int64_t)a3;
+ (double)_compactRoundedRectHeightForSizeClass:(int64_t)a3;
+ (double)_fontSizeForSizeClass:(int64_t)a3;
+ (double)_heightForWeekdayLabelsForSizeClass:(int64_t)a3;
+ (double)_overlayFontSize;
+ (double)_yOffsetForWeekdayLabelsWithSizeClass:(int64_t)a3;
+ (double)baselineForWeekdayLabelsWithSizeClass:(int64_t)a3;
+ (double)dayLabelHeightWithSizeClass:(int64_t)a3 usesMultiDay:(BOOL)a4;
+ (double)occurrenceInsetIntoScrollerWithSizeClassRegular:(BOOL)a3;
+ (id)_dayLabelFontForSizeClass:(int64_t)a3;
+ (id)_todayDayLabelFontForSizeClass:(int64_t)a3;
- (BOOL)_shouldAnnotateAppEntitiesForDay:(id)a3;
- (BOOL)allowsOccurrenceSelection;
- (BOOL)dateIsWeekend:(id)a3;
- (BOOL)hasOccurrences;
- (BOOL)leftMarginIncludesTimeView;
- (BOOL)receiveTapsInHeader;
- (BOOL)scrollerIsParentOfView:(id)a3;
- (BOOL)showSeparatorLines;
- (BOOL)showsHalfOfScrolledEvents;
- (BOOL)useMultiDayHeaderStyle;
- (BOOL)usesSmallText;
- (CGPoint)contentOffset;
- (CGRect)_frameForOccurrenceBlock:(id)a3 index:(unint64_t)a4 yPos:(double)a5 padding:(double)a6;
- (CGRect)_numberFrameForDayIndex:(int64_t)a3;
- (CGRect)_weekdayFrameForDayIndex:(int64_t)a3;
- (CGSize)_circleSize;
- (CGSize)scrollerContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)weekViewClass;
- (EKEvent)dimmedOccurrence;
- (NSArray)occurrenceViews;
- (NSCalendar)calendar;
- (NSDateComponents)startDate;
- (NSTimeZone)timeZone;
- (UIEdgeInsets)_occurrencePadding;
- (WeekAllDayView)initWithFrame:(CGRect)a3 orientation:(int64_t)a4 numberOfDaysToDisplay:(unint64_t)a5 opaque:(BOOL)a6 backgroundColor:(id)a7 rightClickDelegate:(id)a8;
- (WeekAllDayViewDelegate)delegate;
- (double)_dateForPoint:(CGPoint)a3;
- (double)_dayWidth;
- (double)baselineForWeekdayNumbers;
- (double)firstEventYOffset;
- (double)fixedDayHeight;
- (double)fixedDayWidth;
- (double)heightForNumberOfOccurrences:(unint64_t)a3;
- (double)heightWithoutNoAllDayOccurrences;
- (double)multiDayViewVisibleHeightWithUserVisibleEarliestDate:(id)a3 latestDate:(id)a4;
- (double)naturalHeight;
- (double)nextAvailableOccurrenceViewYOriginForDay:(id)a3;
- (double)occurrenceHeight;
- (double)occurrenceInsetIntoScroller;
- (double)scrollerContentHeightForNumberOfOccurrences:(unint64_t)a3;
- (double)scrollerContentHeightWithUserVisibleEarliestDate:(id)a3 latestDate:(id)a4;
- (id)_allDayOccurrenceBlocksForEvents:(id)a3 rangeStart:(id)a4 rangeEnd:(id)a5;
- (id)_calendarOrderSortDescriptor;
- (id)_dayLabelColorAtDayIndex:(int64_t)a3 isWeekend:(BOOL)a4;
- (id)_dayOccurrenceViewForEvent:(id)a3 block:(id)a4;
- (id)_extractEventsEndingAfterTimeframeFrom:(id)a3;
- (id)_extractEventsStartingBeforeTimeframeFrom:(id)a3;
- (id)_getSortedBlocksFromOccurrenceBlocks:(id)a3;
- (id)_numberOfDaysSortDescriptor;
- (id)_rangeEnd;
- (id)_rangeStart;
- (id)_sortBlocks:(id)a3 intoRowsUsingDataFrom:(id)a4;
- (id)occurrenceViewForEvent:(id)a3;
- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4;
- (id)occurrenceViewForOccurrence:(id)a3;
- (id)presentationControllerForEditMenu;
- (id)selectedEvent;
- (id)selectedEventsForEditMenu;
- (id)selectedOccurrenceView;
- (int64_t)_dayIndexForToday;
- (int64_t)_specialDayTypeForOccurrence:(id)a3;
- (int64_t)dayIndexForCalendarDate:(id)a3;
- (int64_t)daysToDisplay;
- (int64_t)maxRowCountWithUserVisibleEarliestDate:(id)a3 latestDate:(id)a4;
- (int64_t)orientation;
- (int64_t)rowIndexOfOccurrence:(id)a3;
- (int64_t)totalRowCount;
- (unint64_t)_calendarOrderForCalendar:(id)a3;
- (unint64_t)maxOccurrencesWithoutScroller;
- (void)_buildDayNumberViews;
- (void)_buildVerticalDaySeparators;
- (void)_computeDayStartsAndEndDate;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)_fadeInOccurrenceView:(id)a3 animated:(BOOL)a4;
- (void)_layoutDayNumberCells;
- (void)_layoutVerticalDaySeparators;
- (void)_localeChanged:(id)a3;
- (void)_setNeedsHeaderUpdate;
- (void)_tapReceived:(id)a3;
- (void)_updateCell:(id)a3 withBadgeDataIndex:(unint64_t)a4;
- (void)_updateDayBadges;
- (void)_updateHeaderViewsIfNeeded;
- (void)_updateShouldAnnotateByDay;
- (void)addViewToScroller:(id)a3;
- (void)attemptDisplayReviewPrompt;
- (void)clearTemporaryViews;
- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4;
- (void)dealloc;
- (void)emptySpaceClickForCalendarWeekDayEventContent:(id)a3 atPoint:(CGPoint)a4;
- (void)iterateThroughEachAllDayRow:(id)a3;
- (void)iterateThroughEachOccurrence:(id)a3;
- (void)layedOutRowsRemoveAllObjects;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)rectBecameVisible:(CGRect)a3;
- (void)saveTemporaryViews;
- (void)scrollToEvent:(id)a3 animating:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)selectEvent:(id)a3;
- (void)setAllowsOccurrenceSelection:(BOOL)a3;
- (void)setCalendar:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmedOccurrence:(id)a3;
- (void)setFixedDayHeight:(double)a3;
- (void)setFixedDayWidth:(double)a3;
- (void)setLeftMarginIncludesTimeView:(BOOL)a3;
- (void)setOccurrences:(id)a3 animated:(BOOL)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setReceiveTapsInHeader:(BOOL)a3;
- (void)setScrollerContentSize:(CGSize)a3;
- (void)setShowSeparatorLines:(BOOL)a3;
- (void)setShowsHalfOfScrolledEvents:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTotalRowCount:(int64_t)a3;
- (void)setUseMultiDayHeaderStyle:(BOOL)a3;
- (void)setUsesSmallText:(BOOL)a3;
- (void)setViewsDimmed:(BOOL)a3 forEvent:(id)a4;
- (void)shouldAnnotateAppEntitiesChanged;
- (void)showOverlayMonthInCellAtOffset:(double)a3 animated:(BOOL)a4;
- (void)updateSeparatorVisibility;
- (void)updateTotalRowCountWithContainerRect:(CGRect)a3;
@end

@implementation WeekAllDayView

- (int64_t)daysToDisplay
{
  v2 = [(WeekAllDayView *)self weekViewClass];

  return (int64_t)[(objc_class *)v2 numMultiDays];
}

- (Class)weekViewClass
{
  [(WeekAllDayView *)self useMultiDayHeaderStyle];
  id v2 = (id)objc_opt_class();

  return (Class)v2;
}

- (WeekAllDayView)initWithFrame:(CGRect)a3 orientation:(int64_t)a4 numberOfDaysToDisplay:(unint64_t)a5 opaque:(BOOL)a6 backgroundColor:(id)a7 rightClickDelegate:(id)a8
{
  BOOL v9 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a7;
  id v18 = a8;
  v49.receiver = self;
  v49.super_class = (Class)WeekAllDayView;
  v19 = -[WeekAllDayView initWithFrame:](&v49, "initWithFrame:", x, y, width, height);
  v20 = v19;
  if (v19)
  {
    [(WeekAllDayView *)v19 setAutoresizingMask:2];
    [(WeekAllDayView *)v20 setBackgroundColor:v17];
    [(WeekAllDayView *)v20 setOpaque:v9];
    uint64_t v21 = CUIKCalendar();
    calendar = v20->_calendar;
    v20->_calendar = (NSCalendar *)v21;

    v20->_orientation = a4;
    v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    layedOutRows = v20->_layedOutRows;
    v20->_layedOutRows = v23;

    v25 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    layedOutRowsForEachDadouble y = v20->_layedOutRowsForEachDay;
    v20->_layedOutRowsForEachDadouble y = v25;

    v20->_daysToDispladouble y = a5;
    v20->_allowsOccurrenceSelection = 1;
    id v27 = objc_alloc((Class)UIScrollView);
    [(WeekViewAllDayContents *)v20->_contentView bounds];
    v28 = [v27 initWithFrame:];
    scroller = v20->_scroller;
    v20->_scroller = v28;

    [(UIScrollView *)v20->_scroller setAutoresizingMask:2];
    [(UIScrollView *)v20->_scroller setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v20->_scroller setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v20->_scroller setBounces:1];
    [(UIScrollView *)v20->_scroller setScrollsToTop:0];
    [(UIScrollView *)v20->_scroller setDelegate:v20];
    v30 = CUIKAllDayBackgroundColor();
    [(UIScrollView *)v20->_scroller setBackgroundColor:v30];

    [(UIScrollView *)v20->_scroller _setAutoScrollEnabled:0];
    [(WeekAllDayView *)v20 addSubview:v20->_scroller];
    v31 = [WeekViewAllDayContents alloc];
    [(WeekAllDayView *)v20 bounds];
    v32 = -[WeekViewAllDayContents initWithFrame:](v31, "initWithFrame:");
    contentView = v20->_contentView;
    v20->_contentView = v32;

    [(WeekViewAllDayContents *)v20->_contentView setAutoresizingMask:2];
    [(WeekViewAllDayContents *)v20->_contentView setDelegate:v20];
    v34 = CUIKAllDayBackgroundColor();
    [(WeekViewAllDayContents *)v20->_contentView setBackgroundColor:v34];

    v35 = v20->_contentView;
    id v36 = [objc_alloc((Class)EKUIRightClickEmptySpaceInteraction) initWithDelegate:v18];
    [(WeekViewAllDayContents *)v35 addInteraction:v36];

    [(UIScrollView *)v20->_scroller addSubview:v20->_contentView];
    v37 = (UIView *)objc_alloc_init((Class)UIView);
    topSeparator = v20->_topSeparator;
    v20->_topSeparator = v37;

    v39 = +[UIColor separatorColor];
    [(UIView *)v20->_topSeparator setBackgroundColor:v39];

    [(UIView *)v20->_topSeparator setHidden:1];
    [(WeekAllDayView *)v20 addSubview:v20->_topSeparator];
    v40 = (UIView *)objc_alloc_init((Class)UIView);
    bottomSeparator = v20->_bottomSeparator;
    v20->_bottomSeparator = v40;

    v42 = +[UIColor separatorColor];
    [(UIView *)v20->_bottomSeparator setBackgroundColor:v42];

    [(UIView *)v20->_bottomSeparator setHidden:1];
    [(WeekAllDayView *)v20 addSubview:v20->_bottomSeparator];
    uint64_t v43 = objc_opt_new();
    temporaryViewCacheByDadouble y = v20->_temporaryViewCacheByDay;
    v20->_temporaryViewCacheByDadouble y = (NSMutableDictionary *)v43;

    uint64_t v45 = +[NSMutableDictionary dictionary];
    cachedVisibleHeightMap = v20->_cachedVisibleHeightMap;
    v20->_cachedVisibleHeightMap = (NSMutableDictionary *)v45;

    v47 = +[NSNotificationCenter defaultCenter];
    [v47 addObserver:v20 selector:"_localeChanged:" name:CUIKLocaleChangedNotification object:0];
    [v47 addObserver:v20 selector:"_significantTimeChanged:" name:CUIKCalendarModelSignificantTimeChangeNotification object:0];
    [v47 addObserver:v20 selector:"_contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v20;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CUIKLocaleChangedNotification object:0];
  [v3 removeObserver:self name:CUIKCalendarModelSignificantTimeChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)WeekAllDayView;
  [(WeekAllDayView *)&v4 dealloc];
}

- (void)_localeChanged:(id)a3
{
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy()) {
    +[DayNavigationViewCell localeChanged];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  objc_super v4 = self->_dayNumberViews;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) updateOverlay:v9];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(WeekAllDayView *)self _setNeedsHeaderUpdate];
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  IsRegularInViewHierarchdouble y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy();
  id v5 = off_1001D1C00;
  if (!IsRegularInViewHierarchy) {
    id v5 = off_1001D1C68;
  }
  [(__objc2_class *)*v5 contentSizeCategoryChanged];

  [(WeekAllDayView *)self _setNeedsHeaderUpdate];
}

- (void)iterateThroughEachAllDayRow:(id)a3
{
  objc_super v4 = (void (**)(id, uint64_t, void, char *, char *))a3;
  if ([(WeekAllDayView *)self splitMultiDayEvents])
  {
    long long v35 = 0uLL;
    long long v36 = 0uLL;
    long long v33 = 0uLL;
    long long v34 = 0uLL;
    id v5 = self->_layedOutRowsForEachDay;
    id v23 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v23)
    {
      uint64_t v6 = 0;
      uint64_t v7 = *(void *)v34;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          char v32 = 0;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v10 = v9;
          long long v11 = (char *)[v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
          if (v11)
          {
            long long v12 = v11;
            uint64_t v13 = 0;
            uint64_t v14 = *(void *)v29;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(void *)v29 != v14) {
                  objc_enumerationMutation(v10);
                }
                v4[2](v4, v6, *(void *)(*((void *)&v28 + 1) + 8 * (void)j), &j[v13], &v32);
                if (v32)
                {

                  goto LABEL_28;
                }
              }
              long long v12 = (char *)[v10 countByEnumeratingWithState:&v28 objects:v38 count:16];
              v13 += (uint64_t)j;
              if (v12) {
                continue;
              }
              break;
            }
          }

          ++v6;
          uint64_t v7 = v22;
        }
        id v23 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v23);
    }
  }
  else
  {
    long long v26 = 0uLL;
    long long v27 = 0uLL;
    long long v24 = 0uLL;
    long long v25 = 0uLL;
    id v5 = self->_layedOutRows;
    id v16 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v37 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v25;
LABEL_20:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v5);
        }
        uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * v20);
        char v32 = 0;
        v4[2](v4, -1, v21, (char *)(v18 + v20), &v32);
        if (v32) {
          break;
        }
        if (v17 == (id)++v20)
        {
          id v17 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v37 count:16];
          v18 += v20;
          if (v17) {
            goto LABEL_20;
          }
          break;
        }
      }
    }
  }
LABEL_28:
}

- (void)iterateThroughEachOccurrence:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003945C;
  v5[3] = &unk_1001D2BB0;
  id v6 = a3;
  id v4 = v6;
  [(WeekAllDayView *)self iterateThroughEachAllDayRow:v5];
}

- (void)setUseMultiDayHeaderStyle:(BOOL)a3
{
  if (self->_useMultiDayHeaderStyle != a3)
  {
    self->_useMultiDayHeaderStyle = a3;
    [(WeekAllDayView *)self updateSeparatorVisibility];
  }
}

- (void)updateSeparatorVisibility
{
  if (self->_useMultiDayHeaderStyle)
  {
    topSeparator = self->_topSeparator;
    uint64_t v4 = 1;
LABEL_5:
    [(UIView *)topSeparator setHidden:v4];
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  topSeparator = self->_topSeparator;
  if (self->_showSeparatorLines)
  {
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  uint64_t v5 = 1;
  [(UIView *)topSeparator setHidden:1];
LABEL_6:
  bottomSeparator = self->_bottomSeparator;

  [(UIView *)bottomSeparator setHidden:v5];
}

- (void)setUsesSmallText:(BOOL)a3
{
  if (self->_usesSmallText != a3)
  {
    self->_usesSmallText = a3;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000396C8;
    v3[3] = &unk_1001D2BD0;
    BOOL v4 = a3;
    [(WeekAllDayView *)self iterateThroughEachOccurrence:v3];
  }
}

- (void)layedOutRowsRemoveAllObjects
{
  if ([(WeekAllDayView *)self splitMultiDayEvents])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = self->_layedOutRowsForEachDay;
    id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) removeAllObjects];
          uint64_t v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  else
  {
    layedOutRows = self->_layedOutRows;
    [(NSMutableArray *)layedOutRows removeAllObjects];
  }
}

- (void)showOverlayMonthInCellAtOffset:(double)a3 animated:(BOOL)a4
{
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy())
  {
    dayNumberViews = self->_dayNumberViews;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003990C;
    v8[3] = &unk_1001D2BF8;
    v8[4] = self;
    *(double *)&v8[5] = a3;
    BOOL v9 = a4;
    [(NSArray *)dayNumberViews enumerateObjectsUsingBlock:v8];
  }
}

- (void)setShowSeparatorLines:(BOOL)a3
{
  self->_showSeparatorLines = a3;
  [(WeekAllDayView *)self updateSeparatorVisibility];
}

- (void)setContentOffset:(CGPoint)a3
{
}

- (CGPoint)contentOffset
{
  [(UIScrollView *)self->_scroller contentOffset];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(WeekAllDayView *)self setNeedsLayout];
  }
}

- (double)occurrenceHeight
{
  uint64_t v3 = EKUIWidthSizeClassForViewHierarchy();
  unsigned int v4 = [(objc_class *)[(WeekAllDayView *)self weekViewClass] usesSmallTextForIsCompact:v3 == 1];
  id v5 = +[EKUISemiConstantCache sharedInstance];
  uint64_t v6 = v5;
  if (v4)
  {
    [v5 weekAllDayOccurrenceHeightSmallText];
    double v8 = v7;

    if (v8 < 0.0)
    {
      +[EKDayOccurrenceView heightForAllDayOccurrenceForSizeClass:v3 usesSmallText:1];
      CalRoundToScreenScale();
      double v10 = v9;
      long long v11 = +[EKUISemiConstantCache sharedInstance];
      [v11 setWeekAllDayOccurrenceHeightSmallText:v10];
    }
    long long v12 = +[EKUISemiConstantCache sharedInstance];
    [v12 weekAllDayOccurrenceHeightSmallText];
  }
  else
  {
    [v5 weekAllDayOccurrenceHeight];
    double v15 = v14;

    if (v15 < 0.0)
    {
      +[EKDayOccurrenceView heightForAllDayOccurrenceForSizeClass:v3 usesSmallText:0];
      CalRoundToScreenScale();
      double v17 = v16;
      uint64_t v18 = +[EKUISemiConstantCache sharedInstance];
      [v18 setWeekAllDayOccurrenceHeight:v17];
    }
    long long v12 = +[EKUISemiConstantCache sharedInstance];
    [v12 weekAllDayOccurrenceHeight];
  }
  double v19 = v13;

  return v19;
}

- (void)_computeDayStartsAndEndDate
{
  if (self->_startDate && self->_calendar)
  {
    id obj = [objc_alloc((Class)NSMutableArray) initWithCapacity:self->_daysToDisplay];
    uint64_t v3 = [(NSCalendar *)self->_calendar timeZone];
    unsigned int v4 = +[EKCalendarDate calendarDateWithDateComponents:self->_startDate timeZone:v3];
    char IsLeftToRight = CalTimeDirectionIsLeftToRight();
    if (IsLeftToRight)
    {
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v7 = [v4 calendarDateByAddingDays:self->_daysToDisplay - 1];

      uint64_t v6 = -1;
      unsigned int v4 = (void *)v7;
    }
    double v8 = obj;
    if (self->_daysToDisplay)
    {
      unint64_t v9 = 0;
      do
      {
        [v8 addObject:v4];
        double v10 = [v4 calendarDateByAddingDays:v6];

        double v8 = obj;
        ++v9;
        unsigned int v4 = v10;
      }
      while (v9 < self->_daysToDisplay);
    }
    else
    {
      double v10 = v4;
    }
    objc_storeStrong((id *)&self->_dayStarts, v8);
    if (IsLeftToRight) {
      [obj lastObject];
    }
    else {
    long long v11 = [obj firstObject];
    }
    long long v12 = [v11 allComponents];
    endDate = self->_endDate;
    self->_endDate = v12;

    [(WeekAllDayView *)self _buildDayNumberViews];
    [(WeekAllDayView *)self _updateShouldAnnotateByDay];
  }
}

- (BOOL)_shouldAnnotateAppEntitiesForDay:(id)a3
{
  id v4 = a3;
  shouldAnnotateByDadouble y = self->_shouldAnnotateByDay;
  if (!shouldAnnotateByDay)
  {
    [(WeekAllDayView *)self _updateShouldAnnotateByDay];
    shouldAnnotateByDadouble y = self->_shouldAnnotateByDay;
  }
  uint64_t v6 = [(NSMutableDictionary *)shouldAnnotateByDay objectForKeyedSubscript:v4];
  unsigned __int8 v7 = [v6 BOOLValue];

  return v7;
}

- (void)_updateShouldAnnotateByDay
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    shouldAnnotateByDadouble y = self->_shouldAnnotateByDay;
    if (shouldAnnotateByDay)
    {
      [(NSMutableDictionary *)shouldAnnotateByDay removeAllObjects];
    }
    else
    {
      unsigned __int8 v7 = +[NSMutableDictionary dictionaryWithCapacity:self->_daysToDisplay];
      double v8 = self->_shouldAnnotateByDay;
      self->_shouldAnnotateByDadouble y = v7;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = self->_dayStarts;
    id v9 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        long long v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(obj);
          }
          double v13 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v12);
          id v14 = objc_loadWeakRetained((id *)p_delegate);
          id v15 = [v14 weekAllDayViewShouldAnnotateAppEntities:self onDayStarting:v13];

          double v16 = +[NSNumber numberWithBool:v15];
          double v17 = self->_shouldAnnotateByDay;
          uint64_t v18 = [v13 date];
          [(NSMutableDictionary *)v17 setObject:v16 forKeyedSubscript:v18];

          long long v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [(NSArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
  }
}

- (void)shouldAnnotateAppEntitiesChanged
{
  [(WeekAllDayView *)self _updateShouldAnnotateByDay];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100039FC0;
  v3[3] = &unk_1001D2C20;
  void v3[4] = self;
  [(WeekAllDayView *)self iterateThroughEachOccurrence:v3];
}

- (void)setStartDate:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_startDate] & 1) == 0)
  {
    id v4 = [v6 dateComponentsForDateOnly];
    startDate = self->_startDate;
    self->_startDate = v4;

    [(WeekAllDayView *)self _computeDayStartsAndEndDate];
    [(WeekAllDayView *)self _setNeedsHeaderUpdate];
  }
}

- (void)setCalendar:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_calendar] & 1) == 0)
  {
    id v4 = (NSCalendar *)[v6 copy];
    calendar = self->_calendar;
    self->_calendar = v4;

    [(WeekAllDayView *)self _computeDayStartsAndEndDate];
    [(WeekAllDayView *)self _setNeedsHeaderUpdate];
  }
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  id v4 = [(NSCalendar *)self->_calendar timeZone];
  unsigned __int8 v5 = [v6 isEqualToTimeZone:v4];

  if ((v5 & 1) == 0)
  {
    [(NSCalendar *)self->_calendar setTimeZone:v6];
    [(WeekAllDayView *)self _computeDayStartsAndEndDate];
    [(WeekAllDayView *)self _setNeedsHeaderUpdate];
  }
}

- (NSTimeZone)timeZone
{
  return [(NSCalendar *)self->_calendar timeZone];
}

- (void)setFixedDayWidth:(double)a3
{
  if (self->_fixedDayWidth != a3)
  {
    self->_fixedDayWidth = a3;
    [(WeekAllDayView *)self setNeedsLayout];
  }
}

- (id)selectedOccurrenceView
{
  return self->_selectedOccurrenceView;
}

- (void)rectBecameVisible:(CGRect)a3
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(NSMutableDictionary *)self->_cachedVisibleHeightMap removeAllObjects];
  [(UIScrollView *)self->_scroller contentSize];
  CGFloat v8 = v7;
  -[WeekAllDayView updateTotalRowCountWithContainerRect:](self, "updateTotalRowCountWithContainerRect:", x, y, width, v7);
  self->_latestVisibleRect.origin.double x = x;
  self->_latestVisibleRect.origin.double y = y;
  self->_latestVisibleRect.size.double width = width;
  self->_latestVisibleRect.size.double height = v8;
}

- (id)occurrenceViewForOccurrence:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    long long v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = sub_10003A45C;
    id v15 = sub_10003A46C;
    id v16 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003A474;
    v8[3] = &unk_1001D2C48;
    id v9 = v4;
    id v10 = &v11;
    [(WeekAllDayView *)self iterateThroughEachOccurrence:v8];
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)scrollToEvent:(id)a3 animating:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (self->_scroller)
  {
    id v10 = v7;
    if (v4 && !self->_scrollingToOccurrence) {
      objc_storeStrong((id *)&self->_scrollingToOccurrence, a3);
    }
    CGFloat v8 = [(WeekAllDayView *)self occurrenceViewForOccurrence:v10];
    scroller = self->_scroller;
    [v8 frame];
    -[UIScrollView scrollRectToVisible:animated:](scroller, "scrollRectToVisible:animated:", v4);
  }

  _objc_release_x2();
}

- (void)setAllowsOccurrenceSelection:(BOOL)a3
{
  if (self->_allowsOccurrenceSelection != a3)
  {
    self->_allowsOccurrenceSelection = a3;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003A664;
    v3[3] = &unk_1001D2C20;
    void v3[4] = self;
    [(WeekAllDayView *)self iterateThroughEachOccurrence:v3];
  }
}

- (void)setViewsDimmed:(BOOL)a3 forEvent:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003A760;
  v7[3] = &unk_1001D2C70;
  id v8 = a4;
  BOOL v9 = a3;
  id v6 = v8;
  [(WeekAllDayView *)self iterateThroughEachOccurrence:v7];
}

- (id)selectedEvent
{
  return self->_selectedEvent;
}

- (BOOL)hasOccurrences
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003A8C8;
  v4[3] = &unk_1001D2C98;
  v4[4] = &v5;
  [(WeekAllDayView *)self iterateThroughEachOccurrence:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)selectEvent:(id)a3
{
  BOOL v4 = (EKEvent *)a3;
  uint64_t v5 = v4;
  if (v4 && self->_selectedEvent != v4)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003AA68;
    v7[3] = &unk_1001D2C48;
    char v8 = v4;
    BOOL v9 = &v10;
    [(WeekAllDayView *)self iterateThroughEachOccurrence:v7];
    if (!*((unsigned char *)v11 + 24))
    {
      id v6 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        id v15 = "-[WeekAllDayView selectEvent:]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s: Asked to select an event we can't find!", buf, 0xCu);
      }
    }

    _Block_object_dispose(&v10, 8);
  }
}

- (void)setDimmedOccurrence:(id)a3
{
  p_dimmedOccurrence = &self->_dimmedOccurrence;
  id v6 = a3;
  if (([v6 isEqual:*p_dimmedOccurrence] & 1) == 0)
  {
    if (*p_dimmedOccurrence) {
      -[WeekAllDayView setViewsDimmed:forEvent:](self, "setViewsDimmed:forEvent:", 0);
    }
    objc_storeStrong((id *)&self->_dimmedOccurrence, a3);
    if (*p_dimmedOccurrence) {
      -[WeekAllDayView setViewsDimmed:forEvent:](self, "setViewsDimmed:forEvent:", 1);
    }
  }
}

- (NSArray)occurrenceViews
{
  +[NSMutableArray array];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003AC30;
  v5[3] = &unk_1001D2C20;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  [(WeekAllDayView *)self iterateThroughEachOccurrence:v5];

  return (NSArray *)v3;
}

- (id)occurrenceViewForEvent:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = sub_10003A45C;
  id v14 = sub_10003A46C;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003ADB0;
  v7[3] = &unk_1001D2C48;
  id v4 = a3;
  id v8 = v4;
  BOOL v9 = &v10;
  [(WeekAllDayView *)self iterateThroughEachOccurrence:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (int64_t)dayIndexForCalendarDate:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_dayStarts;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    int64_t v10 = -1;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "isEqual:", v4, (void)v13)) {
          int64_t v10 = (int64_t)i + v8;
        }
      }
      v8 += (uint64_t)v7;
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v10 = -1;
  }

  return v10;
}

- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(WeekAllDayView *)self useMultiDayHeaderStyle];
  if (v7 && (v8 & 1) != 0)
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = sub_10003A45C;
    double v19 = sub_10003A46C;
    id v20 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003B2F0;
    v11[3] = &unk_1001D2CC0;
    int64_t v14 = [(WeekAllDayView *)self dayIndexForCalendarDate:v7];
    id v12 = v6;
    long long v13 = &v15;
    [(WeekAllDayView *)self iterateThroughEachAllDayRow:v11];
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = [(WeekAllDayView *)self occurrenceViewForEvent:v6];
  }

  return v9;
}

- (id)_getSortedBlocksFromOccurrenceBlocks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSArray);
  id v6 = [(WeekAllDayView *)self _calendarOrderSortDescriptor];
  id v7 = [(WeekAllDayView *)self _numberOfDaysSortDescriptor];
  id v8 = [v5 initWithObjects:v6, v7];

  id v9 = [v4 sortedArrayUsingDescriptors:v8];

  return v9;
}

- (void)addViewToScroller:(id)a3
{
  id v4 = a3;
  if (self->_scroller)
  {
    id v16 = v4;
    id v5 = [v4 superview];
    scroller = self->_scroller;

    id v4 = v16;
    if (v5 != scroller)
    {
      id v7 = [v16 superview];
      [v16 frame];
      [v7 convertRect:self->_scroller toView:];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;

      [(UIScrollView *)self->_scroller addSubview:v16];
      [v16 setFrame:v9, v11, v13, v15];
      id v4 = v16;
    }
  }
}

- (BOOL)scrollerIsParentOfView:(id)a3
{
  scroller = self->_scroller;
  id v4 = [a3 superview];
  LOBYTE(scroller) = scroller == v4;

  return (char)scroller;
}

- (void)prepareForReuse
{
  id v3 = +[NSMutableSet setWithCapacity:0];
  reusableViews = self->_reusableViews;
  self->_reusableViews = v3;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003B6EC;
  v5[3] = &unk_1001D2C20;
  void v5[4] = self;
  [(WeekAllDayView *)self iterateThroughEachOccurrence:v5];
  [(WeekAllDayView *)self layedOutRowsRemoveAllObjects];
}

- (void)saveTemporaryViews
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10003B7DC;
  v2[3] = &unk_1001D2C20;
  v2[4] = self;
  [(WeekAllDayView *)self iterateThroughEachOccurrence:v2];
}

- (void)clearTemporaryViews
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(NSMutableDictionary *)self->_temporaryViewCacheByDay allKeys];
  id v3 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(obj);
        }
        id v6 = [(NSMutableDictionary *)self->_temporaryViewCacheByDay objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v7 = [v6 allKeys];
        id v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v17;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v17 != v10) {
                objc_enumerationMutation(v7);
              }
              double v12 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * (void)j)];
              double v13 = v12;
              if (v12)
              {
                [v12 setHidden:1];
                [v13 setOccurrence:0];
                [(NSMutableSet *)self->_reusableViews addObject:v13];
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v9);
        }

        [v6 removeAllObjects];
      }
      id v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }
}

- (id)_allDayOccurrenceBlocksForEvents:(id)a3 rangeStart:(id)a4 rangeEnd:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v34 = +[NSMutableArray array];
  LOBYTE(a5) = [(WeekAllDayView *)self splitMultiDayEvents];
  id v11 = [v8 count];
  if (a5)
  {
    if (v11)
    {
      unint64_t v12 = 0;
      long long v31 = v8;
      do
      {
        double v13 = [v8 objectAtIndex:v12, v31];
        double v14 = [v13 startCalendarDate];
        long long v33 = v13;
        char v32 = [v13 endCalendarDate];
        unint64_t v15 = (unint64_t)[v32 differenceInDays:v14];
        if ((v15 & 0x8000000000000000) == 0)
        {
          long long v16 = 0;
          long long v17 = (char *)(v15 + 1);
          do
          {
            long long v18 = [v14 calendarDateByAddingDays:v16];
            long long v19 = [v18 calendarDateForEndOfDay];
            if ([v18 compare:v9] != (id)-1 && objc_msgSend(v19, "compare:", v10) != (id)1)
            {
              uint64_t v20 = CUIKDayRangeForOccurenceDates();
              long long v22 = -[EKAllDayOccurrenceBlock initWithEventIndex:calendarOrder:dayRange:]([EKAllDayOccurrenceBlock alloc], "initWithEventIndex:calendarOrder:dayRange:", v12, v12, v20, v21);
              [v34 addObject:v22];
            }
            ++v16;
          }
          while (v17 != v16);
        }

        ++v12;
        id v8 = v31;
      }
      while (v12 < (unint64_t)[v31 count]);
    }
  }
  else if (v11)
  {
    unint64_t v23 = 0;
    do
    {
      long long v24 = [v8 objectAtIndex:v23];
      long long v25 = [v24 startCalendarDate];
      long long v26 = [v24 endCalendarDate];
      uint64_t v27 = CUIKDayRangeForOccurenceDates();
      long long v29 = -[EKAllDayOccurrenceBlock initWithEventIndex:calendarOrder:dayRange:]([EKAllDayOccurrenceBlock alloc], "initWithEventIndex:calendarOrder:dayRange:", v23, v23, v27, v28);
      [v34 addObject:v29];

      ++v23;
    }
    while (v23 < (unint64_t)[v8 count]);
  }

  return v34;
}

- (id)_dayOccurrenceViewForEvent:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  temporaryViewCacheByDadouble y = self->_temporaryViewCacheByDay;
  id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 rangeStart]);
  id v10 = [(NSMutableDictionary *)temporaryViewCacheByDay objectForKeyedSubscript:v9];

  if (!v10) {
    goto LABEL_6;
  }
  id v11 = [v6 calendarItemIdentifier];
  if (!v11 || ([v10 objectForKeyedSubscript:v11], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_6:
    uint64_t v14 = [(NSMutableSet *)self->_reusableViews anyObject];
    if (v14)
    {
      double v13 = (void *)v14;
      [(NSMutableSet *)self->_reusableViews removeObject:v14];
      [v13 prepareForReuse];
    }
    else
    {
      double v13 = +[EKDayOccurrenceView occurrenceViewWithFrame:](EKDayOccurrenceView, "occurrenceViewWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      [(WeekViewAllDayContents *)self->_contentView addSubview:v13];
    }
    goto LABEL_9;
  }
  double v13 = (void *)v12;
  [v10 setObject:0 forKeyedSubscript:v11];

LABEL_9:
  [v13 setHidden:0];
  [v13 setUsesSmallText:self->_usesSmallText];
  [v13 setOccurrence:v6];
  unint64_t v15 = [(WeekAllDayView *)self _rangeStart];
  long long v16 = [v15 calendarDateByAddingDays:[v7 rangeStart]];

  uint64_t v17 = [v6 startCalendarDate];
  id v18 = [v16 differenceInDays:v17];

  [v13 setOccurrenceDateIndex:v18];
  [v13 setDelegate:self];
  [v13 setUserInteractionEnabled:self->_allowsOccurrenceSelection];
  [v13 setDimmed:0];
  [v13 setHideText:0];
  [v13 setAllDayDrawingStyle:1];
  [v13 setOpaque:1];
  NSUInteger v19 = [(NSArray *)self->_dayStarts count];
  LOBYTE(v17) = CalTimeDirectionIsLeftToRight();
  unint64_t v20 = (unint64_t)[v7 rangeStart];
  NSUInteger v21 = v20;
  if (v17)
  {
    id v22 = [v7 rangeEnd];
  }
  else
  {
    NSUInteger v21 = v19 + ~v20;
    id v22 = (id)(v19 + ~(unint64_t)[v7 rangeEnd]);
  }
  if (v21 < v19 && (unint64_t)v22 < v19)
  {
    unint64_t v23 = [v6 startCalendarDate];
    [v23 absoluteTime];
    double v25 = v24;
    long long v26 = [(NSArray *)self->_dayStarts objectAtIndexedSubscript:v21];
    [v26 absoluteTime];
    id v42 = v7;
    uint64_t v27 = v16;
    uint64_t v28 = v10;
    BOOL v30 = v25 < v29;

    long long v31 = [v6 endCalendarDate];
    char v32 = [v31 calendarDateForDay];
    [v32 absoluteTime];
    double v34 = v33;
    long long v35 = [(NSArray *)self->_dayStarts objectAtIndexedSubscript:v22];
    [v35 absoluteTime];
    BOOL v37 = v34 > v36;

    BOOL v38 = v30;
    id v10 = v28;
    long long v16 = v27;
    id v7 = v42;
    [v13 setHasPrecedingDuration:v38];
    [v13 setHasTrailingDuration:v37];
  }
  [v13 setMultiAllDayRoundCorners:[self useMultiDayHeaderStyle]];
  [(WeekAllDayView *)self _occurrencePadding];
  [v13 setPadding:];
  v39 = [v6 startDate];
  BOOL v40 = [(WeekAllDayView *)self _shouldAnnotateAppEntitiesForDay:v39];

  [v13 setShouldAnnotateAppEntities:v40];
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy())
  {
    +[EKDayOccurrenceView defaultMargin];
    CalFloorToScreenScale();
    CalFloorToScreenScale();
    [v13 setMargin:];
  }
  [v13 setNeedsDisplay];

  return v13;
}

- (void)_fadeInOccurrenceView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    [v5 setAlpha:0.0];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10003C26C;
    v7[3] = &unk_1001D2740;
    id v8 = v6;
    +[UIView animateWithDuration:v7 animations:0.300000012];
  }
  else
  {
    [v5 setAlpha:1.0];
  }
}

- (id)_rangeStart
{
  char IsLeftToRight = CalTimeDirectionIsLeftToRight();
  dayStarts = self->_dayStarts;
  if (IsLeftToRight) {
    [(NSArray *)dayStarts firstObject];
  }
  else {
  id v5 = [(NSArray *)dayStarts lastObject];
  }

  return v5;
}

- (id)_rangeEnd
{
  char IsLeftToRight = CalTimeDirectionIsLeftToRight();
  dayStarts = self->_dayStarts;
  if (IsLeftToRight) {
    [(NSArray *)dayStarts lastObject];
  }
  else {
  id v5 = [(NSArray *)dayStarts firstObject];
  }
  id v6 = [v5 calendarDateForEndOfDay];

  return v6;
}

- (void)setOccurrences:(id)a3 animated:(BOOL)a4
{
  BOOL v105 = a4;
  id v108 = a3;
  id v5 = +[NSMutableArray arrayWithCapacity:self->_daysToDisplay];
  id v6 = +[NSMutableArray arrayWithCapacity:self->_daysToDisplay];
  id v7 = +[NSMutableArray arrayWithCapacity:self->_daysToDisplay];
  if (SLODWORD(self->_daysToDisplay) >= 1)
  {
    int v8 = 0;
    do
    {
      id v9 = +[NSNumber numberWithInteger:0];
      [(NSArray *)v5 addObject:v9];

      id v10 = +[UIColor clearColor];
      [(NSArray *)v6 addObject:v10];

      [(NSArray *)v7 addObject:&stru_1001D6918];
      ++v8;
    }
    while (v8 < SLODWORD(self->_daysToDisplay));
  }
  v111 = v6;
  v112 = v5;
  v107 = v7;
  uint64_t v11 = [(WeekAllDayView *)self _rangeStart];
  [(WeekAllDayView *)self _rangeEnd];
  v101 = v113 = (void *)v11;
  uint64_t v12 = -[WeekAllDayView _allDayOccurrenceBlocksForEvents:rangeStart:rangeEnd:](self, "_allDayOccurrenceBlocksForEvents:rangeStart:rangeEnd:", v108, v11);
  v109 = v12;
  v110 = self;
  if ([v12 count])
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = [v12 objectAtIndexedSubscript:v13];
      unint64_t v15 = [v108 objectAtIndex:[v14 eventIndex]];
      long long v16 = [(WeekAllDayView *)self _dayOccurrenceViewForEvent:v15 block:v14];
      [v14 setOccurrenceView:v16];

      uint64_t v17 = [v14 occurrenceView];
      [(WeekAllDayView *)self _fadeInOccurrenceView:v17 animated:v105];

      int64_t v18 = [(WeekAllDayView *)self _specialDayTypeForOccurrence:v15];
      NSUInteger v19 = v112;
      if (v18)
      {
        int64_t v20 = v18;
        for (i = (char *)[v14 rangeStart]; i <= [v14 rangeEnd]; ++i)
        {
          if (i < (char *)[(NSArray *)v19 count])
          {
            id v22 = +[NSNumber numberWithInteger:v20];
            [(NSArray *)v112 replaceObjectAtIndex:i withObject:v22];

            unint64_t v23 = [v15 calendar];
            double v24 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v23 CGColor]);
            [(NSArray *)v111 replaceObjectAtIndex:i withObject:v24];

            double v25 = [v15 calendar];
            uint64_t v26 = [v25 locale];
            uint64_t v27 = (void *)v26;
            if (v26) {
              CFStringRef v28 = (const __CFString *)v26;
            }
            else {
              CFStringRef v28 = &stru_1001D6918;
            }
            [(NSArray *)v7 replaceObjectAtIndex:i withObject:v28];

            NSUInteger v19 = v112;
          }
        }
      }

      ++v13;
      uint64_t v12 = v109;
      self = v110;
    }
    while (v13 < (unint64_t)[v109 count]);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v30 = objc_opt_respondsToSelector();

  if (v30)
  {
    id v31 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v32 = [v31 weekAllDayViewForTimeframeBefore:self];
  }
  else
  {
    uint64_t v32 = 0;
  }
  id v33 = objc_loadWeakRetained((id *)&self->_delegate);
  char v34 = objc_opt_respondsToSelector();

  if (v34)
  {
    id v35 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v36 = [v35 weekAllDayViewForTimeframeAfter:self];
  }
  else
  {
    uint64_t v36 = 0;
  }
  BOOL v37 = v109;
  BOOL v38 = [(WeekAllDayView *)self _extractEventsStartingBeforeTimeframeFrom:v109];
  v98 = v38;
  if (v32)
  {
    id v39 = [(WeekAllDayView *)self _sortBlocks:v38 intoRowsUsingDataFrom:v32];
  }
  else
  {
    id v39 = v38;
  }
  v100 = (void *)v32;
  [v109 addObjectsFromArray:v39, v39];
  BOOL v40 = (void *)v36;
  if (v36)
  {
    v41 = [(WeekAllDayView *)self _extractEventsEndingAfterTimeframeFrom:v109];
    id v42 = [(WeekAllDayView *)self _sortBlocks:v41 intoRowsUsingDataFrom:v36];
    [v109 addObjectsFromArray:v42];

    BOOL v37 = v109;
  }
  v99 = v40;
  v102 = [(WeekAllDayView *)self _getSortedBlocksFromOccurrenceBlocks:v37];
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  uint64_t v43 = self->_reusableViews;
  id v44 = [(NSMutableSet *)v43 countByEnumeratingWithState:&v130 objects:v138 count:16];
  if (v44)
  {
    id v45 = v44;
    uint64_t v46 = *(void *)v131;
    do
    {
      for (j = 0; j != v45; j = (char *)j + 1)
      {
        if (*(void *)v131 != v46) {
          objc_enumerationMutation(v43);
        }
        [*(id *)(*((void *)&v130 + 1) + 8 * (void)j) removeFromSuperview];
      }
      id v45 = [(NSMutableSet *)v43 countByEnumeratingWithState:&v130 objects:v138 count:16];
    }
    while (v45);
  }

  id v48 = [objc_alloc((Class)NSMutableArray) initWithArray:v102];
  id v49 = objc_loadWeakRetained((id *)&self->_delegate);
  char v50 = objc_opt_respondsToSelector();

  if (v50)
  {
    v51 = [(WeekAllDayView *)self _extractEventsEndingAfterTimeframeFrom:v109];
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    id v52 = [v51 countByEnumeratingWithState:&v126 objects:v137 count:16];
    if (v52)
    {
      id v53 = v52;
      uint64_t v54 = *(void *)v127;
      do
      {
        for (k = 0; k != v53; k = (char *)k + 1)
        {
          if (*(void *)v127 != v54) {
            objc_enumerationMutation(v51);
          }
          [v48 removeObject:*(void *)(*((void *)&v126 + 1) + 8 * (void)k)];
        }
        id v53 = [v51 countByEnumeratingWithState:&v126 objects:v137 count:16];
      }
      while (v53);
    }
    [v51 addObjectsFromArray:v48];
  }
  else
  {
    v51 = v48;
  }
  id v56 = objc_loadWeakRetained((id *)&self->_delegate);
  char v57 = objc_opt_respondsToSelector();

  if (v57)
  {
    v58 = [(WeekAllDayView *)self _extractEventsStartingBeforeTimeframeFrom:v109];
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    id v59 = [v58 countByEnumeratingWithState:&v122 objects:v136 count:16];
    if (v59)
    {
      id v60 = v59;
      uint64_t v61 = *(void *)v123;
      do
      {
        for (m = 0; m != v60; m = (char *)m + 1)
        {
          if (*(void *)v123 != v61) {
            objc_enumerationMutation(v58);
          }
          [v51 removeObject:*(void *)(*((void *)&v122 + 1) + 8 * (void)m)];
        }
        id v60 = [v58 countByEnumeratingWithState:&v122 objects:v136 count:16];
      }
      while (v60);
    }
    [v58 addObjectsFromArray:v51];
  }
  else
  {
    v58 = v51;
  }
  v106 = v58;
  if ([(WeekAllDayView *)self splitMultiDayEvents])
  {
    [(NSMutableArray *)self->_layedOutRowsForEachDay removeAllObjects];
    v63 = v113;
    if ([(WeekAllDayView *)self daysToDisplay] >= 1)
    {
      uint64_t v64 = 0;
      do
      {
        v65 = +[NSMutableArray array];
        [(NSMutableArray *)self->_layedOutRowsForEachDay addObject:v65];
        uint64_t v103 = v64;
        v66 = [v63 calendarDateByAddingDays:v64];
        long long v118 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        id v67 = v58;
        id v68 = [v67 countByEnumeratingWithState:&v118 objects:v135 count:16];
        if (v68)
        {
          id v69 = v68;
          uint64_t v70 = *(void *)v119;
          do
          {
            for (n = 0; n != v69; n = (char *)n + 1)
            {
              if (*(void *)v119 != v70) {
                objc_enumerationMutation(v67);
              }
              v72 = *(void **)(*((void *)&v118 + 1) + 8 * (void)n);
              v73 = [v63 calendarDateByAddingDays:[v72 rangeStart]];
              if (![v66 compare:v73])
              {
                v74 = objc_alloc_init(EKAllDayRow);
                [(EKAllDayRow *)v74 addOccurrenceBlock:v72];
                [v65 addObject:v74];

                v63 = v113;
              }
            }
            id v69 = [v67 countByEnumeratingWithState:&v118 objects:v135 count:16];
          }
          while (v69);
        }

        uint64_t v64 = v103 + 1;
        self = v110;
        v58 = v106;
      }
      while (v103 + 1 < [(WeekAllDayView *)v110 daysToDisplay]);
    }
    [v58 removeAllObjects];
  }
  else if ([v58 count])
  {
    unint64_t v75 = 0;
    v76 = &OBJC_IVAR___DayNavigationViewController__loadingOccurrenceCache;
    do
    {
      while (v75 >= (unint64_t)[(NSMutableArray *)self->_layedOutRows count])
      {
        layedOutRows = self->_layedOutRows;
        id v78 = objc_alloc_init((Class)(v76 + 606));
        [(NSMutableArray *)layedOutRows addObject:v78];
      }
      unint64_t v104 = v75;
      v79 = [(NSMutableArray *)self->_layedOutRows objectAtIndex:v75];
      long long v114 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v80 = v58;
      for (ii = v80; ; id v80 = ii)
      {
        id v82 = [v80 countByEnumeratingWithState:&v114 objects:v134 count:16];
        if (!v82) {
          break;
        }
        v83 = 0;
        uint64_t v84 = *(void *)v115;
        unint64_t v85 = -1;
        do
        {
          for (jj = 0; jj != v82; jj = (char *)jj + 1)
          {
            if (*(void *)v115 != v84) {
              objc_enumerationMutation(ii);
            }
            v87 = *(void **)(*((void *)&v114 + 1) + 8 * (void)jj);
            id v88 = [v79 spaceGapFor:v87];
            if (v88 != (id)-1 && (unint64_t)v88 < v85)
            {
              unint64_t v90 = (unint64_t)v88;
              id v91 = v87;

              v83 = v91;
              unint64_t v85 = v90;
            }
          }
          id v82 = [ii countByEnumeratingWithState:&v114 objects:v134 count:16];
        }
        while (v82);

        if (!v83) {
          goto LABEL_88;
        }
        [v79 addOccurrenceBlock:v83];
        [ii removeObject:v83];

        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
      }

LABEL_88:
      unint64_t v75 = v104 + 1;

      self = v110;
      v58 = v106;
      v76 = &OBJC_IVAR___DayNavigationViewController__loadingOccurrenceCache;
    }
    while ([ii count]);
  }
  specialDayTypes = self->_specialDayTypes;
  self->_specialDayTypes = v112;
  v93 = v112;

  dayBadgeColors = self->_dayBadgeColors;
  self->_dayBadgeColors = v111;
  v95 = v111;

  dayBadgeLocales = self->_dayBadgeLocales;
  self->_dayBadgeLocales = v107;

  [(WeekAllDayView *)self _updateDayBadges];
  [(WeekAllDayView *)self setNeedsLayout];
}

- (id)_sortBlocks:(id)a3 intoRowsUsingDataFrom:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WeekAllDayView *)self splitMultiDayEvents])
  {
    id v21 = v6;
  }
  else
  {
    id v21 = +[NSMutableArray array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v19 = v6;
    id obj = v6;
    id v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          unint64_t v13 = [v12 occurrenceView];
          uint64_t v14 = [v13 occurrence];
          unint64_t v15 = (unint64_t)[v7 rowIndexOfOccurrence:v14];

          if ((v15 & 0x8000000000000000) != 0)
          {
            [v21 addObject:v12];
          }
          else
          {
            while (v15 >= (unint64_t)[(NSMutableArray *)self->_layedOutRows count])
            {
              long long v16 = objc_alloc_init(EKAllDayRow);
              [(NSMutableArray *)self->_layedOutRows addObject:v16];
            }
            uint64_t v17 = [(NSMutableArray *)self->_layedOutRows objectAtIndex:v15];
            if ([v17 spaceGapFor:v12] == (id)-1) {
              [v21 addObject:v12];
            }
            else {
              [v17 addOccurrenceBlock:v12];
            }
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    id v6 = v19;
  }

  return v21;
}

- (id)_extractEventsStartingBeforeTimeframeFrom:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  calendar = self->_calendar;
  id v7 = [(WeekAllDayView *)self startDate];
  id v8 = [(NSCalendar *)calendar dateFromComponents:v7];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v15 = [v14 occurrenceView:v19];
        long long v16 = [v15 occurrence];
        uint64_t v17 = [v16 startDate];

        if ([v17 compare:v8] == (id)-1) {
          [v5 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  [v9 removeObjectsInArray:v5];

  return v5;
}

- (id)_extractEventsEndingAfterTimeframeFrom:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = [(NSCalendar *)self->_calendar dateFromComponents:self->_endDate];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unint64_t v13 = [v12 occurrenceView:v17];
        uint64_t v14 = [v13 occurrence];
        unint64_t v15 = [v14 endDate];

        if ([v6 compare:v15] == (id)-1) {
          [v5 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  [v7 removeObjectsInArray:v5];

  return v5;
}

- (int64_t)_specialDayTypeForOccurrence:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    int64_t v4 = (int64_t)[v3 specialDayType];
    if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      int64_t v5 = v4;
    }
    else {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (double)heightForNumberOfOccurrences:(unint64_t)a3
{
  double v4 = (double)a3;
  unint64_t v5 = [(WeekAllDayView *)self maxOccurrencesWithoutScroller];
  if ((double)v5 + 0.5 <= v4) {
    double v6 = (double)v5 + 0.5;
  }
  else {
    double v6 = v4;
  }
  if (v6 == 0.0)
  {
    id v7 = objc_opt_class();
    [v7 dayLabelHeightWithSizeClass:EKUIWidthSizeClassForViewHierarchy() usesMultiDay:[self useMultiDayHeaderStyle]];
  }
  else
  {
    [(WeekAllDayView *)self occurrenceHeight];
    [(UIView *)self->_topSeparator frame];
    if (v6 == v4) {
      EKUICurrentWidthSizeClassIsRegularInViewHierarchy();
    }
    [(WeekAllDayView *)self occurrenceInsetIntoScroller];
    id v8 = objc_opt_class();
    [v8 dayLabelHeightWithSizeClass:EKUIWidthSizeClassForViewHierarchy() usesMultiDay:[self useMultiDayHeaderStyle]];
  }

  CalRoundToScreenScale();
  return result;
}

- (double)scrollerContentHeightForNumberOfOccurrences:(unint64_t)a3
{
  if (!a3) {
    return 0.0;
  }
  double v4 = (double)a3;
  [(WeekAllDayView *)self occurrenceHeight];
  double v6 = floor(v5 * v4) + ceil(v4 + -1.0) * 3.0;
  [(UIView *)self->_topSeparator frame];
  double v8 = v7;
  IsRegularInViewHierarchdouble y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy();
  double v10 = 2.5;
  if (IsRegularInViewHierarchy) {
    double v10 = 3.5;
  }
  double v11 = v8 + v10;
  [(WeekAllDayView *)self occurrenceInsetIntoScroller];
  return v6 + v12 + v11;
}

- (double)heightWithoutNoAllDayOccurrences
{
  [(WeekAllDayView *)self heightForNumberOfOccurrences:0];
  return result;
}

- (double)naturalHeight
{
  int64_t v3 = [(WeekAllDayView *)self totalRowCount];

  [(WeekAllDayView *)self heightForNumberOfOccurrences:v3];
  return result;
}

- (int64_t)maxRowCountWithUserVisibleEarliestDate:(id)a3 latestDate:(id)a4
{
  id v6 = a3;
  id v45 = a4;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = self->_layedOutRowsForEachDay;
  id v34 = [(NSMutableArray *)obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v34)
  {
    int64_t v36 = 0;
    uint64_t v33 = *(void *)v55;
    if (v6) {
      BOOL v7 = v45 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = !v7;
    id v44 = v6;
    int v42 = v8;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v55 != v33)
        {
          uint64_t v10 = v9;
          objc_enumerationMutation(obj);
          uint64_t v9 = v10;
        }
        uint64_t v35 = v9;
        double v11 = *(void **)(*((void *)&v54 + 1) + 8 * v9);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v37 = v11;
        id v39 = [v37 countByEnumeratingWithState:&v50 objects:v59 count:16];
        int64_t v12 = 0;
        if (v39)
        {
          uint64_t v38 = *(void *)v51;
          do
          {
            for (i = 0; i != v39; i = (char *)i + 1)
            {
              if (*(void *)v51 != v38) {
                objc_enumerationMutation(v37);
              }
              uint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              long long v46 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              unint64_t v15 = [v14 occurrenceBlocks];
              id v16 = [v15 countByEnumeratingWithState:&v46 objects:v58 count:16];
              if (v16)
              {
                id v17 = v16;
                BOOL v40 = i;
                int64_t v41 = v12;
                char v18 = 0;
                uint64_t v19 = *(void *)v47;
                uint64_t v43 = *(void *)v47;
                do
                {
                  for (j = 0; j != v17; j = (char *)j + 1)
                  {
                    if (*(void *)v47 != v19) {
                      objc_enumerationMutation(v15);
                    }
                    long long v21 = [*(id *)(*((void *)&v46 + 1) + 8 * (void)j) occurrenceView];
                    long long v22 = v21;
                    if (v8)
                    {
                      id v23 = v17;
                      long long v24 = [v21 occurrence];
                      long long v25 = [v24 startCalendarDate];
                      if ([v25 compare:v45] == (id)-1)
                      {
                        uint64_t v27 = [v22 occurrence];
                        [v27 endCalendarDate];
                        v29 = CFStringRef v28 = v15;
                        BOOL v26 = [v29 compare:v44] == (id)1;

                        unint64_t v15 = v28;
                        uint64_t v19 = v43;

                        int v8 = v42;
                      }
                      else
                      {
                        BOOL v26 = 0;
                      }

                      v18 |= v26;
                      id v17 = v23;
                    }
                    else
                    {
                      char v18 = 1;
                    }
                  }
                  id v17 = [v15 countByEnumeratingWithState:&v46 objects:v58 count:16];
                }
                while (v17);

                i = v40;
                int64_t v12 = v41 + (v18 & 1);
                id v6 = v44;
              }
              else
              {
              }
            }
            id v39 = [v37 countByEnumeratingWithState:&v50 objects:v59 count:16];
          }
          while (v39);
        }

        int64_t v30 = v36;
        if (v12 > v36) {
          int64_t v30 = v12;
        }
        int64_t v36 = v30;
        uint64_t v9 = v35 + 1;
      }
      while ((id)(v35 + 1) != v34);
      id v34 = [(NSMutableArray *)obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v34);
  }
  else
  {
    int64_t v36 = 0;
  }

  return v36;
}

- (double)multiDayViewVisibleHeightWithUserVisibleEarliestDate:(id)a3 latestDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 date];
  uint64_t v9 = [v8 toISO8601String];
  uint64_t v10 = [v7 date];
  double v11 = [v10 toISO8601String];
  int64_t v12 = +[NSString stringWithFormat:@"%@ - %@", v9, v11];

  unint64_t v13 = [(NSMutableDictionary *)self->_cachedVisibleHeightMap objectForKeyedSubscript:v12];

  if (v13)
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_cachedVisibleHeightMap objectForKeyedSubscript:v12];
    [v14 doubleValue];
    double v16 = v15;
  }
  else
  {
    [(WeekAllDayView *)self heightForNumberOfOccurrences:[(WeekAllDayView *)self maxRowCountWithUserVisibleEarliestDate:v6 latestDate:v7]];
    double v16 = v17;
    uint64_t v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [(NSMutableDictionary *)self->_cachedVisibleHeightMap setObject:v14 forKeyedSubscript:v12];
  }

  return v16;
}

- (double)scrollerContentHeightWithUserVisibleEarliestDate:(id)a3 latestDate:(id)a4
{
  int64_t v5 = [(WeekAllDayView *)self maxRowCountWithUserVisibleEarliestDate:a3 latestDate:a4];

  [(WeekAllDayView *)self scrollerContentHeightForNumberOfOccurrences:v5];
  return result;
}

- (void)updateTotalRowCountWithContainerRect:(CGRect)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003DBEC;
  v4[3] = &unk_1001D2CE8;
  CGRect v5 = a3;
  v4[4] = &v6;
  [(WeekAllDayView *)self iterateThroughEachAllDayRow:v4];
  [(WeekAllDayView *)self setTotalRowCount:v7[3] + 1];
  _Block_object_dispose(&v6, 8);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double fixedDayHeight = self->_fixedDayHeight;
  if (fixedDayHeight <= 0.0)
  {
    [(WeekAllDayView *)self naturalHeight];
    double fixedDayHeight = v6;
  }
  double fixedDayWidth = self->_fixedDayWidth;
  if (fixedDayWidth > 0.0) {
    double width = fixedDayWidth * (double)self->_daysToDisplay;
  }
  double v8 = width;
  result.double height = fixedDayHeight;
  result.double width = v8;
  return result;
}

- (double)_dayWidth
{
  double result = self->_fixedDayWidth;
  if (result <= 0.0)
  {
    [(WeekViewAllDayContents *)self->_contentView bounds];
    CalRoundToScreenScale();
  }
  return result;
}

- (void)setReceiveTapsInHeader:(BOOL)a3
{
  if (self->_receiveTapsInHeader != a3)
  {
    self->_receiveTapsInHeader = a3;
    tapGestureRecognizer = self->_tapGestureRecognizer;
    if (a3)
    {
      if (!tapGestureRecognizer)
      {
        CGRect v5 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_tapReceived:"];
        double v6 = self->_tapGestureRecognizer;
        self->_tapGestureRecognizer = v5;

        id v7 = self->_tapGestureRecognizer;
        [(WeekAllDayView *)self addGestureRecognizer:v7];
      }
    }
    else if (tapGestureRecognizer)
    {
      [(WeekAllDayView *)self removeGestureRecognizer:self->_tapGestureRecognizer];
      double v8 = self->_tapGestureRecognizer;
      self->_tapGestureRecognizer = 0;
    }
  }
}

- (void)_tapReceived:(id)a3
{
  [a3 locationInView:self];

  -[WeekAllDayView emptySpaceClickForCalendarWeekDayEventContent:atPoint:](self, "emptySpaceClickForCalendarWeekDayEventContent:atPoint:", 0);
}

+ (UIEdgeInsets)occurrencePaddingForSizeClass:(int64_t)a3
{
  +[EKDayOccurrenceView defaultPadding];
  double v5 = v4;
  double v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  id v7 = v6;
  if (a3 == 1)
  {
    double v8 = 0.0;
    [v6 _scaledValueForValue:0.0];
  }
  else
  {
    [v6 _scaledValueForValue:2.0];
    CalRoundToScreenScale();
    double v8 = v9;
  }
  CalRoundToScreenScale();
  double v11 = v10;

  double v12 = 0.0;
  double v13 = v11;
  double v14 = v8;
  double v15 = v5;
  result.right = v12;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)_occurrencePadding
{
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy()) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  int64_t v3 = objc_opt_class();

  _[v3 occurrencePaddingForSizeClass:v2];
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

+ (double)_fontSizeForSizeClass:(int64_t)a3
{
  EKUIMultiwindowAssert();
  if (a3 == 2) {
    double v4 = 17.0;
  }
  else {
    double v4 = 18.0;
  }
  double v5 = CUIKGetOverlayCalendar();
  if (v5) {
    double v6 = 28.0;
  }
  else {
    double v6 = 40.0;
  }

  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:v4 shouldScaleForSmallerSizes:v6];

  CalRoundToScreenScale();
  return result;
}

+ (double)_overlayFontSize
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 maximumValue:10.0 shouldScaleForSmallerSizes:15.5];

  CalRoundToScreenScale();
  return result;
}

+ (double)_compactRoundedRectHeightForSizeClass:(int64_t)a3
{
  [a1 _fontSizeForSizeClass:a3];
  double v5 = v4;
  double v6 = CUIKGetOverlayCalendar();
  if (v6)
  {
    [a1 _overlayFontSize];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }
  +[CompactDayNavigationViewCell contentHeightForFontSize:v5 overlayFontSize:v8];
  CalRoundToScreenScale();
  double v10 = v9;

  return fmin(v10, 47.0);
}

- (void)_buildDayNumberViews
{
  if (!self->_dayNumberViews)
  {
    int64_t v3 = +[NSMutableArray arrayWithCapacity:self->_daysToDisplay];
    if (self->_daysToDisplay)
    {
      unint64_t v4 = 0;
      do
      {
        if ([(WeekAllDayView *)self useMultiDayHeaderStyle])
        {
          double v5 = objc_alloc_init(MultiDayNavigationViewCell);
          [(MultiDayNavigationViewCell *)v5 setShouldShowOverlay:0];
        }
        else
        {
          double v5 = objc_alloc_init(LargeDayNavigationViewCell);
          double v6 = [(WeekAllDayView *)self traitCollection];
          [(DayNavigationViewCell *)v5 setUsesRoundedRectInsteadOfCircle:EKUIUsesRoundedRectsInsteadOfCircles()];

          [(MultiDayNavigationViewCell *)v5 setUserInteractionEnabled:0];
          double v7 = [(WeekAllDayView *)self backgroundColor];
          [(MultiDayNavigationViewCell *)v5 setBackgroundColor:v7];
        }
        [(WeekAllDayView *)self addSubview:v5];
        [(NSArray *)v3 addObject:v5];

        ++v4;
      }
      while (v4 < self->_daysToDisplay);
    }
    dayNumberViews = self->_dayNumberViews;
    self->_dayNumberViews = v3;
  }
}

- (void)_buildVerticalDaySeparators
{
  unint64_t v3 = self->_daysToDisplay - 1;
  id v7 = [(objc_class *)[(WeekAllDayView *)self weekViewClass] weekSeparatorColor];
  for (i = +[NSMutableArray arrayWithCapacity:v3];
  {
    id v5 = objc_alloc_init((Class)UIView);
    [v5 setBackgroundColor:v7];
    [(WeekAllDayView *)self addSubview:v5];
    [(NSArray *)i addObject:v5];
  }
  verticalDaySeparators = self->_verticalDaySeparators;
  self->_verticalDaySeparators = i;
}

- (void)_layoutDayNumberCells
{
  if (self->_daysToDisplay)
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = [(NSArray *)self->_dayNumberViews objectAtIndexedSubscript:v3];
      [(WeekAllDayView *)self _numberFrameForDayIndex:v3];
      [v4 setFrame:];

      ++v3;
    }
    while (v3 < self->_daysToDisplay);
  }
}

- (void)_layoutVerticalDaySeparators
{
  [(WeekAllDayView *)self bounds];
  [(WeekAllDayView *)self _dayWidth];
  double v4 = v3;
  unint64_t v5 = self->_daysToDisplay - 1;
  EKUISeparatorLineThickness();
  if (v5)
  {
    uint64_t v6 = 0;
    double v7 = 0.0;
    do
    {
      double v7 = v4 + v7;
      double v8 = [(NSArray *)self->_verticalDaySeparators objectAtIndexedSubscript:v6];
      CalRoundToScreenScale();
      [v8 setFrame:];

      ++v6;
    }
    while (v5 != v6);
  }
}

- (CGRect)_numberFrameForDayIndex:(int64_t)a3
{
  if ([(WeekAllDayView *)self useMultiDayHeaderStyle])
  {
    double y = CGRectZero.origin.y;
    EKUISeparatorLineThickness();
    [(WeekAllDayView *)self _dayWidth];
    CalRoundToScreenScale();
    double v6 = v5;
    [(WeekAllDayView *)self _dayWidth];
    CalRoundToScreenScale();
    double v8 = v7;
    +[MultiDayNavigationViewCell heightRequiredWithSizeClass:EKUIWidthSizeClassForViewHierarchy()];
LABEL_9:
    double v19 = v9;
    goto LABEL_16;
  }
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy())
  {
    [(WeekAllDayView *)self _dayWidth];
    CalRoundToScreenScale();
    double v6 = v10;
    [(WeekAllDayView *)self _dayWidth];
    CalRoundToScreenScale();
    double v8 = v11;
    double v12 = [(WeekAllDayView *)self traitCollection];
    int v13 = EKUIUsesRoundedRectsInsteadOfCircles();

    if (v13)
    {
      uint64_t v14 = EKUIWidthSizeClassForViewHierarchy();
      double v15 = objc_opt_class();
      [v15 dayLabelHeightWithSizeClass:EKUIWidthSizeClassForViewHierarchy() usesMultiDay:[self useMultiDayHeaderStyle]];
      [(id)objc_opt_class() _heightForWeekdayLabelsForSizeClass:v14];
      [(id)objc_opt_class() _compactRoundedRectHeightForSizeClass:v14];
      CalRoundToScreenScale();
      CalRoundToScreenScale();
      double v17 = v16;
      CalRoundToScreenScale();
      if (v17 >= v18) {
        double y = v17;
      }
      else {
        double y = v18;
      }
      [(id)objc_opt_class() _compactRoundedRectHeightForSizeClass:v14];
      goto LABEL_9;
    }
    +[DayNavigationViewCell circleDiameter];
    double v19 = v24;
LABEL_13:
    double y = 0.0;
    goto LABEL_16;
  }
  [(WeekAllDayView *)self _circleSize];
  double v8 = v20;
  double v19 = v21;
  [(WeekAllDayView *)self _dayWidth];
  CalCeilToScreenScale();
  double v6 = v22;
  id v23 = [(WeekAllDayView *)self traitCollection];
  if (EKUIUsesRoundedRectsInsteadOfCircles())
  {

    goto LABEL_13;
  }
  +[LargeDayNavigationViewCell dayLabelBaseHeight];
  double v26 = v25;
  +[DayNavigationViewCell circleDiameter];
  double v28 = v27;

  double y = 0.0;
  if (v26 >= v28)
  {
    +[LargeDayNavigationViewCell dayLabelYMargin];
    CalRoundToScreenScale();
    double y = v29;
  }
LABEL_16:
  double v30 = v6;
  double v31 = y;
  double v32 = v8;
  double v33 = v19;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

+ (double)_yOffsetForWeekdayLabelsWithSizeClass:(int64_t)a3
{
  EKUIMultiwindowAssert();
  int v5 = EKUIUsesRoundedRectsInsteadOfCircles();
  if (a3 == 1 && v5)
  {
    [(id)objc_opt_class() dayLabelHeightWithSizeClass:1 usesMultiDay:0];
    double v7 = v6;
    CalRoundToScreenScale();
    double v9 = v7 - v8;
    [a1 _heightForWeekdayLabelsForSizeClass:1];
    return v9 - v10;
  }
  else
  {
    CalRoundToScreenScale();
  }
  return result;
}

+ (double)_heightForWeekdayLabelsForSizeClass:(int64_t)a3
{
  if (!EKUIUsesRoundedRectsInsteadOfCircles()) {
    return 20.0;
  }
  int v5 = [a1 _dayLabelFontForSizeClass:a3];
  [v5 lineHeight];
  CalRoundToScreenScale();
  double v7 = v6;

  return v7;
}

+ (double)baselineForWeekdayLabelsWithSizeClass:(int64_t)a3
{
  int v5 = +[EKUISemiConstantCache sharedInstance];
  [v5 weekAllDayBaselineForLargeFormatWeekView];
  double v7 = v6;

  double v8 = +[EKUISemiConstantCache sharedInstance];
  [v8 weekAllDayBaselineForSmallFormatWeekView];
  double v10 = v9;

  if (v7 < 0.0 || v10 < 0.0)
  {
    double v11 = objc_opt_new();
    double v12 = [a1 _dayLabelFontForSizeClass:a3];
    [v11 setFont:v12];

    [a1 _heightForWeekdayLabelsForSizeClass:a3];
    [v11 setFrame:0.0, 0.0, 20.0, v13];
    [v11 _firstLineBaselineOffsetFromBoundsTop];
    double v15 = v14;
    if (EKUIUsesRoundedRectsInsteadOfCircles())
    {
      [a1 _yOffsetForWeekdayLabelsWithSizeClass:a3];
      double v17 = v16;
      +[DayNavigationViewCell roundedRectBaselineOffset];
      double v7 = v18;
    }
    else
    {
      CalRoundToScreenScale();
      double v7 = v15 + v19;
      CalRoundToScreenScale();
      double v17 = v20;
    }
    double v10 = v15 + v17;
    double v21 = +[EKUISemiConstantCache sharedInstance];
    [v21 setWeekAllDayBaselineForLargeFormatWeekView:v7];

    double v22 = +[EKUISemiConstantCache sharedInstance];
    [v22 setWeekAllDayBaselineForLargeFormatWeekView:v10];
  }
  if (a3 == 2) {
    return v7;
  }
  else {
    return v10;
  }
}

- (CGRect)_weekdayFrameForDayIndex:(int64_t)a3
{
  [(WeekAllDayView *)self _dayWidth];
  CalRoundToScreenScale();
  double v5 = v4;
  double v6 = objc_opt_class();
  [v6 _yOffsetForWeekdayLabelsWithSizeClass:EKUIWidthSizeClassForViewHierarchy()];
  double v8 = v7;
  [(WeekAllDayView *)self _dayWidth];
  CalRoundToScreenScale();
  double v10 = v9;
  double v11 = objc_opt_class();
  [v11 _heightForWeekdayLabelsForSizeClass:EKUIWidthSizeClassForViewHierarchy()];
  double v13 = v12;
  double v14 = v5;
  double v15 = v8;
  double v16 = v10;
  result.size.double height = v13;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)_dayLabelColorAtDayIndex:(int64_t)a3 isWeekend:(BOOL)a4
{
  BOOL v4 = a4;
  double v5 = [(NSArray *)self->_dayStarts objectAtIndexedSubscript:a3];
  [v5 absoluteTime];
  double v7 = v6;

  double v8 = CUIKTodayDate();
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  if (!v4 || v7 == v10)
  {
    double v11 = +[UIColor labelColor];
  }
  else
  {
    double v11 = WeekendTextColor();
  }

  return v11;
}

- (CGSize)_circleSize
{
  +[CompactDayNavigationViewCell standardCircleDiameterForSizeClass:EKUIWidthSizeClassForViewHierarchy()];
  double v3 = v2;
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (id)_dayLabelFontForSizeClass:(int64_t)a3
{
  EKUIMultiwindowAssert();
  BOOL v4 = +[EKUISemiConstantCache sharedInstance];
  double v5 = v4;
  if (a3 == 1) {
    [v4 weekAllDayLabelFontCompact];
  }
  else {
  double v6 = [v4 weekAllDayLabelFontRegular];
  }

  return v6;
}

+ (id)_todayDayLabelFontForSizeClass:(int64_t)a3
{
  EKUIMultiwindowAssert();
  BOOL v4 = +[EKUISemiConstantCache sharedInstance];
  double v5 = v4;
  if (a3 == 1) {
    [v4 weekAllDayTodayLabelFontCompact];
  }
  else {
  double v6 = [v4 weekAllDayTodayLabelFontRegular];
  }

  return v6;
}

- (int64_t)_dayIndexForToday
{
  double v3 = CUIKTodayDate();
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  if (![(NSArray *)self->_dayStarts count]) {
    return -1;
  }
  int64_t v6 = 0;
  while (1)
  {
    double v7 = [(NSArray *)self->_dayStarts objectAtIndex:v6];
    [v7 absoluteTime];
    double v9 = v8;

    if (v5 == v9) {
      break;
    }
    if (++v6 >= [(NSArray *)self->_dayStarts count]) {
      return -1;
    }
  }
  return v6;
}

- (unint64_t)maxOccurrencesWithoutScroller
{
  if (qword_100216550 != -1) {
    dispatch_once(&qword_100216550, &stru_1001D2D08);
  }
  double v3 = (void *)qword_100216548;
  AnchoredValueCurrentWindowHeight(self);
  [v3 valueForSize:];
  return vcvtmd_u64_f64(v4);
}

- (double)baselineForWeekdayNumbers
{
  if (![(NSArray *)self->_dayNumberViews count]) {
    return -1.0;
  }
  double v3 = [(NSArray *)self->_dayNumberViews firstObject];
  [v3 baselineOffsetFromTop];
  double v5 = v4;
  [v3 frame];
  double v7 = v6;
  double v9 = v8;
  double v10 = [v3 superview];
  -[WeekAllDayView convertPoint:fromView:](self, "convertPoint:fromView:", v10, v7, v9);
  double v12 = v11;

  double v13 = v5 + v12;
  return v13;
}

+ (double)occurrenceInsetIntoScrollerWithSizeClassRegular:(BOOL)a3
{
  double result = 3.0;
  if (a3)
  {
    CalRoundToScreenScale();
    double v5 = v4;
    CalOnePixelInPoints();
    return v5 + v6;
  }
  return result;
}

- (double)occurrenceInsetIntoScroller
{
  double v2 = objc_opt_class();
  IsRegularInViewHierarchdouble y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy();

  _[v2 occurrenceInsetIntoScrollerWithSizeClassRegular:IsRegularInViewHierarchy];
  return result;
}

- (unint64_t)_calendarOrderForCalendar:(id)a3
{
  id v3 = a3;
  double v4 = [v3 eventStore];
  double v5 = [v4 calendarsForEntityType:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      double v11 = 0;
      unint64_t v12 = (unint64_t)v8 + v9;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v11), "isEqual:", v3, (void)v14))
        {
          unint64_t v12 = (unint64_t)v11 + v9;
          goto LABEL_12;
        }
        double v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      unint64_t v9 = v12;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
LABEL_12:

  return v12;
}

- (double)firstEventYOffset
{
  [(WeekAllDayView *)self occurrenceInsetIntoScroller];
  id v3 = objc_opt_class();
  [v3 dayLabelHeightWithSizeClass:EKUIWidthSizeClassForViewHierarchy() usesMultiDay:[self useMultiDayHeaderStyle]];

  CalRoundToScreenScale();
  return result;
}

- (double)nextAvailableOccurrenceViewYOriginForDay:(id)a3
{
  id v4 = a3;
  [v4 absoluteTime];
  double v6 = v5;
  int64_t v7 = [(WeekAllDayView *)self dayIndexForCalendarDate:v4];
  id v8 = [(NSCalendar *)self->_calendar timeZone];
  unint64_t v9 = +[EKCalendarDate calendarDateWithAbsoluteTime:v8 timeZone:v6];

  uint64_t v10 = [(NSArray *)self->_dayStarts objectAtIndex:0];
  [v9 dayOfWeek];
  [v10 dayOfWeek];
  [(WeekAllDayView *)self _dayWidth];
  CalRoundToScreenScale();
  [(WeekAllDayView *)self occurrenceInsetIntoScroller];
  [(UIScrollView *)self->_scroller contentOffset];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003F3CC;
  v14[3] = &unk_1001D2CC0;
  v14[5] = v15;
  v14[6] = v7;
  v14[4] = self;
  [(WeekAllDayView *)self iterateThroughEachAllDayRow:v14];
  [(WeekAllDayView *)self occurrenceHeight];
  [(WeekAllDayView *)self firstEventYOffset];
  [(WeekAllDayView *)self occurrenceInsetIntoScroller];
  [(UIScrollView *)self->_scroller contentOffset];
  CalRoundToScreenScale();
  double v12 = v11;
  _Block_object_dispose(v15, 8);

  return v12;
}

- (CGRect)_frameForOccurrenceBlock:(id)a3 index:(unint64_t)a4 yPos:(double)a5 padding:(double)a6
{
  id v7 = a3;
  [(WeekAllDayView *)self _dayWidth];
  [v7 rangeStart];
  if ((CalTimeDirectionIsLeftToRight() & 1) == 0)
  {
    [(WeekAllDayView *)self frame];
    CGRectGetWidth(v20);
    [v7 rangeStart];
    [v7 length];
  }
  [(WeekAllDayView *)self occurrenceInsetIntoScroller];
  [v7 length];
  [(WeekAllDayView *)self occurrenceHeight];
  CalRoundRectToScreenScale();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (BOOL)dateIsWeekend:(id)a3
{
  id v4 = a3;
  double v5 = +[CUIKPreferences sharedPreferences];
  unsigned int v6 = [v5 overrideLocaleWeekends];

  if (v6)
  {
    unsigned __int8 v7 = [v4 dayOfWeek] == (id)7 || [v4 dayOfWeek];
  }
  else
  {
    calendar = self->_calendar;
    double v9 = [v4 date];
    unsigned __int8 v7 = [(NSCalendar *)calendar isDateInWeekend:v9];
  }
  return v7;
}

- (void)_setNeedsHeaderUpdate
{
  self->_needsHeaderUpdate = 1;
  [(NSMutableDictionary *)self->_cachedVisibleHeightMap removeAllObjects];

  [(WeekAllDayView *)self setNeedsLayout];
}

- (void)_updateHeaderViewsIfNeeded
{
  if (self->_needsHeaderUpdate && self->_dayStarts)
  {
    int64_t v3 = [(WeekAllDayView *)self _dayIndexForToday];
    if (self->_daysToDisplay)
    {
      int64_t v4 = v3;
      unint64_t v5 = 0;
      do
      {
        unsigned int v6 = [(NSArray *)self->_dayStarts objectAtIndexedSubscript:v5];
        BOOL v7 = [(WeekAllDayView *)self dateIsWeekend:v6];
        if ([(NSArray *)self->_dayNumberViews count])
        {
          double v8 = [(NSArray *)self->_dayNumberViews objectAtIndexedSubscript:v5];
          double v9 = [v6 date];
          [v8 setDate:v9 forceStringUpdate:1];

          [v8 setIsToday:v4 == v5];
          [v8 setIsWeekend:v7];
          [v8 setCircled:v4 == v5];
          [(WeekAllDayView *)self _updateCell:v8 withBadgeDataIndex:v5];
          if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              double v10 = v8;
            }
            else {
              double v10 = 0;
            }
            id v11 = v10;
            if (v7)
            {
              double v12 = [(WeekAllDayView *)self _dayLabelColorAtDayIndex:v5 isWeekend:1];
              [v11 setWeekendColor:v12];
            }
            if ([v11 usesRoundedRectInsteadOfCircle])
            {
              [v11 contentWidth];
              double v14 = v13 + 20.0;
              [v11 roundedRectSize];
              if (v14 > v15)
              {
                [v11 roundedRectSize];
                [v11 setRoundedRectSize:v14];
              }
            }
          }
        }

        ++v5;
      }
      while (v5 < self->_daysToDisplay);
    }
    self->_needsHeaderUpdate = 0;
  }
}

- (void)_updateDayBadges
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v3 = self->_dayNumberViews;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v10;
    do
    {
      double v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v3);
        }
        -[WeekAllDayView _updateCell:withBadgeDataIndex:](self, "_updateCell:withBadgeDataIndex:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (char *)v8 + v6, (void)v9);
        double v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      v6 += (uint64_t)v8;
    }
    while (v5);
  }
}

- (void)_updateCell:(id)a3 withBadgeDataIndex:(unint64_t)a4
{
  id v10 = a3;
  if ([(NSArray *)self->_specialDayTypes count] <= a4 || [(NSArray *)self->_dayBadgeColors count] <= a4)
  {
    [v10 setBadgeType:0];
  }
  else
  {
    uint64_t v6 = [(NSArray *)self->_specialDayTypes objectAtIndex:a4];
    id v7 = [v6 integerValue];

    double v8 = [(NSArray *)self->_dayBadgeColors objectAtIndex:a4];
    long long v9 = [(NSArray *)self->_dayBadgeLocales objectAtIndex:a4];
    if ([v9 isEqual:&stru_1001D6918])
    {

      long long v9 = 0;
    }
    [v10 setBadgeColor:v8];
    [v10 setBadgeType:v7];
    [v10 setBadgeLocale:v9];
  }
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)WeekAllDayView;
  [(WeekAllDayView *)&v36 layoutSubviews];
  [(NSMutableDictionary *)self->_cachedVisibleHeightMap removeAllObjects];
  [(WeekAllDayView *)self _updateHeaderViewsIfNeeded];
  [(WeekAllDayView *)self _layoutDayNumberCells];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int64_t v3 = [(WeekAllDayView *)self occurrenceViews];
  id v4 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v33;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v33 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * i) layoutIfNeeded];
      }
      id v4 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v4);
  }

  if (!self->_verticalDaySeparators) {
    [(WeekAllDayView *)self _buildVerticalDaySeparators];
  }
  [(WeekAllDayView *)self _layoutVerticalDaySeparators];
  [(WeekAllDayView *)self bounds];
  double v8 = v7;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_10003A45C;
  v30[4] = sub_10003A46C;
  id v31 = +[NSMutableDictionary dictionary];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10003FF28;
  v28[3] = &unk_1001D2D30;
  v28[4] = self;
  v28[5] = v30;
  v28[6] = v29;
  v28[7] = 0;
  [(WeekAllDayView *)self iterateThroughEachAllDayRow:v28];
  [(WeekAllDayView *)self occurrenceInsetIntoScroller];
  EKUICurrentWidthSizeClassIsRegularInViewHierarchy();
  CalRoundToScreenScale();
  double v10 = v9;
  long long v11 = objc_opt_class();
  [v11 dayLabelHeightWithSizeClass:EKUIWidthSizeClassForViewHierarchy() usesMultiDay:[self useMultiDayHeaderStyle]];
  double v13 = v12;
  [(WeekAllDayView *)self bounds];
  double v15 = v14;
  CalOnePixelInPoints();
  -[UIView setFrame:](self->_topSeparator, "setFrame:", 0.0, v13, v8, v16);
  double v17 = v15 - v13;
  v38.origin.double x = 0.0;
  v38.origin.double y = v13;
  v38.size.double width = v8;
  v38.size.double height = v17;
  double MaxY = CGRectGetMaxY(v38);
  double v19 = 0.0;
  if (v17 > 0.0)
  {
    CalOnePixelInPoints();
    double v19 = v20;
  }
  CalOnePixelInPoints();
  -[UIView setFrame:](self->_bottomSeparator, "setFrame:", 0.0, MaxY - v19, v8, v21);
  [(UIScrollView *)self->_scroller frame];
  v40.origin.double x = 0.0;
  v40.origin.double y = v13;
  v40.size.double width = v8;
  v40.size.double height = v17;
  if (!CGRectEqualToRect(v39, v40)) {
    -[UIScrollView setFrame:](self->_scroller, "setFrame:", 0.0, v13, v8, v17);
  }
  [(UIScrollView *)self->_scroller contentSize];
  if (v23 != v8 || v22 != v10) {
    -[UIScrollView setContentSize:](self->_scroller, "setContentSize:", v8, v10);
  }
  -[WeekViewAllDayContents setFrame:](self->_contentView, "setFrame:", 0.0, 0.0, v8, v10);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    id v26 = objc_loadWeakRetained((id *)&self->_delegate);
    double v27 = [(WeekAllDayView *)self occurrenceViews];
    [v26 weekAllDayView:self didCreateOccurrenceViews:v27];
  }
  -[WeekAllDayView rectBecameVisible:](self, "rectBecameVisible:", self->_latestVisibleRect.origin.x, self->_latestVisibleRect.origin.y, self->_latestVisibleRect.size.width, self->_latestVisibleRect.size.height);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);
}

- (double)_dateForPoint:(CGPoint)a3
{
  double x = a3.x;
  [(WeekViewAllDayContents *)self->_contentView frame];
  unint64_t v6 = (unint64_t)(x / floor(v5 / (double)self->_daysToDisplay));
  if ((CalTimeDirectionIsLeftToRight() & 1) == 0) {
    unint64_t v6 = self->_daysToDisplay + ~v6;
  }
  if ([(NSArray *)self->_dayStarts count])
  {
    double v7 = [(NSArray *)self->_dayStarts objectAtIndex:0];
  }
  else
  {
    double v7 = 0;
  }
  double v8 = [v7 calendarDateByAddingDays:(int)v6];
  [v8 absoluteTime];
  double v10 = v9;

  return v10;
}

- (int64_t)rowIndexOfOccurrence:(id)a3
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = -1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000403F8;
  v7[3] = &unk_1001D2D58;
  id v4 = a3;
  id v8 = v4;
  double v9 = &v10;
  [(WeekAllDayView *)self iterateThroughEachAllDayRow:v7];
  int64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)_calendarOrderSortDescriptor
{
  double v2 = (void *)qword_100216558;
  if (!qword_100216558)
  {
    id v3 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"calendarOrder" ascending:1];
    id v4 = (void *)qword_100216558;
    qword_100216558 = (uint64_t)v3;

    double v2 = (void *)qword_100216558;
  }

  return v2;
}

- (id)_numberOfDaysSortDescriptor
{
  double v2 = (void *)qword_100216560;
  if (!qword_100216560)
  {
    id v3 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"lengthForSorting" ascending:0];
    id v4 = (void *)qword_100216560;
    qword_100216560 = (uint64_t)v3;

    double v2 = (void *)qword_100216560;
  }

  return v2;
}

+ (double)dayLabelHeightWithSizeClass:(int64_t)a3 usesMultiDay:(BOOL)a4
{
  if (a4) {
    +[MultiDayNavigationViewCell heightRequiredWithSizeClass:a3];
  }
  else {
    +[LargeDayNavigationViewCell heightRequiredWithSizeClass:usesMultiDayStyle:](LargeDayNavigationViewCell, "heightRequiredWithSizeClass:usesMultiDayStyle:", a3);
  }

  CalRoundToScreenScale();
  return result;
}

- (CGSize)scrollerContentSize
{
  [(UIScrollView *)self->_scroller contentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setScrollerContentSize:(CGSize)a3
{
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  if (self->_allowsOccurrenceSelection)
  {
    id v8 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    id v4 = v8;
    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 weekAllDayViewStartDrag:self];

      id v4 = v8;
    }
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  if (self->_scrollingToOccurrence)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_delegate);
      [v7 weekAllDayView:self didFinishScrollingToOccurrence:self->_scrollingToOccurrence];
    }
    scrollingToOccurrence = self->_scrollingToOccurrence;
    self->_scrollingToOccurrence = 0;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 weekAllDayViewDidScroll:self];
  }
}

- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    double v9 = [v11 occurrence];
    uint64_t v10 = [v11 occurrenceDate];
    [v8 weekAllDayView:self didSelectEvent:v9 userInitiated:a4 == 0 dateSelected:v10];
  }
}

- (id)presentationControllerForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v3 = [WeakRetained presentationControllerForEditMenu];

  return v3;
}

- (id)selectedEventsForEditMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v3 = [WeakRetained selectedEventsForEditMenu];

  return v3;
}

- (void)attemptDisplayReviewPrompt
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 attemptDisplayReviewPrompt];
  }
}

- (void)emptySpaceClickForCalendarWeekDayEventContent:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  if (self->_allowsOccurrenceSelection)
  {
    id v11 = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();

    id v7 = v11;
    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      -[WeekAllDayView _dateForPoint:](self, "_dateForPoint:", x, y);
      [v10 weekAllDayViewEmptySpaceClick:self];

      id v7 = v11;
    }
  }
}

- (BOOL)leftMarginIncludesTimeView
{
  return self->_leftMarginIncludesTimeView;
}

- (WeekAllDayViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WeekAllDayViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDateComponents)startDate
{
  return self->_startDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (BOOL)useMultiDayHeaderStyle
{
  return self->_useMultiDayHeaderStyle;
}

- (BOOL)showSeparatorLines
{
  return self->_showSeparatorLines;
}

- (BOOL)showsHalfOfScrolledEvents
{
  return self->_showsHalfOfScrolledEvents;
}

- (void)setShowsHalfOfScrolledEvents:(BOOL)a3
{
  self->_showsHalfOfScrolledEvents = a3;
}

- (BOOL)allowsOccurrenceSelection
{
  return self->_allowsOccurrenceSelection;
}

- (BOOL)receiveTapsInHeader
{
  return self->_receiveTapsInHeader;
}

- (double)fixedDayWidth
{
  return self->_fixedDayWidth;
}

- (double)fixedDayHeight
{
  return self->_fixedDayHeight;
}

- (void)setFixedDayHeight:(double)a3
{
  self->_double fixedDayHeight = a3;
}

- (BOOL)usesSmallText
{
  return self->_usesSmallText;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setLeftMarginIncludesTimeView:(BOOL)a3
{
  self->_leftMarginIncludesTimeView = a3;
}

- (EKEvent)dimmedOccurrence
{
  return self->_dimmedOccurrence;
}

- (int64_t)totalRowCount
{
  return self->_totalRowCount;
}

- (void)setTotalRowCount:(int64_t)a3
{
  self->_totalRowCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedVisibleHeightMap, 0);
  objc_storeStrong((id *)&self->_temporaryViewCacheByDay, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollingToOccurrence, 0);
  objc_storeStrong((id *)&self->_selectedOccurrenceView, 0);
  objc_storeStrong((id *)&self->_dimmedOccurrence, 0);
  objc_storeStrong((id *)&self->_selectedEvent, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_dayBadgeLocales, 0);
  objc_storeStrong((id *)&self->_dayBadgeColors, 0);
  objc_storeStrong((id *)&self->_specialDayTypes, 0);
  objc_storeStrong((id *)&self->_verticalDaySeparators, 0);
  objc_storeStrong((id *)&self->_dayNumberViews, 0);
  objc_storeStrong((id *)&self->_scroller, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_shouldAnnotateByDay, 0);
  objc_storeStrong((id *)&self->_reusableViews, 0);
  objc_storeStrong((id *)&self->_layedOutRowsForEachDay, 0);
  objc_storeStrong((id *)&self->_layedOutRows, 0);
  objc_storeStrong((id *)&self->_dayStarts, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end