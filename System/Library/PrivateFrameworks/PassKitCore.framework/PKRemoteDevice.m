@interface PKRemoteDevice
+ (BOOL)supportsSecureCoding;
+ (id)acceptedComparatorWithPaymentSupportedQuery:(id)a3;
+ (id)preferenceComparator;
- (BOOL)canMakePayments;
- (BOOL)deviceDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteDevice:(id)a3;
- (BOOL)isLocked;
- (BOOL)supportsFaceID;
- (BOOL)userDisabled;
- (NSArray)remotePaymentInstruments;
- (NSArray)supportedSetupFeatures;
- (NSDate)lastSeen;
- (NSString)deviceName;
- (NSString)modelIdentifier;
- (NSString)uniqueID;
- (NSUUID)bluetoothUUID;
- (PKRemoteDevice)initWithCoder:(id)a3;
- (PKRemoteDevice)initWithIDSDevice:(id)a3;
- (PKRemotePaymentInstrument)defaultRemotePaymentInstrument;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)pk_idsDestination;
- (int64_t)_deviceTypeForModelIdentifier:(id)a3;
- (int64_t)majorOperatingSystemVersion;
- (int64_t)proximityState;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBluetoothUUID:(id)a3;
- (void)setDefaultRemotePaymentInstrument:(id)a3;
- (void)setDeviceDisabled:(BOOL)a3;
- (void)setDeviceName:(id)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setLastSeen:(id)a3;
- (void)setMajorOperatingSystemVersion:(int64_t)a3;
- (void)setModelIdentifier:(id)a3;
- (void)setProximityState:(int64_t)a3;
- (void)setRemotePaymentInstruments:(id)a3;
- (void)setSupportedSetupFeatures:(id)a3;
- (void)setSupportsFaceID:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)setUniqueID:(id)a3;
- (void)setUserDisabled:(BOOL)a3;
@end

@implementation PKRemoteDevice

+ (id)preferenceComparator
{
  v2 = (void *)[&__block_literal_global_790 copy];
  return v2;
}

uint64_t __71__PKRemoteDevice_PKPaymentAuthorizationDataModel__preferenceComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 type];
  uint64_t v7 = [v5 type];
  int v8 = [v4 isLocked];
  int v9 = [v5 isLocked];
  if (![v4 proximityState] && objc_msgSend(v5, "proximityState")) {
    goto LABEL_10;
  }
  if ([v4 proximityState] && !objc_msgSend(v5, "proximityState")) {
    goto LABEL_26;
  }
  if (v6 < v7)
  {
    if (v6) {
      unsigned __int8 v10 = 0;
    }
    else {
      unsigned __int8 v10 = v8;
    }
    BOOL v11 = (v10 & (v7 == 1)) == 0;
    uint64_t v12 = 1;
LABEL_16:
    if (v11) {
      uint64_t v13 = -v12;
    }
    else {
      uint64_t v13 = v12;
    }
    goto LABEL_27;
  }
  if (v6 > v7)
  {
    if (v7) {
      unsigned __int8 v14 = 0;
    }
    else {
      unsigned __int8 v14 = v9;
    }
    BOOL v11 = (v14 & (v6 == 1)) == 0;
    uint64_t v12 = -1;
    goto LABEL_16;
  }
  if (!v6)
  {
    if ((v8 ^ 1 | v9) == 1)
    {
      if ((v9 ^ 1 | v8) != 1)
      {
LABEL_10:
        uint64_t v13 = -1;
        goto LABEL_27;
      }
      goto LABEL_20;
    }
LABEL_26:
    uint64_t v13 = 1;
    goto LABEL_27;
  }
LABEL_20:
  v15 = [v5 lastSeen];
  v16 = [v4 lastSeen];
  uint64_t v13 = [v15 compare:v16];

  if (!v13)
  {
    v17 = [v4 deviceName];
    v18 = [v5 deviceName];
    uint64_t v13 = [v17 compare:v18];

    if (!v13)
    {
      v19 = [v4 uniqueID];
      v20 = [v5 uniqueID];
      uint64_t v13 = [v19 compare:v20];
    }
  }
LABEL_27:

  return v13;
}

+ (id)acceptedComparatorWithPaymentSupportedQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 preferenceComparator];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __95__PKRemoteDevice_PKPaymentAuthorizationDataModel__acceptedComparatorWithPaymentSupportedQuery___block_invoke;
  unsigned __int8 v14 = &unk_1E56DFE48;
  id v15 = v4;
  id v16 = v5;
  id v6 = v5;
  id v7 = v4;
  int v8 = _Block_copy(&v11);
  int v9 = objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

uint64_t __95__PKRemoteDevice_PKPaymentAuthorizationDataModel__acceptedComparatorWithPaymentSupportedQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 remotePaymentInstruments];
  int v8 = [v7 firstObject];
  int v9 = [v8 primaryPaymentApplication];

  int v10 = [v9 canProcessPayment:*(void *)(a1 + 32)];
  uint64_t v11 = [v6 remotePaymentInstruments];
  uint64_t v12 = [v11 firstObject];
  uint64_t v13 = [v12 primaryPaymentApplication];

  int v14 = [v13 canProcessPayment:*(void *)(a1 + 32)];
  if (!v10 || v14)
  {
    if ((v10 | v14 ^ 1) == 1) {
      uint64_t v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else {
      uint64_t v15 = 1;
    }
  }
  else
  {
    uint64_t v15 = -1;
  }

  return v15;
}

- (PKRemoteDevice)initWithIDSDevice:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKRemoteDevice;
  id v5 = [(PKRemoteDevice *)&v19 init];
  if (v5)
  {
    id v6 = [v4 name];
    uint64_t v7 = [v6 copy];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v7;

    uint64_t v9 = IDSCopyIDForDevice();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v9;

    uint64_t v11 = [v4 modelIdentifier];
    v5->_type = [(PKRemoteDevice *)v5 _deviceTypeForModelIdentifier:v11];

    uint64_t v12 = [v4 nsuuid];
    bluetoothUUID = v5->_bluetoothUUID;
    v5->_bluetoothUUID = (NSUUID *)v12;

    uint64_t v14 = [v4 modelIdentifier];
    modelIdentifier = v5->_modelIdentifier;
    v5->_modelIdentifier = (NSString *)v14;

    if (v4)
    {
      [v4 operatingSystemVersion];
      int64_t v16 = v18;
    }
    else
    {
      int64_t v16 = 0;
    }
    v5->_majorOperatingSystemVersion = v16;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemoteDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKRemoteDevice;
  id v5 = [(PKRemoteDevice *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v6;

    int v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    int v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"remotePaymentInstruments"];
    remotePaymentInstruments = v5->_remotePaymentInstruments;
    v5->_remotePaymentInstruments = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultRemotePaymentInstrument"];
    defaultRemotePaymentInstrument = v5->_defaultRemotePaymentInstrument;
    v5->_defaultRemotePaymentInstrument = (PKRemotePaymentInstrument *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bluetoothUUID"];
    bluetoothUUID = v5->_bluetoothUUID;
    v5->_bluetoothUUID = (NSUUID *)v17;

    v5->_isLocked = [v4 decodeBoolForKey:@"isLocked"];
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_userDisabled = [v4 decodeBoolForKey:@"userDisabled"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSeen"];
    lastSeen = v5->_lastSeen;
    v5->_lastSeen = (NSDate *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelIdentifier"];
    modelIdentifier = v5->_modelIdentifier;
    v5->_modelIdentifier = (NSString *)v21;

    v5->_deviceDisabled = [v4 decodeBoolForKey:@"deviceDisabled"];
    v5->_proximityState = [v4 decodeIntegerForKey:@"proximityState"];
    v5->_supportsFaceID = [v4 decodeBoolForKey:@"supportsFaceID"];
    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"supportedSetupFeatures"];
    supportedSetupFeatures = v5->_supportedSetupFeatures;
    v5->_supportedSetupFeatures = (NSArray *)v26;

    v5->_majorOperatingSystemVersion = [v4 decodeIntegerForKey:@"majorOperatingSystemVersion"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  deviceName = self->_deviceName;
  id v5 = a3;
  [v5 encodeObject:deviceName forKey:@"deviceName"];
  [v5 encodeObject:self->_remotePaymentInstruments forKey:@"remotePaymentInstruments"];
  [v5 encodeObject:self->_defaultRemotePaymentInstrument forKey:@"defaultRemotePaymentInstrument"];
  [v5 encodeObject:self->_uniqueID forKey:@"uniqueID"];
  [v5 encodeObject:self->_bluetoothUUID forKey:@"bluetoothUUID"];
  [v5 encodeBool:self->_isLocked forKey:@"isLocked"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeBool:self->_userDisabled forKey:@"userDisabled"];
  [v5 encodeObject:self->_lastSeen forKey:@"lastSeen"];
  [v5 encodeObject:self->_modelIdentifier forKey:@"modelIdentifier"];
  [v5 encodeBool:self->_deviceDisabled forKey:@"deviceDisabled"];
  [v5 encodeInteger:self->_proximityState forKey:@"proximityState"];
  [v5 encodeBool:self->_supportsFaceID forKey:@"supportsFaceID"];
  [v5 encodeObject:self->_supportedSetupFeatures forKey:@"supportedSetupFeatures"];
  [v5 encodeInteger:self->_majorOperatingSystemVersion forKey:@"majorOperatingSystemVersion"];
}

- (unint64_t)hash
{
  v7[2] = *MEMORY[0x1E4F143B8];
  deviceName = self->_deviceName;
  v7[0] = self->_uniqueID;
  v7[1] = deviceName;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  uint64_t v5 = PKCombinedHash(17, v4);

  return self->_type - v5 + 32 * v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKRemoteDevice *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKRemoteDevice *)self isEqualToRemoteDevice:v5];

  return v6;
}

- (BOOL)isEqualToRemoteDevice:(id)a3
{
  id v4 = a3;
  deviceName = self->_deviceName;
  BOOL v6 = (NSString *)v4[2];
  if (deviceName) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[NSString isEqual:](deviceName, "isEqual:")) {
      goto LABEL_9;
    }
LABEL_7:
    char v8 = 0;
    goto LABEL_13;
  }
  if (deviceName != v6) {
    goto LABEL_7;
  }
LABEL_9:
  uniqueID = self->_uniqueID;
  int v10 = (NSString *)v4[9];
  if (uniqueID && v10) {
    char v8 = -[NSString isEqual:](uniqueID, "isEqual:");
  }
  else {
    char v8 = uniqueID == v10;
  }
LABEL_13:

  return v8;
}

- (id)description
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"\n\n*****************\nDevice Name: %@\n Device ID: %@\n", self->_deviceName, self->_uniqueID];
  [v3 appendFormat:@"Last seen: %@\n", self->_lastSeen];
  int64_t proximityState = self->_proximityState;
  uint64_t v5 = @"Unknown";
  if (proximityState == 1) {
    uint64_t v5 = @"Distant";
  }
  if (proximityState) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = @"Nearby";
  }
  [v3 appendFormat:@"Proximity: %@\n", v6];
  if (self->_isLocked) {
    BOOL v7 = @"Yes";
  }
  else {
    BOOL v7 = @"No";
  }
  [v3 appendFormat:@"Locked: %@\n", v7];
  if (self->_deviceDisabled) {
    char v8 = @"Yes";
  }
  else {
    char v8 = @"No";
  }
  [v3 appendFormat:@"Disabled: %@\n", v8];
  if (self->_userDisabled) {
    uint64_t v9 = @"Yes";
  }
  else {
    uint64_t v9 = @"No";
  }
  [v3 appendFormat:@"User disabled: %@\n", v9];
  if (self->_supportsFaceID) {
    int v10 = @"Yes";
  }
  else {
    int v10 = @"No";
  }
  [v3 appendFormat:@"Face ID available: %@\n", v10];
  uint64_t v11 = [(PKRemotePaymentInstrument *)self->_defaultRemotePaymentInstrument displayName];
  [v3 appendFormat:@"Default: %@\n", v11];

  objc_msgSend(v3, "appendFormat:", @"OS Version: %ld\n", self->_majorOperatingSystemVersion);
  [v3 appendString:@"Payment Instruments: \n"];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v12 = self->_remotePaymentInstruments;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v30 + 1) + 8 * i) description];
        [v3 appendFormat:@"%@", v17];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v14);
  }

  [v3 appendString:@"Setup Features: \n"];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int64_t v18 = self->_supportedSetupFeatures;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [*(id *)(*((void *)&v26 + 1) + 8 * j) description];
        [v3 appendFormat:@"%@", v23];
      }
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

  uint64_t v24 = (void *)[v3 copy];
  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[PKRemoteDevice allocWithZone:](PKRemoteDevice, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_deviceName copyWithZone:a3];
  deviceName = v5->_deviceName;
  v5->_deviceName = (NSString *)v6;

  v5->_type = self->_type;
  uint64_t v8 = [(NSString *)self->_modelIdentifier copyWithZone:a3];
  modelIdentifier = v5->_modelIdentifier;
  v5->_modelIdentifier = (NSString *)v8;

  uint64_t v10 = [(NSDate *)self->_lastSeen copyWithZone:a3];
  lastSeen = v5->_lastSeen;
  v5->_lastSeen = (NSDate *)v10;

  v5->_int64_t proximityState = self->_proximityState;
  v5->_isLocked = self->_isLocked;
  v5->_userDisabled = self->_userDisabled;
  v5->_deviceDisabled = self->_deviceDisabled;
  uint64_t v12 = [(NSArray *)self->_remotePaymentInstruments copyWithZone:a3];
  remotePaymentInstruments = v5->_remotePaymentInstruments;
  v5->_remotePaymentInstruments = (NSArray *)v12;

  uint64_t v14 = [(PKRemotePaymentInstrument *)self->_defaultRemotePaymentInstrument copyWithZone:a3];
  defaultRemotePaymentInstrument = v5->_defaultRemotePaymentInstrument;
  v5->_defaultRemotePaymentInstrument = v14;

  uint64_t v16 = [(NSString *)self->_uniqueID copyWithZone:a3];
  uniqueID = v5->_uniqueID;
  v5->_uniqueID = (NSString *)v16;

  uint64_t v18 = [(NSUUID *)self->_bluetoothUUID copyWithZone:a3];
  bluetoothUUID = v5->_bluetoothUUID;
  v5->_bluetoothUUID = (NSUUID *)v18;

  v5->_supportsFaceID = self->_supportsFaceID;
  uint64_t v20 = [(NSArray *)self->_supportedSetupFeatures copyWithZone:a3];
  supportedSetupFeatures = v5->_supportedSetupFeatures;
  v5->_supportedSetupFeatures = (NSArray *)v20;

  v5->_majorOperatingSystemVersion = self->_majorOperatingSystemVersion;
  return v5;
}

- (BOOL)canMakePayments
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(PKRemotePaymentInstrument *)self->_defaultRemotePaymentInstrument paymentApplications];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v7 supportsInAppPayment])
        {
          uint64_t v8 = [v7 state];
          if (v8 == 1 || v8 == 15)
          {
            LOBYTE(v4) = 1;
            goto LABEL_15;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  if (self->_deviceDisabled) {
    return 0;
  }
  if (self->_userDisabled) {
    return 0;
  }
  return v4;
}

- (int64_t)_deviceTypeForModelIdentifier:(id)a3
{
  id v3 = [a3 lowercaseString];
  if ([v3 containsString:@"watch"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 containsString:@"iphone"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 containsString:@"mac"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 containsString:@"pad"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 5;
  }

  return v4;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void)setModelIdentifier:(id)a3
{
}

- (NSDate)lastSeen
{
  return self->_lastSeen;
}

- (void)setLastSeen:(id)a3
{
}

- (int64_t)proximityState
{
  return self->_proximityState;
}

- (void)setProximityState:(int64_t)a3
{
  self->_int64_t proximityState = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (BOOL)userDisabled
{
  return self->_userDisabled;
}

- (void)setUserDisabled:(BOOL)a3
{
  self->_userDisabled = a3;
}

- (BOOL)deviceDisabled
{
  return self->_deviceDisabled;
}

- (void)setDeviceDisabled:(BOOL)a3
{
  self->_deviceDisabled = a3;
}

- (NSArray)remotePaymentInstruments
{
  return self->_remotePaymentInstruments;
}

- (void)setRemotePaymentInstruments:(id)a3
{
}

- (PKRemotePaymentInstrument)defaultRemotePaymentInstrument
{
  return self->_defaultRemotePaymentInstrument;
}

- (void)setDefaultRemotePaymentInstrument:(id)a3
{
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSUUID)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- (void)setBluetoothUUID:(id)a3
{
}

- (BOOL)supportsFaceID
{
  return self->_supportsFaceID;
}

- (void)setSupportsFaceID:(BOOL)a3
{
  self->_supportsFaceID = a3;
}

- (NSArray)supportedSetupFeatures
{
  return self->_supportedSetupFeatures;
}

- (void)setSupportedSetupFeatures:(id)a3
{
}

- (int64_t)majorOperatingSystemVersion
{
  return self->_majorOperatingSystemVersion;
}

- (void)setMajorOperatingSystemVersion:(int64_t)a3
{
  self->_majorOperatingSystemVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSetupFeatures, 0);
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_defaultRemotePaymentInstrument, 0);
  objc_storeStrong((id *)&self->_remotePaymentInstruments, 0);
  objc_storeStrong((id *)&self->_lastSeen, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

- (id)pk_idsDestination
{
  id v3 = [(PKRemoteDevice *)self uniqueID];
  int64_t v4 = [(PKRemoteDevice *)self deviceName];
  uint64_t v5 = +[PKIDSDestination destinationWithDeviceIdentifier:v3 name:v4];

  return v5;
}

@end