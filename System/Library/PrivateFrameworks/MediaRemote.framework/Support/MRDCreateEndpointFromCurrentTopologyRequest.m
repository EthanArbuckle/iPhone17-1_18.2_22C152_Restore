@interface MRDCreateEndpointFromCurrentTopologyRequest
+ (void)createEndpointWithCurrentTopologyWithTimeout:(double)a3 details:(id)a4 previewCallback:(id)a5 completion:(id)a6;
- (void)_createEndpointWithCurrentTopologyWithTimeout:(double)a3 details:(id)a4 previewCallback:(id)a5 completion:(id)a6;
- (void)searchEndpointsForMyGroupLeaderWithTimeout:(double)a3 details:(id)a4 completion:(id)a5;
@end

@implementation MRDCreateEndpointFromCurrentTopologyRequest

+ (void)createEndpointWithCurrentTopologyWithTimeout:(double)a3 details:(id)a4 previewCallback:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100035A00;
  v14[3] = &unk_100416E30;
  v15 = objc_alloc_init(MRDCreateEndpointFromCurrentTopologyRequest);
  id v16 = v9;
  id v12 = v9;
  v13 = v15;
  [(MRDCreateEndpointFromCurrentTopologyRequest *)v13 _createEndpointWithCurrentTopologyWithTimeout:v11 details:v10 previewCallback:v14 completion:a3];
}

- (void)_createEndpointWithCurrentTopologyWithTimeout:(double)a3 details:(id)a4 previewCallback:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [MRDCreateEndpointWithCurrentTopologyAnalytics alloc];
  v13 = [v9 requestID];
  v14 = [(MRDCreateEndpointWithCurrentTopologyAnalytics *)v12 initWithRequestID:v13];

  v15 = +[NSDate now];
  id v16 = objc_alloc((Class)NSMutableString);
  v17 = [v9 requestID];
  id v18 = [v16 initWithFormat:@"%@<%@>", @"createEndpointWithCurrentTopology", v17];

  v19 = _MRLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v92 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_1000361F8;
  v85[3] = &unk_100416E58;
  v86 = @"createEndpointWithCurrentTopology";
  id v20 = v9;
  id v87 = v20;
  id v55 = v15;
  id v88 = v55;
  id v56 = v11;
  id v90 = v56;
  v21 = v14;
  v89 = v21;
  v22 = objc_retainBlock(v85);
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_10003642C;
  v81[3] = &unk_100416E80;
  v82 = @"createEndpointWithCurrentTopology";
  id v23 = v20;
  id v83 = v23;
  id v54 = v10;
  id v84 = v54;
  v24 = objc_retainBlock(v81);
  id v25 = objc_alloc((Class)MRBlockGuard);
  v26 = [v23 requestReasonID];
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_100036590;
  v79[3] = &unk_100415FA8;
  v27 = v22;
  id v80 = v27;
  id v28 = [v25 initWithTimeout:v26 reason:v79 handler:a3];

  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_1000365A8;
  v76[3] = &unk_100416B18;
  id v53 = v28;
  id v77 = v53;
  v29 = v27;
  id v78 = v29;
  v30 = objc_retainBlock(v76);
  id v31 = objc_alloc((Class)MRBlockGuard);
  v32 = [v23 requestReasonID];
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472;
  v74[2] = sub_100036620;
  v74[3] = &unk_100415FA8;
  v33 = v24;
  id v75 = v33;
  id v34 = [v31 initWithTimeout:v32 reason:v74 handler:0.0];

  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100036638;
  v71[3] = &unk_100416EA8;
  id v35 = v34;
  id v72 = v35;
  v36 = v33;
  id v73 = v36;
  v37 = objc_retainBlock(v71);
  v38 = +[MRDMediaRemoteServer server];
  v39 = [v38 deviceInfo];

  -[MRDCreateEndpointWithCurrentTopologyAnalytics setAirplayActive:](v21, "setAirplayActive:", [v39 isAirPlayActive]);
  if ([v39 isAirPlayActive]
    && ([v39 groupContainsDiscoverableGroupLeader] & 1) == 0)
  {
    v52 = v29;
    [(MRDCreateEndpointWithCurrentTopologyAnalytics *)v21 setUndiscoverableGroupLeader:1];
    v42 = [v39 leaderDeviceInfo];
    v43 = [v42 groupedDevices];

    if (v43)
    {
      v44 = [v39 leaderDeviceInfo];
      v45 = [v44 groupedDevices];
      objc_msgSend(v45, "msv_map:", &stru_100416EE8);
      id v41 = (id)objc_claimAutoreleasedReturnValue();

      [(MRDCreateEndpointWithCurrentTopologyAnalytics *)v21 setContainsLeaderInfo:1];
      v46 = [(MRDCreateEndpointWithCurrentTopologyAnalytics *)v21 createOptimizedEndpoint];
      [v46 start];

      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_1000366B8;
      v68[3] = &unk_100416F10;
      v69 = v21;
      v70 = v30;
      +[MRDCreateOptimizedEndpointRequest createOptimizedEndpointWithOutputDeviceUIDs:v41 timeout:v23 details:v37 previewCallback:v68 completion:a3];

      v47 = v69;
    }
    else
    {
      v48 = [(MRDCreateEndpointWithCurrentTopologyAnalytics *)v21 discoverGroup];
      [v48 start];

      id v49 = objc_alloc((Class)MRAVReconnaissanceSession);
      v50 = [v39 groupUID];
      id v41 = [v49 initWithOutputDeviceUIDs:0 outputDeviceGroupID:v50 features:1 details:v23];

      [v41 setReturnPartialResults:1];
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_10003674C;
      v61[3] = &unk_100416FC0;
      v62 = v21;
      id v63 = v39;
      double v67 = a3;
      id v64 = v23;
      v65 = v37;
      v66 = v30;
      [v41 beginSearchWithTimeout:v61 completion:3.0];

      v47 = v62;
    }

    v29 = v52;
  }
  else
  {
    v40 = [(MRDCreateEndpointWithCurrentTopologyAnalytics *)v21 findMyGroupLeader];
    [v40 start];

    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000369C4;
    v57[3] = &unk_100417008;
    v58 = v21;
    v59 = v37;
    v60 = v30;
    [(MRDCreateEndpointFromCurrentTopologyRequest *)self searchEndpointsForMyGroupLeaderWithTimeout:v23 details:v57 completion:a3];

    id v41 = v58;
  }
}

- (void)searchEndpointsForMyGroupLeaderWithTimeout:(double)a3 details:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[MRDMediaRemoteServer server];
  id v11 = [v10 deviceInfo];

  id v12 = +[NSDate now];
  id v13 = objc_alloc((Class)NSMutableString);
  v14 = [v8 requestID];
  id v15 = [v13 initWithFormat:@"%@<%@>", @"searchEndpointsForMyGroupLeader", v14];

  id v16 = [v11 deviceUID];

  if (v16)
  {
    v17 = [v11 deviceUID];
    [v15 appendFormat:@" for %@", v17];
  }
  id v18 = _MRLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v37 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100036DEC;
  v30[3] = &unk_100417030;
  id v31 = @"searchEndpointsForMyGroupLeader";
  id v19 = v8;
  id v32 = v19;
  id v20 = v12;
  id v33 = v20;
  id v21 = v9;
  id v34 = v21;
  v22 = objc_retainBlock(v30);
  id v23 = [v11 deviceUID];

  if (v23)
  {
    id v24 = objc_alloc((Class)MRAVReconnaissanceSession);
    id v25 = [v11 deviceUID];
    id v35 = v25;
    v26 = +[NSArray arrayWithObjects:&v35 count:1];
    id v27 = [v24 initWithOutputDeviceUIDs:v26 outputDeviceGroupID:0 features:8 details:v19];

    [v27 setWaitForCompleteClusters:1];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100037018;
    v28[3] = &unk_100417058;
    v28[4] = self;
    v29 = v22;
    [v27 beginSearchWithTimeout:v28 endpointsCompletion:a3];
  }
  else
  {
    id v27 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    ((void (*)(void *, id, void))v22[2])(v22, v27, 0);
  }
}

@end