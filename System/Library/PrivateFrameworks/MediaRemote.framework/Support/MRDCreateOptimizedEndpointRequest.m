@interface MRDCreateOptimizedEndpointRequest
+ (void)createOptimizedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 previewCallback:(id)a6 completion:(id)a7;
- (void)_createOptimizedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 previewCallback:(id)a6 completion:(id)a7;
- (void)searchEndpointsForLocalDeviceWithTimeout:(double)a3 details:(id)a4 completion:(id)a5;
@end

@implementation MRDCreateOptimizedEndpointRequest

+ (void)createOptimizedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 previewCallback:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10006431C;
  v17[3] = &unk_100416F10;
  v18 = objc_alloc_init(MRDCreateOptimizedEndpointRequest);
  id v19 = v11;
  id v15 = v11;
  v16 = v18;
  [(MRDCreateOptimizedEndpointRequest *)v16 _createOptimizedEndpointWithOutputDeviceUIDs:v14 timeout:v13 details:v12 previewCallback:v17 completion:a4];
}

- (void)_createOptimizedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 previewCallback:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [MRDCreateOptimizedEndpointAnalytics alloc];
  v16 = [v12 requestID];
  v17 = [(MRDCreateOptimizedEndpointAnalytics *)v15 initWithRequestID:v16];

  v18 = +[MRDMediaRemoteServer server];
  id v19 = [v18 deviceInfo];

  v20 = +[NSDate now];
  id v21 = objc_alloc((Class)NSMutableString);
  v22 = [v12 requestID];
  id v23 = [v21 initWithFormat:@"%@<%@>", @"createOptimizedEndpointWithOutputDeviceUIDs", v22];

  v24 = _MRLogForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v88 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_100064A14;
  v85[3] = &unk_1004182F8;
  id v25 = v11;
  id v86 = v25;
  v26 = objc_retainBlock(v85);
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_100064B54;
  v83[3] = &unk_1004182F8;
  id v27 = v25;
  id v84 = v27;
  v51 = objc_retainBlock(v83);
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_100064D30;
  v80[3] = &unk_100416910;
  id v28 = v27;
  id v81 = v28;
  id v29 = v19;
  id v82 = v29;
  v30 = objc_retainBlock(v80);
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100064E4C;
  v71[3] = &unk_100418398;
  v72 = @"createOptimizedEndpointWithOutputDeviceUIDs";
  id v31 = v12;
  id v73 = v31;
  id v50 = v20;
  id v74 = v50;
  v32 = v17;
  v75 = v32;
  id v49 = v14;
  id v77 = v49;
  v47 = v26;
  id v78 = v47;
  id v33 = v28;
  id v76 = v33;
  id v48 = v13;
  id v79 = v48;
  v34 = objc_retainBlock(v71);
  id v35 = objc_alloc((Class)MRBlockGuard);
  v36 = [v31 requestReasonID];
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_10006577C;
  v69[3] = &unk_100415FA8;
  v37 = v34;
  id v70 = v37;
  id v38 = [v35 initWithTimeout:v36 reason:v69 handler:a4];

  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_100065794;
  v66[3] = &unk_100416B18;
  id v39 = v38;
  id v67 = v39;
  v40 = v37;
  id v68 = v40;
  v41 = objc_retainBlock(v66);
  if (((unsigned int (*)(void *))v30[2])(v30))
  {
    [(MRDCreateOptimizedEndpointAnalytics *)v32 setRequestContainsLocal:1];
    v42 = [(MRDCreateOptimizedEndpointAnalytics *)v32 searchEndpointsForLocalDevice];
    [v42 start];

    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_10006580C;
    v58[3] = &unk_100418430;
    v59 = v32;
    v63 = v51;
    v60 = @"createOptimizedEndpointWithOutputDeviceUIDs";
    id v61 = v31;
    double v65 = a4;
    id v62 = v29;
    id v64 = v41;
    v43 = v41;
    [(MRDCreateOptimizedEndpointRequest *)self searchEndpointsForLocalDeviceWithTimeout:v61 details:v58 completion:a4];

    v44 = v59;
  }
  else
  {
    v43 = [objc_alloc((Class)MRAVReconnaissanceSession) initWithOutputDeviceUIDs:v33 outputDeviceGroupID:0 features:8 details:v31];
    [v43 setShouldWaitForUnanimousEndpoints:0];
    [v43 setReturnPartialResults:1];
    v45 = [(MRDCreateOptimizedEndpointAnalytics *)v32 discoverOutputDevices];
    [v45 start];

    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100065E68;
    v52[3] = &unk_100418458;
    v53 = v32;
    id v54 = v33;
    double v57 = a4;
    id v55 = v31;
    id v56 = v41;
    v44 = v41;
    [v43 beginSearchWithTimeout:v52 endpointsCompletion:a4];
  }
}

- (void)searchEndpointsForLocalDeviceWithTimeout:(double)a3 details:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = +[MRDMediaRemoteServer server];
  v10 = [v9 deviceInfo];

  id v11 = +[NSDate now];
  id v12 = objc_alloc((Class)NSMutableString);
  id v13 = [v7 requestID];
  id v14 = [v12 initWithFormat:@"%@<%@>", @"searchEndpointsForLocalDevice", v13];

  id v15 = [v10 deviceUID];

  if (v15)
  {
    v16 = [v10 deviceUID];
    [v14 appendFormat:@" for %@", v16];
  }
  v17 = _MRLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100066398;
  v29[3] = &unk_100417030;
  v30 = @"searchEndpointsForLocalDevice";
  id v18 = v7;
  id v31 = v18;
  id v19 = v11;
  id v32 = v19;
  id v20 = v8;
  id v33 = v20;
  id v21 = objc_retainBlock(v29);
  v22 = [v10 deviceUID];

  if (v22)
  {
    id v23 = objc_alloc((Class)MRAVReconnaissanceSession);
    v24 = [v10 deviceUID];
    v34 = v24;
    id v25 = +[NSArray arrayWithObjects:&v34 count:1];
    id v26 = [v23 initWithOutputDeviceUIDs:v25 outputDeviceGroupID:0 features:8 details:v18];

    [v26 setWaitForCompleteClusters:1];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000665C4;
    v27[3] = &unk_100418480;
    id v28 = v21;
    [v26 beginSearchWithTimeout:v27 endpointsCompletion:a3];
  }
  else
  {
    id v26 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    ((void (*)(void *, id, void))v21[2])(v21, v26, 0);
  }
}

@end