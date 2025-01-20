@interface SESEndPointContainerInfo
+ (BOOL)supportsSecureCoding;
+ (id)withAppletAID:(id)a3 isSuspended:(BOOL)a4;
- (BOOL)isSuspended;
- (NSData)appletAID;
- (SESEndPointContainerInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SESEndPointContainerInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)withAppletAID:(id)a3 isSuspended:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;

  *(unsigned char *)(v6 + 8) = a4;
  return (id)v6;
}

- (void)encodeWithCoder:(id)a3
{
  appletAID = self->_appletAID;
  id v5 = a3;
  [v5 encodeObject:appletAID forKey:@"appletAID"];
  [v5 encodeInt:self->_isSuspended forKey:@"isSuspended"];
}

- (SESEndPointContainerInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SESEndPointContainerInfo;
  id v5 = [(SESEndPointContainerInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appletAID"];
    appletAID = v5->_appletAID;
    v5->_appletAID = (NSData *)v6;

    v5->_isSuspended = [v4 decodeIntForKey:@"isSuspended"] != 0;
  }

  return v5;
}

- (NSData)appletAID
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (void).cxx_destruct
{
}

@end