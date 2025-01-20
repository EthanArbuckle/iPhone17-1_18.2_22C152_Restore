@interface NSXPCInterface(ICSystemPaperExtension)
+ (id)ic_extensionInterface;
+ (id)ic_hostInterface;
@end

@implementation NSXPCInterface(ICSystemPaperExtension)

+ (id)ic_extensionInterface
{
  if (ic_extensionInterface_onceToken != -1) {
    dispatch_once(&ic_extensionInterface_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)ic_extensionInterface_extensionInterface;

  return v0;
}

+ (id)ic_hostInterface
{
  if (ic_hostInterface_onceToken != -1) {
    dispatch_once(&ic_hostInterface_onceToken, &__block_literal_global_48);
  }
  v0 = (void *)ic_hostInterface_hostInterface;

  return v0;
}

@end