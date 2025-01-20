@interface ICCollapsibleContainerView
- (UIView)containedView;
- (void)performSetup;
- (void)setContainedView:(id)a3;
@end

@implementation ICCollapsibleContainerView

- (void)performSetup
{
  id v3 = [(ICCollapsibleContainerView *)self containedView];
  [(ICCollapsibleBaseView *)self performSetUpWithContentView:v3];
}

- (UIView)containedView
{
  return self->_containedView;
}

- (void)setContainedView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end