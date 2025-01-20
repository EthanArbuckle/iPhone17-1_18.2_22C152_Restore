@interface SystemHealthManager
- (BOOL)isSupportedIPad;
- (BOOL)shouldFilterComponent:(unint64_t)a3;
- (SystemHealthManager)init;
- (void)postComponentStatusEventFor:(unint64_t)a3 status:(unint64_t)a4 withReply:(id)a5;
@end

@implementation SystemHealthManager

- (SystemHealthManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SystemHealthManager;
  v2 = [(SystemHealthManager *)&v8 init];
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    v2->deviceClass = [v3 intValue];

    uint64_t v4 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.mobilerepaird" options:0];
    connectionToService = v2->_connectionToService;
    v2->_connectionToService = (NSXPCConnection *)v4;

    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CA80938];
    [(NSXPCConnection *)v2->_connectionToService setRemoteObjectInterface:v6];

    [(NSXPCConnection *)v2->_connectionToService resume];
  }
  return v2;
}

- (BOOL)shouldFilterComponent:(unint64_t)a3
{
  int deviceClass = self->deviceClass;
  BOOL v4 = deviceClass != 1 || a3 == 12;
  return deviceClass != 3 && v4;
}

- (BOOL)isSupportedIPad
{
  v2 = (void *)MGCopyAnswer();
  BOOL v3 = [v2 intValue] == 3 && AMFDRSealingMapGetEntry() != 0;

  return v3;
}

- (void)postComponentStatusEventFor:(unint64_t)a3 status:(unint64_t)a4 withReply:(id)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  objc_super v8 = (void (**)(id, uint64_t, void *))a5;
  if ([(SystemHealthManager *)self shouldFilterComponent:a3])
  {
    v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08320];
    v20[0] = @"not supported in this mode or device";
    v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v11 = [v9 errorWithDomain:@"com.apple.corerepair" code:5 userInfo:v10];

    uint64_t v12 = 0;
  }
  else
  {
    if (self->deviceClass == 3 && ![(SystemHealthManager *)self isSupportedIPad])
    {
      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v17 = *MEMORY[0x263F08320];
      v18 = @"not supported in this mode or device";
      v14 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      v11 = [v13 errorWithDomain:@"com.apple.corerepair" code:5 userInfo:v14];

      uint64_t v12 = 0;
    }
    else
    {
      v11 = 0;
      uint64_t v12 = 1;
    }
    v15 = [(NSXPCConnection *)self->_connectionToService remoteObjectProxyWithErrorHandler:&unk_26CA7EF30];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = sub_218FF6348;
    v16[3] = &unk_264392DE0;
    v16[4] = self;
    [v15 postComponentStatusEventFor:a3 status:a4 withReply:v16];
  }
  v8[2](v8, v12, v11);
}

- (void).cxx_destruct
{
}

@end