id WALogCategoryDefaultHandle()
{
  void *v0;
  uint64_t vars8;

  if (qword_1000F0F00 != -1) {
    dispatch_once(&qword_1000F0F00, &stru_1000D0B48);
  }
  v0 = (void *)qword_1000F0F08;

  return v0;
}

void sub_10000484C(id a1)
{
  qword_1000F0F08 = (uint64_t)os_log_create("com.apple.wifi.analytics", "Default");

  _objc_release_x1();
}

id WALogDiagnosticProfileLogHandle()
{
  if (qword_1000F0F10 != -1) {
    dispatch_once(&qword_1000F0F10, &stru_1000D0B68);
  }
  v0 = (void *)qword_1000F0F18;

  return v0;
}

void sub_1000048E4(id a1)
{
  qword_1000F0F18 = (uint64_t)os_log_create("com.apple.wifi.analytics", "diagnosticstream");

  _objc_release_x1();
}

id WALogWorkReportHandle()
{
  if (qword_1000F0F20 != -1) {
    dispatch_once(&qword_1000F0F20, &stru_1000D0B88);
  }
  v0 = (void *)qword_1000F0F28;

  return v0;
}

void sub_10000497C(id a1)
{
  qword_1000F0F28 = (uint64_t)os_log_create("com.apple.wifi.analytics", "WorkReport");

  _objc_release_x1();
}

id WALogActivityManagerHandle()
{
  if (qword_1000F0F30 != -1) {
    dispatch_once(&qword_1000F0F30, &stru_1000D0BA8);
  }
  v0 = (void *)qword_1000F0F38;

  return v0;
}

void sub_100004A14(id a1)
{
  qword_1000F0F38 = (uint64_t)os_log_create("com.apple.wifi.analytics", "Activity");

  _objc_release_x1();
}

id WALogCategoryDeviceStoreHandle()
{
  if (qword_1000F0F40 != -1) {
    dispatch_once(&qword_1000F0F40, &stru_1000D0BC8);
  }
  v0 = (void *)qword_1000F0F48;

  return v0;
}

void sub_100004AAC(id a1)
{
  qword_1000F0F48 = (uint64_t)os_log_create("com.apple.wifi.analytics", "DeviceStore");

  _objc_release_x1();
}

void sub_100004D1C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100004D30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = [*(id *)(a1 + 32) uuid];
    v6 = [*(id *)(a1 + 32) key];
    v7 = [*(id *)(a1 + 32) originalClassName];
    int v29 = 136447490;
    v30 = "-[WAMessageAWDStore updateMessage:]_block_invoke";
    __int16 v31 = 1024;
    int v32 = 60;
    __int16 v33 = 2112;
    id v34 = v5;
    __int16 v35 = 2112;
    v36 = v6;
    __int16 v37 = 2112;
    v38 = v7;
    __int16 v39 = 2048;
    id v40 = [WeakRetained storeSize];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Message store ingesting message with UUID: %@ key: %@ and original classname: %@ size before: %lu", (uint8_t *)&v29, 0x3Au);
  }
  v8 = [WeakRetained uuidToMessageMap];
  v9 = [*(id *)(a1 + 32) uuid];
  v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    v11 = [WeakRetained uuidToMessageMap];
    v12 = [*(id *)(a1 + 32) uuid];
    v13 = [v11 objectForKeyedSubscript:v12];
    v14 = [v13 size];

    v15 = [WeakRetained uuidToMessageMap];
    v16 = [*(id *)(a1 + 32) uuid];
    v17 = [v15 objectForKeyedSubscript:v16];
    [v17 updatePayload:*(void *)(a1 + 32)];

    v18 = [WeakRetained storeSize];
    v19 = [WeakRetained uuidToMessageMap];
    v20 = [*(id *)(a1 + 32) uuid];
    v21 = [v19 objectForKeyedSubscript:v20];
    [WeakRetained setStoreSize:((char *)[v21 size] + v18 - v14)];

    v22 = [WeakRetained uuidToMessageMap];
    v23 = [*(id *)(a1 + 32) uuid];
    v24 = [v22 objectForKeyedSubscript:v23];
  }
  else
  {
    v24 = [[WAMessageAWDStoreEntry alloc] initWithPayload:*(void *)(a1 + 32)];
    v25 = [WeakRetained uuidToMessageMap];
    v26 = [*(id *)(a1 + 32) uuid];
    [v25 setObject:v24 forKeyedSubscript:v26];

    [WeakRetained setStoreSize:((char *)[WeakRetained storeSize] + -[WAMessageAWDStoreEntry size](v24, "size"))];
  }
  [WeakRetained _insertInOrder:v24];
  [WeakRetained _purgeIfNecessary];
  v27 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    id v28 = [WeakRetained storeSize];
    int v29 = 136446722;
    v30 = "-[WAMessageAWDStore updateMessage:]_block_invoke";
    __int16 v31 = 1024;
    int v32 = 75;
    __int16 v33 = 2048;
    id v34 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Size after: %lu", (uint8_t *)&v29, 0x1Cu);
  }
}

void sub_100005350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v10 - 88));
  _Unwind_Resume(a1);
}

uint64_t sub_100005378(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005388(uint64_t a1)
{
}

void sub_100005390(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = [WeakRetained uuidToMessageMap];
  v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v5)
  {
    v6 = [v5 message];
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v6);
  if (v5) {

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

int64_t sub_1000054E8(id a1, WAMessageAWDStoreEntry *a2, WAMessageAWDStoreEntry *a3)
{
  v4 = a2;
  v5 = a3;
  id v6 = [(WAMessageAWDStoreEntry *)v4 lastModifiedTimeInMillisecondEpoch];
  if (v6 <= (id)[(WAMessageAWDStoreEntry *)v5 lastModifiedTimeInMillisecondEpoch])
  {
    id v8 = [(WAMessageAWDStoreEntry *)v4 lastModifiedTimeInMillisecondEpoch];
    int64_t v7 = v8 < (id)[(WAMessageAWDStoreEntry *)v5 lastModifiedTimeInMillisecondEpoch];
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

void sub_100005A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100005A88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained uuidToMessageMap];
  [v4 removeAllObjects];

  v5 = [WeakRetained sortedByLastAccess];
  [v5 removeAllObjects];

  [WeakRetained setStoreSize:0];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005EA4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100005EB8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _removeMessageWithUUID:*(void *)(a1 + 32)];
}

void sub_100005FB0(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  id v305 = a2;
  id v14 = a3;
  id v15 = a4;
  objc_initWeak(&location, a5);
  id v16 = a7;
  id v298 = a8;
  v292 = a9;
  id val = objc_loadWeakRetained(&location);
  v17 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "populateNWActivityInterfaceStats", "", buf, 2u);
  }

  id v324 = 0;
  sub_100009940(v305, val, a6, v16, v14, v15, v298, &v324);
  id v287 = v324;
  v18 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "populateNWActivityInterfaceStats", "", buf, 2u);
  }

  v19 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "populateNWActivityAWDLInterfaceStats", "", buf, 2u);
  }

  v20 = [v305 fieldForKey:@"NWA_awdlIfStats"];
  [v20 subMessageValue];
  v283 = v20;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&v330, val);
  id v315 = v16;
  id v299 = v14;
  id v22 = v15;
  id v308 = objc_loadWeakRetained(&v330);
  id v23 = v21;
  v24 = sub_100025E34(v22);
  long long v328 = 0u;
  long long v329 = 0u;
  *(_OWORD *)v326 = 0u;
  long long v327 = 0u;
  v25 = [v22 objectForKeyedSubscript:v24];
  v26 = [v25 allKeys];

  id v27 = [v26 countByEnumeratingWithState:v326 objects:buf count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v327;
LABEL_9:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v327 != v28) {
        objc_enumerationMutation(v26);
      }
      v30 = (void *)*((void *)v326[1] + v29);
      if ([v30 containsString:@"Interface awdl"])
      {
        if (([v30 containsString:@"Peer"] & 1) == 0) {
          break;
        }
      }
      if (v27 == (id)++v29)
      {
        id v27 = [v26 countByEnumeratingWithState:v326 objects:buf count:16];
        if (v27) {
          goto LABEL_9;
        }
        goto LABEL_16;
      }
    }
    id v34 = v30;

    if (!v34) {
      goto LABEL_17;
    }
    v36 = [v23 fieldForKey:@"NWAAWDLIS_role"];
    __int16 v37 = [v36 stringValue];
    unsigned __int8 v38 = [v37 isEqualToString:v34];

    __int16 v39 = WALogCategoryDefaultHandle();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG);
    if (v38)
    {
      if (v40)
      {
        *(_DWORD *)v331 = 136446466;
        v332 = "void populateNWActivityAWDLInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopula"
               "torMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __stron"
               "g, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v333 = 1024;
        int v334 = 1095;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found AWDL Interface", v331, 0x12u);
      }
    }
    else
    {
      if (v40)
      {
        *(_DWORD *)v331 = 136446466;
        v332 = "void populateNWActivityAWDLInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopula"
               "torMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __stron"
               "g, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v333 = 1024;
        int v334 = 1092;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting AWDL Interface", v331, 0x12u);
      }

      __int16 v39 = [v23 fieldForKey:@"NWAAWDLIS_role"];
      [v39 setStringValue:v34];
    }

    v41 = [v22 objectForKeyedSubscript:v24];
    v42 = [v41 objectForKeyedSubscript:v34];
    v43 = [v42 objectForKeyedSubscript:@"Manager Config"];

    if (v43)
    {
      sub_100026048(v22, v23, @"NWAAWDLIS_enabled", v24, v34, @"Manager Config", @"Enabled");
      sub_100026048(v22, v23, @"NWAAWDLIS_rtPeerCount", v24, v34, @"Manager Config", @"Realtime Group Peer Count");
      sub_100026048(v22, v23, @"NWAAWDLIS_peerCount", v24, v34, @"Manager Config", @"Peer Count");
      sub_100026048(v22, v23, @"NWAAWDLIS_peersAdded", v24, v34, @"Manager Config", @"Peers Added");
      sub_100026048(v22, v23, @"NWAAWDLIS_peersRemoved", v24, v34, @"Manager Config", @"Peers Removed");
    }
    else
    {
      v44 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v331 = 136446466;
        v332 = "void populateNWActivityAWDLInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopula"
               "torMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __stron"
               "g, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v333 = 1024;
        int v334 = 1105;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%{public}s::%d:AWDL hasn't been enabled yet, rescan needed, continuing", v331, 0x12u);
      }
    }
    v45 = [v22 objectForKeyedSubscript:v24];
    v46 = [v45 objectForKeyedSubscript:v34];
    v47 = [v46 objectForKeyedSubscript:@"Action Frames"];

    if (v47) {
      sub_100026048(v22, v23, @"NWAAWDLIS_afCount", v24, v34, @"Action Frames", @"Input");
    }
    v48 = [v22 objectForKeyedSubscript:v24];
    v49 = [v48 objectForKeyedSubscript:v34];
    v50 = [v49 objectForKeyedSubscript:@"Data Bytes"];

    if (v50)
    {
      sub_1000266BC(v22, v23, v308, a6, v315, 0, @"NWAAWDLIS_bytes", v24, v34, @"Data Bytes", @"Rx Bytes");
      sub_1000266BC(v22, v23, v308, a6, v315, 3u, @"NWAAWDLIS_bytes", v24, v34, @"Data Bytes", @"BE Tx Bytes");
      sub_1000266BC(v22, v23, v308, a6, v315, 2u, @"NWAAWDLIS_bytes", v24, v34, @"Data Bytes", @"BK Tx Bytes");
      sub_1000266BC(v22, v23, v308, a6, v315, 5u, @"NWAAWDLIS_bytes", v24, v34, @"Data Bytes", @"VI Tx Bytes");
      sub_1000266BC(v22, v23, v308, a6, v315, 4u, @"NWAAWDLIS_bytes", v24, v34, @"Data Bytes", @"VO Tx Bytes");
      sub_1000266BC(v22, v23, v308, a6, v315, 1u, @"NWAAWDLIS_bytes", v24, v34, @"Data Bytes", @"Tx Bytes");
    }
    v51 = [v22 objectForKeyedSubscript:v24];
    v52 = [v51 objectForKeyedSubscript:v34];
    v53 = [v52 objectForKeyedSubscript:@"Data Packets"];

    if (v53)
    {
      sub_1000266BC(v22, v23, v308, a6, v315, 0, @"NWAAWDLIS_packets", v24, v34, @"Data Packets", @"Rx Packets");
      sub_1000266BC(v22, v23, v308, a6, v315, 3u, @"NWAAWDLIS_packets", v24, v34, @"Data Packets", @"BE Tx Packets");
      sub_1000266BC(v22, v23, v308, a6, v315, 2u, @"NWAAWDLIS_packets", v24, v34, @"Data Packets", @"BK Tx Packets");
      sub_1000266BC(v22, v23, v308, a6, v315, 5u, @"NWAAWDLIS_packets", v24, v34, @"Data Packets", @"VI Tx Packets");
      sub_1000266BC(v22, v23, v308, a6, v315, 4u, @"NWAAWDLIS_packets", v24, v34, @"Data Packets", @"VO Tx Packets");
      sub_1000266BC(v22, v23, v308, a6, v315, 1u, @"NWAAWDLIS_packets", v24, v34, @"Data Packets", @"Tx Packets");
    }
    v54 = [v22 objectForKeyedSubscript:v24];
    v55 = [v54 objectForKeyedSubscript:v34];
    v56 = [v55 objectForKeyedSubscript:@"Manager Config"];

    if (v56)
    {
      sub_10002620C(v22, v23, v308, a6, v315, @"NWAAWDLIS_npeers", v24, v34, @"Manager Config", @"Peer Count State");
      sub_10002620C(v22, v23, v308, a6, v315, @"NWAAWDLIS_nrtpeers", v24, v34, @"Manager Config", @"Realtime Group Peer Count State");
      sub_10002620C(v22, v23, v308, a6, v315, @"NWAAWDLIS_enableStates", v24, v34, @"Manager Config", @"Enabled State");
    }
    v57 = [v22 objectForKeyedSubscript:v24];
    v58 = [v57 objectForKeyedSubscript:v34];
    v59 = [v58 objectForKeyedSubscript:@"AWDL Schedule"];

    if (v59) {
      sub_10002620C(v22, v23, v308, a6, v315, @"NWAAWDLIS_awdlStates", v24, v34, @"AWDL Schedule", @"AWDL Schedule State");
    }
    v60 = [v22 objectForKeyedSubscript:v24];
    v61 = [v60 objectForKeyedSubscript:v34];
    v62 = [v61 objectForKeyedSubscript:@"TxCompletion Latency"];
    v63 = [v62 objectForKeyedSubscript:@"Completion Latency Be"];

    if (v63) {
      sub_100027A50(v22, v23, v308, a6, v315, @"NWAAWDLIS_txLatencyBEs", v24, v34, @"Completion Latency Be");
    }
    v64 = [v22 objectForKeyedSubscript:v24];
    v65 = [v64 objectForKeyedSubscript:v34];
    v66 = [v65 objectForKeyedSubscript:@"TxCompletion Latency"];
    v67 = [v66 objectForKeyedSubscript:@"Completion Latency Bk"];

    if (v67) {
      sub_100027A50(v22, v23, v308, a6, v315, @"NWAAWDLIS_txLatencyBKs", v24, v34, @"Completion Latency Bk");
    }
    v68 = [v22 objectForKeyedSubscript:v24];
    v69 = [v68 objectForKeyedSubscript:v34];
    v70 = [v69 objectForKeyedSubscript:@"TxCompletion Latency"];
    v71 = [v70 objectForKeyedSubscript:@"Completion Latency Vo"];

    if (v71) {
      sub_100027A50(v22, v23, v308, a6, v315, @"NWAAWDLIS_txLatencyVOs", v24, v34, @"Completion Latency Vo");
    }
    v72 = [v22 objectForKeyedSubscript:v24];
    v73 = [v72 objectForKeyedSubscript:v34];
    v74 = [v73 objectForKeyedSubscript:@"TxCompletion Latency"];
    v75 = [v74 objectForKeyedSubscript:@"Completion Latency Vi"];

    if (v75) {
      sub_100027A50(v22, v23, v308, a6, v315, @"NWAAWDLIS_txLatencyVIs", v24, v34, @"Completion Latency Vi");
    }
    int v35 = 0;
  }
  else
  {
LABEL_16:

LABEL_17:
    __int16 v31 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v32 = [v22 objectForKeyedSubscript:v24];
      __int16 v33 = [v32 allKeys];
      *(_DWORD *)v331 = 136446722;
      v332 = "void populateNWActivityAWDLInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulato"
             "rMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, N"
             "SDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v333 = 1024;
      int v334 = 1088;
      __int16 v335 = 2112;
      v336 = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find group Interface awdlX:... we have %@", v331, 0x1Cu);
    }
    id v34 = 0;
    int v35 = 1;
  }
  if (v35)
  {
    v76 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v331 = 136446466;
      v332 = "void populateNWActivityAWDLInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulato"
             "rMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, N"
             "SDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v333 = 1024;
      int v334 = 1159;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", v331, 0x12u);
    }
  }
  objc_destroyWeak(&v330);

  id contexta = v287;
  v77 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v77))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v77, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "populateNWActivityAWDLInterfaceStats", "", buf, 2u);
  }

  v78 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v78))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v78, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "populateNWActivityAPInterfaceStats", "", buf, 2u);
  }

  v79 = [v305 fieldForKey:@"NWA_apIfStats"];
  [v79 subMessageValue];
  v284 = v79;
  id v80 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&v330, val);
  id v316 = v315;
  id v300 = v299;
  id v81 = v22;
  id v309 = objc_loadWeakRetained(&v330);
  id v82 = v80;
  v83 = sub_100025E34(v81);
  long long v328 = 0u;
  long long v329 = 0u;
  *(_OWORD *)v326 = 0u;
  long long v327 = 0u;
  v84 = [v81 objectForKeyedSubscript:v83];
  v85 = [v84 allKeys];

  v86 = (char *)[v85 countByEnumeratingWithState:v326 objects:buf count:16];
  if (v86)
  {
    uint64_t v87 = *(void *)v327;
    while (2)
    {
      for (i = 0; i != v86; ++i)
      {
        if (*(void *)v327 != v87) {
          objc_enumerationMutation(v85);
        }
        v89 = (void *)*((void *)v326[1] + i);
        if ([v89 containsString:@"Interface ap"]
          && ([v89 containsString:@"Peer"] & 1) == 0)
        {
          id v90 = v89;

          if (v90)
          {
            v91 = [v82 fieldForKey:@"NWAAPIS_role"];
            v92 = [v91 stringValue];
            unsigned __int8 v93 = [v92 isEqualToString:v90];

            if ((v93 & 1) == 0)
            {
              v94 = WALogCategoryDefaultHandle();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v331 = 136446466;
                v332 = "void populateNWActivityAPInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporter"
                       "PopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _N"
                       "onnull __strong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
                __int16 v333 = 1024;
                int v334 = 1195;
                _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting AP Interface", v331, 0x12u);
              }

              v95 = [v82 fieldForKey:@"NWAAPIS_role"];
              [v95 setStringValue:v90];
            }
            v96 = [v81 objectForKeyedSubscript:v83];
            v97 = [v96 objectForKeyedSubscript:v90];
            v98 = [v97 objectForKeyedSubscript:@"Manager Config"];

            if (v98)
            {
              sub_100026048(v81, v82, @"NWAAPIS_enabled", v83, v90, @"Manager Config", @"Enabled");
              sub_100026048(v81, v82, @"NWAAPIS_peerCount", v83, v90, @"Manager Config", @"Peer Count");
              sub_100026048(v81, v82, @"NWAAPIS_peersAdded", v83, v90, @"Manager Config", @"Peers Added");
              sub_100026048(v81, v82, @"NWAAPIS_peersRemoved", v83, v90, @"Manager Config", @"Peers Removed");
            }
            v99 = [v81 objectForKeyedSubscript:v83];
            v100 = [v99 objectForKeyedSubscript:v90];
            v101 = [v100 objectForKeyedSubscript:@"Data Bytes"];

            if (v101)
            {
              sub_1000266BC(v81, v82, v309, a6, v316, 0, @"NWAAPIS_bytes", v83, v90, @"Data Bytes", @"Rx Bytes");
              sub_1000266BC(v81, v82, v309, a6, v316, 3u, @"NWAAPIS_bytes", v83, v90, @"Data Bytes", @"BE Tx Bytes");
              sub_1000266BC(v81, v82, v309, a6, v316, 2u, @"NWAAPIS_bytes", v83, v90, @"Data Bytes", @"BK Tx Bytes");
              sub_1000266BC(v81, v82, v309, a6, v316, 5u, @"NWAAPIS_bytes", v83, v90, @"Data Bytes", @"VI Tx Bytes");
              sub_1000266BC(v81, v82, v309, a6, v316, 4u, @"NWAAPIS_bytes", v83, v90, @"Data Bytes", @"VO Tx Bytes");
              sub_1000266BC(v81, v82, v309, a6, v316, 1u, @"NWAAPIS_bytes", v83, v90, @"Data Bytes", @"Tx Bytes");
            }
            v102 = [v81 objectForKeyedSubscript:v83];
            v103 = [v102 objectForKeyedSubscript:v90];
            v104 = [v103 objectForKeyedSubscript:@"Data Packets"];

            if (v104)
            {
              sub_1000266BC(v81, v82, v309, a6, v316, 0, @"NWAAPIS_packets", v83, v90, @"Data Packets", @"Rx Packets");
              sub_1000266BC(v81, v82, v309, a6, v316, 3u, @"NWAAPIS_packets", v83, v90, @"Data Packets", @"BE Tx Packets");
              sub_1000266BC(v81, v82, v309, a6, v316, 2u, @"NWAAPIS_packets", v83, v90, @"Data Packets", @"BK Tx Packets");
              sub_1000266BC(v81, v82, v309, a6, v316, 5u, @"NWAAPIS_packets", v83, v90, @"Data Packets", @"VI Tx Packets");
              sub_1000266BC(v81, v82, v309, a6, v316, 4u, @"NWAAPIS_packets", v83, v90, @"Data Packets", @"VO Tx Packets");
              sub_1000266BC(v81, v82, v309, a6, v316, 1u, @"NWAAPIS_packets", v83, v90, @"Data Packets", @"Tx Packets");
            }
            v105 = [v81 objectForKeyedSubscript:v83];
            v106 = [v105 objectForKeyedSubscript:v90];
            v107 = [v106 objectForKeyedSubscript:@"Manager Config"];

            if (v107)
            {
              sub_10002620C(v81, v82, v309, a6, v316, @"NWAAPIS_npeers", v83, v90, @"Manager Config", @"Peer Count State");
              sub_10002620C(v81, v82, v309, a6, v316, @"NWAAPIS_enableStates", v83, v90, @"Manager Config", @"Enabled State");
            }
            v108 = [v81 objectForKeyedSubscript:v83];
            v109 = [v108 objectForKeyedSubscript:v90];
            v110 = [v109 objectForKeyedSubscript:@"TxCompletion Latency"];
            v111 = [v110 objectForKeyedSubscript:@"Completion Latency Be"];

            if (v111) {
              sub_100027A50(v81, v82, v309, a6, v316, @"NWAAPIS_txLatencyBEs", v83, v90, @"Completion Latency Be");
            }
            v112 = [v81 objectForKeyedSubscript:v83];
            v113 = [v112 objectForKeyedSubscript:v90];
            v114 = [v113 objectForKeyedSubscript:@"TxCompletion Latency"];
            v115 = [v114 objectForKeyedSubscript:@"Completion Latency Bk"];

            if (v115) {
              sub_100027A50(v81, v82, v309, a6, v316, @"NWAAPIS_txLatencyBKs", v83, v90, @"Completion Latency Bk");
            }
            v116 = [v81 objectForKeyedSubscript:v83];
            v117 = [v116 objectForKeyedSubscript:v90];
            v118 = [v117 objectForKeyedSubscript:@"TxCompletion Latency"];
            v119 = [v118 objectForKeyedSubscript:@"Completion Latency Vo"];

            if (v119) {
              sub_100027A50(v81, v82, v309, a6, v316, @"NWAAPIS_txLatencyVOs", v83, v90, @"Completion Latency Vo");
            }
            v120 = [v81 objectForKeyedSubscript:v83];
            v121 = [v120 objectForKeyedSubscript:v90];
            v122 = [v121 objectForKeyedSubscript:@"TxCompletion Latency"];
            v123 = [v122 objectForKeyedSubscript:@"Completion Latency Vi"];

            if (v123) {
              sub_100027A50(v81, v82, v309, a6, v316, @"NWAAPIS_txLatencyVIs", v83, v90, @"Completion Latency Vi");
            }
          }
          goto LABEL_90;
        }
      }
      v86 = (char *)[v85 countByEnumeratingWithState:v326 objects:buf count:16];
      if (v86) {
        continue;
      }
      break;
    }
  }

  id v90 = 0;
LABEL_90:

  objc_destroyWeak(&v330);
  id contextb = contexta;

  v124 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v124))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v124, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "populateNWActivityAPInterfaceStats", "", buf, 2u);
  }

  v125 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v125))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v125, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "populateNWActivityIRInterfaceStats", "", buf, 2u);
  }

  v126 = [v305 fieldForKey:@"NWA_irIfStats"];
  [v126 subMessageValue];
  v285 = v126;
  id v127 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&v330, val);
  id v317 = v316;
  id v301 = v300;
  id v128 = v81;
  id v310 = objc_loadWeakRetained(&v330);
  id v129 = v127;
  v130 = sub_100025E34(v128);
  long long v328 = 0u;
  long long v329 = 0u;
  *(_OWORD *)v326 = 0u;
  long long v327 = 0u;
  v131 = [v128 objectForKeyedSubscript:v130];
  v132 = [v131 allKeys];

  v133 = (char *)[v132 countByEnumeratingWithState:v326 objects:buf count:16];
  if (v133)
  {
    uint64_t v134 = *(void *)v327;
    while (2)
    {
      for (j = 0; j != v133; ++j)
      {
        if (*(void *)v327 != v134) {
          objc_enumerationMutation(v132);
        }
        v136 = (void *)*((void *)v326[1] + (void)j);
        if ([v136 containsString:@"Interface ir"]
          && ([v136 containsString:@"Peer"] & 1) == 0)
        {
          id v137 = v136;

          if (v137)
          {
            v138 = [v129 fieldForKey:@"NWAIRIS_role"];
            v139 = [v138 stringValue];
            unsigned __int8 v140 = [v139 isEqualToString:v137];

            if ((v140 & 1) == 0)
            {
              v141 = WALogCategoryDefaultHandle();
              if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v331 = 136446466;
                v332 = "void populateNWActivityIRInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporter"
                       "PopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _N"
                       "onnull __strong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
                __int16 v333 = 1024;
                int v334 = 1284;
                _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting IR Interface", v331, 0x12u);
              }

              v142 = [v129 fieldForKey:@"NWAIRIS_role"];
              [v142 setStringValue:v137];
            }
            v143 = [v128 objectForKeyedSubscript:v130];
            v144 = [v143 objectForKeyedSubscript:v137];
            v145 = [v144 objectForKeyedSubscript:@"Manager Config"];

            if (v145)
            {
              sub_100026048(v128, v129, @"NWAIRIS_enabled", v130, v137, @"Manager Config", @"Enabled");
              sub_100026048(v128, v129, @"NWAIRIS_peerCount", v130, v137, @"Manager Config", @"Peer Count");
              sub_100026048(v128, v129, @"NWAIRIS_peersAdded", v130, v137, @"Manager Config", @"Peers Added");
              sub_100026048(v128, v129, @"NWAIRIS_peersRemoved", v130, v137, @"Manager Config", @"Peers Removed");
            }
            v146 = [v128 objectForKeyedSubscript:v130];
            v147 = [v146 objectForKeyedSubscript:v137];
            v148 = [v147 objectForKeyedSubscript:@"Data Bytes"];

            if (v148)
            {
              sub_1000266BC(v128, v129, v310, a6, v317, 0, @"NWAIRIS_bytes", v130, v137, @"Data Bytes", @"Rx Bytes");
              sub_1000266BC(v128, v129, v310, a6, v317, 3u, @"NWAIRIS_bytes", v130, v137, @"Data Bytes", @"BE Tx Bytes");
              sub_1000266BC(v128, v129, v310, a6, v317, 2u, @"NWAIRIS_bytes", v130, v137, @"Data Bytes", @"BK Tx Bytes");
              sub_1000266BC(v128, v129, v310, a6, v317, 5u, @"NWAIRIS_bytes", v130, v137, @"Data Bytes", @"VI Tx Bytes");
              sub_1000266BC(v128, v129, v310, a6, v317, 4u, @"NWAIRIS_bytes", v130, v137, @"Data Bytes", @"VO Tx Bytes");
              sub_1000266BC(v128, v129, v310, a6, v317, 1u, @"NWAIRIS_bytes", v130, v137, @"Data Bytes", @"Tx Bytes");
            }
            v149 = [v128 objectForKeyedSubscript:v130];
            v150 = [v149 objectForKeyedSubscript:v137];
            v151 = [v150 objectForKeyedSubscript:@"Data Packets"];

            if (v151)
            {
              sub_1000266BC(v128, v129, v310, a6, v317, 0, @"NWAIRIS_packets", v130, v137, @"Data Packets", @"Rx Packets");
              sub_1000266BC(v128, v129, v310, a6, v317, 3u, @"NWAIRIS_packets", v130, v137, @"Data Packets", @"BE Tx Packets");
              sub_1000266BC(v128, v129, v310, a6, v317, 2u, @"NWAIRIS_packets", v130, v137, @"Data Packets", @"BK Tx Packets");
              sub_1000266BC(v128, v129, v310, a6, v317, 5u, @"NWAIRIS_packets", v130, v137, @"Data Packets", @"VI Tx Packets");
              sub_1000266BC(v128, v129, v310, a6, v317, 4u, @"NWAIRIS_packets", v130, v137, @"Data Packets", @"VO Tx Packets");
              sub_1000266BC(v128, v129, v310, a6, v317, 1u, @"NWAIRIS_packets", v130, v137, @"Data Packets", @"Tx Packets");
            }
            v152 = [v128 objectForKeyedSubscript:v130];
            v153 = [v152 objectForKeyedSubscript:v137];
            v154 = [v153 objectForKeyedSubscript:@"Manager Config"];

            if (v154)
            {
              sub_10002620C(v128, v129, v310, a6, v317, @"NWAIRIS_npeers", v130, v137, @"Manager Config", @"Peer Count State");
              sub_10002620C(v128, v129, v310, a6, v317, @"NWAIRIS_enableStates", v130, v137, @"Manager Config", @"Enabled State");
            }
            v155 = [v128 objectForKeyedSubscript:v130];
            v156 = [v155 objectForKeyedSubscript:v137];
            v157 = [v156 objectForKeyedSubscript:@"TxCompletion Latency"];
            v158 = [v157 objectForKeyedSubscript:@"Completion Latency Be"];

            if (v158) {
              sub_100027A50(v128, v129, v310, a6, v317, @"NWAIRIS_txLatencyBEs", v130, v137, @"Completion Latency Be");
            }
            v159 = [v128 objectForKeyedSubscript:v130];
            v160 = [v159 objectForKeyedSubscript:v137];
            v161 = [v160 objectForKeyedSubscript:@"TxCompletion Latency"];
            v162 = [v161 objectForKeyedSubscript:@"Completion Latency Bk"];

            if (v162) {
              sub_100027A50(v128, v129, v310, a6, v317, @"NWAIRIS_txLatencyBKs", v130, v137, @"Completion Latency Bk");
            }
            v163 = [v128 objectForKeyedSubscript:v130];
            v164 = [v163 objectForKeyedSubscript:v137];
            v165 = [v164 objectForKeyedSubscript:@"TxCompletion Latency"];
            v166 = [v165 objectForKeyedSubscript:@"Completion Latency Vo"];

            if (v166) {
              sub_100027A50(v128, v129, v310, a6, v317, @"NWAIRIS_txLatencyVOs", v130, v137, @"Completion Latency Vo");
            }
            v167 = [v128 objectForKeyedSubscript:v130];
            v168 = [v167 objectForKeyedSubscript:v137];
            v169 = [v168 objectForKeyedSubscript:@"TxCompletion Latency"];
            v170 = [v169 objectForKeyedSubscript:@"Completion Latency Vi"];

            if (v170) {
              sub_100027A50(v128, v129, v310, a6, v317, @"NWAIRIS_txLatencyVIs", v130, v137, @"Completion Latency Vi");
            }
          }
          goto LABEL_125;
        }
      }
      v133 = (char *)[v132 countByEnumeratingWithState:v326 objects:buf count:16];
      if (v133) {
        continue;
      }
      break;
    }
  }

  id v137 = 0;
LABEL_125:

  objc_destroyWeak(&v330);
  id contextc = contextb;

  v171 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v171))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v171, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "populateNWActivityIRInterfaceStats", "", buf, 2u);
  }

  v172 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v172))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v172, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "populateNWActivityNANInterfaceStats", "", buf, 2u);
  }

  v173 = [v305 fieldForKey:@"NWA_nanIfStats"];
  [v173 subMessageValue];
  v286 = v173;
  id v174 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&v330, val);
  id v318 = v317;
  id v302 = v301;
  id v175 = v128;
  id v311 = objc_loadWeakRetained(&v330);
  id v176 = v174;
  v177 = sub_100025E34(v175);
  long long v328 = 0u;
  long long v329 = 0u;
  *(_OWORD *)v326 = 0u;
  long long v327 = 0u;
  v178 = [v175 objectForKeyedSubscript:v177];
  v179 = [v178 allKeys];

  v180 = (char *)[v179 countByEnumeratingWithState:v326 objects:buf count:16];
  if (v180)
  {
    uint64_t v181 = *(void *)v327;
    while (2)
    {
      for (k = 0; k != v180; ++k)
      {
        if (*(void *)v327 != v181) {
          objc_enumerationMutation(v179);
        }
        v183 = (void *)*((void *)v326[1] + (void)k);
        if ([v183 containsString:@"Interface nan"]
          && ([v183 containsString:@"Peer"] & 1) == 0)
        {
          id v184 = v183;

          if (v184)
          {
            v185 = [v176 fieldForKey:@"NWANANIS_role"];
            v186 = [v185 stringValue];
            unsigned __int8 v187 = [v186 isEqualToString:v184];

            if ((v187 & 1) == 0)
            {
              v188 = WALogCategoryDefaultHandle();
              if (os_log_type_enabled(v188, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v331 = 136446466;
                v332 = "void populateNWActivityNANInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporte"
                       "rPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _"
                       "Nonnull __strong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
                __int16 v333 = 1024;
                int v334 = 1373;
                _os_log_impl((void *)&_mh_execute_header, v188, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Setting NAN Interface", v331, 0x12u);
              }

              v189 = [v176 fieldForKey:@"NWANANIS_role"];
              [v189 setStringValue:v184];
            }
            v190 = [v175 objectForKeyedSubscript:v177];
            v191 = [v190 objectForKeyedSubscript:v184];
            v192 = [v191 objectForKeyedSubscript:@"Manager Config"];

            if (v192)
            {
              sub_100026048(v175, v176, @"NWANANIS_enabled", v177, v184, @"Manager Config", @"Enabled");
              sub_100026048(v175, v176, @"NWANANIS_peerCount", v177, v184, @"Manager Config", @"Peer Count");
              sub_100026048(v175, v176, @"NWANANIS_peersAdded", v177, v184, @"Manager Config", @"Peers Added");
              sub_100026048(v175, v176, @"NWANANIS_peersRemoved", v177, v184, @"Manager Config", @"Peers Removed");
            }
            v193 = [v175 objectForKeyedSubscript:v177];
            v194 = [v193 objectForKeyedSubscript:v184];
            v195 = [v194 objectForKeyedSubscript:@"Data Bytes"];

            if (v195)
            {
              sub_1000266BC(v175, v176, v311, a6, v318, 0, @"NWANANIS_bytes", v177, v184, @"Data Bytes", @"Rx Bytes");
              sub_1000266BC(v175, v176, v311, a6, v318, 3u, @"NWANANIS_bytes", v177, v184, @"Data Bytes", @"BE Tx Bytes");
              sub_1000266BC(v175, v176, v311, a6, v318, 2u, @"NWANANIS_bytes", v177, v184, @"Data Bytes", @"BK Tx Bytes");
              sub_1000266BC(v175, v176, v311, a6, v318, 5u, @"NWANANIS_bytes", v177, v184, @"Data Bytes", @"VI Tx Bytes");
              sub_1000266BC(v175, v176, v311, a6, v318, 4u, @"NWANANIS_bytes", v177, v184, @"Data Bytes", @"VO Tx Bytes");
              sub_1000266BC(v175, v176, v311, a6, v318, 1u, @"NWANANIS_bytes", v177, v184, @"Data Bytes", @"Tx Bytes");
            }
            v196 = [v175 objectForKeyedSubscript:v177];
            v197 = [v196 objectForKeyedSubscript:v184];
            v198 = [v197 objectForKeyedSubscript:@"Data Packets"];

            if (v198)
            {
              sub_1000266BC(v175, v176, v311, a6, v318, 0, @"NWANANIS_packets", v177, v184, @"Data Packets", @"Rx Packets");
              sub_1000266BC(v175, v176, v311, a6, v318, 3u, @"NWANANIS_packets", v177, v184, @"Data Packets", @"BE Tx Packets");
              sub_1000266BC(v175, v176, v311, a6, v318, 2u, @"NWANANIS_packets", v177, v184, @"Data Packets", @"BK Tx Packets");
              sub_1000266BC(v175, v176, v311, a6, v318, 5u, @"NWANANIS_packets", v177, v184, @"Data Packets", @"VI Tx Packets");
              sub_1000266BC(v175, v176, v311, a6, v318, 4u, @"NWANANIS_packets", v177, v184, @"Data Packets", @"VO Tx Packets");
              sub_1000266BC(v175, v176, v311, a6, v318, 1u, @"NWANANIS_packets", v177, v184, @"Data Packets", @"Tx Packets");
            }
            v199 = [v175 objectForKeyedSubscript:v177];
            v200 = [v199 objectForKeyedSubscript:v184];
            v201 = [v200 objectForKeyedSubscript:@"Manager Config"];

            if (v201)
            {
              sub_10002620C(v175, v176, v311, a6, v318, @"NWANANIS_npeers", v177, v184, @"Manager Config", @"Peer Count State");
              sub_10002620C(v175, v176, v311, a6, v318, @"NWANANIS_enableStates", v177, v184, @"Manager Config", @"Enabled State");
            }
            v202 = [v175 objectForKeyedSubscript:v177];
            v203 = [v202 objectForKeyedSubscript:v184];
            v204 = [v203 objectForKeyedSubscript:@"TxCompletion Latency"];
            v205 = [v204 objectForKeyedSubscript:@"Completion Latency Be"];

            if (v205) {
              sub_100027A50(v175, v176, v311, a6, v318, @"NWANANIS_txLatencyBEs", v177, v184, @"Completion Latency Be");
            }
            v206 = [v175 objectForKeyedSubscript:v177];
            v207 = [v206 objectForKeyedSubscript:v184];
            v208 = [v207 objectForKeyedSubscript:@"TxCompletion Latency"];
            v209 = [v208 objectForKeyedSubscript:@"Completion Latency Bk"];

            if (v209) {
              sub_100027A50(v175, v176, v311, a6, v318, @"NWANANIS_txLatencyBKs", v177, v184, @"Completion Latency Bk");
            }
            v210 = [v175 objectForKeyedSubscript:v177];
            v211 = [v210 objectForKeyedSubscript:v184];
            v212 = [v211 objectForKeyedSubscript:@"TxCompletion Latency"];
            v213 = [v212 objectForKeyedSubscript:@"Completion Latency Vo"];

            if (v213) {
              sub_100027A50(v175, v176, v311, a6, v318, @"NWANANIS_txLatencyVOs", v177, v184, @"Completion Latency Vo");
            }
            v214 = [v175 objectForKeyedSubscript:v177];
            v215 = [v214 objectForKeyedSubscript:v184];
            v216 = [v215 objectForKeyedSubscript:@"TxCompletion Latency"];
            v217 = [v216 objectForKeyedSubscript:@"Completion Latency Vi"];

            if (v217) {
              sub_100027A50(v175, v176, v311, a6, v318, @"NWANANIS_txLatencyVIs", v177, v184, @"Completion Latency Vi");
            }
          }
          goto LABEL_160;
        }
      }
      v180 = (char *)[v179 countByEnumeratingWithState:v326 objects:buf count:16];
      if (v180) {
        continue;
      }
      break;
    }
  }

  id v184 = 0;
LABEL_160:

  objc_destroyWeak(&v330);
  id v218 = contextc;

  v219 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v219))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v219, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "populateNWActivityNANInterfaceStats", "", buf, 2u);
  }

  v220 = [v305 fieldForKey:@"NWA_controllerStats"];
  contextd = [v220 subMessageValue];

  v221 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v221))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v221, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "nwActivityIteratorblock", "", buf, 2u);
  }

  v222 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v222))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v222, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "populateNWActivityControllerStats", "", buf, 2u);
  }

  id v323 = v218;
  sub_10000B37C(contextd, val, a6, v318, v302, v175, &v323);
  id v223 = v323;

  v224 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v224))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v224, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "populateNWActivityControllerStats", "", buf, 2u);
  }

  v225 = [v305 fieldForKey:@"NWA_linkQualSample"];
  v226 = [v225 subMessageValue];
  id v322 = v223;
  sub_10000FDC8(v226, v318, v302, v175, &v322);
  id v291 = v322;

  id v227 = v305;
  objc_initWeak(v326, val);
  id v319 = v318;
  id v306 = v302;
  id v228 = v175;
  id WeakRetained = objc_loadWeakRetained(v326);
  v229 = sub_100025E34(v228);
  v230 = 0;
  uint64_t v231 = 0;
  char v232 = 1;
  while (1)
  {
    char v233 = v232;
    id v234 = [objc_alloc((Class)NSString) initWithFormat:@"WiFi Quality Score Slice %lu", v231];

    v235 = [v228 objectForKeyedSubscript:v229];
    v230 = v234;
    v236 = [v235 objectForKeyedSubscript:v234];
    BOOL v237 = v236 == 0;

    if (v237) {
      goto LABEL_175;
    }
    v238 = [v228 objectForKeyedSubscript:v229];
    v239 = [v238 objectForKeyedSubscript:v234];
    v240 = [v239 objectForKeyedSubscript:@"Counters"];
    BOOL v241 = v240 == 0;

    if (v241) {
      break;
    }
    v242 = [v227 fieldForKey:@"NWA_scores"];
    v243 = [v242 repeatableValues];
    BOOL v244 = v243 == 0;

    if (v244)
    {
      v245 = [WeakRetained getNewMessageForKey:@"QS" groupType:a6 forProcessWithToken:v319];
      v246 = [v227 fieldForKey:@"NWA_scores"];
      [v246 addRepeatableSubMessageValue:v245];

      v247 = [v227 fieldForKey:@"NWA_scores"];
      id v248 = [v245 copy];
      [v247 addRepeatableSubMessageValue:v248];
    }
    v249 = [v227 fieldForKey:@"NWA_scores"];
    v250 = [v249 repeatableValues];
    v251 = [v250 objectAtIndex:v231];

    if (!v251)
    {
      v278 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v338 = "void populateNWActivityQualityScore(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMes"
               "sageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSD"
               "ictionary * _Nonnull __strong)";
        __int16 v339 = 1024;
        int v340 = 2380;
        _os_log_impl((void *)&_mh_execute_header, v278, OS_LOG_TYPE_ERROR, "%{public}s::%d:Bad sliceSpecificMessage", buf, 0x12u);
      }
      goto LABEL_201;
    }
    sub_100026048(v228, v251, @"QS_channelQuality", v229, v230, @"Counters", @"Channel Quality Score");
    sub_100026048(v228, v251, @"QS_txLoss", v229, v230, @"Counters", @"Tx Loss Score");
    sub_100026048(v228, v251, @"QS_rxLoss", v229, v230, @"Counters", @"Rx Loss Score");
    sub_100026048(v228, v251, @"QS_txLatency", v229, v230, @"Counters", @"Tx Latency Score");
    sub_100026048(v228, v251, @"QS_rxLatency", v229, v230, @"Counters", @"Rx Latency Score");

LABEL_175:
    char v232 = 0;
    char v252 = 0;
    uint64_t v231 = 1;
    if ((v233 & 1) == 0) {
      goto LABEL_176;
    }
  }
  v278 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR))
  {
    v279 = [v228 objectForKeyedSubscript:v229];
    v280 = [v279 objectForKeyedSubscript:v230];
    v281 = [v280 allKeys];
    *(_DWORD *)buf = 136446722;
    v338 = "void populateNWActivityQualityScore(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMessage"
           "Delegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDictionar"
           "y * _Nonnull __strong)";
    __int16 v339 = 1024;
    int v340 = 2369;
    __int16 v341 = 2112;
    v342 = v281;
    _os_log_impl((void *)&_mh_execute_header, v278, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup with contains Counters, we have %@", buf, 0x1Cu);
  }
LABEL_201:

  char v252 = 1;
LABEL_176:

  if (v252)
  {
    v253 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v253, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v338 = "void populateNWActivityQualityScore(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMessa"
             "geDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDicti"
             "onary * _Nonnull __strong)";
      __int16 v339 = 1024;
      int v340 = 2394;
      _os_log_impl((void *)&_mh_execute_header, v253, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", buf, 0x12u);
    }
  }
  objc_destroyWeak(v326);

  id v254 = v227;
  objc_initWeak(v326, val);
  id v320 = v319;
  id v307 = v306;
  id v255 = v228;
  id v313 = objc_loadWeakRetained(v326);
  v256 = sub_100025E34(v255);
  uint64_t v257 = 0;
  char v258 = 1;
  while (2)
  {
    char v259 = v258;
    id v260 = [objc_alloc((Class)NSString) initWithFormat:@"BT LE Connection Stats Slice %lu", v257];
    v261 = [v255 objectForKeyedSubscript:v256];
    v262 = [v261 objectForKeyedSubscript:v260];
    BOOL v263 = v262 == 0;

    if (v263)
    {
LABEL_186:

      char v258 = 0;
      char v274 = 0;
      uint64_t v257 = 1;
      if ((v259 & 1) == 0) {
        goto LABEL_187;
      }
      continue;
    }
    break;
  }
  v264 = [v254 fieldForKey:@"NWA_btleConnections"];
  v265 = [v264 repeatableValues];
  BOOL v266 = v265 == 0;

  if (v266)
  {
    v267 = [v313 getNewMessageForKey:@"WFAAWDBTLECS" groupType:a6 forProcessWithToken:v320];
    v268 = [v254 fieldForKey:@"NWA_btleConnections"];
    [v268 addRepeatableSubMessageValue:v267];

    v269 = [v254 fieldForKey:@"NWA_btleConnections"];
    id v270 = [v267 copy];
    [v269 addRepeatableSubMessageValue:v270];
  }
  v271 = [v254 fieldForKey:@"NWA_btleConnections"];
  v272 = [v271 repeatableValues];
  v273 = [v272 objectAtIndex:v257];

  if (v273)
  {
    sub_100026048(v255, v273, @"WFAAWDBTLECS_start", v256, v260, @"Counters", @"BT LE Cnx Start");
    sub_100026048(v255, v273, @"WFAAWDBTLECS_complete", v256, v260, @"Counters", @"BT LE Cnx Complete");
    sub_100026048(v255, v273, @"WFAAWDBTLECS_peakOutage", v256, v260, @"Counters", @"BT LE Cnx Peak Outage");
    sub_100026048(v255, v273, @"WFAAWDBTLECS_totalDuration", v256, v260, @"Counters", @"BT LE Cnx Total Duration");
    sub_100026048(v255, v273, @"WFAAWDBTLECS_dc0", v256, v260, @"Counters", @"BT LE Cnx DC 0");
    sub_100026048(v255, v273, @"WFAAWDBTLECS_dc1", v256, v260, @"Counters", @"BT LE Cnx DC 1");
    sub_100026048(v255, v273, @"WFAAWDBTLECS_dc2", v256, v260, @"Counters", @"BT LE Cnx DC 2");
    sub_100026048(v255, v273, @"WFAAWDBTLECS_dc3", v256, v260, @"Counters", @"BT LE Cnx DC 3");
    sub_100026048(v255, v273, @"WFAAWDBTLECS_dc4", v256, v260, @"Counters", @"BT LE Cnx DC 4");
    sub_100026048(v255, v273, @"WFAAWDBTLECS_dc5", v256, v260, @"Counters", @"BT LE Cnx DC 5");

    goto LABEL_186;
  }
  v277 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v277, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v338 = "void populateNWActivityBTLEConnection(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMessa"
           "geDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDiction"
           "ary * _Nonnull __strong)";
    __int16 v339 = 1024;
    int v340 = 2325;
    _os_log_impl((void *)&_mh_execute_header, v277, OS_LOG_TYPE_ERROR, "%{public}s::%d:Bad sliceSpecificMessage", buf, 0x12u);
  }

  char v274 = 1;
LABEL_187:

  if (v274)
  {
    v275 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v275, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v338 = "void populateNWActivityBTLEConnection(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMes"
             "sageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDic"
             "tionary * _Nonnull __strong)";
      __int16 v339 = 1024;
      int v340 = 2345;
      _os_log_impl((void *)&_mh_execute_header, v275, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", buf, 0x12u);
    }
  }
  objc_destroyWeak(v326);

  v276 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v276))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v276, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "nwActivityIteratorblock", "", buf, 2u);
  }

  v292[2](v292, v254, v291);

  objc_destroyWeak(&location);
}

void sub_100009858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28,id location,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
}

void sub_100009940(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v115 = a1;
  objc_initWeak(&location, a2);
  id v120 = a4;
  id v114 = a5;
  id v125 = a6;
  id v130 = a7;
  id v119 = objc_loadWeakRetained(&location);
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  v13 = [v115 fieldForKey:@"NWA_interfaceStats"];
  id v14 = [v13 repeatableValues];

  id v15 = [v14 countByEnumeratingWithState:&v136 objects:v150 count:16];
  if (!v15)
  {

    v131 = 0;
LABEL_13:
    v24 = [v119 getNewMessageForKey:@"NWAIS" groupType:a3 forProcessWithToken:v120];

    v25 = [v115 fieldForKey:@"NWA_interfaceStats"];
    [v25 addRepeatableSubMessageValue:v24];

    if ([v130 hasSuffix:v130])
    {
      v26 = [v24 fieldForKey:@"NWAIS_role"];
      [v26 setStringValue:v130];
    }
    v131 = v24;
    goto LABEL_16;
  }
  v131 = 0;
  char v16 = 0;
  uint64_t v17 = *(void *)v137;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v137 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v136 + 1) + 8 * i);
      v20 = [v19 fieldForKey:@"NWAIS_role"];
      id v21 = [v20 stringValue];
      unsigned int v22 = [v21 isEqualToString:v130];

      if (v22)
      {
        id v23 = v19;

        char v16 = 1;
        v131 = v23;
      }
    }
    id v15 = [v14 countByEnumeratingWithState:&v136 objects:v150 count:16];
  }
  while (v15);

  if ((v16 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_16:
  id v27 = [v131 fieldForKey:@"NWAIS_role"];
  uint64_t v28 = [v27 stringValue];
  unsigned int v29 = [v28 isEqualToString:v130];

  v30 = &AnalyticsSendEventLazy_ptr;
  if (v29)
  {
    id v31 = v131;
    id v121 = v120;
    id v126 = v130;
    id v123 = v114;
    id v32 = v125;
    v116 = v31;
    __int16 v33 = [v31 fieldForKey:@"NWAIS_assoc"];
    id obj = [v33 subMessageValue];

    id v34 = +[NSString stringWithFormat:@"Interface %@", v126];
    int v35 = sub_100025E34(v32);
    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    v36 = [v32 objectForKeyedSubscript:v35];
    __int16 v37 = [v36 allKeys];

    id v38 = [v37 countByEnumeratingWithState:&v145 objects:v165 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v146;
LABEL_19:
      uint64_t v40 = 0;
      while (1)
      {
        if (*(void *)v146 != v39) {
          objc_enumerationMutation(v37);
        }
        v41 = *(void **)(*((void *)&v145 + 1) + 8 * v40);
        if ([v41 isEqualToString:v34]) {
          break;
        }
        if (v38 == (id)++v40)
        {
          id v38 = [v37 countByEnumeratingWithState:&v145 objects:v165 count:16];
          if (v38) {
            goto LABEL_19;
          }
          goto LABEL_25;
        }
      }
      id v45 = v41;

      if (!v45) {
        goto LABEL_26;
      }
      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      v46 = [v32 objectForKeyedSubscript:v35];
      v47 = [v46 objectForKeyedSubscript:v45];
      v48 = [v47 allKeys];

      id v49 = [v48 countByEnumeratingWithState:&v141 objects:buf count:16];
      if (!v49)
      {
LABEL_38:

        v30 = &AnalyticsSendEventLazy_ptr;
LABEL_39:
        v42 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v53 = [v32 objectForKeyedSubscript:v35];
          v54 = [v53 objectForKeyedSubscript:v45];
          v55 = [v54 allKeys];
          *(_DWORD *)v151 = 136446722;
          v152 = "void populateNWActivityInterfaceAssocStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPop"
                 "ulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSString * _Nonnull __stro"
                 "ng, NSDictionary * _Nonnull __strong, NSDictionary * _Nonnull __strong)";
          __int16 v153 = 1024;
          int v154 = 856;
          __int16 v155 = 2112;
          v156 = v55;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup, we have %@", v151, 0x1Cu);
        }
        goto LABEL_41;
      }
      uint64_t v50 = *(void *)v142;
LABEL_32:
      uint64_t v51 = 0;
      while (1)
      {
        if (*(void *)v142 != v50) {
          objc_enumerationMutation(v48);
        }
        v52 = *(void **)(*((void *)&v141 + 1) + 8 * v51);
        if ([v52 containsString:@"Association Join Counters"]) {
          break;
        }
        if (v49 == (id)++v51)
        {
          id v49 = [v48 countByEnumeratingWithState:&v141 objects:buf count:16];
          if (v49) {
            goto LABEL_32;
          }
          goto LABEL_38;
        }
      }
      id v57 = v52;

      v30 = &AnalyticsSendEventLazy_ptr;
      if (!v57) {
        goto LABEL_39;
      }
      sub_100026048(v32, obj, @"NWAA_authSuccess", v35, v45, v57, @"Auth Success");
      sub_100026048(v32, obj, @"NWAA_authFailed", v35, v45, v57, @"Auth Failed");
      sub_100026048(v32, obj, @"NWAA_assocSuccess", v35, v45, v57, @"Assoc Success");
      sub_100026048(v32, obj, @"NWAA_assocFailed", v35, v45, v57, @"Assoc Failed");
      sub_100026048(v32, obj, @"NWAA_reassocSuccess", v35, v45, v57, @"Reassoc Success");
      sub_100026048(v32, obj, @"NWAA_reassocFailed", v35, v45, v57, @"Reassoc Failed");
      sub_100026048(v32, obj, @"NWAA_linkChanged", v35, v45, v57, @"Link Changed");
      sub_100026048(v32, obj, @"NWAA_roamSuccess", v35, v45, v57, @"Roam Success");
      sub_100026048(v32, obj, @"NWAA_roamFailed", v35, v45, v57, @"Roam Failed");
      sub_100026048(v32, obj, @"NWAA_assocDoneSuccess", v35, v45, v57, @"Assoc Done Success");
      sub_100026048(v32, obj, @"NWAA_assocDoneFailed", v35, v45, v57, @"Assoc Done Failed");
      sub_100026048(v32, obj, @"NWAA_assocReady", v35, v45, v57, @"Assoc Ready");
      sub_100026048(v32, obj, @"NWAA_ssidChanged", v35, v45, v57, @"SSID Changed");
      sub_100026048(v32, obj, @"NWAA_bssidChanged", v35, v45, v57, @"BSSID Changed");
      sub_100026048(v32, obj, @"NWAA_deauthReceived", v35, v45, v57, @"Deauth Received");
      sub_100026048(v32, obj, @"NWAA_disassocReceived", v35, v45, v57, @"Dissasoc Received");
      sub_100026048(v32, obj, @"NWAA_decryptError", v35, v45, v57, @"Decrypt Error");
      sub_100026048(v32, obj, @"NWAA_pruned", v35, v45, v57, @"Pruned");
      sub_100026048(v32, obj, @"NWAA_supplicant", v35, v45, v57, @"Supplicant");
      sub_100026048(v32, obj, @"NWAA_macAddrChanged", v35, v45, v57, @"MAC Addr Changed");
      sub_100026048(v32, obj, @"NWAA_rssiChanged", v35, v45, v57, @"RSSI Changed");
      sub_100026048(v32, obj, @"NWAA_homeChanQualChanged", v35, v45, v57, @"Home Channel Qual Changed");
      sub_100026048(v32, obj, @"NWAA_chanSwitchEvent", v35, v45, v57, @"Channel Switch Event");
      sub_100026048(v32, obj, @"NWAA_roamPrep", v35, v45, v57, @"Roam Prep");
      sub_100026048(v32, obj, @"NWAA_roamScanStart", v35, v45, v57, @"Roam Scan Start");
      sub_100026048(v32, obj, @"NWAA_roamScanEnd", v35, v45, v57, @"Roam Scan End");
      sub_100026048(v32, obj, @"NWAA_scanResults", v35, v45, v57, @"Scan Results");
      sub_100026048(v32, obj, @"NWAA_scanSummary", v35, v45, v57, @"Scan Summary");
      sub_100026048(v32, obj, @"NWAA_scanDone", v35, v45, v57, @"Scan Done");
      sub_100026048(v32, obj, @"NWAA_scanInternalDone", v35, v45, v57, @"Scan Internal Done");
      sub_100026048(v32, obj, @"NWAA_bssDisallowEvent", v35, v45, v57, @"BSS Disallow Event");
      sub_100026048(v32, obj, @"NWAA_slowWiFiSymptom", v35, v45, v57, @"Slow WiFi Symptom");
      sub_100026048(v32, obj, @"NWAA_dpsSymptom", v35, v45, v57, @"DPS Symptom");
      sub_100026048(v32, obj, @"NWAA_crashTracerTrig", v35, v45, v57, @"Crash Tracer Triggered");
      sub_100026048(v32, obj, @"NWAA_rc1Stats", v35, v45, v57, @"RC1 Stats");
      sub_100026048(v32, obj, @"NWAA_rc2Stats", v35, v45, v57, @"RC2 Stats");
      sub_100026048(v32, obj, @"NWAA_escoTrafficInd", v35, v45, v57, @"ESCO Traffic Indication");
    }
    else
    {
LABEL_25:

LABEL_26:
      v42 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = [v32 objectForKeyedSubscript:v35];
        v44 = [v43 allKeys];
        *(_DWORD *)buf = 136446978;
        v158 = "void populateNWActivityInterfaceAssocStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopul"
               "atorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSString * _Nonnull __strong, "
               "NSDictionary * _Nonnull __strong, NSDictionary * _Nonnull __strong)";
        __int16 v159 = 1024;
        int v160 = 847;
        __int16 v161 = 2112;
        v162 = v34;
        __int16 v163 = 2112;
        v164 = v44;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find group %@, we have %@", buf, 0x26u);
      }
      id v45 = 0;
LABEL_41:

      v56 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v151 = 136446466;
        v152 = "void populateNWActivityInterfaceAssocStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopul"
               "atorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSString * _Nonnull __strong, "
               "NSDictionary * _Nonnull __strong, NSDictionary * _Nonnull __strong)";
        __int16 v153 = 1024;
        int v154 = 904;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", v151, 0x12u);
      }

      id v57 = 0;
    }
  }
  v58 = [v30[294] stringWithFormat:@"Interface %@", v130];
  v124 = sub_100025E34(v125);
  id v59 = v58;
  v117 = [v30[294] stringWithFormat:@"Interface %@ Chip", v130];
  v122 = v59;
  if (v59)
  {
    v60 = [v125 objectForKeyedSubscript:v124];
    v61 = [v60 objectForKeyedSubscript:v122];
    v62 = [v61 objectForKeyedSubscript:@"Manager Config"];

    if (v62)
    {
      sub_100026048(v125, v131, @"NWAIS_enabled", v124, v122, @"Manager Config", @"Enabled");
      sub_10002620C(v125, v131, v119, a3, v120, @"NWAIS_enableStates", v124, v122, @"Manager Config", @"Enabled State");
    }
    else
    {
      v63 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v165 = 136446466;
        v166 = "void populateNWActivityInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorM"
               "essageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, N"
               "SDictionary * _Nonnull __strong, NSString * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v167 = 1024;
        int v168 = 966;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%{public}s::%d:Infra hasn't been enabled yet, rescan needed, continuing", v165, 0x12u);
      }
    }
    v64 = [v125 objectForKeyedSubscript:v124];
    v65 = [v64 objectForKeyedSubscript:v122];
    v66 = [v65 objectForKeyedSubscript:@"Data Bytes"];

    if (v66)
    {
      sub_1000266BC(v125, v131, v119, a3, v120, 0, @"NWAIS_bytes", v124, v122, @"Data Bytes", @"Rx Bytes");
      sub_1000266BC(v125, v131, v119, a3, v120, 3u, @"NWAIS_bytes", v124, v122, @"Data Bytes", @"BE Tx Bytes");
      sub_1000266BC(v125, v131, v119, a3, v120, 2u, @"NWAIS_bytes", v124, v122, @"Data Bytes", @"BK Tx Bytes");
      sub_1000266BC(v125, v131, v119, a3, v120, 5u, @"NWAIS_bytes", v124, v122, @"Data Bytes", @"VI Tx Bytes");
      sub_1000266BC(v125, v131, v119, a3, v120, 4u, @"NWAIS_bytes", v124, v122, @"Data Bytes", @"VO Tx Bytes");
      sub_1000266BC(v125, v131, v119, a3, v120, 1u, @"NWAIS_bytes", v124, v122, @"Data Bytes", @"Tx Bytes");
    }
    else
    {
      v67 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v165 = 136446466;
        v166 = "void populateNWActivityInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorM"
               "essageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, N"
               "SDictionary * _Nonnull __strong, NSString * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v167 = 1024;
        int v168 = 980;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%{public}s::%d:Infra Missing Data Bytes subgroup, continuing", v165, 0x12u);
      }
    }
    v68 = [v125 objectForKeyedSubscript:v124];
    v69 = [v68 objectForKeyedSubscript:v122];
    v70 = [v69 objectForKeyedSubscript:@"Data Packets"];

    if (v70)
    {
      sub_1000266BC(v125, v131, v119, a3, v120, 0, @"NWAIS_packets", v124, v122, @"Data Packets", @"Rx Packets");
      sub_1000266BC(v125, v131, v119, a3, v120, 3u, @"NWAIS_packets", v124, v122, @"Data Packets", @"BE Tx Packets");
      sub_1000266BC(v125, v131, v119, a3, v120, 2u, @"NWAIS_packets", v124, v122, @"Data Packets", @"BK Tx Packets");
      sub_1000266BC(v125, v131, v119, a3, v120, 5u, @"NWAIS_packets", v124, v122, @"Data Packets", @"VI Tx Packets");
      sub_1000266BC(v125, v131, v119, a3, v120, 4u, @"NWAIS_packets", v124, v122, @"Data Packets", @"VO Tx Packets");
      sub_1000266BC(v125, v131, v119, a3, v120, 1u, @"NWAIS_packets", v124, v122, @"Data Packets", @"Tx Packets");
    }
    else
    {
      v71 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v165 = 136446466;
        v166 = "void populateNWActivityInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorM"
               "essageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, N"
               "SDictionary * _Nonnull __strong, NSString * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v167 = 1024;
        int v168 = 994;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%{public}s::%d:Infra Missing Data Packets subgroup, continuing", v165, 0x12u);
      }
    }
    v72 = [v125 objectForKeyedSubscript:v124];
    v73 = [v72 objectForKeyedSubscript:v117];

    if (v73)
    {
      v74 = [v125 objectForKeyedSubscript:v124];
      v75 = [v74 objectForKeyedSubscript:v117];
      v76 = [v75 objectForKeyedSubscript:@"Rx Data Frame Counters"];

      if (v76)
      {
        sub_100026A40(v125, v131, v119, a3, v120, 6, @"NWAIS_packets", v124, v117, @"Rx Data Frame Counters", @"SU MPDU Data");
        sub_100026A40(v125, v131, v119, a3, v120, 8, @"NWAIS_packets", v124, v117, @"Rx Data Frame Counters", @"OFDMA MPDU Data");
        sub_100026A40(v125, v131, v119, a3, v120, 10, @"NWAIS_packets", v124, v117, @"Rx Data Frame Counters", @"MU MIMO MPDU Data");
      }
      v77 = [v125 objectForKeyedSubscript:v124];
      v78 = [v77 objectForKeyedSubscript:v117];
      v79 = [v78 objectForKeyedSubscript:@"Rx Data Byte Counters"];

      if (v79)
      {
        sub_100026A40(v125, v131, v119, a3, v120, 6, @"NWAIS_bytes", v124, v117, @"Rx Data Byte Counters", @"SU MPDU Bytes");
        sub_100026A40(v125, v131, v119, a3, v120, 8, @"NWAIS_bytes", v124, v117, @"Rx Data Byte Counters", @"OFDMA MPDU Bytes");
        sub_100026A40(v125, v131, v119, a3, v120, 10, @"NWAIS_bytes", v124, v117, @"Rx Data Byte Counters", @"MU MIMO MPDU Bytes");
      }
      id v80 = [v125 objectForKeyedSubscript:v124];
      id v81 = [v80 objectForKeyedSubscript:v117];
      id v82 = [v81 objectForKeyedSubscript:@"Tx Data Frame Counters"];

      if (v82)
      {
        sub_100026A40(v125, v131, v119, a3, v120, 7, @"NWAIS_packets", v124, v117, @"Tx Data Frame Counters", @"SU MPDU Data");
        sub_100026A40(v125, v131, v119, a3, v120, 9, @"NWAIS_packets", v124, v117, @"Tx Data Frame Counters", @"OFDMA MPDU Data");
      }
      v83 = [v125 objectForKeyedSubscript:v124];
      v84 = [v83 objectForKeyedSubscript:v117];
      v85 = [v84 objectForKeyedSubscript:@"Tx Data Byte Counters"];

      if (v85)
      {
        sub_100026A40(v125, v131, v119, a3, v120, 7, @"NWAIS_bytes", v124, v117, @"Tx Data Byte Counters", @"SU MPDU Bytes");
        sub_100026A40(v125, v131, v119, a3, v120, 9, @"NWAIS_bytes", v124, v117, @"Tx Data Byte Counters", @"OFDMA MPDU Bytes");
      }
    }
    else
    {
      v86 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v165 = 136446466;
        v166 = "void populateNWActivityInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorM"
               "essageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, N"
               "SDictionary * _Nonnull __strong, NSString * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v167 = 1024;
        int v168 = 1021;
        _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "%{public}s::%d:Infra Missing Interface en0 Chip group, continuing", v165, 0x12u);
      }
    }
    uint64_t v87 = [v125 objectForKeyedSubscript:v124];
    v88 = [v87 objectForKeyedSubscript:v122];
    v89 = [v88 objectForKeyedSubscript:@"Phy Mode"];

    if (v89) {
      sub_10002620C(v125, v131, v119, a3, v120, @"NWAIS_phymodes", v124, v122, @"Phy Mode", @"PhyMode State");
    }
    id v90 = [v125 objectForKeyedSubscript:v124];
    v91 = [v90 objectForKeyedSubscript:v122];
    v92 = [v91 objectForKeyedSubscript:@"NSS"];

    if (v92) {
      sub_10002620C(v125, v131, v119, a3, v120, @"NWAIS_nss", v124, v122, @"NSS", @"NSS State");
    }
    unsigned __int8 v93 = [v125 objectForKeyedSubscript:v124];
    v94 = [v93 objectForKeyedSubscript:v122];
    v95 = [v94 objectForKeyedSubscript:@"Data Path Stuck"];

    if (v95)
    {
      sub_100026048(v125, v131, @"NWAIS_consecutivedps", v124, v122, @"Data Path Stuck", @"Consecutive DPS Detected");
      sub_100026048(v125, v131, @"NWAIS_dps", v124, v122, @"Data Path Stuck", @"DPS Detected");
    }
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    v96 = [v131 fieldForKey:@"NWAIS_peers"];
    id obja = [v96 repeatableValues];

    id v97 = [obja countByEnumeratingWithState:&v132 objects:v149 count:16];
    if (v97)
    {
      v98 = 0;
      char v127 = 0;
      uint64_t v99 = *(void *)v133;
      do
      {
        for (j = 0; j != v97; j = (char *)j + 1)
        {
          if (*(void *)v133 != v99) {
            objc_enumerationMutation(obja);
          }
          v101 = *(void **)(*((void *)&v132 + 1) + 8 * (void)j);
          v102 = [v101 fieldForKey:@"NWAPS_hashID"];
          v103 = [v102 stringValue];
          unsigned int v104 = [v103 isEqualToString:@"00:00:00:00:00:00"];

          if (v104)
          {
            id v105 = v101;

            char v127 = 1;
            v98 = v105;
          }
        }
        id v97 = [obja countByEnumeratingWithState:&v132 objects:v149 count:16];
      }
      while (v97);

      if (v127) {
        goto LABEL_94;
      }
    }
    else
    {

      v98 = 0;
    }
    v106 = [v119 getNewMessageForKey:@"NWAPS" groupType:a3 forProcessWithToken:v120];

    v107 = [v131 fieldForKey:@"NWAIS_peers"];
    [v107 addRepeatableSubMessageValue:v106];

    v108 = [v106 fieldForKey:@"NWAPS_hashID"];
    [v108 setStringValue:@"00:00:00:00:00:00"];

    v98 = v106;
LABEL_94:
    sub_1000117AC(v131, v98, v119, a3, v120, v114, v125, v130, a8);
    goto LABEL_95;
  }
  v109 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
  {
    v110 = [v125 objectForKeyedSubscript:v124];
    v111 = [v110 allKeys];
    *(_DWORD *)v165 = 136446978;
    v166 = "void populateNWActivityInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMessa"
           "geDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDiction"
           "ary * _Nonnull __strong, NSString * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
    __int16 v167 = 1024;
    int v168 = 960;
    __int16 v169 = 2112;
    uint64_t v170 = 0;
    __int16 v171 = 2112;
    v172 = v111;
    _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find group %@, we have %@", v165, 0x26u);
  }
  v112 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v165 = 136446466;
    v166 = "void populateNWActivityInterfaceStats(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMessa"
           "geDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDiction"
           "ary * _Nonnull __strong, NSString * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
    __int16 v167 = 1024;
    int v168 = 1059;
    _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", v165, 0x12u);
  }

  v98 = 0;
LABEL_95:

  objc_destroyWeak(&location);
}

void sub_10000B328(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id location)
{
}

void sub_10000B37C(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7)
{
  id v11 = a1;
  objc_initWeak(&location, a2);
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id val = objc_loadWeakRetained(&location);
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v14;
  v19 = [v15 fieldForKey:@"NWACS_scanActivity"];
  v20 = [v19 subMessageValue];

  id v21 = sub_100025E34(v18);
  unsigned int v22 = [v18 objectForKeyedSubscript:v21];
  id v23 = [v22 objectForKeyedSubscript:@"WLAN Power"];
  BOOL v24 = v23 == 0;

  if (v24)
  {
    id v308 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v308, OS_LOG_TYPE_ERROR))
    {
      id v309 = [v18 objectForKeyedSubscript:v21];
      id v310 = [v309 allKeys];
      *(_DWORD *)v409 = 136446722;
      v410 = "void populateNWActivityScanActivity(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMessa"
             "geDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDicti"
             "onary * _Nonnull __strong)";
      __int16 v411 = 1024;
      int v412 = 1442;
      __int16 v413 = 2112;
      CFStringRef v414 = v310;
      _os_log_impl((void *)&_mh_execute_header, v308, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find group, we have %@", v409, 0x1Cu);
    }
  }
  else
  {
    v25 = [v18 objectForKeyedSubscript:v21];
    v26 = [v25 objectForKeyedSubscript:@"WLAN Power"];
    id v27 = [v26 objectForKeyedSubscript:@"Phy Scan"];
    BOOL v28 = v27 == 0;

    if (!v28)
    {
      sub_100026048(v18, v20, @"NWASA_userCount", v21, @"WLAN Power", @"Phy Scan", @"User Scan Count");
      sub_100026048(v18, v20, @"NWASA_userDur", v21, @"WLAN Power", @"Phy Scan", @"User Scan Dur");
      sub_100026048(v18, v20, @"NWASA_roamCount", v21, @"WLAN Power", @"Phy Scan", @"Roam Scan Count");
      sub_100026048(v18, v20, @"NWASA_roamDur", v21, @"WLAN Power", @"Phy Scan", @"Roam Scan Dur");
      sub_100026048(v18, v20, @"NWASA_assocCount", v21, @"WLAN Power", @"Phy Scan", @"Assoc Scan Count");
      sub_100026048(v18, v20, @"NWASA_assocDur", v21, @"WLAN Power", @"Phy Scan", @"Assoc Scan Dur");
      sub_100026048(v18, v20, @"NWASA_pnoBSSIDCount", v21, @"WLAN Power", @"Phy Scan", @"PNO BSSID Scan Count");
      sub_100026048(v18, v20, @"NWASA_pnoBSSIDDur", v21, @"WLAN Power", @"Phy Scan", @"PNO BSSID Scan Dur");
      sub_100026048(v18, v20, @"NWASA_pnoSSIDCount", v21, @"WLAN Power", @"Phy Scan", @"PNO SSID  Scan Count");
      sub_100026048(v18, v20, @"NWASA_pnoSSIDDur", v21, @"WLAN Power", @"Phy Scan", @"PNO SSID  Scan Dur");
      sub_100026048(v18, v20, @"NWASA_otherCount", v21, @"WLAN Power", @"Phy Scan", @"Other Scan Count");
      sub_100026048(v18, v20, @"NWASA_otherDur", v21, @"WLAN Power", @"Phy Scan", @"Other Scan Dur");
      goto LABEL_4;
    }
    id v308 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v308, OS_LOG_TYPE_ERROR))
    {
      id v317 = [v18 objectForKeyedSubscript:v21];
      id v318 = [v317 objectForKeyedSubscript:@"WLAN Power"];
      id v319 = [v318 allKeys];
      *(_DWORD *)v409 = 136446722;
      v410 = "void populateNWActivityScanActivity(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMessa"
             "geDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDicti"
             "onary * _Nonnull __strong)";
      __int16 v411 = 1024;
      int v412 = 1444;
      __int16 v413 = 2112;
      CFStringRef v414 = v319;
      _os_log_impl((void *)&_mh_execute_header, v308, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup, we have %@", v409, 0x1Cu);
    }
  }

  id v320 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v320, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v409 = 136446466;
    v410 = "void populateNWActivityScanActivity(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMessage"
           "Delegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDictionar"
           "y * _Nonnull __strong)";
    __int16 v411 = 1024;
    int v412 = 1463;
    _os_log_impl((void *)&_mh_execute_header, v320, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", v409, 0x12u);
  }

LABEL_4:
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  __int16 v33 = [v29 fieldForKey:@"NWACS_powerActivity"];
  id v34 = [v33 subMessageValue];

  int v35 = sub_100025E34(v32);
  v36 = [v32 objectForKeyedSubscript:v35];
  __int16 v37 = [v36 objectForKeyedSubscript:@"WLAN Power"];
  BOOL v38 = v37 == 0;

  if (v38)
  {
    id v311 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v311, OS_LOG_TYPE_ERROR))
    {
      v312 = [v32 objectForKeyedSubscript:v35];
      id v313 = [v312 allKeys];
      *(_DWORD *)v409 = 136446722;
      v410 = "void populateNWActivityPowerActivity(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMess"
             "ageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDict"
             "ionary * _Nonnull __strong)";
      __int16 v411 = 1024;
      int v412 = 1482;
      __int16 v413 = 2112;
      CFStringRef v414 = v313;
      _os_log_impl((void *)&_mh_execute_header, v311, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find group, we have %@", v409, 0x1Cu);
    }
  }
  else
  {
    uint64_t v39 = [v32 objectForKeyedSubscript:v35];
    uint64_t v40 = [v39 objectForKeyedSubscript:@"WLAN Power"];
    v41 = [v40 objectForKeyedSubscript:@"Phy Activity"];
    BOOL v42 = v41 == 0;

    if (!v42)
    {
      sub_1000299F4(v32, v34, @"NWAPPS_kRadioPhyReportTxDur", v35, @"WLAN Power", @"Phy Activity", @"Radio Tx Dur");
      sub_1000299F4(v32, v34, @"NWAPPS_kRadioPhyReportRxDur", v35, @"WLAN Power", @"Phy Activity", @"Radio Rx Dur");
      goto LABEL_7;
    }
    id v311 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v311, OS_LOG_TYPE_ERROR))
    {
      v386 = [v32 objectForKeyedSubscript:v35];
      v321 = [v386 objectForKeyedSubscript:@"WLAN Power"];
      id v322 = [v321 allKeys];
      *(_DWORD *)v409 = 136446978;
      v410 = "void populateNWActivityPowerActivity(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMess"
             "ageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDict"
             "ionary * _Nonnull __strong)";
      __int16 v411 = 1024;
      int v412 = 1484;
      __int16 v413 = 2112;
      CFStringRef v414 = @"Phy Activity";
      __int16 v415 = 2112;
      CFStringRef v416 = v322;
      _os_log_impl((void *)&_mh_execute_header, v311, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup %@, we have %@", v409, 0x26u);
    }
  }

  id v323 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v323, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v409 = 136446466;
    v410 = "void populateNWActivityPowerActivity(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMessag"
           "eDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDictiona"
           "ry * _Nonnull __strong)";
    __int16 v411 = 1024;
    int v412 = 1492;
    _os_log_impl((void *)&_mh_execute_header, v323, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", v409, 0x12u);
  }

LABEL_7:
  id v378 = v29;
  objc_initWeak(v392, val);
  id v43 = v30;
  id v371 = v31;
  id v44 = v32;
  id v45 = [v378 fieldForKey:@"NWACS_impedingFunctions"];
  v46 = [v45 subMessageValue];

  v47 = [v46 fieldForKey:@"NWAIF_sdbtdm"];
  v48 = [v47 subMessageValue];

  id WeakRetained = objc_loadWeakRetained(v392);
  uint64_t v50 = sub_100025E34(v44);
  uint64_t v51 = [v44 objectForKeyedSubscript:v50];
  v52 = [v51 objectForKeyedSubscript:@"TVPM Slice 0"];
  BOOL v53 = v52 == 0;

  if (!v53)
  {
    sub_100026048(v44, v46, @"NWAIF_txduty0", v50, @"TVPM Slice 0", @"Temperature Voltage Power Management", @"Tx Duty Cycle (%)");
    sub_100026048(v44, v46, @"NWAIF_txpowerbackoff0", v50, @"TVPM Slice 0", @"Temperature Voltage Power Management", @"Tx Power Backoff (1/4dBm)");
    sub_100026048(v44, v46, @"NWAIF_activechains0", v50, @"TVPM Slice 0", @"Temperature Voltage Power Management", @"Active Chains");
    sub_100026048(v44, v46, @"NWAIF_temp0", v50, @"TVPM Slice 0", @"Temperature Voltage Power Management", @"Temperature (C)");
    sub_100026048(v44, v46, @"NWAIF_voltage0", v50, @"TVPM Slice 0", @"Temperature Voltage Power Management", @"Battery Voltage (10xV)");
    sub_100026048(v44, v46, @"NWAIF_ppm0", v50, @"TVPM Slice 0", @"Temperature Voltage Power Management", @"PPM");
    sub_100026048(v44, v46, @"NWAIF_ctlmid0", v50, @"TVPM Slice 0", @"Temperature Voltage Power Management", @"CTLM Index");
    sub_10002620C(v44, v46, WeakRetained, a3, v43, @"NWAIF_cTLMIndexs", v50, @"TVPM Slice 0", @"CTLM Index", @"CTLM Index");
    sub_10002620C(v44, v46, WeakRetained, a3, v43, @"NWAIF_txPowerBackoffDBs", v50, @"TVPM Slice 0", @"Tx Power Backoff", @"Tx Power Backoff");
    sub_10002620C(v44, v46, WeakRetained, a3, v43, @"NWAIF_txDutyCyclePcts", v50, @"TVPM Slice 0", @"Tx Duty Cycle", @"Tx Duty Cycle");
  }
  v54 = [v44 objectForKeyedSubscript:v50];
  v55 = [v54 objectForKeyedSubscript:@"TVPM Slice 1"];
  BOOL v56 = v55 == 0;

  if (!v56)
  {
    sub_100026048(v44, v46, @"NWAIF_txduty1", v50, @"TVPM Slice 1", @"Temperature Voltage Power Management", @"Tx Duty Cycle (%)");
    sub_100026048(v44, v46, @"NWAIF_txpowerbackoff1", v50, @"TVPM Slice 1", @"Temperature Voltage Power Management", @"Tx Power Backoff (1/4dBm)");
    sub_100026048(v44, v46, @"NWAIF_activechains1", v50, @"TVPM Slice 1", @"Temperature Voltage Power Management", @"Active Chains");
    sub_100026048(v44, v46, @"NWAIF_temp1", v50, @"TVPM Slice 1", @"Temperature Voltage Power Management", @"Temperature (C)");
    sub_100026048(v44, v46, @"NWAIF_voltage1", v50, @"TVPM Slice 1", @"Temperature Voltage Power Management", @"Battery Voltage (10xV)");
    sub_100026048(v44, v46, @"NWAIF_ppm1", v50, @"TVPM Slice 1", @"Temperature Voltage Power Management", @"PPM");
    sub_100026048(v44, v46, @"NWAIF_ctlmid1", v50, @"TVPM Slice 1", @"Temperature Voltage Power Management", @"CTLM Index");
    sub_10002620C(v44, v46, WeakRetained, a3, v43, @"NWAIF_cTLMIndex1s", v50, @"TVPM Slice 1", @"CTLM Index", @"CTLM Index");
    sub_10002620C(v44, v46, WeakRetained, a3, v43, @"NWAIF_txPowerBackoffDB1s", v50, @"TVPM Slice 1", @"Tx Power Backoff", @"Tx Power Backoff");
    sub_10002620C(v44, v46, WeakRetained, a3, v43, @"NWAIF_txDutyCyclePct1s", v50, @"TVPM Slice 1", @"Tx Duty Cycle", @"Tx Duty Cycle");
  }
  id v57 = [v44 objectForKeyedSubscript:v50];
  v58 = [v57 objectForKeyedSubscript:@"TDM Slice 0"];
  BOOL v59 = v58 == 0;

  if (!v59)
  {
    v60 = [v48 fieldForKey:@"TDM_sliceStats"];
    v61 = [v60 repeatableValues];
    BOOL v62 = v61 == 0;

    if (v62)
    {
      v63 = [WeakRetained getNewMessageForKey:@"TDMS" groupType:a3 forProcessWithToken:v43];
      v64 = [v48 fieldForKey:@"TDM_sliceStats"];
      [v64 addRepeatableSubMessageValue:v63];

      v65 = [v48 fieldForKey:@"TDM_sliceStats"];
      id v66 = [v63 copy];
      [v65 addRepeatableSubMessageValue:v66];
    }
    v67 = [v48 fieldForKey:@"TDM_sliceStats"];
    v68 = [v67 repeatableValues];
    v69 = [v68 objectAtIndex:0];

    if (!v69)
    {
      long long v328 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v328, OS_LOG_TYPE_ERROR)) {
        goto LABEL_238;
      }
      *(_DWORD *)v409 = 136446466;
      v410 = "void populateNWActivityImpedingFunctions(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulator"
             "MessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NS"
             "Dictionary * _Nonnull __strong)";
      __int16 v411 = 1024;
      int v412 = 1559;
      long long v329 = "%{public}s::%d:Bad sliceSpecificMessage";
      goto LABEL_237;
    }
    sub_1000299F4(v44, v69, @"TDMS_txDeferDuration", v50, @"TDM Slice 0", @"TDM Counters", @"TXA Defer Duration");
    sub_1000299F4(v44, v69, @"TDMS_txaDuration", v50, @"TDM Slice 0", @"TDM Counters", @"TXA On Duration");
    sub_1000299F4(v44, v69, @"TDMS_txPriDuration", v50, @"TDM Slice 0", @"TDM Counters", @"TXA Priority Duration");
    sub_100026048(v44, v69, @"TDMS_txaONCount", v50, @"TDM Slice 0", @"TDM Counters", @"TXA Set On");
    sub_100026048(v44, v69, @"TDMS_txaTimeoutCount", v50, @"TDM Slice 0", @"TDM Counters", @"TXA Timeout Count");
    sub_100026048(v44, v69, @"TDMS_txaPORCount", v50, @"TDM Slice 0", @"TDM Counters", @"Path Off Requests");
    sub_100026048(v44, v69, @"TDMS_txPathEnableReqCount", v50, @"TDM Slice 0", @"TDM Counters", @"Path Unmute Requests");
    sub_100026048(v44, v69, @"TDMS_txPathMuteCount", v50, @"TDM Slice 0", @"TDM Counters", @"Path Mute Requests");
    sub_100026048(v44, v69, @"TDMS_txMuteCount", v50, @"TDM Slice 0", @"TDM Counters", @"Active Tx Muted");
    sub_100026048(v44, v69, @"TDMS_ackTxPowerBackoffCount", v50, @"TDM Slice 0", @"TDM Counters", @"Active Tx Power Backedoff");
    sub_100026048(v44, v69, @"TDMS_txPriorityCount", v50, @"TDM Slice 0", @"TDM Counters", @"TXA Priority Taken");
    sub_100026048(v44, v69, @"TDMS_txDeferredCount", v50, @"TDM Slice 0", @"TDM Counters", @"TXA Defer Count");
  }
  v70 = [v44 objectForKeyedSubscript:v50];
  v71 = [v70 objectForKeyedSubscript:@"TDM Slice 1"];
  BOOL v72 = v71 == 0;

  if (!v72)
  {
    v73 = [v48 fieldForKey:@"TDM_sliceStats"];
    v74 = [v73 repeatableValues];
    BOOL v75 = v74 == 0;

    if (!v75)
    {
      v76 = [v48 fieldForKey:@"TDM_sliceStats"];
      v77 = [v76 repeatableValues];
      v78 = [v77 objectAtIndex:1];

      if (v78)
      {
        sub_1000299F4(v44, v78, @"TDMS_txDeferDuration", v50, @"TDM Slice 1", @"TDM Counters", @"TXA Defer Duration");
        sub_1000299F4(v44, v78, @"TDMS_txaDuration", v50, @"TDM Slice 1", @"TDM Counters", @"TXA On Duration");
        sub_1000299F4(v44, v78, @"TDMS_txPriDuration", v50, @"TDM Slice 1", @"TDM Counters", @"TXA Priority Duration");
        sub_100026048(v44, v78, @"TDMS_txaONCount", v50, @"TDM Slice 1", @"TDM Counters", @"TXA Set On");
        sub_100026048(v44, v78, @"TDMS_txaTimeoutCount", v50, @"TDM Slice 1", @"TDM Counters", @"TXA Timeout Count");
        sub_100026048(v44, v78, @"TDMS_txaPORCount", v50, @"TDM Slice 1", @"TDM Counters", @"Path Off Requests");
        sub_100026048(v44, v78, @"TDMS_txPathEnableReqCount", v50, @"TDM Slice 1", @"TDM Counters", @"Path Unmute Requests");
        sub_100026048(v44, v78, @"TDMS_txPathMuteCount", v50, @"TDM Slice 1", @"TDM Counters", @"Path Mute Requests");
        sub_100026048(v44, v78, @"TDMS_txMuteCount", v50, @"TDM Slice 1", @"TDM Counters", @"Active Tx Muted");
        sub_100026048(v44, v78, @"TDMS_ackTxPowerBackoffCount", v50, @"TDM Slice 1", @"TDM Counters", @"Active Tx Power Backedoff");
        sub_100026048(v44, v78, @"TDMS_txPriorityCount", v50, @"TDM Slice 1", @"TDM Counters", @"TXA Priority Taken");
        sub_100026048(v44, v78, @"TDMS_txDeferredCount", v50, @"TDM Slice 1", @"TDM Counters", @"TXA Defer Count");

        goto LABEL_20;
      }
      long long v328 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v328, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v409 = 136446466;
        v410 = "void populateNWActivityImpedingFunctions(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulat"
               "orMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong"
               ", NSDictionary * _Nonnull __strong)";
        __int16 v411 = 1024;
        int v412 = 1582;
        long long v329 = "%{public}s::%d:Bad sliceSpecificMessage";
        goto LABEL_237;
      }
LABEL_238:

      id v330 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v330, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v409 = 136446466;
        v410 = "void populateNWActivityImpedingFunctions(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulat"
               "orMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong"
               ", NSDictionary * _Nonnull __strong)";
        __int16 v411 = 1024;
        int v412 = 1623;
        _os_log_impl((void *)&_mh_execute_header, v330, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", v409, 0x12u);
      }

      goto LABEL_24;
    }
    long long v328 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v328, OS_LOG_TYPE_ERROR)) {
      goto LABEL_238;
    }
    *(_DWORD *)v409 = 136446466;
    v410 = "void populateNWActivityImpedingFunctions(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMe"
           "ssageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDict"
           "ionary * _Nonnull __strong)";
    __int16 v411 = 1024;
    int v412 = 1579;
    long long v329 = "%{public}s::%d:TDM_sliceStats should exist when looking at slice 1";
LABEL_237:
    _os_log_impl((void *)&_mh_execute_header, v328, OS_LOG_TYPE_ERROR, v329, v409, 0x12u);
    goto LABEL_238;
  }
LABEL_20:
  v79 = [v44 objectForKeyedSubscript:v50];
  id v80 = [v79 objectForKeyedSubscript:@"RC1 Coex"];
  BOOL v81 = v80 == 0;

  if (!v81)
  {
    sub_100026048(v44, v46, @"NWAIF_rc1Request", v50, @"RC1 Coex", @"Counters", @"RC1 Request");
    sub_100026048(v44, v46, @"NWAIF_rc1Duration", v50, @"RC1 Coex", @"Counters", @"RC1 Duration");
    sub_100026048(v44, v46, @"NWAIF_rc1wlanCrit", v50, @"RC1 Coex", @"Counters", @"WLAN Crit");
    sub_100026048(v44, v46, @"NWAIF_rc1wlanCritDuration", v50, @"RC1 Coex", @"Counters", @"WLAN Crit Duration");
  }
  id v82 = [v44 objectForKeyedSubscript:v50];
  v83 = [v82 objectForKeyedSubscript:@"RC2 Coex"];
  BOOL v84 = v83 == 0;

  if (!v84)
  {
    sub_100026048(v44, v46, @"NWAIF_rc2Request", v50, @"RC1 Coex", @"Counters", @"RC2 Request");
    sub_100026048(v44, v46, @"NWAIF_rc2Duration", v50, @"RC1 Coex", @"Counters", @"RC2 Duration");
    sub_100026048(v44, v46, @"NWAIF_rc2LongGrant", v50, @"RC1 Coex", @"Counters", @"Grant Delay Larger than 4.5ms");
    sub_100026048(v44, v46, @"NWAIF_rc2Grant", v50, @"RC1 Coex", @"Counters", @"Grant");
    sub_100026048(v44, v46, @"NWAIF_rc2cts2a", v50, @"RC1 Coex", @"Counters", @"Successfully TXed CTS2A");
  }
LABEL_24:

  objc_destroyWeak(v392);
  sub_100027F88(v378, v43, v371, v44, a7);
  id v85 = v378;
  id v361 = v43;
  id v366 = v371;
  id v86 = v44;
  v355 = v85;
  uint64_t v87 = [v85 fieldForKey:@"NWACS_btCoex"];
  v372 = [v87 subMessageValue];

  v88 = [v372 fieldForKey:@"NWABC_btrequestReason"];
  v379 = [v88 subMessageValue];

  v89 = sub_100025E34(v86);
  id v90 = [v86 objectForKeyedSubscript:v89];
  v91 = [v90 objectForKeyedSubscript:@"BT Coex"];
  BOOL v92 = v91 == 0;

  if (v92)
  {
    v314 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v314, OS_LOG_TYPE_ERROR))
    {
      id v315 = [v86 objectForKeyedSubscript:v89];
      id v316 = [v315 allKeys];
      *(_DWORD *)v409 = 136446722;
      v410 = "void populateNWActivityBTCoex(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMessageDele"
             "gate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDictionary "
             "* _Nonnull __strong)";
      __int16 v411 = 1024;
      int v412 = 1825;
      __int16 v413 = 2112;
      CFStringRef v414 = v316;
      _os_log_impl((void *)&_mh_execute_header, v314, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find group, we have %@", v409, 0x1Cu);
    }
    v96 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v409 = 136446466;
      v410 = "void populateNWActivityBTCoex(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMessageDele"
             "gate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDictionary "
             "* _Nonnull __strong)";
      __int16 v411 = 1024;
      int v412 = 1867;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", v409, 0x12u);
    }
  }
  else
  {
    sub_100026048(v86, v372, @"NWABC_request", v89, @"BT Coex", @"Counters", @"Antenna Requests");
    sub_100026048(v86, v372, @"NWABC_grant", v89, @"BT Coex", @"Counters", @"Antenna Grants");
    sub_100026048(v86, v372, @"NWABC_btabort", v89, @"BT Coex", @"Counters", @"WLAN Preempted");
    sub_100026048(v86, v372, @"NWABC_psnullretrycount", v89, @"BT Coex", @"Counters", @"PSNULL exceeded");
    sub_100026048(v86, v372, @"NWABC_ucodehighlatency", v89, @"BT Coex", @"Counters", @"High UCode Latency");
    unsigned __int8 v93 = [v86 objectForKeyedSubscript:v89];
    v94 = [v93 objectForKeyedSubscript:@"BT Coex"];
    v95 = [v94 objectForKeyedSubscript:@"Extra Counters"];

    if (v95)
    {
      sub_100026048(v86, v372, @"NWABC_pm", v89, @"BT Coex", @"Extra Counters", @"PM Protection Success");
      sub_100026048(v86, v372, @"NWABC_wlantxpreempt", v89, @"BT Coex", @"Extra Counters", @"WLAN Tx Preemption");
      sub_100026048(v86, v372, @"NWABC_wlanrxpreempt", v89, @"BT Coex", @"Extra Counters", @"WLAN Rx Preemption");
      sub_100026048(v86, v372, @"NWABC_aptxafterpm", v89, @"BT Coex", @"Extra Counters", @"AP Tx after PM Protection");
      sub_100026048(v86, v372, @"NWABC_audiogrant", v89, @"BT Coex", @"Extra Counters", @"Periodic Audio Grant Count");
      sub_100026048(v86, v372, @"NWABC_audiodeny", v89, @"BT Coex", @"Extra Counters", @"Periodic Audio Deny Count");
      sub_100026048(v86, v372, @"NWABC_a2dpgrant", v89, @"BT Coex", @"Extra Counters", @"A2DP Grant Count");
      sub_100026048(v86, v372, @"NWABC_a2dpdeny", v89, @"BT Coex", @"Extra Counters", @"A2DP Deny Count");
      sub_100026048(v86, v372, @"NWABC_sniffgrant", v89, @"BT Coex", @"Extra Counters", @"Sniff Grant Count");
      sub_100026048(v86, v372, @"NWABC_sniffdeny", v89, @"BT Coex", @"Extra Counters", @"Sniff Deny Count");
    }
    sub_100026048(v86, v379, @"NWABCRR_acl", v89, @"BT Coex", @"Antenna Request Reason", @"ACL");
    sub_100026048(v86, v379, @"NWABCRR_sco", v89, @"BT Coex", @"Antenna Request Reason", @"SCO");
    sub_100026048(v86, v379, @"NWABCRR_esco", v89, @"BT Coex", @"Antenna Request Reason", @"eSCO");
    sub_100026048(v86, v379, @"NWABCRR_a2dp", v89, @"BT Coex", @"Antenna Request Reason", @"A2DP");
    sub_100026048(v86, v379, @"NWABCRR_sniff", v89, @"BT Coex", @"Antenna Request Reason", @"Sniff");
    sub_100026048(v86, v379, @"NWABCRR_pagescan", v89, @"BT Coex", @"Antenna Request Reason", @"Page Scan");
    sub_100026048(v86, v379, @"NWABCRR_inquiryscan", v89, @"BT Coex", @"Antenna Request Reason", @"Inquity Scan");
    sub_100026048(v86, v379, @"NWABCRR_page", v89, @"BT Coex", @"Antenna Request Reason", @"Page");
    sub_100026048(v86, v379, @"NWABCRR_inquiry", v89, @"BT Coex", @"Antenna Request Reason", @"Inquiry");
    sub_100026048(v86, v379, @"NWABCRR_mss", v89, @"BT Coex", @"Antenna Request Reason", @"MSS");
    sub_100026048(v86, v379, @"NWABCRR_park", v89, @"BT Coex", @"Antenna Request Reason", @"PARK");
    sub_100026048(v86, v379, @"NWABCRR_blescan", v89, @"BT Coex", @"Antenna Request Reason", @"BLE Scan");
    sub_100026048(v86, v379, @"NWABCRR_ble", v89, @"BT Coex", @"Antenna Request Reason", @"BLE");
    sub_100026048(v86, v379, @"NWABCRR_other", v89, @"BT Coex", @"Antenna Request Reason", @"Other");
    v96 = v372;
    v348 = v89;
    if (sub_100026C50(v86, v348, @"BT Coex", @"Antenna Ownership", @"Antenna Ownership while on 2GHz"))
    {
      int Count = IOReportStateGetCount();
      if (Count >= 1)
      {
        for (int i = 0; i != Count; ++i)
        {
          uint64_t v99 = IOReportStateGetNameForIndex();
          if ([v99 containsString:@"BT"])
          {
            IOReportStateGetResidency();
            IOReportChannelGetUnit();
            IOReportScaleValue();
            double v101 = v100;
            v102 = [v96 fieldForKey:@"NWABC_duration"];
            [v102 setUint32Value:v101];
          }
        }
      }
    }
    else
    {
      long long v327 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v327, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v409 = 136447490;
        v410 = "_Bool fillUInt32FieldFromState(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, NSStr"
               "ing * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull "
               "__strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
        __int16 v411 = 1024;
        int v412 = 346;
        __int16 v413 = 2112;
        CFStringRef v414 = v348;
        __int16 v415 = 2112;
        CFStringRef v416 = @"BT Coex";
        __int16 v417 = 2112;
        CFStringRef v418 = @"Antenna Ownership";
        __int16 v419 = 2112;
        CFStringRef v420 = @"Antenna Ownership while on 2GHz";
        _os_log_impl((void *)&_mh_execute_header, v327, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", v409, 0x3Au);
      }
    }
  }

  id v103 = v355;
  id v334 = v361;
  id v335 = v366;
  id v380 = v86;
  __int16 v333 = v103;
  unsigned int v104 = [v103 fieldForKey:@"NWACS_phyrate"];
  v338 = [v104 subMessageValue];

  v373 = sub_100025E34(v380);
  long long v394 = 0u;
  long long v395 = 0u;
  *(_OWORD *)v392 = 0u;
  long long v393 = 0u;
  id v105 = [v380 objectForKeyedSubscript:v373];
  id obj = [v105 allKeys];

  id v106 = [obj countByEnumeratingWithState:v392 objects:v409 count:16];
  if (v106)
  {
    uint64_t v356 = *(void *)v393;
LABEL_36:
    uint64_t v107 = 0;
    while (1)
    {
      if (*(void *)v393 != v356) {
        objc_enumerationMutation(obj);
      }
      v108 = (void *)*((void *)v392[1] + v107);
      v109 = [v380 objectForKeyedSubscript:v373];
      v110 = [v109 objectForKeyedSubscript:v108];
      v111 = [v110 objectForKeyedSubscript:@"Tx MCS Success"];
      if (v111
        || ([v380 objectForKeyedSubscript:v373],
            id v366 = (id)objc_claimAutoreleasedReturnValue(),
            [v366 objectForKeyedSubscript:v108],
            id v361 = (id)objc_claimAutoreleasedReturnValue(),
            [v361 objectForKeyedSubscript:@"Tx VHT Success"],
            (id v105 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        int v112 = 0;
      }
      else
      {
        v342 = [v380 objectForKeyedSubscript:v373];
        v343 = [v342 objectForKeyedSubscript:v108];
        v348 = [v343 objectForKeyedSubscript:@"Tx HE Success"];
        if (!v348)
        {

          id v105 = 0;
          v348 = 0;
          char v114 = 0;
LABEL_51:

          if (v114)
          {
LABEL_55:
            id v115 = v108;
            goto LABEL_56;
          }
          goto LABEL_52;
        }
        id v105 = 0;
        int v112 = 1;
      }
      unsigned __int8 v113 = [v108 containsString:@"awdl"];
      char v114 = v113 ^ 1;
      if (v112)
      {

        if (!v111) {
          goto LABEL_51;
        }
      }
      else if (!v111)
      {
        goto LABEL_51;
      }

      if ((v113 & 1) == 0) {
        goto LABEL_55;
      }
LABEL_52:
      if (v106 == (id)++v107)
      {
        id v106 = [obj countByEnumeratingWithState:v392 objects:v409 count:16];
        if (v106) {
          goto LABEL_36;
        }
        break;
      }
    }
  }
  id v115 = 0;
LABEL_56:

  v116 = [v380 objectForKeyedSubscript:v373];
  v117 = [v116 objectForKeyedSubscript:v115];

  if (v117)
  {
    v118 = [v380 objectForKeyedSubscript:v373];
    id v119 = [v118 objectForKeyedSubscript:v115];
    id v120 = [v119 objectForKeyedSubscript:@"Tx MPDU in AMPDU Usage"];

    if (v120) {
      sub_100029D5C(v380, v338, @"NWARAA_ampduAGGs", v373, v115, @"Tx MPDU in AMPDU Usage", @"Tx MPDU in AMPDU Usage", 64, 1u);
    }
    id v121 = [v380 objectForKeyedSubscript:v373];
    v122 = [v121 objectForKeyedSubscript:v115];
    id v123 = [v122 objectForKeyedSubscript:@"Rx MCS Success"];

    if (v123) {
      sub_100029D5C(v380, v338, @"NWARAA_rxMCSSuccess", v373, v115, @"Rx MCS Success", @"Rx MCS Success", 33, 0);
    }
    v124 = [v380 objectForKeyedSubscript:v373];
    id v125 = [v124 objectForKeyedSubscript:v115];
    id v126 = [v125 objectForKeyedSubscript:@"Tx MCS Success"];

    if (v126) {
      sub_100029D5C(v380, v338, @"NWARAA_txMCSSuccess", v373, v115, @"Tx MCS Success", @"Tx MCS Success", 33, 0);
    }
    char v127 = [v380 objectForKeyedSubscript:v373];
    id v128 = [v127 objectForKeyedSubscript:v115];
    id v129 = [v128 objectForKeyedSubscript:@"Rx VHT Success"];

    if (v129) {
      sub_100029D5C(v380, v338, @"NWARAA_rxVHTSuccess", v373, v115, @"Rx VHT Success", @"Rx VHT Success", 33, 0);
    }
    id v130 = [v380 objectForKeyedSubscript:v373];
    v131 = [v130 objectForKeyedSubscript:v115];
    long long v132 = [v131 objectForKeyedSubscript:@"Tx VHT Success"];

    if (v132) {
      sub_100029D5C(v380, v338, @"NWARAA_txVHTSuccess", v373, v115, @"Tx VHT Success", @"Tx VHT Success", 33, 0);
    }
    long long v133 = [v380 objectForKeyedSubscript:v373];
    long long v134 = [v133 objectForKeyedSubscript:v115];
    long long v135 = [v134 objectForKeyedSubscript:@"Rx HE Success"];

    if (v135) {
      sub_100029D5C(v380, v338, @"NWARAA_rxHESuccess", v373, v115, @"Rx HE Success", @"Rx HE Success", 33, 0);
    }
    long long v136 = [v380 objectForKeyedSubscript:v373];
    long long v137 = [v136 objectForKeyedSubscript:v115];
    long long v138 = [v137 objectForKeyedSubscript:@"Tx HE Success"];

    if (v138) {
      sub_100029D5C(v380, v338, @"NWARAA_txHESuccess", v373, v115, @"Tx HE Success", @"Tx HE Success", 33, 0);
    }
    long long v139 = [v380 objectForKeyedSubscript:v373];
    unsigned __int8 v140 = [v139 objectForKeyedSubscript:v115];
    long long v141 = [v140 objectForKeyedSubscript:@"Rx MPDU in SU AMPDU Usage"];

    if (v141) {
      sub_100029D5C(v380, v338, @"NWARAA_rxampduSUs", v373, v115, @"Rx MPDU in SU AMPDU Usage", @"Rx MPDU in SU AMPDU Usage", 64, 1u);
    }
    long long v142 = [v380 objectForKeyedSubscript:v373];
    long long v143 = [v142 objectForKeyedSubscript:v115];
    long long v144 = [v143 objectForKeyedSubscript:@"Tx MPDU in SU AMPDU Usage"];

    if (v144) {
      sub_100029D5C(v380, v338, @"NWARAA_txampduSUs", v373, v115, @"Tx MPDU in SU AMPDU Usage", @"Tx MPDU in SU AMPDU Usage", 64, 1u);
    }
    long long v145 = [v380 objectForKeyedSubscript:v373];
    long long v146 = [v145 objectForKeyedSubscript:v115];
    long long v147 = [v146 objectForKeyedSubscript:@"Rx MPDU in OFDMA AMPDU Usage"];

    if (v147) {
      sub_100029D5C(v380, v338, @"NWARAA_rxampduOFDMAs", v373, v115, @"Rx MPDU in OFDMA AMPDU Usage", @"Rx MPDU in OFDMA AMPDU Usage", 64, 1u);
    }
    long long v148 = [v380 objectForKeyedSubscript:v373];
    v149 = [v148 objectForKeyedSubscript:v115];
    v150 = [v149 objectForKeyedSubscript:@"Tx MPDU in OFDMA AMPDU Usage"];

    if (v150) {
      sub_100029D5C(v380, v338, @"NWARAA_txampduOFDMAs", v373, v115, @"Tx MPDU in OFDMA AMPDU Usage", @"Tx MPDU in OFDMA AMPDU Usage", 64, 1u);
    }
    v151 = [v380 objectForKeyedSubscript:v373];
    v152 = [v151 objectForKeyedSubscript:v115];
    __int16 v153 = [v152 objectForKeyedSubscript:@"Rx MPDU in MU-MIMO AMPDU Usage"];

    if (v153) {
      sub_100029D5C(v380, v338, @"NWARAA_rxampduMUMIMOs", v373, v115, @"Rx MPDU in MU-MIMO AMPDU Usage", @"Rx MPDU in MU-MIMO AMPDU Usage", 64, 1u);
    }
    int v154 = [v380 objectForKeyedSubscript:v373];
    __int16 v155 = [v154 objectForKeyedSubscript:v115];
    v156 = [v155 objectForKeyedSubscript:@"Tx MPDU in MU-MIMO AMPDU Usage"];

    if (v156) {
      sub_100029D5C(v380, v338, @"NWARAA_txampduMUMIMOs", v373, v115, @"Tx MPDU in MU-MIMO AMPDU Usage", @"Tx MPDU in MU-MIMO AMPDU Usage", 64, 1u);
    }
  }
  else
  {
    id v324 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v324, OS_LOG_TYPE_ERROR))
    {
      v325 = [v380 objectForKeyedSubscript:v373];
      v326 = [v325 allKeys];
      *(_DWORD *)buf = 136447490;
      *(void *)&uint8_t buf[4] = "void populateNWActivityRateAndAgg(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPo"
                           "pulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * "
                           "_Nonnull __strong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v398 = 1024;
      int v399 = 1983;
      __int16 v400 = 2112;
      CFStringRef v401 = @"Tx MCS Success";
      __int16 v402 = 2112;
      CFStringRef v403 = @"Tx VHT Success";
      __int16 v404 = 2112;
      CFStringRef v405 = @"Tx HE Success";
      __int16 v406 = 2112;
      v407 = v326;
      _os_log_impl((void *)&_mh_execute_header, v324, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find group that contains subgroup %@ or %@ or %@, we have %@", buf, 0x3Au);
    }
  }
  if (!v117)
  {
    v157 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "void populateNWActivityRateAndAgg(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPo"
                           "pulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * "
                           "_Nonnull __strong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v398 = 1024;
      int v399 = 2041;
      _os_log_impl((void *)&_mh_execute_header, v157, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", buf, 0x12u);
    }

    if (!*a7)
    {
      id v408 = NSLocalizedFailureReasonErrorKey;
      *(void *)buf = @"WAErrorCodeHEVHTMCSMissing";
      v158 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v408 count:1];
      *a7 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9026 userInfo:v158];
    }
  }

  id v374 = v333;
  objc_initWeak(&v408, val);
  id v357 = v334;
  id v344 = v335;
  id v367 = v380;
  id v349 = objc_loadWeakRetained(&v408);
  v362 = sub_100025E34(v367);
  __int16 v159 = 0;
  uint64_t v160 = 0;
  char v161 = 1;
  while (1)
  {
    char v381 = v161;
    long long v394 = 0u;
    long long v395 = 0u;
    *(_OWORD *)v392 = 0u;
    long long v393 = 0u;
    v162 = [v367 objectForKeyedSubscript:v362];
    __int16 v163 = [v162 allKeys];

    v164 = (char *)[v163 countByEnumeratingWithState:v392 objects:v409 count:16];
    if (v164)
    {
      uint64_t v165 = *(void *)v393;
      while (2)
      {
        for (j = 0; j != v164; ++j)
        {
          if (*(void *)v393 != v165) {
            objc_enumerationMutation(v163);
          }
          __int16 v167 = (void *)*((void *)v392[1] + (void)j);
          id v168 = [objc_alloc((Class)NSString) initWithFormat:@"%lu", v160];
          if ([v167 containsString:@"Tx MPDU WME Slice "]
            && ([v167 containsString:v168] & 1) != 0)
          {
            id v169 = v167;

            __int16 v159 = v169;
            goto LABEL_100;
          }
        }
        v164 = (char *)[v163 countByEnumeratingWithState:v392 objects:v409 count:16];
        if (v164) {
          continue;
        }
        break;
      }
    }
LABEL_100:

    if (!v159) {
      goto LABEL_105;
    }
    uint64_t v170 = [v374 fieldForKey:@"NWACS_txmpduWMEs"];
    __int16 v171 = [v170 repeatableValues];
    BOOL v172 = v171 == 0;

    if (v172)
    {
      v173 = [v349 getNewMessageForKey:@"NWAMWME" groupType:a3 forProcessWithToken:v357];
      id v174 = [v374 fieldForKey:@"NWACS_txmpduWMEs"];
      [v174 addRepeatableSubMessageValue:v173];

      id v175 = [v374 fieldForKey:@"NWACS_txmpduWMEs"];
      id v176 = [v173 copy];
      [v175 addRepeatableSubMessageValue:v176];
    }
    v177 = [v374 fieldForKey:@"NWACS_txmpduWMEs"];
    v178 = [v177 repeatableValues];
    v179 = [v178 objectAtIndex:v160];

    if (!v179) {
      break;
    }
    sub_1000299F4(v367, v179, @"NWAMWME_tid0", v362, v159, @"Counters", @"                        Tx MPDU Tid0");
    sub_1000299F4(v367, v179, @"NWAMWME_tid1", v362, v159, @"Counters", @"                        Tx MPDU Tid1");
    sub_1000299F4(v367, v179, @"NWAMWME_tid2", v362, v159, @"Counters", @"                        Tx MPDU Tid2");
    sub_1000299F4(v367, v179, @"NWAMWME_tid3", v362, v159, @"Counters", @"                        Tx MPDU Tid3");
    sub_1000299F4(v367, v179, @"NWAMWME_tid4", v362, v159, @"Counters", @"                        Tx MPDU Tid4");
    sub_1000299F4(v367, v179, @"NWAMWME_tid5", v362, v159, @"Counters", @"                        Tx MPDU Tid5");
    sub_1000299F4(v367, v179, @"NWAMWME_tid6", v362, v159, @"Counters", @"                        Tx MPDU Tid6");
    sub_1000299F4(v367, v179, @"NWAMWME_tid7", v362, v159, @"Counters", @"                        Tx MPDU Tid7");

LABEL_105:
    char v161 = 0;
    uint64_t v160 = 1;
    if ((v381 & 1) == 0) {
      goto LABEL_106;
    }
  }
  id v302 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v302, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "void populateNWActivityTxMpduWME(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopul"
                         "atorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonn"
                         "ull __strong, NSDictionary * _Nonnull __strong)";
    __int16 v398 = 1024;
    int v399 = 2084;
    _os_log_impl((void *)&_mh_execute_header, v302, OS_LOG_TYPE_ERROR, "%{public}s::%d:Bad sliceSpecificMessage", buf, 0x12u);
  }

  v303 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v303, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "void populateNWActivityTxMpduWME(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopul"
                         "atorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonn"
                         "ull __strong, NSDictionary * _Nonnull __strong)";
    __int16 v398 = 1024;
    int v399 = 2101;
    _os_log_impl((void *)&_mh_execute_header, v303, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", buf, 0x12u);
  }

LABEL_106:
  objc_destroyWeak(&v408);

  id v375 = v374;
  objc_initWeak(&v408, val);
  id v358 = v357;
  id v345 = v344;
  id v368 = v367;
  id v350 = objc_loadWeakRetained(&v408);
  v363 = sub_100025E34(v368);
  v180 = 0;
  uint64_t v181 = 0;
  char v182 = 1;
  while (2)
  {
    char v382 = v182;
    long long v394 = 0u;
    long long v395 = 0u;
    *(_OWORD *)v392 = 0u;
    long long v393 = 0u;
    v183 = [v368 objectForKeyedSubscript:v363];
    id v184 = [v183 allKeys];

    v185 = (char *)[v184 countByEnumeratingWithState:v392 objects:v409 count:16];
    if (v185)
    {
      uint64_t v186 = *(void *)v393;
      while (2)
      {
        for (k = 0; k != v185; ++k)
        {
          if (*(void *)v393 != v186) {
            objc_enumerationMutation(v184);
          }
          v188 = (void *)*((void *)v392[1] + (void)k);
          id v189 = [objc_alloc((Class)NSString) initWithFormat:@"%lu", v181];
          if ([v188 containsString:@"Rx MPDU WME Slice "]
            && ([v188 containsString:v189] & 1) != 0)
          {
            id v190 = v188;

            v180 = v190;
            goto LABEL_118;
          }
        }
        v185 = (char *)[v184 countByEnumeratingWithState:v392 objects:v409 count:16];
        if (v185) {
          continue;
        }
        break;
      }
    }
LABEL_118:

    if (!v180)
    {
LABEL_123:
      char v182 = 0;
      uint64_t v181 = 1;
      if ((v382 & 1) == 0) {
        goto LABEL_124;
      }
      continue;
    }
    break;
  }
  v191 = [v375 fieldForKey:@"NWACS_rxmpduWMEs"];
  v192 = [v191 repeatableValues];
  BOOL v193 = v192 == 0;

  if (v193)
  {
    v194 = [v350 getNewMessageForKey:@"NWAMWME" groupType:a3 forProcessWithToken:v358];
    v195 = [v375 fieldForKey:@"NWACS_rxmpduWMEs"];
    [v195 addRepeatableSubMessageValue:v194];

    v196 = [v375 fieldForKey:@"NWACS_rxmpduWMEs"];
    id v197 = [v194 copy];
    [v196 addRepeatableSubMessageValue:v197];
  }
  v198 = [v375 fieldForKey:@"NWACS_rxmpduWMEs"];
  v199 = [v198 repeatableValues];
  v200 = [v199 objectAtIndex:v181];

  if (v200)
  {
    sub_1000299F4(v368, v200, @"NWAMWME_tid0", v363, v180, @"Counters", @"                        Rx MPDU Tid0");
    sub_1000299F4(v368, v200, @"NWAMWME_tid1", v363, v180, @"Counters", @"                        Rx MPDU Tid1");
    sub_1000299F4(v368, v200, @"NWAMWME_tid2", v363, v180, @"Counters", @"                        Rx MPDU Tid2");
    sub_1000299F4(v368, v200, @"NWAMWME_tid3", v363, v180, @"Counters", @"                        Rx MPDU Tid3");
    sub_1000299F4(v368, v200, @"NWAMWME_tid4", v363, v180, @"Counters", @"                        Rx MPDU Tid4");
    sub_1000299F4(v368, v200, @"NWAMWME_tid5", v363, v180, @"Counters", @"                        Rx MPDU Tid5");
    sub_1000299F4(v368, v200, @"NWAMWME_tid6", v363, v180, @"Counters", @"                        Rx MPDU Tid6");
    sub_1000299F4(v368, v200, @"NWAMWME_tid7", v363, v180, @"Counters", @"                        Rx MPDU Tid7");

    goto LABEL_123;
  }
  v304 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v304, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "void populateNWActivityRxMpduWME(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopul"
                         "atorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonn"
                         "ull __strong, NSDictionary * _Nonnull __strong)";
    __int16 v398 = 1024;
    int v399 = 2139;
    _os_log_impl((void *)&_mh_execute_header, v304, OS_LOG_TYPE_ERROR, "%{public}s::%d:Bad sliceSpecificMessage", buf, 0x12u);
  }

  id v305 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v305, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "void populateNWActivityRxMpduWME(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopul"
                         "atorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonn"
                         "ull __strong, NSDictionary * _Nonnull __strong)";
    __int16 v398 = 1024;
    int v399 = 2156;
    _os_log_impl((void *)&_mh_execute_header, v305, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", buf, 0x12u);
  }

LABEL_124:
  objc_destroyWeak(&v408);

  id v376 = v375;
  objc_initWeak(&v408, val);
  id v359 = v358;
  id v346 = v345;
  id v369 = v368;
  id v351 = objc_loadWeakRetained(&v408);
  v364 = sub_100025E34(v369);
  v201 = 0;
  uint64_t v202 = 0;
  char v203 = 1;
  while (2)
  {
    char v383 = v203;
    long long v394 = 0u;
    long long v395 = 0u;
    *(_OWORD *)v392 = 0u;
    long long v393 = 0u;
    v204 = [v369 objectForKeyedSubscript:v364];
    v205 = [v204 allKeys];

    v206 = (char *)[v205 countByEnumeratingWithState:v392 objects:v409 count:16];
    if (v206)
    {
      uint64_t v207 = *(void *)v393;
      while (2)
      {
        for (m = 0; m != v206; ++m)
        {
          if (*(void *)v393 != v207) {
            objc_enumerationMutation(v205);
          }
          v209 = (void *)*((void *)v392[1] + (void)m);
          id v210 = [objc_alloc((Class)NSString) initWithFormat:@"%lu", v202];
          if ([v209 containsString:@"Rx MPDU Lost Slice "]
            && ([v209 containsString:v210] & 1) != 0)
          {
            id v211 = v209;

            v201 = v211;
            goto LABEL_136;
          }
        }
        v206 = (char *)[v205 countByEnumeratingWithState:v392 objects:v409 count:16];
        if (v206) {
          continue;
        }
        break;
      }
    }
LABEL_136:

    if (!v201)
    {
LABEL_141:
      char v203 = 0;
      uint64_t v202 = 1;
      if ((v383 & 1) == 0) {
        goto LABEL_142;
      }
      continue;
    }
    break;
  }
  v212 = [v376 fieldForKey:@"NWACS_rxmdpuLosts"];
  v213 = [v212 repeatableValues];
  BOOL v214 = v213 == 0;

  if (v214)
  {
    v215 = [v351 getNewMessageForKey:@"NWAML" groupType:a3 forProcessWithToken:v359];
    v216 = [v376 fieldForKey:@"NWACS_rxmdpuLosts"];
    [v216 addRepeatableSubMessageValue:v215];

    v217 = [v376 fieldForKey:@"NWACS_rxmdpuLosts"];
    id v218 = [v215 copy];
    [v217 addRepeatableSubMessageValue:v218];
  }
  v219 = [v376 fieldForKey:@"NWACS_rxmdpuLosts"];
  v220 = [v219 repeatableValues];
  v221 = [v220 objectAtIndex:v202];

  if (v221)
  {
    v222 = [v221 fieldForKey:@"NWAML_nonBALost"];
    id v223 = [v222 subMessageValue];

    v224 = [v221 fieldForKey:@"NWAML_bALost"];
    v225 = [v224 subMessageValue];

    sub_1000299F4(v369, v225, @"NWAMWME_tid0", v364, v201, @"Counters", @"                        Rx LOST MPDU BA Tid0");
    sub_1000299F4(v369, v225, @"NWAMWME_tid1", v364, v201, @"Counters", @"                        Rx LOST MPDU BA Tid1");
    sub_1000299F4(v369, v225, @"NWAMWME_tid2", v364, v201, @"Counters", @"                        Rx LOST MPDU BA Tid2");
    sub_1000299F4(v369, v225, @"NWAMWME_tid3", v364, v201, @"Counters", @"                        Rx LOST MPDU BA Tid3");
    sub_1000299F4(v369, v225, @"NWAMWME_tid4", v364, v201, @"Counters", @"                        Rx LOST MPDU BA Tid4");
    sub_1000299F4(v369, v225, @"NWAMWME_tid5", v364, v201, @"Counters", @"                        Rx LOST MPDU BA Tid5");
    sub_1000299F4(v369, v225, @"NWAMWME_tid6", v364, v201, @"Counters", @"                        Rx LOST MPDU BA Tid6");
    sub_1000299F4(v369, v225, @"NWAMWME_tid7", v364, v201, @"Counters", @"                        Rx LOST MPDU BA Tid7");
    sub_1000299F4(v369, v223, @"NWAMWME_tid0", v364, v201, @"Counters", @"                        Rx LOST MPDU NonBA Tid0");
    sub_1000299F4(v369, v223, @"NWAMWME_tid1", v364, v201, @"Counters", @"                        Rx LOST MPDU NonBA Tid1");
    sub_1000299F4(v369, v223, @"NWAMWME_tid2", v364, v201, @"Counters", @"                        Rx LOST MPDU NonBA Tid2");
    sub_1000299F4(v369, v223, @"NWAMWME_tid3", v364, v201, @"Counters", @"                        Rx LOST MPDU NonBA Tid3");
    sub_1000299F4(v369, v223, @"NWAMWME_tid4", v364, v201, @"Counters", @"                        Rx LOST MPDU NonBA Tid4");
    sub_1000299F4(v369, v223, @"NWAMWME_tid5", v364, v201, @"Counters", @"                        Rx LOST MPDU NonBA Tid5");
    sub_1000299F4(v369, v223, @"NWAMWME_tid6", v364, v201, @"Counters", @"                        Rx LOST MPDU NonBA Tid6");
    sub_1000299F4(v369, v223, @"NWAMWME_tid7", v364, v201, @"Counters", @"                        Rx LOST MPDU NonBA Tid7");

    goto LABEL_141;
  }
  id v306 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v306, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "void populateNWActivityLostMpdu(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopula"
                         "torMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnu"
                         "ll __strong, NSDictionary * _Nonnull __strong)";
    __int16 v398 = 1024;
    int v399 = 2195;
    _os_log_impl((void *)&_mh_execute_header, v306, OS_LOG_TYPE_ERROR, "%{public}s::%d:Bad sliceSpecificMessage", buf, 0x12u);
  }

  id v307 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v307, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "void populateNWActivityLostMpdu(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopula"
                         "torMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnu"
                         "ll __strong, NSDictionary * _Nonnull __strong)";
    __int16 v398 = 1024;
    int v399 = 2224;
    _os_log_impl((void *)&_mh_execute_header, v307, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", buf, 0x12u);
  }

LABEL_142:
  objc_destroyWeak(&v408);

  id v226 = v376;
  id v384 = v359;
  id v227 = v346;
  id v228 = v369;
  v229 = [v226 fieldForKey:@"NWACS_omi"];
  v230 = [v229 subMessageValue];

  uint64_t v231 = sub_100025E34(v228);
  char v232 = [v228 objectForKeyedSubscript:v231];
  char v233 = [v232 objectForKeyedSubscript:@"Slice 0"];
  if (v233)
  {
    id v234 = [v228 objectForKeyedSubscript:v231];
    v235 = [v234 objectForKeyedSubscript:@"Slice 0"];
    v236 = [v235 objectForKeyedSubscript:@"OMI Counters"];
    BOOL v237 = v236 == 0;

    if (v237) {
      goto LABEL_151;
    }
    v238 = [v228 objectForKeyedSubscript:v231];
    v239 = [v238 objectForKeyedSubscript:@"Slice 1"];
    if (v239)
    {
      v240 = [v228 objectForKeyedSubscript:v231];
      BOOL v241 = [v240 objectForKeyedSubscript:@"Slice 1"];
      v242 = [v241 objectForKeyedSubscript:@"OMI Counters"];
      BOOL v243 = v242 == 0;

      if (!v243)
      {
        sub_10002A0AC(v228, v230, @"NWAOMI_scheduled", v231, @"Total number of OMIs scheduled");
        sub_10002A0AC(v228, v230, @"NWAOMI_success", v231, @"OMI Tx Success");
        sub_10002A0AC(v228, v230, @"NWAOMI_retries", v231, @"OMI retries as TxDone not set");
        sub_10002A0AC(v228, v230, @"NWAOMI_completionDelay", v231, @"Accumulated duration of OMI completion time(ms)");
        sub_10002A0AC(v228, v230, @"NWAOMI_uLMUReq", v231, @"UL MU enable/disable change request");
        sub_10002A0AC(v228, v230, @"NWAOMI_uLMUAck", v231, @"UL MU enable/disable request txed successfully");
        sub_10002A0AC(v228, v230, @"NWAOMI_txNSTSReq", v231, @"Tx NSTS change request");
        sub_10002A0AC(v228, v230, @"NWAOMI_txNSTSAck", v231, @"Tx NSTS change request txed successfully");
        sub_10002A0AC(v228, v230, @"NWAOMI_rxNSSReq", v231, @"Rx NSS change request");
        sub_10002A0AC(v228, v230, @"NWAOMI_rxNSSAck", v231, @"Rx NSS change request txed successfully");
        sub_10002A0AC(v228, v230, @"NWAOMI_chBWReq", v231, @"Channel Width change request");
        sub_10002A0AC(v228, v230, @"NWAOMI_chBWAck", v231, @"Channel Width hange request txed successfully");
        sub_10002A0AC(v228, v230, @"NWAOMI_eRSUReq", v231, @"ER SU enable/disable req");
        sub_10002A0AC(v228, v230, @"NWAOMI_eRSUAck", v231, @"ER SU enable/disable req txed successfully");
        sub_10002A0AC(v228, v230, @"NWAOMI_dLResoundReq", v231, @"DL MU-MIMO Resound recommendation change req");
        sub_10002A0AC(v228, v230, @"NWAOMI_dLResoundAck", v231, @"DL MU-MIMO Resound recommendation request txed successfully");
        goto LABEL_151;
      }
    }
    else
    {
    }
    char v232 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v232, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v409 = 136446466;
      v410 = "void populateNWActivityOMI(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMessageDelegat"
             "e> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDictionary * _"
             "Nonnull __strong)";
      __int16 v411 = 1024;
      int v412 = 1903;
      _os_log_impl((void *)&_mh_execute_header, v232, OS_LOG_TYPE_ERROR, "%{public}s::%d:Missing Slice 1 OMI Counters", v409, 0x12u);
    }
  }

LABEL_151:
  id v360 = v226;
  objc_initWeak((id *)v409, val);
  id v339 = v384;
  id v336 = v227;
  id v377 = v228;
  id v244 = objc_loadWeakRetained((id *)v409);
  v245 = [v360 fieldForKey:@"NWACS_ruUsage"];
  v246 = [v245 subMessageValue];

  v247 = sub_100025E34(v377);
  v249 = [v377 objectForKeyedSubscript:v247];
  v250 = [v249 objectForKeyedSubscript:@"Slice 0"];
  if (!v250) {
    goto LABEL_156;
  }
  v251 = [v377 objectForKeyedSubscript:v247];
  char v252 = [v251 objectForKeyedSubscript:@"Slice 0"];
  v253 = [v252 objectForKeyedSubscript:@"Tx OFDMA RU Counters"];
  BOOL v254 = v253 == 0;

  if (v254) {
    goto LABEL_157;
  }
  v249 = [v377 objectForKeyedSubscript:v247];
  id v255 = [v249 objectForKeyedSubscript:@"Slice 1"];
  if (v255)
  {
    v256 = [v377 objectForKeyedSubscript:v247];
    uint64_t v257 = [v256 objectForKeyedSubscript:@"Slice 1"];
    char v258 = [v257 objectForKeyedSubscript:@"Tx OFDMA RU Counters"];
    BOOL v259 = v258 == 0;

    if (!v259) {
      sub_10002A318(v377, v246, v244, a3, v339, @"NWARU_txs", v247, @"Tx OFDMA RU Counters");
    }
  }
  else
  {
LABEL_156:
  }
LABEL_157:
  id v260 = [v377 objectForKeyedSubscript:v247];
  v261 = [v260 objectForKeyedSubscript:@"Slice 0"];
  if (!v261) {
    goto LABEL_162;
  }
  v262 = [v377 objectForKeyedSubscript:v247];
  BOOL v263 = [v262 objectForKeyedSubscript:@"Slice 0"];
  v264 = [v263 objectForKeyedSubscript:@"Rx OFDMA RU Counters"];
  BOOL v265 = v264 == 0;

  if (v265) {
    goto LABEL_163;
  }
  id v260 = [v377 objectForKeyedSubscript:v247];
  BOOL v266 = [v260 objectForKeyedSubscript:@"Slice 1"];
  if (v266)
  {
    v267 = [v377 objectForKeyedSubscript:v247];
    v268 = [v267 objectForKeyedSubscript:@"Slice 1"];
    v269 = [v268 objectForKeyedSubscript:@"Rx OFDMA RU Counters"];
    BOOL v270 = v269 == 0;

    if (!v270) {
      sub_10002A318(v377, v246, v244, a3, v339, @"NWARU_rxs", v247, @"Rx OFDMA RU Counters");
    }
  }
  else
  {
LABEL_162:
  }
LABEL_163:

  objc_destroyWeak((id *)v409);
  v271 = [v360 fieldForKey:@"NWACS_channelsVisited0"];
  [v271 setUint32Value:0];

  v272 = [v360 fieldForKey:@"NWACS_channelsVisited1"];
  [v272 setUint32Value:0];

  sub_100025E34(v377);
  v370 = (__CFString *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)v392 = 0u;
  long long v393 = 0u;
  long long v394 = 0u;
  long long v395 = 0u;
  v273 = [v377 allKeys];
  char v274 = (char *)[v273 countByEnumeratingWithState:v392 objects:v409 count:16];
  if (v274)
  {
    uint64_t v275 = *(void *)v393;
    while (2)
    {
      for (n = 0; n != v274; ++n)
      {
        if (*(void *)v393 != v275) {
          objc_enumerationMutation(v273);
        }
        v277 = (void *)*((void *)v392[1] + (void)n);
        if ([v277 containsString:@"CCPipe"])
        {
          id obja = v277;

          v273 = obja;
          goto LABEL_173;
        }
      }
      char v274 = (char *)[v273 countByEnumeratingWithState:v392 objects:v409 count:16];
      if (v274) {
        continue;
      }
      break;
    }
  }
  id obja = 0;
LABEL_173:

  sub_100026048(v377, v360, @"NWACS_controllerResets", v370, @"Controller", @"Driver Availability", @"Driver Transitioned to Unavailable");
  v278 = [v377 objectForKeyedSubscript:v370];
  v279 = [v278 objectForKeyedSubscript:@"TX STATUS"];
  v280 = [v279 objectForKeyedSubscript:@"TX Backoff Stuck"];

  v281 = v377;
  if (v280) {
    sub_100026048(v377, v360, @"NWACS_backoffStuck", v370, @"TX STATUS", @"TX Backoff Stuck", @"Backoff Stuck Detected");
  }
  uint64_t v282 = 0;
  char v283 = 1;
  v365 = @"NWACS_channelsVisited0";
  do
  {
    char v347 = v283;
    v385 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Channel Switch: Slice %lu", v282];
    v284 = [v281 objectForKeyedSubscript:v370];
    v285 = [v284 objectForKeyedSubscript:v385];
    BOOL v286 = v285 == 0;

    if (!v286)
    {
      long long v389 = 0u;
      long long v390 = 0u;
      long long v387 = 0u;
      long long v388 = 0u;
      id v287 = [v377 objectForKeyedSubscript:v370];
      v288 = [v287 objectForKeyedSubscript:v385];
      v289 = [v288 objectForKeyedSubscript:@"Channels Visited"];
      id v352 = [v289 allKeys];

      id v290 = [v352 countByEnumeratingWithState:&v387 objects:v396 count:16];
      if (v290)
      {
        uint64_t v354 = *(void *)v388;
        do
        {
          id v291 = 0;
          do
          {
            if (*(void *)v388 != v354) {
              objc_enumerationMutation(v352);
            }
            v292 = *(void **)(*((void *)&v387 + 1) + 8 * (void)v291);
            id v293 = v360;
            v294 = v365;
            v295 = v370;
            v296 = v385;
            v297 = v292;
            if (sub_100026C50(v377, v295, v296, @"Channels Visited", v297))
            {
              int IntegerValue = IOReportSimpleGetIntegerValue();
              id v299 = [v293 fieldForKey:v294];
              id v300 = [v293 fieldForKey:v294];
              -[NSObject setUint32Value:](v299, "setUint32Value:", [v300 uint32Value] + IntegerValue);
            }
            else
            {
              id v299 = WALogCategoryDefaultHandle();
              if (os_log_type_enabled(v299, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v409 = 136447490;
                v410 = "_Bool addUInt32FieldFromSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __stron"
                       "g, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSSt"
                       "ring * _Nonnull __strong, NSString * _Nonnull __strong)";
                __int16 v411 = 1024;
                int v412 = 154;
                __int16 v413 = 2112;
                CFStringRef v414 = v370;
                __int16 v415 = 2112;
                CFStringRef v416 = v385;
                __int16 v417 = 2112;
                CFStringRef v418 = @"Channels Visited";
                __int16 v419 = 2112;
                CFStringRef v420 = v297;
                _os_log_impl((void *)&_mh_execute_header, v299, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", v409, 0x3Au);
              }
            }

            id v291 = (char *)v291 + 1;
          }
          while (v290 != v291);
          id v301 = [v352 countByEnumeratingWithState:&v387 objects:v396 count:16];
          id v290 = v301;
        }
        while (v301);
      }
    }
    char v283 = 0;
    v365 = @"NWACS_channelsVisited1";
    uint64_t v282 = 1;
    v281 = v377;
  }
  while ((v347 & 1) != 0);
  sub_1000299F4(v377, v360, @"NWACS_commandsIssued", v370, @"Commander", @"Counters", @"Commands Issued");
  sub_100026048(v377, v360, @"NWACS_commanderHalted", v370, @"Commander", @"Counters", @"Commander Quiesce");
  sub_100026048(v377, v360, @"NWACS_iorSuccess", v370, @"IOReporter API", @"UpdateReport Calls", @"Success");
  sub_100026048(v377, v360, @"NWACS_iorWA", v370, @"IOReporter API", @"UpdateReport Calls", @"wifianalyticsd");
  sub_100026048(v377, v360, @"NWACS_ccCaptureDriverLogs", obja, @"CoreCapture", @"Pipe DriverLogs", @"                       Capture Requests");

  objc_destroyWeak(&location);
}

void sub_10000FC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location)
{
}

void sub_10000FDC8(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v50 = a1;
  id v47 = a2;
  id v48 = a3;
  id v8 = a4;
  v52 = v8;
  uint64_t v51 = sub_100025E34(v8);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v9 = [v8 objectForKeyedSubscript:v51];
  uint64_t v10 = [v9 allKeys];

  id v11 = [v10 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v62;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v62 != v12) {
        objc_enumerationMutation(v10);
      }
      id v14 = *(void **)(*((void *)&v61 + 1) + 8 * v13);
      if ([v14 containsString:@"Interface en"])
      {
        if ([v14 containsString:@"Peer 00:00:00:00:00:00"]) {
          break;
        }
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v10 countByEnumeratingWithState:&v61 objects:v69 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v22 = v14;

    if (!v22) {
      goto LABEL_11;
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v23 = [v52 objectForKeyedSubscript:v51];
    BOOL v24 = [v23 objectForKeyedSubscript:v22];
    v25 = [v24 allKeys];

    id v26 = [v25 countByEnumeratingWithState:&v57 objects:v68 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v58;
LABEL_24:
      uint64_t v28 = 0;
      while (1)
      {
        if (*(void *)v58 != v27) {
          objc_enumerationMutation(v25);
        }
        id v29 = *(void **)(*((void *)&v57 + 1) + 8 * v28);
        if ([v29 containsString:@"Link quality monitor measurements"]) {
          break;
        }
        if (v26 == (id)++v28)
        {
          id v26 = [v25 countByEnumeratingWithState:&v57 objects:v68 count:16];
          if (v26) {
            goto LABEL_24;
          }
          goto LABEL_30;
        }
      }
      id v30 = v29;

      if (!v30)
      {

        goto LABEL_48;
      }
      sub_1000299F4(v52, v50, @"WFAAWDLQM_cCA", v51, v22, v30, @"CCA (%) excluding own traffic");
      id v31 = v52;
      id v32 = v50;
      id v33 = v51;
      id v18 = v22;
      id v34 = v30;
      if (sub_100026C50(v31, v33, v18, v34, @"RSSI (dB)"))
      {
        uint64_t IntegerValue = IOReportSimpleGetIntegerValue();
        __int16 v37 = [v32 fieldForKey:@"WFAAWDLQM_rSSI"];
        [v37 setInt64Value:IntegerValue];
      }
      else
      {
        __int16 v37 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136447490;
          v71 = "_Bool fillInt64FieldFromSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, NSSt"
                "ring * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnul"
                "l __strong, NSString * _Nonnull __strong)";
          __int16 v72 = 1024;
          int v73 = 223;
          __int16 v74 = 2112;
          id v75 = v33;
          __int16 v76 = 2112;
          id v77 = v18;
          __int16 v78 = 2112;
          id v79 = v34;
          __int16 v80 = 2112;
          CFStringRef v81 = @"RSSI (dB)";
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", buf, 0x3Au);
        }
      }

      sub_1000299F4(v31, v32, @"WFAAWDLQM_txPhyRate", v33, v18, v34, @"Avg Tx Phy Rate (Mbps)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rxPhyRate", v33, v18, v34, @"Avg Rx Phy Rate (Mbps)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_txAMPDUDensity", v33, v18, v34, @"Mode Tx AMPDU Density");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_measurementDurMS", v33, v18, v34, @"Time since last measurement (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_concurrentIntDurMS", v33, v18, v34, @"Concurrent interfaces active duration (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_tVPMActiveDurationMS", v33, v18, v34, @"TVPM active duration (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_phyTxActivityDurMS", v33, v18, v34, @"Actual Tx activity duration (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_phyRxActivityDurMS", v33, v18, v34, @"Actual Rx activity duration (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_txSubBytes", v33, v18, v34, @"Submitted Tx bytes");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_txCompBytes", v33, v18, v34, @"Successfully completed Tx bytes");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_txDelayBytes", v33, v18, v34, @"Delayed Tx bytes from last measurement");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_offChanDurMS", v33, v18, v34, @"Off channel duration (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_txSubPkts", v33, v18, v34, @"Submitted Tx packet count");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_txCompPkts", v33, v18, v34, @"Successfully completed Tx packet (host reported) count");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_maxQueueFullDurMS", v33, v18, v34, @"Max Tx queue full duration (ms) across all AC's");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_avgTxLatencyMS", v33, v18, v34, @"Average Tx latency (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_bTAntennaDurMS", v33, v18, v34, @"BT antenna shared duration (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_outputThroughput", v33, v18, v34, @"Tx output throughput from WiFi chipset (Mbps)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_inputThroughput", v33, v18, v34, @"Tx input throughput from NW stack (Mbps)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_expectedThroughput", v33, v18, v34, @"Tx expected throughput for given channel conditions (Mbps)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_delayedThroughput", v33, v18, v34, @"Tx delayed throughput from last measurement period (Mbps)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_availWLANDurMS", v33, v18, v34, @"Available duration for WLAN activity (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_availWLANTxDurMS", v33, v18, v34, @"Available duration for WLAN Tx activity (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_availWLANRxDurMS", v33, v18, v34, @"Available duration for WLAN Rx activity (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_txRetries", v33, v18, v34, @"Tx retry count");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_txFails", v33, v18, v34, @"Tx failure count");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_txFrames", v33, v18, v34, @"Tx packet (FW reported) count");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rxOvflErrs", v33, v18, v34, @"Rx overflow errors");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rxFCSErrs", v33, v18, v34, @"Rx FCS errors");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rxPLCPErrs", v33, v18, v34, @"Rx PLCP errors");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rxCRSErrs", v33, v18, v34, @"Rx CRS glitches");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rxDupErrs", v33, v18, v34, @"Rx duplicate errors");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rxReplayErrs", v33, v18, v34, @"Rx replay errors");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rxDecryErrs", v33, v18, v34, @"Rx decrypt errors");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rxRetries", v33, v18, v34, @"Rx retry count");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rxGoodPlcps", v33, v18, v34, @"Rx good PLCP count");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rxFrames", v33, v18, v34, @"Rx packet (FW reported) count");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_sNR", v33, v18, v34, @"SNR");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_txExpectedAMPDUDensity", v33, v18, v34, @"Expected Tx AMPDU density");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rC1CoexDurationMS", v33, v18, v34, @"RC1 coex durations (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rC2CoexDurationMS", v33, v18, v34, @"RC2 coex durations (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_lTECoexDurationMS", v33, v18, v34, @"LTE coex durations (ms)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rxThroughput", v33, v18, v34, @"Rx throughput (Mbps)");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_aPTxDataStall", v33, v18, v34, @"AP Tx data stall");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_rxAmpduTxBaMismatch", v33, v18, v34, @"Rx AMPDU TxBA mismatch");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_symptomsFails", v33, v18, v34, @"Symptoms fails");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_is2GBand", v33, v18, v34, @"Is 2G band");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_isFGTraffic", v33, v18, v34, @"Is FG traffic");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_baselineThroughput", v33, v18, v34, @"Throughput test baseline");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_testThroughput", v33, v18, v34, @"Throughput test result");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_infraDutyCycle", v33, v18, v34, @"Infra duty cycle");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_lastScanReason", v33, v18, v34, @"Last scan reason");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_accessPointOUI", v33, v18, v34, @"AP MAC address");
      sub_1000299F4(v31, v32, @"WFAAWDLQM_timeSinceLastRecovery", v33, v18, v34, @"Time since last recovery");

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      BOOL v38 = [v31 objectForKeyedSubscript:v33];
      uint64_t v39 = [v38 objectForKeyedSubscript:v18];
      uint64_t v40 = [v39 allKeys];

      id v41 = [v40 countByEnumeratingWithState:&v53 objects:v67 count:16];
      if (!v41)
      {
LABEL_42:

LABEL_43:
        id v15 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          v71 = "void slowWiFiDiagnosticsCounterSample(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulator"
                "MessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong,"
                " NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
          __int16 v72 = 1024;
          int v73 = 2741;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup with contains Link quality monitor measurements", buf, 0x12u);
        }
        goto LABEL_14;
      }
      uint64_t v42 = *(void *)v54;
LABEL_36:
      uint64_t v43 = 0;
      while (1)
      {
        if (*(void *)v54 != v42) {
          objc_enumerationMutation(v40);
        }
        id v44 = *(void **)(*((void *)&v53 + 1) + 8 * v43);
        if ([v44 containsString:@"Link quality monitor states"]) {
          break;
        }
        if (v41 == (id)++v43)
        {
          id v41 = [v40 countByEnumeratingWithState:&v53 objects:v67 count:16];
          if (v41) {
            goto LABEL_36;
          }
          goto LABEL_42;
        }
      }
      id v45 = v44;

      if (!v45) {
        goto LABEL_43;
      }
      sub_10002AC08(v31, v32, @"WFAAWDLQM_txOutputBelowExpectedTrue", v33, v18, v45, @"Tx output throughput is below expected throughput", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_txOutputBelowExpectedFalse", v33, v18, v45, @"Tx output throughput is below expected throughput", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_txOutputBelowInputTrue", v33, v18, v45, @"Tx output throughput is below input throughput", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_txOutputBelowInputFalse", v33, v18, v45, @"Tx output throughput is below input throughput", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_txLowFrameCountTrue", v33, v18, v45, @"Tx frame count is too low for LQM analysis", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_txLowFrameCountFalse", v33, v18, v45, @"Tx frame count is too low for LQM analysis", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_rxLowFrameCountTrue", v33, v18, v45, @"Rx frame count is too low for LQM analysis", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_rxLowFrameCountFalse", v33, v18, v45, @"Rx frame count is too low for LQM analysis", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highTxLatencyTrue", v33, v18, v45, @"Tx latency is too high", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highTxLatencyFalse", v33, v18, v45, @"Tx latency is too high", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_lowTxPhyRateTrue", v33, v18, v45, @"Tx phy rate is below expectation", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_lowTxPhyRateFalse", v33, v18, v45, @"Tx phy rate is below expectation", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highTxPerTrue", v33, v18, v45, @"Tx PER is too high", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highTxPerFalse", v33, v18, v45, @"Tx PER is too high", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highTxRetriesTrue", v33, v18, v45, @"Tx retries are too high", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highTxRetriesFalse", v33, v18, v45, @"Tx retries are too high", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_txQueueFullTrue", v33, v18, v45, @"Atleast one tx queue is mostly full", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_txQueueFullFalse", v33, v18, v45, @"Atleast one tx queue is mostly full", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_lowTxAMPDUDensityTrue", v33, v18, v45, @"Tx AMPDU density is too low", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_lowTxAMPDUDensityFalse", v33, v18, v45, @"Tx AMPDU density is too low", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxRetriesTrue", v33, v18, v45, @"Rx retries are too high", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxRetriesFalse", v33, v18, v45, @"Rx retries are too high", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxPhyPERTrue", v33, v18, v45, @"Rx PHY PER is too high", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxPhyPERFalse", v33, v18, v45, @"Rx PHY PER is too high", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxFCSErrsTrue", v33, v18, v45, @"Rx FCS errors are too high", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxFCSErrsFalse", v33, v18, v45, @"Rx FCS errors are too high", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxOverflowsTrue", v33, v18, v45, @"Rx overflows are too high", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxOverflowsFalse", v33, v18, v45, @"Rx overflows are too high", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxDupsTrue", v33, v18, v45, @"Rx duplicates are too high", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxDupsFalse", v33, v18, v45, @"Rx duplicates are too high", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxReplaysTrue", v33, v18, v45, @"Rx replays are too high", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxReplaysFalse", v33, v18, v45, @"Rx replays are too high", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxDecryptErrsTrue", v33, v18, v45, @"Rx decrypt errors are too high", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxDecryptErrsFalse", v33, v18, v45, @"Rx decrypt errors are too high", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxDataPERTrue", v33, v18, v45, @"Rx data PER is too high", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_highRxDataPERFalse", v33, v18, v45, @"Rx data PER is too high", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_lowAvailWLANDurTrue", v33, v18, v45, @"Available WLAN duration is too low", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_lowAvailWLANDurFalse", v33, v18, v45, @"Available WLAN duration is too low", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_lowAvailWLANTxDurTrue", v33, v18, v45, @"Available WLAN Tx duration is too low", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_lowAvailWLANTxDurFalse", v33, v18, v45, @"Available WLAN Tx duration is too low", @"FALSE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_lowAvailWLANRxDurTrue", v33, v18, v45, @"Available WLAN Rx duration is too low", @"TRUE");
      sub_10002AC08(v31, v32, @"WFAAWDLQM_lowAvailWLANRxDurFalse", v33, v18, v45, @"Available WLAN Rx duration is too low", @"FALSE");
    }
    else
    {
LABEL_30:
    }
  }
  else
  {
LABEL_10:

LABEL_11:
    id v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v52 objectForKeyedSubscript:v51];
      id v17 = [v16 allKeys];
      *(_DWORD *)buf = 136446722;
      v71 = "void slowWiFiDiagnosticsCounterSample(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMess"
            "ageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDicti"
            "onary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v72 = 1024;
      int v73 = 2661;
      __int16 v74 = 2112;
      id v75 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find group Interface en0 Peer 00:... we have %@", buf, 0x1Cu);
    }
    id v18 = 0;
LABEL_14:

    v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v71 = "void slowWiFiDiagnosticsCounterSample(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMess"
            "ageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDicti"
            "onary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v72 = 1024;
      int v73 = 2814;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Mandatory IOReporter TxOutputBelowExpected is missing", buf, 0x12u);
    }

    if (!*a5)
    {
      NSErrorUserInfoKey v65 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v66 = @"WAErrorCodeTxOutputBelowExpectedMissing";
      v20 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      *a5 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9029 userInfo:v20];
    }
    id v21 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v71 = "void slowWiFiDiagnosticsCounterSample(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMess"
            "ageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDicti"
            "onary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v72 = 1024;
      int v73 = 2818;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", buf, 0x12u);
    }
  }
LABEL_48:
}

void sub_1000115B0(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  objc_initWeak(&location, a5);
  id v18 = a7;
  id v30 = a8;
  v19 = a9;
  id v20 = objc_loadWeakRetained(&location);
  id v21 = [v15 fieldForKey:@"DPSCS_controllerStats"];
  id v22 = [v21 subMessageValue];

  id v32 = 0;
  sub_10000B37C(v22, v20, a6, v18, v16, v17, &v32);
  id v29 = v16;
  uint64_t v23 = a6;
  id v24 = v32;
  v25 = [v15 fieldForKey:@"DPSCS_peerStats"];
  id v26 = [v25 subMessageValue];

  uint64_t v27 = [v26 fieldForKey:@"NWAPS_hashID"];
  [v27 setStringValue:@"00:00:00:00:00:00"];

  id v31 = v24;
  sub_1000117AC(v15, v26, v20, v23, v18, v29, v17, v30, &v31);
  id v28 = v31;

  v19[2](v19, v15, v28);
  objc_destroyWeak(&location);
}

void sub_100011794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1000117AC(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v126 = a1;
  id v15 = a2;
  objc_initWeak(&location, a3);
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = +[NSString stringWithFormat:@"Interface %@ Peer %@", v19, @"00:00:00:00:00:00"];
  v131 = +[NSString stringWithFormat:@"Interface %@", v19];
  char v127 = v19;
  id v129 = +[NSString stringWithFormat:@"Interface %@ Chip", v19];
  id val = objc_loadWeakRetained(&location);
  id v141 = v15;
  objc_initWeak(&v158, val);
  id v21 = v20;
  id v134 = v16;
  id v128 = v17;
  id v140 = v18;
  long long v144 = +[NSMutableDictionary dictionary];
  id v132 = objc_loadWeakRetained(&v158);
  uint64_t v22 = sub_100025E34(v140);
  id v138 = v21;
  long long v135 = (void *)v22;
  uint64_t v23 = [v140 objectForKeyedSubscript:v22];
  id v24 = [v23 objectForKeyedSubscript:v138];
  LODWORD(v18) = v24 == 0;

  if (!v18)
  {
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    v25 = [v140 objectForKeyedSubscript:v22];
    id v26 = [v25 objectForKeyedSubscript:v138];
    long long v137 = [v26 allKeys];

    uint64_t v27 = v137;
    id v28 = [v137 countByEnumeratingWithState:&v154 objects:buf count:16];
    if (!v28) {
      goto LABEL_43;
    }
    uint64_t v136 = *(void *)v155;
    while (1)
    {
      uint64_t v29 = 0;
      id v139 = v28;
      do
      {
        if (*(void *)v155 != v136) {
          objc_enumerationMutation(v27);
        }
        uint64_t v143 = v29;
        id v30 = *(void **)(*((void *)&v154 + 1) + 8 * v29);
        if (([v30 isEqualToString:@"DataPath BE"] & 1) != 0
          || ([v30 isEqualToString:@"DataPath BK"] & 1) != 0
          || ([v30 isEqualToString:@"DataPath VO"] & 1) != 0
          || ([v30 isEqualToString:@"DataPath VI"] & 1) != 0)
        {
          long long v152 = 0u;
          long long v153 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          id v31 = [v141 fieldForKey:@"NWAPS_acCompletions"];
          id v32 = [v31 repeatableValues];

          id v33 = [v32 countByEnumeratingWithState:&v150 objects:v168 count:16];
          if (v33)
          {
            char v34 = 0;
            uint64_t v35 = *(void *)v151;
            do
            {
              for (int i = 0; i != v33; int i = (char *)i + 1)
              {
                if (*(void *)v151 != v35) {
                  objc_enumerationMutation(v32);
                }
                __int16 v37 = *(void **)(*((void *)&v150 + 1) + 8 * i);
                if ([v30 containsString:@"DataPath BE"])
                {
                  BOOL v38 = [v37 fieldForKey:@"NWAPACTC_ac"];
                  BOOL v39 = [v38 int32Value] == 3;

                  if (v39) {
                    goto LABEL_24;
                  }
                }
                if ([v30 containsString:@"DataPath BK"])
                {
                  uint64_t v40 = [v37 fieldForKey:@"NWAPACTC_ac"];
                  BOOL v41 = [v40 int32Value] == 2;

                  if (v41) {
                    goto LABEL_24;
                  }
                }
                if ([v30 containsString:@"DataPath VO"])
                {
                  uint64_t v42 = [v37 fieldForKey:@"NWAPACTC_ac"];
                  BOOL v43 = [v42 int32Value] == 4;

                  if (v43) {
                    goto LABEL_24;
                  }
                }
                if ([v30 containsString:@"DataPath VI"])
                {
                  id v44 = [v37 fieldForKey:@"NWAPACTC_ac"];
                  BOOL v45 = [v44 int32Value] == 5;

                  if (v45)
                  {
LABEL_24:
                    [v144 setObject:v37 forKeyedSubscript:v30];
                    char v34 = 1;
                  }
                }
              }
              id v33 = [v32 countByEnumeratingWithState:&v150 objects:v168 count:16];
            }
            while (v33);

            if (v34) {
              goto LABEL_40;
            }
          }
          else
          {
          }
          v46 = [v132 getNewMessageForKey:@"NWAPACTC" groupType:a4 forProcessWithToken:v134];
          id v47 = [v46 copy];
          [v144 setObject:v47 forKeyedSubscript:v30];

          if ([v30 containsString:@"DataPath BE"])
          {
            id v48 = [v144 objectForKeyedSubscript:v30];
            id v49 = [v48 fieldForKey:@"NWAPACTC_ac"];
            [v49 setInt32Value:3];
            goto LABEL_38;
          }
          if ([v30 containsString:@"DataPath BK"])
          {
            id v48 = [v144 objectForKeyedSubscript:v30];
            id v49 = [v48 fieldForKey:@"NWAPACTC_ac"];
            [v49 setInt32Value:2];
            goto LABEL_38;
          }
          if ([v30 containsString:@"DataPath VO"])
          {
            id v48 = [v144 objectForKeyedSubscript:v30];
            id v49 = [v48 fieldForKey:@"NWAPACTC_ac"];
            [v49 setInt32Value:4];
            goto LABEL_38;
          }
          if ([v30 containsString:@"DataPath VI"])
          {
            id v48 = [v144 objectForKeyedSubscript:v30];
            id v49 = [v48 fieldForKey:@"NWAPACTC_ac"];
            [v49 setInt32Value:5];
LABEL_38:
          }
          id v50 = [v141 fieldForKey:@"NWAPS_acCompletions"];
          uint64_t v51 = [v144 objectForKeyedSubscript:v30];
          [v50 addRepeatableSubMessageValue:v51];

LABEL_40:
          v52 = [v144 objectForKeyedSubscript:v30];
          sub_100026048(v140, v52, @"NWAPACTC_success", v135, v138, v30, @"Total Successfull Completions");
          sub_100026048(v140, v52, @"NWAPACTC_durSinceLastSuccessfulComp", v135, v138, v30, @"Duration Since Last Successful Completion");
          sub_100026048(v140, v52, @"NWAPACTC_failedComp", v135, v138, v30, @"Total Failed Completions");
          sub_100026048(v140, v52, @"NWAPACTC_durSinceLastFailedComp", v135, v138, v30, @"Duration Since Last Failed Completion");
          sub_100026048(v140, v52, @"NWAPACTC_expiredComp", v135, v138, v30, @"Expired Completions");
          sub_100026048(v140, v52, @"NWAPACTC_noAckComp", v135, v138, v30, @"NoACK Completions");
          sub_100026048(v140, v52, @"NWAPACTC_otherErrComp", v135, v138, v30, @"OtherErr Completions");
          sub_100026048(v140, v52, @"NWAPACTC_durSinceLastEnqueue", v135, v138, v30, @"Duration Since Last Enqueue");
          sub_100026048(v140, v52, @"NWAPACTC_qeuedPackets", v135, v138, v30, @"Queued Packets Waiting For Completion");
          sub_100026048(v140, v52, @"NWAPACTC_sinceLastEnqueueHowManyFailed", v135, v138, v30, @"Since Last Enqueue How Many Failed Completions");
          sub_100026048(v140, v52, @"NWAPACTC_sinceLastEnqueueHowManySuccess", v135, v138, v30, @"Since Last Enqueue How Many Successfull Completions");
          sub_100026048(v140, v52, @"NWAPACTC_sinceLastSuccessHowManyFailed", v135, v138, v30, @"Since Last Success How Many Failed Completions");
          sub_100026048(v140, v52, @"NWAPACTC_durSinceLastEnqueueAtLastCheck", v135, v138, v30, @"Duration Since Last Enqueue At Last Check");
          sub_100026048(v140, v52, @"NWAPACTC_successfulCompletionsAtLastCheck", v135, v138, v30, @"Successfull Completions Since Last Check");
          sub_100026048(v140, v52, @"NWAPACTC_failedCompletionsAtLastCheck", v135, v138, v30, @"Failed Completions Since Last Check");
          sub_100026048(v140, v52, @"NWAPACTC_dpsNotifications", v135, v138, v30, @"Data Path Stuck Notifications");
        }
        uint64_t v27 = v137;
        uint64_t v29 = v143 + 1;
      }
      while ((id)(v143 + 1) != v139);
      id v28 = [v137 countByEnumeratingWithState:&v154 objects:buf count:16];
      if (!v28) {
        goto LABEL_43;
      }
    }
  }
  id v123 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
  {
    v124 = [v140 objectForKeyedSubscript:v22];
    id v125 = [v124 allKeys];
    *(_DWORD *)buf = 136446722;
    uint64_t v170 = "void populateNWActivityPerACCompletions(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMes"
           "sageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSDictionar"
           "y * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
    __int16 v171 = 1024;
    int v172 = 589;
    __int16 v173 = 2112;
    id v174 = v125;
    _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find group, we have %@", buf, 0x1Cu);
  }
  uint64_t v27 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v170 = "void populateNWActivityPerACCompletions(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMes"
           "sageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSDictionar"
           "y * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
    __int16 v171 = 1024;
    int v172 = 670;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", buf, 0x12u);
  }
LABEL_43:

  objc_destroyWeak(&v158);
  long long v53 = [v141 fieldForKey:@"NWAPS_completions"];
  long long v54 = [v53 subMessageValue];

  long long v55 = sub_100025E34(v140);
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  long long v56 = [v140 objectForKeyedSubscript:v55];
  long long v57 = [v56 allKeys];

  id v58 = [v57 countByEnumeratingWithState:&v145 objects:v167 count:16];
  if (v58)
  {
    uint64_t v59 = *(void *)v146;
LABEL_45:
    uint64_t v60 = 0;
    while (1)
    {
      if (*(void *)v146 != v59) {
        objc_enumerationMutation(v57);
      }
      long long v61 = *(void **)(*((void *)&v145 + 1) + 8 * v60);
      if ([v61 isEqualToString:v131]) {
        break;
      }
      if (v58 == (id)++v60)
      {
        id v58 = [v57 countByEnumeratingWithState:&v145 objects:v167 count:16];
        if (v58) {
          goto LABEL_45;
        }
        goto LABEL_51;
      }
    }
    id v66 = v61;

    if (!v66) {
      goto LABEL_52;
    }
    if ((sub_10002620C(v140, v141, val, a4, v134, @"NWAPS_ccas", v55, v131, @"Average CCA State", @"Interface Average CCA State") & 1) == 0)
    {
      v67 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v170 = "void populateNWActivityPeerStats(WAMessageAWD * _Nullable __strong, WAMessageAWD * _Nullable __strong, __"
               "weak id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDic"
               "tionary * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _"
               "Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v171 = 1024;
        int v172 = 703;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%{public}s::%d:Mandatory IOReporter Interface Average CCA State is missing", buf, 0x12u);
      }

      if (!*a9)
      {
        NSErrorUserInfoKey v165 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v166 = @"WAErrorCodeCCAMissing";
        v68 = +[NSDictionary dictionaryWithObjects:&v166 forKeys:&v165 count:1];
        *a9 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9021 userInfo:v68];
      }
    }
    sub_10002620C(v140, v141, val, a4, v134, @"NWAPS_snrs", v55, v131, @"LQM SNR State", @"LQM SNR State");
    if ((sub_10002620C(v140, v141, val, a4, v134, @"NWAPS_rssis", v55, v131, @"LQM RSSI State", @"LQM RSSI State") & 1) == 0)
    {
      v69 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v170 = "void populateNWActivityPeerStats(WAMessageAWD * _Nullable __strong, WAMessageAWD * _Nullable __strong, __"
               "weak id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDic"
               "tionary * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _"
               "Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v171 = 1024;
        int v172 = 711;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%{public}s::%d:Mandatory IOReporter LQM RSSI State is missing", buf, 0x12u);
      }

      if (!*a9)
      {
        NSErrorUserInfoKey v163 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v164 = @"WAErrorCodeRSSIMissing";
        v70 = +[NSDictionary dictionaryWithObjects:&v164 forKeys:&v163 count:1];
        *a9 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9022 userInfo:v70];
      }
    }
    v71 = [v140 objectForKeyedSubscript:v55];
    __int16 v72 = [v71 objectForKeyedSubscript:v138];
    int v73 = [v72 objectForKeyedSubscript:@"TxCompletion Latency"];
    __int16 v74 = [v73 objectForKeyedSubscript:@"Completion Latency Be"];

    if (v74)
    {
      sub_100027A50(v140, v141, val, a4, v134, @"NWAPS_txLatencyBEs", v55, v138, @"Completion Latency Be");
    }
    else
    {
      id v75 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v170 = "void populateNWActivityPeerStats(WAMessageAWD * _Nullable __strong, WAMessageAWD * _Nullable __strong, __"
               "weak id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDic"
               "tionary * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _"
               "Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v171 = 1024;
        int v172 = 720;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%{public}s::%d:Mandatory IOReporter TxCompletion Latency, Completion Latency Be is missing", buf, 0x12u);
      }

      if (*a9) {
        *a9 = 0;
      }
      NSErrorUserInfoKey v161 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v162 = @"WAErrorCodeTxLatencyBeMissing";
      __int16 v76 = +[NSDictionary dictionaryWithObjects:&v162 forKeys:&v161 count:1];
      *a9 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9024 userInfo:v76];
    }
    id v77 = [v140 objectForKeyedSubscript:v55];
    __int16 v78 = [v77 objectForKeyedSubscript:v138];
    id v79 = [v78 objectForKeyedSubscript:@"TxCompletion Latency"];
    __int16 v80 = [v79 objectForKeyedSubscript:@"Completion Latency Bk"];

    if (v80) {
      sub_100027A50(v140, v141, val, a4, v134, @"NWAPS_txLatencyBKs", v55, v138, @"Completion Latency Bk");
    }
    CFStringRef v81 = [v140 objectForKeyedSubscript:v55];
    id v82 = [v81 objectForKeyedSubscript:v138];
    v83 = [v82 objectForKeyedSubscript:@"TxCompletion Latency"];
    BOOL v84 = [v83 objectForKeyedSubscript:@"Completion Latency Vo"];

    if (v84) {
      sub_100027A50(v140, v141, val, a4, v134, @"NWAPS_txLatencyVOs", v55, v138, @"Completion Latency Vo");
    }
    id v85 = [v140 objectForKeyedSubscript:v55];
    id v86 = [v85 objectForKeyedSubscript:v138];
    uint64_t v87 = [v86 objectForKeyedSubscript:@"TxCompletion Latency"];
    v88 = [v87 objectForKeyedSubscript:@"Completion Latency Vi"];

    if (v88) {
      sub_100027A50(v140, v141, val, a4, v134, @"NWAPS_txLatencyVIs", v55, v138, @"Completion Latency Vi");
    }
    sub_1000266BC(v140, v141, val, a4, v134, 0, @"NWAPS_bytes", v55, v131, @"Data Bytes", @"Rx Bytes");
    sub_1000266BC(v140, v141, val, a4, v134, 3u, @"NWAPS_bytes", v55, v131, @"Data Bytes", @"BE Tx Bytes");
    sub_1000266BC(v140, v141, val, a4, v134, 2u, @"NWAPS_bytes", v55, v131, @"Data Bytes", @"BK Tx Bytes");
    sub_1000266BC(v140, v141, val, a4, v134, 5u, @"NWAPS_bytes", v55, v131, @"Data Bytes", @"VI Tx Bytes");
    sub_1000266BC(v140, v141, val, a4, v134, 4u, @"NWAPS_bytes", v55, v131, @"Data Bytes", @"VO Tx Bytes");
    sub_1000266BC(v140, v141, val, a4, v134, 1u, @"NWAPS_bytes", v55, v131, @"Data Bytes", @"Tx Bytes");
    v89 = [v140 objectForKeyedSubscript:v55];
    id v90 = [v89 objectForKeyedSubscript:v129];
    v91 = [v90 objectForKeyedSubscript:@"Rx Data Byte Counters"];

    if (v91)
    {
      sub_1000266BC(v140, v141, val, a4, v134, 6u, @"NWAPS_bytes", v55, v129, @"Rx Data Byte Counters", @"SU MPDU Bytes");
      sub_1000266BC(v140, v141, val, a4, v134, 8u, @"NWAPS_bytes", v55, v129, @"Rx Data Byte Counters", @"OFDMA MPDU Bytes");
      sub_1000266BC(v140, v141, val, a4, v134, 0xAu, @"NWAPS_bytes", v55, v129, @"Rx Data Byte Counters", @"MU MIMO MPDU Bytes");
    }
    BOOL v92 = [v140 objectForKeyedSubscript:v55];
    unsigned __int8 v93 = [v92 objectForKeyedSubscript:v129];
    v94 = [v93 objectForKeyedSubscript:@"Tx Data Byte Counters"];

    if (v94)
    {
      sub_1000266BC(v140, v141, val, a4, v134, 7u, @"NWAPS_bytes", v55, v129, @"Tx Data Byte Counters", @"SU MPDU Bytes");
      sub_1000266BC(v140, v141, val, a4, v134, 9u, @"NWAPS_bytes", v55, v129, @"Tx Data Byte Counters", @"OFDMA MPDU Bytes");
    }
    sub_1000266BC(v140, v141, val, a4, v134, 0, @"NWAPS_packets", v55, v131, @"Data Packets", @"Rx Packets");
    sub_1000266BC(v140, v141, val, a4, v134, 3u, @"NWAPS_packets", v55, v131, @"Data Packets", @"BE Tx Packets");
    sub_1000266BC(v140, v141, val, a4, v134, 2u, @"NWAPS_packets", v55, v131, @"Data Packets", @"BK Tx Packets");
    sub_1000266BC(v140, v141, val, a4, v134, 5u, @"NWAPS_packets", v55, v131, @"Data Packets", @"VI Tx Packets");
    sub_1000266BC(v140, v141, val, a4, v134, 4u, @"NWAPS_packets", v55, v131, @"Data Packets", @"VO Tx Packets");
    sub_1000266BC(v140, v141, val, a4, v134, 1u, @"NWAPS_packets", v55, v131, @"Data Packets", @"Tx Packets");
    v95 = [v140 objectForKeyedSubscript:v55];
    v96 = [v95 objectForKeyedSubscript:v129];
    id v97 = [v96 objectForKeyedSubscript:@"Rx Data Frame Counters"];

    if (v97)
    {
      sub_100026A40(v140, v141, val, a4, v134, 6, @"NWAPS_packets", v55, v129, @"Rx Data Frame Counters", @"SU MPDU Data");
      sub_100026A40(v140, v141, val, a4, v134, 8, @"NWAPS_packets", v55, v129, @"Rx Data Frame Counters", @"MU MIMO MPDU Data");
      sub_100026A40(v140, v141, val, a4, v134, 10, @"NWAPS_packets", v55, v129, @"Rx Data Frame Counters", @"OFDMA MPDU Data");
    }
    v98 = [v140 objectForKeyedSubscript:v55];
    uint64_t v99 = [v98 objectForKeyedSubscript:v129];
    double v100 = [v99 objectForKeyedSubscript:@"Tx Data Frame Counters"];

    if (v100)
    {
      sub_100026A40(v140, v141, val, a4, v134, 7, @"NWAPS_packets", v55, v129, @"Tx Data Frame Counters", @"SU MPDU Data");
      sub_100026A40(v140, v141, val, a4, v134, 9, @"NWAPS_packets", v55, v129, @"Tx Data Frame Counters", @"OFDMA MPDU Data");
    }
    sub_100026048(v140, v54, @"NWATC_success", v55, v138, @"Completions", @"Success");
    sub_100026048(v140, v54, @"NWATC_expired", v55, v138, @"Completions", @"Expired");
    sub_100026048(v140, v54, @"NWATC_nobuf", v55, v138, @"Completions", @"No Buffers");
    sub_100026048(v140, v54, @"NWATC_noack", v55, v138, @"Completions", @"No ACK");
    sub_100026048(v140, v54, @"NWATC_txfailure", v55, v138, @"Completions", @"Tx Failure");
    sub_100026048(v140, v54, @"NWATC_noresources", v55, v138, @"Completions", @"No Resources");
    sub_100026048(v140, v54, @"NWATC_ioerror", v55, v138, @"Completions", @"IO Error");
    sub_100026048(v140, v54, @"NWATC_mbfree", v55, v138, @"Completions", @"MB Free");
    sub_100026048(v140, v54, @"NWATC_mbfree", v55, v138, @"Completions", @"MB Free");
    sub_100026048(v140, v54, @"NWATC_chipmodeerror", v55, v138, @"Completions", @"Chip Mode Error");
    sub_100026048(v140, v54, @"NWATC_noremotepeer", v55, v138, @"Completions", @"No Remote Peer");
    sub_100026048(v140, v54, @"NWATC_internalerror", v55, v138, @"Completions", @"Internal Error");
    if (!sub_10002A9E8(v140, v141, @"NWAPS_rssiValue", v55, v131, @"LQM RSSI", @"LQM RSSI value"))
    {
      double v101 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v170 = "void populateNWActivityPeerStats(WAMessageAWD * _Nullable __strong, WAMessageAWD * _Nullable __strong, __"
               "weak id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDic"
               "tionary * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _"
               "Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v171 = 1024;
        int v172 = 789;
        _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "%{public}s::%d:Mandatory IOReporter LQM RSSI value is missing", buf, 0x12u);
      }

      if (!*a9)
      {
        NSErrorUserInfoKey v159 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v160 = @"WAErrorCodeRSSIMissing";
        v102 = +[NSDictionary dictionaryWithObjects:&v160 forKeys:&v159 count:1];
        *a9 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9022 userInfo:v102];
      }
    }
    id v103 = [v140 objectForKeyedSubscript:v55];
    unsigned int v104 = [v103 objectForKeyedSubscript:v138];
    id v105 = [v104 objectForKeyedSubscript:@"RSSI"];
    id v106 = [v105 objectForKeyedSubscript:@"Core 0 RSSI value"];

    if (v106) {
      sub_10002A9E8(v140, v141, @"NWAPS_rssiValue0", v55, v138, @"RSSI", @"Core 0 RSSI value");
    }
    uint64_t v107 = [v140 objectForKeyedSubscript:v55];
    v108 = [v107 objectForKeyedSubscript:v138];
    v109 = [v108 objectForKeyedSubscript:@"RSSI"];
    v110 = [v109 objectForKeyedSubscript:@"Core 1 RSSI value"];

    if (v110) {
      sub_10002A9E8(v140, v141, @"NWAPS_rssiValue1", v55, v138, @"RSSI", @"Core 1 RSSI value");
    }
    sub_10002A9E8(v140, v141, @"NWAPS_snrValue", v55, v131, @"LQM SNR", @"LQM SNR value");
    sub_100026048(v140, v141, @"NWAPS_ccaValue", v55, v131, @"Average CCA", @"Interface Avgerage CCA");
    v111 = [v140 objectForKeyedSubscript:v55];
    int v112 = [v111 objectForKeyedSubscript:v131];
    unsigned __int8 v113 = [v112 objectForKeyedSubscript:@"Noise Floor"];
    char v114 = [v113 objectForKeyedSubscript:@"Noise Floor Value"];

    if (v114) {
      sub_10002A9E8(v140, v141, @"NWAPS_nfValue", v55, v131, @"Noise Floor", @"Noise Floor Value");
    }
    id v115 = [v140 objectForKeyedSubscript:v55];
    v116 = [v115 objectForKeyedSubscript:v131];
    v117 = [v116 objectForKeyedSubscript:@"OFDM Desense"];
    v118 = [v117 objectForKeyedSubscript:@"OFDM Desense Value"];

    if (v118) {
      sub_100026048(v140, v141, @"NWAPS_ofdmDesense", v55, v131, @"OFDM Desense", @"OFDM Desense Value");
    }
    id v119 = [v140 objectForKeyedSubscript:v55];
    id v120 = [v119 objectForKeyedSubscript:v131];
    id v121 = [v120 objectForKeyedSubscript:@"IBSS CCA"];
    v122 = [v121 objectForKeyedSubscript:@"Interface IBSS CCA"];

    if (v122)
    {
      sub_100026048(v140, v141, @"NWAPS_ibssCCA", v55, v131, @"IBSS CCA", @"Interface IBSS CCA");
      sub_100026048(v140, v141, @"NWAPS_obssCCA", v55, v131, @"OBSS CCA", @"Interface OBSS CCA");
      sub_100026048(v140, v141, @"NWAPS_interferenceCCA", v55, v131, @"Interference CCA", @"Interface Interference CCA");
    }
    sub_100026048(v140, v141, @"NWAPS_qbssCCA", v55, v131, @"QBSS Values", @"Channel Utilization");
    sub_100026048(v140, v141, @"NWAPS_qbssSTACount", v55, v131, @"QBSS Values", @"Station Count");
  }
  else
  {
LABEL_51:

LABEL_52:
    long long v62 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      long long v63 = [v140 objectForKeyedSubscript:v55];
      long long v64 = [v63 allKeys];
      *(_DWORD *)buf = 136446722;
      uint64_t v170 = "void populateNWActivityPeerStats(WAMessageAWD * _Nullable __strong, WAMessageAWD * _Nullable __strong, __we"
             "ak id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDiction"
             "ary * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnul"
             "l __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v171 = 1024;
      int v172 = 699;
      __int16 v173 = 2112;
      id v174 = v64;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find group, we have %@", buf, 0x1Cu);
    }
    NSErrorUserInfoKey v65 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v170 = "void populateNWActivityPeerStats(WAMessageAWD * _Nullable __strong, WAMessageAWD * _Nullable __strong, __we"
             "ak id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDiction"
             "ary * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnul"
             "l __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v171 = 1024;
      int v172 = 822;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", buf, 0x12u);
    }

    id v66 = 0;
  }

  objc_destroyWeak(&location);
}

void sub_1000135C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,id location)
{
}

void sub_100013638(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  objc_initWeak(&location, a5);
  id v17 = a7;
  id v93 = a8;
  BOOL v92 = a9;
  id v90 = objc_loadWeakRetained(&location);
  id v18 = +[NSString stringWithFormat:@"Interface %@ Peer 00:00:00:00:00:00", v93];
  id v19 = v14;
  id v20 = v18;
  id v21 = v17;
  id v22 = v15;
  id v23 = v16;
  id v24 = sub_100025E34(v23);
  v25 = [v23 objectForKeyedSubscript:v24];
  id v26 = [v25 objectForKeyedSubscript:v20];
  uint64_t v27 = [v26 objectForKeyedSubscript:@"TxCompletion Snapshot BE"];

  if (v27)
  {
    id v28 = [v19 fieldForKey:@"DPSS_txCompletionSnapshotBE"];
    uint64_t v29 = [v28 subMessageValue];

    sub_100026048(v23, v29, @"DPSPACTCS_success", v24, v20, @"TxCompletion Snapshot BE", @"Success");
    sub_100026048(v23, v29, @"DPSPACTCS_dropped", v24, v20, @"TxCompletion Snapshot BE", @"Miscellaneous Drops");
    sub_100026048(v23, v29, @"DPSPACTCS_noBuf", v24, v20, @"TxCompletion Snapshot BE", @"NoBuff");
    sub_100026048(v23, v29, @"DPSPACTCS_noResources", v24, v20, @"TxCompletion Snapshot BE", @"NoResources");
    sub_100026048(v23, v29, @"DPSPACTCS_noAck", v24, v20, @"TxCompletion Snapshot BE", @"NoAck");
    sub_100026048(v23, v29, @"DPSPACTCS_chipModeError", v24, v20, @"TxCompletion Snapshot BE", @"ChipModeError");
    sub_100026048(v23, v29, @"DPSPACTCS_expired", v24, v20, @"TxCompletion Snapshot BE", @"Expired");
    sub_100026048(v23, v29, @"DPSPACTCS_txFailure", v24, v20, @"TxCompletion Snapshot BE", @"TxFailure");
    sub_100026048(v23, v29, @"DPSPACTCS_firmwareFreePacket", v24, v20, @"TxCompletion Snapshot BE", @"FirmwareFreePacket");
    sub_100026048(v23, v29, @"DPSPACTCS_maxRetries", v24, v20, @"TxCompletion Snapshot BE", @"MaxRetries");
    sub_100026048(v23, v29, @"DPSPACTCS_forceLifetimeExp", v24, v20, @"TxCompletion Snapshot BE", @"ForceLifetimeExpired");

    int v30 = 1;
  }
  else
  {
    int v30 = 0;
  }
  id v31 = [v23 objectForKeyedSubscript:v24];
  id v32 = [v31 objectForKeyedSubscript:v20];
  id v33 = [v32 objectForKeyedSubscript:@"TxCompletion Snapshot BK"];

  if (v33)
  {
    char v34 = [v19 fieldForKey:@"DPSS_txCompletionSnapshotBK"];
    uint64_t v35 = [v34 subMessageValue];

    sub_100026048(v23, v35, @"DPSPACTCS_success", v24, v20, @"TxCompletion Snapshot BK", @"Success");
    sub_100026048(v23, v35, @"DPSPACTCS_dropped", v24, v20, @"TxCompletion Snapshot BK", @"Miscellaneous Drops");
    sub_100026048(v23, v35, @"DPSPACTCS_noBuf", v24, v20, @"TxCompletion Snapshot BK", @"NoBuff");
    sub_100026048(v23, v35, @"DPSPACTCS_noResources", v24, v20, @"TxCompletion Snapshot BK", @"NoResources");
    sub_100026048(v23, v35, @"DPSPACTCS_noAck", v24, v20, @"TxCompletion Snapshot BK", @"NoAck");
    sub_100026048(v23, v35, @"DPSPACTCS_chipModeError", v24, v20, @"TxCompletion Snapshot BK", @"ChipModeError");
    sub_100026048(v23, v35, @"DPSPACTCS_expired", v24, v20, @"TxCompletion Snapshot BK", @"Expired");
    sub_100026048(v23, v35, @"DPSPACTCS_txFailure", v24, v20, @"TxCompletion Snapshot BK", @"TxFailure");
    sub_100026048(v23, v35, @"DPSPACTCS_firmwareFreePacket", v24, v20, @"TxCompletion Snapshot BK", @"FirmwareFreePacket");
    sub_100026048(v23, v35, @"DPSPACTCS_maxRetries", v24, v20, @"TxCompletion Snapshot BK", @"MaxRetries");
    sub_100026048(v23, v35, @"DPSPACTCS_forceLifetimeExp", v24, v20, @"TxCompletion Snapshot BK", @"ForceLifetimeExpired");

    int v30 = 1;
  }
  v36 = [v23 objectForKeyedSubscript:v24];
  __int16 v37 = [v36 objectForKeyedSubscript:v20];
  BOOL v38 = [v37 objectForKeyedSubscript:@"TxCompletion Snapshot VO"];

  if (v38)
  {
    BOOL v39 = [v19 fieldForKey:@"DPSS_txCompletionSnapshotVO"];
    uint64_t v40 = [v39 subMessageValue];

    sub_100026048(v23, v40, @"DPSPACTCS_success", v24, v20, @"TxCompletion Snapshot VO", @"Success");
    sub_100026048(v23, v40, @"DPSPACTCS_dropped", v24, v20, @"TxCompletion Snapshot VO", @"Miscellaneous Drops");
    sub_100026048(v23, v40, @"DPSPACTCS_noBuf", v24, v20, @"TxCompletion Snapshot VO", @"NoBuff");
    sub_100026048(v23, v40, @"DPSPACTCS_noResources", v24, v20, @"TxCompletion Snapshot VO", @"NoResources");
    sub_100026048(v23, v40, @"DPSPACTCS_noAck", v24, v20, @"TxCompletion Snapshot VO", @"NoAck");
    sub_100026048(v23, v40, @"DPSPACTCS_chipModeError", v24, v20, @"TxCompletion Snapshot VO", @"ChipModeError");
    sub_100026048(v23, v40, @"DPSPACTCS_expired", v24, v20, @"TxCompletion Snapshot VO", @"Expired");
    sub_100026048(v23, v40, @"DPSPACTCS_txFailure", v24, v20, @"TxCompletion Snapshot VO", @"TxFailure");
    sub_100026048(v23, v40, @"DPSPACTCS_firmwareFreePacket", v24, v20, @"TxCompletion Snapshot VO", @"FirmwareFreePacket");
    sub_100026048(v23, v40, @"DPSPACTCS_maxRetries", v24, v20, @"TxCompletion Snapshot VO", @"MaxRetries");
    sub_100026048(v23, v40, @"DPSPACTCS_forceLifetimeExp", v24, v20, @"TxCompletion Snapshot VO", @"ForceLifetimeExpired");

    int v30 = 1;
  }
  BOOL v41 = [v23 objectForKeyedSubscript:v24];
  uint64_t v42 = [v41 objectForKeyedSubscript:v20];
  BOOL v43 = [v42 objectForKeyedSubscript:@"TxCompletion Snapshot VI"];

  if (v43)
  {
    id v44 = [v19 fieldForKey:@"DPSS_txCompletionSnapshotVI"];
    BOOL v45 = [v44 subMessageValue];

    sub_100026048(v23, v45, @"DPSPACTCS_success", v24, v20, @"TxCompletion Snapshot VI", @"Success");
    sub_100026048(v23, v45, @"DPSPACTCS_dropped", v24, v20, @"TxCompletion Snapshot VI", @"Miscellaneous Drops");
    sub_100026048(v23, v45, @"DPSPACTCS_noBuf", v24, v20, @"TxCompletion Snapshot VI", @"NoBuff");
    sub_100026048(v23, v45, @"DPSPACTCS_noResources", v24, v20, @"TxCompletion Snapshot VI", @"NoResources");
    sub_100026048(v23, v45, @"DPSPACTCS_noAck", v24, v20, @"TxCompletion Snapshot VI", @"NoAck");
    sub_100026048(v23, v45, @"DPSPACTCS_chipModeError", v24, v20, @"TxCompletion Snapshot VI", @"ChipModeError");
    sub_100026048(v23, v45, @"DPSPACTCS_expired", v24, v20, @"TxCompletion Snapshot VI", @"Expired");
    sub_100026048(v23, v45, @"DPSPACTCS_txFailure", v24, v20, @"TxCompletion Snapshot VI", @"TxFailure");
    sub_100026048(v23, v45, @"DPSPACTCS_firmwareFreePacket", v24, v20, @"TxCompletion Snapshot VI", @"FirmwareFreePacket");
    sub_100026048(v23, v45, @"DPSPACTCS_maxRetries", v24, v20, @"TxCompletion Snapshot VI", @"MaxRetries");
    sub_100026048(v23, v45, @"DPSPACTCS_forceLifetimeExp", v24, v20, @"TxCompletion Snapshot VI", @"ForceLifetimeExpired");
    id v46 = 0;
LABEL_10:

    goto LABEL_13;
  }
  if (!v30)
  {
    id v75 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "void populateDPSPerACTxCompletionSnapshot(WAMessageAWD * _Nullable __strong, __weak id<WAIORe"
                           "porterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSStrin"
                           "g * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDictionary * _Nonnull __strong, NS"
                           "Error * _Nullable __autoreleasing * _Nullable)";
      __int16 v97 = 1024;
      int v98 = 2559;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%{public}s::%d:Mandatory IOReporter TxCompletion Snapshot XX not found", buf, 0x12u);
    }

    NSErrorUserInfoKey v95 = NSLocalizedFailureReasonErrorKey;
    *(void *)buf = @"WAErrorCodeTxCompletionSnapshotMissing";
    BOOL v45 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v95 count:1];
    id v46 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9033 userInfo:v45];
    goto LABEL_10;
  }
  id v46 = 0;
LABEL_13:

  id v91 = v46;
  id v47 = v19;
  id v48 = v21;
  id v49 = v22;
  id v50 = v23;
  uint64_t v51 = [v47 fieldForKey:@"DPSS_btSnapshot"];
  v52 = [v51 subMessageValue];

  long long v53 = sub_100025E34(v50);
  long long v54 = [v50 objectForKeyedSubscript:v53];
  long long v55 = [v54 objectForKeyedSubscript:@"BT Coex"];
  BOOL v56 = v55 == 0;

  if (v56)
  {
    __int16 v76 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      id v77 = [v50 objectForKeyedSubscript:v53];
      __int16 v78 = [v77 allKeys];
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "void populateDPSBTCoexSnapshot(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopul"
                           "atorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _No"
                           "nnull __strong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v97 = 1024;
      int v98 = 2579;
      __int16 v99 = 2112;
      double v100 = v78;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find group, we have %@", buf, 0x1Cu);
    }
  }
  else
  {
    long long v57 = [v50 objectForKeyedSubscript:v53];
    id v58 = [v57 objectForKeyedSubscript:@"BT Coex"];
    uint64_t v59 = [v58 objectForKeyedSubscript:@"Coex Snapshot"];
    BOOL v60 = v59 == 0;

    if (!v60)
    {
      sub_100026048(v50, v52, @"DPSBTS_duration", v53, @"BT Coex", @"Coex Snapshot", @"BTDuration(s)");
      sub_100026048(v50, v52, @"DPSBTS_use", v53, @"BT Coex", @"Coex Snapshot", @"BTUse(%)");
      sub_1000299F4(v50, v52, @"DPSBTS_ts", v53, @"BT Coex", @"Coex Snapshot", @"TS(ms)");
      goto LABEL_16;
    }
    __int16 v76 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      id v82 = [v50 objectForKeyedSubscript:v53];
      v83 = [v82 objectForKeyedSubscript:@"BT Coex"];
      v88 = [v83 allKeys];
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "void populateDPSBTCoexSnapshot(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopul"
                           "atorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _No"
                           "nnull __strong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v97 = 1024;
      int v98 = 2581;
      __int16 v99 = 2112;
      double v100 = v88;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup, we have %@", buf, 0x1Cu);
    }
  }

  BOOL v84 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "void populateDPSBTCoexSnapshot(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulat"
                         "orMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnul"
                         "l __strong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
    __int16 v97 = 1024;
    int v98 = 2590;
    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", buf, 0x12u);
  }

LABEL_16:
  id v61 = v47;
  id v62 = v48;
  id v63 = v49;
  id v64 = v50;
  NSErrorUserInfoKey v65 = [v61 fieldForKey:@"DPSS_awdlSnapshot"];
  id v66 = [v65 subMessageValue];

  v67 = sub_100025E34(v64);
  v68 = [v64 objectForKeyedSubscript:v67];
  v69 = [v68 objectForKeyedSubscript:@"AWDL Metrics"];
  BOOL v70 = v69 == 0;

  if (v70)
  {
    id v79 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      __int16 v80 = [v64 objectForKeyedSubscript:v67];
      CFStringRef v81 = [v80 allKeys];
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "void populateDPSAWDLSnapshot(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulat"
                           "orMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonn"
                           "ull __strong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v97 = 1024;
      int v98 = 2604;
      __int16 v99 = 2112;
      double v100 = v81;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find group, we have %@", buf, 0x1Cu);
    }
  }
  else
  {
    v71 = [v64 objectForKeyedSubscript:v67];
    __int16 v72 = [v71 objectForKeyedSubscript:@"AWDL Metrics"];
    int v73 = [v72 objectForKeyedSubscript:@"AWDL Snapshot"];
    BOOL v74 = v73 == 0;

    if (!v74)
    {
      sub_100026048(v64, v66, @"DPSAWDLS_duration", v67, @"AWDL Metrics", @"AWDL Snapshot", @"AWDLDuration(s)");
      sub_100026048(v64, v66, @"DPSAWDLS_use", v67, @"AWDL Metrics", @"AWDL Snapshot", @"AWDLUse(%)");
      sub_100026048(v64, v66, @"DPSAWDLS_sdb", v67, @"AWDL Metrics", @"AWDL Snapshot", @"SDB");
      sub_1000299F4(v64, v66, @"DPSAWDLS_ts", v67, @"AWDL Metrics", @"AWDL Snapshot", @"TS(ms)");
      goto LABEL_19;
    }
    id v79 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      id v85 = [v64 objectForKeyedSubscript:v67];
      id v86 = [v85 objectForKeyedSubscript:@"AWDL Metrics"];
      v89 = [v86 allKeys];
      *(_DWORD *)buf = 136446722;
      *(void *)&uint8_t buf[4] = "void populateDPSAWDLSnapshot(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulat"
                           "orMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonn"
                           "ull __strong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v97 = 1024;
      int v98 = 2606;
      __int16 v99 = 2112;
      double v100 = v89;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup, we have %@", buf, 0x1Cu);
    }
  }

  uint64_t v87 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "void populateDPSAWDLSnapshot(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulator"
                         "MessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull "
                         "__strong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
    __int16 v97 = 1024;
    int v98 = 2616;
    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", buf, 0x12u);
  }

LABEL_19:
  v92[2](v92, v61, v91);

  objc_destroyWeak(&location);
}

void sub_1000148EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100014908(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  objc_initWeak(&location, a5);
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = objc_loadWeakRetained(&location);
  id v22 = 0;
  sub_10000FDC8(v14, v17, v15, v16, &v22);
  id v21 = v22;

  v19[2](v19, v14, v21);
  objc_destroyWeak(&location);
}

void sub_100014A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_100014A20(id a1)
{
  uint64_t v1 = (void *)qword_1000F0F60;
  qword_1000F0F60 = (uint64_t)&off_1000E4360;
}

void sub_100014A38(id a1)
{
  uint64_t v1 = (void *)qword_1000F0F70;
  qword_1000F0F70 = (uint64_t)&off_1000E4378;
}

void sub_100014A50(id a1)
{
  uint64_t v1 = (void *)qword_1000F0F68;
  qword_1000F0F68 = (uint64_t)&off_1000E4390;
}

void sub_100014A68(id a1)
{
  uint64_t v1 = (void *)qword_1000F0F50;
  qword_1000F0F50 = (uint64_t)&off_1000E3F20;
}

void sub_100015370(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100015384(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _freeIORCaches];
  v3 = WALogCategoryDefaultHandle();
  v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 40);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, v5, "IOR freeIORCaches", "", v6, 2u);
  }
}

void sub_100015B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v8 - 40));
  _Unwind_Resume(a1);
}

void sub_100015B38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [WeakRetained _runIOLegendTest];
}

void sub_100016200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_100016220((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100016220(uint64_t a1)
{
  v2 = *(void **)(a1 + 56);
}

void sub_10001944C(_Unwind_Exception *a1)
{
}

void sub_1000195EC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100019600(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 11)) {
    [WeakRetained _unpersistIORObjects];
  }
  [v3 _signalPotentialNewIORChannels];
  v4 = WALogCategoryDefaultHandle();
  os_signpost_id_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)int64_t v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "IOR signalPotentialNewIORChannels", "", v7, 2u);
  }
}

id sub_10001B7A0(uint64_t a1)
{
  v2 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    uint64_t v8 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 1393;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:New Phy Type in use - rescanning", (uint8_t *)&v7, 0x12u);
  }

  +[WAUtil incrementValueForKey:@"Rescan Reason: New Phy Count" inMutableDict:*(void *)(*(void *)(a1 + 32) + 80) onQueue:*(void *)(*(void *)(a1 + 32) + 48)];
  [*(id *)(*(void *)(a1 + 32) + 80) removeObjectForKey:@"Rescan Reason: New Phy Date"];
  v3 = *(void **)(*(void *)(a1 + 32) + 80);
  v4 = +[NSDate now];
  [v3 setObject:v4 forKey:@"Rescan Reason: New Phy Date"];

  os_signpost_id_t v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    uint64_t v8 = "-[WAIOReporterMessagePopulator _delayedInvocationForRescan]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 1398;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _buildOrRescanToBuildChannelAvailabilityCaches:kWAIORIOReporterSearchUnfoundAndMutablePredicates", (uint8_t *)&v7, 0x12u);
  }

  [*(id *)(a1 + 32) _buildOrRescanToBuildChannelAvailabilityCaches:1];
  return [*(id *)(a1 + 32) _iorPreparedForSampling:0];
}

void sub_10001BA0C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10001BA20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 11)) {
    [WeakRetained _unpersistIORObjects];
  }
  v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    os_signpost_id_t v6 = "-[WAIOReporterMessagePopulator scanPredicatesNotYetFoundAndMutable]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 1432;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Running _scanPredicatesWithMode:kWAIORIOReporterSearchUnfoundAndMutablePredicates", (uint8_t *)&v5, 0x12u);
  }

  [v3 _scanPredicatesWithMode:1];
}

void sub_10001ED98(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10001EDAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 11)) {
    [WeakRetained _unpersistIORObjects];
  }
  +[WAUtil incrementValueForKey:@"External: Determine Channels Calls" inMutableDict:v3[10] onQueue:v3[6]];
  [v3 _findChannelsAndBuildChannelCaches:1];
  v4 = WALogCategoryDefaultHandle();
  int v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)__int16 v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "IOR determineChannelsPerIORPopulatable", "", v7, 2u);
  }
}

void sub_10001F1D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_10001F1F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 11)) {
    [WeakRetained _unpersistIORObjects];
  }
  [v3 _prepopulateMessage:*(void *)(a1 + 40) forProcess:*(void *)(a1 + 48) groupType:*(void *)(a1 + 72) andReply:*(void *)(a1 + 56) isResubscribe:0];
  v4 = WALogCategoryDefaultHandle();
  int v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 80);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)__int16 v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "IOR prepopulateMessage", "", v7, 2u);
  }
}

void sub_100020B24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 48);
  id v8 = a3;
  id v9 = a2;
  +[WAUtil incrementValueForKey:@"IOR Population via Dict" inMutableDict:v6 onQueue:v7];
  int v10 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR WAIORPopNWActivity Iterator", "", buf, 2u);
  }

  id v11 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)id v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOR WAIORPopNWActivity Reply", "", v14, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v12 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR WAIORPopNWActivity Reply", "", v13, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100020CC0(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1[4];
  uint64_t v6 = *(void *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 48);
  id v8 = a3;
  id v9 = a2;
  +[WAUtil incrementValueForKey:@"IOR Population via Dict" inMutableDict:v6 onQueue:v7];
  (*(void (**)(void))(a1[6] + 16))();

  int v10 = a1[5];

  dispatch_group_leave(v10);
}

void sub_100020D64(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1[4];
  uint64_t v6 = *(void *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 48);
  id v8 = a3;
  id v9 = a2;
  +[WAUtil incrementValueForKey:@"IOR Population via Dict" inMutableDict:v6 onQueue:v7];
  (*(void (**)(void))(a1[6] + 16))();

  int v10 = a1[5];

  dispatch_group_leave(v10);
}

void sub_100020E08(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 48);
  id v8 = a3;
  id v9 = a2;
  +[WAUtil incrementValueForKey:@"IOR Population via Dict" inMutableDict:v6 onQueue:v7];
  int v10 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR WAIORPopSlowWiFiDiagnosticsCounterSample Iterator", "", v11, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100020EFC(id a1)
{
  uint64_t v1 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 136446466;
    v4 = "-[WAIOReporterMessagePopulator _prepopulateMessage:forProcess:groupType:andReply:isResubscribe:]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 2109;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Population done", (uint8_t *)&v3, 0x12u);
  }

  v2 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v2))
  {
    LOWORD(v3) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOR PopulationGroup", "", (uint8_t *)&v3, 2u);
  }
}

void sub_1000218A0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1000218B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setFailNextCreateOrUpdateSample:1];
}

void sub_100021DDC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_100021DF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained unpersistIORObjects];
}

void sub_100022DE8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100022DFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _persistIORObjects:*(unsigned __int8 *)(a1 + 40)];
}

id sub_1000242FC(uint64_t a1)
{
  v2 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    __int16 v5 = "-[WAIOReporterMessagePopulator _delayedInvocationForPersist]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 2553;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Performing scheduled persist", (uint8_t *)&v4, 0x12u);
  }

  id result = [*(id *)(a1 + 32) _persistIORObjects:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  return result;
}

void sub_1000254C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v8 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_1000254E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000254F4(uint64_t a1)
{
}

void sub_1000254FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _getCachedUsage];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100025798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000257B0(uint64_t a1, uint64_t a2)
{
  int v4 = IOReportChannelGetDriverName();
  __int16 v5 = IOReportChannelGetGroup();
  __int16 v6 = IOReportChannelGetSubGroup();
  int v7 = IOReportChannelGetChannelName();
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v4];
  if (!v8)
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setValue:v9 forKey:v4];
    goto LABEL_14;
  }
  id v9 = v8;
  int v10 = [v8 objectForKeyedSubscript:v5];
  if (!v10)
  {
LABEL_14:
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [v9 setValue:v11 forKey:v5];
    goto LABEL_15;
  }
  id v11 = v10;
  uint64_t v12 = [v10 objectForKeyedSubscript:v6];
  if (!v12)
  {
LABEL_15:
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    [v11 setValue:v13 forKey:v6];
    goto LABEL_16;
  }
  id v13 = v12;
  uint64_t v14 = [v12 objectForKeyedSubscript:v7];
  if (!v14)
  {
LABEL_16:
    [v13 setValue:a2 forKey:v7];
    goto LABEL_12;
  }
  id v15 = (void *)v14;
  id v16 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136446722;
    id v21 = "-[WAIOReporterMessagePopulator _createStructuredIOReportDictionary:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 2810;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:Existing subgroupDict %@", (uint8_t *)&v20, 0x1Cu);
  }

  id v17 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136446722;
    id v21 = "-[WAIOReporterMessagePopulator _createStructuredIOReportDictionary:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 2811;
    __int16 v24 = 2112;
    id v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:Existing channelDict %@", (uint8_t *)&v20, 0x1Cu);
  }

  id v18 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136447746;
    id v21 = "-[WAIOReporterMessagePopulator _createStructuredIOReportDictionary:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 2812;
    __int16 v24 = 2112;
    id v25 = v4;
    __int16 v26 = 2112;
    uint64_t v27 = v5;
    __int16 v28 = 2112;
    uint64_t v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    __int16 v32 = 2112;
    uint64_t v33 = a2;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:how is there already a channel here? %@ %@ %@ %@ %@", (uint8_t *)&v20, 0x44u);
  }

LABEL_12:
  return 0;
}

id sub_100025E34(void *a1)
{
  id v1 = a1;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v2 = [v1 allKeys];
  id v3 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v24;
    uint64_t v18 = *(void *)v24;
    while (2)
    {
      for (int i = 0; i != v4; int i = (char *)i + 1)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v7 containsString:@"WLAN"])
        {
          id v17 = v7;
LABEL_19:

          uint64_t v14 = v7;
          goto LABEL_20;
        }
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v8 = [v1 objectForKeyedSubscript:v7];
        id v9 = [v8 allKeys];

        id v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v20;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              if ([*(id *)(*((void *)&v19 + 1) + 8 * (void)j) containsString:@"WLAN"])
              {
                id v15 = v7;

                goto LABEL_19;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v5 = v18;
      }
      id v4 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
  int v7 = v2;
LABEL_20:

  return v14;
}

void sub_100026048(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  if (sub_100026C50(v13, v16, v17, v18, v19))
  {
    uint64_t IntegerValue = IOReportSimpleGetIntegerValue();
    long long v22 = [v14 fieldForKey:v15];
    [v22 setUint32Value:IntegerValue];
  }
  else
  {
    long long v23 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136447490;
      long long v25 = "_Bool fillUInt32FieldFromSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, NSStrin"
            "g * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __str"
            "ong, NSString * _Nonnull __strong)";
      __int16 v26 = 1024;
      int v27 = 242;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      id v31 = v17;
      __int16 v32 = 2112;
      id v33 = v18;
      __int16 v34 = 2112;
      id v35 = v19;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", (uint8_t *)&v24, 0x3Au);
    }
  }
}

uint64_t sub_10002620C(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v38 = a1;
  id v46 = a2;
  objc_initWeak(&location, a3);
  id v45 = a5;
  id v44 = a6;
  id v39 = a7;
  id v40 = a8;
  id v41 = a9;
  id v42 = a10;
  id val = objc_loadWeakRetained(&location);
  if (sub_100026C50(v38, v39, v40, v41, v42))
  {
    int v52 = 0;
    char v16 = 0;
    while (v52 < (int)IOReportStateGetCount())
    {
      id v17 = IOReportStateGetNameForIndex();
      IOReportStateGetResidency();
      IOReportChannelGetUnit();
      IOReportScaleValue();
      double v19 = v18;
      id v51 = v46;
      objc_initWeak(&v58, val);
      id v49 = v45;
      id v20 = v17;
      id v21 = v44;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v50 = v21;
      long long v22 = [v51 fieldForKey:x0];
      long long v23 = [v22 repeatableValues];

      id v24 = [v23 countByEnumeratingWithState:&v54 objects:buf count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v55;
        while (2)
        {
          for (int i = 0; i != v24; int i = (char *)i + 1)
          {
            if (*(void *)v55 != v25) {
              objc_enumerationMutation(v23);
            }
            int v27 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            __int16 v28 = [v27 fieldForKey:@"NWASB_state"];
            id v29 = [v28 stringValue];
            unsigned __int8 v30 = [v29 isEqualToString:v20];

            if (v30)
            {
              id v33 = v27;
              goto LABEL_14;
            }
          }
          id v24 = [v23 countByEnumeratingWithState:&v54 objects:buf count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }

      id v31 = objc_loadWeakRetained(&v58);
      __int16 v32 = [v31 getNewMessageForKey:@"NWASB" groupType:a4 forProcessWithToken:v49];
      id v33 = [v32 copy];

      long long v23 = [v51 fieldForKey:v50];
      [v23 addRepeatableSubMessageValue:v33];
LABEL_14:

      __int16 v34 = [v33 fieldForKey:@"NWASB_residentTime"];
      [v34 setUint64Value:(unint64_t)v19];

      id v35 = [v33 fieldForKey:@"NWASB_state"];
      [v35 setStringValue:v20];

      objc_destroyWeak(&v58);
      ++v52;
      char v16 = 1;
    }
  }
  else
  {
    v36 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136447490;
      BOOL v60 = "_Bool fillStatesFromState(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, __weak id<WAI"
            "OReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSString * _Nonnull"
            " __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSStrin"
            "g * _Nonnull __strong)";
      __int16 v61 = 1024;
      int v62 = 372;
      __int16 v63 = 2112;
      id v64 = v39;
      __int16 v65 = 2112;
      id v66 = v40;
      __int16 v67 = 2112;
      id v68 = v41;
      __int16 v69 = 2112;
      id v70 = v42;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", buf, 0x3Au);
    }

    char v16 = 0;
  }

  objc_destroyWeak(&location);
  return v16 & 1;
}

void sub_10002667C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
}

void sub_1000266BC(void *a1, void *a2, void *a3, uint64_t a4, void *a5, unsigned int a6, void *a7, void *a8, void *a9, void *a10, void *a11)
{
  id v35 = a1;
  id v33 = a2;
  objc_initWeak(&location, a3);
  id v34 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  if (!sub_100026C50(v35, v18, v19, v20, v21))
  {
    __int16 v26 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136447490;
    id v38 = "_Bool fillNWTrafficStatsFromSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, __weak"
          " id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, WiFiAnalyticsA"
          "WDWiFiNWActivityTcategory, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __s"
          "trong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
    __int16 v39 = 1024;
    int v40 = 283;
    __int16 v41 = 2112;
    id v42 = v18;
    __int16 v43 = 2112;
    id v44 = v19;
    __int16 v45 = 2112;
    id v46 = v20;
    __int16 v47 = 2112;
    id v48 = v21;
    __int16 v28 = "%{public}s::%d:Failed to find %@ %@ %@ %@";
    id v29 = v26;
    uint32_t v30 = 58;
    goto LABEL_8;
  }
  uint64_t IntegerValue = IOReportSimpleGetIntegerValue();
  id v23 = v17;
  id v24 = v21;
  unsigned int v25 = [v23 characterAtIndex:[v23 length] - 1];
  if (v25 == objc_msgSend(v24, "characterAtIndex:", (char *)objc_msgSend(v24, "length") - 1))
  {

    __int16 v26 = objc_loadWeakRetained(&location);
    sub_1000277E0(v33, v26, a4, v34, IntegerValue, a6, v23);
    goto LABEL_9;
  }
  int v27 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    id v38 = "_Bool sanityCheckBetweenFieldAndChannelName(NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
    __int16 v39 = 1024;
    int v40 = 109;
    __int16 v41 = 2112;
    id v42 = v23;
    __int16 v43 = 2112;
    id v44 = v24;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s::%d:Potential field / channel mismatch for %@ and %@", buf, 0x26u);
  }

  __int16 v26 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136447746;
    id v38 = "_Bool fillNWTrafficStatsFromSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, __weak"
          " id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, WiFiAnalyticsA"
          "WDWiFiNWActivityTcategory, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __s"
          "trong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
    __int16 v39 = 1024;
    int v40 = 287;
    __int16 v41 = 2112;
    id v42 = v23;
    __int16 v43 = 2112;
    id v44 = v18;
    __int16 v45 = 2112;
    id v46 = v19;
    __int16 v47 = 2112;
    id v48 = v20;
    __int16 v49 = 2112;
    id v50 = v24;
    __int16 v28 = "%{public}s::%d:Sanity Failed field-channel mismatch %@ %@ %@ %@ %@";
    id v29 = v26;
    uint32_t v30 = 68;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
  }
LABEL_9:

  objc_destroyWeak(&location);
}

void sub_100026A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100026A40(void *a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7, void *a8, void *a9, void *a10, void *a11)
{
  id v27 = a1;
  id v26 = a2;
  objc_initWeak(&location, a3);
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  if (sub_100026C50(v27, v20, v21, v22, v23))
  {
    uint64_t IntegerValue = IOReportSimpleGetIntegerValue();
    unsigned int v25 = objc_loadWeakRetained(&location);
    sub_1000277E0(v26, v25, a4, v18, IntegerValue, a6, v19);
  }
  else
  {
    unsigned int v25 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136447490;
      uint32_t v30 = "_Bool fillNWTrafficStatsFromSimpleNoCheck(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __stron"
            "g, __weak id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, WiF"
            "iAnalyticsAWDWiFiNWActivityTcategory, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString *"
            " _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
      __int16 v31 = 1024;
      int v32 = 305;
      __int16 v33 = 2112;
      id v34 = v20;
      __int16 v35 = 2112;
      id v36 = v21;
      __int16 v37 = 2112;
      id v38 = v22;
      __int16 v39 = 2112;
      id v40 = v23;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", buf, 0x3Au);
    }
  }

  objc_destroyWeak(&location);
}

void sub_100026C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void *sub_100026C50(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = [v9 objectForKeyedSubscript:v10];
  id v15 = [v14 objectForKeyedSubscript:v11];
  char v16 = [v15 objectForKeyedSubscript:v12];
  id v17 = [v16 objectForKeyedSubscript:v13];

  if (!v17)
  {
    id v18 = [v9 objectForKeyedSubscript:v10];

    if (v18)
    {
      id v19 = [v9 objectForKeyedSubscript:v10];
      id v20 = [v19 objectForKeyedSubscript:v11];

      id v93 = v9;
      if (v20)
      {
        id v21 = [v9 objectForKeyedSubscript:v10];
        id v22 = [v21 objectForKeyedSubscript:v11];
        id v23 = [v22 objectForKeyedSubscript:v12];

        if (v23)
        {
          id v24 = [v9 objectForKeyedSubscript:v10];
          unsigned int v25 = [v24 objectForKeyedSubscript:v11];
          id v26 = [v25 objectForKeyedSubscript:v12];
          id v27 = [v26 objectForKeyedSubscript:v13];

          if (v27)
          {
            id v17 = 0;
            goto LABEL_66;
          }
          id v64 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            __int16 v65 = [v9 objectForKeyedSubscript:v10];
            id v66 = [v65 objectForKeyedSubscript:v11];
            __int16 v67 = [v66 objectForKeyedSubscript:v12];
            id v68 = [v67 allKeys];
            *(_DWORD *)buf = 136446978;
            v110 = "IOReportChannelRef  _Nullable getChRefFrom(NSDictionary * _Nonnull __strong, NSString * _Nonnull __st"
                   "rong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
            __int16 v111 = 1024;
            int v112 = 81;
            __int16 v113 = 2112;
            id v114 = v13;
            __int16 v115 = 2112;
            v116 = v68;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Looking for channel %@, choices are %@", buf, 0x26u);
          }
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          __int16 v69 = [v9 objectForKeyedSubscript:v10];
          id v70 = [v69 objectForKeyedSubscript:v11];
          v71 = [v70 objectForKeyedSubscript:v12];
          __int16 v28 = [v71 allKeys];

          id v72 = [v28 countByEnumeratingWithState:&v94 objects:v106 count:16];
          if (v72)
          {
            id v73 = v72;
            id v88 = v11;
            id v90 = v12;
            id v74 = v10;
            id v75 = v13;
            uint64_t v76 = *(void *)v95;
            while (2)
            {
              for (int i = 0; i != v73; int i = (char *)i + 1)
              {
                if (*(void *)v95 != v76) {
                  objc_enumerationMutation(v28);
                }
                __int16 v78 = *(void **)(*((void *)&v94 + 1) + 8 * i);
                if (objc_msgSend(v78, "containsString:", v75, v88))
                {
                  id v79 = v28;
                  __int16 v80 = WALogCategoryDefaultHandle();
                  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136446722;
                    v110 = "IOReportChannelRef  _Nullable getChRefFrom(NSDictionary * _Nonnull __strong, NSString * _Nonn"
                           "ull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
                    __int16 v111 = 1024;
                    int v112 = 84;
                    __int16 v113 = 2112;
                    id v114 = v78;
                    _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found match with contains %@", buf, 0x1Cu);
                  }

                  CFStringRef v81 = [v9 objectForKeyedSubscript:v74];
                  id v82 = [v81 objectForKeyedSubscript:v88];
                  v83 = [v82 objectForKeyedSubscript:v90];
                  id v17 = [v83 objectForKeyedSubscript:v78];

                  id v9 = v93;
                  __int16 v28 = v79;
                  if (v17)
                  {
                    id v85 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 136446466;
                      v110 = "IOReportChannelRef  _Nullable getChRefFrom(NSDictionary * _Nonnull __strong, NSString * _No"
                             "nnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
                      __int16 v111 = 1024;
                      int v112 = 87;
                      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Using match", buf, 0x12u);
                    }

                    goto LABEL_63;
                  }
                }
              }
              id v73 = [v28 countByEnumeratingWithState:&v94 objects:v106 count:16];
              if (v73) {
                continue;
              }
              break;
            }
            id v17 = 0;
LABEL_63:
            id v13 = v75;
            id v10 = v74;
            id v12 = v90;
LABEL_64:
            id v11 = v88;
            goto LABEL_65;
          }
        }
        else
        {
          __int16 v45 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            id v46 = [v9 objectForKeyedSubscript:v10];
            __int16 v47 = [v46 objectForKeyedSubscript:v11];
            id v48 = [v47 allKeys];
            *(_DWORD *)buf = 136446978;
            v110 = "IOReportChannelRef  _Nullable getChRefFrom(NSDictionary * _Nonnull __strong, NSString * _Nonnull __st"
                   "rong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
            __int16 v111 = 1024;
            int v112 = 69;
            __int16 v113 = 2112;
            id v114 = v12;
            __int16 v115 = 2112;
            v116 = v48;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Looking for subgroup %@, choices are %@", buf, 0x26u);
          }
          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          __int16 v49 = [v9 objectForKeyedSubscript:v10];
          id v50 = [v49 objectForKeyedSubscript:v11];
          __int16 v28 = [v50 allKeys];

          id v51 = [v28 countByEnumeratingWithState:&v98 objects:v107 count:16];
          if (v51)
          {
            id v52 = v51;
            id v88 = v11;
            id v53 = v12;
            id v92 = v10;
            id v54 = v13;
            uint64_t v55 = *(void *)v99;
            while (2)
            {
              for (j = 0; j != v52; j = (char *)j + 1)
              {
                if (*(void *)v99 != v55) {
                  objc_enumerationMutation(v28);
                }
                long long v57 = *(void **)(*((void *)&v98 + 1) + 8 * (void)j);
                if (objc_msgSend(v57, "containsString:", v53, v88))
                {
                  id v58 = v28;
                  uint64_t v59 = WALogCategoryDefaultHandle();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136446722;
                    v110 = "IOReportChannelRef  _Nullable getChRefFrom(NSDictionary * _Nonnull __strong, NSString * _Nonn"
                           "ull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
                    __int16 v111 = 1024;
                    int v112 = 72;
                    __int16 v113 = 2112;
                    id v114 = v57;
                    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found match with contains %@", buf, 0x1Cu);
                  }

                  BOOL v60 = [v9 objectForKeyedSubscript:v92];
                  __int16 v61 = [v60 objectForKeyedSubscript:v88];
                  int v62 = [v61 objectForKeyedSubscript:v57];
                  id v17 = [v62 objectForKeyedSubscript:v54];

                  id v9 = v93;
                  __int16 v28 = v58;
                  if (v17)
                  {
                    BOOL v84 = WALogCategoryDefaultHandle();
                    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 136446466;
                      v110 = "IOReportChannelRef  _Nullable getChRefFrom(NSDictionary * _Nonnull __strong, NSString * _No"
                             "nnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
                      __int16 v111 = 1024;
                      int v112 = 75;
                      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Using match", buf, 0x12u);
                    }

                    goto LABEL_59;
                  }
                }
              }
              id v52 = [v28 countByEnumeratingWithState:&v98 objects:v107 count:16];
              if (v52) {
                continue;
              }
              break;
            }
            id v17 = 0;
LABEL_59:
            id v13 = v54;
            id v10 = v92;
            id v12 = v53;
            goto LABEL_64;
          }
        }
      }
      else
      {
        uint32_t v30 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          __int16 v31 = [v9 objectForKeyedSubscript:v10];
          int v32 = [v31 allKeys];
          *(_DWORD *)buf = 136446978;
          v110 = "IOReportChannelRef  _Nullable getChRefFrom(NSDictionary * _Nonnull __strong, NSString * _Nonnull __stro"
                 "ng, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
          __int16 v111 = 1024;
          int v112 = 57;
          __int16 v113 = 2112;
          id v114 = v11;
          __int16 v115 = 2112;
          v116 = v32;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Looking for group %@, choices are %@", buf, 0x26u);
        }
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        __int16 v33 = [v9 objectForKeyedSubscript:v10];
        __int16 v28 = [v33 allKeys];

        id v34 = [v28 countByEnumeratingWithState:&v102 objects:v108 count:16];
        if (v34)
        {
          id v35 = v34;
          id v89 = v12;
          id v91 = v10;
          id v36 = v13;
          uint64_t v37 = *(void *)v103;
          uint64_t v87 = 136446722;
          while (2)
          {
            for (k = 0; k != v35; k = (char *)k + 1)
            {
              if (*(void *)v103 != v37) {
                objc_enumerationMutation(v28);
              }
              __int16 v39 = *(void **)(*((void *)&v102 + 1) + 8 * (void)k);
              if (objc_msgSend(v39, "containsString:", v11, v87))
              {
                id v40 = v28;
                __int16 v41 = WALogCategoryDefaultHandle();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = v87;
                  v110 = "IOReportChannelRef  _Nullable getChRefFrom(NSDictionary * _Nonnull __strong, NSString * _Nonnul"
                         "l __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
                  __int16 v111 = 1024;
                  int v112 = 60;
                  __int16 v113 = 2112;
                  id v114 = v39;
                  _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found match with contains %@", buf, 0x1Cu);
                }

                id v42 = [v9 objectForKeyedSubscript:v91];
                __int16 v43 = [v42 objectForKeyedSubscript:v39];
                id v44 = [v43 objectForKeyedSubscript:v89];
                id v17 = [v44 objectForKeyedSubscript:v36];

                id v9 = v93;
                __int16 v28 = v40;
                if (v17)
                {
                  __int16 v63 = WALogCategoryDefaultHandle();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136446466;
                    v110 = "IOReportChannelRef  _Nullable getChRefFrom(NSDictionary * _Nonnull __strong, NSString * _Nonn"
                           "ull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
                    __int16 v111 = 1024;
                    int v112 = 63;
                    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Using match", buf, 0x12u);
                  }

                  goto LABEL_40;
                }
              }
            }
            id v35 = [v28 countByEnumeratingWithState:&v102 objects:v108 count:16];
            if (v35) {
              continue;
            }
            break;
          }
          id v17 = 0;
LABEL_40:
          id v13 = v36;
          id v10 = v91;
          id v12 = v89;
          goto LABEL_65;
        }
      }
    }
    else
    {
      __int16 v28 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        id v29 = [v9 allKeys];
        *(_DWORD *)buf = 136446978;
        v110 = "IOReportChannelRef  _Nullable getChRefFrom(NSDictionary * _Nonnull __strong, NSString * _Nonnull __strong"
               ", NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
        __int16 v111 = 1024;
        int v112 = 55;
        __int16 v113 = 2112;
        id v114 = v10;
        __int16 v115 = 2112;
        v116 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Looking for driver %@, choices are %@", buf, 0x26u);
      }
    }
    id v17 = 0;
LABEL_65:
  }
LABEL_66:

  return v17;
}

void sub_1000277E0(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v25 = a3;
  id v28 = a1;
  objc_initWeak(&location, a2);
  id v27 = a4;
  id v11 = a7;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = [v28 fieldForKey:v11];
  id v13 = [v12 repeatableValues];

  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v30;
    while (2)
    {
      for (int i = 0; i != v14; int i = (char *)i + 1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v18 = [v17 fieldForKey:@"NWAT_traffic" v25];
        BOOL v19 = [v18 int32Value] == a6;

        if (v19)
        {
          id v22 = v17;
          goto LABEL_11;
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v20 = objc_loadWeakRetained(&location);
  id v21 = [v20 getNewMessageForKey:@"NWAT" groupType:v25 forProcessWithToken:v27];
  id v22 = [v21 copy];

  id v13 = [v28 fieldForKey:v11];
  [v13 addRepeatableSubMessageValue:v22];
LABEL_11:

  id v23 = [v22 fieldForKey:@"NWAT_traffic"];
  [v23 setInt32Value:a6];

  id v24 = [v22 fieldForKey:@"NWAT_value"];
  [v24 setUint64Value:a5];

  objc_destroyWeak(&location);
}

void sub_100027A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void sub_100027A50(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v23 = a1;
  id v29 = a2;
  objc_initWeak(&location, a3);
  id v28 = a5;
  id v27 = a6;
  id v24 = a7;
  id v25 = a8;
  id v26 = a9;
  id v16 = objc_loadWeakRetained(&location);
  if (sub_100026C50(v23, v24, v25, @"TxCompletion Latency", v26))
  {
    uint64_t UnitLabel = IOReportChannelGetUnitLabel();
    for (int i = 0; i < (int)IOReportHistogramGetBucketCount(); ++i)
    {
      IOReportHistogramGetBucketBounds();
      uint64_t BucketHits = IOReportHistogramGetBucketHits();
      id v21 = +[NSString stringWithFormat:@"%lld - %lld %@", 0, 0, UnitLabel];
      sub_100027CFC(v29, v16, a4, v28, v21, BucketHits, v27);
    }
  }
  else
  {
    id v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136447490;
      long long v32 = "_Bool fillHistogramFromHistogram(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, __weak"
            " id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSString * _"
            "Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, "
            "NSString * _Nonnull __strong)";
      __int16 v33 = 1024;
      int v34 = 396;
      __int16 v35 = 2112;
      id v36 = v24;
      __int16 v37 = 2112;
      id v38 = v25;
      __int16 v39 = 2112;
      CFStringRef v40 = @"TxCompletion Latency";
      __int16 v41 = 2112;
      id v42 = v26;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", buf, 0x3Au);
    }
  }
  objc_destroyWeak(&location);
}

void sub_100027CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void sub_100027CFC(void *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  id v30 = a1;
  objc_initWeak(&location, a2);
  id v28 = a4;
  id v11 = a5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v29 = a7;
  id v12 = [v30 fieldForKey:];
  id v13 = [v12 repeatableValues];

  id v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v32;
    while (2)
    {
      for (int i = 0; i != v14; int i = (char *)i + 1)
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v18 = [v17 fieldForKey:@"NWAHB_bin"];
        BOOL v19 = [v18 stringValue];
        unsigned __int8 v20 = [v19 isEqualToString:v11];

        if (v20)
        {
          id v23 = v17;
          goto LABEL_11;
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v21 = objc_loadWeakRetained(&location);
  id v22 = [v21 getNewMessageForKey:@"NWAHB" groupType:a3 forProcessWithToken:v28];
  id v23 = [v22 copy];

  id v13 = [v30 fieldForKey:v29];
  [v13 addRepeatableSubMessageValue:v23];
LABEL_11:

  id v24 = [v23 fieldForKey:@"NWAHB_hits"];
  [v24 setUint64Value:a6];

  id v25 = [v23 fieldForKey:@"NWAHB_bin"];
  [v25 setStringValue:v11];

  objc_destroyWeak(&location);
}

void sub_100027F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
}

void sub_100027F88(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = a1;
  id v141 = a2;
  id v142 = a3;
  id v9 = a4;
  id v140 = v8;
  id v10 = [v8 fieldForKey:@"NWACS_aggregateMetrics"];
  id v11 = [v10 subMessageValue];

  id v12 = [v11 fieldForKey:@"NWAAM_kRxDataErrors"];
  [v12 setUint64Value:0];

  id v13 = [v11 fieldForKey:@"NWAAM_kRxFrames"];
  [v13 setUint64Value:0];

  id v14 = [v11 fieldForKey:@"NWAAM_kRxRetryBitSet"];
  [v14 setUint64Value:0];

  uint64_t v15 = [v11 fieldForKey:@"NWAAM_kMACRxDataFrameMatchingRA"];
  [v15 setUint64Value:0];

  id v16 = [v11 fieldForKey:@"NWAAM_kMACRxDataFrameOtherRA"];
  [v16 setUint64Value:0];

  id v17 = [v11 fieldForKey:@"NWAAM_kMACRxControlFrameMatchingRA"];
  [v17 setUint32Value:0];

  id v18 = [v11 fieldForKey:@"NWAAM_kMACRxControlFrameOtherRA"];
  [v18 setUint32Value:0];

  BOOL v19 = [v11 fieldForKey:@"NWAAM_kRxGoodPLCP"];
  [v19 setUint64Value:0];

  unsigned __int8 v20 = [v11 fieldForKey:@"NWAAM_kRxBadPLCP"];
  [v20 setUint64Value:0];

  id v21 = [v11 fieldForKey:@"NWAAM_kRxBadFCS"];
  [v21 setUint64Value:0];

  id v22 = [v11 fieldForKey:@"NWAAM_kTxFrames"];
  [v22 setUint64Value:0];

  id v23 = [v11 fieldForKey:@"NWAAM_kTxRetransmission"];
  [v23 setUint64Value:0];

  id v24 = [v11 fieldForKey:@"NWAAM_kdot11RetryCount"];
  [v24 setUint64Value:0];

  id v25 = [v11 fieldForKey:@"NWAAM_kdot11MultipleRetryCount"];
  [v25 setUint64Value:0];

  id v26 = [v11 fieldForKey:@"NWAAM_kdot11RTSSuccessCount"];
  [v26 setUint64Value:0];

  id v27 = [v11 fieldForKey:@"NWAAM_kdot11RTSFailureCount"];
  [v27 setUint64Value:0];

  id v28 = [v11 fieldForKey:@"NWAAM_kCtlTxRTS"];
  [v28 setUint64Value:0];

  id v29 = [v11 fieldForKey:@"NWAAM_kRxCRCGlitch"];
  [v29 setUint64Value:0];

  id v30 = [v11 fieldForKey:@"NWAAM_kMACRxUnicastCTStoMAC"];
  [v30 setUint64Value:0];

  long long v31 = [v11 fieldForKey:@"NWAAM_kMACRxUnicastCTStoOther"];
  [v31 setUint64Value:0];

  long long v32 = [v11 fieldForKey:@"NWAAM_kMACRxUnicastRTStoMAC"];
  [v32 setUint64Value:0];

  long long v33 = [v11 fieldForKey:@"NWAAM_kMACRxUnicastRTStoOther"];
  [v33 setUint64Value:0];

  long long v34 = [v11 fieldForKey:@"NWAAM_kCtlTxCTS"];
  [v34 setUint64Value:0];

  __int16 v35 = [v11 fieldForKey:@"NWAAM_kRxBadOther"];
  [v35 setUint64Value:0];

  id v36 = sub_100025E34(v9);
  int v144 = 0;
  uint64_t v37 = 0;
  char v38 = 1;
  do
  {
    char v39 = v38;
    id v40 = [objc_alloc((Class)NSString) initWithFormat:@"Slice %lu", v37];
    __int16 v41 = [v9 objectForKeyedSubscript:v36];
    id v42 = [v41 objectForKeyedSubscript:v40];

    if (!v42) {
      goto LABEL_8;
    }
    __int16 v43 = [v9 objectForKeyedSubscript:v36];
    id v44 = [v43 objectForKeyedSubscript:v40];
    __int16 v45 = [v44 objectForKeyedSubscript:@"Rx Counters"];

    if (!v45)
    {
      long long v99 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        long long v100 = [v9 objectForKeyedSubscript:v36];
        long long v101 = [v100 objectForKeyedSubscript:v40];
        long long v102 = [v101 allKeys];
        *(_DWORD *)buf = 136446978;
        long long v148 = "void populateNWActivityAggregateMetrics(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulato"
               "rMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong,"
               " NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v149 = 1024;
        int v150 = 1695;
        __int16 v151 = 2112;
        *(void *)long long v152 = @"Rx Counters";
        *(_WORD *)&v152[8] = 2112;
        long long v153 = v102;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup %@, we have %@", buf, 0x26u);
      }
      LOBYTE(v67) = v144;
      LOBYTE(v138) = v144;
      LOBYTE(v139) = v144;
      goto LABEL_58;
    }
    sub_100029B94(v9, v11, @"NWAAM_kRxDataErrors", v36, v40, @"Rx Counters", @"Rx Data Errors");
    sub_100029B94(v9, v11, @"NWAAM_kRxFrames", v36, v40, @"Rx Counters", @"Rx Data Frames");
    sub_100029B94(v9, v11, @"NWAAM_kRxRetryBitSet", v36, v40, @"Rx Counters", @"Rx Retry bit set");
    id v46 = [v9 objectForKeyedSubscript:v36];
    __int16 v47 = [v46 objectForKeyedSubscript:v40];
    id v48 = [v47 objectForKeyedSubscript:@"Rx Error Counters"];

    if (!v48)
    {
      long long v99 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        long long v103 = [v9 objectForKeyedSubscript:v36];
        long long v104 = [v103 objectForKeyedSubscript:v40];
        long long v105 = [v104 allKeys];
        *(_DWORD *)buf = 136446978;
        long long v148 = "void populateNWActivityAggregateMetrics(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulato"
               "rMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong,"
               " NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v149 = 1024;
        int v150 = 1702;
        __int16 v151 = 2112;
        *(void *)long long v152 = @"Rx Error Counters";
        *(_WORD *)&v152[8] = 2112;
        long long v153 = v105;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup %@, we have %@", buf, 0x26u);
      }
      LOBYTE(v67) = 1;
      LOBYTE(v138) = v144;
      LOBYTE(v139) = v144;
      goto LABEL_58;
    }
    sub_100029B94(v9, v11, @"NWAAM_kRxGoodPLCP", v36, v40, @"Rx Error Counters", @"Rx Good PLCP");
    sub_100029B94(v9, v11, @"NWAAM_kRxBadPLCP", v36, v40, @"Rx Error Counters", @"Rx Bad PLCP");
    sub_100029B94(v9, v11, @"NWAAM_kRxBadFCS", v36, v40, @"Rx Error Counters", @"Rx Bad FCS");
    sub_100029B94(v9, v11, @"NWAAM_kRxCRCGlitch", v36, v40, @"Rx Error Counters", @"Rx CRC Glitch");
    sub_100029B94(v9, v11, @"NWAAM_kRxBadOther", v36, v40, @"Rx Error Counters", @"Any Other Rx Errors");
    __int16 v49 = [v9 objectForKeyedSubscript:v36];
    id v50 = [v49 objectForKeyedSubscript:v40];
    id v51 = [v50 objectForKeyedSubscript:@"Tx Counters"];

    if (!v51)
    {
      long long v99 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        id v106 = [v9 objectForKeyedSubscript:v36];
        uint64_t v107 = [v106 objectForKeyedSubscript:v40];
        v108 = [v107 allKeys];
        *(_DWORD *)buf = 136446978;
        long long v148 = "void populateNWActivityAggregateMetrics(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulato"
               "rMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong,"
               " NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v149 = 1024;
        int v150 = 1711;
        __int16 v151 = 2112;
        *(void *)long long v152 = @"Tx Counters";
        *(_WORD *)&v152[8] = 2112;
        long long v153 = v108;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup %@, we have %@", buf, 0x26u);
      }
      LOBYTE(v138) = 1;
      LOBYTE(v139) = v144;
      goto LABEL_57;
    }
    sub_100029B94(v9, v11, @"NWAAM_kTxFrames", v36, v40, @"Tx Counters", @"Tx Data Frames");
    sub_100029B94(v9, v11, @"NWAAM_kTxRetransmission", v36, v40, @"Tx Counters", @"Tx Retransmissions");
    id v52 = [v9 objectForKeyedSubscript:v36];
    id v53 = [v52 objectForKeyedSubscript:v40];
    id v54 = [v53 objectForKeyedSubscript:@"dot11 MIB Counters"];

    if (!v54)
    {
      long long v99 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        v109 = [v9 objectForKeyedSubscript:v36];
        v110 = [v109 objectForKeyedSubscript:v40];
        __int16 v111 = [v110 allKeys];
        *(_DWORD *)buf = 136446978;
        long long v148 = "void populateNWActivityAggregateMetrics(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulato"
               "rMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong,"
               " NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v149 = 1024;
        int v150 = 1717;
        __int16 v151 = 2112;
        *(void *)long long v152 = @"dot11 MIB Counters";
        *(_WORD *)&v152[8] = 2112;
        long long v153 = v111;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup %@, we have %@", buf, 0x26u);
      }
      LOBYTE(v138) = 1;
      LOBYTE(v139) = 1;
LABEL_57:
      LOBYTE(v67) = 1;
LABEL_58:

      int v94 = 0;
      BOOL v136 = 0;
      BOOL v95 = 0;
      goto LABEL_37;
    }
    sub_100029B94(v9, v11, @"NWAAM_kdot11MultipleRetryCount", v36, v40, @"dot11 MIB Counters", @"MSDU successfully transmits >= 1 attempt");
    sub_100029B94(v9, v11, @"NWAAM_kdot11RetryCount", v36, v40, @"dot11 MIB Counters", @"MSDU successfully transmits > 1 attempt");
    sub_100029B94(v9, v11, @"NWAAM_kdot11RTSSuccessCount", v36, v40, @"dot11 MIB Counters", @"CTS Rxd in response to RTS");
    sub_100029B94(v9, v11, @"NWAAM_kdot11RTSFailureCount", v36, v40, @"dot11 MIB Counters", @"CTS not Rxd in response to RTS");
    int v144 = 1;
LABEL_8:

    char v38 = 0;
    uint64_t v37 = 1;
  }
  while ((v39 & 1) != 0);
  int v143 = 0;
  uint64_t v55 = 0;
  char v56 = 1;
  do
  {
    char v57 = v56;
    id v58 = [objc_alloc((Class)NSString) initWithFormat:@"Slice Frames: slice  %lu", v55];
    uint64_t v59 = [v9 objectForKeyedSubscript:v36];
    BOOL v60 = [v59 objectForKeyedSubscript:v58];

    if (v60)
    {
      __int16 v61 = [v9 objectForKeyedSubscript:v36];
      int v62 = [v61 objectForKeyedSubscript:v58];
      __int16 v63 = [v62 objectForKeyedSubscript:@"Tx Control Frame Counters"];

      if (!v63)
      {
        int v112 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
        {
          __int16 v113 = [v9 objectForKeyedSubscript:v36];
          id v114 = [v113 objectForKeyedSubscript:v58];
          __int16 v115 = [v114 allKeys];
          *(_DWORD *)buf = 136446978;
          long long v148 = "void populateNWActivityAggregateMetrics(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopula"
                 "torMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __str"
                 "ong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
          __int16 v149 = 1024;
          int v150 = 1732;
          __int16 v151 = 2112;
          *(void *)long long v152 = @"Tx Control Frame Counters";
          *(_WORD *)&v152[8] = 2112;
          long long v153 = v115;
          _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup %@, we have %@", buf, 0x26u);
        }
        BOOL v136 = 0;
        goto LABEL_62;
      }
      sub_100029B94(v9, v11, @"NWAAM_kCtlTxRTS", v36, v58, @"Tx Control Frame Counters", @"Tx RTS");
      int v143 = 1;
    }

    char v56 = 0;
    uint64_t v55 = 1;
  }
  while ((v57 & 1) != 0);
  id v64 = [v9 objectForKeyedSubscript:v36];
  __int16 v65 = [v64 objectForKeyedSubscript:@"Chip Frames"];
  id v66 = [v65 objectForKeyedSubscript:@"Tx Control Frame Counters"];

  BOOL v136 = v66 != 0;
  if (v66) {
    sub_1000299F4(v9, v11, @"NWAAM_kCtlTxCTS", v36, @"Chip Frames", @"Tx Control Frame Counters", @"Tx CTS");
  }
  int v67 = v144;
  if (v144)
  {
LABEL_28:
    int v138 = v67;
    int v139 = v67;
LABEL_29:
    id v89 = [v9 objectForKeyedSubscript:v36];
    id v90 = [v89 objectForKeyedSubscript:@"Chip"];

    if (v90)
    {
      id v91 = [v9 objectForKeyedSubscript:v36];
      id v92 = [v91 objectForKeyedSubscript:@"Chip"];
      id v93 = [v92 objectForKeyedSubscript:@"Rx MAC Counters"];

      if (!v93)
      {
        v116 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
        {
          v117 = [v9 objectForKeyedSubscript:v36];
          v118 = [v117 objectForKeyedSubscript:@"Chip"];
          id v119 = [v118 allKeys];
          *(_DWORD *)buf = 136446978;
          long long v148 = "void populateNWActivityAggregateMetrics(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopula"
                 "torMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __str"
                 "ong, NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
          __int16 v149 = 1024;
          int v150 = 1783;
          __int16 v151 = 2112;
          *(void *)long long v152 = @"Rx MAC Counters";
          *(_WORD *)&v152[8] = 2112;
          long long v153 = v119;
          _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup %@, we have %@", buf, 0x26u);
        }
        BOOL v95 = 0;
        goto LABEL_36;
      }
      sub_1000299F4(v9, v11, @"NWAAM_kMACRxDataFrameMatchingRA", v36, @"Chip", @"Rx MAC Counters", @"Rx Data Frame matching RA");
      sub_1000299F4(v9, v11, @"NWAAM_kMACRxDataFrameOtherRA", v36, @"Chip", @"Rx MAC Counters", @"Rx Data Frame other RA");
      sub_100026048(v9, v11, @"NWAAM_kMACRxControlFrameMatchingRA", v36, @"Chip", @"Rx MAC Counters", @"Rx Control Frame matching RA");
      sub_100026048(v9, v11, @"NWAAM_kMACRxControlFrameOtherRA", v36, @"Chip", @"Rx MAC Counters", @"Rx Control Frame other RA");
      sub_1000299F4(v9, v11, @"NWAAM_kMACRxUnicastCTStoMAC", v36, @"Chip", @"Rx MAC Counters", @"Rx CTS to MAC");
      sub_1000299F4(v9, v11, @"NWAAM_kMACRxUnicastCTStoOther", v36, @"Chip", @"Rx MAC Counters", @"Rx CTS to Other");
      sub_1000299F4(v9, v11, @"NWAAM_kMACRxUnicastRTStoMAC", v36, @"Chip", @"Rx MAC Counters", @"Rx RTS to MAC");
      sub_1000299F4(v9, v11, @"NWAAM_kMACRxUnicastRTStoOther", v36, @"Chip", @"Rx MAC Counters", @"Rx RTS to Other");
      if (v66 && (v67 & v138 & v139 & v144 & 1) != 0)
      {
        if (v143) {
          goto LABEL_44;
        }
        int v94 = v143;
        BOOL v136 = 1;
        LOBYTE(v144) = 1;
        LOBYTE(v139) = 1;
        BOOL v95 = 1;
        goto LABEL_78;
      }
    }
    BOOL v95 = v90 != 0;
LABEL_36:
    int v94 = v143;
    goto LABEL_37;
  }
  id v68 = [v9 objectForKeyedSubscript:v36];
  __int16 v69 = [v68 objectForKeyedSubscript:@"Chip Frames"];
  id v70 = [v69 objectForKeyedSubscript:@"Tx Control Frame Counters"];

  if (v70)
  {
    sub_1000299F4(v9, v11, @"NWAAM_kCtlTxRTS", v36, @"Chip Frames", @"Tx Control Frame Counters", @"Tx RTS");
    int v143 = 1;
  }
  v71 = [v9 objectForKeyedSubscript:v36];
  id v72 = [v71 objectForKeyedSubscript:@"Chip"];

  if (!v72)
  {
    int v67 = v144;
    goto LABEL_28;
  }
  id v73 = [v9 objectForKeyedSubscript:v36];
  id v74 = [v73 objectForKeyedSubscript:@"Chip"];
  id v75 = [v74 objectForKeyedSubscript:@"Rx Counters"];

  if (!v75)
  {
    id v120 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
    {
      id v121 = [v9 objectForKeyedSubscript:v36];
      v122 = [v121 objectForKeyedSubscript:@"Chip"];
      id v123 = [v122 allKeys];
      *(_DWORD *)buf = 136446978;
      long long v148 = "void populateNWActivityAggregateMetrics(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorM"
             "essageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSD"
             "ictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v149 = 1024;
      int v150 = 1749;
      __int16 v151 = 2112;
      *(void *)long long v152 = @"Rx Counters";
      *(_WORD *)&v152[8] = 2112;
      long long v153 = v123;
      _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup %@, we have %@", buf, 0x26u);
    }
LABEL_62:
    BOOL v95 = 0;
    LOBYTE(v67) = v144;
    int v94 = v143 & 1;
    LOBYTE(v138) = v144;
    LOBYTE(v139) = v144;
    goto LABEL_37;
  }
  sub_1000299F4(v9, v11, @"NWAAM_kRxDataErrors", v36, @"Chip", @"Rx Counters", @"Rx Data Errors");
  sub_1000299F4(v9, v11, @"NWAAM_kRxFrames", v36, @"Chip", @"Rx Counters", @"Rx Data Frames");
  sub_1000299F4(v9, v11, @"NWAAM_kRxRetryBitSet", v36, @"Chip", @"Rx Counters", @"Rx Retry bit set");
  uint64_t v76 = [v9 objectForKeyedSubscript:v36];
  id v77 = [v76 objectForKeyedSubscript:@"Chip"];
  __int16 v78 = [v77 objectForKeyedSubscript:@"Rx Error Counters"];

  if (v78)
  {
    sub_1000299F4(v9, v11, @"NWAAM_kRxGoodPLCP", v36, @"Chip", @"Rx Error Counters", @"Rx Good PLCP");
    sub_1000299F4(v9, v11, @"NWAAM_kRxBadPLCP", v36, @"Chip", @"Rx Error Counters", @"Rx Bad PLCP");
    sub_1000299F4(v9, v11, @"NWAAM_kRxBadFCS", v36, @"Chip", @"Rx Error Counters", @"Rx Bad FCS");
    sub_1000299F4(v9, v11, @"NWAAM_kRxCRCGlitch", v36, @"Chip", @"Rx Error Counters", @"Rx CRC Glitch");
    id v79 = [v9 objectForKeyedSubscript:v36];
    __int16 v80 = [v79 objectForKeyedSubscript:@"Chip"];
    CFStringRef v81 = [v80 objectForKeyedSubscript:@"Rx Error Counters"];
    id v82 = [v81 objectForKeyedSubscript:@"Any Other Rx Errors"];

    if (v82) {
      sub_1000299F4(v9, v11, @"NWAAM_kRxBadOther", v36, @"Chip", @"Rx Error Counters", @"Any Other Rx Errors");
    }
    v83 = [v9 objectForKeyedSubscript:v36];
    BOOL v84 = [v83 objectForKeyedSubscript:@"Chip"];
    id v85 = [v84 objectForKeyedSubscript:@"Tx Counters"];

    if (v85)
    {
      sub_100029B94(v9, v11, @"NWAAM_kTxFrames", v36, @"Chip", @"Tx Counters", @"Tx Data Frames");
      sub_100029B94(v9, v11, @"NWAAM_kTxRetransmission", v36, @"Chip", @"Tx Counters", @"Tx Retransmissions");
      id v86 = [v9 objectForKeyedSubscript:v36];
      uint64_t v87 = [v86 objectForKeyedSubscript:@"Chip"];
      id v88 = [v87 objectForKeyedSubscript:@"dot11 MIB Counters"];

      if (v88)
      {
        sub_100029B94(v9, v11, @"NWAAM_kdot11MultipleRetryCount", v36, @"Chip", @"dot11 MIB Counters", @"MSDU successfully transmits >= 1 attempt");
        sub_100029B94(v9, v11, @"NWAAM_kdot11RetryCount", v36, @"Chip", @"dot11 MIB Counters", @"MSDU successfully transmits > 1 attempt");
        sub_100029B94(v9, v11, @"NWAAM_kdot11RTSSuccessCount", v36, @"Chip", @"dot11 MIB Counters", @"CTS Rxd in response to RTS");
        sub_100029B94(v9, v11, @"NWAAM_kdot11RTSFailureCount", v36, @"Chip", @"dot11 MIB Counters", @"CTS not Rxd in response to RTS");
        int v144 = 1;
        int v138 = 1;
        int v139 = 1;
        int v67 = 1;
        goto LABEL_29;
      }
      id v132 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
      {
        long long v133 = [v9 objectForKeyedSubscript:v36];
        id v134 = [v133 objectForKeyedSubscript:@"Chip"];
        long long v135 = [v134 allKeys];
        *(_DWORD *)buf = 136446978;
        long long v148 = "void populateNWActivityAggregateMetrics(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulato"
               "rMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong,"
               " NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v149 = 1024;
        int v150 = 1773;
        __int16 v151 = 2112;
        *(void *)long long v152 = @"dot11 MIB Counters";
        *(_WORD *)&v152[8] = 2112;
        long long v153 = v135;
        _os_log_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup %@, we have %@", buf, 0x26u);
      }
      BOOL v95 = 0;
      int v94 = v143 & 1;
      LOBYTE(v139) = 1;
LABEL_78:
      LOBYTE(v138) = 1;
    }
    else
    {
      id v128 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
      {
        id v129 = [v9 objectForKeyedSubscript:v36];
        id v130 = [v129 objectForKeyedSubscript:@"Chip"];
        v131 = [v130 allKeys];
        *(_DWORD *)buf = 136446978;
        long long v148 = "void populateNWActivityAggregateMetrics(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulato"
               "rMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong,"
               " NSDictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
        __int16 v149 = 1024;
        int v150 = 1767;
        __int16 v151 = 2112;
        *(void *)long long v152 = @"Tx Counters";
        *(_WORD *)&v152[8] = 2112;
        long long v153 = v131;
        _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup %@, we have %@", buf, 0x26u);
      }
      BOOL v95 = 0;
      int v94 = v143 & 1;
      LOBYTE(v138) = 1;
      LOBYTE(v139) = v144;
    }
    LOBYTE(v67) = 1;
  }
  else
  {
    v124 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
    {
      id v125 = [v9 objectForKeyedSubscript:v36];
      id v126 = [v125 objectForKeyedSubscript:@"Chip"];
      char v127 = [v126 allKeys];
      *(_DWORD *)buf = 136446978;
      long long v148 = "void populateNWActivityAggregateMetrics(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorM"
             "essageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSD"
             "ictionary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
      __int16 v149 = 1024;
      int v150 = 1756;
      __int16 v151 = 2112;
      *(void *)long long v152 = @"Rx Error Counters";
      *(_WORD *)&v152[8] = 2112;
      long long v153 = v127;
      _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find subgroup %@, we have %@", buf, 0x26u);
    }
    BOOL v95 = 0;
    int v94 = v143 & 1;
    LOBYTE(v67) = 1;
    LOBYTE(v138) = v144;
    LOBYTE(v139) = v144;
  }
LABEL_37:
  long long v96 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136448258;
    long long v148 = "void populateNWActivityAggregateMetrics(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMes"
           "sageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDicti"
           "onary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
    __int16 v149 = 1024;
    int v150 = 1801;
    __int16 v151 = 1024;
    *(_DWORD *)long long v152 = v67 & 1;
    *(_WORD *)&v152[4] = 1024;
    *(_DWORD *)&v152[6] = v138 & 1;
    LOWORD(v153) = 1024;
    *(_DWORD *)((char *)&v153 + 2) = v95;
    HIWORD(v153) = 1024;
    int v154 = v139 & 1;
    __int16 v155 = 1024;
    int v156 = v144 & 1;
    __int16 v157 = 1024;
    BOOL v158 = v136;
    __int16 v159 = 1024;
    int v160 = v94;
    _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%{public}s::%d:hasRxCounters %d hasRxErrorCounters %d hasRxMAC %d hasTxCounters %d hasdot11 %d hasTxCTS %d hasTxRTS %d", buf, 0x3Cu);
  }

  if (!*a5)
  {
    NSErrorUserInfoKey v145 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v146 = @"WAErrorCodeTxRxFrameCountersMissing";
    long long v97 = +[NSDictionary dictionaryWithObjects:&v146 forKeys:&v145 count:1];
    *a5 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9023 userInfo:v97];
  }
  long long v98 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    long long v148 = "void populateNWActivityAggregateMetrics(WAMessageAWD * _Nullable __strong, __weak id<WAIOReporterPopulatorMes"
           "sageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, NSDictionary * _Nonnull __strong, NSDicti"
           "onary * _Nonnull __strong, NSError * _Nullable __autoreleasing * _Nullable)";
    __int16 v149 = 1024;
    int v150 = 1806;
    _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed ", buf, 0x12u);
  }

LABEL_44:
}

void sub_1000299F4(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (sub_100026C50(a1, v15, v16, v17, v18))
  {
    uint64_t IntegerValue = IOReportSimpleGetIntegerValue();
    unsigned __int8 v20 = [v13 fieldForKey:v14];
    [v20 setUint64Value:IntegerValue];
  }
  else
  {
    id v21 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v22 = 136447490;
      id v23 = "_Bool fillUInt64FieldFromSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, NSStrin"
            "g * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __str"
            "ong, NSString * _Nonnull __strong)";
      __int16 v24 = 1024;
      int v25 = 120;
      __int16 v26 = 2112;
      id v27 = v15;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      id v31 = v17;
      __int16 v32 = 2112;
      id v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", (uint8_t *)&v22, 0x3Au);
    }
  }
}

void sub_100029B94(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (sub_100026C50(a1, v15, v16, v17, v18))
  {
    uint64_t IntegerValue = IOReportSimpleGetIntegerValue();
    unsigned __int8 v20 = [v13 fieldForKey:v14];
    id v21 = [v13 fieldForKey:v14];
    [v20 setUint64Value:((char *)[v21 uint64Value] + IntegerValue)];
  }
  else
  {
    int v22 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136447490;
      __int16 v24 = "_Bool addUInt64FieldFromSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, NSString"
            " * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __stro"
            "ng, NSString * _Nonnull __strong)";
      __int16 v25 = 1024;
      int v26 = 137;
      __int16 v27 = 2112;
      id v28 = v15;
      __int16 v29 = 2112;
      id v30 = v16;
      __int16 v31 = 2112;
      id v32 = v17;
      __int16 v33 = 2112;
      id v34 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", (uint8_t *)&v23, 0x3Au);
    }
  }
}

void sub_100029D5C(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  id v41 = a1;
  id v40 = a2;
  id v39 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = 0;
  unint64_t v20 = 0;
  uint64_t v37 = (a9 ^ 1u) + a8;
  id v38 = a7;
  id v36 = v18;
  while (1)
  {
    id v21 = v19;
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%@ %lu", v38, v20];

    int v23 = [v41 objectForKeyedSubscript:v16];
    __int16 v24 = [v23 objectForKeyedSubscript:v17];
    __int16 v25 = [v24 objectForKeyedSubscript:v18];
    int v26 = [v25 objectForKeyedSubscript:v19];

    if (v26) {
      break;
    }
LABEL_13:
    if (v37 == ++v20) {
      goto LABEL_14;
    }
  }
  if (sub_100026C50(v41, v16, v17, v18, v19))
  {
    uint64_t IntegerValue = IOReportSimpleGetIntegerValue();
    id v28 = [v40 fieldForKey:v39];
    __int16 v29 = [v28 repeatableValues];

    id v30 = [v29 count];
    if (a9)
    {
      if (!v30)
      {
        __int16 v31 = [v40 fieldForKey:v39];
        [v31 addRepeatableUInt64Value:0];

        id v32 = v40;
        id v33 = v39;
        id v18 = v36;
LABEL_11:
        id v34 = [v32 fieldForKey:v33];
        [v34 addRepeatableUInt64Value:IntegerValue];
        goto LABEL_12;
      }
    }
    else if (!v30)
    {
LABEL_10:
      id v33 = v39;
      id v32 = v40;
      goto LABEL_11;
    }
    if ((unint64_t)[v29 count] > v20)
    {
      id v34 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:IntegerValue];
      [v29 replaceObjectAtIndex:v20 withObject:v34];
LABEL_12:

      goto LABEL_13;
    }
    goto LABEL_10;
  }
  __int16 v35 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136447490;
    __int16 v43 = "_Bool fillUInt64ArrayFromAllKeysSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, NS"
          "String * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __"
          "strong, NSString * _Nonnull __strong, NSUInteger, _Bool)";
    __int16 v44 = 1024;
    int v45 = 428;
    __int16 v46 = 2112;
    id v47 = v16;
    __int16 v48 = 2112;
    id v49 = v17;
    __int16 v50 = 2112;
    id v51 = v18;
    __int16 v52 = 2112;
    id v53 = v19;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", buf, 0x3Au);
  }

LABEL_14:
}

void sub_10002A0AC(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a1;
  id v14 = sub_100026C50(v13, v11, @"Slice 0", @"OMI Counters", v12);
  id v15 = sub_100026C50(v13, v11, @"Slice 1", @"OMI Counters", v12);

  if (!v14)
  {
    id v18 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136447490;
      id v21 = "_Bool sum2GroupsUInt32FieldFromSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, N"
            "SString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull"
            " __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
      __int16 v22 = 1024;
      int v23 = 172;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2112;
      CFStringRef v27 = @"Slice 0";
      __int16 v28 = 2112;
      CFStringRef v29 = @"OMI Counters";
      __int16 v30 = 2112;
      id v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", (uint8_t *)&v20, 0x3Au);
    }
    goto LABEL_4;
  }
  if (v15)
  {
    int IntegerValue = IOReportSimpleGetIntegerValue();
    int v17 = IOReportSimpleGetIntegerValue();
    id v18 = [v9 fieldForKey:v10];
    [v18 setUint32Value:(v17 + IntegerValue)];
LABEL_4:

    goto LABEL_5;
  }
  id v19 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136447490;
    id v21 = "_Bool sum2GroupsUInt32FieldFromSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, NSS"
          "tring * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __s"
          "trong, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
    __int16 v22 = 1024;
    int v23 = 173;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2112;
    CFStringRef v27 = @"Slice 1";
    __int16 v28 = 2112;
    CFStringRef v29 = @"OMI Counters";
    __int16 v30 = 2112;
    id v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", (uint8_t *)&v20, 0x3Au);
  }

LABEL_5:
}

void sub_10002A318(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  id v14 = a1;
  id v53 = a2;
  objc_initWeak(&location, a3);
  id v54 = a5;
  id v55 = a6;
  id v15 = a7;
  id v16 = a8;
  id v56 = objc_loadWeakRetained(&location);
  int v17 = [v14 objectForKeyedSubscript:v15];
  id v18 = [v17 objectForKeyedSubscript:@"Slice 0"];
  LODWORD(a6) = v18 == 0;

  if (a6)
  {
    id v47 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v63 = "_Bool sum2GroupsHistogramFieldFromAllKeysSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __s"
          "trong, __weak id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, N"
          "SString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull _"
          "_strong, NSString * _Nonnull __strong)";
    __int16 v64 = 1024;
    int v65 = 191;
    __int16 v66 = 2112;
    id v67 = v15;
    __int16 v68 = 2112;
    CFStringRef v69 = @"Slice 0";
    __int16 v48 = "%{public}s::%d:Failed to find %@ %@";
    goto LABEL_31;
  }
  id v19 = [v14 objectForKeyedSubscript:v15];
  int v20 = [v19 objectForKeyedSubscript:@"Slice 0"];
  id v21 = [v20 objectForKeyedSubscript:v16];
  BOOL v22 = v21 == 0;

  if (v22)
  {
    id v47 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136447234;
    __int16 v63 = "_Bool sum2GroupsHistogramFieldFromAllKeysSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __s"
          "trong, __weak id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, N"
          "SString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull _"
          "_strong, NSString * _Nonnull __strong)";
    __int16 v64 = 1024;
    int v65 = 192;
    __int16 v66 = 2112;
    id v67 = v15;
    __int16 v68 = 2112;
    CFStringRef v69 = @"Slice 0";
    __int16 v70 = 2112;
    id v71 = v16;
    __int16 v48 = "%{public}s::%d:Failed to find %@ %@ %@";
    goto LABEL_34;
  }
  int v23 = [v14 objectForKeyedSubscript:v15];
  __int16 v24 = [v23 objectForKeyedSubscript:@"Slice 1"];
  BOOL v25 = v24 == 0;

  if (v25)
  {
    id v47 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136446978;
    __int16 v63 = "_Bool sum2GroupsHistogramFieldFromAllKeysSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __s"
          "trong, __weak id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, N"
          "SString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull _"
          "_strong, NSString * _Nonnull __strong)";
    __int16 v64 = 1024;
    int v65 = 193;
    __int16 v66 = 2112;
    id v67 = v15;
    __int16 v68 = 2112;
    CFStringRef v69 = @"Slice 1";
    __int16 v48 = "%{public}s::%d:Failed to find %@ %@";
LABEL_31:
    id v49 = v47;
    uint32_t v50 = 38;
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
    goto LABEL_24;
  }
  __int16 v26 = [v14 objectForKeyedSubscript:v15];
  CFStringRef v27 = [v26 objectForKeyedSubscript:@"Slice 1"];
  __int16 v28 = [v27 objectForKeyedSubscript:v16];
  BOOL v29 = v28 == 0;

  if (v29)
  {
    id v47 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136447234;
    __int16 v63 = "_Bool sum2GroupsHistogramFieldFromAllKeysSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __s"
          "trong, __weak id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull __strong, N"
          "SString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull _"
          "_strong, NSString * _Nonnull __strong)";
    __int16 v64 = 1024;
    int v65 = 194;
    __int16 v66 = 2112;
    id v67 = v15;
    __int16 v68 = 2112;
    CFStringRef v69 = @"Slice 1";
    __int16 v70 = 2112;
    id v71 = v16;
    __int16 v48 = "%{public}s::%d:Failed to find %@ %@ %@";
LABEL_34:
    id v49 = v47;
    uint32_t v50 = 48;
    goto LABEL_35;
  }
  __int16 v30 = [v14 objectForKeyedSubscript:v15];
  id v31 = [v30 objectForKeyedSubscript:@"Slice 0"];
  id v32 = [v31 objectForKeyedSubscript:v16];
  id v33 = [v32 allKeys];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v33;
  id v34 = [obj countByEnumeratingWithState:&v57 objects:v74 count:16];
  if (!v34) {
    goto LABEL_23;
  }
  uint64_t v35 = *(void *)v58;
  do
  {
    id v36 = 0;
    do
    {
      if (*(void *)v58 != v35) {
        objc_enumerationMutation(obj);
      }
      uint64_t v37 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v36);
      id v39 = sub_100026C50(v14, v15, @"Slice 0", v16, v37);
      id v40 = sub_100026C50(v14, v15, @"Slice 1", v16, v37);
      if (v39)
      {
        if (v40)
        {
          uint64_t IntegerValue = IOReportSimpleGetIntegerValue();
          uint64_t v42 = IOReportSimpleGetIntegerValue();
          sub_100027CFC(v53, v56, a4, v54, v37, v42 + IntegerValue, v55);
          int v43 = 1;
          goto LABEL_13;
        }
        __int16 v44 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136447490;
          __int16 v63 = "_Bool sum2GroupsHistogramFieldFromAllKeysSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullab"
                "le __strong, __weak id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull"
                " __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSS"
                "tring * _Nonnull __strong, NSString * _Nonnull __strong)";
          __int16 v64 = 1024;
          int v65 = 204;
          __int16 v66 = 2112;
          id v67 = v15;
          __int16 v68 = 2112;
          CFStringRef v69 = @"Slice 1";
          __int16 v70 = 2112;
          id v71 = v16;
          __int16 v72 = 2112;
          id v73 = v37;
          int v45 = v44;
          goto LABEL_20;
        }
      }
      else
      {
        __int16 v44 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136447490;
          __int16 v63 = "_Bool sum2GroupsHistogramFieldFromAllKeysSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullab"
                "le __strong, __weak id<WAIOReporterPopulatorMessageDelegate> _Nullable, WAGroupType, NSString * _Nonnull"
                " __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSS"
                "tring * _Nonnull __strong, NSString * _Nonnull __strong)";
          __int16 v64 = 1024;
          int v65 = 203;
          __int16 v66 = 2112;
          id v67 = v15;
          __int16 v68 = 2112;
          CFStringRef v69 = @"Slice 0";
          __int16 v70 = 2112;
          id v71 = v16;
          __int16 v72 = 2112;
          id v73 = v37;
          int v45 = v44;
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", buf, 0x3Au);
        }
      }

      int v43 = 0;
LABEL_13:
      if (!v43) {
        goto LABEL_23;
      }
      id v36 = (char *)v36 + 1;
    }
    while (v34 != v36);
    id v46 = [obj countByEnumeratingWithState:&v57 objects:v74 count:16];
    id v34 = v46;
  }
  while (v46);
LABEL_23:

  id v47 = obj;
LABEL_24:

  objc_destroyWeak(&location);
}

void sub_10002A9B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
}

BOOL sub_10002A9E8(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v21 = sub_100026C50(v13, v16, v17, v18, v19);
  if (v21)
  {
    uint64_t IntegerValue = IOReportSimpleGetIntegerValue();
    [v14 fieldForKey:v15];
    id v34 = v21;
    id v23 = v19;
    id v24 = v18;
    id v25 = v17;
    id v26 = v16;
    id v27 = v15;
    id v28 = v14;
    BOOL v29 = v20;
    id v31 = v30 = v13;
    [v31 setInt32Value:IntegerValue];

    id v13 = v30;
    int v20 = v29;
    id v14 = v28;
    id v15 = v27;
    id v16 = v26;
    id v17 = v25;
    id v18 = v24;
    id v19 = v23;
    id v21 = v34;
  }
  else
  {
    id v33 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136447490;
      id v36 = "_Bool fillInt32FieldFromSimple(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, NSString"
            " * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __stro"
            "ng, NSString * _Nonnull __strong)";
      __int16 v37 = 1024;
      int v38 = 262;
      __int16 v39 = 2112;
      id v40 = v16;
      __int16 v41 = 2112;
      id v42 = v17;
      __int16 v43 = 2112;
      id v44 = v18;
      __int16 v45 = 2112;
      id v46 = v19;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", buf, 0x3Au);
    }
  }

  return v21 != 0;
}

void sub_10002AC08(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v31 = v18;
  id v32 = v17;
  id v30 = v19;
  if (sub_100026C50(a1, v17, v18, v19, v20))
  {
    int Count = IOReportStateGetCount();
    if (Count >= 1)
    {
      int v23 = Count;
      for (int i = 0; i != v23; ++i)
      {
        id v25 = IOReportStateGetNameForIndex();
        if ([v25 containsString:v21])
        {
          IOReportStateGetResidency();
          IOReportChannelGetUnit();
          IOReportScaleValue();
          unint64_t v27 = (unint64_t)v26;
          id v28 = [v15 fieldForKey:v16];
          [v28 setUint64Value:v27];
        }
      }
    }
  }
  else
  {
    BOOL v29 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136447490;
      id v34 = "_Bool fillUInt64FieldFromState(NSDictionary * _Nonnull __strong, WAMessageAWD * _Nullable __strong, NSString"
            " * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __strong, NSString * _Nonnull __stro"
            "ng, NSString * _Nonnull __strong, NSString * _Nonnull __strong)";
      __int16 v35 = 1024;
      int v36 = 323;
      __int16 v37 = 2112;
      id v38 = v17;
      __int16 v39 = 2112;
      id v40 = v18;
      __int16 v41 = 2112;
      id v42 = v19;
      __int16 v43 = 2112;
      id v44 = v20;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find %@ %@ %@ %@", buf, 0x3Au);
    }
  }
}

void sub_10002B770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_10002BE5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (a33 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a27 < 0) {
    operator delete(a22);
  }

  _Unwind_Resume(a1);
}

void sub_10002C030(_Unwind_Exception *exception_object)
{
  if (v2 < 0) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_10002C050()
{
}

void sub_10002C060()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10002C0B4(exception);
}

void sub_10002C0A0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10002C0B4(std::logic_error *a1)
{
  id result = std::logic_error::logic_error(a1, "basic_string");
  return result;
}

uint64_t sub_10002C0F0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_10002C050();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    __int16 v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

uint64_t sub_10002C214(uint64_t a1)
{
  qword_1000F0F98 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t sub_10002C488(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002C498(uint64_t a1)
{
}

void sub_10002C4A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _getInfraApple80211];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10002C8FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002CF00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D40C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10)
{
}

void sub_10002D454(void *a1)
{
}

void sub_10002D618(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D7E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D9B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002DB88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002DD2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E1C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002E844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_10002EC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  _Block_object_dispose(&a17, 8);

  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002ECF0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002ED00(uint64_t a1)
{
}

id sub_10002ED08(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeAttemptedRecovery:@"CHIP_RESET_TRIGGER" reason:@"DPSQuickTriggeredChipReset" fromSSID:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fromBSSID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) commandResult:*(unsigned int *)(a1 + 56)];
}

void sub_10002F148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Block_object_dispose(&a19, 8);

  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

id sub_10002F1A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeAttemptedRecovery:@"CHIP_RESET_TRIGGER" reason:*(void *)(a1 + 40) fromSSID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) fromBSSID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) commandResult:*(unsigned int *)(a1 + 64)];
}

void sub_10002F5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Block_object_dispose(&a19, 8);

  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

id sub_10002F640(uint64_t a1)
{
  return [*(id *)(a1 + 32) _storeAttemptedRecovery:@"REASSOC_CC_TRIGGER" reason:*(void *)(a1 + 40) fromSSID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) fromBSSID:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) commandResult:*(unsigned int *)(a1 + 64)];
}

void sub_10002F954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002FEA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100030748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100030D24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031030(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031694(id a1)
{
  qword_1000F0FC8 = (uint64_t)malloc_type_malloc(0x3988uLL, 0x1000040C6519F05uLL);
}

void sub_100031C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100031DD4(id a1)
{
  qword_1000F0FE0 = objc_alloc_init(DatapathMetricStream);

  _objc_release_x1();
}

void sub_100032760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100032790(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v2 = [[*(id *)(a1 + 32) megawifiprofile_diagnostic_metrics_enabled];
    uint64_t v3 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446722;
      int v7 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 146;
      __int16 v10 = 1024;
      int v11 = (int)v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Disabling and reenabling timer, to ensure new kMegaProfileDiagnosticMetricsPeriod_ms takes immediate effect, curr state %d, disabling", (uint8_t *)&v6, 0x18u);
    }

    [*(id *)(a1 + 32) setMegawifiprofile_diagnostic_metrics_enabled:0];
    [*(id *)(a1 + 32) updateTimerConfiguration];
    uint64_t v4 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446722;
      int v7 = "-[DatapathMetricStream observeValueForKeyPath:ofObject:change:context:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 151;
      __int16 v10 = 1024;
      int v11 = (int)v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Applying previous state %d", (uint8_t *)&v6, 0x18u);
    }

    [*(id *)(a1 + 32) setMegawifiprofile_diagnostic_metrics_enabled:v2];
  }
  return [*(id *)(a1 + 32) updateTimerConfiguration];
}

void sub_100032C04(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v25 = "-[DatapathMetricStream fetchMetrics]_block_invoke";
      __int16 v26 = 1024;
      int v27 = 201;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:DatapathMetricGetter get message error: %@", buf, 0x1Cu);
    }
  }
  else
  {
    int v7 = v5;
    int v9 = [*(id *)(a1 + 32) pbConverter];
    __int16 v10 = [v9 instantiateAWDProtobufAndPopulateValues:v7];

    [*(id *)(a1 + 32) streamPBCodeable:v10 additionalDictionaryItems:0];
    int v11 = [v10 data];
    id v12 = [v11 length];

    if ((unint64_t)v12 > 0x2800)
    {
      id v21 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        BOOL v22 = [v10 data];
        *(_DWORD *)buf = 136446722;
        id v25 = "-[DatapathMetricStream fetchMetrics]_block_invoke";
        __int16 v26 = 1024;
        int v27 = 196;
        __int16 v28 = 2048;
        id v29 = [v22 length];
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to cache lastPB - len %lu", buf, 0x1Cu);
      }
    }
    else
    {
      id v13 = [*(id *)(a1 + 32) lastPBLock];
      [v13 lock];

      id v14 = [*(id *)(a1 + 32) lastPB];
      id v15 = [v14 mutableBytes];
      [v10 data];
      int v23 = v8;
      id v16 = objc_claimAutoreleasedReturnValue();
      id v17 = [v16 bytes];
      id v18 = [v10 data];
      memcpy(v15, v17, (size_t)[v18 length]);

      __int16 v8 = v23;
      id v19 = [v10 data];
      [*(id *)(a1 + 32) setLastPBLength:[v19 length]];

      id v20 = [*(id *)(a1 + 32) lastPBLock];
      [v20 unlock];
    }
  }
}

id sub_1000336B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchMetrics];
}

void sub_1000344C0(id a1)
{
  if (objc_opt_class())
  {
    qword_1000F0FF0 = objc_alloc_init(ManagedConfiguration);
    _objc_release_x1();
  }
}

id sub_100035000(uint64_t a1)
{
  [*(id *)(a1 + 32) startMonitoring];
  id v2 = *(void **)(a1 + 32);

  return [v2 MCSettingsDidChange:0];
}

id sub_100035468(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) profileChangedCallback:a2];
}

id sub_100035474(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446722;
    __int16 v8 = "void __DarwinCenterChangeNotification(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)";
    __int16 v9 = 1024;
    int v10 = 302;
    __int16 v11 = 2112;
    uint64_t v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:__DarwinCenterChangeNotification %@", (uint8_t *)&v7, 0x1Cu);
  }

  return [a2 profileChangedCallback:0];
}

void sub_100035554(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  uint64_t v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    __int16 v8 = "-[ManagedConfiguration startMonitoring]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 275;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Woken up by notifyd.\n", (uint8_t *)&v7, 0x12u);
  }

  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary && &_xpc_type_error != &_xpc_type_dictionary)
  {
    id v5 = xpc_dictionary_get_value(v2, _xpc_event_key_name);
    id v6 = v5;
    if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_string) {
      xpc_string_get_string_ptr(v6);
    }
  }
}

void sub_100035708(uint64_t a1)
{
  uint64_t v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 fileExistsAtPath:@"/private/var/Managed Preferences/mobile/com.apple.wifianalyticsd.plist"];

  context = v2;
  if ((v4 & 1) == 0)
  {
    [*(id *)(a1 + 32) setProfileLoaded:0];
    __int16 v41 = 0;
LABEL_20:
    id v5 = 0;
    int v7 = 0;
    goto LABEL_21;
  }
  id v43 = 0;
  id v5 = +[NSData dataWithContentsOfFile:@"/private/var/Managed Preferences/mobile/com.apple.wifianalyticsd.plist" options:0 error:&v43];
  id v6 = v43;
  __int16 v41 = v6;
  if (!v5)
  {
    id v19 = v6;
    id v20 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v19 underlyingErrors];
      *(_DWORD *)buf = 136446978;
      id v47 = "-[ManagedConfiguration profileChangedCallback:]_block_invoke";
      __int16 v48 = 1024;
      int v49 = 325;
      __int16 v50 = 2112;
      CFStringRef v51 = @"/private/var/Managed Preferences/mobile/com.apple.wifianalyticsd.plist";
      __int16 v52 = 2112;
      id v53 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Unable to open %@, error %@", buf, 0x26u);
    }
    [*(id *)(a1 + 32) setProfileLoaded:0];
    goto LABEL_20;
  }
  [*(id *)(a1 + 32) setProfileLoaded:1];
  int v7 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:0];
  if (!v7)
  {
LABEL_21:
    id v18 = 0;
    id v16 = 0;
    __int16 v39 = 0;
    id v40 = 0;
    int v10 = 0;
    goto LABEL_22;
  }
  __int16 v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v47 = "-[ManagedConfiguration profileChangedCallback:]_block_invoke";
    __int16 v48 = 1024;
    int v49 = 331;
    __int16 v50 = 2112;
    CFStringRef v51 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found dictionary %@", buf, 0x1Cu);
  }

  __int16 v9 = [(__CFString *)v7 valueForKey:@"megawifiprofile_diagnostic_metrics_enabled"];
  int v10 = v9;
  if (v9) {
    [*(id *)(a1 + 32) setMegawifiprofile_diagnostic_metrics_enabled:[v9 BOOLValue]];
  }
  __int16 v11 = [(__CFString *)v7 valueForKey:@"megawifiprofile_diagnostic_metrics_period_ms"];
  uint64_t v12 = v11;
  if (v11) {
    [*(id *)(a1 + 32) setMegawifiprofile_diagnostic_metrics_period_ms:[v11 unsignedIntValue]];
  }
  id v13 = [(__CFString *)v7 valueForKey:@"coredata_diagnostic_metrics_enabled"];
  id v14 = v13;
  if (v13) {
    [*(id *)(a1 + 32) setCoredata_diagnostic_metrics_enabled:[v13 BOOLValue]];
  }
  __int16 v39 = v14;
  id v15 = [(__CFString *)v7 valueForKey:@"coredata_diagnostic_metrics_enabled"];
  id v16 = v15;
  if (v15) {
    [*(id *)(a1 + 32) setMegawifiprofile_diagnostic_metrics_before_first_assoc:[v15 BOOLValue]];
  }
  id v17 = [(__CFString *)v7 valueForKey:@"coredata_diagnostic_metrics_enabled"];
  id v18 = v17;
  id v40 = v12;
  if (v17) {
    [*(id *)(a1 + 32) setMegawifiprofile_diagnostic_metrics_while_unassoc:[v17 BOOLValue]];
  }
LABEL_22:
  BOOL v22 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v47 = "-[ManagedConfiguration profileChangedCallback:]_block_invoke";
    __int16 v48 = 1024;
    int v49 = 361;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Exiting", buf, 0x12u);
  }

  id v23 = [v10 isEqualToNumber:&off_1000E4078];
  if (v23)
  {
    CFStringRef v24 = @"Mega Profile Installed";
  }
  else if ([v10 isEqualToNumber:&off_1000E4090])
  {
    CFStringRef v24 = @"No Logging Profile Installed";
  }
  else
  {
    CFStringRef v24 = @"No Profile";
  }
  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  v44[0] = WADeviceAnalyticsDiagnosticStateInfo[1];
  __int16 v26 = +[NSDate now];
  v45[0] = v26;
  v45[1] = v24;
  v44[1] = @"desc";
  v44[2] = @"enabled";
  int v27 = +[NSNumber numberWithBool:v23];
  v44[3] = @"name";
  v45[2] = v27;
  v45[3] = @"WiFi Profile State";
  __int16 v28 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];
  [v25 addEntriesFromDictionary:v28];

  id v29 = [*(id *)(a1 + 32) dbDelegate];
  [v29 processMetricDictOffEngine:@"com.apple.wifi.DiagnosticState" data:v25];

  LODWORD(v29) = [*(id *)(a1 + 32) profileLoaded];
  id v30 = WALogCategoryDefaultHandle();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if (v29)
  {
    if (v31)
    {
      *(_DWORD *)buf = 136446722;
      id v47 = "-[ManagedConfiguration profileChangedCallback:]_block_invoke";
      __int16 v48 = 1024;
      int v49 = 387;
      __int16 v50 = 2112;
      CFStringRef v51 = v7;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:We think profileLoaded, copying prefs %@", buf, 0x1Cu);
    }

    id v32 = [(__CFString *)v7 copy];
    uint64_t v33 = *(void *)(a1 + 32);
    id v34 = *(void **)(v33 + 56);
    *(void *)(v33 + 56) = v32;
  }
  else
  {
    if (v31)
    {
      *(_DWORD *)buf = 136446466;
      id v47 = "-[ManagedConfiguration profileChangedCallback:]_block_invoke";
      __int16 v48 = 1024;
      int v49 = 390;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:profileLoaded false, assigning defaults", buf, 0x12u);
    }

    uint64_t v35 = *(void *)(a1 + 32);
    int v36 = *(void **)(v35 + 56);
    *(void *)(v35 + 56) = 0;

    id v37 = +[WAUtil isWiFiFragmentSamplingEnabled];
    if (v37) {
      uint64_t v38 = 600000;
    }
    else {
      uint64_t v38 = 5000;
    }
    [*(id *)(a1 + 32) setMegawifiprofile_diagnostic_metrics_period_ms:v38];
    [*(id *)(a1 + 32) setMegawifiprofile_diagnostic_metrics_enabled:v37];
    [*(id *)(a1 + 32) setCoredata_diagnostic_metrics_enabled:v37];
    [*(id *)(a1 + 32) setMegawifiprofile_diagnostic_metrics_before_first_assoc:0];
    [*(id *)(a1 + 32) setMegawifiprofile_diagnostic_metrics_while_unassoc:1];
  }
}

void sub_100036B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100036BA8(uint64_t a1)
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v2 = (uint64_t (*)(uint64_t, void))off_1000F1000;
  __int16 v9 = off_1000F1000;
  if (!off_1000F1000)
  {
    uint64_t v3 = (void *)sub_10003DDFC();
    v7[3] = (uint64_t)dlsym(v3, "WiFiManagerClientCreate");
    off_1000F1000 = (_UNKNOWN *)v7[3];
    id v2 = (uint64_t (*)(uint64_t, void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    id v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2(a1, 0);
}

uint64_t sub_100036CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x2020000000;
  unsigned __int8 v4 = (uint64_t (*)(uint64_t, uint64_t, const __CFString *))off_1000F1010;
  __int16 v11 = off_1000F1010;
  if (!off_1000F1010)
  {
    id v5 = (void *)sub_10003DDFC();
    v9[3] = (uint64_t)dlsym(v5, "WiFiManagerClientScheduleWithRunLoop");
    off_1000F1010 = (_UNKNOWN *)v9[3];
    unsigned __int8 v4 = (uint64_t (*)(uint64_t, uint64_t, const __CFString *))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    dlerror();
    int v7 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return v4(a1, a2, @"managerClient entering runloop mode");
}

uint64_t sub_100036DEC(uint64_t a1)
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v2 = (uint64_t (*)(uint64_t))off_1000F1018;
  __int16 v9 = off_1000F1018;
  if (!off_1000F1018)
  {
    uint64_t v3 = (void *)sub_10003DDFC();
    v7[3] = (uint64_t)dlsym(v3, "WiFiManagerClientCopyDevices");
    off_1000F1018 = (_UNKNOWN *)v7[3];
    id v2 = (uint64_t (*)(uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    dlerror();
    id v5 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return v2(a1);
}

uint64_t sub_100036F04(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x2020000000;
  unsigned __int8 v4 = (uint64_t (*)(uint64_t, uint64_t, const __CFString *))off_1000F1028;
  __int16 v11 = off_1000F1028;
  if (!off_1000F1028)
  {
    id v5 = (void *)sub_10003DDFC();
    v9[3] = (uint64_t)dlsym(v5, "WiFiManagerClientUnscheduleFromRunLoop");
    off_1000F1028 = (_UNKNOWN *)v9[3];
    unsigned __int8 v4 = (uint64_t (*)(uint64_t, uint64_t, const __CFString *))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    dlerror();
    int v7 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return v4(a1, a2, @"managerClient exiting runloop mode");
}

void sub_100037668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003C7C4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long buf)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v18 = objc_begin_catch(a1);
      id v19 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136446466;
        *(void *)((char *)&buf + 4) = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDpsS"
                                        "tat:chipNumber:dpsSnapshot:originalCCA:]";
        WORD6(buf) = 1024;
        *(_DWORD *)((char *)&buf + 14) = 747;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:ML modelc files not found in frameworks.. checking executable path", (uint8_t *)&buf, 0x12u);
      }

      id v20 = objc_alloc_init(WiFiStallDetect);
      id v21 = *(void **)(v17 + 16);
      *(void *)(v17 + 16) = v20;

      if (!*(void *)(v17 + 16))
      {
        BOOL v22 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 136446466;
          *(void *)((char *)&buf + 4) = "-[DPSQuickRecoveryRecommendationEngine recommendReset:currentSample:acList:qDp"
                                          "sStat:chipNumber:dpsSnapshot:originalCCA:]";
          WORD6(buf) = 1024;
          *(_DWORD *)((char *)&buf + 14) = 749;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error WiFiStallDetect init", (uint8_t *)&buf, 0x12u);
        }
      }
      objc_end_catch();
      JUMPOUT(0x10003C1E0);
    }
    objc_begin_catch(a1);
    if (*(void *)(v17 + 16)) {
      objc_exception_rethrow();
    }
    JUMPOUT(0x10003C704);
  }
  _Unwind_Resume(a1);
}

void *sub_10003DDAC(uint64_t a1)
{
  id v2 = (void *)sub_10003DDFC();
  id result = dlsym(v2, "WiFiManagerClientCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000F1000 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10003DDFC()
{
  v3[0] = 0;
  if (!qword_1000F1008)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_10003DF0C;
    v3[4] = &unk_1000D0CF8;
    v3[5] = v3;
    long long v4 = off_1000D1030;
    uint64_t v5 = 0;
    qword_1000F1008 = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = qword_1000F1008;
    if (qword_1000F1008)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return qword_1000F1008;
}

uint64_t sub_10003DF0C()
{
  uint64_t result = _sl_dlopen();
  qword_1000F1008 = result;
  return result;
}

void *sub_10003DF80(uint64_t a1)
{
  id v2 = (void *)sub_10003DDFC();
  uint64_t result = dlsym(v2, "WiFiManagerClientScheduleWithRunLoop");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000F1010 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10003DFD0(uint64_t a1)
{
  id v2 = (void *)sub_10003DDFC();
  uint64_t result = dlsym(v2, "WiFiManagerClientCopyDevices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000F1018 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10003E020(uint64_t a1)
{
  id v2 = (void *)sub_10003DDFC();
  uint64_t result = dlsym(v2, "WiFiDeviceClientGetAppState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000F1020 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10003E070(uint64_t a1)
{
  id v2 = (void *)sub_10003DDFC();
  uint64_t result = dlsym(v2, "WiFiManagerClientUnscheduleFromRunLoop");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000F1028 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10003E0C0(uint64_t a1)
{
  id v2 = (void *)sub_10003DDFC();
  uint64_t result = dlsym(v2, "WiFiDeviceClientCopyCurrentNetwork");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000F1030 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10003E110(uint64_t a1)
{
  id v2 = (void *)sub_10003DDFC();
  uint64_t result = dlsym(v2, "WiFiNetworkIsPriorityNetworkWrapper");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000F1038 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CCSubmitLogToCrashTracer(const char *a1)
{
  if (!a1 || !sub_10003E498()) {
    return 0;
  }
  CFUUIDRef v2 = CFUUIDCreate(kCFAllocatorDefault);
  CFStringRef v3 = CFUUIDCreateString(kCFAllocatorDefault, v2);
  CFTypeRef v4 = (id)CFMakeCollectable(v3);
  CFRelease(v2);
  uint64_t v5 = +[NSString stringWithFormat:@"%s", a1];
  uint64_t v6 = (uint64_t (*)(const __CFString *, void))off_1000F1048;
  __int16 v26 = v5;
  CFTypeRef v27 = v4;
  if (off_1000F1048
    || (uint64_t v6 = (uint64_t (*)(const __CFString *, void))sub_10003E498(), (off_1000F1048 = v6) != 0))
  {
    int v7 = (const void *)v6(@"InverseDeviceID", 0);
    uint64_t v8 = (uint64_t (*)(const __CFString *, void))off_1000F1048;
    if (off_1000F1048) {
      goto LABEL_11;
    }
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v10 = sub_10003E498();
  off_1000F1048 = v10;
  if (v10)
  {
    uint64_t v8 = (uint64_t (*)(const __CFString *, void))v10;
LABEL_11:
    __int16 v11 = (const void *)v8(@"ProductType", 0);
    uint64_t v12 = (uint64_t (*)(const __CFString *, void))off_1000F1048;
    if (off_1000F1048) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  __int16 v11 = 0;
LABEL_14:
  id v13 = sub_10003E498();
  off_1000F1048 = v13;
  if (!v13)
  {
    id v14 = 0;
    goto LABEL_17;
  }
  uint64_t v12 = (uint64_t (*)(const __CFString *, void))v13;
LABEL_16:
  id v14 = (const void *)v12(@"UniqueDeviceID", 0);
LABEL_17:
  id v15 = objc_alloc_init((Class)NSDateFormatter);
  [v15 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS Z"];
  id v16 = [v15 stringFromDate:[NSDate date]];
  uint64_t v17 = (const void *)_CFCopySystemVersionDictionary();
  id v18 = (id)CFMakeCollectable(v17);
  CFStringRef v19 = (const __CFString *)[v18 objectForKeyedSubscript:_kCFSystemVersionProductVersionKey];
  CFStringRef v20 = (const __CFString *)[v18 objectForKeyedSubscript:_kCFSystemVersionProductNameKey];
  CFStringRef v21 = (const __CFString *)[v18 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey];
  CFStringRef v22 = @"???";
  if (v20) {
    CFStringRef v23 = v20;
  }
  else {
    CFStringRef v23 = @"???";
  }
  if (v19) {
    CFStringRef v24 = v19;
  }
  else {
    CFStringRef v24 = @"???";
  }
  if (v21) {
    CFStringRef v22 = v21;
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@\n%@\n", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"\nIncident Identifier:     %@\nCrashReporter Key:       %@\nHardware Model:          %@\nProcess:                 WiFi Firmware\nPath:                    NA\nIdentifier:              WiFi Firmware Trap\nVersion:                 NA\nCode Type:               ARM-32\nRole                     NA\nParent Process:          NA\nCoalition:               NA\n\n\nDate/Time:               %@\nLauch Time:              NA\nOS Version:              %@\nBaseband Version:        NA\nUDID:                    %@\nReport Version:          NA\n", v27, v7, v11, v16, +[NSString stringWithFormat:@"%@ %@ (%@)", v23, v24, v22], v14), v26);
  uint64_t v9 = OSAWriteLogForSubmission();
  if (v7) {
    CFRelease(v7);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (v15) {
    CFRelease(v15);
  }
  return v9;
}

void *sub_10003E498()
{
  uint64_t result = (void *)qword_1000F1040;
  if (!qword_1000F1040)
  {
    id v1 = getenv("DYLD_IMAGE_SUFFIX");
    if (!v1)
    {
      CFUUIDRef v2 = "/usr/lib/libMobileGestalt.dylib";
      goto LABEL_8;
    }
    strcpy(v3, "/usr/lib/libMobileGestalt.dylib");
    if (strlcat(v3, v1, 0x400uLL) >= 0x400) {
      return 0;
    }
    if ((stat(v3, &v4) & 0x80000000) == 0)
    {
      CFUUIDRef v2 = v3;
LABEL_8:
      uint64_t result = dlopen(v2, 6);
      qword_1000F1040 = (uint64_t)result;
      if (!result) {
        return result;
      }
      return dlsym(result, "MGCopyAnswer");
    }
    uint64_t result = (void *)qword_1000F1040;
    if (!qword_1000F1040) {
      return result;
    }
  }
  return dlsym(result, "MGCopyAnswer");
}

id sub_10003E57C(uint64_t a1, void *a2)
{
  CFStringRef v3 = [NSData dataWithBytes:length:[*(id *)(a1 + 32) UTF8String] length:[*(id *)(a1 + 40) length] + *(int *)(a1 + 48)];

  return [a2 writeData:v3];
}

uint64_t CCSubmitBinaryToCrashTracer(uint64_t result)
{
  if (result) {
    return OSAWriteLogForSubmission();
  }
  return result;
}

id sub_10003E6A8(uint64_t a1, void *a2)
{
  CFStringRef v3 = +[NSData dataWithBytes:*(void *)(a1 + 32) length:*(int *)(a1 + 40)];

  return [a2 writeData:v3];
}

uint64_t CCSubmitLqmMetricsTLVBlockToCrashTracer(uint64_t result)
{
  if (result) {
    return OSAWriteLogForSubmission();
  }
  return result;
}

id sub_10003E7B0(uint64_t a1, void *a2)
{
  CFStringRef v3 = +[NSData dataWithBytes:*(void *)(a1 + 32) length:*(int *)(a1 + 40)];

  return [a2 writeData:v3];
}

uint64_t sub_10003E8A0(uint64_t a1)
{
  qword_1000F1050 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100041930(uint64_t a1)
{
  uint64_t v18 = 0;
  CFStringRef v19 = &v18;
  uint64_t v20 = 0x2020000000;
  CFStringRef v3 = (uint64_t (*)(const CFAllocatorRef))off_1000F1068;
  CFStringRef v21 = off_1000F1068;
  if (!off_1000F1068)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_100041BCC;
    id v16 = &unk_1000D1010;
    uint64_t v17 = &v18;
    stat v4 = (void *)sub_100041C1C();
    v19[3] = (uint64_t)dlsym(v4, "CoreCaptureControlCreate");
    off_1000F1068 = *(_UNKNOWN **)(v17[1] + 24);
    CFStringRef v3 = (uint64_t (*)(const CFAllocatorRef))v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (!v3) {
    goto LABEL_13;
  }
  uint64_t v5 = v3(kCFAllocatorDefault);
  if (v5)
  {
    uint64_t v6 = (const void *)v5;
    id v7 = [@"WiFi" UTF8String];
    id v8 = [*(id *)(a1 + 32) UTF8String];
    uint64_t v18 = 0;
    CFStringRef v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v9 = (void (*)(const void *, id, id))off_1000F1070;
    CFStringRef v21 = off_1000F1070;
    if (!off_1000F1070)
    {
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      id v15 = sub_100041DA0;
      id v16 = &unk_1000D1010;
      uint64_t v17 = &v18;
      uint64_t v10 = (void *)sub_100041C1C();
      v19[3] = (uint64_t)dlsym(v10, "CoreCaptureControlCaptureWithComponentDirectory");
      off_1000F1070 = *(_UNKNOWN **)(v17[1] + 24);
      uint64_t v9 = (void (*)(const void *, id, id))v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (v9)
    {
      v9(v6, v7, v8);
      CFRelease(v6);
      goto LABEL_12;
    }
LABEL_13:
    dlerror();
    uint64_t v12 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v18, 8);
    _Unwind_Resume(v12);
  }
  __int16 v11 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Failed to WACoreCaptureControlCreate", buf, 2u);
  }

LABEL_12:
}

void *sub_100041BCC(uint64_t a1)
{
  CFUUIDRef v2 = (void *)sub_100041C1C();
  uint64_t result = dlsym(v2, "CoreCaptureControlCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000F1068 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100041C1C()
{
  v3[0] = 0;
  if (!qword_1000F1060)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100041D2C;
    v3[4] = &unk_1000D0CF8;
    v3[5] = v3;
    long long v4 = off_1000D1140;
    uint64_t v5 = 0;
    qword_1000F1060 = _sl_dlopen();
    id v1 = (void *)v3[0];
    uint64_t v0 = qword_1000F1060;
    if (qword_1000F1060)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      id v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return qword_1000F1060;
}

uint64_t sub_100041D2C()
{
  uint64_t result = _sl_dlopen();
  qword_1000F1060 = result;
  return result;
}

void *sub_100041DA0(uint64_t a1)
{
  CFUUIDRef v2 = (void *)sub_100041C1C();
  uint64_t result = dlsym(v2, "CoreCaptureControlCaptureWithComponentDirectory");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000F1070 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100043CE0(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = COERCE_DOUBLE(a3);
  switch(a2)
  {
    case 0:
      uint64_t v6 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 136446466;
        CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
        __int16 v28 = 1024;
        int v29 = 366;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WARecommendNull", (uint8_t *)&v26, 0x12u);
      }
      goto LABEL_42;
    case 1:
      [*(id *)(a1 + 32) addNumRecommendedCapture];
      [*(id *)(a1 + 32) medianCCA:*(void *)(a1 + 40)];
      float v8 = v7;
      uint64_t v9 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 136446722;
        CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
        __int16 v28 = 1024;
        int v29 = 340;
        __int16 v30 = 2048;
        double v31 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:floatCCA %f", (uint8_t *)&v26, 0x1Cu);
      }

      float v10 = (float)(unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) dps_wd_cca];
      __int16 v11 = *(void **)(a1 + 32);
      if (v8 >= v10)
      {
        [v11 addNumSuppressedCapture];
        id v16 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 136446722;
          CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 344;
          __int16 v30 = 2048;
          double v31 = v8;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:sDPS: aborting FullCapture since cca > limit (%f)", (uint8_t *)&v26, 0x1Cu);
        }

        uint64_t v6 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 136446466;
          CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 345;
          uint64_t v17 = "%{public}s::%d:WARecommendFullCapture WARecommendNull dps_wd_cca";
          goto LABEL_41;
        }
      }
      else
      {
        if ([v11 canCaptureforDPS])
        {
          uint64_t v12 = +[NSDate date];
          [*(id *)(*(void *)(a1 + 32) + 8) setObject:v12 forKey:@"dps_lastCapture"];
          id v13 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            double v14 = *(double *)(*(void *)(a1 + 32) + 8);
            int v26 = 136446722;
            CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
            __int16 v28 = 1024;
            int v29 = 358;
            __int16 v30 = 2112;
            double v31 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dpsWDBudgetDict %@", (uint8_t *)&v26, 0x1Cu);
          }

          id v15 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v26 = 136446722;
            CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
            __int16 v28 = 1024;
            int v29 = 359;
            __int16 v30 = 2112;
            double v31 = v5;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WARecommendFullCapture classification %@", (uint8_t *)&v26, 0x1Cu);
          }
          goto LABEL_33;
        }
        [*(id *)(a1 + 32) addNumSuppressedCapture];
        uint64_t v6 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 136446466;
          CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 352;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WARecommendFullCapture WARecommendNull canWDforDPS", (uint8_t *)&v26, 0x12u);
        }
      }
      goto LABEL_42;
    case 2:
      [*(id *)(a1 + 32) addNumRecommendedWD];
      if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "disable_dps_wd"))
      {
        uint64_t v6 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 136446466;
          CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 304;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WARecommendTrapWatchdog WARecommendNull disable_dps_wd", (uint8_t *)&v26, 0x12u);
        }
LABEL_42:

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_43;
      }
      [*(id *)(a1 + 32) medianCCA:*(void *)(a1 + 40)];
      float v19 = v18;
      uint64_t v20 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 136446722;
        CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
        __int16 v28 = 1024;
        int v29 = 310;
        __int16 v30 = 2048;
        double v31 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:floatCCA %f", (uint8_t *)&v26, 0x1Cu);
      }

      float v21 = (float)((unint64_t)[*(id *)(*(void *)(a1 + 32) + 16) dps_wd_cca]);
      CFStringRef v22 = *(void **)(a1 + 32);
      if (v19 >= v21)
      {
        [v22 addNumSuppressedWD];
        id v25 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 136446722;
          CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 314;
          __int16 v30 = 2048;
          double v31 = v19;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:sDPS: aborting watchdog since cca > limit (%f)", (uint8_t *)&v26, 0x1Cu);
        }

        uint64_t v6 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 136446466;
          CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 315;
          uint64_t v17 = "%{public}s::%d:WARecommendTrapWatchdog WARecommendNull dps_wd_cca";
LABEL_41:
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v26, 0x12u);
        }
        goto LABEL_42;
      }
      if (([v22 canWDforDPS] & 1) == 0)
      {
        [*(id *)(a1 + 32) addNumSuppressedWD];
        uint64_t v6 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 136446466;
          CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
          __int16 v28 = 1024;
          int v29 = 322;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WARecommendTrapWatchdog WARecommendNoneNoWatchdogBudget canWDforDPS", (uint8_t *)&v26, 0x12u);
        }
        goto LABEL_42;
      }
      uint64_t v12 = +[NSDate date];
      [*(id *)(*(void *)(a1 + 32) + 8) setObject:v12 forKey:@"dps_lastWD"];
      CFStringRef v23 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        double v24 = *(double *)(*(void *)(a1 + 32) + 8);
        int v26 = 136446722;
        CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
        __int16 v28 = 1024;
        int v29 = 329;
        __int16 v30 = 2112;
        double v31 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:dpsWDBudgetDict %@", (uint8_t *)&v26, 0x1Cu);
      }

      id v15 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 136446722;
        CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
        __int16 v28 = 1024;
        int v29 = 330;
        __int16 v30 = 2112;
        double v31 = v5;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WARecommendTrapWatchdog classification: %@", (uint8_t *)&v26, 0x1Cu);
      }
LABEL_33:

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_43:

      return;
    case 3:
      uint64_t v6 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 136446466;
        CFTypeRef v27 = "-[RecommendationEngine recommendActionFromData:andReply:]_block_invoke";
        __int16 v28 = 1024;
        int v29 = 372;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WARecommendNoneNoWatchdogBudget", (uint8_t *)&v26, 0x12u);
      }
      goto LABEL_42;
    default:
      goto LABEL_43;
  }
}

id sub_10004519C(uint64_t a1)
{
  return [*(id *)(a1 + 32) keyBagLockStateChangeNotification];
}

id sub_1000451A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareToTerminateViaEagerExit];
}

id sub_1000453D4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) BOOLValue];
  CFStringRef v3 = *(void **)(a1 + 40);

  return [v3 _updateProfileStateDate:v2];
}

id sub_100045570()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1000F1090;
  uint64_t v7 = qword_1000F1090;
  if (!qword_1000F1090)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100074CD4;
    v3[3] = &unk_1000D1010;
    v3[4] = &v4;
    sub_100074CD4((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10004563C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100045BFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100045C18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = [WeakRetained engineQ];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100045D10;
  v9[3] = &unk_1000D11B0;
  objc_copyWeak(v11, (id *)(a1 + 40));
  v11[1] = a2;
  v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
}

void sub_100045D10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (*(void *)(a1 + 56) == 1)
  {
    [WeakRetained setIsAssociated:[WeakRetained isAssociated]];
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 50)
      || (objc_msgSend(*(id *)(v5 + 640), "megawifiprofile_diagnostic_metrics_while_unassoc") & 1) != 0
      || (unsigned __int8 v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 640), "megawifiprofile_diagnostic_metrics_before_first_assoc"), !*(unsigned char *)(*(void *)(a1 + 32) + 49))|| (v6 & 1) != 0)
    {
      id v8 = (void *)os_transaction_create();
      uint64_t v9 = +[WAActivityManager sharedActivityManager];
      [v9 osTransactionCreate:"com.apple.wifianalytics.DatapathMetricStream" transaction:v8];

      id v10 = WALogCategoryDefaultHandle();
      if (os_signpost_enabled(v10))
      {
        LOWORD(v17) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DatapathMetricGetter", "", (uint8_t *)&v17, 2u);
      }

      +[WAUtil incrementValueForKey:@"Log: DatapathMetricStream Trigger" inMutableDict:v4[86] onQueue:v4[11]];
      [v4 _triggerQueryForNWActivity:*(void *)(a1 + 56) forProcessToken:@"DatapathMetricStream" andReply:*(void *)(a1 + 40)];
      __int16 v11 = WALogCategoryDefaultHandle();
      if (os_signpost_enabled(v11))
      {
        LOWORD(v17) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DatapathMetricGetter", "", (uint8_t *)&v17, 2u);
      }

      uint64_t v12 = +[WAActivityManager sharedActivityManager];
      [v12 osTransactionComplete:v8];
    }
    else
    {
      uint64_t v7 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 136446978;
        float v18 = "-[WAEngine initDatapathMetricGetterAndFetcher]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 734;
        __int16 v21 = 1024;
        unsigned int v22 = [v4 isAssociated];
        __int16 v23 = 1024;
        unsigned int v24 = [v4 isAssociatedStateKnown];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s::%d:initDatapathMetricGetterAndFetcher _isAssociated %d _isAssociatedStateKnown %d", (uint8_t *)&v17, 0x1Eu);
      }
    }
    id v13 = 0;
  }
  else
  {
    double v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136446466;
      float v18 = "-[WAEngine initDatapathMetricGetterAndFetcher]_block_invoke_2";
      __int16 v19 = 1024;
      int v20 = 727;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Only replyStyle = 1 supported", (uint8_t *)&v17, 0x12u);
    }

    NSErrorUserInfoKey v25 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v26 = @"WAErrorCodeNotRegistered";
    id v15 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v13 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v15];

    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v13);
    }
  }
}

void sub_100046168(uint64_t a1)
{
  uint64_t v2 = (void *)os_transaction_create();
  CFStringRef v3 = +[WAActivityManager sharedActivityManager];
  [v3 osTransactionCreate:"com.apple.wifianalytics.migratestore" transaction:v2];

  uint64_t v4 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446466;
    id v13 = "-[WAEngine setupAnalyticsProcessorWithCompletionBlock:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 767;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Alloc AnalyticsProcessor with AnalyticsProcessorMigrationCapable", (uint8_t *)&v12, 0x12u);
  }

  if (+[WAUtil shouldEnableXPCStore])
  {
    uint64_t v5 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136446466;
      id v13 = "-[WAEngine setupAnalyticsProcessorWithCompletionBlock:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 771;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:[WAUtil shouldEnableXPCStore] true, also setting AnalyticsProcessorEnableXPCStore", (uint8_t *)&v12, 0x12u);
    }

    uint64_t v6 = 3;
  }
  else
  {
    uint64_t v6 = 2;
  }
  id v7 = [objc_alloc((Class)AnalyticsProcessor) initWithOptions:v6];
  [*(id *)(a1 + 32) setAnalyticsProcessor:v7];

  id v8 = [*(id *)(a1 + 32) analyticsProcessor];

  if (v8)
  {
    [*(id *)(a1 + 32) setAnalyticsProcessorIsReady:1];
    uint64_t v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136446466;
      id v13 = "-[WAEngine setupAnalyticsProcessorWithCompletionBlock:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 780;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:AnalyticsProcessor ready after first unlock", (uint8_t *)&v12, 0x12u);
    }

    notify_cancel((int)[*(id *)(a1 + 32) keybagToken]);
  }
  else
  {
    id v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446466;
      id v13 = "-[WAEngine setupAnalyticsProcessorWithCompletionBlock:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 777;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unable to alloc analyticsProcessor. Will not be processing any metrics for AnalyticsStore!", (uint8_t *)&v12, 0x12u);
    }
  }
  __int16 v11 = +[WAActivityManager sharedActivityManager];
  [v11 osTransactionComplete:v2];
}

void sub_100046710(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  id v4 = [objc_alloc((Class)NSNumber) initWithBool:a2];
  uint64_t v5 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446722;
    id v8 = "-[WAEngine _triggerDeviceAnalyticsStoreMigrationAndReply:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 808;
    __int16 v11 = 1024;
    int v12 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Result for triggerDeviceAnalyticsStoreMigrationAndReply via XPC - Status: %d", (uint8_t *)&v7, 0x18u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v4, 0);
  }
}

id sub_100046B74(uint64_t a1)
{
  int v2 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    uint64_t v5 = "-[WAEngine createAndStartJsonReaderTimer]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 840;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Calling processWiFiAnalyticsMessageJSONFilesInTmpDir from _jsonFilerReaderTimer", (uint8_t *)&v4, 0x12u);
  }

  return [*(id *)(a1 + 32) processWiFiAnalyticsMessageJSONFilesInTmpDir:1];
}

id sub_100046D64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unpersist];
}

void sub_1000477B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, id *a14, id *a15, id *location)
{
  objc_destroyWeak((id *)(v16 - 200));
  objc_destroyWeak((id *)(v16 - 192));
  objc_destroyWeak((id *)(v16 - 184));
  _Unwind_Resume(a1);
}

void sub_100047844(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [WeakRetained token];
    __int16 v6 = +[WAUtil trimTokenForLogging:v5];
    int v7 = 136447490;
    id v8 = "-[WAEngine xpcConnection:establishConnectionWithToken:andReply:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 944;
    __int16 v11 = 2112;
    int v12 = v6;
    __int16 v13 = 1024;
    unsigned int v14 = [v3 processIdentifier];
    __int16 v15 = 1024;
    unsigned int v16 = [v3 effectiveUserIdentifier];
    __int16 v17 = 1024;
    unsigned int v18 = [v3 effectiveGroupIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: INTERRUPTED XPC CONNECTION with token=%@ [pid=%d, euid=%d, egid=%d]", (uint8_t *)&v7, 0x2Eu);
  }
}

void sub_1000479B0(id *a1)
{
  int v2 = [a1[4] engineQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047A94;
  block[3] = &unk_1000D1250;
  objc_copyWeak(&v4, a1 + 5);
  objc_copyWeak(&v5, a1 + 6);
  objc_copyWeak(&v6, a1 + 7);
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
}

void sub_100047A94(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v4 = objc_loadWeakRetained(a1 + 5);
  id v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [WeakRetained token];
    int v7 = +[WAUtil trimTokenForLogging:v6];
    int v12 = 136447490;
    __int16 v13 = "-[WAEngine xpcConnection:establishConnectionWithToken:andReply:]_block_invoke_2";
    __int16 v14 = 1024;
    int v15 = 952;
    __int16 v16 = 2112;
    __int16 v17 = v7;
    __int16 v18 = 1024;
    unsigned int v19 = [v4 processIdentifier];
    __int16 v20 = 1024;
    unsigned int v21 = [v4 effectiveUserIdentifier];
    __int16 v22 = 1024;
    unsigned int v23 = [v4 effectiveGroupIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:XPC: INVALIDATED XPC CONNECTION with token=%@ [pid=%d, euid=%d, egid=%d]", (uint8_t *)&v12, 0x2Eu);
  }
  [v4 setExportedObject:0];
  [v4 setInterruptionHandler:0];
  [v4 setInvalidationHandler:0];
  id v8 = [WeakRetained token];

  if (v8)
  {
    id v9 = objc_loadWeakRetained(a1 + 6);
    int v10 = [v9 processTokenToXPCConnectionMap];
    __int16 v11 = [WeakRetained token];
    [v10 removeObjectForKey:v11];
  }
}

void sub_100047C94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[WAUtil incrementValueForKey:@"Client: Establish Connection" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [WeakRetained processTokenToXPCConnectionMap];
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
}

void sub_100047E64(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100047E78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:submitMessage:groupType:andReply:]_block_invoke");

  id v6 = v5;
  [v6 UTF8String];
  int v7 = (void *)os_transaction_create();
  id v8 = +[WAActivityManager sharedActivityManager];
  id v9 = v6;
  [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

  if ([WeakRetained submitterMapCheck:*(void *)(a1 + 32) group:*(void *)(a1 + 64)])
  {
    +[WAUtil incrementValueForKey:@"Client: Submit Message" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = [*(id *)(a1 + 32) token];
    __int16 v13 = [WeakRetained _submitMessage:v11 groupType:v10 forProcessToken:v12];
  }
  else
  {
    __int16 v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      unsigned int v21 = "-[WAEngine xpcConnection:submitMessage:groupType:andReply:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 983;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:not registered, bailing", buf, 0x12u);
    }

    NSErrorUserInfoKey v18 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v19 = @"WAErrorCodeNotRegistered";
    __int16 v17 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    __int16 v13 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v17];
  }
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14) {
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v13);
  }
  int v15 = +[WAActivityManager sharedActivityManager];
  [v15 osTransactionComplete:v7];
}

void sub_10004823C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100048250(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:submitWiFiAnalyticsMessageAdvanced:andReply:]_block_invoke");

  id v6 = v5;
  [v6 UTF8String];
  int v7 = (void *)os_transaction_create();
  id v8 = +[WAActivityManager sharedActivityManager];
  id v9 = v6;
  [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

  if ([WeakRetained submitterMapCheck:*(void *)(a1 + 32) group:5])
  {
    +[WAUtil incrementValueForKey:@"Client: Submit WiFi Analytics Message Advanced" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
    uint64_t v10 = [WeakRetained _submitWiFiAnalyticsMessageAdvanced:*(void *)(a1 + 40)];
  }
  else
  {
    __int16 v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      NSErrorUserInfoKey v18 = "-[WAEngine xpcConnection:submitWiFiAnalyticsMessageAdvanced:andReply:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = 1007;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:not registered, bailing", buf, 0x12u);
    }

    NSErrorUserInfoKey v15 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v16 = @"WAErrorCodeNotRegistered";
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v10 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v14];
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v10);
  }
  int v12 = +[WAActivityManager sharedActivityManager];
  [v12 osTransactionComplete:v7];
}

void sub_1000485D0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1000485E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained submitterMapCheck:*(void *)(a1 + 32) group:*(void *)(a1 + 56)])
  {
    +[WAUtil incrementValueForKey:@"Client: Get Message Model For Group" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
    uint64_t v4 = [*(id *)(a1 + 32) token];
    uint64_t v5 = *(void *)(a1 + 56);
    id v10 = 0;
    id v6 = [WeakRetained _getMessagesModelForProcessToken:v4 groupType:v5 andError:&v10];
    id v7 = v10;
  }
  else
  {
    id v9 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v14 = "-[WAEngine xpcConnection:getMessagesModelForGroupType:andReply:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 1027;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:not registered, bailing", buf, 0x12u);
    }

    NSErrorUserInfoKey v11 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v12 = @"WAErrorCodeNotRegistered";
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v7 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v4];
    id v6 = 0;
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v6, v7);
  }
}

void sub_1000488D8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1000488EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [*(id *)(a1 + 32) token];

  if (v4)
  {
    uint64_t v5 = [WeakRetained submitterMap];
    id v6 = [*(id *)(a1 + 32) token];
    id v7 = [v5 objectForKeyedSubscript:v6];
    uint64_t v8 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      CFStringRef v26 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      __int16 v28 = [*(id *)(a1 + 32) token];
      int v29 = +[WAUtil trimTokenForLogging:v28];
      int v38 = 136446722;
      __int16 v39 = "-[WAEngine xpcConnection:registerMessageGroup:andReply:]_block_invoke";
      __int16 v40 = 1024;
      int v41 = 1046;
      __int16 v42 = 2112;
      id v43 = v29;
      __int16 v30 = "%{public}s::%d:token is already registered (token: %@)";
      double v31 = v26;
      os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
      uint32_t v33 = 28;
    }
    else
    {
      id v10 = [WeakRetained processTokenToGroupTypeMap];
      NSErrorUserInfoKey v11 = [*(id *)(a1 + 32) token];
      CFStringRef v12 = [v10 objectForKeyedSubscript:v11];
      __int16 v13 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
      unsigned int v14 = [v12 containsObject:v13];

      if (v14)
      {
        CFStringRef v26 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          id v37 = *(void **)(a1 + 56);
          int v38 = 136446722;
          __int16 v39 = "-[WAEngine xpcConnection:registerMessageGroup:andReply:]_block_invoke";
          __int16 v40 = 1024;
          int v41 = 1047;
          __int16 v42 = 2048;
          id v43 = v37;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: processTokenToGroupTypeMap seems to think this process token has already registered group type: %ld", (uint8_t *)&v38, 0x1Cu);
        }
        goto LABEL_9;
      }
      +[WAUtil incrementValueForKey:@"Client: Register Message Group" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
      [WeakRetained _purgeGroupTypeIfNecessary:*(void *)(a1 + 56)];
      __int16 v15 = [WeakRetained processTokenToGroupTypeMap];
      int v16 = [*(id *)(a1 + 32) token];
      __int16 v17 = [v15 objectForKeyedSubscript:v16];

      if (!v17)
      {
        id v18 = objc_alloc_init((Class)NSMutableSet);
        __int16 v19 = [WeakRetained processTokenToGroupTypeMap];
        int v20 = [*(id *)(a1 + 32) token];
        [v19 setObject:v18 forKeyedSubscript:v20];
      }
      unsigned int v21 = [WeakRetained processTokenToGroupTypeMap];
      __int16 v22 = [*(id *)(a1 + 32) token];
      int v23 = [v21 objectForKeyedSubscript:v22];
      unsigned int v24 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
      [v23 addObject:v24];

      NSErrorUserInfoKey v25 = [*(id *)(a1 + 32) token];
      [WeakRetained _initSubmitterAndQueryableRegistrationForProcessToken:v25 andGroupType:*(void *)(a1 + 56)];

      [WeakRetained _persist];
      CFStringRef v26 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
LABEL_9:
        id v34 = 0;
        goto LABEL_10;
      }
      CFTypeRef v27 = *(void **)(a1 + 56);
      __int16 v28 = [*(id *)(a1 + 32) token];
      int v29 = +[WAUtil trimTokenForLogging:v28];
      int v38 = 136446978;
      __int16 v39 = "-[WAEngine xpcConnection:registerMessageGroup:andReply:]_block_invoke";
      __int16 v40 = 1024;
      int v41 = 1057;
      __int16 v42 = 2048;
      id v43 = v27;
      __int16 v44 = 2112;
      __int16 v45 = v29;
      __int16 v30 = "%{public}s::%d:XPC: registering message group type: %ld for process: %@";
      double v31 = v26;
      os_log_type_t v32 = OS_LOG_TYPE_DEBUG;
      uint32_t v33 = 38;
    }
    _os_log_impl((void *)&_mh_execute_header, v31, v32, v30, (uint8_t *)&v38, v33);

    goto LABEL_9;
  }
  int v36 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 136446466;
    __int16 v39 = "-[WAEngine xpcConnection:registerMessageGroup:andReply:]_block_invoke";
    __int16 v40 = 1024;
    int v41 = 1045;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:couldn't get process name for connection", (uint8_t *)&v38, 0x12u);
  }

  NSErrorUserInfoKey v46 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v47 = @"WAErrorCodeInternalError";
  CFStringRef v26 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  id v34 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v26];
LABEL_10:

  uint64_t v35 = *(void *)(a1 + 40);
  if (v35) {
    (*(void (**)(uint64_t, void, void *))(v35 + 16))(v35, 0, v34);
  }
}

void sub_100048FD8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_100048FEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ([WeakRetained submitterMapCheck:*(void *)(a1 + 32) group:*(void *)(a1 + 72)])
  {
    uint64_t v4 = [*(id *)(a1 + 32) connection];
    uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:getNewMessageForKey:groupType:withCopy:andReply:]_block_invoke");

    id v6 = v5;
    [v6 UTF8String];
    id v7 = (void *)os_transaction_create();
    uint64_t v8 = +[WAActivityManager sharedActivityManager];
    id v9 = v6;
    [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

    +[WAUtil incrementValueForKey:@"Client: Get New Message For Key" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
    uint64_t v10 = *(void *)(a1 + 72);
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = [*(id *)(a1 + 48) BOOLValue];
    __int16 v13 = [*(id *)(a1 + 32) token];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100049324;
    v21[3] = &unk_1000D12F0;
    id v22 = *(id *)(a1 + 56);
    [WeakRetained _getNewMessageForKey:v11 groupType:v10 withCopy:v12 forProcessToken:v13 shouldCheckForPrePopulation:1 andReply:v21];

    unsigned int v14 = +[WAActivityManager sharedActivityManager];
    [v14 osTransactionComplete:v7];

    __int16 v15 = 0;
  }
  else
  {
    int v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = [*(id *)(a1 + 32) token];
      uint64_t v18 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 136446978;
      CFStringRef v26 = "-[WAEngine xpcConnection:getNewMessageForKey:groupType:withCopy:andReply:]_block_invoke";
      __int16 v27 = 1024;
      int v28 = 1074;
      __int16 v29 = 2112;
      __int16 v30 = v17;
      __int16 v31 = 2048;
      uint64_t v32 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:token %@ group %ld not registered, bailing", buf, 0x26u);
    }
    NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v24 = @"WAErrorCodeNotRegistered";
    __int16 v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    __int16 v15 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v19];

    uint64_t v20 = *(void *)(a1 + 56);
    if (v20) {
      (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v15);
    }
  }
}

uint64_t sub_100049324(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000495E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_100049608(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) listener];
  [v3 suspend];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = [*(id *)(a1 + 40) connection];
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v5 processIdentifier], "-[WAEngine xpcConnection:killDaemonAndReply:]_block_invoke");

  id v7 = v6;
  [v7 UTF8String];
  uint64_t v8 = (void *)os_transaction_create();
  id v9 = +[WAActivityManager sharedActivityManager];
  id v10 = v7;
  [v9 osTransactionCreate:[v10 UTF8String] transaction:v8];

  +[WAUtil incrementValueForKey:@"Client: Kill Daemon" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
  [WeakRetained _killDaemonAndReply:*(void *)(a1 + 48)];
  uint64_t v11 = +[WAActivityManager sharedActivityManager];
  [v11 osTransactionComplete:v8];
}

void sub_100049A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100049A3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:clearMessageStoreAndReply:]_block_invoke");

  id v6 = v5;
  [v6 UTF8String];
  id v7 = (void *)os_transaction_create();
  uint64_t v8 = +[WAActivityManager sharedActivityManager];
  id v9 = v6;
  [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

  +[WAUtil incrementValueForKey:@"Client: Clear Message Store" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
  [WeakRetained _clearMessageStoreAndReply:*(void *)(a1 + 40)];
  id v10 = +[WAActivityManager sharedActivityManager];
  [v10 osTransactionComplete:v7];
}

void sub_100049E64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_100049E84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:trapCrashMiniTracerDumpReadyForInterfaceWithName:andReply:]_block_invoke");

  id v6 = v5;
  [v6 UTF8String];
  id v7 = (void *)os_transaction_create();
  uint64_t v8 = +[WAActivityManager sharedActivityManager];
  id v9 = v6;
  [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

  +[WAUtil incrementValueForKey:@"Client: Trap Crash Mini Tracer Dump" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
  [WeakRetained _trapCrashMiniTracerDumpReadyForInterfaceWithName:*(void *)(a1 + 40) andReply:*(void *)(a1 + 48)];
  id v10 = +[WAActivityManager sharedActivityManager];
  [v10 osTransactionComplete:v7];
}

void sub_10004A2AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10004A2CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:lqmCrashTracerNotifyForInterfaceWithName:andReply:]_block_invoke");

  id v6 = v5;
  [v6 UTF8String];
  id v7 = (void *)os_transaction_create();
  uint64_t v8 = +[WAActivityManager sharedActivityManager];
  id v9 = v6;
  [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

  +[WAUtil incrementValueForKey:@"Client: LQM Crash Tracer Notify" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
  [WeakRetained _lqmCrashTracerNotifyForInterfaceWithName:*(void *)(a1 + 40) andReply:*(void *)(a1 + 48)];
  id v10 = +[WAActivityManager sharedActivityManager];
  [v10 osTransactionComplete:v7];
}

void sub_10004A718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10004A738(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:lqmCrashTracerReceiveBlock:forInterfaceWithName:andReply:]_block_invoke");

  id v6 = v5;
  [v6 UTF8String];
  id v7 = (void *)os_transaction_create();
  uint64_t v8 = +[WAActivityManager sharedActivityManager];
  id v9 = v6;
  [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

  +[WAUtil incrementValueForKey:@"Client: LQM Crash Tracer Receive" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
  [WeakRetained _lqmCrashTracerReceiveBlock:*(void *)(a1 + 40) forInterfaceWithName:*(void *)(a1 + 48) andReply:*(void *)(a1 + 56)];
  id v10 = +[WAActivityManager sharedActivityManager];
  [v10 osTransactionComplete:v7];
}

void sub_10004A998(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_10004A9AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (*(void *)(a1 + 56) == 1
    && ([WeakRetained submitterMapCheck:*(void *)(a1 + 32) group:3] & 1) == 0)
  {
    int v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      NSErrorUserInfoKey v23 = "-[WAEngine xpcConnection:triggerQueryForNWActivity:andReply:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 1218;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:not registered, bailing", buf, 0x12u);
    }

    NSErrorUserInfoKey v20 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v21 = @"WAErrorCodeNotRegistered";
    __int16 v17 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v10 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v17];

    uint64_t v18 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "XPC NWActivity Reply", "", buf, 2u);
    }

    uint64_t v19 = *(void *)(a1 + 40);
    if (v19) {
      (*(void (**)(uint64_t, void, id))(v19 + 16))(v19, 0, v10);
    }
    uint64_t v8 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "XPC NWActivity Reply", "", buf, 2u);
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) connection];
    id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v5 processIdentifier], "-[WAEngine xpcConnection:triggerQueryForNWActivity:andReply:]_block_invoke");

    id v7 = v6;
    [v7 UTF8String];
    uint64_t v8 = os_transaction_create();
    id v9 = +[WAActivityManager sharedActivityManager];
    id v10 = v7;
    [v9 osTransactionCreate:[v10 UTF8String] transaction:v8];

    uint64_t v11 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "XPC NWActivity", "", buf, 2u);
    }

    +[WAUtil incrementValueForKey:@"Client: Trigger Query for NW Activity" inMutableDict:v4[86] onQueue:v4[11]];
    uint64_t v12 = *(void *)(a1 + 56);
    __int16 v13 = [*(id *)(a1 + 32) token];
    [v4 _triggerQueryForNWActivity:v12 forProcessToken:v13 andReply:*(void *)(a1 + 40)];

    unsigned int v14 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "XPC NWActivity", "", buf, 2u);
    }

    __int16 v15 = +[WAActivityManager sharedActivityManager];
    [v15 osTransactionComplete:v8];
  }
}

void sub_10004AEEC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_10004AF00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ([WeakRetained submitterMapCheck:*(void *)(a1 + 32) group:3])
  {
    uint64_t v4 = [*(id *)(a1 + 32) connection];
    uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:]_block_invoke");

    id v6 = v5;
    [v6 UTF8String];
    id v7 = (void *)os_transaction_create();
    uint64_t v8 = +[WAActivityManager sharedActivityManager];
    id v9 = v6;
    [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

    +[WAUtil incrementValueForKey:@"Client: Convert WiFi Stats into Percentile" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
    uint64_t v10 = *(void *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    __int16 v13 = [*(id *)(a1 + 32) token];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004B1F8;
    v18[3] = &unk_1000D12F0;
    id v19 = *(id *)(a1 + 56);
    [WeakRetained _convertWiFiStatsIntoPercentile:v12 analysisGroup:v10 groupTarget:v11 forProcessToken:v13 andReply:v18];

    unsigned int v14 = +[WAActivityManager sharedActivityManager];
    [v14 osTransactionComplete:v7];

    __int16 v15 = 0;
  }
  else
  {
    __int16 v17 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      NSErrorUserInfoKey v23 = "-[WAEngine xpcConnection:convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:andReply:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 1252;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:not registered, bailing", buf, 0x12u);
    }

    NSErrorUserInfoKey v20 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v21 = @"WAErrorCodeNotRegistered";
    id v9 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    __int16 v15 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v9];
  }

  uint64_t v16 = *(void *)(a1 + 56);
  if (v16) {
    (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v15);
  }
}

uint64_t sub_10004B1F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004B33C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_10004B350(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = WeakRetained;
  if (*(void *)(a1 + 64) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = [WeakRetained submitterMap];
  id v6 = [*(id *)(a1 + 32) token];
  id v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 objectForKeyedSubscript:&off_1000E4318];

  if (!v8)
  {
    id v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v25 = "-[WAEngine xpcConnection:triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:]_block_invoke";
      __int16 v26 = 1024;
      int v27 = 1281;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:not registered, bailing", buf, 0x12u);
    }

    NSErrorUserInfoKey v22 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v23 = @"WAErrorCodeNotRegistered";
    NSErrorUserInfoKey v20 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v18 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v20];

    uint64_t v21 = *(void *)(a1 + 48);
    if (v21) {
      (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v18);
    }
  }
  else
  {
LABEL_3:
    id v9 = [*(id *)(a1 + 32) connection];
    uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v9 processIdentifier], "-[WAEngine xpcConnection:triggerDatapathDiagnosticsAndCollectUpdates:waMessage:andReply:]_block_invoke");

    id v11 = v10;
    [v11 UTF8String];
    uint64_t v12 = (void *)os_transaction_create();
    __int16 v13 = +[WAActivityManager sharedActivityManager];
    id v14 = v11;
    [v13 osTransactionCreate:[v14 UTF8String] transaction:v12];

    +[WAUtil incrementValueForKey:@"Client: Trigger Datapath Diagnostic" inMutableDict:v4[86] onQueue:v4[11]];
    uint64_t v15 = *(void *)(a1 + 64);
    uint64_t v16 = [*(id *)(a1 + 32) token];
    [v4 _triggerDatapathDiagnosticsAndCollectUpdates:v15 forProcessToken:v16 waMessage:*(void *)(a1 + 40) andReply:*(void *)(a1 + 48)];

    __int16 v17 = +[WAActivityManager sharedActivityManager];
    [v17 osTransactionComplete:v12];

    uint64_t v18 = 0;
  }
}

void sub_10004B738(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10004B74C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  uint64_t v5 = [v4 valueForEntitlement:@"com.apple.private.wifianalytics"];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) connection];
    uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v7 processIdentifier], "-[WAEngine xpcConnection:getDpsStatsandReply:]_block_invoke");

    id v9 = v8;
    [v9 UTF8String];
    uint64_t v10 = (void *)os_transaction_create();
    id v11 = +[WAActivityManager sharedActivityManager];
    id v12 = v9;
    [v11 osTransactionCreate:[v12 UTF8String] transaction:v10];

    +[WAUtil incrementValueForKey:@"Client: Get DPS Stats" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
    __int16 v13 = [WeakRetained _DPSQuickRecoveryEngineObj];
    id v14 = [WeakRetained recommendationEngine];
    uint64_t v15 = [v14 dpsWDBudgetDict];
    uint64_t v16 = [v13 updateDpsStats:v15];
    __int16 v17 = +[NSDictionary dictionaryWithDictionary:v16];

    uint64_t v18 = +[WAActivityManager sharedActivityManager];
    [v18 osTransactionComplete:v10];
  }
  else
  {
    NSErrorUserInfoKey v20 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = [*(id *)(a1 + 32) token];
      NSErrorUserInfoKey v22 = +[WAUtil trimTokenForLogging:v21];
      CFStringRef v23 = [*(id *)(a1 + 32) connection];
      *(_DWORD *)buf = 136447234;
      int v25 = "-[WAEngine xpcConnection:getDpsStatsandReply:]_block_invoke";
      __int16 v26 = 1024;
      int v27 = 1311;
      __int16 v28 = 2112;
      __int16 v29 = v22;
      __int16 v30 = 1024;
      unsigned int v31 = [v23 processIdentifier];
      __int16 v32 = 2112;
      CFStringRef v33 = @"com.apple.private.wifianalytics";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT for %@, rejecting connection!!!", buf, 0x2Cu);
    }
    id v12 = 0;
    __int16 v17 = 0;
  }
  uint64_t v19 = *(void *)(a1 + 40);
  if (v19) {
    (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v17, 0);
  }
}

void sub_10004BB68(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_10004BB7C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  uint64_t v5 = [v4 valueForEntitlement:@"com.apple.private.wifianalytics"];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) connection];
    uint64_t v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v7 processIdentifier], "-[WAEngine xpcConnection:getUsageStatsandReply:]_block_invoke");

    id v9 = v8;
    [v9 UTF8String];
    uint64_t v10 = (void *)os_transaction_create();
    id v11 = +[WAActivityManager sharedActivityManager];
    id v12 = v9;
    [v11 osTransactionCreate:[v12 UTF8String] transaction:v10];

    +[WAUtil incrementValueForKey:@"Client: Get Usage Stats" inMutableDict:*((void *)WeakRetained + 86) onQueue:*((void *)WeakRetained + 11)];
    [WeakRetained _calculateEstimatedUptime];
    [WeakRetained _calculateProcessUsage];
    [WeakRetained _calculateProfileUptime];
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    [v13 setObject:*((void *)WeakRetained + 86) forKey:@"Module_Engine"];
    id v14 = [*((id *)WeakRetained + 13) getCachedUsage];
    id v15 = [v14 copy];

    if (v15) {
      [v13 setObject:v15 forKey:@"Module_IOR"];
    }
    uint64_t v16 = [*(id *)(a1 + 40) nowCacheUsageForTelemetry];
    +[WAUtil logNestedDictionary:v16 indent:0 prefix:@"getUsageStatsandReply "];

    __int16 v17 = +[WAActivityManager sharedActivityManager];
    [v17 osTransactionComplete:v10];
  }
  else
  {
    uint64_t v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      NSErrorUserInfoKey v20 = [*(id *)(a1 + 32) token];
      uint64_t v21 = +[WAUtil trimTokenForLogging:v20];
      NSErrorUserInfoKey v22 = [*(id *)(a1 + 32) connection];
      *(_DWORD *)buf = 136447234;
      __int16 v24 = "-[WAEngine xpcConnection:getUsageStatsandReply:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 1341;
      __int16 v27 = 2112;
      __int16 v28 = v21;
      __int16 v29 = 1024;
      unsigned int v30 = [v22 processIdentifier];
      __int16 v31 = 2112;
      CFStringRef v32 = @"com.apple.private.wifianalytics";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: ERROR: %@ (%d) is not entitled with WA_XPC_ENTITLEMENT for %@, rejecting connection!!!", buf, 0x2Cu);
    }
    id v12 = 0;
    id v15 = 0;
    id v13 = 0;
  }
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18) {
    (*(void (**)(uint64_t, id, void))(v18 + 16))(v18, v13, 0);
  }
}

void sub_10004BFEC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_10004C000(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained submitterMapCheck:*(void *)(a1 + 32) group:5])
  {
    uint64_t v4 = [*(id *)(a1 + 32) connection];
    uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:setDeviceAnalyticsConfiguration:andReply:]_block_invoke");

    id v6 = v5;
    [v6 UTF8String];
    id v7 = (void *)os_transaction_create();
    uint64_t v8 = +[WAActivityManager sharedActivityManager];
    id v9 = v6;
    [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

    +[WAUtil incrementValueForKey:@"Client: Set Device Analytics Config" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
    uint64_t v10 = [WeakRetained _setDeviceAnalyticsConfiguration:*(void *)(a1 + 40)];
    id v11 = +[WAActivityManager sharedActivityManager];
    [v11 osTransactionComplete:v7];
  }
  else
  {
    id v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v17 = "-[WAEngine xpcConnection:setDeviceAnalyticsConfiguration:andReply:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 1383;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:not registered, bailing", buf, 0x12u);
    }

    NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v15 = @"WAErrorCodeNotRegistered";
    id v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v10 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v9];
  }

  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v10);
  }
}

void sub_10004C370(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10004C384(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained submitterMapCheck:*(void *)(a1 + 32) group:5])
  {
    uint64_t v4 = [*(id *)(a1 + 32) connection];
    uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:getDeviceAnalyticsConfigurationAndReply:]_block_invoke");

    id v6 = v5;
    [v6 UTF8String];
    id v7 = (void *)os_transaction_create();
    uint64_t v8 = +[WAActivityManager sharedActivityManager];
    id v9 = v6;
    [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

    +[WAUtil incrementValueForKey:@"Client: Get Device Analytics Config" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
    uint64_t v10 = [WeakRetained _getDeviceAnalyticsConfiguration];
    id v11 = +[WAActivityManager sharedActivityManager];
    [v11 osTransactionComplete:v7];

    uint64_t v12 = 0;
  }
  else
  {
    NSErrorUserInfoKey v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v19 = "-[WAEngine xpcConnection:getDeviceAnalyticsConfigurationAndReply:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 1410;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:not registered, bailing", buf, 0x12u);
    }

    NSErrorUserInfoKey v16 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v17 = @"WAErrorCodeNotRegistered";
    CFStringRef v15 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v12 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v15];

    id v9 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v10, v12);
  }
}

void sub_10004C738(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_10004C74C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained submitterMapCheck:*(void *)(a1 + 32) group:5])
  {
    uint64_t v4 = [*(id *)(a1 + 32) connection];
    uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:summarizeDeviceAnalyticsForNetwork:maxAgeInDays:andReply:]_block_invoke");

    id v6 = v5;
    [v6 UTF8String];
    id v7 = (void *)os_transaction_create();
    uint64_t v8 = +[WAActivityManager sharedActivityManager];
    id v9 = v6;
    [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

    +[WAUtil incrementValueForKey:@"Client: Summarize Device Analytics For Network" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
    uint64_t v10 = [WeakRetained _summarizeDeviceAnalyticsForNetwork:*(void *)(a1 + 40) maxAgeInDays:*(void *)(a1 + 64)];
    id v11 = +[WAActivityManager sharedActivityManager];
    [v11 osTransactionComplete:v7];

    uint64_t v12 = 0;
  }
  else
  {
    NSErrorUserInfoKey v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v19 = "-[WAEngine xpcConnection:summarizeDeviceAnalyticsForNetwork:maxAgeInDays:andReply:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 1438;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:not registered, bailing", buf, 0x12u);
    }

    NSErrorUserInfoKey v16 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v17 = @"WAErrorCodeNotRegistered";
    CFStringRef v15 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v12 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v15];

    id v9 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v10, v12);
  }
}

void sub_10004CB78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10004CB94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained submitterMapCheck:*(void *)(a1 + 32) group:5])
  {
    uint64_t v4 = [*(id *)(a1 + 32) connection];
    uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:triggerDeviceAnalyticsStoreMigrationAndReply:]_block_invoke");

    id v6 = v5;
    [v6 UTF8String];
    id v7 = (void *)os_transaction_create();
    uint64_t v8 = +[WAActivityManager sharedActivityManager];
    id v9 = v6;
    [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

    +[WAUtil incrementValueForKey:@"Client: Trigger Device Analytics Store Migration" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
    [WeakRetained triggerDeviceAnalyticsStoreMigrationAndReply:*(void *)(a1 + 40)];
    uint64_t v10 = +[WAActivityManager sharedActivityManager];
    [v10 osTransactionComplete:v7];

    id v11 = 0;
  }
  else
  {
    uint64_t v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v19 = "-[WAEngine xpcConnection:triggerDeviceAnalyticsStoreMigrationAndReply:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 1466;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:not registered, bailing", buf, 0x12u);
    }

    NSErrorUserInfoKey v16 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v17 = @"WAErrorCodeNotRegistered";
    uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v11 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v13];

    NSErrorUserInfoKey v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v19 = "-[WAEngine xpcConnection:triggerDeviceAnalyticsStoreMigrationAndReply:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 1480;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Result for triggerDeviceAnalyticsStoreMigrationAndReply via XPC - Error: WAErrorCodeNotRegistered", buf, 0x12u);
    }

    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v11);
    }
  }
}

void sub_10004D110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10004D130(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [*(id *)(a1 + 32) connection];
  uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:sendMemoryPressureRequestAndReply:]_block_invoke");

  id v6 = v5;
  [v6 UTF8String];
  id v7 = (void *)os_transaction_create();
  uint64_t v8 = +[WAActivityManager sharedActivityManager];
  id v9 = v6;
  [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

  +[WAUtil incrementValueForKey:@"Client: Send Memory Pressure Request" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
  [WeakRetained _sendMemoryPressureRequestAndReply:*(void *)(a1 + 40)];
  uint64_t v10 = +[WAActivityManager sharedActivityManager];
  [v10 osTransactionComplete:v7];
}

void sub_10004D628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
}

uint64_t sub_10004D654(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10004D664(uint64_t a1)
{
}

void sub_10004D66C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained submitterMapCheck:*(void *)(a1 + 32) group:3])
  {
    uint64_t v4 = [*(id *)(a1 + 32) connection];
    uint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.wifianalytics.pid_%d.%s", [v4 processIdentifier], "-[WAEngine xpcConnection:issueIOReportManagementCommand:andReply:]_block_invoke");

    id v6 = v5;
    [v6 UTF8String];
    id v7 = (void *)os_transaction_create();
    uint64_t v8 = +[WAActivityManager sharedActivityManager];
    id v9 = v6;
    [v8 osTransactionCreate:[v9 UTF8String] transaction:v7];

    +[WAUtil incrementValueForKey:@"Client: Issue IOReport Managemen Command" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
    uint64_t v10 = *(void *)(a1 + 64);
    id v11 = [*(id *)(a1 + 32) token];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10004D9CC;
    v20[3] = &unk_1000D12F0;
    id v21 = *(id *)(a1 + 40);
    [WeakRetained _issueIOReportManagementCommand:v10 forProcessToken:v11 andReply:v20];

    uint64_t v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v25 = "-[WAEngine xpcConnection:issueIOReportManagementCommand:andReply:]_block_invoke";
      __int16 v26 = 1024;
      int v27 = 1535;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:xpcConnection _issueIOReportManagementCommand complete", buf, 0x12u);
    }

    uint64_t v13 = +[WAActivityManager sharedActivityManager];
    [v13 osTransactionComplete:v7];
  }
  else
  {
    NSErrorUserInfoKey v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v25 = "-[WAEngine xpcConnection:issueIOReportManagementCommand:andReply:]_block_invoke";
      __int16 v26 = 1024;
      int v27 = 1526;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:not registered, bailing", buf, 0x12u);
    }

    NSErrorUserInfoKey v22 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v23 = @"WAErrorCodeNotRegistered";
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    uint64_t v16 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v15];
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    uint64_t v19 = *(void *)(a1 + 40);
    if (v19) {
      (*(void (**)(uint64_t, void, void))(v19 + 16))(v19, 0, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    }
  }
}

uint64_t sub_10004D9CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004DCE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004DD00(void *a1)
{
  uint64_t v3 = [*(id *)(a1[4] + 120) objectForKeyedSubscript:a1[5]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10004DE14(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) processTokenToXPCConnectionMap];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v4)
  {
    uint64_t v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = +[WAUtil trimTokenForLogging:*(void *)(a1 + 40)];
      int v7 = 136446722;
      uint64_t v8 = "-[WAEngine sendWakeUpNotificationForProcessWithName:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 1578;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:It appears the XPC connection is still valid (no invalidation handler called). No need to send wake up notification for process with token ending: %@", (uint8_t *)&v7, 0x1Cu);
    }
  }
  else
  {
    notify_post((const char *)[*(id *)(a1 + 40) UTF8String]);
  }
}

void sub_10004E008(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_10004E01C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[WAEngine prepareToTerminateViaEagerExit]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 1594;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:prepareToTerminateAnyReply...", (uint8_t *)&v5, 0x12u);
  }

  [WeakRetained _prepareToTerminateViaEagerExit];
}

void sub_10004E32C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10004E340(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    __int16 v7 = "-[WAEngine prepareToTerminateAnyReply:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 1613;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:prepareToTerminateAnyReply...", (uint8_t *)&v6, 0x12u);
  }

  [WeakRetained _prepareToTerminate];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
  }
}

void sub_10004E7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10004E7E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(unsigned char *)(a1 + 40)) {
    CFStringRef v4 = @"Dispatch: Received Memory Critical";
  }
  else {
    CFStringRef v4 = @"Dispatch: Received Memory Warning";
  }
  +[WAUtil incrementValueForKey:v4 inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
  if (([WeakRetained dpsStudyInProgress] & 1) != 0
    || ([WeakRetained slowWiFiStudyInProgress] & 1) != 0
    || ([WeakRetained dnsStudyInProgress] & 1) != 0)
  {
    unsigned int v5 = 1;
  }
  else
  {
    unsigned int v5 = [WeakRetained isNWActivityInProgress];
  }
  if (([WeakRetained isMemoryPressureRequestDeferred] & 1) == 0 && v5)
  {
    [WeakRetained setIsMemoryPressureRequestDeferred:1];
    int v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447746;
      uint64_t v16 = "-[WAEngine handleMemoryWarning:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 1655;
      __int16 v19 = 2080;
      __int16 v20 = "-[WAEngine handleMemoryWarning:]_block_invoke";
      __int16 v21 = 1024;
      unsigned int v22 = [WeakRetained dpsStudyInProgress];
      __int16 v23 = 1024;
      unsigned int v24 = [WeakRetained slowWiFiStudyInProgress];
      __int16 v25 = 1024;
      unsigned int v26 = [WeakRetained dnsStudyInProgress];
      __int16 v27 = 1024;
      unsigned int v28 = [WeakRetained isNWActivityInProgress];
      __int16 v7 = "%{public}s::%d:%s: deferred (DPS in progress=%d, SlowWiFi in progress=%d, DNS-SlowWiFi in progress=%d, NWActi"
           "vity in progress=%d.";
      __int16 v8 = v6;
      uint32_t v9 = 52;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if ((v5 & 1) == 0)
  {
    int v10 = [WeakRetained mutexQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004EAC0;
    block[3] = &unk_1000D0D98;
    __int16 v11 = WeakRetained;
    id v14 = v11;
    dispatch_sync(v10, block);

    uint64_t v12 = [v11 iorMessagePopulator];
    [v12 freeIORCaches];

    [v11 setIsMemoryPressureRequestDeferred:0];
    int v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v16 = "-[WAEngine handleMemoryWarning:]_block_invoke_2";
      __int16 v17 = 1024;
      int v18 = 1663;
      __int16 v19 = 2080;
      __int16 v20 = "-[WAEngine handleMemoryWarning:]_block_invoke_2";
      __int16 v7 = "%{public}s::%d:%s: caches freed.";
      __int16 v8 = v6;
      uint32_t v9 = 28;
      goto LABEL_15;
    }
LABEL_16:
  }
}

void sub_10004EAC0(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) cachedModelObjectsKeyToMessageMap];
  [v3 removeAllObjects];
}

void sub_100054A28(id a1)
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(v1) = info.numer;
    LODWORD(v2) = info.denom;
    *(double *)&qword_1000F0BF8 = (double)v1 / (double)v2;
  }
}

id sub_1000554AC(uint64_t a1)
{
  unint64_t v2 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    unsigned int v5 = "-[WAEngine _enableWorkReportRecurringTimer]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 2484;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Performing scheduled _reportHourlyWorkReport", (uint8_t *)&v4, 0x12u);
  }

  id result = [*(id *)(a1 + 32) _reportWorkReportInterval];
  *(unsigned char *)(*(void *)(a1 + 32) + 58) = 0;
  return result;
}

void sub_100056E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, uint64_t a18, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

id sub_100056EC0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    +[WAUtil incrementValueForKey:@"Telemetry: Work Report Accepted" inMutableDict:WeakRetained[86] onQueue:WeakRetained[11]];
    uint64_t v3 = [WeakRetained _createWorkReportDictionaryForTelemetryAndRollBucket];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    unsigned int v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  __int16 v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    int v10 = "-[WAEngine _reportWorkReportInterval]_block_invoke";
    __int16 v11 = 1024;
    int v12 = 2723;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Sending telemetry for com.apple.wifianalyticsd.workreport", (uint8_t *)&v9, 0x12u);
  }

  id v7 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return v7;
}

void sub_100057BC4(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) cachedModelObjectsKeyToMessageMap];
  uint64_t v4 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
  unsigned int v5 = [v3 objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  __int16 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v9 = +[WAUtil getMessageInstanceForKey:*(void *)(a1 + 40) andGroupType:*(void *)(a1 + 56)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    int v12 = [*(id *)(a1 + 32) cachedModelObjectsKeyToMessageMap];
    uint64_t v13 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
    id v14 = [v12 objectForKeyedSubscript:v13];

    if (!v14)
    {
      id v15 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v16 = [*(id *)(a1 + 32) cachedModelObjectsKeyToMessageMap];
      __int16 v17 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
      [v16 setObject:v15 forKeyedSubscript:v17];
    }
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    __int16 v19 = [*(id *)(a1 + 32) cachedModelObjectsKeyToMessageMap];
    __int16 v20 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
    __int16 v21 = [v19 objectForKeyedSubscript:v20];
    [v21 setObject:v18 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

uint64_t sub_1000580AC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_1000583C4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_1000586F8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_1000598E8(uint64_t a1)
{
  [*(id *)(a1 + 32) processWiFiAnalyticsMessageJSONFilesInTmpDir:1];
}

void sub_10005DA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10005DA5C(uint64_t a1, uint64_t a2, void *a3)
{
  id v117 = a3;
  uint64_t v118 = a1;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"NWA_interfaceStats"];
  unsigned int v5 = [v4 repeatableValues];

  id obj = v5;
  id v121 = [v5 countByEnumeratingWithState:&v142 objects:v165 count:16];
  if (v121)
  {
    uint64_t v125 = 0;
    int v124 = 0;
    uint64_t v120 = *(void *)v143;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v143 != v120) {
          objc_enumerationMutation(obj);
        }
        uint64_t v122 = v6;
        uint64_t v7 = *(void **)(*((void *)&v142 + 1) + 8 * v6);
        long long v138 = 0u;
        long long v139 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        __int16 v8 = [v7 fieldForKey:@"NWAIS_peers"];
        uint64_t v9 = [v8 repeatableValues];

        id v10 = [v9 countByEnumeratingWithState:&v138 objects:v164 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v139;
          do
          {
            for (int i = 0; i != v11; int i = (char *)i + 1)
            {
              if (*(void *)v139 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v138 + 1) + 8 * i);
              id v15 = [v14 fieldForKey:@"NWAPS_hashID"];
              uint64_t v16 = [v15 stringValue];
              unsigned int v17 = [v16 isEqualToString:@"00:00:00:00:00:00"];

              if (v17)
              {
                uint64_t v18 = [v14 fieldForKey:@"NWAPS_ccas"];
                __int16 v19 = [v18 repeatableValues];
                BOOL v20 = [v19 count] != 0;

                v124 |= v20;
                __int16 v21 = [v14 fieldForKey:@"NWAPS_acCompletions"];
                unsigned int v22 = [v21 repeatableValues];
                BOOL v23 = [v22 count] != 0;

                LODWORD(v125) = v23 | v125;
                unsigned int v24 = [v14 fieldForKey:@"NWAPS_txLatencyBEs"];
                __int16 v25 = [v24 repeatableValues];
                BOOL v26 = [v25 count] != 0;

                HIDWORD(v125) |= v26;
              }
              __int16 v27 = [v14 fieldForKey:@"NWAPS_hashID"];
              unsigned int v28 = [v27 stringValue];
              [v28 isEqualToString:@"00:00:00:00:00:00"];
            }
            id v11 = [v9 countByEnumeratingWithState:&v138 objects:v164 count:16];
          }
          while (v11);
        }

        uint64_t v6 = v122 + 1;
      }
      while ((id)(v122 + 1) != v121);
      id v121 = [obj countByEnumeratingWithState:&v142 objects:v165 count:16];
    }
    while (v121);
  }
  else
  {
    uint64_t v125 = 0;
    int v124 = 0;
  }

  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  __int16 v29 = [*(id *)(*(void *)(*(void *)(v118 + 56) + 8) + 40) fieldForKey:@"NWA_interfaceStats"];
  unsigned int v30 = [v29 repeatableValues];

  id v31 = [v30 countByEnumeratingWithState:&v134 objects:v163 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v135;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v135 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = [*(id *)(*((void *)&v134 + 1) + 8 * (void)j) fieldForKey:@"NWAIS_assoc"];
        int v36 = [v35 subMessageValue];
        id v37 = [v36 fieldForKey:@"NWAA_linkChanged"];
        unsigned int v38 = [v37 uint32Value];
      }
      id v32 = [v30 countByEnumeratingWithState:&v134 objects:v163 count:16];
    }
    while (v32);
    uint64_t v39 = v38 != 0;
  }
  else
  {
    uint64_t v39 = 0;
  }

  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  __int16 v40 = [*(id *)(*(void *)(*(void *)(v118 + 56) + 8) + 40) fieldForKey:@"NWA_interfaceStats"];
  int v41 = [v40 repeatableValues];

  id v42 = [v41 countByEnumeratingWithState:&v130 objects:v162 count:16];
  if (v42)
  {
    id v43 = v42;
    unsigned int v123 = v39;
    uint64_t v44 = *(void *)v131;
    do
    {
      for (k = 0; k != v43; k = (char *)k + 1)
      {
        if (*(void *)v131 != v44) {
          objc_enumerationMutation(v41);
        }
        NSErrorUserInfoKey v46 = [*(id *)(*((void *)&v130 + 1) + 8 * (void)k) fieldForKey:@"NWAIS_assoc"];
        CFStringRef v47 = [v46 subMessageValue];
        __int16 v48 = [v47 fieldForKey:@"NWAA_assocDoneSuccess"];
        unsigned int v49 = [v48 uint32Value];
      }
      id v43 = [v41 countByEnumeratingWithState:&v130 objects:v162 count:16];
    }
    while (v43);
    BOOL v50 = v49 != 0;
    uint64_t v39 = v123;
  }
  else
  {
    BOOL v50 = 0;
  }

  uint64_t v51 = v118;
  [*(id *)(v118 + 32) setIsAssociatedStateKnown:1];
  [*(id *)(v118 + 32) setIsAssociated:[*(id *)(v118 + 32) isAssociated]];
  __int16 v52 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity Poplulate", "", buf, 2u);
  }

  unsigned int v53 = [*(id *)(v118 + 32) forceStudyErrorFromMsg];
  if (v53)
  {
    id v54 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      long long v153 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
      __int16 v154 = 1024;
      int v155 = 3557;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Setting attemptRescan to true due to debug command kWAIORCommandForceStudyErrorFromMsg", buf, 0x12u);
    }

    [*(id *)(v118 + 32) setForceStudyErrorFromMsg:0];
  }
  if ([v117 code] == (id)9021
    || [v117 code] == (id)9022
    || [v117 code] == (id)9023
    || [v117 code] == (id)9024
    || [v117 code] == (id)9025
    || [v117 code] == (id)9026
    || ((v124 ^ 1) & 1) != 0
    || ((v39 ^ 1) & 1) != 0
    || ((v125 ^ 1) & 1) != 0
    || ((HIDWORD(v125) ^ 1) & 1) != 0)
  {
    id v55 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136447746;
      long long v153 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
      __int16 v154 = 1024;
      int v155 = 3570;
      __int16 v156 = 1024;
      *(_DWORD *)__int16 v157 = v124 & 1;
      *(_WORD *)&v157[4] = 1024;
      *(_DWORD *)&v157[6] = v39;
      LOWORD(v158) = 1024;
      *(_DWORD *)((char *)&v158 + 2) = v125 & 1;
      HIWORD(v158) = 1024;
      int v159 = BYTE4(v125) & 1;
      __int16 v160 = 2112;
      id v161 = v117;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NWA Doesn't have all fields hasCCA %u hasLinkChanged %u hasAcCompletions %u hastxLatencyBE %u error %@", buf, 0x34u);
    }

    if ([*(id *)(v118 + 32) everAssociated:v39 assocDoneSuccess:v50])
    {
      if (v117)
      {
        uint64_t v56 = *(void *)(*(void *)(v118 + 64) + 8);
        id v57 = v117;
        long long v58 = *(void **)(v56 + 40);
        *(void *)(v56 + 40) = v57;
      }
      else
      {
        NSErrorUserInfoKey v150 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v151 = @"WAErrorCodeOtherMissing";
        long long v58 = +[NSDictionary dictionaryWithObjects:&v151 forKeys:&v150 count:1];
        uint64_t v71 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9028 userInfo:v58];
        uint64_t v72 = *(void *)(*(void *)(v118 + 64) + 8);
        id v73 = *(void **)(v72 + 40);
        *(void *)(v72 + 40) = v71;
      }
      id v74 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        long long v153 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
        __int16 v154 = 1024;
        int v155 = 3582;
        __int16 v156 = 2112;
        *(void *)__int16 v157 = v117;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NWActivity missing mandatory fields due to %@, everAssociated true, attemptRescan true", buf, 0x1Cu);
      }

      uint64_t v51 = v118;
      goto LABEL_67;
    }
    NSErrorUserInfoKey v148 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v149 = @"WAErrorCodeNeverAssociated";
    long long v59 = +[NSDictionary dictionaryWithObjects:&v149 forKeys:&v148 count:1];
    uint64_t v60 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9027 userInfo:v59];
    uint64_t v61 = *(void *)(*(void *)(v118 + 64) + 8);
    int v62 = *(void **)(v61 + 40);
    *(void *)(v61 + 40) = v60;

    __int16 v63 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      long long v153 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
      __int16 v154 = 1024;
      int v155 = 3587;
      __int16 v156 = 2112;
      *(void *)__int16 v157 = v117;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NWActivity missing mandatory fields due to %@, everAssociated false, attemptRescan false", buf, 0x1Cu);
    }

    uint64_t v51 = v118;
  }
  if (v53)
  {
LABEL_67:
    id v75 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      long long v153 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
      __int16 v154 = 1024;
      int v155 = 3591;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting Rescan", buf, 0x12u);
    }

    uint64_t v76 = +[NSDate date];
    __int16 v70 = v76;
    if (*(void *)(*(void *)(v51 + 32) + 664) && (objc_msgSend(v76, "timeIntervalSinceDate:"), v77 > 30.0))
    {
      __int16 v78 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        long long v153 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
        __int16 v154 = 1024;
        int v155 = 3595;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attemping determineChannelsPerIORPopulatable", buf, 0x12u);
      }

      id v79 = WALogCategoryDefaultHandle();
      if (os_signpost_enabled(v79))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v79, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity MissingChannelsRepopulate", "", buf, 2u);
      }

      __int16 v80 = [*(id *)(v51 + 32) iorMessagePopulator];
      [v80 determineChannelsPerIORPopulatableWithinPopulatorBlock];

      CFStringRef v81 = [*(id *)(v51 + 32) iorMessagePopulator];
      uint64_t v82 = *(void *)(v51 + 72);
      v126[0] = _NSConcreteStackBlock;
      uint64_t v84 = *(void *)(v51 + 32);
      uint64_t v83 = *(void *)(v51 + 40);
      long long v85 = *(_OWORD *)(v51 + 56);
      uint64_t v86 = *(void *)(*(void *)(*(void *)(v51 + 56) + 8) + 40);
      v126[1] = 3221225472;
      v126[2] = sub_10005EC54;
      v126[3] = &unk_1000D14C8;
      char v128 = v39;
      BOOL v129 = v50;
      v126[4] = v84;
      long long v127 = v85;
      [v81 prepopulateMessageWithinPopulatorBlock:v86 forProcess:v83 groupType:v82 andReply:v126];

      objc_storeStrong((id *)(*(void *)(v51 + 32) + 664), v70);
    }
    else
    {
      uint64_t v87 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        uint64_t v88 = *(void *)(*(void *)(v51 + 32) + 664);
        *(_DWORD *)buf = 136446722;
        long long v153 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
        __int16 v154 = 1024;
        int v155 = 3658;
        __int16 v156 = 2112;
        *(void *)__int16 v157 = v88;
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "%{public}s::%d:Rescanned too recently, waiting for 30s to elapse since last check at %@", buf, 0x1Cu);
      }
    }
    id v89 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      long long v153 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
      __int16 v154 = 1024;
      int v155 = 3660;
      _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Attempt Complete", buf, 0x12u);
    }

    goto LABEL_82;
  }
  if (v117) {
    goto LABEL_83;
  }
  __int16 v64 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v64))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity GetChannelApInfo", "", buf, 2u);
  }

  int v65 = *(void **)(v51 + 32);
  __int16 v66 = [*(id *)(*(void *)(*(void *)(v51 + 56) + 8) + 40) fieldForKey:@"NWA_controllerStats"];
  id v67 = [v66 subMessageValue];
  [v65 populateChannelInfo:v67];

  uint64_t v51 = v118;
  [*(id *)(v118 + 32) populateApProfile:*(void *)(*(void *)(*(void *)(v118 + 56) + 8) + 40)];
  __int16 v68 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v68))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v68, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity GetChannelApInfo", "", buf, 2u);
  }

  uint64_t v69 = *(void *)(*(void *)(v118 + 64) + 8);
  __int16 v70 = *(void **)(v69 + 40);
  *(void *)(v69 + 40) = 0;
LABEL_82:

LABEL_83:
  uint64_t v90 = *(void *)(v51 + 80);
  if (v90 == 1)
  {
    uint64_t v104 = *(void *)(*(void *)(*(void *)(v51 + 64) + 8) + 40);
    long long v105 = WALogCategoryDefaultHandle();
    id v106 = v105;
    if (v104)
    {
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
      {
        uint64_t v107 = [*(id *)(*(void *)(*(void *)(v118 + 56) + 8) + 40) key];
        uint64_t v108 = *(void *)(*(void *)(*(void *)(v118 + 64) + 8) + 40);
        *(_DWORD *)buf = 136446978;
        long long v153 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
        __int16 v154 = 1024;
        int v155 = 3678;
        __int16 v156 = 2112;
        *(void *)__int16 v157 = v107;
        *(_WORD *)&v157[8] = 2112;
        uint64_t v158 = v108;
        v109 = "%{public}s::%d:Reply style 1, returning with %@ status %@";
        v110 = v106;
        os_log_type_t v111 = OS_LOG_TYPE_ERROR;
        uint32_t v112 = 38;
LABEL_95:
        _os_log_impl((void *)&_mh_execute_header, v110, v111, v109, buf, v112);
      }
    }
    else if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v107 = [*(id *)(*(void *)(*(void *)(v118 + 56) + 8) + 40) key];
      *(_DWORD *)buf = 136446722;
      long long v153 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
      __int16 v154 = 1024;
      int v155 = 3680;
      __int16 v156 = 2112;
      *(void *)__int16 v157 = v107;
      v109 = "%{public}s::%d:Reply style 1, returning with %@ status Success";
      v110 = v106;
      os_log_type_t v111 = OS_LOG_TYPE_DEBUG;
      uint32_t v112 = 28;
      goto LABEL_95;
    }

    __int16 v113 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v113))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v113, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity Reply", "", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(v118 + 48) + 16))();
    long long v102 = WALogCategoryDefaultHandle();
    if (!os_signpost_enabled(v102)) {
      goto LABEL_101;
    }
    *(_WORD *)buf = 0;
    long long v103 = "Engine NWActivity Reply";
    goto LABEL_100;
  }
  if (!v90)
  {
    id v91 = [*(id *)(v51 + 32) submitterMap];
    uint64_t v92 = [v91 objectForKeyedSubscript:*(void *)(v51 + 40)];
    uint64_t v93 = v51;
    int v94 = (void *)v92;
    BOOL v95 = +[NSNumber numberWithInteger:*(void *)(v93 + 72)];
    long long v96 = [v94 objectForKeyedSubscript:v95];

    long long v97 = WALogCategoryDefaultHandle();
    long long v98 = v97;
    if (!v96)
    {
      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        long long v153 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
        __int16 v154 = 1024;
        int v155 = 3672;
        _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:not registered, bailing", buf, 0x12u);
      }

      NSErrorUserInfoKey v146 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v147 = @"WAErrorCodeNotRegistered";
      long long v102 = +[NSDictionary dictionaryWithObjects:&v147 forKeys:&v146 count:1];
      uint64_t v114 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9009 userInfo:v102];
      uint64_t v115 = *(void *)(*(void *)(v118 + 64) + 8);
      v116 = *(void **)(v115 + 40);
      *(void *)(v115 + 40) = v114;

      goto LABEL_101;
    }
    if (os_signpost_enabled(v97))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v98, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity _submitMessage", "", buf, 2u);
    }

    uint64_t v99 = [*(id *)(v118 + 32) _submitMessage:*(void *)(*(void *)(*(void *)(v118 + 56) + 8) + 40) groupType:*(void *)(v118 + 72) forProcessToken:*(void *)(v118 + 40)];
    uint64_t v100 = *(void *)(*(void *)(v118 + 64) + 8);
    long long v101 = *(void **)(v100 + 40);
    *(void *)(v100 + 40) = v99;

    long long v102 = WALogCategoryDefaultHandle();
    if (!os_signpost_enabled(v102))
    {
LABEL_101:

      goto LABEL_102;
    }
    *(_WORD *)buf = 0;
    long long v103 = "Engine NWActivity _submitMessage";
LABEL_100:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v102, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v103, "", buf, 2u);
    goto LABEL_101;
  }
LABEL_102:
}

void sub_10005EC54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 code] == (id)9021
      || [v7 code] == (id)9022
      || [v7 code] == (id)9023
      || [v7 code] == (id)9024
      || [v7 code] == (id)9025
      || [v7 code] == (id)9026)
    {
      __int16 v8 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = *(unsigned __int8 *)(a1 + 56);
        int v10 = *(unsigned __int8 *)(a1 + 57);
        int v28 = 136447234;
        __int16 v29 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
        __int16 v30 = 1024;
        int v31 = 3609;
        __int16 v32 = 1024;
        int v33 = v9;
        __int16 v34 = 1024;
        int v35 = v10;
        __int16 v36 = 2112;
        id v37 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:NWActivity missing mandatory fields on rescan, hasLinkChanged %d, hasAssocDoneSuccess %d: %@", (uint8_t *)&v28, 0x28u);
      }

      switch((unint64_t)[v7 code])
      {
        case 0x233DuLL:
          id v11 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            int v28 = 136446466;
            __int16 v29 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
            __int16 v30 = 1024;
            int v31 = 3612;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:NWActivity missing mandatory fields on rescan: WAErrorCodeCCAMissing", (uint8_t *)&v28, 0x12u);
          }

          uint64_t v12 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            goto LABEL_42;
          }
          LOWORD(v28) = 0;
          uint64_t v13 = "NWActivity missing mandatory fields on rescan: WAErrorCodeCCAMissing";
          break;
        case 0x233EuLL:
          BOOL v23 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            int v28 = 136446466;
            __int16 v29 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
            __int16 v30 = 1024;
            int v31 = 3616;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}s::%d:NWActivity missing mandatory fields on rescan: WAErrorCodeRSSIMissing", (uint8_t *)&v28, 0x12u);
          }

          uint64_t v12 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            goto LABEL_42;
          }
          LOWORD(v28) = 0;
          uint64_t v13 = "NWActivity missing mandatory fields on rescan: WAErrorCodeRSSIMissing";
          break;
        case 0x233FuLL:
          BOOL v20 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            int v28 = 136446466;
            __int16 v29 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
            __int16 v30 = 1024;
            int v31 = 3620;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:NWActivity missing mandatory fields on rescan: WAErrorCodeTxRxFrameCountersMissing", (uint8_t *)&v28, 0x12u);
          }

          uint64_t v12 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            goto LABEL_42;
          }
          LOWORD(v28) = 0;
          uint64_t v13 = "NWActivity missing mandatory fields on rescan: WAErrorCodeTxRxFrameCountersMissing";
          break;
        case 0x2340uLL:
          __int16 v21 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            int v28 = 136446466;
            __int16 v29 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
            __int16 v30 = 1024;
            int v31 = 3624;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:NWActivity missing mandatory fields on rescan: WAErrorCodeTxLatencyBeMissing", (uint8_t *)&v28, 0x12u);
          }

          uint64_t v12 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            goto LABEL_42;
          }
          LOWORD(v28) = 0;
          uint64_t v13 = "NWActivity missing mandatory fields on rescan: WAErrorCodeTxLatencyBeMissing";
          break;
        case 0x2341uLL:
          unsigned int v22 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            int v28 = 136446466;
            __int16 v29 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
            __int16 v30 = 1024;
            int v31 = 3628;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:NWActivity missing mandatory fields on rescan: WAErrorCodeTxCompletionsMissing", (uint8_t *)&v28, 0x12u);
          }

          uint64_t v12 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            goto LABEL_42;
          }
          LOWORD(v28) = 0;
          uint64_t v13 = "NWActivity missing mandatory fields on rescan: WAErrorCodeTxCompletionsMissing";
          break;
        case 0x2342uLL:
          unsigned int v24 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            int v28 = 136446466;
            __int16 v29 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
            __int16 v30 = 1024;
            int v31 = 3632;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:NWActivity missing mandatory fields on rescan: WAErrorCodeHEVHTMCSMissing", (uint8_t *)&v28, 0x12u);
          }

          uint64_t v12 = WALogCategoryDefaultHandle();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            goto LABEL_42;
          }
          LOWORD(v28) = 0;
          uint64_t v13 = "NWActivity missing mandatory fields on rescan: WAErrorCodeHEVHTMCSMissing";
          break;
        default:
          goto LABEL_43;
      }
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v28, 2u);
LABEL_42:
    }
LABEL_43:
    __int16 v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 136446466;
      __int16 v29 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
      __int16 v30 = 1024;
      int v31 = 3648;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan was not successful", (uint8_t *)&v28, 0x12u);
    }
  }
  else
  {
    id v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 136446466;
      __int16 v29 = "-[WAEngine _triggerQueryForNWActivity:forProcessToken:andReply:]_block_invoke";
      __int16 v30 = 1024;
      int v31 = 3641;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan was successful", (uint8_t *)&v28, 0x12u);
    }

    id v15 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v15))
    {
      LOWORD(v28) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity GetChannelApInfo", "", (uint8_t *)&v28, 2u);
    }

    uint64_t v16 = *(void **)(a1 + 32);
    unsigned int v17 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fieldForKey:@"NWA_controllerStats"];
    uint64_t v18 = [v17 subMessageValue];
    [v16 populateChannelInfo:v18];

    [*(id *)(a1 + 32) populateApProfile:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    __int16 v19 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v19))
    {
      LOWORD(v28) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity GetChannelApInfo", "", (uint8_t *)&v28, 2u);
    }
  }

  uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v7;

  __int16 v27 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v27))
  {
    LOWORD(v28) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine NWActivity MissingChannelsRepopulate", "", (uint8_t *)&v28, 2u);
  }
}

void sub_10005FAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10005FB0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v14 = "-[WAEngine _convertWiFiStatsIntoPercentile:analysisGroup:groupTarget:forProcessToken:andReply:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 3743;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to reply percentileWiFiStats", buf, 0x12u);
    }

    NSErrorUserInfoKey v11 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v12 = @"WAErrorCodeInternalError";
    id v5 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v6 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    __int16 v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    int v10 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v10();
  }
}

void sub_1000614EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_10006155C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    int v9 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 3910;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:made DPSR %@ ", (uint8_t *)&v8, 0x1Cu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10006165C(uint64_t a1)
{
  unint64_t v2 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    uint64_t v4 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 3935;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:kSendReportAfterDelay expired", (uint8_t *)&v3, 0x12u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100061720(uint64_t a1)
{
  unint64_t v2 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 112);
    *(_DWORD *)buf = 136446722;
    __int16 v34 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v35 = 1024;
    int v36 = 3966;
    __int16 v37 = 1024;
    int v38 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS Study: Instance %d : start", buf, 0x18u);
  }

  uint64_t v4 = *(unsigned int *)(a1 + 112);
  if (v4)
  {
    if (*(void *)(a1 + 88) == v4)
    {
      __int16 v5 = +[NSDate date];
      [*(id *)(*(void *)(a1 + 32) + 168) setObject:v5 forKeyedSubscript:@"decisionInstance"];
    }
    else
    {
      if (*(void *)(a1 + 96) - 1 != v4) {
        goto LABEL_10;
      }
      __int16 v5 = +[NSDate date];
      [*(id *)(*(void *)(a1 + 32) + 168) setObject:v5 forKeyedSubscript:@"LastInstance"];
    }
  }
  else
  {
    __int16 v5 = +[NSDate date];
    [*(id *)(*(void *)(a1 + 32) + 168) setObject:v5 forKeyedSubscript:@"firstInstance"];
  }

LABEL_10:
  int v6 = (id *)(a1 + 32);
  unsigned __int8 v7 = [*(id *)(a1 + 32) isWiFiAssociatedToNetwork];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v8 + 24)) {
    unsigned __int8 v9 = v7;
  }
  else {
    unsigned __int8 v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;
  unsigned __int8 v10 = [*v6 isWiFiInterfacePrimary];
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  if (*(unsigned char *)(v11 + 24)) {
    unsigned __int8 v12 = v10;
  }
  else {
    unsigned __int8 v12 = 0;
  }
  *(unsigned char *)(v11 + 24) = v12;
  id v13 = (id *)*v6;
  if (*((unsigned char *)*v6 + 42))
  {
    unint64_t v14 = *(unsigned int *)(a1 + 112);
    if (v14)
    {
      unsigned int v15 = *(_DWORD *)(a1 + 112);
    }
    else
    {
      int v6 = [v13[22] preferences];
      if ((unint64_t)objc_msgSend(v6, "dns_symptoms_trap_evaluated_at_sample") > v14)
      {

        goto LABEL_29;
      }
      unsigned int v15 = *(_DWORD *)(a1 + 112);
      id v13 = *(id **)(a1 + 32);
    }
    int v16 = [v13[22] preferences];
    if ((unint64_t)objc_msgSend(v16, "dns_symptoms_trap_evaluated_at_sample") <= v15)
    {
      BOOL v17 = (v14 & 1) == 0;
      unsigned int v18 = [*(id *)(a1 + 32) isWiFiInterfacePrimary];

      if (v17)
      {

        if ((v18 & 1) == 0) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
      if (v18)
      {
LABEL_29:
        [*(id *)(a1 + 32) triggerDiagnosticPingWithrequestId:*(unsigned int *)(a1 + 112)];
        [*(id *)(a1 + 32) fetchSymptomsScores:*(unsigned int *)(a1 + 112)];
      }
    }
    else
    {

      if ((v14 & 1) == 0) {
    }
      }
  }
LABEL_30:
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  __int16 v19 = *(void **)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 104);
  uint64_t v21 = *(void *)(a1 + 40);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100061ADC;
  v25[3] = &unk_1000D15B8;
  objc_copyWeak(v31, (id *)buf);
  unsigned int v22 = *(void **)(a1 + 104);
  uint64_t v29 = *(void *)(a1 + 72);
  v31[1] = v22;
  id v26 = *(id *)(a1 + 40);
  id v23 = *(id *)(a1 + 48);
  int v32 = *(_DWORD *)(a1 + 112);
  uint64_t v30 = *(void *)(a1 + 80);
  uint64_t v24 = *(void *)(a1 + 32);
  id v27 = v23;
  uint64_t v28 = v24;
  [v19 _getNewMessageForKey:@"DPSCS" groupType:v20 forProcessToken:v21 shouldCheckForPrePopulation:1 andReply:v25];

  objc_destroyWeak(v31);
  objc_destroyWeak((id *)buf);
}

void sub_100061AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100061ADC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v8 = WeakRetained[65];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100061C18;
  v15[3] = &unk_1000D1590;
  id v16 = v6;
  id v17 = v5;
  uint64_t v9 = *(void *)(a1 + 56);
  id v18 = WeakRetained;
  uint64_t v22 = v9;
  uint64_t v24 = *(void *)(a1 + 80);
  id v19 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  int v25 = *(_DWORD *)(a1 + 88);
  uint64_t v23 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 48);
  id v20 = v10;
  uint64_t v21 = v11;
  unsigned __int8 v12 = WeakRetained;
  id v13 = v5;
  id v14 = v6;
  dispatch_async(v8, v15);
}

void sub_100061C18(uint64_t a1)
{
  uint64_t v73 = 0;
  id v74 = &v73;
  uint64_t v75 = 0x3032000000;
  uint64_t v76 = sub_10004D654;
  double v77 = sub_10004D664;
  id v78 = 0;
  if (*(void *)(a1 + 32)) {
    goto LABEL_11;
  }
  unint64_t v2 = [*(id *)(a1 + 40) fieldForKey:@"DPSCS_peerStats"];
  int v3 = [v2 subMessageValue];
  BOOL v4 = v3 == 0;

  if (!v4)
  {
    id v5 = *(void **)(a1 + 48);
    id v6 = [*(id *)(a1 + 40) fieldForKey:@"DPSCS_peerStats"];
    unsigned __int8 v7 = [v6 subMessageValue];
    [v5 _examinePeerMessageForIntegrity:v7];
  }
  if (*(void *)(a1 + 32)) {
    goto LABEL_11;
  }
  uint64_t v8 = [*(id *)(a1 + 40) fieldForKey:@"DPSCS_peerStats"];
  uint64_t v9 = [v8 subMessageValue];
  id v10 = [v9 fieldForKey:@"NWAPS_ccas"];
  uint64_t v11 = [v10 repeatableValues];
  BOOL v12 = [v11 count] == 0;

  if (v12)
  {
    id v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v15 = [*(id *)(a1 + 40) fieldForKey:@"DPSCS_peerStats"];
      id v16 = [v15 subMessageValue];
      *(_DWORD *)buf = 136446722;
      uint64_t v82 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke_2";
      __int16 v83 = 1024;
      int v84 = 4005;
      __int16 v85 = 2112;
      uint64_t v86 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to get CCA %@", buf, 0x1Cu);
    }
    NSErrorUserInfoKey v79 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v80 = @"WAErrorCodeCCAMissing";
    id v17 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    uint64_t v18 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9021 userInfo:v17];
    uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    int v13 = 1;
  }
  else
  {
    int v13 = 0;
  }
  if (*(void *)(a1 + 32))
  {
LABEL_11:
    uint64_t v21 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136446722;
      uint64_t v82 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
      __int16 v83 = 1024;
      int v84 = 4012;
      __int16 v85 = 2112;
      uint64_t v86 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s::%d:Got error retrieving DPSCS due to %@", buf, 0x1Cu);
    }

    uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v25 = *(void *)(v23 + 40);
    uint64_t v24 = (id *)(v23 + 40);
    if (!v25)
    {
      objc_storeStrong(v24, *(id *)(a1 + 32));
      id v26 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 136446722;
        uint64_t v82 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        __int16 v83 = 1024;
        int v84 = 4016;
        __int16 v85 = 2112;
        uint64_t v86 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:retErr will return %@", buf, 0x1Cu);
      }
    }
    int v13 = 1;
  }
  if (*(unsigned char *)(*(void *)(a1 + 48) + 51))
  {
    uint64_t v28 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v82 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
      __int16 v83 = 1024;
      int v84 = 4022;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Setting shouldRetry to true due to debug command kWAIORCommandForceStudyErrorFromMsg", buf, 0x12u);
    }

    *(unsigned char *)(*(void *)(a1 + 48) + 51) = 0;
  }
  else if (!v13)
  {
    id v59 = [*(id *)(a1 + 40) copy];
    int v31 = (void *)v74[5];
    v74[5] = (uint64_t)v59;
    goto LABEL_35;
  }
  uint64_t v29 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v82 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v83 = 1024;
    int v84 = 4030;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting Rescan", buf, 0x12u);
  }

  uint64_t v30 = +[NSDate date];
  int v31 = v30;
  if (*(void *)(*(void *)(a1 + 48) + 664) && (objc_msgSend(v30, "timeIntervalSinceDate:"), v32 > 30.0))
  {
    int v33 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v82 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
      __int16 v83 = 1024;
      int v84 = 4034;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attemping determineChannelsPerIORPopulatable", buf, 0x12u);
    }

    __int16 v34 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine DPSCS MissingChannelsRepopulate", "", buf, 2u);
    }

    __int16 v35 = [*(id *)(a1 + 48) iorMessagePopulator];
    [v35 determineChannelsPerIORPopulatable];

    uint64_t v36 = *(void *)(a1 + 96);
    __int16 v37 = *(void **)(a1 + 48);
    uint64_t v38 = *(void *)(a1 + 56);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_1000625CC;
    v68[3] = &unk_1000D1748;
    uint64_t v71 = *(void *)(a1 + 80);
    uint64_t v72 = &v73;
    id v69 = *(id *)(a1 + 40);
    id v70 = *(id *)(a1 + 64);
    [v37 _getNewMessageForKey:@"DPSCS" groupType:v36 forProcessToken:v38 shouldCheckForPrePopulation:1 andReply:v68];
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 664), v31);
  }
  else
  {
    uint64_t v39 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      __int16 v40 = *(void **)(*(void *)(a1 + 48) + 664);
      *(_DWORD *)buf = 136446722;
      uint64_t v82 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
      __int16 v83 = 1024;
      int v84 = 4060;
      __int16 v85 = 2112;
      uint64_t v86 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%{public}s::%d:Rescanned too recently, waiting for 30s to elapse since last check at %@", buf, 0x1Cu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
  }
LABEL_35:

  if (!v74[5]) {
    goto LABEL_53;
  }
  int v41 = (unsigned char *)*(unsigned int *)(a1 + 104);
  if (v41 == 1
    || (uint64_t v42 = *(void *)(a1 + 48), *(unsigned char *)(v42 + 42))
    && ([*(id *)(v42 + 176) preferences],
        id v43 = objc_claimAutoreleasedReturnValue(),
        BOOL v44 = (char *)objc_msgSend(v43, "dns_symptoms_trap_evaluated_at_sample") - 1 == v41,
        v43,
        v44))
  {
    uint64_t v45 = *(void *)(a1 + 96);
    NSErrorUserInfoKey v46 = *(void **)(a1 + 48);
    uint64_t v47 = *(void *)(a1 + 56);
    uint64_t v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    int v62 = sub_100062868;
    __int16 v63 = &unk_1000D1568;
    id v48 = v46;
    uint64_t v49 = *(void *)(a1 + 88);
    int v67 = *(_DWORD *)(a1 + 104);
    uint64_t v50 = *(void *)(a1 + 72);
    id v64 = v48;
    uint64_t v65 = v50;
    uint64_t v66 = v49;
    [v48 _getNewMessageForKey:@"DPSS" groupType:v45 forProcessToken:v47 shouldCheckForPrePopulation:1 andReply:&v60];
  }
  if (!*(unsigned char *)(*(void *)(a1 + 48) + 42))
  {
    if (*(_DWORD *)(a1 + 104) >= 2u) {
      goto LABEL_50;
    }
    goto LABEL_48;
  }
  uint64_t v51 = [*(id *)(*(void *)(a1 + 72) + 176) preferences];
  if (objc_msgSend(v51, "dns_symptoms_trap_evaluated_at_sample") != (id)1)
  {

LABEL_48:
    unsigned int v53 = *(void **)(a1 + 48);
    uint64_t v51 = [[(id)v74[5] fieldForKey:@"DPSCS_controllerStats" withArguments:v60, v61, v62, v63];
    id v54 = [v51 subMessageValue];
    [v53 populateChannelInfo:v54];

    goto LABEL_49;
  }
  if (!*(unsigned char *)(*(void *)(a1 + 48) + 42))
  {
    BOOL v52 = *(_DWORD *)(a1 + 104) < 2u;

    if (!v52) {
      goto LABEL_50;
    }
    goto LABEL_48;
  }
LABEL_49:

LABEL_50:
  id v55 = [[v74[5] fieldForKey:@"DPSCS_timestamp" withObject:v60, v61, v62, v63];
  [v55 setUint64Value:+[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp")];

  uint64_t v56 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    id v57 = (void *)v74[5];
    *(_DWORD *)buf = 136446722;
    uint64_t v82 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v83 = 1024;
    int v84 = 4091;
    __int16 v85 = 2112;
    uint64_t v86 = v57;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding dpsStatsContainer %@ ", buf, 0x1Cu);
  }

  long long v58 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) fieldForKey:@"DPSR_dpsCounterSamples"];
  [v58 addRepeatableSubMessageValue:v74[5]];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
LABEL_53:
  _Block_object_dispose(&v73, 8);
}

void sub_1000625A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000625CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    unsigned int v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v20 = 136446722;
      uint64_t v21 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 4043;
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:retErr reset %@", (uint8_t *)&v20, 0x1Cu);
    }

    id v17 = [*(id *)(a1 + 32) copy];
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(NSObject **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
    goto LABEL_10;
  }
  unsigned __int8 v7 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136446722;
    uint64_t v21 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 4047;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:DPSCS retry still has error %@", (uint8_t *)&v20, 0x1Cu);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void *)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  if (!v10)
  {
    objc_storeStrong(v9, a3);
    uint64_t v11 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v20 = 136446722;
      uint64_t v21 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 4051;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:retErr will return %@", (uint8_t *)&v20, 0x1Cu);
    }
LABEL_10:
  }
  uint64_t v19 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v19))
  {
    LOWORD(v20) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine DPSCS MissingChannelsRepopulate", "", (uint8_t *)&v20, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100062868(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 42))
  {
    uint64_t v8 = *(void **)(v7 + 184);
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
    uint64_t v10 = [v9 subMessageValue];
    uint64_t v11 = [v10 fieldForKey:@"DPSE_symptomsDnsStats"];
    BOOL v12 = [v11 subMessageValue];
    *(unsigned char *)(*(void *)(a1 + 32) + 47) |= [v8 checkAWDLActivity:v5 symptomsDnsStats:v12];
  }
  if (v6)
  {
    uint64_t v13 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136446466;
      id v17 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 4080;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:error populating DPSR_snapshot", (uint8_t *)&v16, 0x12u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    id v14 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136446466;
      id v17 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 4075;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding DPSR_snapshot", (uint8_t *)&v16, 0x12u);
    }

    unsigned int v15 = +[NSDate date];
    [*(id *)(*(void *)(a1 + 40) + 168) setObject:v15 forKeyedSubscript:@"snapshotInstance"];

    uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) fieldForKey:@"DPSR_snapshot"];
    [v13 setSubMessageValue:v5];
    goto LABEL_10;
  }
LABEL_11:
}

void sub_100062AB8(uint64_t a1)
{
  int v3 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = (char *)*(unsigned int *)(a1 + 88);
    if (*(unsigned char *)(v4 + 42))
    {
      id v6 = [*(id *)(v4 + 176) preferences];
      uint64_t v7 = (char *)[v6 dns_symptoms_trap_evaluated_at_sample] - 1;

      if (v7 != v5) {
        goto LABEL_111;
      }
      unsigned int v8 = [*(id *)(a1 + 32) isWiFiNetworkCaptive];
      [*(id *)(a1 + 32) computeAverageCcaSinceStudyStart:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      uint64_t v9 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = "YES";
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          uint64_t v11 = "YES";
        }
        else {
          uint64_t v11 = "NO";
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
          BOOL v12 = "YES";
        }
        else {
          BOOL v12 = "NO";
        }
        if (v8) {
          uint64_t v13 = "YES";
        }
        else {
          uint64_t v13 = "NO";
        }
        if (!*(unsigned char *)(a1 + 92)) {
          uint64_t v10 = "NO";
        }
        *(_DWORD *)buf = 136447490;
        v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        __int16 v111 = 1024;
        int v112 = 4235;
        __int16 v113 = 2080;
        uint64_t v114 = v11;
        __int16 v115 = 2080;
        v116 = v12;
        __int16 v117 = 2080;
        uint64_t v118 = (void *)v13;
        __int16 v119 = 2080;
        uint64_t v120 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS Symptoms pre-decision check:: Associated:%s Primary:%s isCaptive:%s isValidDnsConfig:%s", buf, 0x3Au);
      }

      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        uint64_t v50 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
          __int16 v111 = 1024;
          int v112 = 4248;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SDNS: WiFi Not Associated - setting suppressedReason kSymptomsDnsWiFiDisassociatedDuringStudy", buf, 0x12u);
        }

        id v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
        __int16 v18 = [v17 subMessageValue];
        int v19 = [v18 fieldForKey:@"DPSE_symptomsDnsStats"];
        int v20 = [v19 subMessageValue];
        uint64_t v21 = [v20 fieldForKey:@"WFAAWDWASDS_suppressedReason"];
        __int16 v22 = v21;
        uint64_t v23 = 6;
        goto LABEL_60;
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
        char v14 = v8;
      }
      else {
        char v14 = 1;
      }
      if (v14)
      {
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
        {
          id v59 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
            __int16 v111 = 1024;
            int v112 = 4252;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SDNS: WiFi Not Primary - setting suppressedReason kSymptomsDnsWiFiInterfaceNotPrimary", buf, 0x12u);
          }

          id v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
          __int16 v18 = [v17 subMessageValue];
          int v19 = [v18 fieldForKey:@"DPSE_symptomsDnsStats"];
          int v20 = [v19 subMessageValue];
          uint64_t v21 = [v20 fieldForKey:@"WFAAWDWASDS_suppressedReason"];
          __int16 v22 = v21;
          uint64_t v23 = 8;
          goto LABEL_60;
        }
        int v15 = *(unsigned __int8 *)(a1 + 92);
        int v16 = WALogCategoryDefaultHandle();
        id v17 = v16;
        if (v15)
        {
          if (!v8)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
              __int16 v111 = 1024;
              int v112 = 4263;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:SDNS: Unhandled running conditions", buf, 0x12u);
            }
            goto LABEL_61;
          }
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
            __int16 v111 = 1024;
            int v112 = 4260;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SDNS: WiFi is Captive - setting suppressedReason kSymptomsDnsWiFiNetworkIsCaptive", buf, 0x12u);
          }

          id v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
          __int16 v18 = [v17 subMessageValue];
          int v19 = [v18 fieldForKey:@"DPSE_symptomsDnsStats"];
          int v20 = [v19 subMessageValue];
          uint64_t v21 = [v20 fieldForKey:@"WFAAWDWASDS_suppressedReason"];
          __int16 v22 = v21;
          uint64_t v23 = 9;
LABEL_60:
          [v21 setInt32Value:v23];

LABEL_61:
          id v58 = 0;
          goto LABEL_62;
        }
      }
      else
      {
        int v51 = *(unsigned __int8 *)(a1 + 92);
        BOOL v52 = WALogCategoryDefaultHandle();
        id v17 = v52;
        if (v51)
        {
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
            __int16 v111 = 1024;
            int v112 = 4238;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SDNS: WiFi Not Primary - setting suppressedReason kSymptomsDnsWiFiInterfaceNotPrimary", buf, 0x12u);
          }

          id v17 = [*(id *)(a1 + 32) dpsQuickRecoveryEngine];
          unsigned int v53 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
          id v54 = [v53 subMessageValue];
          id v55 = [v54 fieldForKey:@"DPSE_symptomsDnsStats"];
          uint64_t v56 = [v55 subMessageValue];
          uint64_t v57 = *(void *)(a1 + 32);
          LODWORD(v96) = *(void *)(v57 + 240);
          id v58 = [v17 recommendSymptomsDpsRecovery:0 symptomsDnsStats:v56 awdlState:*(unsigned __int8 *)(v57 + 47) currentSymptomsCondition:*(unsigned __int8 *)(v57 + 44) isLANPingSuccessful:*(unsigned __int8 *)(v57 + 46) appUsage:*(unsigned __int8 *)(v57 + 41) averageCCA:v96];

LABEL_62:
          uint64_t v60 = [*(id *)(a1 + 32) interfaceNameToApple80211InstanceMap];
          uint64_t v61 = [*(id *)(a1 + 32) infraInterfaceName];
          int v62 = [v60 objectForKeyedSubscript:v61];

          if (!v62) {
            [*(id *)(a1 + 32) queryInfraInterfaceInstanceAndChip];
          }
          if (v58 == (id)2)
          {
            __int16 v68 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446466;
              v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
              __int16 v111 = 1024;
              int v112 = 4276;
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Triggering Reassoc for symptoms-dps", buf, 0x12u);
            }

            id v69 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446466;
              v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
              __int16 v111 = 1024;
              int v112 = 4277;
              _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SDNS: Recommendation - kSymptomsdDPSReassoc, triggering reassoc wiith reason ReassociateOnDNSSymptoms", buf, 0x12u);
            }

            *(_DWORD *)(*(void *)(a1 + 32) + 60) |= 0x80u;
            uint64_t v65 = [*(id *)(a1 + 32) interfaceNameToApple80211InstanceMap];
            uint64_t v66 = [*(id *)(a1 + 32) infraInterfaceName];
            int v67 = [v65 objectForKeyedSubscript:v66];
            [v67 triggerReassociation:@"ReassociateOnDNSSymptoms"];
          }
          else
          {
            if (v58 != (id)1)
            {
              uint64_t v71 = WALogCategoryDefaultHandle();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446466;
                v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
                __int16 v111 = 1024;
                int v112 = 4281;
                _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: No Recovery Action recommended for symptoms-dps", buf, 0x12u);
              }

              uint64_t v65 = WALogCategoryDefaultHandle();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446466;
                v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
                __int16 v111 = 1024;
                int v112 = 4282;
                _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SDNS: No Recommendation", buf, 0x12u);
              }
              goto LABEL_77;
            }
            __int16 v63 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446466;
              v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
              __int16 v111 = 1024;
              int v112 = 4271;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiagnostics: Triggering Trap for symptoms-dps", buf, 0x12u);
            }

            id v64 = WALogCategoryDefaultHandle();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446466;
              v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
              __int16 v111 = 1024;
              int v112 = 4272;
              _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SDNS: Recommendation - WASymptomsDpsRecommendDoReset, triggering DpsReset with reason TrapOnDNSSymptoms", buf, 0x12u);
            }

            *(_DWORD *)(*(void *)(a1 + 32) + 60) |= 0x40u;
            uint64_t v65 = [*(id *)(a1 + 32) interfaceNameToApple80211InstanceMap];
            uint64_t v66 = [*(id *)(a1 + 32) infraInterfaceName];
            int v67 = [v65 objectForKeyedSubscript:v66];
            [v67 triggerDpsReset:@"TrapOnDNSSymptoms"];
          }

LABEL_77:
          id v70 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
            __int16 v111 = 1024;
            int v112 = 4284;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Persisting after DNS symptoms recovery decision", buf, 0x12u);
          }

          [*(id *)(a1 + 32) persist];
          goto LABEL_111;
        }
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        __int16 v111 = 1024;
        int v112 = 4256;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SDNS: DNS Config Not Valid - setting suppressedReason kSymptomsDnsServerConfigurationInvalid", buf, 0x12u);
      }

      id v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
      __int16 v18 = [v17 subMessageValue];
      int v19 = [v18 fieldForKey:@"DPSE_symptomsDnsStats"];
      int v20 = [v19 subMessageValue];
      uint64_t v21 = [v20 fieldForKey:@"WFAAWDWASDS_suppressedReason"];
      __int16 v22 = v21;
      uint64_t v23 = 10;
      goto LABEL_60;
    }
    id v25 = &off_100096000;
    if (v5 != 1) {
      goto LABEL_110;
    }
    if (!*(void *)(a1 + 40)) {
      goto LABEL_110;
    }
    id v26 = [v3 fieldForKey:@"DPSR_dpsCounterSamples"];
    id v27 = [v26 repeatableValues];
    id v28 = [v27 count];

    uint64_t v4 = *(void *)(a1 + 32);
    if ((unint64_t)v28 < 2)
    {
LABEL_110:
      int v94 = *(void **)(v4 + 176);
      uint64_t v95 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v105[0] = _NSConcreteStackBlock;
      v105[1] = *((void *)v25 + 307);
      v105[2] = sub_100063F24;
      v105[3] = &unk_1000D1608;
      uint64_t v107 = *(void *)(a1 + 72);
      v105[4] = v4;
      id v106 = *(id *)(a1 + 48);
      [v94 recommendActionFromData:v95 andReply:v105];

      goto LABEL_111;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100063EB0;
    block[3] = &unk_1000D0D98;
    void block[4] = v4;
    if (qword_1000F1088 != -1) {
      dispatch_once(&qword_1000F1088, block);
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      uint64_t v76 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        __int16 v111 = 1024;
        int v112 = 4166;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Aborting DPS recovery since WiFi got disassociated atleast once since initial trigger", buf, 0x12u);
      }

      double v77 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
      id v78 = [v77 subMessageValue];
      NSErrorUserInfoKey v79 = [v78 fieldForKey:@"DPSE_qDpsStats"];
      CFStringRef v80 = [v79 subMessageValue];
      CFStringRef v81 = [v80 fieldForKey:@"WFAAWDWAQDS_suppressedReason"];
      [v81 setInt32Value:4];

      goto LABEL_109;
    }
    uint64_t v100 = *(void **)(a1 + 40);
    uint64_t v104 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsCounterSamples"];
    long long v103 = [v104 repeatableValues];
    long long v97 = [v103 objectAtIndex:0];
    long long v102 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsCounterSamples"];
    long long v101 = [v102 repeatableValues];
    uint64_t v29 = [v101 objectAtIndex:1];
    uint64_t v98 = *(void *)(*(void *)(a1 + 32) + 536);
    uint64_t v99 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
    uint64_t v30 = [v99 subMessageValue];
    int v31 = [v30 fieldForKey:@"DPSE_qDpsStats"];
    double v32 = [v31 subMessageValue];
    int v33 = [*(id *)(a1 + 32) wifiChipSet];
    __int16 v34 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"DPSR_snapshot"];
    __int16 v35 = [v34 subMessageValue];
    LODWORD(v96) = [*(id *)(a1 + 32) dpsNotificationCCA];
    id v36 = [v100 recommendReset:v97 currentSample:v29 acList:v98 qDpsStat:v32 chipNumber:v33 dpsSnapshot:v35 originalCCA:v96];

    __int16 v37 = +[NSDate date];
    [v37 timeIntervalSince1970];
    double v39 = v38;

    unint64_t v40 = *(void *)(*(void *)(a1 + 32) + 200);
    if (v39 > (double)v40)
    {
      unint64_t v41 = (unint64_t)v39 - v40;
      uint64_t v42 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke_2";
        __int16 v111 = 1024;
        int v112 = 4138;
        __int16 v113 = 1024;
        LODWORD(v114) = v41;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Time elapsed since original dps detection: %d seconds", buf, 0x18u);
      }

      if (v36 == (id)1 && v41 <= 5)
      {
        id v43 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
          __int16 v111 = 1024;
          int v112 = 4142;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Reseting (fast reset recovery)... to recover from DPS at 6s stall checkpoint.", buf, 0x12u);
        }

        BOOL v44 = [*(id *)(a1 + 32) interfaceNameToApple80211InstanceMap];
        uint64_t v45 = [*(id *)(a1 + 32) infraInterfaceName];
        uint64_t v46 = [v44 objectForKeyedSubscript:v45];
        id v25 = &off_100096000;
        if (v46)
        {
          uint64_t v47 = (void *)v46;
          id v48 = [*(id *)(a1 + 32) wifiChipSet];
          unsigned int v49 = [v48 isEqualToString:&stru_1000D3628];

          if (!v49) {
            goto LABEL_99;
          }
        }
        else
        {
        }
        [*(id *)(a1 + 32) queryInfraInterfaceInstanceAndChip];
LABEL_99:
        *(_DWORD *)(*(void *)(a1 + 32) + 60) |= 4u;
        __int16 v83 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          int v84 = [*(id *)(a1 + 32) wifiChipSet];
          __int16 v85 = [*(id *)(a1 + 32) infraInterfaceName];
          uint64_t v86 = [*(id *)(a1 + 32) interfaceNameToApple80211InstanceMap];
          uint64_t v87 = [*(id *)(a1 + 32) infraInterfaceName];
          uint64_t v88 = [v86 objectForKeyedSubscript:v87];
          *(_DWORD *)buf = 136447234;
          v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
          CFStringRef v89 = @"Yes";
          __int16 v111 = 1024;
          int v112 = 4150;
          if (!v88) {
            CFStringRef v89 = @"No";
          }
          __int16 v113 = 2112;
          uint64_t v114 = v84;
          __int16 v115 = 2112;
          v116 = v85;
          __int16 v117 = 2112;
          uint64_t v118 = (void *)v89;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Triggering Trap for Quick DPS in chip:%@ interface:%@ apple80211InstanceValid:%@", buf, 0x30u);
        }
        uint64_t v90 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
          __int16 v111 = 1024;
          int v112 = 4152;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:QDPS: Recommendation - kFastDPSWatchdog, triggering DpsReset with reason TrapOnQuickDPS", buf, 0x12u);
        }

        uint64_t v72 = [*(id *)(a1 + 32) interfaceNameToApple80211InstanceMap];
        id v91 = [*(id *)(a1 + 32) infraInterfaceName];
        uint64_t v92 = [v72 objectForKeyedSubscript:v91];
        [v92 triggerDpsReset:@"TrapOnQuickDPS"];

        goto LABEL_106;
      }
    }
    if (v36 == (id)2)
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 60) |= 0x10u;
      uint64_t v72 = WALogCategoryDefaultHandle();
      id v25 = &off_100096000;
      if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
LABEL_106:

        uint64_t v93 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
          __int16 v111 = 1024;
          int v112 = 4163;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Persisting after Quick DPS recovery decision", buf, 0x12u);
        }

        [*(id *)(a1 + 32) persist];
LABEL_109:
        uint64_t v4 = *(void *)(a1 + 32);
        goto LABEL_110;
      }
      *(_DWORD *)buf = 136446466;
      v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
      __int16 v111 = 1024;
      int v112 = 4157;
      uint64_t v73 = "%{public}s::%d:QDPS: No Watchdog Budget";
      id v74 = v72;
      os_log_type_t v75 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      uint64_t v82 = WALogCategoryDefaultHandle();
      id v25 = &off_100096000;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        __int16 v111 = 1024;
        int v112 = 4159;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Aborting Quick DPS recovery action due to notification/study delay", buf, 0x12u);
      }

      uint64_t v72 = WALogCategoryDefaultHandle();
      if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
        goto LABEL_106;
      }
      *(_DWORD *)buf = 136446466;
      v110 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
      __int16 v111 = 1024;
      int v112 = 4161;
      uint64_t v73 = "%{public}s::%d:QDPS: Unhandled case";
      id v74 = v72;
      os_log_type_t v75 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl((void *)&_mh_execute_header, v74, v75, v73, buf, 0x12u);
    goto LABEL_106;
  }
  __int16 v24 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "nil message passed in to recommendActionFromData", buf, 2u);
  }

LABEL_111:
}

void sub_100063EB0(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) wifiChipSet];
  unsigned int v3 = [v2 isEqualToString:&stru_1000D3628];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 queryInfraInterfaceInstanceAndChip];
  }
}

void sub_100063F24(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  switch(a2)
  {
    case 0:
      id v6 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v21 = 136446466;
        *(void *)&void v21[4] = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        *(_WORD *)&v21[12] = 1024;
        *(_DWORD *)&v21[14] = 4175;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WARecommendNull", v21, 0x12u);
      }

      if ([v5 isEqualToString:@"dps_wd_cca"])
      {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:@"SlowDpsCcaThreshold" forKeyedSubscript:@"sDpsSuppressionReason"];
        uint64_t v7 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        unsigned int v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"sDpsSuppressionReason"];
        *(_DWORD *)uint64_t v21 = 136446722;
        *(void *)&void v21[4] = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        *(_WORD *)&v21[12] = 1024;
        *(_DWORD *)&v21[14] = 4179;
        *(_WORD *)&v21[18] = 2112;
        *(void *)&v21[20] = v8;
        uint64_t v9 = "%{public}s::%d:SDPS: No Recommendation - setting suppressedReason %@";
      }
      else
      {
        if (![v5 isEqualToString:&stru_1000D3628])
        {
          uint64_t v7 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v21 = 136446466;
            *(void *)&void v21[4] = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
            *(_WORD *)&v21[12] = 1024;
            *(_DWORD *)&v21[14] = 4184;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SDPS: No Recommendation", v21, 0x12u);
          }
          goto LABEL_23;
        }
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:@"SlowDpsRecoveryObserved" forKeyedSubscript:@"sDpsSuppressionReason"];
        uint64_t v7 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        unsigned int v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"sDpsSuppressionReason"];
        *(_DWORD *)uint64_t v21 = 136446722;
        *(void *)&void v21[4] = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        *(_WORD *)&v21[12] = 1024;
        *(_DWORD *)&v21[14] = 4182;
        *(_WORD *)&v21[18] = 2112;
        *(void *)&v21[20] = v8;
        uint64_t v9 = "%{public}s::%d:SDPS: No Recommendation - setting suppressedReason %@";
      }
      goto LABEL_22;
    case 1:
      uint64_t v10 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v21 = 136446466;
        *(void *)&void v21[4] = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        *(_WORD *)&v21[12] = 1024;
        *(_DWORD *)&v21[14] = 4189;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WARecommendFullCapture", v21, 0x12u);
      }

      uint64_t v11 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v21 = 136446722;
        *(void *)&void v21[4] = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        *(_WORD *)&v21[12] = 1024;
        *(_DWORD *)&v21[14] = 4190;
        *(_WORD *)&v21[18] = 2112;
        *(void *)&v21[20] = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SDPS: Recommend Full Capture, with classification %@", v21, 0x1Cu);
      }

      [*(id *)(*(void *)(a1 + 32) + 504) __dumpCoreCaptureLogsWithReason:v5];
      goto LABEL_24;
    case 2:
      BOOL v12 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v21 = 136446466;
        *(void *)&void v21[4] = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        *(_WORD *)&v21[12] = 1024;
        *(_DWORD *)&v21[14] = 4195;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WARecommendTrapWatchdog", v21, 0x12u);
      }

      int v13 = *(_DWORD *)(*(void *)(a1 + 32) + 60);
      char v14 = WALogCategoryDefaultHandle();
      int v15 = v14;
      if ((v13 & 4) != 0)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v21 = 136446466;
          *(void *)&void v21[4] = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
          *(_WORD *)&v21[12] = 1024;
          *(_DWORD *)&v21[14] = 4197;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Fast DPS already triggered, not proceeding with WARecommendTrapWatchdog", v21, 0x12u);
        }

        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:@"SlowDpsAbortedSinceQDpsTriggered" forKeyedSubscript:@"sDpsSuppressionReason"];
        int v19 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"sDpsSuppressionReason"];
          *(_DWORD *)uint64_t v21 = 136446722;
          *(void *)&void v21[4] = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
          *(_WORD *)&v21[12] = 1024;
          *(_DWORD *)&v21[14] = 4200;
          *(_WORD *)&v21[18] = 2112;
          *(void *)&v21[20] = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SDPS: Recommendation WARecommendTrapWatchdog - setting suppressedReason %@", v21, 0x1Cu);
        }
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v21 = 136446722;
          *(void *)&void v21[4] = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
          *(_WORD *)&v21[12] = 1024;
          *(_DWORD *)&v21[14] = 4202;
          *(_WORD *)&v21[18] = 2112;
          *(void *)&v21[20] = v5;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SDPS: Recommendation WARecommendTrapWatchdog - triggering DpsReset with reason %@", v21, 0x1Cu);
        }

        [*(id *)(a1 + 32) _trapFWWithReason:v5 andReply:*(void *)(a1 + 40)];
        *(_DWORD *)(*(void *)(a1 + 32) + 60) |= 2u;
      }
      id v17 = &__kCFBooleanTrue;
      goto LABEL_25;
    case 3:
      int v16 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v21 = 136446466;
        *(void *)&void v21[4] = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        *(_WORD *)&v21[12] = 1024;
        *(_DWORD *)&v21[14] = 4210;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WARecommendNoneNoWatchdogBudget", v21, 0x12u);
      }

      *(_DWORD *)(*(void *)(a1 + 32) + 60) |= 8u;
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:@"SlowDpsNoBudget" forKeyedSubscript:@"sDpsSuppressionReason"];
      uint64_t v7 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:@"sDpsSuppressionReason"];
        *(_DWORD *)uint64_t v21 = 136446722;
        *(void *)&void v21[4] = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        *(_WORD *)&v21[12] = 1024;
        *(_DWORD *)&v21[14] = 4215;
        *(_WORD *)&v21[18] = 2112;
        *(void *)&v21[20] = v8;
        uint64_t v9 = "%{public}s::%d:SDPS: No Watchdog Budget - setting suppressedReason %@";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, v21, 0x1Cu);
      }
LABEL_23:

      goto LABEL_24;
    default:
LABEL_24:
      id v17 = &__kCFBooleanFalse;
LABEL_25:
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v17 forKeyedSubscript:@"sDpsStudyRecommendation" withObject:*(_OWORD *)v21 withObject:*(_OWORD *)&v21[16]];
      __int16 v18 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v21 = 136446466;
        *(void *)&void v21[4] = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        *(_WORD *)&v21[12] = 1024;
        *(_DWORD *)&v21[14] = 4223;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Persisting after Slow DPS recovery decision", v21, 0x12u);
      }

      [*(id *)(a1 + 32) persist];
      return;
  }
}

void sub_1000646DC(uint64_t a1)
{
  unint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  unsigned int v3 = [v2 subMessageValue];
  uint64_t v4 = [v3 fieldForKey:@"DPSE_isAssociatedAtStudyEnd"];
  [v4 setBoolValue:[*(id *)(a1 + 32) isWiFiAssociatedToNetwork]];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  uint64_t v7 = [v6 subMessageValue];
  unsigned int v8 = [v7 fieldForKey:@"DPSE_discoveredPeerInfo"];
  uint64_t v9 = [v8 subMessageValue];
  [v5 gatherDiscoveredPeerInfo:v9];

  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  uint64_t v140 = a1;
  id v10 = *(id *)(*(void *)(a1 + 32) + 536);
  id v11 = [v10 countByEnumeratingWithState:&v158 objects:v176 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v159;
    do
    {
      for (int i = 0; i != v12; int i = (char *)i + 1)
      {
        if (*(void *)v159 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v158 + 1) + 8 * i);
        int v16 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
          __int16 v164 = 1024;
          int v165 = 4304;
          __int16 v166 = 2112;
          uint64_t v167 = (uint64_t)v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding cached DPSR_stallNotifications: %@", buf, 0x1Cu);
        }

        id v17 = [*(id *)(*(void *)(*(void *)(v140 + 56) + 8) + 40) fieldForKey:@"DPSR_stallNotifications"];
        [v17 addRepeatableSubMessageValue:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v158 objects:v176 count:16];
    }
    while (v12);
  }

  long long v156 = 0u;
  long long v157 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  id v18 = *(id *)(*(void *)(v140 + 32) + 544);
  id v19 = [v18 countByEnumeratingWithState:&v154 objects:v175 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v155;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v155 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v154 + 1) + 8 * (void)j);
        __int16 v24 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
          __int16 v164 = 1024;
          int v165 = 4309;
          __int16 v166 = 2112;
          uint64_t v167 = (uint64_t)v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding cached DPSR_probeResults: %@", buf, 0x1Cu);
        }

        id v25 = [*(id *)(*(void *)(*(void *)(v140 + 56) + 8) + 40) fieldForKey:@"DPSR_probeResults"];
        [v25 addRepeatableSubMessageValue:v23];
      }
      id v20 = [v18 countByEnumeratingWithState:&v154 objects:v175 count:16];
    }
    while (v20);
  }

  uint64_t v26 = [*(id *)(*(void *)(v140 + 32) + 552) lastObject];
  if (v26)
  {
    id v27 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
      __int16 v164 = 1024;
      int v165 = 4317;
      __int16 v166 = 2112;
      uint64_t v167 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding cached DPSR_dpsCounterSamples: %@", buf, 0x1Cu);
    }

    id v28 = [*(id *)(*(void *)(*(void *)(v140 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsCounterSamples"];
    [v28 addRepeatableSubMessageValue:v26];
  }
  uint64_t v29 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v164 = 1024;
    int v165 = 4321;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DatapathStall Summary!", buf, 0x12u);
  }

  uint64_t v30 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = [*(id *)(*(void *)(*(void *)(v140 + 56) + 8) + 40) fieldForKey:@"DPSR_stallNotifications"];
    double v32 = [v31 repeatableValues];
    id v33 = [v32 count];
    *(_DWORD *)buf = 136446722;
    NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v164 = 1024;
    int v165 = 4322;
    __int16 v166 = 2048;
    uint64_t v167 = (uint64_t)v33;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPSR_stallNotifications: %lu", buf, 0x1Cu);
  }
  __int16 v34 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v35 = [*(id *)(*(void *)(*(void *)(v140 + 56) + 8) + 40) fieldForKey:@"DPSR_probeResults"];
    id v36 = [v35 repeatableValues];
    id v37 = [v36 count];
    *(_DWORD *)buf = 136446722;
    NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v164 = 1024;
    int v165 = 4323;
    __int16 v166 = 2048;
    uint64_t v167 = (uint64_t)v37;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPSR_probeResults: %lu", buf, 0x1Cu);
  }
  long long v139 = (void *)v26;

  double v38 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    double v39 = [*(id *)(*(void *)(*(void *)(v140 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsCounterSamples"];
    unint64_t v40 = [v39 repeatableValues];
    id v41 = [v40 count];
    *(_DWORD *)buf = 136446722;
    NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v164 = 1024;
    int v165 = 4324;
    __int16 v166 = 2048;
    uint64_t v167 = (uint64_t)v41;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPSR_dpsCounterSamples: %lu", buf, 0x1Cu);
  }
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  id v42 = *(id *)(*(void *)(v140 + 32) + 560);
  id v43 = [v42 countByEnumeratingWithState:&v150 objects:v174 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v151;
    do
    {
      for (k = 0; k != v44; k = (char *)k + 1)
      {
        if (*(void *)v151 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = *(void **)(*((void *)&v150 + 1) + 8 * (void)k);
        id v48 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
          __int16 v164 = 1024;
          int v165 = 4328;
          __int16 v166 = 2112;
          uint64_t v167 = (uint64_t)v47;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding cached DPSE_associationChanges: %@", buf, 0x1Cu);
        }

        unsigned int v49 = [*(id *)(*(void *)(*(void *)(v140 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
        uint64_t v50 = [v49 subMessageValue];
        int v51 = [v50 fieldForKey:@"DPSE_associationChanges"];
        [v51 addRepeatableSubMessageValue:v47];
      }
      id v44 = [v42 countByEnumeratingWithState:&v150 objects:v174 count:16];
    }
    while (v44);
  }

  long long v148 = 0u;
  long long v149 = 0u;
  long long v147 = 0u;
  long long v146 = 0u;
  id v52 = *(id *)(*(void *)(v140 + 32) + 480);
  id v53 = [v52 countByEnumeratingWithState:&v146 objects:v173 count:16];
  if (v53)
  {
    id v54 = v53;
    uint64_t v55 = *(void *)v147;
    do
    {
      for (m = 0; m != v54; m = (char *)m + 1)
      {
        if (*(void *)v147 != v55) {
          objc_enumerationMutation(v52);
        }
        uint64_t v57 = *(void **)(*((void *)&v146 + 1) + 8 * (void)m);
        id v58 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
          __int16 v164 = 1024;
          int v165 = 4333;
          __int16 v166 = 2112;
          uint64_t v167 = (uint64_t)v57;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding cached DPSE_accessPointInfo: %@", buf, 0x1Cu);
        }

        id v59 = [*(id *)(*(void *)(*(void *)(v140 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
        uint64_t v60 = [v59 subMessageValue];
        uint64_t v61 = [v60 fieldForKey:@"DPSE_accessPointInfos"];
        [v61 addRepeatableSubMessageValue:v57];
      }
      id v54 = [v52 countByEnumeratingWithState:&v146 objects:v173 count:16];
    }
    while (v54);
  }

  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  uint64_t v62 = v140;
  id v63 = *(id *)(*(void *)(v140 + 32) + 496);
  id v64 = [v63 countByEnumeratingWithState:&v142 objects:v172 count:16];
  if (v64)
  {
    id v65 = v64;
    uint64_t v66 = *(void *)v143;
    do
    {
      for (n = 0; n != v65; n = (char *)n + 1)
      {
        if (*(void *)v143 != v66) {
          objc_enumerationMutation(v63);
        }
        __int16 v68 = *(void **)(*((void *)&v142 + 1) + 8 * (void)n);
        id v69 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
          __int16 v164 = 1024;
          int v165 = 4338;
          __int16 v166 = 2112;
          uint64_t v167 = (uint64_t)v68;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding cached DPSR_usbEvent: %@", buf, 0x1Cu);
        }

        uint64_t v62 = v140;
        id v70 = [*(id *)(*(void *)(*(void *)(v140 + 56) + 8) + 40) fieldForKey:@"DPSR_usbEvents"];
        [v70 addRepeatableSubMessageValue:v68];
      }
      id v65 = [v63 countByEnumeratingWithState:&v142 objects:v172 count:16];
    }
    while (v65);
  }

  uint64_t v71 = *(void *)(v62 + 32);
  if (*(unsigned char *)(v71 + 42))
  {
    uint64_t v72 = *(NSObject **)(v71 + 488);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100065C48;
    block[3] = &unk_1000D1658;
    uint64_t v73 = *(void *)(v62 + 80);
    uint64_t v74 = *(void *)(v62 + 56);
    void block[4] = v71;
    void block[5] = v74;
    block[6] = v73;
    dispatch_sync(v72, block);
  }
  else
  {
    os_log_type_t v75 = [*(id *)(*(void *)(*(void *)(v62 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
    uint64_t v76 = [v75 subMessageValue];
    double v77 = [v76 fieldForKey:@"DPSE_studyType"];
    [v77 setInt32Value:0];
  }
  id v78 = [*(id *)(*(void *)(*(void *)(v62 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  NSErrorUserInfoKey v79 = [v78 subMessageValue];
  CFStringRef v80 = [v79 fieldForKey:@"DPSE_action"];
  [v80 setInt32Value:*(unsigned int *)(*(void *)(v62 + 32) + 60)];

  CFStringRef v81 = [*(id *)(*(void *)(*(void *)(v62 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  uint64_t v82 = [v81 subMessageValue];
  __int16 v83 = [v82 fieldForKey:@"DPSE_actionIntVal"];
  [v83 setUint32Value:*(unsigned int *)(*(void *)(v62 + 32) + 60)];

  int v84 = [*(id *)(*(void *)(*(void *)(v62 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  __int16 v85 = [v84 subMessageValue];
  uint64_t v86 = [v85 fieldForKey:@"DPSE_timestamp"];
  [v86 setUint64Value:+[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp")];

  uint64_t v87 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v88 = [*(id *)(*(void *)(*(void *)(v62 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
    *(_DWORD *)buf = 136446722;
    NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v164 = 1024;
    int v165 = 4404;
    __int16 v166 = 2112;
    uint64_t v167 = (uint64_t)v88;
    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPSR_dpsEpiloge: %@", buf, 0x1Cu);
  }
  [*(id *)(*(void *)(*(void *)(v62 + 56) + 8) + 40) setMetricID:589928];
  if (*(void *)(v62 + 40))
  {
    CFStringRef v89 = [*(id *)(v62 + 32) submitterMap];
    uint64_t v90 = [v89 objectForKeyedSubscript:*(void *)(v62 + 40)];
    id v91 = +[NSNumber numberWithInteger:*(void *)(v62 + 88)];
    uint64_t v92 = [v90 objectForKeyedSubscript:v91];

    if (!v92)
    {
      uint64_t v93 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        __int16 v164 = 1024;
        int v165 = 4412;
        _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "%{public}s::%d:Registration somehow was cleared", buf, 0x12u);
      }

      [*(id *)(v62 + 32) _purgeGroupTypeIfNecessary:*(void *)(v62 + 88)];
      int v94 = [*(id *)(v62 + 32) processTokenToGroupTypeMap];
      uint64_t v95 = [v94 objectForKeyedSubscript:*(void *)(v62 + 40)];

      if (!v95)
      {
        id v96 = objc_alloc_init((Class)NSMutableSet);
        long long v97 = [*(id *)(v62 + 32) processTokenToGroupTypeMap];
        [v97 setObject:v96 forKeyedSubscript:*(void *)(v62 + 40)];
      }
      uint64_t v98 = [*(id *)(v62 + 32) processTokenToGroupTypeMap];
      uint64_t v99 = [v98 objectForKeyedSubscript:*(void *)(v62 + 40)];
      uint64_t v100 = +[NSNumber numberWithInteger:*(void *)(v62 + 88)];
      [v99 addObject:v100];

      [*(id *)(v62 + 32) _initSubmitterAndQueryableRegistrationForProcessToken:*(void *)(v62 + 40) andGroupType:*(void *)(v62 + 88)];
      long long v101 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v102 = *(void *)(v62 + 88);
        long long v103 = +[WAUtil trimTokenForLogging:*(void *)(v62 + 40)];
        *(_DWORD *)buf = 136446978;
        NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        __int16 v164 = 1024;
        int v165 = 4423;
        __int16 v166 = 2048;
        uint64_t v167 = v102;
        __int16 v168 = 2112;
        id v169 = v103;
        _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:registering message group type: %ld for process: %@", buf, 0x26u);
      }
    }
    uint64_t v104 = [*(id *)(v62 + 32) _submitMessage:*(void *)(*(void *)(*(void *)(v62 + 56) + 8) + 40) groupType:*(void *)(v62 + 88) forProcessToken:*(void *)(v62 + 40)];
    uint64_t v105 = *(void *)(*(void *)(v62 + 64) + 8);
    id v106 = *(void **)(v105 + 40);
    *(void *)(v105 + 40) = v104;

    uint64_t v107 = v139;
    if (*(void *)(*(void *)(*(void *)(v62 + 64) + 8) + 40))
    {
      uint64_t v108 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
        __int16 v164 = 1024;
        int v165 = 4435;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%{public}s::%d:Not sending incomplete DPSR to AWD", buf, 0x12u);
      }

      v109 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT))
      {
        long long v133 = *(const char **)(*(void *)(*(void *)(v62 + 64) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        NSErrorUserInfoKey v163 = v133;
        _os_log_fault_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_FAULT, "Not sending incomplete DPSR to AWD %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v110 = *(void *)(v62 + 32);
      uint64_t v111 = *(void *)(*(void *)(*(void *)(v62 + 56) + 8) + 40);
      uint64_t v112 = *(void *)(*(void *)(*(void *)(v62 + 72) + 8) + 40);
      __int16 v113 = *(void **)(v110 + 160);
      uint64_t v114 = *(void *)(v110 + 168);
      if (*(unsigned char *)(v110 + 42)) {
        [v113 transformAndSubmitDNSMessageToCA:v111 additionalInfo:v112 timestamps:v114];
      }
      else {
        [v113 transformAndSubmitDPSMessageToCA:v111 additionalInfo:v112 timestamps:v114];
      }
    }
  }
  else
  {
    long long v134 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
      __int16 v164 = 1024;
      int v165 = 4410;
      _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_ERROR, "%{public}s::%d:nil processToken", buf, 0x12u);
    }

    NSErrorUserInfoKey v170 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v171 = @"WAErrorCodeLacksRequiredArgument";
    long long v135 = +[NSDictionary dictionaryWithObjects:&v171 forKeys:&v170 count:1];
    uint64_t v136 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9010 userInfo:v135];
    uint64_t v137 = *(void *)(*(void *)(v62 + 64) + 8);
    long long v138 = *(void **)(v137 + 40);
    *(void *)(v137 + 40) = v136;

    uint64_t v107 = v139;
  }
  __int16 v115 = [*(id *)(*(void *)(*(void *)(v62 + 56) + 8) + 40) fieldForKey:@"DPSR_stallNotifications"];
  v116 = [v115 repeatableValues];
  [v116 removeAllObjects];

  __int16 v117 = [*(id *)(*(void *)(*(void *)(v62 + 56) + 8) + 40) fieldForKey:@"DPSR_probeResults"];
  uint64_t v118 = [v117 repeatableValues];
  [v118 removeAllObjects];

  __int16 v119 = [*(id *)(*(void *)(*(void *)(v62 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsCounterSamples"];
  uint64_t v120 = [v119 repeatableValues];
  [v120 removeAllObjects];

  id v121 = [*(id *)(*(void *)(*(void *)(v62 + 56) + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  uint64_t v122 = [v121 subMessageValue];
  unsigned int v123 = [v122 fieldForKey:@"DPSE_associationChanges"];
  int v124 = [v123 repeatableValues];
  [v124 removeAllObjects];

  [*(id *)(*(void *)(v62 + 32) + 536) removeAllObjects];
  [*(id *)(*(void *)(v62 + 32) + 544) removeAllObjects];
  [*(id *)(*(void *)(v62 + 32) + 552) removeAllObjects];
  [*(id *)(*(void *)(v62 + 32) + 560) removeAllObjects];
  [*(id *)(*(void *)(v62 + 32) + 480) removeAllObjects];
  [*(id *)(*(void *)(v62 + 32) + 496) removeAllObjects];
  [*(id *)(*(void *)(v62 + 32) + 168) removeAllObjects];
  uint64_t v125 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v164 = 1024;
    int v165 = 4453;
    _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_dpsCurrentlyGatheringConsecutiveSamples FALSE", buf, 0x12u);
  }

  *(unsigned char *)(*(void *)(v62 + 32) + 33) = 0;
  id v126 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    NSErrorUserInfoKey v163 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v164 = 1024;
    int v165 = 4455;
    _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_dpsStudyInProgress False", buf, 0x12u);
  }

  *(unsigned char *)(*(void *)(v62 + 32) + 42) = 0;
  *(unsigned char *)(*(void *)(v62 + 32) + 32) = 0;
  long long v127 = [*(id *)(v62 + 32) dpsStudyTransaction];

  if (v127)
  {
    char v128 = +[WAActivityManager sharedActivityManager];
    BOOL v129 = [*(id *)(v62 + 32) dpsStudyTransaction];
    [v128 osTransactionComplete:v129];

    [*(id *)(v62 + 32) setDpsStudyTransaction:0];
  }
  long long v130 = [*(id *)(v62 + 32) dnsStudyTransaction];

  if (v130)
  {
    long long v131 = +[WAActivityManager sharedActivityManager];
    long long v132 = [*(id *)(v62 + 32) dnsStudyTransaction];
    [v131 osTransactionComplete:v132];

    [*(id *)(v62 + 32) setDnsStudyTransaction:0];
  }
  if ([*(id *)(v62 + 32) isMemoryPressureRequestDeferred]) {
    [*(id *)(v62 + 32) handleMemoryWarning:1];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v62 + 48));
}

void sub_100065C48(void *a1)
{
  unsigned int v3 = (void *)a1[4];
  unint64_t v4 = v3[31];
  double v5 = 0.0;
  double v6 = 0.0;
  if (v4) {
    double v6 = (double)(unint64_t)v3[32] / (double)v4 * 100.0;
  }
  unint64_t v7 = v3[33];
  if (v7) {
    double v5 = (double)(unint64_t)v3[34] / (double)v7 * 100.0;
  }
  unint64_t v8 = v3[35];
  double v9 = 0.0;
  double v10 = 0.0;
  if (v8) {
    double v10 = (double)(unint64_t)v3[36] / (double)v8 * 100.0;
  }
  unint64_t v11 = v3[37];
  if (v11) {
    double v9 = (double)(unint64_t)v3[38] / (double)v11 * 100.0;
  }
  id v12 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = a1[4];
    uint64_t v14 = *(void *)(v13 + 248);
    uint64_t v15 = *(void *)(v13 + 280);
    int v158 = 136447490;
    long long v159 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v160 = 1024;
    int v161 = 4352;
    __int16 v162 = 2048;
    double v163 = v6;
    __int16 v164 = 2048;
    double v165 = v10;
    __int16 v166 = 2048;
    uint64_t v167 = v14;
    __int16 v168 = 2048;
    uint64_t v169 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:LANPingResultSummary: LANHealth-before-trap:%.2f%% LANHealth-after-trap:%.2f%% totalPingsBeforeTrap:%lu totalPingsAfterTrap:%lu", (uint8_t *)&v158, 0x3Au);
  }

  int v16 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = a1[4];
    uint64_t v18 = *(void *)(v17 + 264);
    uint64_t v19 = *(void *)(v17 + 296);
    int v158 = 136447490;
    long long v159 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v160 = 1024;
    int v161 = 4353;
    __int16 v162 = 2048;
    double v163 = v5;
    __int16 v164 = 2048;
    double v165 = v9;
    __int16 v166 = 2048;
    uint64_t v167 = v18;
    __int16 v168 = 2048;
    uint64_t v169 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WANPingResultSummary: WANHealth-before-trap:%.2f%% WANHealth-after-trap:%.2f%% totalPingsBeforeTrap:%lu totalPingsAfterTrap:%lu", (uint8_t *)&v158, 0x3Au);
  }

  id v20 = [*(id *)(a1[4] + 176) preferences];
  unint64_t v21 = (unint64_t)[v20 dns_symptoms_trap_evaluated_at_sample];
  unint64_t v22 = v21 >> 1;

  uint64_t v23 = (unsigned char *)a1[6];
  __int16 v24 = [*(id *)(a1[4] + 176) preferences];
  id v25 = [v24 dns_symptoms_trap_evaluated_at_sample];

  double v26 = 0.0;
  double v27 = 0.0;
  if (v21 >= 2) {
    double v27 = (double)(v22 - *(void *)(a1[4] + 312)) / (double)v22 * 100.0;
  }
  unint64_t v28 = v23 - v25;
  if (v23 != v25) {
    double v26 = (double)(v28 - *(void *)(a1[4] + 320)) / (double)v28 * 100.0;
  }
  double v29 = 0.0;
  double v30 = 0.0;
  if (v21 >= 2) {
    double v30 = (double)(100 * ((v22 - *(void *)(a1[4] + 328)) / v22));
  }
  if (v23 != v25) {
    double v29 = (double)(100 * ((v28 - *(void *)(a1[4] + 336)) / v28));
  }
  int v31 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = *(void *)(a1[4] + 312);
    int v158 = 136447234;
    long long v159 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v160 = 1024;
    int v161 = 4363;
    __int16 v162 = 2048;
    double v163 = *(double *)&v22;
    __int16 v164 = 2048;
    *(void *)&double v165 = v23 - v25;
    __int16 v166 = 2048;
    uint64_t v167 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:totalInstancesBeforeTrap:%lu totalInstancesAfterTrap:%lu times-netscore-below-threshold-before-trap:%lu", (uint8_t *)&v158, 0x30u);
  }

  id v33 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    int v158 = 136446978;
    long long v159 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v160 = 1024;
    int v161 = 4364;
    __int16 v162 = 2048;
    double v163 = v27;
    __int16 v164 = 2048;
    double v165 = v26;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:NetScoreSummary: NetScore Health-before-trap:%.2f%% Health-after-trap:%.2f%%", (uint8_t *)&v158, 0x26u);
  }

  __int16 v34 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    int v158 = 136446978;
    long long v159 = "-[WAEngine gatherConsecutiveDatapathReadings:forProcessToken:andReply:]_block_invoke";
    __int16 v160 = 1024;
    int v161 = 4365;
    __int16 v162 = 2048;
    double v163 = v30;
    __int16 v164 = 2048;
    double v165 = v29;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DataStallScoreSummary: DataStallScore Health-before-trap:%.2f%% Health-after-trap:%.2f%%", (uint8_t *)&v158, 0x26u);
  }

  __int16 v35 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  id v36 = [v35 subMessageValue];
  id v37 = [v36 fieldForKey:@"DPSE_studyType"];
  [v37 setInt32Value:1];

  double v38 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  double v39 = [v38 subMessageValue];
  unint64_t v40 = [v39 fieldForKey:@"DPSE_symptomsDnsStats"];
  id v41 = [v40 subMessageValue];
  id v42 = [v41 fieldForKey:@"WFAAWDWASDS_totalDnsServers"];
  [v42 setUint32Value:*(unsigned int *)(a1[4] + 344)];

  id v43 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  id v44 = [v43 subMessageValue];
  uint64_t v45 = [v44 fieldForKey:@"DPSE_symptomsDnsStats"];
  uint64_t v46 = [v45 subMessageValue];
  uint64_t v47 = [v46 fieldForKey:@"WFAAWDWASDS_numIpv4DnsServers"];
  [v47 setUint32Value:*(unsigned int *)(a1[4] + 352)];

  id v48 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  unsigned int v49 = [v48 subMessageValue];
  uint64_t v50 = [v49 fieldForKey:@"DPSE_symptomsDnsStats"];
  int v51 = [v50 subMessageValue];
  id v52 = [v51 fieldForKey:@"WFAAWDWASDS_numIpv6DnsServers"];
  [v52 setUint32Value:*(unsigned int *)(a1[4] + 360)];

  id v53 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  id v54 = [v53 subMessageValue];
  uint64_t v55 = [v54 fieldForKey:@"DPSE_symptomsDnsStats"];
  uint64_t v56 = [v55 subMessageValue];
  uint64_t v57 = [v56 fieldForKey:@"WFAAWDWASDS_numLocalDnsServers"];
  [v57 setUint32Value:*(unsigned int *)(a1[4] + 368)];

  id v58 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  id v59 = [v58 subMessageValue];
  uint64_t v60 = [v59 fieldForKey:@"DPSE_symptomsDnsStats"];
  uint64_t v61 = [v60 subMessageValue];
  uint64_t v62 = [v61 fieldForKey:@"WFAAWDWASDS_numRemoteDnsServers"];
  [v62 setUint32Value:*(unsigned int *)(a1[4] + 376)];

  id v63 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  id v64 = [v63 subMessageValue];
  id v65 = [v64 fieldForKey:@"DPSE_symptomsDnsStats"];
  uint64_t v66 = [v65 subMessageValue];
  int v67 = [v66 fieldForKey:@"WFAAWDWASDS_configType"];
  [v67 setInt32Value:*(unsigned int *)(a1[4] + 384)];

  __int16 v68 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  id v69 = [v68 subMessageValue];
  id v70 = [v69 fieldForKey:@"DPSE_symptomsDnsStats"];
  uint64_t v71 = [v70 subMessageValue];
  uint64_t v72 = [v71 fieldForKey:@"WFAAWDWASDS_netscoreAtStudyStart"];
  [v72 setUint32Value:*(unsigned int *)(a1[4] + 392)];

  uint64_t v73 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  uint64_t v74 = [v73 subMessageValue];
  os_log_type_t v75 = [v74 fieldForKey:@"DPSE_symptomsDnsStats"];
  uint64_t v76 = [v75 subMessageValue];
  double v77 = [v76 fieldForKey:@"WFAAWDWASDS_stallscoreAtStudyStart"];
  [v77 setUint32Value:*(unsigned int *)(a1[4] + 400)];

  id v78 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  NSErrorUserInfoKey v79 = [v78 subMessageValue];
  CFStringRef v80 = [v79 fieldForKey:@"DPSE_symptomsDnsStats"];
  CFStringRef v81 = [v80 subMessageValue];
  uint64_t v82 = [v81 fieldForKey:@"WFAAWDWASDS_impactedServersAtStudyStart"];
  [v82 setUint32Value:*(unsigned int *)(a1[4] + 408)];

  __int16 v83 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  int v84 = [v83 subMessageValue];
  __int16 v85 = [v84 fieldForKey:@"DPSE_symptomsDnsStats"];
  uint64_t v86 = [v85 subMessageValue];
  uint64_t v87 = [v86 fieldForKey:@"WFAAWDWASDS_netscoreHealthBeforeDecision"];
  [v87 setUint32Value:v27];

  uint64_t v88 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  CFStringRef v89 = [v88 subMessageValue];
  uint64_t v90 = [v89 fieldForKey:@"DPSE_symptomsDnsStats"];
  id v91 = [v90 subMessageValue];
  uint64_t v92 = [v91 fieldForKey:@"WFAAWDWASDS_stallscoreHealthBeforeDecision"];
  [v92 setUint32Value:v30];

  uint64_t v93 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  int v94 = [v93 subMessageValue];
  uint64_t v95 = [v94 fieldForKey:@"DPSE_symptomsDnsStats"];
  id v96 = [v95 subMessageValue];
  long long v97 = [v96 fieldForKey:@"WFAAWDWASDS_lanHealthBeforeDecision"];
  [v97 setUint32Value:v6];

  uint64_t v98 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  uint64_t v99 = [v98 subMessageValue];
  uint64_t v100 = [v99 fieldForKey:@"DPSE_symptomsDnsStats"];
  long long v101 = [v100 subMessageValue];
  uint64_t v102 = [v101 fieldForKey:@"WFAAWDWASDS_wanHealthBeforeDecision"];
  [v102 setUint32Value:v5];

  long long v103 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  uint64_t v104 = [v103 subMessageValue];
  uint64_t v105 = [v104 fieldForKey:@"DPSE_symptomsDnsStats"];
  id v106 = [v105 subMessageValue];
  uint64_t v107 = [v106 fieldForKey:@"WFAAWDWASDS_isCaptiveServerIPResolved"];
  [v107 setBoolValue:*(unsigned __int8 *)(a1[4] + 43)];

  uint64_t v108 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  v109 = [v108 subMessageValue];
  uint64_t v110 = [v109 fieldForKey:@"DPSE_symptomsDnsStats"];
  uint64_t v111 = [v110 subMessageValue];
  uint64_t v112 = [v111 fieldForKey:@"WFAAWDWASDS_netscoreAtStudyEnd"];
  [v112 setUint32Value:*(unsigned int *)(a1[4] + 416)];

  __int16 v113 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  uint64_t v114 = [v113 subMessageValue];
  __int16 v115 = [v114 fieldForKey:@"DPSE_symptomsDnsStats"];
  v116 = [v115 subMessageValue];
  __int16 v117 = [v116 fieldForKey:@"WFAAWDWASDS_stallscoreAtStudyEnd"];
  [v117 setUint32Value:*(unsigned int *)(a1[4] + 424)];

  uint64_t v118 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  __int16 v119 = [v118 subMessageValue];
  uint64_t v120 = [v119 fieldForKey:@"DPSE_symptomsDnsStats"];
  id v121 = [v120 subMessageValue];
  uint64_t v122 = [v121 fieldForKey:@"WFAAWDWASDS_impactedServersAtStudyEnd"];
  [v122 setUint32Value:*(unsigned int *)(a1[4] + 432)];

  unsigned int v123 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  int v124 = [v123 subMessageValue];
  uint64_t v125 = [v124 fieldForKey:@"DPSE_symptomsDnsStats"];
  id v126 = [v125 subMessageValue];
  long long v127 = [v126 fieldForKey:@"WFAAWDWASDS_netscoreHealthAfterDecision"];
  [v127 setUint32Value:v26];

  char v128 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  BOOL v129 = [v128 subMessageValue];
  long long v130 = [v129 fieldForKey:@"DPSE_symptomsDnsStats"];
  long long v131 = [v130 subMessageValue];
  long long v132 = [v131 fieldForKey:@"WFAAWDWASDS_stallscoreHealthAfterDecision"];
  [v132 setUint32Value:v29];

  long long v133 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  long long v134 = [v133 subMessageValue];
  long long v135 = [v134 fieldForKey:@"DPSE_symptomsDnsStats"];
  uint64_t v136 = [v135 subMessageValue];
  uint64_t v137 = [v136 fieldForKey:@"WFAAWDWASDS_lanHealthAfterDecision"];
  [v137 setUint32Value:v10];

  long long v138 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  long long v139 = [v138 subMessageValue];
  uint64_t v140 = [v139 fieldForKey:@"DPSE_symptomsDnsStats"];
  long long v141 = [v140 subMessageValue];
  long long v142 = [v141 fieldForKey:@"WFAAWDWASDS_wanHealthAfterDecision"];
  [v142 setUint32Value:v9];

  long long v143 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  long long v144 = [v143 subMessageValue];
  long long v145 = [v144 fieldForKey:@"DPSE_symptomsDnsStats"];
  long long v146 = [v145 subMessageValue];
  long long v147 = [v146 fieldForKey:@"WFAAWDWASDS_dpsNotificationReceivedDuringStudy"];
  [v147 setBoolValue:*(unsigned __int8 *)(a1[4] + 38)];

  long long v148 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  long long v149 = [v148 subMessageValue];
  long long v150 = [v149 fieldForKey:@"DPSE_symptomsDnsStats"];
  long long v151 = [v150 subMessageValue];
  long long v152 = [v151 fieldForKey:@"WFAAWDWASDS_slowWiFiNotificationReceivedDuringStudy"];
  [v152 setBoolValue:*(unsigned __int8 *)(a1[4] + 39)];

  long long v153 = [*(id *)(*(void *)(a1[5] + 8) + 40) fieldForKey:@"DPSR_dpsEpiloge"];
  long long v154 = [v153 subMessageValue];
  long long v155 = [v154 fieldForKey:@"DPSE_symptomsDnsStats"];
  long long v156 = [v155 subMessageValue];
  long long v157 = [v156 fieldForKey:@"WFAAWDWASDS_isPingEnqueueFailing"];
  [v157 setBoolValue:*(unsigned __int8 *)(a1[4] + 40)];
}

void sub_1000680B8(uint64_t a1)
{
  [*(id *)(a1 + 32) initializeProbeCxt];
}

void sub_1000680FC(uint64_t a1)
{
  [*(id *)(a1 + 32) triggerPeerDiagnosticsStudy:*(void *)(a1 + 40) symptomsDnsStats:0];
}

void sub_100068144(uint64_t a1, void *a2)
{
  id v3 = [a2 copy];
  unint64_t v4 = [v3 fieldForKey:@"DPSCS_timestamp"];
  [v4 setUint64Value:+[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp")];

  double v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446722;
    unint64_t v8 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 4564;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding dpsStatsContainer while _dpsStudyInProgress %@ ", (uint8_t *)&v7, 0x1Cu);
  }

  [*(id *)(*(void *)(a1 + 32) + 552) addObject:v3];
  double v6 = +[NSDate date];
  [*(id *)(*(void *)(a1 + 32) + 168) setObject:v6 forKeyedSubscript:@"end"];
}

void sub_100068294(uint64_t a1, void *a2)
{
  id v3 = [a2 copy];
  unint64_t v4 = [v3 fieldForKey:@"DPSCS_timestamp"];
  [v4 setUint64Value:+[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp")];

  double v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 4628;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding dpsStatsContainer while _dpsStudyInProgress %@ ", (uint8_t *)&v6, 0x1Cu);
  }

  [*(id *)(*(void *)(a1 + 32) + 552) addObject:v3];
}

void sub_1000683B4(uint64_t a1, void *a2)
{
  id v3 = [a2 copy];
  unint64_t v4 = [v3 fieldForKey:@"DPSCS_timestamp"];
  [v4 setUint64Value:+[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp")];

  double v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 4656;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding dpsStatsContainer while _dpsStudyInProgress %@ ", (uint8_t *)&v6, 0x1Cu);
  }

  [*(id *)(*(void *)(a1 + 32) + 552) addObject:v3];
}

void sub_1000684D4(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100068584;
  v5[3] = &unk_1000D0F60;
  id v6 = *(id *)(a1 + 48);
  [v3 gatherConsecutiveDatapathReadings:0 forProcessToken:v4 andReply:v5];
}

void sub_100068584(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  double v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[WAEngine _triggerDPSStudy:forProcessToken:waMessage:andReply:]_block_invoke_2";
    __int16 v8 = 1024;
    int v9 = 4680;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:gatherConsecutiveDatapathReadings replied err %@", (uint8_t *)&v6, 0x1Cu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100068F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

id sub_100068F7C()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1000F10A0;
  uint64_t v7 = qword_1000F10A0;
  if (!qword_1000F10A0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100074EC4;
    v3[3] = &unk_1000D1010;
    v3[4] = &v4;
    sub_100074EC4((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100069048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100069060(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000698F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_100069934(uint64_t a1)
{
  unint64_t v2 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    uint64_t v4 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 4797;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:slow_wifi_report_sent_after expired", (uint8_t *)&v3, 0x12u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000699F8(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 72);
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100069B20;
  v10[3] = &unk_1000D1798;
  objc_copyWeak(v15, &location);
  __int16 v5 = *(void **)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  id v6 = v5;
  uint64_t v7 = *(void **)(a1 + 72);
  id v11 = v6;
  v15[1] = v7;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 64);
  id v12 = v8;
  uint64_t v14 = v9;
  [v3 _getNewMessageForKey:@"WFAAWDLQM" groupType:v2 forProcessToken:v4 shouldCheckForPrePopulation:1 andReply:v10];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void sub_100069B04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100069B20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = dispatch_get_global_queue(0, 0);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100069C64;
  v17[3] = &unk_1000D1770;
  id v18 = WeakRetained;
  id v19 = v6;
  uint64_t v9 = *(void *)(a1 + 48);
  id v20 = v5;
  uint64_t v23 = v9;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 72);
  id v21 = v10;
  uint64_t v25 = v11;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 56);
  id v22 = v12;
  uint64_t v24 = v13;
  id v14 = v5;
  id v15 = v6;
  id v16 = WeakRetained;
  dispatch_async(v8, v17);
}

void sub_100069C64(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 51))
  {
    uint64_t v2 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v41 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke_3";
      __int16 v42 = 1024;
      int v43 = 4819;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Setting error due to debug command kWAIORCommandForceStudyErrorFromMsg", buf, 0x12u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 51) = 0;
    int v3 = (id *)(a1 + 40);
  }
  else
  {
    int v3 = (id *)(a1 + 40);
    if (!*(void *)(a1 + 40))
    {
      uint64_t v32 = [*(id *)(a1 + 48) fieldForKey:@"WFAAWDLQM_timestamp"];
      [v32 setUint64Value:+[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp")];

      id v33 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v41 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
        __int16 v42 = 1024;
        int v43 = 4890;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding linkQualSample", buf, 0x12u);
      }

      id v15 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) fieldForKey:@"SWFR_linkQualSamples"];
      id v34 = [*(id *)(a1 + 48) copy];
      [v15 addRepeatableSubMessageValue:v34];

      goto LABEL_36;
    }
  }
  uint64_t v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136446978;
    id v41 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
    __int16 v42 = 1024;
    int v43 = 4826;
    __int16 v44 = 2112;
    uint64_t v45 = v5;
    __int16 v46 = 2112;
    uint64_t v47 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find Slow WiFi values properly populated %@ err: %@", buf, 0x26u);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  if (!v9)
  {
    objc_storeStrong(v8, *v3);
    id v10 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 136446722;
      id v41 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
      __int16 v42 = 1024;
      int v43 = 4830;
      __int16 v44 = 2112;
      uint64_t v45 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:retErr will return %@", buf, 0x1Cu);
    }
  }
  if ([*v3 code] == (id)9029 && objc_msgSend(*(id *)(a1 + 32), "isAXAssociatoin"))
  {
    id v12 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v41 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
      __int16 v42 = 1024;
      int v43 = 4834;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:LinkQualitySamples missing mandatory fields: WAErrorCodeTxOutputBelowExpectedMissing, but PHY MODE is APPLE80211_MODE_11AX rdar://80134615, clearing error", buf, 0x12u);
    }

    uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    id v15 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 136446722;
      id v41 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
      __int16 v42 = 1024;
      int v43 = 4836;
      __int16 v44 = 2112;
      uint64_t v45 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:retErr reset %@", buf, 0x1Cu);
    }
LABEL_36:

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
    return;
  }
  uint64_t v17 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v41 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
    __int16 v42 = 1024;
    int v43 = 4840;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting Rescan", buf, 0x12u);
  }

  id v18 = +[NSDate date];
  id v19 = v18;
  if (*(void *)(*(void *)(a1 + 32) + 664) && (objc_msgSend(v18, "timeIntervalSinceDate:"), v20 > 30.0))
  {
    id v21 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v41 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
      __int16 v42 = 1024;
      int v43 = 4844;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attemping determineChannelsPerIORPopulatable", buf, 0x12u);
    }

    id v22 = WALogCategoryDefaultHandle();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Engine LinkQualitySamples MissingChannelsRepopulate", "", buf, 2u);
    }

    uint64_t v23 = [*(id *)(a1 + 32) iorMessagePopulator];
    [v23 determineChannelsPerIORPopulatable];

    uint64_t v24 = *(void **)(a1 + 32);
    uint64_t v25 = *(void *)(a1 + 88);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10006A38C;
    v35[3] = &unk_1000D1748;
    uint64_t v26 = *(void *)(a1 + 64);
    uint64_t v38 = *(void *)(a1 + 72);
    id v27 = *(id *)(a1 + 48);
    uint64_t v28 = *(void *)(a1 + 80);
    id v36 = v27;
    uint64_t v39 = v28;
    id v37 = *(id *)(a1 + 56);
    [v24 _getNewMessageForKey:@"WFAAWDLQM" groupType:v25 forProcessToken:v26 shouldCheckForPrePopulation:1 andReply:v35];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 664), v19);
  }
  else
  {
    double v29 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 664);
      *(_DWORD *)buf = 136446722;
      id v41 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
      __int16 v42 = 1024;
      int v43 = 4882;
      __int16 v44 = 2112;
      uint64_t v45 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}s::%d:Rescanned too recently, waiting for 30s to elapse since last check at %@", buf, 0x1Cu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  }
  int v31 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v41 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
    __int16 v42 = 1024;
    int v43 = 4885;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Rescan Attempt Complete", buf, 0x12u);
  }
}

void sub_10006A38C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  uint64_t v9 = v10;
  if (v6)
  {
    if (!v9)
    {
      objc_storeStrong(v8, a3);
      uint64_t v11 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        int v23 = 136446722;
        uint64_t v24 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
        __int16 v25 = 1024;
        int v26 = 4862;
        __int16 v27 = 2112;
        id v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:retErr will return %@", (uint8_t *)&v23, 0x1Cu);
      }
    }
    id v13 = [v6 code];
    id v14 = WALogCategoryDefaultHandle();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v13 == (id)9029)
    {
      if (v15)
      {
        int v23 = 136446466;
        uint64_t v24 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
        __int16 v25 = 1024;
        int v26 = 4867;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:LinkQualitySample missing mandatory fields on rescan: WAErrorCodeTxOutputBelowExpectedMissing", (uint8_t *)&v23, 0x12u);
      }

      id v14 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v23) = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "LinkQualitySample missing mandatory fields on rescan: WAErrorCodeTxOutputBelowExpectedMissing", (uint8_t *)&v23, 2u);
      }
    }
    else if (v15)
    {
      int v23 = 136446722;
      uint64_t v24 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 4871;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:LinkQualitySample error %@", (uint8_t *)&v23, 0x1Cu);
    }
  }
  else
  {
    id *v8 = 0;

    uint64_t v16 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v23 = 136446722;
      uint64_t v24 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 4853;
      __int16 v27 = 2112;
      id v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:retErr reset %@", (uint8_t *)&v23, 0x1Cu);
    }

    id v18 = [v5 fieldForKey:@"WFAAWDLQM_timestamp"];
    [v18 setUint64Value:+[WAUtil getAWDTimestamp](WAUtil, "getAWDTimestamp")];

    id v19 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      double v20 = *(void **)(a1 + 32);
      int v23 = 136446722;
      uint64_t v24 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 4856;
      __int16 v27 = 2112;
      id v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding retry linkQualSample %@", (uint8_t *)&v23, 0x1Cu);
    }

    id v14 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"SWFR_linkQualSamples"];
    id v21 = [v5 copy];
    [v14 addRepeatableSubMessageValue:v21];
  }
  id v22 = WALogCategoryDefaultHandle();
  if (os_signpost_enabled(v22))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Engine LinkQualitySamples MissingChannelsRepopulate", "", (uint8_t *)&v23, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t sub_10006A79C(uint64_t a1)
{
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 568);
  id v3 = [v2 countByEnumeratingWithState:&v95 objects:v110 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v96;
    *(void *)&long long v4 = 136446722;
    long long v90 = v4;
    do
    {
      for (int i = 0; i != v5; int i = (char *)i + 1)
      {
        if (*(void *)v96 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        uint64_t v9 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v90;
          uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
          __int16 v101 = 1024;
          int v102 = 4910;
          __int16 v103 = 2112;
          unint64_t v104 = (unint64_t)v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding cached SWFR_slowNotice: %@", buf, 0x1Cu);
        }

        id v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"SWFR_slowNotice"];
        [v10 setSubMessageValue:v8];
      }
      id v5 = [v2 countByEnumeratingWithState:&v95 objects:v110 count:16];
    }
    while (v5);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v11 = *(id *)(*(void *)(a1 + 32) + 496);
  id v12 = [v11 countByEnumeratingWithState:&v91 objects:v109 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v92;
    *(void *)&long long v13 = 136446722;
    long long v90 = v13;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v92 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v91 + 1) + 8 * (void)j);
        id v18 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v90;
          uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
          __int16 v101 = 1024;
          int v102 = 4915;
          __int16 v103 = 2112;
          unint64_t v104 = (unint64_t)v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Adding cached SWFR_usbEvent: %@", buf, 0x1Cu);
        }

        id v19 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"SWFR_usbEvents"];
        [v19 setSubMessageValue:v17];
      }
      id v14 = [v11 countByEnumeratingWithState:&v91 objects:v109 count:16];
    }
    while (v14);
  }

  double v20 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
    __int16 v101 = 1024;
    int v102 = 4919;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SlowWiFi Summary!", buf, 0x12u);
  }

  id v21 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"SWFR_linkQualSamples"];
    int v23 = [v22 repeatableValues];
    id v24 = [v23 count];
    *(_DWORD *)buf = 136446722;
    uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
    __int16 v101 = 1024;
    int v102 = 4920;
    __int16 v103 = 2048;
    unint64_t v104 = (unint64_t)v24;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SWFR_linkQualSamples: %lu", buf, 0x1Cu);
  }
  __int16 v25 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"SWFR_slowNotice"];
    __int16 v27 = [v26 subMessageValue];
    id v28 = [v27 fieldForKey:@"WFAAWDSWFN_actionField"];
    unsigned int v29 = [v28 uint32Value];
    *(_DWORD *)buf = 136446722;
    uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
    __int16 v101 = 1024;
    int v102 = 4921;
    __int16 v103 = 2048;
    unint64_t v104 = v29;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WFAAWDSWFN_actionField: %lx", buf, 0x1Cu);
  }
  uint64_t v30 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"SWFR_slowNotice"];
    uint64_t v32 = [v31 subMessageValue];
    id v33 = [v32 fieldForKey:@"WFAAWDSWFN_recoveryAction"];
    unsigned int v34 = [v33 uint32Value];
    *(_DWORD *)buf = 136446722;
    uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
    __int16 v101 = 1024;
    int v102 = 4922;
    __int16 v103 = 2048;
    unint64_t v104 = v34;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WFAAWDSWFN_recoveryAction: %lx", buf, 0x1Cu);
  }
  __int16 v35 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    id v36 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"SWFR_slowNotice"];
    id v37 = [v36 subMessageValue];
    uint64_t v38 = [v37 fieldForKey:@"WFAAWDSWFN_recoveryReason"];
    unsigned int v39 = [v38 uint32Value];
    *(_DWORD *)buf = 136446722;
    uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
    __int16 v101 = 1024;
    int v102 = 4923;
    __int16 v103 = 2048;
    unint64_t v104 = v39;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WFAAWDSWFN_recoveryReason: %lx", buf, 0x1Cu);
  }
  unint64_t v40 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    id v41 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"SWFR_slowNotice"];
    __int16 v42 = [v41 subMessageValue];
    int v43 = [v42 fieldForKey:@"WFAAWDSWFN_userInput"];
    unsigned int v44 = [v43 uint32Value];
    *(_DWORD *)buf = 136446722;
    uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
    __int16 v101 = 1024;
    int v102 = 4924;
    __int16 v103 = 2048;
    unint64_t v104 = v44;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WFAAWDSWFN_userInput: %lx", buf, 0x1Cu);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMetricID:589931];
  uint64_t v45 = [*(id *)(a1 + 32) submitterMap];
  __int16 v46 = [v45 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v47 = +[NSNumber numberWithInteger:*(void *)(a1 + 80)];
  id v48 = [v46 objectForKeyedSubscript:v47];

  if (!v48)
  {
    unsigned int v49 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
      __int16 v101 = 1024;
      int v102 = 4929;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%{public}s::%d:Caller did not register", buf, 0x12u);
    }

    if (*(void *)(a1 + 40))
    {
      uint64_t v50 = [*(id *)(a1 + 32) processTokenToGroupTypeMap];
      uint64_t v51 = [v50 objectForKeyedSubscript:*(void *)(a1 + 40)];
      id v52 = +[NSNumber numberWithInteger:*(void *)(a1 + 80)];
      unsigned int v53 = [v51 containsObject:v52];

      if (v53)
      {
        uint64_t v61 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          unint64_t v89 = *(void *)(a1 + 80);
          *(_DWORD *)buf = 136446722;
          uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
          __int16 v101 = 1024;
          int v102 = 4931;
          __int16 v103 = 2048;
          unint64_t v104 = v89;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%{public}s::%d:XPC: processTokenToGroupTypeMap seems to think this process token has already registered group type: %ld", buf, 0x1Cu);
        }
      }
      else
      {
        [*(id *)(a1 + 32) _purgeGroupTypeIfNecessary:*(void *)(a1 + 80)];
        id v54 = [*(id *)(a1 + 32) processTokenToGroupTypeMap];
        uint64_t v55 = [v54 objectForKeyedSubscript:*(void *)(a1 + 40)];

        if (!v55)
        {
          id v56 = objc_alloc_init((Class)NSMutableSet);
          uint64_t v57 = [*(id *)(a1 + 32) processTokenToGroupTypeMap];
          [v57 setObject:v56 forKeyedSubscript:*(void *)(a1 + 40)];
        }
        id v58 = [*(id *)(a1 + 32) processTokenToGroupTypeMap:v90];
        id v59 = [v58 objectForKeyedSubscript:*(void *)(a1 + 40)];
        uint64_t v60 = +[NSNumber numberWithInteger:*(void *)(a1 + 80)];
        [v59 addObject:v60];

        [*(id *)(a1 + 32) _initSubmitterAndQueryableRegistrationForProcessToken:*(void *)(a1 + 40) andGroupType:*(void *)(a1 + 80)];
        [*(id *)(a1 + 32) _persist];
        uint64_t v61 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v62 = *(void *)(a1 + 80);
          id v63 = +[WAUtil trimTokenForLogging:*(void *)(a1 + 40)];
          *(_DWORD *)buf = 136446978;
          uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
          __int16 v101 = 1024;
          int v102 = 4942;
          __int16 v103 = 2048;
          unint64_t v104 = v62;
          __int16 v105 = 2112;
          id v106 = v63;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "%{public}s::%d:XPC: registering message group type: %ld for process: %@", buf, 0x26u);
        }
      }
    }
    else
    {
      __int16 v85 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
        __int16 v101 = 1024;
        int v102 = 4930;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:couldn't get process name for connection", buf, 0x12u);
      }

      NSErrorUserInfoKey v107 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v108 = @"WAErrorCodeInternalError";
      uint64_t v61 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v107 count:1];
      uint64_t v86 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9003 userInfo:v61];
      uint64_t v87 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v88 = *(void **)(v87 + 40);
      *(void *)(v87 + 40) = v86;
    }
  }
  uint64_t v64 = [*(id *)(a1 + 32) _submitMessage:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) groupType:4 forProcessToken:*(void *)(a1 + 40) v90];
  uint64_t v65 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v66 = *(void **)(v65 + 40);
  *(void *)(v65 + 40) = v64;

  int v67 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v67)
  {
    uint64_t v68 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v70 = *(void *)(v68 + 40);
    id v69 = (id *)(v68 + 40);
    if (!v70)
    {
      objc_storeStrong(v69, v67);
      uint64_t v71 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v72 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 136446722;
        uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
        __int16 v101 = 1024;
        int v102 = 4955;
        __int16 v103 = 2112;
        unint64_t v104 = v72;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:retErr will return %@", buf, 0x1Cu);
      }
    }
    uint64_t v73 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      unint64_t v74 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 136446722;
      uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
      __int16 v101 = 1024;
      int v102 = 4958;
      __int16 v103 = 2112;
      unint64_t v104 = v74;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "%{public}s::%d:Not sending incomplete SWF to AWD %@", buf, 0x1Cu);
    }

    os_log_type_t v75 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
    {
      int v84 = *(const char **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v100 = v84;
      _os_log_fault_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_FAULT, "Not sending incomplete SWF to AWD %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v76 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
      __int16 v101 = 1024;
      int v102 = 4949;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Sending SWF to transformEngine", buf, 0x12u);
    }

    [*(id *)(*(void *)(a1 + 32) + 160) transformAndSubmitSWMessageToCA:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) additionalInfo:0 timestamps:0];
  }
  double v77 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fieldForKey:@"SWFR_linkQualSamples"];
  id v78 = [v77 repeatableValues];
  [v78 removeAllObjects];

  [*(id *)(*(void *)(a1 + 32) + 568) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 496) removeAllObjects];
  NSErrorUserInfoKey v79 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v100 = "-[WAEngine gatherConsecutiveLinkQualitySamples:forProcessToken:andReply:]_block_invoke";
    __int16 v101 = 1024;
    int v102 = 4968;
    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_slowWiFiStudyInProgress False", buf, 0x12u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 34) = 0;
  CFStringRef v80 = [*(id *)(a1 + 32) slowwifiStudyTransaction];

  if (v80)
  {
    CFStringRef v81 = +[WAActivityManager sharedActivityManager];
    uint64_t v82 = [*(id *)(a1 + 32) slowwifiStudyTransaction];
    [v81 osTransactionComplete:v82];

    [*(id *)(a1 + 32) setSlowwifiStudyTransaction:0];
  }
  if ([*(id *)(a1 + 32) isMemoryPressureRequestDeferred]) {
    [*(id *)(a1 + 32) handleMemoryWarning:1];
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10006BD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10006BDBC(uint64_t a1)
{
  [*(id *)(a1 + 32) triggerPeerDiagnosticsStudy:2 symptomsDnsStats:0];
}

void sub_10006BE08(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006BEC4;
  v7[3] = &unk_1000D1810;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v8 = v6;
  [v3 gatherConsecutiveLinkQualitySamples:0 forProcessToken:v4 andReply:v7];
}

void sub_10006BEC4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    long long v6 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      long long v8 = "-[WAEngine _triggerSlowWiFiStudy:forProcessToken:waMessage:andReply:]_block_invoke_2";
      __int16 v9 = 1024;
      int v10 = 5050;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:gatherConsecutiveLinkQualitySamples replied err %@", (uint8_t *)&v7, 0x1Cu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10006C2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10006C2D8(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v6 = obj;
  id v7 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10006C364(uint64_t a1, void *a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v6 = obj;
  id v7 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10006C608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10006C620(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10006C8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10006C8B8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_10006C98C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _persist];
}

id sub_10006D634(uint64_t a1)
{
  return +[WAUtil incrementValueForKey:@"AnalyticsProcessor: Save WA Message Metric" inMutableDict:*(void *)(*(void *)(a1 + 32) + 688) onQueue:*(void *)(*(void *)(a1 + 32) + 88)];
}

id sub_10006D728(uint64_t a1)
{
  return [*(id *)(a1 + 32) processMetricDictOnEngine:*(void *)(a1 + 40) data:*(void *)(a1 + 48)];
}

void sub_10006DA78(uint64_t a1)
{
  id v3 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[WAEngine _summarizeDeviceAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 5298;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Forcing flush of JSON files in Tmp Dir....", (uint8_t *)&v5, 0x12u);
  }

  [*(id *)(a1 + 32) processWiFiAnalyticsMessageJSONFilesInTmpDir:1];
  id v4 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[WAEngine _summarizeDeviceAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 5300;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Forcing flush of JSON files in Tmp Dir complete", (uint8_t *)&v5, 0x12u);
  }
}

id sub_10006F384(uint64_t a1)
{
  return +[WAUtil incrementValueForKey:@"AnalyticsProcessor: Age Out Analytics" inMutableDict:*(void *)(*(void *)(a1 + 32) + 688) onQueue:*(void *)(*(void *)(a1 + 32) + 88)];
}

id sub_10006F3A8(uint64_t a1)
{
  return +[WAUtil incrementValueForKey:@"AnalyticsProcessor: Process WA Message Metric" inMutableDict:*(void *)(*(void *)(a1 + 32) + 688) onQueue:*(void *)(*(void *)(a1 + 32) + 88)];
}

id sub_10006F3CC(uint64_t a1)
{
  return +[WAUtil incrementValueForKey:@"AnalyticsProcessor: Prune" inMutableDict:*(void *)(*(void *)(a1 + 32) + 688) onQueue:*(void *)(*(void *)(a1 + 32) + 88)];
}

void sub_10006F6B4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) datapathMetricStream];
  id v3 = [v2 getPBCodableNSDataFromNSKeyedArchive:*(void *)(a1 + 40)];

  if (v3)
  {
    +[WAUtil incrementValueForKey:@"AnalyticsProcessor: Datapath Metrics Stream" inMutableDict:*(void *)(*(void *)(a1 + 32) + 688) onQueue:*(void *)(*(void *)(a1 + 32) + 88)];
    id v4 = [*(id *)(a1 + 32) analyticsProcessor];
    [v4 processDatapathMetricStream:v3 withDate:*(void *)(a1 + 48)];
  }
  else
  {
    int v5 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446466;
      __int16 v7 = "-[WAEngine processWiFiAnalyticsMessageWAMFile:file:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 5546;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to getPBCodableNSDataFromNSKeyedArchive", (uint8_t *)&v6, 0x12u);
    }
  }
}

void sub_10006FD08(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) __dnsSetupConfig];
  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_1000706F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_10007072C(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v3 = [*(id *)(a1 + 32) __dnsStateConfig];
    uint64_t v4 = [v3 objectForKeyedSubscript:kSCPropNetDNSServerAddresses];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    int v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      __int16 v7 = [*(id *)(a1 + 32) __ipv4SetupConfig];
      uint64_t v8 = [v7 objectForKeyedSubscript:kSCPropNetDNSServerAddresses];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      int v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
}

void sub_100071118(id a1, NSError *a2, NSArray *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  int v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446978;
    uint64_t v8 = "-[WAEngine triggerPeerDiscovery]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 5986;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiscovery: Initiate Study.. result:%@ error:%@", (uint8_t *)&v7, 0x26u);
  }
}

void sub_100071920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100071964(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  uint64_t v8 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v11 = 136446978;
    uint64_t v12 = "-[WAEngine gatherDiscoveredPeerInfo:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = 6016;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:PeerDiscovery: result:%@ error:%@", (uint8_t *)&v11, 0x26u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100071CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100071D10(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained[61];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100071DD0;
  v9[3] = &unk_1000D1188;
  id v10 = v4;
  id v11 = WeakRetained;
  id v7 = WeakRetained;
  id v8 = v4;
  dispatch_sync(v6, v9);
}

void sub_100071DD0(uint64_t a1)
{
  id v3 = v2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v18 = v2;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (int i = 0; i != v7; int i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v19 + 1) + 8 * i) info];
          uint64_t v11 = [v10 objectForKeyedSubscript:@"DNSResolution"];
          uint64_t v12 = *(void *)(a1 + 40);
          __int16 v13 = *(void **)(v12 + 472);
          *(void *)(v12 + 472) = v11;

          int v14 = WALogCategoryDefaultHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 472);
            *(_DWORD *)buf = 136446722;
            id v24 = "-[WAEngine resolveAppleCaptiveServer]_block_invoke_2";
            __int16 v25 = 1024;
            int v26 = 6072;
            __int16 v27 = 2112;
            uint64_t v28 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNSResolution: result : %@", buf, 0x1Cu);
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v29 count:16];
      }
      while (v7);
    }

    id v3 = v18;
  }
  uint64_t v16 = *(void *)(a1 + 40);
  if (*(void *)(v16 + 440) || *(void *)(v16 + 448) || *(void *)(v16 + 464) || *(void *)(v16 + 456))
  {
    uint64_t v17 = *(void *)(v16 + 472);
    [*(id *)(v16 + 456) setObject:v17 forKeyedSubscript:@"IPAddress"];
    [*(id *)(*(void *)(a1 + 40) + 464) setObject:v17 forKeyedSubscript:@"IPAddress"];
    [*(id *)(*(void *)(a1 + 40) + 448) setObject:v17 forKeyedSubscript:@"IPAddress"];
    [*(id *)(*(void *)(a1 + 40) + 440) setObject:v17 forKeyedSubscript:@"IPAddress"];
  }
  else
  {
    [(id)v16 initializeProbeCxt];
  }
}

void sub_100072A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id location)
{
  objc_destroyWeak(v42);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v43 - 176), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100072ADC(void *a1)
{
  uint64_t v3 = +[NSDictionary dictionaryWithDictionary:*(void *)(a1[4] + 440)];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = +[NSDictionary dictionaryWithDictionary:*(void *)(a1[4] + 448)];
  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = +[NSDictionary dictionaryWithDictionary:*(void *)(a1[4] + 456)];
  uint64_t v10 = *(void *)(a1[7] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = +[NSDictionary dictionaryWithDictionary:*(void *)(a1[4] + 464)];
  uint64_t v13 = *(void *)(a1[8] + 8);
  int v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

void sub_100072BC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained[61];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100072CB0;
  v12[3] = &unk_1000D1940;
  int v16 = *(_DWORD *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  id v15 = WeakRetained;
  uint64_t v9 = WeakRetained;
  id v10 = v6;
  id v11 = v5;
  dispatch_sync(v8, v12);
}

void sub_100072CB0(uint64_t a1)
{
  uint64_t v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(_DWORD *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136447234;
    id v58 = "-[WAEngine triggerDiagnosticPingWithrequestId:]_block_invoke_2";
    __int16 v59 = 1024;
    int v60 = 6174;
    __int16 v61 = 1024;
    int v62 = v4;
    __int16 v63 = 2112;
    *(void *)uint64_t v64 = v5;
    *(_WORD *)&v64[8] = 2112;
    uint64_t v65 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Ping: instanceId:%u error:%@ ProbeResults:: %@", buf, 0x2Cu);
  }

  if (!*(void *)(a1 + 32))
  {
    uint64_t v7 = *(void **)(a1 + 40);
    if (!v7) {
      goto LABEL_38;
    }
    id v41 = v2;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v8 = v7;
    id v45 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (!v45) {
      goto LABEL_37;
    }
    uint64_t v44 = *(void *)v52;
    id v42 = v8;
LABEL_8:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v52 != v44) {
        objc_enumerationMutation(v8);
      }
      id v10 = *(void **)(*((void *)&v51 + 1) + 8 * v9);
      if ([v10 testID] == (id)3) {
        break;
      }
      if ([v10 testID] == (id)6)
      {
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v22 = [v10 info];
        int v23 = [v22 objectForKeyedSubscript:@"PingResults"];

        id obj = v23;
        id v24 = [v23 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v43 = v9;
          uint64_t v26 = *(void *)v48;
          do
          {
            for (int i = 0; i != v25; int i = (char *)i + 1)
            {
              if (*(void *)v48 != v26) {
                objc_enumerationMutation(obj);
              }
              uint64_t v28 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              unsigned int v29 = [v28 count];
              double v30 = (double)(uint64_t)[v28 count];
              [v28 packetLoss];
              uint64_t v32 = (v30 + v31 / -100.0 * (double)(uint64_t)[v28 count]);
              unint64_t v33 = *(unsigned int *)(a1 + 56);
              unsigned int v34 = [*(id *)(*(void *)(a1 + 48) + 176) preferences];
              id v35 = [v34 dns_symptoms_trap_evaluated_at_sample];

              uint64_t v36 = *(void *)(a1 + 48);
              if ((unint64_t)v35 <= v33)
              {
                *(void *)(v36 + 304) += v32;
              }
              else
              {
                *(void *)(v36 + 272) += v32;
                if (v32) {
                  *(unsigned char *)(*(void *)(a1 + 48) + 46) = 1;
                }
              }
              id v37 = WALogCategoryDefaultHandle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                int v38 = *(_DWORD *)(a1 + 56);
                *(_DWORD *)buf = 136447234;
                id v58 = "-[WAEngine triggerDiagnosticPingWithrequestId:]_block_invoke";
                __int16 v59 = 1024;
                int v60 = 6204;
                __int16 v61 = 1024;
                int v62 = v38;
                __int16 v63 = 1024;
                *(_DWORD *)uint64_t v64 = v29;
                *(_WORD *)&v64[4] = 1024;
                *(_DWORD *)&v64[6] = v32;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:WANPingResults: instanceId:%u pingCount:%u successCount:%u", buf, 0x24u);
              }
            }
            id v25 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
          }
          while (v25);
          id v8 = v42;
          uint64_t v9 = v43;
        }
        goto LABEL_34;
      }
LABEL_35:
      if ((id)++v9 == v45)
      {
        id v45 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (!v45)
        {
LABEL_37:

          id v2 = v41;
          goto LABEL_38;
        }
        goto LABEL_8;
      }
    }
    uint64_t v11 = v9;
    uint64_t v12 = [v10 info];
    id v13 = [v12 objectForKeyedSubscript:@"PingResult"];

    unsigned int v14 = [v13 count];
    double v15 = (double)(uint64_t)[v13 count];
    [v13 packetLoss];
    id obj = v13;
    uint64_t v17 = (v15 + v16 / -100.0 * (double)(uint64_t)[v13 count]);
    unint64_t v18 = *(unsigned int *)(a1 + 56);
    long long v19 = [*(id *)(*(void *)(a1 + 48) + 176) preferences];
    id v20 = [v19 dns_symptoms_trap_evaluated_at_sample];

    uint64_t v21 = *(void *)(a1 + 48);
    if ((unint64_t)v20 <= v18)
    {
      *(void *)(v21 + 288) += v17;
    }
    else
    {
      *(void *)(v21 + 256) += v17;
      if (v17) {
        *(unsigned char *)(*(void *)(a1 + 48) + 46) = 1;
      }
    }
    unsigned int v39 = WALogCategoryDefaultHandle();
    uint64_t v9 = v11;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)buf = 136447234;
      id v58 = "-[WAEngine triggerDiagnosticPingWithrequestId:]_block_invoke";
      __int16 v59 = 1024;
      int v60 = 6191;
      __int16 v61 = 1024;
      int v62 = v40;
      __int16 v63 = 1024;
      *(_DWORD *)uint64_t v64 = v14;
      *(_WORD *)&v64[4] = 1024;
      *(_DWORD *)&v64[6] = v17;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:LANPingResults: instanceId:%u pingCount:%u successCount:%u", buf, 0x24u);
    }

LABEL_34:
    goto LABEL_35;
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 40) = 1;
LABEL_38:
}

void sub_10007341C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100073440(uint64_t a1, int a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained[61];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000734F4;
  block[3] = &unk_1000D1990;
  id v11 = WeakRetained;
  uint64_t v12 = a3;
  int v8 = *(_DWORD *)(a1 + 40);
  int v13 = a2;
  int v14 = v8;
  uint64_t v9 = WeakRetained;
  dispatch_sync(v7, block);
}

void sub_1000734F4(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 48))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      uint64_t v5 = *(id *)(v6 + 48);
      if (v5)
      {
        unsigned int v7 = [*(id *)(a1 + 32) isScoreBelowThreshold:v5 type:0 instanceId:*(unsigned int *)(a1 + 52)];
        unsigned int v8 = [*(id *)(a1 + 32) isScoreBelowThreshold:v5 type:1 instanceId:*(unsigned int *)(a1 + 52)];
        unint64_t v9 = *(unsigned int *)(a1 + 52);
        id v10 = [*(id *)(*(void *)(a1 + 32) + 176) preferences];
        id v11 = [v10 dns_symptoms_trap_evaluated_at_sample];

        uint64_t v12 = *(void *)(a1 + 32);
        if ((unint64_t)v11 <= v9)
        {
          if (v7)
          {
            if (!*(unsigned char *)(v12 + 45))
            {
              uint64_t v18 = *(unsigned int *)(a1 + 52);
              long long v19 = [*(id *)(v12 + 176) preferences];
              *(void *)(*(void *)(a1 + 32) + 320) = v18
                                                        - (void)[v19 dns_symptoms_trap_evaluated_at_sample]+ 1;
            }
          }
          else
          {
            if (!*(unsigned char *)(v12 + 45))
            {
              uint64_t v21 = *(unsigned int *)(a1 + 52);
              long long v22 = [*(id *)(v12 + 176) preferences];
              *(void *)(*(void *)(a1 + 32) + 320) = v21
                                                        - (void)[v22 dns_symptoms_trap_evaluated_at_sample];

              uint64_t v12 = *(void *)(a1 + 32);
            }
            *(unsigned char *)(v12 + 45) = 1;
          }
          uint64_t v20 = 336;
        }
        else
        {
          if (v7)
          {
            if (*(unsigned char *)(v12 + 44)) {
              ++*(void *)(v12 + 312);
            }
          }
          else
          {
            *(unsigned char *)(v12 + 44) = 0;
          }
          uint64_t v20 = 328;
        }
        *(void *)(*(void *)(a1 + 32) + v20) += v8;
        int v13 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_38;
        }
        int v23 = *(_DWORD *)(a1 + 52);
        id v24 = "NO";
        uint64_t v25 = *(void *)(a1 + 32);
        uint64_t v32 = "-[WAEngine fetchSymptomsScores:]_block_invoke_2";
        if (v7) {
          uint64_t v26 = "YES";
        }
        else {
          uint64_t v26 = "NO";
        }
        int v27 = *(unsigned __int8 *)(v25 + 44);
        if (v8) {
          uint64_t v28 = "YES";
        }
        else {
          uint64_t v28 = "NO";
        }
        int v29 = *(unsigned __int8 *)(v25 + 45);
        if (v27) {
          double v30 = "YES";
        }
        else {
          double v30 = "NO";
        }
        int v31 = 136447746;
        __int16 v33 = 1024;
        if (v29) {
          id v24 = "YES";
        }
        int v34 = 6259;
        __int16 v35 = 1024;
        int v36 = v23;
        __int16 v37 = 2080;
        int v38 = v26;
        __int16 v39 = 2080;
        int v40 = v28;
        char v41 = 32;
        char v42 = 8;
        uint64_t v43 = v30;
        __int16 v44 = 2080;
        id v45 = v24;
        int v14 = "%{public}s::%d:Netscore: instanceId:%u isNetScoreBelowThreshold:%s isDataStallScoreBelowThreshold:%s _isPo"
              "orSymptomsDnsConditions:%s _didSymptomsConditionRecoverAfterDecision:%s";
        double v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        uint32_t v17 = 64;
      }
      else
      {
        int v13 = WALogCategoryDefaultHandle();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_38:

LABEL_39:
          goto LABEL_40;
        }
        int v31 = 136446466;
        uint64_t v32 = "-[WAEngine fetchSymptomsScores:]_block_invoke";
        __int16 v33 = 1024;
        int v34 = 6261;
        int v14 = "%{public}s::%d:empty eventInfo";
        double v15 = v13;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        uint32_t v17 = 18;
      }
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v31, v17);
      goto LABEL_38;
    }
  }
  uint64_t v3 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = *(_DWORD *)(a1 + 48);
    int v31 = 136446722;
    uint64_t v32 = "-[WAEngine fetchSymptomsScores:]_block_invoke";
    __int16 v33 = 1024;
    int v34 = 6264;
    __int16 v35 = 1024;
    int v36 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error:%d from Managed Event Fetch", (uint8_t *)&v31, 0x18u);
  }

  if (!*(void *)(a1 + 40))
  {
    uint64_t v5 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v31 = 136446466;
      uint64_t v32 = "-[WAEngine fetchSymptomsScores:]_block_invoke";
      __int16 v33 = 1024;
      int v34 = 6266;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:Fetched managed event is null", (uint8_t *)&v31, 0x12u);
    }
    goto LABEL_39;
  }
LABEL_40:
}

void sub_100074CD4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("W5Client");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000F1090 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    sub_100074D44();
  }
}

void sub_100074D44()
{
  v1[0] = 0;
  if (!qword_1000F1098)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100074E50;
    v1[4] = &unk_1000D0CF8;
    v1[5] = v1;
    long long v2 = off_1000D19D8;
    uint64_t v3 = 0;
    qword_1000F1098 = _sl_dlopen();
    uint64_t v0 = (void *)v1[0];
    if (qword_1000F1098)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      uint64_t v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t sub_100074E50()
{
  uint64_t result = _sl_dlopen();
  qword_1000F1098 = result;
  return result;
}

CADataTransformEngine *sub_100074EC4(uint64_t a1)
{
  sub_100074D44();
  uint64_t result = (CADataTransformEngine *)objc_getClass("W5DiagnosticsTestRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000F10A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (CADataTransformEngine *)abort_report_np();
    return [(CADataTransformEngine *)v3 init];
  }
  return result;
}

id sub_100075C20(uint64_t a1)
{
  uint64_t v229 = 0;
  v230 = &v229;
  uint64_t v231 = 0x2020000000;
  char v232 = 1;
  dispatch_semaphore_t v207 = dispatch_semaphore_create(0);
  uint64_t v223 = 0;
  v224 = &v223;
  uint64_t v225 = 0x3032000000;
  id v226 = sub_100077774;
  id v227 = sub_100077784;
  id v228 = +[NSMutableDictionary dictionaryWithDictionary:*(void *)(a1 + 32)];
  uint64_t v208 = a1;
  long long v2 = [*(id *)(a1 + 40) instantiateAWDProtobufAndPopulateValues:*(void *)(a1 + 48)];
  v209 = v2;
  if (!v2)
  {
    uint64_t v32 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v234 = "-[CADataTransformEngine transformAndSubmitDPSMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v235 = 1024;
      int v236 = 284;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating DPS data to send to CA", buf, 0x12u);
    }

    __int16 v33 = 0;
    id v34 = 0;
    __int16 v35 = 0;
    v205 = 0;
    v206 = 0;
    goto LABEL_34;
  }
  id v3 = v2;
  SEL v4 = [v3 stallNotifications];
  if (![v4 count])
  {

    goto LABEL_21;
  }
  unint64_t v5 = (unint64_t)[v3 dpsCounterSamplesCount];
  LOBYTE(v5) = v5 < (unint64_t)[*(id *)(*(void *)(v208 + 40) + 16) dps_interrogation_sample_count];

  if (v5)
  {
LABEL_21:
    int v36 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v234 = "-[CADataTransformEngine transformAndSubmitDPSMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v235 = 1024;
      int v236 = 290;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}s::%d:Invalid DPS data", buf, 0x12u);
    }

    *((unsigned char *)v230 + 24) = 0;
    goto LABEL_24;
  }
  if (*((unsigned char *)v230 + 24))
  {
    uint64_t v6 = *(void **)(v208 + 40);
    uint64_t v7 = *(void *)(v208 + 56);
    v219[0] = _NSConcreteStackBlock;
    v219[1] = 3221225472;
    v219[2] = sub_10007778C;
    v219[3] = &unk_1000D19F8;
    v221 = &v223;
    v222 = &v229;
    dispatch_semaphore_t dsema = v207;
    dispatch_semaphore_t v220 = dsema;
    [v6 computeDPSRecoveryIndex:v3 timestamps:v7 andReply:v219];

    if (*((unsigned char *)v230 + 24))
    {
      long long v217 = 0u;
      long long v218 = 0u;
      long long v215 = 0u;
      long long v216 = 0u;
      unsigned int v8 = [v3 stallNotifications];
      char v9 = 0;
      int v10 = 0;
      uint64_t v11 = 0;
      id v12 = [v8 countByEnumeratingWithState:&v215 objects:v240 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v216;
        do
        {
          for (int i = 0; i != v12; int i = (char *)i + 1)
          {
            if (*(void *)v216 != v13) {
              objc_enumerationMutation(v8);
            }
            double v15 = *(void **)(*((void *)&v215 + 1) + 8 * i);
            if (![v15 symptom])
            {
              uint64_t v11 = [v15 problemAC] | v11;
              v10 |= [v15 facetimeCallInProgress];
            }
            v9 |= [v15 symptom] == 2;
          }
          id v12 = [v8 countByEnumeratingWithState:&v215 objects:v240 count:16];
        }
        while (v12);
      }

      os_log_type_t v16 = +[NSNumber numberWithUnsignedInt:v11];
      [(id)v224[5] setObject:v16 forKeyedSubscript:@"problematicACs"];

      uint32_t v17 = +[NSNumber numberWithBool:v10 & 1];
      [(id)v224[5] setObject:v17 forKeyedSubscript:@"isCriticalAppRunning"];

      uint64_t v18 = +[NSNumber numberWithBool:v9 & 1];
      [(id)v224[5] setObject:v18 forKeyedSubscript:@"didUserToggleWiFiOff"];

      long long v19 = [v3 dpsEpiloge];
      uint64_t v20 = [v19 qDpsStats];
      uint64_t v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v20 isDpsValidationDisabled]);
      [(id)v224[5] setObject:v21 forKeyedSubscript:@"isDpsValidationDisabled"];

      long long v22 = [v3 dpsEpiloge];
      int v23 = [v22 qDpsStats];
      id v24 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v23 quickDpsTimeSincePreviousTriggerMinutes]);
      [(id)v224[5] setObject:v24 forKeyedSubscript:@"timeSincePreviousStudy"];

      uint64_t v25 = [v3 dpsEpiloge];
      uint64_t v26 = [v25 qDpsStats];
      int v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v26 quickDpsResetRecommendation]);
      [(id)v224[5] setObject:v27 forKeyedSubscript:@"qDpsStudyRecommendation"];

      uint64_t v28 = [v3 dpsEpiloge];
      int v29 = [v28 qDpsStats];
      id v30 = [v29 suppressedReason];
      if (v30 >= 0xB)
      {
        int v31 = +[NSString stringWithFormat:@"(unknown: %i)", v30];
      }
      else
      {
        int v31 = *(&off_1000D1A90 + (int)v30);
      }
      [(id)v224[5] setObject:v31 forKeyedSubscript:@"qDpsSuppressionReason"];

      __int16 v44 = [v3 dpsEpiloge];
      id v45 = [v44 qDpsStats];
      __int16 v46 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v45 screenStateOn]);
      [(id)v224[5] setObject:v46 forKeyedSubscript:@"qDpsScreenStateOnAtDecision"];

      long long v47 = [v3 dpsEpiloge];
      long long v48 = [v47 qDpsStats];
      long long v49 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v48 screenStateOn]);
      [(id)v224[5] setObject:v49 forKeyedSubscript:@"MLDecisionPath"];

      long long v50 = [v3 dpsEpiloge];
      long long v51 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v50 isAssociatedAtStudyEnd]);
      [(id)v224[5] setObject:v51 forKeyedSubscript:@"isAssociatedAtStudyEnd"];

      long long v52 = [v3 dpsCounterSampleAtIndex:1];
      long long v53 = [v52 controllerStats];
      v206 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v53 channel]);

      long long v54 = [v3 dpsCounterSampleAtIndex:1];
      uint64_t v55 = [v54 controllerStats];
      v205 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v55 channelBandwidth]);

      [(id)v224[5] setObject:v206 forKeyedSubscript:@"channel"];
      [(id)v224[5] setObject:v205 forKeyedSubscript:@"channelBandwidth"];
      if ([v3 usbEventsCount])
      {
        id v56 = [v3 usbEventAtIndex:((char *)[v3 usbEventsCount]) - 1];
        uint64_t v57 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v56 usbAction]);
        [(id)v224[5] setObject:v57 forKeyedSubscript:@"usbAction"];

        id v58 = [v3 usbEventAtIndex:((char *)[v3 usbEventsCount]) - 1];
        __int16 v59 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v58 usbTotal]);
        [(id)v224[5] setObject:v59 forKeyedSubscript:@"usbTotal"];

        int v60 = [v3 usbEventAtIndex:((char *)[v3 usbEventsCount]) - 1];
        __int16 v61 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v60 durationSinceUSBEventInSeconds]);
        [(id)v224[5] setObject:v61 forKeyedSubscript:@"timeSinceUSBEvent"];

        int v62 = [v3 usbEventAtIndex:[v3 usbEventsCount] - 1];
        __int16 v63 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v62 smartCCADesenseSupported]);
        [(id)v224[5] setObject:v63 forKeyedSubscript:@"isSmartCCADesenseSupported"];

        uint64_t v64 = [v3 usbEventAtIndex:((char *)[v3 usbEventsCount]) - 1];
        uint64_t v65 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v64 isVendorApple]);
        [(id)v224[5] setObject:v65 forKeyedSubscript:@"isUSBDeviceVendorApple"];
      }
      uint64_t v66 = [v3 dpsEpiloge];
      id v67 = [v66 accessPointInfosCount];

      if (v67)
      {
        uint64_t v68 = [v3 dpsEpiloge];
        id v69 = [v68 accessPointInfoAtIndex:0];
        uint64_t v70 = [v69 modelName];
        [(id)v224[5] setObject:v70 forKeyedSubscript:@"APModelName"];

        uint64_t v71 = [v3 dpsEpiloge];
        unint64_t v72 = [v71 accessPointInfoAtIndex:0];
        uint64_t v73 = [v72 modelNumber];
        [(id)v224[5] setObject:v73 forKeyedSubscript:@"APModelNumber"];

        unint64_t v74 = [v3 dpsEpiloge];
        os_log_type_t v75 = [v74 accessPointInfoAtIndex:0];
        uint64_t v76 = [v75 manufacturerElement];
        [(id)v224[5] setObject:v76 forKeyedSubscript:@"APManufacturerElement"];

        double v77 = &__kCFBooleanTrue;
      }
      else
      {
        double v77 = &__kCFBooleanFalse;
      }
      [(id)v224[5] setObject:v77 forKeyedSubscript:@"IsAPInfoPresent"];
      id v78 = [v3 snapshot];
      NSErrorUserInfoKey v79 = [v78 btSnapshot];
      CFStringRef v80 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v79 use]);
      [(id)v224[5] setObject:v80 forKeyedSubscript:@"btUse"];

      CFStringRef v81 = [v3 snapshot];
      uint64_t v82 = [v81 awdlSnapshot];
      __int16 v83 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v82 use]);
      [(id)v224[5] setObject:v83 forKeyedSubscript:@"awdlUse"];

      int v84 = [v3 snapshot];
      __int16 v85 = [v84 awdlSnapshot];
      uint64_t v86 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v85 sdb]);
      [(id)v224[5] setObject:v86 forKeyedSubscript:@"awdlSdb"];

      uint64_t v87 = [v3 dpsCounterSampleAtIndex:1];
      uint64_t v88 = [v87 peerStats];
      unint64_t v89 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v88 ccaValue]);
      [(id)v224[5] setObject:v89 forKeyedSubscript:@"ccaValue"];

      long long v90 = [v3 dpsCounterSampleAtIndex:1];
      long long v91 = [v90 peerStats];
      long long v92 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v91 rssiValue]);
      [(id)v224[5] setObject:v92 forKeyedSubscript:@"rssiValue"];

      long long v93 = [v3 dpsCounterSampleAtIndex:1];
      long long v94 = [v93 peerStats];
      long long v95 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v94 snrValue]);
      [(id)v224[5] setObject:v95 forKeyedSubscript:@"snrValue"];

      long long v96 = [v3 dpsEpiloge];
      long long v97 = [v96 qDpsStats];
      long long v98 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v97 quickDpsTimeSincePreviousTriggerMinutes]);
      [(id)v224[5] setObject:v98 forKeyedSubscript:@"timeSincePreviousStudy"];

      uint64_t v99 = [v3 dpsCounterSampleAtIndex:1];
      uint64_t v100 = [v99 peerStats];
      __int16 v101 = [v100 completions];
      LODWORD(v98) = [v101 nobuf];
      int v102 = [v3 dpsCounterSampleAtIndex:0];
      __int16 v103 = [v102 peerStats];
      unint64_t v104 = [v103 completions];
      __int16 v105 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v98 - [v104 nobuf]);
      [(id)v224[5] setObject:v105 forKeyedSubscript:@"nobufStatusCountComputedAtDecision"];

      id v106 = [v3 dpsCounterSampleAtIndex:1];
      NSErrorUserInfoKey v107 = [v106 peerStats];
      CFStringRef v108 = [v107 completions];
      LODWORD(v105) = [v108 chipmodeerror];
      v109 = [v3 dpsCounterSampleAtIndex:0];
      uint64_t v110 = [v109 peerStats];
      uint64_t v111 = [v110 completions];
      uint64_t v112 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v105 - [v111 chipmodeerror]);
      [(id)v224[5] setObject:v112 forKeyedSubscript:@"chipmodeerrorStatusCountComputedAtDecision"];

      __int16 v113 = [v3 dpsCounterSampleAtIndex:1];
      uint64_t v114 = [v113 peerStats];
      __int16 v115 = [v114 completions];
      LODWORD(v112) = [v115 expired];
      v116 = [v3 dpsCounterSampleAtIndex:0];
      __int16 v117 = [v116 peerStats];
      uint64_t v118 = [v117 completions];
      __int16 v119 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v112 - [v118 expired]);
      [(id)v224[5] setObject:v119 forKeyedSubscript:@"expiredStatusCountComputedAtDecision"];

      uint64_t v120 = [v3 dpsCounterSampleAtIndex:1];
      id v121 = [v120 peerStats];
      uint64_t v122 = [v121 completions];
      LODWORD(v119) = [v122 mbfree];
      unsigned int v123 = [v3 dpsCounterSampleAtIndex:0];
      int v124 = [v123 peerStats];
      uint64_t v125 = [v124 completions];
      id v126 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v119 - [v125 mbfree]);
      [(id)v224[5] setObject:v126 forKeyedSubscript:@"mbfreeStatusCountComputedAtDecision"];

      long long v127 = [v3 dpsCounterSampleAtIndex:1];
      char v128 = [v127 peerStats];
      BOOL v129 = [v128 completions];
      LODWORD(v126) = [v129 noremotepeer];
      long long v130 = [v3 dpsCounterSampleAtIndex:0];
      long long v131 = [v130 peerStats];
      long long v132 = [v131 completions];
      long long v133 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v126 - [v132 noremotepeer]);
      [(id)v224[5] setObject:v133 forKeyedSubscript:@"noremotepeerStatusCountComputedAtDecision"];

      long long v134 = [v3 dpsCounterSampleAtIndex:1];
      long long v135 = [v134 peerStats];
      uint64_t v136 = [v135 completions];
      LODWORD(v133) = [v136 noack];
      uint64_t v137 = [v3 dpsCounterSampleAtIndex:0];
      long long v138 = [v137 peerStats];
      long long v139 = [v138 completions];
      uint64_t v140 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v133 - [v139 noack]);
      [(id)v224[5] setObject:v140 forKeyedSubscript:@"noackStatusCountComputedAtDecision"];

      long long v141 = [v3 dpsCounterSampleAtIndex:1];
      long long v142 = [v141 peerStats];
      long long v143 = [v142 completions];
      LODWORD(v140) = [v143 txfailure];
      long long v144 = [v3 dpsCounterSampleAtIndex:0];
      long long v145 = [v144 peerStats];
      long long v146 = [v145 completions];
      long long v147 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v140 - [v146 txfailure]);
      [(id)v224[5] setObject:v147 forKeyedSubscript:@"txfailureStatusCountComputedAtDecision"];

      long long v148 = [v3 dpsCounterSampleAtIndex:1];
      long long v149 = [v148 peerStats];
      long long v150 = [v149 completions];
      LODWORD(v147) = [v150 noresources];
      long long v151 = [v3 dpsCounterSampleAtIndex:0];
      long long v152 = [v151 peerStats];
      long long v153 = [v152 completions];
      long long v154 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v147 - [v153 noresources]);
      [(id)v224[5] setObject:v154 forKeyedSubscript:@"noresourcesStatusCountComputedAtDecision"];

      long long v155 = [v3 dpsCounterSampleAtIndex:1];
      long long v156 = [v155 peerStats];
      long long v157 = [v156 completions];
      LODWORD(v154) = [v157 ioerror];
      int v158 = [v3 dpsCounterSampleAtIndex:0];
      long long v159 = [v158 peerStats];
      __int16 v160 = [v159 completions];
      int v161 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v154 - [v160 ioerror]);
      [(id)v224[5] setObject:v161 forKeyedSubscript:@"ioerrorStatusCountComputedAtDecision"];

      __int16 v162 = [v3 dpsCounterSampleAtIndex:1];
      double v163 = [v162 peerStats];
      __int16 v164 = [v163 completions];
      LODWORD(v161) = [v164 internalerror];
      double v165 = [v3 dpsCounterSampleAtIndex:0];
      __int16 v166 = [v165 peerStats];
      uint64_t v167 = [v166 completions];
      __int16 v168 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v161 - [v167 internalerror]);
      [(id)v224[5] setObject:v168 forKeyedSubscript:@"internalerrorStatusCountComputedAtDecision"];

      uint64_t v169 = *(void **)(v208 + 40);
      NSErrorUserInfoKey v170 = [v3 snapshot];
      CFStringRef v171 = [v170 btSnapshot];
      unint64_t v172 = (unint64_t)[v171 ts];
      __int16 v173 = [*(id *)(v208 + 56) objectForKeyedSubscript:@"snapshotInstance"];
      id v174 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v169 computeSnapshotValidity:v172 / 0x3E8 snapshotTimestamp:v173 validityThreshold:7]);
      [(id)v224[5] setObject:v174 forKeyedSubscript:@"isBtSnapshotValid"];

      id v175 = *(void **)(v208 + 40);
      id v176 = [v3 snapshot];
      v177 = [v176 awdlSnapshot];
      unint64_t v178 = (unint64_t)[v177 ts];
      v179 = [*(id *)(v208 + 56) objectForKeyedSubscript:@"snapshotInstance"];
      v180 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v175 computeSnapshotValidity:v178 / 0x3E8 snapshotTimestamp:v179 validityThreshold:7]);
      [(id)v224[5] setObject:v180 forKeyedSubscript:@"isAwdlSnapshotValid"];

      uint64_t v181 = *(void **)(v208 + 40);
      char v182 = [*(id *)(v208 + 56) objectForKeyedSubscript:@"start"];
      v183 = [*(id *)(v208 + 56) objectForKeyedSubscript:@"userToggle"];
      id v184 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v181 computeDifferenceBetweenDates:v182 end:v183]);
      [(id)v224[5] setObject:v184 forKeyedSubscript:@"userToggleAt"];

      v185 = [v3 dpsEpiloge];
      id v186 = [v185 associationChangesCount];

      unsigned __int8 v187 = (void *)v224[5];
      if (v186)
      {
        [v187 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isAssociationChangesValid"];
        long long v213 = 0u;
        long long v214 = 0u;
        long long v211 = 0u;
        long long v212 = 0u;
        v188 = [v3 dpsEpiloge];
        id v189 = [v188 associationChanges];

        id v190 = [v189 countByEnumeratingWithState:&v211 objects:v239 count:16];
        int v191 = 0;
        int v192 = 0;
        if (v190)
        {
          uint64_t v193 = *(void *)v212;
          do
          {
            for (j = 0; j != v190; j = (char *)j + 1)
            {
              if (*(void *)v212 != v193) {
                objc_enumerationMutation(v189);
              }
              v195 = *(void **)(*((void *)&v211 + 1) + 8 * (void)j);
              v191 |= [v195 changedChannel];
              v192 |= [v195 newBSSID];
            }
            id v190 = [v189 countByEnumeratingWithState:&v211 objects:v239 count:16];
          }
          while (v190);
        }

        v196 = +[NSNumber numberWithBool:v191 & 1];
        [(id)v224[5] setObject:v196 forKeyedSubscript:@"didAssociateToNewChannel"];

        id v197 = +[NSNumber numberWithBool:v192 & 1];
        [(id)v224[5] setObject:v197 forKeyedSubscript:@"didAssociateToNewBSSID"];
      }
      else
      {
        [v187 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isAssociationChangesValid"];
      }
      v198 = [v3 snapshot];

      if (v198)
      {
        __int16 v35 = [v3 snapshot];
        uint64_t v199 = 0;
        id v34 = 0;
        __int16 v33 = 0;
        do
        {
          switch(v199)
          {
            case 0:
              uint64_t v200 = [v35 txCompletionSnapshotBE];
              goto LABEL_61;
            case 1:
              uint64_t v200 = [v35 txCompletionSnapshotBK];
              goto LABEL_61;
            case 2:
              uint64_t v200 = [v35 txCompletionSnapshotVI];
              goto LABEL_61;
            case 3:
              uint64_t v200 = [v35 txCompletionSnapshotVO];
LABEL_61:
              v201 = (void *)v200;

              __int16 v33 = v201;
              break;
            default:
              break;
          }
          if (v33)
          {
            if (v34) {
              [*(id *)(v208 + 40) computeAggregateTxCompletionStatus:v34 source:v33];
            }
            else {
              id v34 = v33;
            }
          }
          ++v199;
        }
        while (v199 != 4);
        uint64_t v202 = *(void **)(v208 + 40);
        v210[0] = _NSConcreteStackBlock;
        v210[1] = 3221225472;
        v210[2] = sub_100077850;
        v210[3] = &unk_1000D1A20;
        v210[4] = &v223;
        [v202 findTxCompletionFailureWithMaxCount:v34 andReply:v210];
      }
      else
      {
        __int16 v33 = 0;
        id v34 = 0;
        __int16 v35 = 0;
      }
      dispatch_time_t v203 = dispatch_time(0, 15000000000);
      dispatch_semaphore_wait(dsema, v203);
      goto LABEL_27;
    }
  }
LABEL_24:
  __int16 v37 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    id v234 = "-[CADataTransformEngine transformAndSubmitDPSMessageToCA:additionalInfo:timestamps:]_block_invoke_2";
    __int16 v235 = 1024;
    int v236 = 303;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}s::%d:Invalid DPS data Population", buf, 0x12u);
  }

  __int16 v33 = 0;
  id v34 = 0;
  __int16 v35 = 0;
  v205 = 0;
  v206 = 0;
LABEL_27:
  int v38 = *((unsigned __int8 *)v230 + 24);
  __int16 v39 = WALogCategoryDefaultHandle();
  int v40 = v39;
  if (!v38)
  {
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v234 = "-[CADataTransformEngine transformAndSubmitDPSMessageToCA:additionalInfo:timestamps:]_block_invoke_2";
      __int16 v235 = 1024;
      int v236 = 438;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}s::%d:Submitting DPS metric (CA) aborted due to validation Error", buf, 0x12u);
    }

LABEL_34:
    id v42 = 0;
    goto LABEL_35;
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    id v41 = [(id)v224[5] count];
    *(_DWORD *)buf = 136446722;
    id v234 = "-[CADataTransformEngine transformAndSubmitDPSMessageToCA:additionalInfo:timestamps:]_block_invoke";
    __int16 v235 = 1024;
    int v236 = 441;
    __int16 v237 = 2048;
    id v238 = v41;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DPS metricDict fieldCount: %lu", buf, 0x1Cu);
  }

  id v42 = (id)v224[5];
LABEL_35:

  _Block_object_dispose(&v223, 8);
  _Block_object_dispose(&v229, 8);

  return v42;
}

void sub_100077708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

uint64_t sub_100077774(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100077784(uint64_t a1)
{
}

intptr_t sub_10007778C(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7 = +[NSNumber numberWithBool:a2];
  [*(id *)(*(void *)(a1[5] + 8) + 40) setObject:v7 forKeyedSubscript:@"recoveryObservedDuringStudy"];

  unsigned int v8 = +[NSNumber numberWithUnsignedInt:a3];
  [*(id *)(*(void *)(a1[5] + 8) + 40) setObject:v8 forKeyedSubscript:@"recoveryAt"];

  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a4;
  char v9 = a1[4];

  return dispatch_semaphore_signal(v9);
}

void sub_100077850(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v7 forKeyedSubscript:@"majorTxFailureTypeAmongAllACs"];

  unsigned int v8 = +[NSNumber numberWithUnsignedInteger:a3];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v8 forKeyedSubscript:@"majorTxFailureCountAmongAllACs"];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v9 forKeyedSubscript:@"aggregateTxFailureTypeAmongAllACs"];
}

id sub_100077B30(uint64_t a1)
{
  long long v2 = +[NSMutableDictionary dictionaryWithDictionary:*(void *)(a1 + 32)];
  id v3 = [(char *)[*(id *)(*(void *)(a1 + 40) + 16) dns_symptoms_trap_evaluated_at_sample]];
  SEL v4 = [*(id *)(a1 + 40) instantiateAWDProtobufAndPopulateValues:*(void *)(a1 + 48)];
  unint64_t v5 = v4;
  if (!v4)
  {
    v443 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v443, OS_LOG_TYPE_ERROR)) {
      goto LABEL_125;
    }
    *(_DWORD *)buf = 136446466;
    v501 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]_block_invoke";
    __int16 v502 = 1024;
    int v503 = 479;
    v450 = "%{public}s::%d:Error creating DPS data to send to CA";
LABEL_134:
    _os_log_impl((void *)&_mh_execute_header, v443, OS_LOG_TYPE_ERROR, v450, buf, 0x12u);
    goto LABEL_125;
  }
  id v6 = v4;
  uint64_t v7 = [v6 stallNotifications];
  id v8 = [v7 count];

  if (!v8)
  {
    v443 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v443, OS_LOG_TYPE_ERROR)) {
      goto LABEL_125;
    }
    *(_DWORD *)buf = 136446466;
    v501 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]_block_invoke";
    __int16 v502 = 1024;
    int v503 = 482;
    v450 = "%{public}s::%d:Invalid DNS data: no samples";
    goto LABEL_134;
  }
  id v9 = [v6 dpsCounterSamplesCount];
  if (v9 < objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "dns_symptoms_interrogation_sample_count"))
  {
    v443 = WALogCategoryDefaultHandle();
    if (!os_log_type_enabled(v443, OS_LOG_TYPE_ERROR)) {
      goto LABEL_125;
    }
    *(_DWORD *)buf = 136446466;
    v501 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]_block_invoke";
    __int16 v502 = 1024;
    int v503 = 483;
    v450 = "%{public}s::%d:Invalid DNS data: less samples";
    goto LABEL_134;
  }
  v487 = v5;
  uint64_t v488 = a1;
  long long v498 = 0u;
  long long v499 = 0u;
  long long v496 = 0u;
  long long v497 = 0u;
  v491 = v6;
  int v10 = [v6 stallNotifications];
  id v11 = [v10 countByEnumeratingWithState:&v496 objects:v509 count:16];
  if (v11)
  {
    id v12 = v11;
    char v13 = 0;
    int v14 = 0;
    uint64_t v15 = *(void *)v497;
    do
    {
      for (int i = 0; i != v12; int i = (char *)i + 1)
      {
        if (*(void *)v497 != v15) {
          objc_enumerationMutation(v10);
        }
        uint32_t v17 = *(void **)(*((void *)&v496 + 1) + 8 * i);
        if ([v17 symptom] == 4) {
          v14 |= [v17 facetimeCallInProgress];
        }
        v13 |= [v17 symptom] == 2;
      }
      id v12 = [v10 countByEnumeratingWithState:&v496 objects:v509 count:16];
    }
    while (v12);
  }
  else
  {
    char v13 = 0;
    LOBYTE(v14) = 0;
  }

  uint64_t v18 = +[NSNumber numberWithBool:v14 & 1];
  [v2 setObject:v18 forKeyedSubscript:@"IsCriticalAppRunning"];

  long long v19 = +[NSNumber numberWithBool:v13 & 1];
  [v2 setObject:v19 forKeyedSubscript:@"DidUserToggleWiFiOff"];

  uint64_t v20 = [*(id *)(v488 + 56) objectForKeyedSubscript:@"UserToggleBeforeDecision"];
  if (v20
    && (uint64_t v21 = (void *)v20,
        [*(id *)(v488 + 56) objectForKeyedSubscript:@"UserToggleBeforeDecision"],
        long long v22 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v23 = [v22 BOOLValue],
        v22,
        v21,
        (v23 & 1) != 0))
  {
    id v24 = &__kCFBooleanTrue;
  }
  else
  {
    id v24 = &__kCFBooleanFalse;
  }
  [v2 setObject:v24 forKeyedSubscript:@"UserToggleBeforeDecision"];
  uint64_t v25 = [*(id *)(v488 + 56) objectForKeyedSubscript:@"LinkUpBeforeDecision"];
  if (v25
    && (uint64_t v26 = (void *)v25,
        [*(id *)(v488 + 56) objectForKeyedSubscript:@"LinkUpBeforeDecision"],
        int v27 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v28 = [v27 BOOLValue],
        v27,
        v26,
        (v28 & 1) != 0))
  {
    int v29 = &__kCFBooleanTrue;
  }
  else
  {
    int v29 = &__kCFBooleanFalse;
  }
  [v2 setObject:v29 forKeyedSubscript:@"LinkUpBeforeDecision"];
  uint64_t v30 = [*(id *)(v488 + 56) objectForKeyedSubscript:@"UserToggleAfterDecision"];
  if (v30
    && (int v31 = (void *)v30,
        [*(id *)(v488 + 56) objectForKeyedSubscript:@"UserToggleAfterDecision"],
        uint64_t v32 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v33 = [v32 BOOLValue],
        v32,
        v31,
        (v33 & 1) != 0))
  {
    id v34 = &__kCFBooleanTrue;
  }
  else
  {
    id v34 = &__kCFBooleanFalse;
  }
  [v2 setObject:v34 forKeyedSubscript:@"UserToggleAfterDecision"];
  uint64_t v35 = [*(id *)(v488 + 56) objectForKeyedSubscript:@"LinkUpAfterDecision"];
  if (v35
    && (int v36 = (void *)v35,
        [*(id *)(v488 + 56) objectForKeyedSubscript:@"LinkUpAfterDecision"],
        __int16 v37 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v38 = [v37 BOOLValue],
        v37,
        v36,
        (v38 & 1) != 0))
  {
    __int16 v39 = &__kCFBooleanTrue;
  }
  else
  {
    __int16 v39 = &__kCFBooleanFalse;
  }
  v490 = v3 - 1;
  [v2 setObject:v39 forKeyedSubscript:@"LinkUpAfterDecision"];
  int v40 = [v491 dpsCounterSampleAtIndex:[(*(id *)(*(void *)(v488 + 40) + 16)) dns_symptoms_trap_evaluated_at_sample] - 1];
  id v41 = [v40 controllerStats];
  uint64_t v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v41 channel]);

  uint64_t v43 = [v491 dpsCounterSampleAtIndex:((char *)[*(id *)(*(void *)(v488 + 40) + 16) dns_symptoms_trap_evaluated_at_sample] - 1)];
  __int16 v44 = [v43 controllerStats];
  uint64_t v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v44 channelBandwidth]);

  v452 = v42;
  [v2 setObject:v42 forKeyedSubscript:@"Channel"];
  v451 = (void *)v45;
  [v2 setObject:v45 forKeyedSubscript:@"ChannelBandwidth"];
  if ([v491 usbEventsCount])
  {
    __int16 v46 = [v491 usbEventAtIndex:[v491 usbEventsCount] - 1];
    long long v47 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v46 usbAction]);
    [v2 setObject:v47 forKeyedSubscript:@"usbAction"];

    long long v48 = [v491 usbEventAtIndex:((char *)[v491 usbEventsCount]) - 1];
    long long v49 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v48 usbTotal]);
    [v2 setObject:v49 forKeyedSubscript:@"usbTotal"];

    long long v50 = [[v491 usbEventAtIndex:([v491 usbEventsCount] - 1)]
    long long v51 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v50 durationSinceUSBEventInSeconds]);
    [v2 setObject:v51 forKeyedSubscript:@"timeSinceUSBEvent"];

    long long v52 = [v491 usbEventAtIndex:[v491 usbEventsCount] - 1];
    long long v53 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v52 smartCCADesenseSupported]);
    [v2 setObject:v53 forKeyedSubscript:@"isSmartCCADesenseSupported"];

    long long v54 = [[v491 usbEventsCount] - 1];
    uint64_t v55 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v54 isVendorApple]);
    [v2 setObject:v55 forKeyedSubscript:@"isUSBDeviceVendorApple"];
  }
  id v56 = [v491 dpsEpiloge];
  id v57 = [v56 accessPointInfosCount];

  if (v57)
  {
    id v58 = [v491 dpsEpiloge];
    __int16 v59 = [v58 accessPointInfoAtIndex:0];
    int v60 = [v59 modelName];
    [v2 setObject:v60 forKeyedSubscript:@"APModelName"];

    __int16 v61 = [v491 dpsEpiloge];
    int v62 = [v61 accessPointInfoAtIndex:0];
    __int16 v63 = [v62 modelNumber];
    [v2 setObject:v63 forKeyedSubscript:@"APModelNumber"];

    uint64_t v64 = [v491 dpsEpiloge];
    uint64_t v65 = [v64 accessPointInfoAtIndex:0];
    uint64_t v66 = [v65 manufacturerElement];
    [v2 setObject:v66 forKeyedSubscript:@"APManufacturerElement"];

    id v67 = &__kCFBooleanTrue;
  }
  else
  {
    id v67 = &__kCFBooleanFalse;
  }
  [v2 setObject:v67 forKeyedSubscript:@"IsAPInfoPresent"];
  uint64_t v68 = [v491 snapshot];
  id v69 = [v68 btSnapshot];
  uint64_t v70 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v69 use]);
  [v2 setObject:v70 forKeyedSubscript:@"BtUse"];

  uint64_t v71 = [v491 snapshot];
  unint64_t v72 = [v71 awdlSnapshot];
  uint64_t v73 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v72 use]);
  [v2 setObject:v73 forKeyedSubscript:@"AwdlUse"];

  unint64_t v74 = [v491 snapshot];
  os_log_type_t v75 = [v74 awdlSnapshot];
  uint64_t v76 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v75 sdb]);
  [v2 setObject:v76 forKeyedSubscript:@"AwdlSdb"];

  double v77 = *(void **)(v488 + 40);
  id v78 = [v491 snapshot];
  NSErrorUserInfoKey v79 = [v78 btSnapshot];
  unint64_t v80 = (unint64_t)[v79 ts] / 0x3E8;
  CFStringRef v81 = [*(id *)(v488 + 56) objectForKeyedSubscript:@"snapshotInstance"];
  uint64_t v82 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v77 computeSnapshotValidity:v80 snapshotTimestamp:v81 validityThreshold:7]);
  [v2 setObject:v82 forKeyedSubscript:@"BtSnapshotValidity"];

  __int16 v83 = *(void **)(v488 + 40);
  int v84 = [v491 snapshot];
  __int16 v85 = [v84 awdlSnapshot];
  unint64_t v86 = (unint64_t)[v85 ts] / 0x3E8;
  uint64_t v87 = [*(id *)(v488 + 56) objectForKeyedSubscript:@"snapshotInstance"];
  uint64_t v88 = v491;
  unint64_t v89 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v83 computeSnapshotValidity:v86 snapshotTimestamp:v87 validityThreshold:7]);
  [v2 setObject:v89 forKeyedSubscript:@"AwdlSnapshotValidity"];

  long long v90 = [v491 dpsCounterSampleAtIndex:v490];
  long long v91 = [v90 peerStats];
  long long v92 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v91 ccaValue]);
  [v2 setObject:v92 forKeyedSubscript:@"ccaValue"];

  long long v93 = [v491 dpsCounterSampleAtIndex:v490];
  long long v94 = [v93 peerStats];
  long long v95 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v94 rssiValue]);
  [v2 setObject:v95 forKeyedSubscript:@"rssiValue"];

  long long v96 = [v491 dpsCounterSampleAtIndex:v490];
  long long v97 = [v96 peerStats];
  long long v98 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v97 snrValue]);
  [v2 setObject:v98 forKeyedSubscript:@"snrValue"];

  uint64_t v99 = [v491 dpsEpiloge];
  id v100 = [v99 associationChangesCount];

  if (v100)
  {
    [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IsAssociationChangesValid"];
    long long v494 = 0u;
    long long v495 = 0u;
    long long v492 = 0u;
    long long v493 = 0u;
    __int16 v101 = [v491 dpsEpiloge];
    int v102 = [v101 associationChanges];

    id v103 = [v102 countByEnumeratingWithState:&v492 objects:v508 count:16];
    if (v103)
    {
      id v104 = v103;
      int v105 = 0;
      int v106 = 0;
      uint64_t v107 = *(void *)v493;
      do
      {
        for (j = 0; j != v104; j = (char *)j + 1)
        {
          if (*(void *)v493 != v107) {
            objc_enumerationMutation(v102);
          }
          v109 = *(void **)(*((void *)&v492 + 1) + 8 * (void)j);
          v106 |= [v109 changedChannel];
          v105 |= [v109 newBSSID];
        }
        id v104 = [v102 countByEnumeratingWithState:&v492 objects:v508 count:16];
      }
      while (v104);
    }
    else
    {
      LOBYTE(v105) = 0;
      LOBYTE(v106) = 0;
    }

    uint64_t v110 = +[NSNumber numberWithBool:v106 & 1];
    [v2 setObject:v110 forKeyedSubscript:@"IsAssociatedToNewChannel"];

    uint64_t v111 = +[NSNumber numberWithBool:v105 & 1];
    [v2 setObject:v111 forKeyedSubscript:@"IsAssociatedToNewBSSID"];

    uint64_t v88 = v491;
  }
  else
  {
    [v2 setObject:&__kCFBooleanFalse forKeyedSubscript:@"IsAssociationChangesValid"];
  }
  uint64_t v112 = [v88 dpsEpiloge];
  __int16 v113 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v112 isAssociatedAtStudyEnd]);
  [v2 setObject:v113 forKeyedSubscript:@"IsAssociatedAtStudyEnd"];

  uint64_t v114 = [v88 dpsEpiloge];
  __int16 v115 = [v114 symptomsDnsStats];
  v116 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v115 isCaptiveServerIPResolved]);
  [v2 setObject:v116 forKeyedSubscript:@"IsCaptiveServerResolved"];

  __int16 v117 = [v88 dpsEpiloge];
  uint64_t v118 = [v117 symptomsDnsStats];
  __int16 v119 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v118 symptomsDnsscreenStateOn]);
  [v2 setObject:v119 forKeyedSubscript:@"IsScreenStateOn"];

  uint64_t v120 = [v88 dpsEpiloge];
  id v121 = [v120 symptomsDnsStats];
  uint64_t v122 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v121 totalDnsServers]);
  [v2 setObject:v122 forKeyedSubscript:@"TotalDnsServers"];

  unsigned int v123 = [v88 dpsEpiloge];
  int v124 = [v123 symptomsDnsStats];
  uint64_t v125 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v124 numIpv4DnsServers]);
  [v2 setObject:v125 forKeyedSubscript:@"NumIpv4DnsServers"];

  id v126 = [v88 dpsEpiloge];
  long long v127 = [v126 symptomsDnsStats];
  char v128 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v127 numIpv6DnsServers]);
  [v2 setObject:v128 forKeyedSubscript:@"NumIpv6DnsServers"];

  BOOL v129 = [v88 dpsEpiloge];
  long long v130 = [v129 symptomsDnsStats];
  long long v131 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v130 numLocalDnsServers]);
  [v2 setObject:v131 forKeyedSubscript:@"NumLocalDnsServers"];

  long long v132 = [v88 dpsEpiloge];
  long long v133 = [v132 symptomsDnsStats];
  long long v134 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v133 numRemoteDnsServers]);
  [v2 setObject:v134 forKeyedSubscript:@"NumRemoteDnsServers"];

  long long v135 = [v88 dpsEpiloge];
  uint64_t v136 = [v135 symptomsDnsStats];
  uint64_t v137 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v136 lanHealthBeforeDecision]);
  [v2 setObject:v137 forKeyedSubscript:@"LanHealthBeforeDecision"];

  long long v138 = [v88 dpsEpiloge];
  long long v139 = [v138 symptomsDnsStats];
  uint64_t v140 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v139 lanHealthAfterDecision]);
  [v2 setObject:v140 forKeyedSubscript:@"LanHealthAfterDecision"];

  long long v141 = [v88 dpsEpiloge];
  long long v142 = [v141 symptomsDnsStats];
  long long v143 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v142 wanHealthBeforeDecision]);
  [v2 setObject:v143 forKeyedSubscript:@"WanHealthBeforeDecision"];

  long long v144 = [v88 dpsEpiloge];
  long long v145 = [v144 symptomsDnsStats];
  long long v146 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v145 wanHealthAfterDecision]);
  [v2 setObject:v146 forKeyedSubscript:@"WanHealthAfterDecision"];

  long long v147 = [v88 dpsEpiloge];
  long long v148 = [v147 symptomsDnsStats];
  long long v149 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v148 netscoreHealthBeforeDecision]);
  [v2 setObject:v149 forKeyedSubscript:@"NetscoreHealthBeforeDecision"];

  long long v150 = [v88 dpsEpiloge];
  long long v151 = [v150 symptomsDnsStats];
  long long v152 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v151 netscoreHealthAfterDecision]);
  [v2 setObject:v152 forKeyedSubscript:@"NetscoreHealthAfterDecision"];

  long long v153 = [v88 dpsEpiloge];
  long long v154 = [v153 symptomsDnsStats];
  long long v155 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v154 netscoreAtStudyStart]);
  [v2 setObject:v155 forKeyedSubscript:@"NetscoreAtStudyStart"];

  long long v156 = [v88 dpsEpiloge];
  long long v157 = [v156 symptomsDnsStats];
  int v158 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v157 netscoreAtStudyEnd]);
  [v2 setObject:v158 forKeyedSubscript:@"NetscoreAtStudyEnd"];

  long long v159 = [v88 dpsEpiloge];
  __int16 v160 = [v159 symptomsDnsStats];
  int v161 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v160 impactedServersAtStudyStart]);
  [v2 setObject:v161 forKeyedSubscript:@"ImpactedServersAtStudyStart"];

  __int16 v162 = [v88 dpsEpiloge];
  double v163 = [v162 symptomsDnsStats];
  __int16 v164 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v163 impactedServersAtStudyEnd]);
  [v2 setObject:v164 forKeyedSubscript:@"ImpactedServersAtStudyEnd"];

  double v165 = [v88 dpsEpiloge];
  __int16 v166 = [v165 symptomsDnsStats];
  uint64_t v167 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v166 symptomsDnsTimeSincePreviousTriggerMinutes]);
  [v2 setObject:v167 forKeyedSubscript:@"TimeSincePreviousTriggerInMin"];

  __int16 v168 = [v88 dpsEpiloge];
  uint64_t v169 = [v168 symptomsDnsStats];
  id v170 = [v169 configType];
  if (v170 >= 3)
  {
    CFStringRef v171 = +[NSString stringWithFormat:@"(unknown: %i)", v170];
  }
  else
  {
    CFStringRef v171 = *(&off_1000D1AE8 + (int)v170);
  }
  [v2 setObject:v171 forKeyedSubscript:@"DnsConfigType"];

  unint64_t v172 = [v88 dpsEpiloge];
  __int16 v173 = [v172 symptomsDnsStats];
  id v174 = [v173 suppressedReason];
  if (v174 >= 0xB)
  {
    id v175 = +[NSString stringWithFormat:@"(unknown: %i)", v174];
  }
  else
  {
    id v175 = *(&off_1000D1B00 + (int)v174);
  }
  [v2 setObject:v175 forKeyedSubscript:@"DnsRecoverySuppressedReason"];

  id v176 = [v88 dpsEpiloge];
  v177 = [v176 symptomsDnsStats];
  id v178 = [v177 symptomsDnsRecommendation];
  if (v178 >= 3)
  {
    v179 = +[NSString stringWithFormat:@"(unknown: %i)", v178];
  }
  else
  {
    v179 = *(&off_1000D1B58 + (int)v178);
  }
  [v2 setObject:v179 forKeyedSubscript:@"DnsRecoveryRecommendation"];

  v180 = [v88 dpsEpiloge];
  uint64_t v181 = [v180 symptomsDnsStats];
  char v182 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v181 dpsNotificationReceivedDuringStudy]);
  [v2 setObject:v182 forKeyedSubscript:@"IsDPSNotificationReceivedDuringDNSStudy"];

  v183 = [v88 dpsEpiloge];
  id v184 = [v183 symptomsDnsStats];
  v185 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v184 slowWiFiNotificationReceivedDuringStudy]);
  [v2 setObject:v185 forKeyedSubscript:@"IsSlowWiFiNotificationReceivedDuringDNSStudy"];

  id v186 = [v88 dpsEpiloge];
  unsigned __int8 v187 = [v186 symptomsDnsStats];
  v188 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v187 isPingEnqueueFailing]);
  [v2 setObject:v188 forKeyedSubscript:@"IsPingEnqueueFailing"];

  id v189 = [*(id *)(v488 + 56) objectForKeyedSubscript:@"IPConfiguredEventTimeStamp"];

  if (v189)
  {
    [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IsIPConfiguredEventReceived"];
    id v190 = *(void **)(v488 + 40);
    int v191 = [*(id *)(v488 + 56) objectForKeyedSubscript:@"decisionInstance"];
    int v192 = [*(id *)(v488 + 56) objectForKeyedSubscript:@"IPConfiguredEventTimeStamp"];
    uint64_t v193 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v190 computeDifferenceBetweenDates:v191 end:v192]);
    [v2 setObject:v193 forKeyedSubscript:@"IPAcquiredTimeSinceDecisionPoint"];

    v194 = [*(id *)(v488 + 56) objectForKey:@"IPAddressTypeOnInterface"];
    v195 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v194 integerValue]);
    [v2 setObject:v195 forKeyedSubscript:@"IPAddressTypeOnInterface"];
  }
  else
  {
    [v2 setObject:&__kCFBooleanFalse forKeyedSubscript:@"IsIPConfiguredEventReceived"];
  }
  v196 = [v88 dpsCounterSampleAtIndex:v490];
  id v197 = [v196 controllerStats];
  v198 = [v197 aggregateMetrics];
  uint64_t v199 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v198 kTxFrames]);
  [v2 setObject:v199 forKeyedSubscript:@"TxFramesBeforeDecision"];

  uint64_t v200 = [v88 dpsCounterSamples];
  v201 = [v200 lastObject];
  uint64_t v202 = [v201 controllerStats];
  dispatch_time_t v203 = [v202 aggregateMetrics];
  v204 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v203 kTxFrames]);
  [v2 setObject:v204 forKeyedSubscript:@"TxFramesAfterDecision"];

  v205 = [v88 dpsCounterSampleAtIndex:v490];
  v206 = [v205 controllerStats];
  dispatch_semaphore_t v207 = [v206 aggregateMetrics];
  uint64_t v208 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v207 kTxRetransmission]);
  [v2 setObject:v208 forKeyedSubscript:@"TxRetriesBeforeDecision"];

  v209 = [v88 dpsCounterSamples];
  id v210 = [v209 lastObject];
  long long v211 = [v210 controllerStats];
  long long v212 = [v211 aggregateMetrics];
  +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v212 kTxRetransmission]);
  long long v213 = v489 = v2;
  [v489 setObject:v213 forKeyedSubscript:@"TxRetriesAfterDecision"];

  long long v214 = *(void **)(v488 + 40);
  long long v215 = [v489 objectForKeyedSubscript:@"TxRetriesBeforeDecision"];
  id v216 = [v215 integerValue];
  long long v217 = [v489 objectForKeyedSubscript:@"TxFramesBeforeDecision"];
  [v214 computePercentage:v216 denomenator:[v217 integerValue]];
  double v219 = v218;

  dispatch_semaphore_t v220 = *(void **)(v488 + 40);
  v221 = [v489 objectForKeyedSubscript:@"TxRetriesAfterDecision"];
  id v222 = [v221 integerValue];
  uint64_t v223 = [v489 objectForKeyedSubscript:@"TxFramesAfterDecision"];
  [v220 computePercentage:v222 denomenator:[v223 integerValue]];
  double v225 = v224;

  id v226 = [*(id *)(v488 + 40) compareValues:(unint64_t)v219 second:(unint64_t)v225];
  if (v226 == (id)2)
  {
    [v489 setObject:@"AfterHigher" forKeyedSubscript:@"TxRetryComparison"];
    double v228 = v225 - v219;
LABEL_66:
    uint64_t v229 = +[NSNumber numberWithDouble:v228];
    [v489 setObject:v229 forKeyedSubscript:@"TxRetryDifference"];

    id v227 = v491;
    goto LABEL_70;
  }
  if (v226 == (id)1)
  {
    [v489 setObject:@"BeforeHigher" forKeyedSubscript:@"TxRetryComparison"];
    double v228 = v219 - v225;
    goto LABEL_66;
  }
  id v227 = v491;
  if (v226)
  {
    v230 = +[NSString stringWithFormat:@"(unknown: %lu)", v226];
    [v489 setObject:v230 forKeyedSubscript:@"TxRetryComparison"];

    uint64_t v231 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v231, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v501 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v502 = 1024;
      int v503 = 627;
      __int16 v504 = 2048;
      double v505 = v219;
      __int16 v506 = 2048;
      double v507 = v225;
      _os_log_impl((void *)&_mh_execute_header, v231, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Invalid Comparison result for Tx Retry before:%f after:%f", buf, 0x26u);
    }
  }
  else
  {
    [v489 setObject:@"Same" forKeyedSubscript:@"TxRetryComparison"];
    [v489 setObject:&off_1000E4348 forKeyedSubscript:@"TxRetryDifference"];
  }
LABEL_70:
  char v232 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v232, OS_LOG_TYPE_DEFAULT))
  {
    char v233 = [v489 objectForKeyedSubscript:@"TxRetriesAfterDecision"];
    id v234 = [v233 integerValue];
    __int16 v235 = [v489 objectForKeyedSubscript:@"TxFramesAfterDecision"];
    id v236 = [v235 integerValue];
    *(_DWORD *)buf = 136446978;
    v501 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]_block_invoke";
    __int16 v502 = 1024;
    int v503 = 630;
    __int16 v504 = 2048;
    double v505 = *(double *)&v234;
    __int16 v506 = 2048;
    double v507 = *(double *)&v236;
    _os_log_impl((void *)&_mh_execute_header, v232, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Tx Retry after:%llu Tx Frames after:%llu", buf, 0x26u);
  }
  __int16 v237 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v237, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v501 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]_block_invoke";
    __int16 v502 = 1024;
    int v503 = 631;
    __int16 v504 = 2048;
    double v505 = v219;
    __int16 v506 = 2048;
    double v507 = v225;
    _os_log_impl((void *)&_mh_execute_header, v237, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Comparison result for Tx Retry before:%f after:%f", buf, 0x26u);
  }

  id v238 = [v227 dpsCounterSampleAtIndex:v490];
  v239 = [v238 peerStats];
  v240 = [v239 completions];
  BOOL v241 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v240 success]);
  [v489 setObject:v241 forKeyedSubscript:@"TxCompletionSuccessBeforeDecision"];

  v242 = [v227 dpsCounterSamples];
  BOOL v243 = [v242 lastObject];
  id v244 = [v243 peerStats];
  v245 = [v244 completions];
  v246 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v245 success]);
  [v489 setObject:v246 forKeyedSubscript:@"TxCompletionSuccessAfterDecision"];

  v247 = [v227 dpsCounterSampleAtIndex:v490];
  id v248 = [v247 peerStats];
  v249 = [v248 completions];
  v250 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v249 noack]);
  [v489 setObject:v250 forKeyedSubscript:@"TxCompletionNoAckBeforeDecision"];

  v251 = [v227 dpsCounterSamples];
  char v252 = [v251 lastObject];
  v253 = [v252 peerStats];
  BOOL v254 = [v253 completions];
  id v255 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v254 noack]);
  [v489 setObject:v255 forKeyedSubscript:@"TxCompletionNoAckAfterDecision"];

  v256 = [v227 dpsCounterSampleAtIndex:v490];
  uint64_t v257 = [v256 peerStats];
  char v258 = [v257 completions];
  BOOL v259 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v258 expired]);
  [v489 setObject:v259 forKeyedSubscript:@"TxCompletionExpiryBeforeDecision"];

  id v260 = [v227 dpsCounterSamples];
  v261 = [v260 lastObject];
  v262 = [v261 peerStats];
  BOOL v263 = [v262 completions];
  v264 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v263 expired]);
  [v489 setObject:v264 forKeyedSubscript:@"TxCompletionExpiryAfterDecision"];

  v485 = [v227 dpsCounterSampleAtIndex:v490];
  v483 = [v485 peerStats];
  v481 = [v483 completions];
  LODWORD(v264) = [v481 chipmodeerror];
  v479 = [v227 dpsCounterSampleAtIndex:v490];
  v477 = [v479 peerStats];
  v475 = [v477 completions];
  unsigned int v265 = [v475 mbfree] + v264;
  v473 = [v227 dpsCounterSampleAtIndex:v490];
  v471 = [v473 peerStats];
  v469 = [v471 completions];
  LODWORD(v264) = [v469 noremotepeer];
  v466 = [v227 dpsCounterSampleAtIndex:v490];
  v464 = [v466 peerStats];
  v463 = [v464 completions];
  unsigned int v459 = v265 + v264 + [v463 txfailure];
  [v227 dpsCounterSampleAtIndex:v490];
  v461 = BOOL v266 = v227;
  v267 = [v461 peerStats];
  v268 = [v267 completions];
  LODWORD(v261) = [v268 noresources];
  v269 = [v266 dpsCounterSampleAtIndex:v490];
  BOOL v270 = [v269 peerStats];
  v271 = [v270 completions];
  LODWORD(v263) = v261 + [v271 ioerror];
  v272 = [v266 dpsCounterSampleAtIndex:v490];
  v273 = [v272 peerStats];
  char v274 = [v273 completions];
  uint64_t v275 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v459 + v263 + [v274 internalerror]);
  [v489 setObject:v275 forKeyedSubscript:@"TxCompletionAllOtherErrorsBeforeDecision"];

  v486 = [v266 dpsCounterSamples];
  v484 = [v486 lastObject];
  v482 = [v484 peerStats];
  v480 = [v482 completions];
  LODWORD(v274) = [v480 chipmodeerror];
  v478 = [v266 dpsCounterSamples];
  v476 = [v478 lastObject];
  v474 = [v476 peerStats];
  v472 = [v474 completions];
  LODWORD(v271) = [v472 mbfree] + v274;
  v470 = [v266 dpsCounterSamples];
  v468 = [v470 lastObject];
  v467 = [v468 peerStats];
  v465 = [v467 completions];
  LODWORD(v274) = [v465 noremotepeer];
  v462 = [v266 dpsCounterSamples];
  v460 = [v462 lastObject];
  v458 = [v460 peerStats];
  v457 = [v458 completions];
  unsigned int v453 = v271 + v274 + [v457 txfailure];
  v456 = [v266 dpsCounterSamples];
  v455 = [v456 lastObject];
  v454 = [v455 peerStats];
  v276 = [v454 completions];
  LODWORD(v274) = [v276 noresources];
  v277 = [v266 dpsCounterSamples];
  v278 = [v277 lastObject];
  v279 = [v278 peerStats];
  v280 = [v279 completions];
  LODWORD(v272) = v274 + [v280 ioerror];
  v281 = [v266 dpsCounterSamples];
  uint64_t v282 = [v281 lastObject];
  char v283 = [v282 peerStats];
  v284 = [v283 completions];
  v285 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v453 + v272 + [v284 internalerror]);
  [v489 setObject:v285 forKeyedSubscript:@"TxCompletionAllOtherErrorsAfterDecision"];

  long long v2 = v489;
  BOOL v286 = [v489 objectForKeyedSubscript:@"TxCompletionNoAckBeforeDecision"];
  id v287 = (char *)[v286 integerValue];
  v288 = [v489 objectForKeyedSubscript:@"TxCompletionExpiryBeforeDecision"];
  v289 = &v287[(void)[v288 integerValue]];
  id v290 = [v489 objectForKeyedSubscript:@"TxCompletionAllOtherErrorsBeforeDecision"];
  id v291 = (char *)[v290 integerValue] + (void)v289;

  v292 = [v489 objectForKeyedSubscript:@"TxCompletionSuccessBeforeDecision"];
  id v293 = &v291[(void)[v292 integerValue]];

  [*(id *)(v488 + 40) computePercentage:v291 denomenator:v293];
  double v295 = v294;
  v296 = [v489 objectForKeyedSubscript:@"TxCompletionNoAckAfterDecision"];
  v297 = (char *)[v296 integerValue];
  id v298 = [v489 objectForKeyedSubscript:@"TxCompletionExpiryAfterDecision"];
  id v299 = &v297[(void)[v298 integerValue]];
  id v300 = [v489 objectForKeyedSubscript:@"TxCompletionAllOtherErrorsAfterDecision"];
  id v301 = (char *)[v300 integerValue] + (void)v299;

  id v302 = [v489 objectForKeyedSubscript:@"TxCompletionSuccessAfterDecision"];
  v303 = &v301[(void)[v302 integerValue]];

  [*(id *)(v488 + 40) computePercentage:v301 denomenator:v303];
  double v305 = v304;
  id v306 = [*(id *)(v488 + 40) compareValues:(unint64_t)v295 second:(unint64_t)v304];
  if (v306 == (id)2)
  {
    [v489 setObject:@"AfterHigher" forKeyedSubscript:@"TxCompletionFailureComparison"];
    double v308 = v305 - v295;
LABEL_80:
    id v309 = +[NSNumber numberWithDouble:v308];
    [v489 setObject:v309 forKeyedSubscript:@"TxCompletionFailureDifference"];

    id v307 = v491;
    goto LABEL_84;
  }
  if (v306 == (id)1)
  {
    [v489 setObject:@"BeforeHigher" forKeyedSubscript:@"TxCompletionFailureComparison"];
    double v308 = v295 - v305;
    goto LABEL_80;
  }
  id v307 = v491;
  if (v306)
  {
    id v310 = +[NSString stringWithFormat:@"(unknown: %lu)", v306];
    [v489 setObject:v310 forKeyedSubscript:@"TxCompletionFailureComparison"];

    id v311 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v311, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v501 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v502 = 1024;
      int v503 = 680;
      __int16 v504 = 2048;
      double v505 = v219;
      __int16 v506 = 2048;
      double v507 = v225;
      _os_log_impl((void *)&_mh_execute_header, v311, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Invalid Comparison result for Tx Retry before:%f after:%f", buf, 0x26u);
    }
  }
  else
  {
    [v489 setObject:@"Same" forKeyedSubscript:@"TxCompletionFailureComparison"];
    [v489 setObject:&off_1000E4348 forKeyedSubscript:@"TxCompletionFailureDifference"];
  }
LABEL_84:
  v312 = [v307 dpsCounterSampleAtIndex:v490];
  id v313 = [v312 controllerStats];
  v314 = [v313 aggregateMetrics];
  id v315 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v314 kRxFrames]);
  [v489 setObject:v315 forKeyedSubscript:@"RxFramesBeforeDecision"];

  id v316 = [v307 dpsCounterSamples];
  id v317 = [v316 lastObject];
  id v318 = [v317 controllerStats];
  id v319 = [v318 aggregateMetrics];
  id v320 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v319 kRxFrames]);
  [v489 setObject:v320 forKeyedSubscript:@"RxFramesAfterDecision"];

  v321 = [v307 dpsCounterSampleAtIndex:v490];
  id v322 = [v321 controllerStats];
  id v323 = [v322 aggregateMetrics];
  id v324 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v323 kRxRetryBitSet]);
  [v489 setObject:v324 forKeyedSubscript:@"RxRetriesBeforeDecision"];

  v325 = [v307 dpsCounterSamples];
  v326 = [v325 lastObject];
  long long v327 = [v326 controllerStats];
  long long v328 = [v327 aggregateMetrics];
  long long v329 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v328 kRxRetryBitSet]);
  [v489 setObject:v329 forKeyedSubscript:@"RxRetriesAfterDecision"];

  id v330 = *(void **)(v488 + 40);
  v331 = [v489 objectForKeyedSubscript:@"RxRetriesBeforeDecision"];
  id v332 = [v331 integerValue];
  __int16 v333 = [v489 objectForKeyedSubscript:@"RxFramesBeforeDecision"];
  [v330 computePercentage:v332 denomenator:[v333 integerValue]];
  double v335 = v334;

  id v336 = *(void **)(v488 + 40);
  v337 = [v489 objectForKeyedSubscript:@"RxRetriesAfterDecision"];
  id v338 = [v337 integerValue];
  id v339 = [v489 objectForKeyedSubscript:@"RxFramesAfterDecision"];
  [v336 computePercentage:v338 denomenator:[v339 integerValue]];
  double v341 = v340;

  id v342 = [*(id *)(v488 + 40) compareValues:(unint64_t)v335 second:(unint64_t)v341];
  if (v342 == (id)2)
  {
    [v489 setObject:@"AfterHigher" forKeyedSubscript:@"RxRetryComparison"];
    double v344 = v341 - v335;
LABEL_90:
    id v345 = +[NSNumber numberWithDouble:v344];
    [v489 setObject:v345 forKeyedSubscript:@"RxRetryDifference"];

    v343 = v491;
    goto LABEL_94;
  }
  if (v342 == (id)1)
  {
    [v489 setObject:@"BeforeHigher" forKeyedSubscript:@"RxRetryComparison"];
    double v344 = v335 - v341;
    goto LABEL_90;
  }
  v343 = v491;
  if (v342)
  {
    id v346 = +[NSString stringWithFormat:@"(unknown: %lu)", v342];
    [v489 setObject:v346 forKeyedSubscript:@"RxRetryComparison"];

    char v347 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v347, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v501 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v502 = 1024;
      int v503 = 708;
      __int16 v504 = 2048;
      double v505 = v335;
      __int16 v506 = 2048;
      double v507 = v341;
      _os_log_impl((void *)&_mh_execute_header, v347, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Invalid Comparison result for Rx Retry before:%f after:%f", buf, 0x26u);
    }
  }
  else
  {
    [v489 setObject:@"Same" forKeyedSubscript:@"RxRetryComparison"];
    [v489 setObject:&off_1000E4348 forKeyedSubscript:@"RxRetryDifference"];
  }
LABEL_94:
  v348 = [v343 dpsCounterSampleAtIndex:v490];
  id v349 = [v348 controllerStats];
  id v350 = [v349 aggregateMetrics];
  id v351 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v350 kRxGoodPLCP]);
  [v489 setObject:v351 forKeyedSubscript:@"RxGoodPLCPBeforeDecision"];

  id v352 = [v343 dpsCounterSamples];
  v353 = [v352 lastObject];
  uint64_t v354 = [v353 controllerStats];
  v355 = [v354 aggregateMetrics];
  uint64_t v356 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v355 kRxGoodPLCP]);
  [v489 setObject:v356 forKeyedSubscript:@"RxGoodPLCPAfterDecision"];

  id v357 = [v343 dpsCounterSampleAtIndex:v490];
  id v358 = [v357 controllerStats];
  id v359 = [v358 aggregateMetrics];
  id v360 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v359 kRxBadPLCP]);
  [v489 setObject:v360 forKeyedSubscript:@"RxBadPLCPBeforeDecision"];

  id v361 = [v343 dpsCounterSamples];
  v362 = [v361 lastObject];
  v363 = [v362 controllerStats];
  v364 = [v363 aggregateMetrics];
  v365 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v364 kRxBadPLCP]);
  [v489 setObject:v365 forKeyedSubscript:@"RxBadPLCPAfterDecision"];

  id v366 = *(void **)(v488 + 40);
  id v367 = [v489 objectForKeyedSubscript:@"RxBadPLCPBeforeDecision"];
  id v368 = [v367 integerValue];
  id v369 = [v489 objectForKeyedSubscript:@"RxGoodPLCPBeforeDecision"];
  v370 = (char *)[v369 integerValue];
  id v371 = [v489 objectForKeyedSubscript:@"RxBadPLCPBeforeDecision"];
  [v366 computePercentage:v368 denomenator:&v370[(void)objc_msgSend(v371, "integerValue")]];
  double v373 = v372;

  id v374 = *(void **)(v488 + 40);
  id v375 = [v489 objectForKeyedSubscript:@"RxBadPLCPAfterDecision"];
  id v376 = [v375 integerValue];
  id v377 = [v489 objectForKeyedSubscript:@"RxGoodPLCPAfterDecision"];
  id v378 = (char *)[v377 integerValue];
  v379 = [v489 objectForKeyedSubscript:@"RxBadPLCPAfterDecision"];
  [v374 computePercentage:v376 denomenator:&v378[(void)objc_msgSend(v379, "integerValue")]];
  double v381 = v380;

  id v382 = [*(id *)(v488 + 40) compareValues:(unint64_t)v373 second:(unint64_t)v381];
  if (v382 == (id)2)
  {
    [v489 setObject:@"AfterHigher" forKeyedSubscript:@"RxBadPLCPComparison"];
    double v384 = v381 - v373;
LABEL_100:
    v385 = +[NSNumber numberWithDouble:v384];
    [v489 setObject:v385 forKeyedSubscript:@"RxBadPLCPDifference"];

    char v383 = v491;
    goto LABEL_104;
  }
  if (v382 == (id)1)
  {
    [v489 setObject:@"BeforeHigher" forKeyedSubscript:@"RxBadPLCPComparison"];
    double v384 = v373 - v381;
    goto LABEL_100;
  }
  char v383 = v491;
  if (v382)
  {
    v386 = +[NSString stringWithFormat:@"(unknown: %lu)", v382];
    [v489 setObject:v386 forKeyedSubscript:@"RxBadPLCPComparison"];

    long long v387 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v387, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446978;
      v501 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v502 = 1024;
      int v503 = 735;
      __int16 v504 = 2048;
      double v505 = v373;
      __int16 v506 = 2048;
      double v507 = v381;
      _os_log_impl((void *)&_mh_execute_header, v387, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Invalid Comparison result for Rx BadPLCP before:%f after:%f", buf, 0x26u);
    }
  }
  else
  {
    [v489 setObject:@"Same" forKeyedSubscript:@"RxBadPLCPComparison"];
    [v489 setObject:&off_1000E4348 forKeyedSubscript:@"RxBadPLCPDifference"];
  }
LABEL_104:
  long long v388 = [v383 dpsCounterSampleAtIndex:v490];
  long long v389 = [v388 controllerStats];
  long long v390 = [v389 aggregateMetrics];
  v391 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v390 kRxBadFCS]);
  [v489 setObject:v391 forKeyedSubscript:@"RxBadFCSBeforeDecision"];

  v392 = [v383 dpsCounterSamples];
  long long v393 = [v392 lastObject];
  long long v394 = [v393 controllerStats];
  long long v395 = [v394 aggregateMetrics];
  v396 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v395 kRxBadFCS]);
  [v489 setObject:v396 forKeyedSubscript:@"RxBadFCSAfterDecision"];

  v397 = *(void **)(v488 + 40);
  __int16 v398 = [v489 objectForKeyedSubscript:@"RxBadFCSBeforeDecision"];
  id v399 = [v398 integerValue];
  __int16 v400 = [v489 objectForKeyedSubscript:@"RxGoodPLCPBeforeDecision"];
  [v397 computePercentage:v399 denomenator:[v400 integerValue]];
  double v402 = v401;

  CFStringRef v403 = *(void **)(v488 + 40);
  __int16 v404 = [v489 objectForKeyedSubscript:@"RxBadFCSAfterDecision"];
  id v405 = [v404 integerValue];
  __int16 v406 = [v489 objectForKeyedSubscript:@"RxGoodPLCPAfterDecision"];
  [v403 computePercentage:v405 denomenator:[v406 integerValue]];
  double v408 = v407;

  id v409 = [*(id *)(v488 + 40) compareValues:(unint64_t)v402 second:(unint64_t)v408];
  if (v409 == (id)2)
  {
    [v489 setObject:@"AfterHigher" forKeyedSubscript:@"RxBadFCSComparison"];
    double v411 = v408 - v402;
  }
  else
  {
    if (v409 != (id)1)
    {
      v410 = v491;
      if (v409)
      {
        __int16 v413 = +[NSString stringWithFormat:@"(unknown: %lu)", v409];
        [v489 setObject:v413 forKeyedSubscript:@"RxBadFCSComparison"];

        CFStringRef v414 = WALogCategoryDefaultHandle();
        if (os_log_type_enabled(v414, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446978;
          v501 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]_block_invoke";
          __int16 v502 = 1024;
          int v503 = 759;
          __int16 v504 = 2048;
          double v505 = v402;
          __int16 v506 = 2048;
          double v507 = v408;
          _os_log_impl((void *)&_mh_execute_header, v414, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Invalid Comparison result for Rx BadFCS before:%f after:%f", buf, 0x26u);
        }
      }
      else
      {
        [v489 setObject:@"Same" forKeyedSubscript:@"RxBadFCSComparison"];
        [v489 setObject:&off_1000E4348 forKeyedSubscript:@"RxBadFCSDifference"];
      }
      goto LABEL_114;
    }
    [v489 setObject:@"BeforeHigher" forKeyedSubscript:@"RxBadFCSComparison"];
    double v411 = v402 - v408;
  }
  int v412 = +[NSNumber numberWithDouble:v411];
  [v489 setObject:v412 forKeyedSubscript:@"RxBadFCSDifference"];

  v410 = v491;
LABEL_114:
  __int16 v415 = [v410 dpsCounterSampleAtIndex:v490];
  CFStringRef v416 = [v415 controllerStats];
  __int16 v417 = [v416 aggregateMetrics];
  CFStringRef v418 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v417 kRxCRCGlitch]);
  [v489 setObject:v418 forKeyedSubscript:@"RxCRCGlitchBeforeDecision"];

  __int16 v419 = [v410 dpsCounterSamples];
  CFStringRef v420 = [v419 lastObject];
  v421 = [v420 controllerStats];
  v422 = [v421 aggregateMetrics];
  v423 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v422 kRxCRCGlitch]);
  [v489 setObject:v423 forKeyedSubscript:@"RxCRCGlitchAfterDecision"];

  v424 = *(void **)(v488 + 40);
  v425 = [v489 objectForKeyedSubscript:@"RxCRCGlitchBeforeDecision"];
  id v426 = [v425 integerValue];
  v427 = [v489 objectForKeyedSubscript:@"RxGoodPLCPBeforeDecision"];
  v428 = (char *)[v427 integerValue];
  v429 = [v489 objectForKeyedSubscript:@"RxBadPLCPBeforeDecision"];
  [v424 computePercentage:v426 denomenator:&v428[(void)objc_msgSend(v429, "integerValue")]];
  double v431 = v430;

  v432 = *(void **)(v488 + 40);
  v433 = [v489 objectForKeyedSubscript:@"RxCRCGlitchAfterDecision"];
  id v434 = [v433 integerValue];
  v435 = [v489 objectForKeyedSubscript:@"RxGoodPLCPAfterDecision"];
  v436 = (char *)[v435 integerValue];
  v437 = [v489 objectForKeyedSubscript:@"RxBadPLCPAfterDecision"];
  [v432 computePercentage:v434 denomenator:&v436[([v437 integerValue])]];
  double v439 = v438;

  id v440 = [*(id *)(v488 + 40) compareValues:(unint64_t)v431 second:(unint64_t)v439];
  if (v440 == (id)2)
  {
    [v489 setObject:@"AfterHigher" forKeyedSubscript:@"RxCRCGlitchComparison"];
    v441 = +[NSNumber numberWithDouble:v439 - v431];
    [v489 setObject:v441 forKeyedSubscript:@"RxCRCGlitchDifference"];

    unint64_t v5 = v487;
LABEL_121:
    v443 = v452;
    goto LABEL_125;
  }
  unint64_t v5 = v487;
  if (v440 == (id)1)
  {
    [v489 setObject:@"BeforeHigher" forKeyedSubscript:@"RxCRCGlitchComparison"];
    v442 = +[NSNumber numberWithDouble:v431 - v439];
    [v489 setObject:v442 forKeyedSubscript:@"RxCRCGlitchDifference"];

    goto LABEL_120;
  }
  if (!v440)
  {
    [v489 setObject:@"Same" forKeyedSubscript:@"RxCRCGlitchComparison"];
    [v489 setObject:&off_1000E4348 forKeyedSubscript:@"RxCRCGlitchDifference"];
LABEL_120:

    goto LABEL_121;
  }
  v444 = +[NSString stringWithFormat:@"(unknown: %lu)", v440];
  [v489 setObject:v444 forKeyedSubscript:@"RxCRCGlitchComparison"];

  v445 = WALogCategoryDefaultHandle();
  v443 = v452;
  if (os_log_type_enabled(v445, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v501 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]_block_invoke";
    __int16 v502 = 1024;
    int v503 = 783;
    __int16 v504 = 2048;
    double v505 = v431;
    __int16 v506 = 2048;
    double v507 = v439;
    _os_log_impl((void *)&_mh_execute_header, v445, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Invalid Comparison result for Rx CRCGlitch before:%f after:%f", buf, 0x26u);
  }

LABEL_125:
  v446 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v446, OS_LOG_TYPE_DEFAULT))
  {
    id v447 = [v2 count];
    *(_DWORD *)buf = 136446722;
    v501 = "-[CADataTransformEngine transformAndSubmitDNSMessageToCA:additionalInfo:timestamps:]_block_invoke";
    __int16 v502 = 1024;
    int v503 = 787;
    __int16 v504 = 2048;
    double v505 = *(double *)&v447;
    _os_log_impl((void *)&_mh_execute_header, v446, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:DNS metric dict fieldCount: %lu", buf, 0x1Cu);
  }

  id v448 = v2;
  return v448;
}

id sub_10007B4CC(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");
  }
  else {
  long long v2 = +[NSMutableDictionary dictionary];
  }
  id v3 = [*(id *)(a1 + 40) instantiateAWDProtobufAndPopulateValues:*(void *)(a1 + 48)];
  SEL v4 = v3;
  if (v3)
  {
    id v5 = v3;
    id v315 = v4;
    if ([v5 hasSlowNotice])
    {
      id v6 = [v5 slowNotice];
      [v6 recoveryReason];
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v7 = +[NSNumber numberWithUnsignedInt:[v6 actionField]];
    [v2 setObject:v7 forKeyedSubscript:@"actionField"];

    id v8 = +[NSNumber numberWithUnsignedInt:[v6 recoveryAction]];
    [v2 setObject:v8 forKeyedSubscript:@"recoveryAction"];

    id v9 = +[NSNumber numberWithUnsignedInt:[v6 recoveryReason]];
    [v2 setObject:v9 forKeyedSubscript:@"recoveryReason"];

    int v10 = +[NSNumber numberWithUnsignedInt:[v6 userInput]];
    [v2 setObject:v10 forKeyedSubscript:@"userInput"];

    id v11 = +[NSNumber numberWithBool:[v6 facetimeCallInProgress]];
    [v2 setObject:v11 forKeyedSubscript:@"IsCriticalAppInUse"];

    if ([v5 usbEventsCount])
    {
      id v12 = [v5 usbEventAtIndex:[v5 usbEventsCount] - 1];
      char v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 usbAction]);
      [v2 setObject:v13 forKeyedSubscript:@"usbAction"];

      int v14 = [v5 usbEventAtIndex:([v5 usbEventsCount] - 1)];
      uint64_t v15 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v14 usbTotal]);
      [v2 setObject:v15 forKeyedSubscript:@"usbTotal"];

      os_log_type_t v16 = [v5 usbEventAtIndex:[v5 usbEventsCount] - 1];
      uint32_t v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v16 durationSinceUSBEventInSeconds]);
      [v2 setObject:v17 forKeyedSubscript:@"timeSinceUSBEvent"];

      uint64_t v18 = [v5 usbEventAtIndex:((char *)[v5 usbEventsCount]) - 1];
      long long v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v18 smartCCADesenseSupported]);
      [v2 setObject:v19 forKeyedSubscript:@"isSmartCCADesenseSupported"];

      uint64_t v20 = [v5 usbEventAtIndex:[v5 usbEventsCount] - 1];
      uint64_t v21 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v20 isVendorApple]);
      [v2 setObject:v21 forKeyedSubscript:@"isUSBDeviceVendorApple"];
    }
    long long v22 = [v5 linkQualSampleAtIndex:0];
    unsigned __int8 v23 = [v5 linkQualSamples];
    id v24 = [v23 lastObject];

    uint64_t v25 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 cCA]);
    [v2 setObject:v25 forKeyedSubscript:@"CCABeforeRecovery"];

    uint64_t v26 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v24 cCA]);
    [v2 setObject:v26 forKeyedSubscript:@"CCAAfterRecovery"];

    int v27 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v22 rSSI]);
    [v2 setObject:v27 forKeyedSubscript:@"RSSIBeforeRecovery"];

    unsigned __int8 v28 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v24 rSSI]);
    [v2 setObject:v28 forKeyedSubscript:@"RSSIAfterRecovery"];

    int v29 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 sNR]);
    [v2 setObject:v29 forKeyedSubscript:@"SNRBeforeRecovery"];

    uint64_t v30 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v24 sNR]);
    [v2 setObject:v30 forKeyedSubscript:@"SNRAfterRecovery"];

    int v31 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 txExpectedAMPDUDensity]);
    [v2 setObject:v31 forKeyedSubscript:@"TxExpectedAMPDUDensityBeforeRecovery"];

    id v316 = v24;
    uint64_t v32 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v24 txExpectedAMPDUDensity]);
    [v2 setObject:v32 forKeyedSubscript:@"TxExpectedAMPDUDensityAfterRecovery"];

    unsigned __int8 v33 = *(void **)(a1 + 40);
    id v34 = [v2 objectForKeyedSubscript:@"TxExpectedAMPDUDensityBeforeRecovery"];
    id v35 = [v34 integerValue];
    int v36 = [v2 objectForKeyedSubscript:@"TxExpectedAMPDUDensityAfterRecovery"];
    id v37 = [v33 compareValues:v35 second:[v36 integerValue]];

    v314 = v6;
    if ((unint64_t)v37 >= 3)
    {
      unsigned __int8 v38 = +[NSString stringWithFormat:@"(unknown: %lu)", v37];
    }
    else
    {
      unsigned __int8 v38 = *(&off_1000D1B70 + (void)v37);
    }
    [v2 setObject:v38 forKeyedSubscript:@"TxExpectedAMPDUDensityComparison"];

    __int16 v39 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = [v2 objectForKeyedSubscript:@"TxExpectedAMPDUDensityBeforeRecovery"];
      id v41 = [v40 integerValue];
      uint64_t v42 = [v2 objectForKeyedSubscript:@"TxExpectedAMPDUDensityAfterRecovery"];
      id v43 = [v42 integerValue];
      __int16 v44 = [v2 objectForKeyedSubscript:@"TxExpectedAMPDUDensityComparison"];
      *(_DWORD *)buf = 136447234;
      id v318 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v319 = 1024;
      int v320 = 859;
      __int16 v321 = 2048;
      id v322 = v41;
      __int16 v323 = 2048;
      id v324 = v43;
      __int16 v325 = 2112;
      v326 = v44;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:TxExpectedAMPDUDensity before:%ld after:%ld comparison:%@", buf, 0x30u);
    }
    uint64_t v45 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 aPTxDataStall]);
    [v2 setObject:v45 forKeyedSubscript:@"APTxDataStallBeforeRecovery"];

    __int16 v46 = v24;
    long long v47 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v24 aPTxDataStall]);
    [v2 setObject:v47 forKeyedSubscript:@"APTxDataStallAfterRecovery"];

    long long v48 = *(void **)(a1 + 40);
    long long v49 = [v2 objectForKeyedSubscript:@"APTxDataStallBeforeRecovery"];
    id v50 = [v49 integerValue];
    long long v51 = [v2 objectForKeyedSubscript:@"APTxDataStallAfterRecovery"];
    id v52 = [v48 compareValues:v50 second:[v51 integerValue]];

    if ((unint64_t)v52 >= 3)
    {
      long long v53 = +[NSString stringWithFormat:@"(unknown: %lu)", v52];
    }
    else
    {
      long long v53 = *(&off_1000D1B70 + (void)v52);
    }
    [v2 setObject:v53 forKeyedSubscript:@"APTxDataStallComparison"];

    long long v54 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v55 = [v2 objectForKeyedSubscript:@"APTxDataStallBeforeRecovery"];
      id v56 = [v55 integerValue];
      id v57 = [v2 objectForKeyedSubscript:@"APTxDataStallAfterRecovery"];
      id v58 = [v57 integerValue];
      __int16 v59 = [v2 objectForKeyedSubscript:@"APTxDataStallComparison"];
      *(_DWORD *)buf = 136447234;
      id v318 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v319 = 1024;
      int v320 = 865;
      __int16 v321 = 2048;
      id v322 = v56;
      __int16 v323 = 2048;
      id v324 = v58;
      __int16 v325 = 2112;
      v326 = v59;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:APTxStall before:%ld after:%ld comparison:%@", buf, 0x30u);

      __int16 v46 = v24;
    }

    int v60 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 rxAmpduTxBaMismatch]);
    [v2 setObject:v60 forKeyedSubscript:@"RxAmpduTxBaMismatchBeforeRecovery"];

    __int16 v61 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 rxAmpduTxBaMismatch]);
    [v2 setObject:v61 forKeyedSubscript:@"RxAmpduTxBaMismatchAfterRecovery"];

    int v62 = *(void **)(a1 + 40);
    __int16 v63 = [v2 objectForKeyedSubscript:@"RxAmpduTxBaMismatchBeforeRecovery"];
    id v64 = [v63 integerValue];
    uint64_t v65 = [v2 objectForKeyedSubscript:@"RxAmpduTxBaMismatchAfterRecovery"];
    id v66 = [v62 compareValues:v64 second:[v65 integerValue]];

    if ((unint64_t)v66 >= 3)
    {
      id v67 = +[NSString stringWithFormat:@"(unknown: %lu)", v66];
    }
    else
    {
      id v67 = *(&off_1000D1B70 + (void)v66);
    }
    [v2 setObject:v67 forKeyedSubscript:@"RxAmpduTxBaMismatchComparison"];

    uint64_t v68 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      id v69 = [v2 objectForKeyedSubscript:@"RxAmpduTxBaMismatchBeforeRecovery"];
      id v70 = [v69 integerValue];
      uint64_t v71 = [v2 objectForKeyedSubscript:@"RxAmpduTxBaMismatchAfterRecovery"];
      id v72 = [v71 integerValue];
      uint64_t v73 = [v2 objectForKeyedSubscript:@"RxAmpduTxBaMismatchComparison"];
      *(_DWORD *)buf = 136447234;
      id v318 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v319 = 1024;
      int v320 = 871;
      __int16 v321 = 2048;
      id v322 = v70;
      __int16 v323 = 2048;
      id v324 = v72;
      __int16 v325 = 2112;
      v326 = v73;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:RxAmpduTxBaMismatch before:%ld after:%ld comparison:%@", buf, 0x30u);

      __int16 v46 = v24;
    }

    unint64_t v74 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 symptomsFails]);
    [v2 setObject:v74 forKeyedSubscript:@"SymptomsFailsBeforeRecovery"];

    os_log_type_t v75 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 symptomsFails]);
    [v2 setObject:v75 forKeyedSubscript:@"SymptomsFailsAfterRecovery"];

    uint64_t v76 = *(void **)(a1 + 40);
    double v77 = [v2 objectForKeyedSubscript:@"SymptomsFailsBeforeRecovery"];
    id v78 = [v77 integerValue];
    NSErrorUserInfoKey v79 = [v2 objectForKeyedSubscript:@"SymptomsFailsAfterRecovery"];
    id v80 = [v76 compareValues:v78 second:[v79 integerValue]];

    if ((unint64_t)v80 >= 3)
    {
      CFStringRef v81 = +[NSString stringWithFormat:@"(unknown: %lu)", v80];
    }
    else
    {
      CFStringRef v81 = *(&off_1000D1B70 + (void)v80);
    }
    [v2 setObject:v81 forKeyedSubscript:@"SymptomsFailsComparison"];

    uint64_t v82 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v83 = [v2 objectForKeyedSubscript:@"SymptomsFailsBeforeRecovery"];
      id v84 = [v83 integerValue];
      __int16 v85 = [v2 objectForKeyedSubscript:@"SymptomsFailsAfterRecovery"];
      id v86 = [v85 integerValue];
      uint64_t v87 = [v2 objectForKeyedSubscript:@"SymptomsFailsComparison"];
      *(_DWORD *)buf = 136447234;
      id v318 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v319 = 1024;
      int v320 = 877;
      __int16 v321 = 2048;
      id v322 = v84;
      __int16 v323 = 2048;
      id v324 = v86;
      __int16 v325 = 2112;
      v326 = v87;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SymptomsFails before:%ld after:%ld comparison:%@", buf, 0x30u);

      __int16 v46 = v24;
    }

    uint64_t v88 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 infraDutyCycle]);
    [v2 setObject:v88 forKeyedSubscript:@"InfraDutyCycleBeforeRecovery"];

    unint64_t v89 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 infraDutyCycle]);
    [v2 setObject:v89 forKeyedSubscript:@"InfraDutyCycleAfterRecovery"];

    long long v90 = *(void **)(a1 + 40);
    long long v91 = [v2 objectForKeyedSubscript:@"InfraDutyCycleBeforeRecovery"];
    id v92 = [v91 integerValue];
    long long v93 = [v2 objectForKeyedSubscript:@"InfraDutyCycleAfterRecovery"];
    id v94 = [v90 compareValues:v92 second:[v93 integerValue]];

    if ((unint64_t)v94 >= 3)
    {
      long long v95 = +[NSString stringWithFormat:@"(unknown: %lu)", v94];
    }
    else
    {
      long long v95 = *(&off_1000D1B70 + (void)v94);
    }
    [v2 setObject:v95 forKeyedSubscript:@"InfraDutyCycleComparison"];

    long long v96 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      long long v97 = [v2 objectForKeyedSubscript:@"InfraDutyCycleBeforeRecovery"];
      id v98 = [v97 integerValue];
      uint64_t v99 = [v2 objectForKeyedSubscript:@"InfraDutyCycleAfterRecovery"];
      id v100 = [v99 integerValue];
      __int16 v101 = [v2 objectForKeyedSubscript:@"InfraDutyCycleComparison"];
      *(_DWORD *)buf = 136447234;
      id v318 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v319 = 1024;
      int v320 = 883;
      __int16 v321 = 2048;
      id v322 = v98;
      __int16 v323 = 2048;
      id v324 = v100;
      __int16 v325 = 2112;
      v326 = v101;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:InfraDutyCycle before:%ld after:%ld comparison:%@", buf, 0x30u);

      __int16 v46 = v24;
    }

    int v102 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 lastScanReason]);
    [v2 setObject:v102 forKeyedSubscript:@"LastScanReasonBeforeRecovery"];

    id v103 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 lastScanReason]);
    [v2 setObject:v103 forKeyedSubscript:@"LastScanReasonAfterRecovery"];

    id v104 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 accessPointOUI]);
    [v2 setObject:v104 forKeyedSubscript:@"AccessPointOUIBeforeRecovery"];

    int v105 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 accessPointOUI]);
    [v2 setObject:v105 forKeyedSubscript:@"AccessPointOUIAfterRecovery"];

    id v106 = [v22 accessPointOUI];
    if (v106 == [v46 accessPointOUI]) {
      uint64_t v107 = &__kCFBooleanTrue;
    }
    else {
      uint64_t v107 = &__kCFBooleanFalse;
    }
    [v2 setObject:v107 forKeyedSubscript:@"IsAccessPointOUISameAfterRecovery"];
    if ([v22 is2GBand]) {
      CFStringRef v108 = &__kCFBooleanTrue;
    }
    else {
      CFStringRef v108 = &__kCFBooleanFalse;
    }
    [v2 setObject:v108 forKeyedSubscript:@"Is2GBandBeforeRecovery"];
    if ([v46 is2GBand]) {
      v109 = &__kCFBooleanTrue;
    }
    else {
      v109 = &__kCFBooleanFalse;
    }
    [v2 setObject:v109 forKeyedSubscript:@"Is2GBandAfterRecovery"];
    if ([v22 isFGTraffic]) {
      uint64_t v110 = &__kCFBooleanTrue;
    }
    else {
      uint64_t v110 = &__kCFBooleanFalse;
    }
    [v2 setObject:v110 forKeyedSubscript:@"IsFGTrafficBeforeRecovery"];
    if ([v46 isFGTraffic]) {
      uint64_t v111 = &__kCFBooleanTrue;
    }
    else {
      uint64_t v111 = &__kCFBooleanFalse;
    }
    [v2 setObject:v111 forKeyedSubscript:@"IsFGTrafficAfterRecovery"];
    uint64_t v112 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 rxThroughput]);
    [v2 setObject:v112 forKeyedSubscript:@"RxThroughputBeforeRecovery"];

    __int16 v113 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 rxThroughput]);
    [v2 setObject:v113 forKeyedSubscript:@"RxThroughputAfterRecovery"];

    uint64_t v114 = *(void **)(a1 + 40);
    __int16 v115 = [v2 objectForKeyedSubscript:@"RxThroughputBeforeRecovery"];
    id v116 = [v115 integerValue];
    __int16 v117 = [v2 objectForKeyedSubscript:@"RxThroughputAfterRecovery"];
    id v118 = [v114 compareValues:v116 second:[v117 integerValue]];

    if ((unint64_t)v118 >= 3)
    {
      __int16 v119 = +[NSString stringWithFormat:@"(unknown: %lu)", v118];
    }
    else
    {
      __int16 v119 = *(&off_1000D1B70 + (void)v118);
    }
    [v2 setObject:v119 forKeyedSubscript:@"RxThroughputComparison"];

    uint64_t v120 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      id v121 = [v2 objectForKeyedSubscript:@"RxThroughputBeforeRecovery"];
      id v122 = [v121 integerValue];
      unsigned int v123 = [v2 objectForKeyedSubscript:@"RxThroughputAfterRecovery"];
      id v124 = [v123 integerValue];
      uint64_t v125 = [v2 objectForKeyedSubscript:@"RxThroughputComparison"];
      *(_DWORD *)buf = 136447234;
      id v318 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v319 = 1024;
      int v320 = 902;
      __int16 v321 = 2048;
      id v322 = v122;
      __int16 v323 = 2048;
      id v324 = v124;
      __int16 v325 = 2112;
      v326 = v125;
      _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:RxThroughput before:%ld after:%ld comparison:%@", buf, 0x30u);

      __int16 v46 = v24;
    }

    id v126 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 baselineThroughput]);
    [v2 setObject:v126 forKeyedSubscript:@"BaselineThroughputBeforeRecovery"];

    long long v127 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 baselineThroughput]);
    [v2 setObject:v127 forKeyedSubscript:@"BaselineThroughputAfterRecovery"];

    char v128 = *(void **)(a1 + 40);
    BOOL v129 = [v2 objectForKeyedSubscript:@"BaselineThroughputBeforeRecovery"];
    id v130 = [v129 integerValue];
    long long v131 = [v2 objectForKeyedSubscript:@"BaselineThroughputAfterRecovery"];
    id v132 = [v128 compareValues:v130 second:[v131 integerValue]];

    if ((unint64_t)v132 >= 3)
    {
      long long v133 = +[NSString stringWithFormat:@"(unknown: %lu)", v132];
    }
    else
    {
      long long v133 = *(&off_1000D1B70 + (void)v132);
    }
    [v2 setObject:v133 forKeyedSubscript:@"BaselineThroughputComparison"];

    long long v134 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
    {
      long long v135 = [v2 objectForKeyedSubscript:@"BaselineThroughputBeforeRecovery"];
      id v136 = [v135 integerValue];
      uint64_t v137 = [v2 objectForKeyedSubscript:@"BaselineThroughputAfterRecovery"];
      id v138 = [v137 integerValue];
      long long v139 = [v2 objectForKeyedSubscript:@"BaselineThroughputComparison"];
      *(_DWORD *)buf = 136447234;
      id v318 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v319 = 1024;
      int v320 = 908;
      __int16 v321 = 2048;
      id v322 = v136;
      __int16 v323 = 2048;
      id v324 = v138;
      __int16 v325 = 2112;
      v326 = v139;
      _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:BaselineThroughput before:%ld after:%ld comparison:%@", buf, 0x30u);

      __int16 v46 = v24;
    }

    uint64_t v140 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 testThroughput]);
    [v2 setObject:v140 forKeyedSubscript:@"TestThroughputBeforeRecovery"];

    long long v141 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 testThroughput]);
    [v2 setObject:v141 forKeyedSubscript:@"TestThroughputAfterRecovery"];

    long long v142 = *(void **)(a1 + 40);
    long long v143 = [v2 objectForKeyedSubscript:@"TestThroughputBeforeRecovery"];
    id v144 = [v143 integerValue];
    long long v145 = [v2 objectForKeyedSubscript:@"TestThroughputAfterRecovery"];
    id v146 = [v142 compareValues:v144 second:[v145 integerValue]];

    if ((unint64_t)v146 >= 3)
    {
      long long v147 = +[NSString stringWithFormat:@"(unknown: %lu)", v146];
    }
    else
    {
      long long v147 = *(&off_1000D1B70 + (void)v146);
    }
    [v2 setObject:v147 forKeyedSubscript:@"TestThroughputComparison"];

    long long v148 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
    {
      long long v149 = [v2 objectForKeyedSubscript:@"TestThroughputBeforeRecovery"];
      id v150 = [v149 integerValue];
      long long v151 = [v2 objectForKeyedSubscript:@"TestThroughputAfterRecovery"];
      id v152 = [v151 integerValue];
      long long v153 = [v2 objectForKeyedSubscript:@"TestThroughputComparison"];
      *(_DWORD *)buf = 136447234;
      id v318 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v319 = 1024;
      int v320 = 914;
      __int16 v321 = 2048;
      id v322 = v150;
      __int16 v323 = 2048;
      id v324 = v152;
      __int16 v325 = 2112;
      v326 = v153;
      _os_log_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:TestThroughput before:%ld after:%ld comparison:%@", buf, 0x30u);

      __int16 v46 = v24;
    }

    long long v154 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 txAMPDUDensity]);
    [v2 setObject:v154 forKeyedSubscript:@"TxAMPDUDensityBeforeRecovery"];

    long long v155 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 txAMPDUDensity]);
    [v2 setObject:v155 forKeyedSubscript:@"TxAMPDUDensityAfterRecovery"];

    long long v156 = *(void **)(a1 + 40);
    long long v157 = [v2 objectForKeyedSubscript:@"TxAMPDUDensityBeforeRecovery"];
    id v158 = [v157 integerValue];
    long long v159 = [v2 objectForKeyedSubscript:@"TxAMPDUDensityAfterRecovery"];
    id v160 = [v156 compareValues:v158 second:[v159 integerValue]];

    if ((unint64_t)v160 >= 3)
    {
      int v161 = +[NSString stringWithFormat:@"(unknown: %lu)", v160];
    }
    else
    {
      int v161 = *(&off_1000D1B70 + (void)v160);
    }
    [v2 setObject:v161 forKeyedSubscript:@"TxAMPDUDensityComparison"];

    __int16 v162 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
    {
      double v163 = [v2 objectForKeyedSubscript:@"TxAMPDUDensityBeforeRecovery"];
      id v164 = [v163 integerValue];
      double v165 = [v2 objectForKeyedSubscript:@"TxAMPDUDensityAfterRecovery"];
      id v166 = [v165 integerValue];
      uint64_t v167 = [v2 objectForKeyedSubscript:@"TxAMPDUDensityComparison"];
      *(_DWORD *)buf = 136447234;
      id v318 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v319 = 1024;
      int v320 = 920;
      __int16 v321 = 2048;
      id v322 = v164;
      __int16 v323 = 2048;
      id v324 = v166;
      __int16 v325 = 2112;
      v326 = v167;
      _os_log_impl((void *)&_mh_execute_header, v162, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:TxAMPDU before:%ld after:%ld comparison:%@", buf, 0x30u);

      __int16 v46 = v24;
    }

    [*(id *)(a1 + 40) computePercentage:((char *)objc_msgSend(v22, "rxFCSErrs") + (void)objc_msgSend(v22, "rxPLCPErrs")) denomenator:((char *)objc_msgSend(v22, "rxFCSErrs")+ (void)objc_msgSend(v22, "rxPLCPErrs")+ (unint64_t)objc_msgSend(v22, "rxGoodPlcps"))];
    __int16 v168 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v168 forKeyedSubscript:@"PhyErrPercentBeforeRecovery"];

    [*(id *)(a1 + 40) computePercentage:(char *)objc_msgSend(v46, "rxFCSErrs") + (void)objc_msgSend(v46, "rxPLCPErrs") denomenator:(char *)objc_msgSend(v46, "rxFCSErrs")+ (void)objc_msgSend(v46, "rxPLCPErrs")+ (unint64_t)objc_msgSend(v46, "rxGoodPlcps")];
    uint64_t v169 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v169 forKeyedSubscript:@"PhyErrPercentAfterRecovery"];

    id v170 = *(void **)(a1 + 40);
    CFStringRef v171 = [v2 objectForKeyedSubscript:@"PhyErrPercentBeforeRecovery"];
    id v172 = [v171 integerValue];
    __int16 v173 = [v2 objectForKeyedSubscript:@"PhyErrPercentBeforeRecovery"];
    id v174 = [v170 compareValues:v172 second:[v173 integerValue]];

    if ((unint64_t)v174 >= 3)
    {
      id v175 = +[NSString stringWithFormat:@"(unknown: %lu)", v174];
    }
    else
    {
      id v175 = *(&off_1000D1B70 + (void)v174);
    }
    [v2 setObject:v175 forKeyedSubscript:@"PhyErrPercentComparison"];

    [*(id *)(a1 + 40) computePercentage:objc_msgSend(v22, "txCompPkts") denomenator:objc_msgSend(v22, "txSubPkts")];
    id v176 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v176 forKeyedSubscript:@"CompletionPercentBeforeRecovery"];

    [*(id *)(a1 + 40) computePercentage:[v46 txCompPkts] denomenator:[v46 txSubPkts]];
    v177 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v177 forKeyedSubscript:@"CompletionPercentAfterRecovery"];

    id v178 = *(void **)(a1 + 40);
    v179 = [v2 objectForKeyedSubscript:@"CompletionPercentBeforeRecovery"];
    id v180 = [v179 integerValue];
    uint64_t v181 = [v2 objectForKeyedSubscript:@"CompletionPercentAfterRecovery"];
    id v182 = [v178 compareValues:v180 second:[v181 integerValue]];

    if ((unint64_t)v182 >= 3)
    {
      v183 = +[NSString stringWithFormat:@"(unknown: %lu)", v182];
    }
    else
    {
      v183 = *(&off_1000D1B70 + (void)v182);
    }
    [v2 setObject:v183 forKeyedSubscript:@"CompletionPercentComparison"];

    [*(id *)(a1 + 40) computePercentage:objc_msgSend(v22, "txRetries") denomenator:objc_msgSend(v22, "txFrames")];
    id v184 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v184 forKeyedSubscript:@"TxRetryPercentBeforeRecovery"];

    [*(id *)(a1 + 40) computePercentage:[v46 txRetries] denomenator:[v46 txFrames]];
    v185 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v185 forKeyedSubscript:@"TxRetryPercentAfterRecovery"];

    id v186 = *(void **)(a1 + 40);
    unsigned __int8 v187 = [v2 objectForKeyedSubscript:@"TxRetryPercentBeforeRecovery"];
    id v188 = [v187 integerValue];
    id v189 = [v2 objectForKeyedSubscript:@"TxRetryPercentAfterRecovery"];
    id v190 = [v186 compareValues:v188 second:[v189 integerValue]];

    if ((unint64_t)v190 >= 3)
    {
      int v191 = +[NSString stringWithFormat:@"(unknown: %lu)", v190];
    }
    else
    {
      int v191 = *(&off_1000D1B70 + (void)v190);
    }
    [v2 setObject:v191 forKeyedSubscript:@"TxRetryPercentComparison"];

    [*(id *)(a1 + 40) computePercentage:[v22 txFails] denomenator:[v22 txFrames]];
    int v192 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v192 forKeyedSubscript:@"TxFailPercentBeforeRecovery"];

    [*(id *)(a1 + 40) computePercentage:objc_msgSend(v46, "txFails") denomenator:objc_msgSend(v46, "txFrames")];
    uint64_t v193 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v193 forKeyedSubscript:@"TxFailPercentAfterRecovery"];

    v194 = *(void **)(a1 + 40);
    v195 = [v2 objectForKeyedSubscript:@"TxFailPercentBeforeRecovery"];
    id v196 = [v195 integerValue];
    id v197 = [v2 objectForKeyedSubscript:@"TxFailPercentAfterRecovery"];
    id v198 = [v194 compareValues:v196 second:[v197 integerValue]];

    if ((unint64_t)v198 >= 3)
    {
      uint64_t v199 = +[NSString stringWithFormat:@"(unknown: %lu)", v198];
    }
    else
    {
      uint64_t v199 = *(&off_1000D1B70 + (void)v198);
    }
    [v2 setObject:v199 forKeyedSubscript:@"TxFailPercentComparison"];

    uint64_t v200 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 rxOvflErrs]);
    [v2 setObject:v200 forKeyedSubscript:@"RxOvflErrsBeforeRecovery"];

    v201 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 rxOvflErrs]);
    [v2 setObject:v201 forKeyedSubscript:@"RxOvflErrsAfterRecovery"];

    uint64_t v202 = *(void **)(a1 + 40);
    dispatch_time_t v203 = [v2 objectForKeyedSubscript:@"RxOvflErrsBeforeRecovery"];
    id v204 = [v203 integerValue];
    v205 = [v2 objectForKeyedSubscript:@"RxOvflErrsAfterRecovery"];
    id v206 = [v202 compareValues:v204 second:[v205 integerValue]];

    if ((unint64_t)v206 >= 3)
    {
      dispatch_semaphore_t v207 = +[NSString stringWithFormat:@"(unknown: %lu)", v206];
    }
    else
    {
      dispatch_semaphore_t v207 = *(&off_1000D1B70 + (void)v206);
    }
    [v2 setObject:v207 forKeyedSubscript:@"RxOvflErrsComparison"];

    uint64_t v208 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 rxReplayErrs]);
    [v2 setObject:v208 forKeyedSubscript:@"RxReplayErrsBeforeRecovery"];

    v209 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 rxReplayErrs]);
    [v2 setObject:v209 forKeyedSubscript:@"RxReplayErrsAfterRecovery"];

    id v210 = *(void **)(a1 + 40);
    long long v211 = [v2 objectForKeyedSubscript:@"RxReplayErrsBeforeRecovery"];
    id v212 = [v211 integerValue];
    long long v213 = [v2 objectForKeyedSubscript:@"RxReplayErrsAfterRecovery"];
    id v214 = [v210 compareValues:v212 second:[v213 integerValue]];

    if ((unint64_t)v214 >= 3)
    {
      long long v215 = +[NSString stringWithFormat:@"(unknown: %lu)", v214];
    }
    else
    {
      long long v215 = *(&off_1000D1B70 + (void)v214);
    }
    [v2 setObject:v215 forKeyedSubscript:@"RxReplayErrsComparison"];

    id v216 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 rxDecryErrs]);
    [v2 setObject:v216 forKeyedSubscript:@"RxDecryErrsBeforeRecovery"];

    long long v217 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 rxDecryErrs]);
    [v2 setObject:v217 forKeyedSubscript:@"RxDecryErrsAfterRecovery"];

    double v218 = *(void **)(a1 + 40);
    double v219 = [v2 objectForKeyedSubscript:@"RxDecryErrsBeforeRecovery"];
    id v220 = [v219 integerValue];
    v221 = [v2 objectForKeyedSubscript:@"RxDecryErrsAfterRecovery"];
    id v222 = [v218 compareValues:v220 second:[v221 integerValue]];

    if ((unint64_t)v222 >= 3)
    {
      uint64_t v223 = +[NSString stringWithFormat:@"(unknown: %lu)", v222];
    }
    else
    {
      uint64_t v223 = *(&off_1000D1B70 + (void)v222);
    }
    [v2 setObject:v223 forKeyedSubscript:@"RxDecryErrsComparison"];

    double v224 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 rxCRSErrs]);
    [v2 setObject:v224 forKeyedSubscript:@"RxCRSErrsBeforeRecovery"];

    double v225 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 rxCRSErrs]);
    [v2 setObject:v225 forKeyedSubscript:@"RxCRSErrsAfterRecovery"];

    id v226 = *(void **)(a1 + 40);
    id v227 = [v2 objectForKeyedSubscript:@"RxCRSErrsBeforeRecovery"];
    id v228 = [v227 integerValue];
    uint64_t v229 = [v2 objectForKeyedSubscript:@"RxCRSErrsAfterRecovery"];
    id v230 = [v226 compareValues:v228 second:[v229 integerValue]];

    if ((unint64_t)v230 >= 3)
    {
      uint64_t v231 = +[NSString stringWithFormat:@"(unknown: %lu)", v230];
    }
    else
    {
      uint64_t v231 = *(&off_1000D1B70 + (void)v230);
    }
    [v2 setObject:v231 forKeyedSubscript:@"RxCRSErrsComparison"];

    char v232 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 txPhyRate]);
    [v2 setObject:v232 forKeyedSubscript:@"TxPhyRateBeforeRecovery"];

    char v233 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 txPhyRate]);
    [v2 setObject:v233 forKeyedSubscript:@"TxPhyRateAfterRecovery"];

    id v234 = *(void **)(a1 + 40);
    __int16 v235 = [v2 objectForKeyedSubscript:@"TxPhyRateBeforeRecovery"];
    id v236 = [v235 integerValue];
    __int16 v237 = [v2 objectForKeyedSubscript:@"TxPhyRateAfterRecovery"];
    id v238 = [v234 compareValues:v236 second:[v237 integerValue]];

    if ((unint64_t)v238 >= 3)
    {
      v239 = +[NSString stringWithFormat:@"(unknown: %lu)", v238];
    }
    else
    {
      v239 = *(&off_1000D1B70 + (void)v238);
    }
    [v2 setObject:v239 forKeyedSubscript:@"TxPhyRateComparison"];

    v240 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 rxPhyRate]);
    [v2 setObject:v240 forKeyedSubscript:@"RxPhyRateBeforeRecovery"];

    BOOL v241 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 rxPhyRate]);
    [v2 setObject:v241 forKeyedSubscript:@"RxPhyRateAfterRecovery"];

    v242 = *(void **)(a1 + 40);
    BOOL v243 = [v2 objectForKeyedSubscript:@"RxPhyRateBeforeRecovery"];
    id v244 = [v243 integerValue];
    v245 = [v2 objectForKeyedSubscript:@"RxPhyRateAfterRecovery"];
    id v246 = [v242 compareValues:v244 second:[v245 integerValue]];

    uint64_t v313 = a1;
    if ((unint64_t)v246 >= 3)
    {
      v247 = +[NSString stringWithFormat:@"(unknown: %lu)", v246];
    }
    else
    {
      v247 = *(&off_1000D1B70 + (void)v246);
    }
    [v2 setObject:v247 forKeyedSubscript:@"RxPhyRateComparison"];

    id v248 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 outputThroughput]);
    [v2 setObject:v248 forKeyedSubscript:@"OutputThroughputBeforeRecovery"];

    v249 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 outputThroughput]);
    [v2 setObject:v249 forKeyedSubscript:@"OutputThroughputAfterRecovery"];

    v250 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 inputThroughput]);
    [v2 setObject:v250 forKeyedSubscript:@"InputThroughputBeforeRecovery"];

    v251 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 inputThroughput]);
    [v2 setObject:v251 forKeyedSubscript:@"InputThroughputAfterRecovery"];

    char v252 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 expectedThroughput]);
    [v2 setObject:v252 forKeyedSubscript:@"ExpectedThroughputBeforeRecovery"];

    v253 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v46 expectedThroughput]);
    [v2 setObject:v253 forKeyedSubscript:@"ExpectedThroughputAfterRecovery"];

    BOOL v254 = [v2 objectForKeyedSubscript:@"OutputThroughputBeforeRecovery"];
    id v255 = v46;
    v256 = [v254 integerValue];
    uint64_t v257 = [v2 objectForKeyedSubscript:@"InputThroughputBeforeRecovery"];
    char v258 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v256 - (unsigned char *)[v257 integerValue]);
    [v2 setObject:v258 forKeyedSubscript:@"OutputInputThroughputDiffBeforeRecovery"];

    BOOL v259 = [v2 objectForKeyedSubscript:@"ExpectedThroughputBeforeRecovery"];
    id v260 = [v259 integerValue];
    v261 = [v2 objectForKeyedSubscript:@"OutputThroughputBeforeRecovery"];
    v262 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v260 - (unsigned char *)[v261 integerValue]);
    [v2 setObject:v262 forKeyedSubscript:@"ExpectedOutputThroughputDiffBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v22 rxDupErrs] denomenator:[v22 rxFrames]];
    BOOL v263 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v263 forKeyedSubscript:@"RxDupPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v22 rxRetries] denomenator:[v22 rxRetries]];
    v264 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v264 forKeyedSubscript:@"RxRetriesPercentBeforeRecovery"];

    unsigned int v265 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 timeSinceLastRecovery]);
    [v2 setObject:v265 forKeyedSubscript:@"TimeSinceLastSWRecovery"];

    id v266 = [v22 measurementDurMS];
    id v267 = [v255 measurementDurMS];
    [*(id *)(v313 + 40) computePercentage:[v22 maxQueueFullDurMS] denomenator:v266];
    v268 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v268 forKeyedSubscript:@"MaxQueueFullDurMSPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v255 maxQueueFullDurMS] denomenator:v267];
    v269 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v269 forKeyedSubscript:@"MaxQueueFullDurMSPercentAfterRecovery"];

    BOOL v270 = *(void **)(v313 + 40);
    v271 = [v2 objectForKeyedSubscript:@"MaxQueueFullDurMSPercentBeforeRecovery"];
    id v272 = [v271 integerValue];
    v273 = [v2 objectForKeyedSubscript:@"MaxQueueFullDurMSPercentAfterRecovery"];
    id v274 = [v270 compareValues:v272 second:[v273 integerValue]];

    if ((unint64_t)v274 >= 3)
    {
      uint64_t v275 = +[NSString stringWithFormat:@"(unknown: %lu)", v274];
    }
    else
    {
      uint64_t v275 = *(&off_1000D1B70 + (void)v274);
    }
    [v2 setObject:v275 forKeyedSubscript:@"MaxQueueFullDurMSPercentComparison"];

    v276 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v22 avgTxLatencyMS]);
    [v2 setObject:v276 forKeyedSubscript:@"AvgTxLatencyMSBeforeRecovery"];

    v277 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v316 avgTxLatencyMS]);
    [v2 setObject:v277 forKeyedSubscript:@"AvgTxLatencyMSAfterRecovery"];

    v278 = *(void **)(v313 + 40);
    v279 = [v2 objectForKeyedSubscript:@"AvgTxLatencyMSBeforeRecovery"];
    id v280 = [v279 integerValue];
    v281 = [v2 objectForKeyedSubscript:@"AvgTxLatencyMSAfterRecovery"];
    id v282 = [v278 compareValues:v280 second:[v281 integerValue]];

    if ((unint64_t)v282 >= 3)
    {
      char v283 = +[NSString stringWithFormat:@"(unknown: %lu)", v282];
    }
    else
    {
      char v283 = *(&off_1000D1B70 + (void)v282);
    }
    [v2 setObject:v283 forKeyedSubscript:@"AvgTxLatencyMSComparison"];

    [*(id *)(v313 + 40) computePercentage:[v22 rC1CoexDurationMS] denomenator:v266];
    v284 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v284 forKeyedSubscript:@"RC1CoexDurationMSPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v316 rC1CoexDurationMS] denomenator:v267];
    v285 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v285 forKeyedSubscript:@"RC1CoexDurationMSPercentAfterRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v22 rC2CoexDurationMS] denomenator:v266];
    BOOL v286 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v286 forKeyedSubscript:@"RC2CoexDurationMSPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v316 rC2CoexDurationMS] denomenator:v267];
    id v287 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v287 forKeyedSubscript:@"RC2CoexDurationMSPercentAfterRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v22 lTECoexDurationMS] denomenator:v266];
    v288 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v288 forKeyedSubscript:@"LTECoexDurationMSPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v316 lTECoexDurationMS] denomenator:v267];
    v289 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v289 forKeyedSubscript:@"LTECoexDurationMSPercentAfterRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v22 tVPMActiveDurationMS] denomenator:v266];
    id v290 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v290 forKeyedSubscript:@"TVPMActiveDurationMSPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v316 tVPMActiveDurationMS] denomenator:v267];
    id v291 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v291 forKeyedSubscript:@"TVPMActiveDurationMSPercentAfterRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v22 availWLANDurMS] denomenator:v266];
    v292 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v292 forKeyedSubscript:@"AvailWLANDurMSPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v316 availWLANDurMS] denomenator:v267];
    id v293 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v293 forKeyedSubscript:@"AvailWLANDurMSPercentAfterRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v22 availWLANRxDurMS] denomenator:v266];
    double v294 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v294 forKeyedSubscript:@"AvailWLANRxDurMSPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v316 availWLANRxDurMS] denomenator:v267];
    double v295 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v295 forKeyedSubscript:@"AvailWLANRxDurMSPercentAfterRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v22 availWLANTxDurMS] denomenator:v266];
    v296 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v296 forKeyedSubscript:@"AvailWLANTxDurMSPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v316 availWLANTxDurMS] denomenator:v267];
    v297 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v297 forKeyedSubscript:@"AvailWLANTxDurMSPercentAfterRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v22 concurrentIntDurMS] denomenator:v266];
    id v298 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v298 forKeyedSubscript:@"ConcurrentIntDurMSPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v316 concurrentIntDurMS] denomenator:v267];
    id v299 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v299 forKeyedSubscript:@"ConcurrentIntDurMSPercentAfterRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v22 phyTxActivityDurMS] denomenator:v266];
    id v300 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v300 forKeyedSubscript:@"PhyTxActivityDurMSPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v316 phyTxActivityDurMS] denomenator:v267];
    id v301 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v301 forKeyedSubscript:@"PhyTxActivityDurMSPercentAfterRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v22 phyRxActivityDurMS] denomenator:v266];
    id v302 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v302 forKeyedSubscript:@"PhyRxActivityDurMSPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v316 phyRxActivityDurMS] denomenator:v267];
    v303 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v303 forKeyedSubscript:@"PhyRxActivityDurMSPercentAfterRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v22 offChanDurMS] denomenator:v266];
    double v304 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v304 forKeyedSubscript:@"OffChanDurMSPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v316 offChanDurMS] denomenator:v267];
    double v305 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v305 forKeyedSubscript:@"OffChanDurMSPercentAfterRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v22 bTAntennaDurMS] denomenator:v266];
    id v306 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v306 forKeyedSubscript:@"BTAntennaDurMSPercentBeforeRecovery"];

    [*(id *)(v313 + 40) computePercentage:[v316 bTAntennaDurMS] denomenator:v267];
    id v307 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v2 setObject:v307 forKeyedSubscript:@"BTAntennaDurMSPercentAfterRecovery"];

    double v308 = v314;
    SEL v4 = v315;
  }
  else
  {
    double v308 = WALogCategoryDefaultHandle();
    if (os_log_type_enabled(v308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v318 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]_block_invoke";
      __int16 v319 = 1024;
      int v320 = 824;
      _os_log_impl((void *)&_mh_execute_header, v308, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating SW data to send to CA", buf, 0x12u);
    }
  }

  id v309 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v309, OS_LOG_TYPE_DEFAULT))
  {
    id v310 = [v2 count];
    *(_DWORD *)buf = 136446722;
    id v318 = "-[CADataTransformEngine transformAndSubmitSWMessageToCA:additionalInfo:timestamps:]_block_invoke";
    __int16 v319 = 1024;
    int v320 = 1038;
    __int16 v321 = 2048;
    id v322 = v310;
    _os_log_impl((void *)&_mh_execute_header, v309, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:SW metricDict fieldCount: %lu", buf, 0x1Cu);
  }

  id v311 = v2;
  return v311;
}

void sub_10007EA40(id a1)
{
  qword_1000F10B0 = objc_alloc_init(WAActivityManager);

  _objc_release_x1();
}

void sub_10007F0F0(uint64_t a1)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007F22C;
  v6[3] = &unk_1000D1BB0;
  v6[4] = *(void *)(a1 + 32);
  uint64_t v2 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v6 block:5.0];
  uint64_t v3 = *(void *)(a1 + 32);
  SEL v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  id v5 = WALogActivityManagerHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v8 = "-[WAActivityManager debugTimer]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 160;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:configured _periodicActiveListTimer", buf, 0x12u);
  }
}

void sub_10007F22C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 64);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007F2A0;
  block[3] = &unk_1000D0D98;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void sub_10007F2A0(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v2 = WALogActivityManagerHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    os_log_type_t v16 = "-[WAActivityManager debugTimer]_block_invoke_3";
    __int16 v17 = 1024;
    int v18 = 149;
    __int16 v19 = 2048;
    id v20 = [v1 count];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:activeTransactions %lu", buf, 0x1Cu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v1;
  SEL v4 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (int i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = WALogActivityManagerHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t description = os_transaction_get_description();
          *(_DWORD *)buf = 136446722;
          os_log_type_t v16 = "-[WAActivityManager debugTimer]_block_invoke";
          __int16 v17 = 1024;
          int v18 = 152;
          __int16 v19 = 2080;
          id v20 = (id)description;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:activeTransaction %s", buf, 0x1Cu);
        }
      }
      id v5 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

void sub_10007F560(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (!v2[2])
  {
    unsigned int v3 = [v2 debugTimerEnabled];
    uint64_t v2 = (void *)a1[4];
    if (v3)
    {
      [v2 debugTimer];
      uint64_t v2 = (void *)a1[4];
    }
  }
  if (!v2[9])
  {
    uint64_t v4 = +[NSDate now];
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v4;

    uint64_t v2 = (void *)a1[4];
  }
  uint64_t v7 = (void *)v2[1];
  if (v7 && [v7 isValid])
  {
    id v8 = WALogActivityManagerHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136446466;
      os_log_type_t v16 = "-[WAActivityManager osTransactionCreate:transaction:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 184;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:osTransactionCreate, timer was running, invalidating and freeing", (uint8_t *)&v15, 0x12u);
    }

    [*(id *)(a1[4] + 8) invalidate];
    uint64_t v9 = a1[4];
    long long v10 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = 0;
  }
  [*(id *)(a1[4] + 32) addObject:a1[5]];
  ++*(void *)(a1[4] + 72);
  long long v11 = WALogActivityManagerHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = a1[6];
    id v13 = [*(id *)(a1[4] + 32) count];
    uint64_t v14 = *(void *)(a1[4] + 72);
    int v15 = 136447234;
    os_log_type_t v16 = "-[WAActivityManager osTransactionCreate:transaction:]_block_invoke";
    __int16 v17 = 1024;
    int v18 = 192;
    __int16 v19 = 2080;
    uint64_t v20 = v12;
    __int16 v21 = 2048;
    id v22 = v13;
    __int16 v23 = 2048;
    uint64_t v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:osTransactionCreate %s, active count is now %lu, total started is now %lu", (uint8_t *)&v15, 0x30u);
  }
}

void sub_10007F8D0(void *a1)
{
  uint64_t v2 = WALogActivityManagerHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v19 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
    __int16 v20 = 1024;
    int v21 = 208;
    __int16 v22 = 2080;
    CFStringRef description = (const __CFString *)os_transaction_get_description();
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:osTransactionComplete %s", buf, 0x1Cu);
  }

  if (([*(id *)(a1[5] + 32) containsObject:a1[4]] & 1) == 0)
  {
    unsigned int v3 = WALogActivityManagerHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = os_transaction_get_description();
      CFStringRef v5 = (const __CFString *)[*(id *)(a1[5] + 32) count];
      *(_DWORD *)buf = 136446978;
      __int16 v19 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 211;
      __int16 v22 = 2080;
      CFStringRef description = (const __CFString *)v4;
      __int16 v24 = 2048;
      CFStringRef v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s::%d:osTransactionComplete %s, TRANSACTION NOT FOUND, active count before completing %lu", buf, 0x26u);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  [*(id *)(a1[5] + 32) removeObject:a1[4]];
  ++*(void *)(a1[5] + 88);
  if (![*(id *)(a1[5] + 32) count])
  {
    uint64_t v6 = +[NSUserDefaults standardUserDefaults];
    uint64_t v7 = [v6 persistentDomainForName:@"com.apple.wifianalyticsd"];

    id v8 = [v7 objectForKey:@"eager-exit-timeout"];
    if (v8)
    {
      uint64_t v9 = WALogActivityManagerHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        __int16 v19 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 224;
        __int16 v22 = 2112;
        CFStringRef description = @"com.apple.wifianalyticsd";
        __int16 v24 = 2112;
        CFStringRef v25 = @"eager-exit-timeout";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Found preference value in domain: %@ key: %@", buf, 0x26u);
      }

      int v10 = [v8 intValue];
      if (v10 < 1)
      {
        os_log_type_t v16 = WALogActivityManagerHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          __int16 v19 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
          __int16 v20 = 1024;
          int v21 = 263;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_active_transactions empty, eager exit timer disabled via defaults write", buf, 0x12u);
        }

        goto LABEL_26;
      }
      double v11 = (double)v10;
    }
    else
    {
      double v11 = 300.0;
    }
    uint64_t v12 = *(void *)(a1[5] + 8);
    id v13 = WALogActivityManagerHandle();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_DWORD *)buf = 136446722;
        __int16 v19 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 232;
        __int16 v22 = 2048;
        CFStringRef description = *(const __CFString **)&v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_active_transactions empty, extending running eager exit timer to %f seconds", buf, 0x1Cu);
      }

      if ([*(id *)(a1[5] + 8) isValid]) {
        [*(id *)(a1[5] + 8) invalidate];
      }
      uint64_t v15 = a1[5];
      id v13 = *(NSObject **)(v15 + 8);
      *(void *)(v15 + 8) = 0;
    }
    else if (v14)
    {
      *(_DWORD *)buf = 136446722;
      __int16 v19 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 230;
      __int16 v22 = 2048;
      CFStringRef description = *(const __CFString **)&v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:_active_transactions empty, configuring eager exit timer in %f seconds", buf, 0x1Cu);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10007FD68;
    v17[3] = &unk_1000D16A8;
    void v17[4] = a1[5];
    *(double *)&v17[5] = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);
LABEL_26:
  }
}

void sub_10007FD68(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007FE0C;
  v6[3] = &unk_1000D1C00;
  v6[4] = *(void *)(a1 + 32);
  void v6[5] = v2;
  uint64_t v3 = +[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6);
  uint64_t v4 = *(void *)(a1 + 32);
  CFStringRef v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;
}

void sub_10007FE0C(uint64_t a1)
{
  uint64_t v2 = WALogActivityManagerHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 88);
    [*(id *)(v3 + 80) timeIntervalSinceNow];
    int v10 = 136446978;
    double v11 = "-[WAActivityManager osTransactionComplete:]_block_invoke_2";
    __int16 v12 = 1024;
    int v13 = 242;
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    __int16 v16 = 2048;
    double v17 = -v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Completed %lu transactions within uptime of %f seconds", (uint8_t *)&v10, 0x26u);
  }

  uint64_t v6 = WALogActivityManagerHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v10 = 136446722;
    double v11 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 247;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Attempting Daemon Eager Exit due to inactivity timeout of %f seconds", (uint8_t *)&v10, 0x1Cu);
  }

  [*(id *)(a1 + 32) _executeBeforePossibleEagerExit];
  id v8 = [*(id *)(a1 + 32) alternateExecutionBlockForCleanExit];

  if (v8)
  {
    [*(id *)(a1 + 32) _executeTimerBlock];
  }
  else if ((xpc_transaction_try_exit_clean() & 1) == 0)
  {
    uint64_t v9 = WALogActivityManagerHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446466;
      double v11 = "-[WAActivityManager osTransactionComplete:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 254;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Cannot eager exit, still outstanding transactions", (uint8_t *)&v10, 0x12u);
    }
  }
}

id sub_1000801AC(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 32) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  getpid();
  int v4 = sandbox_check();
  double v5 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v4 == 0;
    uint64_t v7 = +[NSProcessInfo processInfo];
    unsigned int v8 = [v7 processIdentifier];
    if (v6) {
      CFStringRef v9 = @"NO";
    }
    else {
      CFStringRef v9 = @"YES";
    }
    int v10 = +[NSProcessInfo processInfo];
    double v11 = [v10 processName];
    *(_DWORD *)buf = 136447490;
    *(void *)&uint8_t buf[4] = "int main(int, const char **)";
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 116;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v8;
    *(_WORD *)unsigned __int8 v33 = 2112;
    *(void *)&v33[2] = v9;
    *(_WORD *)&v33[10] = 2112;
    *(void *)&v33[12] = v11;
    *(_WORD *)&v33[20] = 2080;
    *(void *)&v33[22] = "WiFiAnalytics_executables-680.21 Nov 14 2024 22:56:54";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:STARTUP (%d) isSandboxed: %@ -- %@ version: %s", buf, 0x36u);
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  *(void *)unsigned __int8 v33 = sub_100080764;
  *(void *)&v33[8] = sub_100080774;
  *(void *)&v33[16] = 0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  id v31[2] = sub_10008077C;
  v31[3] = &unk_1000D1010;
  v31[4] = buf;
  __int16 v12 = objc_retainBlock(v31);
  id v13 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100080970;
  handler[3] = &unk_1000D1C50;
  __int16 v14 = v12;
  id v30 = v14;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100080A5C;
  v27[3] = &unk_1000D1C50;
  uint64_t v15 = v14;
  id v28 = v15;
  xpc_set_event_stream_handler("com.apple.awd.launch.wifi", (dispatch_queue_t)&_dispatch_main_q, v27);

  __int16 v16 = objc_alloc_init(WAEngine);
  v26.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(void *)&v26.sa_mask = 0;
  sigaction(15, &v26, 0);
  dispatch_source_t v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  int v18 = (void *)qword_1000F10B8;
  qword_1000F10B8 = (uint64_t)v17;

  __int16 v19 = qword_1000F10B8;
  if (qword_1000F10B8)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100080B48;
    v23[3] = &unk_1000D0D98;
    __int16 v20 = v16;
    __int16 v24 = v20;
    dispatch_source_set_event_handler(v19, v23);
    dispatch_resume((dispatch_object_t)qword_1000F10B8);
    [(WAEngine *)v20 run];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)CFStringRef v25 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "FAILED to setup SIGTERM catcher", v25, 2u);
  }

  _Block_object_dispose(buf, 8);
  if (v19)
  {
    int v21 = +[NSRunLoop currentRunLoop];
    [v21 run];
  }
  return 0;
}

void sub_100080740(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100080764(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100080774(uint64_t a1)
{
}

void sub_10008077C(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v2 = os_transaction_create();
    uint64_t v3 = +[WAActivityManager sharedActivityManager];
    [v3 osTransactionCreate:"com.apple.wifianalytics.keepalive" transaction:v2];

    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    double v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v2;

    dispatch_time_t v6 = dispatch_time(0, 30000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100080878;
    block[3] = &unk_1000D1010;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100080878(uint64_t a1)
{
  uint64_t v2 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    uint64_t v7 = "int main(int, const char **)_block_invoke_2";
    __int16 v8 = 1024;
    int v9 = 123;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Transaction hold expired", (uint8_t *)&v6, 0x12u);
  }

  uint64_t v3 = +[WAActivityManager sharedActivityManager];
  [v3 osTransactionComplete:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

uint64_t sub_100080970(uint64_t a1)
{
  uint64_t v2 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446978;
    double v5 = "int main(int, const char **)_block_invoke";
    __int16 v6 = 1024;
    int v7 = 131;
    __int16 v8 = 2080;
    int v9 = "com.apple.notifyd.matching";
    __int16 v10 = 1024;
    int v11 = 30;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Wake notify received (%s), staying dirty (holding a transsaction) for %d seconds", (uint8_t *)&v4, 0x22u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100080A5C(uint64_t a1)
{
  uint64_t v2 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446978;
    double v5 = "int main(int, const char **)_block_invoke";
    __int16 v6 = 1024;
    int v7 = 135;
    __int16 v8 = 2080;
    int v9 = "com.apple.awd.launch.wifi";
    __int16 v10 = 1024;
    int v11 = 30;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Wake notify received (%s), staying dirty (holding a transsaction) for %d seconds", (uint8_t *)&v4, 0x22u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100080B48(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (!v1) {
    exit(1);
  }

  return [v1 prepareToTerminateAnyReply:&stru_1000D1C90];
}

void sub_100080B84(id a1, id a2, NSError *a3)
{
  id v4 = a2;
  double v5 = a3;
  __int16 v6 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136446466;
    __int16 v8 = "int main(int, const char **)_block_invoke_2";
    __int16 v9 = 1024;
    int v10 = 156;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Now exit(143)", (uint8_t *)&v7, 0x12u);
  }

  exit(143);
}

void sub_100081708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100081D50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 136447234;
    __int16 v8 = "-[WADatapathDiagnosticsMessageSubmitter submitSlowWiFiMessage:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 139;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:[WiFi Slow WiFi - %@ %@] ABC snapshot response = %@", (uint8_t *)&v7, 0x30u);
  }
}

void sub_100082C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100082CD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100082CE0(uint64_t a1)
{
}

void sub_100082CE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v7 = 136447234;
    __int16 v8 = "-[WADatapathDiagnosticsMessageSubmitter submitDPEMessage:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 369;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:[WiFi DatapathStall - %@ %@] ABC snapshot response = %@", (uint8_t *)&v7, 0x30u);
  }
}

void sub_100087388(_Unwind_Exception *a1)
{
}

void sub_10008748C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WALogCategoryDefaultHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v7 = 136447234;
    __int16 v8 = "-[WADatapathDiagnosticsMessageSubmitter submitDPSRMessage:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 1030;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}s::%d:[WiFi DatapathStall - %@ %@] ABC snapshot response = %@", (uint8_t *)&v7, 0x30u);
  }
}

Class sub_1000875E4(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000F10D0)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100087738;
    v4[4] = &unk_1000D0CF8;
    v4[5] = v4;
    long long v5 = off_1000D1D00;
    uint64_t v6 = 0;
    qword_1000F10D0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1000F10D0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SDRDiagnosticReporter");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_1000F10C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100087738()
{
  uint64_t result = _sl_dlopen();
  qword_1000F10D0 = result;
  return result;
}

void sub_100089D70(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[WiFiStallDetect alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10008A068(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    uint64_t v6 = [WiFiStallDetectOutput alloc];
    int v7 = [v14 featureValueForName:@"stall"];
    id v8 = [v7 int64Value];
    __int16 v9 = [v14 featureValueForName:@"stallProbability"];
    int v10 = [v9 dictionaryValue];
    __int16 v11 = [(WiFiStallDetectOutput *)v6 initWithStall:v8 stallProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    __int16 v13 = *(void (**)(uint64_t, void, WiFiStallDetectOutput *))(v12 + 16);
    __int16 v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_10008A270(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    uint64_t v6 = [WiFiStallDetectOutput alloc];
    int v7 = [v14 featureValueForName:@"stall"];
    id v8 = [v7 int64Value];
    __int16 v9 = [v14 featureValueForName:@"stallProbability"];
    int v10 = [v9 dictionaryValue];
    __int16 v11 = [(WiFiStallDetectOutput *)v6 initWithStall:v8 stallProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    __int16 v13 = *(void (**)(uint64_t, void, WiFiStallDetectOutput *))(v12 + 16);
    __int16 v11 = a3;
    v13(v12, 0, v11);
  }
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t Apple80211BindToInterface()
{
  return _Apple80211BindToInterface();
}

uint64_t Apple80211Close()
{
  return _Apple80211Close();
}

uint64_t Apple80211ErrToStr()
{
  return _Apple80211ErrToStr();
}

uint64_t Apple80211Get()
{
  return _Apple80211Get();
}

uint64_t Apple80211GetIOReportingService()
{
  return _Apple80211GetIOReportingService();
}

uint64_t Apple80211GetIfListCopy()
{
  return _Apple80211GetIfListCopy();
}

uint64_t Apple80211GetInterfaceNameCopy()
{
  return _Apple80211GetInterfaceNameCopy();
}

uint64_t Apple80211GetVirtualIfListCopy()
{
  return _Apple80211GetVirtualIfListCopy();
}

uint64_t Apple80211Open()
{
  return _Apple80211Open();
}

uint64_t Apple80211Set()
{
  return _Apple80211Set();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCrypt(op, alg, options, key, keyLength, iv, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return _CCCryptorGCMOneshotDecrypt();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return _CCCryptorGCMOneshotEncrypt();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return _CCRandomGenerateBytes(bytes, count);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return _CFAllocatorGetDefault();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return _CFMakeCollectable(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CFTypeRef IOCFUnserializeWithSize(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return _IOCFUnserializeWithSize(buffer, bufferSize, allocator, options, errorString);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IORegistryEntryGetPath(io_registry_entry_t entry, const io_name_t plane, io_string_t path)
{
  return _IORegistryEntryGetPath(entry, plane, path);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

uint64_t IOReportChannelGetChannelID()
{
  return _IOReportChannelGetChannelID();
}

uint64_t IOReportChannelGetChannelName()
{
  return _IOReportChannelGetChannelName();
}

uint64_t IOReportChannelGetDriverName()
{
  return _IOReportChannelGetDriverName();
}

uint64_t IOReportChannelGetGroup()
{
  return _IOReportChannelGetGroup();
}

uint64_t IOReportChannelGetSubGroup()
{
  return _IOReportChannelGetSubGroup();
}

uint64_t IOReportChannelGetUnit()
{
  return _IOReportChannelGetUnit();
}

uint64_t IOReportChannelGetUnitLabel()
{
  return _IOReportChannelGetUnitLabel();
}

uint64_t IOReportCopyChannelsForDriver()
{
  return _IOReportCopyChannelsForDriver();
}

uint64_t IOReportCopyDriverName()
{
  return _IOReportCopyDriverName();
}

uint64_t IOReportCreateAggregate()
{
  return _IOReportCreateAggregate();
}

uint64_t IOReportCreateSamples()
{
  return _IOReportCreateSamples();
}

uint64_t IOReportCreateSubscription()
{
  return _IOReportCreateSubscription();
}

uint64_t IOReportGetChannelCount()
{
  return _IOReportGetChannelCount();
}

uint64_t IOReportHistogramGetBucketBounds()
{
  return _IOReportHistogramGetBucketBounds();
}

uint64_t IOReportHistogramGetBucketCount()
{
  return _IOReportHistogramGetBucketCount();
}

uint64_t IOReportHistogramGetBucketHits()
{
  return _IOReportHistogramGetBucketHits();
}

uint64_t IOReportIterate()
{
  return _IOReportIterate();
}

uint64_t IOReportMergeChannels()
{
  return _IOReportMergeChannels();
}

uint64_t IOReportScaleValue()
{
  return _IOReportScaleValue();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return _IOReportSimpleGetIntegerValue();
}

uint64_t IOReportStateGetCount()
{
  return _IOReportStateGetCount();
}

uint64_t IOReportStateGetNameForIndex()
{
  return _IOReportStateGetNameForIndex();
}

uint64_t IOReportStateGetResidency()
{
  return _IOReportStateGetResidency();
}

uint64_t IOReportUpdateSamples()
{
  return _IOReportUpdateSamples();
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetProductType()
{
  return _MGGetProductType();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t OSAWriteLogForSubmission()
{
  return _OSAWriteLogForSubmission();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkServiceEntity(allocator, domain, serviceID, entity);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

uint64_t WAXPCRequestDelegateInterface()
{
  return _WAXPCRequestDelegateInterface();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
}

uint64_t std::operator+<char>()
{
  return std::operator+<char>();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return _dispatch_source_testcancel(source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

int inet_aton(const char *a1, in_addr *a2)
{
  return _inet_aton(a1, a2);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint64_t managed_event_fetch()
{
  return _managed_event_fetch();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_transaction_get_description()
{
  return _os_transaction_get_description();
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

uint64_t sandbox_check()
{
  return _sandbox_check();
}

SEL sel_registerName(const char *str)
{
  return _sel_registerName(str);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return _sigaction(a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return _sqlite3_close_v2(a1);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return _strlcat(__dst, __source, __size);
}

uint64_t symptom_framework_init()
{
  return _symptom_framework_init();
}

uint64_t symptom_new()
{
  return _symptom_new();
}

uint64_t symptom_send()
{
  return _symptom_send();
}

uint64_t symptom_set_additional_qualifier()
{
  return _symptom_set_additional_qualifier();
}

uint64_t symptom_set_qualifier()
{
  return _symptom_set_qualifier();
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_transaction_try_exit_clean()
{
  return _xpc_transaction_try_exit_clean();
}

id objc_msgSend_DatapathMetricGetter(void *a1, const char *a2, ...)
{
  return [a1 DatapathMetricGetter];
}

id objc_msgSend_IPv4Addresses(void *a1, const char *a2, ...)
{
  return [a1 IPv4Addresses];
}

id objc_msgSend_IPv4SubnetMasks(void *a1, const char *a2, ...)
{
  return [a1 IPv4SubnetMasks];
}

id objc_msgSend_IPv6Addresses(void *a1, const char *a2, ...)
{
  return [a1 IPv6Addresses];
}

id objc_msgSend_IPv6PrefixLengths(void *a1, const char *a2, ...)
{
  return [a1 IPv6PrefixLengths];
}

id objc_msgSend_URLOfModelInThisBundle(void *a1, const char *a2, ...)
{
  return [a1 URLOfModelInThisBundle];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__DPSQuickRecoveryEngineObj(void *a1, const char *a2, ...)
{
  return [a1 _DPSQuickRecoveryEngineObj];
}

id objc_msgSend__calculateEstimatedUptime(void *a1, const char *a2, ...)
{
  return [a1 _calculateEstimatedUptime];
}

id objc_msgSend__calculateProcessUsage(void *a1, const char *a2, ...)
{
  return [a1 _calculateProcessUsage];
}

id objc_msgSend__calculateProfileUptime(void *a1, const char *a2, ...)
{
  return [a1 _calculateProfileUptime];
}

id objc_msgSend__cancelDelayedInvocationForPersist(void *a1, const char *a2, ...)
{
  return [a1 _cancelDelayedInvocationForPersist];
}

id objc_msgSend__clearIOReporterCache(void *a1, const char *a2, ...)
{
  return [a1 _clearIOReporterCache];
}

id objc_msgSend__createNextWorkReportSnapshot(void *a1, const char *a2, ...)
{
  return [a1 _createNextWorkReportSnapshot];
}

id objc_msgSend__createWorkReportDictionaryForTelemetryAndRollBucket(void *a1, const char *a2, ...)
{
  return [a1 _createWorkReportDictionaryForTelemetryAndRollBucket];
}

id objc_msgSend__delayedInvocationForPersist(void *a1, const char *a2, ...)
{
  return [a1 _delayedInvocationForPersist];
}

id objc_msgSend__delayedInvocationForRescan(void *a1, const char *a2, ...)
{
  return [a1 _delayedInvocationForRescan];
}

id objc_msgSend__enableWorkReportRecurringTimer(void *a1, const char *a2, ...)
{
  return [a1 _enableWorkReportRecurringTimer];
}

id objc_msgSend__executeBeforePossibleEagerExit(void *a1, const char *a2, ...)
{
  return [a1 _executeBeforePossibleEagerExit];
}

id objc_msgSend__executeTimerBlock(void *a1, const char *a2, ...)
{
  return [a1 _executeTimerBlock];
}

id objc_msgSend__freeIORCaches(void *a1, const char *a2, ...)
{
  return [a1 _freeIORCaches];
}

id objc_msgSend__getBasePersistenceKeychainQuery(void *a1, const char *a2, ...)
{
  return [a1 _getBasePersistenceKeychainQuery];
}

id objc_msgSend__getCCPipeDriverForWLAN(void *a1, const char *a2, ...)
{
  return [a1 _getCCPipeDriverForWLAN];
}

id objc_msgSend__getCachedUsage(void *a1, const char *a2, ...)
{
  return [a1 _getCachedUsage];
}

id objc_msgSend__getDeviceAnalyticsConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _getDeviceAnalyticsConfiguration];
}

id objc_msgSend__getInfraApple80211(void *a1, const char *a2, ...)
{
  return [a1 _getInfraApple80211];
}

id objc_msgSend__getObscureKey(void *a1, const char *a2, ...)
{
  return [a1 _getObscureKey];
}

id objc_msgSend__handleUnpersistForUsageData(void *a1, const char *a2, ...)
{
  return [a1 _handleUnpersistForUsageData];
}

id objc_msgSend__isDPSQuickRecoveryEngineUsed(void *a1, const char *a2, ...)
{
  return [a1 _isDPSQuickRecoveryEngineUsed];
}

id objc_msgSend__persist(void *a1, const char *a2, ...)
{
  return [a1 _persist];
}

id objc_msgSend__prepareToTerminate(void *a1, const char *a2, ...)
{
  return [a1 _prepareToTerminate];
}

id objc_msgSend__prepareToTerminateViaEagerExit(void *a1, const char *a2, ...)
{
  return [a1 _prepareToTerminateViaEagerExit];
}

id objc_msgSend__purgeIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _purgeIfNecessary];
}

id objc_msgSend__removeIORChannelsPersistenceFiles(void *a1, const char *a2, ...)
{
  return [a1 _removeIORChannelsPersistenceFiles];
}

id objc_msgSend__removePersistenceFile(void *a1, const char *a2, ...)
{
  return [a1 _removePersistenceFile];
}

id objc_msgSend__reportWorkReportInterval(void *a1, const char *a2, ...)
{
  return [a1 _reportWorkReportInterval];
}

id objc_msgSend__rotateObscureKey(void *a1, const char *a2, ...)
{
  return [a1 _rotateObscureKey];
}

id objc_msgSend__runIOLegendTest(void *a1, const char *a2, ...)
{
  return [a1 _runIOLegendTest];
}

id objc_msgSend__signalPotentialNewIORChannels(void *a1, const char *a2, ...)
{
  return [a1 _signalPotentialNewIORChannels];
}

id objc_msgSend__unpersistIORObjects(void *a1, const char *a2, ...)
{
  return [a1 _unpersistIORObjects];
}

id objc_msgSend_aPTxDataStall(void *a1, const char *a2, ...)
{
  return [a1 aPTxDataStall];
}

id objc_msgSend_ac(void *a1, const char *a2, ...)
{
  return [a1 ac];
}

id objc_msgSend_acCompletions(void *a1, const char *a2, ...)
{
  return [a1 acCompletions];
}

id objc_msgSend_acCompletionsCount(void *a1, const char *a2, ...)
{
  return [a1 acCompletionsCount];
}

id objc_msgSend_accessPointInfosCount(void *a1, const char *a2, ...)
{
  return [a1 accessPointInfosCount];
}

id objc_msgSend_accessPointOUI(void *a1, const char *a2, ...)
{
  return [a1 accessPointOUI];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_actionField(void *a1, const char *a2, ...)
{
  return [a1 actionField];
}

id objc_msgSend_addNumRecommendedCapture(void *a1, const char *a2, ...)
{
  return [a1 addNumRecommendedCapture];
}

id objc_msgSend_addNumRecommendedScreenOffQuickRecoveryWD(void *a1, const char *a2, ...)
{
  return [a1 addNumRecommendedScreenOffQuickRecoveryWD];
}

id objc_msgSend_addNumRecommendedScreenOnQuickRecoveryWD(void *a1, const char *a2, ...)
{
  return [a1 addNumRecommendedScreenOnQuickRecoveryWD];
}

id objc_msgSend_addNumRecommendedWD(void *a1, const char *a2, ...)
{
  return [a1 addNumRecommendedWD];
}

id objc_msgSend_addNumSuppressedCapture(void *a1, const char *a2, ...)
{
  return [a1 addNumSuppressedCapture];
}

id objc_msgSend_addNumSuppressedScreenOffQuickRecoveryWD(void *a1, const char *a2, ...)
{
  return [a1 addNumSuppressedScreenOffQuickRecoveryWD];
}

id objc_msgSend_addNumSuppressedScreenOnQuickRecoveryWD(void *a1, const char *a2, ...)
{
  return [a1 addNumSuppressedScreenOnQuickRecoveryWD];
}

id objc_msgSend_addNumSuppressedWD(void *a1, const char *a2, ...)
{
  return [a1 addNumSuppressedWD];
}

id objc_msgSend_aggregateMetrics(void *a1, const char *a2, ...)
{
  return [a1 aggregateMetrics];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_alternateExecutionBlockForCleanExit(void *a1, const char *a2, ...)
{
  return [a1 alternateExecutionBlockForCleanExit];
}

id objc_msgSend_analyticsAgeOutTimeIntervalSecs(void *a1, const char *a2, ...)
{
  return [a1 analyticsAgeOutTimeIntervalSecs];
}

id objc_msgSend_analyticsProcessingTimeIntervalSecs(void *a1, const char *a2, ...)
{
  return [a1 analyticsProcessingTimeIntervalSecs];
}

id objc_msgSend_analyticsProcessor(void *a1, const char *a2, ...)
{
  return [a1 analyticsProcessor];
}

id objc_msgSend_analyticsProcessorIsReady(void *a1, const char *a2, ...)
{
  return [a1 analyticsProcessorIsReady];
}

id objc_msgSend_apple80211Ref(void *a1, const char *a2, ...)
{
  return [a1 apple80211Ref];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_associationChanges(void *a1, const char *a2, ...)
{
  return [a1 associationChanges];
}

id objc_msgSend_associationChangesCount(void *a1, const char *a2, ...)
{
  return [a1 associationChangesCount];
}

id objc_msgSend_availWLANDurMS(void *a1, const char *a2, ...)
{
  return [a1 availWLANDurMS];
}

id objc_msgSend_availWLANRxDurMS(void *a1, const char *a2, ...)
{
  return [a1 availWLANRxDurMS];
}

id objc_msgSend_availWLANTxDurMS(void *a1, const char *a2, ...)
{
  return [a1 availWLANTxDurMS];
}

id objc_msgSend_avgTxLatencyMS(void *a1, const char *a2, ...)
{
  return [a1 avgTxLatencyMS];
}

id objc_msgSend_awdReport(void *a1, const char *a2, ...)
{
  return [a1 awdReport];
}

id objc_msgSend_awdlSnapshot(void *a1, const char *a2, ...)
{
  return [a1 awdlSnapshot];
}

id objc_msgSend_bTAntennaDurMS(void *a1, const char *a2, ...)
{
  return [a1 bTAntennaDurMS];
}

id objc_msgSend_baselineThroughput(void *a1, const char *a2, ...)
{
  return [a1 baselineThroughput];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_btCoex(void *a1, const char *a2, ...)
{
  return [a1 btCoex];
}

id objc_msgSend_btSnapshot(void *a1, const char *a2, ...)
{
  return [a1 btSnapshot];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_bytesValue(void *a1, const char *a2, ...)
{
  return [a1 bytesValue];
}

id objc_msgSend_cCA(void *a1, const char *a2, ...)
{
  return [a1 cCA];
}

id objc_msgSend_cachedChannelsCountPerIORPopulatable(void *a1, const char *a2, ...)
{
  return [a1 cachedChannelsCountPerIORPopulatable];
}

id objc_msgSend_cachedIOPopAvailableChannels(void *a1, const char *a2, ...)
{
  return [a1 cachedIOPopAvailableChannels];
}

id objc_msgSend_cachedIOReportSample(void *a1, const char *a2, ...)
{
  return [a1 cachedIOReportSample];
}

id objc_msgSend_cachedIOReportSubbedChannels(void *a1, const char *a2, ...)
{
  return [a1 cachedIOReportSubbedChannels];
}

id objc_msgSend_cachedModelObjectsKeyToMessageMap(void *a1, const char *a2, ...)
{
  return [a1 cachedModelObjectsKeyToMessageMap];
}

id objc_msgSend_cachedPredicatesNotYetFound(void *a1, const char *a2, ...)
{
  return [a1 cachedPredicatesNotYetFound];
}

id objc_msgSend_cachedUsage(void *a1, const char *a2, ...)
{
  return [a1 cachedUsage];
}

id objc_msgSend_canCaptureforDPS(void *a1, const char *a2, ...)
{
  return [a1 canCaptureforDPS];
}

id objc_msgSend_canWDforDPS(void *a1, const char *a2, ...)
{
  return [a1 canWDforDPS];
}

id objc_msgSend_ccaValue(void *a1, const char *a2, ...)
{
  return [a1 ccaValue];
}

id objc_msgSend_ccas(void *a1, const char *a2, ...)
{
  return [a1 ccas];
}

id objc_msgSend_ccasCount(void *a1, const char *a2, ...)
{
  return [a1 ccasCount];
}

id objc_msgSend_changedChannel(void *a1, const char *a2, ...)
{
  return [a1 changedChannel];
}

id objc_msgSend_changedDNSPrimary(void *a1, const char *a2, ...)
{
  return [a1 changedDNSPrimary];
}

id objc_msgSend_changedMAC(void *a1, const char *a2, ...)
{
  return [a1 changedMAC];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_channelBandwidth(void *a1, const char *a2, ...)
{
  return [a1 channelBandwidth];
}

id objc_msgSend_channelsVisited0(void *a1, const char *a2, ...)
{
  return [a1 channelsVisited0];
}

id objc_msgSend_channelsVisited1(void *a1, const char *a2, ...)
{
  return [a1 channelsVisited1];
}

id objc_msgSend_checkForPriorityNetwork(void *a1, const char *a2, ...)
{
  return [a1 checkForPriorityNetwork];
}

id objc_msgSend_chipModeError(void *a1, const char *a2, ...)
{
  return [a1 chipModeError];
}

id objc_msgSend_chipmodeerror(void *a1, const char *a2, ...)
{
  return [a1 chipmodeerror];
}

id objc_msgSend_clearDnsStudyVariables(void *a1, const char *a2, ...)
{
  return [a1 clearDnsStudyVariables];
}

id objc_msgSend_clearMessageStore(void *a1, const char *a2, ...)
{
  return [a1 clearMessageStore];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completions(void *a1, const char *a2, ...)
{
  return [a1 completions];
}

id objc_msgSend_concurrentIntDurMS(void *a1, const char *a2, ...)
{
  return [a1 concurrentIntDurMS];
}

id objc_msgSend_configType(void *a1, const char *a2, ...)
{
  return [a1 configType];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_controllerStats(void *a1, const char *a2, ...)
{
  return [a1 controllerStats];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createAndStartJsonReaderTimer(void *a1, const char *a2, ...)
{
  return [a1 createAndStartJsonReaderTimer];
}

id objc_msgSend_currentBSSIDandSSID(void *a1, const char *a2, ...)
{
  return [a1 currentBSSIDandSSID];
}

id objc_msgSend_currentKnownNetworkProfile(void *a1, const char *a2, ...)
{
  return [a1 currentKnownNetworkProfile];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_datapathMetricStream(void *a1, const char *a2, ...)
{
  return [a1 datapathMetricStream];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dbDelegate(void *a1, const char *a2, ...)
{
  return [a1 dbDelegate];
}

id objc_msgSend_debugTimer(void *a1, const char *a2, ...)
{
  return [a1 debugTimer];
}

id objc_msgSend_debugTimerEnabled(void *a1, const char *a2, ...)
{
  return [a1 debugTimerEnabled];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deploymentMetricDiffDays(void *a1, const char *a2, ...)
{
  return [a1 deploymentMetricDiffDays];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_determineChannelsPerIORPopulatable(void *a1, const char *a2, ...)
{
  return [a1 determineChannelsPerIORPopulatable];
}

id objc_msgSend_determineChannelsPerIORPopulatableWithinPopulatorBlock(void *a1, const char *a2, ...)
{
  return [a1 determineChannelsPerIORPopulatableWithinPopulatorBlock];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return [a1 dictionaryValue];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_dnsStudyInProgress(void *a1, const char *a2, ...)
{
  return [a1 dnsStudyInProgress];
}

id objc_msgSend_dnsStudyTransaction(void *a1, const char *a2, ...)
{
  return [a1 dnsStudyTransaction];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dpsCounterSamples(void *a1, const char *a2, ...)
{
  return [a1 dpsCounterSamples];
}

id objc_msgSend_dpsCounterSamplesCount(void *a1, const char *a2, ...)
{
  return [a1 dpsCounterSamplesCount];
}

id objc_msgSend_dpsEpiloge(void *a1, const char *a2, ...)
{
  return [a1 dpsEpiloge];
}

id objc_msgSend_dpsNotificationCCA(void *a1, const char *a2, ...)
{
  return [a1 dpsNotificationCCA];
}

id objc_msgSend_dpsNotificationReceivedDuringStudy(void *a1, const char *a2, ...)
{
  return [a1 dpsNotificationReceivedDuringStudy];
}

id objc_msgSend_dpsQuickRecoveryEngine(void *a1, const char *a2, ...)
{
  return [a1 dpsQuickRecoveryEngine];
}

id objc_msgSend_dpsQuickRecoveryWDBudgetDict(void *a1, const char *a2, ...)
{
  return [a1 dpsQuickRecoveryWDBudgetDict];
}

id objc_msgSend_dpsStats(void *a1, const char *a2, ...)
{
  return [a1 dpsStats];
}

id objc_msgSend_dpsStudyInProgress(void *a1, const char *a2, ...)
{
  return [a1 dpsStudyInProgress];
}

id objc_msgSend_dpsStudyTransaction(void *a1, const char *a2, ...)
{
  return [a1 dpsStudyTransaction];
}

id objc_msgSend_dpsWDBudgetDict(void *a1, const char *a2, ...)
{
  return [a1 dpsWDBudgetDict];
}

id objc_msgSend_dropped(void *a1, const char *a2, ...)
{
  return [a1 dropped];
}

id objc_msgSend_durSinceLastSuccessfulComp(void *a1, const char *a2, ...)
{
  return [a1 durSinceLastSuccessfulComp];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_durationSinceUSBEventInSeconds(void *a1, const char *a2, ...)
{
  return [a1 durationSinceUSBEventInSeconds];
}

id objc_msgSend_effectiveGroupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveGroupIdentifier];
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserIdentifier];
}

id objc_msgSend_engineQ(void *a1, const char *a2, ...)
{
  return [a1 engineQ];
}

id objc_msgSend_everAssociated(void *a1, const char *a2, ...)
{
  return [a1 everAssociated];
}

id objc_msgSend_executeBeforePossibleEagerExit(void *a1, const char *a2, ...)
{
  return [a1 executeBeforePossibleEagerExit];
}

id objc_msgSend_expectedThroughput(void *a1, const char *a2, ...)
{
  return [a1 expectedThroughput];
}

id objc_msgSend_expired(void *a1, const char *a2, ...)
{
  return [a1 expired];
}

id objc_msgSend_facetimeCallInProgress(void *a1, const char *a2, ...)
{
  return [a1 facetimeCallInProgress];
}

id objc_msgSend_fetchConfiguredDnsInfo(void *a1, const char *a2, ...)
{
  return [a1 fetchConfiguredDnsInfo];
}

id objc_msgSend_fileHandlingQ(void *a1, const char *a2, ...)
{
  return [a1 fileHandlingQ];
}

id objc_msgSend_firmwareFreePacket(void *a1, const char *a2, ...)
{
  return [a1 firmwareFreePacket];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_forceLifetimeExp(void *a1, const char *a2, ...)
{
  return [a1 forceLifetimeExp];
}

id objc_msgSend_forceStudyErrorFromMsg(void *a1, const char *a2, ...)
{
  return [a1 forceStudyErrorFromMsg];
}

id objc_msgSend_freeIORCaches(void *a1, const char *a2, ...)
{
  return [a1 freeIORCaches];
}

id objc_msgSend_getAWDTimestamp(void *a1, const char *a2, ...)
{
  return [a1 getAWDTimestamp];
}

id objc_msgSend_getCachedUsage(void *a1, const char *a2, ...)
{
  return [a1 getCachedUsage];
}

id objc_msgSend_getChipSet(void *a1, const char *a2, ...)
{
  return [a1 getChipSet];
}

id objc_msgSend_getDriverType(void *a1, const char *a2, ...)
{
  return [a1 getDriverType];
}

id objc_msgSend_getIORPopAvailabeIOReportersTempFile(void *a1, const char *a2, ...)
{
  return [a1 getIORPopAvailabeIOReportersTempFile];
}

id objc_msgSend_getIOReportingClassPath(void *a1, const char *a2, ...)
{
  return [a1 getIOReportingClassPath];
}

id objc_msgSend_getIOReportingDriverName(void *a1, const char *a2, ...)
{
  return [a1 getIOReportingDriverName];
}

id objc_msgSend_getIOReportingService(void *a1, const char *a2, ...)
{
  return [a1 getIOReportingService];
}

id objc_msgSend_getIPv4InterfaceSubnet(void *a1, const char *a2, ...)
{
  return [a1 getIPv4InterfaceSubnet];
}

id objc_msgSend_getIPv6InterfacePrefix(void *a1, const char *a2, ...)
{
  return [a1 getIPv6InterfacePrefix];
}

id objc_msgSend_getInfraApple80211(void *a1, const char *a2, ...)
{
  return [a1 getInfraApple80211];
}

id objc_msgSend_getPhyMode(void *a1, const char *a2, ...)
{
  return [a1 getPhyMode];
}

id objc_msgSend_getUnavailablePredTempFile(void *a1, const char *a2, ...)
{
  return [a1 getUnavailablePredTempFile];
}

id objc_msgSend_getUsageTempFile(void *a1, const char *a2, ...)
{
  return [a1 getUsageTempFile];
}

id objc_msgSend_getW5Client(void *a1, const char *a2, ...)
{
  return [a1 getW5Client];
}

id objc_msgSend_globalIPv4InterfaceName(void *a1, const char *a2, ...)
{
  return [a1 globalIPv4InterfaceName];
}

id objc_msgSend_globalIPv4NetworkServiceID(void *a1, const char *a2, ...)
{
  return [a1 globalIPv4NetworkServiceID];
}

id objc_msgSend_globalIPv6NetworkServiceID(void *a1, const char *a2, ...)
{
  return [a1 globalIPv6NetworkServiceID];
}

id objc_msgSend_globallyUniqueString(void *a1, const char *a2, ...)
{
  return [a1 globallyUniqueString];
}

id objc_msgSend_grabAndSubmitFWTrapInfo(void *a1, const char *a2, ...)
{
  return [a1 grabAndSubmitFWTrapInfo];
}

id objc_msgSend_grabAndSubmitLqmMetrics(void *a1, const char *a2, ...)
{
  return [a1 grabAndSubmitLqmMetrics];
}

id objc_msgSend_hasAWDLInterfaceListed(void *a1, const char *a2, ...)
{
  return [a1 hasAWDLInterfaceListed];
}

id objc_msgSend_hasIRInterfaceListed(void *a1, const char *a2, ...)
{
  return [a1 hasIRInterfaceListed];
}

id objc_msgSend_hasNANInterfaceListed(void *a1, const char *a2, ...)
{
  return [a1 hasNANInterfaceListed];
}

id objc_msgSend_hasRttGatewayBE(void *a1, const char *a2, ...)
{
  return [a1 hasRttGatewayBE];
}

id objc_msgSend_hasRttGatewayBK(void *a1, const char *a2, ...)
{
  return [a1 hasRttGatewayBK];
}

id objc_msgSend_hasRttGatewayVI(void *a1, const char *a2, ...)
{
  return [a1 hasRttGatewayVI];
}

id objc_msgSend_hasRttGatewayVO(void *a1, const char *a2, ...)
{
  return [a1 hasRttGatewayVO];
}

id objc_msgSend_hasSlowNotice(void *a1, const char *a2, ...)
{
  return [a1 hasSlowNotice];
}

id objc_msgSend_hasSoftAPInterfaceListed(void *a1, const char *a2, ...)
{
  return [a1 hasSoftAPInterfaceListed];
}

id objc_msgSend_ifName(void *a1, const char *a2, ...)
{
  return [a1 ifName];
}

id objc_msgSend_impactedServersAtStudyEnd(void *a1, const char *a2, ...)
{
  return [a1 impactedServersAtStudyEnd];
}

id objc_msgSend_impactedServersAtStudyStart(void *a1, const char *a2, ...)
{
  return [a1 impactedServersAtStudyStart];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_infraDutyCycle(void *a1, const char *a2, ...)
{
  return [a1 infraDutyCycle];
}

id objc_msgSend_infraInterfaceName(void *a1, const char *a2, ...)
{
  return [a1 infraInterfaceName];
}

id objc_msgSend_initByFindingInterfaceName(void *a1, const char *a2, ...)
{
  return [a1 initByFindingInterfaceName];
}

id objc_msgSend_initDatapathMetricGetterAndFetcher(void *a1, const char *a2, ...)
{
  return [a1 initDatapathMetricGetterAndFetcher];
}

id objc_msgSend_initializeProbeCxt(void *a1, const char *a2, ...)
{
  return [a1 initializeProbeCxt];
}

id objc_msgSend_injectErrorOnNextCreateOrUpdateSample(void *a1, const char *a2, ...)
{
  return [a1 injectErrorOnNextCreateOrUpdateSample];
}

id objc_msgSend_inputThroughput(void *a1, const char *a2, ...)
{
  return [a1 inputThroughput];
}

id objc_msgSend_int32Value(void *a1, const char *a2, ...)
{
  return [a1 int32Value];
}

id objc_msgSend_int64Value(void *a1, const char *a2, ...)
{
  return [a1 int64Value];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interfaceNameToApple80211InstanceMap(void *a1, const char *a2, ...)
{
  return [a1 interfaceNameToApple80211InstanceMap];
}

id objc_msgSend_internalerror(void *a1, const char *a2, ...)
{
  return [a1 internalerror];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return [a1 invoke];
}

id objc_msgSend_ioerror(void *a1, const char *a2, ...)
{
  return [a1 ioerror];
}

id objc_msgSend_iorMessagePopulator(void *a1, const char *a2, ...)
{
  return [a1 iorMessagePopulator];
}

id objc_msgSend_is2GBand(void *a1, const char *a2, ...)
{
  return [a1 is2GBand];
}

id objc_msgSend_isAXAssociatoin(void *a1, const char *a2, ...)
{
  return [a1 isAXAssociatoin];
}

id objc_msgSend_isAnalyticsProcessorAllowed(void *a1, const char *a2, ...)
{
  return [a1 isAnalyticsProcessorAllowed];
}

id objc_msgSend_isAssociated(void *a1, const char *a2, ...)
{
  return [a1 isAssociated];
}

id objc_msgSend_isAssociatedAtStudyEnd(void *a1, const char *a2, ...)
{
  return [a1 isAssociatedAtStudyEnd];
}

id objc_msgSend_isAssociatedStateKnown(void *a1, const char *a2, ...)
{
  return [a1 isAssociatedStateKnown];
}

id objc_msgSend_isCaptive(void *a1, const char *a2, ...)
{
  return [a1 isCaptive];
}

id objc_msgSend_isCaptiveServerIPResolved(void *a1, const char *a2, ...)
{
  return [a1 isCaptiveServerIPResolved];
}

id objc_msgSend_isDpsValidationDisabled(void *a1, const char *a2, ...)
{
  return [a1 isDpsValidationDisabled];
}

id objc_msgSend_isFGTraffic(void *a1, const char *a2, ...)
{
  return [a1 isFGTraffic];
}

id objc_msgSend_isForegroundTrafficPresent(void *a1, const char *a2, ...)
{
  return [a1 isForegroundTrafficPresent];
}

id objc_msgSend_isInternalScenario(void *a1, const char *a2, ...)
{
  return [a1 isInternalScenario];
}

id objc_msgSend_isKeyBagUnlocked(void *a1, const char *a2, ...)
{
  return [a1 isKeyBagUnlocked];
}

id objc_msgSend_isMemoryPressureRequestDeferred(void *a1, const char *a2, ...)
{
  return [a1 isMemoryPressureRequestDeferred];
}

id objc_msgSend_isNWActivityInProgress(void *a1, const char *a2, ...)
{
  return [a1 isNWActivityInProgress];
}

id objc_msgSend_isPingEnqueueFailing(void *a1, const char *a2, ...)
{
  return [a1 isPingEnqueueFailing];
}

id objc_msgSend_isPriorityNetwork(void *a1, const char *a2, ...)
{
  return [a1 isPriorityNetwork];
}

id objc_msgSend_isRepeatable(void *a1, const char *a2, ...)
{
  return [a1 isRepeatable];
}

id objc_msgSend_isResetAllowedForQuickDPS(void *a1, const char *a2, ...)
{
  return [a1 isResetAllowedForQuickDPS];
}

id objc_msgSend_isResetAllowedForSymptomsDPS(void *a1, const char *a2, ...)
{
  return [a1 isResetAllowedForSymptomsDPS];
}

id objc_msgSend_isUsingCustomDNSSettings(void *a1, const char *a2, ...)
{
  return [a1 isUsingCustomDNSSettings];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isVendorApple(void *a1, const char *a2, ...)
{
  return [a1 isVendorApple];
}

id objc_msgSend_isWiFiAssociatedToNetwork(void *a1, const char *a2, ...)
{
  return [a1 isWiFiAssociatedToNetwork];
}

id objc_msgSend_isWiFiFragmentSamplingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isWiFiFragmentSamplingEnabled];
}

id objc_msgSend_isWiFiInterfacePrimary(void *a1, const char *a2, ...)
{
  return [a1 isWiFiInterfacePrimary];
}

id objc_msgSend_isWiFiNetworkCaptive(void *a1, const char *a2, ...)
{
  return [a1 isWiFiNetworkCaptive];
}

id objc_msgSend_isWritingWAMessageToJsonAllowed(void *a1, const char *a2, ...)
{
  return [a1 isWritingWAMessageToJsonAllowed];
}

id objc_msgSend_kRxBadFCS(void *a1, const char *a2, ...)
{
  return [a1 kRxBadFCS];
}

id objc_msgSend_kRxBadPLCP(void *a1, const char *a2, ...)
{
  return [a1 kRxBadPLCP];
}

id objc_msgSend_kRxCRCGlitch(void *a1, const char *a2, ...)
{
  return [a1 kRxCRCGlitch];
}

id objc_msgSend_kRxFrames(void *a1, const char *a2, ...)
{
  return [a1 kRxFrames];
}

id objc_msgSend_kRxGoodPLCP(void *a1, const char *a2, ...)
{
  return [a1 kRxGoodPLCP];
}

id objc_msgSend_kRxRetryBitSet(void *a1, const char *a2, ...)
{
  return [a1 kRxRetryBitSet];
}

id objc_msgSend_kTxFrames(void *a1, const char *a2, ...)
{
  return [a1 kTxFrames];
}

id objc_msgSend_kTxRetransmission(void *a1, const char *a2, ...)
{
  return [a1 kTxRetransmission];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_keyBagLockStateChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 keyBagLockStateChangeNotification];
}

id objc_msgSend_keybagToken(void *a1, const char *a2, ...)
{
  return [a1 keybagToken];
}

id objc_msgSend_lTECoexDurationMS(void *a1, const char *a2, ...)
{
  return [a1 lTECoexDurationMS];
}

id objc_msgSend_lanHealthAfterDecision(void *a1, const char *a2, ...)
{
  return [a1 lanHealthAfterDecision];
}

id objc_msgSend_lanHealthBeforeDecision(void *a1, const char *a2, ...)
{
  return [a1 lanHealthBeforeDecision];
}

id objc_msgSend_lastModifiedTimeInMillisecondEpoch(void *a1, const char *a2, ...)
{
  return [a1 lastModifiedTimeInMillisecondEpoch];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPB(void *a1, const char *a2, ...)
{
  return [a1 lastPB];
}

id objc_msgSend_lastPBLength(void *a1, const char *a2, ...)
{
  return [a1 lastPBLength];
}

id objc_msgSend_lastPBLock(void *a1, const char *a2, ...)
{
  return [a1 lastPBLock];
}

id objc_msgSend_lastScanReason(void *a1, const char *a2, ...)
{
  return [a1 lastScanReason];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkQualSamples(void *a1, const char *a2, ...)
{
  return [a1 linkQualSamples];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_managedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 managedConfiguration];
}

id objc_msgSend_manufacturerElement(void *a1, const char *a2, ...)
{
  return [a1 manufacturerElement];
}

id objc_msgSend_maxQueueFullDurMS(void *a1, const char *a2, ...)
{
  return [a1 maxQueueFullDurMS];
}

id objc_msgSend_maxRetries(void *a1, const char *a2, ...)
{
  return [a1 maxRetries];
}

id objc_msgSend_mbfree(void *a1, const char *a2, ...)
{
  return [a1 mbfree];
}

id objc_msgSend_measurementDurMS(void *a1, const char *a2, ...)
{
  return [a1 measurementDurMS];
}

id objc_msgSend_megaWiFiProfile(void *a1, const char *a2, ...)
{
  return [a1 megaWiFiProfile];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageDelegate(void *a1, const char *a2, ...)
{
  return [a1 messageDelegate];
}

id objc_msgSend_messageStore(void *a1, const char *a2, ...)
{
  return [a1 messageStore];
}

id objc_msgSend_metricInfo(void *a1, const char *a2, ...)
{
  return [a1 metricInfo];
}

id objc_msgSend_metricName(void *a1, const char *a2, ...)
{
  return [a1 metricName];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_modelName(void *a1, const char *a2, ...)
{
  return [a1 modelName];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_monitoring(void *a1, const char *a2, ...)
{
  return [a1 monitoring];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_mutableFields(void *a1, const char *a2, ...)
{
  return [a1 mutableFields];
}

id objc_msgSend_mutexQueue(void *a1, const char *a2, ...)
{
  return [a1 mutexQueue];
}

id objc_msgSend_netscoreAtStudyEnd(void *a1, const char *a2, ...)
{
  return [a1 netscoreAtStudyEnd];
}

id objc_msgSend_netscoreAtStudyStart(void *a1, const char *a2, ...)
{
  return [a1 netscoreAtStudyStart];
}

id objc_msgSend_netscoreHealthAfterDecision(void *a1, const char *a2, ...)
{
  return [a1 netscoreHealthAfterDecision];
}

id objc_msgSend_netscoreHealthBeforeDecision(void *a1, const char *a2, ...)
{
  return [a1 netscoreHealthBeforeDecision];
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return [a1 networkName];
}

id objc_msgSend_networkServiceID(void *a1, const char *a2, ...)
{
  return [a1 networkServiceID];
}

id objc_msgSend_newBSSID(void *a1, const char *a2, ...)
{
  return [a1 newBSSID];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_noAck(void *a1, const char *a2, ...)
{
  return [a1 noAck];
}

id objc_msgSend_noBuf(void *a1, const char *a2, ...)
{
  return [a1 noBuf];
}

id objc_msgSend_noResources(void *a1, const char *a2, ...)
{
  return [a1 noResources];
}

id objc_msgSend_noack(void *a1, const char *a2, ...)
{
  return [a1 noack];
}

id objc_msgSend_nobuf(void *a1, const char *a2, ...)
{
  return [a1 nobuf];
}

id objc_msgSend_noremotepeer(void *a1, const char *a2, ...)
{
  return [a1 noremotepeer];
}

id objc_msgSend_noresources(void *a1, const char *a2, ...)
{
  return [a1 noresources];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_nowCacheUsageForTelemetry(void *a1, const char *a2, ...)
{
  return [a1 nowCacheUsageForTelemetry];
}

id objc_msgSend_numIpv4DnsServers(void *a1, const char *a2, ...)
{
  return [a1 numIpv4DnsServers];
}

id objc_msgSend_numIpv6DnsServers(void *a1, const char *a2, ...)
{
  return [a1 numIpv6DnsServers];
}

id objc_msgSend_numLocalDnsServers(void *a1, const char *a2, ...)
{
  return [a1 numLocalDnsServers];
}

id objc_msgSend_numRemoteDnsServers(void *a1, const char *a2, ...)
{
  return [a1 numRemoteDnsServers];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_offChanDurMS(void *a1, const char *a2, ...)
{
  return [a1 offChanDurMS];
}

id objc_msgSend_oldCacheUsageForTelemetry(void *a1, const char *a2, ...)
{
  return [a1 oldCacheUsageForTelemetry];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_originalClassName(void *a1, const char *a2, ...)
{
  return [a1 originalClassName];
}

id objc_msgSend_outputThroughput(void *a1, const char *a2, ...)
{
  return [a1 outputThroughput];
}

id objc_msgSend_packetLoss(void *a1, const char *a2, ...)
{
  return [a1 packetLoss];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_pbConverter(void *a1, const char *a2, ...)
{
  return [a1 pbConverter];
}

id objc_msgSend_peerStats(void *a1, const char *a2, ...)
{
  return [a1 peerStats];
}

id objc_msgSend_performPruneBasedOnStoreSizeAndSave(void *a1, const char *a2, ...)
{
  return [a1 performPruneBasedOnStoreSizeAndSave];
}

id objc_msgSend_persist(void *a1, const char *a2, ...)
{
  return [a1 persist];
}

id objc_msgSend_phyRxActivityDurMS(void *a1, const char *a2, ...)
{
  return [a1 phyRxActivityDurMS];
}

id objc_msgSend_phyTxActivityDurMS(void *a1, const char *a2, ...)
{
  return [a1 phyTxActivityDurMS];
}

id objc_msgSend_preferences(void *a1, const char *a2, ...)
{
  return [a1 preferences];
}

id objc_msgSend_probeResults(void *a1, const char *a2, ...)
{
  return [a1 probeResults];
}

id objc_msgSend_problemAC(void *a1, const char *a2, ...)
{
  return [a1 problemAC];
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

id objc_msgSend_processTokenToGroupTypeMap(void *a1, const char *a2, ...)
{
  return [a1 processTokenToGroupTypeMap];
}

id objc_msgSend_processTokenToXPCConnectionMap(void *a1, const char *a2, ...)
{
  return [a1 processTokenToXPCConnectionMap];
}

id objc_msgSend_profileLoaded(void *a1, const char *a2, ...)
{
  return [a1 profileLoaded];
}

id objc_msgSend_qDpsStats(void *a1, const char *a2, ...)
{
  return [a1 qDpsStats];
}

id objc_msgSend_qeuedPackets(void *a1, const char *a2, ...)
{
  return [a1 qeuedPackets];
}

id objc_msgSend_queryInfraInterfaceInstanceAndChip(void *a1, const char *a2, ...)
{
  return [a1 queryInfraInterfaceInstanceAndChip];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_quickDpsResetRecommendation(void *a1, const char *a2, ...)
{
  return [a1 quickDpsResetRecommendation];
}

id objc_msgSend_quickDpsTimeSincePreviousTriggerMinutes(void *a1, const char *a2, ...)
{
  return [a1 quickDpsTimeSincePreviousTriggerMinutes];
}

id objc_msgSend_rC1CoexDurationMS(void *a1, const char *a2, ...)
{
  return [a1 rC1CoexDurationMS];
}

id objc_msgSend_rC2CoexDurationMS(void *a1, const char *a2, ...)
{
  return [a1 rC2CoexDurationMS];
}

id objc_msgSend_rSSI(void *a1, const char *a2, ...)
{
  return [a1 rSSI];
}

id objc_msgSend_recommendationEngine(void *a1, const char *a2, ...)
{
  return [a1 recommendationEngine];
}

id objc_msgSend_recoveryAction(void *a1, const char *a2, ...)
{
  return [a1 recoveryAction];
}

id objc_msgSend_recoveryReason(void *a1, const char *a2, ...)
{
  return [a1 recoveryReason];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_repeatableValues(void *a1, const char *a2, ...)
{
  return [a1 repeatableValues];
}

id objc_msgSend_residentTime(void *a1, const char *a2, ...)
{
  return [a1 residentTime];
}

id objc_msgSend_resolveAppleCaptiveServer(void *a1, const char *a2, ...)
{
  return [a1 resolveAppleCaptiveServer];
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return [a1 resourcePath];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retainArguments(void *a1, const char *a2, ...)
{
  return [a1 retainArguments];
}

id objc_msgSend_roamCount(void *a1, const char *a2, ...)
{
  return [a1 roamCount];
}

id objc_msgSend_rssiValue(void *a1, const char *a2, ...)
{
  return [a1 rssiValue];
}

id objc_msgSend_rssis(void *a1, const char *a2, ...)
{
  return [a1 rssis];
}

id objc_msgSend_rssisCount(void *a1, const char *a2, ...)
{
  return [a1 rssisCount];
}

id objc_msgSend_rttGatewayBE(void *a1, const char *a2, ...)
{
  return [a1 rttGatewayBE];
}

id objc_msgSend_rttGatewayBK(void *a1, const char *a2, ...)
{
  return [a1 rttGatewayBK];
}

id objc_msgSend_rttGatewayVI(void *a1, const char *a2, ...)
{
  return [a1 rttGatewayVI];
}

id objc_msgSend_rttGatewayVO(void *a1, const char *a2, ...)
{
  return [a1 rttGatewayVO];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runIOLegendTest(void *a1, const char *a2, ...)
{
  return [a1 runIOLegendTest];
}

id objc_msgSend_rxAmpduTxBaMismatch(void *a1, const char *a2, ...)
{
  return [a1 rxAmpduTxBaMismatch];
}

id objc_msgSend_rxCRSErrs(void *a1, const char *a2, ...)
{
  return [a1 rxCRSErrs];
}

id objc_msgSend_rxDecryErrs(void *a1, const char *a2, ...)
{
  return [a1 rxDecryErrs];
}

id objc_msgSend_rxDupErrs(void *a1, const char *a2, ...)
{
  return [a1 rxDupErrs];
}

id objc_msgSend_rxFCSErrs(void *a1, const char *a2, ...)
{
  return [a1 rxFCSErrs];
}

id objc_msgSend_rxFrames(void *a1, const char *a2, ...)
{
  return [a1 rxFrames];
}

id objc_msgSend_rxGoodPlcps(void *a1, const char *a2, ...)
{
  return [a1 rxGoodPlcps];
}

id objc_msgSend_rxOvflErrs(void *a1, const char *a2, ...)
{
  return [a1 rxOvflErrs];
}

id objc_msgSend_rxPLCPErrs(void *a1, const char *a2, ...)
{
  return [a1 rxPLCPErrs];
}

id objc_msgSend_rxPhyRate(void *a1, const char *a2, ...)
{
  return [a1 rxPhyRate];
}

id objc_msgSend_rxReplayErrs(void *a1, const char *a2, ...)
{
  return [a1 rxReplayErrs];
}

id objc_msgSend_rxRetries(void *a1, const char *a2, ...)
{
  return [a1 rxRetries];
}

id objc_msgSend_rxThroughput(void *a1, const char *a2, ...)
{
  return [a1 rxThroughput];
}

id objc_msgSend_sNR(void *a1, const char *a2, ...)
{
  return [a1 sNR];
}

id objc_msgSend_scanActivity(void *a1, const char *a2, ...)
{
  return [a1 scanActivity];
}

id objc_msgSend_scanPredicatesNotYetFoundAndMutable(void *a1, const char *a2, ...)
{
  return [a1 scanPredicatesNotYetFoundAndMutable];
}

id objc_msgSend_screenStateOn(void *a1, const char *a2, ...)
{
  return [a1 screenStateOn];
}

id objc_msgSend_sdb(void *a1, const char *a2, ...)
{
  return [a1 sdb];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return [a1 selector];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_sharedActivityManager(void *a1, const char *a2, ...)
{
  return [a1 sharedActivityManager];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedObject(void *a1, const char *a2, ...)
{
  return [a1 sharedObject];
}

id objc_msgSend_shouldEnableXPCStore(void *a1, const char *a2, ...)
{
  return [a1 shouldEnableXPCStore];
}

id objc_msgSend_shouldProcessAnalyticsImmediately(void *a1, const char *a2, ...)
{
  return [a1 shouldProcessAnalyticsImmediately];
}

id objc_msgSend_signalPotentialNewIORChannels(void *a1, const char *a2, ...)
{
  return [a1 signalPotentialNewIORChannels];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_slowNotice(void *a1, const char *a2, ...)
{
  return [a1 slowNotice];
}

id objc_msgSend_slowWiFiNotificationReceivedDuringStudy(void *a1, const char *a2, ...)
{
  return [a1 slowWiFiNotificationReceivedDuringStudy];
}

id objc_msgSend_slowWiFiStudyInProgress(void *a1, const char *a2, ...)
{
  return [a1 slowWiFiStudyInProgress];
}

id objc_msgSend_slowwifiStudyTransaction(void *a1, const char *a2, ...)
{
  return [a1 slowwifiStudyTransaction];
}

id objc_msgSend_smartCCADesenseSupported(void *a1, const char *a2, ...)
{
  return [a1 smartCCADesenseSupported];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return [a1 snapshot];
}

id objc_msgSend_snrValue(void *a1, const char *a2, ...)
{
  return [a1 snrValue];
}

id objc_msgSend_snrs(void *a1, const char *a2, ...)
{
  return [a1 snrs];
}

id objc_msgSend_snrsCount(void *a1, const char *a2, ...)
{
  return [a1 snrsCount];
}

id objc_msgSend_sortedByLastAccess(void *a1, const char *a2, ...)
{
  return [a1 sortedByLastAccess];
}

id objc_msgSend_stall(void *a1, const char *a2, ...)
{
  return [a1 stall];
}

id objc_msgSend_stallNotifications(void *a1, const char *a2, ...)
{
  return [a1 stallNotifications];
}

id objc_msgSend_stallProbability(void *a1, const char *a2, ...)
{
  return [a1 stallProbability];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startMonitoring];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoring];
}

id objc_msgSend_storeQueue(void *a1, const char *a2, ...)
{
  return [a1 storeQueue];
}

id objc_msgSend_storeSize(void *a1, const char *a2, ...)
{
  return [a1 storeSize];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subMessageValue(void *a1, const char *a2, ...)
{
  return [a1 subMessageValue];
}

id objc_msgSend_submissionDelegate(void *a1, const char *a2, ...)
{
  return [a1 submissionDelegate];
}

id objc_msgSend_submitterMap(void *a1, const char *a2, ...)
{
  return [a1 submitterMap];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return [a1 success];
}

id objc_msgSend_suppressedReason(void *a1, const char *a2, ...)
{
  return [a1 suppressedReason];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_symptom(void *a1, const char *a2, ...)
{
  return [a1 symptom];
}

id objc_msgSend_symptomsDnsRecommendation(void *a1, const char *a2, ...)
{
  return [a1 symptomsDnsRecommendation];
}

id objc_msgSend_symptomsDnsStats(void *a1, const char *a2, ...)
{
  return [a1 symptomsDnsStats];
}

id objc_msgSend_symptomsDnsTimeSincePreviousTriggerMinutes(void *a1, const char *a2, ...)
{
  return [a1 symptomsDnsTimeSincePreviousTriggerMinutes];
}

id objc_msgSend_symptomsDnsscreenStateOn(void *a1, const char *a2, ...)
{
  return [a1 symptomsDnsscreenStateOn];
}

id objc_msgSend_symptomsFails(void *a1, const char *a2, ...)
{
  return [a1 symptomsFails];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_tVPMActiveDurationMS(void *a1, const char *a2, ...)
{
  return [a1 tVPMActiveDurationMS];
}

id objc_msgSend_testDateDiffDays(void *a1, const char *a2, ...)
{
  return [a1 testDateDiffDays];
}

id objc_msgSend_testID(void *a1, const char *a2, ...)
{
  return [a1 testID];
}

id objc_msgSend_testThroughput(void *a1, const char *a2, ...)
{
  return [a1 testThroughput];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeSinceLastRecovery(void *a1, const char *a2, ...)
{
  return [a1 timeSinceLastRecovery];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_totalDnsServers(void *a1, const char *a2, ...)
{
  return [a1 totalDnsServers];
}

id objc_msgSend_triggerPeerDiscovery(void *a1, const char *a2, ...)
{
  return [a1 triggerPeerDiscovery];
}

id objc_msgSend_ts(void *a1, const char *a2, ...)
{
  return [a1 ts];
}

id objc_msgSend_txAMPDUDensity(void *a1, const char *a2, ...)
{
  return [a1 txAMPDUDensity];
}

id objc_msgSend_txCompPkts(void *a1, const char *a2, ...)
{
  return [a1 txCompPkts];
}

id objc_msgSend_txCompletionSnapshotBE(void *a1, const char *a2, ...)
{
  return [a1 txCompletionSnapshotBE];
}

id objc_msgSend_txCompletionSnapshotBK(void *a1, const char *a2, ...)
{
  return [a1 txCompletionSnapshotBK];
}

id objc_msgSend_txCompletionSnapshotVI(void *a1, const char *a2, ...)
{
  return [a1 txCompletionSnapshotVI];
}

id objc_msgSend_txCompletionSnapshotVO(void *a1, const char *a2, ...)
{
  return [a1 txCompletionSnapshotVO];
}

id objc_msgSend_txExpectedAMPDUDensity(void *a1, const char *a2, ...)
{
  return [a1 txExpectedAMPDUDensity];
}

id objc_msgSend_txFails(void *a1, const char *a2, ...)
{
  return [a1 txFails];
}

id objc_msgSend_txFailure(void *a1, const char *a2, ...)
{
  return [a1 txFailure];
}

id objc_msgSend_txFrames(void *a1, const char *a2, ...)
{
  return [a1 txFrames];
}

id objc_msgSend_txPhyRate(void *a1, const char *a2, ...)
{
  return [a1 txPhyRate];
}

id objc_msgSend_txRetries(void *a1, const char *a2, ...)
{
  return [a1 txRetries];
}

id objc_msgSend_txSubPkts(void *a1, const char *a2, ...)
{
  return [a1 txSubPkts];
}

id objc_msgSend_txfailure(void *a1, const char *a2, ...)
{
  return [a1 txfailure];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uint32Value(void *a1, const char *a2, ...)
{
  return [a1 uint32Value];
}

id objc_msgSend_uint64Value(void *a1, const char *a2, ...)
{
  return [a1 uint64Value];
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return [a1 underlyingErrors];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unpersistIORObjects(void *a1, const char *a2, ...)
{
  return [a1 unpersistIORObjects];
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

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateScreenState(void *a1, const char *a2, ...)
{
  return [a1 updateScreenState];
}

id objc_msgSend_updateTimerConfiguration(void *a1, const char *a2, ...)
{
  return [a1 updateTimerConfiguration];
}

id objc_msgSend_usbAction(void *a1, const char *a2, ...)
{
  return [a1 usbAction];
}

id objc_msgSend_usbEventsCount(void *a1, const char *a2, ...)
{
  return [a1 usbEventsCount];
}

id objc_msgSend_usbTotal(void *a1, const char *a2, ...)
{
  return [a1 usbTotal];
}

id objc_msgSend_use(void *a1, const char *a2, ...)
{
  return [a1 use];
}

id objc_msgSend_userInput(void *a1, const char *a2, ...)
{
  return [a1 userInput];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_uuidToMessageMap(void *a1, const char *a2, ...)
{
  return [a1 uuidToMessageMap];
}

id objc_msgSend_wanHealthAfterDecision(void *a1, const char *a2, ...)
{
  return [a1 wanHealthAfterDecision];
}

id objc_msgSend_wanHealthBeforeDecision(void *a1, const char *a2, ...)
{
  return [a1 wanHealthBeforeDecision];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_wifiChipSet(void *a1, const char *a2, ...)
{
  return [a1 wifiChipSet];
}

id objc_msgSend_wifianalyticsTmpDir(void *a1, const char *a2, ...)
{
  return [a1 wifianalyticsTmpDir];
}

id objc_msgSend_wifianalyticsTmpDirectory(void *a1, const char *a2, ...)
{
  return [a1 wifianalyticsTmpDirectory];
}

id objc_msgSend_writeToURL_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:x0 atomically:x1 encoding:x2 error:x3];
}