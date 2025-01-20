@interface NPKOutstandingAssertionStatusUpdater
- (NSUUID)assertionUUID;
- (int)assertType;
- (void)setAssertType:(int)a3;
- (void)setAssertionUUID:(id)a3;
@end

@implementation NPKOutstandingAssertionStatusUpdater

- (NSUUID)assertionUUID
{
  return self->_assertionUUID;
}

- (void)setAssertionUUID:(id)a3
{
}

- (int)assertType
{
  return self->_assertType;
}

- (void)setAssertType:(int)a3
{
  self->_assertType = a3;
}

- (void).cxx_destruct
{
}

@end