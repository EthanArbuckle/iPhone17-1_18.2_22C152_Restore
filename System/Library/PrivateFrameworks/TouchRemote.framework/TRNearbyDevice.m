@interface TRNearbyDevice
- (NSUUID)identifier;
- (SFDevice)representedDevice;
- (TRNearbyDevice)init;
- (TRNearbyDevice)initWithRepresentedDevice:(id)a3 supportedService:(unint64_t)a4;
- (id)description;
- (unint64_t)supportedService;
- (void)setSupportedService:(unint64_t)a3;
@end

@implementation TRNearbyDevice

- (TRNearbyDevice)init
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = [v2 stringWithFormat:@"-init is not a valid initializer for the class %@", v4];

  id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v5 userInfo:0];
  objc_exception_throw(v6);
}

- (TRNearbyDevice)initWithRepresentedDevice:(id)a3 supportedService:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRNearbyDevice;
  v8 = [(TRNearbyDevice *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_representedDevice, a3);
    v9->_supportedService = a4;
  }

  return v9;
}

- (NSUUID)identifier
{
  v2 = [(TRNearbyDevice *)self representedDevice];
  v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(TRNearbyDevice *)self identifier];
  id v6 = [v3 stringWithFormat:@"<%@:%p> Identifier: (%@)", v4, self, v5];

  return v6;
}

- (unint64_t)supportedService
{
  return self->_supportedService;
}

- (void)setSupportedService:(unint64_t)a3
{
  self->_supportedService = a3;
}

- (SFDevice)representedDevice
{
  return self->_representedDevice;
}

- (void).cxx_destruct
{
}

@end