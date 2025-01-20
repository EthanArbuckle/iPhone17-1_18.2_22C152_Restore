@interface SMBPistonEvents
- (smb_lease_break)leaseBreak;
- (void)setLeaseBreak:(smb_lease_break *)a3;
@end

@implementation SMBPistonEvents

- (smb_lease_break)leaseBreak
{
  objc_copyStruct(retstr, &self->_leaseBreak, 32, 1, 0);
  return result;
}

- (void)setLeaseBreak:(smb_lease_break *)a3
{
}

@end