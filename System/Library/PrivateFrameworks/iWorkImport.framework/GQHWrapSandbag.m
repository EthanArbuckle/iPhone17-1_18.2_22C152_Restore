@interface GQHWrapSandbag
- (GQHWrapSandbag)initWithSize:(CGSize)a3 floatsLeft:(BOOL)a4;
@end

@implementation GQHWrapSandbag

- (GQHWrapSandbag)initWithSize:(CGSize)a3 floatsLeft:(BOOL)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)GQHWrapSandbag;
  result = [(GQHWrapSandbag *)&v8 init];
  if (result)
  {
    result->mSize.CGFloat width = width;
    result->mSize.CGFloat height = height;
    result->mFloatsLeft = a4;
  }
  return result;
}

@end