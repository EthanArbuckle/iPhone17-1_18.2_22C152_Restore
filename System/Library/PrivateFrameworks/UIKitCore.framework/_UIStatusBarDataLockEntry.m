@interface _UIStatusBarDataLockEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_UIStatusBarDataLockEntry)initWithCoder:(id)a3;
- (id)_ui_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)unlockFailureCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setUnlockFailureCount:(int64_t)a3;
@end

@implementation _UIStatusBarDataLockEntry

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataLockEntry;
  return self->_unlockFailureCount ^ [(_UIStatusBarDataEntry *)&v3 hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataLockEntry;
  id v4 = [(_UIStatusBarDataEntry *)&v6 copyWithZone:a3];
  [v4 setUnlockFailureCount:self->_unlockFailureCount];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataLockEntry;
  id v4 = a3;
  [(_UIStatusBarDataEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_unlockFailureCount, @"unlockFailureCount", v5.receiver, v5.super_class);
}

- (_UIStatusBarDataLockEntry)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataLockEntry;
  id v3 = a3;
  id v4 = [(_UIStatusBarDataEntry *)&v7 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeIntegerForKey:", @"unlockFailureCount", v7.receiver, v7.super_class);

  [(_UIStatusBarDataLockEntry *)v4 setUnlockFailureCount:v5];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarDataLockEntry;
  if ([(_UIStatusBarDataEntry *)&v9 isEqual:v4])
  {
    id v5 = v4;
    if (([v5 isEnabled] & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      int64_t unlockFailureCount = self->_unlockFailureCount;
      BOOL v7 = unlockFailureCount == [v5 unlockFailureCount];
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_ui_descriptionBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataLockEntry;
  v2 = [(_UIStatusBarDataEntry *)&v6 _ui_descriptionBuilder];
  id v3 = NSStringFromSelector(sel_unlockFailureCount);
  id v4 = [v2 appendKey:v3];

  return v4;
}

- (int64_t)unlockFailureCount
{
  return self->_unlockFailureCount;
}

- (void)setUnlockFailureCount:(int64_t)a3
{
  self->_int64_t unlockFailureCount = a3;
}

@end