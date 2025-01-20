@interface _CHWorkoutDetailDownhillRunTableItem
- (CHWorkoutDownhillRun)downhillRun;
- (int64_t)downhillRunIndex;
- (void)setDownhillRun:(id)a3;
- (void)setDownhillRunIndex:(int64_t)a3;
@end

@implementation _CHWorkoutDetailDownhillRunTableItem

- (int64_t)downhillRunIndex
{
  return self->_downhillRunIndex;
}

- (void)setDownhillRunIndex:(int64_t)a3
{
  self->_downhillRunIndex = a3;
}

- (CHWorkoutDownhillRun)downhillRun
{
  return self->_downhillRun;
}

- (void)setDownhillRun:(id)a3
{
}

- (void).cxx_destruct
{
}

@end