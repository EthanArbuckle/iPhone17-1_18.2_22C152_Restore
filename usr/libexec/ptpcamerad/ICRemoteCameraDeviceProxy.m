@interface ICRemoteCameraDeviceProxy
- (ICRemoteCameraDevice)camera;
- (ICRemoteCameraDeviceProxy)initWithPrimaryIdentifierString:(id)a3 uuidString:(id)a4 localizedName:(id)a5;
- (NSDictionary)deviceContext;
- (NSString)localizedName;
- (NSString)primaryIdentifierString;
- (NSString)uuidString;
- (void)dealloc;
- (void)setCamera:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setPrimaryIdentifierString:(id)a3;
- (void)setUuidString:(id)a3;
@end

@implementation ICRemoteCameraDeviceProxy

- (ICRemoteCameraDeviceProxy)initWithPrimaryIdentifierString:(id)a3 uuidString:(id)a4 localizedName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICRemoteCameraDeviceProxy;
  v12 = [(ICRemoteCameraDeviceProxy *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_primaryIdentifierString, a3);
    objc_storeStrong((id *)&v13->_uuidString, a4);
    objc_storeStrong((id *)&v13->_localizedName, a5);
  }

  return v13;
}

- (NSDictionary)deviceContext
{
  v8[0] = @"ICDevicePrimaryIdentifier";
  v3 = [(ICRemoteCameraDeviceProxy *)self primaryIdentifierString];
  v9[0] = v3;
  v8[1] = @"ICDeviceHandle";
  v4 = [(ICRemoteCameraDeviceProxy *)self uuidString];
  v9[1] = v4;
  v8[2] = @"ICDeviceName";
  v5 = [(ICRemoteCameraDeviceProxy *)self localizedName];
  v9[2] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

- (void)dealloc
{
  v3 = [(ICRemoteCameraDeviceProxy *)self camera];
  [v3 setDelegate:0];

  [(ICRemoteCameraDeviceProxy *)self setCamera:0];
  [(ICRemoteCameraDeviceProxy *)self setUuidString:0];
  [(ICRemoteCameraDeviceProxy *)self setLocalizedName:0];
  v4.receiver = self;
  v4.super_class = (Class)ICRemoteCameraDeviceProxy;
  [(ICRemoteCameraDeviceProxy *)&v4 dealloc];
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (NSString)primaryIdentifierString
{
  return self->_primaryIdentifierString;
}

- (void)setPrimaryIdentifierString:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (ICRemoteCameraDevice)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_primaryIdentifierString, 0);

  objc_storeStrong((id *)&self->_uuidString, 0);
}

@end