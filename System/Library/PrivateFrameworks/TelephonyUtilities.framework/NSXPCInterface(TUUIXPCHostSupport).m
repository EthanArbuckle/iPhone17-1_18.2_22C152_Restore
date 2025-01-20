@interface NSXPCInterface(TUUIXPCHostSupport)
+ (id)hostConnectionInterface;
+ (id)remoteObjectInterface;
- (void)setAllowedClassesForHostProtocol;
@end

@implementation NSXPCInterface(TUUIXPCHostSupport)

+ (id)hostConnectionInterface
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED29208];
  [v0 setAllowedClassesForHostProtocol];

  return v0;
}

+ (id)remoteObjectInterface
{
  v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED30E58];
  [v0 setAllowedClassesForClientInterface];

  return v0;
}

- (void)setAllowedClassesForHostProtocol
{
  id v2 = [MEMORY[0x1E4F1CAD0] set];
  [a1 setClasses:v2 forSelector:sel_shouldHostHandleMRCommand_completion_ argumentIndex:1 ofReply:1];
}

@end