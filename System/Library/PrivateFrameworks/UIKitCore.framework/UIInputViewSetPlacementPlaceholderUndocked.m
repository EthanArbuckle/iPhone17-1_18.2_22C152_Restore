@interface UIInputViewSetPlacementPlaceholderUndocked
+ (id)placementWithHeight:(double)a3 undockedOffset:(CGPoint)a4 chromeBuffer:(UIEdgeInsets)a5;
- (BOOL)isEqual:(id)a3;
- (double)heightOfInputViews:(id)a3;
@end

@implementation UIInputViewSetPlacementPlaceholderUndocked

+ (id)placementWithHeight:(double)a3 undockedOffset:(CGPoint)a4 chromeBuffer:(UIEdgeInsets)a5
{
  id result = (id)objc_msgSend(a1, "placementWithUndockedOffset:chromeBuffer:", a4.x, a4.y, a5.top, a5.left, a5.bottom, a5.right);
  if (result) {
    *((double *)result + 11) = a3;
  }
  return result;
}

- (double)heightOfInputViews:(id)a3
{
  return self->_height;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)UIInputViewSetPlacementPlaceholderUndocked;
  if ([(UIInputViewSetPlacementUndocked *)&v7 isEqual:v4]) {
    BOOL v5 = v4[11] == self->_height;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

@end