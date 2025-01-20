@interface PRRangingDevice
- (NSDictionary)clientInfo;
- (PRRangingDevice)init;
@end

@implementation PRRangingDevice

- (PRRangingDevice)init
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)PRRangingDevice;
  v2 = [(PRRangingDevice *)&v11 init];
  if (v2)
  {
    v12[0] = @"ProcessName";
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    v4 = [v3 processName];
    v12[1] = @"ProcessIdentifier";
    v13[0] = v4;
    v5 = NSNumber;
    v6 = [MEMORY[0x1E4F28F80] processInfo];
    v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "processIdentifier"));
    v13[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    clientInfo = v2->_clientInfo;
    v2->_clientInfo = (NSDictionary *)v8;
  }
  return v2;
}

- (NSDictionary)clientInfo
{
  return self->_clientInfo;
}

- (void).cxx_destruct
{
}

@end