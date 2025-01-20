@interface FBDisplayManager(SpringBoard)
+ (id)sb_secureMainConfiguration;
+ (id)sb_secureMainIdentity;
@end

@implementation FBDisplayManager(SpringBoard)

+ (id)sb_secureMainIdentity
{
  v1 = objc_msgSend(a1, "sb_secureMainConfiguration");
  v2 = [v1 identity];

  return v2;
}

+ (id)sb_secureMainConfiguration
{
  if (sb_secureMainConfiguration___once != -1) {
    dispatch_once(&sb_secureMainConfiguration___once, &__block_literal_global_390);
  }
  v0 = (void *)sb_secureMainConfiguration___configuration;
  return v0;
}

@end