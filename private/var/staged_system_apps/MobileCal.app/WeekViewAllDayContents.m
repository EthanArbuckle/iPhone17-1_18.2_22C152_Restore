@interface WeekViewAllDayContents
- (WeekViewAllDayContentsDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation WeekViewAllDayContents

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v14 = a3;
  if ([v14 count] == (id)1)
  {
    v5 = [v14 anyObject];
    v6 = v5;
    if (v5)
    {
      v7 = [v5 view];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        [v6 locationInView:self];
        double v10 = v9;
        double v12 = v11;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained emptySpaceClickForCalendarWeekDayEventContent:self atPoint:v10 v12];
      }
    }
  }
  else
  {
    v6 = 0;
  }
}

- (WeekViewAllDayContentsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WeekViewAllDayContentsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end