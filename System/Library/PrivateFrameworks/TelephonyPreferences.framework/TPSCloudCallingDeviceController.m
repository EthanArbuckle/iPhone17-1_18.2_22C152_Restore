@interface TPSCloudCallingDeviceController
- (BOOL)enabled;
- (NSArray)devices;
- (TPSCloudCallingDeviceController)init;
- (TPSCloudCallingDeviceControllerDelegate)delegate;
- (void)didChangeCloudCallingDevices;
- (void)setDelegate:(id)a3;
- (void)setDevices:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation TPSCloudCallingDeviceController

- (TPSCloudCallingDeviceController)init
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCloudCallingDeviceController;
  v2 = [(TPSCloudCallingDeviceController *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FADA88] cloudCallingDevices];
    uint64_t v4 = [v3 copy];
    devices = v2->_devices;
    v2->_devices = (NSArray *)v4;

    [MEMORY[0x1E4FADA88] addDelegate:v2 queue:MEMORY[0x1E4F14428]];
  }
  return v2;
}

- (void)setDevices:(id)a3
{
  v5 = (NSArray *)a3;
  p_devices = &self->_devices;
  if (self->_devices != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)p_devices, a3);
    objc_super v7 = [(TPSCloudCallingDeviceController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(TPSCloudCallingDeviceController *)self delegate];
      [v9 cloudCallingDeviceController:self didChangeDevices:v10];
    }
  }
  MEMORY[0x1F4181820](p_devices);
}

- (void)didChangeCloudCallingDevices
{
  v3 = TPSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1E4DD4000, v3, OS_LOG_TYPE_DEFAULT, "Cloud calling devices have changed. Refreshing cached list of devices.", v6, 2u);
  }

  uint64_t v4 = [MEMORY[0x1E4FADA88] cloudCallingDevices];
  v5 = (void *)[v4 copy];
  [(TPSCloudCallingDeviceController *)self setDevices:v5];
}

- (TPSCloudCallingDeviceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TPSCloudCallingDeviceControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end