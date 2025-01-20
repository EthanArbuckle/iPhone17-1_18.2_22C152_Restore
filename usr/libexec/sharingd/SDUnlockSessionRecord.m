@interface SDUnlockSessionRecord
- (NSData)keyData;
- (id)description;
- (int64_t)unlockSessionID;
- (unint64_t)expireTime;
- (void)setExpireTime:(unint64_t)a3;
- (void)setKeyData:(id)a3;
- (void)setUnlockSessionID:(int64_t)a3;
@end

@implementation SDUnlockSessionRecord

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p> (unlockSession = %ld, expireTime = %lld, keyData = %@)", v4, self, self->_unlockSessionID, self->_expireTime, self->_keyData];

  return v5;
}

- (NSData)keyData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKeyData:(id)a3
{
}

- (int64_t)unlockSessionID
{
  return self->_unlockSessionID;
}

- (void)setUnlockSessionID:(int64_t)a3
{
  self->_unlockSessionID = a3;
}

- (unint64_t)expireTime
{
  return self->_expireTime;
}

- (void)setExpireTime:(unint64_t)a3
{
  self->_expireTime = a3;
}

- (void).cxx_destruct
{
}

@end