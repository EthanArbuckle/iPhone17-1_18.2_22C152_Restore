@interface NSLayoutManagerTextBlockHelper
- (NSLayoutManagerTextBlockHelper)initWithTextBlock:(id)a3 layoutRect:(CGRect)a4 boundsRect:(CGRect)a5;
- (void)dealloc;
@end

@implementation NSLayoutManagerTextBlockHelper

- (NSLayoutManagerTextBlockHelper)initWithTextBlock:(id)a3 layoutRect:(CGRect)a4 boundsRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v9 = a4.size.height;
  CGFloat v10 = a4.size.width;
  CGFloat v11 = a4.origin.y;
  CGFloat v12 = a4.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)NSLayoutManagerTextBlockHelper;
  v14 = [(NSLayoutManagerTextBlockHelper *)&v16 init];
  v14->_block = (NSTextBlock *)a3;
  v14->_layoutRect.origin.CGFloat x = v12;
  v14->_layoutRect.origin.CGFloat y = v11;
  v14->_layoutRect.size.CGFloat width = v10;
  v14->_layoutRect.size.CGFloat height = v9;
  v14->_boundsRect.origin.CGFloat x = x;
  v14->_boundsRect.origin.CGFloat y = y;
  v14->_boundsRect.size.CGFloat width = width;
  v14->_boundsRect.size.CGFloat height = height;
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutManagerTextBlockHelper;
  [(NSLayoutManagerTextBlockHelper *)&v3 dealloc];
}

@end