@interface ATXTrendPlotBin
- (ATXTrendPlotBin)initWithStartDate:(id)a3;
- (ATXTrendPlotBin)next;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)data;
- (void)setData:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setNext:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation ATXTrendPlotBin

- (ATXTrendPlotBin)initWithStartDate:(id)a3
{
  id v4 = a3;
  v5 = (ATXTrendPlotBin *)objc_opt_new();
  [(ATXTrendPlotBin *)v5 setStartDate:v4];

  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (id)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (ATXTrendPlotBin)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong(&self->_data, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end