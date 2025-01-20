@interface TSKToolbarSpace
+ (id)spaceWithWidth:(double)a3;
- (BOOL)isEnabled;
- (double)width;
- (void)setWidth:(double)a3;
@end

@implementation TSKToolbarSpace

+ (id)spaceWithWidth:(double)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setWidth:a3];
  return v4;
}

- (BOOL)isEnabled
{
  return 0;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

@end