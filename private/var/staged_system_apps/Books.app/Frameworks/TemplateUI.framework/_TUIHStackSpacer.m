@interface _TUIHStackSpacer
- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedWidth;
- (CGRect)computedBoundsPrimitiveWithFlags:(unint64_t)a3;
- (void)setSpecifiedWidth:(id *)a3;
@end

@implementation _TUIHStackSpacer

- (CGRect)computedBoundsPrimitiveWithFlags:(unint64_t)a3
{
  if ((a3 & 2) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)_TUIHStackSpacer;
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

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedWidth
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_specifiedWidth.value;
}

- (void)setSpecifiedWidth:(id *)a3
{
  *(void *)&self->_specifiedWidth.value = a3;
  *(void *)&self->_specifiedWidth.madouble x = v3;
}

@end