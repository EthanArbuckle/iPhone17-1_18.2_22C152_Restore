@interface _UIStatusBarDataConverter
+ (id)_cellularEntryWithData:(id *)a3 signalStrengthEnabled:(BOOL)a4 serviceEnabled:(BOOL)a5 dataNetworkEnabled:(BOOL)a6 serviceString:(const char *)a7 serviceCrossfadeString:(const char *)a8 serviceBadgeString:(const char *)a9 serviceContentType:(unsigned int)a10 dataNetworkType:(unsigned int)a11 gsmSignalStrengthRaw:(int)a12 gsmSignalStrengthBars:(int)a13 callForwardingType:(int)a14 lowDataModeActive:(BOOL)a15;
+ (id)convertData:(id *)a3 fromReferenceData:(id)a4;
@end

@implementation _UIStatusBarDataConverter

+ (id)_cellularEntryWithData:(id *)a3 signalStrengthEnabled:(BOOL)a4 serviceEnabled:(BOOL)a5 dataNetworkEnabled:(BOOL)a6 serviceString:(const char *)a7 serviceCrossfadeString:(const char *)a8 serviceBadgeString:(const char *)a9 serviceContentType:(unsigned int)a10 dataNetworkType:(unsigned int)a11 gsmSignalStrengthRaw:(int)a12 gsmSignalStrengthBars:(int)a13 callForwardingType:(int)a14 lowDataModeActive:(BOOL)a15
{
  BOOL v16 = a6;
  BOOL v17 = a5;
  BOOL v18 = a4;
  v19 = objc_alloc_init(_UIStatusBarDataCellularEntry);
  BOOL v38 = v16;
  [(_UIStatusBarDataEntry *)v19 setEnabled:(v17 || v16) | v18];
  BOOL v20 = [(_UIStatusBarDataEntry *)v19 isEnabled];
  if (a10 == 2 && v20 && !v18 && v17) {
    [(_UIStatusBarDataEntry *)v19 setEnabled:0];
  }
  if ([(_UIStatusBarDataEntry *)v19 isEnabled])
  {
    if (!v17)
    {
      [(_UIStatusBarDataNetworkEntry *)v19 setStatus:0];
      BOOL v24 = a15;
      int v25 = a14;
      int v26 = a13;
LABEL_39:
      if (v38)
      {
        if (a11 > 0xE) {
          uint64_t v34 = 5;
        }
        else {
          uint64_t v34 = qword_186B9D170[a11];
        }
      }
      else
      {
        uint64_t v34 = 0;
      }
      [(_UIStatusBarDataCellularEntry *)v19 setType:v34];
      [(_UIStatusBarDataIntegerEntry *)v19 setRawValue:a12];
      [(_UIStatusBarDataIntegerEntry *)v19 setDisplayValue:v26];
      [(_UIStatusBarDataIntegerEntry *)v19 setDisplayRawValue:(*((unsigned __int8 *)a3 + 2529) >> 1) & 1];
      [(_UIStatusBarDataCellularEntry *)v19 setShowsSOSWhenDisabled:*((unsigned char *)a3 + 3160) & 1];
      [(_UIStatusBarDataCellularEntry *)v19 setSosAvailable:(*((unsigned __int8 *)a3 + 3160) >> 1) & 1];
      [(_UIStatusBarDataCellularEntry *)v19 setCallForwardingEnabled:a3->var0[v25]];
      [(_UIStatusBarDataNetworkEntry *)v19 setLowDataModeActive:v24];
      goto LABEL_45;
    }
    if (v18)
    {
      BOOL v24 = a15;
      int v25 = a14;
      int v26 = a13;
      v27 = a9;
      v28 = v37;
      switch(a10)
      {
        case 0u:
        case 2u:
        case 3u:
        case 4u:
          goto LABEL_29;
        case 1u:
          goto LABEL_31;
        case 5u:
          v29 = v19;
          uint64_t v30 = 3;
          goto LABEL_32;
        case 6u:
          v29 = v19;
          uint64_t v30 = 4;
          goto LABEL_32;
        case 7u:
          [(_UIStatusBarDataCellularEntry *)v19 setIsBootstrapCellular:1];
LABEL_29:
          v29 = v19;
          uint64_t v30 = 5;
          goto LABEL_32;
        case 8u:
          [(_UIStatusBarDataCellularEntry *)v19 setIsBootstrapCellular:1];
LABEL_31:
          v29 = v19;
          uint64_t v30 = 2;
LABEL_32:
          [(_UIStatusBarDataNetworkEntry *)v29 setStatus:v30];
          break;
        default:
          goto LABEL_33;
      }
      goto LABEL_33;
    }
    if (a10 - 7 < 2)
    {
      [(_UIStatusBarDataCellularEntry *)v19 setIsBootstrapCellular:1];
      BOOL v24 = a15;
      int v26 = a13;
    }
    else
    {
      if (a10 == 5)
      {
        [(_UIStatusBarDataNetworkEntry *)v19 setStatus:3];
        BOOL v24 = a15;
        int v25 = a14;
        int v26 = a13;
        goto LABEL_26;
      }
      BOOL v24 = a15;
      int v26 = a13;
      if (!a10)
      {
        [(_UIStatusBarDataNetworkEntry *)v19 setStatus:2];
        [(_UIStatusBarDataCellularEntry *)v19 setWifiCallingEnabled:1];
LABEL_24:
        int v25 = a14;
LABEL_26:
        v27 = a9;
        v28 = v37;
LABEL_33:
        if (*a7)
        {
          v31 = [NSString stringWithUTF8String:a7];
          [(_UIStatusBarDataCellularEntry *)v19 setString:v31];
        }
        if (*v28)
        {
          v32 = [NSString stringWithUTF8String:v28];
          [(_UIStatusBarDataCellularEntry *)v19 setCrossfadeString:v32];
        }
        if (*v27)
        {
          v33 = [NSString stringWithUTF8String:v27];
          [(_UIStatusBarDataCellularEntry *)v19 setBadgeString:v33];
        }
        goto LABEL_39;
      }
    }
    [(_UIStatusBarDataNetworkEntry *)v19 setStatus:1];
    goto LABEL_24;
  }
LABEL_45:
  return v19;
}

+ (id)convertData:(id *)a3 fromReferenceData:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(_UIStatusBarData);
  id v8 = [[_UIStatusBarDataStringEntry alloc] initFromData:a3 type:0 string:a3->var1 maxLength:64];
  [(_UIStatusBarData *)v7 setTimeEntry:v8];

  id v9 = [[_UIStatusBarDataStringEntry alloc] initFromData:a3 type:0 string:a3->var2 maxLength:64];
  [(_UIStatusBarData *)v7 setShortTimeEntry:v9];

  id v10 = [[_UIStatusBarDataStringEntry alloc] initFromData:a3 type:1 string:a3->var3 maxLength:256];
  [(_UIStatusBarData *)v7 setDateEntry:v10];

  id v11 = [[_UIStatusBarDataStringEntry alloc] initFromData:a3 type:8 string:a3->var44 maxLength:100];
  [(_UIStatusBarData *)v7 setPersonNameEntry:v11];

  v12 = objc_alloc_init(_UIStatusBarDataStringEntry);
  v13 = v12;
  if (a3->var14 == 2 && a3->var8[0])
  {
    v14 = [NSString stringWithUTF8String:a3->var8];
    [(_UIStatusBarDataStringEntry *)v13 setStringValue:v14];
  }
  else
  {
    [(_UIStatusBarDataEntry *)v12 setEnabled:0];
  }
  [(_UIStatusBarData *)v7 setDeviceNameEntry:v13];

  BYTE4(v66) = *((unsigned char *)a3 + 2080) & 1;
  HIDWORD(v64) = a3->var6;
  LODWORD(v66) = 30;
  HIDWORD(v62) = a3->var21;
  LODWORD(v64) = a3->var4;
  LODWORD(v62) = a3->var14;
  v15 = objc_msgSend(a1, "_cellularEntryWithData:signalStrengthEnabled:serviceEnabled:dataNetworkEnabled:serviceString:serviceCrossfadeString:serviceBadgeString:serviceContentType:dataNetworkType:gsmSignalStrengthRaw:gsmSignalStrengthBars:callForwardingType:lowDataModeActive:", a3, a3->var0[4], a3->var0[6], a3->var0[9], a3->var8, a3->var10, a3->var54, v62, v64, v66);
  [(_UIStatusBarData *)v7 setCellularEntry:v15];

  BYTE4(v67) = (*((unsigned char *)a3 + 2080) & 2) != 0;
  HIDWORD(v65) = a3->var7;
  LODWORD(v67) = 31;
  HIDWORD(v63) = a3->var22;
  LODWORD(v65) = a3->var5;
  LODWORD(v63) = a3->var15;
  BOOL v16 = objc_msgSend(a1, "_cellularEntryWithData:signalStrengthEnabled:serviceEnabled:dataNetworkEnabled:serviceString:serviceCrossfadeString:serviceBadgeString:serviceContentType:dataNetworkType:gsmSignalStrengthRaw:gsmSignalStrengthBars:callForwardingType:lowDataModeActive:", a3, a3->var0[5], a3->var0[7], a3->var0[10], a3->var9, a3->var11, a3->var55, v63, v65, v67);
  [(_UIStatusBarData *)v7 setSecondaryCellularEntry:v16];

  BOOL v17 = [(_UIStatusBarData *)v7 secondaryCellularEntry];
  if (![(_UIStatusBarDataEntry *)v17 isEnabled])
  {
    char v18 = *((unsigned char *)a3 + 3160);

    if ((v18 & 4) == 0) {
      goto LABEL_9;
    }
    BOOL v17 = objc_alloc_init(_UIStatusBarDataCellularEntry);
    [(_UIStatusBarData *)v7 setSecondaryCellularEntry:v17];
  }

LABEL_9:
  v19 = +[_UIStatusBarDataEntry disabledEntry];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v69 = __59___UIStatusBarDataConverter_convertData_fromReferenceData___block_invoke;
  v70 = &unk_1E5307810;
  id v20 = v19;
  id v71 = v20;
  v72 = a3;
  __59___UIStatusBarDataConverter_convertData_fromReferenceData___block_invoke((uint64_t)v68, 9u, a3->var21);
  v69((uint64_t)v68, 10u, a3->var22);
  if ([v20 isEnabled])
  {
    uint64_t v21 = 3;
    if ((*((unsigned char *)a3 + 3149) & 0x10) == 0) {
      uint64_t v21 = 5;
    }
    if ((*((unsigned char *)a3 + 3149) & 8) != 0) {
      uint64_t v22 = 4;
    }
    else {
      uint64_t v22 = v21;
    }
    [v20 setStatus:v22];
    [v20 setRawValue:a3->var18];
    [v20 setDisplayValue:a3->var19];
    [v20 setDisplayRawValue:(*((unsigned __int8 *)a3 + 2529) >> 2) & 1];
    [v20 setLowDataModeActive:*((unsigned char *)a3 + 2092) & 1];
  }

  [(_UIStatusBarData *)v7 setWifiEntry:v20];
  id v23 = [(_UIStatusBarDataEntry *)[_UIStatusBarDataBatteryEntry alloc] initFromData:a3 type:12];
  if ([v23 isEnabled])
  {
    [v23 setCapacity:a3->var23];
    if (a3->var0[14])
    {
      [v23 setState:3];
      BOOL v24 = 1;
    }
    else
    {
      [v23 setState:a3->var24];
      BOOL v24 = a3->var0[13];
    }
    [v23 setProminentlyShowsDetailString:v24];
    [v23 setSaverModeActive:*((unsigned char *)a3 + 2536) & 1];
    if (a3->var25[0])
    {
      int v25 = [NSString stringWithUTF8String:a3->var25];
      [v23 setDetailString:v25];
    }
  }
  [(_UIStatusBarData *)v7 setMainBatteryEntry:v23];

  id v26 = [(_UIStatusBarDataEntry *)[_UIStatusBarDataBluetoothEntry alloc] initFromData:a3 type:16];
  if ([v26 isEnabled])
  {
    if (a3->var0[42]) {
      uint64_t v27 = 2;
    }
    else {
      uint64_t v27 = *((unsigned char *)a3 + 2529) & 1;
    }
    [v26 setState:v27];
    id v28 = [(_UIStatusBarDataEntry *)[_UIStatusBarDataBatteryEntry alloc] initFromData:a3 type:15];
    if ([v28 isEnabled])
    {
      [v28 setCapacity:a3->var26];
      [v28 setState:0];
    }
    [v26 setBatteryEntry:v28];
  }
  [(_UIStatusBarData *)v7 setBluetoothEntry:v26];

  id v29 = [(_UIStatusBarDataEntry *)[_UIStatusBarDataThermalEntry alloc] initFromData:a3 type:33];
  uint64_t v30 = v29;
  switch(a3->var27)
  {
    case 0:
      [v29 setEnabled:0];
      break;
    case 1:
      uint64_t v31 = 0;
      goto LABEL_37;
    case 2:
      uint64_t v31 = 1;
      goto LABEL_37;
    case 3:
      uint64_t v31 = 2;
      goto LABEL_37;
    case 4:
      uint64_t v31 = 3;
      goto LABEL_37;
    case 5:
      uint64_t v31 = 4;
      goto LABEL_37;
    case 6:
      uint64_t v31 = 5;
LABEL_37:
      [v29 setColor:v31];
      break;
    default:
      break;
  }
  [v30 setSunlightMode:*((unsigned char *)a3 + 2272) & 1];
  [(_UIStatusBarData *)v7 setThermalEntry:v30];

  id v32 = [(_UIStatusBarDataEntry *)[_UIStatusBarDataActivityEntry alloc] initFromData:a3 type:32];
  [v32 setType:((unint64_t)*((unsigned __int8 *)a3 + 2272) >> 2) & 1];
  if ((*((unsigned char *)a3 + 2272) & 2) != 0) {
    objc_msgSend(v32, "setType:", objc_msgSend(v32, "type") | 2);
  }
  if (a3->var31[0])
  {
    v33 = [NSString stringWithUTF8String:a3->var31];
    [v32 setDisplayId:v33];
  }
  [(_UIStatusBarData *)v7 setActivityEntry:v32];

  uint64_t v34 = objc_alloc_init(_UIStatusBarDataTetheringEntry);
  [(_UIStatusBarDataEntry *)v34 setEnabled:a3->var38 != 0];
  [(_UIStatusBarDataTetheringEntry *)v34 setConnectionCount:a3->var38];
  [(_UIStatusBarData *)v7 setTetheringEntry:v34];

  id v35 = [(_UIStatusBarDataEntry *)[_UIStatusBarDataLocationEntry alloc] initFromData:a3 type:21];
  [v35 setType:((unint64_t)*((unsigned __int8 *)a3 + 2529) >> 3) & 3];
  [(_UIStatusBarData *)v7 setLocationEntry:v35];

  id v36 = [(_UIStatusBarDataEntry *)[_UIStatusBarDataLockEntry alloc] initFromData:a3 type:39];
  [(_UIStatusBarData *)v7 setLockEntry:v36];

  v37 = [_UIStatusBarDataQuietModeEntry alloc];
  LOBYTE(v61) = (~*((unsigned __int8 *)a3 + 2529) & 0x80) != 0;
  id v38 = [(_UIStatusBarDataQuietModeEntry *)v37 initFromData:a3 type:2 focusName:a3->var57 maxFocusLength:256 imageName:a3->var56 maxImageLength:256 BOOLValue:v61];
  [(_UIStatusBarData *)v7 setQuietModeEntry:v38];

  id v39 = [[_UIStatusBarDataBoolEntry alloc] initFromData:a3 type:35 BOOLValue:*((unsigned char *)a3 + 3149) & 1];
  [(_UIStatusBarData *)v7 setElectronicTollCollectionEntry:v39];

  id v40 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:22];
  [(_UIStatusBarData *)v7 setRotationLockEntry:v40];

  id v41 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:3];
  [(_UIStatusBarData *)v7 setAirplaneModeEntry:v41];

  id v42 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:17];
  [(_UIStatusBarData *)v7 setTtyEntry:v42];

  id v43 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:19];
  [(_UIStatusBarData *)v7 setNikeEntry:v43];

  id v44 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:25];
  [(_UIStatusBarData *)v7 setAssistantEntry:v44];

  id v45 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:27];
  [(_UIStatusBarData *)v7 setStudentEntry:v45];

  id v46 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:29];
  [(_UIStatusBarData *)v7 setVpnEntry:v46];

  id v47 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:40];
  [(_UIStatusBarData *)v7 setLiquidDetectionEntry:v47];

  id v48 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:44];
  [(_UIStatusBarData *)v7 setDisplayWarningEntry:v48];

  id v49 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:24];
  [(_UIStatusBarData *)v7 setAirPlayEntry:v49];

  id v50 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:26];
  [(_UIStatusBarData *)v7 setCarPlayEntry:v50];

  id v51 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:18];
  [(_UIStatusBarData *)v7 setAlarmEntry:v51];

  id v52 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:45];
  [(_UIStatusBarData *)v7 setSatelliteEntry:v52];

  id v53 = [[_UIStatusBarDataEntry alloc] initFromData:a3 type:28];
  [(_UIStatusBarData *)v7 setSensorActivityEntry:v53];

  id v54 = [[_UIStatusBarDataBoolEntry alloc] initFromData:a3 type:34 BOOLValue:(*((unsigned __int8 *)a3 + 3149) >> 1) & 1];
  [(_UIStatusBarData *)v7 setRadarEntry:v54];

  id v55 = [[_UIStatusBarDataBoolEntry alloc] initFromData:a3 type:38 BOOLValue:(*((unsigned __int8 *)a3 + 3149) >> 2) & 1];
  [(_UIStatusBarData *)v7 setAnnounceNotificationsEntry:v55];

  id v56 = [(_UIStatusBarDataEntry *)[_UIStatusBarDataVoiceControlEntry alloc] initFromData:a3 type:41];
  [v56 setType:((unint64_t)*((unsigned __int8 *)a3 + 2529) >> 5) & 3];
  [(_UIStatusBarData *)v7 setVoiceControlEntry:v56];

  id v57 = [[_UIStatusBarDataStringEntry alloc] initFromData:a3 type:50 string:a3->var42 maxLength:256];
  v58 = [v57 stringValue];
  objc_msgSend(v57, "setEnabled:", objc_msgSend(v58, "length") != 0);

  [(_UIStatusBarData *)v7 setBackNavigationEntry:v57];
  id v59 = [[_UIStatusBarDataStringEntry alloc] initFromData:a3 type:51 string:a3->var43 maxLength:256];
  [(_UIStatusBarData *)v7 setForwardNavigationEntry:v59];

  [(_UIStatusBarData *)v7 makeUpdateFromData:v6];
  return v7;
}

@end