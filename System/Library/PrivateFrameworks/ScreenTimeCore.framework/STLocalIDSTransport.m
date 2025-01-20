@interface STLocalIDSTransport
- (IDSService)service;
- (OS_dispatch_queue)serviceQueue;
- (STLocalIDSTransport)init;
- (STLocalIDSTransportDelegate)delegate;
- (STLocalIDSTransportReachabilityDelegate)reachabilityDelegate;
- (void)sendPayload:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setReachabilityDelegate:(id)a3;
@end

@implementation STLocalIDSTransport

- (STLocalIDSTransport)init
{
  v11.receiver = self;
  v11.super_class = (Class)STLocalIDSTransport;
  v2 = [(STLocalIDSTransport *)&v11 init];
  v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.screentimelocal"];
  service = v2->_service;
  v2->_service = v3;

  v5 = (const char *)[@"com.apple.ScreenTimeAgent.local-ids-service" UTF8String];
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
  serviceQueue = v2->_serviceQueue;
  v2->_serviceQueue = (OS_dispatch_queue *)v7;

  [(IDSService *)v2->_service addDelegate:v2 queue:v2->_serviceQueue];
  v9 = +[STLog idsTransport];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v13 = "-[STLocalIDSTransport init]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[local] %{public}s: \nLocal transport initialized", buf, 0xCu);
  }

  return v2;
}

- (void)sendPayload:(id)a3
{
  id v4 = a3;
  v5 = +[STLog familyMessaging];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 payloadType];
    dispatch_queue_t v7 = [v4 destinations];
    *(_DWORD *)buf = 136446722;
    v36 = "-[STLocalIDSTransport sendPayload:]";
    __int16 v37 = 2112;
    v38 = v6;
    __int16 v39 = 2114;
    id v40 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[local] %{public}s: \npayloadType: %@, \ndestinations: %{public}@", buf, 0x20u);
  }
  v8 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v9 = [(STLocalIDSTransport *)self service];
  v10 = [v9 devices];

  id v11 = [v10 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v31 + 1) + 8 * (void)v14) isLocallyPaired])
        {
          v15 = (void *)IDSCopyIDForDevice();
          [v8 addObject:v15];
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v12);
  }

  if ([v8 count])
  {
    id v30 = 0;
    v16 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v30];
    v17 = v30;
    if (!v16)
    {
      v18 = +[STLog idsTransport];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        sub_1002612D0(v4, (uint64_t)v17, v18);
      }
      v22 = v17;
      goto LABEL_25;
    }
    v18 = objc_opt_new();
    [v18 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionCompressPayloadKey];
    [v18 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionWantsClientAcknowledgementKey];
    v19 = [(STLocalIDSTransport *)self service];
    v28 = v17;
    id v29 = 0;
    unsigned int v20 = [v19 sendData:v16 toDestinations:v8 priority:300 options:v18 identifier:&v29 error:&v28];
    v21 = v29;
    v22 = v28;

    v23 = +[STLog idsTransport];
    v24 = v23;
    if (v20)
    {
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v25 = [v4 payloadType];
      id v26 = [v16 length];
      *(_DWORD *)buf = 136446978;
      v36 = "-[STLocalIDSTransport sendPayload:]";
      __int16 v37 = 2112;
      v38 = v25;
      __int16 v39 = 2048;
      id v40 = v26;
      __int16 v41 = 2114;
      v42 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[local] %{public}s: \nForwarded payload to local transport \npayloadType: %@, \npayloadData.length: %lu, \nreturnUUID: %{public}@", buf, 0x2Au);
    }
    else
    {
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        goto LABEL_24;
      }
      v25 = [v4 payloadType];
      id v27 = [v16 length];
      *(_DWORD *)buf = 136446978;
      v36 = "-[STLocalIDSTransport sendPayload:]";
      __int16 v37 = 2112;
      v38 = v25;
      __int16 v39 = 2048;
      id v40 = v27;
      __int16 v41 = 2114;
      v42 = v22;
      _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "[local] %{public}s: \nFailed to send payload data, \npayloadType: %@, \npayloadData.length:%lu, \nerror: %{public}@", buf, 0x2Au);
    }

    goto LABEL_24;
  }
  v22 = +[STLog idsTransport];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_100261230(v4, v22);
  }
LABEL_26:
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9 = a5;
  id v10 = a6;
  id v21 = 0;
  id v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v21];
  id v12 = v21;
  uint64_t v13 = +[STLog idsTransport];
  v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v11 payloadType];
      id v16 = [v9 length];
      *(_DWORD *)buf = 136446722;
      v24 = "-[STLocalIDSTransport service:account:incomingData:fromID:context:]";
      __int16 v25 = 2112;
      id v26 = v15;
      __int16 v27 = 2048;
      id v28 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[local]: %{public}s: \nreceived payload, \npayloadType: %@, \ndata.length: %lu", buf, 0x20u);
    }
    v17 = [v11 userInfo];
    [v17 setObject:v10 forKeyedSubscript:@"altURI"];

    id v18 = objc_alloc((Class)STUnifiedTransportPayloadDestination);
    v14 = [v18 initWithAddress:v10 type:STUnifiedTransportPayloadDestinationTypePairedDevice];
    v22 = v14;
    v19 = +[NSArray arrayWithObjects:&v22 count:1];
    [v11 setDestinations:v19];

    unsigned int v20 = [(STLocalIDSTransport *)self delegate];
    [v20 localTransport:self didReceivePayload:v11];
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    sub_100261388((uint64_t)v12, v14);
  }
}

- (STLocalIDSTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STLocalIDSTransportDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (STLocalIDSTransportReachabilityDelegate)reachabilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reachabilityDelegate);
  return (STLocalIDSTransportReachabilityDelegate *)WeakRetained;
}

- (void)setReachabilityDelegate:(id)a3
{
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)serviceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_reachabilityDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end