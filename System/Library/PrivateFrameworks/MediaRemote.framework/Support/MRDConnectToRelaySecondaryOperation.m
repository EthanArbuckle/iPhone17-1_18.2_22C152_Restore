@interface MRDConnectToRelaySecondaryOperation
- (MRDConnectToRelaySecondaryOperation)initWithOutputDevice:(id)a3;
- (MRExternalDeviceTransportConnectionHandle)handle;
- (NSString)debugDescription;
- (void)execute;
- (void)finishWithError:(id)a3;
- (void)setHandle:(id)a3;
- (void)transport:(id)a3 didReceiveData:(id)a4;
@end

@implementation MRDConnectToRelaySecondaryOperation

- (MRDConnectToRelaySecondaryOperation)initWithOutputDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRDConnectToRelaySecondaryOperation;
  v6 = [(MRDConnectToRelaySecondaryOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_outputDevice, a3);
  }

  return v7;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRDConnectToRelaySecondaryOperation *)self handle];
  id v6 = [v3 initWithFormat:@"<%@:%p\n handle=%@\n pendingReplies=%@\n>", v4, self, v5, self->_pendingConfigureConnectionReplies];

  return (NSString *)v6;
}

- (void)execute
{
  id v3 = (MRRequestDetails *)[objc_alloc((Class)MRRequestDetails) initWithName:@"ConnectToMRRelay" requestID:0 reason:0];
  details = self->_details;
  self->_details = v3;

  id v5 = objc_alloc((Class)NSMutableString);
  id v6 = [(MRRequestDetails *)self->_details name];
  v7 = [(MRRequestDetails *)self->_details requestID];
  v8 = (__CFString *)[v5 initWithFormat:@"%@<%@>", v6, v7];

  objc_super v9 = [(MRAVOutputDevice *)self->_outputDevice debugName];

  if (v9)
  {
    v10 = [(MRAVOutputDevice *)self->_outputDevice debugName];
    [(__CFString *)v8 appendFormat:@" for %@", v10];
  }
  v11 = _MRLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v127 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = [(MRRequestDetails *)self->_details reason];
  [v12 setObject:v13 forKeyedSubscript:MRExternalDeviceConnectionReasonUserInfoKey];

  v14 = [(MRRequestDetails *)self->_details requestID];
  [v12 setObject:v14 forKeyedSubscript:MRExternalDeviceConnectionCorrelationIDUserInfoKey];

  if ([(MRDConnectToRelaySecondaryOperation *)self isCancelled])
  {
    id v15 = [objc_alloc((Class)NSError) initWithMRError:25];
    [(MRDConnectToRelaySecondaryOperation *)self finishWithError:v15];
  }
  else
  {
    id v16 = objc_alloc((Class)MRAVOutputDeviceTransport);
    v17 = [(MRAVOutputDevice *)self->_outputDevice uid];
    id v15 = [v16 initWithOutputDeviceUID:v17];

    v114 = +[NSDate now];
    id v18 = objc_alloc((Class)NSMutableString);
    v19 = [(MRRequestDetails *)self->_details requestID];
    v20 = (__CFString *)[v18 initWithFormat:@"%@<%@>", @"ConnectToMRRelay.createConnection", v19];

    v21 = [(MRAVOutputDevice *)self->_outputDevice debugName];

    if (v21)
    {
      v22 = [(MRAVOutputDevice *)self->_outputDevice debugName];
      [(__CFString *)v20 appendFormat:@" for %@", v22];
    }
    v23 = _MRLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v127 = v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    v24 = [v15 createConnectionWithUserInfo:v12];
    v25 = [v24 error];
    if (v24) {
      BOOL v26 = v25 == 0;
    }
    else {
      BOOL v26 = 0;
    }
    int v27 = v26;

    if (v27)
    {
      v28 = [(MRAVOutputDevice *)self->_outputDevice debugName];

      v29 = _MRLogForCategory();
      BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
      if (v28)
      {
        if (v30)
        {
          v31 = [(MRRequestDetails *)self->_details requestID];
          v32 = [(MRAVOutputDevice *)self->_outputDevice debugName];
          v33 = +[NSDate date];
          [v33 timeIntervalSinceDate:v114];
          *(_DWORD *)buf = 138544386;
          CFStringRef v127 = @"ConnectToMRRelay.createConnection";
          __int16 v128 = 2114;
          v129 = v31;
          __int16 v130 = 2112;
          v131 = v24;
          __int16 v132 = 2114;
          v133 = v32;
          __int16 v134 = 2048;
          uint64_t v135 = v34;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds", buf, 0x34u);
        }
      }
      else if (v30)
      {
        v44 = [(MRRequestDetails *)self->_details requestID];
        v45 = +[NSDate date];
        [v45 timeIntervalSinceDate:v114];
        *(_DWORD *)buf = 138544130;
        CFStringRef v127 = @"ConnectToMRRelay.createConnection";
        __int16 v128 = 2114;
        v129 = v44;
        __int16 v130 = 2112;
        v131 = v24;
        __int16 v132 = 2048;
        v133 = v46;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", buf, 0x2Au);
      }
    }
    else
    {
      v35 = [v24 error];

      v36 = [(MRAVOutputDevice *)self->_outputDevice debugName];

      v37 = _MRLogForCategory();
      v29 = v37;
      if (v35)
      {
        BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
        if (v36)
        {
          if (v38)
          {
            v39 = [(MRRequestDetails *)self->_details requestID];
            v40 = [v24 error];
            v41 = [(MRAVOutputDevice *)self->_outputDevice debugName];
            v42 = +[NSDate date];
            [v42 timeIntervalSinceDate:v114];
            *(_DWORD *)buf = 138544386;
            CFStringRef v127 = @"ConnectToMRRelay.createConnection";
            __int16 v128 = 2114;
            v129 = v39;
            __int16 v130 = 2114;
            v131 = v40;
            __int16 v132 = 2114;
            v133 = v41;
            __int16 v134 = 2048;
            uint64_t v135 = v43;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
          }
        }
        else if (v38)
        {
          v52 = [(MRRequestDetails *)self->_details requestID];
          v53 = [v24 error];
          v54 = +[NSDate date];
          [v54 timeIntervalSinceDate:v114];
          *(_DWORD *)buf = 138544130;
          CFStringRef v127 = @"ConnectToMRRelay.createConnection";
          __int16 v128 = 2114;
          v129 = v52;
          __int16 v130 = 2114;
          v131 = v53;
          __int16 v132 = 2048;
          v133 = v55;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);
        }
      }
      else
      {
        BOOL v47 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
        if (v36)
        {
          if (v47)
          {
            v48 = [(MRRequestDetails *)self->_details requestID];
            v49 = [(MRAVOutputDevice *)self->_outputDevice debugName];
            v50 = +[NSDate date];
            [v50 timeIntervalSinceDate:v114];
            *(_DWORD *)buf = 138544130;
            CFStringRef v127 = @"ConnectToMRRelay.createConnection";
            __int16 v128 = 2114;
            v129 = v48;
            __int16 v130 = 2114;
            v131 = v49;
            __int16 v132 = 2048;
            v133 = v51;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds", buf, 0x2Au);
          }
        }
        else if (v47)
        {
          v56 = [(MRRequestDetails *)self->_details requestID];
          v57 = +[NSDate date];
          [v57 timeIntervalSinceDate:v114];
          *(_DWORD *)buf = 138543874;
          CFStringRef v127 = @"ConnectToMRRelay.createConnection";
          __int16 v128 = 2114;
          v129 = v56;
          __int16 v130 = 2048;
          v131 = v58;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
        }
      }
    }

    id v59 = objc_alloc_init((Class)MRDeviceInfo);
    v60 = [(MRAVOutputDevice *)self->_outputDevice uid];
    [v59 setDeviceUID:v60];

    v61 = [(MRAVOutputDevice *)self->_outputDevice name];
    [v59 setName:v61];

    id v62 = [objc_alloc((Class)MRExternalDeviceTransportConnectionHandle) initWithConnection:v24 deviceInfo:v59];
    [(MRDConnectToRelaySecondaryOperation *)self setHandle:v62];

    uint64_t v120 = 0;
    v121 = &v120;
    uint64_t v122 = 0x3032000000;
    v123 = sub_100182B48;
    v124 = sub_100182B58;
    id v125 = 0;
    v63 = [v24 error];

    if (v63)
    {
      uint64_t v64 = [v24 error];
      v65 = (void *)v121[5];
      v121[5] = v64;

      [(MRDConnectToRelaySecondaryOperation *)self finishWithError:v121[5]];
    }
    else
    {
      if ([(MRDConnectToRelaySecondaryOperation *)self isCancelled])
      {
        id v66 = [objc_alloc((Class)NSError) initWithMRError:25];
        [(MRDConnectToRelaySecondaryOperation *)self finishWithError:v66];
      }
      else
      {
        [v24 addObserver:self];
        v67 = +[MRDMediaRemoteServer server];
        v112 = [v67 deviceInfo];

        id v68 = objc_alloc((Class)MRConfigureConnectionServiceMessage);
        v69 = [v112 WHAIdentifier];
        v70 = [v112 name];
        id v113 = [v68 initWithServiceType:@"MRRelay" sourceOutputDeviceUID:v69 sourceOutputDeviceName:v70];

        v71 = +[NSUUID UUID];
        v72 = [v71 UUIDString];
        [v113 setReplyIdentifier:v72];

        v73 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        pendingConfigureConnectionReplies = self->_pendingConfigureConnectionReplies;
        self->_pendingConfigureConnectionReplies = v73;

        dispatch_semaphore_t v75 = dispatch_semaphore_create(0);
        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472;
        v116[2] = sub_100182B60;
        v116[3] = &unk_1004201F0;
        id v76 = v59;
        id v117 = v76;
        v119 = &v120;
        dispatch_semaphore_t dsema = v75;
        dispatch_semaphore_t v118 = dsema;
        v77 = objc_retainBlock(v116);
        v78 = self->_pendingConfigureConnectionReplies;
        v79 = [v113 replyIdentifier];
        [(NSMutableDictionary *)v78 setObject:v77 forKeyedSubscript:v79];

        v110 = +[NSDate now];
        id v80 = objc_alloc((Class)NSMutableString);
        v81 = [(MRRequestDetails *)self->_details requestID];
        v82 = (__CFString *)[v80 initWithFormat:@"%@<%@>", @"ConnectToMRRelay.configureConnection", v81];

        v83 = [(MRAVOutputDevice *)self->_outputDevice debugName];

        if (v83)
        {
          v84 = [(MRAVOutputDevice *)self->_outputDevice debugName];
          [(__CFString *)v82 appendFormat:@" for %@", v84];
        }
        v85 = _MRLogForCategory();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          CFStringRef v127 = v82;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
        }

        v86 = [v113 protobufData];
        [v24 sendTransportData:v86 options:0];

        v87 = +[MRProtocolMessageLogger sharedLogger];
        [v87 logMessage:@"Message Sent:" label:@"MRRelay" deviceInfo:v76 protocolMessage:v113];

        dispatch_time_t v88 = dispatch_time(0, 7000000000);
        if (dispatch_semaphore_wait(dsema, v88))
        {
          id v89 = [objc_alloc((Class)NSError) initWithMRError:26 format:@"Failed to configureConnection"];
          v90 = (void *)v121[5];
          v121[5] = (uint64_t)v89;
        }
        outputDevice = self->_outputDevice;
        if (v121[5])
        {
          v92 = [(MRAVOutputDevice *)outputDevice debugName];

          if (v92)
          {
            v93 = _MRLogForCategory();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
            {
              v115 = [(MRRequestDetails *)self->_details requestID];
              v94 = (void *)v121[5];
              v95 = [(MRAVOutputDevice *)self->_outputDevice debugName];
              v96 = +[NSDate date];
              [v96 timeIntervalSinceDate:v110];
              *(_DWORD *)buf = 138544386;
              CFStringRef v127 = @"ConnectToMRRelay.configureConnection";
              __int16 v128 = 2114;
              v129 = v115;
              __int16 v130 = 2114;
              v131 = v94;
              __int16 v132 = 2114;
              v133 = v95;
              __int16 v134 = 2048;
              uint64_t v135 = v97;
              _os_log_error_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
            }
          }
          else
          {
            v93 = _MRLogForCategory();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
            {
              v103 = [(MRRequestDetails *)self->_details requestID];
              v104 = (void *)v121[5];
              v105 = +[NSDate date];
              [v105 timeIntervalSinceDate:v110];
              *(_DWORD *)buf = 138544130;
              CFStringRef v127 = @"ConnectToMRRelay.configureConnection";
              __int16 v128 = 2114;
              v129 = v103;
              __int16 v130 = 2114;
              v131 = v104;
              __int16 v132 = 2048;
              v133 = v106;
              _os_log_error_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);
            }
          }
        }
        else
        {
          v98 = [(MRAVOutputDevice *)outputDevice debugName];

          if (v98)
          {
            v93 = _MRLogForCategory();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              v99 = [(MRRequestDetails *)self->_details requestID];
              v100 = [(MRAVOutputDevice *)self->_outputDevice debugName];
              v101 = +[NSDate date];
              [v101 timeIntervalSinceDate:v110];
              *(_DWORD *)buf = 138544130;
              CFStringRef v127 = @"ConnectToMRRelay.configureConnection";
              __int16 v128 = 2114;
              v129 = v99;
              __int16 v130 = 2114;
              v131 = v100;
              __int16 v132 = 2048;
              v133 = v102;
              _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds", buf, 0x2Au);
            }
          }
          else
          {
            v93 = _MRLogForCategory();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
            {
              v107 = [(MRRequestDetails *)self->_details requestID];
              v108 = +[NSDate date];
              [v108 timeIntervalSinceDate:v110];
              *(_DWORD *)buf = 138543874;
              CFStringRef v127 = @"ConnectToMRRelay.configureConnection";
              __int16 v128 = 2114;
              v129 = v107;
              __int16 v130 = 2048;
              v131 = v109;
              _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
            }
          }
        }

        [v24 removeObserver:self];
        [(MRDConnectToRelaySecondaryOperation *)self finishWithError:v121[5]];

        id v66 = v112;
      }
    }
    _Block_object_dispose(&v120, 8);
  }
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v14 = [(MRDConnectToRelaySecondaryOperation *)self handle];

    id v15 = [(MRAVOutputDevice *)self->_outputDevice debugName];

    id v6 = _MRLogForCategory();
    BOOL v16 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v15)
      {
        if (!v16) {
          goto LABEL_19;
        }
        v8 = [(MRRequestDetails *)self->_details name];
        objc_super v9 = [(MRRequestDetails *)self->_details requestID];
        v10 = [(MRDConnectToRelaySecondaryOperation *)self handle];
        v11 = [(MRAVOutputDevice *)self->_outputDevice debugName];
        id v12 = +[NSDate date];
        v17 = [(MRRequestDetails *)self->_details startDate];
        [v12 timeIntervalSinceDate:v17];
        *(_DWORD *)buf = 138544386;
        int v27 = v8;
        __int16 v28 = 2114;
        v29 = v9;
        __int16 v30 = 2112;
        id v31 = v10;
        __int16 v32 = 2114;
        v33 = v11;
        __int16 v34 = 2048;
        uint64_t v35 = v18;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds", buf, 0x34u);

        goto LABEL_17;
      }
      if (!v16) {
        goto LABEL_19;
      }
      v8 = [(MRRequestDetails *)self->_details name];
      objc_super v9 = [(MRRequestDetails *)self->_details requestID];
      v10 = [(MRDConnectToRelaySecondaryOperation *)self handle];
      v11 = +[NSDate date];
      id v12 = [(MRRequestDetails *)self->_details startDate];
      [v11 timeIntervalSinceDate:v12];
      *(_DWORD *)buf = 138544130;
      int v27 = v8;
      __int16 v28 = 2114;
      v29 = v9;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2048;
      v33 = v21;
      v20 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    }
    else
    {
      if (!v15)
      {
        if (v16)
        {
          v8 = [(MRRequestDetails *)self->_details name];
          objc_super v9 = [(MRRequestDetails *)self->_details requestID];
          v10 = +[NSDate date];
          v11 = [(MRRequestDetails *)self->_details startDate];
          [v10 timeIntervalSinceDate:v11];
          *(_DWORD *)buf = 138543874;
          int v27 = v8;
          __int16 v28 = 2114;
          v29 = v9;
          __int16 v30 = 2048;
          id v31 = v24;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
          goto LABEL_18;
        }
        goto LABEL_19;
      }
      if (!v16) {
        goto LABEL_19;
      }
      v8 = [(MRRequestDetails *)self->_details name];
      objc_super v9 = [(MRRequestDetails *)self->_details requestID];
      v10 = [(MRAVOutputDevice *)self->_outputDevice debugName];
      v11 = +[NSDate date];
      id v12 = [(MRRequestDetails *)self->_details startDate];
      [v11 timeIntervalSinceDate:v12];
      *(_DWORD *)buf = 138544130;
      int v27 = v8;
      __int16 v28 = 2114;
      v29 = v9;
      __int16 v30 = 2114;
      id v31 = v10;
      __int16 v32 = 2048;
      v33 = v19;
      v20 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    }
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v20, buf, 0x2Au);
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  id v5 = [(MRAVOutputDevice *)self->_outputDevice debugName];

  id v6 = _MRLogForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (!v7) {
      goto LABEL_19;
    }
    v8 = [(MRRequestDetails *)self->_details name];
    objc_super v9 = [(MRRequestDetails *)self->_details requestID];
    v10 = [(MRAVOutputDevice *)self->_outputDevice debugName];
    v11 = +[NSDate date];
    id v12 = [(MRRequestDetails *)self->_details startDate];
    [v11 timeIntervalSinceDate:v12];
    *(_DWORD *)buf = 138544386;
    int v27 = v8;
    __int16 v28 = 2114;
    v29 = v9;
    __int16 v30 = 2114;
    id v31 = v4;
    __int16 v32 = 2114;
    v33 = v10;
    __int16 v34 = 2048;
    uint64_t v35 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
    goto LABEL_17;
  }
  if (v7) {
    sub_100332310((uint64_t)self, (uint64_t)v4, v6);
  }
LABEL_19:

  v25.receiver = self;
  v25.super_class = (Class)MRDConnectToRelaySecondaryOperation;
  [(MRDConnectToRelaySecondaryOperation *)&v25 finishWithError:v4];
  v22 = [(MRDConnectToRelaySecondaryOperation *)self completionBlock];

  if (v22)
  {
    v23 = [(MRDConnectToRelaySecondaryOperation *)self completionBlock];
    v23[2]();
  }
}

- (void)setHandle:(id)a3
{
  id v4 = (MRExternalDeviceTransportConnectionHandle *)a3;
  handle = self->_handle;
  id v6 = _MRLogForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (handle)
  {
    if (v7)
    {
      v8 = [(MRRequestDetails *)self->_details requestReasonID];
      objc_super v9 = self->_handle;
      int v14 = 138544130;
      id v15 = v8;
      __int16 v16 = 2114;
      CFStringRef v17 = @"connection";
      __int16 v18 = 2112;
      v19 = v9;
      __int16 v20 = 2112;
      v21 = v4;
      v10 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
      v11 = v6;
      uint32_t v12 = 42;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }
  else if (v7)
  {
    v8 = [(MRRequestDetails *)self->_details requestReasonID];
    int v14 = 138543874;
    id v15 = v8;
    __int16 v16 = 2114;
    CFStringRef v17 = @"connection";
    __int16 v18 = 2112;
    v19 = v4;
    v10 = "Set: %{public}@ setting %{public}@ to <%@>";
    v11 = v6;
    uint32_t v12 = 32;
    goto LABEL_6;
  }

  uint64_t v13 = self->_handle;
  self->_handle = v4;
}

- (void)transport:(id)a3 didReceiveData:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  BOOL v7 = +[MRProtocolMessage protocolMessageWithProtobufData:v6 error:0];
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    objc_super v9 = v8;
    objc_sync_enter(v9);
    pendingConfigureConnectionReplies = v9->_pendingConfigureConnectionReplies;
    v11 = [v7 replyIdentifier];
    uint32_t v12 = [(NSMutableDictionary *)pendingConfigureConnectionReplies objectForKeyedSubscript:v11];

    objc_sync_exit(v9);
    if (v12) {
      ((void (**)(void, void *))v12)[2](v12, v7);
    }

    objc_sync_exit(v9);
  }
}

- (MRExternalDeviceTransportConnectionHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_pendingConfigureConnectionReplies, 0);
  objc_storeStrong((id *)&self->_outputDevice, 0);

  objc_storeStrong((id *)&self->_details, 0);
}

@end