@interface PXCollectionsDataSourceChangeDetails
- (BOOL)isCountUpdateChange;
- (void)setCountUpdateChange:(BOOL)a3;
@end

@implementation PXCollectionsDataSourceChangeDetails

- (void)setCountUpdateChange:(BOOL)a3
{
  self->_countUpdateChange = a3;
}

- (BOOL)isCountUpdateChange
{
  return self->_countUpdateChange;
}

@end