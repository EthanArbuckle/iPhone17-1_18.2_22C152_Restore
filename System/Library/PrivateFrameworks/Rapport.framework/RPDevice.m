@interface RPDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)idsDeviceIdentifierConflict;
- (BOOL)needsSetup;
- (CUMobileDevice)mobileDevice;
- (CUPairedPeer)pairedPeer;
- (CURangingMeasurement)relativeLocation;
- (NSData)authTag;
- (NSData)bleAdvertisementData;
- (NSData)bleAuthTag;
- (NSData)bleDeviceAddress;
- (NSData)txtData;
- (NSData)wifiAddress;
- (NSData)wifiBSSID;
- (NSData)wifiDeviceIEDeviceID;
- (NSData)wifiDeviceIEName;
- (NSData)wifiIEData;
- (NSDate)activityLevelTimeStamp;
- (NSDictionary)txtDictionary;
- (NSString)accountID;
- (NSString)contactID;
- (NSString)identifier;
- (NSString)idsDeviceIdentifier;
- (NSString)model;
- (NSString)name;
- (NSString)udid;
- (NSString)wifiSSID;
- (NSUUID)identifierUUID;
- (NSUUID)pairingIdentifier;
- (RPDevice)init;
- (RPDevice)initWithCoder:(id)a3;
- (SFDevice)bleDevice;
- (double)timeSinceLastActivityLevelChange;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)wifiPlatformObject;
- (int)activityLevel;
- (int)proximity;
- (int)rawRSSI;
- (int)smoothedRSSI;
- (unsigned)blePairState;
- (unsigned)deviceActionType;
- (unsigned)flags;
- (unsigned)systemPairState;
- (unsigned)updateWithBonjourDevice:(id)a3;
- (unsigned)updateWithMobileDevice:(id)a3;
- (unsigned)updateWithSFDevice:(id)a3 changes:(unsigned int)a4;
- (unsigned)wifiDeviceIEFlags;
- (void)_updateTXTDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBleDevice:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierUUID:(id)a3;
- (void)setMobileDevice:(id)a3;
- (void)setName:(id)a3;
- (void)setPairedPeer:(id)a3;
- (void)setPairingIdentifier:(id)a3;
- (void)setRelativeLocation:(id)a3;
- (void)setSystemPairState:(unsigned int)a3;
- (void)setUdid:(id)a3;
- (void)setWifiAddress:(id)a3;
- (void)setWifiBSSID:(id)a3;
- (void)setWifiDeviceIEDeviceID:(id)a3;
- (void)setWifiDeviceIEName:(id)a3;
- (void)setWifiIEData:(id)a3;
- (void)setWifiPlatformObject:(id)a3;
- (void)setWifiSSID:(id)a3;
- (void)updateWithSystemInfo:(id)a3;
- (void)updateWithWiFiDevice:(id)a3 changes:(unsigned int)a4;
@end

@implementation RPDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPDevice)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPDevice;
  v2 = [(RPDevice *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (RPDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RPDevice;
  v5 = [(RPDevice *)&v17 init];
  if (v5)
  {
    uint64_t v18 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_activityLevel = v18;
    }
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v18 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_flags = v18;
    }
    id v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v12 = v11;
    if ([v12 containsValueForKey:@"idsc"]) {
      v5->_idsDeviceIdentifierConflict = [v12 decodeBoolForKey:@"idsc"];
    }

    id v13 = v12;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v18 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_proximity = v18;
    }
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t activityLevel = self->_activityLevel;
  id v17 = v4;
  if (activityLevel)
  {
    [v4 encodeInteger:activityLevel forKey:@"al"];
    id v4 = v17;
  }
  activityLevelTimeStamp = self->_activityLevelTimeStamp;
  if (activityLevelTimeStamp)
  {
    [v17 encodeObject:activityLevelTimeStamp forKey:@"alts"];
    id v4 = v17;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    [v17 encodeObject:accountID forKey:@"aid"];
    id v4 = v17;
  }
  bleAuthTag = self->_bleAuthTag;
  if (bleAuthTag)
  {
    [v17 encodeObject:bleAuthTag forKey:@"atag"];
    id v4 = v17;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    [v17 encodeObject:contactID forKey:@"cnid"];
    id v4 = v17;
  }
  uint64_t flags = self->_flags;
  if (flags)
  {
    [v17 encodeInt64:flags forKey:@"fl"];
    id v4 = v17;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    [v17 encodeObject:identifier forKey:@"id"];
    id v4 = v17;
  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  if (idsDeviceIdentifier)
  {
    [v17 encodeObject:idsDeviceIdentifier forKey:@"ids"];
    id v4 = v17;
  }
  if (self->_idsDeviceIdentifierConflict)
  {
    [v17 encodeBool:1 forKey:@"idsc"];
    id v4 = v17;
  }
  model = self->_model;
  if (model)
  {
    [v17 encodeObject:model forKey:@"md"];
    id v4 = v17;
  }
  name = self->_name;
  if (name)
  {
    [v17 encodeObject:name forKey:@"nm"];
    id v4 = v17;
  }
  uint64_t proximity = self->_proximity;
  if (proximity)
  {
    [v17 encodeInteger:proximity forKey:@"px"];
    id v4 = v17;
  }
  relativeLocation = self->_relativeLocation;
  if (relativeLocation)
  {
    [v17 encodeObject:relativeLocation forKey:@"rl"];
    id v4 = v17;
  }
}

- (id)description
{
  return [(RPDevice *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  NSAppendPrintF();
  id v4 = 0;
  v5 = self->_identifier;
  id v6 = self->_idsDeviceIdentifier;
  BOOL idsDeviceIdentifierConflict = self->_idsDeviceIdentifierConflict;
  if ([(NSString *)v6 isEqual:v5])
  {

    BOOL v8 = shouldPrintSensitiveData();
    v5 = 0;
  }
  else
  {
    BOOL v8 = shouldPrintSensitiveData();
    if (v5)
    {
      formatSensitiveData((uint64_t)", ID ", v8);
      NSAppendPrintF();
      id v9 = v4;

      id v4 = v9;
    }
  }
  if (v6)
  {
    formatSensitiveData((uint64_t)", IDS ", v8);
    NSAppendPrintF();
    id v10 = v4;

    if (idsDeviceIdentifierConflict)
    {
      NSAppendPrintF();
      id v4 = v10;
    }
    else
    {
      id v4 = v10;
    }
  }
  name = self->_name;
  if (name)
  {
    id v12 = name;
    formatSensitiveData((uint64_t)", Nm ", v8);
    NSAppendPrintF();
    id v13 = v4;

    id v4 = v13;
  }
  model = self->_model;
  if (model)
  {
    v15 = model;
    formatSensitiveData((uint64_t)", Md ", v8);
    NSAppendPrintF();
    id v16 = v4;

    id v4 = v16;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    uint64_t v18 = accountID;
    formatSensitiveData((uint64_t)", AID ", v8);
    NSAppendPrintF();
    id v19 = v4;

    id v4 = v19;
  }
  udid = self->_udid;
  if (udid)
  {
    v21 = udid;
    formatSensitiveData((uint64_t)", UDID ", v8);
    NSAppendPrintF();
    id v22 = v4;

    id v4 = v22;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    v24 = contactID;
    formatSensitiveData((uint64_t)", CNID ", v8);
    NSAppendPrintF();
    id v25 = v4;

    id v4 = v25;
  }
  if (v8)
  {
    v26 = self->_wifiAddress;
    if ([(NSData *)v26 length] == 6)
    {
      [(NSData *)v26 bytes];
      NSAppendPrintF();
      id v27 = v4;

      id v4 = v27;
    }
    bleAuthTag = self->_bleAuthTag;
    if (bleAuthTag)
    {
      v45 = bleAuthTag;
      NSAppendPrintF();
      id v29 = v4;

      id v4 = v29;
    }
    bleDeviceAddress = self->_bleDeviceAddress;
    if (bleDeviceAddress)
    {
      v42 = bleDeviceAddress;
      NSAppendPrintF();
      id v31 = v4;

      id v4 = v31;
    }
    if (self->_proximity)
    {
      NSAppendPrintF();
      id v33 = v4;

      id v4 = v33;
    }
    relativeLocation = self->_relativeLocation;
    if (relativeLocation)
    {
      v43 = relativeLocation;
      NSAppendPrintF();
      id v35 = v4;

      id v4 = v35;
    }
    if (self->_activityLevel)
    {
      NSAppendPrintF();
      id v36 = v4;

      id v4 = v36;
    }
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    if (activityLevelTimeStamp)
    {
      v44 = activityLevelTimeStamp;
      NSAppendPrintF();
      id v38 = v4;

      id v4 = v38;
    }
  }
  if (self->_flags)
  {
    NSAppendPrintF();
    id v39 = v4;

    id v4 = v39;
  }
  id v40 = v4;

  return v40;
}

- (double)timeSinceLastActivityLevelChange
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:self->_activityLevelTimeStamp];
  double v5 = v4;

  return v5;
}

- (void)_updateTXTDictionary:(id)a3
{
  id v4 = a3;
  [v4 bytes];
  [v4 length];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  while (TXTRecordGetNextItem())
  {
    id v6 = (void *)[[NSString alloc] initWithBytes:0 length:0 encoding:4];
    if (v6)
    {
      id v7 = (void *)[[NSString alloc] initWithBytes:0 length:0 encoding:4];
      if (v7) {
        [v5 setObject:v7 forKeyedSubscript:v6];
      }
    }
  }
  BOOL v8 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v5];
  txtDictionary = self->_txtDictionary;
  self->_txtDictionary = v8;
}

- (unsigned)updateWithBonjourDevice:(id)a3
{
  id v4 = a3;
  unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();
  if (self->_deviceActionType == Int64Ranged)
  {
    unsigned int v6 = 0;
  }
  else
  {
    self->_deviceActionType = Int64Ranged;
    unsigned int v6 = 2;
  }
  CFStringGetTypeID();
  id v7 = CFDictionaryGetTypedValue();
  BOOL v8 = v7;
  if (v7)
  {
    name = self->_name;
    id v10 = v7;
    id v11 = name;
    if (v10 == v11)
    {

      goto LABEL_13;
    }
    id v12 = v11;
    if (v11)
    {
      char v13 = [(NSString *)v10 isEqual:v11];

      if (v13) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_name, v8);
    unsigned int v6 = 2;
  }
LABEL_13:
  CFDataGetTypeID();
  id v14 = CFDictionaryGetTypedValue();
  v15 = v14;
  if (v14)
  {
    id v16 = self->_name;
    id v17 = v14;
    uint64_t v18 = v16;
    if (v17 == v18)
    {
    }
    else
    {
      id v19 = v18;
      if (v18)
      {
        char v20 = [(NSString *)v17 isEqual:v18];

        if (v20) {
          goto LABEL_21;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)&self->_txtData, v15);
      [(RPDevice *)self _updateTXTDictionary:v17];
      unsigned int v6 = 2;
    }
  }
LABEL_21:

  return v6;
}

- (unsigned)updateWithMobileDevice:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_mobileDevice, a3);
  unsigned int v6 = [v5 internalModel];
  id v7 = v6;
  if (v6 && ([v6 isEqual:self->_model] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_model, v7);
    unsigned int v8 = 2;
  }
  else
  {
    unsigned int v8 = 0;
  }
  id v9 = [v5 name];

  if (v9 && ([v9 isEqual:self->_name] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_name, v9);
    unsigned int v8 = 2;
  }
  if ([v5 paired]) {
    unsigned int v10 = 20;
  }
  else {
    unsigned int v10 = 10;
  }
  if (v10 != self->_systemPairState)
  {
    self->_systemPairState = v10;
    unsigned int v8 = 2;
  }
  id v11 = [v5 udid];

  if (v11 && ([v11 isEqual:self->_udid] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_udid, v11);
    unsigned int v8 = 2;
  }
  int v18 = 0;
  id v12 = [v5 wifiAddress];

  if (v12)
  {
    CFGetHardwareAddress();
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v17 length:6];

    if (v14)
    {
      wifiAddress = self->_wifiAddress;
      p_wifiAddress = &self->_wifiAddress;
      if (([v14 isEqual:wifiAddress] & 1) == 0)
      {
        objc_storeStrong((id *)p_wifiAddress, v14);
        unsigned int v8 = 2;
      }
    }
  }
  return v8;
}

- (unsigned)updateWithSFDevice:(id)a3 changes:(unsigned int)a4
{
  char v4 = a4;
  id v7 = a3;
  unsigned int v8 = [v7 bleDevice];
  objc_storeStrong((id *)&self->_bleDevice, a3);
  if ((v4 & 9) == 0)
  {
    unsigned int v9 = 0;
    if ((v4 & 2) == 0) {
      goto LABEL_104;
    }
    goto LABEL_94;
  }
  v70 = [v8 advertisementFields];
  if (self->_accountID)
  {
    unsigned int v9 = 0;
  }
  else
  {
    unsigned int v10 = [v7 accountID];
    if (v10)
    {
      objc_storeStrong((id *)&self->_accountID, v10);
      unsigned int v9 = 2;
    }
    else
    {
      unsigned int v9 = 0;
    }
  }
  id v11 = [v7 bleDevice];
  int v12 = [v11 decryptedActivityLevel];
  if (v12 != 16 && self->_activityLevel != v12)
  {
    self->_uint64_t activityLevel = v12;
    char v13 = [MEMORY[0x1E4F1C9C8] date];
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    self->_activityLevelTimeStamp = v13;

    unsigned int v9 = 2;
  }
  v15 = [v8 advertisementData];
  id v16 = v15;
  v68 = v11;
  if (v15)
  {
    bleAdvertisementData = self->_bleAdvertisementData;
    int v18 = v15;
    id v19 = bleAdvertisementData;
    if (v18 == v19)
    {

      goto LABEL_21;
    }
    char v20 = v19;
    if (v19)
    {
      char v21 = -[NSData isEqual:](v18, "isEqual:", v19, v68);

      if (v21) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_bleAdvertisementData, v16);
    v9 |= 1u;
  }
LABEL_21:
  CFDataGetTypeID();
  id v22 = CFDictionaryGetTypedValue();

  if (!v22) {
    goto LABEL_29;
  }
  bleDeviceAddress = self->_bleDeviceAddress;
  v24 = v22;
  id v25 = bleDeviceAddress;
  if (v24 == v25)
  {

    goto LABEL_29;
  }
  v26 = v25;
  if (!v25)
  {

    goto LABEL_28;
  }
  char v27 = [(NSData *)v24 isEqual:v25];

  if ((v27 & 1) == 0)
  {
LABEL_28:
    objc_storeStrong((id *)&self->_bleDeviceAddress, v22);
    v9 |= 2u;
  }
LABEL_29:
  CFDataGetTypeID();
  v28 = CFDictionaryGetTypedValue();

  if (!v28) {
    goto LABEL_37;
  }
  bleAuthTag = self->_bleAuthTag;
  v30 = v28;
  id v31 = bleAuthTag;
  if (v30 == v31)
  {

    goto LABEL_37;
  }
  v32 = v31;
  if (!v31)
  {

    goto LABEL_36;
  }
  char v33 = [(NSData *)v30 isEqual:v31];

  if ((v33 & 1) == 0)
  {
LABEL_36:
    objc_storeStrong((id *)&self->_bleAuthTag, v28);
    v9 |= 2u;
  }
LABEL_37:
  if (!self->_contactID)
  {
    v34 = [v7 contactIdentifier];
    if (v34)
    {
      objc_storeStrong((id *)&self->_contactID, v34);
      v9 |= 2u;
    }
  }
  int v35 = objc_msgSend(v7, "deviceActionType", v68);
  if (v35 != self->_deviceActionType)
  {
    self->_deviceActionType = v35;
    v9 |= 2u;
  }
  unsigned int flags = self->_flags;
  unsigned int v37 = [v7 deviceFlags];
  int v38 = (2 * (v37 & 1)) | (v37 >> 3) & 1;
  if ((v37 & 0x10) != 0) {
    int v39 = 36;
  }
  else {
    int v39 = 4;
  }
  if ((v37 & 0x10) != 0) {
    int v40 = 1536;
  }
  else {
    int v40 = 512;
  }
  if ((v37 & 0x10) != 0) {
    int v41 = 192;
  }
  else {
    int v41 = 64;
  }
  if ((v37 & 0x10) != 0) {
    int v42 = 24576;
  }
  else {
    int v42 = 0x2000;
  }
  if ((v37 & 0x10) != 0) {
    int v43 = 98304;
  }
  else {
    int v43 = 0x8000;
  }
  if ((v37 & 2) != 0) {
    v38 |= v37 & 0x10 | 8;
  }
  int v44 = v38 | v39 & ((int)(v37 << 29) >> 31) | v40 & ((int)(v37 << 21) >> 31) | v41 & ((int)(v37 << 25) >> 31);
  unsigned int v45 = (16 * v37) & 0x800 | (((v37 >> 5) & 1) << 8) | v42 & ((int)(v37 << 17) >> 31) | v43 & ((__int16)v37 >> 15) | v44;
  if ((v44 & 0x24D) == 0) {
    v45 |= 0x1000u;
  }
  if (v45 != flags)
  {
    self->_unsigned int flags = v45;
    v9 |= 2u;
  }
  if (!self->_idsDeviceIdentifier)
  {
    v46 = [v7 idsIdentifier];
    if (v46)
    {
      objc_storeStrong((id *)&self->_idsDeviceIdentifier, v46);
      v9 |= 2u;
    }
  }
  int v47 = [v7 idsIdentifierConflict];
  if (self->_idsDeviceIdentifierConflict != v47)
  {
    self->_BOOL idsDeviceIdentifierConflict = v47;
    v9 |= 2u;
  }
  if (CFDictionaryGetInt64()) {
    unsigned int v48 = 20;
  }
  else {
    unsigned int v48 = 10;
  }
  if (v48 != self->_blePairState)
  {
    self->_blePairState = v48;
    v9 |= 2u;
  }
  int v49 = [v7 needsSetup];
  if (self->_needsSetup != v49)
  {
    self->_needsSetup = v49;
    v9 |= 2u;
  }
  v50 = [v7 model];

  if (v50)
  {
    model = self->_model;
    v52 = v50;
    v53 = model;
    if (v52 == v53)
    {

      goto LABEL_85;
    }
    v54 = v53;
    if (v53)
    {
      char v55 = [(NSString *)v52 isEqual:v53];

      if (v55) {
        goto LABEL_85;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_model, v50);
    v9 |= 2u;
  }
LABEL_85:
  v56 = [v7 name];

  if (!v56) {
    goto LABEL_93;
  }
  name = self->_name;
  v58 = v56;
  v59 = name;
  if (v58 == v59)
  {

    goto LABEL_93;
  }
  v60 = v59;
  if (!v59)
  {

    goto LABEL_92;
  }
  char v61 = [(NSString *)v58 isEqual:v59];

  if ((v61 & 1) == 0)
  {
LABEL_92:
    objc_storeStrong((id *)&self->_name, v56);
    v9 |= 0x10u;
  }
LABEL_93:

  if ((v4 & 2) == 0) {
    goto LABEL_104;
  }
LABEL_94:
  uint64_t v62 = [v7 distance];
  if ((unint64_t)v62 >= 0x15) {
    int v63 = 30;
  }
  else {
    int v63 = 20;
  }
  if (v62 >= 11) {
    int v64 = v63;
  }
  else {
    int v64 = 10;
  }
  if (!v62) {
    int v64 = 0;
  }
  if (v64 != self->_proximity)
  {
    self->_uint64_t proximity = v64;
    v9 |= 0x80u;
  }
LABEL_104:
  if ((v4 & 4) != 0)
  {
    int v65 = [v8 rssi];
    if (self->_rawRSSI != v65)
    {
      self->_rawRSSI = v65;
      v9 |= 0x20u;
    }
    int v66 = [v8 smoothedRSSI];
    if (self->_smoothedRSSI != v66)
    {
      self->_smoothedRSSI = v66;
      v9 |= 0x20u;
    }
  }

  return v9;
}

- (void)updateWithSystemInfo:(id)a3
{
  id v7 = a3;
  char v4 = NSDictionaryGetNSUUID();
  if (v4) {
    objc_storeStrong((id *)&self->_pairingIdentifier, v4);
  }
  CFStringGetTypeID();
  id v5 = CFDictionaryGetTypedValue();
  if (v5) {
    objc_storeStrong((id *)&self->_name, v5);
  }
  CFStringGetTypeID();
  unsigned int v6 = CFDictionaryGetTypedValue();

  if (v6) {
    objc_storeStrong((id *)&self->_model, v6);
  }
}

- (void)updateWithWiFiDevice:(id)a3 changes:(unsigned int)a4
{
  id v11 = a3;
  id v5 = [v11 bssid];
  if (v5) {
    objc_storeStrong((id *)&self->_wifiBSSID, v5);
  }
  unsigned int v6 = [v11 deviceIEDeviceID];

  if (v6) {
    objc_storeStrong((id *)&self->_wifiDeviceIEDeviceID, v6);
  }
  self->_wifiDeviceIEFlags = [v11 deviceIEFlags];
  id v7 = [v11 deviceIEName];

  if (v7) {
    objc_storeStrong((id *)&self->_wifiDeviceIEName, v7);
  }
  unsigned int v8 = [v11 ieData];

  if (v8) {
    objc_storeStrong((id *)&self->_wifiIEData, v8);
  }
  unsigned int v9 = [v11 platformObject];

  if (v9) {
    objc_storeStrong(&self->_wifiPlatformObject, v9);
  }
  unsigned int v10 = [v11 ssid];

  if (v10) {
    objc_storeStrong((id *)&self->_wifiSSID, v10);
  }
}

- (NSString)accountID
{
  return self->_accountID;
}

- (int)activityLevel
{
  return self->_activityLevel;
}

- (NSDate)activityLevelTimeStamp
{
  return self->_activityLevelTimeStamp;
}

- (NSData)bleAuthTag
{
  return self->_bleAuthTag;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (BOOL)idsDeviceIdentifierConflict
{
  return self->_idsDeviceIdentifierConflict;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)proximity
{
  return self->_proximity;
}

- (CURangingMeasurement)relativeLocation
{
  return (CURangingMeasurement *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRelativeLocation:(id)a3
{
}

- (SFDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
}

- (CUMobileDevice)mobileDevice
{
  return self->_mobileDevice;
}

- (void)setMobileDevice:(id)a3
{
}

- (NSData)authTag
{
  return self->_authTag;
}

- (NSData)bleAdvertisementData
{
  return self->_bleAdvertisementData;
}

- (NSData)bleDeviceAddress
{
  return self->_bleDeviceAddress;
}

- (unsigned)blePairState
{
  return self->_blePairState;
}

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
}

- (NSUUID)identifierUUID
{
  return self->_identifierUUID;
}

- (void)setIdentifierUUID:(id)a3
{
}

- (BOOL)needsSetup
{
  return self->_needsSetup;
}

- (CUPairedPeer)pairedPeer
{
  return self->_pairedPeer;
}

- (void)setPairedPeer:(id)a3
{
}

- (NSUUID)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (void)setPairingIdentifier:(id)a3
{
}

- (int)rawRSSI
{
  return self->_rawRSSI;
}

- (int)smoothedRSSI
{
  return self->_smoothedRSSI;
}

- (unsigned)systemPairState
{
  return self->_systemPairState;
}

- (void)setSystemPairState:(unsigned int)a3
{
  self->_systemPairState = a3;
}

- (NSData)txtData
{
  return self->_txtData;
}

- (NSDictionary)txtDictionary
{
  return self->_txtDictionary;
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
}

- (NSData)wifiAddress
{
  return self->_wifiAddress;
}

- (void)setWifiAddress:(id)a3
{
}

- (NSData)wifiBSSID
{
  return self->_wifiBSSID;
}

- (void)setWifiBSSID:(id)a3
{
}

- (NSData)wifiDeviceIEDeviceID
{
  return self->_wifiDeviceIEDeviceID;
}

- (void)setWifiDeviceIEDeviceID:(id)a3
{
}

- (unsigned)wifiDeviceIEFlags
{
  return self->_wifiDeviceIEFlags;
}

- (NSData)wifiDeviceIEName
{
  return self->_wifiDeviceIEName;
}

- (void)setWifiDeviceIEName:(id)a3
{
}

- (NSData)wifiIEData
{
  return self->_wifiIEData;
}

- (void)setWifiIEData:(id)a3
{
}

- (id)wifiPlatformObject
{
  return self->_wifiPlatformObject;
}

- (void)setWifiPlatformObject:(id)a3
{
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (void)setWifiSSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiSSID, 0);
  objc_storeStrong(&self->_wifiPlatformObject, 0);
  objc_storeStrong((id *)&self->_wifiIEData, 0);
  objc_storeStrong((id *)&self->_wifiDeviceIEName, 0);
  objc_storeStrong((id *)&self->_wifiDeviceIEDeviceID, 0);
  objc_storeStrong((id *)&self->_wifiBSSID, 0);
  objc_storeStrong((id *)&self->_wifiAddress, 0);
  objc_storeStrong((id *)&self->_udid, 0);
  objc_storeStrong((id *)&self->_txtDictionary, 0);
  objc_storeStrong((id *)&self->_txtData, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedPeer, 0);
  objc_storeStrong((id *)&self->_identifierUUID, 0);
  objc_storeStrong((id *)&self->_bleDeviceAddress, 0);
  objc_storeStrong((id *)&self->_bleAdvertisementData, 0);
  objc_storeStrong((id *)&self->_authTag, 0);
  objc_storeStrong((id *)&self->_mobileDevice, 0);
  objc_storeStrong((id *)&self->_bleDevice, 0);
  objc_storeStrong((id *)&self->_relativeLocation, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_bleAuthTag, 0);
  objc_storeStrong((id *)&self->_activityLevelTimeStamp, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end