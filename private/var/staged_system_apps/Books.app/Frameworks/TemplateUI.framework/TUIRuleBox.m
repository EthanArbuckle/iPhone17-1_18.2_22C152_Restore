@interface TUIRuleBox
- (Class)layoutClass;
- (UIColor)color;
- (unint64_t)axis;
- (void)setAxis:(unint64_t)a3;
- (void)setColor:(id)a3;
@end

@implementation TUIRuleBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end