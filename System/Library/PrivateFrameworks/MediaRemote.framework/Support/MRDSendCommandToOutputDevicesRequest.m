@interface MRDSendCommandToOutputDevicesRequest
+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toEachEndpointContainingOutputDeviceUIDs:(id)a5 timeout:(double)a6 details:(id)a7 completion:(id)a8;
+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toNewEndpointContainingOutputDeviceUIDs:(id)a5 playerPath:(id)a6 timeout:(double)a7 details:(id)a8 completion:(id)a9;
- (BOOL)_doesRequestContainLocalDeviceUID:(id)a3;
- (BOOL)_isRequestForCompanionOrigin:(id)a3;
- (BOOL)_isRequestForCurrentCongifuration:(id)a3;
- (BOOL)_isRequestForLocalOrigin:(id)a3;
- (id)_resolveOutputDevices:(id)a3;
- (void)_sendCommand:(unsigned int)a3 withOptions:(id)a4 toEachEndpointContainingOutputDeviceUIDs:(id)a5 timeout:(double)a6 details:(id)a7 completion:(id)a8;
- (void)_sendCommand:(unsigned int)a3 withOptions:(id)a4 toNewEndpointContainingOutputDeviceUIDs:(id)a5 playerPath:(id)a6 timeout:(double)a7 details:(id)a8 completion:(id)a9;
@end

@implementation MRDSendCommandToOutputDevicesRequest

+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toNewEndpointContainingOutputDeviceUIDs:(id)a5 playerPath:(id)a6 timeout:(double)a7 details:(id)a8 completion:(id)a9
{
  uint64_t v14 = *(void *)&a3;
  id v15 = a9;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10016C3EC;
  v22[3] = &unk_10041F5A0;
  v23 = objc_alloc_init(MRDSendCommandToOutputDevicesRequest);
  id v24 = v15;
  id v20 = v15;
  v21 = v23;
  [(MRDSendCommandToOutputDevicesRequest *)v21 _sendCommand:v14 withOptions:v19 toNewEndpointContainingOutputDeviceUIDs:v18 playerPath:v17 timeout:v16 details:v22 completion:a7];
}

+ (void)sendCommand:(unsigned int)a3 withOptions:(id)a4 toEachEndpointContainingOutputDeviceUIDs:(id)a5 timeout:(double)a6 details:(id)a7 completion:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v13 = a8;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10016C520;
  v19[3] = &unk_10041EEE8;
  id v20 = objc_alloc_init(MRDSendCommandToOutputDevicesRequest);
  id v21 = v13;
  id v17 = v13;
  id v18 = v20;
  [(MRDSendCommandToOutputDevicesRequest *)v18 _sendCommand:v12 withOptions:v16 toEachEndpointContainingOutputDeviceUIDs:v15 timeout:v14 details:v19 completion:a6];
}

- (void)_sendCommand:(unsigned int)a3 withOptions:(id)a4 toNewEndpointContainingOutputDeviceUIDs:(id)a5 playerPath:(id)a6 timeout:(double)a7 details:(id)a8 completion:(id)a9
{
  uint64_t v14 = *(void *)&a3;
  id v72 = a4;
  id v16 = a5;
  id v70 = a6;
  id v17 = a8;
  id v77 = a9;
  id v18 = [MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics alloc];
  id v19 = +[MRDMediaRemoteServer server];
  id v20 = [v19 deviceInfo];
  id v21 = -[MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics initWithDetails:deviceInfo:numberOfRequestedOutputDeviceUIDs:timeout:](v18, "initWithDetails:deviceInfo:numberOfRequestedOutputDeviceUIDs:timeout:", v17, v20, [v16 count], a7);

  v22 = (void *)MRMediaRemoteCopyCommandDescription();
  [(MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)v21 setCommandString:v22];

  [(MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)v21 setCommand:v14];
  v23 = +[NSDate now];
  id v24 = objc_alloc((Class)NSMutableString);
  v25 = [v17 requestID];
  id v26 = [v24 initWithFormat:@"%@<%@>", @"sendCommandToNewEndpointContainingOutputDeviceUIDs", v25];

  if (v16) {
    [v26 appendFormat:@" for %@", v16];
  }
  v27 = [v17 reason];

  if (v27)
  {
    v28 = [v17 reason];
    [v26 appendFormat:@" because %@", v28];
  }
  v29 = _MRLogForCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v121 = v26;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472;
  v114[2] = sub_10016CF90;
  v114[3] = &unk_10041F5C8;
  v115 = @"sendCommandToNewEndpointContainingOutputDeviceUIDs";
  id v30 = v17;
  id v116 = v30;
  id v79 = v23;
  id v117 = v79;
  v31 = v21;
  v118 = v31;
  id v78 = v77;
  id v119 = v78;
  v32 = objc_retainBlock(v114);
  id v33 = [(MRDSendCommandToOutputDevicesRequest *)self _resolveOutputDevices:v16];
  v34 = v33;
  id v35 = v16;
  v76 = v16;
  if (v33 != v16)
  {
    unsigned __int8 v36 = [v33 isEqual:v16];

    if (v36) {
      goto LABEL_13;
    }
    id v35 = [objc_alloc((Class)NSString) initWithFormat:@"Resolving to outputDeviceUIDs: %@", v34];
    v37 = _MRLogForCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = [v30 name];
      [v30 requestID];
      v40 = v39 = self;
      *(_DWORD *)buf = 138543874;
      id v121 = v38;
      __int16 v122 = 2114;
      v123 = v40;
      __int16 v124 = 2112;
      id v125 = v35;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);

      self = v39;
    }
  }
LABEL_13:
  id v41 = objc_alloc((Class)MRBlockGuard);
  v42 = [v30 requestReasonID];
  qos_class_t v43 = qos_class_self();
  v44 = dispatch_get_global_queue(v43, 0);
  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472;
  v45 = self;
  v112[2] = sub_10016D414;
  v112[3] = &unk_100415FA8;
  v46 = v32;
  id v113 = v46;
  id v47 = [v41 initWithTimeout:v42 reason:v44 queue:v112 handler:a7];

  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472;
  v109[2] = sub_10016D498;
  v109[3] = &unk_10041F5A0;
  id v75 = v47;
  id v110 = v75;
  v68 = v46;
  id v111 = v68;
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472;
  v107[2] = sub_10016D510;
  v107[3] = &unk_100415FA8;
  v48 = objc_retainBlock(v109);
  id v108 = v48;
  v49 = objc_retainBlock(v107);
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_10016D594;
  v100[3] = &unk_10041F618;
  v50 = v31;
  v101 = v50;
  id v74 = v30;
  id v102 = v74;
  id v71 = v70;
  id v103 = v71;
  int v106 = v14;
  uint64_t v51 = v14;
  id v52 = v72;
  id v104 = v52;
  v73 = v49;
  id v105 = v73;
  v69 = objc_retainBlock(v100);
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_10016D930;
  v97[3] = &unk_10041F640;
  v97[4] = v45;
  id v53 = v34;
  id v98 = v53;
  v54 = v50;
  v99 = v54;
  v55 = objc_retainBlock(v97);
  v56 = ((void (*)(void))v55[2])();
  if (v56)
  {
    v57 = [(MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)v54 sendCommand];
    [v57 start];

    v58 = (MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)[objc_alloc((Class)MRNowPlayingRequest) initWithOrigin:v56];
    qos_class_t v59 = qos_class_self();
    v60 = dispatch_get_global_queue(v59, 0);
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472;
    v94[2] = sub_10016D9D4;
    v94[3] = &unk_100416848;
    v95 = v54;
    v96 = v48;
    [(MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)v58 sendCommand:v51 options:v52 queue:v60 completion:v94];

    v62 = v73;
    v61 = v74;
    v63 = v69;
  }
  else
  {
    id v67 = v52;
    v64 = [(MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)v54 createPartialEndpoint];
    [v64 start];

    if ([(MRDSendCommandToOutputDevicesRequest *)v45 _isRequestForCurrentCongifuration:v53])
    {
      [(MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)v54 setRequestForCurrentConfiguration:1];
      v65 = [(MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)v54 createEndpointWithCurrentTopology];
      [v65 start];

      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_10016DA8C;
      v90[3] = &unk_10041F690;
      v91 = v54;
      v63 = v69;
      v92 = v69;
      v93 = v48;
      v87[0] = _NSConcreteStackBlock;
      v87[1] = 3221225472;
      v87[2] = sub_10016DBE0;
      v87[3] = &unk_100416E30;
      v88 = v91;
      v62 = v73;
      v89 = v73;
      v61 = v74;
      +[MRDCreateEndpointFromCurrentTopologyRequest createEndpointWithCurrentTopologyWithTimeout:v74 details:v90 previewCallback:v87 completion:a7];

      v58 = v91;
    }
    else
    {
      [(MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)v54 setRequestContainsLocalDeviceUID:[(MRDSendCommandToOutputDevicesRequest *)v45 _doesRequestContainLocalDeviceUID:v53]];
      v66 = [(MRDSendCommandToEndpointWithOutputDevicesRequestAnalytics *)v54 createOptimizedEndpoint];
      [v66 start];

      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472;
      v83[2] = sub_10016DC74;
      v83[3] = &unk_10041F690;
      v84 = v54;
      v63 = v69;
      v85 = v69;
      v86 = v48;
      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472;
      v80[2] = sub_10016DDC8;
      v80[3] = &unk_100416F10;
      v81 = v84;
      v62 = v73;
      v82 = v73;
      v61 = v74;
      +[MRDCreateOptimizedEndpointRequest createOptimizedEndpointWithOutputDeviceUIDs:v53 timeout:v74 details:v83 previewCallback:v80 completion:a7];

      v58 = v84;
    }
    id v52 = v67;
  }
}

- (void)_sendCommand:(unsigned int)a3 withOptions:(id)a4 toEachEndpointContainingOutputDeviceUIDs:(id)a5 timeout:(double)a6 details:(id)a7 completion:(id)a8
{
  id v79 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = [MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics alloc];
  id v18 = +[MRDMediaRemoteServer server];
  id v19 = [v18 deviceInfo];
  id v20 = -[MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics initWithDetails:deviceInfo:numberOfRequestedOutputDeviceUIDs:timeout:](v17, "initWithDetails:deviceInfo:numberOfRequestedOutputDeviceUIDs:timeout:", v15, v19, [v14 count], a6);

  id v21 = (void *)MRMediaRemoteCopyCommandDescription();
  [(MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics *)v20 setCommandString:v21];

  unsigned int v75 = a3;
  [(MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics *)v20 setCommand:a3];
  v22 = +[NSDate now];
  id v23 = objc_alloc((Class)NSMutableString);
  id v24 = [v15 requestID];
  id v25 = [v23 initWithFormat:@"%@<%@>", @"sendCommandToEachEndpointContainingOutputDeviceUIDs", v24];

  if (v14) {
    [v25 appendFormat:@" for %@", v14];
  }
  id v26 = [v15 reason];

  if (v26)
  {
    v27 = [v15 reason];
    [v25 appendFormat:@" because %@", v27];
  }
  v28 = _MRLogForCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v113 = v25;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v106[0] = _NSConcreteStackBlock;
  v106[1] = 3221225472;
  v106[2] = sub_10016E734;
  v106[3] = &unk_10041F758;
  v107 = @"sendCommandToEachEndpointContainingOutputDeviceUIDs";
  id v29 = v15;
  id v108 = v29;
  id v77 = v22;
  id v109 = v77;
  id v30 = v20;
  id v110 = v30;
  id v76 = v16;
  id v111 = v76;
  v31 = objc_retainBlock(v106);
  id v32 = [(MRDSendCommandToOutputDevicesRequest *)self _resolveOutputDevices:v14];
  id v33 = v32;
  id v34 = v14;
  if (v32 != v14)
  {
    unsigned __int8 v35 = [v32 isEqual:v14];

    if (v35) {
      goto LABEL_13;
    }
    id v34 = [objc_alloc((Class)NSString) initWithFormat:@"Resolving to outputDeviceUIDs: %@", v33];
    unsigned __int8 v36 = _MRLogForCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      [v29 name];
      v38 = id v37 = v14;
      [v29 requestID];
      v40 = v39 = self;
      *(_DWORD *)buf = 138543874;
      id v113 = v38;
      __int16 v114 = 2114;
      v115 = v40;
      __int16 v116 = 2112;
      id v117 = v34;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);

      self = v39;
      id v14 = v37;
    }
  }
LABEL_13:
  id v78 = v14;
  id v41 = objc_alloc_init((Class)NSMutableArray);
  id v42 = objc_alloc((Class)MRBlockGuard);
  [v29 requestReasonID];
  v44 = qos_class_t v43 = self;
  qos_class_t v45 = qos_class_self();
  v46 = dispatch_get_global_queue(v45, 0);
  v103[0] = _NSConcreteStackBlock;
  v103[1] = 3221225472;
  v103[2] = sub_10016EB44;
  v103[3] = &unk_1004187A8;
  id v47 = v41;
  id v104 = v47;
  v48 = v31;
  id v105 = v48;
  id v49 = [v42 initWithTimeout:v44 reason:v46 queue:v103 handler:a6];

  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_10016EBE8;
  v100[3] = &unk_10041EEE8;
  id v73 = v49;
  id v101 = v73;
  id v74 = v48;
  id v102 = v74;
  v50 = objc_retainBlock(v100);
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_10016EC60;
  v93[3] = &unk_10041F7E8;
  uint64_t v51 = v30;
  v94 = v51;
  id v52 = v29;
  id v95 = v52;
  unsigned int v99 = v75;
  id v80 = v79;
  id v96 = v80;
  id v72 = v47;
  id v97 = v72;
  id v53 = v50;
  id v98 = v53;
  id v70 = objc_retainBlock(v93);
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_10016F2B0;
  v90[3] = &unk_10041F640;
  void v90[4] = v43;
  id v54 = v33;
  id v91 = v54;
  v55 = v51;
  v92 = v55;
  v56 = objc_retainBlock(v90);
  v57 = ((void (*)(void))v56[2])();
  id v71 = v52;
  if (v57)
  {
    [(MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics *)v55 setNumberOfEndpoints:1];
    v58 = [(MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics *)v55 sendCommands];
    [v58 start];

    id v59 = [objc_alloc((Class)MRNowPlayingRequest) initWithOrigin:v57];
    qos_class_t v60 = qos_class_self();
    v61 = dispatch_get_global_queue(v60, 0);
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_10016F370;
    v87[3] = &unk_100416848;
    v62 = (id *)&v88;
    v88 = v55;
    v63 = (id *)&v89;
    v89 = v53;
    [v59 sendCommand:v75 options:v80 queue:v61 completion:v87];
    v64 = v70;
  }
  else
  {
    id v59 = [objc_alloc((Class)MRAVReconnaissanceSession) initWithOutputDeviceUIDs:v54 outputDeviceGroupID:0 features:8 details:v52];
    [v59 setShouldWaitForUnanimousEndpoints:0];
    [v59 setReturnPartialResults:1];
    [(MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics *)v55 setRequestContainsLocalDeviceUID:[(MRDSendCommandToOutputDevicesRequest *)v43 _doesRequestContainLocalDeviceUID:v54]];
    [(MRDSendCommandToEndpointsWithOutputDevicesRequestAnalytics *)v55 discoverOutputDevices];
    id v65 = v54;
    v66 = v53;
    v68 = id v67 = v52;
    [v68 start];

    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_10016F450;
    v81[3] = &unk_10041F850;
    v62 = (id *)&v82;
    v82 = v55;
    v63 = &v83;
    id v83 = v78;
    CFStringRef v84 = @"sendCommandToEachEndpointContainingOutputDeviceUIDs";
    id v69 = v67;
    id v53 = v66;
    id v54 = v65;
    id v85 = v69;
    v64 = v70;
    v86 = v70;
    [v59 beginSearchWithTimeout:v81 endpointsCompletion:5.0];

    v61 = (void *)v84;
  }
}

- (id)_resolveOutputDevices:(id)a3
{
  id v3 = a3;
  v4 = +[MRDMediaRemoteServer server];
  v5 = [v4 deviceInfo];

  v6 = objc_msgSend(v3, "msv_map:", &stru_10041F870);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10016FA5C;
  v10[3] = &unk_10041F898;
  id v11 = v5;
  id v7 = v5;
  v8 = objc_msgSend(v6, "msv_map:", v10);

  return v8;
}

- (BOOL)_isRequestForCurrentCongifuration:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      int v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          v7 += objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "length", (void)v12);
        }
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
      BOOL v10 = v7 == 0;
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)_isRequestForLocalOrigin:(id)a3
{
  id v3 = a3;
  id v4 = +[MRDMediaRemoteServer server];
  id v5 = [v4 deviceInfo];

  id v6 = [v5 deviceUID];

  BOOL v7 = 0;
  if (!v6)
  {
    uint64_t v8 = objc_msgSend(v3, "msv_firstWhere:", &stru_10041F8B8);

    if (v8) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (BOOL)_isRequestForCompanionOrigin:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)MROrigin) initWithIdentifier:1129140302 type:1 displayName:&stru_10042ACB0];
  id v5 = +[MRDMediaRemoteServer server];
  id v6 = [v5 nowPlayingServer];
  BOOL v7 = [v6 originClientForOrigin:v4];
  uint64_t v8 = [v7 deviceInfo];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10016FE60;
  v12[3] = &unk_100417F00;
  id v13 = v8;
  id v9 = v8;
  BOOL v10 = objc_msgSend(v3, "msv_firstWhere:", v12);

  return v10 != 0;
}

- (BOOL)_doesRequestContainLocalDeviceUID:(id)a3
{
  id v3 = a3;
  id v4 = +[MRDMediaRemoteServer server];
  id v5 = [v4 deviceInfo];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10016FFB4;
  v9[3] = &unk_100417F00;
  id v10 = v5;
  id v6 = v5;
  BOOL v7 = objc_msgSend(v3, "msv_firstWhere:", v9);

  return v7 != 0;
}

@end