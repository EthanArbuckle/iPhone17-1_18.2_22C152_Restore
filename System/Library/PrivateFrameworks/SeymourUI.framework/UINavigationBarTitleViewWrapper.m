@interface UINavigationBarTitleViewWrapper
- (_UINavigationBarTitleView)navBarTitleView;
- (void)setNavBarTitleView:(id)a3;
- (void)setTitleView:(id)a3;
@end

@implementation UINavigationBarTitleViewWrapper

- (void)setTitleView:(id)a3
{
}

- (_UINavigationBarTitleView)navBarTitleView
{
  return self->_navBarTitleView;
}

- (void)setNavBarTitleView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarTitleView, 0);

  objc_storeStrong((id *)&self->_titleView, 0);
}

@end