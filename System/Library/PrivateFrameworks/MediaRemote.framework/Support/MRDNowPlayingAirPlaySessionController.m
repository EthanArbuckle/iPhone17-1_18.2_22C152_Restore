@interface MRDNowPlayingAirPlaySessionController
- (BOOL)isStartingNowPlayingSession;
- (void)_findEndpointContainingGroupID:(id)a3 andDeviceID:(id)a4 requestID:(id)a5 completion:(id)a6;
- (void)resumeNowPlayingSesion;
- (void)setStartingNowPlayingSession:(BOOL)a3;
- (void)startNowPlayingSessionWithCompletion:(id)a3;
- (void)stopNowPlayingSesion;
@end

@implementation MRDNowPlayingAirPlaySessionController

- (void)startNowPlayingSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[NSUUID UUID];
  v6 = [v5 UUIDString];

  v7 = +[NSDate now];
  v8 = +[MRDMediaRemoteServer server];
  v9 = [v8 nowPlayingServer];
  v10 = [v9 localOriginClient];
  v11 = [v10 deviceInfoDataSource];
  v12 = [v11 deviceInfo];

  v13 = [v12 deviceUID];
  v14 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"startNowPlayingSession", v6];
  v15 = v14;
  if (v13) {
    [(__CFString *)v14 appendFormat:@" for %@", v13];
  }
  v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v127 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  [(MRDNowPlayingAirPlaySessionController *)self setStartingNowPlayingSession:1];
  v17 = [MRDNowPlayingAirPlaySessionEvents alloc];
  id v18 = [v12 clusterType];
  v90 = v12;
  v19 = [v12 modelID];
  v20 = [(MRDNowPlayingAirPlaySessionEvents *)v17 initWithClusterType:v18 modelID:v19];

  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472;
  v118[2] = sub_10008A458;
  v118[3] = &unk_100419690;
  v21 = v20;
  v119 = v21;
  v120 = @"startNowPlayingSession";
  id v22 = v6;
  id v121 = v22;
  id v23 = v13;
  id v122 = v23;
  id v24 = v7;
  id v123 = v24;
  id v25 = v4;
  v124 = self;
  id v125 = v25;
  v26 = objc_retainBlock(v118);
  id v27 = objc_alloc((Class)MRBlockGuard);
  id v28 = [objc_alloc((Class)NSString) initWithFormat:@"%@<%@>", @"startNowPlayingSession", v22];
  v116[0] = _NSConcreteStackBlock;
  v116[1] = 3221225472;
  v116[2] = sub_10008A98C;
  v116[3] = &unk_100415FA8;
  v29 = v26;
  id v117 = v29;
  id v30 = [v27 initWithTimeout:v28 reason:v116 handler:15.0];

  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472;
  v113[2] = sub_10008A9A4;
  v113[3] = &unk_1004196B8;
  id v89 = v30;
  id v114 = v89;
  v31 = v29;
  id v115 = v31;
  v32 = objc_retainBlock(v113);
  v33 = +[MRAVClusterController sharedController];
  LODWORD(v30) = [v33 needsCommandRedirection];

  if (!v30)
  {
    v86 = v31;
    id v87 = v24;
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472;
    v107[2] = sub_10008AA1C;
    v107[3] = &unk_1004196E0;
    v38 = v21;
    v108 = v38;
    v85 = v32;
    v39 = v22;
    v40 = v32;
    id v112 = v40;
    v109 = self;
    id v41 = v23;
    id v110 = v41;
    v84 = v39;
    id v42 = v39;
    id v111 = v42;
    v43 = objc_retainBlock(v107);
    v44 = [(MRDNowPlayingAirPlaySessionEvents *)v38 sourceOutputContext];
    [v44 start];

    v45 = +[MRDAVOutputContextManager sharedManager];
    v46 = [v45 outputContextForOutputDeviceUID:v41];

    v88 = v46;
    if (!v46)
    {
      id v71 = [objc_alloc((Class)NSError) initWithMRError:32 description:@"Failed to query output context for local device"];
      v72 = [(MRDNowPlayingAirPlaySessionEvents *)v38 sourceOutputContext];
      [v72 endWithError:v71];

      ((void (*)(void *, void, id))v40[2])(v40, 0, v71);
      v31 = v86;
      id v24 = v87;
      v32 = v85;
LABEL_19:

      v37 = v108;
      id v22 = v84;
      goto LABEL_20;
    }
    v79 = v43;
    id v80 = v23;
    id v81 = v25;
    v82 = v21;
    v47 = [(MRDNowPlayingAirPlaySessionEvents *)v38 sourceOutputContext];
    [v47 end];

    v48 = _MRLogForCategory();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      CFStringRef v127 = @"startNowPlayingSession";
      __int16 v128 = 2114;
      id v129 = v42;
      __int16 v130 = 2112;
      CFStringRef v131 = v46;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    v49 = [(__CFString *)v46 outputDevices];
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_10008AD8C;
    v105[3] = &unk_100417940;
    id v50 = v41;
    id v106 = v50;
    v51 = objc_msgSend(v49, "msv_firstWhere:", v105);

    id v78 = objc_alloc_init((Class)NSMutableArray);
    id v52 = [objc_alloc((Class)NSString) initWithFormat:@"%@<%@>", @"startNowPlayingSession", v42];
    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472;
    v100[2] = sub_10008AD98;
    v100[3] = &unk_100419730;
    id v53 = v51;
    id v101 = v53;
    v54 = v38;
    v102 = v54;
    v55 = v46;
    v103 = v55;
    id v56 = v52;
    id v104 = v56;
    v75 = objc_retainBlock(v100);
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_10008AF98;
    v95[3] = &unk_100419730;
    id v77 = v53;
    id v96 = v77;
    id v97 = v50;
    v57 = v54;
    v98 = v57;
    id v76 = v56;
    id v99 = v76;
    v83 = objc_retainBlock(v95);
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_10008B1FC;
    v93[3] = &unk_100419758;
    v94 = v57;
    v58 = objc_retainBlock(v93);
    v59 = +[MRDMediaRemoteServer server];
    v60 = [v59 nowPlayingServer];
    v61 = [v60 localOriginClient];
    v62 = [v61 deviceInfoDataSource];
    v63 = [v62 deviceInfo];
    unsigned int v64 = ([v63 clusterType] - 1) & 0xFFFFFFFD;

    v65 = [(__CFString *)v55 outputDevices];
    id v66 = [v65 count];

    v32 = v85;
    if (v64)
    {
      id v25 = v81;
      v31 = v86;
      id v24 = v87;
      v67 = v78;
      v43 = v79;
      v68 = v75;
      if ((unint64_t)v66 >= 2)
      {
        id v69 = [v75 copy];
        [v78 addObject:v69];

        v70 = v83;
LABEL_17:
        id v73 = [v70 copy];
        [v67 addObject:v73];
      }
    }
    else
    {
      v68 = v75;
      v70 = v75;
      id v25 = v81;
      v31 = v86;
      id v24 = v87;
      v67 = v78;
      v43 = v79;
      if (v66) {
        goto LABEL_17;
      }
    }
    id v74 = [v58 copy];
    [v67 addObject:v74];

    v91 = v43;
    v92 = v40;
    MRPerformAsyncOperationsUntilError();

    id v71 = v106;
    v21 = v82;
    id v23 = v80;
    goto LABEL_19;
  }
  v34 = _MRLogForCategory();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    CFStringRef v127 = @"startNowPlayingSession";
    __int16 v128 = 2114;
    id v129 = v22;
    __int16 v130 = 2112;
    CFStringRef v131 = @"Returning local origin because device requires command redirection";
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  id v35 = objc_alloc((Class)MRPlayerPath);
  v36 = +[MROrigin localOrigin];
  v37 = (MRDNowPlayingAirPlaySessionEvents *)[v35 initWithOrigin:v36 client:0 player:0];

  ((void (*)(void *, MRDNowPlayingAirPlaySessionEvents *, void))v32[2])(v32, v37, 0);
LABEL_20:
}

- (void)stopNowPlayingSesion
{
  v3 = +[MRDMediaRemoteServer server];
  id v4 = [v3 nowPlayingServer];
  v5 = [v4 localOriginClient];
  v6 = [v5 deviceInfoDataSource];
  v7 = [v6 deviceInfo];
  v8 = [v7 deviceUID];

  v9 = +[NSDate date];
  v10 = +[NSUUID UUID];
  v11 = [v10 UUIDString];

  v12 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"stopNowPlayingSession", v11];
  v13 = v12;
  if (v8) {
    [(__CFString *)v12 appendFormat:@" for %@", v8];
  }
  v14 = _MRLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v15 = _MRLogForCategory();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v16)
    {
      v17 = +[NSDate date];
      [v17 timeIntervalSinceDate:v9];
      *(_DWORD *)buf = 138544130;
      CFStringRef v25 = @"stopNowPlayingSession";
      __int16 v26 = 2114;
      id v27 = v11;
      __int16 v28 = 2114;
      v29 = v8;
      __int16 v30 = 2048;
      uint64_t v31 = v18;
      v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v20 = v15;
      uint32_t v21 = 42;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    }
  }
  else if (v16)
  {
    v17 = +[NSDate date];
    [v17 timeIntervalSinceDate:v9];
    *(_DWORD *)buf = 138543874;
    CFStringRef v25 = @"stopNowPlayingSession";
    __int16 v26 = 2114;
    id v27 = v11;
    __int16 v28 = 2048;
    v29 = v22;
    v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v20 = v15;
    uint32_t v21 = 32;
    goto LABEL_10;
  }

  id v23 = +[NSNotificationCenter defaultCenter];
  [v23 postNotificationName:@"MRDNowPlayingAirPlaySessionStopped" object:self];
}

- (void)resumeNowPlayingSesion
{
  v2 = +[MRDMediaRemoteServer server];
  v3 = [v2 nowPlayingServer];
  id v4 = [v3 localOriginClient];
  v5 = [v4 deviceInfoDataSource];
  v6 = [v5 deviceInfo];
  v7 = [v6 deviceUID];

  v8 = +[NSDate date];
  v9 = +[NSUUID UUID];
  v10 = [v9 UUIDString];

  v11 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"resumeNowPlayingSession", v10];
  v12 = v11;
  if (v7) {
    [(__CFString *)v11 appendFormat:@" for %@", v7];
  }
  v13 = _MRLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v14 = _MRLogForCategory();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v15)
    {
      BOOL v16 = +[NSDate date];
      [v16 timeIntervalSinceDate:v8];
      *(_DWORD *)buf = 138544130;
      CFStringRef v23 = @"resumeNowPlayingSession";
      __int16 v24 = 2114;
      CFStringRef v25 = v10;
      __int16 v26 = 2114;
      id v27 = v7;
      __int16 v28 = 2048;
      uint64_t v29 = v17;
      uint64_t v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v19 = v14;
      uint32_t v20 = 42;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
  }
  else if (v15)
  {
    BOOL v16 = +[NSDate date];
    [v16 timeIntervalSinceDate:v8];
    *(_DWORD *)buf = 138543874;
    CFStringRef v23 = @"resumeNowPlayingSession";
    __int16 v24 = 2114;
    CFStringRef v25 = v10;
    __int16 v26 = 2048;
    id v27 = v21;
    uint64_t v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v19 = v14;
    uint32_t v20 = 32;
    goto LABEL_10;
  }
}

- (void)_findEndpointContainingGroupID:(id)a3 andDeviceID:(id)a4 requestID:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = +[NSDate now];
  id v14 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"startNowPlayingSession.findEndpointContainingGroupID", v11];
  BOOL v15 = v14;
  if (v9) {
    [v14 appendFormat:@" for %@", v9];
  }
  BOOL v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v48 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10008BC78;
  v41[3] = &unk_100417388;
  id v17 = v9;
  id v42 = v17;
  v43 = @"startNowPlayingSession.findEndpointContainingGroupID";
  id v18 = v11;
  id v44 = v18;
  id v45 = v13;
  id v46 = v12;
  id v31 = v12;
  id v19 = v13;
  uint32_t v20 = objc_retainBlock(v41);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10008BFF4;
  v36[3] = &unk_1004197C8;
  id v37 = v10;
  v38 = @"startNowPlayingSession.findEndpointContainingGroupID";
  id v21 = v18;
  id v39 = v21;
  id v40 = v17;
  id v22 = v17;
  id v23 = v10;
  __int16 v24 = objc_retainBlock(v36);
  id v25 = objc_alloc_init((Class)MRAVLightweightReconnaissanceSession);
  id v26 = [objc_alloc((Class)NSString) initWithFormat:@"%@<%@> looking for localDevice with groupID=%@", @"startNowPlayingSession.findEndpointContainingGroupID", v21, v22];
  qos_class_t v27 = qos_class_self();
  __int16 v28 = dispatch_get_global_queue(v27, 0);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10008C31C;
  v32[3] = &unk_1004197F0;
  v33 = @"startNowPlayingSession.findEndpointContainingGroupID";
  id v34 = v21;
  id v35 = v20;
  uint64_t v29 = v20;
  id v30 = v21;
  [v25 searchEndpointsWithPredicate:v24 timeout:v26 reason:v28 queue:v32 completion:7.0];
}

- (BOOL)isStartingNowPlayingSession
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL startingNowPlayingSession = v2->_startingNowPlayingSession;
  objc_sync_exit(v2);

  return startingNowPlayingSession;
}

- (void)setStartingNowPlayingSession:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v4->_BOOL startingNowPlayingSession = v3;
  objc_sync_exit(v4);

  v5 = +[NSNotificationCenter defaultCenter];
  id v7 = v5;
  if (v3) {
    CFStringRef v6 = @"MRDNowPlayingAirplaySessionStarting";
  }
  else {
    CFStringRef v6 = @"MRDNowPlayingAirplaySessionStarted";
  }
  [v5 postNotificationName:v6 object:v4];
}

@end