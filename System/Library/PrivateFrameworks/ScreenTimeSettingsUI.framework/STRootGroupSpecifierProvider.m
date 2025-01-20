@interface STRootGroupSpecifierProvider
+ (id)providerWithCoordinator:(id)a3;
- (STRootViewModelCoordinator)coordinator;
- (void)invalidate;
- (void)setCoordinator:(id)a3;
@end

@implementation STRootGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCoordinator:v3];

  return v4;
}

- (void)invalidate
{
  [(STRootGroupSpecifierProvider *)self setCoordinator:0];
  v3.receiver = self;
  v3.super_class = (Class)STRootGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v3 invalidate];
}

- (STRootViewModelCoordinator)coordinator
{
  return (STRootViewModelCoordinator *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end