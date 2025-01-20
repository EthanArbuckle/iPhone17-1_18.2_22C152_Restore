@interface MBDeviceTransferConnectionInfo
+ (BOOL)supportsSecureCoding;
+ (int64_t)connectionTypeFromLinkType:(int)a3;
- (MBDeviceTransferConnectionInfo)init;
- (MBDeviceTransferConnectionInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)connectionState;
- (int64_t)connectionType;
- (void)encodeWithCoder:(id)a3;
- (void)setConnectionState:(int64_t)a3;
- (void)setConnectionType:(int64_t)a3;
@end

@implementation MBDeviceTransferConnectionInfo

+ (int64_t)connectionTypeFromLinkType:(int)a3
{
  if ((a3 - 1) > 8) {
    return 0;
  }
  else {
    return qword_1DD9F10E0[a3 - 1];
  }
}

- (MBDeviceTransferConnectionInfo)init
{
  v5.receiver = self;
  v5.super_class = (Class)MBDeviceTransferConnectionInfo;
  v2 = [(MBDeviceTransferConnectionInfo *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MBDeviceTransferConnectionInfo *)v2 setConnectionState:0];
    [(MBDeviceTransferConnectionInfo *)v3 setConnectionType:0];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBDeviceTransferConnectionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MBDeviceTransferConnectionInfo;
  objc_super v5 = [(MBDeviceTransferConnectionInfo *)&v7 init];
  if (v5)
  {
    -[MBDeviceTransferConnectionInfo setConnectionState:](v5, "setConnectionState:", [v4 decodeIntegerForKey:@"connectionState"]);
    -[MBDeviceTransferConnectionInfo setConnectionType:](v5, "setConnectionType:", [v4 decodeIntegerForKey:@"connectionType"]);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setConnectionState:", -[MBDeviceTransferConnectionInfo connectionState](self, "connectionState"));
  objc_msgSend(v4, "setConnectionType:", -[MBDeviceTransferConnectionInfo connectionType](self, "connectionType"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[MBDeviceTransferConnectionInfo connectionState](self, "connectionState"), @"connectionState");
  objc_msgSend(v4, "encodeInteger:forKey:", -[MBDeviceTransferConnectionInfo connectionType](self, "connectionType"), @"connectionType");
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%s: %p; connectionState=%ld, connectionType=%ld",
               class_getName(v4),
               self,
               [(MBDeviceTransferConnectionInfo *)self connectionState],
               [(MBDeviceTransferConnectionInfo *)self connectionType]);
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (void)setConnectionType:(int64_t)a3
{
  self->_connectionType = a3;
}

@end