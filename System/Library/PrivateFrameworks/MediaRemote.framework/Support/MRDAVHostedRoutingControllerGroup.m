@interface MRDAVHostedRoutingControllerGroup
- (MRAVDistantEndpoint)distantEndpoint;
- (MRConcreteEndpoint)concreteEndpoint;
- (MRDAVHostedExternalDevice)externalDevice;
- (MRDAVHostedRoutingControllerGroup)initWithEndpoint:(id)a3 externalDevice:(id)a4;
- (id)description;
@end

@implementation MRDAVHostedRoutingControllerGroup

- (MRDAVHostedRoutingControllerGroup)initWithEndpoint:(id)a3 externalDevice:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MRDAVHostedRoutingControllerGroup;
  v9 = [(MRDAVHostedRoutingControllerGroup *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_concreteEndpoint, a3);
    objc_storeStrong((id *)&v10->_externalDevice, a4);
    id v11 = objc_alloc((Class)MRAVDistantEndpoint);
    v12 = [v7 descriptor];
    id v13 = [v11 initWithDescriptor:v12];

    v14 = [v8 externalDeviceListenerEndpoint];
    [v13 setExternalDeviceListenerEndpoint:v14];

    distantEndpoint = v10->_distantEndpoint;
    v10->_distantEndpoint = (MRAVDistantEndpoint *)v13;
  }
  return v10;
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%@ - %@", self->_concreteEndpoint, self->_externalDevice];

  return v2;
}

- (MRConcreteEndpoint)concreteEndpoint
{
  return self->_concreteEndpoint;
}

- (MRAVDistantEndpoint)distantEndpoint
{
  return self->_distantEndpoint;
}

- (MRDAVHostedExternalDevice)externalDevice
{
  return self->_externalDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_distantEndpoint, 0);

  objc_storeStrong((id *)&self->_concreteEndpoint, 0);
}

@end