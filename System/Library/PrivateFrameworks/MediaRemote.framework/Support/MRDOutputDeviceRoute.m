@interface MRDOutputDeviceRoute
- (BOOL)canBeDefaultRoute;
- (BOOL)canBeDefaultSystemRoute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInputRoute;
- (BOOL)isOutputRoute;
- (BOOL)isPicked;
- (BOOL)isSpeakerRoute;
- (BOOL)matchesUniqueIdentifier:(id)a3;
- (MRAVOutputDevice)outputDevice;
- (MRDOutputDeviceRoute)initWithOutputDevice:(id)a3;
- (id)MACAddress;
- (id)description;
- (id)dictionary;
- (id)extendedInfo;
- (id)modelName;
- (id)name;
- (id)type;
- (id)uniqueIdentifier;
- (unint64_t)hash;
@end

@implementation MRDOutputDeviceRoute

- (MRDOutputDeviceRoute)initWithOutputDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRDOutputDeviceRoute;
  v6 = [(MRDOutputDeviceRoute *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_outputDevice, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)[(MRAVOutputDevice *)self->_outputDevice hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 avOutputDevice];
    unsigned __int8 v6 = [v5 isEqual:self->_outputDevice];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"<%@ %p outputDevice = %@>", v4, self, self->_outputDevice];

  return v5;
}

- (id)uniqueIdentifier
{
  v3 = [(MRAVOutputDevice *)self->_outputDevice primaryID];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(MRAVOutputDevice *)self->_outputDevice uid];
  }
  unsigned __int8 v6 = v5;

  return v6;
}

- (id)MACAddress
{
  return [(MRAVOutputDevice *)self->_outputDevice MACAddress];
}

- (id)name
{
  return [(MRAVOutputDevice *)self->_outputDevice name];
}

- (id)type
{
  [(MRAVOutputDevice *)self->_outputDevice deviceType];
  v3 = (void *)MRAVOutputDeviceTypeCopyDescription();
  [(MRAVOutputDevice *)self->_outputDevice deviceSubtype];
  id v4 = (void *)MRAVOutputDeviceSubtypeCopyDescription();
  id v5 = +[NSString stringWithFormat:@"%@-%@", v3, v4];

  return v5;
}

- (id)modelName
{
  return [(MRAVOutputDevice *)self->_outputDevice modelID];
}

- (BOOL)isInputRoute
{
  return 1;
}

- (BOOL)isOutputRoute
{
  return 1;
}

- (BOOL)isPicked
{
  v3 = [(objc_class *)off_100477F80() sharedAudioPresentationOutputContext];
  id v4 = [v3 outputDevices];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        outputDevice = self->_outputDevice;
        v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "ID", (void)v14);
        LOBYTE(outputDevice) = [(MRAVOutputDevice *)outputDevice containsUID:v11];

        if (outputDevice)
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)isSpeakerRoute
{
  v3 = [(objc_class *)off_100477F88() sharedLocalDevice];
  id v4 = [v3 ID];
  BOOL v5 = [(MRDOutputDeviceRoute *)self matchesUniqueIdentifier:v4]
    || [(MRAVOutputDevice *)self->_outputDevice deviceType] == 4;

  return v5;
}

- (BOOL)canBeDefaultRoute
{
  return 1;
}

- (BOOL)canBeDefaultSystemRoute
{
  return 1;
}

- (id)dictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(MRDOutputDeviceRoute *)self uniqueIdentifier];

  if (v4)
  {
    BOOL v5 = [(MRDOutputDeviceRoute *)self uniqueIdentifier];
    [v3 setObject:v5 forKey:@"RouteUID"];
  }
  id v6 = [(MRDOutputDeviceRoute *)self name];

  if (v6)
  {
    id v7 = [(MRDOutputDeviceRoute *)self name];
    [v3 setObject:v7 forKey:@"RouteName"];
  }
  v20[0] = @"model";
  uint64_t v8 = [(MRDOutputDeviceRoute *)self modelName];
  objc_super v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = &stru_10042ACB0;
  }
  v20[1] = @"deviceID";
  v21[0] = v10;
  uint64_t v11 = [(MRDOutputDeviceRoute *)self uniqueIdentifier];
  BOOL v12 = (void *)v11;
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  else {
    CFStringRef v13 = &stru_10042ACB0;
  }
  v21[1] = v13;
  long long v14 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  [v3 setObject:v14 forKeyedSubscript:@"AirPlayPortExtendedInfo"];

  long long v15 = +[NSNumber numberWithBool:[(MRAVOutputDevice *)self->_outputDevice requiresAuthorization]];
  [v3 setObject:v15 forKeyedSubscript:@"RouteRequiresAirPlayPIN"];

  long long v16 = +[NSNumber numberWithBool:[(MRAVOutputDevice *)self->_outputDevice requiresAuthorization]];
  [v3 setObject:v16 forKeyedSubscript:@"PortHasPassword"];

  signed int v17 = [(MRAVOutputDevice *)self->_outputDevice deviceType];
  if (v17 <= 5)
  {
    uint64_t v18 = (uint64_t)*(&off_100420068 + v17);
    [v3 setObject:*(&off_100420038 + v17) forKey:@"RouteType"];
    [v3 setObject:v18 forKey:@"AVAudioRouteName"];
  }

  return v3;
}

- (id)extendedInfo
{
  id v3 = [MRDAVRouteExtendedInfo alloc];
  id v4 = [(MRDOutputDeviceRoute *)self dictionary];
  BOOL v5 = [(MRDAVRouteExtendedInfo *)v3 initWithRoute:v4];

  return v5;
}

- (BOOL)matchesUniqueIdentifier:(id)a3
{
  return [(MRAVOutputDevice *)self->_outputDevice containsUID:a3];
}

- (MRAVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (void).cxx_destruct
{
}

@end