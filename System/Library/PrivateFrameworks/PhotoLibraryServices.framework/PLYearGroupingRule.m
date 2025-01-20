@interface PLYearGroupingRule
- (BOOL)highlightItem:(id)a3 belongsToHighlightItemList:(id)a4;
- (BOOL)highlightItemList:(id)a3 canBeMergedWithOtherHighlightItemList:(id)a4;
- (NSCalendar)calendar;
- (PLYearGroupingRule)init;
- (unint64_t)dominantYearForStartDate:(id)a3 endDate:(id)a4;
- (void)titlesForHighlightItemList:(id)a3 dateRangeTitleGenerator:(id)a4 forceUpdateLocale:(BOOL)a5 resultBlock:(id)a6;
- (void)titlesForHighlightItemList:(id)a3 dateRangeTitleGenerator:(id)a4 resultBlock:(id)a5;
@end

@implementation PLYearGroupingRule

- (void).cxx_destruct
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (BOOL)highlightItemList:(id)a3 canBeMergedWithOtherHighlightItemList:(id)a4
{
  return 0;
}

- (BOOL)highlightItem:(id)a3 belongsToHighlightItemList:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 startDate];
  v9 = [v6 endDate];

  unint64_t v10 = [(PLYearGroupingRule *)self dominantYearForStartDate:v8 endDate:v9];
  v11 = [v7 startDate];
  v12 = [v7 endDate];

  unint64_t v13 = [(PLYearGroupingRule *)self dominantYearForStartDate:v11 endDate:v12];
  return v10 == v13;
}

- (unint64_t)dominantYearForStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PLYearGroupingRule *)self calendar];
  [v6 timeIntervalSinceDate:v7];
  double v10 = v9;

  v11 = [v7 dateByAddingTimeInterval:v10 * 0.5];

  unint64_t v12 = [v8 component:4 fromDate:v11];
  return v12;
}

- (void)titlesForHighlightItemList:(id)a3 dateRangeTitleGenerator:(id)a4 forceUpdateLocale:(BOOL)a5 resultBlock:(id)a6
{
  BOOL v6 = a5;
  double v9 = (void (**)(id, void *, void))a6;
  id v10 = a4;
  id v18 = [a3 sortedChildHighlightItems];
  v11 = [v18 firstObject];
  unint64_t v12 = [v18 lastObject];
  unint64_t v13 = [v11 endDate];
  v14 = [v12 startDate];
  [v14 timeIntervalSinceDate:v13];
  v16 = [v13 dateByAddingTimeInterval:v15 * 0.5];
  v17 = [v10 dateRangeTitleWithStartDate:v16 endDate:v16 category:0 kind:2 type:0 options:v6];

  v9[2](v9, v17, 0);
}

- (void)titlesForHighlightItemList:(id)a3 dateRangeTitleGenerator:(id)a4 resultBlock:(id)a5
{
}

- (PLYearGroupingRule)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLYearGroupingRule;
  v2 = [(PLYearGroupingRule *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v3;
  }
  return v2;
}

@end