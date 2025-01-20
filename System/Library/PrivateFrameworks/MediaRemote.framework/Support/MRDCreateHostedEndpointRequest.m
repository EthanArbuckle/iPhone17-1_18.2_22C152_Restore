@interface MRDCreateHostedEndpointRequest
+ (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
- (void)_createHostedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
- (void)_maybeSendCommandPreviewForOutputDeviceUID:(id)a3 details:(id)a4;
- (void)_searchForBuddyLeaderWithTimeout:(double)a3 details:(id)a4 completion:(id)a5;
- (void)_searchForContextUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
@end

@implementation MRDCreateHostedEndpointRequest

+ (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008E02C;
  v14[3] = &unk_1004198A0;
  v15 = objc_alloc_init(MRDCreateHostedEndpointRequest);
  id v16 = v9;
  id v12 = v9;
  v13 = v15;
  [(MRDCreateHostedEndpointRequest *)v13 _createHostedEndpointWithOutputDeviceUIDs:v11 timeout:v10 details:v14 completion:a4];
}

- (void)_createHostedEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [MRDCreateHostedEndpointAnalytics alloc];
  v13 = [v10 requestID];
  v14 = [(MRDCreateHostedEndpointAnalytics *)v12 initWithRequestID:v13];

  v15 = +[NSDate now];
  id v16 = [v10 requestID];
  id v17 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"CreateHostedEndpointWithOutputDeviceUIDs", v16];
  v18 = v17;
  if (v9) {
    [v17 appendFormat:@" for %@", v9];
  }
  v19 = _MRLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v76 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_10008E644;
  v68[3] = &unk_1004198C8;
  id v20 = v9;
  id v69 = v20;
  v70 = @"CreateHostedEndpointWithOutputDeviceUIDs";
  id v21 = v16;
  id v71 = v21;
  id v49 = v15;
  id v72 = v49;
  v22 = v14;
  v73 = v22;
  id v48 = v11;
  id v74 = v48;
  v23 = objc_retainBlock(v68);
  id v24 = objc_alloc((Class)MRBlockGuard);
  v25 = [v10 requestReasonID];
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_10008EA18;
  v66[3] = &unk_100415FA8;
  v26 = v23;
  id v67 = v26;
  id v27 = [v24 initWithTimeout:v25 reason:v66 handler:a4];

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_10008EA30;
  v63[3] = &unk_100416B18;
  id v28 = v27;
  id v64 = v28;
  v29 = v26;
  id v65 = v29;
  v30 = objc_retainBlock(v63);
  v31 = +[MRUserSettings currentSettings];
  if (![v31 supportMultiplayerHost])
  {

    goto LABEL_12;
  }
  id v32 = [v20 count];

  if (!v32)
  {
LABEL_12:
    id v39 = [objc_alloc((Class)NSError) initWithMRError:2];
    ((void (*)(void *, void, id))v30[2])(v30, 0, v39);

    goto LABEL_15;
  }
  id v45 = v21;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10008EAA8;
  v57[3] = &unk_100419918;
  v57[4] = self;
  id v33 = v20;
  id v58 = v33;
  id v42 = v10;
  id v59 = v42;
  v41 = v30;
  id v61 = v41;
  v34 = v22;
  v60 = v34;
  double v62 = a4;
  v44 = objc_retainBlock(v57);
  v35 = +[MRDMediaRemoteServer server];
  v36 = [v35 deviceInfo];

  uint64_t v37 = [v36 deviceUID];
  v46 = [v36 clusterID];
  v43 = (void *)v37;
  if ((([v33 containsObject:v37] & 1) != 0
     || [v33 containsObject:v46])
    && (([v36 clusterType] - 1) & 0xFFFFFFFD) == 0)
  {
    v40 = [(MRDCreateHostedEndpointAnalytics *)v34 searchForBuddy];
    [v40 start];

    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10008EE50;
    v50[3] = &unk_100419968;
    v51 = v34;
    id v52 = v33;
    double v56 = a4;
    id v53 = v42;
    v54 = v41;
    v38 = v44;
    v55 = v44;
    [(MRDCreateHostedEndpointRequest *)self _searchForBuddyLeaderWithTimeout:v53 details:v50 completion:a4];
  }
  else
  {
    v38 = v44;
    ((void (*)(void *))v44[2])(v44);
  }
  id v21 = v45;

LABEL_15:
}

- (void)_maybeSendCommandPreviewForOutputDeviceUID:(id)a3 details:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[MRDMediaRemoteServer server];
  v8 = [v7 deviceInfo];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        if (objc_msgSend(v8, "containsDevice:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16))
        {
          id v14 = objc_alloc_init((Class)NSMutableDictionary);
          [v14 setObject:@"CreateHostedEndpointWithOutputDeviceUIDs.sendCommandPreview" forKeyedSubscript:kMRMediaRemoteOptionRemoteControlInterfaceIdentifier];
          v15 = [v6 requestID];
          [v14 setObject:v15 forKeyedSubscript:kMRMediaRemoteOptionCommandID];

          +[MRDAVOutputContextExternalDevice _sendCommandPreview:0 options:v14 playerPath:0];
          goto LABEL_11;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)_searchForBuddyLeaderWithTimeout:(double)a3 details:(id)a4 completion:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  v8 = +[NSDate now];
  id v9 = objc_alloc((Class)NSMutableString);
  id v10 = [v6 requestID];
  id v11 = [v9 initWithFormat:@"%@<%@>", @"CreateHostedEndpointWithOutputDeviceUIDs.searchForBuddyLeader", v10];

  uint64_t v12 = _MRLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10008F500;
  v27[3] = &unk_100417030;
  id v28 = @"CreateHostedEndpointWithOutputDeviceUIDs.searchForBuddyLeader";
  id v13 = v6;
  id v29 = v13;
  id v14 = v8;
  id v30 = v14;
  id v15 = v7;
  id v31 = v15;
  long long v16 = objc_retainBlock(v27);
  long long v17 = +[MRDMediaRemoteServer server];
  long long v18 = [v17 deviceInfo];

  if ((([v18 clusterType] - 1) & 0xFFFFFFFD) != 0)
  {
    ((void (*)(void *, void, void))v16[2])(v16, 0, 0);
  }
  else
  {
    long long v19 = [v18 deviceUID];
    id v20 = objc_alloc((Class)MRAVReconnaissanceSession);
    id v32 = v19;
    id v21 = +[NSArray arrayWithObjects:&v32 count:1];
    id v22 = [v20 initWithOutputDeviceUIDs:v21 outputDeviceGroupID:0 features:8 details:v13];

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10008F704;
    v24[3] = &unk_1004199B8;
    id v25 = v19;
    v26 = v16;
    id v23 = v19;
    [v22 beginSearchWithTimeout:v24 completion:3.0];
  }
}

- (void)_searchForContextUID:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = +[NSDate now];
  id v13 = objc_alloc((Class)NSMutableString);
  id v14 = [v10 requestID];
  id v15 = [v13 initWithFormat:@"%@<%@>", @"CreateHostedEndpointWithOutputDeviceUIDs.searchForContextID", v14];

  if (v9) {
    [v15 appendFormat:@" for %@", v9];
  }
  long long v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v37 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10008FBB4;
  v31[3] = &unk_100417030;
  id v32 = @"CreateHostedEndpointWithOutputDeviceUIDs.searchForContextID";
  id v33 = v10;
  id v34 = v12;
  id v35 = v11;
  id v17 = v11;
  id v18 = v12;
  id v19 = v10;
  id v20 = objc_retainBlock(v31);
  id v21 = objc_alloc_init((Class)MRAVLightweightReconnaissanceSession);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10008FDB8;
  v29[3] = &qword_1004199E0;
  id v30 = v9;
  id v22 = v9;
  id v23 = [v19 requestReasonID];
  qos_class_t v24 = qos_class_self();
  id v25 = dispatch_get_global_queue(v24, 0);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10008FE28;
  v27[3] = &unk_100419A08;
  id v28 = v20;
  v26 = v20;
  [v21 searchEndpointsWithPredicate:v29 timeout:v23 reason:v25 queue:v27 completion:a4];
}

@end