void sub_10000416C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

void sub_1000041B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _companionLinkClientInvalidated];
}

void sub_1000041F0(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _companionLinkClientDiscoveredDevice:v3];
}

void sub_10000424C(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _companionLinkClientLostDevice:v3];
}

void sub_1000042A8(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _companionLinkClientActivatedWithError:v3];
}

uint64_t sub_100004EE8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_100004EFC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_100004F10(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

BOOL sub_1000067EC(uint64_t a1, uint64_t a2)
{
  return a2 == 0x7FFFFFFFFFFFFFFELL - a1;
}

NSIndexSet *sub_100006800(uint64_t a1)
{
  return +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a1, 0x7FFFFFFFFFFFFFFELL - a1);
}

id sub_100006818(uint64_t a1)
{
  if (a1) {
    +[NSIndexSet indexSetWithIndexesInRange:1];
  }
  else {
  v1 = +[NSIndexSet indexSetWithIndex:0];
  }

  return v1;
}

CFStringRef sub_10000730C(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Unknown";
  }
  else {
    return off_10006CB38[a1 - 1];
  }
}

uint64_t sub_10000786C(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

void sub_100007930(id a1, NSDictionary *a2)
{
}

void sub_100007E0C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100009718(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained requestTimeoutDidFire];
}

id sub_100009D1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerRequests];
}

id sub_100009DC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startServerWithCompletion:*(void *)(a1 + 40)];
}

id sub_100009F08(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchAtomBatchesIsReciprocal:0 reason:*(void *)(a1 + 56) activity:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

id sub_10000A010(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchAtomBatchesFromDevices:*(void *)(a1 + 40) isReciprocal:0 reason:*(void *)(a1 + 64) activity:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void sub_10000A4A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 userInfo];
  id v8 = [v7 mutableCopy];
  v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  v11 = v10;

  v12 = [v6 domain];
  unsigned int v13 = [v12 isEqual:@"BMRapportErrorDomain"];

  if (v13)
  {
    v14 = [v11 objectForKeyedSubscript:NSLocalizedDescriptionKey];
    if (v14)
    {
      [v11 setObject:v14 forKeyedSubscript:NSLocalizedDescriptionKey];
    }
    else
    {
      v15 = BMRapportErrorToString((unint64_t)[v6 code]);
      [v11 setObject:v15 forKeyedSubscript:NSLocalizedDescriptionKey];
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v28 = a1;
  v16 = [*(id *)(a1 + 32) deliveredToDevices];
  id v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v22 = [v21 rapportIdentifier];
        unsigned int v23 = [v22 isEqual:v5];

        if (v23)
        {
          v24 = [v21 description];
          [v11 setObject:v24 forKeyedSubscript:@"Device"];

          goto LABEL_19;
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  v25 = *(void **)(v28 + 40);
  v26 = [v6 domain];
  v27 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, [v6 code], v11);
  [v25 addObject:v27];
}

void sub_10000ADFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id a39)
{
}

void sub_10000AE58(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained[2];
  v7 = *(void **)(a1 + 32);
  uint64_t v6 = a1 + 32;
  id v8 = [v7 buildAtomBatchRequestWithIsReciprocal:*(unsigned __int8 *)(v6 + 24) syncReason:*(void *)(v6 + 16) sequenceNumber:0 transportType:2 device:v3];
  if (v8)
  {
    +[BMSyncCore resetEagerExitTimer];
    [v5 markAsInFlightToDevice:v3];
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*(id *)v6 siteSuffix];
      int v12 = 138412546;
      unsigned int v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: sending request to device: %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)v6 sendFetchAtomBatchesRequest:v8 toDevice:v3 forRequest:v5];
  }
  else
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000443F0();
    }
  }
}

void sub_10000AFF4(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  uint64_t v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [a1[4] siteSuffix];
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: request timed out because no devices are nearby", buf, 0xCu);
  }
  uint64_t v6 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:9 userInfo:0];
  id v8 = v6;
  v7 = +[NSArray arrayWithObjects:&v8 count:1];
  [WeakRetained completeRequest:v3 deliveredToDevices:&__NSArray0__struct withErrors:v7];
}

void sub_10000B5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id a46)
{
}

void sub_10000B630(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained[2];
  v7 = *(void **)(a1 + 32);
  uint64_t v6 = a1 + 32;
  id v8 = [v7 buildAtomBatchRequestWithIsReciprocal:*(unsigned __int8 *)(v6 + 24) syncReason:*(void *)(v6 + 16) sequenceNumber:0 transportType:2 device:v3];
  if (v8)
  {
    [v5 markAsInFlightToDevice:v3];
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*(id *)v6 siteSuffix];
      int v12 = 138412546;
      unsigned int v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: sending request to device: %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)v6 sendFetchAtomBatchesRequest:v8 toDevice:v3 forRequest:v5];
  }
  else
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000443F0();
    }
  }
}

void sub_10000B7C0(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = objc_loadWeakRetained(a1 + 6);
  uint64_t v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [a1[4] siteSuffix];
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: request timed out because no devices are nearby", buf, 0xCu);
  }
  uint64_t v6 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:9 userInfo:0];
  id v8 = v6;
  v7 = +[NSArray arrayWithObjects:&v8 count:1];
  [WeakRetained completeRequest:v3 deliveredToDevices:&__NSArray0__struct withErrors:v7];
}

void sub_10000BA20(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  v9 = (void *)a1[7];
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  [v6 handleFetchAtomBatchesResponse:v12 options:v11 error:v10 fromDevice:v7 forRequest:v8 isReciprocal:[v9 isReciprocalRequest]];
}

void sub_10000C218(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  dispatch_assert_queue_V2(WeakRetained[8]);
  +[BMSyncCore resetEagerExitTimer];
  v81 = [v8 objectForKeyedSubscript:RPOptionSenderIDSDeviceID];
  id v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [*(id *)(a1 + 32) siteSuffix];
    unsigned int v13 = v81;
    id v14 = [(__CFString *)v81 length];
    if ((unint64_t)v14 >= 9)
    {
      unsigned int v13 = [(__CFString *)v81 substringToIndex:8];
    }
    *(_DWORD *)buf = 138413058;
    uint64_t v96 = (uint64_t)v12;
    __int16 v97 = 2112;
    CFStringRef v98 = v13;
    __int16 v99 = 2112;
    id v100 = v7;
    __int16 v101 = 2112;
    id v102 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: received request BMRapportDevice[%@] %@ %@", buf, 0x2Au);
    if ((unint64_t)v14 >= 9) {
  }
    }
  id v15 = [v8 objectForKeyedSubscript:@"senderModelID"];
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v80 = WeakRetained;
    uint64_t v16 = BMDevicePlatformFromModelString();
    if (v16)
    {
      uint64_t v17 = v16;
      id v79 = v7;
      unint64_t v18 = (unint64_t)+[BMDeviceMetadataUtils platform];
      uint64_t v19 = [v8 objectForKeyedSubscript:RPOptionStatusFlags];
      unsigned int v20 = [v19 unsignedLongValue];

      if ((v17 & 0xFFFFFFFFFFFFFFFDLL) == 5 || (v18 & 0xFFFFFFFFFFFFFFFDLL) == 5)
      {
        if ((*(void *)&v20 & 0x82000) == 0)
        {
          v41 = __biome_log_for_category();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            sub_100044648();
          }

          NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
          CFStringRef v88 = @"Outside home";
          v22 = &v88;
          unsigned int v23 = &v87;
          goto LABEL_43;
        }
      }
      else if ((v20 & 0x80000) == 0)
      {
        v21 = __biome_log_for_category();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100044764();
        }

        NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
        CFStringRef v90 = @"Cross account";
        v22 = &v90;
        unsigned int v23 = &v89;
LABEL_43:
        v27 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:1];
        uint64_t v28 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:8 userInfo:v27];
        (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v28);
        id WeakRetained = v80;
        goto LABEL_20;
      }
      long long v31 = *(void **)(a1 + 32);
      long long v30 = (id *)(a1 + 32);
      v27 = [v31 accountFromRapportOptions:v8];
      uint64_t v28 = [*v30 createDistributedSyncManagerForAccount:v27];
      if (!v28)
      {
        v38 = __biome_log_for_category();
        id WeakRetained = v80;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_1000446D4();
        }

        NSErrorUserInfoKey v85 = NSLocalizedDescriptionKey;
        CFStringRef v86 = @"Failed to create sync manager";
        v39 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
        v40 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:0 userInfo:v39];
        (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v40);
        goto LABEL_63;
      }
      unsigned int v75 = [*v30 protocolVersion];
      id v32 = [[BMPeerToPeerMessage alloc] initFromDictionary:v7];
      v77 = v32;
      if (+[BMDeviceMetadataUtils currentlyInGameMode])
      {
        v33 = __biome_log_for_category();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = [*v30 siteSuffix];
          *(_DWORD *)buf = 138412290;
          uint64_t v96 = (uint64_t)v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: device is currently in game mode, evaluating request reason to determine policy", buf, 0xCu);
        }
        if ((v33, id v32 = v77, v17 == 6) && ![v77 syncReason]
          || [v77 syncReason] != (id)5 && objc_msgSend(v77, "syncReason") != (id)7)
        {
          v68 = __biome_log_for_category();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            v69 = [*v30 siteSuffix];
            *(_DWORD *)buf = 138412290;
            uint64_t v96 = (uint64_t)v69;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: incoming request is not a user initiated force triggered sync, responding to request with temporarily unavailable", buf, 0xCu);
          }
          NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
          CFStringRef v84 = @"Currently in Game Mode";
          v40 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
          v74 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:11 userInfo:v40];
          (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
          id v7 = v79;
          id WeakRetained = v80;
          v39 = v77;

          goto LABEL_63;
        }
      }
      id v7 = v79;
      id v78 = [[BMFetchAtomBatchesRequest alloc] initFromDictionary:v79];
      if ([v32 protocolVersion] == (id)1)
      {
        v35 = __biome_log_for_category();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = [*v30 siteSuffix];
          *(_DWORD *)buf = 138412290;
          uint64_t v96 = (uint64_t)v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: replying with CKXUncompressedFormatVersion atom batch", buf, 0xCu);
        }
        unsigned __int8 v72 = 1;
        v37 = v78;
      }
      else
      {
        if ([v32 protocolVersion] != (id)v75)
        {
          v62 = __biome_log_for_category();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v63 = [*v30 siteSuffix];
            CFStringRef v64 = (const __CFString *)[v77 protocolVersion];
            *(_DWORD *)buf = 138412802;
            uint64_t v96 = (uint64_t)v63;
            __int16 v97 = 2048;
            CFStringRef v98 = v64;
            __int16 v99 = 1024;
            LODWORD(v100) = v75;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: mismatched protocol version %lu, expected %d", buf, 0x1Cu);
          }
          v65 = objc_opt_new();
          [v65 setProtocolVersion:v75];
          v66 = [v28 peerStatusTracker];
          v67 = [v66 localDeviceUpdatingIfNeccesaryWithProtocolVersion:[*v30 protocolVersion]];
          [v65 setPeer:v67];

          [v65 setWalltime:CFAbsoluteTimeGetCurrent()];
          [v65 setSyncReason:[v78 syncReason]];
          v73 = v65;
          v60 = [v65 dictionaryRepresentation];
          v61 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:7 userInfo:0];
          (*((void (**)(id, void *, void, void *))v9 + 2))(v9, v60, 0, v61);
          id WeakRetained = v80;
          goto LABEL_62;
        }
        v37 = v78;
        unsigned __int8 v72 = [v78 atomBatchVersion];
      }
      v42 = [v37 rangeClockVectors];

      if (v42)
      {
        uint64_t v43 = [v37 rangeClockVectors];
      }
      else
      {
        v44 = [v37 vectorClock];
        v45 = +[BMMultiStreamVectorClockConverter multiStreamVectorClockToTimestampVectorClock:v44];

        uint64_t v43 = +[BMMultiStreamVectorClockConverter multiStreamRangeClockVectorFromIndexClockVectors:v45];
      }
      v46 = [[BMAtomBatchChunker alloc] initWithChunkerPolicy:v80[4]];
      uint64_t v47 = v72;
      v73 = (void *)v43;
      uint64_t v71 = [v28 atomBatchesForChangesSinceClockVector:v43 targetPlatform:v17 transportType:2 direction:2 ckFormatVersion:v47 chunker:v46];
      v48 = objc_opt_new();
      [v48 setProtocolVersion:v75];
      v49 = [v28 peerStatusTracker];
      v50 = [v49 localDeviceUpdatingIfNeccesaryWithProtocolVersion:[*v30 protocolVersion]];
      [v48 setPeer:v50];

      [v48 setWalltime:CFAbsoluteTimeGetCurrent()];
      [v48 setSyncReason:[v78 syncReason]];
      [v48 setUnseenPeers:&__NSArray0__struct];
      [v48 setAtomBatches:v71];
      v76 = v46;
      [v48 setMoreComing:-[BMAtomBatchChunker moreComing](v46, "moreComing")];
      [v48 setBatchSequenceNumber:[v78 batchSequenceNumber]];
      v51 = [v28 deletedLocationsForTransportType:2];
      [v48 setDeletedLocations:v51];

      v70 = v48;
      v52 = [v48 dictionaryRepresentation];
      (*((void (**)(id, void *, void, void))v9 + 2))(v9, v52, 0, 0);
      BOOL v53 = ([v78 isReciprocalRequest] & 1) == 0
         && [v78 batchSequenceNumber] == 0;
      v54 = __biome_log_for_category();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = [*v30 siteSuffix];
        v56 = (void *)v55;
        CFStringRef v57 = @"NO";
        if (v53) {
          CFStringRef v57 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v96 = v55;
        __int16 v97 = 2112;
        CFStringRef v98 = v57;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: should issue reciprocal request, %@", buf, 0x16u);
      }
      id WeakRetained = v80;
      if (v53)
      {
        v58 = +[NSDate now];
        [v80[9] setLastRapportSyncAttemptDate:v58];

        id v59 = *v30;
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472;
        v82[2] = sub_10000CF3C;
        v82[3] = &unk_10006CC98;
        v82[4] = v59;
        [v59 fetchAtomBatchesIsReciprocal:1 reason:6 activity:0 completionHandler:v82];
      }

      id v7 = v79;
      v60 = v76;
      v61 = (void *)v71;
LABEL_62:

      v39 = v77;
      v40 = v78;

LABEL_63:
      goto LABEL_20;
    }
    long long v29 = __biome_log_for_category();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000445BC();
    }

    NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
    CFStringRef v92 = @"Unknown platform";
    v25 = &v92;
    v26 = &v91;
  }
  else
  {
    v24 = __biome_log_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100044530();
    }

    NSErrorUserInfoKey v93 = NSLocalizedDescriptionKey;
    CFStringRef v94 = @"Unable to determine sender model info";
    v25 = &v94;
    v26 = &v93;
  }
  v27 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v26 count:1];
  uint64_t v28 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:8 userInfo:v27];
  (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v28);
LABEL_20:
}

void sub_10000CF3C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) siteSuffix];
    int v10 = 138412802;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BMRapportSyncEngine%@: fetch completion handler is reciprocal, YES, deviceIdentifiers, %@, errors, %@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(*(void *)(a1 + 32) + 72) clearCachedStatements];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 56);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

void sub_10000DC6C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_10000DCC8(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void sub_10000DD5C(id a1)
{
  id v3 = dispatch_get_global_queue(0, 0);
  dispatch_source_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  v2 = (void *)qword_1000802B0;
  qword_1000802B0 = (uint64_t)v1;

  dispatch_source_set_timer((dispatch_source_t)qword_1000802B0, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000802B0, &stru_10006CD20);
  dispatch_activate((dispatch_object_t)qword_1000802B0);
}

BOOL sub_10000E490(id a1, id a2)
{
  id v2 = a2;
  id v3 = +[NSNull null];

  return v3 != v2;
}

void sub_10000F0B0(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void sub_10000F0F4(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) count] <= 1)
  {
    id v2 = [*(id *)(a1 + 32) firstObject];
    if (!v2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  NSErrorUserInfoKey v5 = NSMultipleUnderlyingErrorsKey;
  uint64_t v6 = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  id v2 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:1 userInfo:v4];

  if (v2) {
LABEL_5:
  }
    [*(id *)(a1 + 40) invalidate];
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000F80C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F830(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _handleResponseUUID:*(void *)(a1 + 40) response:v7 options:v8 error:v9 handler:*(void *)(a1 + 48)];
  }
  else
  {
    __int16 v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      if (v7) {
        id v14 = v7;
      }
      else {
        id v14 = v9;
      }
      int v15 = 138412546;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BMRapportClient[%@]: Warning: ignoring response arriving after deallocation: %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

void sub_1000106D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000106E8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a4;
  return result;
}

void start()
{
  bzero(v7, 0x400uLL);
  if (_set_user_dir_suffix())
  {
    if (confstr(65537, (char *)v7, 0x400uLL))
    {
      uint64_t v4 = realpath_DARWIN_EXTSN((const char *)v7, 0);
      if (v4)
      {
        free(v4);
        +[NSError _setFileNameLocalizationEnabled:0];
        *(void *)buf = 0;
        vproc_swap_integer();
LABEL_9:
        exit(1);
      }
      v0 = __biome_log_for_category();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      {
        int v5 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v5;
        id v2 = "failed to resolve temporary directory: %{darwin.errno}d";
        goto LABEL_7;
      }
    }
    else
    {
      v0 = __biome_log_for_category();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      {
        int v1 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v1;
        id v2 = "failed to initialize temporary directory: %{darwin.errno}d";
LABEL_7:
        _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, v2, buf, 8u);
      }
    }
  }
  else
  {
    v0 = __biome_log_for_category();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      int v3 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v3;
      id v2 = "failed to set user dir suffix: %{darwin.errno}d";
      goto LABEL_7;
    }
  }

  goto LABEL_9;
}

void sub_1000110AC(void *a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100011DF4;
  handler[3] = &unk_10006CF38;
  id v3 = a1;
  id v1 = v3;
  xpc_activity_register("com.apple.biomesyncd.cascade.periodic-sync", XPC_ACTIVITY_CHECK_IN, handler);
}

void sub_100011150(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    if (xpc_activity_should_defer(v3))
    {
      if (!xpc_activity_set_state(v3, 3))
      {
        int v5 = __biome_log_for_category();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_100044C44(v5, v6, v7, v8, v9, v10, v11, v12);
        }

        xpc_activity_set_state(v3, 5);
      }
    }
    else
    {
      uint64_t v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "biome activity fired \"com.apple.biomesyncd.metrics-collection\"", buf, 2u);
      }

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000112BC;
      v15[3] = &unk_10006CE28;
      id v14 = *(NSObject **)(a1 + 32);
      id v16 = *(id *)(a1 + 40);
      __int16 v17 = v3;
      dispatch_sync(v14, v15);
    }
  }
}

void sub_1000112BC(uint64_t a1)
{
  unsigned __int8 v3 = [*(id *)(a1 + 32) start];
  uint64_t v4 = __biome_log_for_category();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "biome running activity \"com.apple.biomesyncd.metrics-collection\"", v6, 2u);
    }

    uint64_t v4 = [*(id *)(a1 + 32) primaryDatabase];
    [v4 runMetricsCollectionTask:*(void *)(a1 + 40)];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Database unavailable for activity \"com.apple.biomesyncd.metrics-collection\"", buf, 2u);
  }
}

void sub_1000113A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    BOOL v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "biome activity fired \"com.apple.biomesyncd.database-maintenance\"", buf, 2u);
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000114B4;
    v7[3] = &unk_10006CE28;
    uint64_t v6 = *(NSObject **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v9 = v3;
    dispatch_sync(v6, v7);
  }
}

void sub_1000114B4(uint64_t a1)
{
  unsigned __int8 v3 = [*(id *)(a1 + 32) start];
  uint64_t v4 = __biome_log_for_category();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "biome running activity \"com.apple.biomesyncd.database-maintenance\"", v6, 2u);
    }

    uint64_t v4 = [*(id *)(a1 + 32) primaryDatabase];
    [v4 runVacuumingTask:*(void *)(a1 + 40)];
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "database unavailable for activity \"com.apple.biomesyncd.database-maintenance\"", buf, 2u);
  }
}

void sub_100011598(const char *a1, uint64_t a2, void *a3, void *a4)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100012000;
  v9[3] = &unk_10006CF88;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = a1;
  uint64_t v13 = a2;
  id v7 = v11;
  id v8 = v10;
  xpc_activity_register(a1, XPC_ACTIVITY_CHECK_IN, v9);
}

void sub_10001166C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary
    && (string = xpc_dictionary_get_string(v3, "Notification")) != 0)
  {
    uint64_t v6 = string;
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Received com.apple.notifyd.matching: %s", buf, 0xCu);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000117E8;
    v9[3] = &unk_10006CE78;
    id v11 = v6;
    id v8 = *(NSObject **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    dispatch_sync(v8, v9);
    uint64_t v4 = v10;
  }
  else
  {
    uint64_t v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100044CBC((uint64_t)v3, v4);
    }
  }
}

void sub_1000117E8(uint64_t a1)
{
  id v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 136315138;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Handling com.apple.notifyd.matching: %s", (uint8_t *)&v5, 0xCu);
  }

  if (!strcmp(*(const char **)(a1 + 40), "com.apple.rapport.CompanionLinkDeviceAdded"))
  {
    if ([*(id *)(a1 + 32) start])
    {
      uint64_t v4 = [*(id *)(a1 + 32) syncScheduler];
      [v4 syncNowIfPolicyAllowsWithReason:3 transportType:2 activity:0];
    }
    else
    {
      uint64_t v4 = __biome_log_for_category();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v5) = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Database unavailable to handle \"com.apple.rapport.CompanionLinkDeviceAdded\"", (uint8_t *)&v5, 2u);
      }
    }
  }
}

void sub_100011920(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary
    && (string = xpc_dictionary_get_string(v3, _xpc_event_key_name)) != 0)
  {
    uint64_t v6 = string;
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received com.apple.rapport.matching: %s", buf, 0xCu);
    }

    if (!strcmp(v6, "CascadeRapportWake"))
    {
      uint64_t v4 = [*(id *)(a1 + 32) syncEngineForCurrentPersona];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100011B3C;
      v13[3] = &unk_10006CB58;
      id v14 = v3;
      [v4 startServerWithCompletion:v13];
    }
    else
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100011B80;
      v9[3] = &unk_10006CEA0;
      uint64_t v12 = v6;
      id v8 = *(NSObject **)(a1 + 40);
      id v10 = *(id *)(a1 + 48);
      id v11 = v3;
      dispatch_sync(v8, v9);

      uint64_t v4 = v10;
    }
  }
  else
  {
    uint64_t v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_100044D34((uint64_t)v3, v4);
    }
  }
}

void sub_100011B3C(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    id v2 = reply;
    xpc_dictionary_send_reply();
    xpc_object_t reply = v2;
  }
}

void sub_100011B80(uint64_t a1)
{
  id v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handling com.apple.rapport.matching: %s", buf, 0xCu);
  }

  if ([*(id *)(a1 + 32) start])
  {
    int v5 = [*(id *)(a1 + 32) rapportSyncEngine];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100011D10;
    v7[3] = &unk_10006CB58;
    id v8 = *(id *)(a1 + 40);
    [v5 _startServerWithCompletion:v7];

    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Database unavailable to handle RapportWake", buf, 2u);
    }
  }
}

void sub_100011D10(uint64_t a1)
{
  if (xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "replyRequired"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      id v3 = reply;
      xpc_dictionary_send_reply();
      xpc_object_t reply = v3;
    }
  }
}

void sub_100011D84(id a1)
{
  id v1 = __biome_log_for_category();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Received SIGTERM", v2, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_100011DF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    if (xpc_activity_should_defer(v3))
    {
      if (!xpc_activity_set_state(v3, 3))
      {
        int v5 = __biome_log_for_category();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_100044DAC(v5, v6, v7, v8, v9, v10, v11, v12);
        }

        xpc_activity_set_state(v3, 5);
      }
    }
    else
    {
      uint64_t v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v19 = "com.apple.biomesyncd.cascade.periodic-sync";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "cascade activity fired \"%s\"", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      [*(id *)(a1 + 32) startClient];
      id v14 = *(void **)(a1 + 32);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100011FC0;
      v15[3] = &unk_10006CF10;
      id v16 = v14;
      __int16 v17 = v3;
      [v16 syncNowWithReason:1 activity:v17 completionHandler:v15];
    }
  }
}

BOOL sub_100011FC0(uint64_t a1)
{
  [*(id *)(a1 + 32) teardown];
  id v2 = *(_xpc_activity_s **)(a1 + 40);

  return xpc_activity_set_state(v2, 5);
}

void sub_100012000(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    if (xpc_activity_should_defer(v3))
    {
      if (!xpc_activity_set_state(v3, 3))
      {
        int v5 = __biome_log_for_category();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_100044E24(a1, v5, v6, v7, v8, v9, v10, v11);
        }

        xpc_activity_set_state(v3, 5);
      }
    }
    else
    {
      uint64_t v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *(void *)(a1 + 48);
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "biome activity fired \"%s\"", (uint8_t *)&buf, 0xCu);
      }

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v23 = 0x2020000000;
      char v24 = 0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100012218;
      block[3] = &unk_10006CF60;
      id v14 = *(NSObject **)(a1 + 32);
      id v15 = *(id *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      p_long long buf = &buf;
      uint64_t v21 = v16;
      id v19 = v15;
      dispatch_sync(v14, block);
      if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        __int16 v17 = [*(id *)(a1 + 40) syncScheduler];
        [v17 syncAllTransportsNowIfPolicyAllowsWithReason:*(void *)(a1 + 56) activity:v3];
      }
      _Block_object_dispose(&buf, 8);
    }
  }
}

void sub_1000121F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012218(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) start];
  id v3 = __biome_log_for_category();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 48);
      int v7 = 136315138;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "biome running activity \"%s\"", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = 136315138;
      uint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Database unavailable for activity \"%s\"", (uint8_t *)&v7, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_100012330(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100013394(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_100013670(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_100013980(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

void sub_100013D28(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 timestamp];
  uint64_t v5 = [*(id *)(a1 + 32) timestamp];
  uint64_t v6 = [v5 siteIdentifier];
  [v4 setSiteIdentifier:v6];

  int v7 = [v3 timestamp];
  uint64_t v8 = [*(id *)(a1 + 32) timestamp];
  [v7 setClock:[v8 clockValue]];

  uint64_t v9 = [v3 timestamp];
  uint64_t v10 = [*(id *)(a1 + 32) timestamp];
  [v9 setModifier:[v10 modifier]];

  uint64_t v11 = [v3 timestamp];
  uint64_t v12 = [*(id *)(a1 + 32) timestamp];
  [v11 setUnordered:[v12 unordered]];

  uint64_t v13 = [v3 references];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100013F38;
  v15[3] = &unk_10006CFB0;
  id v16 = *(id *)(a1 + 32);
  [v13 appendWithProxyBlock:v15];

  [v3 setAtomType:[*(id *)(a1 + 32) type]];
  if (![*(id *)(a1 + 32) type])
  {
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  if ([*(id *)(a1 + 32) type] == (id)2 || objc_msgSend(*(id *)(a1 + 32), "type") == (id)1)
  {
    uint64_t v14 = 1;
LABEL_6:
    [v3 setAtomBehavior:v14];
  }
  [v3 setValue:*(void *)(a1 + 40)];
  [v3 setVersion:*(void *)(a1 + 48)];
}

void sub_100013F38(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setType:0];
  BOOL v4 = [v3 location];
  uint64_t v5 = [*(id *)(a1 + 32) causalReference];
  uint64_t v6 = [v5 location];
  int v7 = [v6 identifier];
  [v4 setIdentifier:v7];

  uint64_t v8 = [v3 timestamp];
  uint64_t v9 = [*(id *)(a1 + 32) causalReference];
  uint64_t v10 = [v9 timestamp];
  uint64_t v11 = [v10 siteIdentifier];
  [v8 setSiteIdentifier:v11];

  uint64_t v12 = [v3 timestamp];
  uint64_t v13 = [*(id *)(a1 + 32) causalReference];
  uint64_t v14 = [v13 timestamp];
  [v12 setClock:[v14 clockValue]];

  id v15 = [v3 timestamp];
  id v16 = [*(id *)(a1 + 32) causalReference];
  __int16 v17 = [v16 timestamp];
  [v15 setModifier:[v17 modifier]];

  id v20 = [v3 timestamp];

  id v18 = [*(id *)(a1 + 32) causalReference];
  id v19 = [v18 timestamp];
  [v20 setUnordered:[v19 unordered]];
}

void sub_100014114(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 timestamp];
  uint64_t v6 = [v5 siteIdentifierObject];

  int v7 = [v4 timestamp];
  uint64_t v8 = [v7 distributedSiteIdentifier];
  uint64_t v9 = [v6 identifier];
  [v8 setIdentifier:v9];

  uint64_t v10 = [v4 timestamp];
  uint64_t v11 = [*(id *)(a1 + 32) timestamp];
  [v10 setClock:[v11 clockValue]];

  uint64_t v12 = [v4 references];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000142A0;
  v13[3] = &unk_10006CFB0;
  id v14 = *(id *)(a1 + 32);
  [v12 appendWithProxyBlock:v13];

  [v4 setAtomType:[*(id *)(a1 + 32) type]];
  [v4 setValue:*(void *)(a1 + 40)];
  [v4 setVersion:*(void *)(a1 + 48)];
}

void sub_1000142A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setType:0];
  id v4 = [v3 location];
  uint64_t v5 = [*(id *)(a1 + 32) causalReference];
  uint64_t v6 = [v5 mergeableValueID];
  int v7 = [v6 identifier];
  [v4 setIdentifier:v7];

  uint64_t v8 = [*(id *)(a1 + 32) causalReference];
  uint64_t v9 = [v8 timestamp];
  id v16 = [v9 siteIdentifierObject];

  uint64_t v10 = [v3 timestamp];
  uint64_t v11 = [v10 distributedSiteIdentifier];
  uint64_t v12 = [v16 identifier];
  [v11 setIdentifier:v12];

  uint64_t v13 = [v3 timestamp];

  id v14 = [*(id *)(a1 + 32) causalReference];
  id v15 = [v14 timestamp];
  [v13 setClock:[v15 clockValue]];
}

void sub_100014E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose((const void *)(v41 - 208), 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 256), 8);
  _Block_object_dispose((const void *)(v41 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100014F10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100014F20(uint64_t a1)
{
}

uint64_t sub_100014F28(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

void sub_100014F3C(uint64_t a1, unsigned char *a2)
{
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) bookmark];
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v5) {
    goto LABEL_18;
  }
  uint64_t v6 = [v5 frame];
  unsigned int v7 = [v6 state];

  if (v7 == 1)
  {
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v34 = 138412546;
      uint64_t v35 = v9;
      __int16 v36 = 2048;
      id v37 = [v4 offset];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "read new appended BMStoreEvent: %@ at offset %lu", (uint8_t *)&v34, 0x16u);
    }

    uint64_t v10 = a1 + 32;
    uint64_t v11 = [*(id *)(a1 + 32) ckAtomTableRecordForEvent:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) ofType:0 atBookmark:v4 previousTableRecord:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) siteIdentifier:*(void *)(a1 + 40)];
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (([*(id *)(*(void *)v10 + 48) addCKAtomRow:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) inStream:*(void *)(*(void *)v10 + 16)] & 1) == 0)
    {
      id v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }
LABEL_12:
    id v20 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) location];
    unsigned __int8 v21 = [v20 isEqual:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

    if ((v21 & 1) == 0)
    {
      uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) location];
      uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8);
      char v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      v25 = [*(id *)(*(void *)(a1 + 32) + 72) syncPolicy];
      unsigned __int8 v26 = [v25 supportsTransport:3 direction:3];

      if (v26) {
        [*(id *)(*(void *)v10 + 48) upsertCKRecordWithLocation:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) inStream:*(void *)(*(void *)v10 + 16)];
      }
    }
    goto LABEL_15;
  }
  if ((v7 & 0xFFFFFFFE) == 2)
  {
    id v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v34 = 138412546;
      uint64_t v35 = v16;
      __int16 v36 = 2048;
      id v37 = [v4 offset];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "read new deleted BMStoreEvent: %@ at offset %lu", (uint8_t *)&v34, 0x16u);
    }

    uint64_t v10 = a1 + 32;
    uint64_t v17 = [*(id *)(a1 + 32) ckAtomTableRecordForEvent:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) ofType:0 atBookmark:v4 previousTableRecord:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) siteIdentifier:*(void *)(a1 + 40)];
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    if (([*(id *)(*(void *)v10 + 48) addCKAtomRow:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) inStream:*(void *)(*(void *)v10 + 16)] & 1) == 0)
    {
      id v14 = __biome_log_for_category();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_20:
        uint64_t v30 = *(void *)(a1 + 56);
        uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        id v32 = *(void **)(*(void *)(v30 + 8) + 40);
        id v33 = [v4 offset];
        int v34 = 138412802;
        uint64_t v35 = v31;
        __int16 v36 = 2112;
        id v37 = v32;
        __int16 v38 = 2048;
        id v39 = v33;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "failed to insert record %@ for BMStoreEvent: %@ at offset %lu", (uint8_t *)&v34, 0x20u);
      }
LABEL_17:

LABEL_18:
      *a2 = 1;
      goto LABEL_19;
    }
    goto LABEL_12;
  }
LABEL_15:
  uint64_t v27 = [*(id *)(a1 + 48) nextEvent];
  uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
  long long v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v27;

LABEL_19:
}

void sub_100015380(uint64_t a1, unsigned char *a2)
{
  id v4 = [*(id *)(a1 + 32) nextEvent];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 bookmark];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = [v5 eventBody];
    id v10 = objc_alloc((Class)BMStoreBookmark);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = [v9 segmentName];
    id v13 = [v10 initWithStream:v11 segment:v12 iterationStartTime:[v9 offset] offset:1.79769313e308];

    id v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "read BMStoreEvent tombstone: %@ at tombstone bookmark %@", buf, 0x16u);
    }

    uint64_t v16 = [v5 eventBody];
    unint64_t v17 = (unint64_t)[v16 deletionReason];

    if (v17 == 1)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v9);
    }
    else if ((v17 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      uint64_t v18 = __biome_log_for_category();
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      LOBYTE(v33) = 16;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000157C4;
      block[3] = &unk_10006CAC0;
      void block[4] = buf;
      if (qword_1000802F8 != -1) {
        dispatch_once(&qword_1000802F8, block);
      }
      os_log_type_t v19 = *(unsigned char *)(*(void *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v20;
        *(_WORD *)&buf[22] = 2048;
        unint64_t v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "BMStoreEvent tombstone: %@ at tombstone bookmark: %@ with unexpected deletion reason %lu", buf, 0x20u);
      }
    }
    else
    {
      unsigned __int8 v21 = [*(id *)(a1 + 40) ckAtomTableRecordForEvent:0 ofType:2 atBookmark:v13 previousTableRecord:0 siteIdentifier:*(void *)(a1 + 48)];
      if (v21)
      {
        if ([*(id *)(*(void *)(a1 + 40) + 48) addCKAtomRow:v21 inStream:*(void *)(*(void *)(a1 + 40) + 16)])
        {
          uint64_t v22 = [v21 location];
          unsigned __int8 v23 = [v22 isEqual:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

          if ((v23 & 1) == 0)
          {
            uint64_t v24 = [v21 location];
            uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
            unsigned __int8 v26 = *(void **)(v25 + 40);
            *(void *)(v25 + 40) = v24;

            uint64_t v27 = [*(id *)(*(void *)(a1 + 40) + 72) syncPolicy];
            unsigned int v28 = [v27 supportsTransport:3 direction:3];

            if (v28) {
              [*(id *)(*(void *)(a1 + 40) + 48) upsertCKRecordWithLocation:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) inStream:*(void *)(*(void *)(a1 + 40) + 16)];
            }
          }
        }
        else
        {
          long long v29 = __biome_log_for_category();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            unint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            *(_DWORD *)long long buf = 138412802;
            *(void *)&uint8_t buf[4] = v21;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v9;
            *(_WORD *)&buf[22] = 2112;
            unint64_t v33 = v30;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "failed to insert record %@ for BMStoreEvent tombstone: %@ at tombstone bookmark: %@", buf, 0x20u);
          }

          *a2 = 1;
        }
      }
    }
  }
  else
  {
    *a2 = 1;
  }
}

uint64_t sub_1000157C4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

void sub_100015D90(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100045040();
  }

  uint64_t v7 = [v5 location];
  id v8 = [v7 state];

  if (v8 == (id)2)
  {
    if ([v5 type])
    {
      uint64_t v9 = 0;
      goto LABEL_41;
    }
    id v10 = [v5 location];
    uint64_t v11 = [v10 location];
    uint64_t v9 = [v11 siteIdentifier];

    uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
    if (!v12)
    {
      uint64_t v12 = [*(id *)(a1 + 40) readerForSiteIdentifier:v9];
      [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v9];
    }
    id v13 = [*(id *)(a1 + 40) bookmarkForAtomRow:v5];
    if (!v13)
    {
      uint64_t v18 = __biome_log_for_category();
      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      LOBYTE(v50) = 16;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000165B0;
      block[3] = &unk_10006CAC0;
      void block[4] = buf;
      if (qword_100080300 != -1) {
        dispatch_once(&qword_100080300, block);
      }
      os_log_type_t v19 = *(unsigned char *)(*(void *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "BMSyncCKAtomRow missing bookmark %@", buf, 0xCu);
      }

      goto LABEL_45;
    }
    id v14 = v13;
    uint64_t v15 = [v13 segmentName];
    unsigned __int8 v16 = [v15 isEqualToString:@"DOA"];

    if (v16)
    {
      unint64_t v17 = __biome_log_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "bookmark is DOA, not attempting to resolve event", buf, 2u);
      }
      goto LABEL_39;
    }
    uint64_t v20 = [*(id *)(a1 + 48) objectForKeyedSubscript:v9];
    if (!v20)
    {
      unsigned __int8 v26 = [v12 newEnumeratorFromBookmark:v14 options:7];
LABEL_30:
      [*(id *)(a1 + 48) setObject:v26 forKeyedSubscript:v9];
      unint64_t v17 = v26;
      goto LABEL_31;
    }
    unint64_t v17 = v20;
    unsigned __int8 v21 = [v20 bookmark];
    unsigned __int8 v22 = [v21 isEqual:v14];

    if ((v22 & 1) == 0)
    {
      unsigned __int8 v23 = [v17 bookmark];
      uint64_t v24 = [v23 segmentName];
      uint64_t v25 = [v14 segmentName];
      if ([v24 isEqualToString:v25])
      {

LABEL_25:
        unsigned int v28 = __biome_log_for_category();
        *(void *)long long buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2020000000;
        LOBYTE(v50) = 16;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_1000165C4;
        v47[3] = &unk_10006CAC0;
        v47[4] = buf;
        if (qword_100080308 != -1) {
          dispatch_once(&qword_100080308, v47);
        }
        os_log_type_t v29 = *(unsigned char *)(*(void *)&buf[8] + 24);
        _Block_object_dispose(buf, 8);
        if (os_log_type_enabled(v28, v29))
        {
          unint64_t v30 = [v17 bookmark];
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v14;
          _os_log_impl((void *)&_mh_execute_header, v28, v29, "Next enumerator bookmark %@ doesn't match expected %@", buf, 0x16u);
        }
        unsigned __int8 v26 = [v12 newEnumeratorFromBookmark:v14 options:7];

        goto LABEL_30;
      }
      [v17 currentFrameStore];
      uint64_t v27 = v44 = v23;
      unsigned __int8 v42 = [v27 offsetIsStartOfFrameStore:[v14 offset]];

      if ((v42 & 1) == 0) {
        goto LABEL_25;
      }
    }
LABEL_31:
    uint64_t v31 = [v17 nextEvent];
    id v32 = __biome_log_for_category();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v45 = [v31 eventBodyData];
      id v41 = [v45 length];
      id v40 = [v14 offset];
      uint64_t v43 = [v5 timestamp];
      id v39 = [v43 bm_description];
      *(_DWORD *)long long buf = 134218498;
      *(void *)&uint8_t buf[4] = v41;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v40;
      *(_WORD *)&buf[22] = 2112;
      v50 = v39;
      _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Read event of size %llu at offset %lu for atom %@", buf, 0x20u);
    }
    unint64_t v33 = [v31 bookmark];
    unsigned __int8 v34 = [v33 isEqual:v14];

    if (v34) {
      goto LABEL_40;
    }
    uint64_t v35 = __biome_log_for_category();
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v50) = 16;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000165D8;
    v46[3] = &unk_10006CAC0;
    v46[4] = buf;
    if (qword_100080310 != -1) {
      dispatch_once(&qword_100080310, v46);
    }
    os_log_type_t v36 = *(unsigned char *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v35, v36))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "populateAtomBatch missing event for bookmark %@, adding a placeholder append", buf, 0xCu);
    }

LABEL_39:
    uint64_t v31 = 0;
LABEL_40:

    uint64_t v9 = v31;
LABEL_41:
    id v37 = [*(id *)(a1 + 40) atomValueFromEvent:v9 ofType:[v5 type] version:*(void *)(a1 + 72)];
    uint64_t v12 = [v37 serialize];

    if (([*(id *)(a1 + 40) addAtomToAtomBatch:*(void *)(a1 + 56) ifChunkerAllows:*(void *)(a1 + 64) fromAtomTableRecord:v5 atomValueData:v12 version:*(unsigned __int8 *)(a1 + 80) atomValueVersion:*(void *)(a1 + 72)] & 1) == 0)
    {
      __int16 v38 = __biome_log_for_category();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "chunker hit defined limit, returning and setting moreComing bit", buf, 2u);
      }

      [*(id *)(a1 + 64) setMoreComing:1];
      *a3 = 1;
    }
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ location is not active", buf, 0xCu);
  }
LABEL_46:
}

uint64_t sub_1000165B0(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_1000165C4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_1000165D8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

void sub_1000168C0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "creating new batch with location %@", buf, 0xCu);
  }

  id v8 = [v6 location];
  uint64_t v9 = [v8 ckMergeableValueIDWithFormatVersion:0];

  id v13 = 0;
  id v10 = [objc_alloc((Class)CKAtomBatch) initWriterWithMergeableValueID:v9 metadata:0 formatVersion:2 error:&v13];
  id v11 = v13;
  if (v11)
  {
    uint64_t v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100045138();
    }
  }
  else
  {
    [*(id *)(a1 + 32) populateAtomBatch:v10 withAtomsInClockVector:*(void *)(a1 + 40) forLocation:v6 ckFormatVersion:*(unsigned __int8 *)(a1 + 64) valueVersion:0 chunker:*(void *)(a1 + 48)];
    if ([v10 count]) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    *a4 = [*(id *)(a1 + 48) moreComing];
  }
}

void sub_100016E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016E80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) bookmarkForAtomRow:v3];
  id v5 = v4;
  if (v4
    && ([v4 segmentName],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isEqual:@"DOA"],
        v6,
        !v7))
  {
    uint64_t v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "deleting event at bookmark %@", buf, 0xCu);
    }

    id v10 = *(void **)(a1 + 40);
    id v15 = 0;
    unsigned __int8 v11 = [v10 deleteEventAtBookmark:v5 outTombstoneBookmark:&v15];
    id v12 = v15;
    if ((v11 & 1) == 0)
    {
      id v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        sub_1000451A0();
      }
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(NSObject **)(v14 + 40);
    *(void *)(v14 + 40) = v12;
  }
  else
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "bookmark is nil, presumably because the referenced atom was a placeholder append (dead on arrival) %@", buf, 0xCu);
    }
  }
}

void sub_100017B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void sub_100017BCC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  [*(id *)(a1 + 32) markOperationStarted];
  unsigned int v7 = [v6 timestamp];
  id v8 = [v7 timestamp];

  uint64_t v9 = a1 + 40;
  if ([*(id *)(*(void *)(a1 + 40) + 48) containsCKAtomRowWithTimestamp:v8 inStream:*(void *)(*(void *)(a1 + 40) + 16) onDisk:1])
  {
    id v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v11 = [v8 bm_description];
      uint64_t v12 = *(void *)(*(void *)v9 + 8);
      *(_DWORD *)long long buf = 138412546;
      id v64 = v11;
      __int16 v65 = 2112;
      uint64_t v66 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Warning: dropping atom %@ in stream %@ because it is already merged", buf, 0x16u);
    }
    id v13 = [*(id *)(a1 + 48) originatingSiteIdentifier];
    id v14 = objc_alloc((Class)NSString);
    id v15 = [v6 timestamp];
    unsigned __int8 v16 = [v15 siteIdentifier];
    id v17 = [v14 initWithData:v16 encoding:4];

    uint64_t v18 = *(void *)(a1 + 40);
    os_log_type_t v19 = *(void **)(v18 + 80);
    uint64_t v20 = *(void *)(v18 + 16);
    id v21 = [v17 length];
    id v22 = v17;
    if (!v21) {
      id v22 = *(id *)(a1 + 56);
    }
    [v19 recordAtomMergeResult:1 inStream:v20 ownerSite:v22 originatingSite:v13 eventCreatedAt:*(void *)(a1 + 48) sessionContext:0.0];
    goto LABEL_10;
  }
  if (![*(id *)(*(void *)v9 + 48) containsCKAtomRowWithTimestamp:v8 inStream:*(void *)(*(void *)v9 + 16) onDisk:0])
  {
    uint64_t v24 = [v6 references];
    uint64_t v25 = [v24 proxyAtIndex:0];
    id v13 = [v25 reference];

    unsigned __int8 v26 = [v13 timestamp];
    id v27 = [v26 clockValue];

    if (v27)
    {
      uint64_t v28 = [v13 mergeableValueID];
      if (!v28) {
        goto LABEL_22;
      }
      os_log_type_t v29 = (void *)v28;
      unint64_t v30 = [v13 mergeableValueID];
      uint64_t v31 = [v30 identifier];

      if (!v31)
      {
LABEL_22:
        uint64_t v43 = __biome_log_for_category();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
          sub_100045550();
        }

        *a4 = 1;
        goto LABEL_11;
      }
      id v32 = *(void **)(a1 + 64);
      unint64_t v33 = [v13 mergeableValueID];
      unsigned __int8 v34 = [v33 name];
      uint64_t v35 = [v32 objectForKey:v34];

      if (!v35)
      {
        os_log_type_t v36 = [BMStreamCRDTLocation alloc];
        id v37 = [v13 mergeableValueID];
        uint64_t v35 = [(BMStreamCRDTLocation *)v36 initWithCKMergeableValueID:v37 streamName:*(void *)(*(void *)(a1 + 40) + 16)];

        __int16 v38 = *(void **)(a1 + 64);
        id v39 = [v13 mergeableValueID];
        id v40 = [v39 name];
        [v38 setObject:v35 forKey:v40];
      }
      uint64_t v41 = [*(id *)(a1 + 72) objectForKey:v35];
      v61 = a4;
      v62 = v8;
      v60 = v35;
      if (!v35 || v41)
      {
        uint64_t v42 = v41;
      }
      else
      {
        uint64_t v42 = [*(id *)(*(void *)v9 + 48) locationRowWithLocation:v35];
        if (!v42)
        {
          uint64_t v42 = [*(id *)(*(void *)v9 + 48) insertLocationIfNotExists:v35 withState:1];
          if (!v42)
          {
            v56 = __biome_log_for_category();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
              sub_100045590();
            }

            *a4 = 1;
            goto LABEL_11;
          }
        }
        [*(id *)(a1 + 72) setObject:v42 forKey:v35];
      }
    }
    else
    {
      v61 = a4;
      v62 = v8;

      uint64_t v42 = 0;
      v60 = 0;
      id v13 = 0;
    }
    v44 = [BMSyncCKAtomRow alloc];
    uint64_t v57 = *(void *)(a1 + 80);
    v58 = v44;
    v45 = [v6 timestamp];
    v46 = [v45 timestamp];
    id v47 = [v6 atomType];
    id v48 = [v6 version];
    v49 = [v6 value];
    v50 = v58;
    id v59 = (void *)v42;
    v51 = [(BMSyncCKAtomRow *)v50 initWithLocation:v57 timestamp:v46 referenceLocation:v42 causalReference:v13 type:v47 valueVersion:v48 valueData:v49];

    v52 = __biome_log_for_category();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
      sub_100045458(v51, v52);
    }

    if ([*(id *)(*(void *)v9 + 48) addCKAtomRow:v51 inStream:*(void *)(*(void *)v9 + 16)])
    {
      v54 = v59;
      BOOL v53 = v60;
      if ([*(id *)(a1 + 32) markOperationComplete])
      {
LABEL_37:

        id v8 = v62;
        goto LABEL_11;
      }
      uint64_t v55 = __biome_log_for_category();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        sub_100045328();
      }
    }
    else
    {
      uint64_t v55 = __biome_log_for_category();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        sub_10004535C(v51, v9, v55);
      }
      v54 = v59;
      BOOL v53 = v60;
    }

    unsigned char *v61 = 1;
    goto LABEL_37;
  }
  id v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [v8 bm_description];
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = *(void *)(*(void *)v9 + 8);
    *(_DWORD *)long long buf = 138412546;
    id v64 = v17;
    __int16 v65 = 2112;
    uint64_t v66 = v23;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Warning: atom %@ in stream %@ already in table but not on disk", buf, 0x16u);
LABEL_10:
  }
LABEL_11:
}

void sub_1000181F8(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (![v5 type])
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) frame];
    unsigned int v7 = [v6 data];

    [v7 bytes];
    [v7 length];
    LODWORD(v6) = bm_generateChecksum();
    id v8 = [v5 valueData];
    uint64_t v9 = +[BMSyncAtomValue atomValueFromData:version:](BMSyncAtomValue, "atomValueFromData:version:", v8, [v5 valueVersion]);

    id v10 = [v9 value];
    unsigned __int8 v11 = [v10 eventData];
    [v11 bytes];
    [v11 length];
    if (v6 == bm_generateChecksum())
    {
      id v27 = v10;
      uint64_t v28 = v9;
      os_log_type_t v29 = v7;
      unint64_t v30 = a3;
      uint64_t v25 = [BMSyncCKAtomRow alloc];
      uint64_t v12 = [v5 location];
      id v13 = [v5 timestamp];
      id v14 = [v5 referenceLocation];
      id v15 = [v5 causalReference];
      id v24 = [v5 type];
      unsigned __int8 v16 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) bookmark];
      id v17 = [v16 segmentName];
      uint64_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) bookmark];
      unsigned __int8 v26 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:](v25, "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:", v12, v13, v14, v15, v24, v17, [v18 offset]);

      os_log_type_t v19 = __biome_log_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v32 = v5;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "updating row for atom inferred to be applied to disk %@", buf, 0xCu);
      }

      unsigned int v7 = v29;
      a3 = v30;
      id v10 = v27;
      uint64_t v9 = v28;
      if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "updateCKAtomRow:inStream:") & 1) == 0)
      {
        uint64_t v20 = __biome_log_for_category();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100045604();
        }
      }
    }
  }
  uint64_t v21 = [*(id *)(a1 + 40) nextEvent];
  uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    *a3 = 1;
  }
}

void sub_100018524(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) originatingSiteIdentifier];
  id v7 = objc_alloc((Class)NSString);
  id v8 = [v5 timestamp];
  uint64_t v9 = [v8 siteIdentifierObject];
  id v10 = [v9 identifier];
  id v11 = [v7 initWithData:v10 encoding:4];

  uint64_t v12 = [v5 causalReference];
  unsigned __int8 v13 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) isEqualToReference:v12];
  if (!v12) {
    goto LABEL_8;
  }
  if (v13) {
    goto LABEL_8;
  }
  id v14 = *(void **)(*(void *)(a1 + 40) + 48);
  id v15 = [v12 timestamp];
  LOBYTE(v14) = [v14 containsCKAtomRowWithTimestamp:v15 inStream:*(void *)(*(void *)(a1 + 40) + 16) onDisk:1];

  if (v14) {
    goto LABEL_8;
  }
  unsigned __int8 v16 = [v5 referenceLocation];
  id v17 = (char *)[v16 state];

  uint64_t v18 = __biome_log_for_category();
  os_log_type_t v19 = v18;
  if ((unint64_t)(v17 - 3) <= 1)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = [v5 referenceLocation];
      *(_DWORD *)long long buf = 138412290;
      v67 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "causal reference location %@ points to dead location, not a violation", buf, 0xCu);
    }
LABEL_8:
    uint64_t v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100045734(v5, v21);
    }

    if ([v5 type])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      uint64_t v22 = *(void **)(a1 + 40);
      uint64_t v23 = *(void *)(a1 + 56);
      id v63 = 0;
      id v64 = 0;
      unsigned __int8 v24 = [v22 handleDeleteAtomRow:v5 usingPruner:v23 outBookmark:&v64 outTombstoneBookmark:&v63];
      unint64_t v25 = (unint64_t)v64;
      id v26 = v63;
      [*(id *)(*(void *)(a1 + 40) + 48) saveLatestTombstoneBookmark:v26 forSiteIdentifier:*(void *)(a1 + 64) inStream:*(void *)(*(void *)(a1 + 40) + 16)];
      id v27 = 0;
      if ((v24 & 1) == 0)
      {
LABEL_28:
        uint64_t v42 = __biome_log_for_category();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_10004566C(v5, v42);
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v28 = [v5 valueData];
      id v27 = +[BMSyncAtomValue atomValueFromData:version:](BMSyncAtomValue, "atomValueFromData:version:", v28, [v5 valueVersion]);

      if (!v27)
      {
        unint64_t v25 = 0;
        id v26 = 0;
        goto LABEL_28;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      os_log_type_t v29 = *(void **)(a1 + 40);
      uint64_t v30 = *(void *)(a1 + 48);
      id v65 = 0;
      unsigned __int8 v31 = [v29 writeAtomValue:v27 fromAtomRow:v5 usingWriter:v30 outBookmark:&v65];
      unint64_t v25 = (unint64_t)v65;
      id v26 = 0;
      if ((v31 & 1) == 0) {
        goto LABEL_28;
      }
    }
    uint64_t v57 = a3;
    id v58 = v26;
    v60 = v12;
    id v61 = v11;
    v62 = v6;
    id v59 = v27;
    id v32 = [v27 value];
    uint64_t v33 = [v32 eventData];
    unint64_t v34 = v33 | v25;

    if (!v34) {
      unint64_t v25 = (unint64_t)[objc_alloc((Class)BMStoreBookmark) initWithStream:*(void *)(*(void *)(a1 + 40) + 8) segment:@"DOA" iterationStartTime:clock_gettime_nsec_np(_CLOCK_MONOTONIC) offset:0.0];
    }
    uint64_t v35 = [BMSyncCKAtomRow alloc];
    os_log_type_t v36 = [v5 location];
    id v37 = [v5 timestamp];
    __int16 v38 = [v5 referenceLocation];
    id v39 = [v5 causalReference];
    id v40 = [v5 type];
    uint64_t v41 = [(id)v25 segmentName];
    uint64_t v42 = -[BMSyncCKAtomRow initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:](v35, "initWithLocation:timestamp:referenceLocation:causalReference:type:segmentName:segmentOffset:", v36, v37, v38, v39, v40, v41, [(id)v25 offset]);

    if ([*(id *)(*(void *)(a1 + 40) + 48) updateCKAtomRow:v42 inStream:*(void *)(*(void *)(a1 + 40) + 16)])
    {
      id v11 = v61;
      id v26 = v58;
      if (![v5 type])
      {
        uint64_t v43 = [v5 location];
        v44 = [v43 location];
        v45 = [v44 ckMergeableValueIDWithFormatVersion:0];

        id v46 = objc_alloc((Class)CKAtomReference);
        id v47 = [v5 timestamp];
        id v48 = [v46 initWithMergeableValueID:v45 timestamp:v47 type:0];
        uint64_t v49 = *(void *)(*(void *)(a1 + 72) + 8);
        v50 = *(void **)(v49 + 40);
        *(void *)(v49 + 40) = v48;
      }
      uint64_t v51 = *(void *)(a1 + 40);
      v52 = *(void **)(v51 + 80);
      uint64_t v53 = *(void *)(v51 + 16);
      id v27 = v59;
      v54 = [v59 value];
      [v54 dataTimestamp];
      uint64_t v55 = v53;
      id v6 = v62;
      [v52 recordAtomMergeResult:3 inStream:v55 ownerSite:v61 originatingSite:v62 eventCreatedAt:*(void *)(a1 + 32)];

      uint64_t v12 = v60;
    }
    else
    {
      v56 = __biome_log_for_category();
      id v11 = v61;
      id v26 = v58;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_100045604();
      }

      *uint64_t v57 = 1;
      id v6 = v62;
      id v27 = v59;
      uint64_t v12 = v60;
    }
    goto LABEL_30;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1000457FC(v5, v12, v19);
  }

  [*(id *)(*(void *)(a1 + 40) + 80) recordAtomMergeResult:2 inStream:*(void *)(*(void *)(a1 + 40) + 16) ownerSite:v11 originatingSite:v6 eventCreatedAt:*(void *)(a1 + 32) sessionContext:0.0];
  *a3 = 1;
LABEL_31:
}

void sub_100018C40(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_100018C94(uint64_t result)
{
  if (result)
  {
    if (*(unsigned char *)(result + 24)) {
      return *(unsigned int *)(result + 8);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100018CC0(uint64_t result, int a2)
{
  if (result)
  {
    *(unsigned char *)(result + 24) |= 1u;
    *(_DWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_100018CE8(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 24) = *(unsigned char *)(result + 24) & 0xFE | a2;
  }
  return result;
}

uint64_t sub_100018D08(uint64_t result)
{
  if (result) {
    return *(unsigned char *)(result + 24) & 1;
  }
  return result;
}

__CFString *sub_100018D20(__CFString *a1, uint64_t a2)
{
  if (a1)
  {
    if (a2 >= 5)
    {
      a1 = +[NSString stringWithFormat:@"(unknown: %i)", a2];
    }
    else
    {
      a1 = off_10006D168[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

uint64_t sub_100018D84(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Append"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"TTLDelete"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"RandomDelete"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"Modify"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"Unknown"])
    {
      uint64_t v6 = 4;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

BOOL sub_100018E5C(BOOL result)
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

uint64_t sub_100019014(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v9 = v5++ >= 9;
      if (v9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 2)
    {
      id v17 = objc_alloc_init(BMPBStoreEventAtomValue);
      objc_storeStrong((id *)(a1 + 16), v17);
      if (!PBReaderPlaceMark() || (sub_100037818((uint64_t)v17, a2) & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    else if ((v6 >> 3) == 1)
    {
      char v12 = 0;
      unsigned int v13 = 0;
      uint64_t v14 = 0;
      *(unsigned char *)(a1 + 24) |= 1u;
      while (1)
      {
        unint64_t v15 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v15 == -1 || v15 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v15);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v15 + 1;
        v14 |= (unint64_t)(v16 & 0x7F) << v12;
        if ((v16 & 0x80) == 0) {
          goto LABEL_32;
        }
        v12 += 7;
        BOOL v9 = v13++ >= 9;
        if (v9)
        {
          LODWORD(v14) = 0;
          goto LABEL_34;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v14) = 0;
      }
LABEL_34:
      *(_DWORD *)(a1 + 8) = v14;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100019330(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 24))
    {
      v3[2] = *(_DWORD *)(a1 + 8);
      *((unsigned char *)v3 + 24) |= 1u;
    }
    char v4 = *(void **)(a1 + 16);
    if (v4)
    {
      unsigned int v5 = v3;
      sub_1000193BC((uint64_t)v3, v4);
      id v3 = v5;
    }
  }
}

void sub_1000193BC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

uint64_t sub_10001957C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if (v3[6])
    {
      *(_DWORD *)(a1 + 8) = v3[2];
      *(unsigned char *)(a1 + 24) |= 1u;
    }
    char v4 = (void *)*((void *)v3 + 2);
    if (*(void *)(a1 + 16))
    {
      if (v4) {
        sub_100037EB8(*(void *)(a1 + 16), v4);
      }
    }
    else if (v4)
    {
      objc_storeStrong((id *)(a1 + 16), v4);
    }
  }

  return _objc_release_x2();
}

uint64_t sub_10001962C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

id sub_10001A1B4(uint64_t a1)
{
  uint64_t v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "BMRapportManager: received SIGTERM", v4, 2u);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_10001A408(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  if (v3)
  {
    char v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10004592C((uint64_t)v3, v4);
    }

    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v5 = *(void *)(a1 + 32);
    unint64_t v6 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10001A4A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  if (v3)
  {
    char v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000459A4((uint64_t)v3, v4);
    }

    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v5 = *(void *)(a1 + 32);
    unint64_t v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10001A538(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) count];
  uint64_t v3 = *(void *)(a1 + 40);
  if ((unint64_t)v2 > 1)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    NSErrorUserInfoKey v8 = NSMultipleUnderlyingErrorsKey;
    uint64_t v9 = v4;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    unint64_t v6 = +[NSError errorWithDomain:@"BMRapportErrorDomain" code:1 userInfo:v5];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v6);
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) firstObject];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

void sub_10001AF10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
}

void sub_10001AF74(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateClientWithError:0];
}

void sub_10001AFB8(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleActivationForDevice:v5 error:v4];
}

void sub_10001B5C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001B5EC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if ([v9 code] == (id)-71148
    && ([v9 domain],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isEqualToString:RPErrorDomain],
        v5,
        v6))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained invalidateClientWithError:v9];
  }
  else
  {
    NSErrorUserInfoKey v8 = *(void **)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [v8 sendNextRequestToDevice:WeakRetained];
  }
}

void sub_10001BA90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_10001C9E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_10001DEF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = [v3 stringForColumnIndex:0];
  id v4 = objc_alloc((Class)CKDistributedSiteIdentifier);
  id v5 = [v10 dataUsingEncoding:4];
  id v6 = [v4 initWithIdentifier:v5];

  id v7 = objc_alloc((Class)NSIndexSet);
  id v8 = [v3 unsignedLongLongIntForColumnIndex:1];

  id v9 = [v7 initWithIndex:v8];
  [*(id *)(a1 + 32) addClockValuesInIndexSet:v9 forSiteIdentifier:v6];
}

id sub_10001E308(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (int)[a2 intForColumn:@"clock"];

  return [v2 addIndex:v3];
}

void sub_10001E5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E5E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001E5F8(uint64_t a1)
{
}

void sub_10001E600(uint64_t a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = [v15 stringForColumn:@"site"];
  id v4 = objc_alloc((Class)CKDistributedSiteIdentifier);
  id v5 = [v3 dataUsingEncoding:4];
  id v6 = [v4 initWithIdentifier:v5];

  unsigned int v7 = [v15 intForColumn:@"type"];
  id v8 = [objc_alloc((Class)NSIndexSet) initWithIndex:[v15 intForColumn:@"clock"]];
  if (v7 == 2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addClockValuesInIndexSet:v8 withAtomState:1 forSiteIdentifier:v6];
    id v9 = [v15 stringForColumn:@"ref_site"];
    id v10 = v9;
    if (v9 && [v9 length])
    {
      id v11 = objc_alloc((Class)CKDistributedSiteIdentifier);
      char v12 = [v10 dataUsingEncoding:4];
      id v13 = [v11 initWithIdentifier:v12];

      id v14 = [objc_alloc((Class)NSIndexSet) initWithIndex:objc_msgSend(v15, "intForColumn:", @"ref_clock")];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addClockValuesInIndexSet:v14 withAtomState:2 forSiteIdentifier:v13];
    }
  }
  else if (!v7)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addClockValuesInIndexSet:v8 withAtomState:1 forSiteIdentifier:v6];
  }
}

void sub_10001FA28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [[BMSyncCKAtomRow alloc] initWithFMResultSet:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, BMSyncCKAtomRow *, uint64_t))(v4 + 16))(v4, v5, a3);
}

void sub_10001FCF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [[BMSyncCKAtomRow alloc] initWithFMResultSet:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, BMSyncCKAtomRow *, uint64_t))(v4 + 16))(v4, v5, a3);
}

void sub_1000204E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_100020530(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v5 = *(void *)(v4 + 24);
  *(void *)(v4 + 24) = v5 + 1;
  if (v5 < 0x1F5)
  {
    if (a3 == 1)
    {
      id v11 = *(void **)(a1 + 32);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        CFStringRef v12 = @"AND clock = ? ";
      }
      else {
        CFStringRef v12 = @"OR clock = ? ";
      }
    }
    else
    {
      BOOL v13 = sub_1000067EC(a2, a3);
      id v11 = *(void **)(a1 + 32);
      if (!v13)
      {
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          CFStringRef v17 = @"AND clock BETWEEN ? ";
        }
        else {
          CFStringRef v17 = @"OR clock BETWEEN ? ";
        }
        [v11 addObject:v17];
        uint64_t v18 = *(void **)(a1 + 32);
        os_log_type_t v19 = +[NSNumber numberWithUnsignedInteger:a2];
        [v18 addObject:v19];

        [*(id *)(a1 + 32) addObject:@" AND ?"];
        uint64_t v20 = *(void **)(a1 + 32);
        id v15 = +[NSNumber numberWithUnsignedInteger:a3 + a2 - 1];
        char v16 = v20;
        goto LABEL_18;
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        CFStringRef v12 = @"AND clock >= ? ";
      }
      else {
        CFStringRef v12 = @"OR clock >= ? ";
      }
    }
    [v11 addObject:v12];
    id v14 = *(void **)(a1 + 32);
    id v15 = +[NSNumber numberWithUnsignedInteger:a2];
    char v16 = v14;
LABEL_18:
    [v16 addObject:v15];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    return;
  }
  unsigned int v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100045F38(v7);
  }

  *a4 = 1;
}

void sub_1000206E8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) SELECT_FROM:@"CKAtom" COLUMNS:&off_1000728B0 JOIN:&off_1000728C8 WHERE:*(void *)(a1 + 40) GROUP_BY:&off_1000728E0 HAVING:&off_1000728F8 ORDER_BY:0 LIMIT:0];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100020800;
  v5[3] = &unk_10006D2B0;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = *(id *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 56);
  id v2 = (id)v4;
  long long v8 = v4;
  id v3 = v6;
  [v3 enumerateWithBlock:v5];
  [v3 close];
}

void sub_100020800(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  unint64_t v5 = [[BMSyncCRDTLocationRow alloc] initWithFMResultSet:*(void *)(a1 + 32) modifier:1];
  if (v5)
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
  else
  {
    id v6 = +[NSString stringWithFormat:@"received nil CRDTLocation while enumerating active locations for stream: %@", *(void *)(a1 + 48), NSDebugDescriptionErrorKey];
    CFStringRef v12 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v8 = +[NSError errorWithDomain:@"BMSyncDatabaseErrorDomain" code:1 userInfo:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a3 = 1;
  }
}

void sub_100020D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_100020D80(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v5 = *(void *)(v4 + 24);
  *(void *)(v4 + 24) = v5 + 1;
  if (v5 < 0x1F5)
  {
    if (a3 == 1)
    {
      uint64_t v11 = *(void **)(a1 + 32);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        CFStringRef v12 = @"AND clock = ? ";
      }
      else {
        CFStringRef v12 = @"OR clock = ? ";
      }
    }
    else
    {
      BOOL v13 = sub_1000067EC(a2, a3);
      uint64_t v11 = *(void **)(a1 + 32);
      if (!v13)
      {
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          CFStringRef v17 = @"AND clock BETWEEN ? ";
        }
        else {
          CFStringRef v17 = @"OR clock BETWEEN ? ";
        }
        [v11 addObject:v17];
        uint64_t v18 = *(void **)(a1 + 32);
        os_log_type_t v19 = +[NSNumber numberWithUnsignedInteger:a2];
        [v18 addObject:v19];

        [*(id *)(a1 + 32) addObject:@" AND ?"];
        uint64_t v20 = *(void **)(a1 + 32);
        id v15 = +[NSNumber numberWithUnsignedInteger:a3 + a2 - 1];
        char v16 = v20;
        goto LABEL_18;
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        CFStringRef v12 = @"AND clock >= ? ";
      }
      else {
        CFStringRef v12 = @"OR clock >= ? ";
      }
    }
    [v11 addObject:v12];
    id v14 = *(void **)(a1 + 32);
    id v15 = +[NSNumber numberWithUnsignedInteger:a2];
    char v16 = v14;
LABEL_18:
    [v16 addObject:v15];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    return;
  }
  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100045F38(v7);
  }

  *a4 = 1;
}

void sub_100020F38(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) SELECT_ATOMS_WHERE:ORDER_BY:LIMIT: *(void *)(a1 + 40), &off_100072910, 0];
  unint64_t v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  id v7 = sub_100020FFC;
  uint64_t v8 = &unk_10006D260;
  id v3 = *(id *)(a1 + 48);
  id v9 = v2;
  id v10 = v3;
  id v4 = v2;
  [v4 enumerateWithBlock:&v5];
  [v4 close:v5, v6, v7, v8];
}

void sub_100020FFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  unint64_t v5 = [[BMSyncCKAtomRow alloc] initWithFMResultSet:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, BMSyncCKAtomRow *, uint64_t))(v4 + 16))(v4, v5, a3);
}

void sub_100021494(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_100021868(void *a1)
{
  if (([*(id *)(a1[4] + 8) start] & 1) == 0)
  {
    uint64_t v2 = a1[5];
    if (v2)
    {
      id v3 = +[NSError errorWithDomain:BMSyncErrorDomain code:2 userInfo:0];
      (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
    }
    uint64_t v4 = a1[6];
    if (v4)
    {
      unint64_t v5 = +[NSError errorWithDomain:BMSyncErrorDomain code:2 userInfo:0];
      id v7 = v5;
      uint64_t v6 = +[NSArray arrayWithObjects:&v7 count:1];
      (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, &__NSArray0__struct, v6);
    }
  }
}

uint64_t sub_10002198C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000219A4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void sub_100021A84(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) start])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) syncScheduler];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100021C44;
    v9[3] = &unk_10006D328;
    id v10 = *(id *)(a1 + 48);
    [v2 syncRapportNowIfPolicyAllowsWithReason:5 activity:0 completionHandler:v9];

    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    }
    uint64_t v4 = v10;
    goto LABEL_9;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    uint64_t v6 = +[NSError errorWithDomain:BMSyncErrorDomain code:2 userInfo:0];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    uint64_t v4 = +[NSError errorWithDomain:BMSyncErrorDomain code:2 userInfo:0];
    uint64_t v11 = v4;
    uint64_t v8 = +[NSArray arrayWithObjects:&v11 count:1];
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, &__NSArray0__struct, v8);

LABEL_9:
  }
}

uint64_t sub_100021C44(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100021D4C(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) start])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) syncScheduler];
    uint64_t v3 = *(void *)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100021F14;
    v10[3] = &unk_10006D328;
    id v11 = *(id *)(a1 + 56);
    [v2 syncRapportNowIfPolicyAllowsWithDevices:v3 reason:5 activity:0 completionHandler:v10];

    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
    uint64_t v5 = v11;
    goto LABEL_9;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    uint64_t v7 = +[NSError errorWithDomain:BMSyncErrorDomain code:2 userInfo:0];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    uint64_t v5 = +[NSError errorWithDomain:BMSyncErrorDomain code:2 userInfo:0];
    CFStringRef v12 = v5;
    id v9 = +[NSArray arrayWithObjects:&v12 count:1];
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, &__NSArray0__struct, v9);

LABEL_9:
  }
}

uint64_t sub_100021F14(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10002207C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100022204(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100022330(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100022524(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) teardown];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

uint64_t sub_1000226EC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100022818(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000228C8(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) start])
  {
    uint64_t v26 = a1;
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) primaryDatabase];
    uint64_t v3 = [[BMSyncDevicePeerStatusTracker alloc] initWithDatabase:v2];
    uint64_t v4 = [(BMSyncDevicePeerStatusTracker *)v3 localDeviceIdentifierCreatingIfNecessary];
    id v5 = [(BMSyncDevicePeerStatusTracker *)v3 allPeers];

    uint64_t v6 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v5;
    id v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v34;
      id v27 = v6;
      uint64_t v28 = v4;
      do
      {
        id v10 = 0;
        id v29 = v8;
        do
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v10);
          CFStringRef v12 = [v11 deviceIdentifier];
          unsigned __int8 v13 = [v12 isEqualToString:v4];

          if ((v13 & 1) == 0)
          {
            id v31 = objc_alloc((Class)BMDevice);
            uint64_t v14 = [v11 deviceIdentifier];
            id v15 = [v11 idsDeviceIdentifier];
            char v16 = [v11 metadata];
            CFStringRef v17 = [v16 name];
            uint64_t v18 = [v11 metadata];
            [v18 model];
            v20 = uint64_t v19 = v9;
            uint64_t v21 = [v11 metadata];
            uint64_t v22 = (void *)v14;
            id v23 = [v31 initWithDeviceIdentifier:v14 idsDeviceIdentifier:v15 name:v17 model:v20 platform:[v21 platform]];

            uint64_t v9 = v19;
            id v8 = v29;

            uint64_t v4 = v28;
            uint64_t v6 = v27;
            [v27 addObject:v23];
          }
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v8);
    }

    uint64_t v24 = *(void *)(v26 + 40);
    if (v24) {
      (*(void (**)(uint64_t, void *, void))(v24 + 16))(v24, v6, 0);
    }
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 40);
    if (v25)
    {
      id v32 = +[NSError errorWithDomain:BMSyncErrorDomain code:2 userInfo:0];
      (*(void (**)(uint64_t, void *))(v25 + 16))(v25, &__NSArray0__struct);
    }
  }
}

void sub_100022CAC(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) start])
  {
    uint64_t v2 = [BMSyncDevicePeerStatusTracker alloc];
    uint64_t v22 = a1;
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) primaryDatabase];
    uint64_t v4 = [(BMSyncDevicePeerStatusTracker *)v2 initWithDatabase:v3];

    id v5 = [(BMSyncDevicePeerStatusTracker *)v4 allPeers];
    uint64_t v21 = v4;
    uint64_t v6 = [(BMSyncDevicePeerStatusTracker *)v4 localDeviceIdentifierCreatingIfNecessary];
    id v7 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          unsigned __int8 v13 = [v12 dictionaryRepresentation];
          id v14 = [v13 mutableCopy];

          id v15 = [v12 deviceIdentifier];
          unsigned int v16 = [v15 isEqual:v6];

          if (v16) {
            [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isMe"];
          }
          CFStringRef v17 = [v12 metadata];
          [v17 platform];
          uint64_t v18 = BMDevicePlatformGetDescription();
          [v14 setObject:v18 forKeyedSubscript:@"platformDescription"];

          [v7 addObject:v14];
        }
        id v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v9);
    }

    uint64_t v19 = *(void *)(v22 + 40);
    if (v19) {
      (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v7, 0);
    }
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20)
    {
      id obja = +[NSError errorWithDomain:BMSyncErrorDomain code:2 userInfo:0];
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, &__NSArray0__struct);
    }
  }
}

void sub_100023054(id a1)
{
  id v1 = objc_alloc_init(BMSyncDevice);
  uint64_t v2 = (void *)qword_100080318;
  qword_100080318 = (uint64_t)v1;

  id v3 = +[BMDeviceMetadataUtils platform];
  *(void *)(qword_100080318 + 8) = v3;
}

__CFString *BMRapportErrorToString(unint64_t a1)
{
  if (a1 >= 0xF)
  {
    id v1 = +[NSString stringWithFormat:@"Unknown error (code %ld)", a1];
  }
  else
  {
    id v1 = off_10006D438[a1];
  }

  return v1;
}

id sub_100023408(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _validateDevice:a2];
}

id sub_1000259F8(unint64_t a1)
{
  if (a1 >= 5) {
    id v1 = [objc_alloc((Class)NSString) initWithFormat:@"BMSyncAtomType(%llu)", a1];
  }
  else {
    id v1 = *(&off_10006D4D8 + a1);
  }

  return v1;
}

uint64_t sub_100025FB0(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_100026284(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

uint64_t sub_100026298(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

void sub_1000268CC(id a1)
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = +[BMStreamSyncPolicy syncableStreamConfigurations];
  id v1 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = *(void *)v37;
    uint64_t v5 = BMUseCaseLegacy;
    uint64_t v6 = &BMDevicePlatformFromModelString_ptr;
    *(void *)&long long v2 = 138412546;
    long long v31 = v2;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v37 != v4) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v9 = [v8 storeConfig:v31];
        uint64_t v10 = [v9 datastorePath];
        id v11 = [v8 streamIdentifier];
        CFStringRef v12 = [v10 stringByAppendingPathComponent:v11];

        unsigned __int8 v13 = [v6[236] fileManagerWithMediatedAccessToDirectory:v12 useCase:v5 domain:0 user:getuid()];
        uint64_t v14 = +[BMStoreDirectory remoteDevices];
        id v15 = [v12 stringByAppendingPathComponent:v14];

        id v35 = 0;
        LOBYTE(v14) = [v13 removeDirectoryAtPath:v15 error:&v35];
        id v16 = v35;
        CFStringRef v17 = v16;
        if ((v14 & 1) == 0)
        {
          uint64_t v18 = [v16 userInfo];
          [v18 objectForKeyedSubscript:NSUnderlyingErrorKey];
          long long v33 = v17;
          uint64_t v19 = v13;
          uint64_t v20 = v6;
          id v21 = v3;
          uint64_t v22 = v5;
          v24 = uint64_t v23 = v4;
          long long v34 = v15;
          long long v25 = v8;
          id v26 = [v24 code];

          uint64_t v4 = v23;
          uint64_t v5 = v22;
          id v3 = v21;
          uint64_t v6 = v20;
          unsigned __int8 v13 = v19;
          CFStringRef v17 = v33;

          BOOL v27 = v26 == (id)2;
          long long v28 = v25;
          id v15 = v34;
          if (!v27)
          {
            id v29 = __biome_log_for_category();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              uint64_t v30 = [v28 streamIdentifier];
              *(_DWORD *)long long buf = v31;
              uint64_t v41 = v30;
              __int16 v42 = 2112;
              uint64_t v43 = v33;
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "failed to delete remotes for stream %@: %@", buf, 0x16u);
            }
          }
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v3);
  }
}

void sub_100026D54(uint64_t a1)
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = +[BMStreamSyncPolicy syncableStreamConfigurations];
  id v1 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v1)
  {
    id v3 = v1;
    uint64_t v24 = *(void *)v29;
    uint64_t v23 = BMUseCaseLegacy;
    *(void *)&long long v2 = 138412802;
    long long v21 = v2;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v4);
        uint64_t v6 = +[BMPaths pathForSharedSyncWithAccount:streamType:domain:](BMPaths, "pathForSharedSyncWithAccount:streamType:domain:", *(void *)(a1 + 32), 2, 0, v21);
        id v7 = +[BMFileManager fileManagerWithMediatedAccessToDirectory:v6 useCase:v23 domain:0 user:getuid()];
        uint64_t v8 = +[BMStoreDirectory remoteDevices];
        id v9 = [v6 stringByAppendingPathComponent:v8];

        id v27 = 0;
        LOBYTE(v8) = [v7 removeDirectoryAtPath:v9 error:&v27];
        id v10 = v27;
        id v11 = v10;
        if ((v8 & 1) == 0)
        {
          CFStringRef v12 = [v10 userInfo];
          [v12 objectForKeyedSubscript:NSUnderlyingErrorKey];
          unsigned __int8 v13 = v25 = v7;
          uint64_t v14 = v5;
          id v15 = v9;
          id v16 = [v13 code];

          id v7 = v25;
          BOOL v17 = v16 == (id)2;
          id v9 = v15;
          if (!v17)
          {
            uint64_t v18 = __biome_log_for_category();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              uint64_t v19 = [v14 streamIdentifier];
              uint64_t v20 = *(void *)(a1 + 32);
              *(_DWORD *)long long buf = v21;
              long long v33 = v19;
              __int16 v34 = 2112;
              uint64_t v35 = v20;
              __int16 v36 = 2112;
              long long v37 = v11;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "failed to delete remotes for stream %@ BM Account %@: %@", buf, 0x20u);

              id v7 = v25;
            }
          }
        }

        uint64_t v4 = (char *)v4 + 1;
      }
      while (v3 != v4);
      id v3 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v3);
  }
}

id sub_10002724C(id result)
{
  if (result)
  {
    id v1 = [result syncPolicy];
    id v2 = [v1 supportsTransport:3 direction:3];

    return v2;
  }
  return result;
}

__CFString *sub_1000272F8(unint64_t a1)
{
  if (a1 >= 4)
  {
    id v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1000463F0();
    }

    id v2 = +[NSString stringWithFormat:@"(unknown: %lu)", a1];
  }
  else
  {
    id v2 = off_10006D7F8[a1];
  }

  return v2;
}

uint64_t sub_100027394(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"syncRecord"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"zoneVersion"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"highestDeletedLocation"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1000279FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100027A38(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained syncSessionDidStartWithReason:*(void *)(a1 + 48)];
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = (void *)WeakRetained[3];
  WeakRetained[3] = v5;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027B1C;
  v8[3] = &unk_10006D580;
  v8[4] = WeakRetained;
  id v9 = *(id *)(a1 + 32);
  id v10 = v3;
  id v7 = v3;
  [WeakRetained fetchChangesWithError:v8];
}

void sub_100027B1C(uint64_t a1, void *a2)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027BE8;
  v6[3] = &unk_10006D558;
  id v7 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v4;
  id v10 = *(id *)(a1 + 48);
  id v5 = v7;
  [v3 uploadChangesWithError:v6];
}

void sub_100027BE8(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = +[NSMutableArray arrayWithCapacity:2];
  id v4 = v3;
  if (*(void *)(a1 + 32)) {
    [v3 addObject:];
  }
  if (v7) {
    [v4 addObject:v7];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 24) allObjects];
  (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v4);

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 40) syncSessionDidEnd];
}

void sub_100027E30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027EE8;
  v7[3] = &unk_10006D5D0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_sync(v4, v7);
}

uint64_t sub_100027EE8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1000287A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 80) recordIDsToSave];
  if ([v4 count])
  {
  }
  else
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 80) recordIDsToDelete];
    id v6 = [v5 count];

    if (!v6)
    {
      id v16 = *(NSObject **)(*(void *)(a1 + 32) + 48);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100028AAC;
      block[3] = &unk_10006D5D0;
      id v17 = *(id *)(a1 + 40);
      id v20 = v3;
      id v21 = v17;
      id v18 = v3;
      dispatch_sync(v16, block);

      id v15 = v21;
      goto LABEL_7;
    }
  }
  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [*(id *)(*(void *)(a1 + 32) + 80) recordIDsToSave];
    id v9 = [v8 count];
    id v10 = [*(id *)(*(void *)(a1 + 32) + 80) recordIDsToDelete];
    *(_DWORD *)long long buf = 134218240;
    id v26 = v9;
    __int16 v27 = 2048;
    id v28 = [v10 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "after modifying changes, we have %lu records to sync and %lu records to delete as a result of error handling", buf, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  CFStringRef v12 = *(void **)(v11 + 80);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000289F0;
  v22[3] = &unk_10006D620;
  v22[4] = v11;
  id v13 = *(id *)(a1 + 40);
  id v23 = v3;
  id v24 = v13;
  id v14 = v3;
  [v12 modifyPendingChangesWithCompletionHandler:v22];

  id v15 = v24;
LABEL_7:
}

void sub_1000289F0(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100028A98;
  v3[3] = &unk_10006D5D0;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  dispatch_sync(v2, v3);
}

uint64_t sub_100028A98(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100028AAC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100028E14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100028E2C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[8] || !v2[9] || !v2[10])
  {
    id v3 = objc_opt_new();
    [v3 setFetchChangesForMergeableValues:1];
    id v4 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:@"com.apple.biome.sync" environment:1];
    id v5 = [objc_alloc((Class)CKContainer) initWithContainerID:v4 options:v3];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = v5;

    if (!*(void *)(*(void *)(a1 + 32) + 64))
    {
      id v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100046660();
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      [*(id *)(a1 + 32) handleTransitionToNewMergeableValueRecordValueKey];
      id v9 = [*(id *)(*(void *)(a1 + 32) + 16) ckSyncEngineMetaData];
      id v10 = +[NSNull null];
      unsigned int v11 = [v9 isEqual:v10];

      if (v11)
      {

        id v9 = 0;
      }
      id v12 = objc_alloc((Class)CKSyncEngineConfiguration);
      id v13 = [*(id *)(*(void *)(a1 + 32) + 64) privateCloudDatabase];
      id v14 = [v12 initWithDatabase:v13 dataSource:*(void *)(a1 + 32) metadata:v9];
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = *(void **)(v15 + 72);
      *(void *)(v15 + 72) = v14;

      if (!*(void *)(*(void *)(a1 + 32) + 72))
      {
        id v17 = __biome_log_for_category();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10004662C();
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        [*(id *)(*(void *)(a1 + 32) + 72) setAutomaticSyncingEnabled:0];
        id v18 = [objc_alloc((Class)CKSyncEngine) initWithConfiguration:*(void *)(*(void *)(a1 + 32) + 72)];
        uint64_t v19 = *(void *)(a1 + 32);
        id v20 = *(void **)(v19 + 80);
        *(void *)(v19 + 80) = v18;

        if (!*(void *)(*(void *)(a1 + 32) + 80))
        {
          id v21 = __biome_log_for_category();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_1000465F8();
          }

          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        }
      }
    }
  }
}

void sub_1000290A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100046694();
    }
  }
  (*(void (**)(void, id, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) isManateeAvailable:v5], v6);
}

void sub_100029748(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) deleteCKRecordAtLocation:*(void *)(a1 + 40)];
}

void sub_100029A30(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) recordID];
  id v4 = [v3 recordName];

  id v5 = [*(id *)(a1 + 32) recordID];
  id v6 = [v5 zoneID];
  id v7 = [v6 zoneName];

  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"crdtDeleted"];
  id v9 = *(void **)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) recordID];
  unsigned int v11 = [v10 zoneID];
  id v12 = [v9 streamConfigurationForZoneID:v11];

  if (![v8 isEqual:&__kCFBooleanFalse])
  {
    [*(id *)(*(void *)(a1 + 40) + 16) resetMetadataForRecord:v4 zoneName:v7];
    uint64_t v15 = 0;
    goto LABEL_10;
  }
  if (sub_10002724C(v12)
    && [*(id *)(a1 + 40) isRecordNewerThanMostRecentDeleteForSiteIdentifier:*(void *)(a1 + 32)])
  {
    id v13 = [*(id *)(a1 + 32) encryptedValues];
    id v14 = [*(id *)(a1 + 40) mergeableRecordValueKey];
    uint64_t v15 = [v13 objectForKeyedSubscript:v14];

    if (!v15)
    {
      id v21 = [*(id *)(a1 + 32) encryptedValues];
      uint64_t v22 = [v21 objectForKeyedSubscript:@"biomeCRDT"];

      if (v22) {
        goto LABEL_20;
      }
      __biome_log_for_category();
      id v16 = (BMStreamCRDTLocation *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_FAULT)) {
        sub_100046764();
      }
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
    id v23 = 0;
    id v16 = +[NSKeyedArchiver archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v23];
    id v17 = v23;
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = __biome_log_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 138543874;
        long long v25 = v4;
        __int16 v26 = 2114;
        __int16 v27 = v7;
        __int16 v28 = 2114;
        long long v29 = v18;
        _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Error encoding serverValue for %{public}@ %{public}@, %{public}@", buf, 0x20u);
      }

LABEL_18:
      goto LABEL_19;
    }

    uint64_t v15 = v16;
LABEL_10:
    id v16 = [[BMStreamCRDTLocation alloc] initWithZoneName:v7 recordName:v4];
    if (v16)
    {
      id v18 = [*(id *)(*(void *)(a1 + 40) + 16) insertLocationIfNotExists:v16 withState:2];
      if (([*(id *)(*(void *)(a1 + 40) + 16) saveCKRecordServerMergeableValue:v15 recordName:v4 zoneName:v7 locationRow:v18] & 1) == 0)
      {
        id v20 = __biome_log_for_category();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          sub_100046834();
        }
      }
      [*(id *)(*(void *)(a1 + 40) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 32) syncToCloudKit:0 recordType:1 crdtDeleted:0];
    }
    else
    {
      id v18 = __biome_log_for_category();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        sub_1000467CC();
      }
    }
    goto LABEL_18;
  }
LABEL_21:
}

void sub_100029E78(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) recordID];
  id v4 = [v3 zoneID];
  id v5 = [v4 zoneName];

  id v6 = [*(id *)(*(void *)(a1 + 40) + 16) ckZoneForZoneName:v5];
  id v7 = [v6 zoneUUID];
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"zoneVersionUUID"];
  if ((!v7 || ([v7 isEqualToString:v8] & 1) == 0)
    && [*(id *)(*(void *)(a1 + 40) + 16) resetCKRecordsMetaDataAndSetToSyncForZone:v5])
  {
    [*(id *)(*(void *)(a1 + 40) + 16) ckZoneSetZoneVersionUUID:v8 forZoneName:v5];
  }
  [*(id *)(*(void *)(a1 + 40) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 32) syncToCloudKit:0 recordType:2 crdtDeleted:0];
}

void sub_10002A02C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) recordID];
  id v4 = [v3 zoneID];
  id v5 = [v4 zoneName];

  id v6 = [*(id *)(a1 + 32) recordID];
  id v7 = [v6 recordName];

  id v8 = [*(id *)(*(void *)(a1 + 40) + 16) highestDeletedLocationForSiteIdentifier:v7 inStream:v5];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 location];
    unsigned int v11 = [v10 day];
    [v11 timeIntervalSinceReferenceDate];
    uint64_t v13 = (uint64_t)v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"day"];
  id v15 = [v14 longValue];

  if (v13 < (uint64_t)v15)
  {
    id v16 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:(double)(uint64_t)v15];
    id v17 = [[BMStreamCRDTLocation alloc] initWithStreamName:v5 siteIdentifier:v7 day:v16];
    id v18 = [*(id *)(*(void *)(a1 + 40) + 8) distributedSyncManagers];
    uint64_t v19 = [v18 objectForKeyedSubscript:v5];

    id v20 = [v19 streamCRDT];
    [v20 handleDeletedLocation:v17 deleteCKRecord:1];

    id v21 = [*(id *)(*(void *)(a1 + 40) + 16) ckRecordForRecordName:v7 zoneName:v5 recordType:3];
    uint64_t v22 = [*(id *)(*(void *)(a1 + 40) + 16) locationRowWithLocation:v17];
    [*(id *)(*(void *)(a1 + 40) + 16) saveCKRecordHighestDeletedLocationRow:v22 recordName:v7 zoneName:v5 recordExists:v21 != 0];
  }
  [*(id *)(*(void *)(a1 + 40) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 32) syncToCloudKit:0 recordType:3 crdtDeleted:0];
}

void sub_10002A500(void *a1)
{
  [*(id *)(a1[4] + 16) saveSystemFieldsDataForRecord:a1[5] syncToCloudKit:0 recordType:2 crdtDeleted:0];
  [*(id *)(a1[4] + 16) ckZoneSetZoneVersionUUID:a1[6] forZoneName:a1[7]];
}

void sub_10002A5FC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 40) syncToCloudKit:0 recordType:3 crdtDeleted:0];
}

void sub_10002A7A4(id *a1)
{
  [*((id *)a1[4] + 2) saveSystemFieldsDataForRecord:a1[5] syncToCloudKit:&__kCFBooleanFalse recordType:1 crdtDeleted:a1[6]];
  id v3 = [a1[5] encryptedValues];
  id v4 = [a1[4] mergeableRecordValueKey];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = a1 + 7;
    id v7 = a1 + 8;
    id v8 = [*((id *)a1[4] + 2) ckRecordForRecordName:a1[7] zoneName:a1[8] recordType:1];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 localMergeableValue];
      if (v10)
      {
        unsigned int v11 = (void *)v10;
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = [v9 localMergeableValue];
        id v32 = 0;
        id v14 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v12 fromData:v13 error:&v32];
        id v15 = v32;

        if (v15)
        {
          id v16 = __biome_log_for_category();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            __int16 v26 = *v6;
            __int16 v27 = *v7;
            *(_DWORD *)long long buf = 138543874;
            __int16 v34 = v26;
            __int16 v35 = 2114;
            __int16 v36 = v27;
            __int16 v37 = 2114;
            id v38 = v15;
            _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "handleDidSaveRecordSyncRecord: Unable to unarchive localMergeableValue for %{public}@ %{public}@ %{public}@", buf, 0x20u);
          }
        }
        if (v14)
        {
LABEL_9:
          if (([v14 isEqual:v5] & 1) == 0)
          {
            id v31 = 0;
            [v14 mergeRecordValue:v5 error:&v31];
            id v17 = v31;
            if (v17)
            {
              id v18 = __biome_log_for_category();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
              {
                __int16 v28 = *v6;
                long long v29 = *v7;
                *(_DWORD *)long long buf = 138544130;
                __int16 v34 = v5;
                __int16 v35 = 2114;
                __int16 v36 = v28;
                __int16 v37 = 2114;
                id v38 = v29;
                __int16 v39 = 2114;
                id v40 = v17;
                _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Error [localRecordValue mergeRecordValue:serverValue] for serverValue:%{public}@ record:%{public}@ zone:%{public}@ %{public}@", buf, 0x2Au);
              }
            }
            goto LABEL_27;
          }
LABEL_26:
          id v17 = 0;
LABEL_27:
          id v30 = v17;
          uint64_t v22 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v30];
          id v19 = v30;

          if (v19)
          {
            id v23 = __biome_log_for_category();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
              sub_100046A58();
            }
          }
          else
          {
            id v24 = (void *)*((void *)a1[4] + 2);
            long long v25 = [[BMStreamCRDTLocation alloc] initWithZoneName:a1[8] recordName:a1[7]];
            id v23 = [v24 locationRowWithLocation:v25];

            [*((id *)a1[4] + 2) saveCKRecordLocalMergeableValue:v22 recordName:a1[7] zoneName:a1[8] locationRow:v23];
          }

          goto LABEL_32;
        }
      }
      else
      {
        id v14 = (id)objc_opt_new();
        if (v14) {
          goto LABEL_9;
        }
      }
      id v21 = __biome_log_for_category();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        sub_100046AC0();
      }

      id v14 = v5;
      goto LABEL_26;
    }
    id v20 = __biome_log_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      sub_1000469E8();
    }

LABEL_21:
    id v19 = 0;
LABEL_32:

    goto LABEL_33;
  }
  if (([a1[6] isEqual:&__kCFBooleanTrue] & 1) == 0)
  {
    id v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100046978();
    }
    goto LABEL_21;
  }
  id v19 = 0;
LABEL_33:
}

void sub_10002AF68(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) ckZoneForZoneName:*(void *)(a1 + 40)];
  if ([v3 recoveryState])
  {
    [*(id *)(*(void *)(a1 + 32) + 16) ckZoneSetAttemptingRecoveryForZoneName:*(void *)(a1 + 40) state:0];
  }
}

void sub_10002B084(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) saveCKSyncEngineMetaData:*(void *)(a1 + 40)];
}

void sub_10002B328(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) ckZoneForZoneName:*(void *)(a1 + 40)];
  if ([v3 recoveryState])
  {
    id v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 1026;
      unsigned int v9 = [v3 recoveryState];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "failedToSaveRecordZone: %{public}@ and recoveryState:%{public}d", (uint8_t *)&v6, 0x12u);
    }

    [*(id *)(*(void *)(a1 + 32) + 16) ckZoneSetAttemptingRecoveryForZoneName:*(void *)(a1 + 40) state:0];
  }
}

void sub_10002B5BC(uint64_t a1)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = [*(id *)(a1 + 40) recordID];
  uint64_t v5 = [v4 recordName];
  int v6 = [*(id *)(a1 + 40) recordID];
  uint64_t v7 = [v6 zoneID];
  __int16 v8 = [v7 zoneName];
  [v3 resetMetadataForRecord:v5 zoneName:v8];
}

void sub_10002B8B4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 40) syncToCloudKit:0 recordType:1 crdtDeleted:0];
}

void sub_10002BA0C(id *a1)
{
  id v3 = [a1[4] userInfo];
  id v4 = [v3 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey];

  if (v4)
  {
    id v46 = v2;
    uint64_t v5 = [a1[4] userInfo];
    int v6 = [v5 objectForKeyedSubscript:CKRecordChangedErrorClientRecordKey];

    uint64_t v7 = [v4 encryptedValues];
    __int16 v8 = [a1[5] mergeableRecordValueKey];
    id v9 = [v7 objectForKeyedSubscript:v8];

    uint64_t v10 = [v6 encryptedValues];
    unsigned int v11 = [a1[5] mergeableRecordValueKey];
    uint64_t v12 = [v10 objectForKeyedSubscript:v11];

    uint64_t v13 = __biome_log_for_category();
    id v14 = v13;
    v44 = v12;
    v45 = v6;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543618;
        v52 = v12;
        __int16 v53 = 2114;
        id v54 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Handling handleFailedToSaveSyncRecordServerRecordChanged: Merging clientCRDT into serverCRDT %{public}@ -> %{public}@", buf, 0x16u);
      }

      if (([v9 isEqual:v12] & 1) == 0)
      {
        id v48 = 0;
        [v9 mergeRecordValue:v12 error:&v48];
        id v15 = v48;
        if (v15)
        {
          id v16 = v15;
          id v17 = __biome_log_for_category();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_100046D78();
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        sub_100046CF8((uint64_t *)a1 + 4, v14, v20);
      }

      id v9 = v12;
      if (!v9)
      {
        id v22 = 0;
        id v21 = 0;
LABEL_19:
        id v30 = (void *)*((void *)a1[5] + 2);
        id v31 = [BMStreamCRDTLocation alloc];
        id v32 = [a1[6] zoneName];
        long long v33 = [v4 recordID];
        __int16 v34 = [v33 recordName];
        __int16 v35 = [(BMStreamCRDTLocation *)v31 initWithZoneName:v32 recordName:v34];
        __int16 v36 = [v30 locationRowWithLocation:v35];

        __int16 v37 = (void *)*((void *)a1[5] + 2);
        id v38 = [v4 recordID];
        __int16 v39 = [v38 recordName];
        id v40 = [a1[6] zoneName];
        [v37 saveCKRecordLocalMergeableValue:v21 recordName:v39 zoneName:v40 locationRow:v36];

        [*((id *)a1[5] + 2) saveSystemFieldsDataForRecord:v4 syncToCloudKit:&__kCFBooleanFalse recordType:1 crdtDeleted:0];
        uint64_t v41 = (void *)*((void *)a1[5] + 10);
        __int16 v42 = [v4 recordID];
        v50 = v42;
        uint64_t v43 = +[NSArray arrayWithObjects:&v50 count:1];
        [v41 addRecordIDsToSave:v43 recordIDsToDelete:0];

        id v19 = v45;
        uint64_t v2 = v46;
        goto LABEL_20;
      }
    }
    id v47 = 0;
    id v21 = +[NSKeyedArchiver archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v47];
    id v22 = v47;
    if (v22)
    {
      id v23 = __biome_log_for_category();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        sub_100046C88((uint64_t)(a1 + 4), v23, v24, v25, v26, v27, v28, v29);
      }
    }
    goto LABEL_19;
  }
  [*((id *)a1[5] + 2) saveSystemFieldsDataForRecord:a1[7] syncToCloudKit:&__kCFBooleanFalse recordType:1 crdtDeleted:0];
  id v18 = (void *)*((void *)a1[5] + 10);
  id v19 = [a1[7] recordID];
  uint64_t v49 = v19;
  id v9 = +[NSArray arrayWithObjects:&v49 count:1];
  [v18 addRecordIDsToSave:v9 recordIDsToDelete:0];
LABEL_20:
}

void sub_10002C028(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) zoneName];
  [v3 handleZoneReset:v4];
}

void sub_10002C28C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 40) syncToCloudKit:0 recordType:2 crdtDeleted:0];
}

void sub_10002C410(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) saveSystemFieldsDataForRecord:*(void *)(a1 + 40) syncToCloudKit:0 recordType:3 crdtDeleted:0];
}

uint64_t sub_10002CA80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002CA90(uint64_t a1)
{
}

void sub_10002CA98(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) recordName];
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) zoneID];
  int v6 = [v4 streamConfigurationForZoneID:v5];

  uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 16);
  __int16 v8 = [v6 syncIdentifier];
  id v9 = [v7 ckRecordForRecordName:v3 zoneName:v8 recordType:3];

  uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 16);
  unsigned int v11 = [v9 locationID];
  uint64_t v12 = [v10 locationRowWithLocationID:v11];

  if (v12)
  {
    uint64_t v13 = [*(id *)(*(void *)(a1 + 40) + 16) createCKRecordFromRecordID:*(void *)(a1 + 32) newRecord:0 recordType:3];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    id v16 = [v12 location];
    id v17 = [v16 day];
    [v17 timeIntervalSinceReferenceDate];
    id v19 = +[NSNumber numberWithLong:(uint64_t)v18];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v19 forKeyedSubscript:@"day"];

    uint64_t v20 = [BMStreamCRDTLocation alloc];
    id v21 = [v6 syncIdentifier];
    id v22 = objc_opt_new();
    id v23 = [(BMStreamCRDTLocation *)v20 initWithStreamName:v21 siteIdentifier:v3 day:v22];

    [(BMStreamCRDTLocation *)v23 secondsUntilExpirationWithStreamConfiguration:v6];
    uint64_t v24 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v25 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v24 setExpirationAfterTimeInterval:v25];
  }
}

void sub_10002CDD0(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)NSUUID);
  id v4 = [v3 UUIDString];

  id v5 = [objc_alloc((Class)CKRecord) initWithRecordType:@"zoneVersion" recordID:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v4 forKeyedSubscript:@"zoneVersionUUID"];
}

void sub_10002D0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10002D0D4(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) distributedSyncManagers];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v5 = [[BMStreamCRDTLocation alloc] initWithZoneName:*(void *)(a1 + 40) recordName:*(void *)(a1 + 48)];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 16) locationRowWithLocation:v5];
  uint64_t v7 = v6;
  if (!v6)
  {
    double v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100046F18(a1, v18, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_36;
  }
  __int16 v8 = [v6 location];
  id v9 = [v4 streamConfiguration];
  [v8 secondsUntilExpirationWithStreamConfiguration:v9];
  double v11 = v10;

  if (v11 <= 60.0)
  {
    double v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 134218242;
      double v60 = v11;
      __int16 v61 = 2114;
      uint64_t v62 = v33;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "record is almost expired: %f, not saving recordID: %{public}@ because it will be TTL'd", buf, 0x16u);
    }
    goto LABEL_36;
  }
  unsigned __int8 v58 = 0;
  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 16) createCKRecordFromRecordID:*(void *)(a1 + 56) newRecord:&v58 recordType:1];
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v60) = v58;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "recordToSaveForRecordID: newRecord? %d", buf, 8u);
    }

    if (v58)
    {
      id v16 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      id v17 = +[NSNumber numberWithDouble:v11];
      [v16 setExpirationAfterTimeInterval:v17];
    }
    if ([*(id *)(a1 + 32) isSiriCloudSyncEnabled])
    {
      double v18 = [v4 streamCRDT];
      if (v18)
      {
        id v19 = [[BMStreamCKRecordCRDT alloc] initWithStreamCRDT:v18 locationRow:v7 database:*(void *)(*(void *)(a1 + 32) + 16) queue:*(void *)(*(void *)(a1 + 32) + 48) maxDeltaSize:+[CKMergeableDelta suggestedDeltaSizeForContainer:*(void *)(*(void *)(a1 + 32) + 64)] sessionContext:0];
        uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
        id v21 = *(void **)(v20 + 40);
        *(void *)(v20 + 40) = v19;

        id v22 = [*(id *)(*(void *)(a1 + 32) + 16) ckRecordForRecordName:*(void *)(a1 + 48) zoneName:*(void *)(a1 + 40) recordType:1];
        id v23 = [v22 localMergeableValue];
        id v54 = v22;
        if (v23)
        {
          uint64_t v24 = objc_opt_class();
          id v22 = [v22 localMergeableValue:v22];
          id v57 = 0;
          uint64_t v25 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v24 fromData:v22 error:&v57];
          uint64_t v26 = v57;
        }
        else
        {
          uint64_t v25 = objc_opt_new();
          uint64_t v26 = 0;
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v25);
        if (v23)
        {

          uint64_t v25 = v22;
        }

        if (v26)
        {
          __int16 v37 = __biome_log_for_category();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
          {
            uint64_t v51 = *(void *)(a1 + 40);
            double v50 = *(double *)(a1 + 48);
            *(_DWORD *)long long buf = 138543874;
            double v60 = v50;
            __int16 v61 = 2114;
            uint64_t v62 = v51;
            __int16 v63 = 2114;
            id v64 = v26;
            _os_log_fault_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "handleSyncRecordRecordToSaveForRecordID: Unable to unarchive localMergeableValue for %{public}@ %{public}@ %{public}@", buf, 0x20u);
          }

          uint64_t v38 = objc_opt_new();
          uint64_t v39 = *(void *)(*(void *)(a1 + 80) + 8);
          id v40 = *(void **)(v39 + 40);
          *(void *)(v39 + 40) = v38;
        }
        uint64_t v41 = __biome_log_for_category();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          double v42 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          *(_DWORD *)long long buf = 138543362;
          double v60 = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "recordValue %{public}@", buf, 0xCu);
        }

        uint64_t v43 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        uint64_t v44 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        v56 = v26;
        unsigned __int8 v45 = [v43 addDeltasToSaveFromMergeable:v44 error:&v56];
        __int16 v35 = v56;

        if ((v45 & 1) == 0)
        {
          id v46 = __biome_log_for_category();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
          {
            uint64_t v53 = *(void *)(a1 + 40);
            double v52 = *(double *)(a1 + 48);
            *(_DWORD *)long long buf = 138543874;
            double v60 = v52;
            __int16 v61 = 2114;
            uint64_t v62 = v53;
            __int16 v63 = 2114;
            id v64 = v35;
            _os_log_fault_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_FAULT, "Error adding deltas to save for %{public}@ %{public}@ %{public}@", buf, 0x20u);
          }
        }
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanFalse forKeyedSubscript:@"crdtDeleted" atIndex:v54];
        uint64_t v47 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        id v48 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) encryptedValues];
        uint64_t v49 = [*(id *)(a1 + 32) mergeableRecordValueKey];
        [v48 setObject:v47 forKeyedSubscript:v49];
      }
      else
      {
        __int16 v35 = __biome_log_for_category();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          double v36 = *(double *)(a1 + 56);
          *(_DWORD *)long long buf = 138412290;
          double v60 = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "streamCRDT is nil %@", buf, 0xCu);
        }
      }
    }
    else
    {
      __int16 v34 = __biome_log_for_category();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Sync to iCloud for Siri disabled", buf, 2u);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:@"crdtDeleted"];
      double v18 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) encryptedValues];
      __int16 v35 = [*(id *)(a1 + 32) mergeableRecordValueKey];
      [v18 setObject:0 forKeyedSubscript:v35];
    }

LABEL_36:
  }
}

void sub_10002DA74(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) ckZoneForZoneName:*(void *)(a1 + 40)];
  if ([v3 recoveryState]) {
    [*(id *)(*(void *)(a1 + 32) + 16) ckZoneSetAttemptingRecoveryForZoneName:*(void *)(a1 + 40) state:0];
  }
}

void sub_10002DC30(void *a1)
{
  id v3 = [*(id *)(a1[4] + 16) ckZoneForZoneName:a1[5]];
  unsigned int v4 = [v3 recoveryState];
  id v5 = __biome_log_for_category();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4 == 1)
  {
    if (v6)
    {
      uint64_t v7 = (void *)a1[5];
      int v20 = 138543362;
      id v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "didDeleteRecordZoneWithID re-creating zone:%{public}@", (uint8_t *)&v20, 0xCu);
    }

    id v8 = [objc_alloc((Class)CKRecordZone) initWithZoneName:a1[5]];
    id v9 = *(void **)(a1[4] + 80);
    id v24 = v8;
    double v10 = +[NSArray arrayWithObjects:&v24 count:1];
    [v9 addRecordZonesToSave:v10 recordZoneIDsToDelete:0];

    id v11 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v12 = (void *)a1[4];
    uint64_t v13 = [v8 zoneID];
    id v14 = [v12 newZoneVersionRecordIDForZone:v13];

    [v11 addObject:v14];
    id v15 = [*(id *)(a1[4] + 16) ckRecordsToSyncToCloudKitForZone:a1[5]];
    if ([v15 count])
    {
      id v16 = __biome_log_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = [v15 count];
        uint64_t v18 = a1[5];
        int v20 = 134218242;
        id v21 = v17;
        __int16 v22 = 2114;
        uint64_t v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "didDeleteRecordZoneWithID syncing %lu records for zone:%{public}@", (uint8_t *)&v20, 0x16u);
      }

      [v11 addObjectsFromArray:v15];
    }
    [*(id *)(a1[4] + 80) addRecordIDsToSave:v11 recordIDsToDelete:0];
    [*(id *)(a1[4] + 16) ckZoneSetAttemptingRecoveryForZoneName:a1[5] state:2];
  }
  else
  {
    if (v6)
    {
      id v19 = (void *)a1[5];
      int v20 = 138543362;
      id v21 = v19;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "didDeleteRecordZoneWithID not re-creating zone:%{public}@, removing all local records in zone", (uint8_t *)&v20, 0xCu);
    }

    [*(id *)(a1[4] + 16) deleteAllCKRecordsInZone:a1[6]];
  }
}

void sub_10002E018(uint64_t a1)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  unsigned int v4 = [*(id *)(a1 + 40) zoneName];
  id v5 = [v3 ckZoneForZoneName:v4];

  if (![v5 recoveryState]) {
    [*(id *)(*(void *)(a1 + 32) + 16) deleteAllCKRecordsInZone:*(void *)(a1 + 40)];
  }
}

void sub_10002E13C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) zoneID];
  unsigned int v4 = [v3 zoneName];

  id v5 = [*(id *)(*(void *)(a1 + 40) + 8) distributedSyncManagers];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 streamCRDT];
  id v8 = [BMStreamCRDTLocation alloc];
  id v9 = [*(id *)(a1 + 32) recordName];
  double v10 = [(BMStreamCRDTLocation *)v8 initWithZoneName:v4 recordName:v9];

  if (v7)
  {
    [v7 handleDeletedLocation:v10 deleteCKRecord:1];
  }
  else
  {
    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "streamCRDT is nil %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
}

void sub_10002E508(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned int v4 = *(void **)(v3 + 16);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002E598;
  v5[3] = &unk_10006D7B0;
  void v5[4] = v3;
  [v4 enumerateRecordsWithBlock:v5];
}

void sub_10002E598(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v69 = 0;
  v70[0] = &v69;
  v70[1] = 0x3032000000;
  v70[2] = sub_10002CA80;
  v70[3] = sub_10002CA90;
  id v71 = 0;
  unsigned int v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 recordName];
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "*** recordName:%{public}@", buf, 0xCu);
  }
  BOOL v6 = [v3 localMergeableValue];

  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = [v3 localMergeableValue];
    id v68 = 0;
    uint64_t v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v7 fromData:v8 error:&v68];
    double v10 = v68;
    id v11 = *(void **)(v70[0] + 40);
    *(void *)(v70[0] + 40) = v9;

    if (v10)
    {
      uint64_t v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v13 = [v3 recordName];
        uint64_t v14 = [v3 streamIdentifier];
        *(_DWORD *)long long buf = 138543874;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2114;
        id v79 = v10;
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "syncEngineDidEndFetchingChanges: Unable to unarchive localMergeableValue for %{public}@ %{public}@ %{public}@", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = *(void *)(v70[0] + 40);
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Has a localMergeableValue: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    double v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Has no localMergeableValue", buf, 2u);
    }
  }

  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v79) = 0;
  id v16 = *(void **)(*(void *)(a1 + 32) + 16);
  id v17 = [v3 recordName];
  uint64_t v18 = [v3 streamIdentifier];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10002EF5C;
  v64[3] = &unk_10006D788;
  uint64_t v66 = buf;
  id v19 = v3;
  id v65 = v19;
  v67 = &v69;
  [v16 enumerateMergeableRecordValuesForRecordName:v17 zoneName:v18 withBlock:v64];

  int v20 = __biome_log_for_category();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      id v21 = "YES";
    }
    else {
      id v21 = "NO";
    }
    *(_DWORD *)unsigned __int8 v72 = 136446210;
    v73 = (BMStreamCRDTLocation *)v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Were there mergeableRecordValues: %{public}s", v72, 0xCu);
  }

  __int16 v22 = [*(id *)(*(void *)(a1 + 32) + 8) distributedSyncManagers];
  uint64_t v23 = [v19 streamIdentifier];
  id v24 = [v22 objectForKeyedSubscript:v23];
  uint64_t v25 = [v24 streamCRDT];

  uint64_t v26 = [BMStreamCRDTLocation alloc];
  uint64_t v27 = [v19 streamIdentifier];
  uint64_t v28 = [v19 recordName];
  uint64_t v29 = [(BMStreamCRDTLocation *)v26 initWithZoneName:v27 recordName:v28];

  uint64_t v30 = __biome_log_for_category();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)unsigned __int8 v72 = 138543362;
    v73 = v29;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "syncEngineDidEndFetchingChanges location: %{public}@", v72, 0xCu);
  }

  if (v29)
  {
    uint64_t v31 = [*(id *)(*(void *)(a1 + 32) + 16) locationRowWithLocation:v29];
    uint64_t v32 = __biome_log_for_category();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)unsigned __int8 v72 = 138543362;
      v73 = (BMStreamCRDTLocation *)v31;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "syncEngineDidEndFetchingChanges locationRow: %{public}@", v72, 0xCu);
    }

    if (v31)
    {
      id v33 = +[CKMergeableDelta suggestedDeltaSizeForContainer:*(void *)(*(void *)(a1 + 32) + 64)];
      __int16 v34 = [BMStreamCKRecordCRDT alloc];
      __int16 v35 = *(void **)(a1 + 32);
      uint64_t v36 = v35[2];
      uint64_t v37 = v35[6];
      uint64_t v38 = [v35 sessionContext];
      __int16 v61 = [(BMStreamCKRecordCRDT *)v34 initWithStreamCRDT:v25 locationRow:v31 database:v36 queue:v37 maxDeltaSize:v33 sessionContext:v38];

      uint64_t v39 = __biome_log_for_category();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        id v40 = *(BMStreamCRDTLocation **)(v70[0] + 40);
        *(_DWORD *)unsigned __int8 v72 = 138543362;
        v73 = v40;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "recordValue %{public}@", v72, 0xCu);
      }

      double v42 = *(void **)(v70[0] + 40);
      id v63 = 0;
      [v42 mergeIntoMergeable:v61 error:&v63];
      id v43 = v63;
      if (v43)
      {
        uint64_t v44 = __biome_log_for_category();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          id v59 = [v19 recordName];
          double v60 = [v19 streamIdentifier];
          *(_DWORD *)unsigned __int8 v72 = 138543874;
          v73 = v59;
          __int16 v74 = 2114;
          unsigned int v75 = v60;
          __int16 v76 = 2114;
          id v77 = v43;
          _os_log_fault_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_FAULT, "Unable to  [recordValue mergeIntoMergeable:recordCRDT] for recordName:%{public}@ site:%{public}@ error:%{public}@", v72, 0x20u);
        }
      }
      unsigned __int8 v45 = [(BMStreamCRDTLocation *)v29 streamName];

      if (*(void *)(v70[0] + 40))
      {
        uint64_t v47 = *(void *)(v70[0] + 40);
        id v62 = 0;
        id v48 = +[NSKeyedArchiver archivedDataWithRootObject:v47 requiringSecureCoding:1 error:&v62];
        uint64_t v49 = v62;
        if (v49)
        {
          double v50 = __biome_log_for_category();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
            sub_100047058((uint64_t)v70, (uint64_t)v49, v50);
          }
        }
        else
        {
          uint64_t v53 = *(void **)(*(void *)(a1 + 32) + 16);
          double v50 = [v19 recordName];
          [v53 saveCKRecordLocalMergeableValue:v48 recordName:v50 zoneName:v45 locationRow:v31];
          uint64_t v49 = 0;
        }
      }
      else
      {
        uint64_t v49 = 0;
        id v48 = 0;
      }
      id v54 = *(void **)(*(void *)(a1 + 32) + 24);
      id v55 = [(BMStreamCRDTLocation *)v29 siteIdentifier];
      [v54 addObject:v55];

      v56 = *(void **)(*(void *)(a1 + 32) + 16);
      id v57 = [v19 recordName];
      unsigned __int8 v58 = [v19 streamIdentifier];
      [v56 clearCKMergeableRecordValueServerMergeableValuesForRecordName:v57 zoneName:v58];
    }
    else
    {
      uint64_t v49 = __biome_log_for_category();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
        sub_100046FF0();
      }
    }
  }
  else
  {
    uint64_t v31 = __biome_log_for_category();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    {
      uint64_t v51 = [v19 streamIdentifier];
      double v52 = [v19 recordName];
      sub_100046F88(v51, v52, (uint64_t)v72, v31);
    }
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v69, 8);
}

void sub_10002EEC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002EF5C(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id v3 = a2;
  id v18 = 0;
  unsigned int v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v18];

  id v5 = v18;
  if (v5)
  {
    BOOL v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100047184(a1);
    }

    uint64_t v7 = objc_opt_new();
    unsigned int v4 = (void *)v7;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void *)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  if (!v10) {
    objc_storeStrong(v9, v4);
  }
  id v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)long long buf = 138543362;
    int v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Merging recordValue %{public}@", buf, 0xCu);
  }

  uint64_t v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543362;
    int v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Merging serverValue %{public}@", buf, 0xCu);
  }

  if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isEqual:v4] & 1) == 0)
  {
    uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v17 = v5;
    [v14 mergeRecordValue:v4 error:&v17];
    id v15 = v17;

    id v5 = v15;
  }
  if (v5)
  {
    id v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_1000470D8(a1);
    }
  }
}

void sub_10002F2EC(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_10002CA80;
  id v11 = sub_10002CA90;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002F438;
  v6[3] = &unk_10006D7D8;
  void v6[4] = v4;
  v6[5] = &v7;
  [v5 enumerateZonesWithBlock:v6];
  if ([(id)v8[5] count]) {
    [*(id *)(*(void *)(a1 + 32) + 80) addRecordZonesToSave:&__NSArray0__struct recordZoneIDsToDelete:v8[5]];
  }
  _Block_object_dispose(&v7, 8);
}

void sub_10002F420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002F438(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 recoveryState] == 1)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v4 = [v8 zoneName];
    [v3 resetCKRecordsMetaDataAndSetToSyncForZone:v4];

    id v5 = objc_alloc((Class)CKRecordZoneID);
    BOOL v6 = [v8 zoneName];
    id v7 = [v5 initWithZoneName:v6 ownerName:CKCurrentUserDefaultName];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

void sub_10002F648(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_10002F680(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

void sub_10002F6E0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10002F700(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

uint64_t sub_10002FF74(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 17;
  return result;
}

void sub_1000300A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = 0;
  uint64_t v5 = [v3 dataWithError:&v9];
  id v6 = v9;
  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (v7)
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100047230((uint64_t)v3, (uint64_t)v6, v8);
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void sub_1000325F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
}

void sub_10003261C(uint64_t a1, void *a2, void *a3, void *a4)
{
  BOOL v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _handleRequestID:*(void *)(a1 + 32) request:v10 options:v9 responseHandler:v8];
}

void sub_100034EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100034F00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100034F10(uint64_t a1)
{
}

void sub_100034F18(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v8 = v3;
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v8;
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v4 addObject:v3];
}

id sub_100035944(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"isExecuting"];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  [*(id *)(a1 + 32) didChangeValueForKey:@"isExecuting"];
  [*(id *)(a1 + 32) willChangeValueForKey:@"isFinished"];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didChangeValueForKey:@"isFinished"];
}

void sub_100035E6C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100035F08;
  v4[3] = &unk_10006CC98;
  uint64_t v3 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v1 syncRapportNowIfPolicyAllowsWithReason:v3 activity:v2 completionHandler:v4];
}

void sub_100035F08(uint64_t a1)
{
}

void sub_100035F10(uint64_t a1)
{
}

BOOL sub_100035F18(BOOL result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t v2 = __biome_log_for_category();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "syncNowIfPolicyAllowsWithReason: group_notify done", v3, 2u);
    }

    return xpc_activity_set_state(*(xpc_activity_t *)(v1 + 32), 5);
  }
  return result;
}

void sub_1000364D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  BOOL v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Rapport syncNowWithCompletionHandler %@, errors: %@", (uint8_t *)&v10, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) clearCachedStatements];
  id v8 = self;
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

void sub_10003695C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 40));
  BOOL v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Rapport syncNowWithDevicesCompletionHandler %@, errors: %@", (uint8_t *)&v10, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) clearCachedStatements];
  id v8 = self;
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

void sub_100036BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100036BF0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100036C00(uint64_t a1)
{
}

void sub_100036C08(uint64_t a1)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) lastCloudKitSyncAttemptDate];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100036F38(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100036F54(void *a1)
{
  if (([*(id *)(a1[4] + 32) open] & 1) == 0)
  {
    uint64_t v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unable to perform CloudKit sync now, because database is not currently accessible", v9, 2u);
    }

    id v4 = [*(id *)(a1[4] + 32) state];
    uint64_t v5 = a1[5];
    if (v5)
    {
      if (v4 == (id)2) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 3;
      }
      BOOL v7 = +[NSError errorWithDomain:BMSyncErrorDomain code:v6 userInfo:0];
      int v10 = v7;
      id v8 = +[NSArray arrayWithObjects:&v10 count:1];
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v8);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void sub_1000370B4(uint64_t a1)
{
  uint64_t v3 = +[NSDate now];
  [*(id *)(*(void *)(a1 + 32) + 32) setLastCloudKitSyncAttemptDate:v3];
}

void sub_100037120(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void **)(v4 + 16);
    uint64_t v7 = *(void *)(a1 + 64);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100037334;
    v14[3] = &unk_10006D898;
    v14[4] = v4;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    [v6 syncNowWithReason:v7 activity:v5 completionHandler:v14];
  }
  else
  {
    id v8 = +[NSString stringWithFormat:@"[BMCloudKitSyncEngine start] failed: %@", a3];
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    id v21 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    int v10 = +[NSError errorWithDomain:@"BMSyncScheduler" code:1 userInfo:v9];

    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 56);
    if (v12)
    {
      id v17 = v10;
      id v13 = +[NSArray arrayWithObjects:&v17 count:1];
      (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, &__NSArray0__struct, v13);
    }
  }
}

void sub_100037334(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CloudKit syncNowWithCompletionHandler %@, errors: %@", (uint8_t *)&v10, 0x16u);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) clearCachedStatements];
  id v8 = self;
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

void sub_100037444(uint64_t a1)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) metricsCollector];
  uint64_t v4 = [v3 sessionContext];
  id v5 = [v4 sessionID];
  [v3 recordSessionStart:v5 transport:3 reason:2 isReciprocal:0];

  id v6 = [v4 sessionID];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 32) lastCloudKitSyncDate];
  [v3 recordSessionEnd:v6 lastSyncDate:v7];

  [*(id *)(*(void *)(a1 + 32) + 32) clearCachedStatements];
}

uint64_t sub_100037590(uint64_t result, int a2)
{
  if (result)
  {
    *(unsigned char *)(result + 32) |= 2u;
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

uint64_t sub_1000375B8(uint64_t result, int a2)
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 32) = *(unsigned char *)(result + 32) & 0xFD | v2;
  }
  return result;
}

uint64_t sub_1000375E4(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 32) >> 1) & 1;
  }
  return result;
}

uint64_t sub_1000375FC(uint64_t result, double a2)
{
  if (result)
  {
    *(unsigned char *)(result + 32) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_100037624(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 32) = *(unsigned char *)(result + 32) & 0xFE | a2;
  }
  return result;
}

uint64_t sub_100037644(uint64_t result)
{
  if (result) {
    return *(unsigned char *)(result + 32) & 1;
  }
  return result;
}

BOOL sub_10003765C(BOOL result)
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

uint64_t sub_100037818(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    unint64_t v13 = v6 >> 3;
    if ((v6 >> 3) == 3)
    {
      uint64_t v20 = PBReaderReadData();
      id v21 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v20;
    }
    else if (v13 == 2)
    {
      *(unsigned char *)(a1 + 32) |= 1u;
      unint64_t v22 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
      {
        uint64_t v23 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v22);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v22 + 8;
      }
      else
      {
        *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
        uint64_t v23 = 0;
      }
      *(void *)(a1 + 8) = v23;
    }
    else if (v13 == 1)
    {
      char v14 = 0;
      unsigned int v15 = 0;
      uint64_t v16 = 0;
      *(unsigned char *)(a1 + 32) |= 2u;
      while (1)
      {
        uint64_t v17 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v17);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v18;
        v16 |= (unint64_t)(v19 & 0x7F) << v14;
        if ((v19 & 0x80) == 0) {
          goto LABEL_34;
        }
        v14 += 7;
        BOOL v10 = v15++ >= 9;
        if (v10)
        {
          LODWORD(v16) = 0;
          goto LABEL_36;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_34:
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v16) = 0;
      }
LABEL_36:
      *(_DWORD *)(a1 + 16) = v16;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100037B70(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    char v4 = *(unsigned char *)(a1 + 32);
    if ((v4 & 2) != 0)
    {
      void v3[4] = *(_DWORD *)(a1 + 16);
      *((unsigned char *)v3 + 32) |= 2u;
      char v4 = *(unsigned char *)(a1 + 32);
    }
    if (v4)
    {
      *((void *)v3 + 1) = *(void *)(a1 + 8);
      *((unsigned char *)v3 + 32) |= 1u;
    }
    unsigned int v5 = *(void **)(a1 + 24);
    if (v5)
    {
      unint64_t v6 = v3;
      sub_100037C24((uint64_t)v3, v5);
      uint64_t v3 = v6;
    }
  }
}

void sub_100037C24(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

void sub_100037EB8(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    char v4 = v3[32];
    if ((v4 & 2) != 0)
    {
      *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
      *(unsigned char *)(a1 + 32) |= 2u;
      char v4 = v3[32];
    }
    if (v4)
    {
      *(void *)(a1 + 8) = *((void *)v3 + 1);
      *(unsigned char *)(a1 + 32) |= 1u;
    }
    unsigned int v5 = (void *)*((void *)v3 + 3);
    if (v5)
    {
      unint64_t v6 = v3;
      objc_storeStrong((id *)(a1 + 24), v5);
      uint64_t v3 = v6;
    }
  }
}

uint64_t sub_100037F70(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

double sub_100037F84(uint64_t a1)
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

uint64_t sub_100037FA0(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

uint64_t sub_100037FC8()
{
  return 31;
}

__CFString *sub_100037FD0()
{
  v0 = (__CFString *)CFStringCreateWithCStringNoCopy(kCFAllocatorDefault, aCreateTableMet, 0x8000100u, kCFAllocatorNull);

  return v0;
}

id sub_100038020()
{
  v17[0] = &off_100072DA8;
  uint64_t v16 = [[BMSyncDatabaseCustomFunctionMigration alloc] initWithCustomFunctionName:@"migration_StarSkySchema11ToSydRoSchema12"];
  v18[0] = v16;
  v17[1] = &off_100072DC0;
  unsigned int v15 = [[BMSyncDatabaseSQLStatementMigration alloc] initWithSQLStatements:&off_100072B68];
  v18[1] = v15;
  v17[2] = &off_100072DD8;
  char v14 = [[BMSyncDatabaseSQLStatementMigration alloc] initWithSQLStatements:&off_100072B80];
  v18[2] = v14;
  v17[3] = &off_100072DF0;
  unint64_t v13 = [[BMSyncDatabaseSQLStatementMigration alloc] initWithSQLStatements:&off_100072B98];
  v18[3] = v13;
  v17[4] = &off_100072E08;
  __int16 v12 = [[BMSyncDatabaseSQLStatementMigration alloc] initWithSQLStatements:&off_100072BB0];
  v18[4] = v12;
  v18[5] = &__NSArray0__struct;
  v17[5] = &off_100072E20;
  v17[6] = &off_100072E38;
  int v11 = [[BMSyncDatabaseCustomFunctionMigration alloc] initWithCustomFunctionName:@"migration_Schema20ToSchema21"];
  v18[6] = v11;
  v17[7] = &off_100072E50;
  v0 = [[BMSyncDatabaseSQLStatementMigration alloc] initWithSQLStatements:&off_100072BC8];
  v18[7] = v0;
  v17[8] = &off_100072E68;
  uint64_t v1 = [[BMSyncDatabaseSQLStatementMigration alloc] initWithSQLStatements:&off_100072BE0];
  v18[8] = v1;
  v17[9] = &off_100072E80;
  char v2 = [[BMSyncDatabaseSQLStatementMigration alloc] initWithSQLStatements:&off_100072BF8];
  v18[9] = v2;
  v17[10] = &off_100072E98;
  uint64_t v3 = [[BMSyncDatabaseSQLStatementMigration alloc] initWithSQLStatements:&off_100072C10];
  v18[10] = v3;
  v17[11] = &off_100072EB0;
  char v4 = [[BMSyncDatabaseSQLStatementMigration alloc] initWithSQLStatements:&off_100072C28];
  v18[11] = v4;
  v17[12] = &off_100072EC8;
  unsigned int v5 = [[BMSyncDatabaseSQLStatementMigration alloc] initWithSQLStatements:&off_100072C40];
  v18[12] = v5;
  v17[13] = &off_100072EE0;
  unint64_t v6 = [[BMSyncDatabaseCustomFunctionMigration alloc] initWithCustomFunctionName:@"migration_Schema27ToSchema28"];
  v18[13] = v6;
  v17[14] = &off_100072EF8;
  uint64_t v7 = [[BMSyncDatabaseSQLStatementMigration alloc] initWithSQLStatements:&off_100072C58];
  v18[14] = v7;
  v17[15] = &off_100072F10;
  unint64_t v8 = [[BMSyncDatabaseSQLStatementMigration alloc] initWithSQLStatements:&off_100072C70];
  v18[15] = v8;
  char v9 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:16];

  return v9;
}

void sub_100039764(_Unwind_Exception *a1)
{
}

void sub_100039784(void *a1)
{
}

void sub_100039C88(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

BOOL sub_10003AF2C(uint64_t a1)
{
  BOOL should_defer = xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
  if (should_defer) {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  }
  return !should_defer;
}

void sub_10003BE80(id a1)
{
  qword_100080348 = objc_opt_new();

  _objc_release_x1();
}

void sub_10003CF70(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) FMDBUserVersion];
  char v2 = [v1 componentsSeparatedByString:@"."];
  id v3 = [v2 count];

  if ((unint64_t)v3 > 2)
  {
    unint64_t v6 = v1;
  }
  else
  {
    do
    {
      id v11 = [v1 stringByAppendingString:@".0"];

      char v4 = [v11 componentsSeparatedByString:@"."];
      id v5 = [v4 count];

      unint64_t v6 = v11;
      uint64_t v1 = v11;
    }
    while ((unint64_t)v5 < 3);
  }
  id v12 = v6;
  uint64_t v7 = [v6 componentsSeparatedByString:@"."];
  for (uint64_t i = 0; i != 3; ++i)
  {
    char v9 = [v7 objectAtIndexedSubscript:i];
    int v10 = [v9 intValue];

    if (v10 >= 16)
    {
      NSLog(@"FMDBVersion is invalid: Please use FMDBUserVersion instead.");
      int v10 = 15;
    }
    dword_100080360 = v10 | (16 * dword_100080360);
  }
}

uint64_t sub_10003D434(void *a1, int a2)
{
  id v3 = a1;
  +[NSDate timeIntervalSinceReferenceDate];
  if (a2)
  {
    double v5 = v4 - v3[3];
    [v3 maxBusyRetryTimeInterval];
    if (v5 >= v6)
    {
      uint64_t v10 = 0;
      goto LABEL_8;
    }
    uint32_t v7 = arc4random_uniform(0x32u);
    uint64_t v8 = v7 + 50;
    uint64_t v9 = sqlite3_sleep(v7 + 50);
    if (v9 != v8) {
      NSLog(@"WARNING: Requested sleep of %i milliseconds, but SQLite returned %i. Maybe SQLite wasn't built with HAVE_USLEEP=1?", v8, v9);
    }
  }
  else
  {
    v3[3] = v4;
  }
  uint64_t v10 = 1;
LABEL_8:

  return v10;
}

BOOL sub_10003D920(id a1, _bmFMStatement *a2, BOOL *a3)
{
  BOOL result = ![(_bmFMStatement *)a2 inUse];
  *a3 = result;
  return result;
}

void *sub_10003F25C(void *result, int a2, void *a3, void *a4)
{
  if (result)
  {
    uint32_t v7 = objc_retainBlock(result);
    uint64_t v8 = a2;
    uint64_t v9 = +[NSMutableDictionary dictionaryWithCapacity:a2];
    if (a2 >= 1)
    {
      do
      {
        uint64_t v10 = +[NSString stringWithUTF8String:*a4];
        if (*a3) {
          +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
        }
        else {
        id v11 = +[NSNull null];
        }
        if (!v11)
        {
          id v11 = +[NSNull null];
        }
        [v9 setObject:v11 forKey:v10];

        ++a3;
        ++a4;
        --v8;
      }
      while (v8);
    }
    uint64_t v12 = v7[2](v7, v9);

    return (void *)v12;
  }
  return result;
}

void sub_10003FC5C(sqlite3_context *a1, uint64_t a2, uint64_t a3)
{
  sqlite3_user_data(a1);
  uint32_t v7 = (void (**)(id, sqlite3_context *, uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v7[2](v7, a1, a2, a3);
  }
}

void sub_100040270()
{
}

void sub_10004029C(uint64_t a1, uint64_t a2)
{
  double v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a1, a2, @"FMDatabase.m", 550, @"The _bmFMDatabase %@ is currently in use.", a2 object file lineNumber description];

  abort();
}

void sub_1000402FC(uint64_t a1, uint64_t a2)
{
  double v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a1, a2, @"FMDatabase.m", 564, @"The _bmFMDatabase %@ is not open.", a2 object file lineNumber description];

  abort();
}

void sub_10004035C(void *a1, uint64_t a2)
{
  double v4 = +[NSAssertionHandler currentHandler];
  id v5 = [a1 lastErrorCode];
  double v6 = [a1 lastErrorMessage];
  [v4 handleFailureInMethod:a2, a1, @"FMDatabase.m", 875, @"DB Error: %d \"%@\"", v5, v6 object file lineNumber description];

  abort();
}

void sub_1000403E4(void *a1, uint64_t a2)
{
  double v4 = +[NSAssertionHandler currentHandler];
  id v5 = [a1 lastErrorMessage];
  [v4 handleFailureInMethod:a2, a1, @"FMDatabase.m", 1351, @"%@", v5 object file lineNumber description];

  abort();
}

void sub_100042134(id *a1, uint64_t a2, int a3)
{
  id v5 = a1;
  double v6 = [*a1 lastErrorMessage];
  unsigned int v7 = [*v5 lastErrorCode];
  LODWORD(v5) = [*v5 lastExtendedErrorCode];
  uint64_t v8 = [*(id *)(a2 + 40) query];
  int v9 = 138413314;
  uint64_t v10 = v6;
  __int16 v11 = 1024;
  unsigned int v12 = v7;
  __int16 v13 = 1024;
  int v14 = (int)v5;
  __int16 v15 = 1024;
  int v16 = a3;
  __int16 v17 = 2112;
  unint64_t v18 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "fmdb: error: %@ errCode: %u extendedErrCode: %u while fetching column %u for statement: %@", (uint8_t *)&v9, 0x28u);
}

id sub_100042744(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)])
  {
    char v2 = +[NSException exceptionWithName:@"Database already in pool" reason:@"The _bmFMDatabase being put back into the pool is already present in the pool" userInfo:0];
    [v2 raise];
  }
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  double v4 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v4 removeObject:v3];
}

void sub_1000428B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000428C8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000428D8(uint64_t a1)
{
}

void sub_1000428E0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) lastObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v6 + 40);
  if (v7)
  {
    [*(id *)(v5 + 24) addObject:*(void *)(v6 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 16) removeLastObject];
  }
  else
  {
    if (*(void *)(v5 + 56))
    {
      uint64_t v8 = (char *)[*(id *)(v5 + 24) count];
      int v9 = &v8[(void)[*(id *)(*(void *)(a1 + 32) + 16) count]];
      if ((unint64_t)v9 >= *(void *)(*(void *)(a1 + 32) + 56))
      {
        NSLog(@"Maximum number of databases (%ld) has already been reached!", v9);
        return;
      }
    }
    uint64_t v10 = [objc_msgSend((id)objc_opt_class(), "databaseClass") databaseWithPath:*(void *)(*(void *)(a1 + 32) + 40)];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) openWithFlags:*(unsigned int *)(*(void *)(a1 + 32) + 32) vfs:*(void *)(*(void *)(a1 + 32) + 64)])
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([*(id *)(*(void *)(a1 + 32) + 48) databasePool:*(void *)(a1 + 32) shouldAddDatabaseToPool:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)] & 1) != 0)
    {
      if (([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)] & 1) == 0)
      {
        [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
        if (!v7 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          __int16 v13 = *(void **)(*(void *)(a1 + 32) + 48);
          [v13 databasePool:didAddDatabase:];
        }
      }
      return;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) close];
  }
  else
  {
    NSLog(@"Could not open up the database at path %@", *(void *)(*(void *)(a1 + 32) + 40));
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;
}

void sub_100042B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100042BB0(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100042C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100042CA4(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100042D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100042D98(uint64_t a1)
{
  uint64_t v2 = (char *)[*(id *)(*(void *)(a1 + 32) + 24) count];
  id result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = &v2[(void)result];
  return result;
}

id sub_100042E50(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v2 removeAllObjects];
}

void sub_1000436EC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) close];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

void sub_1000438F0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if ([v2 hasOpenResultSets]) {
    NSLog(@"Warning: there is at least one open result set around after performing [_bmFMDatabaseQueue inDatabase:]");
  }
}

void sub_100043A10(uint64_t a1)
{
  unsigned __int8 v8 = 0;
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) database];
    [v3 beginImmediateTransaction];
  }
  else if (v2 == 1)
  {
    uint64_t v3 = [*(id *)(a1 + 32) database];
    [v3 beginDeferredTransaction];
  }
  else
  {
    if (v2) {
      goto LABEL_8;
    }
    uint64_t v3 = [*(id *)(a1 + 32) database];
    [v3 beginTransaction];
  }

LABEL_8:
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) database];
  (*(void (**)(uint64_t, void *, unsigned __int8 *))(v4 + 16))(v4, v5, &v8);

  LODWORD(v4) = v8;
  uint64_t v6 = [*(id *)(a1 + 32) database];
  uint64_t v7 = v6;
  if (v4) {
    [v6 rollback];
  }
  else {
    [v6 commit];
  }
}

uint64_t sub_100043C38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100043C48(uint64_t a1)
{
}

void sub_100043C50(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSString);
  uint64_t v3 = qword_100080378++;
  id v4 = [v2 initWithFormat:v3, @"savePoint%ld"];
  char v17 = 0;
  uint64_t v5 = [*(id *)(a1 + 32) database];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  unsigned int v7 = [v5 startSavePointWithName:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = [*(id *)(a1 + 32) database];
    (*(void (**)(uint64_t, void *, char *))(v8 + 16))(v8, v9, &v17);

    if (v17)
    {
      uint64_t v10 = [*(id *)(a1 + 32) database];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      id v15 = *(id *)(v11 + 40);
      [v10 rollbackToSavePointWithName:v4 error:&v15];
      objc_storeStrong((id *)(v11 + 40), v15);
    }
    unsigned int v12 = [*(id *)(a1 + 32) database];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(id *)(v13 + 40);
    [v12 releaseSavePointWithName:v4 error:&v14];
    objc_storeStrong((id *)(v13 + 40), v14);
  }
}

void sub_100043EC8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 checkpoint:*(unsigned int *)(a1 + 80) name:*(void *)(a1 + 40) logFrameCount:*(void *)(a1 + 56) checkpointCount:*(void *)(a1 + 64) error:*(void *)(a1 + 72)];
}

void sub_100043FC0()
{
  __assert_rtn("-[_bmFMDatabaseQueue inDatabase:]", "FMDatabaseQueue.m", 185, "currentSyncQueue != self && \"inDatabase: was called reentrantly on the same queue, which would lead to a deadlock\"");
}

void sub_100043FEC(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "BMRapportClient[%@]: invalidated", (uint8_t *)&v3, 0xCu);
}

void sub_100044068(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "BMRapportClient[%@]: Must be inactive before creating and activating companion link client", (uint8_t *)&v3, 0xCu);
}

void sub_1000440E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "locationRow is nil, returning empty state vector", v1, 2u);
}

void sub_100044128(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "BMStreamCKRecordCRDT: failed to calculate batch size with error %@", buf, 0xCu);
}

void sub_100044170(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "BMStreamCKRecordCRDT: failed to split atom batch with error %@", (uint8_t *)&v1, 0xCu);
}

void sub_1000441EC(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unexpected modifier %lu", (uint8_t *)&v2, 0xCu);
}

void sub_100044264(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "BMMultiStreamVectorClockConverter found nil modifier on siteIdentifier: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000442DC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "sessionContext is nil", v1, 2u);
}

void sub_100044320()
{
  sub_100007DF4();
  sub_100007E0C((void *)&_mh_execute_header, v0, v1, "BMCoordinationXPCSyncEventReporter: stream %@: failed to notify coordination service of changes: %@");
}

void sub_100044388()
{
  sub_100007DF4();
  sub_100007E0C((void *)&_mh_execute_header, v0, v1, "BMCoordinationXPCSyncEventReporter: stream %@: failed to notify coordination service of user deletions: %@");
}

void sub_1000443F0()
{
  sub_10000DCA4();
  os_log_t v1 = [*v0 siteSuffix];
  sub_10000DC8C();
  sub_10000DC6C((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: fetchAtomBatchRequest is nil, skip sending request to device: %@", v4, v5, v6, v7, v8);
}

void sub_100044480()
{
  sub_10000DCA4();
  uint64_t v2 = [v1 siteSuffix];
  int v9 = [v0 account];
  sub_10000DC6C((void *)&_mh_execute_header, v3, v4, "BMRapportSyncEngine%@: unable to create a sync manager for account %@", v5, v6, v7, v8, 2u);
}

void sub_100044530()
{
  sub_10000DCA4();
  id v1 = [(id)sub_10000DCC8(v0) siteSuffix];
  sub_10000DC8C();
  sub_10000DC6C((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: unable to determine sender model info: %@", v4, v5, v6, v7, v8);
}

void sub_1000445BC()
{
  sub_10000DCA4();
  id v1 = [(id)sub_10000DCC8(v0) siteSuffix];
  sub_10000DCB0();
  sub_10000DC6C((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: unable to determine platform for model %{public}@", v4, v5, v6, v7, v8);
}

void sub_100044648()
{
  sub_10000DCA4();
  id v1 = [(id)sub_10000DCC8(v0) siteSuffix];
  sub_10000DC8C();
  sub_10000DC6C((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: rejecting request from communal device to sync outside home %@", v4, v5, v6, v7, v8);
}

void sub_1000446D4()
{
  sub_10000DCA4();
  id v1 = [*v0 siteSuffix];
  sub_10000DCB0();
  sub_10000DC6C((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: unable to create sync manager for %{public}@", v4, v5, v6, v7, v8);
}

void sub_100044764()
{
  sub_10000DCA4();
  id v1 = [(id)sub_10000DCC8(v0) siteSuffix];
  sub_10000DC8C();
  sub_10000DC6C((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: rejecting request from personal device to sync cross account %@", v4, v5, v6, v7, v8);
}

void sub_1000447F0()
{
  sub_10000DCA4();
  id v1 = [v0 siteSuffix];
  sub_10000DCB0();
  sub_10000DC6C((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: unable to create sync manager for %{public}@", v4, v5, v6, v7, v8);
}

void sub_10004487C()
{
  sub_10000DCA4();
  id v1 = [v0 siteSuffix];
  sub_10000DC8C();
  sub_10000DC6C((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: fetchAtomBatchRequest is nil, skip sending request to device: %@", v4, v5, v6, v7, v8);
}

void sub_100044908()
{
  sub_10000DCA4();
  id v1 = [v0 siteSuffix];
  sub_10000DC8C();
  sub_10000DC6C((void *)&_mh_execute_header, v2, v3, "BMRapportSyncEngine%@: createDistributedSyncManagerFromOptions unable to determine sender account info: %@", v4, v5, v6, v7, v8);
}

void sub_100044994(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to access sync resources with error %@", (uint8_t *)&v2, 0xCu);
}

void sub_100044A0C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "BMRapportDiscoveryManager: skipping RPCompanionLinkDevice missing identifier: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100044A84(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "BMRapportDiscoveryManager: skipping RPCompanionLinkDevice missing model: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100044AFC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  sub_10000DC8C();
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@ - has validStreamNames: %@", v6, 0x16u);
}

void sub_100044BA0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  sub_10000DC8C();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@ could not archive state vector: %@", v6, 0x16u);
}

void sub_100044C44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100044CBC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Received unexpected object on com.apple.notifyd.matching: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100044D34(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Received unexpected object on com.apple.rapport.matching: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100044DAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100044E24(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100044E94()
{
  sub_100018C34();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "adding %@ to atomBatch", v1, 0xCu);
}

void sub_100044F08()
{
  sub_100018C74();
  sub_100018C40((void *)&_mh_execute_header, v0, v1, "failed to batch ingest deletions", v2, v3, v4, v5, v6);
}

void sub_100044F3C()
{
  sub_100018C74();
  sub_100018C40((void *)&_mh_execute_header, v0, v1, "failed to batch ingest changes", v2, v3, v4, v5, v6);
}

void sub_100044F70()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "failed to delete atoms with location: %@", v2, v3, v4, v5, v6);
}

void sub_100044FD8()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "populateAndEnumerateAtomBatches could not finish writing atomBatch with err: %@", v2, v3, v4, v5, v6);
}

void sub_100045040()
{
  sub_100018C34();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Populating atom batch with record %@", v1, 0xCu);
}

void sub_1000450B4()
{
  sub_100018C34();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "currentRangeClockVector %@ minusVector clockVector %@", v2, 0x16u);
}

void sub_100045138()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "could not create new batch with location %@", v2, v3, v4, v5, v6);
}

void sub_1000451A0()
{
  sub_100018C34();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "failed to delete event at bookmark %@", v1, 0xCu);
}

void sub_100045214(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 mergeableValueID];
  sub_100018C34();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "location is unexpectedly nil, unable to parse from mergeableValueID %@", v4, 0xCu);
}

void sub_1000452A8()
{
  sub_100018C74();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "location is unexpectedly nil", v1, 2u);
}

void sub_1000452E8(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "storing atom batches operations failed to commit transactions", buf, 2u);
}

void sub_100045328()
{
  sub_100018C74();
  sub_100018C40((void *)&_mh_execute_header, v0, v1, "storing atom batches failed to commit transaction during operation, stopping early", v2, v3, v4, v5, v6);
}

void sub_10004535C(void *a1, uint64_t a2, NSObject *a3)
{
  uint8_t v6 = [a1 timestamp];
  uint64_t v7 = [v6 bm_description];
  uint8_t v8 = sub_1000259F8((unint64_t)[a1 type]);
  uint64_t v9 = *(void *)(*(void *)a2 + 16);
  int v10 = 138413058;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = v8;
  __int16 v14 = 2112;
  uint64_t v15 = v9;
  __int16 v16 = 2112;
  char v17 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to insert record for atom: %@ (%@), stream: %@, record: %@", (uint8_t *)&v10, 0x2Au);
}

void sub_100045458(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 timestamp];
  uint64_t v5 = [v4 bm_description];
  uint8_t v6 = sub_1000259F8((unint64_t)[a1 type]);
  uint64_t v7 = [a1 valueData];
  [v7 length];
  sub_100018C80();
  int v10 = v6;
  __int16 v11 = 2048;
  uint64_t v12 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Received atom: %@ (%@), size: %llu", v9, 0x20u);
}

void sub_100045550()
{
  sub_100018C74();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "causalReference location is unexpectedly nil", v1, 2u);
}

void sub_100045590()
{
  sub_100018C34();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "failed to insert referenceLocationRow for location %@", v1, 0xCu);
}

void sub_100045604()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "failed to update row: %@", v2, v3, v4, v5, v6);
}

void sub_10004566C(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 timestamp];
  uint64_t v5 = [v4 bm_description];
  uint8_t v6 = sub_1000259F8((unint64_t)[a1 type]);
  sub_100018C5C();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to apply atom %@ (%@) to disk", v7, 0x16u);
}

void sub_100045734(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 timestamp];
  uint64_t v5 = [v4 bm_description];
  uint8_t v6 = sub_1000259F8((unint64_t)[a1 type]);
  sub_100018C5C();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Applying atom to disk: %@ (%@)", v7, 0x16u);
}

void sub_1000457FC(void *a1, void *a2, NSObject *a3)
{
  uint8_t v6 = [a1 timestamp];
  uint64_t v7 = [v6 bm_description];
  uint64_t v8 = sub_1000259F8((unint64_t)[a1 type]);
  uint64_t v9 = [a2 timestamp];
  int v10 = [v9 bm_description];
  __int16 v11 = [a1 referenceLocation];
  sub_100018C80();
  uint64_t v15 = v8;
  __int16 v16 = v12;
  char v17 = v10;
  __int16 v18 = v12;
  char v19 = a1;
  __int16 v20 = v12;
  uint64_t v21 = v13;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "causal reference violation: %@ -(%@)-> %@\nAtom: %@\nReference location: %@", v14, 0x34u);
}

void sub_10004592C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to activate requests manager %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000459A4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to activate discovery manager %@", (uint8_t *)&v2, 0xCu);
}

void sub_100045A1C()
{
  sub_100018C74();
  sub_10001BA90((void *)&_mh_execute_header, v0, v1, "sendRequest:request:device:options:responseHandler: passed nil device", v2, v3, v4, v5, v6);
}

void sub_100045A50()
{
  sub_100018C74();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "handleActivationForDevice:error: passed nil device", v1, 2u);
}

void sub_100045A90()
{
  sub_100018C74();
  sub_10001BA90((void *)&_mh_execute_header, v0, v1, "sendNextRequestToDevice: passed nil device", v2, v3, v4, v5, v6);
}

void sub_100045AC4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 shortenedRapportIdentifier];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "BMRapportDevice[%@]: expected request id and response handler in %@", (uint8_t *)&v6, 0x16u);
}

void sub_100045B78()
{
  sub_100018C74();
  sub_10001BA90((void *)&_mh_execute_header, v0, v1, "finishedSendingRequestsToDevice: passed nil device", v2, v3, v4, v5, v6);
}

void sub_100045BAC()
{
  sub_100018C34();
  sub_10001C9E8((void *)&_mh_execute_header, v0, v1, "failed to unarchive BMMultiStreamTimestampClockVector with error %@", v2, v3, v4, v5, v6);
}

void sub_100045C14()
{
  sub_100018C34();
  sub_10001C9E8((void *)&_mh_execute_header, v0, v1, "failed to unarchive BMMultiStreamVectorClock with error %@", v2, v3, v4, v5, v6);
}

void sub_100045C7C()
{
  sub_100018C34();
  sub_10001C9E8((void *)&_mh_execute_header, v0, v1, "failed to archive BMMultiStreamVectorClock with error %@", v2, v3, v4, v5, v6);
}

void sub_100045CE4()
{
  sub_100018C34();
  sub_10001C9E8((void *)&_mh_execute_header, v0, v1, "failed to unarchive BMMultiStreamAtomBatches with error %@", v2, v3, v4, v5, v6);
}

void sub_100045D4C()
{
  sub_100018C34();
  sub_10001C9E8((void *)&_mh_execute_header, v0, v1, "failed to archive BMMultiStreamAtomBatches with error %@", v2, v3, v4, v5, v6);
}

void sub_100045DB4(id *a1)
{
  uint64_t v1 = [*a1 lastErrorMessage];
  sub_100018C34();
  sub_100021494((void *)&_mh_execute_header, v2, v3, "Failed to insert: %@", v4, v5, v6, v7, v8);
}

void sub_100045E3C(id *a1)
{
  uint64_t v1 = [*a1 lastErrorMessage];
  sub_100018C34();
  sub_100021494((void *)&_mh_execute_header, v2, v3, "Failed to update: %@", v4, v5, v6, v7, v8);
}

void sub_100045EC4()
{
  sub_100018C34();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "clock vector is empty %@", v1, 0xCu);
}

void sub_100045F38(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "exceeded max number of distinct range clauses in clock vector query, not processing additional timestamps", v1, 2u);
}

void sub_100045F7C()
{
  sub_100023648();
  sub_100007E0C((void *)&_mh_execute_header, v0, v1, "BMRapportManager[%@]: skipping RPCompanionLinkDevice missing identifier: %@");
}

void sub_100045FF4()
{
  sub_100023648();
  sub_100007E0C((void *)&_mh_execute_header, v0, v1, "BMRapportManager[%@]: skipping RPCompanionLinkDevice missing model: %@");
}

void sub_10004606C()
{
  sub_100023648();
  sub_100007E0C((void *)&_mh_execute_header, v0, v1, "BMRapportManager[%@]: skipping RPCompanionLinkDevice failed validation: %@");
}

void sub_1000460E4()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_100018C34();
  sub_100021494((void *)&_mh_execute_header, v2, v3, "%@: tried to initialize a BMPBSyncAtomValue proto, missing type or value", v4, v5, v6, v7, v8);
}

void sub_10004616C()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_100018C34();
  sub_100021494((void *)&_mh_execute_header, v2, v3, "%@: tried to initialize with a non-BMPBSyncAtomValue proto", v4, v5, v6, v7, v8);
}

void sub_1000461F4()
{
  sub_100018C34();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "cannot deserialize atom value of version %lu", v1, 0xCu);
}

void sub_100046268()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_100018C34();
  sub_100021494((void *)&_mh_execute_header, v2, v3, "%@: tried to initialize a BMPBStoreEventAtomValue proto: missing dataVersion or dataTimestamp", v4, v5, v6, v7, v8);
}

void sub_1000462F0()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_100018C34();
  sub_100021494((void *)&_mh_execute_header, v2, v3, "%@: tried to initialize with a non-BMPBStoreEventAtomValue proto", v4, v5, v6, v7, v8);
}

void sub_100046378(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 identifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "failed to open database for account: %@", a1, 0xCu);
}

void sub_1000463F0()
{
  sub_100018C34();
  sub_10001C9E8((void *)&_mh_execute_header, v0, v1, "unknown value in BMCloudKitRecordTypeString: %lu", v2, v3, v4, v5, v6);
}

void sub_100046458()
{
  sub_100018C74();
  sub_100018C40((void *)&_mh_execute_header, v0, v1, "unable to obtain Manatee accountInfo", v2, v3, v4, v5, v6);
}

void sub_10004648C()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "iCloud account status: %ld", v2, v3, v4, v5, v6);
}

void sub_1000464F4()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "CloudKit container is not accessible. Status: %ld", v2, v3, v4, v5, v6);
}

void sub_10004655C()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "iCloud account doesn't support end-to-end encryption: %ld", v2, v3, v4, v5, v6);
}

void sub_1000465C4()
{
  sub_100018C74();
  sub_100018C40((void *)&_mh_execute_header, v0, v1, "account status is CKAccountStatusTemporarilyUnavailable", v2, v3, v4, v5, v6);
}

void sub_1000465F8()
{
  sub_100018C74();
  sub_100018C40((void *)&_mh_execute_header, v0, v1, "unable to initialize ckSyncEngine", v2, v3, v4, v5, v6);
}

void sub_10004662C()
{
  sub_100018C74();
  sub_100018C40((void *)&_mh_execute_header, v0, v1, "unable to initialize CloudKit configuration", v2, v3, v4, v5, v6);
}

void sub_100046660()
{
  sub_100018C74();
  sub_100018C40((void *)&_mh_execute_header, v0, v1, "unable to initialize CloudKit container", v2, v3, v4, v5, v6);
}

void sub_100046694()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "accountInfoWithCompletionHandler returned error: %@", v2, v3, v4, v5, v6);
}

void sub_1000466FC()
{
  sub_100018C34();
  sub_10001C9E8((void *)&_mh_execute_header, v0, v1, "isRecordNewerThanMostRecentDeleteForSiteIdentifier: Could not create location from CKRecord: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100046764()
{
  sub_10002F668();
  sub_10002F648((void *)&_mh_execute_header, v0, v1, "Error serverValue is nil for delta %{public}@ %{public}@");
}

void sub_1000467CC()
{
  sub_10002F668();
  sub_10002F648((void *)&_mh_execute_header, v0, v1, "handleSyncRecordDidFetchRecord: Can't build location from record stream:%{public}@ recordName:%{public}@");
}

void sub_100046834()
{
  sub_10002F668();
  __int16 v3 = v0;
  uint64_t v4 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "Error saving [saveCKRecordServerMergeableValue:serverValueData] for %{public}@ %{public}@, %{public}@", v2, 0x20u);
}

void sub_1000468B4(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 recordID];
  uint64_t v5 = [v4 recordName];
  uint8_t v6 = [a1 recordType];
  int v8 = 138543618;
  uint64_t v9 = v5;
  sub_10002F6D0();
  sub_10002F680((void *)&_mh_execute_header, a2, v7, "didFetchRecord: unknown record %{public}@ type: %{public}@", (uint8_t *)&v8);
}

void sub_100046978()
{
  sub_10002F698();
  sub_10002F680((void *)&_mh_execute_header, v0, v1, "handleDidSaveRecordSyncRecord: serverValue nil for %{public}@ %{public}@", v2);
}

void sub_1000469E8()
{
  sub_10002F698();
  sub_10002F648((void *)&_mh_execute_header, v0, v1, "handleDidSaveRecordSyncRecord: unable to find record on db:%{public}@ %{public}@");
}

void sub_100046A58()
{
  sub_10002F668();
  sub_10002F648((void *)&_mh_execute_header, v0, v1, "Error encoding localValue for %{public}@ %{public}@");
}

void sub_100046AC0()
{
  sub_10002F698();
  sub_10002F648((void *)&_mh_execute_header, v0, v1, "nil value for localValue for %{public}@ %{public}@");
}

void sub_100046B30(void *a1)
{
  os_log_t v1 = [a1 recordID];
  uint64_t v2 = [v1 recordName];
  sub_100018C34();
  sub_10002F6E0((void *)&_mh_execute_header, v3, v4, "Zone ID is nil; record dropped %{public}@", v5, v6, v7, v8, v9);
}

void sub_100046BCC(void *a1, void *a2)
{
  uint64_t v3 = [a1 zoneName];
  uint64_t v4 = [a2 recordID];
  uint64_t v5 = [v4 recordName];
  sub_10002F6D0();
  sub_10000DC6C((void *)&_mh_execute_header, v6, v7, "Add zone and add record request made %{public}@ %{public}@.", v8, v9, v10, v11, 2u);
}

void sub_100046C88(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100046CF8(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = 0;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  sub_10002F680((void *)&_mh_execute_header, a2, a3, "handleFailedToSaveSyncRecordServerRecordChanged: serverCRDT is nil for record: %{public}@ for error: %{public}@", (uint8_t *)&v4);
}

void sub_100046D78()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "Error handleFailedToSaveSyncRecordServerRecordChanged: [serverCRDT mergeRecordValue:clientCRDT]; error: %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100046DE0()
{
  sub_100018C34();
  sub_10001C9E8((void *)&_mh_execute_header, v0, v1, "Error not handled: failedToSaveRecord, error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100046E48()
{
  sub_100018C34();
  sub_10001C9E8((void *)&_mh_execute_header, v0, v1, "Error not handled: failedToSaveRecord, zoneVersion error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100046EB0()
{
  sub_100018C34();
  sub_10001C9E8((void *)&_mh_execute_header, v0, v1, "Error not handled: failedToSaveRecord, hightestDeletedLocation error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100046F18(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100046F88(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  sub_10002F680((void *)&_mh_execute_header, a4, a3, "syncEngineDidEndFetchingChanges: Can't build location from record stream:%{public}@ recordName:%{public}@", (uint8_t *)a3);
}

void sub_100046FF0()
{
  sub_100018C34();
  sub_10001C9E8((void *)&_mh_execute_header, v0, v1, "locationRow is unexpectly nil for location %{public}@", v2, v3, v4, v5, v6);
}

void sub_100047058(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&void v3[4] = *(void *)(*(void *)a1 + 40);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_10002F648((void *)&_mh_execute_header, a2, a3, "Unable to archive recordValue %{public}@ %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_1000470D8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) recordName];
  uint64_t v3 = [*(id *)(a1 + 32) streamIdentifier];
  sub_10002F6B0();
  sub_10002F700((void *)&_mh_execute_header, v4, v5, "Unable to [recordValue mergeRecordValue:serverValue for %{public}@ %{public}@ %{public}@", v6, v7, v8, v9, v10);
}

void sub_100047184(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) recordName];
  uint64_t v3 = [*(id *)(a1 + 32) streamIdentifier];
  sub_10002F6B0();
  sub_10002F700((void *)&_mh_execute_header, v4, v5, "syncEngineDidEndFetchingChanges: Unable to unarchive mergeableRecordValue for %{public}@ %{public}@ %{public}@", v6, v7, v8, v9, v10);
}

void sub_100047230(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not generate atom data from atomBatch: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000472B8()
{
  uint64_t v0 = BMDevicePlatformGetDescription();
  sub_100021494((void *)&_mh_execute_header, v1, v2, "BMRapportManager: could not determine appropriate control flags for device platform: %@", v3, v4, v5, v6, 2u);
}

void sub_100047344()
{
  uint64_t v0 = BMDevicePlatformGetDescription();
  sub_100021494((void *)&_mh_execute_header, v1, v2, "BMRapportManager: could not determine appropriate control flags for device platform: %@", v3, v4, v5, v6, 2u);
}

void sub_1000473CC(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "BMRapportClient[%@]: Requests must be added before activation", (uint8_t *)&v3, 0xCu);
}

void sub_100047454(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "BMRapportClient[%@]: Requests must be registered during activation", (uint8_t *)&v3, 0xCu);
}

void sub_1000474DC()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "Unable to create unarchiver %@", v2, v3, v4, v5, v6);
}

void sub_100047544()
{
  sub_100018C34();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "unable to create a record with initWithRecordType for %@", v1, 0xCu);
}

void sub_1000475B8()
{
  sub_100018C34();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Unable to create a record from systemFieldsData for %@", v1, 0xCu);
}

void sub_10004762C()
{
  sub_100018C34();
  sub_10002F648((void *)&_mh_execute_header, v0, v1, "Error saving via saveSystemFieldsDataForRecord: for %{public}@ %{public}@");
}

void sub_1000476A0()
{
  sub_100007DF4();
  sub_100007E0C((void *)&_mh_execute_header, v0, v1, "Failed to clear metadata for record %@ in zone %@");
}

void sub_100047708()
{
  sub_100007DF4();
  sub_10002F648((void *)&_mh_execute_header, v0, v1, "Error saving CKRecord in saveCKRecordServerMergeableValue: for %@ %@");
}

void sub_100047770()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "Problems updating CKRecords at or before location %@", v2, v3, v4, v5, v6);
}

void sub_1000477D8()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "Problems deleting CKRecords at or before location %@", v2, v3, v4, v5, v6);
}

void sub_100047840()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "Failed to delete CKRecords for streamName:%@", v2, v3, v4, v5, v6);
}

void sub_1000478A8()
{
  sub_100018C34();
  sub_100012330((void *)&_mh_execute_header, v0, v1, "Can not delete CKRecord at location %@", v2, v3, v4, v5, v6);
}

void sub_100047910(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 zoneName];
  sub_100018C34();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to delete all data associated with zone %@", v4, 0xCu);
}

void sub_1000479A4(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 lastErrorMessage];
  sub_100018C34();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Failed to insert: %@", v4, 0xCu);
}

void sub_100047A3C()
{
  sub_100007DF4();
  sub_100007E0C((void *)&_mh_execute_header, v0, v1, "Problems updating CKRecords in stream: %@ site: %@");
}

void sub_100047AA4()
{
  sub_100039C88(__stack_chk_guard);
  sub_100023648();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "BMSyncDatabase%@ error: %@", v1, 0x16u);
}

void sub_100047B1C()
{
  sub_100039C88(__stack_chk_guard);
  CFStringRef v3 = @"unknown";
  if (v0) {
    CFStringRef v3 = (const __CFString *)v0;
  }
  *(_DWORD *)uint64_t v4 = 138412546;
  *(void *)&void v4[4] = v2;
  *(_WORD *)&v4[12] = 2112;
  *(void *)&v4[14] = v3;
  sub_10002F648((void *)&_mh_execute_header, v0, v1, "BMSyncDatabase%@ unrecoverable error: %@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16]);
}

void sub_100047BA4()
{
  sub_100039C88(__stack_chk_guard);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "BMSyncDatabase%@ database corrupt", (uint8_t *)&v2, 0xCu);
}

void sub_100047C1C()
{
  sub_100039C88(__stack_chk_guard);
  sub_100023648();
  sub_10002F648((void *)&_mh_execute_header, v0, v1, "BMSyncDatabase%@ database corrupt: %@");
}

void sub_100047C84(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not enable WAL and foreign_keys on sync database", v1, 2u);
}

void sub_100047CC8()
{
  sub_100039C88(__stack_chk_guard);
  int v2 = 138412290;
  uint64_t v3 = v0;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "BMSyncDatabase%@ state queried while opening", (uint8_t *)&v2, 0xCu);
}

void sub_100047D40(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*a2 lastError];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "BMSyncDatabase%@ failed to close db %@", (uint8_t *)&v6, 0x16u);
}

void sub_100047DF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100047E2C(uint64_t a1, NSObject *a2)
{
  int v3 = 138412290;
  uint64_t v4 = objc_opt_class();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "%@ received nil deviceIdentifier", (uint8_t *)&v3, 0xCu);
}

void sub_100047EB8(uint64_t a1, NSObject *a2)
{
  int v3 = sub_10000730C(a1);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Merge result: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100047F50(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100047FBC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100048028(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100048060(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100048098(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000480D0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004813C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "can not determine streamName", v1, 2u);
}

void sub_100048180(void *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (*a1) {
    CFStringRef v4 = @"empty";
  }
  else {
    CFStringRef v4 = @"nil";
  }
  int v5 = 138412546;
  CFStringRef v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "_streamName is %@ for %@", (uint8_t *)&v5, 0x16u);
}

void sub_100048228(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "unknown mergeable value ID format version %lu", (uint8_t *)&v2, 0xCu);
}

uint64_t BMDevicePlatformFromModelString()
{
  return _BMDevicePlatformFromModelString();
}

uint64_t BMDevicePlatformGetDescription()
{
  return _BMDevicePlatformGetDescription();
}

uint64_t BMStorageErrorGetErrno()
{
  return _BMStorageErrorGetErrno();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return _CFStringCreateWithCStringNoCopy(alloc, cStr, encoding, contentsDeallocator);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return _PBDataWriterWriteDoubleField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return _PBDataWriterWriteUint32Field();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __biome_log_for_category()
{
  return ___biome_log_for_category();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void abort(void)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

uint64_t bm_generateChecksum()
{
  return _bm_generateChecksum();
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return _dispatch_get_current_queue();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
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

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
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

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

uid_t getuid(void)
{
  return _getuid();
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

uint64_t self
{
  return _self;
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_blob(a1, a2, a3, n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return _sqlite3_bind_parameter_count(a1);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return _sqlite3_bind_parameter_index(a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return _sqlite3_busy_handler(a1, a2, a3);
}

int sqlite3_changes(sqlite3 *a1)
{
  return _sqlite3_changes(a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_blob(a1, iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_bytes(a1, iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return _sqlite3_column_name(a1, N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return _sqlite3_create_function(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_data_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_data_count(pStmt);
}

int sqlite3_errcode(sqlite3 *db)
{
  return _sqlite3_errcode(db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return _sqlite3_errstr(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return _sqlite3_extended_errcode(db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

void sqlite3_free(void *a1)
{
}

void sqlite3_interrupt(sqlite3 *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return _sqlite3_last_insert_rowid(a1);
}

const char *sqlite3_libversion(void)
{
  return _sqlite3_libversion();
}

int sqlite3_limit(sqlite3 *a1, int id, int newVal)
{
  return _sqlite3_limit(a1, id, newVal);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return _sqlite3_next_stmt(pDb, pStmt);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return _sqlite3_open(filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
}

void sqlite3_result_error_code(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_error_nomem(sqlite3_context *a1)
{
}

void sqlite3_result_error_toobig(sqlite3_context *a1)
{
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

int sqlite3_sleep(int a1)
{
  return _sqlite3_sleep(a1);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int sqlite3_system_errno(sqlite3 *a1)
{
  return _sqlite3_system_errno(a1);
}

int sqlite3_threadsafe(void)
{
  return _sqlite3_threadsafe();
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return _sqlite3_user_data(a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return _sqlite3_value_blob(a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return _sqlite3_value_bytes(a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  return _sqlite3_value_double(a1);
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return _sqlite3_value_int(a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return _sqlite3_value_int64(a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return _sqlite3_value_text(a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return _sqlite3_value_type(a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return _sqlite3_wal_checkpoint_v2(db, zDb, eMode, pnLog, pnCkpt);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t vproc_swap_integer()
{
  return _vproc_swap_integer();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_CKAtomRowSiteIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 CKAtomRowSiteIdentifiers];
}

id objc_msgSend_FMDBUserVersion(void *a1, const char *a2, ...)
{
  return [a1 FMDBUserVersion];
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

id objc_msgSend__companionLinkClientInvalidated(void *a1, const char *a2, ...)
{
  return [a1 _companionLinkClientInvalidated];
}

id objc_msgSend__createAndActivateCompanionLinkClient(void *a1, const char *a2, ...)
{
  return [a1 _createAndActivateCompanionLinkClient];
}

id objc_msgSend__deregisterRequests(void *a1, const char *a2, ...)
{
  return [a1 _deregisterRequests];
}

id objc_msgSend__numPagesToVacuum(void *a1, const char *a2, ...)
{
  return [a1 _numPagesToVacuum];
}

id objc_msgSend__registerRequests(void *a1, const char *a2, ...)
{
  return [a1 _registerRequests];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountAltDSID(void *a1, const char *a2, ...)
{
  return [a1 accountAltDSID];
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return [a1 accountStatus];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_activeDevices(void *a1, const char *a2, ...)
{
  return [a1 activeDevices];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allPeers(void *a1, const char *a2, ...)
{
  return [a1 allPeers];
}

id objc_msgSend_allSiteIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allSiteIdentifiers];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_atomBatchBytes(void *a1, const char *a2, ...)
{
  return [a1 atomBatchBytes];
}

id objc_msgSend_atomBatchVersion(void *a1, const char *a2, ...)
{
  return [a1 atomBatchVersion];
}

id objc_msgSend_atomBatches(void *a1, const char *a2, ...)
{
  return [a1 atomBatches];
}

id objc_msgSend_atomType(void *a1, const char *a2, ...)
{
  return [a1 atomType];
}

id objc_msgSend_attemptedRecoveryDate(void *a1, const char *a2, ...)
{
  return [a1 attemptedRecoveryDate];
}

id objc_msgSend_batchSequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 batchSequenceNumber];
}

id objc_msgSend_beginDeferredTransaction(void *a1, const char *a2, ...)
{
  return [a1 beginDeferredTransaction];
}

id objc_msgSend_beginImmediateTransaction(void *a1, const char *a2, ...)
{
  return [a1 beginImmediateTransaction];
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return [a1 beginTransaction];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return [a1 block];
}

id objc_msgSend_bmDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bmDeviceIdentifier];
}

id objc_msgSend_bookmark(void *a1, const char *a2, ...)
{
  return [a1 bookmark];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cachedStatements(void *a1, const char *a2, ...)
{
  return [a1 cachedStatements];
}

id objc_msgSend_causalReference(void *a1, const char *a2, ...)
{
  return [a1 causalReference];
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return [a1 charValue];
}

id objc_msgSend_ckMergeableValueID(void *a1, const char *a2, ...)
{
  return [a1 ckMergeableValueID];
}

id objc_msgSend_ckSyncEngineMetaData(void *a1, const char *a2, ...)
{
  return [a1 ckSyncEngineMetaData];
}

id objc_msgSend_clearCKSyncEngineMetaData(void *a1, const char *a2, ...)
{
  return [a1 clearCKSyncEngineMetaData];
}

id objc_msgSend_clearCachedStatements(void *a1, const char *a2, ...)
{
  return [a1 clearCachedStatements];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_clockValue(void *a1, const char *a2, ...)
{
  return [a1 clockValue];
}

id objc_msgSend_clockVector(void *a1, const char *a2, ...)
{
  return [a1 clockVector];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_closeOpenResultSets(void *a1, const char *a2, ...)
{
  return [a1 closeOpenResultSets];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_columnNameToIndexMap(void *a1, const char *a2, ...)
{
  return [a1 columnNameToIndexMap];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_compactAndDeleteSessionLogs(void *a1, const char *a2, ...)
{
  return [a1 compactAndDeleteSessionLogs];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_computeAndSendAggregatedMetrics(void *a1, const char *a2, ...)
{
  return [a1 computeAndSendAggregatedMetrics];
}

id objc_msgSend_computeAndSendStateVectorMetrics(void *a1, const char *a2, ...)
{
  return [a1 computeAndSendStateVectorMetrics];
}

id objc_msgSend_computeStateVectorMetrics(void *a1, const char *a2, ...)
{
  return [a1 computeStateVectorMetrics];
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return [a1 config];
}

id objc_msgSend_contentsVector(void *a1, const char *a2, ...)
{
  return [a1 contentsVector];
}

id objc_msgSend_controlFlagsForSameAccountDiscovery(void *a1, const char *a2, ...)
{
  return [a1 controlFlagsForSameAccountDiscovery];
}

id objc_msgSend_controlFlagsForSharedHomeDiscovery(void *a1, const char *a2, ...)
{
  return [a1 controlFlagsForSharedHomeDiscovery];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_corruptionHandler(void *a1, const char *a2, ...)
{
  return [a1 corruptionHandler];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countAtomMergeResultRecords(void *a1, const char *a2, ...)
{
  return [a1 countAtomMergeResultRecords];
}

id objc_msgSend_crashOnErrors(void *a1, const char *a2, ...)
{
  return [a1 crashOnErrors];
}

id objc_msgSend_currentFrameStore(void *a1, const char *a2, ...)
{
  return [a1 currentFrameStore];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentPersonaIdentifierLoggingDescription(void *a1, const char *a2, ...)
{
  return [a1 currentPersonaIdentifierLoggingDescription];
}

id objc_msgSend_currentlyInGameMode(void *a1, const char *a2, ...)
{
  return [a1 currentlyInGameMode];
}

id objc_msgSend_customFunctionName(void *a1, const char *a2, ...)
{
  return [a1 customFunctionName];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataTimestamp(void *a1, const char *a2, ...)
{
  return [a1 dataTimestamp];
}

id objc_msgSend_dataVersion(void *a1, const char *a2, ...)
{
  return [a1 dataVersion];
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return [a1 database];
}

id objc_msgSend_databaseClass(void *a1, const char *a2, ...)
{
  return [a1 databaseClass];
}

id objc_msgSend_databaseExists(void *a1, const char *a2, ...)
{
  return [a1 databaseExists];
}

id objc_msgSend_databasePath(void *a1, const char *a2, ...)
{
  return [a1 databasePath];
}

id objc_msgSend_databaseSizeInKilobytes(void *a1, const char *a2, ...)
{
  return [a1 databaseSizeInKilobytes];
}

id objc_msgSend_datastorePath(void *a1, const char *a2, ...)
{
  return [a1 datastorePath];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return [a1 dateFormatter];
}

id objc_msgSend_dateOfLastVacuum(void *a1, const char *a2, ...)
{
  return [a1 dateOfLastVacuum];
}

id objc_msgSend_dateToRelativePositionDictionary(void *a1, const char *a2, ...)
{
  return [a1 dateToRelativePositionDictionary];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_db(void *a1, const char *a2, ...)
{
  return [a1 db];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deletedLocations(void *a1, const char *a2, ...)
{
  return [a1 deletedLocations];
}

id objc_msgSend_deletionReason(void *a1, const char *a2, ...)
{
  return [a1 deletionReason];
}

id objc_msgSend_deliveredToDevices(void *a1, const char *a2, ...)
{
  return [a1 deliveredToDevices];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_devicePeerMetadata(void *a1, const char *a2, ...)
{
  return [a1 devicePeerMetadata];
}

id objc_msgSend_deviceToDeviceEncryptionAvailability(void *a1, const char *a2, ...)
{
  return [a1 deviceToDeviceEncryptionAvailability];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_discoveredDevices(void *a1, const char *a2, ...)
{
  return [a1 discoveredDevices];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_distributedContextManager(void *a1, const char *a2, ...)
{
  return [a1 distributedContextManager];
}

id objc_msgSend_distributedSiteIdentifier(void *a1, const char *a2, ...)
{
  return [a1 distributedSiteIdentifier];
}

id objc_msgSend_distributedSyncManagers(void *a1, const char *a2, ...)
{
  return [a1 distributedSyncManagers];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_encryptedValues(void *a1, const char *a2, ...)
{
  return [a1 encryptedValues];
}

id objc_msgSend_enforceMaxSessionLogPrunePolicy(void *a1, const char *a2, ...)
{
  return [a1 enforceMaxSessionLogPrunePolicy];
}

id objc_msgSend_errorFromDevice(void *a1, const char *a2, ...)
{
  return [a1 errorFromDevice];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return [a1 eventBody];
}

id objc_msgSend_eventBodyData(void *a1, const char *a2, ...)
{
  return [a1 eventBodyData];
}

id objc_msgSend_eventClass(void *a1, const char *a2, ...)
{
  return [a1 eventClass];
}

id objc_msgSend_eventData(void *a1, const char *a2, ...)
{
  return [a1 eventData];
}

id objc_msgSend_fetchAtomBatchesRequestHandler(void *a1, const char *a2, ...)
{
  return [a1 fetchAtomBatchesRequestHandler];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return [a1 firstIndex];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_gatherAllCKSyncRecordRecordsToBeDeleted(void *a1, const char *a2, ...)
{
  return [a1 gatherAllCKSyncRecordRecordsToBeDeleted];
}

id objc_msgSend_handleTransitionToNewMergeableValueRecordValueKey(void *a1, const char *a2, ...)
{
  return [a1 handleTransitionToNewMergeableValueRecordValueKey];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hasDateFormatter(void *a1, const char *a2, ...)
{
  return [a1 hasDateFormatter];
}

id objc_msgSend_hasOpenResultSets(void *a1, const char *a2, ...)
{
  return [a1 hasOpenResultSets];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 idsDeviceIdentifier];
}

id objc_msgSend_inFlightToDevices(void *a1, const char *a2, ...)
{
  return [a1 inFlightToDevices];
}

id objc_msgSend_inUse(void *a1, const char *a2, ...)
{
  return [a1 inUse];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalState(void *a1, const char *a2, ...)
{
  return [a1 internalState];
}

id objc_msgSend_interrupt(void *a1, const char *a2, ...)
{
  return [a1 interrupt];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isInTransaction(void *a1, const char *a2, ...)
{
  return [a1 isInTransaction];
}

id objc_msgSend_isOpen(void *a1, const char *a2, ...)
{
  return [a1 isOpen];
}

id objc_msgSend_isReciprocalRequest(void *a1, const char *a2, ...)
{
  return [a1 isReciprocalRequest];
}

id objc_msgSend_isSiriCloudSyncEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSiriCloudSyncEnabled];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_lastCloudKitSyncAttemptDate(void *a1, const char *a2, ...)
{
  return [a1 lastCloudKitSyncAttemptDate];
}

id objc_msgSend_lastCloudKitSyncDate(void *a1, const char *a2, ...)
{
  return [a1 lastCloudKitSyncDate];
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return [a1 lastError];
}

id objc_msgSend_lastErrorCode(void *a1, const char *a2, ...)
{
  return [a1 lastErrorCode];
}

id objc_msgSend_lastErrorMessage(void *a1, const char *a2, ...)
{
  return [a1 lastErrorMessage];
}

id objc_msgSend_lastExtendedErrorCode(void *a1, const char *a2, ...)
{
  return [a1 lastExtendedErrorCode];
}

id objc_msgSend_lastIndex(void *a1, const char *a2, ...)
{
  return [a1 lastIndex];
}

id objc_msgSend_lastInsertRowId(void *a1, const char *a2, ...)
{
  return [a1 lastInsertRowId];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastRapportSyncAttemptDate(void *a1, const char *a2, ...)
{
  return [a1 lastRapportSyncAttemptDate];
}

id objc_msgSend_lastRapportSyncDate(void *a1, const char *a2, ...)
{
  return [a1 lastRapportSyncDate];
}

id objc_msgSend_lastSyncDateFromAnyDevice(void *a1, const char *a2, ...)
{
  return [a1 lastSyncDateFromAnyDevice];
}

id objc_msgSend_legacyDescriptor(void *a1, const char *a2, ...)
{
  return [a1 legacyDescriptor];
}

id objc_msgSend_legacyNames(void *a1, const char *a2, ...)
{
  return [a1 legacyNames];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return [a1 localDevice];
}

id objc_msgSend_localDeviceIdentifierCreatingIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 localDeviceIdentifierCreatingIfNecessary];
}

id objc_msgSend_localMergeableValue(void *a1, const char *a2, ...)
{
  return [a1 localMergeableValue];
}

id objc_msgSend_localSiteIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localSiteIdentifier];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return [a1 localizedFailureReason];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationID(void *a1, const char *a2, ...)
{
  return [a1 locationID];
}

id objc_msgSend_locationRow(void *a1, const char *a2, ...)
{
  return [a1 locationRow];
}

id objc_msgSend_logsErrors(void *a1, const char *a2, ...)
{
  return [a1 logsErrors];
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

id objc_msgSend_markAllOperationsComplete(void *a1, const char *a2, ...)
{
  return [a1 markAllOperationsComplete];
}

id objc_msgSend_markOperationComplete(void *a1, const char *a2, ...)
{
  return [a1 markOperationComplete];
}

id objc_msgSend_markOperationStarted(void *a1, const char *a2, ...)
{
  return [a1 markOperationStarted];
}

id objc_msgSend_maxAge(void *a1, const char *a2, ...)
{
  return [a1 maxAge];
}

id objc_msgSend_maxBusyRetryTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 maxBusyRetryTimeInterval];
}

id objc_msgSend_mergeableRecordValueKey(void *a1, const char *a2, ...)
{
  return [a1 mergeableRecordValueKey];
}

id objc_msgSend_mergeableValueID(void *a1, const char *a2, ...)
{
  return [a1 mergeableValueID];
}

id objc_msgSend_messageID(void *a1, const char *a2, ...)
{
  return [a1 messageID];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_metricsCollector(void *a1, const char *a2, ...)
{
  return [a1 metricsCollector];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_modifier(void *a1, const char *a2, ...)
{
  return [a1 modifier];
}

id objc_msgSend_moreComing(void *a1, const char *a2, ...)
{
  return [a1 moreComing];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newDiscoveryClients(void *a1, const char *a2, ...)
{
  return [a1 newDiscoveryClients];
}

id objc_msgSend_next(void *a1, const char *a2, ...)
{
  return [a1 next];
}

id objc_msgSend_nextEvent(void *a1, const char *a2, ...)
{
  return [a1 nextEvent];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return [a1 objCType];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return [a1 offset];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return [a1 operatingSystemVersion];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_originatingSiteIdentifier(void *a1, const char *a2, ...)
{
  return [a1 originatingSiteIdentifier];
}

id objc_msgSend_osBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 osBuildVersion];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return [a1 peer];
}

id objc_msgSend_peerStatusTracker(void *a1, const char *a2, ...)
{
  return [a1 peerStatusTracker];
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return [a1 platform];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_popFirstObject(void *a1, const char *a2, ...)
{
  return [a1 popFirstObject];
}

id objc_msgSend_primaryDatabase(void *a1, const char *a2, ...)
{
  return [a1 primaryDatabase];
}

id objc_msgSend_primaryDatabasePath(void *a1, const char *a2, ...)
{
  return [a1 primaryDatabasePath];
}

id objc_msgSend_primaryKey(void *a1, const char *a2, ...)
{
  return [a1 primaryKey];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 privateCloudDatabase];
}

id objc_msgSend_proto(void *a1, const char *a2, ...)
{
  return [a1 proto];
}

id objc_msgSend_protocolVersion(void *a1, const char *a2, ...)
{
  return [a1 protocolVersion];
}

id objc_msgSend_pruningPolicy(void *a1, const char *a2, ...)
{
  return [a1 pruningPolicy];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_rangeClockVector(void *a1, const char *a2, ...)
{
  return [a1 rangeClockVector];
}

id objc_msgSend_rangeClockVectors(void *a1, const char *a2, ...)
{
  return [a1 rangeClockVectors];
}

id objc_msgSend_rapportIdentifier(void *a1, const char *a2, ...)
{
  return [a1 rapportIdentifier];
}

id objc_msgSend_rapportSyncEngine(void *a1, const char *a2, ...)
{
  return [a1 rapportSyncEngine];
}

id objc_msgSend_recordChangeTag(void *a1, const char *a2, ...)
{
  return [a1 recordChangeTag];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return [a1 recordID];
}

id objc_msgSend_recordIDsToDelete(void *a1, const char *a2, ...)
{
  return [a1 recordIDsToDelete];
}

id objc_msgSend_recordIDsToSave(void *a1, const char *a2, ...)
{
  return [a1 recordIDsToSave];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return [a1 recordName];
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return [a1 recordType];
}

id objc_msgSend_recoveryState(void *a1, const char *a2, ...)
{
  return [a1 recoveryState];
}

id objc_msgSend_reference(void *a1, const char *a2, ...)
{
  return [a1 reference];
}

id objc_msgSend_referenceLocation(void *a1, const char *a2, ...)
{
  return [a1 referenceLocation];
}

id objc_msgSend_references(void *a1, const char *a2, ...)
{
  return [a1 references];
}

id objc_msgSend_registerForSigterm(void *a1, const char *a2, ...)
{
  return [a1 registerForSigterm];
}

id objc_msgSend_registerRequests(void *a1, const char *a2, ...)
{
  return [a1 registerRequests];
}

id objc_msgSend_remoteDevices(void *a1, const char *a2, ...)
{
  return [a1 remoteDevices];
}

id objc_msgSend_remoteName(void *a1, const char *a2, ...)
{
  return [a1 remoteName];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_requestBlock(void *a1, const char *a2, ...)
{
  return [a1 requestBlock];
}

id objc_msgSend_requestQueue(void *a1, const char *a2, ...)
{
  return [a1 requestQueue];
}

id objc_msgSend_requestTimeoutDidFire(void *a1, const char *a2, ...)
{
  return [a1 requestTimeoutDidFire];
}

id objc_msgSend_requestTimeoutHandler(void *a1, const char *a2, ...)
{
  return [a1 requestTimeoutHandler];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetEagerExitTimer(void *a1, const char *a2, ...)
{
  return [a1 resetEagerExitTimer];
}

id objc_msgSend_resultDictionary(void *a1, const char *a2, ...)
{
  return [a1 resultDictionary];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rollback(void *a1, const char *a2, ...)
{
  return [a1 rollback];
}

id objc_msgSend_segmentName(void *a1, const char *a2, ...)
{
  return [a1 segmentName];
}

id objc_msgSend_segmentOffset(void *a1, const char *a2, ...)
{
  return [a1 segmentOffset];
}

id objc_msgSend_serialize(void *a1, const char *a2, ...)
{
  return [a1 serialize];
}

id objc_msgSend_serializeProto(void *a1, const char *a2, ...)
{
  return [a1 serializeProto];
}

id objc_msgSend_serviceTypes(void *a1, const char *a2, ...)
{
  return [a1 serviceTypes];
}

id objc_msgSend_sessionContext(void *a1, const char *a2, ...)
{
  return [a1 sessionContext];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsToFetchChanges(void *a1, const char *a2, ...)
{
  return [a1 setNeedsToFetchChanges];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return [a1 shortValue];
}

id objc_msgSend_shortenedRapportIdentifier(void *a1, const char *a2, ...)
{
  return [a1 shortenedRapportIdentifier];
}

id objc_msgSend_siteIdentifier(void *a1, const char *a2, ...)
{
  return [a1 siteIdentifier];
}

id objc_msgSend_siteIdentifierObject(void *a1, const char *a2, ...)
{
  return [a1 siteIdentifierObject];
}

id objc_msgSend_siteSuffix(void *a1, const char *a2, ...)
{
  return [a1 siteSuffix];
}

id objc_msgSend_sqlStatements(void *a1, const char *a2, ...)
{
  return [a1 sqlStatements];
}

id objc_msgSend_sqliteHandle(void *a1, const char *a2, ...)
{
  return [a1 sqliteHandle];
}

id objc_msgSend_sqlitePath(void *a1, const char *a2, ...)
{
  return [a1 sqlitePath];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startClient(void *a1, const char *a2, ...)
{
  return [a1 startClient];
}

id objc_msgSend_startRequestTimeout(void *a1, const char *a2, ...)
{
  return [a1 startRequestTimeout];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_statement(void *a1, const char *a2, ...)
{
  return [a1 statement];
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return [a1 statusFlags];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopRequestTimeout(void *a1, const char *a2, ...)
{
  return [a1 stopRequestTimeout];
}

id objc_msgSend_storeConfig(void *a1, const char *a2, ...)
{
  return [a1 storeConfig];
}

id objc_msgSend_streamCRDT(void *a1, const char *a2, ...)
{
  return [a1 streamCRDT];
}

id objc_msgSend_streamConfiguration(void *a1, const char *a2, ...)
{
  return [a1 streamConfiguration];
}

id objc_msgSend_streamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 streamIdentifier];
}

id objc_msgSend_streamName(void *a1, const char *a2, ...)
{
  return [a1 streamName];
}

id objc_msgSend_streamUUID(void *a1, const char *a2, ...)
{
  return [a1 streamUUID];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_syncDirectory(void *a1, const char *a2, ...)
{
  return [a1 syncDirectory];
}

id objc_msgSend_syncEngineForCurrentPersona(void *a1, const char *a2, ...)
{
  return [a1 syncEngineForCurrentPersona];
}

id objc_msgSend_syncIdentifier(void *a1, const char *a2, ...)
{
  return [a1 syncIdentifier];
}

id objc_msgSend_syncPolicy(void *a1, const char *a2, ...)
{
  return [a1 syncPolicy];
}

id objc_msgSend_syncReason(void *a1, const char *a2, ...)
{
  return [a1 syncReason];
}

id objc_msgSend_syncScheduler(void *a1, const char *a2, ...)
{
  return [a1 syncScheduler];
}

id objc_msgSend_syncSessionDidEnd(void *a1, const char *a2, ...)
{
  return [a1 syncSessionDidEnd];
}

id objc_msgSend_syncableStreamConfigurations(void *a1, const char *a2, ...)
{
  return [a1 syncableStreamConfigurations];
}

id objc_msgSend_teardown(void *a1, const char *a2, ...)
{
  return [a1 teardown];
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

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_timestampCount(void *a1, const char *a2, ...)
{
  return [a1 timestampCount];
}

id objc_msgSend_timestamps(void *a1, const char *a2, ...)
{
  return [a1 timestamps];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unordered(void *a1, const char *a2, ...)
{
  return [a1 unordered];
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

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_useCount(void *a1, const char *a2, ...)
{
  return [a1 useCount];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userVersion(void *a1, const char *a2, ...)
{
  return [a1 userVersion];
}

id objc_msgSend_validStreamNameMapping(void *a1, const char *a2, ...)
{
  return [a1 validStreamNameMapping];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueData(void *a1, const char *a2, ...)
{
  return [a1 valueData];
}

id objc_msgSend_valueVersion(void *a1, const char *a2, ...)
{
  return [a1 valueVersion];
}

id objc_msgSend_vectorClock(void *a1, const char *a2, ...)
{
  return [a1 vectorClock];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_walSizeInKilobytes(void *a1, const char *a2, ...)
{
  return [a1 walSizeInKilobytes];
}

id objc_msgSend_warnInUse(void *a1, const char *a2, ...)
{
  return [a1 warnInUse];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return [a1 zoneID];
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return [a1 zoneName];
}

id objc_msgSend_zoneUUID(void *a1, const char *a2, ...)
{
  return [a1 zoneUUID];
}