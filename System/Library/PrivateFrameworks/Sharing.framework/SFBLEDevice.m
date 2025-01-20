@interface SFBLEDevice
+ (BOOL)supportsSecureCoding;
+ (void)setRSSIEstimatorInfo:(id)a3;
- (BOOL)insideBubble;
- (BOOL)insideMediumBubble;
- (BOOL)insideSmallBubble;
- (BOOL)paired;
- (BOOL)tempPaired;
- (BOOL)triggered;
- (BOOL)updateRSSI:(int64_t)a3;
- (BOOL)useBTPipe;
- (NSData)advertisementData;
- (NSData)bluetoothAddress;
- (NSDictionary)advertisementFields;
- (NSString)name;
- (NSUUID)counterpartIdentifier;
- (NSUUID)identifier;
- (RPIdentity)rpIdentity;
- (SFBLEDevice)initWithCoder:(id)a3;
- (SFProximityEstimator)closeProximityEstimatorMedium;
- (SFProximityEstimator)closeProximityEstimatorSmall;
- (SFProximityEstimator)infoProximityEstimator;
- (SFProximityEstimator)proxPairProximityEstimator;
- (SFProximityEstimator)setupProximityEstimator;
- (double)lastSeen;
- (double)pairCheckTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)rssiEstimate;
- (int64_t)distance;
- (int64_t)rssi;
- (int64_t)rssiCeiling;
- (int64_t)rssiFloor;
- (int64_t)smoothedRSSI;
- (unint64_t)foundTicks;
- (unint64_t)proxPairingTicks;
- (unsigned)connectedServices;
- (unsigned)decryptedActivityLevel;
- (unsigned)productID2;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvertisementData:(id)a3;
- (void)setAdvertisementFields:(id)a3;
- (void)setBluetoothAddress:(id)a3;
- (void)setCloseProximityEstimatorMedium:(id)a3;
- (void)setCloseProximityEstimatorSmall:(id)a3;
- (void)setConnectedServices:(unsigned int)a3;
- (void)setCounterpartIdentifier:(id)a3;
- (void)setDecryptedActivityLevel:(unsigned __int8)a3;
- (void)setDistance:(int64_t)a3;
- (void)setFoundTicks:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setInfoProximityEstimator:(id)a3;
- (void)setInsideBubble:(BOOL)a3;
- (void)setInsideMediumBubble:(BOOL)a3;
- (void)setInsideSmallBubble:(BOOL)a3;
- (void)setLastSeen:(double)a3;
- (void)setName:(id)a3;
- (void)setPairCheckTime:(double)a3;
- (void)setPaired:(BOOL)a3;
- (void)setProductID2:(unsigned int)a3;
- (void)setProxPairProximityEstimator:(id)a3;
- (void)setProxPairingTicks:(unint64_t)a3;
- (void)setRpIdentity:(id)a3;
- (void)setRssi:(int64_t)a3;
- (void)setRssiCeiling:(int64_t)a3;
- (void)setRssiEstimate:(int)a3;
- (void)setRssiFloor:(int64_t)a3;
- (void)setSetupProximityEstimator:(id)a3;
- (void)setSmoothedRSSI:(int64_t)a3;
- (void)setTempPaired:(BOOL)a3;
- (void)setTriggered:(BOOL)a3;
- (void)setUseBTPipe:(BOOL)a3;
@end

@implementation SFBLEDevice

- (SFProximityEstimator)infoProximityEstimator
{
  return self->_infoProximityEstimator;
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (void)setInfoProximityEstimator:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  advertisementData = self->_advertisementData;
  if (advertisementData) {
    [v20 encodeObject:advertisementData forKey:@"aData"];
  }
  advertisementFields = self->_advertisementFields;
  if (advertisementFields) {
    [v20 encodeObject:advertisementFields forKey:@"aFields"];
  }
  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress) {
    [v20 encodeObject:bluetoothAddress forKey:@"bdAddr"];
  }
  counterpartIdentifier = self->_counterpartIdentifier;
  if (counterpartIdentifier) {
    [v20 encodeObject:counterpartIdentifier forKey:@"cpid"];
  }
  if (self->_decryptedActivityLevel) {
    objc_msgSend(v20, "encodeInteger:forKey:");
  }
  int64_t distance = self->_distance;
  if (distance) {
    [v20 encodeInteger:distance forKey:@"dist"];
  }
  unint64_t foundTicks = self->_foundTicks;
  if (foundTicks) {
    [v20 encodeInt64:foundTicks forKey:@"fticks"];
  }
  unint64_t proxPairingTicks = self->_proxPairingTicks;
  if (proxPairingTicks) {
    [v20 encodeInt64:proxPairingTicks forKey:@"pticks"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v20 encodeObject:identifier forKey:@"ident"];
  }
  if (self->_useBTPipe) {
    [v20 encodeBool:1 forKey:@"btpipe"];
  }
  if (self->_insideBubble) {
    [v20 encodeBool:1 forKey:@"inBub"];
  }
  if (self->_insideSmallBubble) {
    [v20 encodeBool:1 forKey:@"inSBub"];
  }
  if (self->_insideMediumBubble) {
    [v20 encodeBool:1 forKey:@"inMBub"];
  }
  if (self->_lastSeen != 0.0) {
    objc_msgSend(v20, "encodeDouble:forKey:", @"last");
  }
  name = self->_name;
  if (name) {
    [v20 encodeObject:name forKey:@"name"];
  }
  if (self->_paired) {
    [v20 encodeBool:1 forKey:@"paired"];
  }
  int64_t rssi = self->_rssi;
  if (rssi) {
    [v20 encodeInteger:rssi forKey:@"rssi"];
  }
  int64_t rssiCeiling = self->_rssiCeiling;
  if (rssiCeiling) {
    [v20 encodeInteger:rssiCeiling forKey:@"cRSSI"];
  }
  uint64_t rssiEstimate = self->_rssiEstimate;
  if (rssiEstimate) {
    [v20 encodeInteger:rssiEstimate forKey:@"rssiE"];
  }
  int64_t rssiFloor = self->_rssiFloor;
  if (rssiFloor) {
    [v20 encodeInteger:rssiFloor forKey:@"fRSSI"];
  }
  if (self->_rssiHistory[0])
  {
    v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_rssiHistory length:8];
    [v20 encodeObject:v17 forKey:@"hRSSI"];
  }
  int64_t smoothedRSSI = self->_smoothedRSSI;
  if (smoothedRSSI) {
    [v20 encodeInteger:smoothedRSSI forKey:@"sRSSI"];
  }
  v19 = v20;
  if (self->_triggered)
  {
    [v20 encodeBool:1 forKey:@"trig"];
    v19 = v20;
  }
}

- (SFBLEDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)SFBLEDevice;
  v5 = [(SFBLEDevice *)&v48 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"aData"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aData"];
      advertisementData = v5->_advertisementData;
      v5->_advertisementData = (NSData *)v6;
    }
    if ([v4 containsValueForKey:@"aFields"])
    {
      v8 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      v15 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
      uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"aFields"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v18 = *MEMORY[0x1E4F1C3C8];
        v19 = _NSMethodExceptionProem();
        [v17 raise:v18, @"%@: bad type for key %@ : %@", v19, @"aFields", v16 format];
      }
      advertisementFields = v5->_advertisementFields;
      v5->_advertisementFields = (NSDictionary *)v16;
    }
    if ([v4 containsValueForKey:@"bdAddr"])
    {
      uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bdAddr"];
      bluetoothAddress = v5->_bluetoothAddress;
      v5->_bluetoothAddress = (NSData *)v21;

      if ([(NSData *)v5->_bluetoothAddress length] != 6)
      {
        v23 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v24 = *MEMORY[0x1E4F1C3C8];
        v25 = _NSMethodExceptionProem();
        [v23 raise:v24, @"%@: Bad BluetoothAddress length: %ld (not 6)", v25, -[NSData length](v5->_bluetoothAddress, "length") format];
      }
    }
    if ([v4 containsValueForKey:@"cpid"])
    {
      uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cpid"];
      counterpartIdentifier = v5->_counterpartIdentifier;
      v5->_counterpartIdentifier = (NSUUID *)v26;
    }
    if ([v4 containsValueForKey:@"decAL"]) {
      v5->_decryptedActivityLevel = [v4 decodeIntegerForKey:@"decAL"];
    }
    if ([v4 containsValueForKey:@"dist"]) {
      v5->_int64_t distance = [v4 decodeIntegerForKey:@"dist"];
    }
    id v28 = v4;
    if ([v28 containsValueForKey:@"fticks"]) {
      v5->_unint64_t foundTicks = [v28 decodeInt64ForKey:@"fticks"];
    }

    id v29 = v28;
    if ([v29 containsValueForKey:@"pticks"]) {
      v5->_unint64_t proxPairingTicks = [v29 decodeInt64ForKey:@"pticks"];
    }

    if ([v29 containsValueForKey:@"ident"])
    {
      uint64_t v30 = [v29 decodeObjectOfClass:objc_opt_class() forKey:@"ident"];
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v30;
    }
    id v32 = v29;
    if ([v32 containsValueForKey:@"btpipe"]) {
      v5->_useBTPipe = [v32 decodeBoolForKey:@"btpipe"];
    }

    id v33 = v32;
    if ([v33 containsValueForKey:@"inBub"]) {
      v5->_insideBubble = [v33 decodeBoolForKey:@"inBub"];
    }

    id v34 = v33;
    if ([v34 containsValueForKey:@"inSBub"]) {
      v5->_insideSmallBubble = [v34 decodeBoolForKey:@"inSBub"];
    }

    id v35 = v34;
    if ([v35 containsValueForKey:@"inMBub"]) {
      v5->_insideMediumBubble = [v35 decodeBoolForKey:@"inMBub"];
    }

    if ([v35 containsValueForKey:@"last"])
    {
      [v35 decodeDoubleForKey:@"last"];
      v5->_lastSeen = v36;
    }
    if ([v35 containsValueForKey:@"name"])
    {
      uint64_t v37 = [v35 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
      name = v5->_name;
      v5->_name = (NSString *)v37;
    }
    if ([v35 containsValueForKey:@"rssi"]) {
      v5->_int64_t rssi = [v35 decodeIntegerForKey:@"rssi"];
    }
    if ([v35 containsValueForKey:@"cRSSI"]) {
      v5->_int64_t rssiCeiling = [v35 decodeIntegerForKey:@"cRSSI"];
    }
    uint64_t v49 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t rssiEstimate = v49;
    }
    if ([v35 containsValueForKey:@"fRSSI"]) {
      v5->_int64_t rssiFloor = [v35 decodeIntegerForKey:@"fRSSI"];
    }
    if ([v35 containsValueForKey:@"hRSSI"])
    {
      id v39 = [v35 decodeObjectOfClass:objc_opt_class() forKey:@"hRSSI"];
      v40 = (char *)[v39 bytes];
      unint64_t v41 = [v39 length];
      uint64_t v42 = 8;
      if (v41 < 8) {
        uint64_t v42 = v41;
      }
      if (v42)
      {
        rssiHistory = v5->_rssiHistory;
        do
        {
          char v44 = *v40++;
          *rssiHistory++ = v44;
          --v42;
        }
        while (v42);
      }
    }
    if ([v35 containsValueForKey:@"sRSSI"]) {
      v5->_int64_t smoothedRSSI = [v35 decodeIntegerForKey:@"sRSSI"];
    }
    id v45 = v35;
    if ([v45 containsValueForKey:@"trig"]) {
      v5->_triggered = [v45 decodeBoolForKey:@"trig"];
    }

    v46 = v5;
  }

  return v5;
}

- (NSDictionary)advertisementFields
{
  return self->_advertisementFields;
}

- (id)description
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  SFShouldLogSensitiveDescriptions();
  int v114 = 0;
  uint64_t v113 = 0;
  NSAppendPrintF();
  id v3 = 0;
  id v4 = v3;
  if (self->_identifier)
  {
    id v112 = v3;
    NSAppendPrintF();
    id v5 = v112;

    id v4 = v5;
  }
  bluetoothAddress = self->_bluetoothAddress;
  if (bluetoothAddress)
  {
    v111 = v4;
    [(NSData *)bluetoothAddress bytes];
    NSAppendPrintF();
    id v7 = v4;

    id v4 = v7;
  }
  unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();
  id v110 = v4;
  if (self->_triggered) {
    uint64_t v9 = 84;
  }
  else {
    uint64_t v9 = 116;
  }
  if (self->_insideBubble) {
    uint64_t v10 = 42;
  }
  else {
    uint64_t v10 = 126;
  }
  int64_t distance = self->_distance;
  if (distance > 29)
  {
    if (distance > 49)
    {
      if (distance == 50)
      {
        uint64_t v12 = "H";
        goto LABEL_28;
      }
      if (distance == 60)
      {
        uint64_t v12 = "F";
        goto LABEL_28;
      }
    }
    else
    {
      if (distance == 30)
      {
        uint64_t v12 = "P";
        goto LABEL_28;
      }
      if (distance == 40)
      {
        uint64_t v12 = "R";
        goto LABEL_28;
      }
    }
    goto LABEL_26;
  }
  if (!distance)
  {
    uint64_t v12 = "U";
    goto LABEL_28;
  }
  if (distance != 10)
  {
    if (distance == 20)
    {
      uint64_t v12 = "N";
      goto LABEL_28;
    }
LABEL_26:
    uint64_t v12 = "?";
    goto LABEL_28;
  }
  uint64_t v12 = "I";
LABEL_28:
  uint64_t v76 = v9;
  uint64_t v78 = v10;
  uint64_t rssiEstimate = self->_rssiEstimate;
  v80 = v12;
  uint64_t v81 = Int64Ranged;
  NSAppendPrintF();
  id v13 = v110;

  if (self->_insideSmallBubble)
  {
    id v109 = v13;
    NSAppendPrintF();
    id v14 = v13;

    id v13 = v14;
  }
  if (self->_insideMediumBubble)
  {
    id v108 = v13;
    NSAppendPrintF();
    id v15 = v13;

    id v13 = v15;
  }
  if (self->_advertisementData)
  {
    id v107 = v13;
    NSAppendPrintF();
    id v16 = v13;

    id v13 = v16;
  }
  CFDictionaryGetInt64Ranged();
  id v106 = v13;
  NSAppendPrintF();
  id v17 = v13;

  id v105 = v17;
  name = (__CFString *)self->_name;
  if (!name) {
    name = @"?";
  }
  v70 = name;
  NSAppendPrintF();
  id v19 = v105;

  unsigned __int8 v20 = CFDictionaryGetInt64Ranged();
  unsigned __int8 v21 = v20;
  if (v20)
  {
    id v104 = v19;
    if (v20 > 0x63u)
    {
      switch(v20)
      {
        case 'd':
          v22 = "B238SetupAfterWiFi";
          break;
        case 'e':
          v22 = "B389SetupFromFindMy";
          break;
        case 'f':
          v22 = "B389SetupDone";
          break;
        default:
LABEL_81:
          v22 = "?";
          break;
      }
    }
    else
    {
      v22 = "ATVSetup";
      switch(v20)
      {
        case 1u:
          break;
        case 4u:
          v22 = "MobileBackup";
          break;
        case 5u:
          v22 = "WatchSetup";
          break;
        case 6u:
          v22 = "ATVPair";
          break;
        case 7u:
          v22 = "InternetRelay";
          break;
        case 8u:
          v22 = "WiFiPassword";
          break;
        case 9u:
          v22 = "iOSSetup";
          break;
        case 0xAu:
          v22 = "Repair";
          break;
        case 0xBu:
          v22 = "LegacyHomePodSetup";
          break;
        case 0xCu:
          v22 = "ApplePay";
          break;
        case 0xDu:
          v22 = "WHASetup";
          break;
        case 0xEu:
          v22 = "DevToolsPair";
          break;
        case 0x11u:
          v22 = "DDPing";
          break;
        case 0x12u:
          v22 = "DDPong";
          break;
        case 0x13u:
          v22 = "RemoteAutoFill";
          break;
        case 0x14u:
          v22 = "CompanionLinkProx";
          break;
        case 0x15u:
          v22 = "RemoteManagement";
          break;
        case 0x16u:
          v22 = "RemoteAutoFillPong";
          break;
        case 0x18u:
          v22 = "AccessorySetup";
          break;
        case 0x19u:
          v22 = "TVLS";
          break;
        case 0x1Bu:
          v22 = "ShareAudio";
          break;
        case 0x1Cu:
          v22 = "AppSignIn";
          break;
        case 0x1Du:
          v22 = "Fitness";
          break;
        case 0x1Eu:
          v22 = "TVCCS";
          break;
        case 0x1Fu:
          v22 = "TVSA";
          break;
        case 0x20u:
          v22 = "AuthenticateAccounts";
          break;
        case 0x21u:
          v22 = "HomePodSetup";
          break;
        case 0x22u:
          v22 = "CompanionAuthentication";
          break;
        case 0x24u:
          v22 = "dovePeace";
          break;
        case 0x2Bu:
          v22 = "AuthenticateAccountsV2";
          break;
        case 0x32u:
          v22 = "NeedsRDLink";
          break;
        case 0x33u:
          v22 = "NeedsCLink";
          break;
        case 0x34u:
          v22 = "Goodbye";
          break;
        case 0x35u:
          v22 = "PointToShare";
          break;
        case 0x37u:
          v22 = "AUAction";
          break;
        case 0x38u:
          v22 = "AcceptedInvitations";
          break;
        case 0x54u:
          v22 = "HasInvitations";
          break;
        default:
          goto LABEL_81;
      }
    }
    v70 = (void *)v22;
    NSAppendPrintF();
    id v23 = v104;

    id v19 = v23;
  }
  uint64_t v24 = [(NSDictionary *)self->_advertisementFields objectForKeyedSubscript:@"model", v70, rssiEstimate, v76, v78, v80, v81];
  if (v24)
  {
    id v103 = v19;
    NSAppendPrintF();
    id v25 = v19;

    id v19 = v25;
  }
  id v102 = v19;
  CFDictionaryGetInt64();
  NSAppendPrintF();
  id v26 = v19;

  id v101 = v26;
  CFDictionaryGetInt64();
  NSAppendPrintF();
  id v27 = v26;

  if (CFDictionaryGetInt64())
  {
    id v100 = v27;
    NSAppendPrintF();
    id v28 = v27;

    id v27 = v28;
  }
  __int16 v29 = CFDictionaryGetInt64Ranged();
  __int16 v30 = v29;
  if (v29) {
    char v31 = 85;
  }
  else {
    char v31 = 117;
  }
  v115[133] = v31;
  if ((v29 & 8) != 0)
  {
    char v32 = 65;
  }
  else if ((v29 & 2) != 0)
  {
    char v32 = 67;
  }
  else if ((v29 & 0x800) != 0)
  {
    char v32 = 84;
  }
  else if ((v29 & 4) != 0)
  {
    char v32 = 69;
  }
  else
  {
    char v32 = 63;
  }
  v115[134] = v32;
  if ((v29 & 0x40) != 0)
  {
    char v33 = 65;
  }
  else if ((v29 & 0x10) != 0)
  {
    char v33 = 67;
  }
  else if ((v29 & 0x20) != 0)
  {
    char v33 = 69;
  }
  else
  {
    char v33 = 63;
  }
  v115[135] = v33;
  if ((v29 & 0x80) != 0) {
    char v34 = 76;
  }
  else {
    char v34 = 114;
  }
  v115[136] = v34;
  if ((v29 & 0x100) != 0) {
    char v35 = 80;
  }
  else {
    char v35 = 115;
  }
  v115[137] = v35;
  if ((v29 & 0x200) != 0) {
    char v36 = 66;
  }
  else {
    char v36 = 98;
  }
  v115[138] = v36;
  if (CFDictionaryGetInt64Ranged()) {
    char v37 = 67;
  }
  else {
    char v37 = 111;
  }
  v115[139] = v37;
  v115[140] = CFDictionaryGetInt64Ranged() + 48;
  v115[141] = CFDictionaryGetInt64Ranged() + 48;
  if ((v30 & 0x400) != 0) {
    char v38 = 83;
  }
  else {
    char v38 = 115;
  }
  v115[142] = v38;
  v115[143] = 0;
  id v99 = v27;
  NSAppendPrintF();
  id v39 = v27;

  id v98 = v39;
  CFDictionaryGetInt64Ranged();
  NSAppendPrintF();
  id v40 = v39;

  id v97 = v40;
  CFDictionaryGetInt64Ranged();
  NSAppendPrintF();
  id v41 = v40;

  uint64_t v42 = v41;
  id v96 = v41;
  CFDictionaryGetInt64Ranged();
  NSAppendPrintF();
  id v43 = v41;

  char v44 = v43;
  if ((unsigned __int16)CFDictionaryGetInt64Ranged())
  {
    id v95 = v43;
    NSAppendPrintF();
    id v45 = v43;

    char v44 = v45;
  }
  unsigned __int8 v46 = CFDictionaryGetInt64Ranged();
  id v94 = v44;
  if (v46 > 2u) {
    v47 = "?";
  }
  else {
    v47 = off_1E5BBF2C8[(char)v46];
  }
  uint64_t Int64 = (uint64_t)v47;
  NSAppendPrintF();
  id v48 = v94;

  if (CFDictionaryGetInt64())
  {
    id v93 = v48;
    NSAppendPrintF();
    id v49 = v48;

    id v48 = v49;
  }
  if (CFDictionaryGetInt64())
  {
    id v92 = v48;
    NSAppendPrintF();
    id v50 = v48;

    id v48 = v50;
  }
  if (CFDictionaryGetInt64())
  {
    id v91 = v48;
    NSAppendPrintF();
    id v51 = v48;

    id v48 = v51;
  }
  if (v21 == 10)
  {
    id v90 = v48;
    uint64_t Int64 = CFDictionaryGetInt64();
    v74 = &unk_1A56EA500;
    NSAppendPrintF();
    id v52 = v48;

    id v48 = v52;
  }
  v53 = [(NSDictionary *)self->_advertisementFields objectForKeyedSubscript:@"batteryInfo", Int64, v74];
  if ([v53 count])
  {
    v83 = v24;
    id v89 = v48;
    NSAppendPrintF();
    id v54 = v48;

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v82 = v53;
    id obj = v53;
    uint64_t v55 = [obj countByEnumeratingWithState:&v85 objects:v115 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = 1;
      uint64_t v58 = *(void *)v86;
      do
      {
        uint64_t v59 = 0;
        v60 = v54;
        do
        {
          if (*(void *)v86 != v58) {
            objc_enumerationMutation(obj);
          }
          v61 = *(void **)(*((void *)&v85 + 1) + 8 * v59);
          uint64_t v62 = objc_msgSend(v61, "batteryType", v72, v75, v77, *(void *)&v79);
          if (v57 + v59 <= 1) {
            v63 = "";
          }
          else {
            v63 = "; ";
          }
          if ((unint64_t)(v62 - 1) >= 3)
          {
            if (v62 == 4) {
              uint64_t v64 = 77;
            }
            else {
              uint64_t v64 = 63;
            }
          }
          else
          {
            uint64_t v64 = dword_1A56EA618[v62 - 1];
          }
          uint64_t v65 = [v61 batteryState];
          [v61 batteryLevel];
          double v79 = v66 * 100.0;
          uint64_t v67 = 45;
          if (v65 == 2) {
            uint64_t v67 = 43;
          }
          uint64_t v75 = v64;
          uint64_t v77 = v67;
          v72 = v63;
          NSAppendPrintF();
          id v54 = v60;

          ++v59;
          v60 = v54;
        }
        while (v56 != v59);
        uint64_t v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v115, 16, v63, v64, v77, *(void *)&v79);
        v57 += v59;
      }
      while (v56);
    }

    id v48 = v54;
    v53 = v82;
    uint64_t v24 = v83;
  }
  id v68 = v48;

  return v68;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setDecryptedActivityLevel:(unsigned __int8)a3
{
  self->_decryptedActivityLevel = a3;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (unsigned)decryptedActivityLevel
{
  return self->_decryptedActivityLevel;
}

- (BOOL)tempPaired
{
  return self->_tempPaired;
}

- (int)rssiEstimate
{
  return self->_rssiEstimate;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)insideBubble
{
  return self->_insideBubble;
}

- (int64_t)distance
{
  return self->_distance;
}

- (SFProximityEstimator)closeProximityEstimatorSmall
{
  return self->_closeProximityEstimatorSmall;
}

- (SFProximityEstimator)closeProximityEstimatorMedium
{
  return self->_closeProximityEstimatorMedium;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rpIdentity, 0);
  objc_storeStrong((id *)&self->_setupProximityEstimator, 0);
  objc_storeStrong((id *)&self->_proxPairProximityEstimator, 0);
  objc_storeStrong((id *)&self->_infoProximityEstimator, 0);
  objc_storeStrong((id *)&self->_closeProximityEstimatorMedium, 0);
  objc_storeStrong((id *)&self->_closeProximityEstimatorSmall, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_counterpartIdentifier, 0);
  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
  objc_storeStrong((id *)&self->_advertisementFields, 0);

  objc_storeStrong((id *)&self->_advertisementData, 0);
}

- (BOOL)updateRSSI:(int64_t)a3
{
  v48[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  self->_int64_t rssi = a3;
  int64_t v4 = 127;
  if (a3 < 127) {
    int64_t v4 = a3;
  }
  if (v4 <= -128) {
    LOBYTE(v4) = 0x80;
  }
  unint64_t rssiIndex = self->_rssiIndex;
  size_t v6 = gSFBLERSSISampleCount;
  if (gSFBLERSSISampleCount <= rssiIndex) {
    LODWORD(rssiIndex) = 0;
  }
  rssiHistory = self->_rssiHistory;
  self->_unint64_t rssiIndex = rssiIndex + 1;
  self->_rssiHistory[rssiIndex] = v4;
  size_t rssiCount = self->_rssiCount;
  if (v6 > rssiCount)
  {
    LOBYTE(rssiCount) = rssiCount + 1;
    self->_size_t rssiCount = rssiCount;
    size_t rssiCount = rssiCount;
  }
  if (v6 > rssiCount) {
    return 0;
  }
  switch(gSFBLERSSIAlgorithm)
  {
    case 1:
      if (!v6) {
        goto LABEL_87;
      }
      LOBYTE(v4) = *rssiHistory;
      size_t v10 = v6 - 1;
      if (v6 != 1)
      {
        uint64_t v11 = &self->_rssiHistory[1];
        do
        {
          int v13 = *v11++;
          char v12 = v13;
          if (v13 < (char)v4) {
            LOBYTE(v4) = v12;
          }
          --v10;
        }
        while (v10);
      }
      goto LABEL_92;
    case 2:
      if (!v6) {
        goto LABEL_87;
      }
      LOBYTE(v4) = *rssiHistory;
      size_t v14 = v6 - 1;
      if (v6 != 1)
      {
        id v15 = &self->_rssiHistory[1];
        do
        {
          int v17 = *v15++;
          char v16 = v17;
          if (v17 > (char)v4) {
            LOBYTE(v4) = v16;
          }
          --v14;
        }
        while (v14);
      }
      goto LABEL_92;
    case 3:
      if (!v6) {
        goto LABEL_87;
      }
      int v18 = 0;
      size_t v19 = v6;
      do
      {
        int v20 = *rssiHistory++;
        v18 += v20;
        --v19;
      }
      while (v19);
      goto LABEL_91;
    case 4:
      LODWORD(v4) = *rssiHistory;
      if ((int)v6 < 2)
      {
        int v23 = *rssiHistory;
      }
      else
      {
        uint64_t v21 = v6 - 1;
        v22 = &self->_rssiHistory[1];
        LOBYTE(v23) = *rssiHistory;
        do
        {
          int v25 = *v22++;
          int v24 = v25;
          if (v25 >= (char)v23) {
            int v23 = (char)v23;
          }
          else {
            int v23 = v24;
          }
          if (v24 <= (char)v4) {
            LODWORD(v4) = (char)v4;
          }
          else {
            LODWORD(v4) = v24;
          }
          --v21;
        }
        while (v21);
      }
      signed int v29 = (v6 + 1) >> 1;
      while (1)
      {
        int v30 = (int)((char)v4 + (char)v23 + ((((char)v4 + (char)v23) & 0x8000u) >> 15)) >> 1;
        if ((int)v6 < 1)
        {
          signed int v33 = 0;
          signed int v32 = 0;
          int v31 = 0;
          int v37 = v23;
          int v36 = v4;
        }
        else
        {
          int v31 = 0;
          signed int v32 = 0;
          signed int v33 = 0;
          char v34 = rssiHistory;
          uint64_t v35 = v6;
          int v36 = v4;
          int v37 = v23;
          do
          {
            int v39 = *v34++;
            int v38 = v39;
            int v40 = (char)v36;
            if (v39 < (char)v36) {
              int v40 = v38;
            }
            if (v30 >= v38) {
              int v41 = v32;
            }
            else {
              int v41 = v32 + 1;
            }
            if (v30 < v38) {
              int v42 = v31;
            }
            else {
              int v42 = v31 + 1;
            }
            if (v30 >= v38) {
              int v40 = v36;
            }
            int v43 = (char)v37;
            if (v38 > (char)v37) {
              int v43 = v38;
            }
            if (v30 <= v38) {
              signed int v32 = v41;
            }
            else {
              ++v33;
            }
            if (v30 > v38) {
              int v37 = v43;
            }
            else {
              int v31 = v42;
            }
            if (v30 <= v38) {
              int v36 = v40;
            }
            --v35;
          }
          while (v35);
        }
        if (v33 <= v29 && v32 <= v29) {
          break;
        }
        if (v33 > v32) {
          LODWORD(v4) = v37;
        }
        else {
          int v23 = v36;
        }
      }
      if (v31 + v33 >= v29) {
        LOBYTE(v4) = (int)((char)v4 + (char)v23 + ((((char)v4 + (char)v23) & 0x8000u) >> 15)) >> 1;
      }
      else {
        LOBYTE(v4) = v36;
      }
      if (v33 >= v29) {
        LOBYTE(v4) = v37;
      }
      goto LABEL_92;
    case 5:
      v48[0] = 0;
      uint64_t v26 = gSFBLERSSIRemoveHigh;
      unint64_t v27 = v6 - (gSFBLERSSIRemoveLow + gSFBLERSSIRemoveHigh);
      if (v6 <= gSFBLERSSIRemoveLow + gSFBLERSSIRemoveHigh)
      {
        if (!v6)
        {
LABEL_87:
          LOBYTE(v4) = 0;
          goto LABEL_92;
        }
        uint64_t v44 = 0;
        int v18 = 0;
        do
          v18 += rssiHistory[v44++];
        while (v6 != v44);
      }
      else if (v27 > 1)
      {
        __memcpy_chk();
        qsort(v48, v6, 1uLL, (int (__cdecl *)(const void *, const void *))_QSortCmpInt8);
        int v18 = 0;
        id v45 = (char *)v48 + v26;
        unint64_t v46 = v27;
        do
        {
          int v47 = *v45++;
          v18 += v47;
          --v46;
        }
        while (v46);
        LODWORD(v6) = v27;
      }
      else
      {
        uint64_t v28 = 0;
        int v18 = 0;
        do
          v18 += rssiHistory[v28++];
        while (v6 != v28);
      }
LABEL_91:
      LODWORD(v4) = v18 / (int)v6;
LABEL_92:
      BOOL result = self->_smoothedRSSI != (char)v4;
      self->_int64_t rssiCeiling = (char)v4;
      self->_int64_t rssiFloor = (char)v4;
      self->_int64_t smoothedRSSI = (char)v4;
      break;
    default:
      goto LABEL_92;
  }
  return result;
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (void)setLastSeen:(double)a3
{
  self->_lastSeen = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setFoundTicks:(unint64_t)a3
{
  self->_unint64_t foundTicks = a3;
}

- (void)setConnectedServices:(unsigned int)a3
{
  self->_connectedServices = a3;
}

- (void)setBluetoothAddress:(id)a3
{
}

- (void)setAdvertisementFields:(id)a3
{
}

- (void)setAdvertisementData:(id)a3
{
}

+ (void)setRSSIEstimatorInfo:(id)a3
{
  id v3 = a3;
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  unsigned int v5 = CFDictionaryGetInt64Ranged();
  unsigned int v6 = CFDictionaryGetInt64Ranged();
  unsigned int v7 = CFDictionaryGetInt64Ranged();

  if ((unint64_t)((Int64Ranged << 32) - 0x800000000) <= 0xFFFFFFF800000000)
  {
    if (gLogCategory_SFBLERSSI <= 90 && (gLogCategory_SFBLERSSI != -1 || _LogCategory_Initialize())) {
      goto LABEL_18;
    }
    return;
  }
  if (v6 > (unint64_t)v5 || v6 + (unint64_t)v5 >= v7)
  {
    if (gLogCategory_SFBLERSSI <= 90 && (gLogCategory_SFBLERSSI != -1 || _LogCategory_Initialize())) {
      goto LABEL_18;
    }
    return;
  }
  if (v7 >= 9uLL)
  {
    if (gLogCategory_SFBLERSSI <= 90 && (gLogCategory_SFBLERSSI != -1 || _LogCategory_Initialize())) {
      goto LABEL_18;
    }
    return;
  }
  BOOL v8 = Int64Ranged != gSFBLERSSIAlgorithm;
  if ((int)Int64Ranged != gSFBLERSSIAlgorithm) {
    gSFBLERSSIAlgorithm = (int)Int64Ranged;
  }
  if (v5 != gSFBLERSSIRemoveHigh)
  {
    gSFBLERSSIRemoveHigh = v5;
    BOOL v8 = 1;
  }
  if (v6 != gSFBLERSSIRemoveLow)
  {
    gSFBLERSSIRemoveLow = v6;
    if (v7 == gSFBLERSSISampleCount) {
      goto LABEL_15;
    }
LABEL_14:
    gSFBLERSSISampleCount = v7;
    goto LABEL_15;
  }
  if (v7 != gSFBLERSSISampleCount) {
    goto LABEL_14;
  }
  if (!v8) {
    return;
  }
LABEL_15:
  if (gLogCategory_SFBLERSSI <= 30 && (gLogCategory_SFBLERSSI != -1 || _LogCategory_Initialize())) {
LABEL_18:
  }
    LogPrintF();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    advertisementData = self->_advertisementData;
    if (advertisementData) {
      objc_storeStrong((id *)(v4 + 40), advertisementData);
    }
    advertisementFields = self->_advertisementFields;
    if (advertisementFields) {
      objc_storeStrong((id *)(v5 + 48), advertisementFields);
    }
    bluetoothAddress = self->_bluetoothAddress;
    if (bluetoothAddress) {
      objc_storeStrong((id *)(v5 + 56), bluetoothAddress);
    }
    counterpartIdentifier = self->_counterpartIdentifier;
    if (counterpartIdentifier) {
      objc_storeStrong((id *)(v5 + 64), counterpartIdentifier);
    }
    int64_t distance = self->_distance;
    if (distance) {
      *(void *)(v5 + 72) = distance;
    }
    unint64_t foundTicks = self->_foundTicks;
    if (foundTicks) {
      *(void *)(v5 + 80) = foundTicks;
    }
    unint64_t proxPairingTicks = self->_proxPairingTicks;
    if (proxPairingTicks) {
      *(void *)(v5 + 152) = proxPairingTicks;
    }
    identifier = self->_identifier;
    if (identifier) {
      objc_storeStrong((id *)(v5 + 88), identifier);
    }
    *(unsigned char *)(v5 + 20) = self->_insideBubble;
    *(unsigned char *)(v5 + 21) = self->_insideSmallBubble;
    *(unsigned char *)(v5 + 22) = self->_insideMediumBubble;
    double lastSeen = self->_lastSeen;
    if (lastSeen != 0.0) {
      *(double *)(v5 + 168) = lastSeen;
    }
    name = self->_name;
    if (name) {
      objc_storeStrong((id *)(v5 + 96), name);
    }
    if (self->_paired) {
      *(unsigned char *)(v5 + 23) = 1;
    }
    *(void *)(v5 + 104) = self->_rssi;
    *(_DWORD *)(v5 + 28) = self->_rssiEstimate;
    int64_t rssiCeiling = self->_rssiCeiling;
    if (rssiCeiling) {
      *(void *)(v5 + 112) = rssiCeiling;
    }
    int64_t rssiFloor = self->_rssiFloor;
    if (rssiFloor) {
      *(void *)(v5 + 120) = rssiFloor;
    }
    *(void *)(v5 + 8) = *(void *)self->_rssiHistory;
    int64_t smoothedRSSI = self->_smoothedRSSI;
    if (smoothedRSSI) {
      *(void *)(v5 + 128) = smoothedRSSI;
    }
    *(unsigned char *)(v5 + 25) = self->_triggered;
    id v19 = (id)v5;
  }

  return (id)v5;
}

- (NSData)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (NSUUID)counterpartIdentifier
{
  return self->_counterpartIdentifier;
}

- (void)setCounterpartIdentifier:(id)a3
{
}

- (void)setDistance:(int64_t)a3
{
  self->_int64_t distance = a3;
}

- (unint64_t)foundTicks
{
  return self->_foundTicks;
}

- (BOOL)useBTPipe
{
  return self->_useBTPipe;
}

- (void)setUseBTPipe:(BOOL)a3
{
  self->_useBTPipe = a3;
}

- (void)setInsideBubble:(BOOL)a3
{
  self->_insideBubble = a3;
}

- (void)setName:(id)a3
{
}

- (void)setRssi:(int64_t)a3
{
  self->_int64_t rssi = a3;
}

- (void)setRssiEstimate:(int)a3
{
  self->_uint64_t rssiEstimate = a3;
}

- (int64_t)rssiCeiling
{
  return self->_rssiCeiling;
}

- (void)setRssiCeiling:(int64_t)a3
{
  self->_int64_t rssiCeiling = a3;
}

- (int64_t)rssiFloor
{
  return self->_rssiFloor;
}

- (void)setRssiFloor:(int64_t)a3
{
  self->_int64_t rssiFloor = a3;
}

- (int64_t)smoothedRSSI
{
  return self->_smoothedRSSI;
}

- (void)setSmoothedRSSI:(int64_t)a3
{
  self->_int64_t smoothedRSSI = a3;
}

- (void)setCloseProximityEstimatorSmall:(id)a3
{
}

- (void)setCloseProximityEstimatorMedium:(id)a3
{
}

- (unsigned)connectedServices
{
  return self->_connectedServices;
}

- (unint64_t)proxPairingTicks
{
  return self->_proxPairingTicks;
}

- (void)setProxPairingTicks:(unint64_t)a3
{
  self->_unint64_t proxPairingTicks = a3;
}

- (BOOL)insideSmallBubble
{
  return self->_insideSmallBubble;
}

- (void)setInsideSmallBubble:(BOOL)a3
{
  self->_insideSmallBubble = a3;
}

- (BOOL)insideMediumBubble
{
  return self->_insideMediumBubble;
}

- (void)setInsideMediumBubble:(BOOL)a3
{
  self->_insideMediumBubble = a3;
}

- (double)lastSeen
{
  return self->_lastSeen;
}

- (double)pairCheckTime
{
  return self->_pairCheckTime;
}

- (void)setPairCheckTime:(double)a3
{
  self->_pairCheckTime = a3;
}

- (BOOL)paired
{
  return self->_paired;
}

- (unsigned)productID2
{
  return self->_productID2;
}

- (void)setProductID2:(unsigned int)a3
{
  self->_productID2 = a3;
}

- (SFProximityEstimator)proxPairProximityEstimator
{
  return self->_proxPairProximityEstimator;
}

- (void)setProxPairProximityEstimator:(id)a3
{
}

- (SFProximityEstimator)setupProximityEstimator
{
  return self->_setupProximityEstimator;
}

- (void)setSetupProximityEstimator:(id)a3
{
}

- (RPIdentity)rpIdentity
{
  return self->_rpIdentity;
}

- (void)setRpIdentity:(id)a3
{
}

- (void)setTempPaired:(BOOL)a3
{
  self->_tempPaired = a3;
}

- (BOOL)triggered
{
  return self->_triggered;
}

- (void)setTriggered:(BOOL)a3
{
  self->_triggered = a3;
}

@end