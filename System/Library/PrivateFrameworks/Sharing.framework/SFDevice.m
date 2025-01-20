@interface SFDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)autoUnlockEnabled;
- (BOOL)autoUnlockWatch;
- (BOOL)duetSync;
- (BOOL)enhancedDiscovery;
- (BOOL)hasProblem;
- (BOOL)idsIdentifierConflict;
- (BOOL)inDiscoverySession;
- (BOOL)isBLEDeviceReplaced;
- (BOOL)needsAWDL;
- (BOOL)needsKeyboard;
- (BOOL)needsKeyboardOnly;
- (BOOL)needsSetup;
- (BOOL)paired;
- (BOOL)testMode;
- (BOOL)wakeDevice;
- (BOOL)watchLocked;
- (BOOL)wifiP2P;
- (NSArray)batteryInfo;
- (NSString)accountAltDSID;
- (NSString)accountID;
- (NSString)contactIdentifier;
- (NSString)idsIdentifier;
- (NSString)mediaRemoteID;
- (NSString)mediaRouteID;
- (NSString)model;
- (NSString)name;
- (NSString)rapportIdentifier;
- (NSString)requestSSID;
- (NSUUID)identifier;
- (SFBLEDevice)bleDevice;
- (SFDevice)init;
- (SFDevice)initWithCoder:(id)a3;
- (id)description;
- (int)audioRoutingScore;
- (int64_t)deviceType;
- (int64_t)distance;
- (unint64_t)problemFlags;
- (unsigned)deviceActionType;
- (unsigned)deviceClassCode;
- (unsigned)deviceFlags;
- (unsigned)deviceModelCode;
- (unsigned)hotspotInfo;
- (unsigned)osVersion;
- (unsigned)systemPairState;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountAltDSID:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setAudioRoutingScore:(int)a3;
- (void)setAutoUnlockEnabled:(BOOL)a3;
- (void)setAutoUnlockWatch:(BOOL)a3;
- (void)setBatteryInfo:(id)a3;
- (void)setBleDevice:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setDeviceActionType:(unsigned __int8)a3;
- (void)setDeviceClassCode:(unsigned __int8)a3;
- (void)setDeviceFlags:(unsigned int)a3;
- (void)setDeviceModelCode:(unsigned __int8)a3;
- (void)setDistance:(int64_t)a3;
- (void)setHasProblem:(BOOL)a3;
- (void)setHotspotInfo:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setIsBLEDeviceReplaced:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setNeedsSetup:(BOOL)a3;
- (void)setOsVersion:(unsigned __int8)a3;
- (void)setPaired:(BOOL)a3;
- (void)setRequestSSID:(id)a3;
- (void)setSystemPairState:(unsigned int)a3;
- (void)setTestMode:(BOOL)a3;
- (void)setWakeDevice:(BOOL)a3;
- (void)setWatchLocked:(BOOL)a3;
- (void)updateWithBLEDevice:(id)a3;
- (void)updateWithPairedPeer:(id)a3;
- (void)updateWithRPIdentity:(id)a3;
@end

@implementation SFDevice

- (SFBLEDevice)bleDevice
{
  return self->_bleDevice;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSString)model
{
  return self->_model;
}

- (unsigned)deviceClassCode
{
  return self->_deviceClassCode;
}

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
}

- (void)setHotspotInfo:(unsigned int)a3
{
  self->_hotspotInfo = a3;
}

- (void)setAudioRoutingScore:(int)a3
{
  self->_audioRoutingScore = a3;
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (BOOL)paired
{
  return self->_paired;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)mediaRouteID
{
  return self->_mediaRouteID;
}

- (NSString)mediaRemoteID
{
  return self->_mediaRemoteID;
}

- (BOOL)inDiscoverySession
{
  return self->_inDiscoverySession;
}

- (unsigned)hotspotInfo
{
  return self->_hotspotInfo;
}

- (BOOL)duetSync
{
  return self->_duetSync;
}

- (int64_t)distance
{
  return self->_distance;
}

- (unsigned)deviceModelCode
{
  return self->_deviceModelCode;
}

- (unsigned)deviceFlags
{
  return self->_deviceFlags;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  accountAltDSID = self->_accountAltDSID;
  id v24 = v4;
  if (accountAltDSID)
  {
    [v4 encodeObject:accountAltDSID forKey:@"altDSID"];
    id v4 = v24;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    [v24 encodeObject:accountID forKey:@"aid"];
    id v4 = v24;
  }
  uint64_t audioRoutingScore = self->_audioRoutingScore;
  if (audioRoutingScore)
  {
    [v24 encodeInteger:audioRoutingScore forKey:@"auRS"];
    id v4 = v24;
  }
  if (self->_autoUnlockEnabled)
  {
    [v24 encodeBool:1 forKey:@"auE"];
    id v4 = v24;
  }
  if (self->_autoUnlockWatch)
  {
    [v24 encodeBool:1 forKey:@"auW"];
    id v4 = v24;
  }
  bleDevice = self->_bleDevice;
  if (bleDevice)
  {
    [v24 encodeObject:bleDevice forKey:@"bleD"];
    id v4 = v24;
  }
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier)
  {
    [v24 encodeObject:contactIdentifier forKey:@"cnID"];
    id v4 = v24;
  }
  if (self->_deviceActionType)
  {
    objc_msgSend(v24, "encodeInteger:forKey:");
    id v4 = v24;
  }
  if (self->_deviceClassCode)
  {
    objc_msgSend(v24, "encodeInteger:forKey:");
    id v4 = v24;
  }
  uint64_t deviceFlags = self->_deviceFlags;
  if (deviceFlags)
  {
    [v24 encodeInt64:deviceFlags forKey:@"dFlg"];
    id v4 = v24;
  }
  if (self->_deviceModelCode)
  {
    objc_msgSend(v24, "encodeInteger:forKey:");
    id v4 = v24;
  }
  int64_t deviceType = self->_deviceType;
  if (deviceType)
  {
    [v24 encodeInteger:deviceType forKey:@"devT"];
    id v4 = v24;
  }
  int64_t distance = self->_distance;
  if (distance)
  {
    [v24 encodeInteger:distance forKey:@"dist"];
    id v4 = v24;
  }
  if (self->_duetSync)
  {
    [v24 encodeBool:1 forKey:@"ds"];
    id v4 = v24;
  }
  if (self->_enhancedDiscovery)
  {
    [v24 encodeBool:1 forKey:@"enDi"];
    id v4 = v24;
  }
  if (self->_hasProblem)
  {
    [v24 encodeBool:1 forKey:@"hp"];
    id v4 = v24;
  }
  uint64_t hotspotInfo = self->_hotspotInfo;
  if (hotspotInfo)
  {
    [v24 encodeInt64:hotspotInfo forKey:@"hsi"];
    id v4 = v24;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    [v24 encodeObject:identifier forKey:@"ident"];
    id v4 = v24;
  }
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier)
  {
    [v24 encodeObject:idsIdentifier forKey:@"idsID"];
    id v4 = v24;
  }
  if (self->_idsIdentifierConflict)
  {
    [v24 encodeBool:1 forKey:@"idsc"];
    id v4 = v24;
  }
  if (self->_inDiscoverySession)
  {
    [v24 encodeBool:1 forKey:@"iLagS"];
    id v4 = v24;
  }
  if (self->_isBLEDeviceReplaced)
  {
    [v24 encodeBool:1 forKey:@"replace"];
    id v4 = v24;
  }
  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID)
  {
    [v24 encodeObject:mediaRemoteID forKey:@"MRI"];
    id v4 = v24;
  }
  mediaRouteID = self->_mediaRouteID;
  if (mediaRouteID)
  {
    [v24 encodeObject:mediaRouteID forKey:@"MRtI"];
    id v4 = v24;
  }
  model = self->_model;
  if (model)
  {
    [v24 encodeObject:model forKey:@"model"];
    id v4 = v24;
  }
  name = self->_name;
  if (name)
  {
    [v24 encodeObject:name forKey:@"name"];
    id v4 = v24;
  }
  if (self->_needsAWDL)
  {
    [v24 encodeBool:1 forKey:@"awdl"];
    id v4 = v24;
  }
  if (self->_needsKeyboard)
  {
    [v24 encodeBool:1 forKey:@"kb"];
    id v4 = v24;
  }
  if (self->_needsSetup)
  {
    [v24 encodeBool:1 forKey:@"setup"];
    id v4 = v24;
  }
  if (self->_osVersion)
  {
    objc_msgSend(v24, "encodeInteger:forKey:");
    id v4 = v24;
  }
  if (self->_paired)
  {
    [v24 encodeBool:1 forKey:@"paired"];
    id v4 = v24;
  }
  unint64_t problemFlags = self->_problemFlags;
  if (problemFlags)
  {
    [v24 encodeInt64:problemFlags forKey:@"pf"];
    id v4 = v24;
  }
  rapportIdentifier = self->_rapportIdentifier;
  if (rapportIdentifier)
  {
    [v24 encodeObject:rapportIdentifier forKey:@"rid"];
    id v4 = v24;
  }
  requestSSID = self->_requestSSID;
  if (requestSSID)
  {
    [v24 encodeObject:requestSSID forKey:@"rSSID"];
    id v4 = v24;
  }
  uint64_t systemPairState = self->_systemPairState;
  if (systemPairState)
  {
    [v24 encodeInt64:systemPairState forKey:@"sps"];
    id v4 = v24;
  }
  if (self->_testMode)
  {
    [v24 encodeBool:1 forKey:@"tm"];
    id v4 = v24;
  }
  if (self->_watchLocked)
  {
    [v24 encodeBool:1 forKey:@"wl"];
    id v4 = v24;
  }
  if (self->_wifiP2P)
  {
    [v24 encodeBool:1 forKey:@"wp2p"];
    id v4 = v24;
  }
}

- (SFDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SFDevice;
  v5 = [(SFDevice *)&v39 init];

  if (v5)
  {
    v5->_int64_t deviceType = 1;
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v40 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t audioRoutingScore = v40;
    }
    if ([v7 containsValueForKey:@"auE"]) {
      v5->_autoUnlockEnabled = [v7 decodeBoolForKey:@"auE"];
    }
    if ([v7 containsValueForKey:@"auW"]) {
      v5->_autoUnlockWatch = [v7 decodeBoolForKey:@"auW"];
    }
    if ([v7 containsValueForKey:@"bleD"])
    {
      uint64_t v8 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"bleD"];
      bleDevice = v5->_bleDevice;
      v5->_bleDevice = (SFBLEDevice *)v8;

      v10 = [(SFBLEDevice *)v5->_bleDevice advertisementFields];
      v11 = [v10 objectForKeyedSubscript:@"batteryInfo"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v5->_batteryInfo, v11);
      }
    }
    if ([v7 containsValueForKey:@"cnID"])
    {
      uint64_t v12 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"cnID"];
      contactIdentifier = v5->_contactIdentifier;
      v5->_contactIdentifier = (NSString *)v12;
    }
    if ([v7 containsValueForKey:@"devAT"]) {
      v5->_deviceActionType = [v7 decodeIntegerForKey:@"devAT"];
    }
    if ([v7 containsValueForKey:@"devCC"]) {
      v5->_deviceClassCode = [v7 decodeIntegerForKey:@"devCC"];
    }
    uint64_t v40 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t deviceFlags = v40;
    }
    uint64_t v40 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_deviceModelCode = v40;
    }
    if ([v7 containsValueForKey:@"devT"]) {
      v5->_int64_t deviceType = [v7 decodeIntegerForKey:@"devT"];
    }
    if ([v7 containsValueForKey:@"dist"]) {
      v5->_int64_t distance = [v7 decodeIntegerForKey:@"dist"];
    }
    id v14 = v7;
    if ([v14 containsValueForKey:@"ds"]) {
      v5->_duetSync = [v14 decodeBoolForKey:@"ds"];
    }

    id v15 = v14;
    if ([v15 containsValueForKey:@"enDi"]) {
      v5->_enhancedDiscovery = [v15 decodeBoolForKey:@"enDi"];
    }

    id v16 = v15;
    if ([v16 containsValueForKey:@"hp"]) {
      v5->_hasProblem = [v16 decodeBoolForKey:@"hp"];
    }

    uint64_t v40 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t hotspotInfo = v40;
    }
    if ([v16 containsValueForKey:@"ident"])
    {
      uint64_t v17 = [v16 decodeObjectOfClass:objc_opt_class() forKey:@"ident"];
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v17;
    }
    if ([v16 containsValueForKey:@"idsID"])
    {
      uint64_t v19 = [v16 decodeObjectOfClass:objc_opt_class() forKey:@"idsID"];
      idsIdentifier = v5->_idsIdentifier;
      v5->_idsIdentifier = (NSString *)v19;
    }
    id v21 = v16;
    if ([v21 containsValueForKey:@"idsc"]) {
      v5->_idsIdentifierConflict = [v21 decodeBoolForKey:@"idsc"];
    }

    id v22 = v21;
    if ([v22 containsValueForKey:@"iLagS"]) {
      v5->_inDiscoverySession = [v22 decodeBoolForKey:@"iLagS"];
    }

    id v23 = v22;
    if ([v23 containsValueForKey:@"replace"]) {
      v5->_isBLEDeviceReplaced = [v23 decodeBoolForKey:@"replace"];
    }

    id v24 = v23;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v25 = v24;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if ([v25 containsValueForKey:@"model"])
    {
      uint64_t v26 = [v25 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
      model = v5->_model;
      v5->_model = (NSString *)v26;
    }
    if ([v25 containsValueForKey:@"name"])
    {
      uint64_t v28 = [v25 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
      name = v5->_name;
      v5->_name = (NSString *)v28;
    }
    id v30 = v25;
    if ([v30 containsValueForKey:@"awdl"]) {
      v5->_needsAWDL = [v30 decodeBoolForKey:@"awdl"];
    }

    if ([v30 containsValueForKey:@"kb"]) {
      v5->_needsKeyboard = [v30 decodeBoolForKey:@"kb"];
    }
    if ([v30 containsValueForKey:@"setup"]) {
      v5->_needsSetup = [v30 decodeBoolForKey:@"setup"];
    }
    uint64_t v40 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_osVersion = v40;
    }
    if ([v30 containsValueForKey:@"paired"]) {
      v5->_paired = [v30 decodeBoolForKey:@"paired"];
    }
    id v31 = v30;
    if ([v31 containsValueForKey:@"pf"]) {
      v5->_unint64_t problemFlags = [v31 decodeInt64ForKey:@"pf"];
    }

    if ([v31 containsValueForKey:@"rid"])
    {
      uint64_t v32 = [v31 decodeObjectOfClass:objc_opt_class() forKey:@"rid"];
      rapportIdentifier = v5->_rapportIdentifier;
      v5->_rapportIdentifier = (NSString *)v32;
    }
    id v34 = v31;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v40 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t systemPairState = v40;
    }
    id v35 = v34;
    if ([v35 containsValueForKey:@"tm"]) {
      v5->_testMode = [v35 decodeBoolForKey:@"tm"];
    }

    if ([v35 containsValueForKey:@"wl"]) {
      v5->_watchLocked = [v35 decodeBoolForKey:@"wl"];
    }
    id v36 = v35;
    if ([v36 containsValueForKey:@"wp2p"]) {
      v5->_wifiP2P = [v36 decodeBoolForKey:@"wp2p"];
    }

    v37 = v5;
  }

  return v5;
}

- (void)updateWithBLEDevice:(id)a3
{
  id v25 = a3;
  v5 = [v25 advertisementFields];
  uint64_t v6 = [v25 identifier];
  if (v6)
  {
    id v7 = (void *)v6;
    self->_autoUnlockEnabled = CFDictionaryGetInt64() != 0;
    self->_autoUnlockWatch = CFDictionaryGetInt64() != 0;
    uint64_t v8 = [v5 objectForKeyedSubscript:@"batteryInfo"];
    batteryInfo = self->_batteryInfo;
    self->_batteryInfo = v8;

    uint64_t v10 = [(SFBLEDevice *)self->_bleDevice decryptedActivityLevel];
    objc_storeStrong((id *)&self->_bleDevice, a3);
    [(SFBLEDevice *)self->_bleDevice setDecryptedActivityLevel:v10];
    if ([(SFBLEDevice *)self->_bleDevice distance]) {
      self->_int64_t distance = [(SFBLEDevice *)self->_bleDevice distance];
    }
    self->_deviceActionType = CFDictionaryGetInt64Ranged();
    self->_deviceClassCode = CFDictionaryGetInt64Ranged();
    self->_deviceModelCode = CFDictionaryGetInt64Ranged();
    self->_duetSync = CFDictionaryGetInt64() != 0;
    self->_enhancedDiscovery = CFDictionaryGetInt64() != 0;
    self->_inDiscoverySession = CFDictionaryGetInt64() != 0;
    objc_storeStrong((id *)&self->_identifier, v7);
    CFStringGetTypeID();
    v11 = CFDictionaryGetTypedValue();
    uint64_t Int64 = CFDictionaryGetInt64();
    if ([v11 length])
    {
      objc_storeStrong((id *)&self->_idsIdentifier, v11);
      self->_idsIdentifierConflict = Int64 != 0;
      self->_deviceFlags |= 8u;
    }
    if (!self->_model)
    {
      CFStringGetTypeID();
      TypedValue = (void *)CFDictionaryGetTypedValue();
      if (!TypedValue) {
        TypedValue = self->_model;
      }
      objc_storeStrong((id *)&self->_model, TypedValue);
    }
    id v14 = [v25 name];
    if ([v14 length]) {
      objc_storeStrong((id *)&self->_name, v14);
    }
    self->_needsAWDL = CFDictionaryGetInt64() != 0;
    self->_needsKeyboard = CFDictionaryGetInt64() != 0;
    self->_needsSetup = CFDictionaryGetInt64() != 0;
    self->_osVersion = CFDictionaryGetInt64Ranged();
    self->_paired = CFDictionaryGetInt64() != 0;
    self->_watchLocked = CFDictionaryGetInt64() != 0;
    self->_wifiP2P = CFDictionaryGetInt64() != 0;
    unsigned int deviceFlags = self->_deviceFlags;
    if ((deviceFlags & 8) != 0 || (v16 = CFDictionaryGetInt64(), unsigned int deviceFlags = self->_deviceFlags, !v16)) {
      unsigned int v17 = deviceFlags & 0xFFFFFFEF;
    }
    else {
      unsigned int v17 = deviceFlags | 0x10;
    }
    self->_unsigned int deviceFlags = v17;
    self->_unsigned int deviceFlags = self->_deviceFlags & 0xFFFFFFDF | (32 * (CFDictionaryGetInt64() != 0));
    self->_unsigned int deviceFlags = self->_deviceFlags & 0xFFFFFF7F | ((CFDictionaryGetInt64() != 0) << 7);
    unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
    self->_unsigned int deviceFlags = self->_deviceFlags & 0xFFFFDDFF | (((Int64Ranged >> 4) & 1) << 9) & 0xFFFFDFFF | (((Int64Ranged >> 3) & 1) << 13);
    self->_unsigned int deviceFlags = self->_deviceFlags & 0xFFFFFEFF | ((CFDictionaryGetInt64Ranged() & 1) << 8);
    self->_unsigned int deviceFlags = self->_deviceFlags & 0xFFFFF7FF | (((CFDictionaryGetInt64Ranged() >> 11) & 1) << 11);
    int v19 = [v25 tempPaired];
    unint64_t v20 = 0;
    if (v19) {
      int v21 = 4096;
    }
    else {
      int v21 = 0;
    }
    self->_unsigned int deviceFlags = self->_deviceFlags & 0xFFFFEFFF | v21;
    BOOL v22 = self->_deviceActionType == 10;
    self->_hasProblem = v22;
    if (v22) {
      unint64_t v20 = CFDictionaryGetInt64();
    }
    self->_unint64_t problemFlags = v20;
  }
  else
  {
    id v23 = (SFBLEDevice *)FatalErrorF();
    [(SFBLEDevice *)v23 identifier];
  }
}

- (id)description
{
  int v3 = SFShouldLogSensitiveDescriptions();
  v85[1] = 0;
  identifier = self->_identifier;
  NSAppendPrintF();
  id v4 = 0;
  v5 = v4;
  idsIdentifier = self->_idsIdentifier;
  if (v3)
  {
    if (!idsIdentifier) {
      goto LABEL_10;
    }
    v85[0] = v4;
    if (self->_idsIdentifierConflict) {
      id v7 = @" (conflict)";
    }
    else {
      id v7 = &stru_1EF9BDC68;
    }
    identifier = (NSUUID *)idsIdentifier;
    v79 = v7;
    uint64_t v8 = (id *)v85;
  }
  else
  {
    if (!idsIdentifier) {
      goto LABEL_10;
    }
    id v84 = v4;
    identifier = (NSUUID *)idsIdentifier;
    uint64_t v8 = &v84;
  }
  NSAppendPrintF();
  id v9 = *v8;

  v5 = v9;
LABEL_10:
  if (self->_isBLEDeviceReplaced)
  {
    NSAppendPrintF();
    id v10 = v5;

    v5 = v10;
  }
  int deviceActionType = self->_deviceActionType;
  if (self->_deviceActionType)
  {
    if (self->_deviceActionType > 0x63u)
    {
      switch(deviceActionType)
      {
        case 'd':
          v13 = "B238SetupAfterWiFi";
          break;
        case 'e':
          v13 = "B389SetupFromFindMy";
          break;
        case 'f':
          v13 = "B389SetupDone";
          break;
        default:
LABEL_57:
          v13 = "?";
          break;
      }
    }
    else
    {
      int v12 = deviceActionType - 1;
      v13 = "ATVSetup";
      switch(v12)
      {
        case 0:
          break;
        case 3:
          v13 = "MobileBackup";
          break;
        case 4:
          v13 = "WatchSetup";
          break;
        case 5:
          v13 = "ATVPair";
          break;
        case 6:
          v13 = "InternetRelay";
          break;
        case 7:
          v13 = "WiFiPassword";
          break;
        case 8:
          v13 = "iOSSetup";
          break;
        case 9:
          v13 = "Repair";
          break;
        case 10:
          v13 = "LegacyHomePodSetup";
          break;
        case 11:
          v13 = "ApplePay";
          break;
        case 12:
          v13 = "WHASetup";
          break;
        case 13:
          v13 = "DevToolsPair";
          break;
        case 16:
          v13 = "DDPing";
          break;
        case 17:
          v13 = "DDPong";
          break;
        case 18:
          v13 = "RemoteAutoFill";
          break;
        case 19:
          v13 = "CompanionLinkProx";
          break;
        case 20:
          v13 = "RemoteManagement";
          break;
        case 21:
          v13 = "RemoteAutoFillPong";
          break;
        case 23:
          v13 = "AccessorySetup";
          break;
        case 24:
          v13 = "TVLS";
          break;
        case 26:
          v13 = "ShareAudio";
          break;
        case 27:
          v13 = "AppSignIn";
          break;
        case 28:
          v13 = "Fitness";
          break;
        case 29:
          v13 = "TVCCS";
          break;
        case 30:
          v13 = "TVSA";
          break;
        case 31:
          v13 = "AuthenticateAccounts";
          break;
        case 32:
          v13 = "HomePodSetup";
          break;
        case 33:
          v13 = "CompanionAuthentication";
          break;
        case 35:
          v13 = "dovePeace";
          break;
        case 42:
          v13 = "AuthenticateAccountsV2";
          break;
        case 49:
          v13 = "NeedsRDLink";
          break;
        case 50:
          v13 = "NeedsCLink";
          break;
        case 51:
          v13 = "Goodbye";
          break;
        case 52:
          v13 = "PointToShare";
          break;
        case 54:
          v13 = "AUAction";
          break;
        case 55:
          v13 = "AcceptedInvitations";
          break;
        case 83:
          v13 = "HasInvitations";
          break;
        default:
          goto LABEL_57;
      }
    }
    identifier = (NSUUID *)v13;
    NSAppendPrintF();
    id v14 = v5;

    v5 = v14;
  }
  if ([(SFBLEDevice *)self->_bleDevice rssi])
  {
    int64_t v15 = [(SFBLEDevice *)self->_bleDevice rssi];
    uint64_t v16 = (void *)[(SFBLEDevice *)self->_bleDevice rssiEstimate];
    if ([(SFBLEDevice *)self->_bleDevice insideBubble]) {
      uint64_t v17 = 42;
    }
    else {
      uint64_t v17 = 126;
    }
    int64_t distance = self->_distance;
    if (distance <= 29)
    {
      switch(distance)
      {
        case 0:
          int v19 = "U";
          goto LABEL_80;
        case 10:
          int v19 = "I";
          goto LABEL_80;
        case 20:
          int v19 = "N";
          goto LABEL_80;
      }
    }
    else if (distance > 49)
    {
      if (distance == 50)
      {
        int v19 = "H";
        goto LABEL_80;
      }
      if (distance == 60)
      {
        int v19 = "F";
        goto LABEL_80;
      }
    }
    else
    {
      if (distance == 30)
      {
        int v19 = "P";
        goto LABEL_80;
      }
      if (distance == 40)
      {
        int v19 = "R";
LABEL_80:
        uint64_t v82 = v17;
        v83 = v19;
        unint64_t name = v15;
        v80 = v16;
        NSAppendPrintF();
        id v20 = v5;

        v5 = v20;
        goto LABEL_81;
      }
    }
    int v19 = "?";
    goto LABEL_80;
  }
LABEL_81:
  if (self->_name)
  {
    unint64_t name = (unint64_t)self->_name;
    NSAppendPrintF();
    id v21 = v5;

    v5 = v21;
  }
  if (self->_model)
  {
    unint64_t name = (unint64_t)self->_model;
    NSAppendPrintF();
    id v22 = v5;

    v5 = v22;
  }
  id v23 = self->_accountAltDSID;
  SEL v24 = v23;
  if (v23)
  {
    unint64_t name = (unint64_t)v23;
    NSAppendPrintF();
    id v25 = v5;

    v5 = v25;
  }

  uint64_t v26 = self->_accountID;
  v27 = v26;
  if (v26)
  {
    unint64_t name = (unint64_t)v26;
    NSAppendPrintF();
    id v28 = v5;

    v5 = v28;
  }

  unsigned int deviceClassCode = self->_deviceClassCode;
  if (self->_deviceClassCode)
  {
    if (deviceClassCode > 8) {
      id v30 = "?";
    }
    else {
      id v30 = off_1E5BBFFF8[(char)(deviceClassCode - 1)];
    }
    unint64_t name = (unint64_t)v30;
    NSAppendPrintF();
    id v31 = v5;

    v5 = v31;
  }
  if (self->_deviceModelCode)
  {
    uint64_t v32 = "D22ish";
    switch(self->_deviceModelCode)
    {
      case 1u:
        break;
      case 2u:
        uint64_t v32 = "SEish";
        break;
      case 3u:
        uint64_t v32 = "J3XXish";
        break;
      case 4u:
        uint64_t v32 = "N112ish";
        break;
      case 5u:
        uint64_t v32 = "B520ish";
        break;
      case 6u:
        uint64_t v32 = "B620ish";
        break;
      case 7u:
        uint64_t v32 = "J255ish";
        break;
      default:
        uint64_t v32 = "?";
        break;
    }
    unint64_t name = (unint64_t)v32;
    NSAppendPrintF();
    id v33 = v5;

    v5 = v33;
  }
  if (self->_contactIdentifier)
  {
    unint64_t name = (unint64_t)self->_contactIdentifier;
    NSAppendPrintF();
    id v34 = v5;

    v5 = v34;
  }
  if (self->_autoUnlockEnabled)
  {
    NSAppendPrintF();
    id v35 = v5;

    v5 = v35;
  }
  if (self->_autoUnlockWatch)
  {
    NSAppendPrintF();
    id v36 = v5;

    v5 = v36;
  }
  if (self->_duetSync)
  {
    NSAppendPrintF();
    id v37 = v5;

    v5 = v37;
  }
  if (self->_enhancedDiscovery)
  {
    NSAppendPrintF();
    id v38 = v5;

    v5 = v38;
  }
  if (self->_hotspotInfo)
  {
    unint64_t name = self->_hotspotInfo;
    NSAppendPrintF();
    id v39 = v5;

    v5 = v39;
  }
  if (self->_inDiscoverySession)
  {
    unint64_t name = self->_inDiscoverySession;
    NSAppendPrintF();
    id v40 = v5;

    v5 = v40;
  }
  v41 = self->_mediaRemoteID;
  v42 = v41;
  if (v41)
  {
    unint64_t name = (unint64_t)v41;
    NSAppendPrintF();
    id v43 = v5;

    v5 = v43;
  }

  v44 = self->_mediaRouteID;
  v45 = v44;
  if (v44)
  {
    unint64_t name = (unint64_t)v44;
    NSAppendPrintF();
    id v46 = v5;

    v5 = v46;
  }

  if (self->_needsAWDL)
  {
    NSAppendPrintF();
    id v47 = v5;

    v5 = v47;
  }
  if (self->_needsKeyboard)
  {
    NSAppendPrintF();
    id v48 = v5;

    v5 = v48;
  }
  if (self->_needsSetup)
  {
    NSAppendPrintF();
    id v49 = v5;

    v5 = v49;
  }
  if (self->_paired)
  {
    NSAppendPrintF();
    id v50 = v5;

    v5 = v50;
  }
  unsigned int systemPairState = self->_systemPairState;
  if (systemPairState)
  {
    switch(systemPairState)
    {
      case 0xAu:
        v52 = "NotPaired";
        break;
      case 0x1Eu:
        v52 = "Verified";
        break;
      case 0x14u:
        v52 = "Conjectured";
        break;
      default:
        v52 = "?";
        break;
    }
    unint64_t name = (unint64_t)v52;
    NSAppendPrintF();
    id v53 = v5;

    v5 = v53;
  }
  if (self->_rapportIdentifier)
  {
    unint64_t name = (unint64_t)self->_rapportIdentifier;
    NSAppendPrintF();
    id v54 = v5;

    v5 = v54;
  }
  if (self->_requestSSID)
  {
    unint64_t name = (unint64_t)self->_requestSSID;
    NSAppendPrintF();
    id v55 = v5;

    v5 = v55;
  }
  if (self->_watchLocked)
  {
    NSAppendPrintF();
    id v56 = v5;

    v5 = v56;
  }
  if (self->_wifiP2P)
  {
    NSAppendPrintF();
    id v57 = v5;

    v5 = v57;
  }
  if (self->_problemFlags)
  {
    unint64_t name = self->_problemFlags;
    v80 = &unk_1A56EA8D8;
    NSAppendPrintF();
    id v58 = v5;

    v5 = v58;
  }
  if (self->_deviceFlags)
  {
    unint64_t name = self->_deviceFlags;
    v80 = &unk_1A56EA9F0;
    NSAppendPrintF();
    id v59 = v5;

    v5 = v59;
  }
  if (self->_osVersion)
  {
    unint64_t name = self->_osVersion;
    NSAppendPrintF();
    id v60 = v5;

    v5 = v60;
  }
  unsigned int audioRoutingScore = self->_audioRoutingScore;
  if (audioRoutingScore)
  {
    if (audioRoutingScore > 0xF) {
      v62 = "?";
    }
    else {
      v62 = off_1E5BC0038[audioRoutingScore - 1];
    }
    unint64_t name = (unint64_t)v62;
    NSAppendPrintF();
    id v63 = v5;

    v5 = v63;
  }
  int64_t deviceType = self->_deviceType;
  if (deviceType)
  {
    v65 = "?";
    if (deviceType == 1) {
      v65 = "Generic";
    }
    if (deviceType == 2) {
      v66 = "VirtualMachine";
    }
    else {
      v66 = v65;
    }
    unint64_t name = (unint64_t)v66;
    NSAppendPrintF();
    id v67 = v5;

    v5 = v67;
  }
  unsigned int v68 = [(SFBLEDevice *)self->_bleDevice decryptedActivityLevel];
  if (v68)
  {
    if (v68 > 0xE) {
      v69 = "?";
    }
    else {
      v69 = off_1E5BC00B0[(char)(v68 - 1)];
    }
    v78 = v69;
    uint64_t v81 = v68;
    NSAppendPrintF();
    id v70 = v5;

    v5 = v70;
  }
  v71 = [(SFBLEDevice *)self->_bleDevice advertisementFields];
  int Int64Ranged = CFDictionaryGetInt64Ranged();

  if (Int64Ranged)
  {
    NSAppendPrintF();
    id v73 = v5;

    v5 = v73;
  }
  id v74 = v5;

  return v74;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isBLEDeviceReplaced
{
  return self->_isBLEDeviceReplaced;
}

- (void)setIsBLEDeviceReplaced:(BOOL)a3
{
  self->_isBLEDeviceReplaced = a3;
}

- (SFDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFDevice;
  v2 = [(SFDevice *)&v6 init];
  if (v2)
  {
    BOOL IsVirtualMachine = SFDeviceIsVirtualMachine();
    uint64_t v4 = 1;
    if (IsVirtualMachine) {
      uint64_t v4 = 2;
    }
    v2->_int64_t deviceType = v4;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountAltDSID, 0);
  objc_storeStrong((id *)&self->_requestSSID, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_mediaRouteID, 0);
  objc_storeStrong((id *)&self->_mediaRemoteID, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_bleDevice, 0);
  objc_storeStrong((id *)&self->_batteryInfo, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)needsKeyboardOnly
{
  return self->_needsKeyboard && self->_deviceActionType - 81 < 0xFFFFFFE1;
}

- (void)updateWithPairedPeer:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_name)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v4 name];
    if (v5) {
      objc_storeStrong((id *)&self->_name, v5);
    }
    id v4 = v7;
  }
  if (!self->_model)
  {
    objc_super v6 = [v4 model];

    if (v6)
    {
      objc_storeStrong((id *)&self->_model, v6);
      v5 = v6;
    }
    else
    {
      v5 = 0;
    }
  }
  if (self->_systemPairState <= 0x13) {
    self->_unsigned int systemPairState = 20;
  }
}

- (void)updateWithRPIdentity:(id)a3
{
  id v15 = a3;
  if (!self->_accountAltDSID && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = [v15 accountAltDSID];
    if (v4) {
      objc_storeStrong((id *)&self->_accountAltDSID, v4);
    }
  }
  if (!self->_accountID)
  {
    v5 = [v15 accountID];
    if (v5) {
      objc_storeStrong((id *)&self->_accountID, v5);
    }
  }
  if (!self->_contactIdentifier)
  {
    objc_super v6 = [v15 contactID];
    if (v6) {
      objc_storeStrong((id *)&self->_contactIdentifier, v6);
    }
  }
  int v7 = [v15 type] - 2;
  int v8 = 2;
  switch(v7)
  {
    case 0:
      if (SFDeviceIsVirtualMachine())
      {
        int v8 = 8;
        goto LABEL_22;
      }
      break;
    case 2:
      goto LABEL_22;
    case 4:
      int v8 = 4;
      goto LABEL_22;
    case 6:
      int v8 = 1024;
      goto LABEL_22;
    case 7:
      int v8 = 64;
      goto LABEL_22;
    case 10:
      int v8 = 0x4000;
      goto LABEL_22;
    case 11:
      int v8 = 0x8000;
LABEL_22:
      self->_deviceFlags |= v8;
      break;
    default:
      break;
  }
  if (!self->_idsIdentifier)
  {
    id v9 = [v15 idsDeviceID];
    if (v9) {
      objc_storeStrong((id *)&self->_idsIdentifier, v9);
    }
  }
  if (!self->_mediaRemoteID && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v10 = [v15 mediaRemoteID];
    if (v10) {
      objc_storeStrong((id *)&self->_mediaRemoteID, v10);
    }
  }
  if (!self->_mediaRouteID && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = [v15 mediaRouteID];
    if (v11) {
      objc_storeStrong((id *)&self->_mediaRouteID, v11);
    }
  }
  if (!self->_model)
  {
    int v12 = [v15 model];
    if (v12) {
      objc_storeStrong((id *)&self->_model, v12);
    }
  }
  v13 = [v15 name];
  if (v13) {
    objc_storeStrong((id *)&self->_name, v13);
  }

  id v14 = [v15 identifier];
  if (v14) {
    objc_storeStrong((id *)&self->_rapportIdentifier, v14);
  }

  if (self->_systemPairState <= 0x13 && [v15 type] == 2) {
    self->_unsigned int systemPairState = 20;
  }
}

- (void)setAccountID:(id)a3
{
}

- (int)audioRoutingScore
{
  return self->_audioRoutingScore;
}

- (BOOL)autoUnlockEnabled
{
  return self->_autoUnlockEnabled;
}

- (void)setAutoUnlockEnabled:(BOOL)a3
{
  self->_autoUnlockEnabled = a3;
}

- (BOOL)autoUnlockWatch
{
  return self->_autoUnlockWatch;
}

- (void)setAutoUnlockWatch:(BOOL)a3
{
  self->_autoUnlockWatch = a3;
}

- (NSArray)batteryInfo
{
  return self->_batteryInfo;
}

- (void)setBatteryInfo:(id)a3
{
}

- (void)setBleDevice:(id)a3
{
}

- (void)setContactIdentifier:(id)a3
{
}

- (void)setDeviceActionType:(unsigned __int8)a3
{
  self->_int deviceActionType = a3;
}

- (void)setDeviceClassCode:(unsigned __int8)a3
{
  self->_unsigned int deviceClassCode = a3;
}

- (void)setDeviceFlags:(unsigned int)a3
{
  self->_unsigned int deviceFlags = a3;
}

- (void)setDeviceModelCode:(unsigned __int8)a3
{
  self->_deviceModelCode = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDistance:(int64_t)a3
{
  self->_int64_t distance = a3;
}

- (BOOL)enhancedDiscovery
{
  return self->_enhancedDiscovery;
}

- (BOOL)hasProblem
{
  return self->_hasProblem;
}

- (void)setHasProblem:(BOOL)a3
{
  self->_hasProblem = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setIdsIdentifier:(id)a3
{
}

- (BOOL)idsIdentifierConflict
{
  return self->_idsIdentifierConflict;
}

- (void)setModel:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (BOOL)needsAWDL
{
  return self->_needsAWDL;
}

- (BOOL)needsKeyboard
{
  return self->_needsKeyboard;
}

- (BOOL)needsSetup
{
  return self->_needsSetup;
}

- (void)setNeedsSetup:(BOOL)a3
{
  self->_needsSetup = a3;
}

- (unint64_t)problemFlags
{
  return self->_problemFlags;
}

- (NSString)requestSSID
{
  return self->_requestSSID;
}

- (void)setRequestSSID:(id)a3
{
}

- (unsigned)systemPairState
{
  return self->_systemPairState;
}

- (void)setSystemPairState:(unsigned int)a3
{
  self->_unsigned int systemPairState = a3;
}

- (BOOL)wakeDevice
{
  return self->_wakeDevice;
}

- (void)setWakeDevice:(BOOL)a3
{
  self->_wakeDevice = a3;
}

- (BOOL)watchLocked
{
  return self->_watchLocked;
}

- (void)setWatchLocked:(BOOL)a3
{
  self->_watchLocked = a3;
}

- (BOOL)wifiP2P
{
  return self->_wifiP2P;
}

- (unsigned)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(unsigned __int8)a3
{
  self->_osVersion = a3;
}

- (void)setAccountAltDSID:(id)a3
{
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
}

@end