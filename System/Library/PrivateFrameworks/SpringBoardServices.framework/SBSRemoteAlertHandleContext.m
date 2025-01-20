@interface SBSRemoteAlertHandleContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (NSString)handleID;
- (SBSRemoteAlertHandleContext)initWithCoder:(id)a3;
- (SBSRemoteAlertHandleContext)initWithHandleID:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActive:(BOOL)a3;
@end

@implementation SBSRemoteAlertHandleContext

- (SBSRemoteAlertHandleContext)initWithHandleID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSRemoteAlertHandleContext;
  v6 = [(SBSRemoteAlertHandleContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_handleID, a3);
  }

  return v7;
}

- (SBSRemoteAlertHandleContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handleID"];
  if (v5)
  {
    v6 = [(SBSRemoteAlertHandleContext *)self initWithHandleID:v5];
    if (v6) {
      v6->_active = [v4 decodeBoolForKey:@"active"];
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  handleID = self->_handleID;
  id v5 = a3;
  [v5 encodeObject:handleID forKey:@"handleID"];
  [v5 encodeBool:self->_active forKey:@"active"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)handleID
{
  return self->_handleID;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
}

@end