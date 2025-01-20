@interface MonthDayNavigationTransitionView
- (BOOL)debug;
- (BOOL)verticallyCompressedState;
- (CGRect)dayFrame;
- (CGRect)monthFrame;
- (CGRect)monthOccurrencesFrame;
- (CGSize)dayCellSize;
- (MonthDayNavigationTransitionView)initWithFrame:(CGRect)a3;
- (NSArray)monthCellFrames;
- (NSArray)monthSummaryFrames;
- (NSArray)monthSummarySnapshots;
- (NSArray)weekendIndices;
- (UIView)monthOccurrencesSnapshot;
- (double)_yOffsetForMonthCells:(BOOL)a3;
- (double)firstDayCellInset;
- (double)monthRowHeight;
- (id)_selectedCell;
- (id)_todayCell;
- (int64_t)firstDayCellIndex;
- (int64_t)firstMonthCellIndex;
- (int64_t)monthBreakIndex;
- (int64_t)selectedIndex;
- (int64_t)todayIndex;
- (void)_animateView:(id)a3 toPosition:(CGPoint)a4;
- (void)_setToDayStateAnimated:(BOOL)a3;
- (void)_setToMonthStateAnimated:(BOOL)a3;
- (void)_updateWeekendIndices;
- (void)animateToDayLayout;
- (void)animateToMonthLayout;
- (void)completeSetup;
- (void)setDayCellSize:(CGSize)a3;
- (void)setDayFrame:(CGRect)a3;
- (void)setDayTypes:(id)a3 badgeColors:(id)a4 badgeLocales:(id)a5;
- (void)setDebug:(BOOL)a3;
- (void)setFirstDayCellIndex:(int64_t)a3;
- (void)setFirstDayCellInset:(double)a3;
- (void)setFirstMonthCellIndex:(int64_t)a3;
- (void)setMonthBreakIndex:(int64_t)a3;
- (void)setMonthCellFrames:(id)a3;
- (void)setMonthFrame:(CGRect)a3;
- (void)setMonthOccurrencesFrame:(CGRect)a3;
- (void)setMonthOccurrencesSnapshot:(id)a3;
- (void)setMonthRowHeight:(double)a3;
- (void)setMonthSummaryFrames:(id)a3;
- (void)setMonthSummarySnapshots:(id)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)setStrings:(id)a3 overlayStrings:(id)a4 weekNumberString:(id)a5 todayInWeek:(BOOL)a6;
- (void)setTodayIndex:(int64_t)a3;
- (void)setUnderlineThickness:(double)a3 forOverlayStringAtIndex:(int64_t)a4;
- (void)setVerticallyCompressedState:(BOOL)a3;
- (void)setWeekendIndices:(id)a3;
@end

@implementation MonthDayNavigationTransitionView

- (MonthDayNavigationTransitionView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MonthDayNavigationTransitionView;
  v3 = -[MonthDayNavigationTransitionView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MonthDayNavigationTransitionView *)v3 setSelectedIndex:-1];
    [(MonthDayNavigationTransitionView *)v4 setTodayIndex:-1];
    [(MonthDayNavigationTransitionView *)v4 setMonthBreakIndex:-1];
    v5 = objc_alloc_init(TopLineView);
    topLine = v4->_topLine;
    v4->_topLine = v5;

    [(MonthDayNavigationTransitionView *)v4 addSubview:v4->_topLine];
    v7 = +[UIColor clearColor];
    [(MonthDayNavigationTransitionView *)v4 setBackgroundColor:v7];
  }
  return v4;
}

- (void)setStrings:(id)a3 overlayStrings:(id)a4 weekNumberString:(id)a5 todayInWeek:(BOOL)a6
{
  BOOL v35 = a6;
  id v36 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 count];
  self->_hasOverlay = v11 == [v36 count];
  v12 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:7];
  cells = self->_cells;
  self->_cells = v12;

  if ([v36 count])
  {
    unint64_t v14 = 0;
    do
    {
      [(MonthDayNavigationTransitionView *)self dayCellSize];
      double v16 = v15;
      double v18 = v17;
      [(MonthDayNavigationTransitionView *)self dayCellSize];
      v20 = -[CompactDayNavigationViewCell initWithFrame:loadMonthAnimationState:hasOverlay:sizeClass:]([CompactDayNavigationViewCell alloc], "initWithFrame:loadMonthAnimationState:hasOverlay:sizeClass:", 1, self->_hasOverlay, 1, v19 * (double)v14, 0.0, v16, v18);
      [(CompactDayNavigationViewCell *)v20 setMatchesMonthView:1];
      v21 = +[UIColor clearColor];
      [(CompactDayNavigationViewCell *)v20 setBackgroundColor:v21];

      [(MonthDayNavigationTransitionView *)self addSubview:v20];
      [(NSMutableArray *)self->_cells addObject:v20];
      v22 = [v36 objectAtIndex:v14];
      [(CompactDayNavigationViewCell *)v20 setDisplayedString:v22];

      if (self->_hasOverlay)
      {
        v23 = [v9 objectAtIndex:v14];
        [(CompactDayNavigationViewCell *)v20 setOverlayString:v23];
      }
      ++v14;
    }
    while (v14 < (unint64_t)[v36 count]);
  }
  self->_showWeekNumber = v10 != 0;
  if (v10)
  {
    v24 = (UILabel *)objc_opt_new();
    weekNumberLabel = self->_weekNumberLabel;
    self->_weekNumberLabel = v24;

    v26 = +[CompactMonthWeekView weekNumberFont];
    [(UILabel *)self->_weekNumberLabel setFont:v26];

    [(UILabel *)self->_weekNumberLabel setText:v10];
    v27 = +[CompactMonthWeekView weekNumberColorForThisWeek:v35];
    [(UILabel *)self->_weekNumberLabel setTextColor:v27];

    [(MonthDayNavigationTransitionView *)self addSubview:self->_weekNumberLabel];
  }
  [(MonthDayNavigationTransitionView *)self frame];
  double v29 = v28;
  double v31 = v30;
  [(MonthDayNavigationTransitionView *)self dayFrame];
  double Width = CGRectGetWidth(v38);
  [(MonthDayNavigationTransitionView *)self monthFrame];
  double v33 = CGRectGetWidth(v39);
  if (Width < v33) {
    double Width = v33;
  }
  [(MonthDayNavigationTransitionView *)self dayCellSize];
  -[MonthDayNavigationTransitionView setFrame:](self, "setFrame:", v29, v31, Width, v34);
}

- (void)setUnderlineThickness:(double)a3 forOverlayStringAtIndex:(int64_t)a4
{
  if ((a4 & 0x8000000000000000) == 0 && (uint64_t)[(NSMutableArray *)self->_cells count] > a4)
  {
    id v7 = [(NSMutableArray *)self->_cells objectAtIndexedSubscript:a4];
    [v7 setUnderlineThickness:a3];
  }
}

- (void)setDayTypes:(id)a3 badgeColors:(id)a4 badgeLocales:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v19 count];
  if (v10 == [(NSMutableArray *)self->_cells count])
  {
    id v11 = [v8 count];
    if (v11 == [(NSMutableArray *)self->_cells count])
    {
      id v12 = [v9 count];
      if (v12 == [(NSMutableArray *)self->_cells count]
        && (uint64_t)[(NSMutableArray *)self->_cells count] >= 1)
      {
        uint64_t v13 = 0;
        do
        {
          unint64_t v14 = [v19 objectAtIndexedSubscript:v13];
          id v15 = [v14 integerValue];

          double v16 = [(NSMutableArray *)self->_cells objectAtIndexedSubscript:v13];
          [v16 setBadgeType:v15];
          double v17 = [v8 objectAtIndexedSubscript:v13];
          [v16 setBadgeColor:v17];

          double v18 = [v9 objectAtIndexedSubscript:v13];
          [v16 setBadgeLocale:v18];

          ++v13;
        }
        while (v13 < (uint64_t)[(NSMutableArray *)self->_cells count]);
      }
    }
  }
}

- (void)setVerticallyCompressedState:(BOOL)a3
{
  BOOL v3 = a3;
  self->_verticallyCompressedState = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_cells;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setVerticallyCompressedState:v3 (void)v9];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)completeSetup
{
  [(MonthDayNavigationTransitionView *)self _updateWeekendIndices];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  BOOL v3 = self->_cells;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) layoutIfNeeded:v8];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setWeekendIndices:(id)a3
{
}

- (void)_updateWeekendIndices
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v3 = self->_cells;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v7) setIsWeekend:0];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  long long v8 = [(MonthDayNavigationTransitionView *)self weekendIndices];

  if (v8)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v9 = [(MonthDayNavigationTransitionView *)self weekendIndices];
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = (uint64_t)[*(id *)(*((void *)&v17 + 1) + 8 * (void)v13) integerValue];
          if ((v14 & 0x8000000000000000) == 0)
          {
            uint64_t v15 = v14;
            if (v14 < (uint64_t)[(NSMutableArray *)self->_cells count])
            {
              double v16 = [(NSMutableArray *)self->_cells objectAtIndex:v15];
              [v16 setIsWeekend:1];
            }
          }
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v11);
    }
  }
}

- (void)animateToDayLayout
{
  [(MonthDayNavigationTransitionView *)self _setToMonthStateAnimated:0];

  [(MonthDayNavigationTransitionView *)self _setToDayStateAnimated:1];
}

- (void)animateToMonthLayout
{
  [(MonthDayNavigationTransitionView *)self _setToDayStateAnimated:0];

  [(MonthDayNavigationTransitionView *)self _setToMonthStateAnimated:1];
}

- (void)_setToDayStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MonthDayNavigationTransitionView *)self monthOccurrencesSnapshot];

  if (v5)
  {
    uint64_t v6 = [(MonthDayNavigationTransitionView *)self monthOccurrencesSnapshot];
    uint64_t v7 = [v6 superview];

    if (!v7)
    {
      long long v8 = [(MonthDayNavigationTransitionView *)self monthOccurrencesSnapshot];
      [(MonthDayNavigationTransitionView *)self addSubview:v8];
    }
    long long v9 = [(MonthDayNavigationTransitionView *)self monthOccurrencesSnapshot];
    [(MonthDayNavigationTransitionView *)self bringSubviewToFront:v9];
  }
  id v10 = [(MonthDayNavigationTransitionView *)self monthSummarySnapshots];
  if (![v10 count]) {
    goto LABEL_16;
  }
  id v11 = [(MonthDayNavigationTransitionView *)self monthSummarySnapshots];
  id v12 = [v11 count];
  uint64_t v13 = [(MonthDayNavigationTransitionView *)self monthSummaryFrames];
  id v14 = [v13 count];

  if (v12 == v14)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v10 = [(MonthDayNavigationTransitionView *)self monthSummarySnapshots];
    id v15 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v39;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v10);
          }
          long long v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          long long v20 = [v19 superview];

          if (!v20) {
            [(MonthDayNavigationTransitionView *)self addSubview:v19];
          }
          [(MonthDayNavigationTransitionView *)self bringSubviewToFront:v19];
        }
        id v16 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v16);
    }
LABEL_16:
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000EDA00;
  v37[3] = &unk_1001D2740;
  v37[4] = self;
  long long v21 = objc_retainBlock(v37);
  long long v22 = [(MonthDayNavigationTransitionView *)self _todayCell];
  [v22 setIsToday:1];

  animateNavigationPreferringFRR();
  if (self->_selectedIndex != self->_todayIndex)
  {
    animateNavigationPreferringFRR();
    if (!v3)
    {
      long long v23 = [(MonthDayNavigationTransitionView *)self _selectedCell];
      [v23 layoutIfNeeded];

      long long v24 = [(MonthDayNavigationTransitionView *)self _todayCell];
      [v24 layoutIfNeeded];
    }
  }
  if (v3)
  {
    springAnimationDuration();
    double v26 = v25;
    v27 = +[SpringFactory sharedFactory];
    double v28 = navigationAnimationsPreferringFRR();
    +[UIView _animateWithDuration:393216 delay:v27 options:v28 factory:0 animations:v26 completion:0.0];

    [(MonthDayNavigationTransitionView *)self dayFrame];
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    springAnimationDuration();
    double v34 = v33;
    BOOL v35 = +[SpringFactory sharedFactory];
    id v36 = navigationAnimationsPreferringFRR();
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v35, v36, 0, v34, 0.0, _NSConcreteStackBlock, 3221225472, sub_1000EE010, &unk_1001D29C8, self, 0, 0, v30, v32);

    [(MonthDayNavigationTransitionView *)self dayFrame];
    -[MonthDayNavigationTransitionView _animateView:toPosition:](self, "_animateView:toPosition:", self);
  }
  else
  {
    ((void (*)(void *))v21[2])(v21);
    [(MonthDayNavigationTransitionView *)self dayFrame];
    -[MonthDayNavigationTransitionView setFrame:](self, "setFrame:");
  }
}

- (double)_yOffsetForMonthCells:(BOOL)a3
{
  CalFloorToScreenScale();
  return result;
}

- (void)_setToMonthStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MonthDayNavigationTransitionView *)self monthOccurrencesSnapshot];

  if (v5)
  {
    uint64_t v6 = [(MonthDayNavigationTransitionView *)self monthOccurrencesSnapshot];
    uint64_t v7 = [v6 superview];

    if (!v7)
    {
      long long v8 = [(MonthDayNavigationTransitionView *)self monthOccurrencesSnapshot];
      [(MonthDayNavigationTransitionView *)self addSubview:v8];
    }
    long long v9 = [(MonthDayNavigationTransitionView *)self monthOccurrencesSnapshot];
    [(MonthDayNavigationTransitionView *)self bringSubviewToFront:v9];
  }
  id v10 = [(MonthDayNavigationTransitionView *)self monthSummarySnapshots];
  if ([v10 count])
  {
    id v11 = [(MonthDayNavigationTransitionView *)self monthSummarySnapshots];
    id v12 = [v11 count];
    uint64_t v13 = [(MonthDayNavigationTransitionView *)self monthSummaryFrames];
    id v14 = [v13 count];

    if (v12 != v14) {
      goto LABEL_17;
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v10 = [(MonthDayNavigationTransitionView *)self monthSummarySnapshots];
    id v15 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v43;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v43 != v17) {
            objc_enumerationMutation(v10);
          }
          long long v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          long long v20 = [v19 superview];

          if (!v20) {
            [(MonthDayNavigationTransitionView *)self addSubview:v19];
          }
          [(MonthDayNavigationTransitionView *)self bringSubviewToFront:v19];
        }
        id v16 = [v10 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v16);
    }
  }

LABEL_17:
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000EE61C;
  v41[3] = &unk_1001D2740;
  v41[4] = self;
  long long v21 = objc_retainBlock(v41);
  unsigned int v22 = [(MonthDayNavigationTransitionView *)self verticallyCompressedState];
  long long v23 = [(MonthDayNavigationTransitionView *)self _todayCell];
  [v23 setIsToday:1];

  if (v22)
  {
    animateNavigationPreferringFRR();
    if (self->_selectedIndex == self->_todayIndex) {
      goto LABEL_25;
    }
    animateNavigationPreferringFRR();
    if (v3) {
      goto LABEL_25;
    }
    long long v24 = [(MonthDayNavigationTransitionView *)self _selectedCell];
    [v24 layoutIfNeeded];

    double v25 = [(MonthDayNavigationTransitionView *)self _todayCell];
    [v25 layoutIfNeeded];
  }
  else
  {
    navigationAnimationsPreferringFRR();
    double v25 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v25[2]();
    if (self->_todayIndex != self->_selectedIndex)
    {
      navigationAnimationsPreferringFRR();
      double v26 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v26[2]();
    }
    v27 = [(MonthDayNavigationTransitionView *)self _todayCell];
    [v27 layoutBelowIfNeeded];
  }
LABEL_25:
  if (v3)
  {
    springAnimationDuration();
    double v29 = v28;
    uint64_t v30 = +[SpringFactory sharedFactory];
    uint64_t v31 = navigationAnimationsPreferringFRR();
    +[UIView _animateWithDuration:393216 delay:v30 options:v31 factory:0 animations:v29 completion:0.0];

    [(MonthDayNavigationTransitionView *)self monthFrame];
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    springAnimationDuration();
    double v37 = v36;
    long long v38 = +[SpringFactory sharedFactory];
    CGPoint origin = CGRectZero.origin;
    long long v39 = navigationAnimationsPreferringFRR();
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v38, v39, 0, v37, 0.0, _NSConcreteStackBlock, 3221225472, sub_1000EF06C, &unk_1001D29C8, self, origin, v33, v35);

    [(MonthDayNavigationTransitionView *)self monthFrame];
    -[MonthDayNavigationTransitionView _animateView:toPosition:](self, "_animateView:toPosition:", self);
  }
  else
  {
    ((void (*)(void *))v21[2])(v21);
    [(MonthDayNavigationTransitionView *)self monthFrame];
    -[MonthDayNavigationTransitionView setFrame:](self, "setFrame:");
  }
}

- (id)_selectedCell
{
  if ([(MonthDayNavigationTransitionView *)self selectedIndex] < 0
    || (uint64_t v3 = [(MonthDayNavigationTransitionView *)self selectedIndex],
        v3 >= (uint64_t)[(NSMutableArray *)self->_cells count]))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(NSMutableArray *)self->_cells objectAtIndex:[(MonthDayNavigationTransitionView *)self selectedIndex]];
  }

  return v4;
}

- (id)_todayCell
{
  if ([(MonthDayNavigationTransitionView *)self todayIndex] < 0
    || (uint64_t v3 = [(MonthDayNavigationTransitionView *)self todayIndex],
        v3 >= (uint64_t)[(NSMutableArray *)self->_cells count]))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(NSMutableArray *)self->_cells objectAtIndex:[(MonthDayNavigationTransitionView *)self todayIndex]];
  }

  return v4;
}

- (void)_animateView:(id)a3 toPosition:(CGPoint)a4
{
  id v4 = a3;
  springAnimationDuration();
  double v6 = v5;
  uint64_t v7 = +[SpringFactory sharedFactory];
  id v10 = v4;
  id v8 = v4;
  long long v9 = navigationAnimationsPreferringFRR();
  +[UIView _animateWithDuration:393216 delay:v7 options:v9 factory:0 animations:v6 completion:0.0];
}

- (BOOL)verticallyCompressedState
{
  return self->_verticallyCompressedState;
}

- (NSArray)weekendIndices
{
  return self->_weekendIndices;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (int64_t)todayIndex
{
  return self->_todayIndex;
}

- (void)setTodayIndex:(int64_t)a3
{
  self->_todayIndex = a3;
}

- (CGRect)dayFrame
{
  double x = self->_dayFrame.origin.x;
  double y = self->_dayFrame.origin.y;
  double width = self->_dayFrame.size.width;
  double height = self->_dayFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDayFrame:(CGRect)a3
{
  self->_dayFrame = a3;
}

- (double)firstDayCellInset
{
  return self->_firstDayCellInset;
}

- (void)setFirstDayCellInset:(double)a3
{
  self->_firstDayCellInset = a3;
}

- (int64_t)firstDayCellIndex
{
  return self->_firstDayCellIndex;
}

- (void)setFirstDayCellIndex:(int64_t)a3
{
  self->_firstDayCellIndedouble x = a3;
}

- (CGSize)dayCellSize
{
  double width = self->_dayCellSize.width;
  double height = self->_dayCellSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDayCellSize:(CGSize)a3
{
  self->_dayCellSize = a3;
}

- (CGRect)monthFrame
{
  double x = self->_monthFrame.origin.x;
  double y = self->_monthFrame.origin.y;
  double width = self->_monthFrame.size.width;
  double height = self->_monthFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMonthFrame:(CGRect)a3
{
  self->_monthFrame = a3;
}

- (double)monthRowHeight
{
  return self->_monthRowHeight;
}

- (void)setMonthRowHeight:(double)a3
{
  self->_monthRowHeight = a3;
}

- (int64_t)firstMonthCellIndex
{
  return self->_firstMonthCellIndex;
}

- (void)setFirstMonthCellIndex:(int64_t)a3
{
  self->_firstMonthCellIndedouble x = a3;
}

- (NSArray)monthCellFrames
{
  return self->_monthCellFrames;
}

- (void)setMonthCellFrames:(id)a3
{
}

- (int64_t)monthBreakIndex
{
  return self->_monthBreakIndex;
}

- (void)setMonthBreakIndex:(int64_t)a3
{
  self->_monthBreakIndedouble x = a3;
}

- (UIView)monthOccurrencesSnapshot
{
  return self->_monthOccurrencesSnapshot;
}

- (void)setMonthOccurrencesSnapshot:(id)a3
{
}

- (CGRect)monthOccurrencesFrame
{
  double x = self->_monthOccurrencesFrame.origin.x;
  double y = self->_monthOccurrencesFrame.origin.y;
  double width = self->_monthOccurrencesFrame.size.width;
  double height = self->_monthOccurrencesFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMonthOccurrencesFrame:(CGRect)a3
{
  self->_monthOccurrencesFrame = a3;
}

- (NSArray)monthSummarySnapshots
{
  return self->_monthSummarySnapshots;
}

- (void)setMonthSummarySnapshots:(id)a3
{
}

- (NSArray)monthSummaryFrames
{
  return self->_monthSummaryFrames;
}

- (void)setMonthSummaryFrames:(id)a3
{
}

- (BOOL)debug
{
  return self->_debug;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthSummaryFrames, 0);
  objc_storeStrong((id *)&self->_monthSummarySnapshots, 0);
  objc_storeStrong((id *)&self->_monthOccurrencesSnapshot, 0);
  objc_storeStrong((id *)&self->_monthCellFrames, 0);
  objc_storeStrong((id *)&self->_weekendIndices, 0);
  objc_storeStrong((id *)&self->_weekNumberLabel, 0);
  objc_storeStrong((id *)&self->_topLine, 0);

  objc_storeStrong((id *)&self->_cells, 0);
}

@end