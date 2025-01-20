@interface SVXVirtualDeviceManager
- (SVXVirtualDevice)hostVirtualDevice;
- (SVXVirtualDeviceManager)initWithRemoraVirtualDeviceManager:(id)a3;
- (SVXVirtualDeviceManager)initWithRemoraVirtualDeviceManager:(id)a3 hostVirtualDevice:(id)a4;
- (void)getVirtualDeviceForActivationContext:(id)a3 completion:(id)a4;
- (void)getVirtualDeviceForInstanceInfo:(id)a3 completion:(id)a4;
@end

@implementation SVXVirtualDeviceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostVirtualDevice, 0);

  objc_storeStrong((id *)&self->_remoraVirtualDeviceManager, 0);
}

- (SVXVirtualDevice)hostVirtualDevice
{
  return self->_hostVirtualDevice;
}

- (void)getVirtualDeviceForInstanceInfo:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, SVXVirtualDevice *))a4 + 2))(a4, self->_hostVirtualDevice);
  }
}

- (void)getVirtualDeviceForActivationContext:(id)a3 completion:(id)a4
{
  id v8 = a3;
  v6 = (void (**)(id, SVXVirtualDevice *))a4;
  if (v6)
  {
    if ([v8 source] == 11)
    {
      v7 = [v8 deviceID];
      if (v7) {
    }
      }
    v6[2](v6, self->_hostVirtualDevice);
  }
}

- (SVXVirtualDeviceManager)initWithRemoraVirtualDeviceManager:(id)a3 hostVirtualDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXVirtualDeviceManager;
  v9 = [(SVXVirtualDeviceManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_remoraVirtualDeviceManager, a3);
    objc_storeStrong((id *)&v10->_hostVirtualDevice, a4);
  }

  return v10;
}

- (SVXVirtualDeviceManager)initWithRemoraVirtualDeviceManager:(id)a3
{
  id v4 = a3;
  v5 = [SVXVirtualDevice alloc];
  v6 = [MEMORY[0x263F28528] defaultContext];
  id v7 = [(SVXVirtualDevice *)v5 initWithInstanceContext:v6];

  id v8 = [(SVXVirtualDeviceManager *)self initWithRemoraVirtualDeviceManager:v4 hostVirtualDevice:v7];
  return v8;
}

@end