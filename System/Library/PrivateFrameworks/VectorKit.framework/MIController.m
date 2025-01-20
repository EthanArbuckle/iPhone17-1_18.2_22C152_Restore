@interface MIController
+ (id)sharedController;
- (BOOL)isActive;
- (MIController)init;
- (void)activateController:(id)a3;
- (void)deactivateController;
- (void)decodeDebugTreeData:(id)a3;
- (void)handleXPCEvent:(id)a3;
- (void)recievedData:(id)a3;
- (void)sendData:(id)a3;
@end

@implementation MIController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)decodeDebugTreeData:(id)a3
{
  id v11 = a3;
  v4 = objc_alloc_init(VKDebugTree);
  v5 = [v11 objectForKey:@"Options"];
  [(VKDebugTree *)v4 setOptions:v5];
  [(VKDebugTree *)v4 populateData:self->_mapView];
  v6 = [(VKDebugTree *)v4 serializeTree];
  v7 = [v11 objectForKey:@"UUID"];
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  [v8 setObject:v6 forKey:@"Tree Data"];
  if (v7) {
    [v8 setObject:v7 forKey:@"UUID"];
  }
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  [v9 setObject:@"DebugTree" forKey:@"Type"];
  [v9 setObject:v8 forKey:@"Data"];
  v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v9 format:200 options:0 error:0];
  [(MIController *)self sendData:v10];
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  if (self->_connection)
  {
    id v8 = v4;
    id v5 = v4;
    CFDataRef v6 = CFDataCreate(0, (const UInt8 *)[v5 bytes], objc_msgSend(v5, "length"));
    v7 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    xpc_connection_send_message(self->_connection, v7);
    CFRelease(v6);

    id v4 = v8;
  }
}

- (void)recievedData:(id)a3
{
  id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:0];
  if (v4)
  {
    id v7 = v4;
    id v5 = [v4 objectForKey:@"Type"];
    CFDataRef v6 = [v7 objectForKey:@"Data"];
    if ([v5 isEqualToString:@"DebugTree"]) {
      [(MIController *)self decodeDebugTreeData:v6];
    }

    id v4 = v7;
  }
}

- (void)handleXPCEvent:(id)a3
{
  id v7 = a3;
  uint64_t v4 = MEMORY[0x1A623A580]();
  if (v4 == MEMORY[0x1E4F14590])
  {
    id v6 = (id)_CFXPCCreateCFObjectFromXPCMessage();
    [(MIController *)self recievedData:v6];
    CFRelease(v6);
  }
  else if (v4 == MEMORY[0x1E4F145A8] && self->_isActive)
  {
    id v5 = (void *)MEMORY[0x1A623A570](v7);
    free(v5);
    [(MIController *)self deactivateController];
  }
}

- (void)deactivateController
{
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    uint64_t v4 = self->_connection;
    self->_connection = 0;
  }
  self->_isActive = 0;
}

- (void)activateController:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_mapView, a3);
  mach_service = xpc_connection_create_mach_service("com.apple.mapinspectord", (dispatch_queue_t)self->_queue, 2uLL);
  connection = self->_connection;
  self->_connection = mach_service;

  id v8 = self->_connection;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __35__MIController_activateController___block_invoke;
  handler[3] = &unk_1E5A948C0;
  handler[4] = self;
  xpc_connection_set_event_handler(v8, handler);
  xpc_connection_resume(self->_connection);
  v9 = [MEMORY[0x1E4F28F98] dataWithPropertyList:&unk_1EF5BB6A8 format:200 options:0 error:0];
  [(MIController *)self sendData:v9];
  self->_isActive = 1;
}

uint64_t __35__MIController_activateController___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleXPCEvent:a2];
}

- (MIController)init
{
  v8.receiver = self;
  v8.super_class = (Class)MIController;
  v2 = [(MIController *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Maps.MIController", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    connection = v2->_connection;
    v2->_connection = 0;

    v2->_isActive = 0;
  }
  return v2;
}

+ (id)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MIController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MIController sharedController]::onceToken != -1) {
    dispatch_once(&+[MIController sharedController]::onceToken, block);
  }
  v2 = (void *)+[MIController sharedController]::sharedController;
  return v2;
}

void __32__MIController_sharedController__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[MIController sharedController]::sharedController;
  +[MIController sharedController]::sharedController = (uint64_t)v1;
}

@end