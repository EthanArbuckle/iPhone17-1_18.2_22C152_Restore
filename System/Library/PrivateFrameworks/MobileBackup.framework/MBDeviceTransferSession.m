@interface MBDeviceTransferSession
+ (BOOL)supportsSecureCoding;
- (MBDeviceTransferSession)initWithCoder:(id)a3;
- (RPFileTransferSession)fileTransferSession;
- (void)encodeWithCoder:(id)a3;
- (void)setFileTransferSession:(id)a3;
@end

@implementation MBDeviceTransferSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = (void *)MEMORY[0x1E01C2AA0]();
  v5 = [(MBDeviceTransferSession *)self fileTransferSession];

  if (v5)
  {
    v6 = [(MBDeviceTransferSession *)self fileTransferSession];
    [v7 encodeObject:v6 forKey:@"fileTransferSession"];
  }
}

- (MBDeviceTransferSession)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E01C2AA0]();
  v10.receiver = self;
  v10.super_class = (Class)MBDeviceTransferSession;
  v6 = [(MBDeviceTransferSession *)&v10 init];
  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileTransferSession"];
    [(MBDeviceTransferSession *)v6 setFileTransferSession:v7];
  }
  v8 = v6;

  return v8;
}

- (RPFileTransferSession)fileTransferSession
{
  return self->_fileTransferSession;
}

- (void)setFileTransferSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end