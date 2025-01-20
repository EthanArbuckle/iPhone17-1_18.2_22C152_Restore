@interface STStatusBarData
+ (BOOL)supportsSecureCoding;
+ (NSDateFormatter)dateFormatter;
+ (NSDateFormatter)shortTimeFormatter;
+ (NSDateFormatter)timeFormatter;
+ (NSSet)entryKeys;
+ (STStatusBarData)staticDisplayData;
+ (void)dateFormatterForDate:(id *)a3 time:(id *)a4 shortTime:(id *)a5;
- (BOOL)dateFromEntriesIncludesDate;
- (BOOL)dateFromEntriesIncludesTime;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSDate)dateFromEntries;
- (NSSet)existingEntryKeys;
- (NSString)debugDescription;
- (NSString)description;
- (STStatusBarData)initWithCoder:(id)a3;
- (STStatusBarData)initWithDate:(id)a3;
- (STStatusBarData)initWithEntry:(id)a3 forKey:(id)a4;
- (STStatusBarData)initWithKeysAndEntries:(id)a3;
- (STStatusBarDataActivityEntry)activityEntry;
- (STStatusBarDataBackgroundActivityEntry)backgroundActivityEntry;
- (STStatusBarDataBatteryEntry)mainBatteryEntry;
- (STStatusBarDataBluetoothEntry)bluetoothEntry;
- (STStatusBarDataBoolEntry)announceNotificationsEntry;
- (STStatusBarDataBoolEntry)electronicTollCollectionEntry;
- (STStatusBarDataBoolEntry)radarEntry;
- (STStatusBarDataBoolEntry)ringerSilenceEntry;
- (STStatusBarDataCellularEntry)cellularEntry;
- (STStatusBarDataCellularEntry)secondaryCellularEntry;
- (STStatusBarDataEntry)airPlayEntry;
- (STStatusBarDataEntry)airplaneModeEntry;
- (STStatusBarDataEntry)alarmEntry;
- (STStatusBarDataEntry)assistantEntry;
- (STStatusBarDataEntry)carPlayEntry;
- (STStatusBarDataEntry)displayWarningEntry;
- (STStatusBarDataEntry)liquidDetectionEntry;
- (STStatusBarDataEntry)nikeEntry;
- (STStatusBarDataEntry)rotationLockEntry;
- (STStatusBarDataEntry)sensorActivityEntry;
- (STStatusBarDataEntry)studentEntry;
- (STStatusBarDataEntry)ttyEntry;
- (STStatusBarDataEntry)vpnEntry;
- (STStatusBarDataImageEntry)controlCenterEntry;
- (STStatusBarDataIntegerEntry)volumeEntry;
- (STStatusBarDataLocationEntry)locationEntry;
- (STStatusBarDataLockEntry)lockEntry;
- (STStatusBarDataQuietModeEntry)quietModeEntry;
- (STStatusBarDataSatelliteEntry)satelliteEntry;
- (STStatusBarDataStringEntry)backNavigationEntry;
- (STStatusBarDataStringEntry)dateEntry;
- (STStatusBarDataStringEntry)deviceNameEntry;
- (STStatusBarDataStringEntry)forwardNavigationEntry;
- (STStatusBarDataStringEntry)personNameEntry;
- (STStatusBarDataStringEntry)shortTimeEntry;
- (STStatusBarDataStringEntry)timeEntry;
- (STStatusBarDataTetheringEntry)tetheringEntry;
- (STStatusBarDataThermalEntry)thermalEntry;
- (STStatusBarDataVoiceControlEntry)voiceControlEntry;
- (STStatusBarDataWifiEntry)wifiEntry;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)dataByApplyingOverlay:(id)a3;
- (id)dataByApplyingUpdate:(id)a3 keys:(id)a4;
- (id)dataByRemovingEntriesForKeys:(id)a3;
- (id)dataByReplacingEntry:(id)a3 forKey:(id)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)entryForKey:(id)a3;
- (id)mutableCopy;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)updateFromData:(id)a3;
- (unint64_t)hash;
- (void)_internal_setValue:(id)a3 forKey:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation STStatusBarData

- (STStatusBarDataCellularEntry)cellularEntry
{
  return self->_cellularEntry;
}

- (STStatusBarDataCellularEntry)secondaryCellularEntry
{
  return self->_secondaryCellularEntry;
}

- (STStatusBarDataBackgroundActivityEntry)backgroundActivityEntry
{
  return self->_backgroundActivityEntry;
}

- (STStatusBarDataWifiEntry)wifiEntry
{
  return self->_wifiEntry;
}

- (void)_internal_setValue:(id)a3 forKey:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)STStatusBarData;
  [(STStatusBarData *)&v4 setValue:a3 forKey:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringerSilenceEntry, 0);
  objc_storeStrong((id *)&self->_controlCenterEntry, 0);
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

- (NSSet)existingEntryKeys
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v4 = objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
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
        v10 = [(STStatusBarData *)self valueForKey:v9];
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

+ (NSSet)entryKeys
{
  if (qword_1EB5A34F8 != -1) {
    dispatch_once(&qword_1EB5A34F8, &__block_literal_global_754);
  }
  v2 = (void *)qword_1EB5A34F0;

  return (NSSet *)v2;
}

- (STStatusBarDataBatteryEntry)mainBatteryEntry
{
  return self->_mainBatteryEntry;
}

- (STStatusBarDataStringEntry)backNavigationEntry
{
  return self->_backNavigationEntry;
}

- (STStatusBarDataActivityEntry)activityEntry
{
  return self->_activityEntry;
}

- (STStatusBarDataImageEntry)controlCenterEntry
{
  return self->_controlCenterEntry;
}

- (STStatusBarDataLocationEntry)locationEntry
{
  return self->_locationEntry;
}

- (STStatusBarDataQuietModeEntry)quietModeEntry
{
  return self->_quietModeEntry;
}

- (STStatusBarDataBluetoothEntry)bluetoothEntry
{
  return self->_bluetoothEntry;
}

- (STStatusBarDataStringEntry)shortTimeEntry
{
  return self->_shortTimeEntry;
}

- (STStatusBarDataBoolEntry)ringerSilenceEntry
{
  return self->_ringerSilenceEntry;
}

- (STStatusBarDataEntry)vpnEntry
{
  return self->_vpnEntry;
}

- (STStatusBarDataThermalEntry)thermalEntry
{
  return self->_thermalEntry;
}

- (STStatusBarDataVoiceControlEntry)voiceControlEntry
{
  return self->_voiceControlEntry;
}

- (STStatusBarDataEntry)ttyEntry
{
  return self->_ttyEntry;
}

- (STStatusBarDataEntry)studentEntry
{
  return self->_studentEntry;
}

- (STStatusBarDataEntry)sensorActivityEntry
{
  return self->_sensorActivityEntry;
}

- (STStatusBarDataSatelliteEntry)satelliteEntry
{
  return self->_satelliteEntry;
}

- (STStatusBarDataEntry)rotationLockEntry
{
  return self->_rotationLockEntry;
}

- (STStatusBarDataEntry)liquidDetectionEntry
{
  return self->_liquidDetectionEntry;
}

- (STStatusBarDataEntry)carPlayEntry
{
  return self->_carPlayEntry;
}

- (STStatusBarDataEntry)assistantEntry
{
  return self->_assistantEntry;
}

- (STStatusBarDataEntry)alarmEntry
{
  return self->_alarmEntry;
}

- (STStatusBarDataEntry)airplaneModeEntry
{
  return self->_airplaneModeEntry;
}

- (STStatusBarDataEntry)airPlayEntry
{
  return self->_airPlayEntry;
}

- (STStatusBarDataStringEntry)timeEntry
{
  return self->_timeEntry;
}

- (STStatusBarDataStringEntry)dateEntry
{
  return self->_dateEntry;
}

- (STStatusBarDataIntegerEntry)volumeEntry
{
  return self->_volumeEntry;
}

- (STStatusBarDataTetheringEntry)tetheringEntry
{
  return self->_tetheringEntry;
}

- (STStatusBarDataBoolEntry)radarEntry
{
  return self->_radarEntry;
}

- (STStatusBarDataStringEntry)personNameEntry
{
  return self->_personNameEntry;
}

- (STStatusBarDataLockEntry)lockEntry
{
  return self->_lockEntry;
}

- (STStatusBarDataStringEntry)forwardNavigationEntry
{
  return self->_forwardNavigationEntry;
}

- (STStatusBarDataBoolEntry)electronicTollCollectionEntry
{
  return self->_electronicTollCollectionEntry;
}

- (STStatusBarDataEntry)displayWarningEntry
{
  return self->_displayWarningEntry;
}

- (STStatusBarDataStringEntry)deviceNameEntry
{
  return self->_deviceNameEntry;
}

- (STStatusBarDataBoolEntry)announceNotificationsEntry
{
  return self->_announceNotificationsEntry;
}

- (id)mutableCopy
{
  v3 = objc_alloc_init(STMutableStatusBarData);
  _copyValuesFromDataToData((id *)&self->super.isa, (id *)&v3->super.super.isa);
  return v3;
}

- (id)dataByApplyingOverlay:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (STStatusBarData *)a3;
  uint64_t v5 = v4;
  if (v4 && v4 != self)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [(STStatusBarData *)v4 existingEntryKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          long long v13 = [(STStatusBarData *)self valueForKey:v12];

          if (v13)
          {
            if (!v9) {
              id v9 = [(STStatusBarData *)self mutableCopy];
            }
            long long v14 = [(STStatusBarData *)v5 valueForKey:v12];
            [v9 setEntry:v14 forKey:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);

      if (v9)
      {
        _STStatusBarDataMatchingMutabilityOfData(v9, self);
        long long v15 = (STStatusBarData *)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
    }
    else
    {
    }
  }
  long long v15 = self;
LABEL_18:

  return v15;
}

+ (void)dateFormatterForDate:(id *)a3 time:(id *)a4 shortTime:(id *)a5
{
  if (_MergedGlobals_9 == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&_MergedGlobals_9, &__block_literal_global_10);
  if (a3) {
LABEL_3:
  }
    *a3 = (id) qword_1EB5A3578;
LABEL_4:
  if (a4) {
    *a4 = (id) qword_1EB5A3580;
  }
  if (a5) {
    *a5 = (id) qword_1EB5A3588;
  }
}

void __63__STStatusBarData_NSDate__dateFormatterForDate_time_shortTime___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C10];
  v1 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v2 = [v0 dateFormatFromTemplate:@"EEEMMMd" options:0 locale:v1];
  v3 = (void *)v2;
  objc_super v4 = @"EEE MMM d";
  if (v2) {
    objc_super v4 = (__CFString *)v2;
  }
  uint64_t v5 = v4;

  uint64_t v6 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  uint64_t v7 = [(__CFString *)v5 rangeOfCharacterFromSet:v6];
  uint64_t v9 = v8;

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v30 = v5;
  }
  else
  {
    do
    {
      -[__CFString stringByReplacingCharactersInRange:withString:](v5, "stringByReplacingCharactersInRange:withString:", v7, v9, &stru_1F335AB10);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

      uint64_t v10 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
      uint64_t v7 = [(__CFString *)v30 rangeOfCharacterFromSet:v10];
      uint64_t v9 = v11;

      uint64_t v5 = v30;
    }
    while (v7 != 0x7FFFFFFFFFFFFFFFLL);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  long long v13 = (void *)qword_1EB5A3578;
  qword_1EB5A3578 = (uint64_t)v12;

  long long v14 = (void *)qword_1EB5A3578;
  long long v15 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v14 setTimeZone:v15];

  v16 = (void *)qword_1EB5A3578;
  long long v17 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v16 setLocale:v17];

  [(id)qword_1EB5A3578 setDateFormat:v30];
  id v18 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  long long v19 = (void *)qword_1EB5A3580;
  qword_1EB5A3580 = (uint64_t)v18;

  long long v20 = (void *)qword_1EB5A3580;
  v21 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v20 setTimeZone:v21];

  uint64_t v22 = (void *)qword_1EB5A3580;
  v23 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v22 setLocale:v23];

  [(id)qword_1EB5A3580 setDateStyle:0];
  [(id)qword_1EB5A3580 setTimeStyle:1];
  id v24 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v25 = (void *)qword_1EB5A3588;
  qword_1EB5A3588 = (uint64_t)v24;

  v26 = (void *)qword_1EB5A3588;
  v27 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v26 setTimeZone:v27];

  v28 = (void *)qword_1EB5A3588;
  v29 = [MEMORY[0x1E4F1CA20] currentLocale];
  [v28 setLocale:v29];

  [(id)qword_1EB5A3588 setDateStyle:0];
  [(id)qword_1EB5A3588 setTimeStyle:1];
  [(id)qword_1EB5A3588 setAMSymbol:&stru_1F335AB10];
  [(id)qword_1EB5A3588 setPMSymbol:&stru_1F335AB10];
}

- (STStatusBarData)initWithDate:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[STStatusBarDataDateTimeEntry entryForDateWithDateValue:v4];
  uint64_t v6 = +[STStatusBarDataDateTimeEntry entryForTimeWithDateValue:v4];
  uint64_t v7 = +[STStatusBarDataDateTimeEntry entryForShortTimeWithDateValue:v4];

  v11[0] = @"dateEntry";
  v11[1] = @"timeEntry";
  v12[0] = v5;
  v12[1] = v6;
  v11[2] = @"shortTimeEntry";
  v12[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  uint64_t v9 = [(STStatusBarData *)self initWithKeysAndEntries:v8];

  return v9;
}

- (NSDate)dateFromEntries
{
  v3 = [(STStatusBarData *)self dateEntry];
  id v4 = [(STStatusBarData *)self timeEntry];
  uint64_t v5 = [(STStatusBarData *)self shortTimeEntry];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v3;
LABEL_7:
    uint64_t v7 = [v6 dateValue];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v5;
    goto LABEL_7;
  }
  id v28 = 0;
  id v29 = 0;
  id v27 = 0;
  [(id)objc_opt_class() dateFormatterForDate:&v29 time:&v28 shortTime:&v27];
  id v26 = v29;
  id v25 = v28;
  id v24 = v27;
  uint64_t v9 = [v3 stringValue];
  uint64_t v10 = [v4 stringValue];
  uint64_t v11 = [v5 stringValue];
  id v12 = (void *)[v9 length];
  uint64_t v13 = [v10 length];
  uint64_t v14 = [v11 length];
  uint64_t v15 = v14;
  if (v12 || v13 || (uint64_t v7 = 0, v14))
  {
    if (v12)
    {
      id v12 = [v26 dateFromString:v9];
    }
    if (v13)
    {
      v16 = v25;
      long long v17 = v10;
    }
    else
    {
      if (!v15)
      {
        uint64_t v7 = 0;
        goto LABEL_24;
      }
      v16 = v24;
      long long v17 = v11;
    }
    uint64_t v18 = [v16 dateFromString:v17];
    uint64_t v7 = (void *)v18;
    if (v12 && v18)
    {
      v23 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      [v23 startOfDayForDate:v12];
      long long v19 = v22 = v12;
      long long v20 = [v23 startOfDayForDate:v7];
      [v7 timeIntervalSinceDate:v20];
      objc_msgSend(v19, "dateByAddingTimeInterval:");
      id v21 = (id)objc_claimAutoreleasedReturnValue();

      id v12 = v22;
      goto LABEL_26;
    }
LABEL_24:
    if (!v12)
    {
LABEL_27:

      goto LABEL_28;
    }
    id v21 = v12;
LABEL_26:

    uint64_t v7 = v21;
    goto LABEL_27;
  }
LABEL_28:

LABEL_8:

  return (NSDate *)v7;
}

- (BOOL)dateFromEntriesIncludesDate
{
  uint64_t v2 = [(STStatusBarData *)self dateEntry];
  v3 = [v2 stringValue];

  LOBYTE(v2) = [v3 length] != 0;
  return (char)v2;
}

- (BOOL)dateFromEntriesIncludesTime
{
  v3 = [(STStatusBarData *)self timeEntry];
  id v4 = [v3 stringValue];

  uint64_t v5 = [(STStatusBarData *)self shortTimeEntry];
  uint64_t v6 = [v5 stringValue];

  uint64_t v7 = [v4 length];
  LOBYTE(v7) = (v7 | [v6 length]) != 0;

  return v7;
}

+ (NSDateFormatter)timeFormatter
{
  id v4 = 0;
  [a1 dateFormatterForDate:0 time:&v4 shortTime:0];
  id v2 = v4;

  return (NSDateFormatter *)v2;
}

+ (NSDateFormatter)shortTimeFormatter
{
  id v4 = 0;
  [a1 dateFormatterForDate:0 time:0 shortTime:&v4];
  id v2 = v4;

  return (NSDateFormatter *)v2;
}

+ (NSDateFormatter)dateFormatter
{
  id v4 = 0;
  [a1 dateFormatterForDate:&v4 time:0 shortTime:0];
  id v2 = v4;

  return (NSDateFormatter *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (STStatusBarData)staticDisplayData
{
  if (qword_1EB5A34E8 != -1) {
    dispatch_once(&qword_1EB5A34E8, &__block_literal_global_12);
  }
  id v2 = (void *)_MergedGlobals_1;

  return (STStatusBarData *)v2;
}

void __36__STStatusBarData_staticDisplayData__block_invoke()
{
  id v12 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v12 setMonth:1];
  [v12 setDay:9];
  [v12 setYear:2007];
  [v12 setHour:9];
  [v12 setMinute:41];
  v0 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  v1 = [v0 dateFromComponents:v12];

  id v2 = [(STStatusBarData *)[STMutableStatusBarData alloc] initWithDate:v1];
  LOBYTE(v11) = 0;
  LOBYTE(v10) = 0;
  BYTE2(v9) = 0;
  LOWORD(v9) = 0;
  v3 = +[STStatusBarDataCellularEntry entryWithType:stringValue:crossfadeStringValue:badgeStringValue:wifiCalling:callForwarding:showsSOSWhenDisabled:sosAvailable:isBootstrapCellular:status:lowDataMode:rawValue:displayValue:displayRawValue:](STStatusBarDataCellularEntry, "entryWithType:stringValue:crossfadeStringValue:badgeStringValue:wifiCalling:callForwarding:showsSOSWhenDisabled:sosAvailable:isBootstrapCellular:status:lowDataMode:rawValue:displayValue:displayRawValue:", 5, @"Carrier", 0, 0, 0, 0, v9, 5, v10, 0, 4, v11);
  [(STMutableStatusBarData *)v2 setCellularEntry:v3];

  id v4 = +[STStatusBarDataWifiEntry entryWithType:0 status:5 lowDataMode:0 rawValue:0 displayValue:3 displayRawValue:0];
  [(STMutableStatusBarData *)v2 setWifiEntry:v4];

  uint64_t v5 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:&unk_1F336D290 numberStyle:3];
  uint64_t v6 = +[STStatusBarDataBatteryEntry entryWithCapacity:100 state:0 saverMode:0 prominentlyShowsDetailString:0 detailString:v5];
  [(STMutableStatusBarData *)v2 setMainBatteryEntry:v6];

  uint64_t v7 = [(STMutableStatusBarData *)v2 immutableCopy];
  uint64_t v8 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v7;
}

uint64_t __28__STStatusBarData_entryKeys__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"timeEntry", @"shortTimeEntry", @"dateEntry", @"personNameEntry", @"deviceNameEntry", @"cellularEntry", @"secondaryCellularEntry", @"wifiEntry", @"mainBatteryEntry", @"bluetoothEntry", @"thermalEntry", @"activityEntry", @"tetheringEntry", @"lockEntry", @"quietModeEntry", @"electronicTollCollectionEntry", @"rotationLockEntry",
    @"locationEntry",
    @"airplaneModeEntry",
    @"ttyEntry",
    @"assistantEntry",
    @"studentEntry",
    @"vpnEntry",
    @"liquidDetectionEntry",
    @"displayWarningEntry",
    @"voiceControlEntry",
    @"airPlayEntry",
    @"carPlayEntry",
    @"alarmEntry",
    @"satelliteEntry",
    @"sensorActivityEntry",
    @"radarEntry",
    @"announceNotificationsEntry",
    @"volumeEntry",
    @"backgroundActivityEntry",
    @"backNavigationEntry",
    @"forwardNavigationEntry",
    @"controlCenterEntry",
    @"ringerSilenceEntry",
  uint64_t v0 = 0);
  uint64_t v1 = qword_1EB5A34F0;
  qword_1EB5A34F0 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (unint64_t)hash
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F4F758] builder];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(STStatusBarData *)self valueForKey:*(void *)(*((void *)&v13 + 1) + 8 * v8)];
        if (v9) {
          id v10 = (id)[v3 appendObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  unint64_t v11 = [v3 hash];
  return v11;
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
        unint64_t v11 = [(STStatusBarData *)self valueForKey:v10];
        if (v11) {
          [v4 encodeObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (STStatusBarData)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)STStatusBarData;
  uint64_t v5 = [(STStatusBarData *)&v24 init];
  uint64_t v6 = objc_alloc_init(STMutableStatusBarData);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(id)objc_opt_class() entryKeys];
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    uint64_t v10 = @"satelliteEntry";
    id v18 = v4;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v12];
        if (v13)
        {
          long long v14 = (void *)v13;
          if ([(__CFString *)v10 isEqualToString:v12])
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              long long v15 = v10;
              if ([v14 isEnabled]) {
                +[STStatusBarDataSatelliteEntry entryWithConnectionStatus:1];
              }
              else {
              uint64_t v16 = +[STStatusBarDataEntry disabledEntry];
              }

              long long v14 = (void *)v16;
              uint64_t v10 = v15;
              id v4 = v18;
            }
          }
          [(STMutableStatusBarData *)v6 setEntry:v14 forKey:v12];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  _copyValuesFromDataToData((id *)&v6->super.super.isa, (id *)&v5->super.isa);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if ((isKindOfClass ^ objc_opt_isKindOfClass()))
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = v4;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v14 = [(STStatusBarData *)self valueForKey:v13];
          uint64_t v15 = [v7 valueForKey:v13];
          uint64_t v16 = (void *)v15;
          if (v14 | v15)
          {
            BOOL v17 = !v14 || v15 == 0;
            if (v17
              || (([(id)v14 isEnabled] & 1) != 0 || objc_msgSend(v16, "isEnabled"))
              && (BSEqualObjects() & 1) == 0)
            {

              BOOL v6 = 0;
              goto LABEL_20;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v6 = 1;
LABEL_20:
  }
  return v6;
}

- (NSString)description
{
  return (NSString *)[(STStatusBarData *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STStatusBarData *)self debugDescriptionWithMultilinePrefix:0];
}

- (STStatusBarData)initWithEntry:(id)a3 forKey:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)STStatusBarData;
  id v5 = a4;
  id v6 = a3;
  id v7 = [(STStatusBarData *)&v10 init];
  uint64_t v8 = objc_alloc_init(STMutableStatusBarData);
  -[STMutableStatusBarData setEntry:forKey:](v8, "setEntry:forKey:", v6, v5, v10.receiver, v10.super_class);

  _copyValuesFromDataToData((id *)&v8->super.super.isa, (id *)&v7->super.isa);
  return v7;
}

- (STStatusBarData)initWithKeysAndEntries:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STStatusBarData;
  id v5 = [(STStatusBarData *)&v19 init];
  id v6 = objc_alloc_init(STMutableStatusBarData);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12, (void)v15);
        if (v13) {
          [(STMutableStatusBarData *)v6 setEntry:v13 forKey:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v9);
  }

  _copyValuesFromDataToData((id *)&v6->super.super.isa, (id *)&v5->super.isa);
  return v5;
}

- (BOOL)isEmpty
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
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
        uint64_t v8 = [(STStatusBarData *)self valueForKey:*(void *)(*((void *)&v11 + 1) + 8 * i)];

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

- (id)dataByApplyingUpdate:(id)a3 keys:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(STMutableStatusBarData);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v15 = objc_msgSend(v6, "valueForKey:", v14, (void)v18);
        if (!v15)
        {
          long long v15 = [(STStatusBarData *)self valueForKey:v14];
          if (!v15) {
            continue;
          }
        }
        [(STMutableStatusBarData *)v8 setEntry:v15 forKey:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  uint64_t v16 = _STStatusBarDataMatchingMutabilityOfData(v8, self);

  return v16;
}

- (id)updateFromData:(id)a3
{
  id v4 = a3;
  id v5 = [(STStatusBarData *)self mutableCopy];
  [v5 makeUpdateFromData:v4];

  id v6 = _STStatusBarDataMatchingMutabilityOfData(v5, self);

  return v6;
}

- (id)dataByRemovingEntriesForKeys:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(STStatusBarData *)self mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "setEntry:forKey:", 0, *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  uint64_t v11 = _STStatusBarDataMatchingMutabilityOfData(v5, self);

  return v11;
}

- (id)dataByReplacingEntry:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STStatusBarData *)self mutableCopy];
  [v8 setEntry:v7 forKey:v6];

  uint64_t v9 = _STStatusBarDataMatchingMutabilityOfData(v8, self);

  return v9;
}

- (id)succinctDescription
{
  id v2 = [(STStatusBarData *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STStatusBarData *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STStatusBarData *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STStatusBarData *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(STStatusBarData *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  id v8 = [v7 activeMultilinePrefix];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__STStatusBarData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v13[3] = &unk_1E6B63080;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  [v9 appendBodySectionWithName:@"entries" multilinePrefix:v8 block:v13];

  uint64_t v10 = v14;
  id v11 = v9;

  return v11;
}

void __67__STStatusBarData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v8 = [*(id *)(a1 + 32) valueForKey:v7];
        if (v8) {
          id v9 = (id)[*(id *)(a1 + 40) appendObject:v8 withName:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)STStatusBarData;
  [(STStatusBarData *)&v4 setValue:a3 forKey:a4];
}

- (id)entryForKey:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STStatusBarData;
  uint64_t v3 = [(STStatusBarData *)&v5 valueForKey:a3];

  return v3;
}

- (STStatusBarDataEntry)nikeEntry
{
  return self->_nikeEntry;
}

@end