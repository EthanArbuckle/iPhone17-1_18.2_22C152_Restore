@interface POInternalProtocols
+ (id)interfaceWithInternalProtocol:(id)a3;
@end

@implementation POInternalProtocols

+ (id)interfaceWithInternalProtocol:(id)a3
{
  id v3 = a3;
  if (interfaceWithInternalProtocol__onceToken != -1) {
    dispatch_once(&interfaceWithInternalProtocol__onceToken, &__block_literal_global);
  }
  v4 = [(id)interfaceWithInternalProtocol__protocolCache objectForKey:v3];
  if (!v4)
  {
    v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:v3];
    [(id)interfaceWithInternalProtocol__protocolCache setObject:v4 forKey:v3];
  }
  id v5 = v4;

  return v5;
}

uint64_t __53__POInternalProtocols_interfaceWithInternalProtocol___block_invoke()
{
  interfaceWithInternalProtocol__protocolCache = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

@end