@interface PaletteWeekdayHeaderView
- (BOOL)_shouldUseVeryShortWeekdays;
- (BOOL)isExpanded;
- (PaletteWeekdayHeaderView)initWithFrame:(CGRect)a3;
- (void)adjustWeekLabelsByOffset:(int64_t)a3;
- (void)highlightWeekdayLabelForDateAndSetDay:(id)a3;
- (void)layoutSubviews;
- (void)setIsExpanded:(BOOL)a3;
@end

@implementation PaletteWeekdayHeaderView

- (PaletteWeekdayHeaderView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)PaletteWeekdayHeaderView;
  v3 = -[PaletteWeekdayHeaderView initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[NSMutableArray array];
    weekdayLabels = v3->_weekdayLabels;
    v3->_weekdayLabels = (NSMutableArray *)v4;

    v6 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 24.0];
    weekdayView = v3->_weekdayView;
    v3->_weekdayView = v6;

    uint64_t v8 = +[UIFont systemFontOfSize:11.0 weight:UIFontWeightSemibold];
    weekdaysFont = v3->_weekdaysFont;
    v3->_weekdaysFont = (UIFont *)v8;

    unint64_t v10 = HKDaysInAWeek;
    if (HKDaysInAWeek)
    {
      uint64_t v11 = HKDaysInAWeek;
      do
      {
        v12 = objc_alloc_init(WeekPaletteTappableDay);
        v13 = v3->_weekdaysFont;
        v14 = +[UIColor secondaryLabelColor];
        [(WeekPaletteTappableDay *)v12 setFont:v13 textColor:v14];

        [(NSMutableArray *)v3->_weekdayLabels addObject:v12];
        [(UIView *)v3->_weekdayView addSubview:v12];

        --v11;
      }
      while (v11);
    }
    [(PaletteWeekdayHeaderView *)v3 addSubview:v3->_weekdayView];
    id v15 = objc_alloc_init((Class)NSDateFormatter);
    if ([(PaletteWeekdayHeaderView *)v3 _shouldUseVeryShortWeekdays]) {
      [v15 veryShortWeekdaySymbols];
    }
    else {
    v16 = [v15 shortWeekdaySymbols];
    }
    uint64_t v17 = HKFirstDayOfWeekForWeeklyGoalCalculations();
    if (v10)
    {
      uint64_t v18 = v17;
      for (uint64_t i = 0; i != v10; ++i)
      {
        v20 = [(NSMutableArray *)v3->_weekdayLabels objectAtIndexedSubscript:i];
        [v20 setIndex:(v18 + i) % v10];
        v21 = [v16 objectAtIndexedSubscript:(v18 + i - 1) % v10];
        v22 = [v20 weekDayLabel];
        [v22 setText:v21];
      }
    }
    v23 = +[NSDate date];
    [(PaletteWeekdayHeaderView *)v3 highlightWeekdayLabelForDateAndSetDay:v23];
  }
  return v3;
}

- (void)adjustWeekLabelsByOffset:(int64_t)a3
{
  for (uint64_t i = self->_weekdayLabels; ; uint64_t i = self->_weekdayLabels)
  {
    v6 = [(NSMutableArray *)i firstObject];
    id v7 = [v6 index];

    if (v7 == (id)2) {
      break;
    }
    weekdayLabels = self->_weekdayLabels;
    v9 = [(NSMutableArray *)weekdayLabels lastObject];
    [(NSMutableArray *)weekdayLabels insertObject:v9 atIndex:0];

    [(NSMutableArray *)self->_weekdayLabels removeLastObject];
  }
  if (a3 >= 1)
  {
    do
    {
      unint64_t v10 = self->_weekdayLabels;
      uint64_t v11 = [(NSMutableArray *)v10 lastObject];
      [(NSMutableArray *)v10 insertObject:v11 atIndex:0];

      [(NSMutableArray *)self->_weekdayLabels removeLastObject];
      --a3;
    }
    while (a3);
  }

  [(PaletteWeekdayHeaderView *)self setNeedsLayout];
}

- (BOOL)_shouldUseVeryShortWeekdays
{
  v2 = +[NSLocale currentLocale];
  v3 = [v2 languageCode];
  char v4 = [v3 isEqualToString:@"ar"] ^ 1;

  return v4;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PaletteWeekdayHeaderView;
  [(PaletteWeekdayHeaderView *)&v7 layoutSubviews];
  uint64_t v3 = HKDaysInAWeek;
  if (HKDaysInAWeek)
  {
    uint64_t v4 = 0;
    do
    {
      v5 = [(NSMutableArray *)self->_weekdayLabels objectAtIndexedSubscript:v4];
      if ([(PaletteWeekdayHeaderView *)self _shouldUseVeryShortWeekdays]) {
        double v6 = 20.0;
      }
      else {
        double v6 = 40.0;
      }
      [(PaletteWeekdayHeaderView *)self centerXForElementAt:v4 width:v6 percent:0.0];
      [v5 setFrame:];

      ++v4;
    }
    while (v3 != v4);
  }
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
  if (!a3)
  {
    [(WeekPaletteTappableDay *)self->_highlightedDay setCircleHidden:1 updateCircleColor:0];
    markedAsTodayDay = self->_markedAsTodayDay;
    [(WeekPaletteTappableDay *)markedAsTodayDay setTextColorHighlighted:0];
  }
}

- (void)highlightWeekdayLabelForDateAndSetDay:(id)a3
{
  id v4 = a3;
  id v16 = +[NSCalendar currentCalendar];
  id v5 = [v16 component:512 fromDate:v4];
  uint64_t v6 = HKDaysInAWeek;
  uint64_t v7 = v6 - HKFirstDayOfWeekForWeeklyGoalCalculations();
  uint64_t v8 = ((uint64_t)v5 + v7) % 7;
  v9 = +[NSDate date];
  [v16 setFirstWeekday:HKFirstDayOfWeekForWeeklyGoalCalculations()];
  unsigned int v10 = [v16 isDate:v4 equalToDate:v9 toUnitGranularity:0x2000];
  id v15 = [v16 component:512 fromDate:v9];
  id v11 = [v16 isDate:v4 inSameDayAsDate:v9];

  [(WeekPaletteTappableDay *)self->_highlightedDay setCircleHidden:1 updateCircleColor:v11];
  [(WeekPaletteTappableDay *)self->_markedAsTodayDay setTextColorHighlighted:0];
  v12 = [(NSMutableArray *)self->_weekdayLabels objectAtIndexedSubscript:v8];
  [v12 setCircleHidden:0 updateCircleColor:v11];
  objc_storeStrong((id *)&self->_highlightedDay, v12);
  if ((v11 & 1) == 0 && v10)
  {
    v13 = [(NSMutableArray *)self->_weekdayLabels objectAtIndexedSubscript:((uint64_t)v15 + v7) % 7];
    [(WeekPaletteTappableDay *)v13 setTextColorHighlighted:1];
    markedAsTodayDay = self->_markedAsTodayDay;
    self->_markedAsTodayDay = v13;
  }
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedAsTodayDay, 0);
  objc_storeStrong((id *)&self->_highlightedDay, 0);
  objc_storeStrong((id *)&self->_weekdayLabels, 0);
  objc_storeStrong((id *)&self->_weekdayView, 0);

  objc_storeStrong((id *)&self->_weekdaysFont, 0);
}

@end