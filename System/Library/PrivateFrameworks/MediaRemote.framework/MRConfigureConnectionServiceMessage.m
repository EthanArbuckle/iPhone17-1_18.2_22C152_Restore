@interface MRConfigureConnectionServiceMessage
- (MRConfigureConnectionServiceMessage)initWithServiceType:(id)a3 sourceOutputDeviceUID:(id)a4 sourceOutputDeviceName:(id)a5;
- (NSString)destinationOutputDeviceUID;
- (NSString)serviceType;
- (NSString)sourceOutputDeviceName;
- (NSString)sourceOutputDeviceUID;
- (unint64_t)type;
@end

@implementation MRConfigureConnectionServiceMessage

- (MRConfigureConnectionServiceMessage)initWithServiceType:(id)a3 sourceOutputDeviceUID:(id)a4 sourceOutputDeviceName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MRConfigureConnectionServiceMessage;
  v11 = [(MRConfigureConnectionMessage *)&v17 initWithGroupID:&stru_1EE60E7D8];
  v12 = v11;
  if (v11)
  {
    v13 = [(MRProtocolMessage *)v11 underlyingCodableMessage];
    [v13 setServiceName:v8];

    v14 = [(MRProtocolMessage *)v12 underlyingCodableMessage];
    [v14 setSourceOutputDeviceUID:v9];

    v15 = [(MRProtocolMessage *)v12 underlyingCodableMessage];
    [v15 setSourceOutputDeviceName:v10];
  }
  return v12;
}

- (NSString)serviceType
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 serviceName];

  return (NSString *)v3;
}

- (NSString)sourceOutputDeviceUID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 sourceOutputDeviceUID];

  return (NSString *)v3;
}

- (NSString)sourceOutputDeviceName
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 sourceOutputDeviceName];

  return (NSString *)v3;
}

- (NSString)destinationOutputDeviceUID
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v3 = [v2 destinationOutputDeviceUID];

  return (NSString *)v3;
}

- (unint64_t)type
{
  return 133;
}

@end