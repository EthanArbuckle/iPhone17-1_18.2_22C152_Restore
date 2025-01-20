@interface TUAudioRoute
+ (BOOL)supportsSecureCoding;
- (BOOL)_routeTypeEqualTo:(id)a3;
- (BOOL)isA2DPRoute;
- (BOOL)isAirTunes;
- (BOOL)isBluetooth;
- (BOOL)isBluetoothLE;
- (BOOL)isBluetoothManaged;
- (BOOL)isCarAudio;
- (BOOL)isCurrentlyPicked;
- (BOOL)isDefaultRoute;
- (BOOL)isHandset;
- (BOOL)isHeadphoneJackConnected;
- (BOOL)isInEarDetectionEnabled;
- (BOOL)isInEarDetectionSupported;
- (BOOL)isPartnerRouteRoutable;
- (BOOL)isPreferred;
- (BOOL)isPreferredAndActive;
- (BOOL)isReceiver;
- (BOOL)isSiblingRoutePresent;
- (BOOL)isSpeaker;
- (BOOL)isWiredHeadphones;
- (BOOL)isWiredHeadset;
- (BOOL)isWirelessHeadset;
- (BOOL)supportsHighQualityVoiceWithMedia;
- (BOOL)supportsSharePlay;
- (NSDictionary)route;
- (NSString)avAudioRouteName;
- (NSString)bluetoothProductIdentifier;
- (TUAudioRoute)initWithCoder:(id)a3;
- (TUAudioRoute)initWithDictionary:(id)a3;
- (id)customDescription;
- (id)identifiersOfOtherConnectedDevices;
- (int64_t)bluetoothEndpointType;
- (int64_t)deviceType;
- (void)bluetoothProductIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)identifiersOfOtherConnectedDevices;
- (void)isA2DPRoute;
- (void)isBluetooth;
- (void)isBluetoothManaged;
- (void)isCurrentlyPicked;
- (void)isDefaultRoute;
- (void)isHeadphoneJackConnected;
- (void)isInEarDetectionEnabled;
- (void)isInEarDetectionSupported;
- (void)isPartnerRouteRoutable;
- (void)isPreferred;
- (void)isPreferredAndActive;
- (void)isSiblingRoutePresent;
- (void)isWiredHeadset;
- (void)isWirelessHeadset;
- (void)supportsSharePlay;
@end

@implementation TUAudioRoute

- (BOOL)isInEarDetectionSupported
{
  if (![(TUAudioRoute *)self isPreferred]) {
    return 0;
  }
  v3 = [(TUAudioRoute *)self route];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  v4 = (void *)getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupportedSymbolLoc_ptr;
  uint64_t v12 = getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupportedSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupportedSymbolLoc_ptr)
  {
    v5 = (void *)MediaExperienceLibrary_0();
    v10[3] = (uint64_t)dlsym(v5, "AVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupported");
    getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupportedSymbolLoc_ptr = v10[3];
    v4 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v4) {
    -[TUAudioRoute isInEarDetectionSupported]();
  }
  v6 = [v3 objectForKeyedSubscript:*v4];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (BOOL)isHeadphoneJackConnected
{
  v2 = [(TUAudioRoute *)self route];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v3 = (void *)getAVSystemController_HeadphoneJackIsConnectedAttributeSymbolLoc_ptr;
  uint64_t v11 = getAVSystemController_HeadphoneJackIsConnectedAttributeSymbolLoc_ptr;
  if (!getAVSystemController_HeadphoneJackIsConnectedAttributeSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v9[3] = (uint64_t)dlsym(v4, "AVSystemController_HeadphoneJackIsConnectedAttribute");
    getAVSystemController_HeadphoneJackIsConnectedAttributeSymbolLoc_ptr = v9[3];
    v3 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3) {
    -[TUAudioRoute isHeadphoneJackConnected]();
  }
  v5 = [v2 objectForKeyedSubscript:*v3];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)isBluetooth
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  v3 = (id *)getAVSystemController_RouteDescriptionKey_IsBTRouteSymbolLoc_ptr;
  uint64_t v13 = getAVSystemController_RouteDescriptionKey_IsBTRouteSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_IsBTRouteSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v11[3] = (uint64_t)dlsym(v4, "AVSystemController_RouteDescriptionKey_IsBTRoute");
    getAVSystemController_RouteDescriptionKey_IsBTRouteSymbolLoc_ptr = v11[3];
    v3 = (id *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v3) {
    -[TUAudioRoute isBluetooth]();
  }
  if (!*v3) {
    return 0;
  }
  id v5 = *v3;
  char v6 = [(TUAudioRoute *)self route];
  char v7 = [v6 objectForKeyedSubscript:v5];

  char v8 = [v7 BOOLValue];
  return v8;
}

- (BOOL)isPreferred
{
  v2 = [(TUAudioRoute *)self route];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v3 = (void *)getAVSystemController_RouteDescriptionKey_IsPreferredExternalRouteSymbolLoc_ptr;
  uint64_t v11 = getAVSystemController_RouteDescriptionKey_IsPreferredExternalRouteSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_IsPreferredExternalRouteSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v9[3] = (uint64_t)dlsym(v4, "AVSystemController_RouteDescriptionKey_IsPreferredExternalRoute");
    getAVSystemController_RouteDescriptionKey_IsPreferredExternalRouteSymbolLoc_ptr = v9[3];
    v3 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3) {
    -[TUAudioRoute isPreferred]();
  }
  id v5 = [v2 objectForKeyedSubscript:*v3];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (NSDictionary)route
{
  return self->_route;
}

- (BOOL)supportsSharePlay
{
  v2 = [(TUAudioRoute *)self route];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v3 = (void *)getAVSystemController_RouteDescriptionKey_SupportsSharePlaySymbolLoc_ptr;
  uint64_t v11 = getAVSystemController_RouteDescriptionKey_SupportsSharePlaySymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_SupportsSharePlaySymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v9[3] = (uint64_t)dlsym(v4, "AVSystemController_RouteDescriptionKey_SupportsSharePlay");
    getAVSystemController_RouteDescriptionKey_SupportsSharePlaySymbolLoc_ptr = v9[3];
    v3 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3) {
    -[TUAudioRoute supportsSharePlay]();
  }
  id v5 = [v2 objectForKeyedSubscript:*v3];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)isWirelessHeadset
{
  v2 = [(TUAudioRoute *)self avAudioRouteName];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v3 = (void *)getAVSystemController_PickableRouteType_WirelessSymbolLoc_ptr;
  uint64_t v10 = getAVSystemController_PickableRouteType_WirelessSymbolLoc_ptr;
  if (!getAVSystemController_PickableRouteType_WirelessSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v8[3] = (uint64_t)dlsym(v4, "AVSystemController_PickableRouteType_Wireless");
    getAVSystemController_PickableRouteType_WirelessSymbolLoc_ptr = v8[3];
    v3 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v3) {
    -[TUAudioRoute isWirelessHeadset]();
  }
  char v5 = [v2 isEqualToString:*v3];

  return v5;
}

- (BOOL)isWiredHeadset
{
  BOOL v6 = [(TUAudioRoute *)self isHeadphoneJackConnected];
  if (v6)
  {
    v2 = [(TUAudioRoute *)self route];
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v7 = (id *)getAVSystemController_HeadphoneJackHasInputAttributeSymbolLoc_ptr;
    uint64_t v15 = getAVSystemController_HeadphoneJackHasInputAttributeSymbolLoc_ptr;
    if (!getAVSystemController_HeadphoneJackHasInputAttributeSymbolLoc_ptr)
    {
      uint64_t v8 = (void *)MediaExperienceLibrary_0();
      v13[3] = (uint64_t)dlsym(v8, "AVSystemController_HeadphoneJackHasInputAttribute");
      getAVSystemController_HeadphoneJackHasInputAttributeSymbolLoc_ptr = v13[3];
      uint64_t v7 = (id *)v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v7) {
      -[TUAudioRoute isWiredHeadset]();
    }
    id v3 = *v7;
    v4 = [v2 objectForKeyedSubscript:v3];
    if ([v4 BOOLValue])
    {
      char v9 = 1;
LABEL_8:

      return v9;
    }
  }
  uint64_t v10 = [(TUAudioRoute *)self avAudioRouteName];
  char v9 = [v10 isEqualToString:@"Headset"];

  if (v6) {
    goto LABEL_8;
  }
  return v9;
}

- (BOOL)isWiredHeadphones
{
  if ([(TUAudioRoute *)self isHeadphoneJackConnected]
    && ![(TUAudioRoute *)self isWiredHeadset])
  {
    return 1;
  }
  id v3 = [(TUAudioRoute *)self avAudioRouteName];
  char v4 = [v3 isEqualToString:@"Headphone"];

  return v4;
}

- (NSString)avAudioRouteName
{
  return self->_avAudioRouteName;
}

- (BOOL)isSpeaker
{
  v2 = [(TUAudioRoute *)self avAudioRouteName];
  char v3 = [v2 isEqualToString:@"Speaker"];

  return v3;
}

- (BOOL)isSiblingRoutePresent
{
  v2 = [(TUAudioRoute *)self route];
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v3 = (void *)getAVSystemController_RouteDescriptionKey_BTDetails_SiblingRoutePresentSymbolLoc_ptr;
  uint64_t v11 = getAVSystemController_RouteDescriptionKey_BTDetails_SiblingRoutePresentSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_SiblingRoutePresentSymbolLoc_ptr)
  {
    char v4 = (void *)MediaExperienceLibrary_0();
    v9[3] = (uint64_t)dlsym(v4, "AVSystemController_RouteDescriptionKey_BTDetails_SiblingRoutePresent");
    getAVSystemController_RouteDescriptionKey_BTDetails_SiblingRoutePresentSymbolLoc_ptr = v9[3];
    char v3 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3) {
    -[TUAudioRoute isSiblingRoutePresent]();
  }
  char v5 = [v2 objectForKeyedSubscript:*v3];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)isReceiver
{
  v2 = [(TUAudioRoute *)self avAudioRouteName];
  char v3 = [v2 isEqualToString:@"Receiver"];

  return v3;
}

- (BOOL)isPreferredAndActive
{
  v2 = [(TUAudioRoute *)self route];
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v3 = (void *)getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr;
  uint64_t v11 = getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr)
  {
    char v4 = (void *)MediaExperienceLibrary_0();
    v9[3] = (uint64_t)dlsym(v4, "AVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActive");
    getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr = v9[3];
    char v3 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3) {
    -[TUAudioRoute isPreferredAndActive]();
  }
  char v5 = [v2 objectForKeyedSubscript:*v3];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)isPartnerRouteRoutable
{
  v2 = [(TUAudioRoute *)self route];
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v3 = (void *)getAVSystemController_RouteDescriptionKey_BTDetails_PartnerRouteRoutableSymbolLoc_ptr;
  uint64_t v11 = getAVSystemController_RouteDescriptionKey_BTDetails_PartnerRouteRoutableSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_PartnerRouteRoutableSymbolLoc_ptr)
  {
    char v4 = (void *)MediaExperienceLibrary_0();
    v9[3] = (uint64_t)dlsym(v4, "AVSystemController_RouteDescriptionKey_BTDetails_PartnerRouteRoutable");
    getAVSystemController_RouteDescriptionKey_BTDetails_PartnerRouteRoutableSymbolLoc_ptr = v9[3];
    char v3 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3) {
    -[TUAudioRoute isPartnerRouteRoutable]();
  }
  char v5 = [v2 objectForKeyedSubscript:*v3];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)isInEarDetectionEnabled
{
  if (![(TUAudioRoute *)self isInEarDetectionSupported]) {
    return 0;
  }
  char v3 = [(TUAudioRoute *)self route];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v4 = (void *)getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabledSymbolLoc_ptr;
  uint64_t v12 = getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabledSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabledSymbolLoc_ptr)
  {
    char v5 = (void *)MediaExperienceLibrary_0();
    v10[3] = (uint64_t)dlsym(v5, "AVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabled");
    getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabledSymbolLoc_ptr = v10[3];
    char v4 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v4) {
    -[TUAudioRoute isInEarDetectionEnabled]();
  }
  char v6 = [v3 objectForKeyedSubscript:*v4];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (BOOL)isDefaultRoute
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v3 = (void *)getAVSystemController_PickableRouteType_DefaultSymbolLoc_ptr;
  uint64_t v9 = getAVSystemController_PickableRouteType_DefaultSymbolLoc_ptr;
  if (!getAVSystemController_PickableRouteType_DefaultSymbolLoc_ptr)
  {
    char v4 = (void *)MediaExperienceLibrary_0();
    v7[3] = (uint64_t)dlsym(v4, "AVSystemController_PickableRouteType_Default");
    getAVSystemController_PickableRouteType_DefaultSymbolLoc_ptr = v7[3];
    char v3 = (void *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v3) {
    -[TUAudioRoute isDefaultRoute]();
  }
  return [(TUAudioRoute *)self _routeTypeEqualTo:*v3];
}

- (BOOL)isCurrentlyPicked
{
  v2 = [(TUAudioRoute *)self route];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v3 = (void *)getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr_0;
  uint64_t v11 = getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr_0;
  if (!getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr_0)
  {
    char v4 = (void *)MediaExperienceLibrary_0();
    v9[3] = (uint64_t)dlsym(v4, "AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked");
    getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr_0 = v9[3];
    char v3 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3) {
    -[TUAudioRoute isCurrentlyPicked]();
  }
  char v5 = [v2 objectForKeyedSubscript:*v3];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)isCarAudio
{
  v2 = [(TUAudioRoute *)self avAudioRouteName];
  char v3 = [v2 isEqualToString:@"CarAudioOutput"];

  return v3;
}

- (BOOL)isBluetoothManaged
{
  v2 = [(TUAudioRoute *)self route];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v3 = (void *)getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr;
  uint64_t v11 = getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr)
  {
    char v4 = (void *)MediaExperienceLibrary_0();
    v9[3] = (uint64_t)dlsym(v4, "AVSystemController_RouteDescriptionKey_BTDetails_IsBTManaged");
    getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr = v9[3];
    char v3 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v3) {
    -[TUAudioRoute isBluetoothManaged]();
  }
  char v5 = [v2 objectForKeyedSubscript:*v3];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)isBluetoothLE
{
  v2 = [(TUAudioRoute *)self avAudioRouteName];
  char v3 = [v2 isEqualToString:@"BluetoothLEOutput"];

  return v3;
}

- (BOOL)isAirTunes
{
  v2 = [(TUAudioRoute *)self avAudioRouteName];
  char v3 = [v2 isEqualToString:@"AirTunes"];

  return v3;
}

- (BOOL)isA2DPRoute
{
  if (![(TUAudioRoute *)self isBluetooth]) {
    return 0;
  }
  char v3 = [(TUAudioRoute *)self route];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v4 = (void *)getAVSystemController_RouteDescriptionKey_BTDetails_IsA2DPRouteSymbolLoc_ptr;
  uint64_t v12 = getAVSystemController_RouteDescriptionKey_BTDetails_IsA2DPRouteSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_IsA2DPRouteSymbolLoc_ptr)
  {
    char v5 = (void *)MediaExperienceLibrary_0();
    v10[3] = (uint64_t)dlsym(v5, "AVSystemController_RouteDescriptionKey_BTDetails_IsA2DPRoute");
    getAVSystemController_RouteDescriptionKey_BTDetails_IsA2DPRouteSymbolLoc_ptr = v10[3];
    char v4 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v4) {
    -[TUAudioRoute isA2DPRoute]();
  }
  char v6 = [v3 objectForKeyedSubscript:*v4];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (id)identifiersOfOtherConnectedDevices
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA48] array];
  char v4 = [(TUAudioRoute *)self route];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v5 = (void *)getAVSystemController_RouteDescriptionKey_OtherDevicesConnectedSymbolLoc_ptr;
  uint64_t v31 = getAVSystemController_RouteDescriptionKey_OtherDevicesConnectedSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_OtherDevicesConnectedSymbolLoc_ptr)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __getAVSystemController_RouteDescriptionKey_OtherDevicesConnectedSymbolLoc_block_invoke;
    v26 = &unk_1E58E5F90;
    v27 = &v28;
    char v6 = (void *)MediaExperienceLibrary_0();
    v29[3] = (uint64_t)dlsym(v6, "AVSystemController_RouteDescriptionKey_OtherDevicesConnected");
    getAVSystemController_RouteDescriptionKey_OtherDevicesConnectedSymbolLoc_ptr = *(void *)(v27[1] + 24);
    char v5 = (void *)v29[3];
  }
  _Block_object_dispose(&v28, 8);
  if (!v5) {
    -[TUAudioRoute identifiersOfOtherConnectedDevices]();
  }
  char v7 = [v4 objectForKeyedSubscript:*v5];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v28 = 0;
        v29 = &v28;
        uint64_t v30 = 0x2020000000;
        uint64_t v13 = (void *)getAVSystemController_RouteDescriptionKey_OtherDevicesConnected_UniqueIDSymbolLoc_ptr;
        uint64_t v31 = getAVSystemController_RouteDescriptionKey_OtherDevicesConnected_UniqueIDSymbolLoc_ptr;
        if (!getAVSystemController_RouteDescriptionKey_OtherDevicesConnected_UniqueIDSymbolLoc_ptr)
        {
          uint64_t v23 = MEMORY[0x1E4F143A8];
          uint64_t v24 = 3221225472;
          v25 = __getAVSystemController_RouteDescriptionKey_OtherDevicesConnected_UniqueIDSymbolLoc_block_invoke;
          v26 = &unk_1E58E5F90;
          v27 = &v28;
          uint64_t v14 = (void *)MediaExperienceLibrary_0();
          uint64_t v15 = dlsym(v14, "AVSystemController_RouteDescriptionKey_OtherDevicesConnected_UniqueID");
          *(void *)(v27[1] + 24) = v15;
          getAVSystemController_RouteDescriptionKey_OtherDevicesConnected_UniqueIDSymbolLoc_ptr = *(void *)(v27[1] + 24);
          uint64_t v13 = (void *)v29[3];
        }
        _Block_object_dispose(&v28, 8);
        if (!v13) {
          -[TUAudioRoute identifiersOfOtherConnectedDevices]();
        }
        v16 = objc_msgSend(v12, "objectForKeyedSubscript:", *v13, (void)v19);
        if (v16) {
          [v3 addObject:v16];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v32 count:16];
    }
    while (v9);
  }

  v17 = (void *)[v3 copy];

  return v17;
}

- (int64_t)deviceType
{
  v2 = [(TUAudioRoute *)self bluetoothProductIdentifier];
  if (([v2 hasSuffix:@"76,8194"] & 1) != 0
    || ([v2 hasSuffix:@"76,8207"] & 1) != 0)
  {
    int64_t v3 = 1;
  }
  else if ([v2 hasSuffix:@"76,8206"])
  {
    int64_t v3 = 18;
  }
  else if (([v2 hasSuffix:@"76,8212"] & 1) != 0 {
         || ([v2 hasSuffix:@"76,8228"] & 1) != 0)
  }
  {
    int64_t v3 = 29;
  }
  else if (([v2 hasSuffix:@"76,8229"] & 1) != 0 {
         || ([v2 hasSuffix:@"76,8198"] & 1) != 0)
  }
  {
    int64_t v3 = 2;
  }
  else if ([v2 hasSuffix:@"76,8197"])
  {
    int64_t v3 = 3;
  }
  else if ([v2 hasSuffix:@"76,8195"])
  {
    int64_t v3 = 4;
  }
  else
  {
    if ([v2 hasSuffix:@"76,8201"]) {
      goto LABEL_18;
    }
    if ([v2 hasSuffix:@"76,8203"])
    {
      int64_t v3 = 16;
      goto LABEL_4;
    }
    if ([v2 hasSuffix:@"76,8204"])
    {
      int64_t v3 = 17;
      goto LABEL_4;
    }
    if ([v2 hasSuffix:@"76,8205"])
    {
      int64_t v3 = 19;
      goto LABEL_4;
    }
    if (([v2 hasSuffix:@"76,8202"] & 1) != 0
      || ([v2 hasSuffix:@"76,8223"] & 1) != 0)
    {
      int64_t v3 = 20;
      goto LABEL_4;
    }
    if ([v2 hasSuffix:@"76,8208"])
    {
      int64_t v3 = 21;
      goto LABEL_4;
    }
    if (([v2 hasSuffix:@"76,8209"] & 1) != 0
      || ([v2 hasSuffix:@"76,8214"] & 1) != 0)
    {
      int64_t v3 = 24;
      goto LABEL_4;
    }
    if ([v2 hasSuffix:@"76,8215"])
    {
LABEL_18:
      int64_t v3 = 5;
    }
    else if ([v2 hasSuffix:@"76,8218"])
    {
      int64_t v3 = 31;
    }
    else if ([v2 hasSuffix:@"76,8230"])
    {
      int64_t v3 = 33;
    }
    else if ([v2 hasSuffix:@"76,8221"])
    {
      int64_t v3 = 34;
    }
    else if (([v2 hasSuffix:@"76,8217"] & 1) != 0 {
           || ([v2 hasSuffix:@"76,8219"] & 1) != 0)
    }
    {
      int64_t v3 = 36;
    }
    else if ([v2 hasSuffix:@"76,8210"])
    {
      int64_t v3 = 25;
    }
    else if ([v2 hasSuffix:@"76,8211"])
    {
      int64_t v3 = 26;
    }
    else
    {
      int64_t v3 = 0;
    }
  }
LABEL_4:

  return v3;
}

- (NSString)bluetoothProductIdentifier
{
  v2 = [(TUAudioRoute *)self route];
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int64_t v3 = (void *)getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr;
  uint64_t v10 = getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr)
  {
    char v4 = (void *)MediaExperienceLibrary_0();
    v8[3] = (uint64_t)dlsym(v4, "AVSystemController_RouteDescriptionKey_BTDetails_ProductID");
    getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr = v8[3];
    int64_t v3 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v3) {
    -[TUAudioRoute bluetoothProductIdentifier]();
  }
  char v5 = [v2 objectForKeyedSubscript:*v3];

  return (NSString *)v5;
}

- (int64_t)bluetoothEndpointType
{
  if (![(TUAudioRoute *)self isBluetooth]) {
    return 0;
  }
  int64_t v3 = getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType();

  if (v3)
  {
    char v4 = [(TUAudioRoute *)self route];
    char v5 = getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType();
    char v6 = [v4 objectForKeyedSubscript:v5];

    uint64_t v7 = getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Headphones();
    if (v7
      && (id v8 = (void *)v7,
          getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Headphones(),
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v6 isEqualToString:v9],
          v9,
          v8,
          (v10 & 1) != 0))
    {
      int64_t v3 = 1;
    }
    else
    {
      uint64_t v11 = getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Vehicle();
      if (v11
        && (uint64_t v12 = (void *)v11,
            getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Vehicle(),
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            char v14 = [v6 isEqualToString:v13],
            v13,
            v12,
            (v14 & 1) != 0))
      {
        int64_t v3 = 2;
      }
      else
      {
        uint64_t v15 = getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Speakers();
        if (v15
          && (v16 = (void *)v15,
              getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Speakers(),
              v17 = objc_claimAutoreleasedReturnValue(),
              char v18 = [v6 isEqualToString:v17],
              v17,
              v16,
              (v18 & 1) != 0))
        {
          int64_t v3 = 3;
        }
        else
        {
          int64_t v3 = getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_TTY();
          if (v3)
          {
            long long v19 = getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_TTY();
            int v20 = [v6 isEqualToString:v19];

            if (v20) {
              int64_t v3 = 4;
            }
            else {
              int64_t v3 = 0;
            }
          }
        }
      }
    }
  }
  return v3;
}

- (BOOL)_routeTypeEqualTo:(id)a3
{
  id v4 = a3;
  char v5 = [(TUAudioRoute *)self route];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v6 = (void *)getAVSystemController_RouteDescriptionKey_RouteTypeSymbolLoc_ptr;
  uint64_t v14 = getAVSystemController_RouteDescriptionKey_RouteTypeSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_RouteTypeSymbolLoc_ptr)
  {
    uint64_t v7 = (void *)MediaExperienceLibrary_0();
    v12[3] = (uint64_t)dlsym(v7, "AVSystemController_RouteDescriptionKey_RouteType");
    getAVSystemController_RouteDescriptionKey_RouteTypeSymbolLoc_ptr = v12[3];
    char v6 = (void *)v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v6) {
    -[TUAudioRoute _routeTypeEqualTo:]();
  }
  id v8 = [v5 objectForKeyedSubscript:*v6];
  char v9 = [v8 isEqual:v4];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_avAudioRouteName, 0);
}

- (TUAudioRoute)initWithDictionary:(id)a3
{
  id v5 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v6 = (void *)getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr_0;
  uint64_t v32 = getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr_0;
  if (!getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr_0)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_block_invoke_0;
    v27 = &unk_1E58E5F90;
    uint64_t v28 = &v29;
    uint64_t v7 = (void *)MediaExperienceLibrary_0();
    v30[3] = (uint64_t)dlsym(v7, "AVSystemController_RouteDescriptionKey_RouteUID");
    getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr_0 = *(void *)(v28[1] + 24);
    char v6 = (void *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v6) {
    -[TUAudioRoute initWithDictionary:]();
  }
  id v8 = [v5 objectForKeyedSubscript:*v6];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v9 = (void *)getAVSystemController_RouteDescriptionKey_RouteNameSymbolLoc_ptr;
  uint64_t v32 = getAVSystemController_RouteDescriptionKey_RouteNameSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_RouteNameSymbolLoc_ptr)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getAVSystemController_RouteDescriptionKey_RouteNameSymbolLoc_block_invoke;
    v27 = &unk_1E58E5F90;
    uint64_t v28 = &v29;
    char v10 = (void *)MediaExperienceLibrary_0();
    v30[3] = (uint64_t)dlsym(v10, "AVSystemController_RouteDescriptionKey_RouteName");
    getAVSystemController_RouteDescriptionKey_RouteNameSymbolLoc_ptr = *(void *)(v28[1] + 24);
    char v9 = (void *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v9) {
    -[TUAudioRoute initWithDictionary:]();
  }
  uint64_t v11 = [v5 objectForKeyedSubscript:*v9];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v12 = (id *)getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr_0;
  uint64_t v32 = getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr_0;
  if (!getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr_0)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_block_invoke_0;
    v27 = &unk_1E58E5F90;
    uint64_t v28 = &v29;
    uint64_t v13 = (void *)MediaExperienceLibrary_0();
    v30[3] = (uint64_t)dlsym(v13, "AVSystemController_RouteDescriptionKey_AVAudioRouteName");
    getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr_0 = *(void *)(v28[1] + 24);
    uint64_t v12 = (id *)v30[3];
  }
  _Block_object_dispose(&v29, 8);
  if (!v12) {
    -[TUAudioRoute initWithDictionary:]();
  }
  id v14 = *v12;
  uint64_t v15 = [v5 objectForKeyedSubscript:v14];

  if (v11) {
    v16 = v11;
  }
  else {
    v16 = v15;
  }
  id v17 = v16;
  char v18 = v17;
  long long v19 = 0;
  if (!v8 || !v17) {
    goto LABEL_17;
  }
  v23.receiver = self;
  v23.super_class = (Class)TUAudioRoute;
  int v20 = [(TURoute *)&v23 initWithUniqueIdentifier:v8 name:v17];
  long long v19 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_route, a3);
    long long v21 = v15;
    self = (TUAudioRoute *)v19->_avAudioRouteName;
    v19->_avAudioRouteName = v21;
LABEL_17:
  }
  return v19;
}

- (id)customDescription
{
  int64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)TUAudioRoute;
  id v4 = [(TURoute *)&v9 customDescription];
  id v5 = [v3 stringWithString:v4];

  if ([(TUAudioRoute *)self isBluetooth])
  {
    char v6 = [(TUAudioRoute *)self bluetoothProductIdentifier];
    [v5 appendFormat:@" bluetoothProductIdentifier=%@", v6];

    objc_msgSend(v5, "appendFormat:", @" isA2DPRoute=%d", -[TUAudioRoute isA2DPRoute](self, "isA2DPRoute"));
  }
  uint64_t v7 = (void *)[v5 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUAudioRoute)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  char v6 = [v4 setWithObject:objc_opt_class()];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  objc_super v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  char v10 = NSStringFromSelector(sel_route);
  uint64_t v11 = [v5 decodeDictionaryWithKeysOfClasses:v6 objectsOfClasses:v9 forKey:v10];

  uint64_t v12 = [(TUAudioRoute *)self initWithDictionary:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  route = self->_route;
  id v4 = a3;
  NSStringFromSelector(sel_route);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:route forKey:v5];
}

- (BOOL)isHandset
{
  if ([(TUAudioRoute *)self isReceiver])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(TUAudioRoute *)self isDefaultRoute];
    if (v3) {
      LOBYTE(v3) = ![(TUAudioRoute *)self isSpeaker];
    }
  }
  return v3;
}

- (BOOL)supportsHighQualityVoiceWithMedia
{
  return 0;
}

- (void)initWithDictionary:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_RouteUID(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 51, @"%s", dlerror());

  __break(1u);
}

- (void)initWithDictionary:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_RouteName(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 49, @"%s", dlerror());

  __break(1u);
}

- (void)initWithDictionary:.cold.3()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_AVAudioRouteName(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 30, @"%s", dlerror());

  __break(1u);
}

- (void)isCurrentlyPicked
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_RouteCurrentlyPicked(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 48, @"%s", dlerror());

  __break(1u);
}

- (void)isBluetooth
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_IsBTRoute(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 41, @"%s", dlerror());

  __break(1u);
}

- (void)isBluetoothManaged
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManaged(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 37, @"%s", dlerror());

  __break(1u);
}

- (void)isA2DPRoute
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_BTDetails_IsA2DPRoute(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 36, @"%s", dlerror());

  __break(1u);
}

- (void)isInEarDetectionEnabled
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabled(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 46, @"%s", dlerror());

  __break(1u);
}

- (void)isInEarDetectionSupported
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupported(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 47, @"%s", dlerror());

  __break(1u);
}

- (void)isWiredHeadset
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_HeadphoneJackHasInputAttribute(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 26, @"%s", dlerror());

  __break(1u);
}

- (void)isWirelessHeadset
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_PickableRouteType_Wireless(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 29, @"%s", dlerror());

  __break(1u);
}

- (void)isDefaultRoute
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_PickableRouteType_Default(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 28, @"%s", dlerror());

  __break(1u);
}

- (void)isPreferred
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_IsPreferredExternalRoute(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 42, @"%s", dlerror());

  __break(1u);
}

- (void)isPreferredAndActive
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActive(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 45, @"%s", dlerror());

  __break(1u);
}

- (void)isPartnerRouteRoutable
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_BTDetails_PartnerRouteRoutable(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 38, @"%s", dlerror());

  __break(1u);
}

- (void)isSiblingRoutePresent
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_BTDetails_SiblingRoutePresent(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 40, @"%s", dlerror());

  __break(1u);
}

- (void)supportsSharePlay
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_SupportsSharePlay(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 52, @"%s", dlerror());

  __break(1u);
}

- (void)bluetoothProductIdentifier
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_BTDetails_ProductID(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 39, @"%s", dlerror());

  __break(1u);
}

- (void)isHeadphoneJackConnected
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_HeadphoneJackIsConnectedAttribute(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 27, @"%s", dlerror());

  __break(1u);
}

- (void)_routeTypeEqualTo:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_RouteType(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 50, @"%s", dlerror());

  __break(1u);
}

- (void)identifiersOfOtherConnectedDevices
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getAVSystemController_RouteDescriptionKey_OtherDevicesConnected_UniqueID(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"TUAudioRoute.m", 44, @"%s", dlerror());

  __break(1u);
}

@end