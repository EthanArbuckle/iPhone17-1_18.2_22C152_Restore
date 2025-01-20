@interface MonthWeekOccurrencesView
+ (double)maxNarrowOccurrenceHeight;
+ (double)minNarrowOccurrenceHeight;
+ (id)xMoreStringAttributesCompact:(BOOL)a3 narrow:(BOOL)a4;
+ (void)clearMoreEventAttributes;
- (BOOL)animating;
- (BOOL)drawWithViews;
- (BOOL)hasDrawnBefore;
- (BOOL)hasOccurrences;
- (BOOL)isBackgroundScene;
- (BOOL)isCompact;
- (BOOL)isNarrow;
- (BOOL)layoutOccurrencesIfNeeded;
- (BOOL)occurrence:(id)a3 hasSymbolAtPoint:(CGPoint)a4;
- (CGRect)_frameForStartColumn:(unint64_t)a3 endColumn:(unint64_t)a4 dayRow:(unint64_t)a5 occurrenceRow:(double)a6 numRows:(double)a7;
- (CGRect)frameForLastOccurrenceOnDay:(id)a3;
- (CGRect)frameForOccurrence:(id)a3 onDay:(id)a4;
- (CGRect)frameForOccurrenceAfterLastOnDay:(id)a3;
- (EKCalendarDate)endDate;
- (EKCalendarDate)startDate;
- (EKEvent)selectedOccurrence;
- (MonthWeekOccurrencesView)initWithFrame:(CGRect)a3;
- (MonthWeekViewOccurrencesViewDelegate)delegate;
- (NSArray)selectedOccurrences;
- (NSString)description;
- (UIView)occurrenceContainer;
- (_NSRange)_dayRangeForOccurrence:(id)a3 useProposedTime:(BOOL)a4 isMultiDay:(BOOL *)a5;
- (double)_occurrenceHeight;
- (id)_calendarDateAtPoint:(CGPoint)a3;
- (id)_monthOccurrenceAtPoint:(CGPoint)a3;
- (id)_occurrenceViewForEventOccurrence:(id)a3;
- (id)annotatedEntities;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)dayBadgeColorsFromOccurrences;
- (id)dayBadgeLocalesFromOccurrences;
- (id)dayTypesFromOccurrences;
- (id)firstNonAllDayEvent;
- (id)firstOccurrencesForEachDay;
- (id)occurrenceAtPoint:(CGPoint)a3;
- (id)occurrenceViewForOccurrence:(id)a3 onDay:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)secondAndThirdOccurrencesForEachDay;
- (int64_t)_dayTypeForOccurrence:(id)a3;
- (unint64_t)dayCount;
- (void)_layoutSingleOccurrence:(id)a3 index:(double)a4 numRows:(double)a5 drawTimeString:(BOOL)a6;
- (void)_setUpInteractions;
- (void)_updateOccurrencesBounds;
- (void)animateBlock:(id)a3;
- (void)deselectOccurrence:(id)a3;
- (void)displayLayer:(id)a3;
- (void)drawIntoContext:(CGContext *)a3 traitCollection:(id)a4;
- (void)layoutOccurrences;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)renderLayer;
- (void)selectOccurrence:(id)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setDayCount:(unint64_t)a3;
- (void)setDayFrames:(CGRect *)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawWithViews:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setHasDrawnBefore:(BOOL)a3;
- (void)setIsBackgroundScene:(BOOL)a3;
- (void)setIsCompact:(BOOL)a3;
- (void)setNeedsDisplay;
- (void)setOccurrenceContainer:(id)a3;
- (void)setOccurrences:(id)a3;
- (void)setSelectedOccurrence:(id)a3;
- (void)setSelectedOccurrences:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStartDate:(id)a3 endDate:(id)a4 dayCount:(int64_t)a5;
- (void)setupEntityProvider;
- (void)show:(BOOL)a3 occurrenceView:(id)a4 atRow:(double)a5 numRows:(double)a6 drawTimeString:(BOOL)a7;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation MonthWeekOccurrencesView

- (MonthWeekOccurrencesView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MonthWeekOccurrencesView;
  v3 = -[MonthWeekOccurrencesView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_drawLock._os_unfair_lock_opaque = 0;
    v3->_layoutOccurrencesNeeded = 1;
    v5 = +[UIColor clearColor];
    [(MonthWeekOccurrencesView *)v4 setBackgroundColor:v5];

    v6 = [(MonthWeekOccurrencesView *)v4 layer];
    [v6 setDelegate:v4];

    v7 = [(MonthWeekOccurrencesView *)v4 layer];
    [v7 setValue:&__kCFBooleanTrue forKeyPath:@"separatedOptions.enableContext"];
    [v7 setNeedsDisplay];
    for (uint64_t i = 0; i != 7; ++i)
    {
      uint64_t v9 = objc_opt_new();
      v10 = v4->_moreEventsViews[i];
      v4->_moreEventsViews[i] = (_MoreEventsView *)v9;
    }
    [(MonthWeekOccurrencesView *)v4 _setUpInteractions];
    [(MonthWeekOccurrencesView *)v4 setupEntityProvider];
  }
  return v4;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)MonthWeekOccurrencesView;
  v3 = [(MonthWeekOccurrencesView *)&v8 description];
  v4 = [(EKCalendarDate *)self->_startDate date];
  v5 = CUIKStringForDate();
  v6 = +[NSString stringWithFormat:@"%@; Month Represented: %@", v3, v5];

  return (NSString *)v6;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (!a3 && !self->_drawsWithViews)
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      v4 = [(MonthWeekOccurrencesView *)self subviews];
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v10;
        do
        {
          for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v4);
            }
            [*(id *)(*((void *)&v9 + 1) + 8 * i) removeFromSuperview];
          }
          id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v6);
      }

      if (self->_needsRelayout) {
        [(MonthWeekOccurrencesView *)self layoutOccurrences];
      }
      [(MonthWeekOccurrencesView *)self layoutSubviews];
      [(MonthWeekOccurrencesView *)self renderLayer];
    }
  }
}

- (void)setDrawWithViews:(BOOL)a3
{
  if (self->_drawsWithViews != a3)
  {
    self->_drawsWithViews = a3;
    if (a3)
    {
      v4 = +[_BackgroundViewRenderManager sharedManager];
      [v4 cancelAllRendering];

      id v5 = [(MonthWeekOccurrencesView *)self layer];
      [v5 setContents:0];

      id v6 = objc_alloc((Class)UIView);
      [(MonthWeekOccurrencesView *)self bounds];
      double v8 = v7;
      [(MonthWeekOccurrencesView *)self bounds];
      id v9 = [v6 initWithFrame:0.0, 0.0, v8];
      [(MonthWeekOccurrencesView *)self setOccurrenceContainer:v9];

      long long v10 = [(MonthWeekOccurrencesView *)self occurrenceContainer];
      [(MonthWeekOccurrencesView *)self addSubview:v10];

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v11 = self->_allMonthViews;
      id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            v17 = [(MonthWeekOccurrencesView *)self occurrenceContainer];
            [v17 addSubview:v16];
          }
          id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v13);
      }

      uint64_t v18 = 0;
      moreEventsViews = self->_moreEventsViews;
      do
      {
        [(_MoreEventsView *)moreEventsViews[v18] setIsCompact:self->_isCompact];
        [(MonthWeekOccurrencesView *)self addSubview:moreEventsViews[v18++]];
      }
      while (v18 != 7);
    }
    else if (![(MonthWeekOccurrencesView *)self animating])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v20 = [(MonthWeekOccurrencesView *)self subviews];
      id v21 = [v20 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v26;
        do
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v26 != v23) {
              objc_enumerationMutation(v20);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * (void)j) removeFromSuperview];
          }
          id v22 = [v20 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v22);
      }

      [(MonthWeekOccurrencesView *)self setOccurrenceContainer:0];
      [(MonthWeekOccurrencesView *)self layoutSubviews];
      [(MonthWeekOccurrencesView *)self renderLayer];
    }
  }
}

- (BOOL)drawWithViews
{
  return self->_drawsWithViews;
}

- (void)setStartDate:(id)a3 endDate:(id)a4 dayCount:(int64_t)a5
{
  id v12 = a3;
  id v9 = a4;
  if (![v12 isEqual:self->_startDate]
    || ![v9 isEqual:self->_endDate]
    || self->_dayCount != a5)
  {
    objc_storeStrong((id *)&self->_startDate, a3);
    objc_storeStrong((id *)&self->_endDate, a4);
    self->_dayCount = a5;
    allOccurrences = self->_allOccurrences;
    self->_allOccurrences = (NSArray *)&__NSArray0__struct;

    self->_layoutOccurrencesNeeded = 1;
    if ([(EKCalendarDate *)self->_startDate day] == (id)1) {
      int64_t v11 = 7 - self->_dayCount;
    }
    else {
      int64_t v11 = 0;
    }
    self->_firstDayIndex = v11;
    [(MonthWeekOccurrencesView *)self setNeedsLayout];
  }
}

+ (id)xMoreStringAttributesCompact:(BOOL)a3 narrow:(BOOL)a4
{
  if (a3 && a4)
  {
    id v4 = (id)qword_100216618;
    if (qword_100216618) {
      goto LABEL_12;
    }
    uint64_t v5 = objc_opt_new();
    id v6 = &qword_100216618;
    double v7 = (void *)qword_100216618;
    qword_100216618 = v5;

    double v8 = +[UIColor secondaryLabelColor];
    [(id)qword_100216618 setObject:v8 forKeyedSubscript:NSForegroundColorAttributeName];

    id v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    double v10 = 8.5;
LABEL_8:
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:v10];
    uint64_t v14 = [v9 fontWithSize:];
    [(id)*v6 setObject:v14 forKeyedSubscript:NSFontAttributeName];

    v15 = objc_opt_new();
    [v15 setAlignment:1];
    uint64_t v16 = &NSParagraphStyleAttributeName;
    goto LABEL_11;
  }
  if (a3)
  {
    id v4 = (id)qword_100216620;
    if (qword_100216620) {
      goto LABEL_12;
    }
    uint64_t v11 = objc_opt_new();
    id v6 = &qword_100216620;
    id v12 = (void *)qword_100216620;
    qword_100216620 = v11;

    id v13 = +[UIColor secondaryLabelColor];
    [(id)qword_100216620 setObject:v13 forKeyedSubscript:NSForegroundColorAttributeName];

    id v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    double v10 = 9.5;
    goto LABEL_8;
  }
  id v4 = (id)qword_100216628;
  if (qword_100216628) {
    goto LABEL_12;
  }
  uint64_t v17 = objc_opt_new();
  id v6 = &qword_100216628;
  uint64_t v18 = (void *)qword_100216628;
  qword_100216628 = v17;

  v19 = +[UIColor secondaryLabelColor];
  [(id)qword_100216628 setObject:v19 forKeyedSubscript:NSForegroundColorAttributeName];

  v15 = +[MonthViewOccurrence textFont];
  uint64_t v16 = &NSFontAttributeName;
LABEL_11:
  [(id)*v6 setObject:v15 forKeyedSubscript:*v16];

  id v4 = (id)*v6;
LABEL_12:

  return v4;
}

+ (void)clearMoreEventAttributes
{
  v2 = (void *)qword_100216618;
  qword_100216618 = 0;

  v3 = (void *)qword_100216620;
  qword_100216620 = 0;

  id v4 = (void *)qword_100216628;
  qword_100216628 = 0;
}

- (id)occurrenceAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(MonthWeekOccurrencesView *)self isNarrow])
  {
    id v6 = 0;
  }
  else
  {
    double v7 = -[MonthWeekOccurrencesView _monthOccurrenceAtPoint:](self, "_monthOccurrenceAtPoint:", x, y);
    id v6 = [v7 occurrence];
  }

  return v6;
}

- (id)_monthOccurrenceAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = self->_allMonthViews;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v9 occFrame:(void)v20];
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        double v17 = v16;
        +[MonthViewOccurrence verticalSpaceBetweenOccurrences];
        v27.size.height = v17 + v18;
        v27.origin.CGFloat x = v11;
        v27.origin.CGFloat y = v13;
        v27.size.width = v15;
        v26.CGFloat x = x;
        v26.CGFloat y = y;
        if (CGRectContainsPoint(v27, v26))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)occurrence:(id)a3 hasSymbolAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = [v7 CUIK_symbolName:[v7 isAllDay]];

  if (v8)
  {
    id v9 = -[MonthWeekOccurrencesView _monthOccurrenceAtPoint:](self, "_monthOccurrenceAtPoint:", x, y);
    double v10 = v9;
    if (v9) {
      unsigned __int8 v11 = [v9 isPointInSymbol:x, y];
    }
    else {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)_calendarDateAtPoint:(CGPoint)a3
{
  firstDayIndeCGFloat x = self->_firstDayIndex;
  if ((int)firstDayIndex > 6)
  {
LABEL_6:
    v19 = 0;
  }
  else
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    uint64_t v7 = (int)firstDayIndex + 1;
    p_size = &self->_dayFrames[(int)firstDayIndex].size;
    while (1)
    {
      CalRoundRectToScreenScale();
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      double v14 = v13;
      CGFloat v16 = v15;
      CalOnePixelInPoints();
      v23.size.width = v17 + v14;
      v23.origin.CGFloat x = v10;
      v23.origin.CGFloat y = v12;
      v23.size.height = v16;
      v22.CGFloat x = x;
      v22.CGFloat y = y;
      if (CGRectContainsPoint(v23, v22)) {
        break;
      }
      p_size += 2;
      if (v7++ == 7) {
        goto LABEL_6;
      }
    }
    v19 = [(EKCalendarDate *)self->_startDate calendarDateByAddingDays:0];
  }

  return v19;
}

- (id)firstOccurrencesForEachDay
{
  v3 = objc_opt_new();
  id v4 = [(NSMutableArray *)self->_layedOutRows firstObject];
  uint64_t v5 = v4;
  if (v4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    [v4 occurrenceBlocks];
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          CGFloat v12 = [v11 occurrence];
          double v13 = [v12 eventOccurrenceID];
          [v3 setObject:v11 forKeyedSubscript:v13];
        }
        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }
  }
  if ([(MonthWeekOccurrencesView *)self dayCount])
  {
    unint64_t v14 = 0;
    do
    {
      if (([v5 isFilledForDay:v14] & 1) == 0)
      {
        double v15 = [(NSMutableArray *)self->_singleDayEventBuckets objectAtIndexedSubscript:v14];
        if ([v15 count])
        {
          CGFloat v16 = [v15 objectAtIndexedSubscript:0];
          double v17 = [v16 occurrence];
          double v18 = [v17 eventOccurrenceID];
          [v3 setObject:v16 forKeyedSubscript:v18];
        }
      }
      ++v14;
    }
    while (v14 < [(MonthWeekOccurrencesView *)self dayCount]);
  }

  return v3;
}

- (id)secondAndThirdOccurrencesForEachDay
{
  v3 = objc_opt_new();
  if ([(MonthWeekOccurrencesView *)self dayCount])
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [(NSMutableArray *)self->_secondOccurrencesForEachDay objectAtIndexedSubscript:v4];
      id v6 = +[NSNull null];

      if (v5 != v6)
      {
        id v7 = [(NSMutableArray *)self->_secondOccurrencesForEachDay objectAtIndexedSubscript:v4];
        [v3 addObject:v7];
      }
      id v8 = [(NSMutableArray *)self->_thirdOccurrencesForEachDay objectAtIndexedSubscript:v4];
      uint64_t v9 = +[NSNull null];

      if (v8 != v9)
      {
        CGFloat v10 = [(NSMutableArray *)self->_thirdOccurrencesForEachDay objectAtIndexedSubscript:v4];
        [v3 addObject:v10];
      }
      ++v4;
    }
    while (v4 < [(MonthWeekOccurrencesView *)self dayCount]);
  }

  return v3;
}

- (CGRect)frameForOccurrence:(id)a3 onDay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  CGFloat v11 = height;
  CGFloat v12 = width;
  CGFloat v13 = y;
  CGFloat x = CGRectNull.origin.x;
  if (v6)
  {
    CGFloat v11 = CGRectNull.size.height;
    CGFloat v12 = CGRectNull.size.width;
    CGFloat v13 = CGRectNull.origin.y;
    CGFloat x = CGRectNull.origin.x;
    if (([v6 isNew] & 1) == 0)
    {
      double v15 = [(MonthWeekOccurrencesView *)self _occurrenceViewForEventOccurrence:v6];
      [v15 frame];
      CGFloat x = v16;
      CGFloat v13 = v17;
      CGFloat v12 = v18;
      CGFloat v11 = v19;
    }
  }
  unint64_t v20 = (unint64_t)[v7 differenceInDays:self->_startDate];
  if ([v6 isNew])
  {
    [(MonthWeekOccurrencesView *)self _frameForStartColumn:v20 endColumn:v20 dayRow:0 occurrenceRow:0.0 numRows:1.0];
LABEL_12:
    CGFloat x = v21;
    CGFloat v13 = v22;
    CGFloat v12 = v23;
    CGFloat v11 = v24;
    goto LABEL_14;
  }
  if (!v6) {
    goto LABEL_21;
  }
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = v13;
  v30.size.CGFloat width = v12;
  v30.size.CGFloat height = v11;
  if (CGRectIsNull(v30)
    || (v31.origin.x = x, v31.origin.CGFloat y = v13, v31.size.width = v12, v31.size.height = v11, CGRectIsEmpty(v31)))
  {
LABEL_21:
    if (v20 > 6)
    {
      CGFloat v11 = height;
      CGFloat v12 = width;
      CGFloat v13 = y;
      CGFloat x = CGRectNull.origin.x;
      goto LABEL_14;
    }
    moreEventsViews = self->_moreEventsViews;
    CGFloat v11 = height;
    CGFloat v12 = width;
    CGFloat v13 = y;
    CGFloat x = CGRectNull.origin.x;
    if ([(_MoreEventsView *)moreEventsViews[v20] numberOfEvents] >= 1)
    {
      [(_MoreEventsView *)moreEventsViews[v20] frame];
      goto LABEL_12;
    }
  }
LABEL_14:

  double v26 = x;
  double v27 = v13;
  double v28 = v12;
  double v29 = v11;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (CGRect)frameForLastOccurrenceOnDay:(id)a3
{
  id v4 = a3;
  id v5 = [v4 differenceInDays:self->_startDate];
  uint64_t v36 = 0;
  v37 = (id *)&v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_10005F208;
  v40 = sub_10005F218;
  id v41 = 0;
  layedOutRows = self->_layedOutRows;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10005F220;
  v35[3] = &unk_1001D3160;
  v35[4] = &v36;
  v35[5] = v5;
  [(NSMutableArray *)layedOutRows enumerateObjectsWithOptions:2 usingBlock:v35];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = -[NSMutableArray objectAtIndexedSubscript:](self->_singleDayEventBuckets, "objectAtIndexedSubscript:", v5, 0);
  id v8 = [v7 countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v7);
        }
        CGFloat v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        [v11 frame];
        double v13 = v12;
        double v15 = v14;
        [v37[5] frame];
        double v16 = v13 + v15;
        if (v13 + v15 > v17 + v18) {
          objc_storeStrong(v37 + 5, v11);
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v8);
  }

  [v37[5] frame];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  _Block_object_dispose(&v36, 8);

  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (CGRect)frameForOccurrenceAfterLastOnDay:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  id v5 = [v4 differenceInDays:self->_startDate];
  layedOutRows = self->_layedOutRows;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005F4E0;
  v21[3] = &unk_1001D3160;
  v21[4] = &v22;
  v21[5] = v5;
  [(NSMutableArray *)layedOutRows enumerateObjectsWithOptions:2 usingBlock:v21];
  id v7 = [(NSMutableArray *)self->_singleDayEventBuckets objectAtIndexedSubscript:v5];
  id v8 = (char *)[v7 count];
  v23[3] += (uint64_t)(v8 + 1);

  [(MonthWeekOccurrencesView *)self _frameForStartColumn:v5 endColumn:v5 dayRow:0 occurrenceRow:(double)(unint64_t)v23[3] numRows:1.0];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  _Block_object_dispose(&v22, 8);

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (id)occurrenceViewForOccurrence:(id)a3 onDay:(id)a4
{
  id v6 = a3;
  [(MonthWeekOccurrencesView *)self frameForOccurrence:v6 onDay:a4];
  double v11 = -[MonthViewOccurrence initWithFrame:occurrence:forDayRange:isCompact:isMultiDay:]([MonthViewOccurrence alloc], "initWithFrame:occurrence:forDayRange:isCompact:isMultiDay:", v6, 0, 1, [(MonthWeekOccurrencesView *)self isCompact], 0, v7, v8, v9, v10);

  return v11;
}

- (CGRect)_frameForStartColumn:(unint64_t)a3 endColumn:(unint64_t)a4 dayRow:(unint64_t)a5 occurrenceRow:(double)a6 numRows:(double)a7
{
  firstDayIndeCGFloat x = self->_firstDayIndex;
  unint64_t v9 = firstDayIndex + a3;
  unint64_t v10 = firstDayIndex + a4;
  BOOL v11 = v9 > 6 || v10 >= 7;
  if (v11) {
    unint64_t v12 = v9 % 7;
  }
  else {
    unint64_t v12 = v9;
  }
  if (v11) {
    unint64_t v13 = v10 % 7;
  }
  else {
    unint64_t v13 = v10;
  }
  [(MonthWeekOccurrencesView *)self _occurrenceHeight];
  +[MonthViewOccurrence verticalSpaceBetweenOccurrences];
  CGRect v24 = CGRectUnion(self->_dayFrames[v12], self->_dayFrames[v13]);
  CGFloat x = v24.origin.x;
  double y = v24.origin.y;
  CGFloat width = v24.size.width;
  CalRoundToScreenScale();
  double v18 = v17 + y;
  CalRoundToScreenScale();
  double v20 = v19;
  double v21 = x;
  double v22 = v18;
  double v23 = width;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v23;
  result.origin.double y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (void)setDayFrames:(CGRect *)a3
{
  unint64_t v4 = 0;
  p_CGFloat height = &self->_dayFrames[0].size.height;
  p_size = &a3->size;
  do
  {
    [(MonthWeekOccurrencesView *)self bounds];
    v12.origin.CGFloat x = v7;
    v12.origin.double y = v8;
    v12.size.CGFloat width = v9;
    v12.size.CGFloat height = v10;
    *(CGRect *)&p_height[v4 / 8 - 3] = CGRectIntersection(*(CGRect *)&p_size[v4 / 0x10 - 1].width, v12);
    v4 += 32;
  }
  while (v4 != 224);

  [(MonthWeekOccurrencesView *)self setNeedsLayout];
}

- (void)_setUpInteractions
{
  if (!self->_interaction)
  {
    v3 = (UIPointerInteraction *)[objc_alloc((Class)UIPointerInteraction) initWithDelegate:self];
    interaction = self->_interaction;
    self->_interaction = v3;

    [(MonthWeekOccurrencesView *)self addInteraction:self->_interaction];
  }
  id v5 = [objc_alloc((Class)UIContextMenuInteraction) initWithDelegate:self];
  [(MonthWeekOccurrencesView *)self addInteraction:v5];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  [v6 location];
  CGFloat v7 = -[MonthWeekOccurrencesView _monthOccurrenceAtPoint:](self, "_monthOccurrenceAtPoint:");
  CGFloat v8 = [v7 occurrence];
  [v6 location];
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = -[MonthWeekOccurrencesView _calendarDateAtPoint:](self, "_calendarDateAtPoint:", v10, v12);
  double v14 = (void *)v13;
  double v15 = 0;
  if (v7 && v8 && v13)
  {
    if ([v7 selected])
    {
      double v15 = 0;
    }
    else
    {
      [(MonthWeekOccurrencesView *)self frameForOccurrence:v8 onDay:v14];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      [v7 backgroundInsets];
      double v15 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v17 + v27, v19 + v24, v21 - (v27 + v25), v23 - (v24 + v26));
    }
  }

  return v15;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6 = a4;
  [v6 rect];
  double MidX = CGRectGetMidX(v18);
  [v6 rect];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v19.origin.CGFloat x = v9;
  v19.origin.double y = v11;
  v19.size.CGFloat width = v13;
  v19.size.CGFloat height = v15;
  -[MonthWeekOccurrencesView _monthOccurrenceAtPoint:](self, "_monthOccurrenceAtPoint:", MidX, CGRectGetMidY(v19));
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  [v16 setHidden:1];
  [(MonthWeekOccurrencesView *)self setNeedsDisplay];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [v8 rect];
  double MidX = CGRectGetMidX(v26);
  [v8 rect];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v27.origin.CGFloat x = v11;
  v27.origin.double y = v13;
  v27.size.CGFloat width = v15;
  v27.size.CGFloat height = v17;
  -[MonthWeekOccurrencesView _monthOccurrenceAtPoint:](self, "_monthOccurrenceAtPoint:", MidX, CGRectGetMidY(v27));
  double v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  double v22 = sub_10005FBB8;
  double v23 = &unk_1001D3188;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = v18;
  double v25 = self;
  CGRect v19 = objc_retainBlock(&v20);
  if (objc_msgSend(v18, "selected", v20, v21, v22, v23)) {
    [v7 addCompletion:v19];
  }
  else {
    ((void (*)(void ***, uint64_t))v19[2])(v19, 1);
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  [v5 rect];
  double MidX = CGRectGetMidX(v36);
  [v5 rect];
  double MidY = CGRectGetMidY(v37);
  id v8 = -[MonthWeekOccurrencesView occurrenceAtPoint:](self, "occurrenceAtPoint:", MidX, MidY);
  uint64_t v9 = -[MonthWeekOccurrencesView _calendarDateAtPoint:](self, "_calendarDateAtPoint:", MidX, MidY);
  double v10 = (void *)v9;
  CGFloat v11 = 0;
  if (v8 && v9)
  {
    double v12 = [(MonthWeekOccurrencesView *)self superview];
    [v5 rect];
    [v12 convertRect:self];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    uint64_t v21 = [(MonthWeekOccurrencesView *)self superview];
    double v22 = createImageViewFromView();

    [v22 setFrame:v14, v16, v18, v20];
    id v23 = objc_alloc_init((Class)UIPreviewParameters);
    id v24 = [(MonthWeekOccurrencesView *)self delegate];
    double v25 = [v24 containerViewForOccurrencePreview];

    if (!v25) {
      double v25 = self;
    }
    -[MonthWeekOccurrencesView convertPoint:fromView:](v25, "convertPoint:fromView:", self, MidX, MidY);
    double v27 = v26;
    double v29 = v28;
    if ([v8 isAllDay])
    {
      double v30 = +[UIColor clearColor];
      [v23 setBackgroundColor:v30];
    }
    id v31 = [objc_alloc((Class)UIPreviewTarget) initWithContainer:v25 center:v27];
    id v32 = [objc_alloc((Class)UITargetedPreview) initWithView:v22 parameters:v23 target:v31];
    long long v33 = +[UIPointerHoverEffect effectWithPreview:v32];
    [v33 setPreferredTintMode:1];
    [v33 setPrefersShadow:0];
    [v33 setPrefersScaledContent:0];
    CGFloat v11 = +[UIPointerStyle styleWithEffect:v33 shape:0];
  }

  return v11;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MonthWeekOccurrencesView;
  [(MonthWeekOccurrencesView *)&v3 layoutSubviews];
  if (!self->_inLayoutOccurrences) {
    [(MonthWeekOccurrencesView *)self _updateOccurrencesBounds];
  }
  [(MonthWeekOccurrencesView *)self setNeedsDisplay];
}

- (void)drawIntoContext:(CGContext *)a3 traitCollection:(id)a4
{
  id v6 = a4;
  if (![(MonthWeekOccurrencesView *)self animating])
  {
    os_unfair_lock_lock(&self->_drawLock);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = self->_allMonthViews;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v28;
      CGFloat y = CGRectZero.origin.y;
      CGFloat width = CGRectZero.size.width;
      CGFloat height = CGRectZero.size.height;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          double v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ((objc_msgSend(v15, "hidden", (void)v27) & 1) == 0)
          {
            [v15 occAlpha];
            if (v16 != 0.0)
            {
              [v15 occFrame];
              double v18 = v17;
              double v20 = v19;
              double v22 = v21;
              double v24 = v23;
              v32.origin.CGFloat x = CGRectZero.origin.x;
              v32.origin.CGFloat y = y;
              v32.size.CGFloat width = width;
              v32.size.CGFloat height = height;
              v33.origin.CGFloat x = v18;
              v33.origin.CGFloat y = v20;
              v33.size.CGFloat width = v22;
              v33.size.CGFloat height = v24;
              if (!CGRectEqualToRect(v32, v33)) {
                [v15 drawInFrame:a3 context:v6 traitCollection:v18];
              }
            }
          }
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v9);
    }

    uint64_t v25 = 0;
    moreEventsViews = self->_moreEventsViews;
    do
    {
      if ([(_MoreEventsView *)moreEventsViews[v25] numberOfEvents] >= 1)
      {
        [(_MoreEventsView *)moreEventsViews[v25] setIsCompact:self->_isCompact];
        [(_MoreEventsView *)moreEventsViews[v25] draw];
      }
      ++v25;
    }
    while (v25 != 7);
    os_unfair_lock_unlock(&self->_drawLock);
  }
}

- (void)_layoutSingleOccurrence:(id)a3 index:(double)a4 numRows:(double)a5 drawTimeString:(BOOL)a6
{
  BOOL v6 = a6;
  id v46 = a3;
  unint64_t v10 = (unint64_t)[v46 startRange];
  unint64_t v11 = (unint64_t)[v46 endRange];
  unint64_t dayCount = self->_dayCount;
  unint64_t v13 = v10 / dayCount;
  unint64_t v14 = v10 % dayCount;
  unint64_t v15 = v11 / dayCount;
  unint64_t v16 = v11 % dayCount;
  unsigned int v17 = [v46 isSingleDay];
  [v46 resetSegments];
  double v18 = [v46 occurrence];
  double v19 = [v18 startDate];
  [v19 timeIntervalSinceReferenceDate];
  double v21 = v20;

  double v22 = [v18 endDate];
  [v22 timeIntervalSinceReferenceDate];
  double v24 = v23;

  [(EKCalendarDate *)self->_startDate absoluteTime];
  double v26 = v25;
  [(EKCalendarDate *)self->_endDate absoluteTime];
  double v28 = v27;
  unint64_t v29 = v15 - v13;
  BOOL v45 = v6;
  if (v15 == v13)
  {
    if (v17) {
      double v30 = a5;
    }
    else {
      double v30 = 1.0;
    }
    [(MonthWeekOccurrencesView *)self _frameForStartColumn:v14 endColumn:v16 dayRow:v13 occurrenceRow:a4 numRows:v30];
    [v46 setFrame:];
    [v46 setSplitLeftEdge:v21 < v26 splitRightEdge:v24 > v28];
    if (v21 >= v26)
    {
      BOOL v32 = 0;
    }
    else
    {
      [v46 frame];
      BOOL v32 = v31 > self->_dayFrames[0].origin.x + 1.0;
    }
    [v46 setFadeLeftEdge:v32];
    if (v24 <= v28)
    {
      BOOL v44 = 0;
    }
    else
    {
      [v46 frame];
      BOOL v44 = v42 + v43 < self->_dayFrames[6].origin.x + self->_dayFrames[6].size.width + -1.0;
    }
    [v46 setFadeRightEdge:v44];
  }
  else if (v29 != -1)
  {
    unint64_t v33 = 0;
    do
    {
      if (v33 >= v29) {
        uint64_t v34 = v16;
      }
      else {
        uint64_t v34 = 6;
      }
      BOOL v35 = v24 > v28 || v33 < v29;
      if (v33) {
        unint64_t v36 = 0;
      }
      else {
        unint64_t v36 = v14;
      }
      [(MonthWeekOccurrencesView *)self _frameForStartColumn:v36 endColumn:v34 dayRow:v33 + v13 occurrenceRow:a4 numRows:1.0];
      BOOL v39 = v21 < v26 || v33 != 0;
      BOOL v40 = v21 < v26 && v37 > self->_dayFrames[0].origin.x + 1.0;
      BOOL v41 = v24 > v28 && v37 + v38 < self->_dayFrames[6].origin.x + self->_dayFrames[6].size.width + -1.0;
      [v46 addSegmentWithFrame:v39 splitLeftEdge:v35 splitRightEdge:v40 fadeLeftEdge:v41];
      ++v33;
    }
    while (v29 + 1 != v33);
  }
  [v46 setDrawsTimeString:v45];
}

- (_NSRange)_dayRangeForOccurrence:(id)a3 useProposedTime:(BOOL)a4 isMultiDay:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [v8 eventStore];
  unint64_t v10 = [v9 timeZone];

  if (v6)
  {
    unint64_t v11 = [v8 proposedStartDate];

    if (!v11)
    {
      NSUInteger v35 = 0;
      id v33 = 0;
      goto LABEL_28;
    }
    BOOL v40 = a5;
    double v12 = [v8 proposedStartDate];
    unint64_t v13 = +[EKCalendarDate calendarDateWithDate:v12 timeZone:v10];

    unint64_t v14 = [v8 proposedStartDate];
    [v8 duration];
    unint64_t v15 = [v14 dateByAddingTimeInterval:];
  }
  else
  {
    BOOL v40 = a5;
    unint64_t v16 = [v8 startDate];
    unint64_t v13 = +[EKCalendarDate calendarDateWithDate:v16 timeZone:v10];

    unint64_t v15 = [v8 endDate];
  }
  unsigned int v17 = +[EKCalendarDate calendarDateWithDate:v15 timeZone:v10];

  if (([v8 isAllDay] & 1) == 0)
  {
    [v17 absoluteTime];
    double v19 = v18 + -1.0;
    double v20 = [v17 timeZone];
    uint64_t v21 = +[EKCalendarDate calendarDateWithAbsoluteTime:v20 timeZone:v19];

    unsigned int v17 = (void *)v21;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000607CC;
  block[3] = &unk_1001D2740;
  id v22 = v10;
  id v42 = v22;
  if (qword_100216640 != -1) {
    dispatch_once(&qword_100216640, block);
  }
  if (([(id)qword_100216630 isEqualToTimeZone:v22] & 1) == 0)
  {
    objc_storeStrong((id *)&qword_100216630, v10);
    [(id)qword_100216638 removeAllObjects];
  }
  BOOL v39 = v10;
  double v23 = [[DayRangeCacheKey alloc] initWithOccurrenceStart:v13 occurrenceEnd:v17 rangeBoundStart:self->_startDate rangeBoundEnd:self->_endDate];
  double v24 = [(id)qword_100216638 objectForKey:v23];
  if (!v24)
  {
    unint64_t v25 = CUIKDayRangeForOccurenceDates();
    unint64_t dayCount = self->_dayCount;
    if (dayCount >= 7) {
      unint64_t dayCount = 7;
    }
    unint64_t v28 = v25 + v26;
    unint64_t v29 = dayCount - 1;
    if (v25 < dayCount - 1) {
      unint64_t v29 = v25;
    }
    if (v28 > dayCount) {
      unint64_t v30 = v29;
    }
    else {
      unint64_t v30 = v25;
    }
    if (v28 > dayCount) {
      unint64_t v31 = dayCount + ~v29;
    }
    else {
      unint64_t v31 = v26;
    }
    double v24 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v30, v31);
    [(id)qword_100216638 setObject:v24 forKey:v23];
  }
  BOOL v32 = self;
  id v33 = [v24 rangeValue];
  NSUInteger v35 = v34;
  BOOL v36 = v34 > 1
     || [v13 compare:v32->_startDate] == (id)-1
     || [v17 compare:v32->_endDate] == (id)1;
  unint64_t v10 = v39;
  *BOOL v40 = v36;

LABEL_28:
  NSUInteger v37 = (NSUInteger)v33;
  NSUInteger v38 = v35;
  result.length = v38;
  result.location = v37;
  return result;
}

- (void)setOccurrences:(id)a3
{
  objc_storeStrong((id *)&self->_allOccurrences, a3);
  if ([(MonthWeekOccurrencesView *)self animating])
  {
    self->_needsRelayout = 1;
  }
  else
  {
    [(MonthWeekOccurrencesView *)self layoutOccurrences];
  }
}

- (BOOL)layoutOccurrencesIfNeeded
{
  BOOL layoutOccurrencesNeeded = self->_layoutOccurrencesNeeded;
  if (self->_layoutOccurrencesNeeded) {
    [(MonthWeekOccurrencesView *)self layoutOccurrences];
  }
  return layoutOccurrencesNeeded;
}

- (void)layoutOccurrences
{
  p_drawLock = &self->_drawLock;
  os_unfair_lock_lock(&self->_drawLock);
  self->_inLayoutOccurrences = 1;
  [(MonthWeekOccurrencesView *)self layoutIfNeeded];
  unint64_t v95 = [(MonthWeekOccurrencesView *)self dayCount];
  layedOutRows = self->_layedOutRows;
  v106 = self;
  if (layedOutRows)
  {
    [(NSMutableArray *)layedOutRows removeAllObjects];
    [(NSMutableArray *)self->_allMonthViews removeAllObjects];
  }
  else
  {
    unint64_t v4 = [(NSMutableArray *)objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](self->_allOccurrences, "count")];
    allMonthViews = self->_allMonthViews;
    self->_allMonthViews = v4;

    BOOL v6 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:3];
    id v7 = self->_layedOutRows;
    self->_layedOutRows = v6;
  }
  id v8 = (NSArray *)objc_opt_new();
  id v9 = (NSArray *)objc_opt_new();
  unint64_t v10 = (NSArray *)objc_opt_new();
  uint64_t v11 = 7;
  double v12 = &objc_retain_x2_ptr;
  do
  {
    unint64_t v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0, v95);
    [(NSArray *)v8 addObject:v13];

    unint64_t v14 = +[UIColor clearColor];
    [(NSArray *)v9 addObject:v14];

    [(NSArray *)v10 addObject:&stru_1001D6918];
    --v11;
  }
  while (v11);
  v105 = v10;
  v103 = +[NSMutableArray arrayWithCapacity:[(NSArray *)v106->_allOccurrences count]];
  id v101 = +[NSMutableArray arrayWithCapacity:[(NSArray *)v106->_allOccurrences count]];
  p_isa = (id *)&v106->super.super.super.isa;
  [(NSArray *)v106->_allOccurrences sortedArrayUsingComparator:&stru_1001D31C8];
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  v104 = v9;
  v107 = v8;
  id v99 = [obj countByEnumeratingWithState:&v116 objects:v130 count:16];
  if (v99)
  {
    uint64_t v98 = *(void *)v117;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
    do
    {
      for (uint64_t i = 0; i != v99; uint64_t i = (char *)i + 1)
      {
        double v20 = v12;
        if (*(void *)v117 != v98) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v116 + 1) + 8 * i);
        buf[0] = 0;
        id v22 = (char *)[p_isa _dayRangeForOccurrence:v21 useProposedTime:0 isMultiDay:buf];
        uint64_t v24 = v23;
        if (v23)
        {
          if ([v21 participationStatus] != (id)3
            || ([v21 eventStore],
                unint64_t v25 = objc_claimAutoreleasedReturnValue(),
                unsigned int v26 = [v25 showDeclinedEvents],
                v25,
                v26))
          {
            double v27 = [MonthViewOccurrence alloc];
            id v28 = [p_isa isCompact];
            unint64_t v29 = -[MonthViewOccurrence initWithFrame:occurrence:forDayRange:isProposedTime:isCompact:isMultiDay:](v27, "initWithFrame:occurrence:forDayRange:isProposedTime:isCompact:isMultiDay:", v21, v22, v24, 0, v28, buf[0], CGRectNull.origin.x, y, width, height);
            -[MonthViewOccurrence setSelected:](v29, "setSelected:", [p_isa[46] containsObject:v21]);
            if ([(MonthViewOccurrence *)v29 isSingleDay]) {
              unint64_t v30 = v101;
            }
            else {
              unint64_t v30 = v103;
            }
            [v30 addObject:v29];
            [p_isa[43] addObject:v29];
          }
        }
        id v31 = [p_isa _dayTypeForOccurrence:v21];
        if (v31)
        {
          firstDayIndeCGFloat x = v106->_firstDayIndex;
          unint64_t v33 = (unint64_t)&v22[firstDayIndex];
          unint64_t v34 = &v22[v24];
          if (&v22[firstDayIndex] < &v22[v24 + firstDayIndex])
          {
            id v35 = v31;
            do
            {
              if (v33 < [(NSArray *)v107 count])
              {
                BOOL v36 = +[NSNumber numberWithInteger:v35];
                [(NSArray *)v107 replaceObjectAtIndex:v33 withObject:v36];

                NSUInteger v37 = v20[469];
                NSUInteger v38 = [v21 calendar];
                BOOL v39 = [v37 colorWithCGColor:[v38 CGColor]];
                [(NSArray *)v104 replaceObjectAtIndex:v33 withObject:v39];

                BOOL v40 = [v21 calendar];
                uint64_t v41 = [v40 locale];
                id v42 = (void *)v41;
                if (v41) {
                  CFStringRef v43 = (const __CFString *)v41;
                }
                else {
                  CFStringRef v43 = &stru_1001D6918;
                }
                [(NSArray *)v105 replaceObjectAtIndex:v33 withObject:v43];
              }
              ++v33;
            }
            while (v33 < (unint64_t)&v34[v106->_firstDayIndex]);
          }
        }
        p_isa = (id *)&v106->super.super.super.isa;
        id v44 = [(MonthWeekOccurrencesView *)v106 _dayRangeForOccurrence:v21 useProposedTime:1 isMultiDay:buf];
        if (v45)
        {
          id v46 = v44;
          uint64_t v47 = v45;
          v48 = [MonthViewOccurrence alloc];
          BOOL v49 = [(MonthWeekOccurrencesView *)v106 isCompact];
          v50 = -[MonthViewOccurrence initWithFrame:occurrence:forDayRange:isProposedTime:isCompact:isMultiDay:](v48, "initWithFrame:occurrence:forDayRange:isProposedTime:isCompact:isMultiDay:", v21, v46, v47, 1, v49, buf[0], CGRectNull.origin.x, y, width, height);
          if ([(MonthViewOccurrence *)v50 isSingleDay]) {
            v51 = v101;
          }
          else {
            v51 = v103;
          }
          [v51 addObject:v50];
        }
        double v12 = v20;
      }
      id v99 = [obj countByEnumeratingWithState:&v116 objects:v130 count:16];
    }
    while (v99);
  }

  unint64_t v52 = v95;
  id v53 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v95];
  id v54 = p_isa[32];
  p_isa[32] = v53;

  if (v95)
  {
    do
    {
      id v55 = objc_alloc_init((Class)NSMutableArray);
      [p_isa[32] addObject:v55];

      --v52;
    }
    while (v52);
  }
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v102 = v101;
  id v56 = [v102 countByEnumeratingWithState:&v112 objects:v129 count:16];
  if (v56)
  {
    id v57 = v56;
    uint64_t v58 = *(void *)v113;
    v59 = (os_log_t *)&kCalUILogHandle;
    uint64_t v100 = *(void *)v113;
    do
    {
      for (j = 0; j != v57; j = (char *)j + 1)
      {
        if (*(void *)v113 != v58) {
          objc_enumerationMutation(v102);
        }
        v61 = *(void **)(*((void *)&v112 + 1) + 8 * (void)j);
        id v62 = [v61 startRange];
        if (v62 >= [(NSMutableArray *)v106->_singleDayEventBuckets count])
        {
          os_log_t v64 = *v59;
          if (os_log_type_enabled(*v59, OS_LOG_TYPE_ERROR))
          {
            v65 = v64;
            v66 = [v61 occurrence];
            [v66 title];
            v67 = v59;
            v69 = id v68 = v57;
            v70 = [v61 occurrence];
            v71 = [v70 startDate];
            id v72 = [(NSMutableArray *)v106->_singleDayEventBuckets count];
            *(_DWORD *)buf = 138413058;
            v122 = v69;
            __int16 v123 = 2112;
            v124 = v71;
            __int16 v125 = 2048;
            id v126 = v62;
            __int16 v127 = 2048;
            id v128 = v72;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Occurrence %@ on %@ is out of bounds for the bucket. framePosition is %lu but the bucket is %lu large.", buf, 0x2Au);

            id v57 = v68;
            v59 = v67;
            uint64_t v58 = v100;
          }
        }
        else
        {
          v63 = [(NSMutableArray *)v106->_singleDayEventBuckets objectAtIndex:v62];
          [v63 addObject:v61];
        }
      }
      id v57 = [v102 countByEnumeratingWithState:&v112 objects:v129 count:16];
    }
    while (v57);
  }

  v74 = v105;
  v73 = v106;
  if ([v103 count])
  {
    do
    {
      v75 = objc_alloc_init(_CalendarEventsRow);
      v76 = [v103 objectAtIndex:0];
      -[_CalendarEventsRow addOccurrenceBlock:](v75, "addOccurrenceBlock:");
      [(NSMutableArray *)v73->_layedOutRows addObject:v75];
      [v103 removeObjectAtIndex:0];
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id v77 = v103;
      for (k = v77; ; id v77 = k)
      {
        id v79 = [v77 countByEnumeratingWithState:&v108 objects:v120 count:16];
        if (!v79) {
          break;
        }
        v80 = 0;
        uint64_t v81 = *(void *)v109;
        unint64_t v82 = -1;
        do
        {
          for (m = 0; m != v79; m = (char *)m + 1)
          {
            if (*(void *)v109 != v81) {
              objc_enumerationMutation(k);
            }
            v84 = *(void **)(*((void *)&v108 + 1) + 8 * (void)m);
            id v85 = [(_CalendarEventsRow *)v75 spaceGapFor:v84];
            if (v85 != (id)-1 && (unint64_t)v85 < v82)
            {
              unint64_t v87 = (unint64_t)v85;
              id v88 = v84;

              v80 = v88;
              unint64_t v82 = v87;
            }
          }
          id v79 = [k countByEnumeratingWithState:&v108 objects:v120 count:16];
        }
        while (v79);

        v74 = v105;
        v73 = v106;
        if (!v80) {
          goto LABEL_64;
        }
        [(_CalendarEventsRow *)v75 addOccurrenceBlock:v80];
        [k removeObject:v80];

        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
      }

LABEL_64:
    }
    while ([k count]);
  }
  v73->_BOOL layoutOccurrencesNeeded = 0;
  [(MonthWeekOccurrencesView *)v73 _updateOccurrencesBounds];
  dayTypes = v73->_dayTypes;
  v73->_dayTypes = v107;
  v90 = v107;

  v91 = v73;
  badgeColors = v73->_badgeColors;
  v91->_badgeColors = v104;
  v93 = v104;

  badgeLocales = v91->_badgeLocales;
  v91->_badgeLocales = v74;

  v91->_inLayoutOccurrences = 0;
  os_unfair_lock_unlock(p_drawLock);
  [(MonthWeekOccurrencesView *)v91 setNeedsDisplay];
}

- (id)annotatedEntities
{
  objc_super v3 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_allOccurrences count]];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v4 = self->_allMonthViews;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unint64_t v10 = [v9 occurrence:v18];
        if (([v10 isBirthday] & 1) == 0)
        {
          [v9 occFrame];
          id v15 = objc_msgSend(objc_alloc((Class)CUIKViewEntityAnnotation), "initWithEvent:rect:state:", v10, objc_msgSend(v9, "selected"), v11, v12, v13, v14);
          [v3 addObject:v15];
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  id v16 = [v3 copy];

  return v16;
}

- (int64_t)_dayTypeForOccurrence:(id)a3
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

- (BOOL)hasOccurrences
{
  v2 = self;
  p_drawLock = &self->_drawLock;
  os_unfair_lock_lock(&self->_drawLock);
  LOBYTE(v2) = [(NSMutableArray *)v2->_allMonthViews count] != 0;
  os_unfair_lock_unlock(p_drawLock);
  return (char)v2;
}

- (id)firstNonAllDayEvent
{
  if ([(MonthWeekOccurrencesView *)self dayCount])
  {
    uint64_t v3 = 0;
    while (1)
    {
      int64_t v4 = [(NSMutableArray *)self->_singleDayEventBuckets objectAtIndexedSubscript:v3];
      int64_t v5 = [v4 firstObject];
      if (v5) {
        break;
      }

      if (++v3 >= [(MonthWeekOccurrencesView *)self dayCount]) {
        goto LABEL_5;
      }
    }
    uint64_t v7 = v5;
    id v6 = [v5 occurrence];
  }
  else
  {
LABEL_5:
    id v6 = 0;
  }

  return v6;
}

- (id)dayTypesFromOccurrences
{
  return self->_dayTypes;
}

- (id)dayBadgeColorsFromOccurrences
{
  return self->_badgeColors;
}

- (id)dayBadgeLocalesFromOccurrences
{
  return self->_badgeLocales;
}

- (id)_occurrenceViewForEventOccurrence:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64_t v5 = self->_allMonthViews;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v10 = [v9 occurrence:v13];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (EKEvent)selectedOccurrence
{
  if ([(NSMutableArray *)self->_selectedOccurrences count] == (id)1)
  {
    uint64_t v3 = [(NSMutableArray *)self->_selectedOccurrences firstObject];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (EKEvent *)v3;
}

- (void)setSelectedOccurrence:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  if (v4)
  {
    id v7 = v4;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [(MonthWeekOccurrencesView *)self setSelectedOccurrences:v6];
  }
  else
  {
    [(MonthWeekOccurrencesView *)self setSelectedOccurrences:&__NSArray0__struct];
  }
}

- (NSArray)selectedOccurrences
{
  return +[NSArray arrayWithArray:self->_selectedOccurrences];
}

- (void)setSelectedOccurrences:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MonthWeekOccurrencesView *)self selectedOccurrences];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(MonthWeekOccurrencesView *)self deselectOccurrence:*(void *)(*((void *)&v19 + 1) + 8 * (void)v9)];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[MonthWeekOccurrencesView selectOccurrence:](self, "selectOccurrence:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14), (void)v15);
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)selectOccurrence:(id)a3
{
  id v8 = a3;
  if ((-[NSMutableArray containsObject:](self->_selectedOccurrences, "containsObject:") & 1) == 0)
  {
    selectedOccurrences = self->_selectedOccurrences;
    if (!selectedOccurrences)
    {
      int64_t v5 = +[NSMutableArray array];
      id v6 = self->_selectedOccurrences;
      self->_selectedOccurrences = v5;

      selectedOccurrences = self->_selectedOccurrences;
    }
    [(NSMutableArray *)selectedOccurrences addObject:v8];
    id v7 = [(MonthWeekOccurrencesView *)self _occurrenceViewForEventOccurrence:v8];
    [v7 setSelected:1];
    [(MonthWeekOccurrencesView *)self setNeedsDisplay];
    [(UIPointerInteraction *)self->_interaction invalidate];
  }
}

- (void)deselectOccurrence:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    id v4 = [(NSMutableArray *)self->_selectedOccurrences containsObject:v4];
    id v5 = v7;
    if (v4)
    {
      id v6 = [(MonthWeekOccurrencesView *)self _occurrenceViewForEventOccurrence:v7];
      [v6 setSelected:0];
      [(NSMutableArray *)self->_selectedOccurrences removeObject:v7];
      [(MonthWeekOccurrencesView *)self setNeedsDisplay];
      [(UIPointerInteraction *)self->_interaction invalidate];

      id v5 = v7;
    }
  }

  _objc_release_x1(v4, v5);
}

+ (double)maxNarrowOccurrenceHeight
{
  +[MonthViewOccurrence compactOccurrenceHeight];
  double v3 = v2;
  +[MonthViewOccurrence verticalSpaceBetweenOccurrences];
  return v4 * 3.0 + v3 * 3.0;
}

+ (double)minNarrowOccurrenceHeight
{
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:6.0];
  double v3 = v2;
  +[MonthViewOccurrence verticalSpaceBetweenOccurrences];
  return v4 * 3.0 + v3 * 3.0;
}

- (BOOL)isNarrow
{
  [(MonthWeekOccurrencesView *)self frame];
  double v3 = ceil(v2);
  +[MonthWeekOccurrencesView maxNarrowOccurrenceHeight];
  return v3 < v4;
}

- (double)_occurrenceHeight
{
  if ([(MonthWeekOccurrencesView *)self isNarrow]
    && [(MonthWeekOccurrencesView *)self isCompact])
  {
    double v3 = [(MonthWeekOccurrencesView *)self delegate];
    [v3 monthWeekScale];
    double v5 = v4;

    +[CompactMonthWeekView narrowScale];
    if (v5 <= v6)
    {
      double v12 = 6.0;
    }
    else
    {
      +[MonthWeekOccurrencesView minNarrowOccurrenceHeight];
      double v8 = v7;
      [(MonthWeekOccurrencesView *)self frame];
      double v10 = v9 - v8;
      +[MonthWeekOccurrencesView maxNarrowOccurrenceHeight];
      double v12 = 6.0 * (v10 / (v11 - v8)) + 6.0;
    }
  }
  else
  {
    [(MonthWeekOccurrencesView *)self isCompact];
    double v12 = 16.0;
  }

  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:v12];
  return result;
}

- (void)animateBlock:(id)a3
{
}

- (void)show:(BOOL)a3 occurrenceView:(id)a4 atRow:(double)a5 numRows:(double)a6 drawTimeString:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v10 = a3;
  id v12 = a4;
  uint64_t v13 = v12;
  if (v10)
  {
    if (([(MonthWeekOccurrencesView *)self drawWithViews]
       || [(MonthWeekOccurrencesView *)self animating])
      && ([v13 frame], v14 != 0.0))
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100061FA8;
      v30[3] = &unk_1001D31F0;
      v30[4] = self;
      id v31 = v13;
      double v32 = a5;
      double v33 = a6;
      BOOL v34 = v7;
      [(MonthWeekOccurrencesView *)self animateBlock:v30];
    }
    else
    {
      [(MonthWeekOccurrencesView *)self _layoutSingleOccurrence:v13 index:v7 numRows:a5 drawTimeString:a6];
      [v13 setHidden:0];
    }
  }
  else
  {
    if (([v12 hidden] & 1) == 0
      && ([v13 alpha], v15 > 0.0)
      && ([(MonthWeekOccurrencesView *)self drawWithViews]
       || [(MonthWeekOccurrencesView *)self animating]))
    {
      if (![(MonthWeekOccurrencesView *)self animating]) {
        [v13 setHidden:0];
      }
      long long v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      uint64_t v23 = sub_100062008;
      uint64_t v24 = &unk_1001D31F0;
      unint64_t v25 = self;
      id v26 = v13;
      double v27 = a5;
      double v28 = a6;
      BOOL v29 = v7;
      [(MonthWeekOccurrencesView *)self animateBlock:&v21];
    }
    else
    {
      [v13 setHidden:1];
    }
    id v16 = [v13 startRange:v21, v22, v23, v24, v25];
    long long v17 = (char *)[v13 length];
    if ((uint64_t)v16 < (uint64_t)((char *)v16 + (unint64_t)v17))
    {
      long long v18 = v17;
      long long v19 = (void **)&self->_moreEventsViews[(void)v16];
      do
      {
        long long v20 = *v19++;
        [v20 setNumberOfEvents:[v20 numberOfEvents] + 1];
        --v18;
      }
      while (v18);
    }
  }
}

- (void)_updateOccurrencesBounds
{
  [(MonthWeekOccurrencesView *)self frame];
  if (!CGRectIsEmpty(v206) && ![(MonthWeekOccurrencesView *)self layoutOccurrencesIfNeeded])
  {
    unint64_t v3 = [(MonthWeekOccurrencesView *)self dayCount];
    double v4 = +[NSMutableArray arrayWithCapacity:v3];
    p_secondOccurrencesForEachDadouble y = (id *)&self->_secondOccurrencesForEachDay;
    secondOccurrencesForEachDadouble y = self->_secondOccurrencesForEachDay;
    self->_secondOccurrencesForEachDadouble y = v4;

    BOOL v7 = +[NSMutableArray arrayWithCapacity:v3];
    v171 = self;
    p_thirdOccurrencesForEachDadouble y = &self->_thirdOccurrencesForEachDay;
    thirdOccurrencesForEachDadouble y = self->_thirdOccurrencesForEachDay;
    self->_thirdOccurrencesForEachDadouble y = v7;

    if (v3)
    {
      unint64_t v10 = v3;
      do
      {
        id v11 = *p_secondOccurrencesForEachDay;
        id v12 = +[NSNull null];
        [v11 addObject:v12];

        uint64_t v13 = *p_thirdOccurrencesForEachDay;
        double v14 = +[NSNull null];
        [(NSMutableArray *)v13 addObject:v14];

        --v10;
      }
      while (v10);
    }
    double v15 = ceil(CGRectGetHeight(v171->_dayFrames[0]));
    +[MonthWeekOccurrencesView maxNarrowOccurrenceHeight];
    if (v15 >= v16)
    {
      +[MonthViewOccurrence verticalSpaceBetweenOccurrences];
      double v19 = v18;
      [(MonthWeekOccurrencesView *)v171 _occurrenceHeight];
      unint64_t v17 = vcvtmd_u64_f64(v15 / (v19 + v20));
      if (v17 <= 3) {
        unint64_t v17 = 3;
      }
    }
    else
    {
      unint64_t v17 = 3;
    }
    long long v21 = v171;
    uint64_t v22 = 0;
    v171->_numberOfVisibleRows = v17;
    moreEventsViews = v21->_moreEventsViews;
    do
      [(_MoreEventsView *)moreEventsViews[v22++] reset];
    while (v22 != 7);
    uint64_t v24 = v171;
    if (v171->_numberOfVisibleRows)
    {
      v168 = (id *)p_thirdOccurrencesForEachDay;
      v150 = moreEventsViews;
      uint64_t v170 = 264;
      EKUICurrentWindowWidthWithViewHierarchy();
      double v26 = v25;
      EKUIWidthForWindowSizeParadigm();
      double v28 = v27;
      v149[1] = v149;
      v169 = (char *)v149 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v169, 8 * v3);
      unint64_t v155 = v3;
      if (v3)
      {
        uint64_t v29 = 0;
        do
        {
          long long v199 = 0u;
          long long v200 = 0u;
          long long v197 = 0u;
          long long v198 = 0u;
          unint64_t v30 = v24->_layedOutRows;
          id v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v197 objects:v205 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v198;
            do
            {
              for (uint64_t i = 0; i != v32; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v198 != v33) {
                  objc_enumerationMutation(v30);
                }
                if ([*(id *)(*((void *)&v197 + 1) + 8 * i) isFilledForDay:v29])++*(void *)&v169[8 * v29]; {
              }
                }
              id v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v197 objects:v205 count:16];
            }
            while (v32);
          }

          uint64_t v24 = v171;
          id v35 = [(NSMutableArray *)v171->_singleDayEventBuckets objectAtIndexedSubscript:v29];
          id v36 = [v35 count];
          *(void *)&v169[8 * v29] += v36;

          ++v29;
          unint64_t v3 = v155;
        }
        while (v29 != v155);
      }
      v167 = (unsigned __int8 *)v149 - ((20 * v3 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v167, 20 * v3);
      uint64_t v37 = 248;
      if ([(NSMutableArray *)v24->_layedOutRows count])
      {
        unint64_t v38 = 0;
        BOOL v39 = v167;
        uint64_t v161 = 248;
        do
        {
          v163 = v39;
          BOOL v40 = [*(id *)((char *)&v24->super.super.super.isa + v37) objectAtIndexedSubscript:v38];
          long long v193 = 0u;
          long long v194 = 0u;
          long long v195 = 0u;
          long long v196 = 0u;
          v162 = v40;
          v164 = [v40 occurrenceBlocks];
          v166 = (char *)[v164 countByEnumeratingWithState:&v193 objects:v204 count:16];
          if (v166)
          {
            uint64_t v165 = *(void *)v194;
            do
            {
              for (j = 0; j != v166; ++j)
              {
                id v42 = v24;
                if (*(void *)v194 != v165) {
                  objc_enumerationMutation(v164);
                }
                CFStringRef v43 = *(void **)(*((void *)&v193 + 1) + 8 * (void)j);
                uint64_t v44 = v170;
                BOOL v45 = (Class)v38 < *(Class *)((char *)&v42->super.super.super.isa + v170);
                id v46 = [v43 startRange];
                uint64_t v47 = (char *)[v43 length];
                if ((uint64_t)v46 < (uint64_t)((char *)v46 + (unint64_t)v47))
                {
                  v48 = v47;
                  uint64_t v49 = *(uint64_t *)((char *)&v42->super.super.super.isa + v44) - 1;
                  do
                  {
                    if (v45 && v38 == v49) {
                      BOOL v45 = (Class)*(void *)&v169[8 * (void)v46] <= *(Class *)((char *)&v171->super.super.super.isa
                    }
                                                                                 + v170);
                    v50 = p_secondOccurrencesForEachDay;
                    if (v38 == 1 || v38 == 2 && (v50 = v168, v45)) {
                      [*v50 setObject:v43 atIndexedSubscript:v46];
                    }
                    id v46 = (char *)v46 + 1;
                    --v48;
                  }
                  while (v48);
                }
                uint64_t v24 = v171;
                [(MonthWeekOccurrencesView *)v171 show:v45 occurrenceView:v43 atRow:v26 > v28 numRows:(double)v38 drawTimeString:1.0];
              }
              v166 = (char *)[v164 countByEnumeratingWithState:&v193 objects:v204 count:16];
            }
            while (v166);
          }

          unint64_t v3 = v155;
          uint64_t v37 = v161;
          v51 = v162;
          unint64_t v52 = v163;
          if (v155)
          {
            uint64_t v53 = 0;
            id v54 = v163;
            do
            {
              if ([v51 isFilledForDay:v53] && v38 <= 0x13) {
                *id v54 = 1;
              }
              ++v53;
              v54 += 20;
            }
            while (v3 != v53);
          }

          ++v38;
          uint64_t v24 = v171;
          BOOL v39 = v52 + 1;
        }
        while (v38 < (unint64_t)[*(id *)((char *)&v171->super.super.super.isa + v37) count]);
      }
      id v55 = objc_alloc((Class)CalPreferences);
      id v56 = v24;
      id v57 = [v55 initWithDomain:kPreferenceDomain];
      unsigned int v153 = [v57 getBooleanPreference:kCompactMonthEventUseAllSpace defaultValue:1];
      v149[0] = v57;
      uint64_t v58 = v57;
      v59 = v56;
      unsigned int v152 = [v58 getBooleanPreference:kCompactMonthEventIntegerBased defaultValue:0];
      if (v152) {
        double v60 = 2.0;
      }
      else {
        double v60 = 2.5;
      }
      if (v3)
      {
        uint64_t v165 = 0;
        uint64_t v151 = 256;
        v158 = v180;
        v61 = &objc_retain_x2_ptr;
        id v62 = v167;
        while (1)
        {
          v162 = v62;
          uint64_t v63 = v165;
          os_log_t v64 = [*(id *)((char *)&v59->super.super.super.isa + v151) objectAtIndexedSubscript:v165];
          unint64_t v65 = *(unint64_t *)((char *)&v59->super.super.super.isa + v170);
          unint64_t v66 = *(void *)&v169[8 * v63];
          BOOL v67 = v65 >= v66;
          id v68 = (unsigned char *)(v65 - v66);
          if (!v67) {
            id v68 = 0;
          }
          v160 = v68;
          uint64_t v161 = (uint64_t)v64;
          long long v189 = 0u;
          long long v190 = 0u;
          long long v191 = 0u;
          long long v192 = 0u;
          id v69 = [v64 countByEnumeratingWithState:&v189 objects:v203 count:16];
          if (v69)
          {
            id v70 = v69;
            v164 = 0;
            uint64_t v71 = *(void *)v190;
            do
            {
              for (k = 0; k != v70; k = (char *)k + 1)
              {
                if (*(void *)v190 != v71) {
                  objc_enumerationMutation((id)v161);
                }
                v73 = *(void **)(*((void *)&v189 + 1) + 8 * (void)k);
                if ([v73 isSingleDay]
                  && ([v73 isAllDay] & 1) == 0
                  && ([v73 isMultiDay] & 1) == 0)
                {
                  v74 = [v73 occurrence];
                  uint64_t v75 = [v74 isReminderIntegrationEvent] ^ 1;

                  v164 += v75;
                  v59 = v171;
                }
              }
              id v70 = [(id)v161 countByEnumeratingWithState:&v189 objects:v203 count:16];
            }
            while (v70);
          }
          else
          {
            v164 = 0;
          }
          unsigned int v76 = v153;
          if ((v153 & 1) != 0 || (v60 + -1.0) * (double)(unint64_t)v164 <= (double)(unint64_t)v160) {
            LODWORD(v163) = [(MonthWeekOccurrencesView *)v59 isCompact];
          }
          else {
            LODWORD(v163) = 0;
          }
          unint64_t v77 = v160 - v164;
          if (v160 < v164) {
            unint64_t v77 = 0;
          }
          if (v77 >= (unint64_t)v164) {
            unint64_t v78 = v77;
          }
          else {
            unint64_t v78 = 0;
          }
          unint64_t v79 = *(void *)&v169[8 * v165];
          if (!v76) {
            unint64_t v77 = v78;
          }
          unint64_t v156 = v77;
          unint64_t v80 = *(unint64_t *)((char *)&v59->super.super.super.isa + v170);
          uint64_t v81 = -2;
          if (v79 <= v80) {
            uint64_t v81 = -1;
          }
          v166 = (char *)(v81 + v80);
          if (v152)
          {
            long long v187 = 0u;
            long long v188 = 0u;
            long long v185 = 0u;
            long long v186 = 0u;
            id v157 = (id)v161;
            v164 = (char *)[v157 countByEnumeratingWithState:&v185 objects:v202 count:16];
            if (!v164) {
              goto LABEL_168;
            }
            unint64_t v82 = 0;
            uint64_t v159 = *(void *)v186;
            v154 = v166 - 1;
            while (1)
            {
              v83 = 0;
              v84 = v162;
              do
              {
                if (*(void *)v186 != v159)
                {
                  objc_enumerationMutation(v157);
                  v84 = v162;
                }
                id v85 = *(void **)(*((void *)&v185 + 1) + 8 * (void)v83);
                if (v82 <= 0x13)
                {
                  do
                  {
                    if (!v84[v82]) {
                      break;
                    }
                    ++v82;
                  }
                  while (v82 != 20);
                }
                int v86 = (int)v163;
                if (v82 > (unint64_t)v166) {
                  int v86 = 0;
                }
                BOOL v87 = v86 != 1 || v160 == 0;
                if (v87
                  || [(MonthWeekOccurrencesView *)v59 isNarrow]
                  || ![v85 isSingleDay]
                  || ([v85 isAllDay] & 1) != 0
                  || ([v85 isMultiDay] & 1) != 0)
                {
                  goto LABEL_109;
                }
                id v88 = [v85 occurrence];
                if (([v88 isReminderIntegrationEvent] & 1) != 0
                  || v82 >= (unint64_t)v166)
                {

LABEL_109:
                  unint64_t v90 = 1;
                  goto LABEL_110;
                }
                int v89 = v167[20 * v165 + 1 + v82];

                if (v89)
                {
                  unint64_t v90 = 1;
LABEL_107:
                  v59 = v171;
                  goto LABEL_110;
                }
                if (!v156)
                {
                  unint64_t v156 = 0;
                  --v160;
                  unint64_t v90 = 2;
                  goto LABEL_107;
                }
                v59 = v171;
                if (v82 >= (unint64_t)v154 || v167[20 * v165 + 2 + v82])
                {
                  --v160;
                  unint64_t v90 = 2;
                }
                else
                {
                  v160 -= 2;
                  --v156;
                  unint64_t v90 = 3;
                }
LABEL_110:
                unint64_t v91 = (unint64_t)v166;
                v92 = v85;
                [(MonthWeekOccurrencesView *)v59 show:v82 <= (unint64_t)v166 occurrenceView:v85 atRow:v26 > v28 numRows:(double)v82 drawTimeString:(double)v90];
                if (v82 - 1 < v91)
                {
                  v93 = [*p_secondOccurrencesForEachDay objectAtIndexedSubscript:v165];
                  v94 = [v61[426] null];

                  unint64_t v95 = p_secondOccurrencesForEachDay;
                  if (v93 == v94) {
                    goto LABEL_113;
                  }
                  v96 = v59;
                  v97 = v168;
                  uint64_t v98 = [*v168 objectAtIndexedSubscript:v165];
                  id v99 = +[NSNull null];

                  unint64_t v95 = v97;
                  v59 = v96;
                  v61 = &objc_retain_x2_ptr;
                  if (v98 == v99) {
LABEL_113:
                  }
                    [*v95 setObject:v92 atIndexedSubscript:v165];
                }
                v82 += v90;
                ++v83;
                v84 = v162;
              }
              while (v83 != v164);
              uint64_t v100 = (char *)[v157 countByEnumeratingWithState:&v185 objects:v202 count:16];
              v164 = v100;
              if (!v100) {
                goto LABEL_168;
              }
            }
          }
          if (v76) {
            v164 = (char *)((double)(unint64_t)v160 / 1.5);
          }
          long long v183 = 0u;
          long long v184 = 0u;
          long long v182 = 0u;
          long long v181 = 0u;
          id v157 = (id)v161;
          v160 = [v157 countByEnumeratingWithState:&v181 objects:v201 count:16];
          if (v160) {
            break;
          }
LABEL_168:
          id v130 = (id)v161;

          id v62 = v162 + 20;
          if (++v165 == v155) {
            goto LABEL_169;
          }
        }
        uint64_t v159 = *(void *)v182;
        double v101 = 0.0;
LABEL_128:
        uint64_t v102 = 0;
        while (1)
        {
          if (*(void *)v182 != v159) {
            objc_enumerationMutation(v157);
          }
          v103 = *(void **)(*((void *)&v181 + 1) + 8 * v102);
          unint64_t v104 = vcvtpd_u64_f64(v101);
          if (v164) {
            int v105 = (int)v163;
          }
          else {
            int v105 = 0;
          }
          uint64_t v106 = *(void *)(*((void *)&v181 + 1) + 8 * v102);
          if (v105 != 1
            || [(MonthWeekOccurrencesView *)v59 isNarrow]
            || ![v103 isSingleDay]
            || ([v103 isAllDay] & 1) != 0
            || ([v103 isMultiDay] & 1) != 0)
          {
            int v107 = 0;
            unint64_t v108 = v104;
          }
          else
          {
            id v126 = [v103 occurrence];
            unsigned int v127 = [v126 isReminderIntegrationEvent];
            int v107 = v127 ^ 1;

            unint64_t v128 = vcvtpd_u64_f64(v60 + v101);
            if (v127) {
              unint64_t v108 = v104;
            }
            else {
              unint64_t v108 = v128;
            }
          }
          unint64_t v109 = vcvtmd_u64_f64(v101);
          v179[0] = _NSConcreteStackBlock;
          v179[1] = 3221225472;
          v180[0] = sub_100063040;
          v180[1] = &unk_1001D3210;
          v180[2] = v165;
          long long v110 = objc_retainBlock(v179);
          if (v108 > 0x13)
          {
            double v112 = v101;
          }
          else
          {
            unint64_t v111 = v109;
            double v112 = v101;
            do
            {
              if (!((unsigned int (*)(void *, unint64_t, unint64_t, unsigned __int8 *))v110[2])(v110, v111, v108, v167))break; {
              double v112 = v112 + 1.0;
              }
              unint64_t v111 = vcvtmd_u64_f64(v112);
              double v113 = ceil(v60 + v112);
              double v114 = ceil(v112);
              if (!v107) {
                double v113 = v114;
              }
              unint64_t v108 = (unint64_t)v113;
            }
            while ((unint64_t)v113 < 0x14);
          }
          BOOL v115 = v108 > (unint64_t)v166;
          BOOL v116 = v108 <= (unint64_t)v166;
          if (v107)
          {
            v59 = v171;
            if (!v115)
            {
              --v164;
              uint64_t v117 = v106;
              [(MonthWeekOccurrencesView *)v171 show:1 occurrenceView:v106 atRow:v26 > v28 numRows:v112 drawTimeString:v60];
              double v118 = v60;
              if (v112 > 0.0) {
                goto LABEL_159;
              }
              goto LABEL_162;
            }
            uint64_t v117 = v106;
            if (v104 <= 0x13)
            {
              do
              {
                if (!((unsigned int (*)(void *, unint64_t, unint64_t, unsigned __int8 *))v110[2])(v110, v109, v104, v167))break; {
                double v101 = v101 + 1.0;
                }
                unint64_t v109 = vcvtmd_u64_f64(v101);
                unint64_t v104 = vcvtpd_u64_f64(v101);
              }
              while (v104 < 0x14);
            }
            BOOL v116 = v104 <= (unint64_t)v166;
            double v112 = v101;
            v59 = v171;
          }
          else
          {
            v59 = v171;
            uint64_t v117 = v106;
          }
          double v118 = 1.0;
          [(MonthWeekOccurrencesView *)v59 show:v116 occurrenceView:v117 atRow:v26 > v28 numRows:v112 drawTimeString:1.0];
          if (v112 > 0.0 && v116)
          {
LABEL_159:
            long long v119 = [*p_secondOccurrencesForEachDay objectAtIndexedSubscript:v165];
            v120 = +[NSNull null];

            v121 = p_secondOccurrencesForEachDay;
            if (v119 == v120) {
              goto LABEL_161;
            }
            v122 = v59;
            __int16 v123 = v168;
            v124 = [*v168 objectAtIndexedSubscript:v165];
            __int16 v125 = +[NSNull null];

            v121 = v123;
            v59 = v122;
            uint64_t v117 = v106;
            if (v124 == v125) {
LABEL_161:
            }
              [*v121 setObject:v117 atIndexedSubscript:v165];
          }
LABEL_162:
          double v101 = v118 + v112;

          if ((unsigned char *)++v102 == v160)
          {
            v129 = [v157 countByEnumeratingWithState:&v181 objects:v201 count:16];
            v61 = &objc_retain_x2_ptr;
            v160 = v129;
            if (!v129) {
              goto LABEL_168;
            }
            goto LABEL_128;
          }
        }
      }
LABEL_169:
      v131 = v59;
      char IsLeftToRight = CalInterfaceIsLeftToRight();
      v133 = v150;
      if (IsLeftToRight) {
        CalRoundToScreenScale();
      }
      unsigned int v134 = [(MonthWeekOccurrencesView *)v131 isNarrow];
      uint64_t v135 = v170;
      if (v134)
      {
        double v136 = 6.0;
      }
      else
      {
        [(MonthWeekOccurrencesView *)v131 isCompact];
        double v136 = 16.0;
      }
      +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:v136];
      uint64_t v137 = 0;
      double v139 = v138 + 1.0;
      do
      {
        v140 = v133[v137];
        [(MonthWeekOccurrencesView *)v131 _frameForStartColumn:v137 endColumn:v137 dayRow:0 occurrenceRow:(double)(*(unint64_t *)((char *)&v131->super.super.super.isa + v135) - 1) numRows:1.0];
        double v142 = v141;
        double v144 = v143;
        double v146 = v145;
        if ([(_MoreEventsView *)v133[v137] numberOfEvents] <= 0) {
          double v147 = 0.0;
        }
        else {
          double v147 = 1.0;
        }
        if ([(MonthWeekOccurrencesView *)v131 drawWithViews]
          && ([(_MoreEventsView *)v140 frame], v148 > 0.0))
        {
          v172[0] = _NSConcreteStackBlock;
          v172[1] = 3221225472;
          v172[2] = sub_10006309C;
          v172[3] = &unk_1001D2DA0;
          v173 = v140;
          double v174 = v147;
          double v175 = v142;
          double v176 = v144;
          double v177 = v146;
          double v178 = v139;
          [(MonthWeekOccurrencesView *)v131 animateBlock:v172];
        }
        else
        {
          -[_MoreEventsView setFrame:](v140, "setFrame:", v142, v144, v146, v139);
          [(_MoreEventsView *)v140 setAlpha:v147];
          [(_MoreEventsView *)v140 update];
        }

        ++v137;
      }
      while (v137 != 7);
    }
  }
}

- (void)setNeedsDisplay
{
  id v2 = [(MonthWeekOccurrencesView *)self layer];
  [v2 setNeedsDisplay];
}

- (BOOL)hasDrawnBefore
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL hasDrawnBefore = v2->_hasDrawnBefore;
  objc_sync_exit(v2);

  return hasDrawnBefore;
}

- (void)setHasDrawnBefore:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (obj->_hasDrawnBefore != v3 && !v3)
  {
    double v4 = [(MonthWeekOccurrencesView *)obj layer];
    [v4 setContents:0];
  }
  obj->_BOOL hasDrawnBefore = v3;
  objc_sync_exit(obj);
}

- (void)renderLayer
{
  BOOL v3 = [(MonthWeekOccurrencesView *)self traitCollection];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000632A0;
  v4[3] = &unk_1001D2740;
  v4[4] = self;
  [v3 performAsCurrentTraitCollection:v4];
}

- (void)displayLayer:(id)a3
{
  double v4 = [(MonthWeekOccurrencesView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0
    && ([(MonthWeekOccurrencesView *)self delegate],
        double v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isBackgroundScene],
        v6,
        v7))
  {
    [(MonthWeekOccurrencesView *)self renderLayer];
    double v8 = [(MonthWeekOccurrencesView *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      return;
    }
    id v10 = [(MonthWeekOccurrencesView *)self delegate];
    [v10 didCompleteMonthWeekViewBackgroundRendering];
  }
  else
  {
    if ([(MonthWeekOccurrencesView *)self drawWithViews]
      || [(MonthWeekOccurrencesView *)self animating])
    {
      return;
    }
    id v10 = +[_BackgroundViewRenderManager sharedManager];
    [v10 addViewToQueue:self];
  }
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = +[_BackgroundViewRenderManager sharedManager];
  [v4 removeViewFromQueue:self];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  [v5 locationInView:self];
  double v6 = -[MonthWeekOccurrencesView occurrenceAtPoint:](self, "occurrenceAtPoint:");
  if (v6 && [v5 menuAppearance] != (id)1)
  {
    double v8 = [(MonthWeekOccurrencesView *)self delegate];
    [v8 monthWeekOccurrencesView:self selectedEvent:v6 userInitiated:0];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000636A0;
    v10[3] = &unk_1001D2880;
    v10[4] = self;
    unsigned int v7 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v10];
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

- (EKCalendarDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (EKCalendarDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (unint64_t)dayCount
{
  return self->_dayCount;
}

- (void)setDayCount:(unint64_t)a3
{
  self->_unint64_t dayCount = a3;
}

- (BOOL)isBackgroundScene
{
  return self->_isBackgroundScene;
}

- (void)setIsBackgroundScene:(BOOL)a3
{
  self->_isBackgroundScene = a3;
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (void)setIsCompact:(BOOL)a3
{
  self->_isCompact = a3;
}

- (UIView)occurrenceContainer
{
  return self->_occurrenceContainer;
}

- (void)setOccurrenceContainer:(id)a3
{
}

- (MonthWeekViewOccurrencesViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MonthWeekViewOccurrencesViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_occurrenceContainer, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_viewsLoadedCompletionBlock, 0);
  objc_storeStrong((id *)&self->_badgeLocales, 0);
  objc_storeStrong((id *)&self->_badgeColors, 0);
  objc_storeStrong((id *)&self->_dayTypes, 0);
  objc_storeStrong((id *)&self->_selectedOccurrences, 0);
  objc_storeStrong((id *)&self->_thirdOccurrencesForEachDay, 0);
  objc_storeStrong((id *)&self->_secondOccurrencesForEachDay, 0);
  objc_storeStrong((id *)&self->_allMonthViews, 0);
  objc_storeStrong((id *)&self->_allOccurrences, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  for (uint64_t i = 6; i != -1; --i)
    objc_storeStrong((id *)&self->_moreEventsViews[i], 0);
  objc_storeStrong((id *)&self->_singleDayEventBuckets, 0);

  objc_storeStrong((id *)&self->_layedOutRows, 0);
}

- (void)setupEntityProvider
{
  swift_unknownObjectWeakInit();
  sub_100142F1C();
  BOOL v3 = self;
  UIView.setEntityProvider<A>(_:)();
  sub_10013CA44((uint64_t)v4);
}

@end