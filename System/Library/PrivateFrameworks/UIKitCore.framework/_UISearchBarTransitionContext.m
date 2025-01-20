@interface _UISearchBarTransitionContext
- (_UISearchBarLayout)fromLayout;
- (_UISearchBarLayout)toLayout;
- (void)setFromLayout:(id)a3;
- (void)setToLayout:(id)a3;
@end

@implementation _UISearchBarTransitionContext

- (_UISearchBarLayout)toLayout
{
  return self->_toLayout;
}

- (void)setToLayout:(id)a3
{
}

- (_UISearchBarLayout)fromLayout
{
  return self->_fromLayout;
}

- (void)setFromLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromLayout, 0);
  objc_storeStrong((id *)&self->_toLayout, 0);
}

@end