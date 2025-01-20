@interface _TVRelatedWrappingView
- (UIView)relatedView;
- (void)setRelatedView:(id)a3;
@end

@implementation _TVRelatedWrappingView

- (UIView)relatedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_relatedView);
  return (UIView *)WeakRetained;
}

- (void)setRelatedView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end