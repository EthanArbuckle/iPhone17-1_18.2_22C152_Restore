@interface _PIPosterInactiveFrameLayoutResult
- (CGRect)inactiveRect;
- (NSString)description;
- (void)setInactiveRect:(CGRect)a3;
@end

@implementation _PIPosterInactiveFrameLayoutResult

- (void)setInactiveRect:(CGRect)a3
{
  self->_inactiveRect = a3;
}

- (CGRect)inactiveRect
{
  double x = self->_inactiveRect.origin.x;
  double y = self->_inactiveRect.origin.y;
  double width = self->_inactiveRect.size.width;
  double height = self->_inactiveRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E4F29238];
  [(_PIPosterInactiveFrameLayoutResult *)self inactiveRect];
  v13[0] = v6;
  v13[1] = v7;
  v13[2] = v8;
  v13[3] = v9;
  v10 = [v5 valueWithBytes:v13 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  v11 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v10];

  return (NSString *)v11;
}

@end