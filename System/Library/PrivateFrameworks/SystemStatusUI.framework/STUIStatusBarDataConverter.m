@interface STUIStatusBarDataConverter
+ (id)_cellularEntryWithData:(id *)a3 signalStrengthEnabled:(BOOL)a4 serviceEnabled:(BOOL)a5 dataNetworkEnabled:(BOOL)a6 serviceString:(const char *)a7 serviceCrossfadeString:(const char *)a8 serviceBadgeString:(const char *)a9 serviceContentType:(unsigned int)a10 dataNetworkType:(unsigned int)a11 gsmSignalStrengthRaw:(int)a12 gsmSignalStrengthBars:(int)a13 callForwardingType:(int)a14 lowDataModeActive:(BOOL)a15;
+ (id)convertData:(id *)a3 fromReferenceData:(id)a4;
@end

@implementation STUIStatusBarDataConverter

+ (id)convertData:(id *)a3 fromReferenceData:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA9418]);
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FA94C0]) initFromData:a3 type:0 string:a3->var1 maxLength:64];
  [v7 setTimeEntry:v8];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4FA94C0]) initFromData:a3 type:0 string:a3->var2 maxLength:64];
  [v7 setShortTimeEntry:v9];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4FA94C0]) initFromData:a3 type:1 string:a3->var3 maxLength:256];
  [v7 setDateEntry:v10];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4FA94C0]) initFromData:a3 type:8 string:a3->var44 maxLength:100];
  [v7 setPersonNameEntry:v11];

  if (a3->var14 == 2 && a3->var8[0])
  {
    v12 = (void *)MEMORY[0x1E4FA94C0];
    v13 = [NSString stringWithUTF8String:a3->var8];
    v14 = [v12 entryWithStringValue:v13];
  }
  else
  {
    v14 = [MEMORY[0x1E4FA94C0] disabledEntry];
  }
  [v7 setDeviceNameEntry:v14];

  BYTE4(v76) = *((unsigned char *)a3 + 2080) & 1;
  HIDWORD(v74) = a3->var6;
  LODWORD(v76) = 30;
  HIDWORD(v72) = a3->var21;
  LODWORD(v74) = a3->var4;
  LODWORD(v72) = a3->var14;
  v15 = objc_msgSend(a1, "_cellularEntryWithData:signalStrengthEnabled:serviceEnabled:dataNetworkEnabled:serviceString:serviceCrossfadeString:serviceBadgeString:serviceContentType:dataNetworkType:gsmSignalStrengthRaw:gsmSignalStrengthBars:callForwardingType:lowDataModeActive:", a3, a3->var0[4], a3->var0[6], a3->var0[9], a3->var8, a3->var10, a3->var54, v72, v74, v76);
  [v7 setCellularEntry:v15];

  BYTE4(v77) = (*((unsigned char *)a3 + 2080) & 2) != 0;
  HIDWORD(v75) = a3->var7;
  LODWORD(v77) = 31;
  HIDWORD(v73) = a3->var22;
  LODWORD(v75) = a3->var5;
  LODWORD(v73) = a3->var15;
  v16 = objc_msgSend(a1, "_cellularEntryWithData:signalStrengthEnabled:serviceEnabled:dataNetworkEnabled:serviceString:serviceCrossfadeString:serviceBadgeString:serviceContentType:dataNetworkType:gsmSignalStrengthRaw:gsmSignalStrengthBars:callForwardingType:lowDataModeActive:", a3, a3->var0[5], a3->var0[7], a3->var0[10], a3->var9, a3->var11, a3->var55, v73, v75, v77);
  [v7 setSecondaryCellularEntry:v16];

  id v17 = [v7 secondaryCellularEntry];
  if ([v17 isEnabled]) {
    goto LABEL_8;
  }
  char v18 = *((unsigned char *)a3 + 3160);

  if ((v18 & 4) != 0)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4FA9478]);
    [v7 setSecondaryCellularEntry:v17];
LABEL_8:
  }
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x2020000000;
  char v92 = 0;
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x2020000000;
  uint64_t v88 = 0;
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v79 = __60__STUIStatusBarDataConverter_convertData_fromReferenceData___block_invoke;
  v80 = &unk_1E6AA4020;
  id v81 = 0;
  v82 = &v89;
  v83 = &v85;
  v84 = a3;
  unsigned int var21 = a3->var21;
  if (([0 isEnabled] & 1) == 0 && v84->var0[9])
  {
    if (var21 != 5)
    {
      if (var21 != 6) {
        goto LABEL_15;
      }
      *(void *)(v83[1] + 24) = 1;
    }
    *(unsigned char *)(v82[1] + 24) = 1;
  }
LABEL_15:
  v79((uint64_t)v78, 10u, a3->var22);
  if (*((unsigned char *)v90 + 24))
  {
    uint64_t v20 = 3;
    if ((*((unsigned char *)a3 + 3149) & 0x10) == 0) {
      uint64_t v20 = 5;
    }
    if ((*((unsigned char *)a3 + 3149) & 8) != 0) {
      uint64_t v21 = 4;
    }
    else {
      uint64_t v21 = v20;
    }
    uint64_t v22 = [MEMORY[0x1E4FA94E0] entryWithType:v86[3] status:v21 lowDataMode:*((unsigned char *)a3 + 2092) & 1 rawValue:a3->var18 displayValue:a3->var19 displayRawValue:(*((unsigned __int8 *)a3 + 2529) >> 2) & 1];
  }
  else
  {
    uint64_t v22 = [MEMORY[0x1E4FA94E0] disabledEntry];
  }
  v23 = (void *)v22;

  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);
  [v7 setWifiEntry:v23];

  if (a3->var0[12])
  {
    id v24 = v6;
    if (a3->var0[14])
    {
      BOOL v25 = 1;
      uint64_t var24 = 3;
    }
    else
    {
      uint64_t var24 = a3->var24;
      BOOL v25 = a3->var0[13];
    }
    v28 = (void *)MEMORY[0x1E4FA9458];
    uint64_t var23 = a3->var23;
    char v30 = *((unsigned char *)a3 + 2536);
    if (a3->var25[0])
    {
      v31 = [NSString stringWithUTF8String:a3->var25];
    }
    else
    {
      v31 = 0;
    }
    v27 = [v28 entryWithCapacity:var23 state:var24 saverMode:v30 & 1 prominentlyShowsDetailString:v25 detailString:v31];

    id v6 = v24;
  }
  else
  {
    v27 = [MEMORY[0x1E4FA9458] disabledEntry];
  }
  [v7 setMainBatteryEntry:v27];

  if (a3->var0[16])
  {
    if (a3->var0[42]) {
      uint64_t v32 = 2;
    }
    else {
      uint64_t v32 = *((unsigned char *)a3 + 2529) & 1;
    }
    if (a3->var0[15]) {
      [MEMORY[0x1E4FA9458] entryWithCapacity:a3->var26 state:0 saverMode:0 prominentlyShowsDetailString:0 detailString:0];
    }
    else {
    v34 = [MEMORY[0x1E4FA9458] disabledEntry];
    }
    v33 = [MEMORY[0x1E4FA9460] entryWithState:v32 batteryEntry:v34];
  }
  else
  {
    v33 = [MEMORY[0x1E4FA9460] disabledEntry];
  }
  [v7 setBluetoothEntry:v33];

  v35 = (void *)[objc_alloc(MEMORY[0x1E4FA94D0]) initFromData:a3 type:33];
  if (a3->var0[33])
  {
    uint64_t v36 = 0;
    switch(a3->var27)
    {
      case 0:
        goto LABEL_43;
      case 2:
        uint64_t v36 = 1;
        break;
      case 3:
        uint64_t v36 = 2;
        break;
      case 4:
        uint64_t v36 = 3;
        break;
      case 5:
        uint64_t v36 = 4;
        break;
      case 6:
        uint64_t v36 = 5;
        break;
      default:
        break;
    }
    uint64_t v37 = [MEMORY[0x1E4FA94D0] entryWithColor:v36 isSunlightMode:*((unsigned char *)a3 + 2272) & 1];
  }
  else
  {
LABEL_43:
    uint64_t v37 = [MEMORY[0x1E4FA94D0] disabledEntry];
  }
  v38 = (void *)v37;

  [v7 setThermalEntry:v38];
  if (a3->var0[32])
  {
    unint64_t v39 = *((unsigned char *)a3 + 2272) & 2 | ((unint64_t)*((unsigned __int8 *)a3 + 2272) >> 2) & 1;
    v40 = (void *)MEMORY[0x1E4FA9448];
    if (a3->var31[0])
    {
      v41 = [NSString stringWithUTF8String:a3->var31];
    }
    else
    {
      v41 = 0;
    }
    v42 = [v40 entryWithType:v39 displayID:v41];
  }
  else
  {
    v42 = [MEMORY[0x1E4FA9448] disabledEntry];
  }
  [v7 setActivityEntry:v42];

  if (a3->var38) {
    objc_msgSend(MEMORY[0x1E4FA94C8], "entryWithConnectionCount:");
  }
  else {
  v43 = [MEMORY[0x1E4FA94C8] disabledEntry];
  }
  [v7 setTetheringEntry:v43];

  if (a3->var0[21]) {
    [MEMORY[0x1E4FA94A0] entryWithType:((unint64_t)*((unsigned __int8 *)a3 + 2529) >> 3) & 3];
  }
  else {
  v44 = [MEMORY[0x1E4FA94A0] disabledEntry];
  }
  [v7 setLocationEntry:v44];

  v45 = (void *)[objc_alloc(MEMORY[0x1E4FA94A8]) initFromData:a3 type:39];
  [v7 setLockEntry:v45];

  id v46 = objc_alloc(MEMORY[0x1E4FA94B0]);
  LOBYTE(v71) = (~*((unsigned __int8 *)a3 + 2529) & 0x80) != 0;
  v47 = (void *)[v46 initFromData:a3 type:2 focusName:a3->var57 maxFocusLength:256 imageName:a3->var56 maxImageLength:256 BOOLValue:v71];
  [v7 setQuietModeEntry:v47];

  v48 = (void *)[objc_alloc(MEMORY[0x1E4FA9468]) initFromData:a3 type:35 BOOLValue:*((unsigned char *)a3 + 3149) & 1];
  [v7 setElectronicTollCollectionEntry:v48];

  v49 = (void *)[objc_alloc(MEMORY[0x1E4FA9488]) initFromData:a3 type:22];
  [v7 setRotationLockEntry:v49];

  v50 = (void *)[objc_alloc(MEMORY[0x1E4FA9488]) initFromData:a3 type:3];
  [v7 setAirplaneModeEntry:v50];

  v51 = (void *)[objc_alloc(MEMORY[0x1E4FA9488]) initFromData:a3 type:17];
  [v7 setTtyEntry:v51];

  v52 = (void *)[objc_alloc(MEMORY[0x1E4FA9488]) initFromData:a3 type:19];
  [v7 setNikeEntry:v52];

  v53 = (void *)[objc_alloc(MEMORY[0x1E4FA9488]) initFromData:a3 type:25];
  [v7 setAssistantEntry:v53];

  v54 = (void *)[objc_alloc(MEMORY[0x1E4FA9488]) initFromData:a3 type:27];
  [v7 setStudentEntry:v54];

  v55 = (void *)[objc_alloc(MEMORY[0x1E4FA9488]) initFromData:a3 type:29];
  [v7 setVpnEntry:v55];

  v56 = (void *)[objc_alloc(MEMORY[0x1E4FA9488]) initFromData:a3 type:40];
  [v7 setLiquidDetectionEntry:v56];

  v57 = (void *)[objc_alloc(MEMORY[0x1E4FA9488]) initFromData:a3 type:44];
  [v7 setDisplayWarningEntry:v57];

  v58 = (void *)[objc_alloc(MEMORY[0x1E4FA9488]) initFromData:a3 type:24];
  [v7 setAirPlayEntry:v58];

  v59 = (void *)[objc_alloc(MEMORY[0x1E4FA9488]) initFromData:a3 type:26];
  [v7 setCarPlayEntry:v59];

  v60 = (void *)[objc_alloc(MEMORY[0x1E4FA9488]) initFromData:a3 type:18];
  [v7 setAlarmEntry:v60];

  v61 = (void *)[objc_alloc(MEMORY[0x1E4FA94B8]) initFromData:a3 type:45];
  [v7 setSatelliteEntry:v61];

  v62 = (void *)[objc_alloc(MEMORY[0x1E4FA9488]) initFromData:a3 type:28];
  [v7 setSensorActivityEntry:v62];

  v63 = (void *)[objc_alloc(MEMORY[0x1E4FA9468]) initFromData:a3 type:34 BOOLValue:(*((unsigned __int8 *)a3 + 3149) >> 1) & 1];
  [v7 setRadarEntry:v63];

  v64 = (void *)[objc_alloc(MEMORY[0x1E4FA9468]) initFromData:a3 type:38 BOOLValue:(*((unsigned __int8 *)a3 + 3149) >> 2) & 1];
  [v7 setAnnounceNotificationsEntry:v64];

  if (a3->var0[41]) {
    [MEMORY[0x1E4FA94D8] entryWithType:((unint64_t)*((unsigned __int8 *)a3 + 2529) >> 5) & 3];
  }
  else {
  v65 = [MEMORY[0x1E4FA94D8] disabledEntry];
  }
  [v7 setVoiceControlEntry:v65];

  if (a3->var42[0])
  {
    v66 = [NSString stringWithUTF8String:a3->var42];
  }
  else
  {
    v66 = 0;
  }
  if ([v66 length]) {
    [MEMORY[0x1E4FA94C0] entryWithStringValue:v66];
  }
  else {
  v67 = [MEMORY[0x1E4FA94C0] disabledEntry];
  }

  [v7 setBackNavigationEntry:v67];
  v68 = (void *)[objc_alloc(MEMORY[0x1E4FA94C0]) initFromData:a3 type:51 string:a3->var43 maxLength:256];
  [v7 setForwardNavigationEntry:v68];

  [v7 makeUpdateFromData:v6];
  v69 = [v7 immutableCopy];

  return v69;
}

+ (id)_cellularEntryWithData:(id *)a3 signalStrengthEnabled:(BOOL)a4 serviceEnabled:(BOOL)a5 dataNetworkEnabled:(BOOL)a6 serviceString:(const char *)a7 serviceCrossfadeString:(const char *)a8 serviceBadgeString:(const char *)a9 serviceContentType:(unsigned int)a10 dataNetworkType:(unsigned int)a11 gsmSignalStrengthRaw:(int)a12 gsmSignalStrengthBars:(int)a13 callForwardingType:(int)a14 lowDataModeActive:(BOOL)a15
{
  if (((a10 == 2) & ~a4 & a5) != 0 || (BOOL v15 = a6, !a5 && !a6 && !a4))
  {
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4FA9478], "disabledEntry", a3);
    goto LABEL_38;
  }
  int v17 = a14;
  if (a5)
  {
    if (a4)
    {
      switch(a10)
      {
        case 0u:
        case 2u:
        case 3u:
        case 4u:
          unsigned int v35 = 0;
          char v19 = 0;
          goto LABEL_21;
        case 1u:
          unsigned int v35 = 0;
          char v19 = 0;
          goto LABEL_23;
        case 5u:
          goto LABEL_13;
        case 6u:
          unsigned int v35 = 0;
          char v19 = 0;
          uint64_t v28 = 4;
          break;
        case 7u:
          unsigned int v35 = 0;
          char v19 = 1;
LABEL_21:
          uint64_t v28 = 5;
          break;
        case 8u:
          unsigned int v35 = 0;
          char v19 = 1;
          goto LABEL_23;
        default:
          uint64_t v28 = 0;
          unsigned int v35 = 0;
          char v19 = 0;
          break;
      }
LABEL_24:
      uint64_t v34 = v28;
      char v36 = v19;
      HIDWORD(v33) = a14;
      if (*a7)
      {
        uint64_t v21 = [NSString stringWithUTF8String:a7];
      }
      else
      {
        uint64_t v21 = 0;
      }
      if (*a8)
      {
        uint64_t v22 = [NSString stringWithUTF8String:a8];
      }
      else
      {
        uint64_t v22 = 0;
      }
      if (*a9)
      {
        v23 = [NSString stringWithUTF8String:a9];
      }
      else
      {
        v23 = 0;
      }
      int v17 = a14;
      uint64_t v25 = v35;
      char v26 = v36;
      uint64_t v24 = v34;
      if (v15) {
        goto LABEL_34;
      }
      goto LABEL_9;
    }
    if (a10 - 7 < 2)
    {
      char v19 = 1;
    }
    else
    {
      char v19 = 0;
      if (!a10)
      {
        unsigned int v35 = 1;
LABEL_23:
        uint64_t v28 = 2;
        goto LABEL_24;
      }
      if (a10 == 5)
      {
LABEL_13:
        unsigned int v35 = 0;
        char v19 = 0;
        uint64_t v28 = 3;
        goto LABEL_24;
      }
    }
    unsigned int v35 = 0;
    uint64_t v28 = 1;
    goto LABEL_24;
  }
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  char v26 = 0;
  if (a6)
  {
LABEL_34:
    if (a11 > 0x10) {
      uint64_t v27 = 5;
    }
    else {
      uint64_t v27 = qword_1D7ED5AC8[a11];
    }
    goto LABEL_37;
  }
LABEL_9:
  uint64_t v27 = 0;
LABEL_37:
  char v29 = *((unsigned char *)a3 + 3160);
  LOBYTE(v33) = (*((unsigned char *)a3 + 2529) & 2) != 0;
  LOBYTE(v32) = a15;
  BYTE2(v31) = v26;
  BYTE1(v31) = (v29 & 2) != 0;
  LOBYTE(v31) = v29 & 1;
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4FA9478], "entryWithType:stringValue:crossfadeStringValue:badgeStringValue:wifiCalling:callForwarding:showsSOSWhenDisabled:sosAvailable:isBootstrapCellular:status:lowDataMode:rawValue:displayValue:displayRawValue:", v27, v21, v22, v23, v25, a3->var0[v17], v31, v24, v32, a12, a13, v33);

LABEL_38:
  return v20;
}

uint64_t __60__STUIStatusBarDataConverter_convertData_fromReferenceData___block_invoke(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = [*(id *)(a1 + 32) isEnabled];
  if ((result & 1) == 0 && *(unsigned char *)(*(void *)(a1 + 56) + a2))
  {
    if (a3 != 5)
    {
      if (a3 != 6) {
        return result;
      }
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

@end