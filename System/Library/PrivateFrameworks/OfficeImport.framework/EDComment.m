@interface EDComment
- (BOOL)visible;
- (EDString)author;
- (id)description;
- (int)columnIndex;
- (int)rowIndex;
- (void)setAuthor:(id)a3;
- (void)setColumnIndex:(int)a3;
- (void)setRowIndex:(int)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation EDComment

- (void)setRowIndex:(int)a3
{
  self->_rowIndex = a3;
}

- (void)setColumnIndex:(int)a3
{
  self->_columnIndex = a3;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDComment;
  v2 = [(EDComment *)&v4 description];
  return v2;
}

- (int)rowIndex
{
  return self->_rowIndex;
}

- (int)columnIndex
{
  return self->_columnIndex;
}

- (EDString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (BOOL)visible
{
  return self->_visible;
}

- (void).cxx_destruct
{
}

@end