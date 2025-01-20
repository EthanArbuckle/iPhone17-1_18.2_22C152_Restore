@interface _UIViewMaskViewWrapper
- (UIView)maskView;
- (void)setMaskView:(id)a3;
@end

@implementation _UIViewMaskViewWrapper

- (UIView)maskView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_maskView);
  return (UIView *)WeakRetained;
}

- (void)setMaskView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end