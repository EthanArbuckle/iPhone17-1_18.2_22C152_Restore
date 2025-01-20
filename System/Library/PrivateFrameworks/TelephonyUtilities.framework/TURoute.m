@interface TURoute
+ (BOOL)supportsSecureCoding;
+ (id)predicateForInEarAudioRoute;
+ (id)predicateForInEarRouteInTipiWithAndSmartRoutedToCompanionWatch;
+ (id)predicateForInEarRouteInTipiWithCompanionWatch;
+ (id)predicateForPreferredRoute;
- (BOOL)isA2DPRoute;
- (BOOL)isAirPodsRoute;
- (BOOL)isAirTunes;
- (BOOL)isAuxiliary;
- (BOOL)isBluetooth;
- (BOOL)isBluetoothLE;
- (BOOL)isBluetoothManaged;
- (BOOL)isCarAudio;
- (BOOL)isCarKitRoute;
- (BOOL)isCurrentlyPicked;
- (BOOL)isDefaultRoute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRoute:(id)a3;
- (BOOL)isEqualToRouteIgnoringIsRecommended:(id)a3;
- (BOOL)isGuest;
- (BOOL)isHomePodFamily;
- (BOOL)isInEarDetected;
- (BOOL)isInEarDetectionEnabled;
- (BOOL)isInEarDetectionSupported;
- (BOOL)isInTipiWithCompanion;
- (BOOL)isPartnerRouteRoutable;
- (BOOL)isPreferred;
- (BOOL)isPreferredAndActive;
- (BOOL)isReceiver;
- (BOOL)isRecommended;
- (BOOL)isSiblingRoutePresent;
- (BOOL)isSmartRoutedTo;
- (BOOL)isSpeaker;
- (BOOL)isTipiParticipant;
- (BOOL)isTriangleParticipant;
- (BOOL)isWiredHeadphones;
- (BOOL)isWiredHeadset;
- (BOOL)isWirelessHeadset;
- (BOOL)supportsHighQualityVoiceWithMedia;
- (BOOL)supportsRelay;
- (BOOL)supportsSharePlay;
- (NSArray)identifiersOfOtherConnectedDevices;
- (NSString)name;
- (NSString)uniqueIdentifier;
- (TURoute)initWithCoder:(id)a3;
- (TURoute)initWithRoute:(id)a3;
- (TURoute)initWithUniqueIdentifier:(id)a3 name:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customDescription;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)bluetoothEndpointType;
- (int64_t)deviceType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setA2DPRoute:(BOOL)a3;
- (void)setAirTunes:(BOOL)a3;
- (void)setBluetooth:(BOOL)a3;
- (void)setBluetoothEndpointType:(int64_t)a3;
- (void)setBluetoothLE:(BOOL)a3;
- (void)setBluetoothManaged:(BOOL)a3;
- (void)setCarAudio:(BOOL)a3;
- (void)setCurrentlyPicked:(BOOL)a3;
- (void)setDefaultRoute:(BOOL)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setGuest:(BOOL)a3;
- (void)setIdentifiersOfOtherConnectedDevices:(id)a3;
- (void)setInEarDetectionEnabled:(BOOL)a3;
- (void)setInEarDetectionSupported:(BOOL)a3;
- (void)setInTipiWithCompanion:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPartnerRouteRoutable:(BOOL)a3;
- (void)setPreferred:(BOOL)a3;
- (void)setPreferredAndActive:(BOOL)a3;
- (void)setReceiver:(BOOL)a3;
- (void)setRecommended:(BOOL)a3;
- (void)setSiblingRoutePresent:(BOOL)a3;
- (void)setSmartRoutedTo:(BOOL)a3;
- (void)setSpeaker:(BOOL)a3;
- (void)setSupportsHighQualityVoiceWithMedia:(BOOL)a3;
- (void)setSupportsRelay:(BOOL)a3;
- (void)setSupportsSharePlay:(BOOL)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setWiredHeadphones:(BOOL)a3;
- (void)setWiredHeadset:(BOOL)a3;
- (void)setWirelessHeadset:(BOOL)a3;
@end

@implementation TURoute

- (BOOL)isEqualToRouteIgnoringIsRecommended:(id)a3
{
  id v4 = a3;
  int v5 = [(TURoute *)self isA2DPRoute];
  if (v5 != [v4 isA2DPRoute]) {
    goto LABEL_12;
  }
  int v6 = [(TURoute *)self isAirTunes];
  if (v6 != [v4 isAirTunes]) {
    goto LABEL_12;
  }
  int v7 = [(TURoute *)self isCarAudio];
  if (v7 != [v4 isCarAudio]) {
    goto LABEL_12;
  }
  int v8 = [(TURoute *)self isCurrentlyPicked];
  if (v8 != [v4 isCurrentlyPicked]) {
    goto LABEL_12;
  }
  int v9 = [(TURoute *)self isBluetooth];
  if (v9 == [v4 isBluetooth]
    && (int64_t v10 = [(TURoute *)self bluetoothEndpointType],
        v10 == [v4 bluetoothEndpointType])
    && (int v11 = -[TURoute isBluetoothLE](self, "isBluetoothLE"), v11 == [v4 isBluetoothLE])
    && (int v12 = [(TURoute *)self isBluetoothManaged],
        v12 == [v4 isBluetoothManaged])
    && (int v13 = -[TURoute isDefaultRoute](self, "isDefaultRoute"), v13 == [v4 isDefaultRoute])
    && (int64_t v14 = -[TURoute deviceType](self, "deviceType"), v14 == [v4 deviceType])
    && (int v15 = -[TURoute isGuest](self, "isGuest"), v15 == [v4 isGuest]))
  {
    v18 = [(TURoute *)self identifiersOfOtherConnectedDevices];
    v19 = [v4 identifiersOfOtherConnectedDevices];
    if ([v18 isEqualToArray:v19]
      && (int v20 = [(TURoute *)self isInTipiWithCompanion],
          v20 == [v4 isInTipiWithCompanion])
      && (int v21 = [(TURoute *)self isSmartRoutedTo],
          v21 == [v4 isSmartRoutedTo])
      && (int v22 = [(TURoute *)self isInEarDetectionEnabled],
          v22 == [v4 isInEarDetectionEnabled])
      && (int v23 = [(TURoute *)self isInEarDetectionSupported],
          v23 == [v4 isInEarDetectionSupported]))
    {
      v24 = [(TURoute *)self name];
      v25 = [v4 name];
      if ([v24 isEqualToString:v25]
        && (int v26 = -[TURoute isPreferred](self, "isPreferred"), v26 == [v4 isPreferred])
        && (int v27 = [(TURoute *)self isPreferredAndActive],
            v27 == [v4 isPreferredAndActive])
        && (int v28 = -[TURoute isReceiver](self, "isReceiver"), v28 == [v4 isReceiver])
        && (int v29 = -[TURoute isSpeaker](self, "isSpeaker"), v29 == [v4 isSpeaker])
        && (int v30 = -[TURoute supportsRelay](self, "supportsRelay"), v30 == [v4 supportsRelay]))
      {
        v31 = [(TURoute *)self uniqueIdentifier];
        v32 = [v4 uniqueIdentifier];
        if ([v31 isEqualToString:v32]
          && (int v33 = [(TURoute *)self isWiredHeadphones],
              v33 == [v4 isWiredHeadphones])
          && (int v34 = [(TURoute *)self isWiredHeadset],
              v34 == [v4 isWiredHeadset])
          && (int v35 = [(TURoute *)self isWirelessHeadset],
              v35 == [v4 isWirelessHeadset])
          && (int v36 = [(TURoute *)self isPartnerRouteRoutable],
              v36 == [v4 isPartnerRouteRoutable])
          && (int v37 = [(TURoute *)self isSiblingRoutePresent],
              v37 == [v4 isSiblingRoutePresent]))
        {
          BOOL v38 = [(TURoute *)self supportsSharePlay];
          int v16 = v38 ^ [v4 supportsSharePlay] ^ 1;
        }
        else
        {
          LOBYTE(v16) = 0;
        }
      }
      else
      {
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  else
  {
LABEL_12:
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)supportsRelay
{
  return self->_supportsRelay;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isSmartRoutedTo
{
  return self->_smartRoutedTo;
}

- (BOOL)isInTipiWithCompanion
{
  return self->_inTipiWithCompanion;
}

- (BOOL)isGuest
{
  return self->_guest;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TURoute *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TURoute *)self isEqualToRoute:v4];
  }

  return v5;
}

- (BOOL)isEqualToRoute:(id)a3
{
  id v4 = a3;
  if ([(TURoute *)self isEqualToRouteIgnoringIsRecommended:v4])
  {
    BOOL v5 = [(TURoute *)self isRecommended];
    int v6 = v5 ^ [v4 isRecommended] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isRecommended
{
  return self->_recommended;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersOfOtherConnectedDevices, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (TURoute)initWithUniqueIdentifier:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TURoute;
  int v8 = [(TURoute *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    name = v8->_name;
    v8->_name = (NSString *)v11;

    identifiersOfOtherConnectedDevices = v8->_identifiersOfOtherConnectedDevices;
    v8->_identifiersOfOtherConnectedDevices = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v8;
}

- (TURoute)initWithRoute:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TURoute;
  BOOL v5 = [(TURoute *)&v13 init];
  if (v5)
  {
    -[TURoute setA2DPRoute:](v5, "setA2DPRoute:", [v4 isA2DPRoute]);
    -[TURoute setAirTunes:](v5, "setAirTunes:", [v4 isAirTunes]);
    -[TURoute setBluetooth:](v5, "setBluetooth:", [v4 isBluetooth]);
    -[TURoute setBluetoothEndpointType:](v5, "setBluetoothEndpointType:", [v4 bluetoothEndpointType]);
    -[TURoute setBluetoothLE:](v5, "setBluetoothLE:", [v4 isBluetoothLE]);
    -[TURoute setBluetoothManaged:](v5, "setBluetoothManaged:", [v4 isBluetoothManaged]);
    -[TURoute setCarAudio:](v5, "setCarAudio:", [v4 isCarAudio]);
    -[TURoute setCurrentlyPicked:](v5, "setCurrentlyPicked:", [v4 isCurrentlyPicked]);
    -[TURoute setDefaultRoute:](v5, "setDefaultRoute:", [v4 isDefaultRoute]);
    -[TURoute setDeviceType:](v5, "setDeviceType:", [v4 deviceType]);
    -[TURoute setGuest:](v5, "setGuest:", [v4 isGuest]);
    id v6 = [v4 identifiersOfOtherConnectedDevices];
    id v7 = (void *)[v6 copy];
    [(TURoute *)v5 setIdentifiersOfOtherConnectedDevices:v7];

    -[TURoute setInTipiWithCompanion:](v5, "setInTipiWithCompanion:", [v4 isInTipiWithCompanion]);
    -[TURoute setSmartRoutedTo:](v5, "setSmartRoutedTo:", [v4 isSmartRoutedTo]);
    -[TURoute setInEarDetectionEnabled:](v5, "setInEarDetectionEnabled:", [v4 isInEarDetectionEnabled]);
    -[TURoute setInEarDetectionSupported:](v5, "setInEarDetectionSupported:", [v4 isInEarDetectionSupported]);
    int v8 = [v4 name];
    uint64_t v9 = (void *)[v8 copy];
    [(TURoute *)v5 setName:v9];

    -[TURoute setPreferred:](v5, "setPreferred:", [v4 isPreferred]);
    -[TURoute setPreferredAndActive:](v5, "setPreferredAndActive:", [v4 isPreferredAndActive]);
    -[TURoute setReceiver:](v5, "setReceiver:", [v4 isReceiver]);
    -[TURoute setSpeaker:](v5, "setSpeaker:", [v4 isSpeaker]);
    -[TURoute setSupportsRelay:](v5, "setSupportsRelay:", [v4 supportsRelay]);
    int64_t v10 = [v4 uniqueIdentifier];
    uint64_t v11 = (void *)[v10 copy];
    [(TURoute *)v5 setUniqueIdentifier:v11];

    -[TURoute setWiredHeadphones:](v5, "setWiredHeadphones:", [v4 isWiredHeadphones]);
    -[TURoute setWiredHeadset:](v5, "setWiredHeadset:", [v4 isWiredHeadset]);
    -[TURoute setWirelessHeadset:](v5, "setWirelessHeadset:", [v4 isWirelessHeadset]);
    -[TURoute setPartnerRouteRoutable:](v5, "setPartnerRouteRoutable:", [v4 isPartnerRouteRoutable]);
    -[TURoute setSiblingRoutePresent:](v5, "setSiblingRoutePresent:", [v4 isSiblingRoutePresent]);
    -[TURoute setSupportsSharePlay:](v5, "setSupportsSharePlay:", [v4 supportsSharePlay]);
    -[TURoute setRecommended:](v5, "setRecommended:", [v4 isRecommended]);
  }

  return v5;
}

- (id)customDescription
{
  return &stru_1EECEA668;
}

- (BOOL)isHomePodFamily
{
  unint64_t v2 = [(TURoute *)self deviceType];
  return (v2 < 0x1D) & (0x18C04040u >> v2);
}

- (BOOL)isAirPodsRoute
{
  unint64_t v2 = [(TURoute *)self deviceType];
  return (v2 < 0x1E) & (0x24140002u >> v2);
}

- (BOOL)isInEarDetected
{
  BOOL v3 = [(TURoute *)self isInEarDetectionEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(TURoute *)self isPreferredAndActive];
  }
  return v3;
}

- (BOOL)isTipiParticipant
{
  BOOL v3 = [(TURoute *)self isBluetoothManaged];
  if (v3)
  {
    LOBYTE(v3) = [(TURoute *)self isPreferred];
  }
  return v3;
}

- (BOOL)isTriangleParticipant
{
  if ([(TURoute *)self isTipiParticipant] || ![(TURoute *)self isPreferred]) {
    return 0;
  }
  BOOL v3 = [(TURoute *)self identifiersOfOtherConnectedDevices];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)isAuxiliary
{
  if ([(TURoute *)self isSpeaker] || [(TURoute *)self isReceiver]) {
    return 0;
  }
  else {
    return ![(TURoute *)self isDefaultRoute];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = +[TURoute allocWithZone:a3];

  return [(TURoute *)v4 initWithRoute:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  BOOL v4 = +[TUMutableRoute allocWithZone:a3];

  return [(TURoute *)v4 initWithRoute:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TURoute)initWithCoder:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)TURoute;
  BOOL v5 = [(TURoute *)&v49 init];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_isA2DPRoute);
    v5->_A2DPRoute = [v4 decodeBoolForKey:v6];

    id v7 = NSStringFromSelector(sel_isAirTunes);
    v5->_airTunes = [v4 decodeBoolForKey:v7];

    int v8 = NSStringFromSelector(sel_isBluetooth);
    v5->_bluetooth = [v4 decodeBoolForKey:v8];

    uint64_t v9 = NSStringFromSelector(sel_bluetoothEndpointType);
    v5->_bluetoothEndpointType = [v4 decodeIntegerForKey:v9];

    int64_t v10 = NSStringFromSelector(sel_isBluetoothLE);
    v5->_bluetoothLE = [v4 decodeBoolForKey:v10];

    uint64_t v11 = NSStringFromSelector(sel_isBluetoothManaged);
    v5->_bluetoothManaged = [v4 decodeBoolForKey:v11];

    int v12 = NSStringFromSelector(sel_isCarAudio);
    v5->_carAudio = [v4 decodeBoolForKey:v12];

    objc_super v13 = NSStringFromSelector(sel_isCurrentlyPicked);
    v5->_currentlyPicked = [v4 decodeBoolForKey:v13];

    int64_t v14 = NSStringFromSelector(sel_isDefaultRoute);
    v5->_defaultRoute = [v4 decodeBoolForKey:v14];

    objc_super v15 = NSStringFromSelector(sel_deviceType);
    v5->_deviceType = [v4 decodeIntegerForKey:v15];

    int v16 = NSStringFromSelector(sel_isGuest);
    v5->_guest = [v4 decodeBoolForKey:v16];

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    int v20 = NSStringFromSelector(sel_identifiersOfOtherConnectedDevices);
    uint64_t v21 = [v4 decodeObjectOfClasses:v19 forKey:v20];
    identifiersOfOtherConnectedDevices = v5->_identifiersOfOtherConnectedDevices;
    v5->_identifiersOfOtherConnectedDevices = (NSArray *)v21;

    int v23 = NSStringFromSelector(sel_isInTipiWithCompanion);
    v5->_inTipiWithCompanion = [v4 decodeBoolForKey:v23];

    v24 = NSStringFromSelector(sel_isSmartRoutedTo);
    v5->_smartRoutedTo = [v4 decodeBoolForKey:v24];

    v25 = NSStringFromSelector(sel_isInEarDetectionEnabled);
    v5->_inEarDetectionEnabled = [v4 decodeBoolForKey:v25];

    int v26 = NSStringFromSelector(sel_isInEarDetectionSupported);
    v5->_inEarDetectionSupported = [v4 decodeBoolForKey:v26];

    uint64_t v27 = objc_opt_class();
    int v28 = NSStringFromSelector(sel_name);
    uint64_t v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    name = v5->_name;
    v5->_name = (NSString *)v29;

    v31 = NSStringFromSelector(sel_isPreferred);
    v5->_preferred = [v4 decodeBoolForKey:v31];

    v32 = NSStringFromSelector(sel_isPreferredAndActive);
    v5->_preferredAndActive = [v4 decodeBoolForKey:v32];

    int v33 = NSStringFromSelector(sel_isReceiver);
    v5->_receiver = [v4 decodeBoolForKey:v33];

    int v34 = NSStringFromSelector(sel_isSpeaker);
    v5->_speaker = [v4 decodeBoolForKey:v34];

    int v35 = NSStringFromSelector(sel_supportsHighQualityVoiceWithMedia);
    v5->_supportsHighQualityVoiceWithMedia = [v4 decodeBoolForKey:v35];

    int v36 = NSStringFromSelector(sel_supportsRelay);
    v5->_supportsRelay = [v4 decodeBoolForKey:v36];

    uint64_t v37 = objc_opt_class();
    BOOL v38 = NSStringFromSelector(sel_uniqueIdentifier);
    uint64_t v39 = [v4 decodeObjectOfClass:v37 forKey:v38];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v39;

    v41 = NSStringFromSelector(sel_isWiredHeadphones);
    v5->_wiredHeadphones = [v4 decodeBoolForKey:v41];

    v42 = NSStringFromSelector(sel_isWiredHeadset);
    v5->_wiredHeadset = [v4 decodeBoolForKey:v42];

    v43 = NSStringFromSelector(sel_isWirelessHeadset);
    v5->_wirelessHeadset = [v4 decodeBoolForKey:v43];

    v44 = NSStringFromSelector(sel_isPartnerRouteRoutable);
    v5->_partnerRouteRoutable = [v4 decodeBoolForKey:v44];

    v45 = NSStringFromSelector(sel_isSiblingRoutePresent);
    v5->_siblingRoutePresent = [v4 decodeBoolForKey:v45];

    v46 = NSStringFromSelector(sel_supportsSharePlay);
    v5->_supportsSharePlay = [v4 decodeBoolForKey:v46];

    v47 = NSStringFromSelector(sel_isRecommended);
    v5->_recommended = [v4 decodeBoolForKey:v47];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TURoute *)self isA2DPRoute];
  id v6 = NSStringFromSelector(sel_isA2DPRoute);
  [v4 encodeBool:v5 forKey:v6];

  BOOL v7 = [(TURoute *)self isAirTunes];
  int v8 = NSStringFromSelector(sel_isAirTunes);
  [v4 encodeBool:v7 forKey:v8];

  BOOL v9 = [(TURoute *)self isCarAudio];
  int64_t v10 = NSStringFromSelector(sel_isCarAudio);
  [v4 encodeBool:v9 forKey:v10];

  BOOL v11 = [(TURoute *)self isCurrentlyPicked];
  int v12 = NSStringFromSelector(sel_isCurrentlyPicked);
  [v4 encodeBool:v11 forKey:v12];

  BOOL v13 = [(TURoute *)self isBluetooth];
  int64_t v14 = NSStringFromSelector(sel_isBluetooth);
  [v4 encodeBool:v13 forKey:v14];

  int64_t v15 = [(TURoute *)self bluetoothEndpointType];
  int v16 = NSStringFromSelector(sel_bluetoothEndpointType);
  [v4 encodeInteger:v15 forKey:v16];

  BOOL v17 = [(TURoute *)self isBluetoothLE];
  uint64_t v18 = NSStringFromSelector(sel_isBluetoothLE);
  [v4 encodeBool:v17 forKey:v18];

  BOOL v19 = [(TURoute *)self isBluetoothManaged];
  int v20 = NSStringFromSelector(sel_isBluetoothManaged);
  [v4 encodeBool:v19 forKey:v20];

  BOOL v21 = [(TURoute *)self isDefaultRoute];
  int v22 = NSStringFromSelector(sel_isDefaultRoute);
  [v4 encodeBool:v21 forKey:v22];

  int64_t v23 = [(TURoute *)self deviceType];
  v24 = NSStringFromSelector(sel_deviceType);
  [v4 encodeInteger:v23 forKey:v24];

  BOOL v25 = [(TURoute *)self isGuest];
  int v26 = NSStringFromSelector(sel_isGuest);
  [v4 encodeBool:v25 forKey:v26];

  uint64_t v27 = [(TURoute *)self identifiersOfOtherConnectedDevices];
  int v28 = NSStringFromSelector(sel_identifiersOfOtherConnectedDevices);
  [v4 encodeObject:v27 forKey:v28];

  BOOL v29 = [(TURoute *)self isInTipiWithCompanion];
  int v30 = NSStringFromSelector(sel_isInTipiWithCompanion);
  [v4 encodeBool:v29 forKey:v30];

  BOOL v31 = [(TURoute *)self isSmartRoutedTo];
  v32 = NSStringFromSelector(sel_isSmartRoutedTo);
  [v4 encodeBool:v31 forKey:v32];

  BOOL v33 = [(TURoute *)self isInEarDetectionEnabled];
  int v34 = NSStringFromSelector(sel_isInEarDetectionEnabled);
  [v4 encodeBool:v33 forKey:v34];

  BOOL v35 = [(TURoute *)self isInEarDetectionSupported];
  int v36 = NSStringFromSelector(sel_isInEarDetectionSupported);
  [v4 encodeBool:v35 forKey:v36];

  BOOL v37 = [(TURoute *)self isPreferred];
  BOOL v38 = NSStringFromSelector(sel_isPreferred);
  [v4 encodeBool:v37 forKey:v38];

  BOOL v39 = [(TURoute *)self isPreferredAndActive];
  v40 = NSStringFromSelector(sel_isPreferredAndActive);
  [v4 encodeBool:v39 forKey:v40];

  v41 = [(TURoute *)self name];
  v42 = NSStringFromSelector(sel_name);
  [v4 encodeObject:v41 forKey:v42];

  BOOL v43 = [(TURoute *)self isReceiver];
  v44 = NSStringFromSelector(sel_isReceiver);
  [v4 encodeBool:v43 forKey:v44];

  BOOL v45 = [(TURoute *)self isSpeaker];
  v46 = NSStringFromSelector(sel_isSpeaker);
  [v4 encodeBool:v45 forKey:v46];

  BOOL v47 = [(TURoute *)self supportsHighQualityVoiceWithMedia];
  v48 = NSStringFromSelector(sel_supportsHighQualityVoiceWithMedia);
  [v4 encodeBool:v47 forKey:v48];

  BOOL v49 = [(TURoute *)self supportsRelay];
  v50 = NSStringFromSelector(sel_supportsRelay);
  [v4 encodeBool:v49 forKey:v50];

  v51 = [(TURoute *)self uniqueIdentifier];
  v52 = NSStringFromSelector(sel_uniqueIdentifier);
  [v4 encodeObject:v51 forKey:v52];

  BOOL v53 = [(TURoute *)self isWiredHeadphones];
  v54 = NSStringFromSelector(sel_isWiredHeadphones);
  [v4 encodeBool:v53 forKey:v54];

  BOOL v55 = [(TURoute *)self isWiredHeadset];
  v56 = NSStringFromSelector(sel_isWiredHeadset);
  [v4 encodeBool:v55 forKey:v56];

  BOOL v57 = [(TURoute *)self isWirelessHeadset];
  v58 = NSStringFromSelector(sel_isWirelessHeadset);
  [v4 encodeBool:v57 forKey:v58];

  BOOL v59 = [(TURoute *)self isPartnerRouteRoutable];
  v60 = NSStringFromSelector(sel_isPartnerRouteRoutable);
  [v4 encodeBool:v59 forKey:v60];

  BOOL v61 = [(TURoute *)self isSiblingRoutePresent];
  v62 = NSStringFromSelector(sel_isSiblingRoutePresent);
  [v4 encodeBool:v61 forKey:v62];

  BOOL v63 = [(TURoute *)self supportsSharePlay];
  v64 = NSStringFromSelector(sel_supportsSharePlay);
  [v4 encodeBool:v63 forKey:v64];

  BOOL v65 = [(TURoute *)self isRecommended];
  NSStringFromSelector(sel_isRecommended);
  id v66 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v65 forKey:v66];
}

- (id)description
{
  BOOL v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(TURoute *)self uniqueIdentifier];
  [v3 appendFormat:@" uniqueIdentifier=%@", v4];

  BOOL v5 = [(TURoute *)self name];
  [v3 appendFormat:@" name=%@", v5];

  if ([(TURoute *)self deviceType]) {
    objc_msgSend(v3, "appendFormat:", @" deviceType=%ld", -[TURoute deviceType](self, "deviceType"));
  }
  if ([(TURoute *)self isA2DPRoute]) {
    objc_msgSend(v3, "appendFormat:", @" isA2DPRoute=%d", -[TURoute isA2DPRoute](self, "isA2DPRoute"));
  }
  if ([(TURoute *)self isCurrentlyPicked]) {
    objc_msgSend(v3, "appendFormat:", @" isCurrentlyPicked=%d", -[TURoute isCurrentlyPicked](self, "isCurrentlyPicked"));
  }
  if ([(TURoute *)self isDefaultRoute]) {
    objc_msgSend(v3, "appendFormat:", @" isDefaultRoute=%d", -[TURoute isDefaultRoute](self, "isDefaultRoute"));
  }
  if ([(TURoute *)self isReceiver]) {
    objc_msgSend(v3, "appendFormat:", @" isReceiver=%d", -[TURoute isReceiver](self, "isReceiver"));
  }
  if ([(TURoute *)self isSpeaker]) {
    objc_msgSend(v3, "appendFormat:", @" isSpeaker=%d", -[TURoute isSpeaker](self, "isSpeaker"));
  }
  if ([(TURoute *)self isWiredHeadphones]) {
    objc_msgSend(v3, "appendFormat:", @" isWiredHeadphones=%d", -[TURoute isWiredHeadphones](self, "isWiredHeadphones"));
  }
  if ([(TURoute *)self isWiredHeadset]) {
    objc_msgSend(v3, "appendFormat:", @" isWiredHeadset=%d", -[TURoute isWiredHeadset](self, "isWiredHeadset"));
  }
  if ([(TURoute *)self isWirelessHeadset]) {
    objc_msgSend(v3, "appendFormat:", @" isWirelessHeadset=%d", -[TURoute isWirelessHeadset](self, "isWirelessHeadset"));
  }
  if ([(TURoute *)self isAirTunes]) {
    objc_msgSend(v3, "appendFormat:", @" isAirTunes=%d", -[TURoute isAirTunes](self, "isAirTunes"));
  }
  if ([(TURoute *)self isCarAudio]) {
    objc_msgSend(v3, "appendFormat:", @" isCarAudio=%d", -[TURoute isCarAudio](self, "isCarAudio"));
  }
  if ([(TURoute *)self isGuest]) {
    objc_msgSend(v3, "appendFormat:", @" isGuest=%d", -[TURoute isGuest](self, "isGuest"));
  }
  if ([(TURoute *)self isBluetooth]) {
    objc_msgSend(v3, "appendFormat:", @" isBluetooth=%d", -[TURoute isBluetooth](self, "isBluetooth"));
  }
  if ([(TURoute *)self isBluetoothLE]) {
    objc_msgSend(v3, "appendFormat:", @" isBluetoothLE=%d", -[TURoute isBluetoothLE](self, "isBluetoothLE"));
  }
  if ([(TURoute *)self isBluetoothManaged]) {
    objc_msgSend(v3, "appendFormat:", @" isBluetoothManaged=%d", -[TURoute isBluetoothManaged](self, "isBluetoothManaged"));
  }
  if ([(TURoute *)self bluetoothEndpointType]) {
    objc_msgSend(v3, "appendFormat:", @" bluetoothEndpointType=%ld", -[TURoute bluetoothEndpointType](self, "bluetoothEndpointType"));
  }
  if ([(TURoute *)self isInEarDetectionEnabled]) {
    objc_msgSend(v3, "appendFormat:", @" isInEarDetectionEnabled=%d", -[TURoute isInEarDetectionEnabled](self, "isInEarDetectionEnabled"));
  }
  if ([(TURoute *)self isInEarDetectionSupported]) {
    objc_msgSend(v3, "appendFormat:", @" isInEarDetectionSupported=%d", -[TURoute isInEarDetectionSupported](self, "isInEarDetectionSupported"));
  }
  if ([(TURoute *)self isPreferred]) {
    objc_msgSend(v3, "appendFormat:", @" isPreferred=%d", -[TURoute isPreferred](self, "isPreferred"));
  }
  if ([(TURoute *)self isPreferredAndActive]) {
    objc_msgSend(v3, "appendFormat:", @" isPreferredAndActive=%d", -[TURoute isPreferredAndActive](self, "isPreferredAndActive"));
  }
  id v6 = [(TURoute *)self identifiersOfOtherConnectedDevices];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    int v8 = [(TURoute *)self identifiersOfOtherConnectedDevices];
    BOOL v9 = [v8 componentsJoinedByString:@", "];
    [v3 appendFormat:@" identifiersOfOtherConnectedDevices=%@", v9];
  }
  if ([(TURoute *)self isInTipiWithCompanion]) {
    objc_msgSend(v3, "appendFormat:", @" isInTipiWithCompanion=%d", -[TURoute isInTipiWithCompanion](self, "isInTipiWithCompanion"));
  }
  if ([(TURoute *)self isSmartRoutedTo]) {
    objc_msgSend(v3, "appendFormat:", @" isSmartRoutedTo=%d", -[TURoute isSmartRoutedTo](self, "isSmartRoutedTo"));
  }
  if ([(TURoute *)self supportsRelay]) {
    objc_msgSend(v3, "appendFormat:", @" supportsRelay=%d", -[TURoute supportsRelay](self, "supportsRelay"));
  }
  if ([(TURoute *)self isPartnerRouteRoutable]) {
    objc_msgSend(v3, "appendFormat:", @" isPartnerRouteRoutable=%d", -[TURoute isPartnerRouteRoutable](self, "isPartnerRouteRoutable"));
  }
  if ([(TURoute *)self isSiblingRoutePresent]) {
    objc_msgSend(v3, "appendFormat:", @" isSiblingRoutePresent=%d", -[TURoute isSiblingRoutePresent](self, "isSiblingRoutePresent"));
  }
  if ([(TURoute *)self supportsSharePlay]) {
    objc_msgSend(v3, "appendFormat:", @" supportsSharePlay=%d", -[TURoute supportsSharePlay](self, "supportsSharePlay"));
  }
  if ([(TURoute *)self isTipiParticipant]) {
    objc_msgSend(v3, "appendFormat:", @" isTipiParticipant=%d", -[TURoute isTipiParticipant](self, "isTipiParticipant"));
  }
  if ([(TURoute *)self isTriangleParticipant]) {
    objc_msgSend(v3, "appendFormat:", @" isTriangleParticipant=%d", -[TURoute isTriangleParticipant](self, "isTriangleParticipant"));
  }
  if ([(TURoute *)self isCarKitRoute]) {
    objc_msgSend(v3, "appendFormat:", @" isCarKitRoute=%d", -[TURoute isCarKitRoute](self, "isCarKitRoute"));
  }
  if ([(TURoute *)self isRecommended]) {
    objc_msgSend(v3, "appendFormat:", @" isRecommended=%d", -[TURoute isRecommended](self, "isRecommended"));
  }
  int64_t v10 = [(TURoute *)self customDescription];
  [v3 appendString:v10];

  [v3 appendString:@">"];

  return v3;
}

- (unint64_t)hash
{
  if ([(TURoute *)self isA2DPRoute]) {
    uint64_t v3 = 1231;
  }
  else {
    uint64_t v3 = 1237;
  }
  if ([(TURoute *)self isAirTunes]) {
    uint64_t v4 = 1231;
  }
  else {
    uint64_t v4 = 1237;
  }
  uint64_t v5 = v4 ^ v3;
  if ([(TURoute *)self isCarAudio]) {
    uint64_t v6 = 1231;
  }
  else {
    uint64_t v6 = 1237;
  }
  if ([(TURoute *)self isCurrentlyPicked]) {
    uint64_t v7 = 1231;
  }
  else {
    uint64_t v7 = 1237;
  }
  uint64_t v8 = v5 ^ v6 ^ v7;
  if ([(TURoute *)self isBluetooth]) {
    uint64_t v9 = 1231;
  }
  else {
    uint64_t v9 = 1237;
  }
  int64_t v10 = v9 ^ [(TURoute *)self bluetoothEndpointType];
  if ([(TURoute *)self isBluetoothLE]) {
    uint64_t v11 = 1231;
  }
  else {
    uint64_t v11 = 1237;
  }
  int64_t v12 = v8 ^ v10 ^ v11;
  if ([(TURoute *)self isBluetoothManaged]) {
    uint64_t v13 = 1231;
  }
  else {
    uint64_t v13 = 1237;
  }
  if ([(TURoute *)self isDefaultRoute]) {
    uint64_t v14 = 1231;
  }
  else {
    uint64_t v14 = 1237;
  }
  int64_t v15 = v13 ^ v14 ^ [(TURoute *)self deviceType];
  if ([(TURoute *)self isGuest]) {
    uint64_t v16 = 1231;
  }
  else {
    uint64_t v16 = 1237;
  }
  int64_t v17 = v12 ^ v15 ^ v16;
  uint64_t v18 = [(TURoute *)self identifiersOfOtherConnectedDevices];
  uint64_t v19 = [v18 hash];
  if ([(TURoute *)self isInTipiWithCompanion]) {
    uint64_t v20 = 1231;
  }
  else {
    uint64_t v20 = 1237;
  }
  uint64_t v21 = v19 ^ v20;
  if ([(TURoute *)self isSmartRoutedTo]) {
    uint64_t v22 = 1231;
  }
  else {
    uint64_t v22 = 1237;
  }
  uint64_t v23 = v21 ^ v22;
  if ([(TURoute *)self isInEarDetectionEnabled]) {
    uint64_t v24 = 1231;
  }
  else {
    uint64_t v24 = 1237;
  }
  uint64_t v25 = v23 ^ v24;
  if ([(TURoute *)self isInEarDetectionSupported]) {
    uint64_t v26 = 1231;
  }
  else {
    uint64_t v26 = 1237;
  }
  uint64_t v27 = v17 ^ v25 ^ v26;
  int v28 = [(TURoute *)self name];
  uint64_t v29 = [v28 hash];
  if ([(TURoute *)self isPreferred]) {
    uint64_t v30 = 1231;
  }
  else {
    uint64_t v30 = 1237;
  }
  uint64_t v31 = v29 ^ v30;
  if ([(TURoute *)self isPreferredAndActive]) {
    uint64_t v32 = 1231;
  }
  else {
    uint64_t v32 = 1237;
  }
  uint64_t v33 = v31 ^ v32;
  if ([(TURoute *)self isReceiver]) {
    uint64_t v34 = 1231;
  }
  else {
    uint64_t v34 = 1237;
  }
  uint64_t v35 = v33 ^ v34;
  if ([(TURoute *)self isSpeaker]) {
    uint64_t v36 = 1231;
  }
  else {
    uint64_t v36 = 1237;
  }
  uint64_t v37 = v35 ^ v36;
  if ([(TURoute *)self supportsRelay]) {
    uint64_t v38 = 1231;
  }
  else {
    uint64_t v38 = 1237;
  }
  uint64_t v39 = v27 ^ v37 ^ v38;
  v40 = [(TURoute *)self uniqueIdentifier];
  uint64_t v41 = [v40 hash];
  if ([(TURoute *)self isWiredHeadphones]) {
    uint64_t v42 = 1231;
  }
  else {
    uint64_t v42 = 1237;
  }
  uint64_t v43 = v41 ^ v42;
  if ([(TURoute *)self isWiredHeadset]) {
    uint64_t v44 = 1231;
  }
  else {
    uint64_t v44 = 1237;
  }
  uint64_t v45 = v43 ^ v44;
  if ([(TURoute *)self isWirelessHeadset]) {
    uint64_t v46 = 1231;
  }
  else {
    uint64_t v46 = 1237;
  }
  uint64_t v47 = v45 ^ v46;
  if ([(TURoute *)self isPartnerRouteRoutable]) {
    uint64_t v48 = 1231;
  }
  else {
    uint64_t v48 = 1237;
  }
  uint64_t v49 = v47 ^ v48;
  if ([(TURoute *)self isSiblingRoutePresent]) {
    uint64_t v50 = 1231;
  }
  else {
    uint64_t v50 = 1237;
  }
  uint64_t v51 = v49 ^ v50;
  if ([(TURoute *)self supportsSharePlay]) {
    uint64_t v52 = 1231;
  }
  else {
    uint64_t v52 = 1237;
  }
  uint64_t v53 = v39 ^ v51 ^ v52;
  if ([(TURoute *)self isRecommended]) {
    uint64_t v54 = 1231;
  }
  else {
    uint64_t v54 = 1237;
  }
  unint64_t v55 = v53 ^ v54;

  return v55;
}

- (BOOL)isCarKitRoute
{
  return [(TURoute *)self bluetoothEndpointType] == 2;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (BOOL)isA2DPRoute
{
  return self->_A2DPRoute;
}

- (void)setA2DPRoute:(BOOL)a3
{
  self->_A2DPRoute = a3;
}

- (BOOL)isCurrentlyPicked
{
  return self->_currentlyPicked;
}

- (void)setCurrentlyPicked:(BOOL)a3
{
  self->_currentlyPicked = a3;
}

- (BOOL)isDefaultRoute
{
  return self->_defaultRoute;
}

- (void)setDefaultRoute:(BOOL)a3
{
  self->_defaultRoute = a3;
}

- (BOOL)isReceiver
{
  return self->_receiver;
}

- (void)setReceiver:(BOOL)a3
{
  self->_receiver = a3;
}

- (BOOL)isSpeaker
{
  return self->_speaker;
}

- (void)setSpeaker:(BOOL)a3
{
  self->_speaker = a3;
}

- (BOOL)isWiredHeadphones
{
  return self->_wiredHeadphones;
}

- (void)setWiredHeadphones:(BOOL)a3
{
  self->_wiredHeadphones = a3;
}

- (BOOL)isWiredHeadset
{
  return self->_wiredHeadset;
}

- (void)setWiredHeadset:(BOOL)a3
{
  self->_wiredHeadset = a3;
}

- (BOOL)isWirelessHeadset
{
  return self->_wirelessHeadset;
}

- (void)setWirelessHeadset:(BOOL)a3
{
  self->_wirelessHeadset = a3;
}

- (BOOL)isAirTunes
{
  return self->_airTunes;
}

- (void)setAirTunes:(BOOL)a3
{
  self->_airTunes = a3;
}

- (BOOL)isCarAudio
{
  return self->_carAudio;
}

- (void)setCarAudio:(BOOL)a3
{
  self->_carAudio = a3;
}

- (void)setGuest:(BOOL)a3
{
  self->_guest = a3;
}

- (BOOL)isBluetooth
{
  return self->_bluetooth;
}

- (void)setBluetooth:(BOOL)a3
{
  self->_bluetooth = a3;
}

- (BOOL)isBluetoothLE
{
  return self->_bluetoothLE;
}

- (void)setBluetoothLE:(BOOL)a3
{
  self->_bluetoothLE = a3;
}

- (BOOL)isBluetoothManaged
{
  return self->_bluetoothManaged;
}

- (void)setBluetoothManaged:(BOOL)a3
{
  self->_bluetoothManaged = a3;
}

- (int64_t)bluetoothEndpointType
{
  return self->_bluetoothEndpointType;
}

- (void)setBluetoothEndpointType:(int64_t)a3
{
  self->_bluetoothEndpointType = a3;
}

- (BOOL)isInEarDetectionEnabled
{
  return self->_inEarDetectionEnabled;
}

- (void)setInEarDetectionEnabled:(BOOL)a3
{
  self->_inEarDetectionEnabled = a3;
}

- (BOOL)isInEarDetectionSupported
{
  return self->_inEarDetectionSupported;
}

- (void)setInEarDetectionSupported:(BOOL)a3
{
  self->_inEarDetectionSupported = a3;
}

- (BOOL)isPreferred
{
  return self->_preferred;
}

- (void)setPreferred:(BOOL)a3
{
  self->_preferred = a3;
}

- (BOOL)isPreferredAndActive
{
  return self->_preferredAndActive;
}

- (void)setPreferredAndActive:(BOOL)a3
{
  self->_preferredAndActive = a3;
}

- (BOOL)isPartnerRouteRoutable
{
  return self->_partnerRouteRoutable;
}

- (void)setPartnerRouteRoutable:(BOOL)a3
{
  self->_partnerRouteRoutable = a3;
}

- (BOOL)isSiblingRoutePresent
{
  return self->_siblingRoutePresent;
}

- (void)setSiblingRoutePresent:(BOOL)a3
{
  self->_siblingRoutePresent = a3;
}

- (BOOL)supportsHighQualityVoiceWithMedia
{
  return self->_supportsHighQualityVoiceWithMedia;
}

- (void)setSupportsHighQualityVoiceWithMedia:(BOOL)a3
{
  self->_supportsHighQualityVoiceWithMedia = a3;
}

- (BOOL)supportsSharePlay
{
  return self->_supportsSharePlay;
}

- (void)setSupportsSharePlay:(BOOL)a3
{
  self->_supportsSharePlay = a3;
}

- (NSArray)identifiersOfOtherConnectedDevices
{
  return self->_identifiersOfOtherConnectedDevices;
}

- (void)setIdentifiersOfOtherConnectedDevices:(id)a3
{
}

- (void)setSupportsRelay:(BOOL)a3
{
  self->_supportsRelay = a3;
}

- (void)setRecommended:(BOOL)a3
{
  self->_recommended = a3;
}

- (void)setInTipiWithCompanion:(BOOL)a3
{
  self->_inTipiWithCompanion = a3;
}

- (void)setSmartRoutedTo:(BOOL)a3
{
  self->_smartRoutedTo = a3;
}

+ (id)predicateForInEarAudioRoute
{
  return &__block_literal_global_45;
}

uint64_t __49__TURoute_Predicate__predicateForInEarAudioRoute__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInEarDetected];
}

+ (id)predicateForInEarRouteInTipiWithCompanionWatch
{
  return &__block_literal_global_2;
}

uint64_t __68__TURoute_Predicate__predicateForInEarRouteInTipiWithCompanionWatch__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unsigned int v3 = [v2 isInTipiWithCompanion];
  int v4 = [v2 isInEarDetected];

  return v4 & v3;
}

+ (id)predicateForInEarRouteInTipiWithAndSmartRoutedToCompanionWatch
{
  return &__block_literal_global_4_1;
}

uint64_t __84__TURoute_Predicate__predicateForInEarRouteInTipiWithAndSmartRoutedToCompanionWatch__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isInTipiWithCompanion]) {
    int v3 = [v2 isSmartRoutedTo] ^ 1;
  }
  else {
    int v3 = 0;
  }
  uint64_t v4 = [v2 isInEarDetected] & v3;

  return v4;
}

+ (id)predicateForPreferredRoute
{
  return &__block_literal_global_6_1;
}

uint64_t __48__TURoute_Predicate__predicateForPreferredRoute__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isInEarDetectionSupported]) {
    uint64_t v3 = [v2 isInEarDetected];
  }
  else {
    uint64_t v3 = [v2 isPreferred];
  }
  uint64_t v4 = v3;

  return v4;
}

@end