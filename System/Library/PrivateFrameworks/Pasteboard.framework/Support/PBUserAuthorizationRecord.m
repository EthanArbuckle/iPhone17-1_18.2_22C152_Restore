@interface PBUserAuthorizationRecord
- (BOOL)pasteWasAllowed;
- (PBUserAuthorizationRecord)initWithPasteAllowed:(BOOL)a3;
- (int)pid;
- (unint64_t)timestamp;
@end

@implementation PBUserAuthorizationRecord

- (PBUserAuthorizationRecord)initWithPasteAllowed:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PBUserAuthorizationRecord;
  v4 = [(PBUserAuthorizationRecord *)&v6 init];
  if (v4)
  {
    v4->_timestamp = mach_continuous_time();
    v4->_pasteWasAllowed = a3;
  }
  return v4;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)pasteWasAllowed
{
  return self->_pasteWasAllowed;
}

- (int)pid
{
  return self->_pid;
}

@end