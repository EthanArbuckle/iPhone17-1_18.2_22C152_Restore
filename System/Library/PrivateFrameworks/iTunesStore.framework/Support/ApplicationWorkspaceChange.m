@interface ApplicationWorkspaceChange
- (ApplicationHandle)applicationHandle;
- (int64_t)changeType;
- (void)setApplicationHandle:(id)a3;
- (void)setChangeType:(int64_t)a3;
@end

@implementation ApplicationWorkspaceChange

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (ApplicationHandle)applicationHandle
{
  return self->_applicationHandle;
}

- (void)setApplicationHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end