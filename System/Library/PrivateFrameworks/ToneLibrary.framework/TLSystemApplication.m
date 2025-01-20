@interface TLSystemApplication
+ (TLSystemApplication)defaultSystemApplication;
- (NSString)bundleIdentifier;
- (NSString)name;
- (TLSystemApplication)initWithBundleIdentifier:(id)a3 name:(id)a4;
@end

@implementation TLSystemApplication

+ (TLSystemApplication)defaultSystemApplication
{
  if (defaultSystemApplication__TLSystemApplicationSharedInstanceOnceToken != -1) {
    dispatch_once(&defaultSystemApplication__TLSystemApplicationSharedInstanceOnceToken, &__block_literal_global_0);
  }
  v2 = (void *)defaultSystemApplication__TLSystemApplicationSharedInstance;

  return (TLSystemApplication *)v2;
}

uint64_t __47__TLSystemApplication_defaultSystemApplication__block_invoke()
{
  defaultSystemApplication__TLSystemApplicationSharedInstance = [[TLSystemApplication alloc] initWithBundleIdentifier:@"com.apple.springboard" name:@"SpringBoard"];

  return MEMORY[0x1F41817F8]();
}

- (TLSystemApplication)initWithBundleIdentifier:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TLSystemApplication;
  v8 = [(TLSystemApplication *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    name = v8->_name;
    v8->_name = (NSString *)v11;
  }
  return v8;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end