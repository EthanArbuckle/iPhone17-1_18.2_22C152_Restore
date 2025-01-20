@interface RBLaunchdInterface
+ (id)interface;
- (id)copyJobWithLabel:(id)a3 domain:(id)a4;
- (id)copyJobWithPid:(int)a3;
- (id)copyJobsManagedBy:(id)a3 error:(id *)a4;
- (id)currentDomain;
- (id)domainForPid:(int)a3;
- (id)domainForUser:(unsigned int)a3;
- (id)forJob:(id)a3 createInstance:(unsigned __int8)a4[16] properties:(id)a5 error:(id *)a6;
- (id)instancePropertiesFromOverlay:(id)a3;
- (id)jobWithPlist:(id)a3;
- (id)jobWithPlist:(id)a3 domain:(id)a4;
- (id)propertiesForJob:(id)a3 error:(id *)a4;
- (id)propertiesForPid:(int)a3 error:(id *)a4;
- (id)submitExtension:(id)a3 overlay:(id)a4 domain:(id)a5 error:(id *)a6;
@end

@implementation RBLaunchdInterface

- (id)jobWithPlist:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F252A8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithPlist:v4];

  return v5;
}

- (id)submitExtension:(id)a3 overlay:(id)a4 domain:(id)a5 error:(id *)a6
{
  return (id)[MEMORY[0x263F252A8] submitExtension:a3 overlay:a4 domain:a5 error:a6];
}

- (id)domainForPid:(int)a3
{
  return (id)[MEMORY[0x263F252A0] domainForPid:*(void *)&a3];
}

- (id)instancePropertiesFromOverlay:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v5 = [v3 objectForKeyedSubscript:@"XPCService"];
  v6 = [v5 objectForKeyedSubscript:@"_SandboxProfile"];
  [v4 setSandboxProfile:v6];

  v7 = [v3 objectForKeyedSubscript:@"XPCService"];

  v8 = [v7 objectForKeyedSubscript:@"EnvironmentVariables"];
  [v4 setEnvironmentVariables:v8];

  return v4;
}

- (id)forJob:(id)a3 createInstance:(unsigned __int8)a4[16] properties:(id)a5 error:(id *)a6
{
  return (id)[a3 createInstance:a4 properties:a5 error:a6];
}

- (id)copyJobWithPid:(int)a3
{
  return (id)[MEMORY[0x263F252A8] copyJobWithPid:*(void *)&a3];
}

+ (id)interface
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__RBLaunchdInterface_interface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (interface_onceToken != -1) {
    dispatch_once(&interface_onceToken, block);
  }
  v2 = (void *)interface_singleton;
  return v2;
}

void __31__RBLaunchdInterface_interface__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___RBLaunchdInterface;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_alloc), "init");
  v2 = (void *)interface_singleton;
  interface_singleton = v1;
}

- (id)domainForUser:(unsigned int)a3
{
  return (id)[MEMORY[0x263F252A0] domainForUser:*(void *)&a3];
}

- (id)currentDomain
{
  return (id)[MEMORY[0x263F252A0] currentDomain];
}

- (id)jobWithPlist:(id)a3 domain:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F252A8];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithPlist:v7 domain:v6];

  return v8;
}

- (id)copyJobWithLabel:(id)a3 domain:(id)a4
{
  return (id)[MEMORY[0x263F252A8] copyJobWithLabel:a3 domain:a4];
}

- (id)copyJobsManagedBy:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x263F252A8] copyJobsManagedBy:a3 error:a4];
}

- (id)propertiesForPid:(int)a3 error:(id *)a4
{
  return (id)[MEMORY[0x263F25298] propertiesForPid:*(void *)&a3 error:a4];
}

- (id)propertiesForJob:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x263F25298] propertiesForJob:a3 error:a4];
}

@end