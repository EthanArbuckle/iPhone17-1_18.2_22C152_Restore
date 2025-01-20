@interface MRDLightweightReconnaissanceSession
+ (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
@end

@implementation MRDLightweightReconnaissanceSession

+ (void)searchEndpointsForOutputDeviceUID:(id)a3 timeout:(double)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (!v13)
  {
    id v13 = &_dispatch_main_q;
    id v15 = &_dispatch_main_q;
  }
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x3032000000;
  v118 = sub_100032200;
  v119 = sub_100032210;
  id v120 = 0;
  uint64_t v109 = 0;
  v110 = &v109;
  uint64_t v111 = 0x3032000000;
  v112 = sub_100032200;
  v113 = sub_100032210;
  id v114 = +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:8];
  v16 = +[NSDate date];
  v17 = [v12 requestID];
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3032000000;
  v106 = sub_100032200;
  v107 = sub_100032210;
  id v76 = v11;
  id v108 = v76;
  v18 = (__CFString *)[objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID", v17];
  v19 = v18;
  if (v104[5]) {
    [(__CFString *)v18 appendFormat:@" for %@", v104[5]];
  }
  v20 = [v12 reason];

  if (v20)
  {
    v21 = [v12 reason];
    [(__CFString *)v19 appendFormat:@" because %@", v21];
  }
  v22 = _MRLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v122 = v19;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_100032218;
  v93[3] = &unk_100416AF0;
  v99 = &v103;
  v94 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
  id v23 = v17;
  id v95 = v23;
  id v75 = v16;
  id v96 = v75;
  id v73 = v13;
  id v97 = v73;
  id v74 = v14;
  id v98 = v74;
  v100 = &v109;
  v101 = &v115;
  id v102 = a1;
  v24 = objc_retainBlock(v93);
  id v25 = objc_alloc((Class)MRBlockGuard);
  id v26 = [objc_alloc((Class)NSString) initWithFormat:@"%@<%@>", @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID", v23];
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_100032750;
  v91[3] = &unk_100415FA8;
  v27 = v24;
  id v92 = v27;
  id v28 = [v25 initWithTimeout:v26 reason:v91 handler:a4];

  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_100032770;
  v88[3] = &unk_100416B18;
  id v29 = v28;
  id v89 = v29;
  v30 = v27;
  id v90 = v30;
  v31 = objc_retainBlock(v88);
  v32 = +[MRDMediaRemoteServer server];
  v33 = [v32 deviceInfo];

  v34 = (void *)v104[5];
  v35 = +[MRAVOutputDevice localDeviceUID];
  if ([v34 compare:v35 options:1]) {
    goto LABEL_14;
  }
  v36 = [v33 deviceUID];
  BOOL v37 = v36 == 0;

  if (!v37)
  {
    id v38 = objc_alloc((Class)NSString);
    v39 = [v33 deviceUID];
    v35 = (__CFString *)[v38 initWithFormat:@"substituting deviceUID <%@> for outputDeviceUID...", v39];

    v40 = _MRLogForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      CFStringRef v122 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
      __int16 v123 = 2114;
      id v124 = v23;
      __int16 v125 = 2112;
      CFStringRef v126 = v35;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    uint64_t v41 = [v33 deviceUID];
    v42 = (void *)v104[5];
    v104[5] = v41;

LABEL_14:
  }
  if (!v104[5])
  {
    v43 = [v33 deviceUID];
    BOOL v44 = v43 == 0;

    if (!v44)
    {
      id v45 = objc_alloc((Class)NSString);
      v46 = [v33 deviceUID];
      v47 = (__CFString *)[v45 initWithFormat:@"substituting deviceUID <%@> for outputDeviceUID...", v46];

      v48 = _MRLogForCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        CFStringRef v122 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
        __int16 v123 = 2114;
        id v124 = v23;
        __int16 v125 = 2112;
        CFStringRef v126 = v47;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      uint64_t v49 = [v33 deviceUID];
      v50 = (void *)v104[5];
      v104[5] = v49;
    }
  }
  if (!v104[5])
  {
    id v51 = objc_alloc((Class)NSString);
    v52 = +[MRAVOutputDevice localDeviceUID];
    v53 = (__CFString *)[v51 initWithFormat:@"substituting deviceUID <%@> for outputDeviceUID...", v52];

    v54 = _MRLogForCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      CFStringRef v122 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
      __int16 v123 = 2114;
      id v124 = v23;
      __int16 v125 = 2112;
      CFStringRef v126 = v53;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    uint64_t v55 = +[MRAVOutputDevice localDeviceUID];
    v56 = (void *)v104[5];
    v104[5] = v55;
  }
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_1000327E8;
  v84[3] = &unk_100416B40;
  v85 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
  id v57 = v23;
  id v86 = v57;
  id v58 = v33;
  id v87 = v58;
  v59 = objc_retainBlock(v84);
  if (!((unsigned int (*)(void))v59[2])()) {
    goto LABEL_40;
  }
  id v60 = +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:0];
  v61 = (void *)v104[5];
  v62 = +[MRAVOutputDevice localDeviceUID];
  LODWORD(v61) = [v61 compare:v62 options:1] == 0;

  if (!v61)
  {
    v63 = [v58 deviceUID];
    unsigned int v64 = [v63 isEqualToString:v104[5]];

    if (v64)
    {
      v65 = _MRLogForCategory();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        CFStringRef v122 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
        __int16 v123 = 2114;
        id v124 = v57;
        __int16 v125 = 2112;
        CFStringRef v126 = @"searching for localDeviceUID, using localEndpoint...";
LABEL_37:
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        goto LABEL_38;
      }
      goto LABEL_38;
    }
    v66 = [v58 identifier];
    unsigned int v67 = [v66 isEqualToString:v104[5]];

    if (v67)
    {
      v65 = _MRLogForCategory();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        CFStringRef v122 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
        __int16 v123 = 2114;
        id v124 = v57;
        __int16 v125 = 2112;
        CFStringRef v126 = @"searching for localIdentifier, using localEndpoint...";
        goto LABEL_37;
      }
      goto LABEL_38;
    }
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_1000329F0;
    v83[3] = &unk_100416B68;
    v83[4] = &v103;
    v68 = [v60 outputDevicesMatchingPredicate:v83];
    BOOL v69 = [v68 count] == 0;

    if (!v69)
    {
      v65 = _MRLogForCategory();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        CFStringRef v122 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
        __int16 v123 = 2114;
        id v124 = v57;
        __int16 v125 = 2112;
        CFStringRef v126 = @"found device in localEndpoint, using localEndpoint...";
        goto LABEL_37;
      }
      goto LABEL_38;
    }

LABEL_40:
    id v60 = a1;
    objc_sync_enter(v60);
    [(id)v110[5] setDiscoveryMode:3];
    v70 = (void *)v110[5];
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_100032A04;
    v78[3] = &unk_100416B90;
    v82 = &v103;
    v79 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
    id v80 = v57;
    v81 = v31;
    uint64_t v71 = [v70 addEndpointsChangedCallback:v78];
    v72 = (void *)v116[5];
    v116[5] = v71;

    objc_sync_exit(v60);
    goto LABEL_41;
  }
  v65 = _MRLogForCategory();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    CFStringRef v122 = @"MRDLightweightReconnaissanceSession.searchEndpointsForOutputDeviceUID";
    __int16 v123 = 2114;
    id v124 = v57;
    __int16 v125 = 2112;
    CFStringRef v126 = @"searching for local, using localEndpoint...";
    goto LABEL_37;
  }
LABEL_38:

  ((void (*)(void *, id, void))v31[2])(v31, v60, 0);
LABEL_41:

  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v109, 8);

  _Block_object_dispose(&v115, 8);
}

@end