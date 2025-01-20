@interface UISSlotEmptyContent
+ (id)contentWithSize:(CGSize)a3;
- (BOOL)isRemote;
- (BOOL)shouldReplaceExistingContent;
- (CGSize)contentSize;
- (UISSlotEmptyContent)initWithSize:(CGSize)a3;
- (id)image;
- (unsigned)contentScale;
@end

@implementation UISSlotEmptyContent

+ (id)contentWithSize:(CGSize)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:", a3.width, a3.height);
  return v3;
}

- (UISSlotEmptyContent)initWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)UISSlotEmptyContent;
  result = [(UISSlotEmptyContent *)&v6 init];
  if (result)
  {
    result->_contentSize.CGFloat width = width;
    result->_contentSize.CGFloat height = height;
  }
  return result;
}

- (unsigned)contentScale
{
  return 1;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isRemote
{
  return 0;
}

- (BOOL)shouldReplaceExistingContent
{
  return 0;
}

- (id)image
{
  return 0;
}

@end