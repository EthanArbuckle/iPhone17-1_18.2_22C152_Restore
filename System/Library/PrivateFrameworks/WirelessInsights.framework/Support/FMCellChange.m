@interface FMCellChange
- (FMCellChange)initWithTime:(id)a3 andTimestamp:(unint64_t)a4 andCell:(id)a5;
- (FMServingCell)toCell;
- (NSDate)time;
- (unint64_t)timestamp;
@end

@implementation FMCellChange

- (FMCellChange)initWithTime:(id)a3 andTimestamp:(unint64_t)a4 andCell:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FMCellChange;
  v11 = [(FMCellChange *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_time, a3);
    v12->_timestamp = a4;
    objc_storeStrong((id *)&v12->_toCell, a5);
    v13 = v12;
  }

  return v12;
}

- (NSDate)time
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (FMServingCell)toCell
{
  return (FMServingCell *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toCell, 0);

  objc_storeStrong((id *)&self->_time, 0);
}

@end