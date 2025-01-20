@interface UICalendarSelection
- (BOOL)canSelectDate:(id)a3;
- (BOOL)highlightsToday;
- (BOOL)renderOverhangDays;
- (BOOL)shouldDeselectDate:(id)a3;
- (UICalendarView)view;
- (id)_init;
- (unint64_t)roundedEdgeForDate:(id)a3;
- (void)setView:(id)a3;
@end

@implementation UICalendarSelection

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)UICalendarSelection;
  return [(UICalendarSelection *)&v3 init];
}

- (void)setView:(id)a3
{
  id v4 = a3;
  [(UICalendarSelection *)self willMoveToCalendarView:v4];
  objc_storeWeak((id *)&self->_view, v4);

  [(UICalendarSelection *)self didMoveToCalendarView];
}

- (BOOL)canSelectDate:(id)a3
{
  return 0;
}

- (BOOL)shouldDeselectDate:(id)a3
{
  return 0;
}

- (unint64_t)roundedEdgeForDate:(id)a3
{
  return 3;
}

- (BOOL)highlightsToday
{
  return 1;
}

- (BOOL)renderOverhangDays
{
  return 0;
}

- (UICalendarView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UICalendarView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end