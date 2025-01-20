@interface TUISectionModel
- (unint64_t)columns;
- (unint64_t)rows;
- (void)setColumns:(unint64_t)a3;
- (void)setRows:(unint64_t)a3;
@end

@implementation TUISectionModel

- (unint64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(unint64_t)a3
{
  self->_columns = a3;
}

- (unint64_t)rows
{
  return self->_rows;
}

- (void)setRows:(unint64_t)a3
{
  self->_rows = a3;
}

@end