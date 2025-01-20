@interface DataStreamSetupOperation
+ (id)hapSetupOperationWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6 maxControllerTransportMTU:(unint64_t)a7 setupOperationReadRequired:(BOOL)a8;
- (BOOL)removeBulkSendListener:(id)a3;
- (DataStreamSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6;
- (DataStreamSetupOperationDelegate)delegate;
- (HAPAccessory)accessory;
- (HAPService)transferManagementService;
- (NSMutableSet)pendingBulkSendListeners;
- (NSString)logIdentifier;
- (OS_dispatch_queue)queue;
- (void)_clearPendingBulkSendListeners;
- (void)addBulkSendListener:(id)a3 fileType:(id)a4;
- (void)continueStreamSetupWithResponse:(id)a3;
- (void)dealloc;
- (void)movePendingBulkSendListenersToBulkSendProtocol:(id)a3;
- (void)postDidFailWithError:(id)a3;
- (void)postDidSucceedWithTransport:(id)a3 sessionEncryption:(id)a4;
- (void)processTransportSetupResponse:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startSetup;
@end

@implementation DataStreamSetupOperation

+ (id)hapSetupOperationWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6 maxControllerTransportMTU:(unint64_t)a7 setupOperationReadRequired:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[DataStreamHAPSetupOperation alloc] initWithAccessory:v16 queue:v15 logIdentifier:v14 transferManagementService:v13 maxControllerTransportMTU:a7 setupOperationReadRequired:v8];

  return v17;
}

- (DataStreamSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)DataStreamSetupOperation;
  id v15 = [(DataStreamSetupOperation *)&v20 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accessory, a3);
    objc_storeStrong((id *)&v16->_queue, a4);
    objc_storeStrong((id *)&v16->_logIdentifier, a5);
    objc_storeStrong((id *)&v16->_transferManagementService, a6);
    uint64_t v17 = +[NSMutableSet set];
    pendingBulkSendListeners = v16->_pendingBulkSendListeners;
    v16->_pendingBulkSendListeners = (NSMutableSet *)v17;
  }
  return v16;
}

- (void)dealloc
{
  [(DataStreamSetupOperation *)self _clearPendingBulkSendListeners];
  v3.receiver = self;
  v3.super_class = (Class)DataStreamSetupOperation;
  [(DataStreamSetupOperation *)&v3 dealloc];
}

- (void)postDidFailWithError:(id)a3
{
  id v4 = a3;
  v5 = [(DataStreamSetupOperation *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003144C;
  v7[3] = &unk_100273040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)postDidSucceedWithTransport:(id)a3 sessionEncryption:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DataStreamSetupOperation *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031578;
  block[3] = &unk_100273418;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)continueStreamSetupWithResponse:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = sub_100083FD0(v5);
    *(_DWORD *)buf = 138543362;
    v53 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@[Start Stream] Parsing accessory response", buf, 0xCu);
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v49;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v49 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
      id v14 = [v13 characteristic];
      id v15 = [v14 type];
      unsigned __int8 v16 = [v15 isEqualToString:@"00000131-0000-1000-8000-4D69736D6574"];

      if (v16) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v17 = v13;

    if (!v17) {
      goto LABEL_17;
    }
    v18 = [v17 error];

    if (v18)
    {
      v19 = v5;
      objc_super v20 = sub_100083F74();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = sub_100083FD0(v19);
        v22 = [v17 error];
        *(_DWORD *)buf = 138543618;
        v53 = v21;
        __int16 v54 = 2112;
        id v55 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply errored out: %@", buf, 0x16u);
      }
      v23 = [v17 error];
      [(DataStreamSetupOperation *)v19 postDidFailWithError:v23];

      goto LABEL_20;
    }
    v27 = [v17 value];
    id v47 = 0;
    v28 = +[HAPDataStreamTransportSetupResponse parsedFromData:v27 error:&v47];
    id v29 = v47;

    if (v29 || !v28)
    {
      v34 = v5;
      v35 = sub_100083F74();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = sub_100083FD0(v34);
        *(_DWORD *)buf = 138543618;
        v53 = v36;
        __int16 v54 = 2112;
        id v55 = v29;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply could not be parsed (error=%@)", buf, 0x16u);
      }
      v37 = +[NSError dkErrorWithCode:36];
      [(DataStreamSetupOperation *)v34 postDidFailWithError:v37];

      goto LABEL_42;
    }
    v30 = [v28 status];

    if (!v30)
    {
      v38 = v5;
      v39 = sub_100083F74();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = sub_100083FD0(v38);
        *(_DWORD *)buf = 138543362;
        v53 = v40;
        v41 = "%{public}@[Start Stream] The setup transfer write reply did not have status";
LABEL_32:
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);
      }
LABEL_33:

      id v29 = +[NSError dkErrorWithCode:36];
LABEL_41:
      [(DataStreamSetupOperation *)v38 postDidFailWithError:v29];
LABEL_42:

LABEL_43:
      goto LABEL_20;
    }
    v31 = [v28 status];
    id v32 = [v31 value];
    if (v32 == (id)1)
    {
      uint64_t v33 = 10;
    }
    else
    {
      if (v32 != (id)2)
      {
        id v29 = 0;
LABEL_37:

        if (v29)
        {
          v38 = v5;
          v42 = sub_100083F74();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v43 = sub_100083FD0(v38);
            v44 = [v28 status];
            v45 = HAPDataStreamTransportCommandStatusAsString((unint64_t)[v44 value]);
            *(_DWORD *)buf = 138543618;
            v53 = v43;
            __int16 v54 = 2112;
            id v55 = v45;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write failed with status %@", buf, 0x16u);
          }
          goto LABEL_41;
        }
        v46 = [v28 parameters];

        if (v46)
        {
          [(DataStreamSetupOperation *)v5 processTransportSetupResponse:v28];
          goto LABEL_43;
        }
        v38 = v5;
        v39 = sub_100083F74();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = sub_100083FD0(v38);
          *(_DWORD *)buf = 138543362;
          v53 = v40;
          v41 = "%{public}@[Start Stream] The setup transfer write reply did not contain setup parameters";
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      uint64_t v33 = 21;
    }
    id v29 = +[NSError dkErrorWithCode:v33];
    goto LABEL_37;
  }
LABEL_11:

LABEL_17:
  v24 = v5;
  v25 = sub_100083F74();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = sub_100083FD0(v24);
    *(_DWORD *)buf = 138543362;
    v53 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply does not contain a response", buf, 0xCu);
  }
  id v17 = +[NSError dkErrorWithCode:36];
  [(DataStreamSetupOperation *)v24 postDidFailWithError:v17];
LABEL_20:
}

- (void)_clearPendingBulkSendListeners
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v3 = [(DataStreamSetupOperation *)self pendingBulkSendListeners];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v7) listener];
        if (v8)
        {
          id v9 = [(DataStreamSetupOperation *)self accessory];
          [v8 accessoryDidCloseDataStream:v9];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v10 = [(DataStreamSetupOperation *)self pendingBulkSendListeners];
  [v10 removeAllObjects];
}

- (void)startSetup
{
  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[DataStreamSetupOperation startSetup]");
  id v3 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v2 userInfo:0];

  objc_exception_throw(v3);
}

- (void)processTransportSetupResponse:(id)a3
{
  id v3 = a3;
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s must be overridden in a subclass/category", "-[DataStreamSetupOperation processTransportSetupResponse:]");
  id v5 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)addBulkSendListener:(id)a3 fileType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DataStreamSetupOperation *)self queue];
  dispatch_assert_queue_V2(v8);

  id v10 = [[DKPendingBulkSendListener alloc] initWithListener:v7 fileType:v6];
  id v9 = [(DataStreamSetupOperation *)self pendingBulkSendListeners];
  [v9 addObject:v10];
}

- (BOOL)removeBulkSendListener:(id)a3
{
  id v4 = a3;
  id v5 = [(DataStreamSetupOperation *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(DataStreamSetupOperation *)self pendingBulkSendListeners];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 listener];

        if (v12 == v4)
        {
          long long v14 = [(DataStreamSetupOperation *)self pendingBulkSendListeners];
          [v14 removeObject:v11];

          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)movePendingBulkSendListenersToBulkSendProtocol:(id)a3
{
  id v4 = a3;
  id v5 = [(DataStreamSetupOperation *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(DataStreamSetupOperation *)self pendingBulkSendListeners];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 listener];
        if (v12)
        {
          BOOL v13 = [v11 fileType];
          [v4 addListener:v12 fileType:v13];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  long long v14 = [(DataStreamSetupOperation *)self pendingBulkSendListeners];
  [v14 removeAllObjects];
}

- (DataStreamSetupOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DataStreamSetupOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HAPAccessory)accessory
{
  return self->_accessory;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (HAPService)transferManagementService
{
  return self->_transferManagementService;
}

- (NSMutableSet)pendingBulkSendListeners
{
  return self->_pendingBulkSendListeners;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBulkSendListeners, 0);
  objc_storeStrong((id *)&self->_transferManagementService, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessory, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end