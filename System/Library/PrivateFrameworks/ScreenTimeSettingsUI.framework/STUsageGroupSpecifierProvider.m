@interface STUsageGroupSpecifierProvider
+ (id)providerWithCoordinator:(id)a3;
- (STRootViewModelCoordinator)coordinator;
- (void)invalidate;
- (void)setCoordinator:(id)a3;
@end

@implementation STUsageGroupSpecifierProvider

+ (id)providerWithCoordinator:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setCoordinator:v3];

  return v4;
}

- (void)invalidate
{
  [(STUsageGroupSpecifierProvider *)self setCoordinator:0];
  v3.receiver = self;
  v3.super_class = (Class)STUsageGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v3 invalidate];
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end