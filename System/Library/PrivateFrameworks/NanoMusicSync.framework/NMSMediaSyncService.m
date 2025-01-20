@interface NMSMediaSyncService
- (BOOL)_sendUrgentServiceResponseWithError:(id)a3 idsMessageID:(id)a4 timeout:(double)a5;
- (BOOL)_sendUrgentServiceResultMessage:(id)a3 idsMessageID:(id)a4 timeout:(double)a5;
- (Class)_modelClassForContainerType:(int)a3;
- (NMSMediaSyncService)init;
- (id)_defaultPairedDevice;
- (id)_idsMessageOptionsWithTimeout:(double)a3;
- (id)_midDataFromModelObject:(id)a3;
- (id)_sendUrgentMessage:(id)a3 messageType:(int64_t)a4 timeout:(double)a5 completion:(id)a6;
- (id)_sendUrgentProtoBufForMessage:(id)a3 messageType:(int64_t)a4 timeout:(double)a5 error:(id *)a6;
- (int)_containerTypeForModelObject:(id)a3;
- (int)_convertMPModelObjectKeepLocalEnableState:(int64_t)a3;
- (int)_convertNMSKeepLocalRequestCellularPolicy:(unint64_t)a3;
- (int)_convertNMSKeepLocalRequestPowerPolicy:(unint64_t)a3;
- (int)_nmsQOSFromNSQOS:(int64_t)a3;
- (int64_t)_convertMediaSyncServiceKeepLocalEnableState:(int)a3;
- (int64_t)_nsQOSFromNMSQOS:(int)a3;
- (unint64_t)_convertMediaSyncServiceKeepLocalCellularPolicy:(int)a3;
- (unint64_t)_convertMediaSyncServiceKeepLocalPowerPolicy:(int)a3;
- (unint64_t)_nmsKeepLocalExceptionFromNMSSyncServiceException:(int)a3;
- (void)_callAndRemoveKeepLocalCompletionWithIDSMessageID:(id)a3 error:(id)a4;
- (void)_cleanupKeepLocalCompletionWithID:(id)a3;
- (void)_handleMediaSyncServiceKeepLocalRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_handleMediaSyncServiceKeepLocalResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_performFailSafeWithIDSMessageIdentifier:(id)a3 timeout:(double)a4;
- (void)_setMessage:(id)a3 withValidatorException:(unint64_t)a4;
- (void)_setProtobufHandlers;
- (void)dealloc;
- (void)performKeepLocalRequestWithEnableState:(int64_t)a3 modelObject:(id)a4 options:(id)a5 completion:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation NMSMediaSyncService

- (NMSMediaSyncService)init
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)NMSMediaSyncService;
  v2 = [(NMSMediaSyncService *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.nanomediasync"];
    service = v2->_service;
    v2->_service = (IDSService *)v3;

    [(NMSMediaSyncService *)v2 _setProtobufHandlers];
    v5 = NSString;
    v6 = [MEMORY[0x263F086E0] mainBundle];
    v7 = [v6 bundleIdentifier];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v10 = [v5 stringWithFormat:@"%@.%@.idsActionHandlerQueue", v7, v9];
    v11 = (const char *)[v10 UTF8String];

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v14 = dispatch_queue_create(v11, v13);
    idsActionHandlerQueue = v2->_idsActionHandlerQueue;
    v2->_idsActionHandlerQueue = (OS_dispatch_queue *)v14;

    [(IDSService *)v2->_service addDelegate:v2 queue:v2->_idsActionHandlerQueue];
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    keepLocalCompletionsByIDSMsgID = v2->_keepLocalCompletionsByIDSMsgID;
    v2->_keepLocalCompletionsByIDSMsgID = v16;
  }
  v18 = NMLogForCategory(5);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = v2;
    _os_log_impl(&dword_2228FD000, v18, OS_LOG_TYPE_DEFAULT, "NMSMediaSyncService - init: %p", buf, 0xCu);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "NMSMediaSyncService - dealloc: %p", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NMSMediaSyncService;
  [(NMSMediaSyncService *)&v4 dealloc];
}

- (void)performKeepLocalRequestWithEnableState:(int64_t)a3 modelObject:(id)a4 options:(id)a5 completion:(id)a6
{
  id v24 = a5;
  id v10 = a6;
  id v11 = a4;
  v12 = objc_alloc_init(NMSMediaSyncServiceKeepLocalRequest);
  [(NMSMediaSyncServiceKeepLocalRequest *)v12 setEnableState:[(NMSMediaSyncService *)self _convertMPModelObjectKeepLocalEnableState:a3]];
  v13 = objc_alloc_init(NMSMediaSyncServiceModelObject);
  dispatch_queue_t v14 = [(NMSMediaSyncService *)self _midDataFromModelObject:v11];
  [(NMSMediaSyncServiceModelObject *)v13 setDataMultiverseID:v14];

  uint64_t v15 = [(NMSMediaSyncService *)self _containerTypeForModelObject:v11];
  [(NMSMediaSyncServiceModelObject *)v13 setContainerType:v15];
  [(NMSMediaSyncServiceKeepLocalRequest *)v12 setModelObject:v13];
  v16 = v24;
  if (v24)
  {
    v17 = objc_alloc_init(NMSMediaSyncServiceKeepLocalOptions);
    -[NMSMediaSyncServiceKeepLocalOptions setRequiresValidation:](v17, "setRequiresValidation:", [v24 requiresValidation]);
    v18 = [v24 cellularBundleIdentifier];
    [(NMSMediaSyncServiceKeepLocalOptions *)v17 setCellularBundleIdentifier:v18];

    -[NMSMediaSyncServiceKeepLocalOptions setDownloadOnCellularPolicy:](v17, "setDownloadOnCellularPolicy:", -[NMSMediaSyncService _convertNMSKeepLocalRequestCellularPolicy:](self, "_convertNMSKeepLocalRequestCellularPolicy:", [v24 cellularPolicy]));
    -[NMSMediaSyncServiceKeepLocalOptions setDownloadOffPowerPolicy:](v17, "setDownloadOffPowerPolicy:", -[NMSMediaSyncService _convertNMSKeepLocalRequestPowerPolicy:](self, "_convertNMSKeepLocalRequestPowerPolicy:", [v24 powerPolicy]));
    -[NMSMediaSyncServiceKeepLocalOptions setQualityOfService:](v17, "setQualityOfService:", -[NMSMediaSyncService _nmsQOSFromNSQOS:](self, "_nmsQOSFromNSQOS:", [v24 qualityOfService]));
    [v24 timeout];
    [(NMSMediaSyncServiceKeepLocalOptions *)v17 setTimeout:"setTimeout:"];
    [(NMSMediaSyncServiceKeepLocalRequest *)v12 setOptions:v17];

    v16 = v24;
  }
  [v16 timeout];
  if (v19 <= 0.0)
  {
    double v21 = *MEMORY[0x263F49E68];
  }
  else
  {
    [v24 timeout];
    double v21 = v20;
  }
  uint64_t v22 = [(NMSMediaSyncService *)self _sendUrgentMessage:v12 messageType:1 timeout:v10 completion:v21];
  uint64_t v23 = (void *)v22;
  if (v10 && v22) {
    [(NMSMediaSyncService *)self _performFailSafeWithIDSMessageIdentifier:v22 timeout:v21];
  }
}

- (int)_containerTypeForModelObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Unsupported model type. Not allowed." userInfo:0];
      objc_exception_throw(v6);
    }
    int v4 = 1;
  }

  return v4;
}

- (id)_midDataFromModelObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = (void *)MEMORY[0x263F573E8];
    v5 = NSNumber;
    id v6 = [v3 identifiers];
    uint64_t v7 = [v6 library];
    v8 = objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    uint64_t v9 = [v4 midDataFromAlbumPID:v8];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v14 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Unsupported model type. Not allowed." userInfo:0];
      objc_exception_throw(v14);
    }
    id v10 = (void *)MEMORY[0x263F573E8];
    id v11 = NSNumber;
    id v6 = [v3 identifiers];
    uint64_t v7 = [v6 library];
    v8 = objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v7, "persistentID"));
    uint64_t v9 = [v10 midDataFromPlaylistPID:v8];
  }
  v12 = (void *)v9;

  return v12;
}

- (void)_performFailSafeWithIDSMessageIdentifier:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  idsActionHandlerQueue = self->_idsActionHandlerQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__NMSMediaSyncService__performFailSafeWithIDSMessageIdentifier_timeout___block_invoke;
  v10[3] = &unk_264634388;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v7, idsActionHandlerQueue, v10);
}

uint64_t __72__NMSMediaSyncService__performFailSafeWithIDSMessageIdentifier_timeout___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupKeepLocalCompletionWithID:*(void *)(a1 + 40)];
}

- (void)_cleanupKeepLocalCompletionWithID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsActionHandlerQueue);
  v5 = [(NSMutableDictionary *)self->_keepLocalCompletionsByIDSMsgID objectForKey:v4];
  if (v5)
  {
    id v6 = NMLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NMSMediaSyncService _cleanupKeepLocalCompletionWithID:]();
    }

    dispatch_time_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"NMSKeepLocalRequestErrorDomain" code:2 userInfo:0];
    ((void (**)(void, void *))v5)[2](v5, v7);
    [(NSMutableDictionary *)self->_keepLocalCompletionsByIDSMsgID removeObjectForKey:v4];
  }
}

- (id)_sendUrgentMessage:(id)a3 messageType:(int64_t)a4 timeout:(double)a5 completion:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v26 = 0;
  id v11 = [(NMSMediaSyncService *)self _sendUrgentProtoBufForMessage:a3 messageType:a4 timeout:&v26 error:a5];
  id v12 = v26;
  v13 = v12;
  if (v10)
  {
    if (v11)
    {
      id v14 = NMLogForCategory(5);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = (void *)MEMORY[0x223CA14E0](v10);
        uint64_t v16 = [(NSMutableDictionary *)self->_keepLocalCompletionsByIDSMsgID count];
        *(_DWORD *)buf = 134218498;
        v30 = v15;
        __int16 v31 = 2112;
        v32 = v11;
        __int16 v33 = 2048;
        uint64_t v34 = v16;
        _os_log_impl(&dword_2228FD000, v14, OS_LOG_TYPE_DEFAULT, "Adding completion-handler %p for ID=%@. Total-pending: %lu", buf, 0x20u);
      }
      idsActionHandlerQueue = self->_idsActionHandlerQueue;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __73__NMSMediaSyncService__sendUrgentMessage_messageType_timeout_completion___block_invoke;
      v23[3] = &unk_2646346C0;
      v23[4] = self;
      id v25 = v10;
      id v24 = v11;
      dispatch_async(idsActionHandlerQueue, v23);
    }
    else
    {
      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F08608];
      id v28 = v12;
      double v19 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      double v20 = [v18 errorWithDomain:@"NMSKeepLocalRequestErrorDomain" code:0 userInfo:v19];

      (*((void (**)(id, void *))v10 + 2))(v10, v20);
      double v21 = NMLogForCategory(5);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[NMSMediaSyncService _sendUrgentMessage:messageType:timeout:completion:](v21);
      }
    }
  }

  return v11;
}

void __73__NMSMediaSyncService__sendUrgentMessage_messageType_timeout_completion___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 24);
  id v3 = (id)MEMORY[0x223CA14E0](a1[6]);
  [v2 setObject:v3 forKey:a1[5]];
}

- (id)_sendUrgentProtoBufForMessage:(id)a3 messageType:(int64_t)a4 timeout:(double)a5 error:(id *)a6
{
  unsigned __int16 v8 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = objc_alloc(MEMORY[0x263F4A098]);
  id v12 = [v10 data];
  v13 = (void *)[v11 initWithProtobufData:v12 type:v8 isResponse:0];

  id v14 = [(NMSMediaSyncService *)self _defaultPairedDevice];
  service = self->_service;
  uint64_t v16 = (void *)MEMORY[0x263EFFA08];
  v17 = (void *)IDSCopyIDForDevice();
  v18 = [v16 setWithObject:v17];
  double v19 = [(NMSMediaSyncService *)self _idsMessageOptionsWithTimeout:a5];
  id v26 = 0;
  char v20 = [(IDSService *)service sendProtobuf:v13 toDestinations:v18 priority:300 options:v19 identifier:&v26 error:a6];
  id v21 = v26;

  uint64_t v22 = NMLogForCategory(5);
  uint64_t v23 = v22;
  if (v20)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v10;
      __int16 v29 = 2112;
      id v30 = v21;
      _os_log_impl(&dword_2228FD000, v23, OS_LOG_TYPE_DEFAULT, "Successfully requested send of IDS message (%@) with ID: %@.", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    if (a6) {
      id v25 = *a6;
    }
    else {
      id v25 = 0;
    }
    *(_DWORD *)buf = 138412802;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = v21;
    __int16 v31 = 2112;
    id v32 = v25;
    _os_log_error_impl(&dword_2228FD000, v23, OS_LOG_TYPE_ERROR, "Failed to request send of IDS message (%@) with ID: %@. Error: %@", buf, 0x20u);
  }

  return v21;
}

- (id)_idsMessageOptionsWithTimeout:(double)a3
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = *MEMORY[0x263F49F80];
  id v3 = [NSNumber numberWithDouble:a3];
  uint64_t v4 = *MEMORY[0x263F49F08];
  v9[0] = v3;
  v9[1] = MEMORY[0x263EFFA88];
  uint64_t v5 = *MEMORY[0x263F49EE8];
  v8[1] = v4;
  v8[2] = v5;
  v9[2] = MEMORY[0x263EFFA88];
  id v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)_defaultPairedDevice
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(IDSService *)self->_service devices];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isDefaultPairedDevice])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_setProtobufHandlers
{
  [(IDSService *)self->_service setProtobufAction:sel__handleMediaSyncServiceKeepLocalRequest_service_account_fromID_context_ forIncomingRequestsOfType:1];
  service = self->_service;

  [(IDSService *)service setProtobufAction:sel__handleMediaSyncServiceKeepLocalResponse_service_account_fromID_context_ forIncomingRequestsOfType:2];
}

- (BOOL)_sendUrgentServiceResultMessage:(id)a3 idsMessageID:(id)a4 timeout:(double)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  long long v10 = [(NMSMediaSyncService *)self _defaultPairedDevice];
  long long v11 = [(NMSMediaSyncService *)self _idsMessageOptionsWithTimeout:a5];
  id v12 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v11];
  [v12 setObject:v9 forKey:*MEMORY[0x263F49F40]];

  uint64_t v13 = NMLogForCategory(5);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v10;
    _os_log_impl(&dword_2228FD000, v13, OS_LOG_TYPE_DEFAULT, "Sending validation result IDS message to default paired device: %@", buf, 0xCu);
  }

  service = self->_service;
  uint64_t v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = (void *)IDSCopyIDForDevice();
  v17 = [v15 setWithObject:v16];
  id v24 = 0;
  id v25 = 0;
  char v18 = [(IDSService *)service sendProtobuf:v8 toDestinations:v17 priority:300 options:v12 identifier:&v25 error:&v24];
  id v19 = v25;
  id v20 = v24;

  id v21 = NMLogForCategory(5);
  uint64_t v22 = v21;
  if (v18)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v8;
      __int16 v28 = 2112;
      id v29 = v19;
      _os_log_impl(&dword_2228FD000, v22, OS_LOG_TYPE_DEFAULT, "Successfully requested send of IDS message (%@) with ID: %@.", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v19;
    __int16 v30 = 2112;
    id v31 = v20;
    _os_log_error_impl(&dword_2228FD000, v22, OS_LOG_TYPE_ERROR, "Failed to request send of IDS message (%@) with ID: %@. Error: %@", buf, 0x20u);
  }

  return v18;
}

- (BOOL)_sendUrgentServiceResponseWithError:(id)a3 idsMessageID:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = objc_opt_new();
  long long v11 = v10;
  if (v8)
  {
    [v10 setErrorCode:0];
    id v12 = [v8 domain];
    int v13 = [v12 isEqualToString:@"NMSKeepLocalRequestErrorDomain"];

    if (!v13)
    {
      id v14 = NMLogForCategory(5);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NMSMediaSyncService _sendUrgentServiceResponseWithError:idsMessageID:timeout:]();
      }
      goto LABEL_7;
    }
    if ([v8 code] == 1)
    {
      [v11 setErrorCode:1];
      id v14 = [v8 userInfo];
      uint64_t v15 = [v14 objectForKey:@"NMSKeepLocalRequestErrorValidatorExceptionKey"];
      -[NMSMediaSyncService _setMessage:withValidatorException:](self, "_setMessage:withValidatorException:", v11, [v15 unsignedIntegerValue]);

LABEL_7:
    }
  }
  id v16 = objc_alloc(MEMORY[0x263F4A098]);
  v17 = [v11 data];
  char v18 = (void *)[v16 initWithProtobufData:v17 type:2 isResponse:0];

  BOOL v19 = [(NMSMediaSyncService *)self _sendUrgentServiceResultMessage:v18 idsMessageID:v9 timeout:a5];
  return v19;
}

- (void)_setMessage:(id)a3 withValidatorException:(unint64_t)a4
{
  id v5 = a3;
  if (!a4) {
    goto LABEL_9;
  }
  id v6 = v5;
  if ((a4 & 2) != 0)
  {
    [v5 addValidatorException:1];
    id v5 = v6;
    if ((a4 & 4) == 0)
    {
LABEL_4:
      if ((a4 & 0x40) == 0) {
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }
  else if ((a4 & 4) == 0)
  {
    goto LABEL_4;
  }
  [v6 addValidatorException:2];
  id v5 = v6;
  if ((a4 & 0x40) == 0)
  {
LABEL_5:
    if ((a4 & 8) == 0) {
      goto LABEL_6;
    }
LABEL_15:
    [v6 addValidatorException:3];
    id v5 = v6;
    if ((a4 & 0x10) == 0)
    {
LABEL_7:
      if ((a4 & 0x20) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_14:
  [v6 addValidatorException:6];
  id v5 = v6;
  if ((a4 & 8) != 0) {
    goto LABEL_15;
  }
LABEL_6:
  if ((a4 & 0x10) == 0) {
    goto LABEL_7;
  }
LABEL_16:
  [v6 addValidatorException:4];
  id v5 = v6;
  if ((a4 & 0x20) != 0)
  {
LABEL_8:
    [v6 addValidatorException:5];
    id v5 = v6;
  }
LABEL_9:
}

- (Class)_modelClassForContainerType:(int)a3
{
  if (a3 > 1)
  {
    id v5 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Unsupported container type specified." userInfo:0];
    objc_exception_throw(v5);
  }
  id v3 = objc_opt_class();

  return (Class)v3;
}

- (void)_callAndRemoveKeepLocalCompletionWithIDSMessageID:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsActionHandlerQueue);
  uint64_t v8 = [(NSMutableDictionary *)self->_keepLocalCompletionsByIDSMsgID objectForKey:v6];
  id v9 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v7);
    [(NSMutableDictionary *)self->_keepLocalCompletionsByIDSMsgID removeObjectForKey:v6];
    long long v10 = NMLogForCategory(5);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = (void *)MEMORY[0x223CA14E0](v9);
      uint64_t v12 = [(NSMutableDictionary *)self->_keepLocalCompletionsByIDSMsgID count];
      int v14 = 134218498;
      id v15 = v11;
      __int16 v16 = 2114;
      uint64_t v17 = (uint64_t)v6;
      __int16 v18 = 2048;
      uint64_t v19 = v12;
      _os_log_impl(&dword_2228FD000, v10, OS_LOG_TYPE_DEFAULT, "Called and removed completion-handler %p for ID=<%{public}@>. Total-pending: %lu", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    long long v10 = NMLogForCategory(5);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(NSMutableDictionary *)self->_keepLocalCompletionsByIDSMsgID count];
      int v14 = 138543618;
      id v15 = v6;
      __int16 v16 = 2048;
      uint64_t v17 = v13;
      _os_log_impl(&dword_2228FD000, v10, OS_LOG_TYPE_DEFAULT, "Unable to find completion-handler for ID=<%{public}@>. Total-pending: %lu", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = a3;
  id v9 = a5;
  long long v10 = NMLogForCategory(5);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[NMSMediaSyncService service:account:incomingUnhandledProtobuf:fromID:context:]();
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v9 = a6;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a7;
  uint64_t v13 = NMLogForCategory(5);
  int v14 = v13;
  if (!v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NMSMediaSyncService service:account:identifier:didSendWithSuccess:error:context:]();
    }

    id v15 = [v12 domain];
    uint64_t v16 = *MEMORY[0x263F49E40];
    if ([v15 isEqualToString:*MEMORY[0x263F49E40]])
    {
      uint64_t v17 = [v12 code];

      if (v17 == 43)
      {
        __int16 v18 = (void *)MEMORY[0x263F087E8];
        uint64_t v30 = *MEMORY[0x263F08608];
        id v31 = v12;
        uint64_t v19 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        uint64_t v20 = v18;
        uint64_t v21 = 3;
LABEL_15:
        int v14 = [v20 errorWithDomain:@"NMSKeepLocalRequestErrorDomain" code:v21 userInfo:v19];

        [(NMSMediaSyncService *)self _callAndRemoveKeepLocalCompletionWithIDSMessageID:v11 error:v14];
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v22 = [v12 domain];
    if ([v22 isEqualToString:v16])
    {
      uint64_t v23 = [v12 code];

      if (v23 == 23)
      {
        id v24 = (void *)MEMORY[0x263F087E8];
        uint64_t v28 = *MEMORY[0x263F08608];
        id v29 = v12;
        uint64_t v19 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        uint64_t v20 = v24;
        uint64_t v21 = 2;
        goto LABEL_15;
      }
    }
    else
    {
    }
    id v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08608];
    id v27 = v12;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    uint64_t v20 = v25;
    uint64_t v21 = 0;
    goto LABEL_15;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v11;
    _os_log_impl(&dword_2228FD000, v14, OS_LOG_TYPE_DEFAULT, "Successfully sent message (ID: %@).", buf, 0xCu);
  }
LABEL_16:
}

- (void)_handleMediaSyncServiceKeepLocalRequest:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v9 = a7;
  idsActionHandlerQueue = self->_idsActionHandlerQueue;
  id v11 = a3;
  dispatch_assert_queue_V2(idsActionHandlerQueue);
  id v12 = [NMSMediaSyncServiceKeepLocalRequest alloc];
  uint64_t v13 = [v11 data];

  int v14 = [(NMSMediaSyncServiceKeepLocalRequest *)v12 initWithData:v13];
  id v15 = NMLogForCategory(5);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v14;
    _os_log_impl(&dword_2228FD000, v15, OS_LOG_TYPE_DEFAULT, "NMSMediaSyncService - _handleMediaSyncServiceKeepLocalRequest: %@", buf, 0xCu);
  }

  uint64_t v16 = (void *)MEMORY[0x263F573E8];
  uint64_t v17 = [(NMSMediaSyncServiceKeepLocalRequest *)v14 modelObject];
  __int16 v18 = [v17 dataMultiverseID];
  uint64_t v19 = [v16 pidFromMIDData:v18];
  uint64_t v20 = [v19 longLongValue];

  uint64_t v21 = [(NMSMediaSyncServiceKeepLocalRequest *)v14 modelObject];
  uint64_t v22 = -[NMSMediaSyncService _modelClassForContainerType:](self, "_modelClassForContainerType:", [v21 containerType]);

  uint64_t v23 = [(objc_class *)v22 nms_modelObjectWithLibraryPersistentID:v20];
  int64_t v24 = [(NMSMediaSyncService *)self _convertMediaSyncServiceKeepLocalEnableState:[(NMSMediaSyncServiceKeepLocalRequest *)v14 enableState]];
  id v25 = objc_alloc_init(NMSKeepLocalRequestOptions);
  uint64_t v26 = [(NMSMediaSyncServiceKeepLocalRequest *)v14 options];
  -[NMSKeepLocalRequestOptions setRequiresValidation:](v25, "setRequiresValidation:", [v26 requiresValidation]);

  id v27 = [(NMSMediaSyncServiceKeepLocalRequest *)v14 options];
  uint64_t v28 = [v27 cellularBundleIdentifier];
  [(NMSKeepLocalRequestOptions *)v25 setCellularBundleIdentifier:v28];

  id v29 = [(NMSMediaSyncServiceKeepLocalRequest *)v14 options];
  -[NMSKeepLocalRequestOptions setPowerPolicy:](v25, "setPowerPolicy:", -[NMSMediaSyncService _convertMediaSyncServiceKeepLocalPowerPolicy:](self, "_convertMediaSyncServiceKeepLocalPowerPolicy:", [v29 downloadOffPowerPolicy]));

  uint64_t v30 = [(NMSMediaSyncServiceKeepLocalRequest *)v14 options];
  -[NMSKeepLocalRequestOptions setCellularPolicy:](v25, "setCellularPolicy:", -[NMSMediaSyncService _convertMediaSyncServiceKeepLocalCellularPolicy:](self, "_convertMediaSyncServiceKeepLocalCellularPolicy:", [v30 downloadOnCellularPolicy]));

  id v31 = [(NMSMediaSyncServiceKeepLocalRequest *)v14 options];
  -[NMSKeepLocalRequestOptions setQualityOfService:](v25, "setQualityOfService:", -[NMSMediaSyncService _nsQOSFromNMSQOS:](self, "_nsQOSFromNMSQOS:", [v31 qualityOfService]));

  uint64_t v32 = [(NMSMediaSyncServiceKeepLocalRequest *)v14 options];
  LODWORD(v28) = [v32 hasTimeout];

  if (v28)
  {
    id v33 = [(NMSMediaSyncServiceKeepLocalRequest *)v14 options];
    [v33 timeout];
    [(NMSKeepLocalRequestOptions *)v25 setTimeout:"setTimeout:"];
  }
  uint64_t v34 = [[NMSKeepLocalRequestLocal alloc] initWithModelObject:v23 enableState:v24];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __94__NMSMediaSyncService__handleMediaSyncServiceKeepLocalRequest_service_account_fromID_context___block_invoke;
  v37[3] = &unk_2646346E8;
  v38 = v25;
  v39 = self;
  id v40 = v9;
  id v35 = v9;
  v36 = v25;
  [(NMSKeepLocalRequestLocal *)v34 performWithOptions:v36 completion:v37];
}

void __94__NMSMediaSyncService__handleMediaSyncServiceKeepLocalRequest_service_account_fromID_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = NMLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "Result of perform KeepLocal task. Error: %@", (uint8_t *)&v10, 0xCu);
  }

  [*(id *)(a1 + 32) timeout];
  if (v5 <= 0.0)
  {
    double v7 = *MEMORY[0x263F49E68];
  }
  else
  {
    [*(id *)(a1 + 32) timeout];
    double v7 = v6;
  }
  id v8 = *(void **)(a1 + 40);
  id v9 = [*(id *)(a1 + 48) outgoingResponseIdentifier];
  [v8 _sendUrgentServiceResponseWithError:v3 idsMessageID:v9 timeout:v7];
}

- (void)_handleMediaSyncServiceKeepLocalResponse:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsActionHandlerQueue);
  id v11 = [NMSMediaSyncServiceKeepLocalResponse alloc];
  uint64_t v12 = [v9 data];
  uint64_t v13 = [(NMSMediaSyncServiceKeepLocalResponse *)v11 initWithData:v12];

  int v14 = NMLogForCategory(5);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v13;
    _os_log_impl(&dword_2228FD000, v14, OS_LOG_TYPE_DEFAULT, "NMSMediaSyncService - _handleMediaSyncServiceKeepLocalResponse: %@", buf, 0xCu);
  }

  if ([(NMSMediaSyncServiceKeepLocalResponse *)v13 hasErrorCode])
  {
    int v15 = [(NMSMediaSyncServiceKeepLocalResponse *)v13 errorCode];
    if (v15)
    {
      if (v15 == 1)
      {
        uint64_t v16 = 0;
        if ([(NMSMediaSyncServiceKeepLocalResponse *)v13 validatorExceptionsCount])
        {
          unint64_t v17 = 0;
          do
            v16 |= [(NMSMediaSyncService *)self _nmsKeepLocalExceptionFromNMSSyncServiceException:[(NMSMediaSyncServiceKeepLocalResponse *)v13 validatorExceptionAtIndex:v17++]];
          while (v17 < [(NMSMediaSyncServiceKeepLocalResponse *)v13 validatorExceptionsCount]);
        }
        __int16 v18 = (void *)MEMORY[0x263F087E8];
        uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v16, @"NMSKeepLocalRequestErrorValidatorExceptionKey");
        id v25 = v19;
        uint64_t v20 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        uint64_t v21 = [v18 errorWithDomain:@"NMSKeepLocalRequestErrorDomain" code:1 userInfo:v20];

LABEL_17:
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v22 = NMLogForCategory(5);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[NMSMediaSyncService _handleMediaSyncServiceKeepLocalResponse:service:account:fromID:context:]();
      }
    }
    uint64_t v19 = NMLogForCategory(5);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[NMSMediaSyncService _handleMediaSyncServiceKeepLocalResponse:service:account:fromID:context:]();
    }
    uint64_t v21 = 0;
    goto LABEL_17;
  }
  uint64_t v21 = 0;
LABEL_18:
  uint64_t v23 = [v10 incomingResponseIdentifier];
  [(NMSMediaSyncService *)self _callAndRemoveKeepLocalCompletionWithIDSMessageID:v23 error:v21];
}

- (unint64_t)_convertMediaSyncServiceKeepLocalCellularPolicy:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF498], @"Unsupported Media Sync Service cellular policy specified.", 0, v3, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return a3;
}

- (int)_convertNMSKeepLocalRequestCellularPolicy:(unint64_t)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF498], @"Unsupported NMS cellular policy specified.", 0, v3, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return a3;
}

- (unint64_t)_convertMediaSyncServiceKeepLocalPowerPolicy:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF498], @"Unsupported Media Sync Service power policy specified.", 0, v3, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return a3;
}

- (int)_convertNMSKeepLocalRequestPowerPolicy:(unint64_t)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF498], @"Unsupported NMS power policy specified.", 0, v3, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return a3;
}

- (int)_convertMPModelObjectKeepLocalEnableState:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) >= 5)
  {
    id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Unknown KeepLocalEnableState specified." userInfo:0];
    objc_exception_throw(v4);
  }
  return dword_2229505E0[a3 + 1];
}

- (int64_t)_convertMediaSyncServiceKeepLocalEnableState:(int)a3
{
  if (a3 >= 5)
  {
    id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Unknown NMS KeepLocalEnableState specified." userInfo:0];
    objc_exception_throw(v4);
  }
  return qword_2229505F8[a3];
}

- (int)_nmsQOSFromNSQOS:(int64_t)a3
{
  if (a3 <= 16)
  {
    if (a3 == -1)
    {
      return 0;
    }
    else
    {
      if (a3 != 9) {
        goto LABEL_12;
      }
      return 1;
    }
  }
  else
  {
    switch(a3)
    {
      case 17:
        return 2;
      case 33:
        return 4;
      case 25:
        return 3;
      default:
LABEL_12:
        objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF498], @"Unsupported NS-QOS specified.", 0, v3, v4);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v6);
    }
  }
}

- (int64_t)_nsQOSFromNMSQOS:(int)a3
{
  if (a3 >= 5)
  {
    id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Unsupported NMS-QOS specified." userInfo:0];
    objc_exception_throw(v4);
  }
  return qword_222950620[a3];
}

- (unint64_t)_nmsKeepLocalExceptionFromNMSSyncServiceException:(int)a3
{
  if ((a3 - 1) >= 6)
  {
    id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"Unsupported KeepLocal validator exception specified." userInfo:0];
    objc_exception_throw(v4);
  }
  return qword_222950648[a3 - 1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepLocalCompletionsByIDSMsgID, 0);
  objc_storeStrong((id *)&self->_idsActionHandlerQueue, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

- (void)_cleanupKeepLocalCompletionWithID:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2228FD000, v0, v1, "_cleanupKeepLocalCompletionWithID - FAIL-SAFE: Found orphaned completion-handler for message ID: %@. Calling completion-handler and removing from pending list.", v2, v3, v4, v5, v6);
}

- (void)_sendUrgentMessage:(os_log_t)log messageType:timeout:completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2228FD000, log, OS_LOG_TYPE_ERROR, "Failed to receive an IDS message ID. Completion handler called with error result.", v1, 2u);
}

- (void)_sendUrgentServiceResponseWithError:idsMessageID:timeout:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2228FD000, v0, v1, "Unknown error domain specified. error: %@", v2, v3, v4, v5, v6);
}

- (void)service:account:incomingUnhandledProtobuf:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_2228FD000, v0, v1, "UNHANDLED IDS Protobuf %@ for service %@ has been received. This should have a setProtobufAction assigned.");
}

- (void)service:account:identifier:didSendWithSuccess:error:context:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_2228FD000, v0, v1, "Failed to send IDS message (ID: %@) with error \"%@\".");
}

- (void)_handleMediaSyncServiceKeepLocalResponse:service:account:fromID:context:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2228FD000, v0, v1, "NMSMediaSyncService - _handleMediaSyncServiceKeepLocalResponse: received a unknown error code from the remote device.  message: %@", v2, v3, v4, v5, v6);
}

- (void)_handleMediaSyncServiceKeepLocalResponse:service:account:fromID:context:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2228FD000, v0, v1, "NMSMediaSyncService - _handleMediaSyncServiceKeepLocalResponse: received a Generic error code from the remote device.  message: %@", v2, v3, v4, v5, v6);
}

@end