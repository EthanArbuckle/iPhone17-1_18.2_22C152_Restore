@interface MRExternalDeviceTransport
- (BOOL)isValid;
- (BOOL)requiresCustomPairing;
- (BOOL)shouldUseSystemAuthenticationPrompt;
- (BOOL)supportsIdleDisconnection;
- (BOOL)supportsReconnection;
- (MRDeviceInfo)deviceInfo;
- (NSArray)allowedPlayerPaths;
- (NSArray)subscribedPlayerPaths;
- (NSError)error;
- (NSString)hostname;
- (NSString)name;
- (NSString)uid;
- (id)createConnectionWithUserInfo:(id)a3;
- (int64_t)connectionType;
- (int64_t)port;
- (void)resetWithError:(id)a3;
- (void)setShouldUseSystemAuthenticationPrompt:(BOOL)a3;
@end

@implementation MRExternalDeviceTransport

- (id)createConnectionWithUserInfo:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDeviceTransport createConnectionWithUserInfo:]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (NSString)name
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDeviceTransport name]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (MRDeviceInfo)deviceInfo
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDeviceTransport deviceInfo]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (NSString)hostname
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDeviceTransport hostname]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (int64_t)port
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDeviceTransport port]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDeviceTransport shouldUseSystemAuthenticationPrompt]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)setShouldUseSystemAuthenticationPrompt:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDeviceTransport setShouldUseSystemAuthenticationPrompt:]");
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NSError)error
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDeviceTransport error]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)resetWithError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s is abstract", "-[MRExternalDeviceTransport resetWithError:]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)supportsIdleDisconnection
{
  return 1;
}

- (BOOL)supportsReconnection
{
  return 1;
}

- (NSString)uid
{
  return self->_uid;
}

- (BOOL)requiresCustomPairing
{
  return self->_requiresCustomPairing;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (NSArray)subscribedPlayerPaths
{
  return self->_subscribedPlayerPaths;
}

- (NSArray)allowedPlayerPaths
{
  return self->_allowedPlayerPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedPlayerPaths, 0);
  objc_storeStrong((id *)&self->_subscribedPlayerPaths, 0);

  objc_storeStrong((id *)&self->_uid, 0);
}

@end