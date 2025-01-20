@interface SFPowerSource
+ (BOOL)supportsSecureCoding;
- (BOOL)adapterSharedSource;
- (BOOL)added;
- (BOOL)charging;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternal;
- (BOOL)isLowPowerModeEnabled;
- (BOOL)present;
- (BOOL)showChargingUI;
- (BOOL)wirelessCharging;
- (NSArray)LEDs;
- (NSData)batteryCaseAddress;
- (NSDictionary)ioKitAdapterDescription;
- (NSDictionary)ioKitDescription;
- (NSString)accessoryCategory;
- (NSString)accessoryID;
- (NSString)adapterName;
- (NSString)groupID;
- (NSString)name;
- (NSString)partID;
- (NSString)partName;
- (NSString)state;
- (NSString)transportType;
- (NSString)type;
- (SFPowerSource)init;
- (SFPowerSource)initWithCoder:(id)a3;
- (double)chargeLevel;
- (double)lowWarnLevel;
- (double)maxCapacity;
- (id)description;
- (id)detailedDescription;
- (int)powerState;
- (int)publish;
- (int)role;
- (int64_t)adapterErrorFlags;
- (int64_t)adapterFamilyCode;
- (int64_t)adapterSourceID;
- (int64_t)color;
- (int64_t)familyCode;
- (int64_t)matID;
- (int64_t)productID;
- (int64_t)sourceID;
- (int64_t)temperature;
- (int64_t)vendorID;
- (unint64_t)hash;
- (unsigned)changes;
- (unsigned)updateWithPowerAdapterDetails:(id)a3;
- (unsigned)updateWithPowerSourceDescription:(id)a3;
- (void)_updateWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)lowPowerModeChanged:(int)a3;
- (void)setAccessoryCategory:(id)a3;
- (void)setAccessoryID:(id)a3;
- (void)setAdapterErrorFlags:(int64_t)a3;
- (void)setAdapterFamilyCode:(int64_t)a3;
- (void)setAdapterName:(id)a3;
- (void)setAdapterSharedSource:(BOOL)a3;
- (void)setAdapterSourceID:(int64_t)a3;
- (void)setAdded:(BOOL)a3;
- (void)setBatteryCaseAddress:(id)a3;
- (void)setChanges:(unsigned int)a3;
- (void)setChargeLevel:(double)a3;
- (void)setCharging:(BOOL)a3;
- (void)setColor:(int64_t)a3;
- (void)setFamilyCode:(int64_t)a3;
- (void)setGroupID:(id)a3;
- (void)setIoKitAdapterDescription:(id)a3;
- (void)setIoKitDescription:(id)a3;
- (void)setLEDs:(id)a3;
- (void)setLowPowerModeEnabled:(BOOL)a3;
- (void)setLowWarnLevel:(double)a3;
- (void)setMaxCapacity:(double)a3;
- (void)setName:(id)a3;
- (void)setPartID:(id)a3;
- (void)setPartName:(id)a3;
- (void)setPowerState:(int)a3;
- (void)setPresent:(BOOL)a3;
- (void)setProductID:(int64_t)a3;
- (void)setRole:(int)a3;
- (void)setShowChargingUI:(BOOL)a3;
- (void)setSourceID:(int64_t)a3;
- (void)setState:(id)a3;
- (void)setTemperature:(int64_t)a3;
- (void)setTransportType:(id)a3;
- (void)setType:(id)a3;
- (void)setVendorID:(int64_t)a3;
- (void)startLowPowerMonitoringIfAppropriate;
- (void)updateWithPowerSource:(id)a3;
@end

@implementation SFPowerSource

- (id)description
{
  uint64_t v63 = 0;
  v51 = self;
  NSAppendPrintF();
  id v3 = 0;
  id v4 = v3;
  int64_t sourceID = self->_sourceID;
  if (sourceID)
  {
    id v62 = v3;
    v51 = (SFPowerSource *)sourceID;
    NSAppendPrintF();
    id v6 = v62;

    id v4 = v6;
  }
  accessoryCategory = self->_accessoryCategory;
  if (accessoryCategory)
  {
    id v61 = v4;
    v51 = (SFPowerSource *)accessoryCategory;
    NSAppendPrintF();
    id v8 = v4;

    id v4 = v8;
  }
  accessoryID = self->_accessoryID;
  if (accessoryID)
  {
    id v60 = v4;
    v51 = (SFPowerSource *)accessoryID;
    NSAppendPrintF();
    id v10 = v4;

    id v4 = v10;
  }
  batteryCaseAddress = self->_batteryCaseAddress;
  if (batteryCaseAddress)
  {
    id v59 = v4;
    v51 = (SFPowerSource *)batteryCaseAddress;
    NSAppendPrintF();
    id v12 = v4;

    id v4 = v12;
  }
  double chargeLevel = self->_chargeLevel;
  if (chargeLevel != 0.0)
  {
    id v58 = v4;
    double v54 = chargeLevel * 100.0;
    uint64_t v14 = 43;
    if (!self->_charging) {
      uint64_t v14 = 45;
    }
    v51 = (SFPowerSource *)v14;
    NSAppendPrintF();
    id v15 = v58;

    id v4 = v15;
  }
  groupID = self->_groupID;
  if (groupID)
  {
    v57[24] = v4;
    v51 = (SFPowerSource *)groupID;
    NSAppendPrintF();
    id v17 = v4;

    id v4 = v17;
  }
  if ([(SFPowerSource *)self matID])
  {
    v57[23] = v4;
    int64_t v53 = [(SFPowerSource *)self matID];
    NSAppendPrintF();
    id v18 = v4;

    if ([(SFPowerSource *)self matID] == 0xFFFF)
    {
      v57[22] = v18;
      NSAppendPrintF();
      id v19 = v18;

      id v18 = v19;
    }
    if ([(SFPowerSource *)self matID] == 123456789)
    {
      v57[21] = v18;
      NSAppendPrintF();
      id v4 = v18;
    }
    else
    {
      id v4 = v18;
    }
  }
  partID = self->_partID;
  if (partID)
  {
    v57[20] = v4;
    v52 = (const char *)partID;
    NSAppendPrintF();
    id v21 = v4;

    id v4 = v21;
  }
  int64_t productID = self->_productID;
  if (productID)
  {
    v57[19] = v4;
    v52 = (const char *)productID;
    NSAppendPrintF();
    id v23 = v4;

    id v4 = v23;
  }
  int64_t color = self->_color;
  if (color != -1)
  {
    v57[18] = v4;
    v52 = (const char *)color;
    NSAppendPrintF();
    id v25 = v4;

    id v4 = v25;
  }
  int64_t adapterErrorFlags = self->_adapterErrorFlags;
  if (adapterErrorFlags)
  {
    v57[17] = v4;
    v52 = (const char *)adapterErrorFlags;
    NSAppendPrintF();
    id v27 = v4;

    id v4 = v27;
  }
  int64_t adapterFamilyCode = self->_adapterFamilyCode;
  if (adapterFamilyCode)
  {
    v57[16] = v4;
    v52 = (const char *)adapterFamilyCode;
    NSAppendPrintF();
    id v29 = v4;

    id v4 = v29;
  }
  adapterName = self->_adapterName;
  if (adapterName)
  {
    v57[15] = v4;
    v52 = (const char *)adapterName;
    NSAppendPrintF();
    id v31 = v4;

    id v4 = v31;
  }
  if (self->_adapterSharedSource)
  {
    v57[14] = v4;
    v52 = "yes";
    NSAppendPrintF();
    id v32 = v4;

    id v4 = v32;
  }
  int64_t adapterSourceID = self->_adapterSourceID;
  if (adapterSourceID)
  {
    v57[13] = v4;
    v52 = (const char *)adapterSourceID;
    NSAppendPrintF();
    id v34 = v4;

    id v4 = v34;
  }
  if (self->_showChargingUI)
  {
    v57[12] = v4;
    v52 = "yes";
    NSAppendPrintF();
    id v35 = v4;

    id v4 = v35;
  }
  int64_t familyCode = self->_familyCode;
  if (familyCode)
  {
    v57[11] = v4;
    v52 = (const char *)familyCode;
    NSAppendPrintF();
    id v37 = v4;

    id v4 = v37;
  }
  if ([(NSArray *)self->_LEDs count])
  {
    v57[10] = v4;
    NSAppendPrintF();
    id v38 = v4;

    id v4 = v38;
  }
  if (self->_maxCapacity > 0.0)
  {
    v57[9] = v4;
    NSAppendPrintF();
    id v39 = v4;

    id v4 = v39;
  }
  if (self->_vendorID)
  {
    v57[8] = v4;
    NSAppendPrintF();
    id v40 = v4;

    id v4 = v40;
  }
  if (self->_temperature)
  {
    v57[7] = v4;
    NSAppendPrintF();
    id v41 = v4;

    id v4 = v41;
  }
  if (self->_type)
  {
    v57[6] = v4;
    NSAppendPrintF();
    id v42 = v4;

    id v4 = v42;
  }
  if (self->_transportType)
  {
    v57[5] = v4;
    NSAppendPrintF();
    id v43 = v4;

    id v4 = v43;
  }
  if (self->_name)
  {
    v57[4] = v4;
    NSAppendPrintF();
    id v44 = v4;

    id v4 = v44;
  }
  if (self->_lowPowerModeEnabled)
  {
    v57[3] = v4;
    NSAppendPrintF();
    id v45 = v4;

    id v4 = v45;
  }
  if (self->_lowWarnLevel != 0.0)
  {
    v57[2] = v4;
    NSAppendPrintF();
    id v46 = v4;

    id v4 = v46;
  }
  if (self->_powerState)
  {
    v57[1] = v4;
    NSAppendPrintF();
    id v47 = v4;

    if (self->_powerState == 1)
    {
      if (self->_charging)
      {
        v57[0] = v47;
        v48 = (id *)v57;
      }
      else
      {
        id v56 = v47;
        v48 = &v56;
      }
    }
    else
    {
      id v55 = v47;
      v48 = &v55;
    }
    NSAppendPrintF();
    id v4 = *v48;
  }
  NSAppendPrintF();
  id v49 = v4;

  return v49;
}

- (int64_t)matID
{
  if (!IsAppleInternalBuild()
    || ![(SFPowerSource *)self wirelessCharging]
    || !BOOLeanValueForPreference(@"EnableAnyCharger", 0))
  {
    goto LABEL_19;
  }
  if ([(SFPowerSource *)self isInternal]) {
    return 123456789;
  }
  id v3 = [(SFPowerSource *)self accessoryCategory];
  id v4 = v3;
  if (v3 == @"Battery Case"
    || v3 && (char v5 = [(__CFString *)v3 isEqual:@"Battery Case"], v4, (v5 & 1) != 0))
  {
LABEL_16:

    return 123456789;
  }
  id v6 = [(SFPowerSource *)self accessoryCategory];
  v7 = v6;
  if (v6 == @"Watch"
    || v6 && (char v8 = [(__CFString *)v6 isEqual:@"Watch"], v7, (v8 & 1) != 0)
    || ([(SFPowerSource *)self partID],
        v9 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(),
        v9 == @"Case"))
  {

    goto LABEL_16;
  }
  id v10 = v9;
  if (v9)
  {
    char v11 = [(__CFString *)v9 isEqual:@"Case"];

    if ((v11 & 1) == 0) {
      goto LABEL_19;
    }
    return 123456789;
  }

LABEL_19:

  return [(SFPowerSource *)self adapterSourceID];
}

- (BOOL)wirelessCharging
{
  BOOL v3 = [(SFPowerSource *)self charging]
    && IsAppleInternalBuild()
    && BOOLeanValueForPreference(@"EnableAnyCharger", 0) != 0;
  id v4 = [(SFPowerSource *)self accessoryCategory];
  char v5 = v4;
  if (v4 != @"Battery Case")
  {
    if (!v4) {
      goto LABEL_12;
    }
    int v6 = [(__CFString *)v4 isEqual:@"Battery Case"];

    if (!v6) {
      goto LABEL_12;
    }
  }
  v7 = [(SFPowerSource *)self transportType];
  if (v7 != @"AID")
  {
    char v8 = v7;
    if (v7)
    {
      char v9 = [(__CFString *)v7 isEqual:@"AID"];

      if (v9) {
        goto LABEL_15;
      }
LABEL_13:
      int64_t v10 = [(SFPowerSource *)self adapterFamilyCode];
      goto LABEL_16;
    }
LABEL_12:

    goto LABEL_13;
  }

LABEL_15:
  int64_t v10 = [(SFPowerSource *)self familyCode];
LABEL_16:
  int64_t v11 = v10;
  BOOL v12 = [(SFPowerSource *)self charging];
  v13 = [(SFPowerSource *)self groupID];
  if (v13 == @"Internal") {
    goto LABEL_25;
  }
  uint64_t v14 = v13;
  if (v13)
  {
    int v15 = [(__CFString *)v13 isEqual:@"Internal"];

    if (v15) {
      goto LABEL_25;
    }
  }
  v16 = [(SFPowerSource *)self accessoryCategory];
  if (v16 == @"Battery Case") {
    goto LABEL_25;
  }
  id v17 = v16;
  if (v16)
  {
    int v18 = [(__CFString *)v16 isEqual:@"Battery Case"];

    if (v18) {
      goto LABEL_25;
    }
  }
  id v19 = [(SFPowerSource *)self accessoryCategory];
  if (v19 == @"Watch"
    || (v20 = v19) != 0
    && (int v21 = [(__CFString *)v19 isEqual:@"Watch"], v20, v20, v21))
  {
LABEL_25:
    BOOL v22 = v11 == -536723452 && v12;
    return v22 || v3;
  }
  else
  {
    v24 = [(SFPowerSource *)self partID];
    if (v24 == @"Case"
      || (id v25 = v24) != 0
      && (int v26 = [(__CFString *)v24 isEqual:@"Case"], v25, v25, v26))
    {
      if ([(SFPowerSource *)self adapterSourceID]) {
        BOOL v27 = [(SFPowerSource *)self adapterSourceID] != 0xFFFF;
      }
      else {
        BOOL v27 = 0;
      }
      if (v11 == -536723452) {
        BOOL v27 = 1;
      }
      return v27 && (v27 || v12) || v3;
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)charging
{
  return self->_charging;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSString)accessoryCategory
{
  return self->_accessoryCategory;
}

- (int64_t)adapterSourceID
{
  return self->_adapterSourceID;
}

- (int64_t)adapterFamilyCode
{
  return self->_adapterFamilyCode;
}

- (BOOL)present
{
  return self->_present;
}

- (unsigned)changes
{
  return self->_changes;
}

- (BOOL)added
{
  return self->_added;
}

- (unsigned)updateWithPowerAdapterDetails:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_ioKitAdapterDescription, a3);
  if ((int)CFDictionaryGetInt64Ranged() == self->_adapterFamilyCode)
  {
    unsigned int v6 = 0;
  }
  else
  {
    -[SFPowerSource setAdapterFamilyCode:](self, "setAdapterFamilyCode:");
    unsigned int v6 = 256;
  }
  CFStringGetTypeID();
  v7 = CFDictionaryGetTypedValue();
  adapterName = self->_adapterName;
  char v9 = v7;
  int64_t v10 = adapterName;
  if (v9 == v10)
  {

    goto LABEL_11;
  }
  int64_t v11 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

    goto LABEL_10;
  }
  char v12 = [(NSString *)v9 isEqual:v10];

  if ((v12 & 1) == 0)
  {
LABEL_10:
    [(SFPowerSource *)self setAdapterName:v9];
    unsigned int v6 = 256;
  }
LABEL_11:
  uint64_t Int64 = CFDictionaryGetInt64();
  if (self->_adapterSharedSource != (Int64 != 0))
  {
    [(SFPowerSource *)self setAdapterSharedSource:Int64 != 0];
    unsigned int v6 = 256;
  }
  if ((int)CFDictionaryGetInt64Ranged() != self->_adapterSourceID)
  {
    -[SFPowerSource setAdapterSourceID:](self, "setAdapterSourceID:");
    unsigned int v6 = 256;
  }
  if ((int)CFDictionaryGetInt64Ranged() != self->_adapterErrorFlags)
  {
    -[SFPowerSource setAdapterErrorFlags:](self, "setAdapterErrorFlags:");
    v6 |= 0x100u;
  }
  [(SFPowerSource *)self startLowPowerMonitoringIfAppropriate];

  return v6;
}

- (void)startLowPowerMonitoringIfAppropriate
{
  if ([(SFPowerSource *)self isInternal] && self->_lowPowerMonitoringToken == -1)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __53__SFPowerSource_startLowPowerMonitoringIfAppropriate__block_invoke;
    handler[3] = &unk_1E5BBE120;
    handler[4] = self;
    if (!notify_register_dispatch("com.apple.system.batterysavermode", &self->_lowPowerMonitoringToken, MEMORY[0x1E4F14428], handler))[(SFPowerSource *)self lowPowerModeChanged:self->_lowPowerMonitoringToken]; {
  }
    }
}

- (BOOL)isInternal
{
  v2 = [(SFPowerSource *)self type];
  BOOL v3 = v2;
  if (v2 == @"InternalBattery")
  {
    char v4 = 1;
  }
  else if (v2)
  {
    char v4 = [(__CFString *)v2 isEqual:@"InternalBattery"];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (NSString)type
{
  return self->_type;
}

- (unsigned)updateWithPowerSourceDescription:(id)a3
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_ioKitDescription, a3);
  self->_present = 1;
  CFStringGetTypeID();
  unsigned int v6 = CFDictionaryGetTypedValue();
  v7 = v6;
  if (!v6) {
    goto LABEL_7;
  }
  accessoryCategory = self->_accessoryCategory;
  char v9 = v6;
  int64_t v10 = accessoryCategory;
  if (v9 == v10)
  {

    goto LABEL_7;
  }
  int64_t v11 = v10;
  if (v10)
  {
    char v12 = [(NSString *)v9 isEqual:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    unsigned int v13 = 0;
    goto LABEL_10;
  }

LABEL_9:
  [(SFPowerSource *)self setAccessoryCategory:v9];
  unsigned int v13 = 1;
LABEL_10:
  CFStringGetTypeID();
  uint64_t v14 = CFDictionaryGetTypedValue();

  if (!v14) {
    goto LABEL_18;
  }
  accessoryID = self->_accessoryID;
  v16 = v14;
  id v17 = accessoryID;
  if (v16 == v17)
  {

    goto LABEL_18;
  }
  int v18 = v17;
  if (!v17)
  {

    goto LABEL_17;
  }
  char v19 = [(NSString *)v16 isEqual:v17];

  if ((v19 & 1) == 0)
  {
LABEL_17:
    [(SFPowerSource *)self setAccessoryID:v16];
    unsigned int v13 = 1;
  }
LABEL_18:
  CFDataGetTypeID();
  v20 = CFDictionaryGetTypedValue();
  int v21 = v20;
  if (!v20) {
    goto LABEL_26;
  }
  batteryCaseAddress = self->_batteryCaseAddress;
  id v23 = v20;
  v24 = batteryCaseAddress;
  if (v23 == v24)
  {

    goto LABEL_26;
  }
  id v25 = v24;
  if (!v24)
  {

    goto LABEL_25;
  }
  char v26 = [(NSData *)v23 isEqual:v24];

  if ((v26 & 1) == 0)
  {
LABEL_25:
    [(SFPowerSource *)self setBatteryCaseAddress:v23];
    unsigned int v13 = 1;
  }
LABEL_26:
  uint64_t Int64 = CFDictionaryGetInt64();
  uint64_t v28 = CFDictionaryGetInt64();
  if (self->_charging != ((Int64 | v28) != 0))
  {
    -[SFPowerSource setCharging:](self, "setCharging:");
    v13 |= 4u;
  }
  if (self->_showChargingUI != (v28 != 0))
  {
    [(SFPowerSource *)self setShowChargingUI:v28 != 0];
    v13 |= 4u;
  }
  CFDictionaryGetDouble();
  double v30 = v29;
  CFDictionaryGetDouble();
  double v32 = v31;
  double v33 = v30 * 100.0 / v31 / 100.0;
  if (v33 > 1.0) {
    double v33 = 1.0;
  }
  if (v33 < 0.0) {
    double v33 = 0.0;
  }
  if (v33 != self->_chargeLevel)
  {
    -[SFPowerSource setChargeLevel:](self, "setChargeLevel:");
    v13 |= 2u;
  }
  if ((int)CFDictionaryGetInt64Ranged() != self->_color)
  {
    -[SFPowerSource setColor:](self, "setColor:");
    v13 |= 1u;
  }
  CFStringGetTypeID();
  id v34 = CFDictionaryGetTypedValue();

  if (v34)
  {
    groupID = self->_groupID;
    v36 = v34;
    id v37 = groupID;
    if (v36 == v37)
    {

      goto LABEL_46;
    }
    id v38 = v37;
    if (v37)
    {
      char v39 = [(NSString *)v36 isEqual:v37];

      if (v39) {
        goto LABEL_46;
      }
    }
    else
    {
    }
    [(SFPowerSource *)self setGroupID:v36];
    v13 |= 1u;
  }
LABEL_46:
  if ((int)CFDictionaryGetInt64Ranged() != self->_familyCode)
  {
    -[SFPowerSource setFamilyCode:](self, "setFamilyCode:");
    v13 |= 1u;
  }
  CFArrayGetTypeID();
  id v40 = CFDictionaryGetTypedValue();
  if ([v40 count])
  {
    LEDs = self->_LEDs;
    id v42 = v40;
    id v43 = LEDs;
    if (v42 == v43)
    {
    }
    else
    {
      id v44 = v43;
      if ((v42 == 0) != (v43 != 0))
      {
        char v45 = [(NSArray *)v42 isEqual:v43];

        if (v45) {
          goto LABEL_88;
        }
      }
      else
      {
      }
      v123 = v34;
      v124 = v40;
      v125 = v21;
      unsigned int v126 = v13;
      v127 = self;
      id v128 = v5;
      id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v129 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      id v47 = v42;
      uint64_t v48 = [(NSArray *)v47 countByEnumeratingWithState:&v129 objects:v133 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v130;
        do
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v130 != v50) {
              objc_enumerationMutation(v47);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v52 = objc_alloc_init(SFPowerSourceLEDInfo);
              CFStringGetTypeID();
              int64_t v53 = (const char *)[ (id) CFDictionaryGetTypedValue() UTF8String];
              if (v53)
              {
                double v54 = v53;
                if (!strcmp(v53, "Green"))
                {
                  uint64_t v55 = 1;
                }
                else if (!strcmp(v54, "Orange"))
                {
                  uint64_t v55 = 2;
                }
                else if (!strcmp(v54, "White"))
                {
                  uint64_t v55 = 3;
                }
                else
                {
                  uint64_t v55 = 4 * (strcmp(v54, "Red") == 0);
                }
                -[SFPowerSourceLEDInfo setLEDColor:](v52, "setLEDColor:", v55, v123, v124);
              }
              CFStringGetTypeID();
              id v56 = (const char *)[ (id) CFDictionaryGetTypedValue() UTF8String];
              if (v56)
              {
                v57 = v56;
                if (!strcmp(v56, "Off"))
                {
                  uint64_t v58 = 0;
                }
                else if (!strcmp(v57, "Solid"))
                {
                  uint64_t v58 = 1;
                }
                else
                {
                  uint64_t v58 = 2 * (strcmp(v57, "Blinking") == 0);
                }
                -[SFPowerSourceLEDInfo setLEDState:](v52, "setLEDState:", v58, v123, v124);
              }
              objc_msgSend(v46, "addObject:", v52, v123, v124);
            }
          }
          uint64_t v49 = [(NSArray *)v47 countByEnumeratingWithState:&v129 objects:v133 count:16];
        }
        while (v49);
      }

      self = v127;
      id v59 = v127->_LEDs;
      id v60 = (NSArray *)v46;
      id v42 = v60;
      if (v59 == v60)
      {

        id v5 = v128;
        unsigned int v13 = v126;
        id v40 = v124;
        int v21 = v125;
        id v34 = v123;
      }
      else
      {
        unsigned int v13 = v126;
        id v34 = v123;
        id v40 = v124;
        if ((v60 != 0) != (v59 == 0))
        {
          char v61 = [(NSArray *)v59 isEqual:v60];

          id v5 = v128;
          int v21 = v125;
          if (v61) {
            goto LABEL_87;
          }
        }
        else
        {

          id v5 = v128;
          int v21 = v125;
        }
        id v62 = (void *)[(NSArray *)v42 copy];
        [(SFPowerSource *)v127 setLEDs:v62];

        unsigned int v13 = v126 | 1;
      }
    }
LABEL_87:
  }
LABEL_88:
  uint64_t v63 = CFDictionaryGetInt64();
  if (self->_lowPowerModeEnabled != (v63 != 0))
  {
    [(SFPowerSource *)self setLowPowerModeEnabled:v63 != 0];
    v13 |= 4u;
  }
  CFDictionaryGetDouble();
  if ((double)(int)v64 / 100.0 != self->_lowWarnLevel)
  {
    -[SFPowerSource setLowWarnLevel:](self, "setLowWarnLevel:");
    v13 |= 1u;
  }
  if (v32 != self->_maxCapacity)
  {
    [(SFPowerSource *)self setMaxCapacity:v32];
    v13 |= 4u;
  }
  CFStringGetTypeID();
  v65 = CFDictionaryGetTypedValue();

  if (v65)
  {
    name = self->_name;
    v67 = v65;
    v68 = name;
    if (v67 == v68)
    {

      goto LABEL_102;
    }
    v69 = v68;
    if (v68)
    {
      char v70 = [(NSString *)v67 isEqual:v68];

      if (v70) {
        goto LABEL_102;
      }
    }
    else
    {
    }
    -[SFPowerSource setName:](self, "setName:", v67, v123, v124);
    v13 |= 1u;
  }
LABEL_102:
  CFStringGetTypeID();
  v71 = CFDictionaryGetTypedValue();

  if (!v71) {
    goto LABEL_110;
  }
  partID = self->_partID;
  v73 = v71;
  v74 = partID;
  if (v73 == v74)
  {

    goto LABEL_110;
  }
  v75 = v74;
  if (!v74)
  {

    goto LABEL_109;
  }
  char v76 = [(NSString *)v73 isEqual:v74];

  if ((v76 & 1) == 0)
  {
LABEL_109:
    -[SFPowerSource setPartID:](self, "setPartID:", v73, v123, v124);
    v13 |= 1u;
  }
LABEL_110:
  CFStringGetTypeID();
  v77 = CFDictionaryGetTypedValue();

  if (!v77) {
    goto LABEL_118;
  }
  partName = self->_partName;
  v79 = v77;
  v80 = partName;
  if (v79 == v80)
  {

    goto LABEL_118;
  }
  v81 = v80;
  if (!v80)
  {

    goto LABEL_117;
  }
  char v82 = [(NSString *)v79 isEqual:v80];

  if ((v82 & 1) == 0)
  {
LABEL_117:
    -[SFPowerSource setPartName:](self, "setPartName:", v79, v123, v124);
    v13 |= 1u;
  }
LABEL_118:
  CFStringGetTypeID();
  v83 = CFDictionaryGetTypedValue();

  v84 = v83;
  v85 = v84;
  if (v84 == @"Off Line")
  {
LABEL_121:
    int v87 = 1;
    goto LABEL_130;
  }
  if (!v84) {
    goto LABEL_129;
  }
  char v86 = [(__CFString *)v84 isEqual:@"Off Line"];

  if (v86) {
    goto LABEL_121;
  }
  v88 = v85;
  if (v88 == @"AC Power"
    || (v89 = v88, char v90 = [(__CFString *)v88 isEqual:@"AC Power"], v89, (v90 & 1) != 0)
    || (v91 = v89, v91 == @"UPS Power")
    || (v92 = v91, int v93 = [(__CFString *)v91 isEqual:@"UPS Power"], v92, v93))
  {
    if (CFDictionaryGetInt64() || CFDictionaryGetInt64()) {
      int v87 = 4;
    }
    else {
      int v87 = 3;
    }
  }
  else
  {
LABEL_129:
    int v87 = 2;
  }
LABEL_130:
  if (v87 != self->_powerState)
  {
    -[SFPowerSource setPowerState:](self, "setPowerState:");
    v13 |= 4u;
  }
  if ((int)CFDictionaryGetInt64Ranged() != self->_productID)
  {
    -[SFPowerSource setProductID:](self, "setProductID:");
    v13 |= 1u;
  }
  CFStringGetTypeID();
  v94 = CFDictionaryGetTypedValue();

  if (v94)
  {
    state = self->_state;
    v96 = v94;
    v97 = state;
    if (v96 == v97)
    {

      goto LABEL_142;
    }
    v98 = v97;
    if (v97)
    {
      char v99 = [(NSString *)v96 isEqual:v97];

      if (v99) {
        goto LABEL_142;
      }
    }
    else
    {
    }
    -[SFPowerSource setState:](self, "setState:", v96, v123, v124);
    v13 |= 4u;
  }
LABEL_142:
  if ((int)CFDictionaryGetInt64Ranged() != self->_temperature)
  {
    -[SFPowerSource setTemperature:](self, "setTemperature:");
    v13 |= 1u;
  }
  CFStringGetTypeID();
  v100 = CFDictionaryGetTypedValue();

  if (v100)
  {
    transportType = self->_transportType;
    v102 = v100;
    v103 = transportType;
    if (v102 == v103)
    {

      goto LABEL_152;
    }
    v104 = v103;
    if (v103)
    {
      char v105 = [(NSString *)v102 isEqual:v103];

      if (v105) {
        goto LABEL_152;
      }
    }
    else
    {
    }
    -[SFPowerSource setTransportType:](self, "setTransportType:", v102, v123, v124);
    v13 |= 1u;
  }
LABEL_152:
  CFStringGetTypeID();
  v106 = CFDictionaryGetTypedValue();

  if (!v106) {
    goto LABEL_160;
  }
  type = self->_type;
  v108 = v106;
  v109 = type;
  if (v108 == v109)
  {

    goto LABEL_160;
  }
  v110 = v109;
  if (!v109)
  {

    goto LABEL_159;
  }
  char v111 = [(NSString *)v108 isEqual:v109];

  if ((v111 & 1) == 0)
  {
LABEL_159:
    -[SFPowerSource setType:](self, "setType:", v108, v123, v124);
    v13 |= 1u;
  }
LABEL_160:
  if ((int)CFDictionaryGetInt64Ranged() != self->_vendorID)
  {
    -[SFPowerSource setVendorID:](self, "setVendorID:");
    v13 |= 1u;
  }
  v112 = self->_type;
  if (v112 == @"Accessory Source"
    || (v113 = v112) != 0
    && (int v114 = [(__CFString *)v112 isEqual:@"Accessory Source"], v113, v114))
  {
    CFDictionaryGetTypeID();
    v115 = CFDictionaryGetTypedValue();
    v116 = v115;
    if (v115)
    {
      ioKitAdapterDescription = self->_ioKitAdapterDescription;
      v118 = v115;
      v119 = ioKitAdapterDescription;
      if (v118 == v119)
      {
      }
      else
      {
        v120 = v119;
        if (v119)
        {
          char v121 = [(NSDictionary *)v118 isEqual:v119];

          if (v121) {
            goto LABEL_173;
          }
        }
        else
        {
        }
        v13 |= -[SFPowerSource updateWithPowerAdapterDetails:](self, "updateWithPowerAdapterDetails:", v118, v123, v124);
      }
    }
LABEL_173:
  }
  [(SFPowerSource *)self startLowPowerMonitoringIfAppropriate];

  return v13;
}

- (void)setChanges:(unsigned int)a3
{
  self->_changes = a3;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (void)setAdded:(BOOL)a3
{
  self->_added = a3;
}

- (int64_t)temperature
{
  return self->_temperature;
}

- (void)setChargeLevel:(double)a3
{
  self->_double chargeLevel = a3;
}

- (double)maxCapacity
{
  return self->_maxCapacity;
}

- (id)detailedDescription
{
  v2 = NSPrintF();

  return v2;
}

- (double)chargeLevel
{
  return self->_chargeLevel;
}

- (BOOL)adapterSharedSource
{
  return self->_adapterSharedSource;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPowerSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFPowerSource;
  v2 = [(SFPowerSource *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_lowPowerMonitoringToken = -1;
    v2->_int64_t color = -1;
    char v4 = v2;
  }

  return v3;
}

- (SFPowerSource)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SFPowerSource *)self init];
  objc_super v6 = v5;
  if (v5)
  {
    [(SFPowerSource *)v5 _updateWithCoder:v4];
    v7 = v6;
  }

  return v6;
}

- (void)_updateWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  NSDecodeObjectIfPresent();
  [(SFPowerSource *)self setAccessoryCategory:0];
  id v5 = v4;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  [(SFPowerSource *)self setAccessoryID:0];
  id v6 = v5;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  [(SFPowerSource *)self setBatteryCaseAddress:0];
  id v7 = v6;
  uint64_t v8 = 0;
  if ([v7 containsValueForKey:@"adapterErrorFlag"]) {
    uint64_t v8 = [v7 decodeIntegerForKey:@"adapterErrorFlag"];
  }

  [(SFPowerSource *)self setAdapterErrorFlags:v8];
  id v9 = v7;
  if ([v9 containsValueForKey:@"adapterFamilyCode"]) {
    uint64_t v10 = [v9 decodeIntegerForKey:@"adapterFamilyCode"];
  }
  else {
    uint64_t v10 = 0;
  }

  [(SFPowerSource *)self setAdapterFamilyCode:v10];
  id v11 = v9;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  [(SFPowerSource *)self setAdapterName:0];
  id v12 = v11;
  if ([v12 containsValueForKey:@"adapterSharedSource"]) {
    uint64_t v13 = [v12 decodeBoolForKey:@"adapterSharedSource"];
  }
  else {
    uint64_t v13 = 0;
  }

  [(SFPowerSource *)self setAdapterSharedSource:v13];
  id v14 = v12;
  if ([v14 containsValueForKey:@"adapterSourceID"]) {
    uint64_t v15 = [v14 decodeIntegerForKey:@"adapterSourceID"];
  }
  else {
    uint64_t v15 = 0;
  }

  [(SFPowerSource *)self setAdapterSourceID:v15];
  id v16 = v14;
  if ([v16 containsValueForKey:@"charging"]) {
    uint64_t v17 = [v16 decodeBoolForKey:@"charging"];
  }
  else {
    uint64_t v17 = 0;
  }

  [(SFPowerSource *)self setCharging:v17];
  id v18 = v16;
  double v19 = 0.0;
  if ([v18 containsValueForKey:@"chargeLevel"])
  {
    [v18 decodeDoubleForKey:@"chargeLevel"];
    double v19 = v20;
  }

  [(SFPowerSource *)self setChargeLevel:v19];
  id v21 = v18;
  if ([v21 containsValueForKey:@"color"]) {
    uint64_t v22 = [v21 decodeIntegerForKey:@"color"];
  }
  else {
    uint64_t v22 = -1;
  }

  [(SFPowerSource *)self setColor:v22];
  id v23 = v21;
  if ([v23 containsValueForKey:@"familyCode"]) {
    uint64_t v24 = [v23 decodeIntegerForKey:@"familyCode"];
  }
  else {
    uint64_t v24 = 0;
  }

  [(SFPowerSource *)self setFamilyCode:v24];
  id v25 = v23;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  [(SFPowerSource *)self setGroupID:0];
  objc_opt_class();
  NSDecodeNSArrayOfClassIfPresent();
  [(SFPowerSource *)self setLEDs:0];
  id v26 = v25;
  double v27 = 0.0;
  double v28 = 0.0;
  if ([v26 containsValueForKey:@"lowWarnLevel"])
  {
    [v26 decodeDoubleForKey:@"lowWarnLevel"];
    double v28 = v29;
  }

  [(SFPowerSource *)self setLowWarnLevel:v28];
  id v30 = v26;
  if ([v30 containsValueForKey:@"maxCapacity"])
  {
    [v30 decodeDoubleForKey:@"maxCapacity"];
    double v27 = v31;
  }

  [(SFPowerSource *)self setMaxCapacity:v27];
  id v32 = v30;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  [(SFPowerSource *)self setName:0];
  id v33 = v32;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  [(SFPowerSource *)self setPartID:0];
  id v34 = v33;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  [(SFPowerSource *)self setPartName:0];
  NSDecodeSInt64RangedIfPresent();
  [(SFPowerSource *)self setPowerState:0];
  id v35 = v34;
  uint64_t v36 = 0;
  if ([v35 containsValueForKey:@"productID"]) {
    uint64_t v36 = [v35 decodeIntegerForKey:@"productID"];
  }

  [(SFPowerSource *)self setProductID:v36];
  NSDecodeSInt64RangedIfPresent();
  [(SFPowerSource *)self setRole:0];
  id v37 = v35;
  uint64_t v38 = 0;
  if ([v37 containsValueForKey:@"sourceID"]) {
    uint64_t v38 = [v37 decodeIntegerForKey:@"sourceID"];
  }

  [(SFPowerSource *)self setSourceID:v38];
  id v39 = v37;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  [(SFPowerSource *)self setState:0];
  id v40 = v39;
  uint64_t v41 = 0;
  if ([v40 containsValueForKey:@"temperature"]) {
    uint64_t v41 = [v40 decodeIntegerForKey:@"temperature"];
  }

  [(SFPowerSource *)self setTemperature:v41];
  id v42 = v40;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  [(SFPowerSource *)self setTransportType:0];
  id v43 = v42;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  [(SFPowerSource *)self setType:0];
  id v44 = v43;
  uint64_t v45 = 0;
  if ([v44 containsValueForKey:@"vendorID"]) {
    uint64_t v45 = [v44 decodeIntegerForKey:@"vendorID"];
  }

  [(SFPowerSource *)self setVendorID:v45];
  ioKitDescription = self->_ioKitDescription;
  self->_ioKitDescription = 0;

  id v47 = v44;
  objc_opt_class();
  NSDecodeStandardContainerIfPresent();

  self->_present = 0;
  id v48 = v47;
  if ([v48 containsValueForKey:@"present"]) {
    self->_present = [v48 decodeBoolForKey:@"present"];
  }

  [(SFPowerSource *)self startLowPowerMonitoringIfAppropriate];
}

- (void)encodeWithCoder:(id)a3
{
  id v28 = a3;
  accessoryCategory = self->_accessoryCategory;
  if (accessoryCategory) {
    [v28 encodeObject:accessoryCategory forKey:@"accessoryCategory"];
  }
  accessoryID = self->_accessoryID;
  if (accessoryID) {
    [v28 encodeObject:accessoryID forKey:@"accessoryID"];
  }
  int64_t adapterErrorFlags = self->_adapterErrorFlags;
  if (adapterErrorFlags) {
    [v28 encodeInteger:adapterErrorFlags forKey:@"adapterErrorFlag"];
  }
  int64_t adapterFamilyCode = self->_adapterFamilyCode;
  if (adapterFamilyCode) {
    [v28 encodeInteger:adapterFamilyCode forKey:@"adapterFamilyCode"];
  }
  adapterName = self->_adapterName;
  if (adapterName) {
    [v28 encodeObject:adapterName forKey:@"adapterName"];
  }
  if (self->_adapterSharedSource) {
    [v28 encodeBool:1 forKey:@"adapterSharedSource"];
  }
  int64_t adapterSourceID = self->_adapterSourceID;
  if (adapterSourceID) {
    [v28 encodeInteger:adapterSourceID forKey:@"adapterSourceID"];
  }
  batteryCaseAddress = self->_batteryCaseAddress;
  if (batteryCaseAddress) {
    [v28 encodeObject:batteryCaseAddress forKey:@"batteryCaseAddress"];
  }
  if (self->_charging) {
    [v28 encodeBool:1 forKey:@"charging"];
  }
  if (self->_chargeLevel > 0.0) {
    objc_msgSend(v28, "encodeDouble:forKey:", @"chargeLevel");
  }
  int64_t color = self->_color;
  if (color != -1) {
    [v28 encodeInteger:color forKey:@"color"];
  }
  int64_t familyCode = self->_familyCode;
  if (familyCode) {
    [v28 encodeInteger:familyCode forKey:@"familyCode"];
  }
  groupID = self->_groupID;
  if (groupID) {
    [v28 encodeObject:groupID forKey:@"groupID"];
  }
  if ([(NSArray *)self->_LEDs count]) {
    [v28 encodeObject:self->_LEDs forKey:@"LEDs"];
  }
  if (self->_lowPowerModeEnabled) {
    [v28 encodeBool:1 forKey:@"lowPowerMode"];
  }
  id v14 = v28;
  if (self->_lowWarnLevel > 0.0)
  {
    objc_msgSend(v28, "encodeDouble:forKey:", @"lowWarnLevel");
    id v14 = v28;
  }
  if (self->_maxCapacity > 0.0)
  {
    objc_msgSend(v28, "encodeDouble:forKey:", @"maxCapacity");
    id v14 = v28;
  }
  name = self->_name;
  if (name)
  {
    [v28 encodeObject:name forKey:@"name"];
    id v14 = v28;
  }
  partID = self->_partID;
  if (partID)
  {
    [v28 encodeObject:partID forKey:@"partID"];
    id v14 = v28;
  }
  partName = self->_partName;
  if (partName)
  {
    [v28 encodeObject:partName forKey:@"partName"];
    id v14 = v28;
  }
  uint64_t powerState = self->_powerState;
  if (powerState)
  {
    [v28 encodeInteger:powerState forKey:@"powerState"];
    id v14 = v28;
  }
  int64_t productID = self->_productID;
  if (productID)
  {
    [v28 encodeInteger:productID forKey:@"productID"];
    id v14 = v28;
  }
  uint64_t role = self->_role;
  if (role)
  {
    [v28 encodeInteger:role forKey:@"role"];
    id v14 = v28;
  }
  int64_t sourceID = self->_sourceID;
  if (sourceID)
  {
    [v28 encodeInteger:sourceID forKey:@"sourceID"];
    id v14 = v28;
  }
  state = self->_state;
  if (state)
  {
    [v28 encodeObject:state forKey:@"state"];
    id v14 = v28;
  }
  int64_t temperature = self->_temperature;
  if (temperature)
  {
    [v28 encodeInteger:temperature forKey:@"temperature"];
    id v14 = v28;
  }
  transportType = self->_transportType;
  if (transportType)
  {
    [v28 encodeObject:transportType forKey:@"transportType"];
    id v14 = v28;
  }
  type = self->_type;
  if (type)
  {
    [v28 encodeObject:type forKey:@"type"];
    id v14 = v28;
  }
  int64_t vendorID = self->_vendorID;
  if (vendorID)
  {
    [v28 encodeInteger:vendorID forKey:@"vendorID"];
    id v14 = v28;
  }
  ioKitDescription = self->_ioKitDescription;
  if (ioKitDescription)
  {
    [v28 encodeObject:ioKitDescription forKey:@"ioKitDictionary"];
    id v14 = v28;
  }
  if (self->_present)
  {
    [v28 encodeBool:1 forKey:@"present"];
    id v14 = v28;
  }
}

- (void)dealloc
{
  [(SFPowerSource *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SFPowerSource;
  [(SFPowerSource *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t sourceID = self->_sourceID;
    if (sourceID == [v4 sourceID])
    {
      accessoryID = self->_accessoryID;
      id v7 = [v4 accessoryID];
      p_isa = accessoryID;
      id v9 = v7;
      uint64_t v10 = v9;
      if (p_isa == (NSString *)v9)
      {
      }
      else
      {
        if ((p_isa == 0) == (v9 != 0))
        {
          char v12 = 0;
          uint64_t v15 = v9;
LABEL_37:

          goto LABEL_38;
        }
        int v11 = [(NSString *)p_isa isEqual:v9];

        if (!v11)
        {
          char v12 = 0;
LABEL_39:

          goto LABEL_40;
        }
      }
      batteryCaseAddress = self->_batteryCaseAddress;
      id v14 = [v4 batteryCaseAddress];
      uint64_t v15 = batteryCaseAddress;
      id v16 = v14;
      p_isa = (NSString *)&v16->super.isa;
      if (v15 == v16)
      {
      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          char v12 = 0;
          double v20 = (NSString *)&v16->super.isa;
LABEL_36:

          goto LABEL_37;
        }
        int v17 = [(NSData *)v15 isEqual:v16];

        if (!v17)
        {
          char v12 = 0;
LABEL_38:

          goto LABEL_39;
        }
      }
      groupID = self->_groupID;
      double v19 = [v4 groupID];
      double v20 = groupID;
      id v21 = v19;
      uint64_t v15 = v21;
      if (v20 == (NSString *)v21)
      {
      }
      else
      {
        if ((v20 == 0) == (v21 != 0))
        {
          char v12 = 0;
          id v25 = (NSString *)&v21->super.isa;
LABEL_35:

          goto LABEL_36;
        }
        int v22 = [(NSString *)v20 isEqual:v21];

        if (!v22)
        {
          char v12 = 0;
          goto LABEL_37;
        }
      }
      accessoryCategory = self->_accessoryCategory;
      uint64_t v24 = [v4 accessoryCategory];
      id v25 = accessoryCategory;
      id v26 = v24;
      double v20 = v26;
      if (v25 == v26)
      {
      }
      else
      {
        if ((v25 == 0) == (v26 != 0))
        {
          char v12 = 0;
          id v30 = v26;
LABEL_34:

          goto LABEL_35;
        }
        int v27 = [(NSString *)v25 isEqual:v26];

        if (!v27)
        {
          char v12 = 0;
          goto LABEL_36;
        }
      }
      partID = self->_partID;
      double v29 = [v4 partID];
      id v30 = partID;
      double v31 = v29;
      id v25 = v31;
      if (v30 == v31)
      {
        char v12 = 1;
      }
      else if ((v30 == 0) == (v31 != 0))
      {
        char v12 = 0;
      }
      else
      {
        char v12 = [(NSString *)v30 isEqual:v31];
      }

      goto LABEL_34;
    }
  }
  char v12 = 0;
LABEL_40:

  return v12;
}

- (unint64_t)hash
{
  int64_t sourceID = self->_sourceID;
  NSUInteger v4 = [(NSString *)self->_accessoryID hash] ^ sourceID;
  uint64_t v5 = [(NSData *)self->_batteryCaseAddress hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_groupID hash];
  NSUInteger v7 = [(NSString *)self->_accessoryCategory hash];
  return v6 ^ v7 ^ [(NSString *)self->_partID hash];
}

- (int)publish
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v57 = v2;
  if (v2->_psID || (int v54 = IOPSCreatePowerSource()) == 0)
  {
    id v56 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    accessoryCategory = v2->_accessoryCategory;
    if (accessoryCategory) {
      [(NSDictionary *)v56 setObject:accessoryCategory forKeyedSubscript:@"Accessory Category"];
    }
    accessoryID = v2->_accessoryID;
    if (accessoryID) {
      [(NSDictionary *)v56 setObject:accessoryID forKeyedSubscript:@"Accessory Identifier"];
    }
    batteryCaseAddress = v2->_batteryCaseAddress;
    if (batteryCaseAddress) {
      [(NSDictionary *)v56 setObject:batteryCaseAddress forKeyedSubscript:@"Address"];
    }
    NSUInteger v6 = objc_msgSend(NSNumber, "numberWithBool:", v2->_charging, &v2->_psID);
    [(NSDictionary *)v56 setObject:v6 forKeyedSubscript:@"Is Charging"];

    NSUInteger v7 = [NSNumber numberWithInt:fabs(v2->_chargeLevel + -1.0) < 0.00000011920929];
    [(NSDictionary *)v56 setObject:v7 forKeyedSubscript:@"Is Charged"];

    uint64_t v8 = [NSNumber numberWithInt:(int)(v2->_chargeLevel * 100.0)];
    [(NSDictionary *)v56 setObject:v8 forKeyedSubscript:@"Current Capacity"];

    if (v2->_color != -1)
    {
      id v9 = objc_msgSend(NSNumber, "numberWithInteger:");
      [(NSDictionary *)v56 setObject:v9 forKeyedSubscript:@"Device Color"];
    }
    groupID = v2->_groupID;
    if (groupID) {
      [(NSDictionary *)v56 setObject:groupID forKeyedSubscript:@"Group Identifier"];
    }
    if ([(NSArray *)v2->_LEDs count])
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      obj = v2->_LEDs;
      uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v60 != v13) {
              objc_enumerationMutation(obj);
            }
            uint64_t v15 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            id v16 = NSString;
            unsigned int v17 = [v15 LEDState];
            id v18 = "?";
            if (v17 <= 2) {
              id v18 = off_1E5BBEEF8[v17];
            }
            double v19 = [v16 stringWithUTF8String:v18];
            double v20 = NSString;
            unsigned int v21 = [v15 LEDColor];
            int v22 = "?";
            if (v21 <= 4) {
              int v22 = off_1E5BBEF10[v21];
            }
            id v23 = [v20 stringWithUTF8String:v22];
            v63[0] = @"State";
            v63[1] = @"Color";
            v64[0] = v19;
            v64[1] = v23;
            uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];
            [v11 addObject:v24];
          }
          uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v59 objects:v65 count:16];
        }
        while (v12);
      }

      [(NSDictionary *)v56 setObject:v11 forKeyedSubscript:@"LEDs"];
    }
    id v25 = [NSNumber numberWithBool:v2->_lowPowerModeEnabled];
    [(NSDictionary *)v56 setObject:v25 forKeyedSubscript:@"LPM Active"];

    double lowWarnLevel = v2->_lowWarnLevel;
    if (lowWarnLevel > 0.0)
    {
      int v27 = [NSNumber numberWithInt:(int)(lowWarnLevel * 100.0)];
      [(NSDictionary *)v56 setObject:v27 forKeyedSubscript:@"Low Warn Level"];
    }
    id v28 = [NSNumber numberWithDouble:v2->_maxCapacity];
    [(NSDictionary *)v56 setObject:v28 forKeyedSubscript:@"Max Capacity"];

    name = v2->_name;
    if (name) {
      [(NSDictionary *)v56 setObject:name forKeyedSubscript:@"Name"];
    }
    partID = v2->_partID;
    if (partID) {
      [(NSDictionary *)v56 setObject:partID forKeyedSubscript:@"Part Identifier"];
    }
    partName = v2->_partName;
    if (partName) {
      [(NSDictionary *)v56 setObject:partName forKeyedSubscript:@"Part Name"];
    }
    if (v2->_productID)
    {
      id v32 = objc_msgSend(NSNumber, "numberWithInteger:");
      [(NSDictionary *)v56 setObject:v32 forKeyedSubscript:@"Product ID"];
    }
    state = v2->_state;
    if (state) {
      [(NSDictionary *)v56 setObject:state forKeyedSubscript:@"Power Source State"];
    }
    id v34 = [NSNumber numberWithInteger:v2->_temperature];
    [(NSDictionary *)v56 setObject:v34 forKeyedSubscript:@"Temperature"];

    transportType = v2->_transportType;
    if (transportType) {
      [(NSDictionary *)v56 setObject:transportType forKeyedSubscript:@"Transport Type"];
    }
    type = v2->_type;
    if (type) {
      [(NSDictionary *)v56 setObject:type forKeyedSubscript:@"Type"];
    }
    if (v2->_vendorID)
    {
      id v37 = objc_msgSend(NSNumber, "numberWithInteger:");
      [(NSDictionary *)v56 setObject:v37 forKeyedSubscript:@"Vendor ID"];
    }
    uint64_t v38 = v2->_type;
    if (v38 == @"Accessory Source"
      || (id v39 = v38) != 0
      && (int v40 = [(__CFString *)v38 isEqual:@"Accessory Source"], v39, v40))
    {
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (v2->_adapterErrorFlags)
      {
        id v42 = objc_msgSend(NSNumber, "numberWithInteger:");
        [v41 setObject:v42 forKeyedSubscript:@"ErrorFlags"];
      }
      if (v2->_adapterFamilyCode)
      {
        id v43 = objc_msgSend(NSNumber, "numberWithInteger:");
        [v41 setObject:v43 forKeyedSubscript:@"FamilyCode"];
      }
      adapterName = v2->_adapterName;
      if (adapterName) {
        [v41 setObject:adapterName forKeyedSubscript:@"Name"];
      }
      uint64_t v45 = [NSNumber numberWithBool:v2->_adapterSharedSource];
      [v41 setObject:v45 forKeyedSubscript:@"SharedSource"];

      if (v2->_adapterSourceID)
      {
        id v46 = objc_msgSend(NSNumber, "numberWithInteger:");
        [v41 setObject:v46 forKeyedSubscript:@"Source"];
      }
      [(NSDictionary *)v56 setObject:v41 forKeyedSubscript:@"AdapterDetails"];
    }
    id v47 = v56;
    if (!v56) {
      goto LABEL_65;
    }
    p_ioKitDescription = (id *)&v2->_ioKitDescription;
    ioKitDescription = v2->_ioKitDescription;
    uint64_t v50 = v56;
    v51 = ioKitDescription;
    if (v50 == v51)
    {

      id v47 = v56;
    }
    else
    {
      v52 = v51;
      if (v51)
      {
        char v53 = [(NSDictionary *)v50 isEqual:v51];

        id v47 = v56;
        if (v53) {
          goto LABEL_65;
        }
      }
      else
      {

        id v47 = v56;
      }
      objc_storeStrong(p_ioKitDescription, v47);
      int v54 = IOPSSetPowerSourceDetails();
      id v47 = v56;
      if (v54) {
        goto LABEL_66;
      }
    }
LABEL_65:
    int v54 = 0;
    uint64_t v50 = v47;
    goto LABEL_66;
  }
  uint64_t v50 = 0;
LABEL_66:

  objc_sync_exit(v57);
  return v54;
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  int lowPowerMonitoringToken = obj->_lowPowerMonitoringToken;
  if (lowPowerMonitoringToken != -1)
  {
    notify_cancel(lowPowerMonitoringToken);
    v2 = obj;
    obj->_int lowPowerMonitoringToken = -1;
  }
  if (v2->_psID)
  {
    IOPSReleasePowerSource();
    v2 = obj;
    obj->_psID = 0;
  }
  objc_sync_exit(v2);
}

- (NSArray)LEDs
{
  if (self->_LEDs) {
    return self->_LEDs;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

uint64_t __53__SFPowerSource_startLowPowerMonitoringIfAppropriate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) lowPowerModeChanged:a2];
}

- (void)lowPowerModeChanged:(int)a3
{
  uint64_t state64 = 0;
  if (!notify_get_state(a3, &state64))
  {
    uint64_t v4 = state64;
    BOOL v5 = state64 != 0;
    if (v5 != [(SFPowerSource *)self isLowPowerModeEnabled])
    {
      [(SFPowerSource *)self willChangeValueForKey:@"lowPowerModeEnabled"];
      self->_lowPowerModeEnabled = v4 != 0;
      [(SFPowerSource *)self didChangeValueForKey:@"lowPowerModeEnabled"];
    }
  }
}

- (void)updateWithPowerSource:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v5 = a3;
  id v9 = (id)[[v4 alloc] initRequiringSecureCoding:1];
  [v5 encodeWithCoder:v9];

  id v6 = objc_alloc(MEMORY[0x1E4F28DC0]);
  NSUInteger v7 = [v9 encodedData];
  uint64_t v8 = (void *)[v6 initForReadingFromData:v7 error:0];

  [(SFPowerSource *)self _updateWithCoder:v8];
  [v8 finishDecoding];
}

- (void)setAccessoryCategory:(id)a3
{
}

- (NSString)accessoryID
{
  return self->_accessoryID;
}

- (void)setAccessoryID:(id)a3
{
}

- (NSData)batteryCaseAddress
{
  return self->_batteryCaseAddress;
}

- (void)setBatteryCaseAddress:(id)a3
{
}

- (void)setCharging:(BOOL)a3
{
  self->_charging = a3;
}

- (int64_t)color
{
  return self->_color;
}

- (void)setColor:(int64_t)a3
{
  self->_int64_t color = a3;
}

- (int64_t)familyCode
{
  return self->_familyCode;
}

- (void)setFamilyCode:(int64_t)a3
{
  self->_int64_t familyCode = a3;
}

- (void)setGroupID:(id)a3
{
}

- (void)setLEDs:(id)a3
{
}

- (BOOL)isLowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (double)lowWarnLevel
{
  return self->_lowWarnLevel;
}

- (void)setLowWarnLevel:(double)a3
{
  self->_double lowWarnLevel = a3;
}

- (void)setMaxCapacity:(double)a3
{
  self->_maxCapacity = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)partID
{
  return self->_partID;
}

- (void)setPartID:(id)a3
{
}

- (NSString)partName
{
  return self->_partName;
}

- (void)setPartName:(id)a3
{
}

- (int)powerState
{
  return self->_powerState;
}

- (void)setPowerState:(int)a3
{
  self->_uint64_t powerState = a3;
}

- (int64_t)productID
{
  return self->_productID;
}

- (void)setProductID:(int64_t)a3
{
  self->_int64_t productID = a3;
}

- (int)role
{
  return self->_role;
}

- (void)setRole:(int)a3
{
  self->_uint64_t role = a3;
}

- (BOOL)showChargingUI
{
  return self->_showChargingUI;
}

- (void)setShowChargingUI:(BOOL)a3
{
  self->_showChargingUI = a3;
}

- (int64_t)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(int64_t)a3
{
  self->_int64_t sourceID = a3;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void)setTemperature:(int64_t)a3
{
  self->_int64_t temperature = a3;
}

- (NSString)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(id)a3
{
}

- (void)setType:(id)a3
{
}

- (int64_t)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(int64_t)a3
{
  self->_int64_t vendorID = a3;
}

- (int64_t)adapterErrorFlags
{
  return self->_adapterErrorFlags;
}

- (void)setAdapterErrorFlags:(int64_t)a3
{
  self->_int64_t adapterErrorFlags = a3;
}

- (void)setAdapterFamilyCode:(int64_t)a3
{
  self->_int64_t adapterFamilyCode = a3;
}

- (NSString)adapterName
{
  return self->_adapterName;
}

- (void)setAdapterName:(id)a3
{
}

- (void)setAdapterSharedSource:(BOOL)a3
{
  self->_adapterSharedSource = a3;
}

- (void)setAdapterSourceID:(int64_t)a3
{
  self->_int64_t adapterSourceID = a3;
}

- (NSDictionary)ioKitAdapterDescription
{
  return self->_ioKitAdapterDescription;
}

- (void)setIoKitAdapterDescription:(id)a3
{
}

- (NSDictionary)ioKitDescription
{
  return self->_ioKitDescription;
}

- (void)setIoKitDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioKitDescription, 0);
  objc_storeStrong((id *)&self->_ioKitAdapterDescription, 0);
  objc_storeStrong((id *)&self->_adapterName, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_partName, 0);
  objc_storeStrong((id *)&self->_partID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_LEDs, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_batteryCaseAddress, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);

  objc_storeStrong((id *)&self->_accessoryCategory, 0);
}

@end