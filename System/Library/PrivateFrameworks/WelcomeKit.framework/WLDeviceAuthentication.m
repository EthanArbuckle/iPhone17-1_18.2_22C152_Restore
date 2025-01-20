@interface WLDeviceAuthentication
+ (BOOL)supportsSecureCoding;
- (NSString)sessionUUID;
- (WLDeviceAuthentication)init;
- (WLDeviceAuthentication)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WLDeviceAuthentication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLDeviceAuthentication)init
{
  v7.receiver = self;
  v7.super_class = (Class)WLDeviceAuthentication;
  v2 = [(WLDeviceAuthentication *)&v7 init];
  if (v2)
  {
    CFUUIDRef v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x263EFFB08]);
    CFStringRef v4 = CFUUIDCreateString(0, v3);
    sessionUUID = v2->_sessionUUID;
    v2->_sessionUUID = &v4->isa;

    CFRelease(v3);
  }
  return v2;
}

- (WLDeviceAuthentication)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WLDeviceAuthentication *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sessionUUID"];
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void).cxx_destruct
{
}

@end