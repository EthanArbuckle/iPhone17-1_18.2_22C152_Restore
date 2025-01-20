@interface MKUSBDevice
- (MKUSBDevice)init;
- (MKUSBDeviceDelegate)delegate;
- (__IOUSBDeviceDescription)copyCurrentDescription:(__IOUSBDeviceController *)a3;
- (__IOUSBDeviceDescription)createMigrationDescription:(__IOUSBDeviceController *)a3;
- (id)endpoints;
- (int)read:(char *)a3 fromEndpoint:(id)a4;
- (int)write:(char *)a3 length:(int)a4 toEndpoint:(id)a5;
- (void)_cleanup;
- (void)_restore;
- (void)cancel;
- (void)cleanup;
- (void)configure;
- (void)dealloc;
- (void)interfaceDidChangeState:(int)a3;
- (void)restore;
- (void)run;
- (void)setDelegate:(id)a3;
@end

@implementation MKUSBDevice

- (MKUSBDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)MKUSBDevice;
  v2 = [(MKUSBDevice *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    endpoints = v2->_endpoints;
    v2->_endpoints = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(MKUSBDevice *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MKUSBDevice;
  [(MKUSBDevice *)&v3 dealloc];
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  runloop = v2->_runloop;
  if (runloop)
  {
    CFRunLoopStop(runloop);
    v2->_runloop = 0;
  }
  [(NSThread *)v2->_thread cancel];
  objc_sync_exit(v2);

  [(MKUSBDevice *)v2 restore];
  [(MKUSBDevice *)v2 cleanup];
  obj = v2;
  objc_sync_enter(obj);
  id WeakRetained = objc_loadWeakRetained(obj + 8);
  [WeakRetained deviceDidCancel:obj];

  [obj setDelegate:0];
  objc_sync_exit(obj);
}

- (void)run
{
  objc_super v3 = (NSThread *)[objc_alloc(MEMORY[0x263F08B88]) initWithTarget:self selector:sel_configure object:0];
  thread = self->_thread;
  self->_thread = v3;

  v5 = self->_thread;
  [(NSThread *)v5 start];
}

- (id)endpoints
{
  objc_super v3 = self->_endpoints;
  objc_sync_enter(v3);
  if (![(NSMutableArray *)self->_endpoints count])
  {
    int v13 = 0;
    uint64_t endpoints = migrationkit::usb::device::interface::get_endpoints((migrationkit::usb::device::interface *)self->_interface, &v13);
    if (endpoints)
    {
      if (v13 >= 1)
      {
        for (uint64_t i = 0; i < v13; ++i)
        {
          uint64_t v6 = *(void *)(endpoints + 8 * i);
          v7 = self->_endpoints;
          v8 = [MKUSBEndpoint alloc];
          v9 = [MEMORY[0x263F08D40] valueWithPointer:v6];
          v10 = [(MKUSBEndpoint *)v8 initWithValue:v9];
          [(NSMutableArray *)v7 addObject:v10];
        }
      }
    }
  }
  v11 = self->_endpoints;
  objc_sync_exit(v3);

  return v11;
}

- (int)read:(char *)a3 fromEndpoint:(id)a4
{
  id v6 = a4;
  v7 = [v6 value];
  v8 = (void *)[v7 pointerValue];

  LODWORD(a3) = migrationkit::usb::device::interface::read((uint64_t)self->_interface, v8, (void **)a3);
  return (int)a3;
}

- (int)write:(char *)a3 length:(int)a4 toEndpoint:(id)a5
{
  id v8 = a5;
  v9 = [v8 value];
  uint64_t v10 = [v9 pointerValue];

  int v11 = migrationkit::usb::device::interface::write((uint64_t)self->_interface, v10, a3, a4);
  return v11;
}

- (void)configure
{
  v12[1] = *MEMORY[0x263EF8340];
  if (IOUSBDeviceControllerCreate())
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v8 = [(MKUSBDevice *)self copyCurrentDescription:self->_controller];
    self->_previousDescription = v8;
    if (v8)
    {
      v9 = [(MKUSBDevice *)self createMigrationDescription:self->_controller];
      self->_migrationDescription = v9;
      if (v9) {
        migrationkit::usb::device::interface::create((migrationkit::usb::device::interface *)self->_controller, v10);
      }
      uint64_t v3 = 3;
    }
    else
    {
      uint64_t v3 = 2;
    }
  }
  v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F08320];
  v12[0] = @"MKUSBDevice could not initialize because an underlying issue occurred unexpectedly.";
  v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v6 = [v4 errorWithDomain:@"MKUSBDeviceErrorDomain" code:v3 userInfo:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained device:self didFail:v6];

  [(MKUSBDevice *)self setDelegate:0];
  [(MKUSBDevice *)self cancel];
}

- (void)restore
{
  obj = self;
  objc_sync_enter(obj);
  [(MKUSBDevice *)obj _restore];
  objc_sync_exit(obj);
}

- (void)_restore
{
  if (self->_controller && self->_previousDescription)
  {
    if (!IOUSBDeviceControllerSetDescription()) {
      IOUSBDeviceControllerGoOffAndOnBus();
    }
    [(MKUSBDevice *)self cleanup];
  }
}

- (void)cleanup
{
  obj = self;
  objc_sync_enter(obj);
  [(MKUSBDevice *)obj _cleanup];
  objc_sync_exit(obj);
}

- (void)_cleanup
{
  interface = (__CFRunLoop **)self->_interface;
  if (interface)
  {
    migrationkit::usb::device::interface::stop(interface);
    migrationkit::usb::device::interface::close((migrationkit::usb::device::interface *)self->_interface);
    v4 = self->_interface;
    if (v4) {
      MEMORY[0x230F5BC60](v4, 0x10A0C403D4A21E0);
    }
    self->_interface = 0;
  }
  migrationDescription = self->_migrationDescription;
  if (migrationDescription)
  {
    CFRelease(migrationDescription);
    self->_migrationDescription = 0;
  }
  previousDescription = self->_previousDescription;
  if (previousDescription)
  {
    CFRelease(previousDescription);
    self->_previousDescription = 0;
  }
  controller = self->_controller;
  if (controller)
  {
    CFRelease(controller);
    self->_controller = 0;
  }
}

- (__IOUSBDeviceDescription)copyCurrentDescription:(__IOUSBDeviceController *)a3
{
  uint64_t v3 = (__IOUSBDeviceDescription *)IOUSBDeviceDescriptionCreateFromController();
  if (v3) {
    IOUSBDeviceDescriptionSetAllowOverride();
  }
  return v3;
}

- (__IOUSBDeviceDescription)createMigrationDescription:(__IOUSBDeviceController *)a3
{
  uint64_t v3 = (__IOUSBDeviceDescription *)IOUSBDeviceDescriptionCreateFromController();
  if (v3)
  {
    IOUSBDeviceDescriptionRemoveAllConfigurations();
    if (IOUSBDeviceDescriptionAppendConfiguration()
      || IOUSBDeviceDescriptionAppendInterfaceToConfiguration())
    {
      CFRelease(v3);
      return 0;
    }
    else
    {
      IOUSBDeviceDescriptionSetAllowOverride();
      IOUSBDeviceDescriptionSetVendorID();
      IOUSBDeviceDescriptionSetProductID();
    }
  }
  return v3;
}

- (void)interfaceDidChangeState:(int)a3
{
  unsigned __int8 v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained device:self didChangeState:v3];
}

- (MKUSBDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MKUSBDeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_thread, 0);
}

@end