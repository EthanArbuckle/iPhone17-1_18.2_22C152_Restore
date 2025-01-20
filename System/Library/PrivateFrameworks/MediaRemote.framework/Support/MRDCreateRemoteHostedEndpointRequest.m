@interface MRDCreateRemoteHostedEndpointRequest
+ (void)createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:(id)a3 withOutputDeviceUIDs:(id)a4 timeout:(double)a5 details:(id)a6 completion:(id)a7;
- (void)_createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:(id)a3 withOutputDeviceUIDs:(id)a4 timeout:(double)a5 details:(id)a6 completion:(id)a7;
- (void)_searchForGroupUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
@end

@implementation MRDCreateRemoteHostedEndpointRequest

+ (void)createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:(id)a3 withOutputDeviceUIDs:(id)a4 timeout:(double)a5 details:(id)a6 completion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008FFBC;
  v17[3] = &unk_100419940;
  v18 = objc_alloc_init(MRDCreateRemoteHostedEndpointRequest);
  id v19 = v11;
  id v15 = v11;
  v16 = v18;
  [(MRDCreateRemoteHostedEndpointRequest *)v16 _createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:v14 withOutputDeviceUIDs:v13 timeout:v12 details:v17 completion:a5];
}

- (void)_createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:(id)a3 withOutputDeviceUIDs:(id)a4 timeout:(double)a5 details:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = [MRDCreateRemoteHostedEndpointAnalytics alloc];
  v16 = [v13 requestID];
  v17 = [(MRDCreateRemoteHostedEndpointAnalytics *)v15 initWithRequestID:v16];

  v18 = +[NSDate now];
  id v19 = objc_alloc((Class)NSMutableString);
  v20 = [v13 requestID];
  id v21 = [v19 initWithFormat:@"%@<%@>", @"createRemoteHostedEndpointForGroupLeaderWithOutputDeviceUIDs", v20];

  if (v11) {
    [v21 appendFormat:@" for %@", v11];
  }
  if (v12) {
    [v21 appendFormat:@" because %@", v12];
  }
  v22 = _MRLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v81 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_10009069C;
  v72[3] = &unk_100419A30;
  v73 = @"createRemoteHostedEndpointForGroupLeaderWithOutputDeviceUIDs";
  id v23 = v13;
  id v74 = v23;
  id v56 = v18;
  id v75 = v56;
  v24 = v17;
  v76 = v24;
  id v55 = v14;
  id v77 = v55;
  v25 = objc_retainBlock(v72);
  id v26 = objc_alloc((Class)MRBlockGuard);
  v27 = [v23 requestReasonID];
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_1000908B4;
  v70[3] = &unk_100415FA8;
  v28 = v25;
  id v71 = v28;
  id v29 = [v26 initWithTimeout:v27 reason:v70 handler:a5];

  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_1000908CC;
  v67[3] = &unk_100416B18;
  id v53 = v29;
  id v68 = v53;
  v54 = v28;
  id v69 = v54;
  v30 = objc_retainBlock(v67);
  v31 = +[MRDMediaRemoteServer server];
  v32 = [v31 routingServer];
  v33 = [v32 hostedRoutingService];
  v34 = [v33 hostedRoutingController];

  v35 = [v34 availableOutputDevices];
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_100090944;
  v65[3] = &unk_100417940;
  id v36 = v11;
  id v66 = v36;
  v37 = objc_msgSend(v35, "msv_firstWhere:", v65);

  if (!v37)
  {
    id v49 = [objc_alloc((Class)NSError) initWithMRError:47];
LABEL_13:
    v44 = v49;
    ((void (*)(void *, void, id))v30[2])(v30, 0, v49);
    goto LABEL_16;
  }
  v38 = [v37 primaryID];

  if (!v38)
  {
    id v49 = [objc_alloc((Class)NSError) initWithMRError:39 description:@"No primaryID"];
    goto LABEL_13;
  }
  id v50 = v36;
  v51 = v12;
  v39 = [(MRDCreateRemoteHostedEndpointAnalytics *)v24 createTransientExternalDevice];
  [v39 start];

  v40 = +[MRDMediaRemoteServer server];
  v41 = [v40 routingServer];
  v42 = [v41 hostedRoutingService];
  v43 = [v42 hostedRoutingController];
  v44 = [v43 makeTransientExternalDeviceToOutputDevice:v37];

  if (v44)
  {
    v45 = [(MRDCreateRemoteHostedEndpointAnalytics *)v24 createTransientExternalDevice];
    [v45 end];

    v46 = [(MRDCreateRemoteHostedEndpointAnalytics *)v24 connectToTransientExternalDevice];
    [v46 start];

    v79[0] = @"createRemoteHostedEndpointForGroupLeaderWithOutputDeviceUIDs";
    v78[0] = MRExternalDeviceConnectionReasonUserInfoKey;
    v78[1] = MRExternalDeviceConnectionCorrelationIDUserInfoKey;
    v47 = [v23 requestID];
    v79[1] = v47;
    id v48 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:2];

    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100090950;
    v57[3] = &unk_100419A80;
    v58 = v24;
    id v59 = v44;
    id v12 = v51;
    id v60 = v51;
    v61 = self;
    double v64 = a5;
    id v62 = v23;
    v63 = v30;
    [v59 connectWithOptions:0 userInfo:v48 completion:v57];
  }
  else
  {
    id v48 = [objc_alloc((Class)NSError) initWithMRError:127];
    ((void (*)(void *, void, id))v30[2])(v30, 0, v48);
    id v12 = v51;
  }

  id v36 = v50;
LABEL_16:
}

- (void)_searchForGroupUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[NSDate now];
  id v13 = objc_alloc((Class)NSMutableString);
  id v14 = [v10 requestID];
  id v15 = [v13 initWithFormat:@"%@<%@>", @"searchForGroupID", v14];

  if (v9) {
    [v15 appendFormat:@" for %@", v9];
  }
  v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v37 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10009103C;
  v31[3] = &unk_100417030;
  v32 = @"searchForGroupID";
  id v33 = v10;
  id v34 = v12;
  id v35 = v11;
  id v17 = v11;
  id v18 = v12;
  id v19 = v10;
  v20 = objc_retainBlock(v31);
  id v21 = objc_alloc_init((Class)MRAVLightweightReconnaissanceSession);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100091240;
  v29[3] = &qword_1004199E0;
  id v30 = v9;
  id v22 = v9;
  id v23 = [v19 requestReasonID];
  qos_class_t v24 = qos_class_self();
  v25 = dispatch_get_global_queue(v24, 0);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000912AC;
  v27[3] = &unk_100419A08;
  id v28 = v20;
  id v26 = v20;
  [v21 searchEndpointsWithPredicate:v29 timeout:v23 reason:v25 queue:v27 completion:a4];
}

@end