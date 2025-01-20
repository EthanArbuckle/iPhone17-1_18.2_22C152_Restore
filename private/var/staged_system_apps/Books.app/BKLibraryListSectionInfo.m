@interface BKLibraryListSectionInfo
- (double)headerHeight;
- (double)height;
- (double)rowHeight;
- (double)vertOffset;
- (int64_t)numBooks;
- (int64_t)numRows;
- (void)setHeaderHeight:(double)a3;
- (void)setHeight:(double)a3;
- (void)setNumBooks:(int64_t)a3;
- (void)setNumRows:(int64_t)a3;
- (void)setRowHeight:(double)a3;
- (void)setVertOffset:(double)a3;
@end

@implementation BKLibraryListSectionInfo

- (double)vertOffset
{
  return self->_vertOffset;
}

- (void)setVertOffset:(double)a3
{
  self->_vertOffset = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (int64_t)numRows
{
  return self->_numRows;
}

- (void)setNumRows:(int64_t)a3
{
  self->_numRows = a3;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (int64_t)numBooks
{
  return self->_numBooks;
}

- (void)setNumBooks:(int64_t)a3
{
  self->_numBooks = a3;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

@end