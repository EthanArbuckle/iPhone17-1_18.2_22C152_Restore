@interface NUArticleViewStyler
- (NUArticleViewStyler)initWithBackgroundColor:(id)a3 topBackgroundColor:(id)a4;
- (UIColor)mainBackgroundColor;
- (UIColor)tabBarTintColor;
- (UIColor)toolbarTintColor;
- (UIColor)topContentColor;
- (int64_t)statusBarStyle;
- (int64_t)statusBarStyleForBackgroundColor:(id)a3;
- (int64_t)topBackgroundStatusBarStyle;
- (void)setTabBarTintColor:(id)a3;
- (void)setToolbarTintColor:(id)a3;
- (void)styleTabBar:(id)a3;
- (void)styleToolbar:(id)a3;
- (void)unstyleTabBar:(id)a3 overrideRestoreColor:(id)a4;
- (void)unstyleToolbar:(id)a3 overrideRestoreColor:(id)a4;
@end

@implementation NUArticleViewStyler

- (NUArticleViewStyler)initWithBackgroundColor:(id)a3 topBackgroundColor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUArticleViewStyler;
  v9 = [(NUArticleViewStyler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mainBackgroundColor, a3);
    objc_storeStrong((id *)&v10->_topContentColor, a4);
    v10->_statusBarStyle = [(NUArticleViewStyler *)v10 statusBarStyleForBackgroundColor:v7];
  }

  return v10;
}

- (void)styleTabBar:(id)a3
{
  id v6 = a3;
  v4 = [(NUArticleViewStyler *)self tabBarTintColor];
  if (!v4)
  {
    if ([(NUArticleViewStyler *)self statusBarStyle] != 1) {
      goto LABEL_5;
    }
    v5 = [v6 barTintColor];
    [(NUArticleViewStyler *)self setTabBarTintColor:v5];

    v4 = [(NUArticleViewStyler *)self mainBackgroundColor];
    [v6 setBarTintColor:v4];
  }

LABEL_5:
}

- (void)unstyleTabBar:(id)a3 overrideRestoreColor:(id)a4
{
  id v10 = a3;
  unint64_t v6 = (unint64_t)a4;
  uint64_t v7 = [(NUArticleViewStyler *)self tabBarTintColor];
  unint64_t v8 = v6 | v7;

  if (v8)
  {
    if (v6)
    {
      [v10 setBarTintColor:v6];
    }
    else
    {
      v9 = [(NUArticleViewStyler *)self tabBarTintColor];
      [v10 setBarTintColor:v9];
    }
    [(NUArticleViewStyler *)self setTabBarTintColor:0];
  }
}

- (void)styleToolbar:(id)a3
{
  id v6 = a3;
  v4 = [(NUArticleViewStyler *)self toolbarTintColor];
  if (!v4)
  {
    if ([(NUArticleViewStyler *)self statusBarStyle] != 1) {
      goto LABEL_5;
    }
    v5 = [v6 barTintColor];
    [(NUArticleViewStyler *)self setToolbarTintColor:v5];

    v4 = [(NUArticleViewStyler *)self mainBackgroundColor];
    [v6 setBarTintColor:v4];
  }

LABEL_5:
}

- (void)unstyleToolbar:(id)a3 overrideRestoreColor:(id)a4
{
  id v10 = a3;
  unint64_t v6 = (unint64_t)a4;
  uint64_t v7 = [(NUArticleViewStyler *)self toolbarTintColor];
  unint64_t v8 = v6 | v7;

  if (v8)
  {
    if (v6)
    {
      [v10 setBarTintColor:v6];
    }
    else
    {
      v9 = [(NUArticleViewStyler *)self toolbarTintColor];
      [v10 setBarTintColor:v9];
    }
    [(NUArticleViewStyler *)self setToolbarTintColor:0];
  }
}

- (int64_t)topBackgroundStatusBarStyle
{
  v3 = self->_topContentColor;
  if (v3) {
    int64_t v4 = [(NUArticleViewStyler *)self statusBarStyleForBackgroundColor:v3];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)statusBarStyleForBackgroundColor:(id)a3
{
  uint64_t v7 = 0;
  double v5 = 0.0;
  uint64_t v6 = 0;
  uint64_t v4 = 0;
  [a3 getHue:&v7 saturation:&v6 brightness:&v5 alpha:&v4];
  return v5 < 0.7;
}

- (UIColor)mainBackgroundColor
{
  return self->_mainBackgroundColor;
}

- (UIColor)topContentColor
{
  return self->_topContentColor;
}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

- (UIColor)tabBarTintColor
{
  return self->_tabBarTintColor;
}

- (void)setTabBarTintColor:(id)a3
{
}

- (UIColor)toolbarTintColor
{
  return self->_toolbarTintColor;
}

- (void)setToolbarTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbarTintColor, 0);
  objc_storeStrong((id *)&self->_tabBarTintColor, 0);
  objc_storeStrong((id *)&self->_topContentColor, 0);

  objc_storeStrong((id *)&self->_mainBackgroundColor, 0);
}

@end