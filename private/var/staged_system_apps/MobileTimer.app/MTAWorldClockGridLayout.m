@interface MTAWorldClockGridLayout
- (unint64_t)columnsPerPage;
- (unint64_t)itemsPerPage;
- (unint64_t)rowsPerPage;
- (void)setColumnsPerPage:(unint64_t)a3;
- (void)setRowsPerPage:(unint64_t)a3;
@end

@implementation MTAWorldClockGridLayout

- (unint64_t)itemsPerPage
{
  unint64_t v3 = [(MTAWorldClockGridLayout *)self rowsPerPage];
  return [(MTAWorldClockGridLayout *)self columnsPerPage] * v3;
}

- (unint64_t)rowsPerPage
{
  return self->_rowsPerPage;
}

- (void)setRowsPerPage:(unint64_t)a3
{
  self->_rowsPerPage = a3;
}

- (unint64_t)columnsPerPage
{
  return self->_columnsPerPage;
}

- (void)setColumnsPerPage:(unint64_t)a3
{
  self->_columnsPerPage = a3;
}

@end