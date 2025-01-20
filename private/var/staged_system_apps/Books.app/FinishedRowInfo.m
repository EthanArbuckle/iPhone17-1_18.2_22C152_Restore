@interface FinishedRowInfo
- (double)bottomOfCell;
- (double)topOfCell;
- (void)setBottomOfCell:(double)a3;
- (void)setTopOfCell:(double)a3;
@end

@implementation FinishedRowInfo

- (double)topOfCell
{
  return self->_topOfCell;
}

- (void)setTopOfCell:(double)a3
{
  self->_topOfCell = a3;
}

- (double)bottomOfCell
{
  return self->_bottomOfCell;
}

- (void)setBottomOfCell:(double)a3
{
  self->_bottomOfCell = a3;
}

@end