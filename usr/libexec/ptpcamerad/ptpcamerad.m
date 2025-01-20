void __ICOSLogCreate()
{
  if (qword_100063488 != -1) {
    dispatch_once(&qword_100063488, &stru_10004CAD0);
  }
}

void sub_100007E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100007EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 + 536870208) <= 0x2D && ((1 << (a2 + 64)) & 0x280002000001) != 0
      || a2 == -536854453)
    {
      __ICOSLogCreate();
      v7 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v8 = [@"HostUSB" substringWithRange:0, 18];
        v7 = [v8 stringByAppendingString:@".."];
      }
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"readInterruptData: (disconnected) 0x%x:0x%x", [v6 locationID], a2);
      v10 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v7;
        v12 = v10;
        *(_DWORD *)buf = 136446466;
        id v15 = [(__CFString *)v11 UTF8String];
        __int16 v16 = 2114;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      [v6 setConnected:0];
    }
    else if (!a2)
    {
      if (a3) {
        [WeakRetained handleInterruptData:a3];
      }
      [v6 readInterruptData];
    }
  }

  return a2;
}

void sub_1000080A4(void (**a1)(void))
{
  if (a1)
  {
    a1[2]();
  }
}

void sub_100008948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26,char a27)
{
}

uint64_t sub_1000089C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_32;
  }
  if ((int)a2 <= -536854450)
  {
    uint64_t v8 = (a2 + 536870208);
    if (v8 > 0x2D) {
      goto LABEL_32;
    }
    if (((1 << (a2 + 64)) & 0x280002000001) != 0)
    {
      __ICOSLogCreate();
      v9 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v10 = [@"HostUSB" substringWithRange:0, 18];
        v9 = [v10 stringByAppendingString:@".."];
      }
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"readBulkData: (disconnected) 0x%x:0x%x", [v7 locationID], a2);
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
        sub_100033C1C();
      }

      [v7 setConnected:0];
      goto LABEL_32;
    }
    if (v8 != 22) {
      goto LABEL_32;
    }
    goto LABEL_20;
  }
  if (a2 == -536854449 || a2 == -536850432)
  {
LABEL_20:
    __ICOSLogCreate();
    v18 = @"HostUSB";
    if ((unint64_t)[@"HostUSB" length] >= 0x15)
    {
      v19 = [@"HostUSB" substringWithRange:0, 18];
      v18 = [v19 stringByAppendingString:@".."];
    }
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"readBulkData: (timedout) 0x%x:0x%x", [v7 locationID], a2);
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033C1C();
    }

    if (a2 == -536850432 || a2 == -536854449)
    {
      __ICOSLogCreate();
      v21 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v22 = [@"HostUSB" substringWithRange:0, 18];
        v21 = [v22 stringByAppendingString:@".."];
      }
      v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"readBulkData: (cleared pipestall) 0x%x:0x%x", [v7 locationID], a2);
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
        sub_100033C1C();
      }

      [v7 performSelector:"clearBulkInPipeStall"];
    }
    [v7 setTimedOut:1];
    goto LABEL_32;
  }
  if (!a2)
  {
    [WeakRetained handleBulkData:a3 result:0 forTxID:*(void *)(a1 + 32)];
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      v12 = @"HostUSB";
      if ((unint64_t)[@"HostUSB" length] >= 0x15)
      {
        v13 = [@"HostUSB" substringWithRange:0, 18];
        v12 = [v13 stringByAppendingString:@".."];
      }
      v14 = +[NSString stringWithFormat:@"readBulkData: %lu bytes | continue: %d", a3, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      id v15 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = v12;
        v17 = v15;
        *(_DWORD *)buf = 136446466;
        id v26 = [(__CFString *)v16 UTF8String];
        __int16 v27 = 2114;
        v28 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }
  }
LABEL_32:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

  return a2;
}

void sub_100008E4C(uint64_t a1, int a2, uint64_t a3)
{
  if (a1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009B94;
    block[3] = &unk_10004C8B8;
    int v6 = a2;
    block[4] = a1;
    block[5] = a3;
    dispatch_block_t v3 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    v4 = dispatch_get_global_queue(33, 0);
    dispatch_async(v4, v3);
  }
}

void sub_100008F84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000903C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000090D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009B94(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  (*((void (**)(id, void, void))v1 + 2))(v1, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
}

void sub_100009BF8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_100009C18(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

id sub_100009C3C()
{
  return [v0 UTF8String];
}

void sub_100009C54(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void sub_10000AD58(uint64_t a1)
{
  uint64_t v1 = a1;
  v2 = [*(id *)(a1 + 32) initiator];

  if (v2) {
    goto LABEL_2;
  }
  v5 = -[PTPInitiator initWithHostLocationID:]([PTPInitiator alloc], "initWithHostLocationID:", [*(id *)(v1 + 32) locationID]);
  [*(id *)(v1 + 32) setInitiator:v5];

  id v6 = [*(id *)(v1 + 40) BOOLValue];
  v7 = [*(id *)(v1 + 32) initiator];
  [v7 setOrderAscending:v6];

  uint64_t v8 = [*(id *)(v1 + 32) initiator];
  [v8 setDelegate:*(void *)(v1 + 32)];

  uint64_t v9 = [*(id *)(v1 + 32) initiator];
  if (!v9) {
    goto LABEL_2;
  }
  uint64_t v10 = (void *)v9;
  v11 = [*(id *)(v1 + 32) initiator];
  unsigned int v12 = [v11 start];

  if (!v12) {
    goto LABEL_2;
  }
  int v13 = 1;
  CFStringRef v14 = @"..";
  id v15 = (os_log_t *)&_gICOSLog;
  uint64_t v129 = v1;
  while (1)
  {
    __int16 v16 = [*(id *)(v1 + 32) initiator];
    v17 = [v16 deviceInfo];

    __ICOSLogCreate();
    id v18 = [@"deviceInfo" length];
    if (v17) {
      break;
    }
    v31 = @"deviceInfo";
    if ((unint64_t)v18 >= 0x15)
    {
      v35 = [@"deviceInfo" substringWithRange:0, 18];
      v31 = [v35 stringByAppendingString:v14];
    }
    v33 = +[NSString stringWithFormat:@"Failed get deviceInfo -- Performing Close/Retry"];
    os_log_t v34 = *v15;
    if (!os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
LABEL_19:
    v31 = v31;
    v36 = v34;
    id v37 = [(__CFString *)v31 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v137 = v37;
    __int16 v138 = 2114;
    v139 = v33;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_20:
    uint64_t v1 = v129;
    v38 = [*(id *)(v129 + 32) initiator];
    [v38 resetDevice];

    if (--v13) {
      goto LABEL_2;
    }
  }
  v19 = @"deviceInfo";
  if ((unint64_t)v18 >= 0x15)
  {
    v20 = [@"deviceInfo" substringWithRange:0, 18];
    v19 = [v20 stringByAppendingString:v14];
  }
  v21 = +[NSString stringWithFormat:@"Dataset: %@", v17];
  os_log_t v22 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v23 = v14;
    v24 = v15;
    v25 = v19;
    id v26 = v22;
    __int16 v27 = v25;
    id v15 = v24;
    CFStringRef v14 = v23;
    id v28 = [(__CFString *)v27 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v137 = v28;
    __int16 v138 = 2114;
    v139 = v21;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  v29 = [*(id *)(v129 + 32) initiator];
  unsigned int v30 = [v29 openSession];

  if (!v30)
  {
    __ICOSLogCreate();
    v31 = @"session";
    if ((unint64_t)[@"session" length] >= 0x15)
    {
      v32 = [@"session" substringWithRange:0, 18];
      v31 = [v32 stringByAppendingString:v14];
    }
    v33 = +[NSString stringWithFormat:@"Failed to open -- Performing Close/Retry"];
    os_log_t v34 = *v15;
    if (!os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  id v130 = objc_alloc_init((Class)NSMutableArray);
  v39 = [v17 model];
  v40 = [*(id *)(v129 + 32) initiator];
  id v41 = [v40 refreshAssignedDeviceName];

  v42 = [*(id *)(v129 + 32) initiator];
  v43 = [v42 userAssignedDeviceName];

  v44 = v43;
  if (v43 || v39 && (id v46 = [v39 length], v44 = v39, v46)) {
    CFStringRef v45 = v44;
  }
  else {
    CFStringRef v45 = @"PTP Camera";
  }
  v47 = [*(id *)(v129 + 32) initiator];
  if ([v47 iCloudPhotosEnabled])
  {
    uint64_t v48 = 1;
  }
  else
  {
    v49 = [v17 operationsSupported];
    v50 = +[NSNumber numberWithUnsignedShort:4107];
    uint64_t v48 = [v49 containsObject:v50] ^ 1;
  }
  if ((unint64_t)[v39 length] < 6
    || ([v39 substringToIndex:6],
        v51 = objc_claimAutoreleasedReturnValue(),
        unsigned int v52 = [v51 isEqualToString:@"Apple "],
        v51,
        !v52))
  {
LABEL_37:
    uint64_t v1 = v129;
    v55 = [*(id *)(v129 + 32) cameraDictionary];
    [(__CFString *)v55 setObject:@"camera" forKeyedSubscript:@"ICDeviceSystemSymbolName"];
    CFStringRef v59 = @"Camera";
    goto LABEL_38;
  }
  v53 = [v39 substringFromIndex:6];
  v54 = v53;
  if (!v53 || ![v53 length])
  {

    goto LABEL_37;
  }
  v55 = v54;
  if ([(__CFString *)v55 isEqualToString:@"iPhone"])
  {
    v56 = [*(id *)(v129 + 32) cameraDictionary];
    v57 = v56;
    CFStringRef v58 = @"iphone";
    goto LABEL_73;
  }
  uint64_t v1 = v129;
  if ([(__CFString *)v55 isEqualToString:@"iPad"])
  {
    v56 = [*(id *)(v129 + 32) cameraDictionary];
    v57 = v56;
    CFStringRef v58 = @"ipad";
    goto LABEL_73;
  }
  if ([(__CFString *)v55 isEqualToString:@"iPod"])
  {
    v56 = [*(id *)(v129 + 32) cameraDictionary];
    v57 = v56;
    CFStringRef v58 = @"ipod";
LABEL_73:
    [v56 setObject:v58 forKeyedSubscript:@"ICDeviceSystemSymbolName"];

    CFStringRef v59 = v55;
    uint64_t v1 = v129;
  }
  else
  {
    CFStringRef v59 = v55;
  }
LABEL_38:

  v60 = [*(id *)(v1 + 32) cameraDictionary];
  [v60 setObject:v45 forKeyedSubscript:@"ICDeviceName"];

  v61 = [*(id *)(v1 + 32) cameraDictionary];
  [v61 setObject:&__kCFBooleanFalse forKeyedSubscript:@"ICDeviceEjectable"];

  v62 = +[NSNumber numberWithBool:v48];
  v63 = [*(id *)(v1 + 32) cameraDictionary];
  [v63 setObject:v62 forKeyedSubscript:@"ICDeviceLocked"];

  v64 = [*(id *)(v1 + 32) cameraDictionary];
  [v64 setObject:@"ICTransportTypeUSB" forKeyedSubscript:@"ICDeviceTransportType"];

  v65 = [*(id *)(v1 + 32) cameraDictionary];
  [v65 setObject:@"Camera" forKeyedSubscript:@"ICDeviceType"];

  v66 = [*(id *)(v1 + 32) cameraDictionary];
  [v66 setObject:v59 forKeyedSubscript:@"ICDeviceProductKind"];

  v67 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(v1 + 32) locationID]);
  v68 = [*(id *)(v1 + 32) cameraDictionary];
  [v68 setObject:v67 forKeyedSubscript:@"ICDeviceUSBLocationID"];

  v69 = [*(id *)(v1 + 32) initiator];
  v70 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v69 deviceVendorID]);
  v71 = [*(id *)(v1 + 32) cameraDictionary];
  [v71 setObject:v70 forKeyedSubscript:@"ICDeviceUSBVendorID"];

  v72 = [*(id *)(v1 + 32) initiator];
  v73 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v72 deviceProductID]);
  v74 = [*(id *)(v1 + 32) cameraDictionary];
  [v74 setObject:v73 forKeyedSubscript:@"ICDeviceUSBProductID"];

  v75 = [*(id *)(v1 + 32) initiator];
  v76 = [v75 deviceSerialNumberString];
  v77 = [*(id *)(v1 + 32) cameraDictionary];
  [v77 setObject:v76 forKeyedSubscript:@"ICDeviceSerialNumberString"];

  v78 = [v17 serialNumber];

  if (v78)
  {
    v79 = [v17 serialNumber];
    v80 = [*(id *)(v1 + 32) cameraDictionary];
    [v80 setObject:v79 forKeyedSubscript:@"ICDevicePTPSerialNumberString"];
  }
  v81 = [*(id *)(v1 + 32) initiator];
  v82 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v81 isAccessRestrictedAppleDevice]);
  v83 = [*(id *)(v1 + 32) cameraDictionary];
  [v83 setObject:v82 forKeyedSubscript:@"ICDeviceAccessRestrictedAppleDevice"];

  v84 = [*(id *)(v1 + 32) initiator];
  v85 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v84 iCloudPhotosEnabled]);
  v86 = [*(id *)(v1 + 32) cameraDictionary];
  [v86 setObject:v85 forKeyedSubscript:@"ICDeviceiCloudPhotosEnabled"];

  v87 = [*(id *)(v1 + 32) initiator];
  v88 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v87 iCloudPhotosOptimizeStorageState]);
  v89 = [*(id *)(v1 + 32) cameraDictionary];
  [v89 setObject:v88 forKeyedSubscript:@"ICDeviceiCloudOptimizeStorageState"];

  v90 = [*(id *)(v1 + 32) initiator];
  v91 = [v90 mobdevProps];

  if (v91)
  {
    v92 = [*(id *)(v1 + 32) initiator];
    v93 = [v92 mobdevProps];
    v94 = [*(id *)(v1 + 32) cameraDictionary];
    [v94 setObject:v93 forKeyedSubscript:@"ICMobileDeviceProperties"];
  }
  v128 = v39;
  v95 = [*(id *)(v1 + 32) cameraDictionary];
  v96 = [v95 objectForKeyedSubscript:@"ICMobileDeviceProperties"];

  if (!v96)
  {
    v97 = +[NSMutableDictionary dictionary];
    v98 = [*(id *)(v1 + 32) cameraDictionary];
    [v98 setObject:v97 forKeyedSubscript:@"ICMobileDeviceProperties"];
  }
  v126 = (__CFString *)v59;
  v127 = (__CFString *)v45;
  v99 = [*(id *)(v1 + 32) initiator];
  v100 = [v99 appleSerialNumberString];

  if (v100)
  {
    v101 = [*(id *)(v1 + 32) initiator];
    v102 = [v101 appleSerialNumberString];
    v103 = [*(id *)(v1 + 32) cameraDictionary];
    v104 = [v103 objectForKeyedSubscript:@"ICMobileDeviceProperties"];
    [v104 setObject:v102 forKeyedSubscript:@"AppleSerialNumber"];
  }
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  v105 = [v17 operationsSupported];
  id v106 = [v105 countByEnumeratingWithState:&v131 objects:v135 count:16];
  if (v106)
  {
    id v107 = v106;
    uint64_t v108 = *(void *)v132;
    do
    {
      for (i = 0; i != v107; i = (char *)i + 1)
      {
        if (*(void *)v132 != v108) {
          objc_enumerationMutation(v105);
        }
        unsigned int v110 = [*(id *)(*((void *)&v131 + 1) + 8 * i) unsignedShortValue];
        switch(v110)
        {
          case 0x1016u:
            v115 = [v17 devicePropertiesSupported];
            unsigned int v116 = [v115 containsObject:&off_100054858];

            CFStringRef v114 = @"ICCameraDeviceCanSyncClock";
            if (v116) {
              goto LABEL_61;
            }
            break;
          case 0x100Eu:
            CFStringRef v114 = @"ICCameraDeviceCanTakePicture";
LABEL_61:
            [v130 addObject:v114];
            continue;
          case 0x100Bu:
            v111 = [*(id *)(v1 + 32) initiator];
            if (([v111 isAppleDevice] & 1) == 0)
            {

              CFStringRef v114 = @"ICCameraDeviceCanDeleteOneFile";
              goto LABEL_61;
            }
            v112 = [*(id *)(v1 + 32) initiator];
            unsigned __int8 v113 = [v112 iCloudPhotosEnabled];

            uint64_t v1 = v129;
            CFStringRef v114 = @"ICCameraDeviceCanDeleteOneFile";
            if ((v113 & 1) == 0) {
              goto LABEL_61;
            }
            break;
          default:
            continue;
        }
      }
      id v107 = [v105 countByEnumeratingWithState:&v131 objects:v135 count:16];
    }
    while (v107);
  }

  [v130 addObject:@"ICCameraDeviceCanAcceptPTPCommands"];
  v117 = [*(id *)(v1 + 32) cameraDictionary];
  [v117 setObject:v130 forKeyedSubscript:@"ICDeviceCapabilities"];

  __ICOSLogCreate();
  v118 = @"session";
  if ((unint64_t)[@"session" length] >= 0x15)
  {
    v119 = [@"session" substringWithRange:0, 18];
    v118 = [v119 stringByAppendingString:@".."];
  }
  v120 = [*(id *)(v1 + 32) cameraDictionary];
  v121 = +[NSString stringWithFormat:@"PTPCameraDevice Properties: %@", v120];

  v122 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v123 = v118;
    v124 = v122;
    id v125 = [(__CFString *)v123 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v137 = v125;
    __int16 v138 = 2114;
    v139 = v121;
    _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
LABEL_2:
  uint64_t v3 = *(void *)(v1 + 48);
  uint64_t v4 = [*(id *)(v1 + 32) cameraDictionary];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

void sub_10000BCFC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionManager];
  [v2 addNotifications:*(void *)(a1 + 40) toSessionWithConnection:*(void *)(a1 + 48)];
}

void sub_10000BE38(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionManager];
  [v2 remNotifications:*(void *)(a1 + 40) fromSessionWithConnection:*(void *)(a1 + 48)];
}

void sub_10000BF94(uint64_t a1)
{
  [*(id *)(a1 + 32) holdPowerAssertion];
  id v2 = [*(id *)(a1 + 32) itemForObjectHandle:*(void *)(a1 + 40)];
  id v5 = v2;
  if (v2)
  {
    [v2 metadataWithOptions:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    uint64_t v4 = +[NSNumber numberWithInteger:-21450];
    [v3 setObject:v4 forKeyedSubscript:@"errCode"];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  [*(id *)(a1 + 32) releasePowerAssertion];
}

void sub_10000C16C(uint64_t a1)
{
  [*(id *)(a1 + 32) holdPowerAssertion];
  id v2 = [*(id *)(a1 + 32) itemForObjectHandle:*(void *)(a1 + 40)];
  id v5 = v2;
  if (v2)
  {
    [v2 thumbnailDataWithOptions:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    uint64_t v4 = +[NSNumber numberWithInteger:-21450];
    [v3 setObject:v4 forKeyedSubscript:@"errCode"];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  [*(id *)(a1 + 32) releasePowerAssertion];
}

void sub_10000C318(uint64_t a1)
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 addEntriesFromDictionary:*(void *)(a1 + 32)];
  id v2 = +[NSNumber numberWithInteger:-9934];
  [v3 setObject:v2 forKeyedSubscript:@"errCode"];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000C54C(uint64_t a1)
{
  [*(id *)(a1 + 32) holdPowerAssertion];
  id v2 = [*(id *)(a1 + 32) initiator];
  [v2 cameraItemWithObjectID:[*(id *)(a1 + 40) unsignedIntegerValue]];
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  id v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = (char *)[v22 size];
  id v5 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"ICReadOffset"];
  if (v5)
  {
    id v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"ICReadOffset"];
    v7 = (char *)[v6 unsignedLongLongValue];
  }
  else
  {
    v7 = 0;
  }

  uint64_t v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"ICReadLength"];
  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"ICReadLength"];
    uint64_t v10 = (uint64_t)[v9 unsignedLongLongValue];
  }
  else
  {
    uint64_t v10 = (uint64_t)[v22 size];
  }

  BOOL v13 = v10 >= 1 && (uint64_t)v7 <= (uint64_t)v4 && (uint64_t)v7 >= 0 && (uint64_t)&v7[v10] <= (uint64_t)v4;
  uint64_t v14 = -21449;
  if (v13) {
    uint64_t v14 = 0;
  }
  if (v10 <= 52428800) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = -21446;
  }
  if (!v10 || v15)
  {
    [v3 addEntriesFromDictionary:*(void *)(a1 + 48)];
    id v18 = 0;
  }
  else
  {
    size_t v16 = sub_10002161C(v10);
    v17 = mmap(0, v16, 3, 4097, -1, 0);
    id v18 = [v22 readStream:v17 size:v10 offset:v7];
    v19 = dispatch_data_create(v17, v16, 0, _dispatch_data_destructor_munmap);
    [v3 addEntriesFromDictionary:*(void *)(a1 + 48)];
    if (v19) {
      goto LABEL_28;
    }
  }
  v19 = +[NSData data];
LABEL_28:
  [v3 setObject:v19 forKeyedSubscript:@"ICReadData"];

  [v3 setObject:&off_100054888 forKeyedSubscript:@"ICBufferOffset"];
  v20 = +[NSNumber numberWithUnsignedLong:v18];
  [v3 setObject:v20 forKeyedSubscript:@"ICBytesRead"];

  v21 = +[NSNumber numberWithInteger:v15];
  [v3 setObject:v21 forKeyedSubscript:@"errCode"];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) releasePowerAssertion];
}

void sub_10000C948(uint64_t a1)
{
  [*(id *)(a1 + 32) holdPowerAssertion];
  id v2 = [*(id *)(a1 + 32) itemForObjectHandle:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) initiator];
    unsigned int v4 = [v3 deleteFile:v2];

    char v5 = v4 ^ 1;
    if (v4) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = -9941;
    }
  }
  else
  {
    char v5 = 0;
    uint64_t v6 = 0;
  }
  v7 = +[NSMutableDictionary dictionary];
  [v7 addEntriesFromDictionary:*(void *)(a1 + 48)];
  uint64_t v8 = +[NSNumber numberWithInteger:v6];
  [v7 setObject:v8 forKeyedSubscript:@"errCode"];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 32) releasePowerAssertion];
  if ((v5 & 1) == 0)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000CAEC;
    v11[3] = &unk_10004C908;
    v11[4] = v9;
    id v12 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 40);
    uint64_t v10 = +[NSBlockOperation blockOperationWithBlock:v11];
    [v9 addInteractiveOperation:v10];
  }
}

void sub_10000CAEC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) allConnections];
  id v3 = [v2 mutableCopy];

  if (v3)
  {
    [v3 removeObject:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 48);
    CFStringRef v7 = @"ICObjectIDArray";
    unsigned int v4 = +[NSArray arrayWithObjects:&v6 count:1];
    uint64_t v8 = v4;
    char v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

    [*(id *)(a1 + 32) sendRemovedItemsNotification:v5 toConnections:v3];
  }
}

void sub_10000CCC0(uint64_t a1)
{
  [*(id *)(a1 + 32) holdPowerAssertion];
  id v2 = +[NSMutableDictionary dictionary];
  id v3 = [*(id *)(a1 + 32) initiator];
  unsigned int v4 = [v3 cameraItemWithObjectID:[*(id *)(a1 + 40) unsignedIntegerValue]];

  id v9 = 0;
  char v5 = [v4 fingerprintWithError:&v9];
  id v6 = v9;
  if (v5) {
    [v2 setObject:v5 forKeyedSubscript:@"ICCameraFileFingerprint"];
  }
  if (v6) {
    id v7 = [v6 code];
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = +[NSNumber numberWithInteger:v7];
  [v2 setObject:v8 forKeyedSubscript:@"errCode"];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) releasePowerAssertion];
}

void sub_10000CF90(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) initiator];
  [v2 sendPTPCommand:*(void *)(a1 + 40) andPayload:*(void *)(a1 + 48) withReply:*(void *)(a1 + 56)];
}

void sub_10000D354(id *a1)
{
  id v2 = [a1[4] initiator];
  id v3 = [a1[5] objectForKeyedSubscript:@"ICEnumerationChronologicalOrder"];
  unsigned int v4 = v3;
  if (v3) {
    [v2 setEnumerationOrder:[v3 integerValue]];
  }
  __ICOSLogCreate();
  char v5 = @"enumerateContent";
  if ((unint64_t)[@"enumerateContent" length] >= 0x15)
  {
    id v6 = [@"enumerateContent" substringWithRange:0, 18];
    char v5 = [v6 stringByAppendingString:@".."];
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Requested From:%d", [a1[6] processIdentifier]);
  uint64_t v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v5;
    uint64_t v10 = v8;
    *(_DWORD *)buf = 136446466;
    id v29 = [(__CFString *)v9 UTF8String];
    __int16 v30 = 2114;
    v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  unsigned __int8 v11 = [v2 readStorages];
  __ICOSLogCreate();
  if (v11)
  {
    id v12 = @"Content ^Enumerating^";
    if ((unint64_t)[@"Content ^Enumerating^" length] >= 0x15)
    {
      id v13 = [@"Content ^Enumerating^" substringWithRange:0, 18];
      id v12 = [v13 stringByAppendingString:@".."];
    }
    uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Requested From:%d", [a1[6] processIdentifier]);
    uint64_t v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      size_t v16 = v12;
      v17 = v15;
      id v18 = [(__CFString *)v16 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v29 = v18;
      __int16 v30 = 2114;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v19 = @"Content -Enumerated-";
    if ((unint64_t)[@"Content -Enumerated-" length] >= 0x15)
    {
      v20 = [@"Content -Enumerated-" substringWithRange:0, 18];
      v19 = [v20 stringByAppendingString:@".."];
    }
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Requested From:%d", [a1[6] processIdentifier]);
    id v22 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v23 = v19;
      v24 = v22;
      id v25 = [(__CFString *)v23 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v29 = v25;
      __int16 v30 = 2114;
      v31 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    id v26 = [v2 enumerationOrder];
    id v27 = a1[6];
    id v12 = +[NSArray arrayWithObjects:&v27 count:1];
    [v2 sendContentsNotificationWithOrder:v26 toConnections:v12];
  }
}

void sub_10000D94C(id a1)
{
  id v11 = objc_alloc((Class)NSSet);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  qword_100063478 = (uint64_t)[v11 initWithObjects:v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0];

  _objc_release_x1();
}

intptr_t sub_10000DF58(uint64_t a1)
{
  __ICOSLogCreate();
  uint64_t v2 = @"closeDevice";
  if ((unint64_t)[@"closeDevice" length] >= 0x15)
  {
    uint64_t v3 = [@"closeDevice" substringWithRange:0, 18];
    uint64_t v2 = [v3 stringByAppendingString:@".."];
  }
  uint64_t v4 = [*(id *)(a1 + 32) cameraDictionary];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"ICDeviceName"];
  uint64_t v6 = +[NSString stringWithFormat:@">>> Issuing Close: %@", v5];

  uint64_t v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v2;
    uint64_t v9 = v7;
    *(_DWORD *)buf = 136446466;
    id v14 = [(__CFString *)v8 UTF8String];
    __int16 v15 = 2114;
    size_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v10 = [*(id *)(a1 + 32) initiator];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 32) initiator];
    [v11 stop];
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000F0B8(uint64_t a1)
{
  if (![*(id *)(a1 + 32) requestPending])
  {
    int v2 = [*(id *)(a1 + 40) eventCode];
    if (v2 > 49152)
    {
      if (v2 == 49153)
      {
        if ([*(id *)(a1 + 32) isAppleDevice])
        {
          [*(id *)(a1 + 32) setDeviceIsPasscodeLocked:0];
          [*(id *)(a1 + 32) setDeviceIsPairedWithThisHost:1];
          v64[0] = @"ICAppleDeviceUnlocked";
          v63[0] = @"ICDeviceStatus";
          v63[1] = @"deviceIsPasscodeLocked";
          unsigned int v52 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) deviceIsPasscodeLocked]);
          v64[1] = v52;
          v63[2] = @"deviceIsPairedWithThisHost";
          v53 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) deviceIsPairedWithThisHost]);
          v64[2] = v53;
          v50 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:3];

          v51 = [*(id *)(a1 + 32) delegate];
          v54 = [*(id *)(a1 + 32) delegate];
          v55 = [v54 allConnections];
          [v51 sendStatusNotification:v50 toConnections:v55];

          goto LABEL_55;
        }
      }
      else if (v2 != 49154)
      {
        if (v2 == 49156)
        {
          if ([*(id *)(a1 + 32) isAppleDevice])
          {
            id v13 = [*(id *)(a1 + 40) parameter1];
            uint64_t v4 = [*(id *)(a1 + 32) objectInfoDatasetForNextObjectGroupInStorage:v13];
            id v14 = [*(id *)(a1 + 32) storageForStorageID:v13];
            if (v14) {
              [v14 enumerateContent:v4 withOrder:[*(id *)(a1 + 32) enumerationOrder]];
            }

LABEL_51:
            goto LABEL_56;
          }
        }
        else
        {
LABEL_59:
          if ([*(id *)(a1 + 40) eventCode] == 49173) {
            [*(id *)(a1 + 32) setSessionOpen:0];
          }
        }
      }
    }
    else
    {
      switch(v2)
      {
        case 16386:
          uint64_t v3 = [[*(id *)(a1 + 32) objectInfo:objc_msgSend(*(id *)(a1 + 40), "parameter1")];
          uint64_t v4 = v3;
          if (!v3) {
            goto LABEL_53;
          }
          uint64_t v5 = [*(id *)(a1 + 32) storageForStorageID:[v3 storageID]];
          if (!v5) {
            goto LABEL_23;
          }
          uint64_t v6 = [v5 cameraFolderWithObjectID:[v4 parentObject]];
          if (!v6) {
            goto LABEL_22;
          }
          CFStringRef v78 = @"ICPTPObjectInfoArray";
          uint64_t v7 = [v4 content:2];
          v77 = v7;
          uint64_t v8 = +[NSArray arrayWithObjects:&v77 count:1];
          v79 = v8;
          uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];

          [v6 newItemWithObjectInfo:v4 notify:0];
          uint64_t v10 = [*(id *)(a1 + 32) delegate];
          id v11 = [*(id *)(a1 + 32) delegate];
          id v12 = [v11 allConnections];
          [v10 sendAddedItemsNotification:v9 toConnections:v12];

LABEL_21:
LABEL_22:

LABEL_23:
LABEL_53:

          break;
        case 16387:
          __int16 v15 = [[*(id *)(a1 + 32) cameraItemWithObjectID:[*(id *)(a1 + 40) parameter1]];
          uint64_t v4 = v15;
          if (!v15) {
            goto LABEL_53;
          }
          uint64_t v5 = [*(id *)(a1 + 32) storageForStorageID:[v15 storageID]];
          if (!v5) {
            goto LABEL_23;
          }
          CFStringRef v75 = @"ICObjectIDArray";
          size_t v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 40) parameter1]);
          v74 = v16;
          v17 = +[NSArray arrayWithObjects:&v74 count:1];
          v76 = v17;
          uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];

          [v5 removeCameraFileFromIndex:[*(id *)(a1 + 40) parameter1]];
          uint64_t v9 = [*(id *)(a1 + 32) delegate];
          uint64_t v10 = [*(id *)(a1 + 32) delegate];
          id v11 = [v10 allConnections];
          [v9 sendRemovedItemsNotification:v6 toConnections:v11];
          goto LABEL_21;
        case 16388:
          unsigned int v18 = [*(id *)(a1 + 40) parameter1];
          unsigned int v19 = [*(id *)(a1 + 32) isAppleDevice];
          char v20 = v19;
          if (v19 && v18 != -17958194) {
            [*(id *)(a1 + 32) setDeviceFinishedEnumerating];
          }
          __ICOSLogCreate();
          v21 = @"storage";
          if ((unint64_t)[@"storage" length] >= 0x15)
          {
            id v22 = [@"storage" substringWithRange:0, 18];
            v21 = [v22 stringByAppendingString:@".."];
          }
          CFStringRef v23 = +[NSString stringWithFormat:@"added"];
          v24 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            id v25 = v21;
            id v26 = v24;
            *(_DWORD *)buf = 136446466;
            id v71 = [(__CFString *)v25 UTF8String];
            __int16 v72 = 2114;
            v73 = v23;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          if ([*(id *)(a1 + 32) sessionOpen]) {
            [*(id *)(a1 + 32) readStorages];
          }
          if ((v20 & 1) == 0) {
            break;
          }
          goto LABEL_56;
        case 16389:
          uint64_t v4 = [[*(id *)(a1 + 32) storageForStorageID:[*(id *)(a1 + 40) parameter1]];
          if ([v4 storageID] == -17958194)
          {
            [*(id *)(a1 + 32) setDeviceIsPasscodeLocked:0];
            [*(id *)(a1 + 32) setDeviceIsPairedWithThisHost:1];
            v69[0] = @"ICAppleDeviceUnlocked";
            v68[0] = @"ICDeviceStatus";
            v68[1] = @"deviceIsPasscodeLocked";
            id v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) deviceIsPasscodeLocked]);
            v69[1] = v27;
            v68[2] = @"deviceIsPairedWithThisHost";
            id v28 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) deviceIsPairedWithThisHost]);
            v69[2] = v28;
            id v29 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:3];

            __int16 v30 = [*(id *)(a1 + 32) delegate];
            v31 = [*(id *)(a1 + 32) delegate];
            v32 = [v31 allConnections];
            [v30 sendStatusNotification:v29 toConnections:v32];
          }
          if (v4)
          {
            v33 = +[NSMutableArray array];
            os_log_t v34 = [v4 indexedFiles];
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            id v35 = [v34 countByEnumeratingWithState:&v57 objects:v67 count:16];
            if (v35)
            {
              id v36 = v35;
              uint64_t v37 = *(void *)v58;
              do
              {
                for (i = 0; i != v36; i = (char *)i + 1)
                {
                  if (*(void *)v58 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  v39 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                  v40 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v39 objHandle]);
                  [v33 addObject:v40];

                  [v4 removeCameraFileFromIndex:[v39 objHandle]];
                }
                id v36 = [v34 countByEnumeratingWithState:&v57 objects:v67 count:16];
              }
              while (v36);
            }
            if ([v33 count])
            {
              CFStringRef v65 = @"ICObjectIDArray";
              v66 = v33;
              id v41 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
              v42 = [*(id *)(a1 + 32) delegate];
              v43 = [*(id *)(a1 + 32) delegate];
              v44 = [v43 allConnections];
              [v42 sendRemovedItemsNotification:v41 toConnections:v44];
            }
            CFStringRef v45 = [*(id *)(a1 + 32) storages];
            [v45 removeObject:v4];
          }
          if (![*(id *)(a1 + 32) isAppleDevice]) {
            goto LABEL_53;
          }
          id v46 = [*(id *)(a1 + 32) storages];
          id v47 = [v46 count];

          if (!v47) {
            [*(id *)(a1 + 32) setDeviceIsEnumerating];
          }
          goto LABEL_51;
        case 16396:
          uint64_t v4 = [*(id *)(a1 + 32) storageForStorageID:[*(id *)(a1 + 40) parameter1]];
          [v4 refreshInfo];
          goto LABEL_53;
        default:
          goto LABEL_59;
      }
    }
    CFStringRef v61 = @"ICPTPEvent";
    uint64_t v48 = [*(id *)(a1 + 40) contentForUSB];
    v49 = [v48 data];
    v62 = v49;
    v50 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];

    v51 = [*(id *)(a1 + 32) delegate];
    [v51 sendPTPEventNotification:v50];
LABEL_55:

LABEL_56:
    [*(id *)(a1 + 32) performSelector:"processUnhandledEvents" withObject:0 afterDelay:0.0];
    return;
  }
  id v56 = [*(id *)(a1 + 32) eventQueue];
  [v56 addObject:*(void *)(a1 + 40)];
}

void sub_100010A58(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (!v5 || (a3 & 1) != 0)
  {
    __ICOSLogCreate();
    id v13 = [@"RemoteServices" length];
    if (a3)
    {
      if ((unint64_t)v13 >= 0x15)
      {
        id v14 = [@"RemoteServices" substringWithRange:0, 18];
        uint64_t v7 = [v14 stringByAppendingString:@".."];
      }
      else
      {
        uint64_t v7 = @"RemoteServices";
      }
      string = +[NSString stringWithFormat:@"Canceled: 0x%08X", *(unsigned int *)(a1 + 48)];
      char v20 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_49;
      }
    }
    else
    {
      if ((unint64_t)v13 >= 0x15)
      {
        __int16 v15 = [@"RemoteServices" substringWithRange:0, 18];
        uint64_t v7 = [v15 stringByAppendingString:@".."];
      }
      else
      {
        uint64_t v7 = @"RemoteServices";
      }
      string = +[NSString stringWithFormat:@"Invalid Device: 0x%08X", *(unsigned int *)(a1 + 48)];
      char v20 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_49;
      }
    }
    uint64_t v7 = v7;
    v21 = v20;
    *(_DWORD *)buf = 136446466;
    id v39 = [(__CFString *)v7 UTF8String];
    __int16 v40 = 2114;
    id v41 = string;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

LABEL_49:
    goto LABEL_50;
  }
  uint64_t v6 = (__CFString *)remote_device_copy_properties();
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "LocationID");
    if (uint64 == *(_DWORD *)(a1 + 48))
    {
      string = (__CFString *)xpc_dictionary_get_string(v7, "BuildVersion");
      uint64_t v10 = +[NSMutableDictionary dictionary];
      if (string)
      {
        string = +[NSString stringWithUTF8String:string];
        if (string) {
          [(__CFString *)v10 setObject:string forKeyedSubscript:@"BuildVersion"];
        }
      }
      id v11 = xpc_dictionary_get_string(v7, "DeviceClass");
      if (v11)
      {
        uint64_t v12 = +[NSString stringWithUTF8String:v11];

        if (v12)
        {
          [(__CFString *)v10 setObject:v12 forKeyedSubscript:@"DeviceClass"];
          string = (__CFString *)v12;
        }
        else
        {
          string = 0;
        }
      }
      id v22 = xpc_dictionary_get_string(v7, "ProductType");
      if (v22)
      {
        uint64_t v23 = +[NSString stringWithUTF8String:v22];

        if (v23)
        {
          [(__CFString *)v10 setObject:v23 forKeyedSubscript:@"ProductType"];
          string = (__CFString *)v23;
        }
        else
        {
          string = 0;
        }
      }
      v24 = xpc_dictionary_get_string(v7, "OSVersion");
      if (v24)
      {
        uint64_t v25 = +[NSString stringWithUTF8String:v24];

        if (v25)
        {
          [(__CFString *)v10 setObject:v25 forKeyedSubscript:@"ProductVersion"];
          string = (__CFString *)v25;
        }
        else
        {
          string = 0;
        }
      }
      id v26 = xpc_dictionary_get_string(v7, "DeviceColor");
      if (v26)
      {
        uint64_t v27 = +[NSString stringWithUTF8String:v26];

        if (v27)
        {
          [(__CFString *)v10 setObject:v27 forKeyedSubscript:@"DeviceColor"];
          string = (__CFString *)v27;
        }
        else
        {
          string = 0;
        }
      }
      id v28 = xpc_dictionary_get_string(v7, "DeviceEnclosureColor");
      if (v28)
      {
        uint64_t v29 = +[NSString stringWithUTF8String:v28];

        if (v29)
        {
          [(__CFString *)v10 setObject:v29 forKeyedSubscript:@"DeviceEnclosureColor"];
          string = (__CFString *)v29;
        }
        else
        {
          string = 0;
        }
      }
      __int16 v30 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [*(id *)(a1 + 32) deviceIsPairedWithThisHost]);
      [(__CFString *)v10 setObject:v30 forKeyedSubscript:@"DevicePairedState"];

      v31 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [*(id *)(a1 + 32) deviceIsPasscodeLocked]);
      [(__CFString *)v10 setObject:v31 forKeyedSubscript:@"PasswordProtected"];

      [*(id *)(a1 + 32) addMobdevProperties:v10];
      __ICOSLogCreate();
      v32 = @"RemoteServices";
      if ((unint64_t)[@"RemoteServices" length] >= 0x15)
      {
        v33 = [@"RemoteServices" substringWithRange:0, 18];
        v32 = [v33 stringByAppendingString:@".."];
      }
      os_log_t v34 = +[NSString stringWithFormat:@"Updated: 0x%08X", *(unsigned int *)(a1 + 48)];
      id v35 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = v32;
        uint64_t v37 = v35;
        *(_DWORD *)buf = 136446466;
        id v39 = [(__CFString *)v36 UTF8String];
        __int16 v40 = 2114;
        id v41 = v34;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
    else
    {
      uint64_t v16 = uint64;
      __ICOSLogCreate();
      string = @"RemoteServices";
      if ((unint64_t)[@"RemoteServices" length] >= 0x15)
      {
        v17 = [@"RemoteServices" substringWithRange:0, 18];
        string = [v17 stringByAppendingString:@".."];
      }
      uint64_t v10 = +[NSString stringWithFormat:@"Ignored: 0x%08llX", v16];
      unsigned int v18 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        string = string;
        unsigned int v19 = v18;
        *(_DWORD *)buf = 136446466;
        id v39 = [(__CFString *)string UTF8String];
        __int16 v40 = 2114;
        id v41 = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
    }

    goto LABEL_49;
  }
LABEL_50:
}

void sub_1000117AC(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) timer];

  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) timerQueue];
    dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    [*(id *)(a1 + 32) setTimer:v4];

    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    uint64_t v6 = (unint64_t)(*(double *)(a1 + 48) * 1000000000.0);
    uint64_t v7 = [*(id *)(a1 + 32) timer];
    dispatch_source_set_timer(v7, v5, v6, 0x5F5E100uLL);

    uint64_t v8 = [*(id *)(a1 + 32) timer];
    dispatch_source_set_event_handler(v8, *(dispatch_block_t *)(a1 + 40));

    uint64_t v9 = [*(id *)(a1 + 32) timer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001192C;
    handler[3] = &unk_10004CA38;
    handler[4] = *(void *)(a1 + 32);
    dispatch_source_set_cancel_handler(v9, handler);

    uint64_t v10 = [*(id *)(a1 + 32) timer];
    dispatch_resume(v10);
  }
}

void sub_10001192C(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) timerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000119BC;
  block[3] = &unk_10004CA38;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

id sub_1000119BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTimer:0];
}

uint64_t sub_100011A7C(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) timer];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) timer];
    dispatch_source_cancel(v3);
  }
  dispatch_source_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void sub_100011B58(uint64_t a1)
{
  [*(id *)(a1 + 32) setDeviceIsEnumerating:1];
  v7[1] = @"deviceIsEnumerating";
  v8[0] = @"ICDeviceIsEnumerating";
  v7[0] = @"ICDeviceStatus";
  int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) deviceIsEnumerating]);
  v8[1] = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  dispatch_source_t v4 = [*(id *)(a1 + 32) delegate];
  dispatch_time_t v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v6 = [v5 allConnections];
  [v4 sendStatusNotification:v3 toConnections:v6];
}

void sub_100011CE4(uint64_t a1)
{
  [*(id *)(a1 + 32) setDeviceIsEnumerating:0];
  v7[1] = @"deviceIsEnumerating";
  v8[0] = @"ICDeviceIsEnumerating";
  v7[0] = @"ICDeviceStatus";
  int v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) deviceIsEnumerating]);
  v8[1] = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  dispatch_source_t v4 = [*(id *)(a1 + 32) delegate];
  dispatch_time_t v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v6 = [v5 allConnections];
  [v4 sendStatusNotification:v3 toConnections:v6];
}

void sub_100014E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014EB0(uint64_t a1)
{
  int v2 = [PTPOperationRequestPacket alloc];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v3 transactionID];
  [v3 setTransactionID:(v4 + 1)];
  dispatch_time_t v5 = [(PTPOperationRequestPacket *)v2 initWithOperationCode:36865 transactionID:v4 dataPhaseInfo:1];
  uint64_t v6 = [[PTPTransaction alloc] initWithOperationRequestPacket:v5 txData:0 rxData:0 dataExpected:0];
  uint64_t v7 = [*(id *)(a1 + 32) executeTransaction:v6 timeout:60.0];
  uint64_t v8 = v7;
  if (v7 && [v7 responseCode] == 8193)
  {
    unsigned int v9 = [v8 numParameters];
    if (v9 >= 3)
    {
      unsigned int v10 = v9;
      [*(id *)(a1 + 32) setDeviceIsPasscodeLocked:objc_msgSend(v8, "parameter3") != 0];
      __ICOSLogCreate();
      id v11 = @"access";
      if ((unint64_t)[@"access" length] >= 0x15)
      {
        uint64_t v12 = [@"access" substringWithRange:0, 18];
        id v11 = [v12 stringByAppendingString:@".."];
      }
      id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"deviceIsPasscodeLocked: %d", [*(id *)(a1 + 32) deviceIsPasscodeLocked]);
      id v14 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = v11;
        uint64_t v16 = v14;
        *(_DWORD *)buf = 136446466;
        id v57 = [(__CFString *)v15 UTF8String];
        __int16 v58 = 2114;
        long long v59 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      if (v10 >= 4) {
        [*(id *)(a1 + 32) setDeviceIsPairedWithThisHost:objc_msgSend(v8, "parameter4") != 0];
      }
    }
    id v47 = v8;
    uint64_t v48 = v6;
    v49 = v5;
    [*(id *)(a1 + 32) storageIDs];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v17 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v52;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v52 != v19) {
            objc_enumerationMutation(obj);
          }
          if ([*(id *)(*((void *)&v51 + 1) + 8 * i) unsignedIntValue] == -17958194)
          {
            __ICOSLogCreate();
            v21 = @"access";
            if ((unint64_t)[@"access" length] >= 0x15)
            {
              id v22 = [@"access" substringWithRange:0, 18];
              v21 = [v22 stringByAppendingString:@".."];
            }
            uint64_t v23 = +[NSString stringWithFormat:@"containsAccessRestrictedAppleDeviceStorage"];
            v24 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v25 = a1;
              id v26 = v21;
              uint64_t v27 = v24;
              id v28 = v26;
              a1 = v25;
              id v29 = [(__CFString *)v28 UTF8String];
              *(_DWORD *)buf = 136446466;
              id v57 = v29;
              __int16 v58 = 2114;
              long long v59 = v23;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
            }
            [*(id *)(a1 + 32) setDeviceIsPairedWithThisHost:0];
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v18);
    }
    __ICOSLogCreate();
    __int16 v30 = @"access";
    if ((unint64_t)[@"access" length] >= 0x15)
    {
      v31 = [@"access" substringWithRange:0, 18];
      __int16 v30 = [v31 stringByAppendingString:@".."];
    }
    v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"deviceIsPairedWithThisHost: %d", [*(id *)(a1 + 32) deviceIsPairedWithThisHost]);
    v33 = (void *)_gICOSLog;
    uint64_t v6 = v48;
    dispatch_time_t v5 = v49;
    uint64_t v8 = v47;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v34 = v30;
      id v35 = v33;
      id v36 = [(__CFString *)v34 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v57 = v36;
      __int16 v58 = 2114;
      long long v59 = v32;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  if ([*(id *)(a1 + 32) deviceIsPasscodeLocked]) {
    char v37 = 1;
  }
  else {
    char v37 = [*(id *)(a1 + 32) deviceIsPairedWithThisHost] ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v37;
  int v38 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  __ICOSLogCreate();
  id v39 = [@"trust" length];
  if (v38)
  {
    if ((unint64_t)v39 >= 0x15)
    {
      __int16 v40 = [@"trust" substringWithRange:0, 18];
      v42 = [v40 stringByAppendingString:@".."];
    }
    else
    {
      v42 = @"trust";
    }
    v43 = +[NSString stringWithFormat:@"Setting self.needToReopenSession = YES"];
    v44 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_41:
      v42 = v42;
      CFStringRef v45 = v44;
      id v46 = [(__CFString *)v42 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v57 = v46;
      __int16 v58 = 2114;
      long long v59 = v43;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if ((unint64_t)v39 >= 0x15)
    {
      id v41 = [@"trust" substringWithRange:0, 18];
      v42 = [v41 stringByAppendingString:@".."];
    }
    else
    {
      v42 = @"trust";
    }
    v43 = +[NSString stringWithFormat:@"Setting self.needToReopenSession = NO"];
    v44 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
  }

  [*(id *)(a1 + 32) setNeedToReopenSession:v38 != 0];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100015AD0(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyDeviceReady:0];
  uint64_t v66 = a1;
  int v2 = [*(id *)(a1 + 32) storages];
  id v3 = [v2 copy];

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v3;
  id v60 = [obj countByEnumeratingWithState:&v77 objects:v93 count:16];
  if (v60)
  {
    uint64_t v59 = *(void *)v78;
    id v4 = &CFAllocatorReallocate_ptr;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v78 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = v5;
        uint64_t v6 = *(void **)(*((void *)&v77 + 1) + 8 * v5);
        uint64_t v7 = [v6 indexedFolders];
        if (v7)
        {
          unsigned int v9 = [v4[205] array];
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          unsigned int v10 = v7;
          id v11 = v7;
          id v12 = [v11 countByEnumeratingWithState:&v73 objects:v92 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v74;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v74 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = [*(id *)(*((void *)&v73 + 1) + 8 * i) info];
                id v17 = [v16 content:2];
                [v9 addObject:v17];
              }
              id v13 = [v11 countByEnumeratingWithState:&v73 objects:v92 count:16];
            }
            while (v13);
          }

          CFStringRef v90 = @"ICPTPObjectInfoArray";
          id v18 = [v9 copy];
          id v91 = v18;
          uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];

          char v20 = [*(id *)(v66 + 32) delegate];
          [v20 sendAddedItemsNotification:v19 toConnections:*(void *)(v66 + 40)];

          [v9 removeAllObjects];
          uint64_t v7 = v10;
          id v4 = &CFAllocatorReallocate_ptr;
        }
        v21 = [v6 indexedFiles];
        if (v21)
        {
          uint64_t v23 = [v4[205] array];
          context = v22;
          v62 = v21;
          if (*(void *)(v66 + 48) == -1) {
            [v21 objectEnumerator];
          }
          else {
          v24 = [v21 reverseObjectEnumerator];
          }
          v63 = v7;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          id v25 = v24;
          id v26 = [v25 countByEnumeratingWithState:&v69 objects:v89 count:16];
          id v68 = v25;
          if (v26)
          {
            id v27 = v26;
            int v28 = 0;
            id v29 = 0;
            uint64_t v30 = *(void *)v70;
            CFStringRef v65 = v23;
            do
            {
              v31 = 0;
              id v67 = v27;
              do
              {
                if (*(void *)v70 != v30) {
                  objc_enumerationMutation(v68);
                }
                v32 = *(void **)(*((void *)&v69 + 1) + 8 * (void)v31);
                v33 = [v32 info];
                os_log_t v34 = [v33 relatedUUID];

                if (v29)
                {
                  if ([v29 compare:v34])
                  {
                    id v35 = [v34 copy];

                    if (v28 < 1000)
                    {
                      ++v28;
                    }
                    else
                    {
                      CFStringRef v87 = @"ICPTPObjectInfoArray";
                      id v36 = [v23 copy];
                      id v88 = v36;
                      char v37 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];

                      __ICOSLogCreate();
                      int v38 = @"Flushing";
                      if ((unint64_t)[@"Flushing" length] >= 0x15)
                      {
                        id v39 = [@"Flushing" substringWithRange:0, 18];
                        int v38 = [v39 stringByAppendingString:@".."];
                      }
                      __int16 v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"FlushCount: %lu", [v23 count]);
                      id v41 = (void *)_gICOSLog;
                      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
                      {
                        v42 = v38;
                        v43 = v41;
                        id v44 = [(__CFString *)v42 UTF8String];
                        *(_DWORD *)buf = 136446466;
                        id v84 = v44;
                        __int16 v85 = 2114;
                        v86 = v40;
                        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
                      }
                      CFStringRef v45 = [*(id *)(v66 + 32) delegate];
                      [v45 sendAddedItemsNotification:v37 toConnections:*(void *)(v66 + 40)];

                      uint64_t v23 = v65;
                      [v65 removeAllObjects];

                      int v28 = 0;
                    }
                    id v29 = v35;
                    id v27 = v67;
                  }
                }
                else
                {
                  id v29 = [v34 copy];
                }
                id v46 = [v32 info];
                id v47 = [v46 content:2];
                [v23 addObject:v47];

                v31 = (char *)v31 + 1;
              }
              while (v27 != v31);
              id v27 = [v68 countByEnumeratingWithState:&v69 objects:v89 count:16];
            }
            while (v27);
          }
          else
          {
            id v29 = 0;
          }

          CFStringRef v81 = @"ICPTPObjectInfoArray";
          id v48 = [v23 copy];
          id v82 = v48;
          v49 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];

          __ICOSLogCreate();
          v50 = @"Flushing";
          if ((unint64_t)[@"Flushing" length] >= 0x15)
          {
            long long v51 = [@"Flushing" substringWithRange:0, 18];
            v50 = [v51 stringByAppendingString:@".."];
          }
          long long v52 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"FlushCount: %lu", [v23 count]);
          long long v53 = (void *)_gICOSLog;
          id v4 = &CFAllocatorReallocate_ptr;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            long long v54 = v50;
            v55 = v53;
            id v56 = [(__CFString *)v54 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v84 = v56;
            __int16 v85 = 2114;
            v86 = v52;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          id v57 = [*(id *)(v66 + 32) delegate];
          [v57 sendAddedItemsNotification:v49 toConnections:*(void *)(v66 + 40)];

          v21 = v62;
          uint64_t v7 = v63;
        }

        uint64_t v5 = v64 + 1;
      }
      while ((id)(v64 + 1) != v60);
      id v60 = [obj countByEnumeratingWithState:&v77 objects:v93 count:16];
    }
    while (v60);
  }
}

void sub_100016EE0(id a1)
{
  id v6 = +[NSProcessInfo processInfo];
  uint64_t v1 = [v6 processName];
  int v2 = (const char *)[ICLoggingDomain UTF8String];
  id v3 = v1;
  os_log_t v4 = os_log_create(v2, (const char *)[v3 UTF8String]);
  uint64_t v5 = (void *)_gICOSLog;
  _gICOSLog = (uint64_t)v4;
}

uint64_t __ICLogTypeEnabled(uint64_t a1)
{
  return ICLoggingLevel & a1;
}

void sub_100017DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_100017DDC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) transport];
  unsigned __int8 v8 = [v7 connected];

  if ((v8 & 1) == 0) {
    *a4 = 1;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    id v9 = v6;
  }
  else
  {
    [*(id *)(a1 + 32) objectInfo:[v6 unsignedIntValue]];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  unsigned int v10 = v9;
  if (v9)
  {
    if ([v9 objectFormat] == 12289)
    {
      id v11 = *(void **)(a1 + 40);
LABEL_11:
      [v11 addObject:v10];
      goto LABEL_12;
    }
    if (*(unsigned char *)(a1 + 64))
    {
      id v11 = *(void **)(a1 + 48);
      goto LABEL_11;
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100017F50;
    v14[3] = &unk_10004CAF0;
    v14[4] = *(void *)(a1 + 56);
    id v12 = objc_retainBlock(v14);
    id v13 = [*(id *)(a1 + 48) indexOfObject:v10 inSortedRange:0 options:objc_msgSend(*(id *)(a1 + 48), "count") usingComparator:v12];
    if (v13 != (id)0x7FFFFFFFFFFFFFFFLL) {
      [*(id *)(a1 + 48) insertObject:v10 atIndex:v13];
    }
  }
LABEL_12:
}

uint64_t sub_100017F50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 intervalSince1970];
  id v7 = [v5 intervalSince1970];

  if (v7 > v6) {
    return *(void *)(a1 + 32);
  }
  else {
    return -*(void *)(a1 + 32);
  }
}

uint64_t sub_100017FAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100017FBC(uint64_t a1)
{
}

void sub_100017FC4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [*(id *)(a1 + 32) transport];
  unsigned __int8 v8 = [v7 connected];

  if ((v8 & 1) == 0) {
    *a4 = 1;
  }
  id v9 = v6;
  unsigned int v10 = [v9 parentObject];
  id v11 = [v9 filename];
  unsigned int v12 = [v11 isEqualToString:@"DCIM"];

  if (v10)
  {
    int v13 = v10 == [*(id *)(a1 + 40) storageID] ? 1 : v12;
    if (v13 != 1)
    {
      uint64_t v30 = [*(id *)(a1 + 40) cameraFolderWithObjectID:v10];
      if ([v30 type] == (id)3) {
        v31 = v30;
      }
      else {
        v31 = 0;
      }
      id v14 = v31;

      if (v14) {
        goto LABEL_9;
      }
LABEL_32:
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v9];
      goto LABEL_33;
    }
  }
  id v14 = *(id *)(a1 + 40);
  if (!v14) {
    goto LABEL_32;
  }
LABEL_9:
  uint64_t v16 = +[NSMutableArray array];
  id v17 = [*(id *)(a1 + 40) newFolderWithObjectInfo:v9 inFolder:v14 notify:*(unsigned char *)(a1 + 56) == 0];
  if (v17)
  {
    v32 = v15;
    id v33 = v14;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v18 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v19 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v39;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          unsigned int v24 = [v23 parentObject:v32, v33];
          if (v24 == [v17 objHandle]) {
            [v16 addObject:v23];
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v20);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeObjectsInArray:v16];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v25 = v16;
    id v26 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v35;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(v25);
          }
        }
        id v27 = [v25 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v27);
    }

    __int16 v15 = v32;
    id v14 = v33;
  }

LABEL_33:
}

void sub_1000182E4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [*(id *)(a1 + 32) transport];
  unsigned __int8 v8 = [v7 connected];

  if ((v8 & 1) == 0) {
    *a4 = 1;
  }
  id v9 = v6;
  unsigned int v10 = [v9 parentObject];
  id v11 = *(void **)(a1 + 40);
  if (v10)
  {
    unsigned int v12 = [v11 cameraFolderWithObjectID:v10];
    if ([v12 type] == (id)3) {
      int v13 = v12;
    }
    else {
      int v13 = 0;
    }
    id v14 = v13;

    if (v14) {
      goto LABEL_8;
    }
  }
  else
  {
    id v14 = v11;
    if (v14)
    {
LABEL_8:
      if ([v9 objectFormat] == 12290
        || [v9 objectFormat] == 12291
        || [v9 objectFormat] == 12292
        || [v9 objectFormat] == 12293
        || [v9 objectFormat] == 12294)
      {
        __ICOSLogCreate();
        uint64_t v16 = @"objInfo";
        if ((unint64_t)[@"objInfo" length] >= 0x15)
        {
          id v17 = [@"objInfo" substringWithRange:0, 18];
          uint64_t v16 = [v17 stringByAppendingString:@".."];
        }
        id v18 = +[NSString stringWithFormat:@"unknown: %@", v9];
        id v19 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = v16;
          uint64_t v21 = v19;
          *(_DWORD *)buf = 136446466;
          id v32 = [(__CFString *)v20 UTF8String];
          __int16 v33 = 2114;
          long long v34 = v18;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
      }
      [*(id *)(a1 + 40) newItemWithObjectInfo:v9 notify:*(unsigned char *)(a1 + 48) == 0];
      id v22 = [*(id *)(a1 + 32) transport];
      unsigned __int8 v23 = [v22 connected];

      if ((v23 & 1) == 0) {
        *a4 = 1;
      }
      goto LABEL_27;
    }
  }
  __ICOSLogCreate();
  unsigned int v24 = [v9 filename];
  if ((unint64_t)[v24 length] >= 0x15)
  {
    id v25 = [v24 substringWithRange:0, 18];
    uint64_t v26 = [v25 stringByAppendingString:@".."];

    unsigned int v24 = (void *)v26;
  }
  id v27 = +[NSString stringWithFormat:@"Missing Parent"];
  uint64_t v28 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = v24;
    uint64_t v30 = v28;
    *(_DWORD *)buf = 136446466;
    id v32 = [v29 UTF8String];
    __int16 v33 = 2114;
    long long v34 = v27;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
LABEL_27:
}

void sub_100018BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100018C0C(uint64_t a1)
{
  int v2 = [@"/var/mobile/Library/com.apple.imagecapture" stringByAppendingPathComponent:@"externalDeviceAccess.db"];
  id v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 fileExistsAtPath:@"/var/mobile/Library/com.apple.imagecapture"];

  if ((v4 & 1) == 0)
  {
    id v5 = +[NSFileManager defaultManager];
    uint64_t v11 = 0;
    [v5 createDirectoryAtPath:@"/var/mobile/Library/com.apple.imagecapture" withIntermediateDirectories:0 attributes:0 error:&v11];
  }
  if ([*(id *)(a1 + 32) openDB:v2])
  {
    __ICOSLogCreate();
    id v6 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v7 = [@"icaccess" substringWithRange:0, 18];
      id v6 = [v7 stringByAppendingString:@".."];
    }
    unsigned __int8 v8 = +[NSString stringWithFormat:@"Failed to open/create database"];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033C1C();
    }
  }
  else
  {
    errmsg = 0;
    if (!sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) externalMediaAccessDB], "CREATE TABLE IF NOT EXISTS external_device_access (ID INTEGER PRIMARY KEY AUTOINCREMENT, bundle_id TEXT, date_added INTEGER, read_access INTEGER, write_access INTEGER, control_informed INTEGER)", 0, 0, &errmsg))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_14;
    }
    __ICOSLogCreate();
    id v6 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v9 = [@"icaccess" substringWithRange:0, 18];
      id v6 = [v9 stringByAppendingString:@".."];
    }
    unsigned __int8 v8 = +[NSString stringWithFormat:@"Failed to create table: external_device_access - %s", errmsg];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033C1C();
    }
  }

LABEL_14:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100018FEC(id a1)
{
  qword_100063490 = objc_alloc_init(ICDeviceAccessManager);

  _objc_release_x1();
}

void sub_10001A0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001A0E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001A0F0(uint64_t a1)
{
}

void sub_10001A0F8(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)[*(id *)(a1 + 32) externalMediaAccessDB], (const char *)[@"SELECT bundle_id FROM external_device_access;" UTF8String],
         (int (__cdecl *)(void *, int, char **, char **))sub_10001A24C,
         v2,
         &errmsg))
  {
    __ICOSLogCreate();
    id v3 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      unsigned __int8 v4 = [[@"icaccess" substringWithRange:0, 18];
      id v3 = [v4 stringByAppendingString:@".."];
    }
    id v5 = +[NSString stringWithFormat:@"%s", errmsg];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033C1C();
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v2];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_10001A24C(void *a1, int a2, void *a3)
{
  id v18 = a1;
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    id v6 = (os_log_t *)&_gICOSLog;
    do
    {
      if (*a3)
      {
        id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
        [v18 addObject:v7];
      }
      __ICOSLogCreate();
      unsigned __int8 v8 = @"adding";
      if ((unint64_t)[@"adding" length] >= 0x15)
      {
        id v9 = [[@"adding" substringWithRange:0, 18];
        unsigned __int8 v8 = [v9 stringByAppendingString:@".."];
      }
      unsigned int v10 = +[NSString stringWithFormat:@"%s", *a3];
      os_log_t v11 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v12 = v6;
        int v13 = v8;
        id v14 = v11;
        __int16 v15 = v13;
        id v6 = v12;
        id v16 = [(__CFString *)v15 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v20 = v16;
        __int16 v21 = 2114;
        id v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      ++a3;
      --v5;
    }
    while (v5);
  }

  return 0;
}

void sub_10001A5DC(uint64_t a1)
{
  id v7 = +[NSDate date];
  uint64_t v2 = *(void *)(a1 + 32);
  [v7 timeIntervalSince1970];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"INSERT INTO external_device_access(bundle_id,date_added,read_access,write_access,control_informed) VALUES ('%@',%lu,%lu,%lu,%lu);",
    v2,
    (unint64_t)v3,
    0,
    0,
  unsigned __int8 v4 = 0);
  uint64_t v5 = (sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB];
  id v6 = v4;
  sqlite3_exec(v5, (const char *)[v6 UTF8String], 0, 0, 0);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10001A7D0(uint64_t a1)
{
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"UPDATE external_device_access SET %@ = %lu WHERE bundle_id = '%@';",
    *(void *)(a1 + 32),
    *(void *)(a1 + 64),
  uint64_t v2 = *(void *)(a1 + 40));
  errmsg = 0;
  double v3 = (sqlite3 *)[*(id *)(a1 + 48) externalMediaAccessDB];
  id v4 = v2;
  if (sqlite3_exec(v3, (const char *)[v4 UTF8String], 0, 0, &errmsg))
  {
    __ICOSLogCreate();
    uint64_t v5 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v6 = [[@"icaccess" substringWithRange:0, 18];
      uint64_t v5 = [v6 stringByAppendingString:@".."];
    }
    id v7 = +[NSString stringWithFormat:@"%s", errmsg];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033C1C();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void sub_10001AAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001AAC0(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT bundle_id, %@ FROM external_device_access;",
    *(void *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)[v3 UTF8String];

  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB], v4, (int (__cdecl *)(void *, int, char **, char **))sub_10001AC34, v2, &errmsg))
  {
    __ICOSLogCreate();
    uint64_t v5 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v6 = [@"icaccess" substringWithRange:0, 18];
      uint64_t v5 = [v6 stringByAppendingString:@".."];
    }
    id v7 = +[NSString stringWithFormat:@"%s", errmsg];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033C1C();
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v2];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t sub_10001AC34(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  id v13 = a1;
  id v7 = +[NSMutableDictionary dictionary];
  if (a2 >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)(a3 + 8 * v8))
      {
        switch((int)v8)
        {
          case 0:
            id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
            unsigned int v10 = +[NSString stringWithFormat:@"%s", *(void *)(a4 + 8 * v8)];
            [v7 setObject:v9 forKeyedSubscript:v10];
            goto LABEL_6;
          case 1:
          case 2:
          case 3:
          case 4:
            id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
            unsigned int v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 integerValue]);
            os_log_t v11 = +[NSString stringWithFormat:@"%s", *(void *)(a4 + 8 * v8)];
            [v7 setObject:v10 forKeyedSubscript:v11];

LABEL_6:
            break;
          default:
            break;
        }
      }
      ++v8;
    }
    while (a2 != v8);
  }
  [v13 addObject:v7];

  return 0;
}

void sub_10001B210(uint64_t a1)
{
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"DELETE FROM external_device_access WHERE bundle_id IS '%@';",
  id v2 = *(void *)(a1 + 32));
  errmsg = 0;
  id v3 = (sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB];
  id v4 = v2;
  if (sqlite3_exec(v3, (const char *)[v4 UTF8String], 0, 0, &errmsg))
  {
    __ICOSLogCreate();
    uint64_t v5 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v6 = [@"icaccess" substringWithRange:0, 18];
      uint64_t v5 = [v6 stringByAppendingString:@".."];
    }
    id v7 = +[NSString stringWithFormat:@"%s", errmsg];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033C1C();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10001B718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_10001B754(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"SELECT bundle_id FROM external_device_access WHERE bundle_id IS '%@';",
    *(void *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = (const char *)[v3 UTF8String];

  errmsg = 0;
  if (sqlite3_exec((sqlite3 *)[*(id *)(a1 + 40) externalMediaAccessDB], v4, (int (__cdecl *)(void *, int, char **, char **))sub_10001AC34, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), &errmsg))
  {
    __ICOSLogCreate();
    uint64_t v5 = @"icaccess";
    if ((unint64_t)[@"icaccess" length] >= 0x15)
    {
      id v6 = [[@"icaccess" substringWithRange:0, 18];
      uint64_t v5 = [v6 stringByAppendingString:@".."];
    }
    id v7 = +[NSString stringWithFormat:@"%s", errmsg];
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR)) {
      sub_100033C1C();
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v2];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10001BA94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10001BAAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

int64_t sub_10001DBB0(id a1, ICMediaItemProtocol *a2, ICMediaItemProtocol *a3)
{
  id v4 = a3;
  id v5 = [(ICMediaItemProtocol *)a2 unsignedIntegerValue];
  id v6 = [(ICMediaItemProtocol *)v4 unsignedIntegerValue];

  int64_t v7 = -1;
  if (v6 <= v5) {
    int64_t v7 = 1;
  }
  if (v6 == v5) {
    return 0;
  }
  else {
    return v7;
  }
}

int64_t sub_10001E114(id a1, NSNumber *a2, NSNumber *a3)
{
  id v4 = a3;
  NSUInteger v5 = [(NSNumber *)a2 unsignedIntegerValue];
  id v6 = [(NSNumber *)v4 unsignedIntegerValue];

  int64_t v7 = -1;
  if ((unint64_t)v6 <= v5) {
    int64_t v7 = 1;
  }
  if (v6 == (id)v5) {
    return 0;
  }
  else {
    return v7;
  }
}

void sub_10001F958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001F988(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [*(id *)(a1 + 32) removeSessionWithConnection:WeakRetained];
  __ICOSLogCreate();
  id v3 = @"CM";
  if ((unint64_t)[@"CM" length] >= 0x15)
  {
    id v4 = [@"CM" substringWithRange:0, 18];
    id v3 = [v4 stringByAppendingString:@".."];
  }
  NSUInteger v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"xpc-term: [%05d]", [WeakRetained processIdentifier]);
  id v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v7 = v3;
    uint64_t v8 = v6;
    *(_DWORD *)buf = 136446466;
    id v10 = [(__CFString *)v7 UTF8String];
    __int16 v11 = 2114;
    unsigned int v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

void sub_1000211EC(uint64_t a1)
{
  id v2 = [PTPCameraFile alloc];
  id v3 = [*(id *)(a1 + 32) storageID];
  id v4 = *(void **)(a1 + 40);
  id v5 = [v4 objectHandle];
  id v6 = *(void **)(a1 + 32);
  int64_t v7 = [v6 initiator];
  uint64_t v8 = [(PTPCameraFile *)v2 initWithStorageID:v3 ptpObjectInfo:v4 objHandle:v5 parent:v6 initiator:v7];

  __ICOSLogCreate();
  id v9 = +[NSString stringWithFormat:@"File queued: %@\n", v8];
  id v10 = [v9 description];
  __int16 v11 = +[NSString stringWithFormat:@"%@", v10];

  if (__ICLogTypeEnabled(4))
  {
    unsigned int v12 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }

  id v13 = [*(id *)(a1 + 32) storage];
  [v13 addCameraFileToIndex:v8];

  id v14 = [*(id *)(a1 + 32) initiator];
  __int16 v15 = [v14 delegate];

  CFStringRef v21 = @"ICPTPObjectInfoArray";
  id v16 = [*(id *)(a1 + 40) content:2];
  id v20 = v16;
  id v17 = +[NSArray arrayWithObjects:&v20 count:1];
  id v22 = v17;
  id v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

  id v19 = [v15 allConnections];
  [v15 sendAddedItemsNotification:v18 toConnections:v19];
}

unint64_t sub_10002161C(uint64_t a1)
{
  uint64_t v1 = a1 + 12;
  if (a1 < -12) {
    uint64_t v1 = a1 + 16395;
  }
  return (v1 & 0xFFFFFFFFFFFFC000) + 0x4000;
}

id sub_100021638(void *a1)
{
  if (a1)
  {
    memset(&v3, 0, sizeof(v3));
    v3.tm_isdst = -1;
    strptime_l((const char *)[a1 UTF8String], "%Y:%m:%d %H:%M:%S", &v3);
    a1 = +[NSDate dateWithTimeIntervalSince1970:(double)mktime(&v3)];
    uint64_t v1 = vars8;
  }
  return a1;
}

id sub_1000216C4(void *a1)
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = 0;
  uint64_t v1 = (const char *)[a1 UTF8String];
  if (v1 && (id v2 = v1, strlen(v1) >= 0xF))
  {
    sscanf(v2, "%04d%02d%02dT%02d%02d%02d", (char *)&v13 + 4, &v13, (char *)&v12 + 4, &v12, (char *)&v11 + 4, &v11);
    uint64_t v4 = v13;
    uint64_t v3 = HIDWORD(v13);
    uint64_t v6 = v12;
    uint64_t v5 = HIDWORD(v12);
    uint64_t v8 = v11;
    uint64_t v7 = HIDWORD(v11);
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  id v9 = +[NSString stringWithFormat:@"%04d:%02d:%02d %02d:%02d:%02d", v3, v4, v5, v6, v7, v8];

  return v9;
}

void sub_10002179C(void *a1, void *a2, void *a3, void *a4)
{
  id v13 = a1;
  uint64_t v7 = [v13 objectForKey:kCGImagePropertyOrientation];
  if (!v7)
  {
    uint64_t v7 = [v13 objectForKey:kCGImagePropertyTIFFOrientation];
    if (!v7) {
      uint64_t v7 = &off_100054F78;
    }
  }
  uint64_t v8 = v7;
  *a2 = v8;
  id v9 = [v13 objectForKey:@"RawPixelWidth"];
  if (!v9)
  {
    id v9 = [v13 objectForKey:kCGImagePropertyPixelWidth];
    if (!v9)
    {
      id v9 = [v13 objectForKey:kCGImagePropertyExifPixelXDimension];
    }
  }
  id v10 = v9;
  *a3 = v10;
  uint64_t v11 = [v13 objectForKey:@"RawPixelHeight"];
  if (!v11)
  {
    uint64_t v11 = [v13 objectForKey:kCGImagePropertyPixelHeight];
    if (!v11)
    {
      uint64_t v11 = [v13 objectForKey:kCGImagePropertyExifPixelYDimension];
    }
  }
  id v12 = v11;
  *a4 = v12;
}

void sub_100021948(id a1)
{
  id v13 = objc_alloc((Class)NSSet);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = [v13 initWithObjects:v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0];
  uint64_t v12 = qword_1000634A0;
  qword_1000634A0 = (uint64_t)v11;

  _objc_release_x1(v11, v12);
}

void sub_100021D88(id a1)
{
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = qword_1000634B0;
  qword_1000634B0 = v1;

  _objc_release_x1(v1, v2);
}

id sub_1000227F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchBasicMetadata];
}

void sub_10002441C(id a1)
{
  id v3 = (id)CGImageSourceCopyTypeExtensions();
  id v1 = [objc_alloc((Class)NSSet) initWithArray:v3];
  uint64_t v2 = (void *)qword_100063510;
  qword_100063510 = (uint64_t)v1;
}

void sub_100024518(id a1)
{
  id v3 = (id)CGImageSourceCopyTypeExtensions();
  id v1 = [objc_alloc((Class)NSMutableSet) initWithArray:v3];
  uint64_t v2 = (void *)qword_100063518;
  qword_100063518 = (uint64_t)v1;

  [(id)qword_100063518 removeObject:@"tif"];
}

id sub_100026BB0(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = a4 + 12;
  if (a4 < -12) {
    uint64_t v8 = a4 + 16395;
  }
  uint64_t v9 = (char *)malloc_type_malloc((v8 & 0xFFFFFFFFFFFFC000) + 0x4000, 0x6818771EuLL);
  id v10 = [a1 readStream:v9 size:a4 offset:a3];
  memcpy(a2, v9 + 12, (size_t)v10);
  free(v9);
  return v10;
}

void sub_1000298E4(void *a1, io_iterator_t a2)
{
  id v3 = a1;
  io_object_t v4 = IOIteratorNext(a2);
  if (v4)
  {
    io_registry_entry_t v5 = v4;
    do
    {
      CFMutableDictionaryRef properties = 0;
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (!Mutable) {
        break;
      }
      CFMutableDictionaryRef v7 = Mutable;
      if (IORegistryEntryCreateCFProperties(v5, &properties, 0, 0)) {
        break;
      }
      Value = (void *)CFDictionaryGetValue(properties, @"locationID");
      if (!Value) {
        break;
      }
      if (v3)
      {
        unsigned int v9 = [Value unsignedLongLongValue];
        io_registry_entry_t parent = 0;
        id v10 = +[NSUUID UUID];
        id v11 = [v10 UUIDString];

        if (!IORegistryEntryGetParentEntry(v5, "IOService", &parent))
        {
          if (parent)
          {
            CFMutableDictionaryRef v16 = 0;
            if (!IORegistryEntryCreateCFProperties(parent, &v16, kCFAllocatorDefault, 0))
            {
              CFMutableDictionaryRef v12 = v16;
              uint64_t v13 = [v3 uuidStringForDeviceProperties:v16];

              id v11 = (void *)v13;
            }
          }
        }
        id v14 = +[NSString stringWithFormat:@"%llu", v9];
        __int16 v15 = +[NSString stringWithFormat:@"LOC:%llu", v9];
        [v3 notifyClientDeviceAdded:v14 uuidString:v11 deviceName:v15];
      }
      CFRelease(properties);
      CFRelease(v7);
      IOObjectRelease(v5);
      io_registry_entry_t v5 = IOIteratorNext(a2);
    }
    while (v5);
  }
}

void sub_100029AC0(void *a1, uint64_t a2)
{
  id v3 = a1;
  io_registry_entry_t v4 = IOIteratorNext(a2);
  if (v4)
  {
    CFAllocatorRef v5 = kCFAllocatorDefault;
    CFStringRef v6 = @"locationID";
    CFStringRef v7 = @"_USBPTPInterfaceDeath | locID - 0x%08llX";
    do
    {
      CFMutableDictionaryRef properties = 0;
      if (!IORegistryEntryCreateCFProperties(v4, &properties, v5, 0))
      {
        CFMutableDictionaryRef v8 = properties;
        unsigned int v9 = [(__CFDictionary *)properties objectForKey:v6];
        if (v3)
        {
          __ICOSLogCreate();
          id v10 = [v3 managedObjectName];
          id v25 = v8;
          if ((unint64_t)[v10 length] >= 0x15)
          {
            id v11 = [v10 substringWithRange:0, 18];
            uint64_t v12 = [v11 stringByAppendingString:@".."];

            id v10 = (void *)v12;
          }
          uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, [v9 unsignedLongLongValue]);
          id v14 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            CFAllocatorRef v15 = v5;
            uint64_t v16 = a2;
            id v17 = v3;
            CFStringRef v18 = v7;
            CFStringRef v19 = v6;
            id v20 = v10;
            CFStringRef v21 = v14;
            id v22 = v20;
            CFStringRef v6 = v19;
            CFStringRef v7 = v18;
            id v3 = v17;
            a2 = v16;
            CFAllocatorRef v5 = v15;
            id v23 = [v22 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v28 = v23;
            __int16 v29 = 2114;
            uint64_t v30 = v13;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
          unsigned int v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v9 unsignedLongLongValue]);
          [v3 notifyClientDeviceRemoved:v24];

          CFMutableDictionaryRef v8 = v25;
        }
      }
      io_registry_entry_t v4 = IOIteratorNext(a2);
    }
    while (v4);
  }
}

uint64_t sub_10002A594(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = *a1 + 2;
  if (v2 <= a2)
  {
    __int16 v3 = *(_WORD *)*a1;
    *a1 = v2;
  }
  else
  {
    return 0;
  }
  return v3;
}

_WORD **sub_10002A5BC(_WORD **result, __int16 a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_10002A5D4(void *a1)
{
  uint64_t v1 = *(unsigned __int16 *)*a1;
  *a1 += 2;
  return v1;
}

uint64_t sub_10002A5E8(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = *a1 + 2;
  if (v2 > a2) {
    return 0;
  }
  uint64_t v3 = *(unsigned __int16 *)*a1;
  *a1 = v2;
  return v3;
}

uint64_t sub_10002A610(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = *a1 + 4;
  if (v2 > a2) {
    return 0;
  }
  uint64_t v3 = *(unsigned int *)*a1;
  *a1 = v2;
  return v3;
}

_DWORD **sub_10002A638(_DWORD **result, int a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_10002A650(void *a1)
{
  uint64_t v1 = *(unsigned int *)*a1;
  *a1 += 4;
  return v1;
}

uint64_t sub_10002A664(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = *a1 + 8;
  if (v2 > a2) {
    return 0;
  }
  uint64_t v3 = *(void *)*a1;
  *a1 = v2;
  return v3;
}

void **sub_10002A68C(void **result, uint64_t a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t sub_10002A6A4(void **a1)
{
  return *(*a1)++;
}

id sub_10002A6B8(const void **a1)
{
  uint64_t v1 = *(unsigned __int8 *)*a1;
  *a1 = (char *)*a1 + 1;
  if (v1)
  {
    uint64_t v3 = malloc_type_malloc(2 * v1, 0x8B4C94EFuLL);
    memcpy(v3, *a1, 2 * v1);
    *a1 = (char *)*a1 + 2 * v1;
    id v4 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v3 length:(2 * v1 - 2) encoding:CFStringConvertEncodingToNSStringEncoding(0x14000100u) freeWhenDone:1];
  }
  else
  {
    id v4 = [&stru_10004E2B0 copy];
  }

  return v4;
}

id sub_10002A778(const void **a1, unint64_t a2)
{
  if ((unint64_t)*a1 + *(unsigned __int8 *)*a1 <= a2)
  {
    unint64_t v2 = sub_10002A6B8(a1);
  }
  else
  {
    unint64_t v2 = 0;
  }

  return v2;
}

void sub_10002A7C0(unsigned char **a1, void *a2)
{
  id v9 = a2;
  unsigned int v3 = [v9 length];
  if (v3)
  {
    id v4 = [v9 dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(0x14000100u)];
    unsigned int v5 = v3 + 1;
    **a1 = v3 + 1;
    CFStringRef v6 = *a1 + 1;
    *a1 = v6;
    id v7 = v4;
    memcpy(v6, [v7 bytes], 2 * v3);
    CFMutableDictionaryRef v8 = *a1;
    do
    {
      v8 += 2;
      --v3;
    }
    while (v3);
    *(_WORD *)CFMutableDictionaryRef v8 = 0;
    *a1 += 2 * v5;
  }
  else
  {
    *(*a1)++ = 0;
  }
}

id sub_10002A8B0(const void **a1)
{
  unint64_t v2 = *a1;
  if (!*(_WORD *)*a1) {
    goto LABEL_6;
  }
  unint64_t v3 = 0;
  int v4 = 0;
  do
  {
    int v5 = (unsigned __int16)v2[v3 / 2 + 1];
    --v4;
    v3 += 2;
  }
  while (v5);
  if (v4)
  {
    CFStringRef v6 = malloc_type_malloc(v3, 0x5593B8A2uLL);
    memcpy(v6, *a1, v3);
    *a1 = (char *)*a1 + (v3 + 2);
    id v7 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v6 length:v3 encoding:CFStringConvertEncodingToNSStringEncoding(0x14000100u) freeWhenDone:1];
  }
  else
  {
LABEL_6:
    *a1 = v2 + 1;
    id v7 = [&stru_10004E2B0 copy];
  }

  return v7;
}

id sub_10002A994(unsigned __int16 **a1)
{
  int v2 = *(_DWORD *)*a1;
  *a1 += 2;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (v2)
  {
    int v4 = *a1;
    do
    {
      int v5 = +[NSNumber numberWithUnsignedShort:*v4];
      [v3 addObject:v5];

      int v4 = *a1 + 1;
      *a1 = v4;
      --v2;
    }
    while (v2);
  }

  return v3;
}

id sub_10002AA38(unsigned __int16 **a1, unint64_t a2)
{
  if ((unint64_t)*a1 + (2 * *(_DWORD *)*a1 + 4) <= a2)
  {
    int v2 = sub_10002A994(a1);
  }
  else
  {
    int v2 = 0;
  }

  return v2;
}

void sub_10002AA88(unsigned __int16 **a1, void *a2)
{
  id v10 = a2;
  unsigned int v3 = [v10 count];
  int v4 = *a1;
  *(_DWORD *)int v4 = v3;
  *a1 = v4 + 2;
  if (v3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v3;
    do
    {
      id v7 = [v10 objectAtIndexedSubscript:v5];
      unsigned __int16 v8 = (unsigned __int16)[v7 unsignedShortValue];

      id v9 = *a1;
      unsigned __int16 *v9 = v8;
      *a1 = v9 + 1;
      ++v5;
    }
    while (v6 != v5);
  }
}

id sub_10002AB30(unsigned int **a1)
{
  int v2 = *(*a1)++;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if (v2)
  {
    int v4 = *a1;
    do
    {
      uint64_t v5 = +[NSNumber numberWithUnsignedLong:*v4];
      [v3 addObject:v5];

      int v4 = *a1 + 1;
      *a1 = v4;
      --v2;
    }
    while (v2);
  }

  return v3;
}

id sub_10002ABD4(unsigned int **a1, unint64_t a2)
{
  if ((unint64_t)&(*a1)[**a1 + 1] <= a2)
  {
    int v2 = sub_10002AB30(a1);
  }
  else
  {
    syslog(3, "%s", "PTPCamera attached returned an invalid buffer for object handles, cannot enumerate");
    int v2 = 0;
  }

  return v2;
}

__CFString *sub_10002AC48(uint64_t a1)
{
  if ((int)a1 <= 37120)
  {
    switch((int)a1)
    {
      case 36865:
        int v2 = @"PTPOperationCodeGetNumDownloadableObjects_Apple";
        break;
      case 36866:
        int v2 = @"PTPOperationCodeGetAllObjectInfo32_Apple";
        break;
      case 36867:
        int v2 = @"PTPOperationCodeGetUserAssignedDeviceName_Apple";
        break;
      case 36868:
        int v2 = @"PTPOperationCodeAllowKeepAwake_Apple";
        break;
      case 36869:
        int v2 = @"PTPOperationCodeGetAllObjectInfo64_Apple";
        break;
      case 36870:
        int v2 = @"PTPOperationCodeGetObjectCompressedSize64_Apple";
        break;
      case 36871:
        int v2 = @"PTPOperationCodeGetPartialObject64_Apple";
        break;
      case 36872:
        int v2 = @"Canon_InitiateReleaseControl";
        break;
      case 36873:
        int v2 = @"PTPOperationCodeGetObjectMetadata_Apple";
        break;
      case 36874:
        int v2 = @"PTPOperationCodeGetMD5PartialObject64_Apple";
        break;
      case 36875:
        int v2 = @"PTPOperationCodeSetMediaCapabilities";
        break;
      case 36876:
        int v2 = @"PTPOperationCodeGetAdjustedThumb_Apple";
        break;
      case 36877:
        int v2 = @"PTPOperationCodeGetPartialAssetData_Apple";
        break;
      case 36878:
        int v2 = @"PTPOperationCodeSetHostSupportedFormats_Apple";
        break;
      case 36879:
        int v2 = @"PTPOperationCodeGetObjectInfosForNextGroup_Apple";
        break;
      case 36880:
        int v2 = @"PTPOperationCodeSetHostSupportsGroups_Apple";
        break;
      case 36881:
        int v2 = @"Canon_SetCustomizeData";
        break;
      case 36882:
        int v2 = @"Canon_GetCaptureStatus";
        break;
      case 36883:
        int v2 = @"Canon_CheckEvent";
        break;
      case 36884:
        int v2 = @"Canon_FocusLock";
        break;
      case 36885:
        int v2 = @"Canon_FocusUnlock";
        break;
      case 36886:
        int v2 = @"Canon_GetLocalReleaseParam";
        break;
      case 36887:
        int v2 = @"Canon_SetLocalReleaseParam";
        break;
      case 36888:
        int v2 = @"Canon_AskAboutPcEvf";
        break;
      case 36889:
        int v2 = @"Canon_SendPartialObject";
        break;
      case 36890:
        int v2 = @"Canon_InitiateCaptureInMemory";
        break;
      case 36891:
        int v2 = @"Canon_GetPartialObjectEx";
        break;
      case 36892:
        int v2 = @"Canon_SetObjectTime";
        break;
      case 36893:
        int v2 = @"Canon_GetViewfinderImage";
        break;
      case 36894:
        int v2 = @"Canon_GetObjectAttributes";
        break;
      case 36895:
        int v2 = @"Canon_ChangeUSBProtocol";
        break;
      case 36896:
        int v2 = @"Canon_GetChanges";
        break;
      case 36897:
LABEL_10:
        int v2 = @"Canon_GetObjectInfoEx";
        break;
      case 36898:
        int v2 = @"Canon_InitiateDirectTransfer";
        break;
      case 36899:
        int v2 = @"Canon_TerminateDirectTransfer";
        break;
      case 36900:
        int v2 = @"Canon_SendObjectInfoByPath";
        break;
      case 36901:
        int v2 = @"Canon_SendObjectByPath";
        break;
      case 36902:
        int v2 = @"Canon_InitiateDirectTansferEx";
        break;
      case 36903:
        int v2 = @"Canon_GetAncillaryObjectHandles";
        break;
      case 36904:
        int v2 = @"Canon_GetTreeInfo";
        break;
      case 36905:
        int v2 = @"Canon_GetTreeSize";
        break;
      case 36906:
        int v2 = @"Canon_NotifyProgress";
        break;
      case 36907:
        int v2 = @"Canon_NotifyCancelAccepted";
        break;
      case 36908:
        int v2 = @"Canon_902C";
        break;
      case 36909:
        int v2 = @"Canon_GetDirectory";
        break;
      case 36910:
        int v2 = @"Canon_902E";
        break;
      case 36911:
        int v2 = @"Canon_902F";
        break;
      case 36912:
        int v2 = @"Canon_SetPairingInfo";
        break;
      case 36913:
        int v2 = @"Canon_GetPairingInfo";
        break;
      case 36914:
        int v2 = @"Canon_DeletePairingInfo";
        break;
      case 36915:
        int v2 = @"Canon_GetMACAddress";
        break;
      case 36916:
        int v2 = @"Canon_SetDisplayMonitor";
        break;
      case 36917:
        int v2 = @"Canon_PairingComplete";
        break;
      case 36918:
        int v2 = @"Canon_GetWirelessMAXChannel";
        break;
      case 36919:
      case 36920:
      case 36921:
      case 36922:
      case 36923:
      case 36924:
      case 36925:
      case 36926:
      case 36927:
      case 36928:
      case 36929:
      case 36930:
      case 36931:
      case 36932:
      case 36933:
      case 36934:
      case 36935:
      case 36936:
      case 36937:
      case 36938:
      case 36939:
      case 36940:
      case 36941:
      case 36942:
      case 36943:
      case 36944:
      case 36945:
      case 36946:
      case 36947:
      case 36948:
      case 36949:
      case 36950:
      case 36951:
      case 36952:
      case 36953:
      case 36954:
      case 36955:
      case 36956:
      case 36957:
      case 36958:
      case 36959:
      case 36960:
      case 36961:
      case 36962:
      case 36963:
      case 36964:
      case 36965:
      case 36966:
      case 36967:
      case 36974:
      case 36976:
      case 36977:
      case 36978:
      case 36979:
      case 36980:
      case 36986:
      case 36987:
      case 36988:
      case 36989:
      case 36990:
      case 36991:
      case 36992:
      case 36993:
      case 36994:
      case 36995:
      case 36996:
      case 36997:
LABEL_217:
        if ((a1 & 0xF000) == 0x9000)
        {
          +[NSString stringWithFormat:@"PTPOperationCodeVendorDefined (0x%04X)", a1];
        }
        else if ((a1 & 0xF000) == 0x1000)
        {
          +[NSString stringWithFormat:@"PTPOperationCodeReserved (0x%04X)", a1];
        }
        else
        {
          +[NSString stringWithFormat:@"(0x%04X)", a1];
        }
        int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 36968:
        int v2 = @"Canon_GetWebServiceSpec";
        break;
      case 36969:
        int v2 = @"Canon_GetWebServiceData";
        break;
      case 36970:
        int v2 = @"Canon_SetWebServiceData";
        break;
      case 36971:
        int v2 = @"Canon_DeleteWebServiceData";
        break;
      case 36972:
        int v2 = @"Canon_GetRootCertificateSpec";
        break;
      case 36973:
        int v2 = @"Canon_GetRootCertificateData";
        break;
      case 36975:
        int v2 = @"Canon_SetRootCertificateData";
        break;
      case 36981:
        int v2 = @"Canon_GetGpsMobilelinkObjectInfo";
        break;
      case 36982:
        int v2 = @"Canon_SendGpsTagInfo";
        break;
      case 36983:
        int v2 = @"Canon_GetTranscodeApproxSize";
        break;
      case 36984:
        int v2 = @"Canon_RequestTranscodeStart";
        break;
      case 36985:
        int v2 = @"Canon_RequestTranscodeCancel";
        break;
      case 36998:
        int v2 = @"Canon_SetRemoteShootingMode";
        break;
      default:
        int v3 = a1 - 4096;
        int v2 = @"PTPOperationCodeUndefined";
        switch(v3)
        {
          case 0:
            goto LABEL_223;
          case 1:
            int v2 = @"PTPOperationCodeGetDeviceInfo";
            break;
          case 2:
            int v2 = @"PTPOperationCodeOpenSession";
            break;
          case 3:
            int v2 = @"PTPOperationCodeCloseSession";
            break;
          case 4:
            int v2 = @"PTPOperationCodeGetStorageIDs";
            break;
          case 5:
            int v2 = @"PTPOperationCodeGetStorageInfo";
            break;
          case 6:
            int v2 = @"PTPOperationCodeGetNumObjects";
            break;
          case 7:
            int v2 = @"PTPOperationCodeGetObjectHandles";
            break;
          case 8:
            int v2 = @"PTPOperationCodeGetObjectInfo";
            break;
          case 9:
            int v2 = @"PTPOperationCodeGetObject";
            break;
          case 10:
            int v2 = @"PTPOperationCodeGetThumb";
            break;
          case 11:
            int v2 = @"PTPOperationCodeDeleteObject";
            break;
          case 12:
            int v2 = @"PTPOperationCodeSendObjectInfo";
            break;
          case 13:
            int v2 = @"PTPOperationCodeSendObject";
            break;
          case 14:
            int v2 = @"PTPOperationCodeInitiateCapture";
            break;
          case 15:
            int v2 = @"PTPOperationCodeFormatStore";
            break;
          case 16:
            int v2 = @"PTPOperationCodeResetDevice";
            break;
          case 17:
            int v2 = @"PTPOperationCodeSelfTest";
            break;
          case 18:
            int v2 = @"PTPOperationCodeSetObjectProtection";
            break;
          case 19:
            int v2 = @"PTPOperationCodePowerDown";
            break;
          case 20:
            int v2 = @"PTPOperationCodeGetDevicePropDesc";
            break;
          case 21:
            int v2 = @"PTPOperationCodeGetDevicePropValue";
            break;
          case 22:
            int v2 = @"PTPOperationCodeSetDevicePropValue";
            break;
          case 23:
            int v2 = @"PTPOperationCodeResetDevicePropValue";
            break;
          case 24:
            int v2 = @"PTPOperationCodeTerminateOpenCapture";
            break;
          case 25:
            int v2 = @"PTPOperationCodeMoveObject";
            break;
          case 26:
            int v2 = @"PTPOperationCodeCopyObject";
            break;
          case 27:
            int v2 = @"PTPOperationCodeGetPartialObject";
            break;
          case 28:
            int v2 = @"PTPOperationCodeInitiateOpenCapture";
            break;
          case 35:
            int v2 = @"PTPOperationCodeGetFilesystemManifest";
            break;
          default:
            goto LABEL_217;
        }
        break;
    }
  }
  else
  {
    switch((int)a1)
    {
      case 37121:
        int v2 = @"Canon_GetStorageIDs";
        break;
      case 37122:
        int v2 = @"Canon_GetStorageInfo";
        break;
      case 37123:
        int v2 = @"Canon_GetObjectInfo";
        break;
      case 37124:
        int v2 = @"Canon_GetObject";
        break;
      case 37125:
        int v2 = @"Canon_DeleteObject";
        break;
      case 37126:
        int v2 = @"Canon_FormatStore";
        break;
      case 37127:
        int v2 = @"Canon_GetPartialObject";
        break;
      case 37128:
        int v2 = @"Canon_GetDeviceInfoEx";
        break;
      case 37129:
        goto LABEL_10;
      case 37130:
        int v2 = @"Canon_GetThumbEx";
        break;
      case 37131:
        int v2 = @"Canon_SendPartialObject";
        break;
      case 37132:
        int v2 = @"Canon_SetObjectAttributes";
        break;
      case 37133:
        int v2 = @"Canon_GetObjectTime";
        break;
      case 37134:
        int v2 = @"Canon_SetObjectTime";
        break;
      case 37135:
        int v2 = @"Canon_RemoteRelease";
        break;
      case 37136:
        int v2 = @"Canon_SetDevicePropValueEx";
        break;
      case 37137:
      case 37138:
      case 37156:
      case 37165:
      case 37166:
      case 37167:
      case 37198:
      case 37214:
      case 37215:
      case 37217:
      case 37218:
      case 37219:
      case 37220:
      case 37221:
      case 37222:
      case 37223:
      case 37224:
      case 37225:
      case 37226:
      case 37229:
      case 37238:
      case 37240:
      case 37241:
      case 37242:
      case 37243:
      case 37244:
      case 37245:
      case 37246:
      case 37247:
      case 37248:
      case 37249:
      case 37254:
      case 37255:
      case 37256:
      case 37257:
      case 37258:
      case 37259:
      case 37260:
      case 37261:
      case 37262:
      case 37263:
      case 37264:
      case 37265:
      case 37266:
      case 37267:
      case 37268:
      case 37269:
      case 37270:
      case 37271:
      case 37272:
      case 37273:
      case 37274:
      case 37275:
      case 37276:
      case 37277:
      case 37278:
      case 37279:
      case 37280:
      case 37281:
      case 37282:
      case 37283:
      case 37284:
      case 37285:
      case 37286:
      case 37287:
      case 37288:
      case 37289:
      case 37290:
      case 37292:
      case 37293:
      case 37294:
      case 37295:
      case 37296:
      case 37297:
      case 37298:
      case 37299:
      case 37300:
      case 37301:
      case 37302:
      case 37303:
      case 37304:
      case 37306:
      case 37307:
      case 37308:
      case 37309:
      case 37312:
      case 37313:
      case 37314:
      case 37315:
      case 37316:
      case 37317:
      case 37318:
      case 37319:
      case 37320:
      case 37321:
      case 37322:
      case 37323:
      case 37324:
      case 37325:
      case 37326:
      case 37327:
      case 37328:
      case 37329:
      case 37330:
      case 37331:
      case 37332:
      case 37333:
      case 37334:
      case 37335:
      case 37336:
      case 37337:
      case 37338:
      case 37339:
      case 37340:
      case 37341:
      case 37342:
      case 37343:
      case 37344:
      case 37345:
      case 37346:
      case 37347:
      case 37348:
      case 37349:
      case 37350:
      case 37351:
      case 37354:
      case 37355:
      case 37356:
      case 37357:
      case 37358:
      case 37359:
      case 37362:
      case 37363:
      case 37364:
      case 37365:
      case 37366:
      case 37367:
      case 37368:
      case 37369:
      case 37370:
      case 37371:
      case 37372:
      case 37373:
        goto LABEL_217;
      case 37139:
        int v2 = @"Canon_GetRemoteMode";
        break;
      case 37140:
        int v2 = @"Canon_SetRemoteMode";
        break;
      case 37141:
        int v2 = @"Canon_SetEventMode";
        break;
      case 37142:
        int v2 = @"Canon_GetEvent";
        break;
      case 37143:
        int v2 = @"Canon_TransferComplete";
        break;
      case 37144:
        int v2 = @"Canon_CancelTransfer";
        break;
      case 37145:
        int v2 = @"Canon_ResetTransfer";
        break;
      case 37146:
        int v2 = @"Canon_PCHDDCapacity";
        break;
      case 37147:
        int v2 = @"Canon_SetUILock";
        break;
      case 37148:
        int v2 = @"Canon_ResetUILock";
        break;
      case 37149:
        int v2 = @"Canon_KeepDeviceOn";
        break;
      case 37150:
        int v2 = @"Canon_SetNullPacketMode";
        break;
      case 37151:
        int v2 = @"Canon_UpdateFirmware";
        break;
      case 37152:
        int v2 = @"Canon_TransferCompleteDT";
        break;
      case 37153:
        int v2 = @"Canon_CancelTransferDT";
        break;
      case 37154:
        int v2 = @"Canon_SetWftProfile";
        break;
      case 37155:
        int v2 = @"Canon_GetWftProfile";
        break;
      case 37157:
        int v2 = @"Canon_BulbStart";
        break;
      case 37158:
        int v2 = @"Canon_BulbEnd";
        break;
      case 37159:
        int v2 = @"Canon_RequestDevicePropValue";
        break;
      case 37160:
        int v2 = @"Canon_RemoteReleaseOn";
        break;
      case 37161:
        int v2 = @"Canon_RemoteReleaseOff";
        break;
      case 37162:
        int v2 = @"Canon_RegistBackgroundImage";
        break;
      case 37163:
        int v2 = @"Canon_ChangePhotoStudioMode";
        break;
      case 37164:
        int v2 = @"Canon_GetPartialObjectEx";
        break;
      case 37168:
        int v2 = @"Canon_ResetMirrorLockupState";
        break;
      case 37169:
        int v2 = @"Canon_PopupBuiltinFlash";
        break;
      case 37170:
        int v2 = @"Canon_EndGetPartialObjectEx";
        break;
      case 37171:
        int v2 = @"Canon_MovieSelectSWOn";
        break;
      case 37172:
        int v2 = @"Canon_MovieSelectSWOff";
        break;
      case 37173:
        int v2 = @"Canon_GetCTGInfo";
        break;
      case 37174:
        int v2 = @"Canon_GetLensAdjust";
        break;
      case 37175:
        int v2 = @"Canon_SetLensAdjust";
        break;
      case 37176:
        int v2 = @"Canon_ReadyToSendMusic";
        break;
      case 37177:
        int v2 = @"Canon_CreateHandle";
        break;
      case 37178:
        int v2 = @"Canon_SendPartialObjectEx";
        break;
      case 37179:
        int v2 = @"Canon_EndSendPartialObjectEx";
        break;
      case 37180:
        int v2 = @"Canon_SetCTGInfo";
        break;
      case 37181:
        int v2 = @"Canon_SetRequestOLCInfoGroup";
        break;
      case 37182:
        int v2 = @"Canon_SetRequestRollingPitchingLevel";
        break;
      case 37183:
        int v2 = @"Canon_GetCameraSupport";
        break;
      case 37184:
        int v2 = @"Canon_SetRating";
        break;
      case 37185:
        int v2 = @"Canon_RequestInnerDevelopStart";
        break;
      case 37186:
        int v2 = @"Canon_RequestInnerDevelopParamChange";
        break;
      case 37187:
        int v2 = @"Canon_RequestInnerDevelopEnd";
        break;
      case 37188:
        int v2 = @"Canon_GpsLoggingDataMode";
        break;
      case 37189:
        int v2 = @"Canon_GetGpsLogCurrentHandle";
        break;
      case 37190:
        int v2 = @"Canon_SetImageRecoveryData";
        break;
      case 37191:
        int v2 = @"Canon_GetImageRecoveryList";
        break;
      case 37192:
        int v2 = @"Canon_FormatImageRecoveryData";
        break;
      case 37193:
        int v2 = @"Canon_GetPresetLensAdjustParam";
        break;
      case 37194:
        int v2 = @"Canon_GetRawDispImage";
        break;
      case 37195:
        int v2 = @"Canon_SaveImageRecoveryData";
        break;
      case 37196:
        int v2 = @"Canon_RequestBLE";
        break;
      case 37197:
        int v2 = @"Canon_DrivePowerZoom";
        break;
      case 37199:
        int v2 = @"Canon_GetIptcData";
        break;
      case 37200:
        int v2 = @"Canon_SetIptcData";
        break;
      case 37201:
        int v2 = @"Canon_InitiateViewfinder";
        break;
      case 37202:
        int v2 = @"Canon_TerminateViewfinder";
        break;
      case 37203:
        int v2 = @"Canon_GetViewFinderData";
        break;
      case 37204:
        int v2 = @"Canon_DoAf";
        break;
      case 37205:
        int v2 = @"Canon_DriveLens";
        break;
      case 37206:
        int v2 = @"Canon_DepthOfFieldPreview";
        break;
      case 37207:
        int v2 = @"Canon_ClickWB";
        break;
      case 37208:
        int v2 = @"Canon_Zoom";
        break;
      case 37209:
        int v2 = @"Canon_ZoomPosition";
        break;
      case 37210:
        int v2 = @"Canon_SetLiveAfFrame";
        break;
      case 37211:
        int v2 = @"Canon_TouchAfPosition";
        break;
      case 37212:
        int v2 = @"Canon_SetLvPcFlavoreditMode";
        break;
      case 37213:
        int v2 = @"Canon_SetLvPcFlavoreditParam";
        break;
      case 37216:
        int v2 = @"Canon_AfCancel";
        break;
      case 37227:
        int v2 = @"Canon_SetImageRecoveryDataEx";
        break;
      case 37228:
        int v2 = @"Canon_GetImageRecoveryListEx";
        break;
      case 37230:
        int v2 = @"Canon_NotifyAutoTransferStatus";
        break;
      case 37231:
        int v2 = @"Canon_GetReducedObject";
        break;
      case 37232:
        int v2 = @"Canon_GetObjectInfo64";
        break;
      case 37233:
        int v2 = @"Canon_GetObject64";
        break;
      case 37234:
        int v2 = @"Canon_GetPartialObject64";
        break;
      case 37235:
        int v2 = @"Canon_GetObjectInfoEx64";
        break;
      case 37236:
        int v2 = @"Canon_GetPartialObjectEX64";
        break;
      case 37237:
        int v2 = @"Canon_CreateHandle64";
        break;
      case 37239:
        int v2 = @"Canon_NotifySaveComplete";
        break;
      case 37250:
        int v2 = @"Canon_NotifyEstimateNumberofImport";
        break;
      case 37251:
        int v2 = @"Canon_NotifyNumberofImported";
        break;
      case 37252:
        int v2 = @"Canon_NotifySizeOfPartialDataTransfer";
        break;
      case 37253:
        int v2 = @"Canon_NotifyFinish";
        break;
      case 37291:
        int v2 = @"Canon_GetObjectURL";
        break;
      case 37305:
        int v2 = @"Canon_SetFELock";
        break;
      case 37310:
        int v2 = @"Canon_SetDefaultCameraSetting";
        break;
      case 37311:
        int v2 = @"Canon_GetAEData";
        break;
      case 37352:
        int v2 = @"Canon_NotifyNetworkError";
        break;
      case 37353:
        int v2 = @"Canon_AdapterTransferProgress";
        break;
      case 37360:
        int v2 = @"Canon_TransferCompleteFTP";
        break;
      case 37361:
        int v2 = @"Canon_CancelTransferFTP";
        break;
      case 37374:
        int v2 = @"Canon_FAPIMessageTX";
        break;
      case 37375:
        int v2 = @"Canon_FAPIMessageRX";
        break;
      default:
        switch((int)a1)
        {
          case 38913:
            int v2 = @"MTPGetObjectPropsSupported";
            break;
          case 38914:
            int v2 = @"MTPGetObjectPropDesc";
            break;
          case 38915:
            int v2 = @"MTPGetObjectPropValue";
            break;
          case 38917:
            int v2 = @"MTPGetObjectPropList";
            break;
          default:
            goto LABEL_217;
        }
        break;
    }
  }
LABEL_223:

  return v2;
}

id sub_10002BE44(uint64_t a1)
{
  if ((a1 - 0x2000) >= 0x21)
  {
    if ((a1 & 0xF000) == 0xA000)
    {
      +[NSString stringWithFormat:@"PTPResponseCodeVendorDefined (0x%04X)", a1];
    }
    else if ((a1 & 0xF000) == 0x2000)
    {
      +[NSString stringWithFormat:@"PTPResponseCodeReserved (0x%04X)", a1];
    }
    else
    {
      +[NSString stringWithFormat:@"(0x%04X)", a1];
    uint64_t v1 = };
  }
  else
  {
    uint64_t v1 = *(&off_10004CD80 + (__int16)(a1 - 0x2000));
  }

  return v1;
}

__CFString *sub_10002BEF4(int a1)
{
  int v1 = a1 - 0x4000;
  int v2 = @"PTPEventCodeUndefined";
  switch(v1)
  {
    case 0:
      break;
    case 1:
      int v2 = @"PTPEventCodeCancelTransaction";
      break;
    case 2:
      int v2 = @"PTPEventCodeObjectAdded";
      break;
    case 3:
      int v2 = @"PTPEventCodeObjectRemoved";
      break;
    case 4:
      int v2 = @"PTPEventCodeStoreAdded";
      break;
    case 5:
      int v2 = @"PTPEventCodeStoreRemoved";
      break;
    case 6:
      int v2 = @"PTPEventCodeDevicePropChanged";
      break;
    case 7:
      int v2 = @"PTPEventCodeObjectInfoChanged";
      break;
    case 8:
      int v2 = @"PTPEventCodeDeviceInfoChanged";
      break;
    case 9:
      int v2 = @"PTPEventCodeRequestObjectTransfer";
      break;
    case 10:
      int v2 = @"PTPEventCodeStoreFull";
      break;
    case 11:
      int v2 = @"PTPEventCodeDeviceReset";
      break;
    case 12:
      int v2 = @"PTPEventCodeStorageInfoChanged";
      break;
    case 13:
      int v2 = @"PTPEventCodeCaptureComplete";
      break;
    case 14:
      int v2 = @"PTPEventCodeUnreportedStatus";
      break;
    default:
      switch(@"PTPEventCodeUndefined")
      {
        case 0xC001u:
          int v2 = @"PTPEventCodeAppleDeviceUnlocked";
          break;
        case 0xC002u:
          int v2 = @"PTPEventCodeAppleUserAssignedNameChanged";
          break;
        case 0xC003u:
          int v2 = @"PTPEventCodeAppleRestartSession";
          break;
        case 0xC004u:
          int v2 = @"PTPEventCodeAppleGroupAdded";
          break;
        case 0xC005u:
          int v2 = @"PTPEventCodeAppleGroupEnumerationFinished";
          break;
        default:
          if (((unint64_t)@"PTPEventCodeUndefined" & 0xF000) == 0xC000)
          {
            +[NSString stringWithFormat:@"PTPEventCodeVendorDefined (0x%04X)", @"PTPEventCodeUndefined"];
          }
          else if (((unint64_t)@"PTPEventCodeUndefined" & 0xF000) == 0x4000)
          {
            +[NSString stringWithFormat:@"PTPEventCodeReserved (0x%04X)", @"PTPEventCodeUndefined"];
          }
          else
          {
            +[NSString stringWithFormat:@"(0x%04X)", @"PTPEventCodeUndefined"];
          }
          int v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      break;
  }

  return v2;
}

id sub_10002C11C(uint64_t a1)
{
  if ((unsigned __int16)(a1 - 20480) >= 0x20u)
  {
    if ((a1 & 0xF000) == 0xD000)
    {
      +[NSString stringWithFormat:@"PTPDevicePropCodeVendorDefined (0x%04X)", a1];
    }
    else if ((a1 & 0xF000) == 0x5000)
    {
      +[NSString stringWithFormat:@"PTPDevicePropCodeReserved (0x%04X)", a1];
    }
    else
    {
      +[NSString stringWithFormat:@"(0x%04X)", a1];
    int v1 = };
  }
  else
  {
    int v1 = *(&off_10004CE88 + (__int16)(a1 - 20480));
  }

  return v1;
}

id sub_10002C1D0(unsigned int a1)
{
  if (a1 >= 5)
  {
    int v1 = +[NSString stringWithFormat:@"PTPStorageTypeReserved (0x%04X)", a1];
  }
  else
  {
    int v1 = *(&off_10004CF88 + (__int16)a1);
  }

  return v1;
}

id sub_10002C23C(uint64_t a1)
{
  if (a1 >= 4)
  {
    if ((a1 & 0xF000) == 0x8000)
    {
      +[NSString stringWithFormat:@"PTPFilesystemTypeVendorDefined (0x%04X)", a1];
    }
    else if ((a1 & 0xF000) != 0)
    {
      +[NSString stringWithFormat:@"(0x%04X)", a1];
    }
    else
    {
      +[NSString stringWithFormat:@"PTPFilesystemTypeReserved (0x%04X)", a1];
    int v1 = };
  }
  else
  {
    int v1 = *(&off_10004CFB0 + (__int16)a1);
  }

  return v1;
}

id sub_10002C2E4(unsigned int a1)
{
  if (a1 >= 3)
  {
    int v1 = +[NSString stringWithFormat:@"PTPAccessCapabilityReserved (0x%04X)", a1];
  }
  else
  {
    int v1 = *(&off_10004CFD0 + (__int16)a1);
  }

  return v1;
}

__CFString *sub_10002C350(unsigned int a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      int v2 = @"PTPProtectionStatusReadOnly";
    }
    else
    {
      int v2 = +[NSString stringWithFormat:@"PTPProtectionStatusReserved (0x%04X)", a1];
    }
  }
  else
  {
    int v2 = @"PTPProtectionStatusNoProtection";
  }
  return v2;
}

__CFString *sub_10002C3DC(int a1)
{
  switch(a1)
  {
    case 14336:
      uint64_t v1 = @"PTPObjectFormatCodeUnknownImageObject";
      break;
    case 14337:
      uint64_t v1 = @"PTPObjectFormatCodeEXIF_JPEG";
      break;
    case 14338:
      uint64_t v1 = @"PTPObjectFormatCodeTIFF_EP";
      break;
    case 14339:
      uint64_t v1 = @"PTPObjectFormatCodeFlashPix";
      break;
    case 14340:
      uint64_t v1 = @"PTPObjectFormatCodeBMP";
      break;
    case 14341:
      uint64_t v1 = @"PTPObjectFormatCodeCIFF";
      break;
    case 14342:
      uint64_t v1 = @"PTPObjectFormatCodeReserved1";
      break;
    case 14343:
      uint64_t v1 = @"PTPObjectFormatCodeGIF";
      break;
    case 14344:
      uint64_t v1 = @"PTPObjectFormatCodeJFIF";
      break;
    case 14345:
      uint64_t v1 = @"PTPObjectFormatCodePCD";
      break;
    case 14346:
      uint64_t v1 = @"PTPObjectFormatCodePICT";
      break;
    case 14347:
      uint64_t v1 = @"PTPObjectFormatCodePNG";
      break;
    case 14348:
      uint64_t v1 = @"PTPObjectFormatCodeReserved2";
      break;
    case 14349:
      uint64_t v1 = @"PTPObjectFormatCodeTIFF";
      break;
    case 14350:
      uint64_t v1 = @"PTPObjectFormatCodeTIFF_IT";
      break;
    case 14351:
      uint64_t v1 = @"PTPObjectFormatCodeJP2";
      break;
    case 14352:
      uint64_t v1 = @"PTPObjectFormatCodeJPX";
      break;
    default:
      int v2 = a1 - 12288;
      uint64_t v1 = @"PTPObjectFormatCodeUndefinedNonImageObject";
      switch(v2)
      {
        case 0:
          goto LABEL_40;
        case 1:
          uint64_t v1 = @"PTPObjectFormatCodeAssociation";
          break;
        case 2:
          uint64_t v1 = @"PTPObjectFormatCodeScript";
          break;
        case 3:
          uint64_t v1 = @"PTPObjectFormatCodeExecutable";
          break;
        case 4:
          uint64_t v1 = @"PTPObjectFormatCodeText";
          break;
        case 5:
          uint64_t v1 = @"PTPObjectFormatCodeHTML";
          break;
        case 6:
          uint64_t v1 = @"PTPObjectFormatCodeDPOF";
          break;
        case 7:
          uint64_t v1 = @"PTPObjectFormatCodeAIFF";
          break;
        case 8:
          uint64_t v1 = @"PTPObjectFormatCodeWAV";
          break;
        case 9:
          uint64_t v1 = @"PTPObjectFormatCodeMP3";
          break;
        case 10:
          uint64_t v1 = @"PTPObjectFormatCodeAVI";
          break;
        case 11:
          uint64_t v1 = @"PTPObjectFormatCodeMPEG";
          break;
        case 12:
          uint64_t v1 = @"PTPObjectFormatCodeASF";
          break;
        case 13:
          uint64_t v1 = @"PTPObjectFormatCodeMOV";
          break;
        case 14:
          uint64_t v1 = @"PTPObjectFormatCodeXML";
          break;
        default:
          if (((unint64_t)@"PTPObjectFormatCodeUndefinedNonImageObject" & 0xF000) == 0xB000)
          {
            +[NSString stringWithFormat:@"PTPObjectFormatCodeVendorDefined (0x%04X)", @"PTPObjectFormatCodeUndefinedNonImageObject"];
          }
          else if (((unint64_t)@"PTPObjectFormatCodeUndefinedNonImageObject" & 0xF000) == 0x3000)
          {
            +[NSString stringWithFormat:@"PTPObjectFormatCodeReservedForFuture (0x%04X)", @"PTPObjectFormatCodeUndefinedNonImageObject"];
          }
          else
          {
            +[NSString stringWithFormat:@"(0x%04X)", @"PTPObjectFormatCodeUndefinedNonImageObject"];
          }
          uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      break;
  }
LABEL_40:

  return v1;
}

id sub_10002C6C4(uint64_t a1)
{
  if (a1 >= 8)
  {
    if ((a1 & 0xF000) == 0x8000)
    {
      +[NSString stringWithFormat:@"PTPAssociationTypeVendorDefined (0x%04X)", a1];
    }
    else if ((a1 & 0xF000) != 0)
    {
      +[NSString stringWithFormat:@"(0x%04X)", a1];
    }
    else
    {
      +[NSString stringWithFormat:@"PTPAssociationTypeReserved (0x%04X)", a1];
    uint64_t v1 = };
  }
  else
  {
    uint64_t v1 = *(&off_10004CFE8 + (__int16)a1);
  }

  return v1;
}

uint64_t sub_10002C76C()
{
  int v0 = *__error();
  if (v0 > 28)
  {
    switch(v0)
    {
      case '6':
        uint64_t result = fprintf(__stderrp, "Error 'ECONNRESET' (%d) occurred in '%s'.\n");
        break;
      case '7':
        uint64_t result = fprintf(__stderrp, "Error 'ENOBUFS' (%d) occurred in '%s'.\n");
        break;
      case '8':
      case ':':
      case ';':
        goto LABEL_20;
      case '9':
        uint64_t result = fprintf(__stderrp, "Error 'ENOTCONN' (%d) occurred in '%s'.\n");
        break;
      case '<':
        uint64_t result = fprintf(__stderrp, "Error 'ETIMEDOUT' (%d) occurred in '%s'.\n");
        break;
      default:
        if (v0 == 29)
        {
          uint64_t result = fprintf(__stderrp, "Error 'ESPIPE' (%d) occurred in '%s'.\n");
        }
        else if (v0 == 35)
        {
          uint64_t result = fprintf(__stderrp, "Error 'EAGAIN' (%d) occurred in '%s'.\n");
        }
        else
        {
LABEL_20:
          uint64_t result = fprintf(__stderrp, "Error %d occurred in '%s'.\n");
        }
        break;
    }
  }
  else
  {
    switch(v0)
    {
      case 4:
        uint64_t result = fprintf(__stderrp, "Error 'EINTR' (%d) occurred in '%s'.\n");
        break;
      case 5:
        uint64_t result = fprintf(__stderrp, "Error 'EIO' (%d) occurred in '%s'.\n");
        break;
      case 6:
        uint64_t result = fprintf(__stderrp, "Error 'ENXIO' (%d) occurred in '%s'.\n");
        break;
      case 9:
        uint64_t result = fprintf(__stderrp, "Error 'EBADF' (%d) occurred in '%s'.\n");
        break;
      case 12:
        uint64_t result = fprintf(__stderrp, "Error 'ENOMEM' (%d) occurred in '%s'.\n");
        break;
      case 14:
        uint64_t result = fprintf(__stderrp, "Error 'EFAULT' (%d) occurred in '%s'.\n");
        break;
      case 21:
        uint64_t result = fprintf(__stderrp, "Error 'EISDIR' (%d) occurred in '%s'.\n");
        break;
      case 22:
        uint64_t result = fprintf(__stderrp, "Error 'EINVAL' (%d) occurred in '%s'.\n");
        break;
      default:
        goto LABEL_20;
    }
  }
  return result;
}

void sub_10002D4E0(id a1)
{
  id v14 = objc_alloc((Class)NSSet);
  uint64_t v13 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = [v14 initWithObjects:v13, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0];
  uint64_t v12 = qword_1000634D8;
  qword_1000634D8 = (uint64_t)v11;

  _objc_release_x1(v11, v12);
}

void sub_10002D9DC(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) sessionManager];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = +[NSXPCConnection currentConnection];
  [v4 addNotifications:v2 toSessionWithConnection:v3];
}

void sub_10002DB10(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) sessionManager];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = +[NSXPCConnection currentConnection];
  [v4 remNotifications:v2 fromSessionWithConnection:v3];
}

uint64_t start()
{
  __ICOSLogCreate();
  uint64_t v1 = @"ptpcamera[D]";
  if ((unint64_t)[@"ptpcamera[D]" length] >= 0x15)
  {
    uint64_t v2 = [[@"ptpcamera[D]" substringWithRange:0, 18];
    uint64_t v1 = [v2 stringByAppendingString:@".."];
  }
  uint64_t v3 = +[NSString stringWithFormat:@"%@", @"Launching ptpcamera [D]"];
  id v4 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v1;
    uint64_t v6 = v4;
    *(_DWORD *)buf = 136446466;
    id v12 = [(__CFString *)v5 UTF8String];
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v7 = objc_alloc_init(PTPRemoteCameraDeviceManager);
  [(PTPRemoteCameraDeviceManager *)v7 startUSBPTPInterfaceNotifications];
  id v8 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.ptpcamerad"];
  [v8 setDelegate:v7];
  [v8 resume];
  uint64_t v9 = +[NSRunLoop currentRunLoop];
  [v9 run];

  return 0;
}

uint64_t sub_10002FF2C(void *a1)
{
  uint64_t v1 = [a1 valueForEntitlement:@"com.apple.private.imagecapturecore.authorization_bypass"];
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v1 BOOLValue])
  {
    __ICOSLogCreate();
    uint64_t v2 = @"privateBypass";
    if ((unint64_t)[@"privateBypass" length] >= 0x15)
    {
      uint64_t v3 = [@"privateBypass" substringWithRange:0, 18];
      uint64_t v2 = [v3 stringByAppendingString:@".."];
    }
    id v4 = +[NSString stringWithFormat:@"ICAuthorizationBypassEntitlement found"];
    uint64_t v5 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v2;
      uint64_t v7 = v5;
      int v10 = 136446466;
      id v11 = [(__CFString *)v6 UTF8String];
      __int16 v12 = 2114;
      __int16 v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void sub_100030EB4(uint64_t a1)
{
  __ICOSLogCreate();
  uint64_t v2 = @"getDeviceList";
  if ((unint64_t)[@"getDeviceList" length] >= 0x15)
  {
    uint64_t v3 = [@"getDeviceList" substringWithRange:0, 18];
    uint64_t v2 = [v3 stringByAppendingString:@".."];
  }
  id v4 = +[NSString stringWithFormat:@"requestDeviceListWithOptions:reply"];
  uint64_t v5 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v2;
    uint64_t v7 = v5;
    *(_DWORD *)buf = 136446466;
    id v22 = [(__CFString *)v6 UTF8String];
    __int16 v23 = 2114;
    unsigned int v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v8 = +[NSMutableArray array];
  uint64_t v9 = +[NSMutableDictionary dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v10 = [*(id *)(a1 + 32) remoteCameraDevices];
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        CFAllocatorRef v15 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v14) deviceContext];
        [v8 addObject:v15];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  [v9 setObject:v8 forKeyedSubscript:@"ICDeviceContexts"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000311E0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) remoteDeviceForUUID:*(void *)(a1 + 40)];
  uint64_t v3 = +[NSMutableDictionary dictionary];
  if (!v2) {
    goto LABEL_16;
  }
  id v4 = [v2 camera];

  if (v4)
  {
    __ICOSLogCreate();
    uint64_t v5 = [*(id *)(a1 + 32) managedObjectName];
    if ((unint64_t)[v5 length] >= 0x15)
    {
      uint64_t v6 = [v5 substringWithRange:0, 18];
      uint64_t v7 = [v6 stringByAppendingString:@".."];

      uint64_t v5 = (void *)v7;
    }
    uint64_t v8 = +[NSString stringWithFormat:@"> Existing Device"];
    uint64_t v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v5;
      id v11 = v9;
      *(_DWORD *)buf = 136446466;
      id v47 = [v10 UTF8String];
      __int16 v48 = 2114;
      v49 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    id v12 = [v2 uuidString];
    [v3 setObject:v12 forKeyedSubscript:@"ICInternalDeviceUUID"];

    uint64_t v13 = [v2 camera];
    id v14 = [v13 endpoint];
    [v3 setObject:v14 forKeyedSubscript:@"ICDeviceEndpoint"];

    CFAllocatorRef v15 = [v2 localizedName];
    [v3 setObject:v15 forKeyedSubscript:@"ICDeviceName"];

    long long v16 = [v2 camera];
    long long v17 = [v16 additionalProperties];

    if (v17)
    {
      long long v18 = [v2 camera];
      long long v19 = [v18 additionalProperties];
      [v3 addEntriesFromDictionary:v19];
    }
    id v20 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_21:
    v20();
    goto LABEL_22;
  }
  CFStringRef v21 = [*(id *)(a1 + 32) managedObjectName];
  id v22 = objc_alloc(NSClassFromString(v21));
  __int16 v23 = [v2 deviceContext];
  id v24 = [v22 initWithDeviceContext:v23];

  if (!v24)
  {
LABEL_16:
    __ICOSLogCreate();
    long long v39 = [*(id *)(a1 + 32) managedObjectName];
    if ((unint64_t)[v39 length] >= 0x15)
    {
      long long v40 = [v39 substringWithRange:0, 18];
      uint64_t v41 = [v40 stringByAppendingString:@".."];

      long long v39 = (void *)v41;
    }
    v42 = +[NSString stringWithFormat:@"> Not Found: %@", *(void *)(a1 + 40)];
    v43 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v44 = v39;
      CFStringRef v45 = v43;
      *(_DWORD *)buf = 136446466;
      id v47 = [v44 UTF8String];
      __int16 v48 = 2114;
      v49 = v42;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    id v20 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_21;
  }
  [v24 startListening];
  __ICOSLogCreate();
  id v25 = [*(id *)(a1 + 32) managedObjectName];
  if ((unint64_t)[v25 length] >= 0x15)
  {
    uint64_t v26 = [v25 substringWithRange:0, 18];
    uint64_t v27 = [v26 stringByAppendingString:@".."];

    id v25 = (void *)v27;
  }
  id v28 = [v2 localizedName];
  __int16 v29 = +[NSString stringWithFormat:@"> New Device: %@", v28];

  uint64_t v30 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v31 = v25;
    id v32 = v30;
    *(_DWORD *)buf = 136446466;
    id v47 = [v31 UTF8String];
    __int16 v48 = 2114;
    v49 = v29;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [v24 setDelegate:*(void *)(a1 + 32)];
  __int16 v33 = [v24 endpoint];
  long long v34 = [v24 cameraDictionary];
  [v34 setObject:v33 forKeyedSubscript:@"ICDeviceEndpoint"];

  long long v35 = [v2 uuidString];
  long long v36 = [v24 cameraDictionary];
  [v36 setObject:v35 forKeyedSubscript:@"ICInternalDeviceUUID"];

  [v2 setCamera:v24];
  uint64_t v37 = *(void *)(a1 + 48);
  long long v38 = [v24 cameraDictionary];
  (*(void (**)(uint64_t, void *))(v37 + 16))(v37, v38);

LABEL_22:
}

void sub_100031A40(id a1)
{
  id v14 = objc_alloc((Class)NSSet);
  uint64_t v13 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = [v14 initWithObjects:v13, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0];
  uint64_t v12 = qword_1000634E8;
  qword_1000634E8 = (uint64_t)v11;

  _objc_release_x1(v11, v12);
}

void sub_1000321A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000321E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000321F8(uint64_t a1)
{
}

void sub_100032200(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v1)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = v1;
    [v3 removeRemoteManagerConnectionWithProcessIdentifier:[v2 intValue]];
  }
}

time_t sub_100032B70(void *a1)
{
  *(_OWORD *)&v2.tm_isdst = 0u;
  v2.tm_isdst = -1;
  strptime_l((const char *)[a1 UTF8String], "%Y%m%dT%H%M%S.0", &v2, 0);
  return mktime(&v2);
}

void sub_100033C1C()
{
  sub_100009C30();
  id v2 = v1;
  id v3 = v0;
  sub_100009C3C();
  sub_100009BE0();
  sub_100009BF8((void *)&_mh_execute_header, v4, v5, "%{public}20s ! %{public}@", v6, v7, v8, v9, v10);
}

void sub_100033CAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100009C18(a1, a2, a3, 4.8752e-34);
  sub_100009C54((void *)&_mh_execute_header, "%{public}20s ! %{public}@", v3, v4);
}

void sub_100033CE8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100033D60(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = a2;
  int v7 = 136446466;
  id v8 = [v5 UTF8String];
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}20s ! %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_100033E1C(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446466;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}20s ! %{public}@", buf, 0x16u);
}

void sub_100033E74(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  [v3 UTF8String];
  sub_100009BE0();
  sub_100009BF8((void *)&_mh_execute_header, v5, v6, "%{public}20s ! %{public}@", v7, v8, v9, v10, v11);
}

void *__cdecl CFAllocatorReallocate(CFAllocatorRef allocator, void *ptr, CFIndex newsize, CFOptionFlags hint)
{
  return _CFAllocatorReallocate(allocator, ptr, newsize, hint);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return _CFStringConvertEncodingToNSStringEncoding(encoding);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CFUUIDRef CFUUIDCreateWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDCreateWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

CGDataProviderRef CGDataProviderCreateDirect(void *info, off_t size, const CGDataProviderDirectCallbacks *callbacks)
{
  return _CGDataProviderCreateDirect(info, size, callbacks);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return _CGDataProviderCreateWithData(info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return _CGImageSourceCopyProperties(isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

uint64_t CGImageSourceCopyTypeExtensions()
{
  return _CGImageSourceCopyTypeExtensions();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateImageAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateIncremental(CFDictionaryRef options)
{
  return _CGImageSourceCreateIncremental(options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateThumbnailAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithData(data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithDataProvider(provider, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return _CGImageSourceGetCount(isrc);
}

uint64_t CGImageSourceGetTypeWithExtension()
{
  return _CGImageSourceGetTypeWithExtension();
}

void CGImageSourceUpdateData(CGImageSourceRef isrc, CFDataRef data, BOOL final)
{
}

uint64_t CPPowerAssertionCreate()
{
  return _CPPowerAssertionCreate();
}

uint64_t CopyMetadataFromCFData()
{
  return _CopyMetadataFromCFData();
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return _IOCreatePlugInInterfaceForService(service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return _IODestroyPlugInInterface(interface);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MMCSSignatureAndSchemeSize()
{
  return _MMCSSignatureAndSchemeSize();
}

uint64_t MMCSSignatureGeneratorCreateWithBoundaryKey()
{
  return _MMCSSignatureGeneratorCreateWithBoundaryKey();
}

uint64_t MMCSSignatureGeneratorFinish()
{
  return _MMCSSignatureGeneratorFinish();
}

uint64_t MMCSSignatureGeneratorUpdate()
{
  return _MMCSSignatureGeneratorUpdate();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t TCCAccessCheckAuditToken()
{
  return _TCCAccessCheckAuditToken();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

time_t mktime(tm *a1)
{
  return _mktime(a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

uint64_t remote_device_browser_cancel()
{
  return _remote_device_browser_cancel();
}

uint64_t remote_device_copy_properties()
{
  return _remote_device_copy_properties();
}

uint64_t remote_device_start_browsing_matching()
{
  return _remote_device_start_browsing_matching();
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return _sqlite3_open(filename, ppDb);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return _strptime_l(a1, a2, a3, a4);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

void syslog(int a1, const char *a2, ...)
{
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UTI(void *a1, const char *a2, ...)
{
  return [a1 UTI];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__createSignatureGenerator(void *a1, const char *a2, ...)
{
  return [a1 _createSignatureGenerator];
}

id objc_msgSend_abortPendingIO(void *a1, const char *a2, ...)
{
  return [a1 abortPendingIO];
}

id objc_msgSend_accessCapability(void *a1, const char *a2, ...)
{
  return [a1 accessCapability];
}

id objc_msgSend_addedBundles(void *a1, const char *a2, ...)
{
  return [a1 addedBundles];
}

id objc_msgSend_additionalProperties(void *a1, const char *a2, ...)
{
  return [a1 additionalProperties];
}

id objc_msgSend_allBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allBundleIdentifiers];
}

id objc_msgSend_allConnections(void *a1, const char *a2, ...)
{
  return [a1 allConnections];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allowKeepAwake(void *a1, const char *a2, ...)
{
  return [a1 allowKeepAwake];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_appleSerialNumberString(void *a1, const char *a2, ...)
{
  return [a1 appleSerialNumberString];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bufMutableBytes(void *a1, const char *a2, ...)
{
  return [a1 bufMutableBytes];
}

id objc_msgSend_bufSize(void *a1, const char *a2, ...)
{
  return [a1 bufSize];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_camera(void *a1, const char *a2, ...)
{
  return [a1 camera];
}

id objc_msgSend_cameraDictionary(void *a1, const char *a2, ...)
{
  return [a1 cameraDictionary];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_capacity(void *a1, const char *a2, ...)
{
  return [a1 capacity];
}

id objc_msgSend_captureDate(void *a1, const char *a2, ...)
{
  return [a1 captureDate];
}

id objc_msgSend_catalogingDone(void *a1, const char *a2, ...)
{
  return [a1 catalogingDone];
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return [a1 charValue];
}

id objc_msgSend_closeDevice(void *a1, const char *a2, ...)
{
  return [a1 closeDevice];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_closeSession(void *a1, const char *a2, ...)
{
  return [a1 closeSession];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return [a1 connected];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return [a1 connections];
}

id objc_msgSend_containerLength(void *a1, const char *a2, ...)
{
  return [a1 containerLength];
}

id objc_msgSend_containerType(void *a1, const char *a2, ...)
{
  return [a1 containerType];
}

id objc_msgSend_contentForUSB(void *a1, const char *a2, ...)
{
  return [a1 contentForUSB];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentSessionCount(void *a1, const char *a2, ...)
{
  return [a1 currentSessionCount];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataExpected(void *a1, const char *a2, ...)
{
  return [a1 dataExpected];
}

id objc_msgSend_dataReceived(void *a1, const char *a2, ...)
{
  return [a1 dataReceived];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deniedBundles(void *a1, const char *a2, ...)
{
  return [a1 deniedBundles];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 deviceAccessQueue];
}

id objc_msgSend_deviceContext(void *a1, const char *a2, ...)
{
  return [a1 deviceContext];
}

id objc_msgSend_deviceDateTime(void *a1, const char *a2, ...)
{
  return [a1 deviceDateTime];
}

id objc_msgSend_deviceInfo(void *a1, const char *a2, ...)
{
  return [a1 deviceInfo];
}

id objc_msgSend_deviceIsEnumerating(void *a1, const char *a2, ...)
{
  return [a1 deviceIsEnumerating];
}

id objc_msgSend_deviceIsPairedWithThisHost(void *a1, const char *a2, ...)
{
  return [a1 deviceIsPairedWithThisHost];
}

id objc_msgSend_deviceIsPasscodeLocked(void *a1, const char *a2, ...)
{
  return [a1 deviceIsPasscodeLocked];
}

id objc_msgSend_deviceOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 deviceOperationQueue];
}

id objc_msgSend_deviceProductID(void *a1, const char *a2, ...)
{
  return [a1 deviceProductID];
}

id objc_msgSend_devicePropertiesSupported(void *a1, const char *a2, ...)
{
  return [a1 devicePropertiesSupported];
}

id objc_msgSend_deviceSerialNumberString(void *a1, const char *a2, ...)
{
  return [a1 deviceSerialNumberString];
}

id objc_msgSend_deviceVendorID(void *a1, const char *a2, ...)
{
  return [a1 deviceVendorID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_dpOffset(void *a1, const char *a2, ...)
{
  return [a1 dpOffset];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_enumerationOrder(void *a1, const char *a2, ...)
{
  return [a1 enumerationOrder];
}

id objc_msgSend_eventCode(void *a1, const char *a2, ...)
{
  return [a1 eventCode];
}

id objc_msgSend_eventQueue(void *a1, const char *a2, ...)
{
  return [a1 eventQueue];
}

id objc_msgSend_exifCreationDateTime(void *a1, const char *a2, ...)
{
  return [a1 exifCreationDateTime];
}

id objc_msgSend_exifModificationDateTime(void *a1, const char *a2, ...)
{
  return [a1 exifModificationDateTime];
}

id objc_msgSend_externalMediaAccessDB(void *a1, const char *a2, ...)
{
  return [a1 externalMediaAccessDB];
}

id objc_msgSend_fetchFullMetadata(void *a1, const char *a2, ...)
{
  return [a1 fetchFullMetadata];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return [a1 filename];
}

id objc_msgSend_filepath(void *a1, const char *a2, ...)
{
  return [a1 filepath];
}

id objc_msgSend_fingerprint(void *a1, const char *a2, ...)
{
  return [a1 fingerprint];
}

id objc_msgSend_headerOffsetBytes(void *a1, const char *a2, ...)
{
  return [a1 headerOffsetBytes];
}

id objc_msgSend_holdPowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 holdPowerAssertion];
}

id objc_msgSend_iCloudPhotosEnabled(void *a1, const char *a2, ...)
{
  return [a1 iCloudPhotosEnabled];
}

id objc_msgSend_iCloudPhotosOptimizeStorageState(void *a1, const char *a2, ...)
{
  return [a1 iCloudPhotosOptimizeStorageState];
}

id objc_msgSend_icWhitelistedClasses(void *a1, const char *a2, ...)
{
  return [a1 icWhitelistedClasses];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageBitDepth(void *a1, const char *a2, ...)
{
  return [a1 imageBitDepth];
}

id objc_msgSend_imageHeight(void *a1, const char *a2, ...)
{
  return [a1 imageHeight];
}

id objc_msgSend_imageIOSupported(void *a1, const char *a2, ...)
{
  return [a1 imageIOSupported];
}

id objc_msgSend_imageInspectMetadata(void *a1, const char *a2, ...)
{
  return [a1 imageInspectMetadata];
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return [a1 imageOrientation];
}

id objc_msgSend_imagePixHeight(void *a1, const char *a2, ...)
{
  return [a1 imagePixHeight];
}

id objc_msgSend_imagePixWidth(void *a1, const char *a2, ...)
{
  return [a1 imagePixWidth];
}

id objc_msgSend_imageWidth(void *a1, const char *a2, ...)
{
  return [a1 imageWidth];
}

id objc_msgSend_immediateMatch(void *a1, const char *a2, ...)
{
  return [a1 immediateMatch];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_indexedFiles(void *a1, const char *a2, ...)
{
  return [a1 indexedFiles];
}

id objc_msgSend_indexedFolders(void *a1, const char *a2, ...)
{
  return [a1 indexedFolders];
}

id objc_msgSend_indexedMediaSet(void *a1, const char *a2, ...)
{
  return [a1 indexedMediaSet];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_initiator(void *a1, const char *a2, ...)
{
  return [a1 initiator];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalUUID(void *a1, const char *a2, ...)
{
  return [a1 internalUUID];
}

id objc_msgSend_intervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 intervalSince1970];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return [a1 invalidationHandler];
}

id objc_msgSend_isAccessRestrictedAppleDevice(void *a1, const char *a2, ...)
{
  return [a1 isAccessRestrictedAppleDevice];
}

id objc_msgSend_isAppleDevice(void *a1, const char *a2, ...)
{
  return [a1 isAppleDevice];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_locationID(void *a1, const char *a2, ...)
{
  return [a1 locationID];
}

id objc_msgSend_locked(void *a1, const char *a2, ...)
{
  return [a1 locked];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_managedObjectName(void *a1, const char *a2, ...)
{
  return [a1 managedObjectName];
}

id objc_msgSend_mediaItemCount(void *a1, const char *a2, ...)
{
  return [a1 mediaItemCount];
}

id objc_msgSend_mediaItemType(void *a1, const char *a2, ...)
{
  return [a1 mediaItemType];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_mobdevPropertiesBrowser(void *a1, const char *a2, ...)
{
  return [a1 mobdevPropertiesBrowser];
}

id objc_msgSend_mobdevPropertiesQueue(void *a1, const char *a2, ...)
{
  return [a1 mobdevPropertiesQueue];
}

id objc_msgSend_mobdevProps(void *a1, const char *a2, ...)
{
  return [a1 mobdevProps];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_numParameters(void *a1, const char *a2, ...)
{
  return [a1 numParameters];
}

id objc_msgSend_objHandle(void *a1, const char *a2, ...)
{
  return [a1 objHandle];
}

id objc_msgSend_objectCompressedSize64(void *a1, const char *a2, ...)
{
  return [a1 objectCompressedSize64];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_objectFormat(void *a1, const char *a2, ...)
{
  return [a1 objectFormat];
}

id objc_msgSend_objectHandle(void *a1, const char *a2, ...)
{
  return [a1 objectHandle];
}

id objc_msgSend_opaqueRepresentation(void *a1, const char *a2, ...)
{
  return [a1 opaqueRepresentation];
}

id objc_msgSend_openSession(void *a1, const char *a2, ...)
{
  return [a1 openSession];
}

id objc_msgSend_operationCode(void *a1, const char *a2, ...)
{
  return [a1 operationCode];
}

id objc_msgSend_operationsSupported(void *a1, const char *a2, ...)
{
  return [a1 operationsSupported];
}

id objc_msgSend_orderAscending(void *a1, const char *a2, ...)
{
  return [a1 orderAscending];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_osTransactions(void *a1, const char *a2, ...)
{
  return [a1 osTransactions];
}

id objc_msgSend_parameter1(void *a1, const char *a2, ...)
{
  return [a1 parameter1];
}

id objc_msgSend_parameter2(void *a1, const char *a2, ...)
{
  return [a1 parameter2];
}

id objc_msgSend_parameter3(void *a1, const char *a2, ...)
{
  return [a1 parameter3];
}

id objc_msgSend_parameter4(void *a1, const char *a2, ...)
{
  return [a1 parameter4];
}

id objc_msgSend_parameter5(void *a1, const char *a2, ...)
{
  return [a1 parameter5];
}

id objc_msgSend_parentObject(void *a1, const char *a2, ...)
{
  return [a1 parentObject];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_preflightCount(void *a1, const char *a2, ...)
{
  return [a1 preflightCount];
}

id objc_msgSend_previewThumbnail(void *a1, const char *a2, ...)
{
  return [a1 previewThumbnail];
}

id objc_msgSend_primaryIdentifierString(void *a1, const char *a2, ...)
{
  return [a1 primaryIdentifierString];
}

id objc_msgSend_prime(void *a1, const char *a2, ...)
{
  return [a1 prime];
}

id objc_msgSend_prioritizeSpeed(void *a1, const char *a2, ...)
{
  return [a1 prioritizeSpeed];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return [a1 productID];
}

id objc_msgSend_protectionStatus(void *a1, const char *a2, ...)
{
  return [a1 protectionStatus];
}

id objc_msgSend_ptpObjectCount(void *a1, const char *a2, ...)
{
  return [a1 ptpObjectCount];
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return [a1 range];
}

id objc_msgSend_rawImageSupported(void *a1, const char *a2, ...)
{
  return [a1 rawImageSupported];
}

id objc_msgSend_readInterruptData(void *a1, const char *a2, ...)
{
  return [a1 readInterruptData];
}

id objc_msgSend_readStorages(void *a1, const char *a2, ...)
{
  return [a1 readStorages];
}

id objc_msgSend_refreshAssignedDeviceName(void *a1, const char *a2, ...)
{
  return [a1 refreshAssignedDeviceName];
}

id objc_msgSend_refreshInfo(void *a1, const char *a2, ...)
{
  return [a1 refreshInfo];
}

id objc_msgSend_relatedUUID(void *a1, const char *a2, ...)
{
  return [a1 relatedUUID];
}

id objc_msgSend_releasePowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 releasePowerAssertion];
}

id objc_msgSend_remoteCameraDevices(void *a1, const char *a2, ...)
{
  return [a1 remoteCameraDevices];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllSessions(void *a1, const char *a2, ...)
{
  return [a1 removeAllSessions];
}

id objc_msgSend_requestPacket(void *a1, const char *a2, ...)
{
  return [a1 requestPacket];
}

id objc_msgSend_requestPending(void *a1, const char *a2, ...)
{
  return [a1 requestPending];
}

id objc_msgSend_resetDevice(void *a1, const char *a2, ...)
{
  return [a1 resetDevice];
}

id objc_msgSend_responseCode(void *a1, const char *a2, ...)
{
  return [a1 responseCode];
}

id objc_msgSend_responsePacket(void *a1, const char *a2, ...)
{
  return [a1 responsePacket];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_rxCopyDataBuffer(void *a1, const char *a2, ...)
{
  return [a1 rxCopyDataBuffer];
}

id objc_msgSend_rxDataBuffer(void *a1, const char *a2, ...)
{
  return [a1 rxDataBuffer];
}

id objc_msgSend_rxDataMutableBytes(void *a1, const char *a2, ...)
{
  return [a1 rxDataMutableBytes];
}

id objc_msgSend_sendHostMediaCapabilities(void *a1, const char *a2, ...)
{
  return [a1 sendHostMediaCapabilities];
}

id objc_msgSend_sendHostSupportsGroupNotifications(void *a1, const char *a2, ...)
{
  return [a1 sendHostSupportsGroupNotifications];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_sessionManager(void *a1, const char *a2, ...)
{
  return [a1 sessionManager];
}

id objc_msgSend_sessionOpen(void *a1, const char *a2, ...)
{
  return [a1 sessionOpen];
}

id objc_msgSend_sessions(void *a1, const char *a2, ...)
{
  return [a1 sessions];
}

id objc_msgSend_setDeviceFinishedEnumerating(void *a1, const char *a2, ...)
{
  return [a1 setDeviceFinishedEnumerating];
}

id objc_msgSend_setDeviceIsEnumerating(void *a1, const char *a2, ...)
{
  return [a1 setDeviceIsEnumerating];
}

id objc_msgSend_sharedAccessManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessManager];
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return [a1 shortValue];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_smallThumbnail(void *a1, const char *a2, ...)
{
  return [a1 smallThumbnail];
}

id objc_msgSend_smallestEncoding(void *a1, const char *a2, ...)
{
  return [a1 smallestEncoding];
}

id objc_msgSend_standardVersion(void *a1, const char *a2, ...)
{
  return [a1 standardVersion];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startInitiator(void *a1, const char *a2, ...)
{
  return [a1 startInitiator];
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return [a1 startListening];
}

id objc_msgSend_startUSBPTPInterfaceNotifications(void *a1, const char *a2, ...)
{
  return [a1 startUSBPTPInterfaceNotifications];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return [a1 storage];
}

id objc_msgSend_storageID(void *a1, const char *a2, ...)
{
  return [a1 storageID];
}

id objc_msgSend_storageIDs(void *a1, const char *a2, ...)
{
  return [a1 storageIDs];
}

id objc_msgSend_storages(void *a1, const char *a2, ...)
{
  return [a1 storages];
}

id objc_msgSend_thmSize(void *a1, const char *a2, ...)
{
  return [a1 thmSize];
}

id objc_msgSend_thumbCompressedSize(void *a1, const char *a2, ...)
{
  return [a1 thumbCompressedSize];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timedOut(void *a1, const char *a2, ...)
{
  return [a1 timedOut];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return [a1 timer];
}

id objc_msgSend_timerQueue(void *a1, const char *a2, ...)
{
  return [a1 timerQueue];
}

id objc_msgSend_transactionID(void *a1, const char *a2, ...)
{
  return [a1 transactionID];
}

id objc_msgSend_transactions(void *a1, const char *a2, ...)
{
  return [a1 transactions];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_txComplete(void *a1, const char *a2, ...)
{
  return [a1 txComplete];
}

id objc_msgSend_txDataPacket(void *a1, const char *a2, ...)
{
  return [a1 txDataPacket];
}

id objc_msgSend_txID(void *a1, const char *a2, ...)
{
  return [a1 txID];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unlinkWhenDone(void *a1, const char *a2, ...)
{
  return [a1 unlinkWhenDone];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_updateCatalogingDone(void *a1, const char *a2, ...)
{
  return [a1 updateCatalogingDone];
}

id objc_msgSend_updateContent(void *a1, const char *a2, ...)
{
  return [a1 updateContent];
}

id objc_msgSend_updateMobdevProps(void *a1, const char *a2, ...)
{
  return [a1 updateMobdevProps];
}

id objc_msgSend_updatedBasicMetadata(void *a1, const char *a2, ...)
{
  return [a1 updatedBasicMetadata];
}

id objc_msgSend_updatedExpensiveMetadata(void *a1, const char *a2, ...)
{
  return [a1 updatedExpensiveMetadata];
}

id objc_msgSend_usbSerialNumberString(void *a1, const char *a2, ...)
{
  return [a1 usbSerialNumberString];
}

id objc_msgSend_userAssignedDeviceName(void *a1, const char *a2, ...)
{
  return [a1 userAssignedDeviceName];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_uuidString(void *a1, const char *a2, ...)
{
  return [a1 uuidString];
}

id objc_msgSend_vendorExtensionDescription(void *a1, const char *a2, ...)
{
  return [a1 vendorExtensionDescription];
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return [a1 vendorID];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_writeBulkData_(void *a1, const char *a2, ...)
{
  return [a1 writeBulkData:];
}