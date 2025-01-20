@interface FMDBLEAudioAdvertisementParser
+ (id)airPodsConfigurationDictWithBleDevice:(id)a3;
+ (id)configurationDictWithBleDevice:(id)a3 supportedAccessoryProfile:(int64_t)a4;
+ (id)primaryBeaconForBeacons:(id)a3;
+ (id)stereoPairConfigurationDictWithBleDevice:(id)a3;
@end

@implementation FMDBLEAudioAdvertisementParser

+ (id)primaryBeaconForBeacons:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_10006FE38;
  v18 = sub_10006FE48;
  id v19 = 0;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_10006FE38;
  v12 = sub_10006FE48;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006FE50;
  v7[3] = &unk_1002DBE38;
  v7[4] = &v8;
  v7[5] = &v14;
  [v3 enumerateObjectsUsingBlock:v7];
  v4 = (void *)v15[5];
  if (!v4) {
    v4 = (void *)v9[5];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v5;
}

+ (id)configurationDictWithBleDevice:(id)a3 supportedAccessoryProfile:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    uint64_t v7 = +[FMDBLEAudioAdvertisementParser stereoPairConfigurationDictWithBleDevice:v6];
  }
  else if (a4 == 1)
  {
    uint64_t v7 = +[FMDBLEAudioAdvertisementParser airPodsConfigurationDictWithBleDevice:v6];
  }
  else
  {
    if (a4) {
      goto LABEL_8;
    }
    uint64_t v7 = objc_opt_new();
  }
  v4 = (void *)v7;
LABEL_8:

  return v4;
}

+ (id)airPodsConfigurationDictWithBleDevice:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 rssi]);
  id v5 = [v3 bluetoothAddress];
  uint64_t v6 = [v5 fm_MACAddressString];

  id v69 = v3;
  uint64_t v7 = [v3 advertisementFields];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"cc"];
  v79 = v7;
  uint64_t v9 = [v7 objectForKeyedSubscript:@"aState"];
  uint64_t v10 = (void *)v9;
  if (v9) {
    v11 = (_UNKNOWN **)v9;
  }
  else {
    v11 = &off_1002F1FF0;
  }
  v12 = v11;

  v77 = (void *)v6;
  v78 = (void *)v4;
  v73 = v12;
  if ([v12 isEqualToNumber:&off_1002F1FF0]) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = [v12 isEqualToNumber:&off_1002F2008];
  }
  uint64_t v71 = v13;
  v72 = [v79 objectForKeyedSubscript:@"hsStatus"];
  unsigned int v14 = [v72 unsignedIntValue];
  int v15 = dword_10031CE04 & v14;
  int v16 = dword_10031CDF0 & v14;
  int v17 = dword_10031CDF4 & v14;
  int v18 = dword_10031CDFC & v14;
  int v19 = dword_10031CDF8 & v14;
  int v20 = dword_10031CE00 & v14;
  int v21 = dword_10031CE08 & v14;
  v22 = sub_100004238();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110914;
    BOOL v81 = v15 != 0;
    __int16 v82 = 1024;
    BOOL v83 = v21 != 0;
    __int16 v84 = 1024;
    BOOL v85 = v16 != 0;
    __int16 v86 = 1024;
    BOOL v87 = v17 != 0;
    __int16 v88 = 1024;
    BOOL v89 = v18 != 0;
    __int16 v90 = 1024;
    BOOL v91 = v19 != 0;
    __int16 v92 = 1024;
    BOOL v93 = v20 != 0;
    __int16 v94 = 2112;
    uint64_t v95 = v8;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "MainHSSTATUS L %i P %i U %i C %i OC %i E %i OE %i CC %@", buf, 0x36u);
  }
  int v70 = v15;
  v76 = (void *)v8;
  int v23 = v17;
  BOOL v24 = v17 != 0;
  if (v17) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = 2;
  }
  if (v19) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = 2;
  }
  if (v20) {
    uint64_t v27 = 1;
  }
  else {
    uint64_t v27 = 2;
  }
  if (v21) {
    uint64_t v28 = v26;
  }
  else {
    uint64_t v28 = v27;
  }
  if (v21) {
    uint64_t v29 = v27;
  }
  else {
    uint64_t v29 = v26;
  }
  if (v18) {
    uint64_t v30 = 1;
  }
  else {
    uint64_t v30 = 2;
  }
  int v31 = v21;
  BOOL v32 = v21 == 0;
  if (v21) {
    BOOL v33 = v24;
  }
  else {
    BOOL v33 = v18 != 0;
  }
  if (v21) {
    uint64_t v34 = v25;
  }
  else {
    uint64_t v34 = v30;
  }
  if (v32) {
    uint64_t v35 = v25;
  }
  else {
    uint64_t v35 = v30;
  }
  uint64_t v74 = v28;
  uint64_t v75 = v35;

  v36 = [v79 objectForKeyedSubscript:@"lc"];
  unsigned int v37 = [v36 BOOLValue];

  uint64_t v38 = v34;
  if (v37) {
    uint64_t v39 = 2;
  }
  else {
    uint64_t v39 = 1;
  }
  if (v33) {
    uint64_t v40 = v39;
  }
  else {
    uint64_t v40 = 0;
  }
  int v41 = v16;
  uint64_t v67 = v34;
  if (!v16) {
    goto LABEL_55;
  }
  BOOL v42 = v18 != 0;
  if (!v31) {
    BOOL v42 = v23 != 0;
  }
  BOOL v43 = v34 == 2 && v75 == 2;
  char v44 = v33 && v42;
  if (v43) {
    char v44 = 1;
  }
  if (v74 == 2 && v29 == 2 && (v44 & 1) != 0)
  {
    v45 = v69;
    uint64_t v66 = 1;
    uint64_t v46 = 1;
  }
  else
  {
LABEL_55:
    v45 = v69;
    uint64_t v46 = 1;
    if (v38 == 2) {
      uint64_t v47 = 1;
    }
    else {
      uint64_t v47 = 2;
    }
    uint64_t v66 = v47;
    if (v75 != 2) {
      uint64_t v46 = 2;
    }
  }
  uint64_t v65 = v46;
  int v48 = v31;
  BOOL v49 = v31 != 0;
  BOOL v50 = v41 != 0;
  int v68 = v41;
  id v51 = objc_alloc_init((Class)NSMutableDictionary);
  v52 = @"right";
  if (v70) {
    v52 = @"left";
  }
  v53 = v52;
  v54 = objc_alloc_init(FMDBluetoothDiscoveryAdvertisementConfiguration);
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 setName:v53];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 setRssi:v78];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 setAddress:v77];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 setColorCode:v76];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 setAudioStateStatus:v71];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 setLidClosedStatus:v40];
  v55 = [[FMDBLEBeaconIdentifier alloc] initWithBLEDevice:v45 other:0];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 setBeaconIdentifier:v55];

  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 setPrimary:v49];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 setUtpConnected:v50];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 setInCaseStatus:v67];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 setInEarStatus:v74];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 setOnHeadStatus:500];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 setAvailability:v66];
  v56 = [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v54 name];
  [v51 setObject:v54 forKeyedSubscript:v56];

  if (v68)
  {
    BOOL v57 = v48 == 0;
    v58 = @"left";
    if (v70) {
      v58 = @"right";
    }
    v59 = v51;
    v60 = v58;
    v61 = objc_alloc_init(FMDBluetoothDiscoveryAdvertisementConfiguration);
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 setName:v60];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 setRssi:v78];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 setAddress:v77];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 setColorCode:v76];

    id v51 = v59;
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 setAudioStateStatus:v71];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 setLidClosedStatus:v40];
    v62 = [[FMDBLEBeaconIdentifier alloc] initWithBLEDevice:v45 other:1];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 setBeaconIdentifier:v62];

    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 setPrimary:v57];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 setUtpConnected:1];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 setInCaseStatus:v75];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 setInEarStatus:v29];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 setOnHeadStatus:500];
    [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 setAvailability:v65];
    v63 = [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v61 name];
    [v59 setObject:v61 forKeyedSubscript:v63];
  }

  return v51;
}

+ (id)stereoPairConfigurationDictWithBleDevice:(id)a3
{
  id v3 = a3;
  uint64_t v66 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 rssi]);
  uint64_t v4 = [v3 bluetoothAddress];
  uint64_t v65 = [v4 fm_MACAddressString];

  id v5 = [v3 advertisementFields];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"cc"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"cc"];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"ccR"];
  uint64_t v9 = [v5 objectForKeyedSubscript:@"ccC"];
  uint64_t v10 = [v5 objectForKeyedSubscript:@"hbT"];
  v11 = objc_opt_new();
  v64 = v7;
  uint64_t v12 = [v7 stringValue];
  uint64_t v13 = (void *)v12;
  if (v12) {
    CFStringRef v14 = (const __CFString *)v12;
  }
  else {
    CFStringRef v14 = &stru_1002E7428;
  }
  [v11 setColorCodeLeft:v14];

  v63 = v8;
  uint64_t v15 = [v8 stringValue];
  int v16 = (void *)v15;
  if (v15) {
    CFStringRef v17 = (const __CFString *)v15;
  }
  else {
    CFStringRef v17 = &stru_1002E7428;
  }
  [v11 setColorCodeRight:v17];

  v62 = v9;
  uint64_t v18 = [v9 stringValue];
  int v19 = (void *)v18;
  if (v18) {
    CFStringRef v20 = (const __CFString *)v18;
  }
  else {
    CFStringRef v20 = &stru_1002E7428;
  }
  [v11 setColorCodeCase:v20];

  v61 = v10;
  uint64_t v21 = [v10 stringValue];
  v22 = (void *)v21;
  if (v21) {
    CFStringRef v23 = (const __CFString *)v21;
  }
  else {
    CFStringRef v23 = &stru_1002E7428;
  }
  [v11 setHeadbandType:v23];

  uint64_t v24 = [v5 objectForKeyedSubscript:@"aState"];
  uint64_t v25 = (void *)v24;
  if (v24) {
    uint64_t v26 = (_UNKNOWN **)v24;
  }
  else {
    uint64_t v26 = &off_1002F1FF0;
  }
  uint64_t v27 = v26;

  if ([v27 isEqualToNumber:&off_1002F1FF0]) {
    uint64_t v28 = 2;
  }
  else {
    uint64_t v28 = [v27 isEqualToNumber:&off_1002F2008];
  }
  uint64_t v54 = v28;
  uint64_t v29 = [v5 objectForKeyedSubscript:@"hsStatus"];
  v59 = v29;
  if (v29)
  {
    unsigned int v30 = [v29 unsignedIntValue];
    BOOL v31 = (dword_10031CDF4 & v30) != 0;
    uint64_t v32 = 1;
    if ((dword_10031CDF4 & v30) != 0) {
      uint64_t v32 = 2;
    }
    uint64_t v56 = v32;
    BOOL v33 = (dword_10031CDF8 & v30) != 0;
    BOOL v34 = (dword_10031CE0C & v30) != 0;
  }
  else
  {
    BOOL v34 = 0;
    BOOL v33 = 0;
    BOOL v31 = 0;
    uint64_t v56 = 0;
  }
  uint64_t v35 = sub_100004238();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)int v68 = v31;
    *(_WORD *)&v68[4] = 1024;
    *(_DWORD *)&v68[6] = v33;
    uint64_t v69 = 0x400000000000400;
    *(_DWORD *)int v70 = v34;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "StereoPair MainHSSTATUS Case %i Ear %i Neck %i TableTop %i", buf, 0x1Au);
  }
  BOOL v55 = v31;
  BOOL v57 = v34;
  BOOL v58 = v33;
  v60 = v27;

  v36 = sub_100004238();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = [v6 stringValue];
    uint64_t v38 = (void *)v37;
    uint64_t v39 = v6;
    if (v37) {
      CFStringRef v40 = (const __CFString *)v37;
    }
    else {
      CFStringRef v40 = &stru_1002E7428;
    }
    int v41 = [v11 colorCodeLeft];
    BOOL v42 = [v11 colorCodeRight];
    [v11 colorCodeCase];
    BOOL v43 = v53 = v3;
    char v44 = [v11 headbandType];
    *(_DWORD *)buf = 138413314;
    *(void *)int v68 = v40;
    uint64_t v6 = v39;
    *(_WORD *)&v68[8] = 2112;
    uint64_t v69 = (uint64_t)v41;
    *(_WORD *)int v70 = 2112;
    *(void *)&v70[2] = v42;
    __int16 v71 = 2112;
    v72 = v43;
    __int16 v73 = 2112;
    uint64_t v74 = v44;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "StereoPair StyleDescriptor ColorCode %@ ColorLeft %@ ColorRight %@ ColorCase %@ HeadbandType %@", buf, 0x34u);

    id v3 = v53;
  }

  id v45 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v46 = objc_alloc_init(FMDBluetoothDiscoveryAdvertisementConfiguration);
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setName:@"monaural"];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setRssi:v66];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setAddress:v65];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setColorCode:v6];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setAudioStateStatus:v54];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setLidClosedStatus:0];
  uint64_t v47 = [[FMDBLEBeaconIdentifier alloc] initWithBLEDevice:v3 other:0];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setBeaconIdentifier:v47];

  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setPrimary:1];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setUtpConnected:0];
  if (v55) {
    uint64_t v48 = 1;
  }
  else {
    uint64_t v48 = 2;
  }
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setInCaseStatus:v48];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setInEarStatus:500];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setAvailability:v56];
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setStyleDescriptor:v11];
  uint64_t v49 = 2;
  if (v57) {
    uint64_t v49 = 4;
  }
  if (v58) {
    uint64_t v49 = 1;
  }
  if (v59) {
    uint64_t v50 = v49;
  }
  else {
    uint64_t v50 = 0;
  }
  [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 setOnHeadStatus:v50];
  id v51 = [(FMDBluetoothDiscoveryAdvertisementConfiguration *)v46 name];
  [v45 setObject:v46 forKeyedSubscript:v51];

  return v45;
}

@end