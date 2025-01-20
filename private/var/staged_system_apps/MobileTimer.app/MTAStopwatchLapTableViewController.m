@interface MTAStopwatchLapTableViewController
- ($0AC6E346AE4835514AAA8AC86D8F4844)lapExtrema;
- (BOOL)_canShowWhileLocked;
- (BOOL)showsCurrentLap;
- (MTAStopwatchLapCell)currentLapCell;
- (MTAStopwatchLapTableViewController)initWithStyle:(int64_t)a3;
- (NSMutableArray)lapTimes;
- (double)currentInterval;
- (double)previousLapsTotalInterval;
- (double)runningTotalForLap:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (unint64_t)cellStyle;
- (unint64_t)lapCount;
- (void)_updateCurrentLapCell;
- (void)_updateLapExtrema;
- (void)addLap:(double)a3;
- (void)clearAllLaps;
- (void)loadView;
- (void)setCellStyle:(unint64_t)a3;
- (void)setCurrentInterval:(double)a3;
- (void)setCurrentLapCell:(id)a3;
- (void)setLapExtrema:(id)a3;
- (void)setLapTimes:(id)a3;
- (void)setLaps:(id)a3;
- (void)setPreviousLapsTotalInterval:(double)a3;
- (void)setShowsCurrentLap:(BOOL)a3;
@end

@implementation MTAStopwatchLapTableViewController

- (MTAStopwatchLapTableViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTAStopwatchLapTableViewController;
  v3 = [(MTAStopwatchLapTableViewController *)&v6 initWithStyle:a3];
  if (v3)
  {
    v4 = objc_opt_new();
    [(MTAStopwatchLapTableViewController *)v3 setLapTimes:v4];
  }
  return v3;
}

- (void)setLapTimes:(id)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)MTAStopwatchLapTableViewController;
  [(MTAStopwatchLapTableViewController *)&v12 loadView];
  v3 = -[MTAStopwatchTableView initWithFrame:style:]([MTAStopwatchTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(MTAStopwatchLapTableViewController *)self setTableView:v3];

  v4 = [(MTAStopwatchLapTableViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"MTCurrentLapCell"];

  v5 = [(MTAStopwatchLapTableViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:off_1000C6ED0];

  objc_super v6 = [(MTAStopwatchLapTableViewController *)self tableView];
  [v6 setDelegate:self];

  v7 = [(MTAStopwatchLapTableViewController *)self tableView];
  [v7 setDataSource:self];

  v8 = +[UIColor mtui_backgroundColor];
  v9 = [(MTAStopwatchLapTableViewController *)self tableView];
  [v9 setBackgroundColor:v8];

  v10 = [(MTAStopwatchLapTableViewController *)self tableView];
  [v10 setSeparatorInset:0.0, 15.0, 0.0, 15.0];

  v11 = [(MTAStopwatchLapTableViewController *)self tableView];
  [v11 setCellLayoutMarginsFollowReadableWidth:0];
}

- (void)setCellStyle:(unint64_t)a3
{
  if (self->_cellStyle != a3)
  {
    self->_cellStyle = a3;
    if (a3 - 2 > 2) {
      double v4 = 44.0;
    }
    else {
      double v4 = dbl_100082938[a3 - 2];
    }
    v5 = [(MTAStopwatchLapTableViewController *)self tableView];
    [v5 setEstimatedRowHeight:v4];

    id v6 = [(MTAStopwatchLapTableViewController *)self tableView];
    [v6 reloadData];
  }
}

- (void)setShowsCurrentLap:(BOOL)a3
{
  if (self->_showsCurrentLap != a3)
  {
    self->_showsCurrentLap = a3;
    id v3 = [(MTAStopwatchLapTableViewController *)self tableView];
    [v3 reloadData];
  }
}

- (void)setCurrentInterval:(double)a3
{
  self->_currentInterval = a3;
  [(MTAStopwatchLapTableViewController *)self _updateCurrentLapCell];
}

- (void)_updateCurrentLapCell
{
  unint64_t v3 = [(MTAStopwatchLapTableViewController *)self lapCount];
  double v4 = [(MTAStopwatchLapTableViewController *)self currentLapCell];
  [v4 setLap:v3];

  [(MTAStopwatchLapTableViewController *)self currentInterval];
  double v6 = v5;
  v7 = [(MTAStopwatchLapTableViewController *)self currentLapCell];
  [v7 setTime:v6];

  [(MTAStopwatchLapTableViewController *)self previousLapsTotalInterval];
  double v9 = v8;
  [(MTAStopwatchLapTableViewController *)self currentInterval];
  double v11 = v9 + v10;
  objc_super v12 = [(MTAStopwatchLapTableViewController *)self currentLapCell];
  [v12 setRunningTotal:v11];

  v13 = +[UIColor mtui_primaryTextColor];
  v14 = [(MTAStopwatchLapTableViewController *)self currentLapCell];
  [v14 setColor:v13];

  id v15 = [(MTAStopwatchLapTableViewController *)self currentLapCell];
  [v15 setNeedsLayout];
}

- (void)addLap:(double)a3
{
  double v5 = [(MTAStopwatchLapTableViewController *)self lapTimes];
  double v6 = +[NSNumber numberWithDouble:a3];
  [v5 addObject:v6];

  [(MTAStopwatchLapTableViewController *)self _updateLapExtrema];
  [(MTAStopwatchLapTableViewController *)self previousLapsTotalInterval];
  [(MTAStopwatchLapTableViewController *)self setPreviousLapsTotalInterval:v7 + a3];
  id v8 = [(MTAStopwatchLapTableViewController *)self tableView];
  [v8 reloadData];
}

- (void)setLaps:(id)a3
{
  id v4 = a3;
  double v5 = [(MTAStopwatchLapTableViewController *)self lapTimes];
  [v5 removeAllObjects];

  double v6 = [(MTAStopwatchLapTableViewController *)self lapTimes];
  [v6 addObjectsFromArray:v4];

  [(MTAStopwatchLapTableViewController *)self _updateLapExtrema];
  double v7 = [(MTAStopwatchLapTableViewController *)self lapTimes];
  -[MTAStopwatchLapTableViewController runningTotalForLap:](self, "runningTotalForLap:", (char *)[v7 count] - 1);
  -[MTAStopwatchLapTableViewController setPreviousLapsTotalInterval:](self, "setPreviousLapsTotalInterval:");

  id v8 = [(MTAStopwatchLapTableViewController *)self tableView];
  [v8 reloadData];
}

- (void)clearAllLaps
{
  unint64_t v3 = [(MTAStopwatchLapTableViewController *)self lapTimes];
  [v3 removeAllObjects];

  [(MTAStopwatchLapTableViewController *)self _updateLapExtrema];
  [(MTAStopwatchLapTableViewController *)self setPreviousLapsTotalInterval:0.0];
  id v4 = [(MTAStopwatchLapTableViewController *)self tableView];
  [v4 reloadData];
}

- (unint64_t)lapCount
{
  unint64_t v3 = [(MTAStopwatchLapTableViewController *)self lapTimes];
  id v4 = [v3 count];

  return (unint64_t)v4 + [(MTAStopwatchLapTableViewController *)self showsCurrentLap];
}

- (double)runningTotalForLap:(int64_t)a3
{
  if (a3 < 0) {
    return 0.0;
  }
  uint64_t v4 = 0;
  int64_t v5 = a3 + 1;
  double v6 = 0.0;
  do
  {
    double v7 = [(MTAStopwatchLapTableViewController *)self lapTimes];
    id v8 = [v7 objectAtIndexedSubscript:v4];
    [v8 doubleValue];
    double v6 = v6 + v9;

    ++v4;
  }
  while (v5 != v4);
  return v6;
}

- (void)_updateLapExtrema
{
  unint64_t v3 = [(MTAStopwatchLapTableViewController *)self lapTimes];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 2)
  {
    double v7 = [(MTAStopwatchLapTableViewController *)self lapTimes];
    id v8 = [v7 objectAtIndexedSubscript:0];
    [v8 doubleValue];
    double v10 = v9;

    double v11 = [(MTAStopwatchLapTableViewController *)self lapTimes];
    objc_super v12 = [v11 objectAtIndexedSubscript:0];
    [v12 doubleValue];
    double v14 = v13;

    id v15 = [(MTAStopwatchLapTableViewController *)self lapTimes];
    id v16 = [v15 count];

    uint64_t v5 = 0;
    uint64_t v6 = 0;
    if ((unint64_t)v16 >= 2)
    {
      uint64_t v6 = 0;
      uint64_t v5 = 0;
      unint64_t v17 = 1;
      do
      {
        v18 = [(MTAStopwatchLapTableViewController *)self lapTimes];
        v19 = [v18 objectAtIndexedSubscript:v17];
        [v19 doubleValue];
        double v21 = v20;

        if (v21 < v10) {
          double v22 = v21;
        }
        else {
          double v22 = v10;
        }
        if (v21 < v10) {
          uint64_t v23 = v17;
        }
        else {
          uint64_t v23 = v5;
        }
        BOOL v24 = v21 <= v14;
        if (v21 <= v14) {
          double v10 = v22;
        }
        else {
          double v14 = v21;
        }
        if (v24) {
          uint64_t v5 = v23;
        }
        if (!v24) {
          uint64_t v6 = v17;
        }
        ++v17;
        v25 = [(MTAStopwatchLapTableViewController *)self lapTimes];
        id v26 = [v25 count];
      }
      while (v17 < (unint64_t)v26);
    }
  }
  else
  {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  -[MTAStopwatchLapTableViewController setLapExtrema:](self, "setLapExtrema:", v5, v6);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  unint64_t v4 = [(MTAStopwatchLapTableViewController *)self cellStyle];

  +[MTAStopwatchLapCell cellHeightWithCellStyle:v4];
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(MTAStopwatchLapTableViewController *)self lapCount];
  int64_t v9 = v8 - (void)[v6 row];
  double v10 = [(MTAStopwatchLapTableViewController *)self lapTimes];
  id v11 = [v10 count];

  if (v9 <= (uint64_t)v11) {
    CFStringRef v12 = off_1000C6ED0;
  }
  else {
    CFStringRef v12 = @"MTCurrentLapCell";
  }
  double v13 = [v7 dequeueReusableCellWithIdentifier:v12 forIndexPath:v6];

  [v13 setLapStyle:[self cellStyle]];
  if (v9 <= (uint64_t)v11)
  {
    id v14 = (id)(v9 - 1);
    [v13 setLap:v9];
    id v15 = [(MTAStopwatchLapTableViewController *)self lapTimes];
    id v16 = [v15 objectAtIndexedSubscript:v14];
    [v16 doubleValue];
    [v13 setTime:];

    [(MTAStopwatchLapTableViewController *)self runningTotalForLap:v14];
    [v13 setRunningTotal:];
    if (v14 == [(MTAStopwatchLapTableViewController *)self lapExtrema])
    {
      uint64_t v17 = +[UIColor systemGreenColor];
    }
    else
    {
      [(MTAStopwatchLapTableViewController *)self lapExtrema];
      if (v14 == v18) {
        +[UIColor systemRedColor];
      }
      else {
      uint64_t v17 = +[UIColor mtui_primaryTextColor];
      }
    }
    v19 = (void *)v17;
    [v13 setColor:v17];
  }
  else
  {
    [(MTAStopwatchLapTableViewController *)self setCurrentLapCell:v13];
    [(MTAStopwatchLapTableViewController *)self _updateCurrentLapCell];
  }

  return v13;
}

- (double)currentInterval
{
  return self->_currentInterval;
}

- (BOOL)showsCurrentLap
{
  return self->_showsCurrentLap;
}

- (unint64_t)cellStyle
{
  return self->_cellStyle;
}

- (double)previousLapsTotalInterval
{
  return self->_previousLapsTotalInterval;
}

- (void)setPreviousLapsTotalInterval:(double)a3
{
  self->_previousLapsTotalInterval = a3;
}

- (NSMutableArray)lapTimes
{
  return self->_lapTimes;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)lapExtrema
{
  p_lapExtrema = &self->_lapExtrema;
  int64_t fastestLapIndex = self->_lapExtrema.fastestLapIndex;
  int64_t slowestLapIndex = p_lapExtrema->slowestLapIndex;
  result.var1 = slowestLapIndex;
  result.var0 = fastestLapIndex;
  return result;
}

- (void)setLapExtrema:(id)a3
{
  self->_lapExtrema = ($2D0F6D2748D6811982654C412F18C8B0)a3;
}

- (MTAStopwatchLapCell)currentLapCell
{
  return self->_currentLapCell;
}

- (void)setCurrentLapCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLapCell, 0);

  objc_storeStrong((id *)&self->_lapTimes, 0);
}

@end