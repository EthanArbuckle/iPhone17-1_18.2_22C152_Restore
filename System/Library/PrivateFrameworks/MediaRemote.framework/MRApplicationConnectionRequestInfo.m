@interface MRApplicationConnectionRequestInfo
+ (BOOL)supportsSecureCoding;
- (MRApplicationConnectionRequestInfo)initWithCoder:(id)a3;
- (MRApplicationConnectionRequestInfo)initWithDeviceInfo:(id)a3 client:(id)a4;
- (MRApplicationConnectionRequestInfo)initWithProtobuf:(id)a3;
- (MRApplicationConnectionRequestInfo)initWithProtobufData:(id)a3;
- (MRClient)client;
- (MRDeviceInfo)deviceInfo;
- (NSData)protobufData;
- (_MRApplicationConnectionRequestInfoProtobuf)protobuf;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MRApplicationConnectionRequestInfo

- (MRApplicationConnectionRequestInfo)initWithDeviceInfo:(id)a3 client:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRApplicationConnectionRequestInfo;
  v8 = [(MRApplicationConnectionRequestInfo *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    deviceInfo = v8->_deviceInfo;
    v8->_deviceInfo = (MRDeviceInfo *)v9;

    uint64_t v11 = [v7 copy];
    client = v8->_client;
    v8->_client = (MRClient *)v11;
  }
  return v8;
}

- (MRApplicationConnectionRequestInfo)initWithProtobufData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[_MRApplicationConnectionRequestInfoProtobuf alloc] initWithData:v4];

    self = [(MRApplicationConnectionRequestInfo *)self initWithProtobuf:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (MRApplicationConnectionRequestInfo)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)MRApplicationConnectionRequestInfo;
    v5 = [(MRApplicationConnectionRequestInfo *)&v16 init];
    if (v5)
    {
      id v6 = [MRDeviceInfo alloc];
      id v7 = [v4 deviceInfo];
      uint64_t v8 = [(MRDeviceInfo *)v6 initWithProtobuf:v7];
      deviceInfo = v5->_deviceInfo;
      v5->_deviceInfo = (MRDeviceInfo *)v8;

      v10 = [MRClient alloc];
      uint64_t v11 = [v4 client];
      uint64_t v12 = [(MRClient *)v10 initWithProtobuf:v11];
      client = v5->_client;
      v5->_client = (MRClient *)v12;
    }
    self = v5;
    objc_super v14 = self;
  }
  else
  {
    objc_super v14 = 0;
  }

  return v14;
}

- (_MRApplicationConnectionRequestInfoProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRApplicationConnectionRequestInfoProtobuf);
  id v4 = [(MRApplicationConnectionRequestInfo *)self deviceInfo];
  v5 = [v4 protobuf];
  [(_MRApplicationConnectionRequestInfoProtobuf *)v3 setDeviceInfo:v5];

  id v6 = [(MRApplicationConnectionRequestInfo *)self client];
  id v7 = [v6 protobuf];
  [(_MRApplicationConnectionRequestInfoProtobuf *)v3 setClient:v7];

  return v3;
}

- (NSData)protobufData
{
  v2 = [(MRApplicationConnectionRequestInfo *)self protobuf];
  v3 = [v2 data];

  return (NSData *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MRApplicationConnectionRequestInfo *)self protobufData];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (MRApplicationConnectionRequestInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  id v6 = [(MRApplicationConnectionRequestInfo *)self initWithProtobufData:v5];
  return v6;
}

- (MRClient)client
{
  return self->_client;
}

- (MRDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceInfo, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end