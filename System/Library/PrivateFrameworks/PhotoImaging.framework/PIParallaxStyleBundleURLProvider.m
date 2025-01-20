@interface PIParallaxStyleBundleURLProvider
- (PIParallaxStyleBundleURLProvider)init;
- (id)urlForIdentifier:(id)a3;
@end

@implementation PIParallaxStyleBundleURLProvider

- (void).cxx_destruct
{
}

- (id)urlForIdentifier:(id)a3
{
  return [(NSBundle *)self->_bundle URLForResource:a3 withExtension:@"plist"];
}

- (PIParallaxStyleBundleURLProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)PIParallaxStyleBundleURLProvider;
  v2 = [(PIParallaxStyleBundleURLProvider *)&v6 init];
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  bundle = v2->_bundle;
  v2->_bundle = (NSBundle *)v3;

  return v2;
}

@end