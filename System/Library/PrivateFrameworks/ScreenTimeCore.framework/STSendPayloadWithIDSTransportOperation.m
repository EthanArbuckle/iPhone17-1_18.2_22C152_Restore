@interface STSendPayloadWithIDSTransportOperation
- (IDSService)service;
- (NSSet)destinations;
- (STSendPayloadWithIDSTransportOperation)initWithPayload:(id)a3 destinations:(id)a4 service:(id)a5;
- (STUnifiedTransportPayload)payload;
- (id)_sendData:(id)a3 toDestinations:(id)a4 queueIdentifier:(id)a5 payloadUUID:(id)a6 expectResponse:(BOOL)a7 withError:(id *)a8;
- (void)main;
- (void)setPayload:(id)a3;
@end

@implementation STSendPayloadWithIDSTransportOperation

- (STSendPayloadWithIDSTransportOperation)initWithPayload:(id)a3 destinations:(id)a4 service:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)STSendPayloadWithIDSTransportOperation;
  v12 = [(STOperation *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_service, a5);
    objc_storeStrong((id *)&v13->_payload, a3);
    v14 = (NSSet *)[v10 copy];
    destinations = v13->_destinations;
    v13->_destinations = v14;
  }
  return v13;
}

- (void)main
{
  os_activity_t v3 = _os_activity_create((void *)&_mh_execute_header, "STSendPayloadWithIDSTransportOperation start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  [(STOperation *)self setActivity:v3];

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v4 = [(STOperation *)self activity];
  os_activity_scope_enter(v4, &state);

  v5 = +[STLog familyMessaging];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(STUnifiedTransportPayload *)self->_payload payloadType];
    *(_DWORD *)buf = 136446466;
    v37 = "-[STSendPayloadWithIDSTransportOperation main]";
    __int16 v38 = 2112;
    v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nStarted \npayloadType: %@", buf, 0x16u);
  }
  v7 = [(STSendPayloadWithIDSTransportOperation *)self payload];
  id v34 = 0;
  v8 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v34];
  id v9 = v34;

  if (v8)
  {
    id v10 = [(STSendPayloadWithIDSTransportOperation *)self payload];
    id v11 = [v10 payloadType];

    BOOL v13 = ![v11 isEqualToString:@"RMUnifiedTransportPayloadTypeUsageRequest"]
       && ([v11 isEqualToString:@"RMUnifiedTransportPayloadTypeUsageResponse"] & 1) == 0
       && ([v11 isEqualToString:@"RMUnifiedTransportPayloadTypeCheckinRequest"] & 1) == 0
       && ![v11 isEqualToString:@"RMUnifiedTransportPayloadTypeCheckinResponse"];
    if (([v11 isEqualToString:@"RMUnifiedTransportPayloadTypeCheckinRequest"] & 1) != 0
      || ([v11 isEqualToString:@"RMUnifiedTransportPayloadTypeCheckinResponse"] & 1) != 0
      || ([v11 isEqualToString:@"RMUnifiedTransportPayloadTypeBlueprints"] & 1) != 0
      || ([v11 isEqualToString:@"RMUnifiedTransportPayloadTypeUsageRequest"] & 1) != 0
      || ([v11 isEqualToString:@"RMUnifiedTransportPayloadTypeUsageResponse"] & 1) != 0
      || [v11 isEqualToString:@"RMUnifiedTransportPayloadTypeFamilySettings"])
    {
      id v14 = v11;
    }
    else
    {
      id v14 = 0;
    }
    v15 = [(STSendPayloadWithIDSTransportOperation *)self destinations];
    v16 = [(STSendPayloadWithIDSTransportOperation *)self payload];
    objc_super v17 = [v16 UUID];
    id v33 = v9;
    v18 = [(STSendPayloadWithIDSTransportOperation *)self _sendData:v8 toDestinations:v15 queueIdentifier:v14 payloadUUID:v17 expectResponse:v13 withError:&v33];
    id v19 = v33;

    if (v18)
    {
      v20 = +[STLog familyMessaging];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = [(STSendPayloadWithIDSTransportOperation *)self payload];
        *(_DWORD *)buf = 136446722;
        v37 = "-[STSendPayloadWithIDSTransportOperation main]";
        __int16 v38 = 2114;
        v39 = v18;
        __int16 v40 = 2114;
        id v41 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[v1] %{public}s: \nSent payload: \nExternalUUID: %{public}@, \npayload: %{public}@", buf, 0x20u);
      }
      [(STSendPayloadWithIDSTransportOperation *)self endOperationWithResultObject:0];
      v22 = +[STLog familyMessaging];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [(STUnifiedTransportPayload *)self->_payload payloadType];
        *(_DWORD *)buf = 136446466;
        v37 = "-[STSendPayloadWithIDSTransportOperation main]";
        __int16 v38 = 2112;
        v39 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nFinished \npayloadType: %@", buf, 0x16u);
      }
    }
    else
    {
      v24 = +[STLog idsTransport];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v32 = [(STSendPayloadWithIDSTransportOperation *)self payload];
        v30 = [v32 UUID];
        v31 = [(STSendPayloadWithIDSTransportOperation *)self payload];
        v27 = [v31 payloadDictionary];
        v28 = [(STSendPayloadWithIDSTransportOperation *)self payload];
        v29 = [v28 userInfo];
        *(_DWORD *)buf = 136447235;
        v37 = "-[STSendPayloadWithIDSTransportOperation main]";
        __int16 v38 = 2114;
        v39 = v30;
        __int16 v40 = 2113;
        id v41 = v27;
        __int16 v42 = 2113;
        v43 = v29;
        __int16 v44 = 2114;
        id v45 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[v1] %{public}s: \nFailed to send payload \nLocalUUID: %{public}@, \npayloadDictionary:%{private}@, \nuserInfo:%{private}@, \nerror:%{public}@", buf, 0x34u);
      }
      [(STSendPayloadWithIDSTransportOperation *)self endOperationWithError:v19];
    }

    id v9 = v19;
  }
  else
  {
    v12 = +[STLog idsTransport];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v25 = [(STSendPayloadWithIDSTransportOperation *)self payload];
      v26 = [v25 payloadType];
      *(_DWORD *)buf = 136446722;
      v37 = "-[STSendPayloadWithIDSTransportOperation main]";
      __int16 v38 = 2114;
      v39 = v26;
      __int16 v40 = 2114;
      id v41 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[v1] %{public}s: \nFailed to generate payload data for payloadType: %{public}@, error %{public}@", buf, 0x20u);
    }
    [(STSendPayloadWithIDSTransportOperation *)self endOperationWithError:v9];
  }

  os_activity_scope_leave(&state);
}

- (id)_sendData:(id)a3 toDestinations:(id)a4 queueIdentifier:(id)a5 payloadUUID:(id)a6 expectResponse:(BOOL)a7 withError:(id *)a8
{
  BOOL v8 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (!v14)
  {
    v62 = +[NSAssertionHandler currentHandler];
    [v62 handleFailureInMethod:a2, self, @"STSendPayloadWithIDSTransportOperation.m", 117, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  if (![v15 count])
  {
    v63 = +[NSAssertionHandler currentHandler];
    [v63 handleFailureInMethod:a2, self, @"STSendPayloadWithIDSTransportOperation.m", 118, @"Invalid parameter not satisfying: %@", @"destinations.count" object file lineNumber description];
  }
  v18 = [(STSendPayloadWithIDSTransportOperation *)self payload];
  id v19 = [v18 userInfo];
  v20 = [v19 objectForKeyedSubscript:@"FromID"];

  if (!v20)
  {
    v64 = +[NSAssertionHandler currentHandler];
    [v64 handleFailureInMethod:a2 object:self file:@"STSendPayloadWithIDSTransportOperation.m" lineNumber:121 description:@"Missing fromID"];
  }
  v67 = self;
  if ([v20 _appearsToBePhoneNumber]) {
    uint64_t v21 = IDSCopyIDForPhoneNumber();
  }
  else {
    uint64_t v21 = IDSCopyIDForEmailAddress();
  }
  v22 = (void *)v21;

  v23 = objc_opt_new();
  v69 = v22;
  [v23 setObject:v22 forKeyedSubscript:IDSSendMessageOptionFromIDKey];
  v24 = IDSGetUUIDData();
  [v23 setObject:v24 forKeyedSubscript:IDSSendMessageOptionUUIDKey];

  [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionCompressPayloadKey];
  v25 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
  [v23 setObject:v25 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

  if (v16) {
    [v23 setObject:v16 forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
  }
  v26 = +[NSNumber numberWithBool:v8];
  [v23 setObject:v26 forKeyedSubscript:IDSSendMessageOptionWantsClientAcknowledgementKey];

  v27 = +[NSNumber numberWithBool:v8];
  [v23 setObject:v27 forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];

  v28 = +[NSNumber numberWithInt:v8 ^ 1];
  [v23 setObject:v28 forKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];

  unint64_t v29 = (unint64_t)[v14 length];
  v30 = +[STLog idsTransport];
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  v70 = v17;
  if (v29 >> 12 <= 0xE)
  {
    if (v31)
    {
      *(_DWORD *)buf = 136446722;
      v76 = "-[STSendPayloadWithIDSTransportOperation _sendData:toDestinations:queueIdentifier:payloadUUID:expectResponse:withError:]";
      __int16 v77 = 2048;
      v78 = (const char *)[v14 length];
      __int16 v79 = 2112;
      id v80 = v15;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nIDS sending as NSData \nsize: %lu bytes \ndestinations: %@", buf, 0x20u);
    }

    v32 = [(STSendPayloadWithIDSTransportOperation *)v67 service];
    id v74 = 0;
    unsigned int v33 = [v32 sendData:v14 toDestinations:v15 priority:300 options:v23 identifier:&v74 error:a8];
    id v34 = v74;

    v35 = +[STLog idsTransport];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = "NO";
      v76 = "-[STSendPayloadWithIDSTransportOperation _sendData:toDestinations:queueIdentifier:payloadUUID:expectResponse:withError:]";
      *(_DWORD *)buf = 136446722;
      if (v33) {
        v36 = "YES";
      }
      __int16 v77 = 2082;
      v78 = v36;
      __int16 v79 = 2112;
      id v80 = v15;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nNSData send \nsuccess: %{public}s, \ndestinations: %@", buf, 0x20u);
    }

    if (v33) {
      v37 = v34;
    }
    else {
      v37 = 0;
    }
    __int16 v38 = v37;

    goto LABEL_45;
  }
  id v65 = v16;
  if (v31)
  {
    *(_DWORD *)buf = 136446722;
    v76 = "-[STSendPayloadWithIDSTransportOperation _sendData:toDestinations:queueIdentifier:payloadUUID:expectResponse:withError:]";
    __int16 v77 = 2048;
    v78 = (const char *)[v14 length];
    __int16 v79 = 2112;
    id v80 = v15;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nIDS sending as file of size: %lu bytes. \ndestinations: %@", buf, 0x20u);
  }
  id v66 = v15;

  v39 = +[NSFileManager defaultManager];
  __int16 v40 = [v39 temporaryDirectory];
  id v41 = +[NSUUID UUID];
  __int16 v42 = [v41 UUIDString];
  v43 = +[NSString stringWithFormat:@"IDS-SendFile-%@", v42];
  __int16 v44 = [v40 URLByAppendingPathComponent:v43];

  id v73 = 0;
  unsigned int v45 = [v14 writeToURL:v44 options:2 error:&v73];
  id v46 = v73;
  if (v45)
  {
    v47 = [(STSendPayloadWithIDSTransportOperation *)v67 service];
    id v72 = 0;
    unsigned int v48 = [v47 sendResourceAtURL:v44 metadata:0 toDestinations:v66 priority:300 options:v23 identifier:&v72 error:a8];
    id v49 = v72;

    v50 = +[STLog idsTransport];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = "NO";
      v76 = "-[STSendPayloadWithIDSTransportOperation _sendData:toDestinations:queueIdentifier:payloadUUID:expectResponse:withError:]";
      *(_DWORD *)buf = 136446722;
      if (v48) {
        v51 = "YES";
      }
      __int16 v77 = 2082;
      v78 = v51;
      __int16 v79 = 2112;
      id v80 = v66;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nIDS file send \nsuccess: %{public}s destinations: %@", buf, 0x20u);
    }

    if (v48) {
      v52 = v49;
    }
    else {
      v52 = 0;
    }
    __int16 v38 = v52;

    id v71 = v46;
    unsigned __int8 v53 = [v39 removeItemAtURL:v44 error:&v71];
    id v54 = v71;

    if ((v53 & 1) == 0)
    {
      v55 = +[STLog idsTransport];
      id v15 = v66;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        sub_100267EA0();
      }

      goto LABEL_43;
    }
  }
  else
  {
    v56 = +[STLog idsTransport];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
      sub_100267F20();
    }

    if (a8)
    {
      id v54 = v46;
      __int16 v38 = 0;
      *a8 = v54;
    }
    else
    {
      __int16 v38 = 0;
      id v54 = v46;
    }
  }
  id v15 = v66;
LABEL_43:

  if (!v45)
  {
    v60 = 0;
    id v16 = v65;
    goto LABEL_52;
  }
  id v16 = v65;
LABEL_45:
  v57 = +[STLog idsTransport];
  v58 = v57;
  if (v38)
  {
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v59 = [v14 length];
      *(_DWORD *)buf = 136446722;
      v76 = "-[STSendPayloadWithIDSTransportOperation _sendData:toDestinations:queueIdentifier:payloadUUID:expectResponse:withError:]";
      __int16 v77 = 2112;
      v78 = v38;
      __int16 v79 = 1024;
      LODWORD(v80) = v59;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nSent data with UUID “%@” size “%d” bytes", buf, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
  {
    sub_100267DC8((uint64_t)v67, v14, v58);
  }

  __int16 v38 = v38;
  v60 = v38;
LABEL_52:

  return v60;
}

- (IDSService)service
{
  return self->_service;
}

- (STUnifiedTransportPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSSet)destinations
{
  return self->_destinations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end