@interface _UITableViewCellActionButton
+ (id)actionButtonWithStyle:(unint64_t)a3;
- (UIVisualEffect)backgroundEffect;
- (void)setBackgroundEffect:(id)a3;
@end

@implementation _UITableViewCellActionButton

+ (id)actionButtonWithStyle:(unint64_t)a3
{
  return (id)[a1 buttonWithType:0];
}

- (UIVisualEffect)backgroundEffect
{
  return self->_backgroundEffect;
}

- (void)setBackgroundEffect:(id)a3
{
}

- (void).cxx_destruct
{
}

@end