@interface MRDAVOutputDeviceRoute
- (AVOutputDevice)avOutputDevice;
- (MRDAVOutputDeviceRoute)initWithAVOutputDevice:(id)a3;
@end

@implementation MRDAVOutputDeviceRoute

- (MRDAVOutputDeviceRoute)initWithAVOutputDevice:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [objc_alloc((Class)MRAVOutputDeviceSourceInfo) initWithRoutingContextUID:0 multipleBuiltInDevices:0];
    id v7 = [objc_alloc((Class)MRAVConcreteOutputDevice) initWithAVOutputDevice:v5 sourceInfo:v6];
    v12.receiver = self;
    v12.super_class = (Class)MRDAVOutputDeviceRoute;
    v8 = [(MRDOutputDeviceRoute *)&v12 initWithOutputDevice:v7];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_avOutputDevice, a3);
    }
    self = v9;

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (AVOutputDevice)avOutputDevice
{
  return self->_avOutputDevice;
}

- (void).cxx_destruct
{
}

@end