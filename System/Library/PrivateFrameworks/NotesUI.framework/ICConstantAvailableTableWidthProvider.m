@interface ICConstantAvailableTableWidthProvider
- (double)availableWidth;
- (void)setAvailableWidth:(double)a3;
@end

@implementation ICConstantAvailableTableWidthProvider

- (double)availableWidth
{
  return self->_availableWidth;
}

- (void)setAvailableWidth:(double)a3
{
  self->_availableWidth = a3;
}

@end