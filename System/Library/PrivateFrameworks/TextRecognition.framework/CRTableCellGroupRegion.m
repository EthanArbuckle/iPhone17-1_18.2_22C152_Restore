@interface CRTableCellGroupRegion
- (CRTableCellGroupRegion)initWithBoundingQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5 rows:(_NSRange)a6 columns:(_NSRange)a7;
- (_NSRange)columns;
- (_NSRange)rows;
@end

@implementation CRTableCellGroupRegion

- (CRTableCellGroupRegion)initWithBoundingQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5 rows:(_NSRange)a6 columns:(_NSRange)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  v10.receiver = self;
  v10.super_class = (Class)CRTableCellGroupRegion;
  result = [(CRGroupRegion *)&v10 initWithBoundingQuad:a3 layoutDirection:a4 subregions:a5];
  if (result)
  {
    result->_rows.NSUInteger location = location;
    result->_rows.NSUInteger length = length;
    result->_columns = a7;
  }
  return result;
}

- (_NSRange)rows
{
  objc_copyStruct(v4, &self->_rows, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (_NSRange)columns
{
  objc_copyStruct(v4, &self->_columns, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

@end