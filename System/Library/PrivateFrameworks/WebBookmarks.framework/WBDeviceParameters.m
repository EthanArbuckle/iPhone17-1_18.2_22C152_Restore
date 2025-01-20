@interface WBDeviceParameters
+ (id)localDeviceWithTitle:(id)a3 creationDeviceIdentifier:(id)a4 deviceIdentifier:(id)a5;
+ (id)remoteDeviceWithTitle:(id)a3 deviceIdentifier:(id)a4;
- (BOOL)isRemoteDevice;
- (NSString)creationDeviceIdentifier;
- (NSString)deviceIdentifier;
- (NSString)deviceTypeIdentifier;
- (NSString)title;
- (void)setCreationDeviceIdentifier:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceTypeIdentifier:(id)a3;
- (void)setRemoteDevice:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation WBDeviceParameters

+ (id)remoteDeviceWithTitle:(id)a3 deviceIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(WBDeviceParameters);
  [(WBDeviceParameters *)v7 setRemoteDevice:1];
  [(WBDeviceParameters *)v7 setTitle:v6];

  [(WBDeviceParameters *)v7 setDeviceIdentifier:v5];
  return v7;
}

+ (id)localDeviceWithTitle:(id)a3 creationDeviceIdentifier:(id)a4 deviceIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(WBDeviceParameters);
  [(WBDeviceParameters *)v10 setTitle:v9];

  [(WBDeviceParameters *)v10 setDeviceIdentifier:v7];
  [(WBDeviceParameters *)v10 setCreationDeviceIdentifier:v8];

  return v10;
}

- (NSString)creationDeviceIdentifier
{
  return self->_creationDeviceIdentifier;
}

- (void)setCreationDeviceIdentifier:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)deviceTypeIdentifier
{
  return self->_deviceTypeIdentifier;
}

- (void)setDeviceTypeIdentifier:(id)a3
{
}

- (BOOL)isRemoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(BOOL)a3
{
  self->_remoteDevice = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_deviceTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDeviceIdentifier, 0);
}

@end