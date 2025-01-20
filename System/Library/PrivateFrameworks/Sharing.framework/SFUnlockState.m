@interface SFUnlockState
+ (BOOL)supportsSecureCoding;
- (NSNumber)remotePasscodeEnabled;
- (NSNumber)unlockEnabled;
- (SFUnlockState)initWithCoder:(id)a3;
- (SFUnlockState)initWithUnlockEnabled:(id)a3 remotePasscodeEnabled:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFUnlockState

- (SFUnlockState)initWithUnlockEnabled:(id)a3 remotePasscodeEnabled:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SFUnlockState;
  v8 = [(SFUnlockState *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    unlockEnabled = v8->_unlockEnabled;
    v8->_unlockEnabled = (NSNumber *)v9;

    uint64_t v11 = [v7 copy];
    remotePasscodeEnabled = v8->_remotePasscodeEnabled;
    v8->_remotePasscodeEnabled = (NSNumber *)v11;
  }
  return v8;
}

- (SFUnlockState)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFUnlockState;
  v5 = [(SFUnlockState *)&v13 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UnlockEnabled"];
    uint64_t v7 = [v6 copy];
    unlockEnabled = v5->_unlockEnabled;
    v5->_unlockEnabled = (NSNumber *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemotePasscodeEnabled"];
    uint64_t v10 = [v9 copy];
    remotePasscodeEnabled = v5->_remotePasscodeEnabled;
    v5->_remotePasscodeEnabled = (NSNumber *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unlockEnabled = self->_unlockEnabled;
  id v5 = a3;
  [v5 encodeObject:unlockEnabled forKey:@"UnlockEnabled"];
  [v5 encodeObject:self->_remotePasscodeEnabled forKey:@"RemotePasscodeEnabled"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)unlockEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)remotePasscodeEnabled
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePasscodeEnabled, 0);

  objc_storeStrong((id *)&self->_unlockEnabled, 0);
}

@end