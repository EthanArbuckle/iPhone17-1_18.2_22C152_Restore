@interface FMCongestionArea
- (NSArray)badCells;
- (NSArray)goodCells;
- (NSArray)prevCells;
- (NSDate)endTimestamp;
- (NSDate)startTimestamp;
- (id)description;
- (id)init:(id)a3 prevCells:(id)a4;
- (unsigned)curState;
- (void)addBadCell:(id)a3;
- (void)addGoodCell:(id)a3;
- (void)exitedAt:(id)a3;
- (void)finalize;
@end

@implementation FMCongestionArea

- (id)init:(id)a3 prevCells:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FMCongestionArea;
  v9 = [(FMCongestionArea *)&v17 init];
  v10 = v9;
  if (v9)
  {
    v9->_curState = 0;
    objc_storeStrong((id *)&v9->_startTimestamp, a3);
    objc_storeStrong((id *)&v10->_prevCells, a4);
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    badCells = v10->_badCells;
    v10->_badCells = v11;

    endTimestamp = v10->_endTimestamp;
    v10->_endTimestamp = 0;

    goodCells = v10->_goodCells;
    v10->_goodCells = 0;

    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100148114();
    }
    v15 = v10;
  }

  return v10;
}

- (void)exitedAt:(id)a3
{
  id v5 = a3;
  if (![(FMCongestionArea *)self curState])
  {
    self->_curState = 1;
    objc_storeStrong((id *)&self->_endTimestamp, a3);
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    goodCells = self->_goodCells;
    self->_goodCells = v6;

    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_10014817C();
    }
  }
}

- (void)addBadCell:(id)a3
{
  id v4 = a3;
  if (![(FMCongestionArea *)self curState])
  {
    id v5 = [v4 congestionMetric];

    if (v5)
    {
      [(NSMutableArray *)self->_badCells addObject:v4];
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_100148258();
      }
    }
    else
    {
      self->_curState = 3;
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
        sub_1001481E4();
      }
    }
  }
}

- (void)addGoodCell:(id)a3
{
  id v4 = a3;
  if ([(FMCongestionArea *)self curState] == 1)
  {
    id v5 = [v4 congestionMetric];

    if (v5)
    {
      [(NSMutableArray *)self->_goodCells addObject:v4];
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_100148328();
      }
    }
    else
    {
      self->_curState = 3;
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_1001482C0();
      }
    }
  }
}

- (void)finalize
{
  if ([(FMCongestionArea *)self curState] == 1)
  {
    self->_curState = 2;
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100148390();
    }
  }
}

- (NSArray)badCells
{
  id v2 = [(NSMutableArray *)self->_badCells copy];

  return (NSArray *)v2;
}

- (NSArray)goodCells
{
  id v2 = [(NSMutableArray *)self->_goodCells copy];

  return (NSArray *)v2;
}

- (id)description
{
  uint64_t v3 = [(FMCongestionArea *)self curState];
  id v4 = [(FMCongestionArea *)self startTimestamp];
  id v5 = [(FMCongestionArea *)self prevCells];
  v6 = [(FMCongestionArea *)self endTimestamp];
  id v7 = [(FMCongestionArea *)self badCells];
  id v8 = [(FMCongestionArea *)self goodCells];
  v9 = +[NSString stringWithFormat:@"curState %u, startTimestamp %@, prevCells %@, endTimestamp %@, badCells %@, goodCells %@", v3, v4, v5, v6, v7, v8];

  return v9;
}

- (unsigned)curState
{
  return self->_curState;
}

- (NSDate)startTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)prevCells
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)endTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_prevCells, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_goodCells, 0);

  objc_storeStrong((id *)&self->_badCells, 0);
}

@end