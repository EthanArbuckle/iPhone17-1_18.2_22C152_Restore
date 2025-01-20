@interface TSWPInteriorCookie
- (TSWPColumn)column;
- (TSWPShapeLayout)layout;
- (void)setColumn:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation TSWPInteriorCookie

- (TSWPColumn)column
{
  return self->_column;
}

- (void)setColumn:(id)a3
{
  self->_column = (TSWPColumn *)a3;
}

- (TSWPShapeLayout)layout
{
  return self->_shapeLayout;
}

- (void)setLayout:(id)a3
{
  self->_shapeLayout = (TSWPShapeLayout *)a3;
}

@end