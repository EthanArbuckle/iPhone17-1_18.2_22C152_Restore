@interface SUCellConfigurationContext
- (int64_t)tableViewStyle;
- (void)setTableViewStyle:(int64_t)a3;
@end

@implementation SUCellConfigurationContext

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (void)setTableViewStyle:(int64_t)a3
{
  self->_tableViewStyle = a3;
}

@end