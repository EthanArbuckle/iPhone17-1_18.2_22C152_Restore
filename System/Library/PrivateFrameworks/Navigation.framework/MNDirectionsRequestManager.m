@interface MNDirectionsRequestManager
- (MNDirectionsRequestManager)init;
- (void)_logRoutes:(id)a3 error:(id)a4;
- (void)_requestDirectionsFromTraceWithPath:(id)a3 feedback:(id)a4 auditToken:(id)a5 finishedHandler:(id)a6;
- (void)_requestServerDirections:(id)a3 preferredRoute:(id)a4 withIdentifier:(id)a5 auditToken:(id)a6 finishedHandler:(id)a7;
- (void)cancelDirectionsRequestWithIdentifier:(id)a3;
- (void)requestDirections:(id)a3 withIdentifier:(id)a4 auditToken:(id)a5 finishedHandler:(id)a6;
@end

@implementation MNDirectionsRequestManager

- (MNDirectionsRequestManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)MNDirectionsRequestManager;
  v2 = [(MNDirectionsRequestManager *)&v10 init];
  if (v2)
  {
    v3 = (GEODirectionsService *)objc_alloc_init(MEMORY[0x1E4F64540]);
    directionsService = v2->_directionsService;
    v2->_directionsService = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v5;

    uint64_t v7 = geo_isolater_create();
    pendingRequestsIsolater = v2->_pendingRequestsIsolater;
    v2->_pendingRequestsIsolater = (geo_isolater *)v7;
  }
  return v2;
}

- (void)requestDirections:(id)a3 withIdentifier:(id)a4 auditToken:(id)a5 finishedHandler:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    v14 = MNGetMNDirectionsRequestLog();
    os_signpost_id_t v15 = os_signpost_id_generate(v14);
    v16 = v14;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B542B000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RequestDirections", "", buf, 2u);
    }

    v18 = [v10 tracePath];

    if (v18)
    {
      v19 = [v10 tracePath];
      v20 = [v10 directionsRequestFeedback];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __90__MNDirectionsRequestManager_requestDirections_withIdentifier_auditToken_finishedHandler___block_invoke;
      v29[3] = &unk_1E60F7EC8;
      v21 = &v30;
      v30 = v17;
      v31[1] = v15;
      v22 = (id *)v31;
      v31[0] = v13;
      v23 = v17;
      [(MNDirectionsRequestManager *)self _requestDirectionsFromTraceWithPath:v19 feedback:v20 auditToken:v12 finishedHandler:v29];
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __90__MNDirectionsRequestManager_requestDirections_withIdentifier_auditToken_finishedHandler___block_invoke_25;
      v26[3] = &unk_1E60F7EC8;
      v21 = &v27;
      v27 = v17;
      v28[1] = v15;
      v22 = (id *)v28;
      v28[0] = v13;
      v25 = v17;
      [(MNDirectionsRequestManager *)self _requestServerDirections:v10 preferredRoute:0 withIdentifier:v11 auditToken:v12 finishedHandler:v26];
    }

    v24 = *v21;
  }
  else
  {
    v17 = [NSString stringWithFormat:@"finishedHandler must be passed to requestDirections otherwise response will be unavailable."];
    v24 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v33 = "-[MNDirectionsRequestManager requestDirections:withIdentifier:auditToken:finishedHandler:]";
      __int16 v34 = 2080;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNDirectionsRequestManager.m";
      __int16 v36 = 1024;
      int v37 = 62;
      __int16 v38 = 2080;
      v39 = "NO";
      __int16 v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_1B542B000, v24, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
  }
}

void __90__MNDirectionsRequestManager_requestDirections_withIdentifier_auditToken_finishedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v5, OS_SIGNPOST_INTERVAL_END, v6, "RequestDirections", "", v8, 2u);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void __90__MNDirectionsRequestManager_requestDirections_withIdentifier_auditToken_finishedHandler___block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B542B000, v5, OS_SIGNPOST_INTERVAL_END, v6, "RequestDirections", "", v8, 2u);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)cancelDirectionsRequestWithIdentifier:(id)a3
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__8;
  v8 = __Block_byref_object_dispose__8;
  id v9 = 0;
  id v3 = a3;
  geo_isolate_sync();
  [(id)v5[5] cancel];

  _Block_object_dispose(&v4, 8);
}

uint64_t __68__MNDirectionsRequestManager_cancelDirectionsRequestWithIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[5];
  uint64_t v6 = *(void **)(a1[4] + 8);
  return [v6 removeObjectForKey:v5];
}

- (void)_requestServerDirections:(id)a3 preferredRoute:(id)a4 withIdentifier:(id)a5 auditToken:(id)a6 finishedHandler:(id)a7
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v51 = a5;
  id v50 = a6;
  v14 = (void (**)(id, void))a7;
  if (!v14)
  {
    v49 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v75 = 136315906;
      *(void *)&v75[4] = "-[MNDirectionsRequestManager _requestServerDirections:preferredRoute:withIdentifier:auditToke"
                           "n:finishedHandler:]";
      *(_WORD *)&v75[12] = 2080;
      *(void *)&v75[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNDirectionsRequestManager.m";
      *(_WORD *)&v75[22] = 1024;
      LODWORD(v76) = 103;
      WORD2(v76) = 2080;
      *(void *)((char *)&v76 + 6) = "finishedHandler != nil";
      _os_log_impl(&dword_1B542B000, v49, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", v75, 0x26u);
    }
  }
  *(void *)v75 = 0;
  *(void *)&v75[8] = v75;
  *(void *)&v75[16] = 0x3032000000;
  *(void *)&long long v76 = __Block_byref_object_copy__8;
  *((void *)&v76 + 1) = __Block_byref_object_dispose__8;
  v77 = objc_alloc_init(MNDirectionsResponseInfo);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  os_signpost_id_t v15 = [v12 waypoints];
  uint64_t v16 = [(MNRouteAttributes *)v15 countByEnumeratingWithState:&v62 objects:v74 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v63;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v63 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = [*(id *)(*((void *)&v62 + 1) + 8 * i) latLng];
        BOOL IsNilOrZero = _navigation_GEOLatLngIsNilOrZero(v19);

        if (IsNilOrZero)
        {
          v72[0] = @"MNDirectionsRequestDetails";
          v26 = v12;
          if (!v12)
          {
            v26 = [MEMORY[0x1E4F1CA98] null];
          }
          v72[1] = *MEMORY[0x1E4F28588];
          v73[0] = v26;
          v73[1] = @"Waypoint in request is nil or invalid";
          id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];
          if (!v12) {

          }
          v28 = objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:userInfo:", 3, v27);
          v29 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v67 = v28;
            _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_ERROR, "Error in fetching directions %@", buf, 0xCu);
          }

          [*(id *)(*(void *)&v75[8] + 40) setError:v28];
          v14[2](v14, *(void *)(*(void *)&v75[8] + 40));
          goto LABEL_36;
        }
      }
      uint64_t v16 = [(MNRouteAttributes *)v15 countByEnumeratingWithState:&v62 objects:v74 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  os_signpost_id_t v15 = [v12 routeAttributes];
  v21 = [v12 routeAttributes];
  uint64_t v22 = [v21 mainTransportType];

  if ((v22 - 1) >= 3)
  {
    if (v22)
    {
      v70 = @"MNDirectionsRequestDetails";
      id v71 = v12;
      id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      v28 = objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:userInfo:", 4, v27);
      [*(id *)(*(void *)&v75[8] + 40) setError:v28];
      v14[2](v14, *(void *)(*(void *)&v75[8] + 40));
      goto LABEL_36;
    }
    v30 = [MNRouteAttributes alloc];
    v31 = [v12 waypoints];
    v23 = [(MNRouteAttributes *)v30 initWithAttributes:v15 waypoints:v31];

    if (GEOConfigGetBOOL()) {
      [(MNRouteAttributes *)v23 addInitialPromptType:1];
    }
  }
  else
  {
    v23 = v15;
  }
  id v24 = objc_alloc_init(MEMORY[0x1E4F64548]);
  v25 = v24;
  if (v13)
  {
    [v24 setRequestType:14];
    [v25 setCurrentRoute:v13];
  }
  else
  {
    v32 = [v12 resumeRouteHandle];
    if (v32 && (char v33 = [v12 isResumingMultipointRoute], v32, (v33 & 1) != 0))
    {
      [v25 setRequestType:12];
      __int16 v34 = [v12 resumeRouteHandle];
      objc_msgSend(v25, "setHasVisitedFirstStop:", objc_msgSend(v34, "hasVisitedFirstStop"));
    }
    else
    {
      [v25 setRequestType:1];
    }
    v35 = [v12 waypoints];
    [v25 setWaypoints:v35];
  }
  __int16 v36 = [v12 resumeRouteHandle];
  [v25 setResumeRouteHandle:v36];

  [v25 setTransportType:v22];
  [v25 setRouteAttributes:v23];
  int v37 = [v12 traits];
  [v25 setTraits:v37];

  __int16 v38 = [v12 commonOptions];
  [v25 setCommonOptions:v38];

  objc_msgSend(v25, "setMaxRouteCount:", objc_msgSend(v12, "maxRouteCount"));
  v39 = [v12 currentUserLocation];
  [v25 setCurrentLocation:v39];

  __int16 v40 = [v12 currentMapRegion];
  [v25 setVisibleRegion:v40];

  v41 = [v12 directionsRequestFeedback];
  [v25 setFeedback:v41];

  [v25 setAuditToken:v50];
  GEOFindOrCreateLog();
  uint64_t v42 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    if (v22 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = off_1E60F7F60[(int)v22];
    }
    *(_DWORD *)buf = 138412547;
    id v67 = v51;
    __int16 v68 = 2113;
    v69 = v43;
    _os_log_impl(&dword_1B542B000, v42, OS_LOG_TYPE_INFO, "Requesting directions from server. identifier: %@ | transportType: %{private}@", buf, 0x16u);
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v45 = v44;
  directionsService = self->_directionsService;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __112__MNDirectionsRequestManager__requestServerDirections_preferredRoute_withIdentifier_auditToken_finishedHandler___block_invoke;
  v54[3] = &unk_1E60F7F18;
  id v47 = v51;
  id v55 = v47;
  v56 = self;
  id v57 = v12;
  uint64_t v61 = v45;
  id v27 = v25;
  id v58 = v27;
  v60 = v75;
  v59 = v14;
  v48 = [(GEODirectionsService *)directionsService requestDirections:v27 handler:v54];
  id v52 = v47;
  id v53 = v48;
  geo_isolate_sync();

  v28 = v55;
  os_signpost_id_t v15 = v23;
LABEL_36:

  _Block_object_dispose(v75, 8);
}

void __112__MNDirectionsRequestManager__requestServerDirections_preferredRoute_withIdentifier_auditToken_finishedHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = a6;
  os_signpost_id_t v15 = (void *)MEMORY[0x1E4F1C9C8];
  id v16 = a2;
  [v15 timeIntervalSinceReferenceDate];
  double v18 = v17;
  v19 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v53 = v20;
    _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_INFO, "Received directions response from server. identifier: %@", buf, 0xCu);
  }

  if (v13)
  {
    v21 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v13;
      _os_log_impl(&dword_1B542B000, v21, OS_LOG_TYPE_ERROR, "Received error from directions request: %@", buf, 0xCu);
    }
  }
  if (v14)
  {
    uint64_t v22 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v14;
      _os_log_impl(&dword_1B542B000, v22, OS_LOG_TYPE_ERROR, "Received directionsError from directions request: %@", buf, 0xCu);
    }
  }
  id v49 = *(id *)(a1 + 32);
  geo_isolate_sync();
  id v23 = objc_alloc(MEMORY[0x1E4F649D0]);
  id v24 = [*(id *)(a1 + 48) routeAttributes];
  v25 = (void *)[v23 initWithWaypoints:v16 routeAttributes:v24 directionsResponse:v12 directionsRequest:v11];

  v26 = [v25 allRouteInfos];
  [*(id *)(a1 + 40) _logRoutes:v26 error:v13];
  if (GEOConfigGetBOOL())
  {
    id v27 = objc_alloc_init(MNTraceRecordingData);
    v28 = [*(id *)(a1 + 48) waypoints];
    [(MNTraceRecordingData *)v27 setWaypoints:v28];

    [(MNTraceRecordingData *)v27 setInitialDirectionsRequest:v11];
    [(MNTraceRecordingData *)v27 setInitialDirectionsResponse:v12];
    [(MNTraceRecordingData *)v27 setInitialDirectionsRequestError:v13];
    [(MNTraceRecordingData *)v27 setInitialDirectionsRequestTimestamp:*(double *)(a1 + 80)];
    [(MNTraceRecordingData *)v27 setInitialDirectionsResponseTimestamp:v18];
    v29 = [MNLocation alloc];
    v30 = [*(id *)(a1 + 48) currentUserLocation];
    v31 = [(CLLocation *)v29 initWithGeoLocation:v30];

    [(MNTraceRecordingData *)v27 setInitialUserLocation:v31];
  }
  else
  {
    id v27 = 0;
  }
  uint64_t v32 = [v26 count];
  if (!v13 && !v32)
  {
    char v33 = [NSString stringWithFormat:@"Server response returned no response and no errors."];
    __int16 v34 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      id v53 = "-[MNDirectionsRequestManager _requestServerDirections:preferredRoute:withIdentifier:auditToken:finishedHandl"
            "er:]_block_invoke_2";
      __int16 v54 = 2080;
      id v55 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNDirectionsRequestManager.m";
      __int16 v56 = 1024;
      int v57 = 206;
      __int16 v58 = 2080;
      v59 = "NO";
      __int16 v60 = 2112;
      uint64_t v61 = v33;
      _os_log_impl(&dword_1B542B000, v34, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

    uint64_t v35 = *(void *)(a1 + 48);
    v50[0] = @"MNDirectionsRequestDetails";
    v50[1] = @"GEODirectionsResponse";
    v51[0] = v35;
    v51[1] = v12;
    __int16 v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
    objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:userInfo:", 5, v36);
    id v13 = (char *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t Integer = GEOConfigGetInteger();
  if (Integer)
  {
    uint64_t v38 = Integer;
    if ([*(id *)(a1 + 56) requestType] == 1)
    {
      id v47 = v14;
      id v48 = v11;
      v39 = [v26 firstObject];
      __int16 v40 = [v39 route];
      [v40 distance];
      uint64_t v42 = v41;

      v43 = [v26 firstObject];
      if ((unint64_t)[v26 count] <= 1)
      {
        [v12 addFakeTrafficIncidentAlert:v38 targetLegIndex:0 mainRouteInfo:v43 alternateRouteInfo:0 currentDistance:v42];
      }
      else
      {
        uint64_t v44 = [v26 objectAtIndexedSubscript:1];
        [v12 addFakeTrafficIncidentAlert:v38 targetLegIndex:0 mainRouteInfo:v43 alternateRouteInfo:v44 currentDistance:v42];
      }
      v14 = v47;
      id v11 = v48;
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setRouteInfos:v26];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setRequest:v11];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setResponse:v12];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setError:v13];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDirectionsError:v14];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setTraceRecordingData:v27];
  uint64_t v45 = (char *)v14;
  v46 = objc_alloc_init(MNNavigationTraceManager);
  [(MNNavigationTraceManager *)v46 saveRoutePlanningTrace:v27];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t __112__MNDirectionsRequestManager__requestServerDirections_preferredRoute_withIdentifier_auditToken_finishedHandler___block_invoke_41(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
}

uint64_t __112__MNDirectionsRequestManager__requestServerDirections_preferredRoute_withIdentifier_auditToken_finishedHandler___block_invoke_53(void *a1)
{
  return [*(id *)(a1[4] + 8) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)_requestDirectionsFromTraceWithPath:(id)a3 feedback:(id)a4 auditToken:(id)a5 finishedHandler:(id)a6
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, MNDirectionsResponseInfo *))a6;
  if (!v13)
  {
    id v50 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v67 = "-[MNDirectionsRequestManager _requestDirectionsFromTraceWithPath:feedback:auditToken:finishedHandler:]";
      __int16 v68 = 2080;
      v69 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNDirectionsRequestManager.m";
      __int16 v70 = 1024;
      int v71 = 244;
      __int16 v72 = 2080;
      v73 = "finishedHandler != nil";
      _os_log_impl(&dword_1B542B000, v50, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }
  }
  v14 = objc_alloc_init(MNTraceLoader);
  os_signpost_id_t v15 = objc_alloc_init(MNDirectionsResponseInfo);
  id v63 = 0;
  id v16 = [(MNTraceLoader *)v14 loadTraceWithPath:v10 outError:&v63];
  id v17 = v63;
  if (v17)
  {
    double v18 = v17;
    [(MNDirectionsResponseInfo *)v15 setError:v17];
    v13[2](v13, v15);
  }
  else
  {
    id v53 = self;
    __int16 v54 = v14;
    __int16 v56 = v16;
    id v57 = v11;
    id v55 = v10;
    v19 = [v16 directions];
    v20 = [v19 firstObject];

    v21 = [v20 request];
    uint64_t v22 = (void *)[v21 copy];

    id v23 = [v20 response];
    uint64_t v24 = [v22 routeAttributes];
    uint64_t Integer = GEOConfigGetInteger();
    v59 = v22;
    id v60 = v12;
    __int16 v58 = (void *)v24;
    if (Integer)
    {
      uint64_t v26 = Integer;
      id v51 = v23;
      id v27 = [MNDirectionsRequestDetails alloc];
      v28 = [v20 waypoints];
      v29 = (void *)MEMORY[0x1E4F649A0];
      v30 = [v22 routeAttributes];
      v31 = objc_msgSend(v29, "defaultRouteAttributesForTransportType:", objc_msgSend(v30, "mainTransportType"));
      uint64_t v32 = [(MNDirectionsRequestDetails *)v27 initWithWaypoints:v28 routeAttributes:v31];

      if ([v22 mainTransportTypeMaxRouteCount]) {
        uint64_t v33 = [v22 mainTransportTypeMaxRouteCount];
      }
      else {
        uint64_t v33 = 3;
      }
      id v12 = v60;
      v14 = v54;
      -[MNDirectionsRequestDetails setMaxRouteCount:](v32, "setMaxRouteCount:", v33, v51);
      double v41 = objc_opt_new();
      [(MNDirectionsRequestDetails *)v32 setDirectionsRequestFeedback:v41];

      uint64_t v42 = [(MNDirectionsRequestDetails *)v32 directionsRequestFeedback];
      [v42 setPurpose:1];

      id v10 = v55;
      if (v26 == 2)
      {
        id v43 = objc_alloc(MEMORY[0x1E4F649D0]);
        uint64_t v44 = [v20 waypoints];
        uint64_t v45 = (void *)[v43 initWithWaypoints:v44 routeAttributes:v58 directionsResponse:v52 directionsRequest:v59];

        v46 = [v45 allRouteInfos];
        unint64_t v47 = [v20 selectedRouteIndex];
        if (v47 >= [v46 count])
        {
          __int16 v36 = 0;
        }
        else
        {
          id v48 = objc_msgSend(v46, "objectAtIndexedSubscript:", objc_msgSend(v20, "selectedRouteIndex"));
          __int16 v36 = [v48 route];
        }
        id v12 = v60;
      }
      else
      {
        __int16 v36 = 0;
      }
      id v49 = [MEMORY[0x1E4F29128] UUID];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __102__MNDirectionsRequestManager__requestDirectionsFromTraceWithPath_feedback_auditToken_finishedHandler___block_invoke;
      v61[3] = &unk_1E60F7F40;
      uint64_t v62 = v13;
      [(MNDirectionsRequestManager *)v53 _requestServerDirections:v32 preferredRoute:v36 withIdentifier:v49 auditToken:v12 finishedHandler:v61];

      double v18 = 0;
      id v23 = v52;
    }
    else
    {
      id v34 = objc_alloc(MEMORY[0x1E4F649D0]);
      uint64_t v35 = [v20 waypoints];
      uint64_t v32 = (MNDirectionsRequestDetails *)[v34 initWithWaypoints:v35 routeAttributes:v24 directionsResponse:v23 directionsRequest:v22];

      __int16 v36 = [(MNDirectionsRequestDetails *)v32 allRouteInfos];
      [(MNDirectionsRequestManager *)v53 _logRoutes:v36 error:0];
      double v18 = 0;
      v14 = v54;
      id v10 = v55;
      if (![v36 count])
      {
        int v37 = [NSString stringWithFormat:@"Recorded trace response has no routes and no errors."];
        uint64_t v38 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          id v67 = "-[MNDirectionsRequestManager _requestDirectionsFromTraceWithPath:feedback:auditToken:finishedHandler:]";
          __int16 v68 = 2080;
          v69 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNDirectionsRequestManager.m";
          __int16 v70 = 1024;
          int v71 = 271;
          __int16 v72 = 2080;
          v73 = "NO";
          __int16 v74 = 2112;
          v75 = v37;
          _os_log_impl(&dword_1B542B000, v38, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
        }

        v64[0] = @"TracePath";
        v64[1] = @"GEODirectionsResponse";
        v65[0] = v55;
        v65[1] = v23;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];
        double v18 = objc_msgSend(MEMORY[0x1E4F28C58], "_navigation_errorWithCode:userInfo:", 5, v39);
      }
      [(MNDirectionsResponseInfo *)v15 setRouteInfos:v36];
      __int16 v40 = [v20 request];
      [(MNDirectionsResponseInfo *)v15 setRequest:v40];

      [(MNDirectionsResponseInfo *)v15 setResponse:v23];
      [(MNDirectionsResponseInfo *)v15 setError:v18];
      v13[2](v13, v15);
      id v12 = v60;
    }

    id v16 = v56;
    id v11 = v57;
  }
}

void __102__MNDirectionsRequestManager__requestDirectionsFromTraceWithPath_feedback_auditToken_finishedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTraceRecordingData:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_logRoutes:(id)a3 error:(id)a4
{
  *(void *)&v23[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    uint64_t v7 = [v5 firstObject];
    int BOOL = GEOConfigGetBOOL();
    id v9 = MNGetMNRouteLoggingLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v7 route];
      id v11 = v10;
      if (BOOL) {
        [v10 debugDescription];
      }
      else {
      id v12 = [v10 description];
      }
      *(_DWORD *)buf = 138412290;
      *(void *)id v23 = v12;
      _os_log_impl(&dword_1B542B000, v9, OS_LOG_TYPE_DEFAULT, "Route 0: %@\n", buf, 0xCu);
    }
    int v13 = GEOConfigGetBOOL();
    if ((unint64_t)[v5 count] >= 2)
    {
      v20 = v7;
      id v21 = v6;
      unint64_t v14 = 1;
      do
      {
        os_signpost_id_t v15 = objc_msgSend(v5, "objectAtIndexedSubscript:", v14, v20, v21);
        id v16 = MNGetMNRouteLoggingLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [v15 route];
          double v18 = v17;
          if (v13) {
            [v17 debugDescription];
          }
          else {
          v19 = [v17 description];
          }
          *(_DWORD *)buf = 67109378;
          v23[0] = v14;
          LOWORD(v23[1]) = 2112;
          *(void *)((char *)&v23[1] + 2) = v19;
          _os_log_impl(&dword_1B542B000, v16, OS_LOG_TYPE_DEFAULT, "Route %d: %@\n", buf, 0x12u);
        }
        ++v14;
      }
      while (v14 < [v5 count]);
      uint64_t v7 = v20;
      id v6 = v21;
    }
  }
  else
  {
    uint64_t v7 = MNGetMNRouteLoggingLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v23 = v6;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "Error loading routes: %@", buf, 0xCu);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsService, 0);
  objc_storeStrong((id *)&self->_pendingRequestsIsolater, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

@end