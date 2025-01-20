@interface SDAutoUnlockPeer
+ (id)stringFromState:(unint64_t)a3;
- (BOOL)canPerformUnlocks;
- (BOOL)isKeyBagLocked;
- (BOOL)shouldRegister;
- (NSString)deviceID;
- (SDAutoUnlockPeer)initWithDeviceID:(id)a3;
- (id)description;
- (unint64_t)state;
- (void)handleBioLockout;
- (void)handleConfirmationFailed;
- (void)handleDeviceUnlocked;
- (void)handlePairedSuccessfully;
- (void)handleRegistrationBegan;
- (void)handleRegistrationCompletedSuccessfully:(BOOL)a3;
- (void)handleRegistrationFailedKeyLocked;
- (void)handleRemoteRegistrationRequested;
- (void)setDeviceID:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation SDAutoUnlockPeer

- (SDAutoUnlockPeer)initWithDeviceID:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockPeer;
  id v3 = a3;
  v4 = [(SDAutoUnlockPeer *)&v8 init];
  v5 = (NSString *)[v3 copyWithZone:v8.receiver];

  deviceID = v4->_deviceID;
  v4->_deviceID = v5;

  v4->_state = 0;
  return v4;
}

- (id)description
{
  id v3 = [(SDAutoUnlockPeer *)self deviceID];
  v4 = [objc_opt_class() stringFromState:-[SDAutoUnlockPeer state](self, "state")];
  v5 = +[NSString stringWithFormat:@"<SDAutoUnlockPeer: %p, deviceID = %@, state = %@>", self, v3, v4];

  return v5;
}

- (BOOL)shouldRegister
{
  return ![(SDAutoUnlockPeer *)self state] || (id)[(SDAutoUnlockPeer *)self state] == (id)4;
}

- (BOOL)canPerformUnlocks
{
  return (id)[(SDAutoUnlockPeer *)self state] == (id)3;
}

- (BOOL)isKeyBagLocked
{
  return (id)[(SDAutoUnlockPeer *)self state] == (id)4;
}

- (void)handlePairedSuccessfully
{
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(SDAutoUnlockPeer *)self deviceID];
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Pairing has armed: %@", (uint8_t *)&v5, 0xCu);
  }
  [(SDAutoUnlockPeer *)self setState:3];
}

- (void)handleRegistrationBegan
{
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(SDAutoUnlockPeer *)self deviceID];
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning registration for deviceID: %@", (uint8_t *)&v5, 0xCu);
  }
  [(SDAutoUnlockPeer *)self setState:1];
}

- (void)handleRegistrationCompletedSuccessfully:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  [(SDAutoUnlockPeer *)self setState:v3];
}

- (void)handleRegistrationFailedKeyLocked
{
}

- (void)handleDeviceUnlocked
{
  if ((id)[(SDAutoUnlockPeer *)self state] == (id)2)
  {
    uint64_t v3 = auto_unlock_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(SDAutoUnlockPeer *)self deviceID];
      int v8 = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unlock has armed: %@", (uint8_t *)&v8, 0xCu);
    }
    [(SDAutoUnlockPeer *)self setState:3];
  }
  else if ((id)[(SDAutoUnlockPeer *)self state] != (id)3)
  {
    int v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(SDAutoUnlockPeer *)self deviceID];
      v7 = [objc_opt_class() stringFromState:-[self state]];
      int v8 = 138412546;
      v9 = v6;
      __int16 v10 = 2112;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unlock did not arm %@ current state is %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)handleBioLockout
{
}

- (void)handleRemoteRegistrationRequested
{
}

- (void)handleConfirmationFailed
{
}

+ (id)stringFromState:(unint64_t)a3
{
  if (a3 > 4) {
    return @"Unknown";
  }
  else {
    return *(&off_1008CCC10 + a3);
  }
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end