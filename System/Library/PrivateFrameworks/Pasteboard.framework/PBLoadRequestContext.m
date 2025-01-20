@interface PBLoadRequestContext
+ (BOOL)supportsSecureCoding;
- (BOOL)clientHasFinishedLaunching;
- (BOOL)isBlockingMainThread;
- (BOOL)isFromUIFramework;
- (PBLoadRequestContext)initWithCoder:(id)a3;
- (PBLoadRequestContext)initWithOptions:(unsigned int)a3 pasteSharingToken:(id)a4;
- (UISPasteSharingToken)pasteSharingToken;
- (void)encodeWithCoder:(id)a3;
- (void)setPasteSharingToken:(id)a3;
@end

@implementation PBLoadRequestContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBLoadRequestContext)initWithOptions:(unsigned int)a3 pasteSharingToken:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PBLoadRequestContext;
  v7 = [(PBLoadRequestContext *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_options = a3;
    uint64_t v9 = [v6 copy];
    pasteSharingToken = v8->_pasteSharingToken;
    v8->_pasteSharingToken = (UISPasteSharingToken *)v9;
  }
  return v8;
}

- (PBLoadRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBLoadRequestContext;
  v5 = [(PBLoadRequestContext *)&v9 init];
  if (v5)
  {
    v5->_options = [v4 decodeInt32ForKey:@"requestOptions"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pasteSharingToken"];
    pasteSharingToken = v5->_pasteSharingToken;
    v5->_pasteSharingToken = (UISPasteSharingToken *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t options = self->_options;
  id v5 = a3;
  [v5 encodeInt32:options forKey:@"requestOptions"];
  [v5 encodeObject:self->_pasteSharingToken forKey:@"pasteSharingToken"];
}

- (BOOL)isFromUIFramework
{
  return self->_options & 1;
}

- (BOOL)isBlockingMainThread
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)clientHasFinishedLaunching
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (UISPasteSharingToken)pasteSharingToken
{
  return (UISPasteSharingToken *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPasteSharingToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end