@interface DMDTaskOperationContext
- (BOOL)runAsUser;
- (NSString)clientBundleIdentifier;
- (unsigned)uid;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setRunAsUser:(BOOL)a3;
- (void)setUid:(unsigned int)a3;
@end

@implementation DMDTaskOperationContext

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (BOOL)runAsUser
{
  return self->_runAsUser;
}

- (void)setRunAsUser:(BOOL)a3
{
  self->_runAsUser = a3;
}

- (void).cxx_destruct
{
}

@end