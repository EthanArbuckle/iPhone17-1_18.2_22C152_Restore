@interface MRDOutputContextModification
+ (id)_modifyPredictedOutputDevicesWithRequest:(id)a3 outputContext:(id)a4;
- (MRDOutputContextModification)initWithRequest:(id)a3;
- (MRGroupTopologyModificationRequest)request;
- (NSArray)avOutputDevices;
- (NSArray)discoveredConcreteOutputDevices;
- (id)description;
- (void)modifyWithOutputContext:(id)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation MRDOutputContextModification

- (MRDOutputContextModification)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRDOutputContextModification;
  v6 = [(MRDOutputContextModification *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@:%p/%@/discovered=%@>", objc_opt_class(), self, self->_request, self->_discoveredConcreteOutputDevices];
}

- (void)modifyWithOutputContext:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v46 = a4;
  id v9 = a5;
  v10 = +[NSDate date];
  v11 = [(MRGroupTopologyModificationRequest *)self->_request requestDetails];
  v12 = [v11 requestID];

  unsigned int v13 = [(MRGroupTopologyModificationRequest *)self->_request shouldModifyPredictedRoutes];
  v14 = @"modifyOutputContext";
  if (v13) {
    v14 = @"modifyPredictedOutputDevices";
  }
  v15 = v14;
  qos_class_t v16 = qos_class_self();
  id v17 = objc_alloc((Class)NSString);
  v18 = [v8 contextID];
  id v19 = [v17 initWithFormat:@"%@, contextID=%@", self, v18];

  id v20 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", v15, v12];
  v21 = v20;
  if (v19) {
    [v20 appendFormat:@" for %@", v19];
  }
  v48 = v19;
  v22 = _MRLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v62 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10015BB20;
  v53[3] = &unk_10041DCF8;
  qos_class_t v60 = v16;
  v23 = v15;
  v54 = v23;
  id v24 = v12;
  id v55 = v24;
  id v25 = v8;
  id v56 = v25;
  id v26 = v10;
  id v57 = v26;
  id v27 = v9;
  id v59 = v27;
  id v28 = v46;
  id v58 = v28;
  v29 = objc_retainBlock(v53);
  v30 = [(MRDOutputContextModification *)self request];
  unsigned int v31 = [v30 shouldModifyPredictedRoutes];

  if (v31)
  {
    v32 = objc_opt_class();
    v33 = [(MRDOutputContextModification *)self request];
    v34 = [v32 _modifyPredictedOutputDevicesWithRequest:v33 outputContext:v25];

    ((void (*)(void *, void *))v29[2])(v29, v34);
  }
  else
  {
    v35 = [v25 outputDevices];
    id v47 = [v35 count];

    v36 = [(MRDOutputContextModification *)self request];
    unsigned int v37 = [v36 shouldClearPredictedRoutes];

    if (v37)
    {
      sub_10015BEEC((uint64_t)self, v25);
      id v38 = objc_alloc((Class)MRGroupTopologyModificationRequest);
      v39 = [(MRDOutputContextModification *)self request];
      [v39 requestDetails];
      id v45 = v27;
      id v40 = v24;
      v42 = v41 = v23;
      id v43 = [v38 initWithRequestDetails:v42 type:3 outputDevices:&__NSArray0__struct];

      v23 = v41;
      id v24 = v40;
      id v27 = v45;

      id v44 = [(id)objc_opt_class() _modifyPredictedOutputDevicesWithRequest:v43 outputContext:v25];
    }
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10015C05C;
    v49[3] = &unk_10041EE30;
    v51 = v29;
    v49[4] = self;
    id v50 = v26;
    id v52 = v47;
    sub_10015C220((uint64_t)self, v25, v28, v49);

    v34 = v51;
  }
}

+ (id)_modifyPredictedOutputDevicesWithRequest:(id)a3 outputContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSDate now];
  id v8 = [v5 requestDetails];
  id v9 = [v8 requestID];

  id v10 = [v5 type];
  id v11 = objc_alloc((Class)NSString);
  v12 = MRGroupTopologyModificationRequestTypeDescription();
  id v13 = [v11 initWithFormat:@"%@PredictedOutputDevices", v12];

  id v14 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", v13, v9];
  v15 = [v5 requestDetails];
  qos_class_t v16 = [v15 reason];

  if (v16)
  {
    id v17 = [v5 requestDetails];
    v18 = [v17 reason];
    [v14 appendFormat:@" for %@", v18];
  }
  id v19 = _MRLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v51 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v20 = +[MRUserSettings currentSettings];
  unsigned __int8 v21 = [v20 supportPredictedRoutes];

  if ((v21 & 1) == 0)
  {
    id v26 = objc_alloc((Class)NSError);
    uint64_t v27 = 132;
LABEL_13:
    id v28 = [v26 initWithMRError:v27];
    goto LABEL_25;
  }
  if ([v6 type] != 1)
  {
    id v26 = objc_alloc((Class)NSError);
    uint64_t v27 = 32;
    goto LABEL_13;
  }
  v22 = [v5 outputDeviceUIDs];
  v23 = [v6 predictedOutputDeviceUIDs];
  id v24 = v23;
  id v47 = v22;
  if (v10 == (id)1)
  {
    id v29 = [v23 arrayByAddingObjectsFromArray:v22];
  }
  else
  {
    if (v10 != (id)3)
    {
      if (v10 == (id)2)
      {
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_10015CB5C;
        v48[3] = &unk_100417F00;
        id v49 = v22;
        uint64_t v25 = objc_msgSend(v24, "msv_filter:", v48);
      }
      else
      {
        uint64_t v25 = 0;
      }
      goto LABEL_18;
    }
    id v29 = v22;
  }
  uint64_t v25 = (uint64_t)v29;
LABEL_18:
  id v45 = (void *)v25;
  id v30 = [objc_alloc((Class)NSString) initWithFormat:@"Setting predictedOutputDevices: <%@>", v25];
  unsigned int v31 = _MRLogForCategory();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v51 = v13;
    __int16 v52 = 2114;
    v53 = v9;
    __int16 v54 = 2112;
    id v55 = v30;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }
  id v44 = v30;

  id v46 = v24;
  id v32 = [objc_alloc((Class)NSString) initWithFormat:@"Existing predictedOutputDevices: <%@>", v24];
  v33 = _MRLogForCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v51 = v13;
    __int16 v52 = 2114;
    v53 = v9;
    __int16 v54 = 2112;
    id v55 = v32;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  id v28 = [objc_alloc((Class)NSError) initWithMRError:132];
  id v34 = objc_alloc((Class)NSString);
  v35 = [v6 predictedOutputDeviceUIDs];
  id v36 = [v34 initWithFormat:@"Final predictedOutputDevices: <%@>", v35];

  unsigned int v37 = _MRLogForCategory();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v51 = v13;
    __int16 v52 = 2114;
    v53 = v9;
    __int16 v54 = 2112;
    id v55 = v36;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

LABEL_25:
  id v38 = _MRLogForCategory();
  v39 = v38;
  if (v28)
  {
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    id v40 = +[NSDate date];
    [v40 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 138544130;
    id v51 = v13;
    __int16 v52 = 2114;
    v53 = v9;
    __int16 v54 = 2114;
    id v55 = v28;
    __int16 v56 = 2048;
    uint64_t v57 = v41;
    _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);
  }
  else
  {
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    id v40 = +[NSDate date];
    [v40 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 138543874;
    id v51 = v13;
    __int16 v52 = 2114;
    v53 = v9;
    __int16 v54 = 2048;
    id v55 = v42;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
  }

LABEL_31:

  return v28;
}

- (MRGroupTopologyModificationRequest)request
{
  return self->_request;
}

- (NSArray)discoveredConcreteOutputDevices
{
  return self->_discoveredConcreteOutputDevices;
}

- (NSArray)avOutputDevices
{
  return self->_avOutputDevices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avOutputDevices, 0);
  objc_storeStrong((id *)&self->_discoveredConcreteOutputDevices, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end