@interface STMutableStatusBarData
+ (BOOL)supportsSecureCoding;
- (id)copyWithZone:(_NSZone *)a3;
- (id)immutableCopy;
- (void)_applyUpdate:(id)a3 keys:(id)a4;
- (void)applyUpdate:(id)a3;
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
- (void)setControlCenterEntry:(id)a3;
- (void)setDateEntry:(id)a3;
- (void)setDeviceNameEntry:(id)a3;
- (void)setDisplayWarningEntry:(id)a3;
- (void)setElectronicTollCollectionEntry:(id)a3;
- (void)setEntry:(id)a3 forKey:(id)a4;
- (void)setForwardNavigationEntry:(id)a3;
- (void)setLiquidDetectionEntry:(id)a3;
- (void)setLocationEntry:(id)a3;
- (void)setLockEntry:(id)a3;
- (void)setMainBatteryEntry:(id)a3;
- (void)setNikeEntry:(id)a3;
- (void)setPersonNameEntry:(id)a3;
- (void)setQuietModeEntry:(id)a3;
- (void)setRadarEntry:(id)a3;
- (void)setRingerSilenceEntry:(id)a3;
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
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setVoiceControlEntry:(id)a3;
- (void)setVolumeEntry:(id)a3;
- (void)setVpnEntry:(id)a3;
- (void)setWifiEntry:(id)a3;
@end

@implementation STMutableStatusBarData

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
    v5 = +[STStatusBarData entryKeys];
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
          v11 = [v4 valueForKey:v10];
          v12 = [(STMutableStatusBarData *)self valueForKey:v10];
          v13 = v12;
          if (v11) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14 && [v12 isEqual:v11]) {
            [(STMutableStatusBarData *)self setEntry:0 forKey:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
}

- (void)setEntry:(id)a3 forKey:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)STMutableStatusBarData;
  [(STStatusBarData *)&v4 _internal_setValue:a3 forKey:a4];
}

- (id)immutableCopy
{
  v3 = objc_alloc_init(STStatusBarData);
  _copyValuesFromDataToData((id *)&self->super.super.isa, (id *)&v3->super.isa);

  return v3;
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
        v13 = [v6 valueForKey:v12];
        if (v13) {
          [(STMutableStatusBarData *)self setEntry:v13 forKey:v12];
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
  id v5 = +[STStatusBarData entryKeys];
  [(STMutableStatusBarData *)self _applyUpdate:v4 keys:v5];
}

- (void)setSatelliteEntry:(id)a3
{
  id v5 = (STStatusBarDataSatelliteEntry *)a3;
  if (self->super._satelliteEntry != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->super._satelliteEntry, a3);
    id v5 = v6;
  }
}

- (void)setLocationEntry:(id)a3
{
  id v5 = (STStatusBarDataLocationEntry *)a3;
  locationEntry = self->super._locationEntry;
  p_locationEntry = &self->super._locationEntry;
  if (locationEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_locationEntry, a3);
    id v5 = v8;
  }
}

- (void)setRingerSilenceEntry:(id)a3
{
  id v5 = (STStatusBarDataBoolEntry *)a3;
  if (self->super._ringerSilenceEntry != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->super._ringerSilenceEntry, a3);
    id v5 = v6;
  }
}

- (void)setActivityEntry:(id)a3
{
  id v5 = (STStatusBarDataActivityEntry *)a3;
  activityEntry = self->super._activityEntry;
  p_activityEntry = &self->super._activityEntry;
  if (activityEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_activityEntry, a3);
    id v5 = v8;
  }
}

- (void)setTimeEntry:(id)a3
{
  id v5 = (STStatusBarDataStringEntry *)a3;
  timeEntry = self->super._timeEntry;
  p_timeEntry = &self->super._timeEntry;
  if (timeEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_timeEntry, a3);
    id v5 = v8;
  }
}

- (void)setShortTimeEntry:(id)a3
{
  id v5 = (STStatusBarDataStringEntry *)a3;
  shortTimeEntry = self->super._shortTimeEntry;
  p_shortTimeEntry = &self->super._shortTimeEntry;
  if (shortTimeEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_shortTimeEntry, a3);
    id v5 = v8;
  }
}

- (void)setMainBatteryEntry:(id)a3
{
  id v5 = (STStatusBarDataBatteryEntry *)a3;
  mainBatteryEntry = self->super._mainBatteryEntry;
  p_mainBatteryEntry = &self->super._mainBatteryEntry;
  if (mainBatteryEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_mainBatteryEntry, a3);
    id v5 = v8;
  }
}

- (void)setWifiEntry:(id)a3
{
  id v5 = (STStatusBarDataWifiEntry *)a3;
  wifiEntry = self->super._wifiEntry;
  p_wifiEntry = &self->super._wifiEntry;
  if (wifiEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_wifiEntry, a3);
    id v5 = v8;
  }
}

- (void)setVpnEntry:(id)a3
{
  id v5 = (STStatusBarDataEntry *)a3;
  vpnEntry = self->super._vpnEntry;
  p_vpnEntry = &self->super._vpnEntry;
  if (vpnEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_vpnEntry, a3);
    id v5 = v8;
  }
}

- (void)setVoiceControlEntry:(id)a3
{
  id v5 = (STStatusBarDataVoiceControlEntry *)a3;
  voiceControlEntry = self->super._voiceControlEntry;
  p_voiceControlEntry = &self->super._voiceControlEntry;
  if (voiceControlEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_voiceControlEntry, a3);
    id v5 = v8;
  }
}

- (void)setTtyEntry:(id)a3
{
  id v5 = (STStatusBarDataEntry *)a3;
  ttyEntry = self->super._ttyEntry;
  p_ttyEntry = &self->super._ttyEntry;
  if (ttyEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_ttyEntry, a3);
    id v5 = v8;
  }
}

- (void)setThermalEntry:(id)a3
{
  id v5 = (STStatusBarDataThermalEntry *)a3;
  thermalEntry = self->super._thermalEntry;
  p_thermalEntry = &self->super._thermalEntry;
  if (thermalEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_thermalEntry, a3);
    id v5 = v8;
  }
}

- (void)setTetheringEntry:(id)a3
{
  id v5 = (STStatusBarDataTetheringEntry *)a3;
  tetheringEntry = self->super._tetheringEntry;
  p_tetheringEntry = &self->super._tetheringEntry;
  if (tetheringEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_tetheringEntry, a3);
    id v5 = v8;
  }
}

- (void)setStudentEntry:(id)a3
{
  id v5 = (STStatusBarDataEntry *)a3;
  studentEntry = self->super._studentEntry;
  p_studentEntry = &self->super._studentEntry;
  if (studentEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_studentEntry, a3);
    id v5 = v8;
  }
}

- (void)setSensorActivityEntry:(id)a3
{
  id v5 = (STStatusBarDataEntry *)a3;
  if (self->super._sensorActivityEntry != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->super._sensorActivityEntry, a3);
    id v5 = v6;
  }
}

- (void)setSecondaryCellularEntry:(id)a3
{
  id v5 = (STStatusBarDataCellularEntry *)a3;
  secondaryCellularEntry = self->super._secondaryCellularEntry;
  p_secondaryCellularEntry = &self->super._secondaryCellularEntry;
  if (secondaryCellularEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_secondaryCellularEntry, a3);
    id v5 = v8;
  }
}

- (void)setRotationLockEntry:(id)a3
{
  id v5 = (STStatusBarDataEntry *)a3;
  rotationLockEntry = self->super._rotationLockEntry;
  p_rotationLockEntry = &self->super._rotationLockEntry;
  if (rotationLockEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_rotationLockEntry, a3);
    id v5 = v8;
  }
}

- (void)setRadarEntry:(id)a3
{
  id v5 = (STStatusBarDataBoolEntry *)a3;
  radarEntry = self->super._radarEntry;
  p_radarEntry = &self->super._radarEntry;
  if (radarEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_radarEntry, a3);
    id v5 = v8;
  }
}

- (void)setQuietModeEntry:(id)a3
{
  id v5 = (STStatusBarDataQuietModeEntry *)a3;
  quietModeEntry = self->super._quietModeEntry;
  p_quietModeEntry = &self->super._quietModeEntry;
  if (quietModeEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_quietModeEntry, a3);
    id v5 = v8;
  }
}

- (void)setPersonNameEntry:(id)a3
{
  id v5 = (STStatusBarDataStringEntry *)a3;
  personNameEntry = self->super._personNameEntry;
  p_personNameEntry = &self->super._personNameEntry;
  if (personNameEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_personNameEntry, a3);
    id v5 = v8;
  }
}

- (void)setLockEntry:(id)a3
{
  id v5 = (STStatusBarDataLockEntry *)a3;
  lockEntry = self->super._lockEntry;
  p_lockEntry = &self->super._lockEntry;
  if (lockEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_lockEntry, a3);
    id v5 = v8;
  }
}

- (void)setLiquidDetectionEntry:(id)a3
{
  id v5 = (STStatusBarDataEntry *)a3;
  liquidDetectionEntry = self->super._liquidDetectionEntry;
  p_liquidDetectionEntry = &self->super._liquidDetectionEntry;
  if (liquidDetectionEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_liquidDetectionEntry, a3);
    id v5 = v8;
  }
}

- (void)setForwardNavigationEntry:(id)a3
{
  id v5 = (STStatusBarDataStringEntry *)a3;
  if (self->super._forwardNavigationEntry != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->super._forwardNavigationEntry, a3);
    id v5 = v6;
  }
}

- (void)setElectronicTollCollectionEntry:(id)a3
{
  id v5 = (STStatusBarDataBoolEntry *)a3;
  electronicTollCollectionEntry = self->super._electronicTollCollectionEntry;
  p_electronicTollCollectionEntry = &self->super._electronicTollCollectionEntry;
  if (electronicTollCollectionEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_electronicTollCollectionEntry, a3);
    id v5 = v8;
  }
}

- (void)setDisplayWarningEntry:(id)a3
{
  id v5 = (STStatusBarDataEntry *)a3;
  displayWarningEntry = self->super._displayWarningEntry;
  p_displayWarningEntry = &self->super._displayWarningEntry;
  if (displayWarningEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_displayWarningEntry, a3);
    id v5 = v8;
  }
}

- (void)setDeviceNameEntry:(id)a3
{
  id v5 = (STStatusBarDataStringEntry *)a3;
  deviceNameEntry = self->super._deviceNameEntry;
  p_deviceNameEntry = &self->super._deviceNameEntry;
  if (deviceNameEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_deviceNameEntry, a3);
    id v5 = v8;
  }
}

- (void)setDateEntry:(id)a3
{
  id v5 = (STStatusBarDataStringEntry *)a3;
  dateEntry = self->super._dateEntry;
  p_dateEntry = &self->super._dateEntry;
  if (dateEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_dateEntry, a3);
    id v5 = v8;
  }
}

- (void)setCellularEntry:(id)a3
{
  id v5 = (STStatusBarDataCellularEntry *)a3;
  cellularEntry = self->super._cellularEntry;
  p_cellularEntry = &self->super._cellularEntry;
  if (cellularEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_cellularEntry, a3);
    id v5 = v8;
  }
}

- (void)setCarPlayEntry:(id)a3
{
  id v5 = (STStatusBarDataEntry *)a3;
  carPlayEntry = self->super._carPlayEntry;
  p_carPlayEntry = &self->super._carPlayEntry;
  if (carPlayEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_carPlayEntry, a3);
    id v5 = v8;
  }
}

- (void)setBluetoothEntry:(id)a3
{
  id v5 = (STStatusBarDataBluetoothEntry *)a3;
  bluetoothEntry = self->super._bluetoothEntry;
  p_bluetoothEntry = &self->super._bluetoothEntry;
  if (bluetoothEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_bluetoothEntry, a3);
    id v5 = v8;
  }
}

- (void)setBackNavigationEntry:(id)a3
{
  id v5 = (STStatusBarDataStringEntry *)a3;
  if (self->super._backNavigationEntry != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->super._backNavigationEntry, a3);
    id v5 = v6;
  }
}

- (void)setAssistantEntry:(id)a3
{
  id v5 = (STStatusBarDataEntry *)a3;
  assistantEntry = self->super._assistantEntry;
  p_assistantEntry = &self->super._assistantEntry;
  if (assistantEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_assistantEntry, a3);
    id v5 = v8;
  }
}

- (void)setAnnounceNotificationsEntry:(id)a3
{
  id v5 = (STStatusBarDataBoolEntry *)a3;
  if (self->super._announceNotificationsEntry != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->super._announceNotificationsEntry, a3);
    id v5 = v6;
  }
}

- (void)setAlarmEntry:(id)a3
{
  id v5 = (STStatusBarDataEntry *)a3;
  alarmEntry = self->super._alarmEntry;
  p_alarmEntry = &self->super._alarmEntry;
  if (alarmEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_alarmEntry, a3);
    id v5 = v8;
  }
}

- (void)setAirplaneModeEntry:(id)a3
{
  id v5 = (STStatusBarDataEntry *)a3;
  airplaneModeEntry = self->super._airplaneModeEntry;
  p_airplaneModeEntry = &self->super._airplaneModeEntry;
  if (airplaneModeEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_airplaneModeEntry, a3);
    id v5 = v8;
  }
}

- (void)setAirPlayEntry:(id)a3
{
  id v5 = (STStatusBarDataEntry *)a3;
  airPlayEntry = self->super._airPlayEntry;
  p_airPlayEntry = &self->super._airPlayEntry;
  if (airPlayEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_airPlayEntry, a3);
    id v5 = v8;
  }
}

- (void)setNikeEntry:(id)a3
{
  id v5 = (STStatusBarDataEntry *)a3;
  nikeEntry = self->super._nikeEntry;
  p_nikeEntry = &self->super._nikeEntry;
  if (nikeEntry != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_nikeEntry, a3);
    id v5 = v8;
  }
}

- (void)setBackgroundActivityEntry:(id)a3
{
  id v5 = (STStatusBarDataBackgroundActivityEntry *)a3;
  if (self->super._backgroundActivityEntry != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->super._backgroundActivityEntry, a3);
    id v5 = v6;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  _copyValuesFromDataToData((id *)&self->super.super.isa, v4);
  return v4;
}

- (void)setVolumeEntry:(id)a3
{
  id v5 = (STStatusBarDataIntegerEntry *)a3;
  if (self->super._volumeEntry != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->super._volumeEntry, a3);
    id v5 = v6;
  }
}

- (void)setControlCenterEntry:(id)a3
{
  id v5 = (STStatusBarDataImageEntry *)a3;
  if (self->super._controlCenterEntry != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->super._controlCenterEntry, a3);
    id v5 = v6;
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)STMutableStatusBarData;
  [(STStatusBarData *)&v4 _internal_setValue:a3 forKey:a4];
}

@end