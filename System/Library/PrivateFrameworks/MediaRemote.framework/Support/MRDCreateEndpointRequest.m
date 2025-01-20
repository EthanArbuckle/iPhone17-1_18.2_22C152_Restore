@interface MRDCreateEndpointRequest
+ (void)createEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
- (id)_createEndpointForOutputDeviceUIDs:(id)a3;
- (int64_t)_calculateOperationTypeForEndpoint:(id)a3;
- (void)createEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6;
@end

@implementation MRDCreateEndpointRequest

+ (void)createEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100159774;
  v14[3] = &unk_1004183E0;
  v15 = objc_alloc_init(MRDCreateEndpointRequest);
  id v16 = v9;
  id v12 = v9;
  v13 = v15;
  [(MRDCreateEndpointRequest *)v13 createEndpointWithOutputDeviceUIDs:v11 timeout:v10 details:v14 completion:a4];
}

- (void)createEndpointWithOutputDeviceUIDs:(id)a3 timeout:(double)a4 details:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = [MRDCreateEndpointAnalytics alloc];
  v14 = [v11 requestID];
  v15 = [(MRDCreateEndpointAnalytics *)v13 initWithRequestID:v14];

  id v16 = +[NSDate now];
  id v17 = objc_alloc((Class)NSMutableString);
  v18 = [v11 requestID];
  id v19 = [v17 initWithFormat:@"%@<%@>", @"CreateEndpointWithOutputDeviceUIDs", v18];

  if (v10) {
    [v19 appendFormat:@" for %@", v10];
  }
  v20 = _MRLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v70 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_100159E3C;
  v63[3] = &unk_100419A30;
  v64 = @"CreateEndpointWithOutputDeviceUIDs";
  id v21 = v11;
  id v65 = v21;
  id v22 = v16;
  id v66 = v22;
  v23 = v15;
  v67 = v23;
  id v24 = v12;
  id v68 = v24;
  v25 = objc_retainBlock(v63);
  id v26 = objc_alloc((Class)MRBlockGuard);
  v27 = [v21 requestReasonID];
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10015A04C;
  v61[3] = &unk_100415FA8;
  v28 = v25;
  id v62 = v28;
  id v29 = [v26 initWithTimeout:v27 reason:v61 handler:a4];

  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10015A064;
  v58[3] = &unk_100416B18;
  id v30 = v29;
  id v59 = v30;
  v31 = v28;
  id v60 = v31;
  v32 = objc_retainBlock(v58);
  v33 = [(MRDCreateEndpointRequest *)self _createEndpointForOutputDeviceUIDs:v10];
  int64_t v34 = [(MRDCreateEndpointRequest *)self _calculateOperationTypeForEndpoint:v33];
  [(MRDCreateEndpointAnalytics *)v23 setOperationType:v34];
  switch(v34)
  {
    case 0:
      [(MRDCreateEndpointAnalytics *)v23 setOperationTypeString:@"None"];
      id v35 = [objc_alloc((Class)NSError) initWithMRError:47];
      ((void (*)(void *, void, id))v32[2])(v32, 0, v35);
      goto LABEL_12;
    case 1:
      [(MRDCreateEndpointAnalytics *)v23 setOperationTypeString:@"CreateHostedEndpoint"];
      v36 = [(MRDCreateEndpointAnalytics *)v23 createHostedEndpoint];
      [v36 start];

      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_10015A0DC;
      v55[3] = &unk_1004198A0;
      v56 = v23;
      v57 = v32;
      +[MRDCreateHostedEndpointRequest createHostedEndpointWithOutputDeviceUIDs:v10 timeout:v21 details:v55 completion:a4];

      v37 = v56;
      goto LABEL_10;
    case 2:
      [(MRDCreateEndpointAnalytics *)v23 setOperationTypeString:@"CreateRemoteHostedEndpoint"];
      v38 = [(MRDCreateEndpointAnalytics *)v23 createRemoteHostedEndpoint];
      [v38 start];

      [v33 groupLeader];
      v39 = id v46 = v22;
      [v39 uid];
      v41 = id v40 = v24;
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_10015A170;
      v52[3] = &unk_100419940;
      v53 = v23;
      v54 = v32;
      +[MRDCreateRemoteHostedEndpointRequest createRemoteHostedEndpointWithGroupLeaderOutputDeviceUID:v41 withOutputDeviceUIDs:v10 timeout:v21 details:v52 completion:a4];

      id v24 = v40;
      id v22 = v46;

      v37 = v53;
LABEL_10:

      break;
    case 3:
      [(MRDCreateEndpointAnalytics *)v23 setOperationTypeString:@"ModifyOutputContext"];
      [(MRDCreateEndpointAnalytics *)v23 modifyOutputContext];
      id v47 = v24;
      v43 = id v42 = v22;
      [v43 start];

      id v35 = [objc_alloc((Class)MRGroupTopologyModificationRequest) initWithRequestDetails:v21 type:3 outputDeviceUIDs:v10];
      [v35 setSuppressErrorDialog:1];
      qos_class_t v44 = qos_class_self();
      v45 = dispatch_get_global_queue(v44, 0);
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10015A204;
      v48[3] = &unk_10041A778;
      v49 = v23;
      v51 = v32;
      id v50 = v33;
      [v50 modifyTopologyWithRequest:v35 withReplyQueue:v45 completion:v48];

      id v22 = v42;
      id v24 = v47;

LABEL_12:
      break;
    default:
      [(MRDCreateEndpointAnalytics *)v23 setOperationTypeString:@"?"];
      break;
  }
}

- (id)_createEndpointForOutputDeviceUIDs:(id)a3
{
  id v3 = a3;
  v4 = +[MRDMediaRemoteServer server];
  v5 = [v4 routingServer];
  v6 = [v5 hostedRoutingService];
  v7 = [v6 hostedRoutingController];

  v8 = [v7 makeEndpointWithOutputDeviceUIDs:v3 options:190];

  return v8;
}

- (int64_t)_calculateOperationTypeForEndpoint:(id)a3
{
  id v3 = a3;
  v4 = +[MRUserSettings currentSettings];
  unsigned int v5 = [v4 supportPTOTRefactorPart1];

  if (v5)
  {
    v6 = +[MRUserSettings currentSettings];
    if ([v6 supportMultiplayerHost])
    {
      if ([v3 connectionType] == (id)1)
      {

LABEL_10:
        int64_t v7 = 1;
        goto LABEL_16;
      }
      id v8 = [v3 connectionType];

      if (v8 == (id)6) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    id v9 = [v3 designatedGroupLeader];
    unsigned __int8 v10 = [v9 supportsMultiplayer];

    uint64_t v11 = 3;
    if (!v3) {
      uint64_t v11 = 0;
    }
    if (v10) {
      int64_t v7 = 2;
    }
    else {
      int64_t v7 = v11;
    }
  }
  else if (v3)
  {
    int64_t v7 = 3;
  }
  else
  {
    int64_t v7 = 0;
  }
LABEL_16:

  return v7;
}

@end