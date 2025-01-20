@interface RMStoreLocalizable
+ (id)_bundle;
+ (id)string:(id)a3;
@end

@implementation RMStoreLocalizable

+ (id)_bundle
{
  if (_bundle_once != -1) {
    dispatch_once(&_bundle_once, &__block_literal_global_13);
  }
  v2 = (void *)_bundle_bundle;
  return v2;
}

uint64_t __29__RMStoreLocalizable__bundle__block_invoke()
{
  _bundle_bundle = [MEMORY[0x263F086E0] mainBundle];
  return MEMORY[0x270F9A758]();
}

+ (id)string:(id)a3
{
  id v4 = a3;
  v5 = [a1 _bundle];
  v6 = [v5 localizedStringForKey:v4 value:0 table:@"Localizable"];

  return v6;
}

@end