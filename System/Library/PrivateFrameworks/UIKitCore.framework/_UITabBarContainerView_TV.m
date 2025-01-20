@interface _UITabBarContainerView_TV
- (UITabBar)tabBar;
- (_UITabBarContainerView_TV)initWithTabBar:(id)a3;
- (id)preferredFocusEnvironments;
@end

@implementation _UITabBarContainerView_TV

- (_UITabBarContainerView_TV)initWithTabBar:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITabBarContainerView_TV;
  v6 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabBar, a3);
    [(UIView *)v7 addSubview:v5];
  }

  return v7;
}

- (id)preferredFocusEnvironments
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(_UITabBarContainerView_TV *)self tabBar];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (UITabBar)tabBar
{
  return self->_tabBar;
}

- (void).cxx_destruct
{
}

@end