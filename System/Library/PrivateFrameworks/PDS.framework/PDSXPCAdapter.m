@interface PDSXPCAdapter
+ (BOOL)disableXPC;
+ (id)_sharedInstance;
+ (id)defaultConnectionVendor;
+ (void)setDisableXPC:(BOOL)a3;
- (id)_init;
- (id)connectionForMachService:(id)a3;
- (id)interfaceWithProtocol:(id)a3;
@end

@implementation PDSXPCAdapter

- (id)interfaceWithProtocol:(id)a3
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:a3];
}

+ (BOOL)disableXPC
{
  return _XPCDisabled;
}

+ (void)setDisableXPC:(BOOL)a3
{
  _XPCDisabled = a3;
}

+ (id)defaultConnectionVendor
{
  if (_XPCDisabled)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:a1 file:@"PDSXPCAdapter.m" lineNumber:41 description:@"XPC was disabled!"];
  }
  return (id)[a1 _sharedInstance];
}

+ (id)_sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__PDSXPCAdapter__sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedInstance_onceToken != -1) {
    dispatch_once(&_sharedInstance_onceToken, block);
  }
  v2 = (void *)_sharedInstance_sharedInstance;
  return v2;
}

uint64_t __32__PDSXPCAdapter__sharedInstance__block_invoke(uint64_t a1)
{
  _sharedInstance_sharedInstance = [objc_alloc(*(Class *)(a1 + 32)) _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PDSXPCAdapter;
  return [(PDSXPCAdapter *)&v3 init];
}

- (id)connectionForMachService:(id)a3
{
  objc_super v3 = (objc_class *)MEMORY[0x263F08D68];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithMachServiceName:v4 options:0];

  return v5;
}

@end