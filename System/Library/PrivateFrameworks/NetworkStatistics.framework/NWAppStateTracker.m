@interface NWAppStateTracker
- (NSString)identifier;
- (NSUUID)uuid;
- (id)description;
- (int)pid;
- (void)setIdentifier:(id)a3;
- (void)setPid:(int)a3;
- (void)setUuid:(id)a3;
@end

@implementation NWAppStateTracker

- (int)pid
{
  return self->_pid;
}

- (void)setUuid:(id)a3
{
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"NWAppStateTracker, pid %d, uuid %@ display identifier %@", self->_pid, self->_uuid, self->_identifier];
  return v2;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end