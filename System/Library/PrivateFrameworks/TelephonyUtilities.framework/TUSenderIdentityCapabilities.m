@interface TUSenderIdentityCapabilities
- (BOOL)canAttemptEmergencyCallsWithoutCellularConnection;
- (BOOL)canAttemptTelephonyCallsWithoutCellularConnection;
- (BOOL)isCSCallingCurrentlyAvailable;
- (BOOL)isEmergencyWiFiCallingCurrentlyAvailable;
- (BOOL)isThumperCallingAllowedForCurrentDevice;
- (BOOL)isThumperCallingAllowedOnDefaultPairedSecondaryDevice;
- (BOOL)isThumperCallingAllowedOnSecondaryDeviceWithID:(id)a3;
- (BOOL)isThumperCallingCurrentlyAvailable;
- (BOOL)isThumperCallingEnabled;
- (BOOL)isThumperCallingProvisioningURLInvalid;
- (BOOL)isVoLTECallingCurrentlyAvailable;
- (BOOL)isVoLTECallingEnabled;
- (BOOL)isWiFiCallingCurrentlyAvailable;
- (BOOL)isWiFiCallingEnabled;
- (BOOL)isWiFiCallingProvisioningURLInvalid;
- (BOOL)isWiFiCallingRoamingEnabled;
- (BOOL)supportsEmergencyWiFiCalling;
- (BOOL)supportsSimultaneousVoiceAndData;
- (BOOL)supportsThumperCalling;
- (BOOL)supportsThumperCallingOverCellularData;
- (BOOL)supportsVoLTECalling;
- (BOOL)supportsWiFiCalling;
- (BOOL)supportsWiFiCallingRoaming;
- (NSData)thumperCallingProvisioningPostData;
- (NSData)wiFiCallingProvisioningPostData;
- (NSString)thumperCallingLocalDeviceID;
- (NSURL)thumperCallingProvisioningURL;
- (NSURL)wiFiCallingProvisioningURL;
- (NSUUID)senderIdentityUUID;
- (TUCTCapabilityInfo)thumperCallingCapabilityInfo;
- (TUCTCapabilityInfo)voLTECallingCapabilityInfo;
- (TUCTCapabilityInfo)wiFiCallingCapabilityInfo;
- (TUCallCapabilitiesXPCClient)client;
- (TUSenderIdentityCapabilities)initWithSenderIdentityUUID:(id)a3 state:(id)a4 client:(id)a5;
- (TUSenderIdentityCapabilitiesState)state;
- (id)debugDescription;
- (int)thumperCallingProvisioningStatus;
- (int)wiFiCallingProvisioningStatus;
- (void)_sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities:(id)a3;
- (void)cancelPinRequestFromPrimaryDeviceForThumperCalling;
- (void)invalidateAndRefreshThumperCallingProvisioningURL;
- (void)invalidateAndRefreshWiFiCallingProvisioningURL;
- (void)requestPinFromPrimaryDeviceForThumperCalling;
- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4;
- (void)setThumperCallingAllowedOnDefaultPairedSecondaryDevice:(BOOL)a3;
- (void)setThumperCallingEnabled:(BOOL)a3;
- (void)setThumperCallingLocalDeviceID:(id)a3;
- (void)setVoLTECallingEnabled:(BOOL)a3;
- (void)setWiFiCallingEnabled:(BOOL)a3;
- (void)setWiFiCallingRoamingEnabled:(BOOL)a3;
@end

@implementation TUSenderIdentityCapabilities

- (TUSenderIdentityCapabilities)initWithSenderIdentityUUID:(id)a3 state:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUSenderIdentityCapabilities;
  v11 = [(TUSenderIdentityCapabilities *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    senderIdentityUUID = v11->_senderIdentityUUID;
    v11->_senderIdentityUUID = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    state = v11->_state;
    v11->_state = (TUSenderIdentityCapabilitiesState *)v14;

    objc_storeStrong((id *)&v11->_client, a5);
  }

  return v11;
}

- (BOOL)supportsSimultaneousVoiceAndData
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  char v3 = [v2 supportsSimultaneousVoiceAndData];

  return v3;
}

- (BOOL)canAttemptTelephonyCallsWithoutCellularConnection
{
  if ([(TUSenderIdentityCapabilities *)self isWiFiCallingCurrentlyAvailable]) {
    return 1;
  }
  v4 = [(TUSenderIdentityCapabilities *)self client];
  v5 = [v4 state];
  if ([v5 supportsPrimaryCalling])
  {
    char v3 = 0;
  }
  else if ([(TUSenderIdentityCapabilities *)self isThumperCallingCurrentlyAvailable])
  {
    char v3 = 1;
  }
  else
  {
    v6 = [(TUSenderIdentityCapabilities *)self client];
    v7 = [v6 state];
    char v3 = [v7 areRelayCallingFeaturesEnabled];
  }
  return v3;
}

- (BOOL)canAttemptEmergencyCallsWithoutCellularConnection
{
  BOOL v3 = [(TUSenderIdentityCapabilities *)self canAttemptTelephonyCallsWithoutCellularConnection];
  if (v3)
  {
    LOBYTE(v3) = [(TUSenderIdentityCapabilities *)self isEmergencyWiFiCallingCurrentlyAvailable];
  }
  return v3;
}

- (BOOL)isCSCallingCurrentlyAvailable
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 csCallingCapabilitiesState];
  char v4 = [v3 isCurrentlyAvailable];

  return v4;
}

- (BOOL)supportsVoLTECalling
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 voLTECallingCapabilitiesState];
  char v4 = [v3 isSupported];

  return v4;
}

- (BOOL)isVoLTECallingEnabled
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 voLTECallingCapabilitiesState];
  char v4 = [v3 isEnabled];

  return v4;
}

- (TUCTCapabilityInfo)voLTECallingCapabilityInfo
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 voLTECallingCapabilitiesState];
  char v4 = [v3 ctCapabilityInfo];

  return (TUCTCapabilityInfo *)v4;
}

- (BOOL)isVoLTECallingCurrentlyAvailable
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 voLTECallingCapabilitiesState];
  char v4 = [v3 isCurrentlyAvailable];

  return v4;
}

- (BOOL)supportsWiFiCalling
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 wiFiCallingCapabilitiesState];
  char v4 = [v3 isSupported];

  return v4;
}

- (BOOL)isWiFiCallingEnabled
{
  BOOL v3 = [(TUSenderIdentityCapabilities *)self supportsWiFiCalling];
  if (v3)
  {
    char v4 = [(TUSenderIdentityCapabilities *)self state];
    v5 = [v4 wiFiCallingCapabilitiesState];
    char v6 = [v5 isEnabled];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)supportsWiFiCallingRoaming
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 wiFiCallingCapabilitiesState];
  char v4 = [v3 isRoamingSupported];

  return v4;
}

- (BOOL)isWiFiCallingRoamingEnabled
{
  BOOL v3 = [(TUSenderIdentityCapabilities *)self supportsWiFiCallingRoaming];
  if (v3)
  {
    char v4 = [(TUSenderIdentityCapabilities *)self state];
    v5 = [v4 wiFiCallingCapabilitiesState];
    char v6 = [v5 isRoamingEnabled];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (TUCTCapabilityInfo)wiFiCallingCapabilityInfo
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 wiFiCallingCapabilitiesState];
  char v4 = [v3 ctCapabilityInfo];

  return (TUCTCapabilityInfo *)v4;
}

- (BOOL)isWiFiCallingCurrentlyAvailable
{
  BOOL v3 = [(TUSenderIdentityCapabilities *)self isWiFiCallingEnabled];
  if (v3)
  {
    char v4 = [(TUSenderIdentityCapabilities *)self state];
    v5 = [v4 wiFiCallingCapabilitiesState];
    char v6 = [v5 isCurrentlyAvailable];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)supportsEmergencyWiFiCalling
{
  BOOL v3 = [(TUSenderIdentityCapabilities *)self supportsWiFiCalling];
  if (v3)
  {
    char v4 = [(TUSenderIdentityCapabilities *)self state];
    v5 = [v4 wiFiCallingCapabilitiesState];
    char v6 = [v5 isEmergencySupported];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isEmergencyWiFiCallingCurrentlyAvailable
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 wiFiCallingCapabilitiesState];
  char v4 = [v3 isEmergencyCurrentlyAvailable];

  return v4;
}

- (int)wiFiCallingProvisioningStatus
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 wiFiCallingCapabilitiesState];
  int v4 = [v3 provisioningStatus];

  return v4;
}

- (NSURL)wiFiCallingProvisioningURL
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 wiFiCallingCapabilitiesState];
  int v4 = [v3 provisioningURL];

  return (NSURL *)v4;
}

- (BOOL)isWiFiCallingProvisioningURLInvalid
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 wiFiCallingCapabilitiesState];
  char v4 = [v3 isProvisioningURLInvalid];

  return v4;
}

- (NSData)wiFiCallingProvisioningPostData
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 wiFiCallingCapabilitiesState];
  char v4 = [v3 provisioningPostData];

  return (NSData *)v4;
}

- (BOOL)supportsThumperCalling
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 thumperCallingCapabilitiesState];
  char v4 = [v3 isSupported];

  return v4;
}

- (BOOL)supportsThumperCallingOverCellularData
{
  v2 = [(TUSenderIdentityCapabilities *)self client];
  BOOL v3 = [v2 state];
  char v4 = [v3 supportsCellularData];

  return v4;
}

- (BOOL)isThumperCallingAllowedForCurrentDevice
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 thumperCallingCapabilitiesState];
  char v4 = [v3 isApproved];

  return v4;
}

- (BOOL)isThumperCallingEnabled
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 thumperCallingCapabilitiesState];
  char v4 = [v3 isEnabled];

  return v4;
}

- (TUCTCapabilityInfo)thumperCallingCapabilityInfo
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 thumperCallingCapabilitiesState];
  char v4 = [v3 ctCapabilityInfo];

  return (TUCTCapabilityInfo *)v4;
}

- (BOOL)isThumperCallingCurrentlyAvailable
{
  BOOL v3 = [(TUSenderIdentityCapabilities *)self isThumperCallingEnabled];
  if (v3)
  {
    char v4 = [(TUSenderIdentityCapabilities *)self state];
    v5 = [v4 thumperCallingCapabilitiesState];
    char v6 = [v5 isCurrentlyAvailable];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (int)thumperCallingProvisioningStatus
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 thumperCallingCapabilitiesState];
  int v4 = [v3 provisioningStatus];

  return v4;
}

- (NSURL)thumperCallingProvisioningURL
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 thumperCallingCapabilitiesState];
  int v4 = [v3 provisioningURL];

  return (NSURL *)v4;
}

- (BOOL)isThumperCallingProvisioningURLInvalid
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 thumperCallingCapabilitiesState];
  char v4 = [v3 isProvisioningURLInvalid];

  return v4;
}

- (NSData)thumperCallingProvisioningPostData
{
  v2 = [(TUSenderIdentityCapabilities *)self state];
  BOOL v3 = [v2 thumperCallingCapabilitiesState];
  char v4 = [v3 provisioningPostData];

  return (NSData *)v4;
}

- (BOOL)isThumperCallingAllowedOnSecondaryDeviceWithID:(id)a3
{
  id v5 = a3;
  char v6 = [(TUSenderIdentityCapabilities *)self client];
  v7 = [v6 state];
  char v8 = [v7 supportsPrimaryCalling];

  if ((v8 & 1) == 0)
  {
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s can only be called from devices with [TUCallCapabilities supportsPrimaryCalling] = YES", "-[TUSenderIdentityCapabilities isThumperCallingAllowedOnSecondaryDeviceWithID:]");
    NSLog(&cfstr_TuassertionFai.isa, v9);

    if (_TUAssertShouldCrashApplication())
    {
      id v10 = [(TUSenderIdentityCapabilities *)self client];
      v11 = [v10 state];
      char v12 = [v11 supportsPrimaryCalling];

      if ((v12 & 1) == 0)
      {
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUSenderIdentityCapabilities.m", 183, @"%s can only be called from devices with [TUCallCapabilities supportsPrimaryCalling] = YES", "-[TUSenderIdentityCapabilities isThumperCallingAllowedOnSecondaryDeviceWithID:]");
      }
    }
  }
  v13 = [(TUSenderIdentityCapabilities *)self state];
  uint64_t v14 = [v13 thumperCallingCapabilitiesState];

  v15 = [v14 approvedSecondaryDeviceIDs];
  char v16 = [v15 containsObject:v5];

  return v16;
}

- (BOOL)isThumperCallingAllowedOnDefaultPairedSecondaryDevice
{
  char v4 = [(TUSenderIdentityCapabilities *)self client];
  id v5 = [v4 state];
  char v6 = [v5 supportsPrimaryCalling];

  if ((v6 & 1) == 0)
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s can only be called from devices with [TUCallCapabilities supportsPrimaryCalling] = YES", "-[TUSenderIdentityCapabilities isThumperCallingAllowedOnDefaultPairedSecondaryDevice]");
    NSLog(&cfstr_TuassertionFai.isa, v7);

    if (_TUAssertShouldCrashApplication())
    {
      char v8 = [(TUSenderIdentityCapabilities *)self client];
      id v9 = [v8 state];
      char v10 = [v9 supportsPrimaryCalling];

      if ((v10 & 1) == 0)
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUSenderIdentityCapabilities.m", 190, @"%s can only be called from devices with [TUCallCapabilities supportsPrimaryCalling] = YES", "-[TUSenderIdentityCapabilities isThumperCallingAllowedOnDefaultPairedSecondaryDevice]");
      }
    }
  }
  v11 = [(TUSenderIdentityCapabilities *)self state];
  char v12 = [v11 thumperCallingCapabilitiesState];

  if ([v12 supportsDefaultPairedDevice])
  {
    v13 = [(TUSenderIdentityCapabilities *)self client];
    uint64_t v14 = [v13 state];
    v15 = [v14 defaultPairedDevice];
    char v16 = [v15 uniqueID];
    BOOL v17 = [(TUSenderIdentityCapabilities *)self isThumperCallingAllowedOnSecondaryDeviceWithID:v16];
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)setVoLTECallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set VoLTE calling enabled to %d", (uint8_t *)v8, 8u);
  }

  char v6 = [(TUSenderIdentityCapabilities *)self client];
  v7 = [(TUSenderIdentityCapabilities *)self senderIdentityUUID];
  [v6 setVoLTECallingEnabled:v3 forSenderIdentityWithUUID:v7];
}

- (void)setWiFiCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set WiFi calling enabled to %d", (uint8_t *)v8, 8u);
  }

  char v6 = [(TUSenderIdentityCapabilities *)self client];
  v7 = [(TUSenderIdentityCapabilities *)self senderIdentityUUID];
  [v6 setWiFiCallingEnabled:v3 forSenderIdentityWithUUID:v7];
}

- (void)setWiFiCallingRoamingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set WiFi calling roaming enabled to %d", (uint8_t *)v8, 8u);
  }

  char v6 = [(TUSenderIdentityCapabilities *)self client];
  v7 = [(TUSenderIdentityCapabilities *)self senderIdentityUUID];
  [v6 setWiFiCallingRoamingEnabled:v3 forSenderIdentityWithUUID:v7];
}

- (void)invalidateAndRefreshWiFiCallingProvisioningURL
{
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Asked to invalidate and refresh WiFi calling provisioning URL", v6, 2u);
  }

  char v4 = [(TUSenderIdentityCapabilities *)self client];
  id v5 = [(TUSenderIdentityCapabilities *)self senderIdentityUUID];
  [v4 invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID:v5];
}

- (void)setThumperCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set Thumper calling enabled to %d", (uint8_t *)v8, 8u);
  }

  char v6 = [(TUSenderIdentityCapabilities *)self client];
  v7 = [(TUSenderIdentityCapabilities *)self senderIdentityUUID];
  [v6 setThumperCallingEnabled:v3 forSenderIdentityWithUUID:v7];
}

- (void)invalidateAndRefreshThumperCallingProvisioningURL
{
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Asked to invalidate and refresh Thumper calling provisioning URL", v6, 2u);
  }

  char v4 = [(TUSenderIdentityCapabilities *)self client];
  id v5 = [(TUSenderIdentityCapabilities *)self senderIdentityUUID];
  [v4 invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID:v5];
}

- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  char v8 = [(TUSenderIdentityCapabilities *)self client];
  uint64_t v9 = [v8 state];
  char v10 = [v9 supportsPrimaryCalling];

  if ((v10 & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUSenderIdentityCapabilities.m", 237, @"%s can only be called from devices with [TUCallCapabilities supportsPrimaryCalling] = YES", "-[TUSenderIdentityCapabilities setThumperCallingAllowed:onSecondaryDeviceWithID:]");
  }
  v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v16 = v4;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Asked to set Thumper calling allowed to %d on secondary device with ID %@", buf, 0x12u);
  }

  char v12 = [(TUSenderIdentityCapabilities *)self client];
  v13 = [(TUSenderIdentityCapabilities *)self senderIdentityUUID];
  [v12 setThumperCallingAllowed:v4 onSecondaryDeviceWithID:v7 forSenderIdentityWithUUID:v13];
}

- (void)setThumperCallingAllowedOnDefaultPairedSecondaryDevice:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v6 = [(TUSenderIdentityCapabilities *)self client];
  id v7 = [v6 state];
  char v8 = [v7 supportsPrimaryCalling];

  if ((v8 & 1) == 0)
  {
    char v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUSenderIdentityCapabilities.m", 244, @"%s can only be called from devices with [TUCallCapabilities supportsPrimaryCalling] = YES", "-[TUSenderIdentityCapabilities setThumperCallingAllowedOnDefaultPairedSecondaryDevice:]");
  }
  uint64_t v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v14 = v3;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Asked to set Thumper calling allowed on paired secondary device to %d", buf, 8u);
  }

  char v10 = [(TUSenderIdentityCapabilities *)self client];
  v11 = [(TUSenderIdentityCapabilities *)self senderIdentityUUID];
  [v10 setThumperCallingAllowedOnDefaultPairedDevice:v3 forSenderIdentityWithUUID:v11];
}

- (void)requestPinFromPrimaryDeviceForThumperCalling
{
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Asked to request PIN from primary device for Thumper calling", v5, 2u);
  }

  BOOL v4 = [(TUSenderIdentityCapabilities *)self client];
  [v4 requestPinFromPrimaryDevice];
}

- (void)cancelPinRequestFromPrimaryDeviceForThumperCalling
{
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Asked to cancel PIN from primary device for Thumper calling", v5, 2u);
  }

  BOOL v4 = [(TUSenderIdentityCapabilities *)self client];
  [v4 cancelPinRequestFromPrimaryDevice];
}

- (void)_sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 isWiFiCallingEnabled];
  int v52 = [v4 isVoLTECallingEnabled];
  int v54 = [v4 supportsThumperCalling];
  int v43 = [v4 supportsThumperCallingOverCellularData];
  int v50 = [v4 isThumperCallingEnabled];
  char v6 = [v4 thumperCallingCapabilityInfo];
  int v48 = [v6 provisioningStatus];

  id v7 = [v4 wiFiCallingCapabilityInfo];
  v44 = [v7 provisioningURL];

  char v8 = [v4 thumperCallingCapabilityInfo];
  v45 = [v8 provisioningURL];

  uint64_t v9 = [v4 state];
  char v10 = [v9 thumperCallingCapabilitiesState];
  int v42 = [v10 isAssociated];

  v11 = [v4 state];

  char v12 = [v11 thumperCallingCapabilitiesState];
  int v46 = [v12 supportsDefaultPairedDevice];

  int v13 = [(TUSenderIdentityCapabilities *)self isWiFiCallingEnabled];
  int v14 = [(TUSenderIdentityCapabilities *)self isVoLTECallingEnabled];
  int v53 = [(TUSenderIdentityCapabilities *)self supportsThumperCalling];
  BOOL v51 = [(TUSenderIdentityCapabilities *)self supportsThumperCallingOverCellularData];
  BOOL v49 = [(TUSenderIdentityCapabilities *)self isThumperCallingEnabled];
  uint64_t v15 = [(TUSenderIdentityCapabilities *)self thumperCallingCapabilityInfo];
  int v47 = [v15 provisioningStatus];

  BOOL v16 = [(TUSenderIdentityCapabilities *)self wiFiCallingCapabilityInfo];
  __int16 v17 = [v16 provisioningURL];

  id v18 = [(TUSenderIdentityCapabilities *)self thumperCallingCapabilityInfo];
  uint64_t v19 = [v18 provisioningURL];

  v20 = [(TUSenderIdentityCapabilities *)self state];
  v21 = [v20 thumperCallingCapabilitiesState];
  int v41 = [v21 isAssociated];

  v22 = [(TUSenderIdentityCapabilities *)self state];
  v23 = [v22 thumperCallingCapabilitiesState];
  int v24 = [v23 supportsDefaultPairedDevice];

  unint64_t v25 = 0x1E4F28000;
  if (v5 != v13)
  {
    v26 = TUDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v61 = v5;
      *(_WORD *)&v61[4] = 1024;
      *(_DWORD *)&v61[6] = v13;
      _os_log_impl(&dword_19C496000, v26, OS_LOG_TYPE_DEFAULT, "WiFi capabilities changed from %d to %d", buf, 0xEu);
    }

    v27 = [(TUSenderIdentityCapabilities *)self client];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke;
    v59[3] = &unk_1E58E6058;
    v59[4] = self;
    [v27 performDelegateCallbackBlock:v59];

    unint64_t v25 = 0x1E4F28000uLL;
    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 postNotificationName:@"TUCallCapabilitiesWiFiCallingChangedNotification" object:0];
  }
  if (v52 != v14)
  {
    v29 = TUDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v61 = v52;
      *(_WORD *)&v61[4] = 1024;
      *(_DWORD *)&v61[6] = v14;
      _os_log_impl(&dword_19C496000, v29, OS_LOG_TYPE_DEFAULT, "VoLTE capabilities changed from %d to %d", buf, 0xEu);
    }

    v30 = [(TUSenderIdentityCapabilities *)self client];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_12;
    v58[3] = &unk_1E58E6058;
    v58[4] = self;
    [v30 performDelegateCallbackBlock:v58];

    v31 = [*(id *)(v25 + 3768) defaultCenter];
    [v31 postNotificationName:@"TUCallCapabilitiesVoLTECallingChangedNotification" object:0];
  }
  if (v54 != v53
    || ((v43 ^ v51) & 1) != 0
    || ((v50 ^ v49) & 1) != 0
    || v48 != v47
    || ((v46 ^ v24) & 1) != 0
    || v42 != v41)
  {
    v32 = TUDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67111936;
      *(_DWORD *)v61 = v54;
      *(_WORD *)&v61[4] = 1024;
      *(_DWORD *)&v61[6] = v43;
      LOWORD(v62) = 1024;
      *(_DWORD *)((char *)&v62 + 2) = v50;
      HIWORD(v62) = 1024;
      int v63 = v48;
      __int16 v64 = 1024;
      int v65 = v42;
      __int16 v66 = 1024;
      int v67 = v46;
      __int16 v68 = 1024;
      int v69 = v53;
      __int16 v70 = 1024;
      BOOL v71 = v51;
      __int16 v72 = 1024;
      BOOL v73 = v49;
      __int16 v74 = 1024;
      int v75 = v47;
      __int16 v76 = 1024;
      int v77 = v41;
      __int16 v78 = 1024;
      int v79 = v24;
      _os_log_impl(&dword_19C496000, v32, OS_LOG_TYPE_DEFAULT, "Thumper capabilities changed from (supported=%d overCellularData=%d enabled=%d provisioningStatus=%d, associated=%d, supportsDefaultPairedDevice=%d) to (supported=%d overCellularData=%d enabled=%d provisioningStatus=%d, associated=%d, supportsDefaultPairedDevice=%d)", buf, 0x4Au);
    }

    v33 = [(TUSenderIdentityCapabilities *)self client];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_15;
    v57[3] = &unk_1E58E6058;
    v57[4] = self;
    [v33 performDelegateCallbackBlock:v57];

    v34 = [*(id *)(v25 + 3768) defaultCenter];
    [v34 postNotificationName:@"TUCallCapabilitiesThumperCallingChangedNotification" object:0];
  }
  if ((TUObjectsAreEqualOrNil((unint64_t)v44, (uint64_t)v17) & 1) == 0)
  {
    v35 = TUDefaultLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v61 = v44;
      *(_WORD *)&v61[8] = 2112;
      v62 = v17;
      _os_log_impl(&dword_19C496000, v35, OS_LOG_TYPE_DEFAULT, "WiFi calling URL changed from %@ to %@", buf, 0x16u);
    }

    v36 = [(TUSenderIdentityCapabilities *)self client];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_18;
    v56[3] = &unk_1E58E6058;
    v56[4] = self;
    [v36 performDelegateCallbackBlock:v56];

    v37 = [*(id *)(v25 + 3768) defaultCenter];
    [v37 postNotificationName:@"TUCallCapabilitiesWiFiCallingProvisioningURLChangedNotification" object:0];
  }
  if ((TUObjectsAreEqualOrNil((unint64_t)v45, (uint64_t)v19) & 1) == 0)
  {
    v38 = TUDefaultLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v61 = v45;
      *(_WORD *)&v61[8] = 2112;
      v62 = v19;
      _os_log_impl(&dword_19C496000, v38, OS_LOG_TYPE_DEFAULT, "Thumper calling URL changed from %@ to %@", buf, 0x16u);
    }

    v39 = [(TUSenderIdentityCapabilities *)self client];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_21;
    v55[3] = &unk_1E58E6058;
    v55[4] = self;
    [v39 performDelegateCallbackBlock:v55];

    v40 = [*(id *)(v25 + 3768) defaultCenter];
    [v40 postNotificationName:@"TUCallCapabilitiesThumperCallingProvisioningURLChangedNotification" object:0];
  }
}

void __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) senderIdentityUUID];
    [v4 didChangeWiFiCallingCapabilitiesForSenderIdentityWithUUID:v3];
  }
}

void __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_12(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) senderIdentityUUID];
    [v4 didChangeVoLTECallingCapabilitiesForSenderIdentityWithUUID:v3];
  }
}

void __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_15(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) senderIdentityUUID];
    [v4 didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:v3];
  }
}

void __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_18(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) senderIdentityUUID];
    [v4 didChangeWiFiCallingProvisionalURLForSenderIdentityWithUUID:v3];
  }
}

void __103__TUSenderIdentityCapabilities__sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities___block_invoke_21(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) senderIdentityUUID];
    [v4 didChangeThumperCallingProvisionalURLForSenderIdentityWithUUID:v3];
  }
}

- (id)debugDescription
{
  BOOL v3 = [MEMORY[0x1E4F28E78] stringWithString:@"== TUSenderIdentityCapabilities ==\n"];
  [v3 appendString:@"CDMA:\n"];
  objc_msgSend(v3, "appendFormat:", @"    supportsSimultaneousVoiceAndData: %d\n", -[TUSenderIdentityCapabilities supportsSimultaneousVoiceAndData](self, "supportsSimultaneousVoiceAndData"));
  [v3 appendString:@"Wi-Fi calling:\n"];
  objc_msgSend(v3, "appendFormat:", @"    supportsWiFiCalling: %d\n", -[TUSenderIdentityCapabilities supportsWiFiCalling](self, "supportsWiFiCalling"));
  objc_msgSend(v3, "appendFormat:", @"    isWiFiCallingEnabled: %d\n", -[TUSenderIdentityCapabilities isWiFiCallingEnabled](self, "isWiFiCallingEnabled"));
  objc_msgSend(v3, "appendFormat:", @"    isWiFiCallingCurrentlyAvailable: %d\n", -[TUSenderIdentityCapabilities isWiFiCallingCurrentlyAvailable](self, "isWiFiCallingCurrentlyAvailable"));
  objc_msgSend(v3, "appendFormat:", @"    supportsEmergencyWiFiCalling: %d\n", -[TUSenderIdentityCapabilities supportsEmergencyWiFiCalling](self, "supportsEmergencyWiFiCalling"));
  objc_msgSend(v3, "appendFormat:", @"    isEmergencyWiFiCallingCurrentlyAvailable: %d\n", -[TUSenderIdentityCapabilities isEmergencyWiFiCallingCurrentlyAvailable](self, "isEmergencyWiFiCallingCurrentlyAvailable"));
  [v3 appendString:@"VoLTE calling:\n"];
  objc_msgSend(v3, "appendFormat:", @"    supportsVoLTECalling: %d\n", -[TUSenderIdentityCapabilities supportsVoLTECalling](self, "supportsVoLTECalling"));
  objc_msgSend(v3, "appendFormat:", @"    isVoLTECallingEnabled: %d\n", -[TUSenderIdentityCapabilities isVoLTECallingEnabled](self, "isVoLTECallingEnabled"));
  objc_msgSend(v3, "appendFormat:", @"    isVoLTECallingCurrentlyAvailable: %d\n", -[TUSenderIdentityCapabilities isVoLTECallingCurrentlyAvailable](self, "isVoLTECallingCurrentlyAvailable"));
  [v3 appendString:@"Thumper calling:\n"];
  objc_msgSend(v3, "appendFormat:", @"    supportsThumperCalling: %d\n", -[TUSenderIdentityCapabilities supportsThumperCalling](self, "supportsThumperCalling"));
  objc_msgSend(v3, "appendFormat:", @"    isThumperCallingAllowedForCurrentDevice: %d\n", -[TUSenderIdentityCapabilities isThumperCallingAllowedForCurrentDevice](self, "isThumperCallingAllowedForCurrentDevice"));
  objc_msgSend(v3, "appendFormat:", @"    isThumperCallingEnabled: %d\n", -[TUSenderIdentityCapabilities isThumperCallingEnabled](self, "isThumperCallingEnabled"));
  objc_msgSend(v3, "appendFormat:", @"    supportsThumperCallingOverCellularData: %d\n", -[TUSenderIdentityCapabilities supportsThumperCallingOverCellularData](self, "supportsThumperCallingOverCellularData"));
  objc_msgSend(v3, "appendFormat:", @"    isThumperCallingCurrentlyAvailable: %d\n", -[TUSenderIdentityCapabilities isThumperCallingCurrentlyAvailable](self, "isThumperCallingCurrentlyAvailable"));

  return v3;
}

- (NSUUID)senderIdentityUUID
{
  return self->_senderIdentityUUID;
}

- (NSString)thumperCallingLocalDeviceID
{
  return self->_thumperCallingLocalDeviceID;
}

- (void)setThumperCallingLocalDeviceID:(id)a3
{
}

- (TUSenderIdentityCapabilitiesState)state
{
  return self->_state;
}

- (TUCallCapabilitiesXPCClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_thumperCallingLocalDeviceID, 0);

  objc_storeStrong((id *)&self->_senderIdentityUUID, 0);
}

@end