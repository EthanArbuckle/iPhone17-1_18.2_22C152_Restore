@interface NSLayoutManagerTextBlockRowArrayCache
- (NSLayoutManagerTextBlockRowArrayCache)initWithRowCharRange:(_NSRange)a3 containerWidth:(double)a4 rowArray:(id)a5 collapseBorders:(BOOL)a6;
- (void)dealloc;
@end

@implementation NSLayoutManagerTextBlockRowArrayCache

- (NSLayoutManagerTextBlockRowArrayCache)initWithRowCharRange:(_NSRange)a3 containerWidth:(double)a4 rowArray:(id)a5 collapseBorders:(BOOL)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v13.receiver = self;
  v13.super_class = (Class)NSLayoutManagerTextBlockRowArrayCache;
  v11 = [(NSLayoutManagerTextBlockRowArrayCache *)&v13 init];
  v11->_rowCharRange.NSUInteger location = location;
  v11->_rowCharRange.NSUInteger length = length;
  v11->_containerWidth = a4;
  v11->_rowArray = (NSArray *)a5;
  v11->_collapseBorders = a6;
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSLayoutManagerTextBlockRowArrayCache;
  [(NSLayoutManagerTextBlockRowArrayCache *)&v3 dealloc];
}

@end