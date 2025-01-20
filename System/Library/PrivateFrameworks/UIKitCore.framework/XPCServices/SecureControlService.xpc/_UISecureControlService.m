@interface _UISecureControlService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_UISecureControlService)init;
- (void)getSizeToolWithReply:(id)a3;
- (void)getSlotMachineWithReply:(id)a3;
@end

@implementation _UISecureControlService

- (_UISecureControlService)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UISecureControlService;
  v2 = [(_UISecureControlService *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(_UISecureControlSizeTool);
    sizeTool = v2->_sizeTool;
    v2->_sizeTool = v3;

    v5 = (UISSlotMachine *)[objc_alloc((Class)UISSlotMachine) initWithSlotDrawer:v2->_sizeTool options:3];
    slotMachine = v2->_slotMachine;
    v2->_slotMachine = v5;
  }
  return v2;
}

- (void)getSizeToolWithReply:(id)a3
{
}

- (void)getSlotMachineWithReply:(id)a3
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = UISSecureControlServiceInterface();
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotMachine, 0);
  objc_storeStrong((id *)&self->_sizeTool, 0);
}

@end