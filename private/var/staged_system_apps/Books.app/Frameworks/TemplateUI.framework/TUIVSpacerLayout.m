@interface TUIVSpacerLayout
- (CGRect)computedBoundsPrimitiveWithFlags:(unint64_t)a3;
@end

@implementation TUIVSpacerLayout

- (CGRect)computedBoundsPrimitiveWithFlags:(unint64_t)a3
{
  if ((a3 & 2) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)TUIVSpacerLayout;
    -[TUILayout computedBoundsPrimitiveWithFlags:](&v7, "computedBoundsPrimitiveWithFlags:");
  }
  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end