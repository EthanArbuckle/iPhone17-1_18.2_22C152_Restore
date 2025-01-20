@interface NSXPCInterface(TUUIXPCClientSupport)
+ (id)clientInterface;
+ (id)hostInterface;
- (void)setAllowedClassesForHostProtocol;
@end

@implementation NSXPCInterface(TUUIXPCClientSupport)

+ (id)hostInterface
{
  if (hostInterface_onceToken != -1) {
    dispatch_once(&hostInterface_onceToken, &__block_literal_global_17);
  }
  v0 = (void *)hostInterface_interface;

  return v0;
}

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1) {
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_58_0);
  }
  v0 = (void *)clientInterface_interface;

  return v0;
}

- (void)setAllowedClassesForHostProtocol
{
  id v2 = [MEMORY[0x1E4F1CAD0] set];
  [a1 setClasses:v2 forSelector:sel_shouldHostHandleMRCommand_completion_ argumentIndex:1 ofReply:1];
}

@end