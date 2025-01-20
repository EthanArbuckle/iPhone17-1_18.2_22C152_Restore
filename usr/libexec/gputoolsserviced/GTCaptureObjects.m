@interface GTCaptureObjects
+ (BOOL)supportsSecureCoding;
- (GTCaptureObjects)initWithCoder:(id)a3;
- (NSArray)captureScopes;
- (NSArray)commandQueues;
- (NSArray)devices;
- (NSArray)metalLayers;
- (void)encodeWithCoder:(id)a3;
- (void)setCaptureScopes:(id)a3;
- (void)setCommandQueues:(id)a3;
- (void)setDevices:(id)a3;
- (void)setMetalLayers:(id)a3;
@end

@implementation GTCaptureObjects

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureObjects)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GTCaptureObjects;
  v5 = [(GTCaptureObjects *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"devices"];
    devices = v5->_devices;
    v5->_devices = (NSArray *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"commandQueues"];
    commandQueues = v5->_commandQueues;
    v5->_commandQueues = (NSArray *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"captureScopes"];
    captureScopes = v5->_captureScopes;
    v5->_captureScopes = (NSArray *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"metalLayers"];
    metalLayers = v5->_metalLayers;
    v5->_metalLayers = (NSArray *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  devices = self->_devices;
  id v5 = a3;
  [v5 encodeObject:devices forKey:@"devices"];
  [v5 encodeObject:self->_commandQueues forKey:@"commandQueues"];
  [v5 encodeObject:self->_captureScopes forKey:@"captureScopes"];
  [v5 encodeObject:self->_metalLayers forKey:@"metalLayers"];
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSArray)commandQueues
{
  return self->_commandQueues;
}

- (void)setCommandQueues:(id)a3
{
}

- (NSArray)captureScopes
{
  return self->_captureScopes;
}

- (void)setCaptureScopes:(id)a3
{
}

- (NSArray)metalLayers
{
  return self->_metalLayers;
}

- (void)setMetalLayers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalLayers, 0);
  objc_storeStrong((id *)&self->_captureScopes, 0);
  objc_storeStrong((id *)&self->_commandQueues, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end