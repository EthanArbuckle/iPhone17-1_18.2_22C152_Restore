@interface TUCallCapabilities
+ (BOOL)accountsMatchForSecondaryCalling;
+ (BOOL)accountsSupportSecondaryCalling;
+ (BOOL)areCTCapabilitiesValid;
+ (BOOL)areRelayCallingFeaturesEnabled;
+ (BOOL)canAttemptEmergencyCallsWithoutCellularConnection;
+ (BOOL)canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:(id)a3;
+ (BOOL)canAttemptTelephonyCallsWithoutCellularConnection;
+ (BOOL)canAttemptTelephonyCallsWithoutCellularConnectionWithSenderIdentityCapabilities:(id)a3;
+ (BOOL)isCSCallingCurrentlyAvailable;
+ (BOOL)isDirectFaceTimeAudioCallingCurrentlyAvailable;
+ (BOOL)isDirectFaceTimeVideoCallingCurrentlyAvailable;
+ (BOOL)isDirectTelephonyCallingCurrentlyAvailable;
+ (BOOL)isEmergencyCallbackModeEnabled;
+ (BOOL)isEmergencyCallbackPossible;
+ (BOOL)isRelayCallingEnabled;
+ (BOOL)isRelayCallingEnabledForDeviceWithID:(id)a3;
+ (BOOL)isSimultaneousVoiceAndDataSupportedForSIMWithUUID:(id)a3;
+ (BOOL)isThumperCallingAllowedForCurrentDevice;
+ (BOOL)isThumperCallingAllowedOnDefaultPairedSecondaryDevice;
+ (BOOL)isThumperCallingAllowedOnSecondaryDeviceWithID:(id)a3;
+ (BOOL)isThumperCallingCurrentlyAvailable;
+ (BOOL)isThumperCallingEnabled;
+ (BOOL)isVoLTECallingCurrentlyAvailable;
+ (BOOL)isVoLTECallingEnabled;
+ (BOOL)isWiFiCallingCurrentlyAvailable;
+ (BOOL)isWiFiCallingEnabled;
+ (BOOL)isWiFiCallingRoamingEnabled;
+ (BOOL)supportsBasebandCalling;
+ (BOOL)supportsDisplayingFaceTimeAudioCalls;
+ (BOOL)supportsDisplayingFaceTimeVideoCalls;
+ (BOOL)supportsDisplayingTelephonyCalls;
+ (BOOL)supportsFaceTimeAudioCalls;
+ (BOOL)supportsFaceTimeAudioRelayCalling;
+ (BOOL)supportsFaceTimeVideoCalls;
+ (BOOL)supportsFaceTimeVideoRelayCalling;
+ (BOOL)supportsPrimaryCalling;
+ (BOOL)supportsRelayCalling;
+ (BOOL)supportsSimultaneousVoiceAndData;
+ (BOOL)supportsTelephonyCalls;
+ (BOOL)supportsTelephonyRelayCalling;
+ (BOOL)supportsThumperCalling;
+ (BOOL)supportsThumperCallingOverCellularData;
+ (BOOL)supportsVoLTECalling;
+ (BOOL)supportsWiFiCalling;
+ (BOOL)supportsWiFiEmergencyCalling;
+ (NSArray)cloudCallingDevices;
+ (NSSet)senderIdentityCapabilities;
+ (NSString)outgoingRelayCallerID;
+ (TUCTCapabilityInfo)thumperCallingCapabilityInfo;
+ (TUCTCapabilityInfo)voLTECallingCapabilityInfo;
+ (TUCTCapabilityInfo)wiFiCallingCapabilityInfo;
+ (id)_senderIdentityCapabilitiesByUUID;
+ (id)client;
+ (id)debugDescription;
+ (id)senderIdentityCapabilitiesWithUUID:(id)a3;
+ (int)faceTimeAudioCallSupport;
+ (int)faceTimeVideoCallSupport;
+ (int)relayCallingAvailability;
+ (int)telephonyCallSupport;
+ (void)_sendNotificationsAndCallbacksAfterRunningBlock:(id)a3;
+ (void)addDelegate:(id)a3 queue:(id)a4;
+ (void)cancelPinRequestFromPrimaryDevice;
+ (void)endEmergencyCallbackMode;
+ (void)initializeCachedValues;
+ (void)invalidateAndRefreshThumperCallingProvisioningURL;
+ (void)invalidateAndRefreshWiFiCallingProvisioningURL;
+ (void)removeDelegate:(id)a3;
+ (void)requestPinFromPrimaryDevice;
+ (void)setRelayCallingEnabled:(BOOL)a3;
+ (void)setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4;
+ (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4;
+ (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5;
+ (void)setThumperCallingAllowedOnDefaultPairedSecondaryDevice:(BOOL)a3;
+ (void)setThumperCallingEnabled:(BOOL)a3;
+ (void)setVoLTECallingEnabled:(BOOL)a3;
+ (void)setWiFiCallingEnabled:(BOOL)a3;
+ (void)setWiFiCallingRoamingEnabled:(BOOL)a3;
@end

@implementation TUCallCapabilities

+ (BOOL)supportsDisplayingFaceTimeAudioCalls
{
  v2 = [a1 client];
  v3 = [v2 state];
  char v4 = [v3 supportsDisplayingFaceTimeAudioCalls];

  return v4;
}

+ (BOOL)supportsPrimaryCalling
{
  v2 = [a1 client];
  v3 = [v2 state];
  char v4 = [v3 supportsPrimaryCalling];

  return v4;
}

+ (id)client
{
  if (client_onceToken != -1) {
    dispatch_once(&client_onceToken, &__block_literal_global_63);
  }
  v2 = (void *)client_client;

  return v2;
}

uint64_t __28__TUCallCapabilities_client__block_invoke()
{
  client_client = objc_alloc_init(TUCallCapabilitiesXPCClient);

  return MEMORY[0x1F41817F8]();
}

+ (void)initializeCachedValues
{
  v2 = [a1 client];
}

+ (BOOL)supportsDisplayingFaceTimeVideoCalls
{
  v2 = [a1 client];
  v3 = [v2 state];
  char v4 = [v3 supportsDisplayingFaceTimeVideoCalls];

  return v4;
}

+ (BOOL)supportsTelephonyCalls
{
  return (int)[a1 telephonyCallSupport] > 1;
}

+ (BOOL)supportsFaceTimeAudioCalls
{
  return (int)[a1 faceTimeAudioCallSupport] > 1;
}

+ (BOOL)supportsFaceTimeVideoCalls
{
  return (int)[a1 faceTimeVideoCallSupport] > 1;
}

+ (BOOL)canAttemptTelephonyCallsWithoutCellularConnection
{
  if ([a1 isWiFiCallingCurrentlyAvailable]) {
    return 1;
  }
  if ([a1 supportsPrimaryCalling]) {
    return 0;
  }
  if ([a1 isThumperCallingCurrentlyAvailable]) {
    return 1;
  }

  return [a1 areRelayCallingFeaturesEnabled];
}

+ (BOOL)canAttemptTelephonyCallsWithoutCellularConnectionWithSenderIdentityCapabilities:(id)a3
{
  id v4 = a3;
  if ([v4 isWiFiCallingCurrentlyAvailable])
  {
LABEL_5:
    char v5 = 1;
    goto LABEL_6;
  }
  if (([a1 supportsPrimaryCalling] & 1) == 0)
  {
    if (([v4 isThumperCallingCurrentlyAvailable] & 1) == 0)
    {
      char v5 = [a1 areRelayCallingFeaturesEnabled];
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v5 = 0;
LABEL_6:

  return v5;
}

+ (BOOL)canAttemptEmergencyCallsWithoutCellularConnection
{
  int v3 = [a1 canAttemptTelephonyCallsWithoutCellularConnection];
  if (v3)
  {
    id v4 = [a1 senderIdentityCapabilities];
    char v5 = [v4 anyObject];
    char v6 = [v5 isEmergencyWiFiCallingCurrentlyAvailable];

    LOBYTE(v3) = v6;
  }
  return v3;
}

+ (BOOL)canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:(id)a3
{
  id v4 = [a1 senderIdentityCapabilitiesWithUUID:a3];
  if (v4
    && [a1 canAttemptTelephonyCallsWithoutCellularConnectionWithSenderIdentityCapabilities:v4])
  {
    char v5 = [v4 isEmergencyWiFiCallingCurrentlyAvailable];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsBasebandCalling
{
  v2 = [a1 client];
  int v3 = [v2 state];
  char v4 = [v3 supportsBasebandCalling];

  return v4;
}

+ (int)telephonyCallSupport
{
  int result = [a1 supportsDisplayingTelephonyCalls];
  if (result)
  {
    if ([a1 isDirectTelephonyCallingCurrentlyAvailable])
    {
      return 3;
    }
    else
    {
      int result = [a1 areRelayCallingFeaturesEnabled];
      if (result)
      {
        if ([a1 supportsTelephonyRelayCalling]) {
          return 2;
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

+ (int)faceTimeAudioCallSupport
{
  int result = [a1 supportsDisplayingFaceTimeAudioCalls];
  if (result)
  {
    if ([a1 isDirectFaceTimeAudioCallingCurrentlyAvailable])
    {
      return 3;
    }
    else
    {
      int result = [a1 areRelayCallingFeaturesEnabled];
      if (result)
      {
        if ([a1 supportsFaceTimeAudioRelayCalling]) {
          return 2;
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

+ (int)faceTimeVideoCallSupport
{
  int result = [a1 supportsDisplayingFaceTimeVideoCalls];
  if (result)
  {
    if ([a1 isDirectFaceTimeVideoCallingCurrentlyAvailable])
    {
      return 3;
    }
    else
    {
      int result = [a1 areRelayCallingFeaturesEnabled];
      if (result) {
        return [a1 supportsFaceTimeVideoRelayCalling];
      }
    }
  }
  return result;
}

+ (BOOL)supportsDisplayingTelephonyCalls
{
  v2 = [a1 client];
  int v3 = [v2 state];
  char v4 = [v3 supportsDisplayingTelephonyCalls];

  return v4;
}

+ (BOOL)isDirectTelephonyCallingCurrentlyAvailable
{
  if (([a1 supportsPrimaryCalling] & 1) != 0
    || ([a1 isWiFiCallingCurrentlyAvailable] & 1) != 0
    || ([a1 isThumperCallingCurrentlyAvailable] & 1) != 0
    || ([a1 isVoLTECallingCurrentlyAvailable] & 1) != 0)
  {
    return 1;
  }

  return [a1 isCSCallingCurrentlyAvailable];
}

+ (BOOL)isDirectFaceTimeAudioCallingCurrentlyAvailable
{
  v2 = [a1 client];
  int v3 = [v2 state];
  char v4 = [v3 isFaceTimeAudioAvailable];

  return v4;
}

+ (BOOL)isDirectFaceTimeVideoCallingCurrentlyAvailable
{
  v2 = [a1 client];
  int v3 = [v2 state];
  char v4 = [v3 isFaceTimeVideoAvailable];

  return v4;
}

+ (BOOL)supportsSimultaneousVoiceAndData
{
  v2 = [a1 senderIdentityCapabilities];
  int v3 = [v2 anyObject];
  char v4 = [v3 supportsSimultaneousVoiceAndData];

  return v4;
}

+ (BOOL)isSimultaneousVoiceAndDataSupportedForSIMWithUUID:(id)a3
{
  int v3 = [a1 senderIdentityCapabilitiesWithUUID:a3];
  char v4 = [v3 supportsSimultaneousVoiceAndData];

  return v4;
}

+ (BOOL)areCTCapabilitiesValid
{
  v2 = [a1 client];
  int v3 = [v2 state];
  char v4 = [v3 areCTCapabilitiesValid];

  return v4;
}

+ (BOOL)isCSCallingCurrentlyAvailable
{
  v2 = [a1 senderIdentityCapabilities];
  char v3 = objc_msgSend(v2, "tu_containsObjectPassingTest:", &__block_literal_global_11);

  return v3;
}

uint64_t __51__TUCallCapabilities_isCSCallingCurrentlyAvailable__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isCSCallingCurrentlyAvailable];
  *a3 = result;
  return result;
}

+ (BOOL)supportsWiFiCalling
{
  v2 = [a1 senderIdentityCapabilities];
  char v3 = [v2 anyObject];
  char v4 = [v3 supportsWiFiCalling];

  return v4;
}

+ (BOOL)isWiFiCallingEnabled
{
  v2 = [a1 senderIdentityCapabilities];
  char v3 = [v2 anyObject];
  char v4 = [v3 isWiFiCallingEnabled];

  return v4;
}

+ (void)setWiFiCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 senderIdentityCapabilities];
  char v4 = [v5 anyObject];
  [v4 setWiFiCallingEnabled:v3];
}

+ (BOOL)isWiFiCallingRoamingEnabled
{
  v2 = [a1 senderIdentityCapabilities];
  BOOL v3 = [v2 anyObject];
  char v4 = [v3 isWiFiCallingRoamingEnabled];

  return v4;
}

+ (void)setWiFiCallingRoamingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109376;
    v8[1] = [a1 isWiFiCallingRoamingEnabled];
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to change wiFiCallingRoamingEnabled from %d to %d", (uint8_t *)v8, 0xEu);
  }

  char v6 = [a1 senderIdentityCapabilities];
  v7 = [v6 anyObject];
  [v7 setWiFiCallingRoamingEnabled:v3];
}

+ (TUCTCapabilityInfo)wiFiCallingCapabilityInfo
{
  v2 = [a1 senderIdentityCapabilities];
  BOOL v3 = [v2 anyObject];
  char v4 = [v3 wiFiCallingCapabilityInfo];

  return (TUCTCapabilityInfo *)v4;
}

+ (BOOL)isWiFiCallingCurrentlyAvailable
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend(a1, "senderIdentityCapabilities", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isWiFiCallingCurrentlyAvailable])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (BOOL)supportsWiFiEmergencyCalling
{
  v2 = [a1 senderIdentityCapabilities];
  uint64_t v3 = [v2 anyObject];
  char v4 = [v3 supportsEmergencyWiFiCalling];

  return v4;
}

+ (BOOL)supportsVoLTECalling
{
  v2 = [a1 senderIdentityCapabilities];
  uint64_t v3 = [v2 anyObject];
  char v4 = [v3 supportsVoLTECalling];

  return v4;
}

+ (BOOL)isVoLTECallingEnabled
{
  v2 = [a1 senderIdentityCapabilities];
  uint64_t v3 = [v2 anyObject];
  char v4 = [v3 isVoLTECallingEnabled];

  return v4;
}

+ (void)setVoLTECallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [a1 senderIdentityCapabilities];
  char v4 = [v5 anyObject];
  [v4 setVoLTECallingEnabled:v3];
}

+ (TUCTCapabilityInfo)voLTECallingCapabilityInfo
{
  v2 = [a1 senderIdentityCapabilities];
  BOOL v3 = [v2 anyObject];
  char v4 = [v3 voLTECallingCapabilityInfo];

  return (TUCTCapabilityInfo *)v4;
}

+ (BOOL)isVoLTECallingCurrentlyAvailable
{
  v2 = [a1 senderIdentityCapabilities];
  char v3 = objc_msgSend(v2, "tu_containsObjectPassingTest:", &__block_literal_global_48);

  return v3;
}

uint64_t __54__TUCallCapabilities_isVoLTECallingCurrentlyAvailable__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isVoLTECallingCurrentlyAvailable];
  *a3 = result;
  return result;
}

+ (BOOL)accountsMatchForSecondaryCalling
{
  v2 = [a1 client];
  char v3 = [v2 state];
  char v4 = [v3 accountsMatchForSecondaryCalling];

  return v4;
}

+ (BOOL)accountsSupportSecondaryCalling
{
  v2 = [a1 client];
  char v3 = [v2 state];
  char v4 = [v3 accountsSupportSecondaryCalling];

  return v4;
}

+ (NSArray)cloudCallingDevices
{
  v2 = [a1 client];
  char v3 = [v2 state];
  char v4 = [v3 cloudCallingDevices];

  return (NSArray *)v4;
}

+ (BOOL)supportsThumperCalling
{
  v2 = [a1 senderIdentityCapabilities];
  char v3 = objc_msgSend(v2, "tu_containsObjectPassingTest:", &__block_literal_global_50);

  return v3;
}

uint64_t __44__TUCallCapabilities_supportsThumperCalling__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 supportsThumperCalling];
  *a3 = result;
  return result;
}

+ (BOOL)supportsThumperCallingOverCellularData
{
  v2 = [a1 client];
  char v3 = [v2 state];
  char v4 = [v3 supportsCellularData];

  return v4;
}

+ (BOOL)isThumperCallingAllowedForCurrentDevice
{
  v2 = [a1 senderIdentityCapabilities];
  char v3 = objc_msgSend(v2, "tu_containsObjectPassingTest:", &__block_literal_global_52);

  return v3;
}

uint64_t __61__TUCallCapabilities_isThumperCallingAllowedForCurrentDevice__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isThumperCallingAllowedForCurrentDevice];
  *a3 = result;
  return result;
}

+ (BOOL)isThumperCallingEnabled
{
  v2 = [a1 senderIdentityCapabilities];
  char v3 = objc_msgSend(v2, "tu_containsObjectPassingTest:", &__block_literal_global_54_0);

  return v3;
}

uint64_t __45__TUCallCapabilities_isThumperCallingEnabled__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isThumperCallingEnabled];
  *a3 = result;
  return result;
}

+ (TUCTCapabilityInfo)thumperCallingCapabilityInfo
{
  v2 = [a1 senderIdentityCapabilities];
  char v3 = [v2 anyObject];
  char v4 = [v3 thumperCallingCapabilityInfo];

  return (TUCTCapabilityInfo *)v4;
}

+ (BOOL)isThumperCallingCurrentlyAvailable
{
  v2 = [a1 senderIdentityCapabilities];
  char v3 = objc_msgSend(v2, "tu_containsObjectPassingTest:", &__block_literal_global_56);

  return v3;
}

uint64_t __56__TUCallCapabilities_isThumperCallingCurrentlyAvailable__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isThumperCallingCurrentlyAvailable];
  *a3 = result;
  return result;
}

+ (void)setThumperCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v4 = [a1 senderIdentityCapabilities];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setThumperCallingEnabled:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (BOOL)isThumperCallingAllowedOnSecondaryDeviceWithID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 senderIdentityCapabilities];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__TUCallCapabilities_isThumperCallingAllowedOnSecondaryDeviceWithID___block_invoke;
  v10[3] = &unk_1E58E66D8;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "tu_anyObjectPassingTest:", v10);
  BOOL v8 = v7 != 0;

  return v8;
}

uint64_t __69__TUCallCapabilities_isThumperCallingAllowedOnSecondaryDeviceWithID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isThumperCallingAllowedOnSecondaryDeviceWithID:*(void *)(a1 + 32)];
  *a3 = result;
  return result;
}

+ (BOOL)isThumperCallingAllowedOnDefaultPairedSecondaryDevice
{
  v2 = [a1 senderIdentityCapabilities];
  BOOL v3 = objc_msgSend(v2, "tu_anyObjectPassingTest:", &__block_literal_global_58);
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __75__TUCallCapabilities_isThumperCallingAllowedOnDefaultPairedSecondaryDevice__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isThumperCallingAllowedOnDefaultPairedSecondaryDevice];
  *a3 = result;
  return result;
}

+ (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a1 senderIdentityCapabilities];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setThumperCallingAllowed:v4 onSecondaryDeviceWithID:v6];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

+ (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 client];
  [v10 setThumperCallingAllowed:v6 onSecondaryDeviceWithID:v9 forSenderIdentityWithUUID:v8];
}

+ (void)setThumperCallingAllowedOnDefaultPairedSecondaryDevice:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a1 senderIdentityCapabilities];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setThumperCallingAllowedOnDefaultPairedSecondaryDevice:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (void)invalidateAndRefreshWiFiCallingProvisioningURL
{
  id v3 = [a1 senderIdentityCapabilities];
  v2 = [v3 anyObject];
  [v2 invalidateAndRefreshWiFiCallingProvisioningURL];
}

+ (void)invalidateAndRefreshThumperCallingProvisioningURL
{
  id v3 = [a1 senderIdentityCapabilities];
  v2 = [v3 anyObject];
  [v2 invalidateAndRefreshThumperCallingProvisioningURL];
}

+ (BOOL)supportsRelayCalling
{
  v2 = [a1 client];
  id v3 = [v2 state];
  char v4 = [v3 supportsRelayCalling];

  return v4;
}

+ (BOOL)isRelayCallingEnabled
{
  if (![a1 supportsRelayCalling]
    || ![a1 accountsSupportSecondaryCalling])
  {
    return 0;
  }
  id v3 = [a1 client];
  char v4 = [v3 state];
  char v5 = [v4 isRelayCallingEnabled];

  return v5;
}

+ (void)setRelayCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = [a1 isRelayCallingEnabled];
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "Asked to change relayCallingEnabled from %d to %d", (uint8_t *)v7, 0xEu);
  }

  uint64_t v6 = [a1 client];
  [v6 setRelayCallingEnabled:v3];
}

+ (BOOL)areRelayCallingFeaturesEnabled
{
  v2 = [a1 client];
  BOOL v3 = [v2 state];
  char v4 = [v3 areRelayCallingFeaturesEnabled];

  return v4;
}

+ (BOOL)isRelayCallingEnabledForDeviceWithID:(id)a3
{
  id v4 = a3;
  char v5 = [a1 client];
  uint64_t v6 = [v5 state];
  uint64_t v7 = [v6 relayCallingDisabledForDeviceID];
  __int16 v8 = [v7 objectForKeyedSubscript:v4];

  LOBYTE(v4) = [v8 BOOLValue] ^ 1;
  return (char)v4;
}

+ (void)setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4
{
  BOOL v4 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109634;
    v9[1] = [a1 isRelayCallingEnabledForDeviceWithID:v6];
    __int16 v10 = 1024;
    BOOL v11 = v4;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Asked to change relayCallingEnabled from %d to %d for %@", (uint8_t *)v9, 0x18u);
  }

  __int16 v8 = [a1 client];
  [v8 setRelayCallingEnabled:v4 forDeviceWithID:v6];
}

+ (NSString)outgoingRelayCallerID
{
  v2 = [a1 client];
  BOOL v3 = [v2 state];
  BOOL v4 = [v3 outgoingRelayCallerID];

  return (NSString *)v4;
}

+ (int)relayCallingAvailability
{
  v2 = [a1 client];
  BOOL v3 = [v2 state];
  int v4 = [v3 relayCallingAvailability];

  return v4;
}

+ (BOOL)supportsTelephonyRelayCalling
{
  v2 = [a1 client];
  BOOL v3 = [v2 state];
  char v4 = [v3 supportsTelephonyRelayCalling];

  return v4;
}

+ (BOOL)supportsFaceTimeAudioRelayCalling
{
  v2 = [a1 client];
  BOOL v3 = [v2 state];
  char v4 = [v3 supportsFaceTimeAudioRelayCalling];

  return v4;
}

+ (BOOL)supportsFaceTimeVideoRelayCalling
{
  v2 = [a1 client];
  BOOL v3 = [v2 state];
  char v4 = [v3 supportsFaceTimeVideoRelayCalling];

  return v4;
}

+ (void)requestPinFromPrimaryDevice
{
  id v3 = [a1 senderIdentityCapabilities];
  v2 = [v3 anyObject];
  [v2 requestPinFromPrimaryDeviceForThumperCalling];
}

+ (void)cancelPinRequestFromPrimaryDevice
{
  id v3 = [a1 senderIdentityCapabilities];
  v2 = [v3 anyObject];
  [v2 cancelPinRequestFromPrimaryDeviceForThumperCalling];
}

+ (BOOL)isEmergencyCallbackModeEnabled
{
  v2 = [a1 client];
  id v3 = [v2 state];
  char v4 = [v3 isEmergencyCallbackModeEnabled];

  return v4;
}

+ (void)endEmergencyCallbackMode
{
  id v2 = [a1 client];
  [v2 endEmergencyCallbackMode];
}

+ (BOOL)isEmergencyCallbackPossible
{
  id v2 = [a1 client];
  id v3 = [v2 state];
  char v4 = [v3 isEmergencyCallbackPossible];

  return v4;
}

+ (NSSet)senderIdentityCapabilities
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 client];
  char v4 = [v3 state];
  char v5 = [v4 senderIdentityCapabilitiesStateByUUID];

  id v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12, (void)v19);
        uint64_t v14 = [TUSenderIdentityCapabilities alloc];
        long long v15 = [a1 client];
        v16 = [(TUSenderIdentityCapabilities *)v14 initWithSenderIdentityUUID:v12 state:v13 client:v15];

        [v6 addObject:v16];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  uint64_t v17 = (void *)[v6 copy];

  return (NSSet *)v17;
}

+ (id)senderIdentityCapabilitiesWithUUID:(id)a3
{
  id v4 = a3;
  char v5 = [a1 client];
  id v6 = [v5 state];
  id v7 = [v6 senderIdentityCapabilitiesStateByUUID];
  uint64_t v8 = [v7 objectForKeyedSubscript:v4];

  uint64_t v9 = [TUSenderIdentityCapabilities alloc];
  uint64_t v10 = [a1 client];
  BOOL v11 = [(TUSenderIdentityCapabilities *)v9 initWithSenderIdentityUUID:v4 state:v8 client:v10];

  return v11;
}

+ (id)_senderIdentityCapabilitiesByUUID
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 client];
  id v4 = [v3 state];
  char v5 = [v4 senderIdentityCapabilitiesStateByUUID];

  id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12, (void)v19);
        uint64_t v14 = [TUSenderIdentityCapabilities alloc];
        long long v15 = [a1 client];
        v16 = [(TUSenderIdentityCapabilities *)v14 initWithSenderIdentityUUID:v12 state:v13 client:v15];

        [v6 setObject:v16 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  uint64_t v17 = (void *)[v6 copy];

  return v17;
}

+ (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 client];
  [v8 addDelegate:v7 queue:v6];
}

+ (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [a1 client];
  [v5 removeDelegate:v4];
}

+ (void)_sendNotificationsAndCallbacksAfterRunningBlock:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [a1 supportsTelephonyCalls];
  int v6 = [a1 supportsFaceTimeAudioCalls];
  int v63 = [a1 supportsFaceTimeVideoCalls];
  int v66 = [a1 isDirectFaceTimeAudioCallingCurrentlyAvailable];
  int v65 = [a1 isDirectFaceTimeVideoCallingCurrentlyAvailable];
  int v76 = [a1 supportsRelayCalling];
  int v68 = [a1 isRelayCallingEnabled];
  int v79 = [a1 areRelayCallingFeaturesEnabled];
  id v7 = [a1 cloudCallingDevices];
  v83 = [a1 outgoingRelayCallerID];
  int v77 = [a1 relayCallingAvailability];
  int v69 = [a1 isEmergencyCallbackModeEnabled];
  int v8 = [a1 isEmergencyCallbackPossible];
  v71 = [a1 _senderIdentityCapabilitiesByUUID];
  v72 = v4;
  (*((void (**)(id))v4 + 2))(v4);
  int v9 = [a1 supportsTelephonyCalls];
  int v10 = [a1 supportsFaceTimeAudioCalls];
  int v11 = [a1 supportsFaceTimeVideoCalls];
  int v73 = [a1 isDirectFaceTimeAudioCallingCurrentlyAvailable];
  int v64 = [a1 isDirectFaceTimeVideoCallingCurrentlyAvailable];
  int v74 = [a1 supportsRelayCalling];
  int v67 = [a1 isRelayCallingEnabled];
  int v78 = [a1 areRelayCallingFeaturesEnabled];
  v81 = [a1 cloudCallingDevices];
  v82 = [a1 outgoingRelayCallerID];
  int v75 = [a1 relayCallingAvailability];
  int v12 = [a1 isEmergencyCallbackModeEnabled];
  int v70 = [a1 isEmergencyCallbackPossible];
  id v85 = a1;
  v84 = [a1 _senderIdentityCapabilitiesByUUID];
  if (v5 != v9)
  {
    id v13 = TUDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v5;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v9;
      _os_log_impl(&dword_19C496000, v13, OS_LOG_TYPE_DEFAULT, "Telephony support changed from %d to %d", buf, 0xEu);
    }

    uint64_t v14 = [v85 client];
    [v14 performDelegateCallbackBlock:&__block_literal_global_67];

    long long v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 postNotificationName:@"TUCallCapabilitiesSupportsTelephonyCallsChangedNotification" object:0];
  }
  v16 = v84;
  if (v6 != v10)
  {
    uint64_t v17 = TUDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v6;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v10;
      _os_log_impl(&dword_19C496000, v17, OS_LOG_TYPE_DEFAULT, "FaceTime Audio support changed from %d to %d", buf, 0xEu);
    }

    v18 = [v85 client];
    [v18 performDelegateCallbackBlock:&__block_literal_global_71];

    long long v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 postNotificationName:@"TUCallCapabilitiesSupportsFaceTimeAudioCallsChangedNotification" object:0];
  }
  if (v63 != v11)
  {
    long long v20 = TUDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v63;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v11;
      _os_log_impl(&dword_19C496000, v20, OS_LOG_TYPE_DEFAULT, "FaceTime Video support changed from %d to %d", buf, 0xEu);
    }

    long long v21 = [v85 client];
    [v21 performDelegateCallbackBlock:&__block_literal_global_76];

    long long v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 postNotificationName:@"TUCallCapabilitiesSupportsFaceTimeVideoCallsChangedNotification" object:0];
  }
  if (v66 != v73 || v65 != v64)
  {
    v23 = TUDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v99 = v66;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v65;
      LOWORD(v100) = 1024;
      *(_DWORD *)((char *)&v100 + 2) = v73;
      HIWORD(v100) = 1024;
      int v101 = v64;
      _os_log_impl(&dword_19C496000, v23, OS_LOG_TYPE_DEFAULT, "FaceTime availability changed from (audio=%d video=%d) to (audio=%d video=%d)", buf, 0x1Au);
    }

    uint64_t v24 = [v85 client];
    [v24 performDelegateCallbackBlock:&__block_literal_global_81];

    v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 postNotificationName:@"TUCallCapabilitiesFaceTimeAvailabilityChangedNotification" object:0];
  }
  if (v76 != v74 || v68 != v67)
  {
    v26 = TUDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v99 = v76;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v68;
      LOWORD(v100) = 1024;
      *(_DWORD *)((char *)&v100 + 2) = v74;
      HIWORD(v100) = 1024;
      int v101 = v67;
      _os_log_impl(&dword_19C496000, v26, OS_LOG_TYPE_DEFAULT, "Relay capabilities changed from (supported=%d enabled=%d) to (supported=%d enabled=%d)", buf, 0x1Au);
    }

    v27 = [v85 client];
    [v27 performDelegateCallbackBlock:&__block_literal_global_86];

    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 postNotificationName:@"TUCallCapabilitiesRelayCallingChangedNotification" object:0];
  }
  if (v77 != v75)
  {
    v29 = TUDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v77;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v75;
      _os_log_impl(&dword_19C496000, v29, OS_LOG_TYPE_DEFAULT, "Relay calling availability changed from %d to %d", buf, 0xEu);
    }

    v30 = [v85 client];
    [v30 performDelegateCallbackBlock:&__block_literal_global_91];

    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 postNotificationName:@"TUCallCapabilitiesRelayCallingAvailabilityChangedNotification" object:0];
  }
  if (v79 != v78)
  {
    v32 = TUDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v79;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v78;
      _os_log_impl(&dword_19C496000, v32, OS_LOG_TYPE_DEFAULT, "Relay calling features changed from %d to %d", buf, 0xEu);
    }

    v33 = [v85 client];
    [v33 performDelegateCallbackBlock:&__block_literal_global_96];
  }
  if (([v7 isEqualToArray:v81] & 1) == 0)
  {
    v34 = TUDefaultLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v34, OS_LOG_TYPE_DEFAULT, "Cloud calling devices changed", buf, 2u);
    }

    v35 = [v85 client];
    [v35 performDelegateCallbackBlock:&__block_literal_global_101];

    v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 postNotificationName:@"TUCallCapabilitiesCloudCallingDevicesChangedNotification" object:0];
  }
  if ((TUStringsAreEqualOrNil((unint64_t)v83, (uint64_t)v82) & 1) == 0)
  {
    v37 = TUDefaultLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v99 = v83;
      *(_WORD *)&v99[8] = 2112;
      v100 = v82;
      _os_log_impl(&dword_19C496000, v37, OS_LOG_TYPE_DEFAULT, "Outgoing relay caller ID changed from %@ to %@", buf, 0x16u);
    }

    v38 = [v85 client];
    [v38 performDelegateCallbackBlock:&__block_literal_global_106];

    v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v39 postNotificationName:@"TUCallCapabilitiesOutgoingRelayCallerIDChangedNotification" object:0];
  }
  if (v69 != v12)
  {
    v40 = TUDefaultLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v69;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v12;
      _os_log_impl(&dword_19C496000, v40, OS_LOG_TYPE_DEFAULT, "Emergency Callback Mode changed from %d to %d", buf, 0xEu);
    }

    v41 = [v85 client];
    [v41 performDelegateCallbackBlock:&__block_literal_global_111];

    v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v42 postNotificationName:@"TUCallCapabilitiesEmergencyCallbackModeChangedNotification" object:0];
  }
  v80 = v7;
  if (v8 != v70)
  {
    v43 = TUDefaultLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v99 = v8;
      *(_WORD *)&v99[4] = 1024;
      *(_DWORD *)&v99[6] = v70;
      _os_log_impl(&dword_19C496000, v43, OS_LOG_TYPE_DEFAULT, "Emergency Callback Possible changed from %d to %d", buf, 0xEu);
    }

    v44 = [v85 client];
    [v44 performDelegateCallbackBlock:&__block_literal_global_116];

    v45 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v45 postNotificationName:@"TUCallCapabilitiesEmergencyCallbackPossibleChangedNotification" object:0];
  }
  v46 = (void *)[v84 mutableCopy];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v47 = v71;
  uint64_t v48 = [v47 countByEnumeratingWithState:&v92 objects:v97 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v93 != v50) {
          objc_enumerationMutation(v47);
        }
        uint64_t v52 = *(void *)(*((void *)&v92 + 1) + 8 * i);
        v53 = [v47 objectForKeyedSubscript:v52];
        v54 = [v16 objectForKeyedSubscript:v52];
        if (v54)
        {
          [v46 setObject:0 forKeyedSubscript:v52];
          [v54 _sendNotificationsAndCallbacksComparingToOldSenderIdentityCapabilities:v53];
        }
        else
        {
          v55 = [v85 client];
          v91[0] = MEMORY[0x1E4F143A8];
          v91[1] = 3221225472;
          v91[2] = __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_2;
          v91[3] = &unk_1E58E6058;
          v91[4] = v52;
          [v55 performDelegateCallbackBlock:v91];

          v16 = v84;
        }
      }
      uint64_t v49 = [v47 countByEnumeratingWithState:&v92 objects:v97 count:16];
    }
    while (v49);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v56 = v46;
  uint64_t v57 = [v56 countByEnumeratingWithState:&v87 objects:v96 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v88;
    do
    {
      for (uint64_t j = 0; j != v58; ++j)
      {
        if (*(void *)v88 != v59) {
          objc_enumerationMutation(v56);
        }
        uint64_t v61 = *(void *)(*((void *)&v87 + 1) + 8 * j);
        v62 = [v85 client];
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_3;
        v86[3] = &unk_1E58E6058;
        v86[4] = v61;
        [v62 performDelegateCallbackBlock:v86];
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v87 objects:v96 count:16];
    }
    while (v58);
  }
}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 didChangeTelephonyCallingSupport];
  }
}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_69(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 didChangeFaceTimeAudioCallingSupport];
  }
}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_74(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 didChangeFaceTimeVideoCallingSupport];
  }
}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_79(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 didChangeFaceTimeCallingAvailability];
  }
}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_84(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 didChangeRelayCallingCapabilities];
  }
}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_89(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 didChangeRelayCallingAvailability];
  }
}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_94(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 didChangeRelayCallingFeatures];
  }
}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_99(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 didChangeCloudCallingDevices];
  }
}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_104(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 didChangeOutgoingRelayCallerID];
  }
}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_109(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 didChangeEmergencyCallbackMode];
  }
}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_114(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 didChangeEmergencyCallbackPossible];
  }
}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didRemoveCapabilitiesForSenderIdentityWithUUID:*(void *)(a1 + 32)];
  }
}

void __70__TUCallCapabilities__sendNotificationsAndCallbacksAfterRunningBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didAddCapabilitiesForSenderIdentityWithUUID:*(void *)(a1 + 32)];
  }
}

+ (id)debugDescription
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithString:@"== TUCallCapabilities ==\n"];
  [v3 appendString:@"General Support:\n"];
  objc_msgSend(v3, "appendFormat:", @"    supportsTelephonyCalls: %d\n", objc_msgSend(a1, "supportsTelephonyCalls"));
  objc_msgSend(v3, "appendFormat:", @"    supportsFaceTimeAudioCalls: %d\n", objc_msgSend(a1, "supportsFaceTimeAudioCalls"));
  objc_msgSend(v3, "appendFormat:", @"    supportsFaceTimeVideoCalls: %d\n", objc_msgSend(a1, "supportsFaceTimeVideoCalls"));
  objc_msgSend(v3, "appendFormat:", @"    canAttemptTelephonyCallsWithoutCellularConnection: %d\n", objc_msgSend(a1, "canAttemptTelephonyCallsWithoutCellularConnection"));
  objc_msgSend(v3, "appendFormat:", @"    canAttemptEmergencyCallsWithoutCellularConnection: %d\n", objc_msgSend(a1, "canAttemptEmergencyCallsWithoutCellularConnection"));
  [v3 appendString:@"Primary/Secondary Device:\n"];
  objc_msgSend(v3, "appendFormat:", @"    supportsPrimaryCalling: %d\n", objc_msgSend(a1, "supportsPrimaryCalling"));
  [v3 appendString:@"Call support:\n"];
  objc_msgSend(v3, "appendFormat:", @"    telephonyCallSupport: %d\n", objc_msgSend(a1, "telephonyCallSupport"));
  objc_msgSend(v3, "appendFormat:", @"    faceTimeAudioCallSupport: %d\n", objc_msgSend(a1, "faceTimeAudioCallSupport"));
  objc_msgSend(v3, "appendFormat:", @"    faceTimeVideoCallSupport: %d\n", objc_msgSend(a1, "faceTimeVideoCallSupport"));
  [v3 appendString:@"Displaying support:\n"];
  objc_msgSend(v3, "appendFormat:", @"    supportsDisplayingTelephonyCalls: %d\n", objc_msgSend(a1, "supportsDisplayingTelephonyCalls"));
  objc_msgSend(v3, "appendFormat:", @"    supportsDisplayingFaceTimeAudioCalls: %d\n", objc_msgSend(a1, "supportsDisplayingFaceTimeAudioCalls"));
  objc_msgSend(v3, "appendFormat:", @"    supportsDisplayingFaceTimeVideoCalls: %d\n", objc_msgSend(a1, "supportsDisplayingFaceTimeVideoCalls"));
  [v3 appendString:@"Call Availability:\n"];
  objc_msgSend(v3, "appendFormat:", @"    isDirectTelephonyCallingCurrentlyAvailable: %d\n", objc_msgSend(a1, "isDirectTelephonyCallingCurrentlyAvailable"));
  objc_msgSend(v3, "appendFormat:", @"    isDirectFaceTimeAudioCallingCurrentlyAvailable: %d\n", objc_msgSend(a1, "isDirectFaceTimeAudioCallingCurrentlyAvailable"));
  objc_msgSend(v3, "appendFormat:", @"    isDirectFaceTimeVideoCallingCurrentlyAvailable: %d\n", objc_msgSend(a1, "isDirectFaceTimeVideoCallingCurrentlyAvailable"));
  [v3 appendString:@"System capabilities:\n"];
  objc_msgSend(v3, "appendFormat:", @"    supportsSimultaneousVoiceAndData: %d\n", objc_msgSend(a1, "supportsSimultaneousVoiceAndData"));
  [v3 appendString:@"Wi-Fi calling:\n"];
  objc_msgSend(v3, "appendFormat:", @"    supportsWiFiCalling: %d\n", objc_msgSend(a1, "supportsWiFiCalling"));
  objc_msgSend(v3, "appendFormat:", @"    isWiFiCallingEnabled: %d\n", objc_msgSend(a1, "isWiFiCallingEnabled"));
  objc_msgSend(v3, "appendFormat:", @"    isWiFiCallingCurrentlyAvailable: %d\n", objc_msgSend(a1, "isWiFiCallingCurrentlyAvailable"));
  [v3 appendString:@"VoLTE calling:\n"];
  objc_msgSend(v3, "appendFormat:", @"    supportsVoLTECalling: %d\n", objc_msgSend(a1, "supportsVoLTECalling"));
  objc_msgSend(v3, "appendFormat:", @"    isVoLTECallingEnabled: %d\n", objc_msgSend(a1, "isVoLTECallingEnabled"));
  objc_msgSend(v3, "appendFormat:", @"    isVoLTECallingCurrentlyAvailable: %d\n", objc_msgSend(a1, "isVoLTECallingCurrentlyAvailable"));
  [v3 appendString:@"Secondary calling:\n"];
  objc_msgSend(v3, "appendFormat:", @"    accountsMatchForSecondaryCalling: %d\n", objc_msgSend(a1, "accountsMatchForSecondaryCalling"));
  objc_msgSend(v3, "appendFormat:", @"    accountsSupportSecondaryCalling: %d\n", objc_msgSend(a1, "accountsSupportSecondaryCalling"));
  [v3 appendString:@"Thumper calling:\n"];
  objc_msgSend(v3, "appendFormat:", @"    supportsThumperCalling: %d\n", objc_msgSend(a1, "supportsThumperCalling"));
  objc_msgSend(v3, "appendFormat:", @"    isThumperCallingAllowedForCurrentDevice: %d\n", objc_msgSend(a1, "isThumperCallingAllowedForCurrentDevice"));
  objc_msgSend(v3, "appendFormat:", @"    isThumperCallingEnabled: %d\n", objc_msgSend(a1, "isThumperCallingEnabled"));
  objc_msgSend(v3, "appendFormat:", @"    supportsThumperCallingOverCellularData: %d\n", objc_msgSend(a1, "supportsThumperCallingOverCellularData"));
  objc_msgSend(v3, "appendFormat:", @"    isThumperCallingCurrentlyAvailable: %d\n", objc_msgSend(a1, "isThumperCallingCurrentlyAvailable"));
  [v3 appendString:@"Relay calling:\n"];
  objc_msgSend(v3, "appendFormat:", @"    supportsRelayingToOtherDevices: %d\n", objc_msgSend(a1, "supportsRelayingToOtherDevices"));
  objc_msgSend(v3, "appendFormat:", @"    supportsRelayCalling: %d\n", objc_msgSend(a1, "supportsRelayCalling"));
  objc_msgSend(v3, "appendFormat:", @"    isRelayCallingEnabled: %d\n", objc_msgSend(a1, "isRelayCallingEnabled"));
  objc_msgSend(v3, "appendFormat:", @"    isRelayCallingGuaranteed: %d\n", objc_msgSend(a1, "relayCallingAvailability") == 2);
  objc_msgSend(v3, "appendFormat:", @"    areRelayCallingFeaturesEnabled: %d\n", objc_msgSend(a1, "areRelayCallingFeaturesEnabled"));
  [v3 appendString:@"Outgoing relay calling:\n"];
  objc_msgSend(v3, "appendFormat:", @"    supportsTelephonyRelayCalling: %d\n", objc_msgSend(a1, "supportsTelephonyRelayCalling"));
  objc_msgSend(v3, "appendFormat:", @"    supportsFaceTimeAudioRelayCalling: %d\n", objc_msgSend(a1, "supportsFaceTimeAudioRelayCalling"));
  objc_msgSend(v3, "appendFormat:", @"    supportsFaceTimeVideoRelayCalling: %d\n", objc_msgSend(a1, "supportsFaceTimeVideoRelayCalling"));
  id v4 = [a1 outgoingRelayCallerID];
  [v3 appendFormat:@"    outgoingRelayCallerID: %@\n", v4];

  [v3 appendString:@"Emergency callback mode:\n"];
  objc_msgSend(v3, "appendFormat:", @"    isEmergencyCallbackModeEnabled: %d\n", objc_msgSend(a1, "isEmergencyCallbackModeEnabled"));
  objc_msgSend(v3, "appendFormat:", @"    isEmergencyCallbackPossible: %d\n", objc_msgSend(a1, "isEmergencyCallbackPossible"));

  return v3;
}

@end