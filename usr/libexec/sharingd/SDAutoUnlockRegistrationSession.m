@interface SDAutoUnlockRegistrationSession
- (id)description;
- (void)invalidate;
- (void)notifyDelegateWithError:(id)a3;
@end

@implementation SDAutoUnlockRegistrationSession

- (void)notifyDelegateWithError:(id)a3
{
  id v4 = a3;
  v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Registration session notifying delegate with error: %@", (uint8_t *)&v9, 0xCu);
  }

  v6 = [(SDAutoUnlockPairingSession *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(SDAutoUnlockPairingSession *)self delegate];
    [v8 session:self didCompleteWithError:v4];
  }
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(SDAutoUnlockPairingSession *)self deviceID];
  v6 = [(SDAutoUnlockPairingSession *)self sessionID];
  char v7 = +[NSString stringWithFormat:@"<%@: %p deviceID=%@ sessionID=%@>", v4, self, v5, v6];

  return v7;
}

- (void)invalidate
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockRegistrationSession;
  [(SDAutoUnlockPairingSession *)&v7 invalidate];
  v3 = [(SDAutoUnlockPairingSession *)self aksSession];
  unsigned int v4 = [v3 resetSession];

  v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v4) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reset Session: %@", buf, 0xCu);
  }

  [(SDAutoUnlockPairingSession *)self setDelegate:0];
}

@end