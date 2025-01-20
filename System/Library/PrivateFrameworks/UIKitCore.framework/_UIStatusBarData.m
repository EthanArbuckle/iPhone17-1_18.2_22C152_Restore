@interface _UIStatusBarData
+ (BOOL)supportsSecureCoding;
+ (NSSet)entryKeys;
+ (_UIStatusBarData)staticDisplayData;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSSet)existingEntryKeys;
- (_UIStatusBarData)initWithCoder:(id)a3;
- (_UIStatusBarDataActivityEntry)activityEntry;
- (_UIStatusBarDataBackgroundActivityEntry)backgroundActivityEntry;
- (_UIStatusBarDataBatteryEntry)mainBatteryEntry;
- (_UIStatusBarDataBluetoothEntry)bluetoothEntry;
- (_UIStatusBarDataBoolEntry)announceNotificationsEntry;
- (_UIStatusBarDataBoolEntry)electronicTollCollectionEntry;
- (_UIStatusBarDataBoolEntry)radarEntry;
- (_UIStatusBarDataCellularEntry)cellularEntry;
- (_UIStatusBarDataCellularEntry)secondaryCellularEntry;
- (_UIStatusBarDataEntry)airPlayEntry;
- (_UIStatusBarDataEntry)airplaneModeEntry;
- (_UIStatusBarDataEntry)alarmEntry;
- (_UIStatusBarDataEntry)assistantEntry;
- (_UIStatusBarDataEntry)carPlayEntry;
- (_UIStatusBarDataEntry)displayWarningEntry;
- (_UIStatusBarDataEntry)liquidDetectionEntry;
- (_UIStatusBarDataEntry)nikeEntry;
- (_UIStatusBarDataEntry)rotationLockEntry;
- (_UIStatusBarDataEntry)satelliteEntry;
- (_UIStatusBarDataEntry)sensorActivityEntry;
- (_UIStatusBarDataEntry)studentEntry;
- (_UIStatusBarDataEntry)ttyEntry;
- (_UIStatusBarDataEntry)vpnEntry;
- (_UIStatusBarDataIntegerEntry)volumeEntry;
- (_UIStatusBarDataLocationEntry)locationEntry;
- (_UIStatusBarDataLockEntry)lockEntry;
- (_UIStatusBarDataQuietModeEntry)quietModeEntry;
- (_UIStatusBarDataStringEntry)backNavigationEntry;
- (_UIStatusBarDataStringEntry)dateEntry;
- (_UIStatusBarDataStringEntry)deviceNameEntry;
- (_UIStatusBarDataStringEntry)forwardNavigationEntry;
- (_UIStatusBarDataStringEntry)personNameEntry;
- (_UIStatusBarDataStringEntry)shortTimeEntry;
- (_UIStatusBarDataStringEntry)timeEntry;
- (_UIStatusBarDataTetheringEntry)tetheringEntry;
- (_UIStatusBarDataThermalEntry)thermalEntry;
- (_UIStatusBarDataVoiceControlEntry)voiceControlEntry;
- (_UIStatusBarDataWifiEntry)wifiEntry;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataByApplyingOverlay:(id)a3;
- (id)dataByApplyingUpdate:(id)a3 keys:(id)a4;
- (id)description;
- (id)updateFromData:(id)a3;
- (unint64_t)hash;
- (void)_applyUpdate:(id)a3 keys:(id)a4;
- (void)applyUpdate:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)makeUpdateFromData:(id)a3;
- (void)setActivityEntry:(id)a3;
- (void)setAirPlayEntry:(id)a3;
- (void)setAirplaneModeEntry:(id)a3;
- (void)setAlarmEntry:(id)a3;
- (void)setAnnounceNotificationsEntry:(id)a3;
- (void)setAssistantEntry:(id)a3;
- (void)setBackNavigationEntry:(id)a3;
- (void)setBackgroundActivityEntry:(id)a3;
- (void)setBluetoothEntry:(id)a3;
- (void)setCarPlayEntry:(id)a3;
- (void)setCellularEntry:(id)a3;
- (void)setDateEntry:(id)a3;
- (void)setDeviceNameEntry:(id)a3;
- (void)setDisplayWarningEntry:(id)a3;
- (void)setElectronicTollCollectionEntry:(id)a3;
- (void)setForwardNavigationEntry:(id)a3;
- (void)setLiquidDetectionEntry:(id)a3;
- (void)setLocationEntry:(id)a3;
- (void)setLockEntry:(id)a3;
- (void)setMainBatteryEntry:(id)a3;
- (void)setNikeEntry:(id)a3;
- (void)setPersonNameEntry:(id)a3;
- (void)setQuietModeEntry:(id)a3;
- (void)setRadarEntry:(id)a3;
- (void)setRotationLockEntry:(id)a3;
- (void)setSatelliteEntry:(id)a3;
- (void)setSecondaryCellularEntry:(id)a3;
- (void)setSensorActivityEntry:(id)a3;
- (void)setShortTimeEntry:(id)a3;
- (void)setStudentEntry:(id)a3;
- (void)setTetheringEntry:(id)a3;
- (void)setThermalEntry:(id)a3;
- (void)setTimeEntry:(id)a3;
- (void)setTtyEntry:(id)a3;
- (void)setVoiceControlEntry:(id)a3;
- (void)setVolumeEntry:(id)a3;
- (void)setVpnEntry:(id)a3;
- (void)setWifiEntry:(id)a3;
@end

@implementation _UIStatusBarData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (_UIStatusBarData)staticDisplayData
{
  if (qword_1EB25BF10 != -1) {
    dispatch_once(&qword_1EB25BF10, &__block_literal_global_499);
  }
  v2 = (void *)_MergedGlobals_1_24;
  return (_UIStatusBarData *)v2;
}

+ (NSSet)entryKeys
{
  if (qword_1EB25BF20 != -1) {
    dispatch_once(&qword_1EB25BF20, &__block_literal_global_547);
  }
  v2 = (void *)qword_1EB25BF18;
  return (NSSet *)v2;
}

- (unint64_t)hash
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(id)objc_opt_class() hash];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [(_UIStatusBarData *)self valueForKey:*(void *)(*((void *)&v12 + 1) + 8 * v8)];
        v10 = v9;
        if (v9) {
          v3 ^= [v9 hash];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init((Class)objc_opt_class());
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = [(_UIStatusBarData *)self valueForKey:v10];
        if (v11) {
          [v4 setValue:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11 = [(_UIStatusBarData *)self valueForKey:v10];
        if (v11) {
          [v4 encodeObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (_UIStatusBarData)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_UIStatusBarData;
  uint64_t v5 = [(_UIStatusBarData *)&v18 init];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        long long v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v11];
        if (v12) {
          [(_UIStatusBarData *)v5 setValue:v12 forKey:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(id)objc_opt_class() entryKeys];
    uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v21 = v4;
      uint64_t v10 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          long long v13 = -[_UIStatusBarData valueForKey:](self, "valueForKey:", v12, v21);
          long long v14 = [v7 valueForKey:v12];
          if (([v13 isEnabled] & 1) != 0 || objc_msgSend(v14, "isEnabled"))
          {
            id v15 = v13;
            id v16 = v14;
            if (v15 == v16)
            {
            }
            else
            {
              long long v17 = v16;
              if (v15) {
                BOOL v18 = v16 == 0;
              }
              else {
                BOOL v18 = 1;
              }
              if (v18)
              {

LABEL_23:
                BOOL v6 = 0;
                goto LABEL_24;
              }
              int v19 = [v15 isEqual:v16];

              if (!v19) {
                goto LABEL_23;
              }
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      BOOL v6 = 1;
LABEL_24:
      id v4 = v21;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEmpty
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [(_UIStatusBarData *)self valueForKey:*(void *)(*((void *)&v11 + 1) + 8 * i)];

        if (v8)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (NSSet)existingEntryKeys
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [(_UIStatusBarData *)self valueForKey:v9];
        if (v10) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = +[UIDescriptionBuilder descriptionBuilderWithObject:self];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [(_UIStatusBarData *)self valueForKey:v9];
        if (v10) {
          id v11 = (id)[v3 appendObject:v10 withName:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  long long v12 = [v3 string];

  return v12;
}

- (void)_applyUpdate:(id)a3 keys:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v13 = [v6 valueForKey:v12];
        if (v13) {
          [(_UIStatusBarData *)self setValue:v13 forKey:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)applyUpdate:(id)a3
{
  id v4 = a3;
  id v5 = +[_UIStatusBarData entryKeys];
  [(_UIStatusBarData *)self _applyUpdate:v4 keys:v5];
}

- (id)dataByApplyingOverlay:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (_UIStatusBarData *)a3;
  id v5 = self;
  id v6 = v5;
  if (v4 && v4 != v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = [(_UIStatusBarData *)v4 existingEntryKeys];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      id v11 = v6;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          long long v14 = [(_UIStatusBarData *)v6 valueForKey:v13];

          if (v14)
          {
            if (v11 == v6)
            {
              id v11 = (_UIStatusBarData *)[(_UIStatusBarData *)v6 copy];
            }
            long long v15 = [(_UIStatusBarData *)v4 valueForKey:v13];
            [(_UIStatusBarData *)v11 setValue:v15 forKey:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
    else
    {
      id v11 = v6;
    }

    id v6 = v11;
  }

  return v6;
}

- (id)dataByApplyingUpdate:(id)a3 keys:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)objc_opt_class());
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        long long v15 = objc_msgSend(v6, "valueForKey:", v14, (void)v17);
        if (!v15)
        {
          long long v15 = [(_UIStatusBarData *)self valueForKey:v14];
          if (!v15) {
            continue;
          }
        }
        [v8 setValue:v15 forKey:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)updateFromData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(_UIStatusBarData *)self copy];
  [v5 makeUpdateFromData:v4];

  return v5;
}

- (void)makeUpdateFromData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = +[_UIStatusBarData entryKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = [v4 valueForKey:v10];
          uint64_t v12 = [(_UIStatusBarData *)self valueForKey:v10];
          uint64_t v13 = v12;
          if (v11) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14 && [v12 isEqual:v11]) {
            [(_UIStatusBarData *)self setValue:0 forKey:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
}

- (_UIStatusBarDataStringEntry)timeEntry
{
  return self->_timeEntry;
}

- (void)setTimeEntry:(id)a3
{
}

- (_UIStatusBarDataStringEntry)shortTimeEntry
{
  return self->_shortTimeEntry;
}

- (void)setShortTimeEntry:(id)a3
{
}

- (_UIStatusBarDataStringEntry)dateEntry
{
  return self->_dateEntry;
}

- (void)setDateEntry:(id)a3
{
}

- (_UIStatusBarDataStringEntry)personNameEntry
{
  return self->_personNameEntry;
}

- (void)setPersonNameEntry:(id)a3
{
}

- (_UIStatusBarDataStringEntry)deviceNameEntry
{
  return self->_deviceNameEntry;
}

- (void)setDeviceNameEntry:(id)a3
{
}

- (_UIStatusBarDataCellularEntry)cellularEntry
{
  return self->_cellularEntry;
}

- (void)setCellularEntry:(id)a3
{
}

- (_UIStatusBarDataCellularEntry)secondaryCellularEntry
{
  return self->_secondaryCellularEntry;
}

- (void)setSecondaryCellularEntry:(id)a3
{
}

- (_UIStatusBarDataWifiEntry)wifiEntry
{
  return self->_wifiEntry;
}

- (void)setWifiEntry:(id)a3
{
}

- (_UIStatusBarDataBatteryEntry)mainBatteryEntry
{
  return self->_mainBatteryEntry;
}

- (void)setMainBatteryEntry:(id)a3
{
}

- (_UIStatusBarDataBluetoothEntry)bluetoothEntry
{
  return self->_bluetoothEntry;
}

- (void)setBluetoothEntry:(id)a3
{
}

- (_UIStatusBarDataThermalEntry)thermalEntry
{
  return self->_thermalEntry;
}

- (void)setThermalEntry:(id)a3
{
}

- (_UIStatusBarDataActivityEntry)activityEntry
{
  return self->_activityEntry;
}

- (void)setActivityEntry:(id)a3
{
}

- (_UIStatusBarDataTetheringEntry)tetheringEntry
{
  return self->_tetheringEntry;
}

- (void)setTetheringEntry:(id)a3
{
}

- (_UIStatusBarDataLocationEntry)locationEntry
{
  return self->_locationEntry;
}

- (void)setLocationEntry:(id)a3
{
}

- (_UIStatusBarDataLockEntry)lockEntry
{
  return self->_lockEntry;
}

- (void)setLockEntry:(id)a3
{
}

- (_UIStatusBarDataQuietModeEntry)quietModeEntry
{
  return self->_quietModeEntry;
}

- (void)setQuietModeEntry:(id)a3
{
}

- (_UIStatusBarDataBoolEntry)electronicTollCollectionEntry
{
  return self->_electronicTollCollectionEntry;
}

- (void)setElectronicTollCollectionEntry:(id)a3
{
}

- (_UIStatusBarDataBoolEntry)radarEntry
{
  return self->_radarEntry;
}

- (void)setRadarEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)rotationLockEntry
{
  return self->_rotationLockEntry;
}

- (void)setRotationLockEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)airplaneModeEntry
{
  return self->_airplaneModeEntry;
}

- (void)setAirplaneModeEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)ttyEntry
{
  return self->_ttyEntry;
}

- (void)setTtyEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)nikeEntry
{
  return self->_nikeEntry;
}

- (void)setNikeEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)assistantEntry
{
  return self->_assistantEntry;
}

- (void)setAssistantEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)studentEntry
{
  return self->_studentEntry;
}

- (void)setStudentEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)vpnEntry
{
  return self->_vpnEntry;
}

- (void)setVpnEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)liquidDetectionEntry
{
  return self->_liquidDetectionEntry;
}

- (void)setLiquidDetectionEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)displayWarningEntry
{
  return self->_displayWarningEntry;
}

- (void)setDisplayWarningEntry:(id)a3
{
}

- (_UIStatusBarDataVoiceControlEntry)voiceControlEntry
{
  return self->_voiceControlEntry;
}

- (void)setVoiceControlEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)airPlayEntry
{
  return self->_airPlayEntry;
}

- (void)setAirPlayEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)carPlayEntry
{
  return self->_carPlayEntry;
}

- (void)setCarPlayEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)alarmEntry
{
  return self->_alarmEntry;
}

- (void)setAlarmEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)satelliteEntry
{
  return self->_satelliteEntry;
}

- (void)setSatelliteEntry:(id)a3
{
}

- (_UIStatusBarDataEntry)sensorActivityEntry
{
  return self->_sensorActivityEntry;
}

- (void)setSensorActivityEntry:(id)a3
{
}

- (_UIStatusBarDataBoolEntry)announceNotificationsEntry
{
  return self->_announceNotificationsEntry;
}

- (void)setAnnounceNotificationsEntry:(id)a3
{
}

- (_UIStatusBarDataIntegerEntry)volumeEntry
{
  return self->_volumeEntry;
}

- (void)setVolumeEntry:(id)a3
{
}

- (_UIStatusBarDataBackgroundActivityEntry)backgroundActivityEntry
{
  return self->_backgroundActivityEntry;
}

- (void)setBackgroundActivityEntry:(id)a3
{
}

- (_UIStatusBarDataStringEntry)backNavigationEntry
{
  return self->_backNavigationEntry;
}

- (void)setBackNavigationEntry:(id)a3
{
}

- (_UIStatusBarDataStringEntry)forwardNavigationEntry
{
  return self->_forwardNavigationEntry;
}

- (void)setForwardNavigationEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardNavigationEntry, 0);
  objc_storeStrong((id *)&self->_backNavigationEntry, 0);
  objc_storeStrong((id *)&self->_backgroundActivityEntry, 0);
  objc_storeStrong((id *)&self->_volumeEntry, 0);
  objc_storeStrong((id *)&self->_announceNotificationsEntry, 0);
  objc_storeStrong((id *)&self->_sensorActivityEntry, 0);
  objc_storeStrong((id *)&self->_satelliteEntry, 0);
  objc_storeStrong((id *)&self->_alarmEntry, 0);
  objc_storeStrong((id *)&self->_carPlayEntry, 0);
  objc_storeStrong((id *)&self->_airPlayEntry, 0);
  objc_storeStrong((id *)&self->_voiceControlEntry, 0);
  objc_storeStrong((id *)&self->_displayWarningEntry, 0);
  objc_storeStrong((id *)&self->_liquidDetectionEntry, 0);
  objc_storeStrong((id *)&self->_vpnEntry, 0);
  objc_storeStrong((id *)&self->_studentEntry, 0);
  objc_storeStrong((id *)&self->_assistantEntry, 0);
  objc_storeStrong((id *)&self->_nikeEntry, 0);
  objc_storeStrong((id *)&self->_ttyEntry, 0);
  objc_storeStrong((id *)&self->_airplaneModeEntry, 0);
  objc_storeStrong((id *)&self->_rotationLockEntry, 0);
  objc_storeStrong((id *)&self->_radarEntry, 0);
  objc_storeStrong((id *)&self->_electronicTollCollectionEntry, 0);
  objc_storeStrong((id *)&self->_quietModeEntry, 0);
  objc_storeStrong((id *)&self->_lockEntry, 0);
  objc_storeStrong((id *)&self->_locationEntry, 0);
  objc_storeStrong((id *)&self->_tetheringEntry, 0);
  objc_storeStrong((id *)&self->_activityEntry, 0);
  objc_storeStrong((id *)&self->_thermalEntry, 0);
  objc_storeStrong((id *)&self->_bluetoothEntry, 0);
  objc_storeStrong((id *)&self->_mainBatteryEntry, 0);
  objc_storeStrong((id *)&self->_wifiEntry, 0);
  objc_storeStrong((id *)&self->_secondaryCellularEntry, 0);
  objc_storeStrong((id *)&self->_cellularEntry, 0);
  objc_storeStrong((id *)&self->_deviceNameEntry, 0);
  objc_storeStrong((id *)&self->_personNameEntry, 0);
  objc_storeStrong((id *)&self->_dateEntry, 0);
  objc_storeStrong((id *)&self->_shortTimeEntry, 0);
  objc_storeStrong((id *)&self->_timeEntry, 0);
}

@end