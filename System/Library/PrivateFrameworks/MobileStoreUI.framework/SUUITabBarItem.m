@interface SUUITabBarItem
- (BOOL)alwaysCreatesRootViewController;
- (BOOL)isEqual:(id)a3;
- (Class)rootViewControllerClass;
- (NSString)metricsIdentifier;
- (NSString)tabIdentifier;
- (NSURL)rootURL;
- (SUUITabBarItem)init;
- (SUUITabBarItem)initWithTabIdentifier:(id)a3;
- (UIColor)userInterfaceTintColor;
- (UITabBarItem)underlyingTabBarItem;
- (UIViewController)customRootViewController;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)barTintStyle;
- (unint64_t)hash;
- (void)setAlwaysCreatesRootViewController:(BOOL)a3;
- (void)setBarTintStyle:(int64_t)a3;
- (void)setCustomRootViewController:(id)a3;
- (void)setMetricsIdentifier:(id)a3;
- (void)setRootURL:(id)a3;
- (void)setRootViewControllerClass:(Class)a3;
- (void)setUnderlyingTabBarItem:(id)a3;
- (void)setUserInterfaceTintColor:(id)a3;
@end

@implementation SUUITabBarItem

- (NSString)tabIdentifier
{
  return self->_tabIdentifier;
}

- (void)setBarTintStyle:(int64_t)a3
{
  self->_barTintStyle = a3;
}

- (void)setUserInterfaceTintColor:(id)a3
{
}

- (void)setUnderlyingTabBarItem:(id)a3
{
}

- (void)setRootViewControllerClass:(Class)a3
{
}

- (UIViewController)customRootViewController
{
  return self->_customRootViewController;
}

- (UITabBarItem)underlyingTabBarItem
{
  return self->_underlyingTabBarItem;
}

- (BOOL)alwaysCreatesRootViewController
{
  return self->_alwaysCreatesRootViewController;
}

- (Class)rootViewControllerClass
{
  return self->_rootViewControllerClass;
}

- (SUUITabBarItem)initWithTabIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUITabBarItem;
  v5 = [(SUUITabBarItem *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    tabIdentifier = v5->_tabIdentifier;
    v5->_tabIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)setRootURL:(id)a3
{
}

- (int64_t)barTintStyle
{
  return self->_barTintStyle;
}

- (UIColor)userInterfaceTintColor
{
  return self->_userInterfaceTintColor;
}

- (void)setAlwaysCreatesRootViewController:(BOOL)a3
{
  self->_alwaysCreatesRootViewController = a3;
}

- (SUUITabBarItem)init
{
  return [(SUUITabBarItem *)self initWithTabIdentifier:0];
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SUUITabBarItem;
  id v4 = [(SUUITabBarItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"[%@ %@]", v4, self->_tabIdentifier];

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_tabIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_super v7 = [(SUUITabBarItem *)self tabIdentifier];
    v8 = [v4 tabIdentifier];
    char v6 = [v7 isEqualToString:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(unsigned char *)(v5 + 8) = self->_alwaysCreatesRootViewController;
  *(void *)(v5 + 16) = self->_barTintStyle;
  objc_storeStrong((id *)(v5 + 24), self->_customRootViewController);
  uint64_t v6 = [(NSString *)self->_metricsIdentifier copyWithZone:a3];
  objc_super v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSURL *)self->_rootURL copyWithZone:a3];
  objc_super v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  objc_storeStrong((id *)(v5 + 48), self->_rootViewControllerClass);
  uint64_t v10 = [(NSString *)self->_tabIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  objc_storeStrong((id *)(v5 + 64), self->_underlyingTabBarItem);
  objc_storeStrong((id *)(v5 + 72), self->_userInterfaceTintColor);
  return (id)v5;
}

- (void)setCustomRootViewController:(id)a3
{
}

- (NSString)metricsIdentifier
{
  return self->_metricsIdentifier;
}

- (void)setMetricsIdentifier:(id)a3
{
}

- (NSURL)rootURL
{
  return self->_rootURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceTintColor, 0);
  objc_storeStrong((id *)&self->_underlyingTabBarItem, 0);
  objc_storeStrong((id *)&self->_tabIdentifier, 0);
  objc_storeStrong((id *)&self->_rootViewControllerClass, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
  objc_storeStrong((id *)&self->_metricsIdentifier, 0);
  objc_storeStrong((id *)&self->_customRootViewController, 0);
}

@end