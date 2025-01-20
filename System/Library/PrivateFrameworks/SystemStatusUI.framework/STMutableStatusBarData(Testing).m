@interface STMutableStatusBarData(Testing)
+ (id)_sampleCellularEntryWithSeed:()Testing key:entryKeys:enabledEntryKeys:;
+ (id)orderedEntryKeys;
+ (id)sampleDataWithSeed:()Testing entryKeys:enabledEntryKeys:;
+ (id)subsetOfEntryKeys:()Testing withPercentage:;
- (id)subDataWithSupportedLegacyEntries;
- (uint64_t)legacyData;
@end

@implementation STMutableStatusBarData(Testing)

+ (id)orderedEntryKeys
{
  v31[31] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FA9800];
  v31[0] = *MEMORY[0x1E4FA9790];
  v31[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4FA9740];
  v31[2] = *MEMORY[0x1E4FA9750];
  v31[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4FA9788];
  v31[4] = *MEMORY[0x1E4FA97C8];
  v31[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4FA9768];
  v31[6] = *MEMORY[0x1E4FA97A0];
  v31[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4FA9718];
  v31[8] = *MEMORY[0x1E4FA9700];
  v31[9] = v6;
  uint64_t v7 = *MEMORY[0x1E4FA96F8];
  v31[10] = *MEMORY[0x1E4FA9738];
  v31[11] = v7;
  uint64_t v8 = *MEMORY[0x1E4FA97E8];
  v31[12] = *MEMORY[0x1E4FA97F8];
  v31[13] = v8;
  uint64_t v9 = *MEMORY[0x1E4FA97B8];
  v31[14] = *MEMORY[0x1E4FA9820];
  v31[15] = v9;
  uint64_t v10 = *MEMORY[0x1E4FA96F0];
  v31[16] = *MEMORY[0x1E4FA9730];
  v31[17] = v10;
  uint64_t v11 = *MEMORY[0x1E4FA9780];
  v31[18] = *MEMORY[0x1E4FA9708];
  v31[19] = v11;
  uint64_t v12 = *MEMORY[0x1E4FA97F0];
  v31[20] = *MEMORY[0x1E4FA9808];
  v31[21] = v12;
  uint64_t v13 = *MEMORY[0x1E4FA9758];
  v31[22] = *MEMORY[0x1E4FA9798];
  v31[23] = v13;
  uint64_t v14 = *MEMORY[0x1E4FA9818];
  v31[24] = *MEMORY[0x1E4FA97E0];
  v31[25] = v14;
  uint64_t v15 = *MEMORY[0x1E4FA9810];
  v31[26] = *MEMORY[0x1E4FA9728];
  v31[27] = v15;
  uint64_t v16 = *MEMORY[0x1E4FA9720];
  v31[28] = *MEMORY[0x1E4FA97D0];
  v31[29] = v16;
  v31[30] = *MEMORY[0x1E4FA9770];
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:31];
  v18 = (void *)[v17 mutableCopy];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v19 = objc_msgSend(a1, "entryKeys", 0);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if (([v18 containsObject:v24] & 1) == 0) {
          [v18 addObject:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v21);
  }

  return v18;
}

+ (id)subsetOfEntryKeys:()Testing withPercentage:
{
  id v6 = a4;
  uint64_t v7 = [a1 orderedEntryKeys];
  uint64_t v8 = llroundf((float)(unint64_t)[v7 count] * a2);
  uint64_t v9 = [MEMORY[0x1E4F1CA80] setWithCapacity:v8];
  if (v8 >= 1)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__STMutableStatusBarData_Testing__subsetOfEntryKeys_withPercentage___block_invoke;
    v11[3] = &unk_1E6AA3A90;
    id v12 = v6;
    id v13 = v9;
    uint64_t v14 = v8;
    [v7 enumerateObjectsUsingBlock:v11];
  }
  return v9;
}

+ (id)_sampleCellularEntryWithSeed:()Testing key:entryKeys:enabledEntryKeys:
{
  int v9 = (int)(float)(roundf(a1 * 25.0) + 97.0);
  uint64_t v10 = (void *)MEMORY[0x1E4FA9478];
  uint64_t v11 = (uint64_t)(roundf(a1 * 5.0) + 1.0);
  id v12 = NSString;
  unint64_t v13 = llroundf(a1 * 9.0) + 1;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  v17 = objc_msgSend(v12, "stringWithFormat:", @"Carrier Name %ld", v13);
  float v18 = a1 * 4.0;
  if ((float)(a1 * 4.0) >= 1.5 || v18 <= 1.25) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = @"SOS Only";
  }
  uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v9);
  unint64_t v22 = llroundf(v18);
  LOBYTE(v28) = a1 > 0.9;
  LOBYTE(v27) = a1 < 0.2;
  BYTE2(v26) = a1 < 0.1;
  BYTE1(v26) = a1 < 0.4;
  LOBYTE(v26) = v18 > 1.0;
  v23 = objc_msgSend(v10, "entryWithType:stringValue:crossfadeStringValue:badgeStringValue:wifiCalling:callForwarding:showsSOSWhenDisabled:sosAvailable:isBootstrapCellular:status:lowDataMode:rawValue:displayValue:displayRawValue:", v11, v17, v20, v21, a1 > 0.75, a1 < 0.3, v26, v22, v27, llroundf(a1 * 1000.0), v22, v28);

  uint64_t v24 = [MEMORY[0x1E4FA9478] entryWithKey:v16 updatedKeys:v15 enabledKeys:v14 populatedEntry:v23];

  return v24;
}

+ (id)sampleDataWithSeed:()Testing entryKeys:enabledEntryKeys:
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(a1);
  if (!v8)
  {
    v101 = [(objc_class *)a1 entryKeys];
    *(float *)&double v102 = a2;
    id v8 = [(objc_class *)a1 subsetOfEntryKeys:v101 withPercentage:v102];

    if (v9) {
      goto LABEL_3;
    }
LABEL_40:
    *(float *)&double v11 = a2;
    id v9 = [(objc_class *)a1 subsetOfEntryKeys:v8 withPercentage:v11];
    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_40;
  }
LABEL_3:
  v118 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(float)(a2 * 86400.0)];
  id v12 = objc_msgSend(MEMORY[0x1E4F28C10], "localizedStringFromDate:dateStyle:timeStyle:");
  unint64_t v13 = [MEMORY[0x1E4FA94C0] entryWithStringValue:v12];
  id v14 = [MEMORY[0x1E4FA94C0] entryWithKey:*MEMORY[0x1E4FA9800] updatedKeys:v8 enabledKeys:v9 populatedEntry:v13];

  [v10 setTimeEntry:v14];
  if (([v12 hasSuffix:@" AM"] & 1) != 0
    || [v12 hasSuffix:@" PM"])
  {
    uint64_t v15 = objc_msgSend(v12, "substringToIndex:", objc_msgSend(v12, "length") - 3);

    id v12 = (void *)v15;
  }
  v117 = v12;
  id v16 = [MEMORY[0x1E4FA94C0] entryWithStringValue:v12];
  v17 = [MEMORY[0x1E4FA94C0] entryWithKey:*MEMORY[0x1E4FA97D8] updatedKeys:v8 enabledKeys:v9 populatedEntry:v16];

  [v10 setShortTimeEntry:v17];
  float v18 = (void *)MEMORY[0x1E4FA94C0];
  v19 = (void *)MEMORY[0x1E4F28C10];
  uint64_t v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(float)((float)(a2 * 604800.0) + 1513700000.0)];
  uint64_t v21 = [v19 localizedStringFromDate:v20 dateStyle:1 timeStyle:0];
  unint64_t v22 = [v18 entryWithStringValue:v21];

  v23 = [MEMORY[0x1E4FA94C0] entryWithKey:*MEMORY[0x1E4FA9750] updatedKeys:v8 enabledKeys:v9 populatedEntry:v22];

  [v10 setDateEntry:v23];
  uint64_t v24 = (void *)MEMORY[0x1E4FA94C0];
  v25 = objc_msgSend(NSString, "stringWithFormat:", @"Person Name %ld", llroundf(a2 * 999.0) + 1);
  uint64_t v26 = [v24 entryWithStringValue:v25];

  uint64_t v27 = [MEMORY[0x1E4FA94C0] entryWithKey:*MEMORY[0x1E4FA9798] updatedKeys:v8 enabledKeys:v9 populatedEntry:v26];

  [v10 setPersonNameEntry:v27];
  uint64_t v28 = [MEMORY[0x1E4FA94C0] entryWithStringValue:@"iPod"];
  long long v29 = [MEMORY[0x1E4FA94C0] entryWithKey:*MEMORY[0x1E4FA9758] updatedKeys:v8 enabledKeys:v9 populatedEntry:v28];

  [v10 setDeviceNameEntry:v29];
  *(float *)&double v30 = a2;
  v31 = [(objc_class *)a1 _sampleCellularEntryWithSeed:*MEMORY[0x1E4FA9740] key:v8 entryKeys:v9 enabledEntryKeys:v30];
  [v10 setCellularEntry:v31];

  double v32 = a2;
  double v33 = -0.5;
  if (a2 < 0.5) {
    double v33 = 0.5;
  }
  double v34 = v33 + v32;
  *(float *)&double v34 = v34;
  v35 = [(objc_class *)a1 _sampleCellularEntryWithSeed:*MEMORY[0x1E4FA97C8] key:v8 entryKeys:v9 enabledEntryKeys:v34];
  [v10 setSecondaryCellularEntry:v35];

  unint64_t v36 = llroundf(a2 * 4.0);
  unint64_t v37 = llroundf(a2 * 1000.0);
  unint64_t v38 = llroundf(a2 * 3.0);
  BOOL v39 = v32 > 0.2 && a2 < 0.5;
  v40 = [MEMORY[0x1E4FA94E0] entryWithType:v32 > 0.9 status:v36 lowDataMode:v32 < 0.2 rawValue:v37 displayValue:v38 displayRawValue:v32 > 0.9];
  v41 = [MEMORY[0x1E4FA94E0] entryWithKey:*MEMORY[0x1E4FA9820] updatedKeys:v8 enabledKeys:v9 populatedEntry:v40];

  [v10 setWifiEntry:v41];
  unint64_t v42 = 0x1E4FA9000uLL;
  v43 = (void *)MEMORY[0x1E4FA9458];
  unint64_t v44 = llroundf(a2 * 100.0);
  unint64_t v45 = llroundf(a2 + a2);
  unint64_t v119 = v44;
  if (a2 <= 0.5)
  {
    v50 = objc_msgSend(MEMORY[0x1E4FA9458], "entryWithCapacity:state:saverMode:prominentlyShowsDetailString:detailString:", 0.6);
  }
  else
  {
    unint64_t v46 = v45;
    unint64_t v47 = v44;
    v48 = objc_msgSend(NSString, "stringWithFormat:", @"%ld%%", 0.6, v44);
    unint64_t v49 = v47;
    unint64_t v45 = v46;
    unint64_t v42 = 0x1E4FA9000;
    v50 = [v43 entryWithCapacity:v49 state:v45 saverMode:v39 prominentlyShowsDetailString:v32 > 0.6 detailString:v48];
  }
  v51 = [*(id *)(v42 + 1112) entryWithKey:*MEMORY[0x1E4FA9790] updatedKeys:v8 enabledKeys:v9 populatedEntry:v50];

  [v10 setMainBatteryEntry:v51];
  v52 = *(void **)(v42 + 1112);
  if (v32 <= 0.7) {
    [v52 disabledEntry];
  }
  else {
  v53 = [v52 entryWithCapacity:v119 state:v32 > 0.9 saverMode:0 prominentlyShowsDetailString:0 detailString:0];
  }
  v54 = [MEMORY[0x1E4FA9460] entryWithState:v45 batteryEntry:v53];
  v55 = [MEMORY[0x1E4FA9460] entryWithKey:*MEMORY[0x1E4FA9730] updatedKeys:v8 enabledKeys:v9 populatedEntry:v54];

  [v10 setBluetoothEntry:v55];
  unint64_t v56 = llroundf(a2 * 5.0);
  v57 = [MEMORY[0x1E4FA94D0] entryWithColor:v56 isSunlightMode:a2 > 0.5];
  v58 = [MEMORY[0x1E4FA94D0] entryWithKey:*MEMORY[0x1E4FA97F8] updatedKeys:v8 enabledKeys:v9 populatedEntry:v57];

  [v10 setThermalEntry:v58];
  if (a2 >= 0.25 && a2 <= 0.75) {
    uint64_t v60 = a2 > 0.5;
  }
  else {
    uint64_t v60 = (a2 > 0.5) | 2;
  }
  v61 = [MEMORY[0x1E4FA9448] entryWithType:v60 displayID:0];
  v62 = [MEMORY[0x1E4FA9448] entryWithKey:*MEMORY[0x1E4FA96F0] updatedKeys:v8 enabledKeys:v9 populatedEntry:v61];

  [v10 setActivityEntry:v62];
  if (a2 <= 0.5) {
    [MEMORY[0x1E4FA94C8] disabledEntry];
  }
  else {
  v63 = [MEMORY[0x1E4FA94C8] entryWithConnectionCount:v56];
  }
  v64 = [MEMORY[0x1E4FA94C8] entryWithKey:*MEMORY[0x1E4FA97F0] updatedKeys:v8 enabledKeys:v9 populatedEntry:v63];

  [v10 setTetheringEntry:v64];
  v65 = [MEMORY[0x1E4FA94A0] entryWithType:a2 > 0.5];
  v66 = [MEMORY[0x1E4FA94A0] entryWithKey:*MEMORY[0x1E4FA9780] updatedKeys:v8 enabledKeys:v9 populatedEntry:v65];

  [v10 setLocationEntry:v66];
  v67 = [MEMORY[0x1E4FA94A8] entryWithUnlockFailureCount:llround(v32)];
  v68 = [MEMORY[0x1E4FA94A8] entryWithKey:*MEMORY[0x1E4FA9788] updatedKeys:v8 enabledKeys:v9 populatedEntry:v67];

  [v10 setLockEntry:v68];
  v69 = [MEMORY[0x1E4FA94D8] entryWithType:v45];
  v70 = [MEMORY[0x1E4FA94D8] entryWithKey:*MEMORY[0x1E4FA9810] updatedKeys:v8 enabledKeys:v9 populatedEntry:v69];

  [v10 setVoiceControlEntry:v70];
  if ((int)(float)(a2 * 4.0))
  {
    char v73 = vcvts_n_s32_f32(a2, 3uLL);
    BOOL v74 = (v73 & 1) == 0;
    if (v73) {
      v75 = @"lanyardcard.fill";
    }
    else {
      v75 = @"car.fill";
    }
    if (v74) {
      v76 = @"Car";
    }
    else {
      v76 = @"Work";
    }
    v72 = v75;
    v71 = v76;
  }
  else
  {
    v71 = 0;
    v72 = 0;
  }
  v77 = [MEMORY[0x1E4FA94B0] entryWithFocusName:v71 imageNamed:v72 BOOLValue:a2 > 0.5];
  v78 = [MEMORY[0x1E4FA94B0] entryWithKey:*MEMORY[0x1E4FA97A0] updatedKeys:v8 enabledKeys:v9 populatedEntry:v77];

  [v10 setQuietModeEntry:v78];
  v79 = [MEMORY[0x1E4FA9468] entryWithBoolValue:a2 < 0.5];
  v80 = [MEMORY[0x1E4FA9468] entryWithKey:*MEMORY[0x1E4FA9768] updatedKeys:v8 enabledKeys:v9 populatedEntry:v79];

  [v10 setElectronicTollCollectionEntry:v80];
  v81 = [MEMORY[0x1E4FA9468] entryWithBoolValue:a2 > 0.5];
  v82 = [MEMORY[0x1E4FA9468] entryWithKey:*MEMORY[0x1E4FA97A8] updatedKeys:v8 enabledKeys:v9 populatedEntry:v81];

  [v10 setRadarEntry:v82];
  v83 = [MEMORY[0x1E4FA9468] entryWithBoolValue:a2 > 0.5];
  v84 = [MEMORY[0x1E4FA9468] entryWithKey:*MEMORY[0x1E4FA9710] updatedKeys:v8 enabledKeys:v9 populatedEntry:v83];

  [v10 setAnnounceNotificationsEntry:v84];
  v85 = [MEMORY[0x1E4FA9488] entryWithKey:*MEMORY[0x1E4FA97B8] updatedKeys:v8 enabledKeys:v9];
  [v10 setRotationLockEntry:v85];

  v86 = [MEMORY[0x1E4FA9488] entryWithKey:*MEMORY[0x1E4FA9700] updatedKeys:v8 enabledKeys:v9];
  [v10 setAirplaneModeEntry:v86];

  v87 = [MEMORY[0x1E4FA9488] entryWithKey:*MEMORY[0x1E4FA97E8] updatedKeys:v8 enabledKeys:v9];
  [v10 setTtyEntry:v87];

  v88 = [MEMORY[0x1E4FA9488] entryWithKey:*MEMORY[0x1E4FA9718] updatedKeys:v8 enabledKeys:v9];
  [v10 setAssistantEntry:v88];

  v89 = [MEMORY[0x1E4FA9488] entryWithKey:*MEMORY[0x1E4FA97E0] updatedKeys:v8 enabledKeys:v9];
  [v10 setStudentEntry:v89];

  v90 = [MEMORY[0x1E4FA9488] entryWithKey:*MEMORY[0x1E4FA9808] updatedKeys:v8 enabledKeys:v9];
  [v10 setVpnEntry:v90];

  v91 = [MEMORY[0x1E4FA9488] entryWithKey:*MEMORY[0x1E4FA9760] updatedKeys:v8 enabledKeys:v9];
  [v10 setDisplayWarningEntry:v91];

  v92 = [MEMORY[0x1E4FA9488] entryWithKey:*MEMORY[0x1E4FA96F8] updatedKeys:v8 enabledKeys:v9];
  [v10 setAirPlayEntry:v92];

  v93 = [MEMORY[0x1E4FA9488] entryWithKey:*MEMORY[0x1E4FA9738] updatedKeys:v8 enabledKeys:v9];
  [v10 setCarPlayEntry:v93];

  v94 = [MEMORY[0x1E4FA9488] entryWithKey:*MEMORY[0x1E4FA9708] updatedKeys:v8 enabledKeys:v9];
  [v10 setAlarmEntry:v94];

  v95 = [MEMORY[0x1E4FA9488] entryWithKey:*MEMORY[0x1E4FA97D0] updatedKeys:v8 enabledKeys:v9];
  [v10 setSensorActivityEntry:v95];

  v96 = STUIBackgroundActivityIdentifiersForStyleOverrides(-1);
  unint64_t v97 = vcvtas_u32_f32((float)(unint64_t)[v96 count] * a2);
  v98 = [v96 allObjects];
  v99 = [v98 objectAtIndexedSubscript:v97];

  if ([(id)*MEMORY[0x1E4FA9620] isEqualToString:v99])
  {
    v100 = @"Touch to return to Phone";
  }
  else if ([(id)*MEMORY[0x1E4FA9628] isEqualToString:v99])
  {
    v100 = @"Touch to return to FaceTime";
  }
  else if (([(id)*MEMORY[0x1E4FA9650] isEqualToString:v99] & 1) != 0 {
         || ([(id)*MEMORY[0x1E4FA9648] isEqualToString:v99] & 1) != 0)
  }
  {
    v100 = @"Touch to return to Navigation";
  }
  else if ([(id)*MEMORY[0x1E4FA9668] isEqualToString:v99])
  {
    v100 = @"Touch to return to Voice Memos";
  }
  else if ([(id)*MEMORY[0x1E4FA9680] isEqualToString:v99])
  {
    v100 = @"Touch to stop screen recording";
  }
  else if ([(id)*MEMORY[0x1E4FA95A8] isEqualToString:v99])
  {
    v100 = 0;
  }
  else
  {
    v100 = @"Touch to return to activity";
  }
  v103 = (void *)MEMORY[0x1E4FA9450];
  if (a2 <= 0.5)
  {
    v105 = &stru_1F2F86950;
    double v104 = CACurrentMediaTime();
  }
  else
  {
    double v104 = 0.0;
    v105 = @"Long Named ";
  }
  v106 = [v103 entryWithBackgroundActivityIdentifier:v99 displayStartDate:v100 detailString:v104];
  v107 = [MEMORY[0x1E4FA9450] entryWithKey:*MEMORY[0x1E4FA9728] updatedKeys:v8 enabledKeys:v9 populatedEntry:v106];

  [v10 setBackgroundActivityEntry:v107];
  v108 = (void *)MEMORY[0x1E4FA94C0];
  v109 = [NSString stringWithFormat:@"%@App %ld", v105, v119];
  v110 = [v108 entryWithStringValue:v109];

  v111 = [MEMORY[0x1E4FA94C0] entryWithKey:*MEMORY[0x1E4FA9720] updatedKeys:v8 enabledKeys:v9 populatedEntry:v110];

  [v10 setBackNavigationEntry:v111];
  v112 = (void *)MEMORY[0x1E4FA94C0];
  v113 = objc_msgSend(NSString, "stringWithFormat:", @"Safari %ld", v119);
  v114 = [v112 entryWithStringValue:v113];

  v115 = [MEMORY[0x1E4FA94C0] entryWithKey:*MEMORY[0x1E4FA9770] updatedKeys:v8 enabledKeys:v9 populatedEntry:v114];

  [v10 setForwardNavigationEntry:v115];
  return v10;
}

- (id)subDataWithSupportedLegacyEntries
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FA9800], *MEMORY[0x1E4FA97D8], *MEMORY[0x1E4FA9750], *MEMORY[0x1E4FA9798], *MEMORY[0x1E4FA9790], *MEMORY[0x1E4FA9730], *MEMORY[0x1E4FA97F8], *MEMORY[0x1E4FA96F0], *MEMORY[0x1E4FA97F0], *MEMORY[0x1E4FA9788], *MEMORY[0x1E4FA97A0], *MEMORY[0x1E4FA9768], *MEMORY[0x1E4FA97A8], *MEMORY[0x1E4FA97B8], *MEMORY[0x1E4FA9780], *MEMORY[0x1E4FA9700], *MEMORY[0x1E4FA97E8],
    *MEMORY[0x1E4FA9718],
    *MEMORY[0x1E4FA97E0],
    *MEMORY[0x1E4FA9808],
    *MEMORY[0x1E4FA9810],
    *MEMORY[0x1E4FA96F8],
    *MEMORY[0x1E4FA9738],
    *MEMORY[0x1E4FA9708],
    *MEMORY[0x1E4FA9710],
  uint64_t v2 = 0);
  uint64_t v3 = [a1 dataByApplyingUpdate:a1 keys:v2];
  uint64_t v4 = [v3 lockEntry];
  int v5 = [v4 isEnabled];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4FA94A8] entryWithUnlockFailureCount:0];
    [v3 setLockEntry:v6];
  }
  uint64_t v7 = [v3 bluetoothEntry];
  id v8 = [v7 batteryEntry];
  int v9 = [v8 isEnabled];

  if (v9)
  {
    v25 = (void *)MEMORY[0x1E4FA9458];
    uint64_t v27 = [v3 bluetoothEntry];
    uint64_t v26 = [v27 batteryEntry];
    uint64_t v24 = [v26 capacity];
    id v10 = [v3 bluetoothEntry];
    double v11 = [v10 batteryEntry];
    uint64_t v12 = [v11 saverModeActive];
    unint64_t v13 = [v3 bluetoothEntry];
    id v14 = [v13 batteryEntry];
    uint64_t v15 = [v14 prominentlyShowsDetailString];
    [v3 bluetoothEntry];
    id v16 = v28 = v2;
    v17 = [v16 batteryEntry];
    float v18 = [v17 detailString];
    v19 = [v25 entryWithCapacity:v24 state:0 saverMode:v12 prominentlyShowsDetailString:v15 detailString:v18];

    uint64_t v20 = (void *)MEMORY[0x1E4FA9460];
    uint64_t v21 = [v3 bluetoothEntry];
    unint64_t v22 = objc_msgSend(v20, "entryWithState:batteryEntry:", objc_msgSend(v21, "state"), v19);
    [v3 setBluetoothEntry:v22];

    uint64_t v2 = v28;
  }

  return v3;
}

- (uint64_t)legacyData
{
  uint64_t v142 = 0;
  v143 = &v142;
  uint64_t v144 = 0x2020000000;
  v145 = 0;
  v145 = malloc_type_calloc(1uLL, 0xF28uLL, 0x100004080157F5AuLL);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__STMutableStatusBarData_Testing__legacyData__block_invoke;
  aBlock[3] = &unk_1E6AA3AB8;
  aBlock[4] = &v142;
  uint64_t v2 = (uint64_t (**)(void *, void, void *))_Block_copy(aBlock);
  uint64_t v3 = [a1 shortTimeEntry];
  int v4 = v2[2](v2, 0, v3);

  if (v4)
  {
    uint64_t v5 = v143[3];
    id v6 = [a1 timeEntry];
    id v7 = [v6 stringValue];
    strncpy((char *)(v5 + 46), (const char *)[v7 UTF8String], 0x40uLL);

    uint64_t v8 = v143[3];
    int v9 = [a1 shortTimeEntry];
    id v10 = [v9 stringValue];
    strncpy((char *)(v8 + 110), (const char *)[v10 UTF8String], 0x40uLL);
  }
  double v11 = [a1 dateEntry];
  int v12 = v2[2](v2, 1, v11);

  if (v12)
  {
    uint64_t v13 = v143[3];
    id v14 = [a1 dateEntry];
    id v15 = [v14 stringValue];
    strncpy((char *)(v13 + 174), (const char *)[v15 UTF8String], 0x100uLL);
  }
  id v16 = [a1 personNameEntry];
  int v17 = v2[2](v2, 8, v16);

  if (v17)
  {
    uint64_t v18 = v143[3];
    v19 = [a1 personNameEntry];
    id v20 = [v19 stringValue];
    strncpy((char *)(v18 + 3049), (const char *)[v20 UTF8String], 0x64uLL);
  }
  uint64_t v21 = [a1 cellularEntry];
  unint64_t v22 = v21;
  if (!v21 || ![v21 isEnabled])
  {
    BOOL v25 = 0;
    goto LABEL_36;
  }
  *(unsigned char *)(v143[3] + 4) = 1;
  switch([v22 status])
  {
    case 0:
      *(unsigned char *)(v143[3] + 4) = 0;
      break;
    case 1:
    case 2:
      uint64_t v23 = v143[3];
      int v24 = 1;
      goto LABEL_15;
    case 3:
      uint64_t v23 = v143[3];
      int v24 = 5;
      goto LABEL_15;
    case 4:
      uint64_t v23 = v143[3];
      int v24 = 6;
LABEL_15:
      *(_DWORD *)(v23 + 2072) = v24;
      break;
    case 5:
      *(_DWORD *)(v143[3] + 2072) = 0;
      break;
    default:
      break;
  }
  if ([v22 isBootstrapCellular])
  {
    uint64_t v26 = [v22 status];
    if (v26 == 2)
    {
      int v27 = 8;
      goto LABEL_21;
    }
    if (v26 == 5)
    {
      int v27 = 7;
LABEL_21:
      *(_DWORD *)(v143[3] + 2072) = v27;
    }
  }
  unint64_t v28 = [v22 type] - 1;
  BOOL v25 = v28 < 0xF;
  if (v28 <= 0xE) {
    *(_DWORD *)(v143[3] + 2096) = dword_1D7ED5970[v28];
  }
  long long v29 = [v22 string];

  if (v29)
  {
    *(unsigned char *)(v143[3] + 6) = 1;
    uint64_t v30 = v143[3];
    id v31 = [v22 string];
    strncpy((char *)(v30 + 448), (const char *)[v31 UTF8String], 0x64uLL);

    double v32 = [v22 crossfadeString];

    if (v32)
    {
      uint64_t v33 = v143[3];
      id v34 = [v22 crossfadeString];
      strncpy((char *)(v33 + 648), (const char *)[v34 UTF8String], 0x64uLL);
    }
    v35 = [v22 badgeString];

    if (v35)
    {
      uint64_t v36 = v143[3];
      id v37 = [v22 badgeString];
      strncpy((char *)(v36 + 3161), (const char *)[v37 UTF8String], 0x64uLL);
    }
  }
  int v38 = [v22 rawValue];
  *(_DWORD *)(v143[3] + 432) = v38;
  int v39 = [v22 displayValue];
  *(_DWORD *)(v143[3] + 440) = v39;
  if ([v22 displayRawValue]) {
    char v40 = 2;
  }
  else {
    char v40 = 0;
  }
  *(unsigned char *)(v143[3] + 2529) = *(unsigned char *)(v143[3] + 2529) & 0xFD | v40;
  char v41 = [v22 showsSOSWhenDisabled];
  *(unsigned char *)(v143[3] + 3160) = *(unsigned char *)(v143[3] + 3160) & 0xFE | v41;
  if ([v22 sosAvailable]) {
    char v42 = 2;
  }
  else {
    char v42 = 0;
  }
  *(unsigned char *)(v143[3] + 3160) = *(unsigned char *)(v143[3] + 3160) & 0xFD | v42;
  char v43 = [v22 callForwardingEnabled];
  *(unsigned char *)(v143[3] + 30) = v43;
LABEL_36:
  unint64_t v44 = [a1 wifiEntry];
  unint64_t v45 = v44;
  if (!v44 || ![v44 isEnabled]) {
    goto LABEL_55;
  }
  uint64_t v46 = [v45 status];
  switch(v46)
  {
    case 3:
      uint64_t v47 = v143[3];
      char v48 = *(unsigned char *)(v47 + 3149) | 0x10;
LABEL_44:
      *(unsigned char *)(v47 + 3149) = v48;
      goto LABEL_45;
    case 4:
      uint64_t v47 = v143[3];
      char v48 = *(unsigned char *)(v47 + 3149) | 8;
      goto LABEL_44;
    case 5:
LABEL_45:
      BOOL v25 = 1;
      break;
  }
  uint64_t v49 = [v45 type];
  if (!v49)
  {
    int v50 = 5;
    goto LABEL_50;
  }
  if (v49 == 1)
  {
    int v50 = 6;
LABEL_50:
    *(_DWORD *)(v143[3] + 2096) = v50;
  }
  int v51 = [v45 rawValue];
  *(_DWORD *)(v143[3] + 2084) = v51;
  int v52 = [v45 displayValue];
  *(_DWORD *)(v143[3] + 2088) = v52;
  if ([v45 displayRawValue]) {
    char v53 = 4;
  }
  else {
    char v53 = 0;
  }
  *(unsigned char *)(v143[3] + 2529) = *(unsigned char *)(v143[3] + 2529) & 0xFB | v53;
LABEL_55:
  *(unsigned char *)(v143[3] + 9) = v25;
  v54 = [a1 mainBatteryEntry];
  int v55 = v2[2](v2, 12, v54);

  if (v55)
  {
    unint64_t v56 = [a1 mainBatteryEntry];
    int v57 = [v56 capacity];
    *(_DWORD *)(v143[3] + 2104) = v57;

    v58 = [a1 mainBatteryEntry];
    int v59 = [v58 state];
    *(_DWORD *)(v143[3] + 2108) = v59;

    uint64_t v60 = [a1 mainBatteryEntry];
    char v61 = [v60 saverModeActive];
    *(unsigned char *)(v143[3] + 2536) = *(unsigned char *)(v143[3] + 2536) & 0xFE | v61;

    v62 = [a1 mainBatteryEntry];
    v63 = [v62 detailString];

    if (v63)
    {
      uint64_t v64 = v143[3];
      v65 = [a1 mainBatteryEntry];
      id v66 = [v65 detailString];
      strncpy((char *)(v64 + 2112), (const char *)[v66 UTF8String], 0x96uLL);
    }
  }
  v67 = [a1 bluetoothEntry];
  int v68 = v2[2](v2, 16, v67);

  if (v68)
  {
    v69 = [a1 bluetoothEntry];
    uint64_t v70 = [v69 state];

    if (v70 == 2)
    {
      v71 = v143;
      *(unsigned char *)(v143[3] + 2529) |= 1u;
      *(unsigned char *)(v71[3] + 42) = 1;
    }
    else if (v70 == 1)
    {
      *(unsigned char *)(v143[3] + 2529) |= 1u;
    }
    v72 = [a1 bluetoothEntry];
    char v73 = [v72 batteryEntry];

    if (v73)
    {
      char v74 = [v73 isEnabled];
      *(unsigned char *)(v143[3] + 15) = v74;
      int v75 = [v73 capacity];
      *(_DWORD *)(v143[3] + 2264) = v75;
    }
  }
  v76 = [a1 thermalEntry];
  int v77 = v2[2](v2, 33, v76);

  if (v77)
  {
    v78 = [a1 thermalEntry];
    unint64_t v79 = [v78 color];

    if (v79 <= 5) {
      *(_DWORD *)(v143[3] + 2268) = v79 + 1;
    }
    v80 = [a1 thermalEntry];
    char v81 = [v80 sunlightMode];
    *(unsigned char *)(v143[3] + 2272) = *(unsigned char *)(v143[3] + 2272) & 0xFE | v81;
  }
  v82 = [a1 activityEntry];
  int v83 = v2[2](v2, 32, v82);

  if (v83)
  {
    v84 = [a1 activityEntry];
    char v85 = [v84 type];

    if ((v85 & 2) != 0) {
      *(unsigned char *)(v143[3] + 2272) |= 2u;
    }
    if (v85) {
      *(unsigned char *)(v143[3] + 2272) |= 4u;
    }
    v86 = [a1 activityEntry];
    v87 = [v86 displayId];

    if (v87)
    {
      uint64_t v88 = v143[3];
      v89 = [a1 activityEntry];
      id v90 = [v89 displayId];
      strncpy((char *)(v88 + 2273), (const char *)[v90 UTF8String], 0x100uLL);
    }
  }
  v91 = [a1 tetheringEntry];
  if ([v91 isEnabled])
  {
    v92 = [a1 tetheringEntry];
    int v93 = [v92 connectionCount];
    *(_DWORD *)(v143[3] + 2532) = v93;
  }
  else
  {
    *(_DWORD *)(v143[3] + 2532) = 0;
  }

  v94 = [a1 locationEntry];
  int v95 = v2[2](v2, 21, v94);

  if (v95)
  {
    v96 = [a1 locationEntry];
    char v97 = [v96 type];
    *(unsigned char *)(v143[3] + 2529) = *(unsigned char *)(v143[3] + 2529) & 0xE7 | (8 * (v97 & 3));
  }
  v98 = [a1 quietModeEntry];
  int v99 = v2[2](v2, 2, v98);

  if (v99)
  {
    v100 = [a1 quietModeEntry];
    if ([v100 BOOLValue]) {
      char v101 = 0;
    }
    else {
      char v101 = 0x80;
    }
    *(unsigned char *)(v143[3] + 2529) = v101 & 0x80 | *(unsigned char *)(v143[3] + 2529) & 0x7F;
  }
  double v102 = [a1 electronicTollCollectionEntry];
  int v103 = v2[2](v2, 35, v102);

  if (v103)
  {
    double v104 = [a1 electronicTollCollectionEntry];
    char v105 = [v104 BOOLValue];
    *(unsigned char *)(v143[3] + 3149) = *(unsigned char *)(v143[3] + 3149) & 0xFE | v105;
  }
  v106 = [a1 radarEntry];
  int v107 = v2[2](v2, 34, v106);

  if (v107)
  {
    v108 = [a1 radarEntry];
    if ([v108 BOOLValue]) {
      char v109 = 2;
    }
    else {
      char v109 = 0;
    }
    *(unsigned char *)(v143[3] + 3149) = *(unsigned char *)(v143[3] + 3149) & 0xFD | v109;
  }
  v110 = [a1 lockEntry];
  v2[2](v2, 39, v110);

  v111 = [a1 rotationLockEntry];
  v2[2](v2, 22, v111);

  v112 = [a1 airplaneModeEntry];
  v2[2](v2, 3, v112);

  v113 = [a1 ttyEntry];
  v2[2](v2, 17, v113);

  v114 = [a1 nikeEntry];
  v2[2](v2, 19, v114);

  v115 = [a1 assistantEntry];
  v2[2](v2, 25, v115);

  v116 = [a1 studentEntry];
  v2[2](v2, 27, v116);

  v117 = [a1 vpnEntry];
  v2[2](v2, 29, v117);

  v118 = [a1 liquidDetectionEntry];
  v2[2](v2, 40, v118);

  unint64_t v119 = [a1 displayWarningEntry];
  v2[2](v2, 44, v119);

  v120 = [a1 voiceControlEntry];
  v2[2](v2, 41, v120);

  v121 = [a1 airPlayEntry];
  v2[2](v2, 24, v121);

  v122 = [a1 carPlayEntry];
  v2[2](v2, 26, v122);

  v123 = [a1 alarmEntry];
  v2[2](v2, 18, v123);

  v124 = [a1 satelliteEntry];
  v2[2](v2, 45, v124);

  v125 = [a1 sensorActivityEntry];
  v2[2](v2, 28, v125);

  v126 = [a1 announceNotificationsEntry];
  v2[2](v2, 38, v126);

  v127 = [a1 backNavigationEntry];
  if ([v127 isEnabled])
  {
    v128 = [a1 backNavigationEntry];
    v129 = [v128 stringValue];
    uint64_t v130 = [v129 length];

    if (!v130) {
      goto LABEL_98;
    }
    uint64_t v131 = v143[3];
    v127 = [a1 backNavigationEntry];
    id v132 = [v127 stringValue];
    strncpy((char *)(v131 + 2537), (const char *)[v132 UTF8String], 0x100uLL);
  }
LABEL_98:
  v133 = [a1 forwardNavigationEntry];
  if (![v133 isEnabled])
  {
LABEL_101:

    goto LABEL_102;
  }
  v134 = [a1 forwardNavigationEntry];
  v135 = [v134 stringValue];
  uint64_t v136 = [v135 length];

  if (v136)
  {
    uint64_t v137 = v143[3];
    v133 = [a1 forwardNavigationEntry];
    id v138 = [v133 stringValue];
    strncpy((char *)(v137 + 2793), (const char *)[v138 UTF8String], 0x100uLL);

    goto LABEL_101;
  }
LABEL_102:
  uint64_t v139 = v143[3];

  _Block_object_dispose(&v142, 8);
  return v139;
}

@end