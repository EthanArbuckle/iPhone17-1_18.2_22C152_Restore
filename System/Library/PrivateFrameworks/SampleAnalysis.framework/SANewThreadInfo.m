@interface SANewThreadInfo
- (id)debugDescription;
@end

@implementation SANewThreadInfo

- (id)debugDescription
{
  id v3 = [NSString alloc];
  unint64_t newTid = self->_newTid;
  uint64_t oldPid = self->_oldPid;
  uint64_t newPid = self->_newPid;
  v7 = [(SATimestamp *)self->_timestamp debugDescription];
  v8 = (void *)[v3 initWithFormat:@"[%d] -> [%d] 0x%llx @ %@", oldPid, newPid, newTid, v7];

  return v8;
}

- (void).cxx_destruct
{
}

@end