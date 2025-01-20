@interface TCComputeDevice
- (BOOL)forceCPU;
- (NSArray)devices;
- (TCComputeDevice)initWithDevices:(id)a3 forceCPU:(BOOL)a4;
- (id)asMLCDevice;
- (id)asMLCDevice:(int64_t)a3;
- (id)asVNDevice;
- (id)asVNDevice:(int64_t)a3;
- (void)setDevices:(id)a3;
- (void)setForceCPU:(BOOL)a3;
@end

@implementation TCComputeDevice

- (TCComputeDevice)initWithDevices:(id)a3 forceCPU:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TCComputeDevice;
  v8 = [(TCComputeDevice *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_forceCPU = a4;
    objc_storeStrong((id *)&v8->_devices, a3);
  }

  return v9;
}

- (id)asMLCDevice
{
  if ([(TCComputeDevice *)self forceCPU])
  {
    v3 = (void *)MEMORY[0x263F105C0];
    uint64_t v4 = 0;
  }
  else
  {
    v5 = [(TCComputeDevice *)self devices];
    uint64_t v6 = [v5 count];

    id v7 = (void *)MEMORY[0x263F105C0];
    if (v6)
    {
      v8 = [(TCComputeDevice *)self devices];
      v9 = [v7 deviceWithGPUDevices:v8];

      goto LABEL_7;
    }
    v3 = (void *)MEMORY[0x263F105C0];
    uint64_t v4 = 2;
  }
  v9 = [v3 deviceWithType:v4];
LABEL_7:
  return v9;
}

- (id)asMLCDevice:(int64_t)a3
{
  if (a3 == 1) {
    [MEMORY[0x263F105C0] deviceWithType:0];
  }
  else {
  v3 = [(TCComputeDevice *)self asMLCDevice];
  }
  return v3;
}

- (id)asVNDevice
{
  if ([(TCComputeDevice *)self forceCPU])
  {
    uint64_t v3 = [MEMORY[0x263F1EF88] defaultCPUDevice];
  }
  else
  {
    uint64_t v4 = [(TCComputeDevice *)self devices];
    uint64_t v5 = [v4 count];

    uint64_t v6 = (void *)MEMORY[0x263F1EF88];
    if (v5)
    {
      id v7 = [(TCComputeDevice *)self devices];
      v8 = [v7 objectAtIndexedSubscript:0];
      v9 = [v6 deviceForMetalDevice:v8];

      goto LABEL_7;
    }
    uint64_t v3 = [MEMORY[0x263F1EF88] defaultMetalDevice];
  }
  v9 = (void *)v3;
LABEL_7:
  return v9;
}

- (id)asVNDevice:(int64_t)a3
{
  if (a3 == 1) {
    [MEMORY[0x263F1EF88] defaultCPUDevice];
  }
  else {
  uint64_t v3 = [(TCComputeDevice *)self asVNDevice];
  }
  return v3;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (BOOL)forceCPU
{
  return self->_forceCPU;
}

- (void)setForceCPU:(BOOL)a3
{
  self->_forceCPU = a3;
}

- (void).cxx_destruct
{
}

@end