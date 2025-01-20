@interface MCDTabBarController
- (id)viewControllerForIdentifier:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation MCDTabBarController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MCDTabBarController;
  [(MCDTabBarController *)&v4 viewDidLoad];
  v3 = [(MCDTabBarController *)self tabBar];
  [v3 setAccessibilityIdentifier:@"CPTabBar"];
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[NSUserDefaults standardUserDefaults];
  v8 = [v7 objectForKey:@"carLastSelectedTabIdentifier"];

  v11.receiver = self;
  v11.super_class = (Class)MCDTabBarController;
  [(MCDTabBarController *)&v11 setViewControllers:v6 animated:v4];

  if (v8)
  {
    v9 = [(MCDTabBarController *)self viewControllerForIdentifier:v8];
    if (v9)
    {
      [(MCDTabBarController *)self setSelectedViewController:v9];
      v10 = [v9 title];
      [(MCDTabBarController *)self setTitle:v10];
    }
    else
    {
      [(MCDTabBarController *)self setSelectedIndex:0];
    }
  }
}

- (id)viewControllerForIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(MCDTabBarController *)self viewControllers];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 musicTabIdentifier];
        unsigned int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end