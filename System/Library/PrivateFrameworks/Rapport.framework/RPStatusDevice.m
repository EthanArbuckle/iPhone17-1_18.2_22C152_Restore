@interface RPStatusDevice
+ (BOOL)supportsSecureCoding;
- (NSMutableDictionary)statusInfoMap;
- (NSMutableDictionary)statusStateMap;
- (RPCompanionLinkDevice)device;
- (RPStatusDevice)initWithCoder:(id)a3;
- (RPStatusDevice)initWithDevice:(id)a3;
- (id)getIdentifier;
- (void)setStatusInfoMap:(id)a3;
- (void)setStatusStateMap:(id)a3;
@end

@implementation RPStatusDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPStatusDevice)initWithDevice:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPStatusDevice;
  v6 = [(RPStatusDevice *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = v7;
  }

  return v7;
}

- (id)getIdentifier
{
  v3 = [(RPEndpoint *)self->_device idsDeviceIdentifier];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(RPEndpoint *)self->_device identifier];
  }
  v6 = v5;

  return v6;
}

- (RPStatusDevice)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RPStatusDevice;
  v3 = [(RPStatusDevice *)&v7 init];
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (NSMutableDictionary)statusInfoMap
{
  return self->_statusInfoMap;
}

- (void)setStatusInfoMap:(id)a3
{
}

- (NSMutableDictionary)statusStateMap
{
  return self->_statusStateMap;
}

- (void)setStatusStateMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusStateMap, 0);
  objc_storeStrong((id *)&self->_statusInfoMap, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end