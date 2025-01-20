@interface MRSuspendDisconnectionPauseConfiguration
- (MRSuspendDisconnectionPauseConfiguration)initWithXPCMessage:(id)a3;
- (NSString)deviceAddress;
- (id)XPCMessage;
- (void)setDeviceAddress:(id)a3;
@end

@implementation MRSuspendDisconnectionPauseConfiguration

- (MRSuspendDisconnectionPauseConfiguration)initWithXPCMessage:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRSuspendDisconnectionPauseConfiguration;
  v5 = [(MRSuspendDisconnectionPauseConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithCString:encoding:", xpc_dictionary_get_string(v4, (const char *)MRSuspendDisconnectionPauseConfigurationKeyDeviceAddress), 4);
    deviceAddress = v5->_deviceAddress;
    v5->_deviceAddress = (NSString *)v6;
  }
  return v5;
}

- (id)XPCMessage
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "MRXPC_MESSAGE_ID_KEY", 0x100000000000019uLL);
  id v4 = (const char *)MRSuspendDisconnectionPauseConfigurationKeyDeviceAddress;
  id v5 = [(MRSuspendDisconnectionPauseConfiguration *)self deviceAddress];
  xpc_dictionary_set_string(v3, v4, (const char *)[v5 cStringUsingEncoding:4]);

  return v3;
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end