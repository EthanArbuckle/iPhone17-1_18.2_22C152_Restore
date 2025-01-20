@interface MRDIDSService
+ (id)sharedService;
- (BOOL)_sendMessage:(id)a3 device:(id)a4 type:(id)a5 destination:(id)a6 session:(id)a7 options:(id)a8 priority:(int64_t)a9 replyID:(id)a10 response:(id)a11;
- (BOOL)sendMessage:(id)a3 device:(id)a4 type:(id)a5 destination:(id)a6 session:(id)a7 options:(id)a8 priority:(int64_t)a9 response:(id)a10;
- (IDSService)idsService;
- (MRDIDSService)initWithService:(id)a3;
- (NSMutableDictionary)deviceMessageHandlers;
- (NSMutableDictionary)responseHandlers;
- (NSMutableDictionary)totalMessageHandlers;
- (NSString)debugDescription;
- (OS_dispatch_queue)queue;
- (id)_addMessageHandler:(id)a3;
- (id)_addMessageHandlerForDevice:(id)a3 handler:(id)a4;
- (id)addMessageHandler:(id)a3;
- (id)addMessageHandlerForDevice:(id)a3 handler:(id)a4;
- (unint64_t)_generateMessageID;
- (unint64_t)totalOutgoingMessageCount;
- (void)removeHandler:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDeviceMessageHandlers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResponseHandlers:(id)a3;
- (void)setTotalMessageHandlers:(id)a3;
@end

@implementation MRDIDSService

+ (id)sharedService
{
  if (qword_10047DF38 != -1) {
    dispatch_once(&qword_10047DF38, &stru_1004179B0);
  }
  v2 = (void *)qword_10047DF30;

  return v2;
}

- (MRDIDSService)initWithService:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MRDIDSService;
  v3 = [(MRDIDSService *)&v10 init];
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaremote.MRDIDSService", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[IDSService mr_sharedIDSService];
    idsService = v3->_idsService;
    v3->_idsService = (IDSService *)v7;

    [(IDSService *)v3->_idsService addDelegate:v3 queue:v3->_queue];
  }
  return v3;
}

- (NSString)debugDescription
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  v4 = self;
  objc_sync_enter(v4);
  dispatch_queue_t v5 = MRCreateIndentedDebugDescriptionFromObject();
  [v3 appendFormat:@" service=%@\n", v5];

  v6 = [(IDSService *)v4->_idsService devices];
  uint64_t v7 = MRCreateIndentedDebugDescriptionFromArray();
  [v3 appendFormat:@" devices=%@\n", v7];

  v8 = MRCreateIndentedDebugDescriptionFromObject();
  [v3 appendFormat:@" messageHandlers = %@\n", v8];

  v9 = MRCreateIndentedDebugDescriptionFromObject();
  [v3 appendFormat:@" deviceMessageHandlers = %@\n", v9];

  objc_sync_exit(v4);
  [v3 appendFormat:@"}>"];

  return (NSString *)v3;
}

- (id)addMessageHandlerForDevice:(id)a3 handler:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100050E70;
  v9[3] = &unk_1004179D8;
  id v10 = a4;
  id v6 = v10;
  uint64_t v7 = [(MRDIDSService *)self _addMessageHandlerForDevice:a3 handler:v9];

  return v7;
}

- (id)addMessageHandler:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100050F30;
  v7[3] = &unk_100417A00;
  id v8 = a3;
  id v4 = v8;
  dispatch_queue_t v5 = [(MRDIDSService *)self _addMessageHandler:v7];

  return v5;
}

- (id)_addMessageHandlerForDevice:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uniqueIDOverride];
  v9 = self;
  objc_sync_enter(v9);
  deviceMessageHandlers = v9->_deviceMessageHandlers;
  if (!deviceMessageHandlers)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v12 = v9->_deviceMessageHandlers;
    v9->_deviceMessageHandlers = v11;

    deviceMessageHandlers = v9->_deviceMessageHandlers;
  }
  id v13 = [(NSMutableDictionary *)deviceMessageHandlers objectForKeyedSubscript:v8];
  if (!v13)
  {
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)v9->_deviceMessageHandlers setObject:v13 forKeyedSubscript:v8];
  }
  v14 = +[NSNumber numberWithUnsignedInt:arc4random()];
  id v15 = [v7 copy];
  [v13 setObject:v15 forKeyedSubscript:v14];

  objc_sync_exit(v9);

  return v14;
}

- (id)_addMessageHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = self;
  objc_sync_enter(v5);
  if (!v5->_totalMessageHandlers)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    totalMessageHandlers = v5->_totalMessageHandlers;
    v5->_totalMessageHandlers = v6;
  }
  id v8 = +[NSNumber numberWithUnsignedInt:arc4random()];
  id v9 = [v4 copy];
  id v10 = objc_retainBlock(v9);
  [(NSMutableDictionary *)v5->_totalMessageHandlers setObject:v10 forKeyedSubscript:v8];

  objc_sync_exit(v5);

  return v8;
}

- (void)removeHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = self;
  objc_sync_enter(v5);
  deviceMessageHandlers = v5->_deviceMessageHandlers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100051258;
  v8[3] = &unk_100417A28;
  id v7 = v4;
  id v9 = v7;
  [(NSMutableDictionary *)deviceMessageHandlers enumerateKeysAndObjectsUsingBlock:v8];
  [(NSMutableDictionary *)v5->_totalMessageHandlers setObject:0 forKeyedSubscript:v7];

  objc_sync_exit(v5);
}

- (BOOL)sendMessage:(id)a3 device:(id)a4 type:(id)a5 destination:(id)a6 session:(id)a7 options:(id)a8 priority:(int64_t)a9 response:(id)a10
{
  return [(MRDIDSService *)self _sendMessage:a3 device:a4 type:a5 destination:a6 session:a7 options:a8 priority:a9 replyID:0 response:a10];
}

- (BOOL)_sendMessage:(id)a3 device:(id)a4 type:(id)a5 destination:(id)a6 session:(id)a7 options:(id)a8 priority:(int64_t)a9 replyID:(id)a10 response:(id)a11
{
  id v48 = a3;
  id v17 = a4;
  id v49 = a5;
  id v50 = a6;
  id v51 = a7;
  id v45 = a8;
  id v47 = a10;
  id v18 = a11;
  unint64_t v19 = [(MRDIDSService *)self _generateMessageID];
  if (v18)
  {
    v20 = self;
    objc_sync_enter(v20);
    if (!v20->_responseHandlers)
    {
      v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      responseHandlers = v20->_responseHandlers;
      v20->_responseHandlers = v21;
    }
    id v23 = objc_msgSend(v18, "copy", v45);
    id v24 = objc_retainBlock(v23);
    v25 = v20->_responseHandlers;
    v26 = +[NSNumber numberWithUnsignedInteger:v19];
    [(NSMutableDictionary *)v25 setObject:v24 forKeyedSubscript:v26];

    objc_sync_exit(v20);
  }
  id v27 = objc_alloc_init((Class)NSMutableDictionary);
  v28 = +[NSNumber numberWithUnsignedInteger:v19];
  [v27 setObject:v28 forKeyedSubscript:@"messageid"];

  [v27 setObject:v50 forKeyedSubscript:@"destination"];
  [v27 setObject:v51 forKeyedSubscript:@"session"];
  [v27 setObject:v48 forKeyedSubscript:@"data"];
  [v27 setObject:v49 forKeyedSubscript:@"type"];
  [v27 setObject:v47 forKeyedSubscript:@"replyid"];
  v29 = (void *)IDSCopyIDForDevice();
  v30 = _MRLogForCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [v17 uniqueIDOverride];
    v32 = [v17 name];
    *(_DWORD *)buf = 138414338;
    v55 = self;
    __int16 v56 = 2048;
    unint64_t v57 = v19;
    __int16 v58 = 2112;
    v59 = v29;
    __int16 v60 = 2112;
    v61 = v31;
    __int16 v62 = 2112;
    v63 = v32;
    __int16 v64 = 2112;
    id v65 = v48;
    __int16 v66 = 2112;
    id v67 = v49;
    __int16 v68 = 2112;
    id v69 = v50;
    __int16 v70 = 2112;
    id v71 = v51;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[MRDIDSService] %@ Message Sent<%lu>: idsDestination=%@ device=%@:%@ data=%@ type=%@ destination=%@ session=%@", buf, 0x5Cu);
  }
  id v33 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v45];
  uint64_t v34 = IDSSendMessageOptionFireAndForgetKey;
  v35 = [v33 objectForKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];
  BOOL v36 = v35 == 0;

  if (v36)
  {
    [v33 setObject:&__kCFBooleanTrue forKeyedSubscript:v34];
    v37 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v33 setObject:v37 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
  }
  idsService = self->_idsService;
  v39 = +[NSSet setWithObject:](NSSet, "setWithObject:", v29, v45);
  id v52 = 0;
  id v53 = 0;
  unsigned __int8 v40 = [(IDSService *)idsService sendMessage:v27 toDestinations:v39 priority:a9 options:v33 identifier:&v53 error:&v52];
  id v41 = v53;
  id v42 = v52;

  if ((v40 & 1) == 0)
  {
    v43 = _MRLogForCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_10032B410((uint64_t)self, (uint64_t)v42, v43);
    }
  }
  return v40;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v35 = a3;
  id v29 = a4;
  id v12 = a5;
  id v36 = a6;
  id v30 = a7;
  uint64_t v34 = [v12 objectForKeyedSubscript:@"type"];
  id v33 = [v12 objectForKeyedSubscript:@"destination"];
  v32 = [v12 objectForKeyedSubscript:@"session"];
  v38 = [v12 objectForKeyedSubscript:@"data"];
  id v13 = [v12 objectForKeyedSubscript:@"messageid"];
  v14 = [v12 objectForKeyedSubscript:@"replyid"];
  id v15 = [v35 deviceForFromID:v36];
  v37 = [[MRDIDSServiceMessage alloc] initWithID:v13 data:v38 device:v15 service:self];
  v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v15 uniqueIDOverride];
    id v18 = [v15 name];
    *(_DWORD *)buf = 138414338;
    __int16 v60 = self;
    __int16 v61 = 2112;
    __int16 v62 = v13;
    __int16 v63 = 2112;
    __int16 v64 = v38;
    __int16 v65 = 2112;
    __int16 v66 = v17;
    __int16 v67 = 2112;
    __int16 v68 = v18;
    __int16 v69 = 2112;
    __int16 v70 = v34;
    __int16 v71 = 2112;
    v72 = v33;
    __int16 v73 = 2112;
    v74 = v32;
    __int16 v75 = 2112;
    v76 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDIDSService] %@ Message received<%@>: data=%@ device=%@:%@ type=%@ destination=%@ session=%@ replyID=%@", buf, 0x5Cu);
  }
  unint64_t v19 = [v15 uniqueIDOverride];
  v20 = self;
  objc_sync_enter(v20);
  v31 = [(NSMutableDictionary *)v20->_totalMessageHandlers allValues];
  v21 = [(NSMutableDictionary *)v20->_deviceMessageHandlers objectForKeyedSubscript:v19];
  v22 = [v21 allValues];

  if (v14)
  {
    id v23 = [(NSMutableDictionary *)v20->_responseHandlers objectForKeyedSubscript:v14];
  }
  else
  {
    id v23 = 0;
  }
  objc_sync_exit(v20);

  if (v23)
  {
    queue = v20->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100051CD0;
    block[3] = &unk_100417A50;
    v25 = &v58;
    id v58 = v23;
    v26 = (id *)&v57;
    unint64_t v57 = v37;
    dispatch_async(queue, block);
LABEL_12:

    goto LABEL_13;
  }
  if ([v31 count])
  {
    id v27 = v20->_queue;
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100051CE4;
    v47[3] = &unk_100417AA0;
    id v48 = v31;
    id v49 = v37;
    id v50 = v15;
    id v51 = v34;
    id v52 = v33;
    id v53 = v32;
    id v54 = v13;
    id v55 = v14;
    dispatch_async(v27, v47);
  }
  if ([v22 count])
  {
    v28 = v20->_queue;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100051E0C;
    v39[3] = &unk_100417AF0;
    id v40 = v22;
    id v41 = v37;
    id v42 = v34;
    id v43 = v33;
    id v44 = v32;
    id v45 = v13;
    id v46 = v14;
    dispatch_async(v28, v39);

    v25 = &v40;
    v26 = (id *)&v41;
    goto LABEL_12;
  }
LABEL_13:
}

- (unint64_t)_generateMessageID
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_totalOutgoingMessageCount + 1;
  v2->_totalOutgoingMessageCount = v3;
  objc_sync_exit(v2);

  return v3;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setResponseHandlers:(id)a3
{
}

- (NSMutableDictionary)deviceMessageHandlers
{
  return self->_deviceMessageHandlers;
}

- (void)setDeviceMessageHandlers:(id)a3
{
}

- (NSMutableDictionary)totalMessageHandlers
{
  return self->_totalMessageHandlers;
}

- (void)setTotalMessageHandlers:(id)a3
{
}

- (unint64_t)totalOutgoingMessageCount
{
  return self->_totalOutgoingMessageCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalMessageHandlers, 0);
  objc_storeStrong((id *)&self->_deviceMessageHandlers, 0);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

@end