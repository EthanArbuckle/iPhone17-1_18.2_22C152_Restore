@interface SBAppSwitcherService
+ (id)switcherServiceWithName:(id)a3 viewServiceClassName:(id)a4;
- (NSString)bundleIdentifier;
- (NSString)viewServiceClassName;
- (void)setBundleIdentifier:(id)a3;
- (void)setViewServiceClassName:(id)a3;
@end

@implementation SBAppSwitcherService

+ (id)switcherServiceWithName:(id)a3 viewServiceClassName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SBAppSwitcherService);
  [(SBAppSwitcherService *)v7 setBundleIdentifier:v6];

  [(SBAppSwitcherService *)v7 setViewServiceClassName:v5];
  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)viewServiceClassName
{
  return self->_viewServiceClassName;
}

- (void)setViewServiceClassName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewServiceClassName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end