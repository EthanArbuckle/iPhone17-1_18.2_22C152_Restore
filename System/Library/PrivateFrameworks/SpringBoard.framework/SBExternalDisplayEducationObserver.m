@interface SBExternalDisplayEducationObserver
- (SBExternalDisplayEducationObserver)initWithBannerPoster:(id)a3;
- (void)_deviceConnectionWindowExpired:(id)a3;
- (void)_extendedDisplayControllerDidConnect:(id)a3;
- (void)_extendedDisplayControllerDidDisconnect:(id)a3;
- (void)_hardwareAvailabilityChanged:(id)a3;
- (void)dealloc;
@end

@implementation SBExternalDisplayEducationObserver

- (SBExternalDisplayEducationObserver)initWithBannerPoster:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBExternalDisplayEducationObserver;
  v6 = [(SBExternalDisplayEducationObserver *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bannerPoster, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__extendedDisplayControllerDidConnect_ name:@"SBSystemShellExtendedDisplayControllerPolicyConnectNotification" object:0];
    [v8 addObserver:v7 selector:sel__extendedDisplayControllerDidDisconnect_ name:@"SBSystemShellExtendedDisplayControllerPolicyDisconnectNotification" object:0];
    [v8 addObserver:v7 selector:sel__deviceConnectionWindowExpired_ name:@"SBSystemShellExtendedDisplayControllerPolicyDeviceConnectionWindowExpiredNotification" object:0];
    [v8 addObserver:v7 selector:sel__hardwareAvailabilityChanged_ name:@"SBSystemShellExtendedDisplayControllerHardwareAvailabilityNotification" object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBExternalDisplayEducationObserver;
  [(SBExternalDisplayEducationObserver *)&v4 dealloc];
}

- (void)_extendedDisplayControllerDidConnect:(id)a3
{
  id v14 = [a3 userInfo];
  id v5 = [v14 objectForKey:@"kSBSystemShellExtendedDisplayControllerDisplayIdentityKey"];
  if (!v5)
  {
    objc_super v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBExternalDisplayEducationObserver.m", 73, @"no displayIdentity for notification userInfo: %@", v14 object file lineNumber description];
  }
  v6 = [v14 objectForKey:@"kSBSystemShellExtendedDisplayControllerHardwareAvailabilityIsAvailableKey"];
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBExternalDisplayEducationObserver.m", 75, @"no hardware availability for notification userInfo: %@", v14 object file lineNumber description];
  }
  uint64_t v7 = [v6 BOOLValue];
  if (self->_educationSession)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [(SBExternalDisplayEducationSession *)self->_educationSession displayIdentity];
    [v12 handleFailureInMethod:a2, self, @"SBExternalDisplayEducationObserver.m", 79, @"being told a display connected when we're already tracking a session for: %@", v13 object file lineNumber description];
  }
  v8 = [[SBExternalDisplayEducationSession alloc] initWithDisplayIdentity:v5 hardwareAvailability:v7 bannerPoster:self->_bannerPoster];
  educationSession = self->_educationSession;
  self->_educationSession = v8;

  [(SBExternalDisplayEducationSession *)self->_educationSession displayConnected];
}

- (void)_extendedDisplayControllerDidDisconnect:(id)a3
{
  id v10 = [a3 userInfo];
  id v5 = [v10 objectForKey:@"kSBSystemShellExtendedDisplayControllerDisplayIdentityKey"];
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBExternalDisplayEducationObserver.m", 87, @"no displayIdentity for notification userInfo: %@", v10 object file lineNumber description];
  }
  educationSession = self->_educationSession;
  if (!educationSession)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBExternalDisplayEducationObserver.m", 88, @"being told a display disconnected when we're not tracking a session for that display: %@", v5 object file lineNumber description];

    educationSession = self->_educationSession;
  }
  [(SBExternalDisplayEducationSession *)educationSession displayDisconnected];
  uint64_t v7 = self->_educationSession;
  self->_educationSession = 0;
}

- (void)_deviceConnectionWindowExpired:(id)a3
{
  id v9 = [a3 userInfo];
  id v5 = [v9 objectForKey:@"kSBSystemShellExtendedDisplayControllerDisplayIdentityKey"];
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBExternalDisplayEducationObserver.m", 96, @"no displayIdentity for notification userInfo: %@", v9 object file lineNumber description];
  }
  educationSession = self->_educationSession;
  if (!educationSession)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBExternalDisplayEducationObserver.m", 97, @"being told device connection window expired when we're not tracking a session for that display: %@", v5 object file lineNumber description];

    educationSession = self->_educationSession;
  }
  [(SBExternalDisplayEducationSession *)educationSession deviceConnectionWindowExpired];
}

- (void)_hardwareAvailabilityChanged:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = [a3 userInfo];
  v6 = [v5 objectForKey:@"kSBSystemShellExtendedDisplayControllerDisplayIdentityKey"];
  if (!v6)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBExternalDisplayEducationObserver.m", 104, @"no displayIdentity for notification userInfo: %@", v5 object file lineNumber description];
  }
  uint64_t v7 = [v5 objectForKey:@"kSBSystemShellExtendedDisplayControllerHardwareAvailabilityIsAvailableKey"];
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SBExternalDisplayEducationObserver.m", 106, @"no hardware availability for notification userInfo: %@", v5 object file lineNumber description];
  }
  v8 = [v5 objectForKey:@"kSBSystemShellExtendedDisplayControllerFiredDuringDeviceConnectionWindowKey"];
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBExternalDisplayEducationObserver.m", 108, @"no connection window info for notification userInfo: %@", v5 object file lineNumber description];
  }
  id v9 = [(SBExternalDisplayEducationSession *)self->_educationSession displayIdentity];
  int v10 = [v9 isEqual:v6];

  if (v10)
  {
    -[SBExternalDisplayEducationSession updateHardwareAvailability:withinDisplayConnectionWindow:](self->_educationSession, "updateHardwareAvailability:withinDisplayConnectionWindow:", [v7 BOOLValue], objc_msgSend(v8, "BOOLValue"));
  }
  else
  {
    v11 = SBLogDisplayEducation();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = _SBFLoggingMethodProem();
      v13 = [(SBExternalDisplayEducationSession *)self->_educationSession displayIdentity];
      *(_DWORD *)buf = 138543874;
      v18 = v12;
      __int16 v19 = 2114;
      v20 = v13;
      __int16 v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ being told hardware availability changed but we're not tracking a session for that display. tracking: %{public}@; received: %{public}@",
        buf,
        0x20u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_educationSession, 0);
  objc_storeStrong((id *)&self->_bannerPoster, 0);
}

@end