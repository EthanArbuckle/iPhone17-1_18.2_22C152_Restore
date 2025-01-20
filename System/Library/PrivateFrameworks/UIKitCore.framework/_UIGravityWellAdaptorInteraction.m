@interface _UIGravityWellAdaptorInteraction
- (UIView)view;
@end

@implementation _UIGravityWellAdaptorInteraction

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end