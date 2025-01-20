@interface CarDataClient
+ (int64_t)osStatusFromCarDataError:(unint64_t)a3;
- (CarDataClient)initWithPluginID:(id)a3;
- (CarDataClientDelegate)clientDelegate;
- (NSMutableDictionary)cachedValues;
- (NSMutableDictionary)transactions;
- (NSNumber)pluginID;
- (OS_dispatch_queue)processingQueue;
- (id)cachedValueForInstanceID:(id)a3;
- (id)parseValues:(id)a3 errors:(id)a4;
- (int64_t)handleCommand:(id)a3 transactionID:(id)a4 values:(id)a5 errors:(id)a6 priority:(unint64_t)a7;
- (void)addRegistrationFromCache:(id)a3 priority:(id)a4 withResponse:(id)a5;
- (void)cacheValues:(id)a3;
- (void)notifyInstanceID:(id)a3 value:(id)a4 priority:(id)a5;
- (void)readFromCache:(id)a3 priority:(id)a4 withResponse:(id)a5;
- (void)readInstanceIDs:(id)a3 priority:(id)a4 withResponse:(id)a5;
- (void)receiveData:(id)a3 priority:(unint64_t)a4;
- (void)registerAllWithPriority:(id)a3 withResponse:(id)a4;
- (void)registerInstanceIDs:(id)a3 priority:(id)a4 withResponse:(id)a5;
- (void)removeRegistrationFromCache:(id)a3 priority:(id)a4 withResponse:(id)a5;
- (void)requestConfigurationWithPriority:(id)a3 withResponse:(id)a4;
- (void)requestInstanceID:(id)a3 value:(id)a4 priority:(id)a5 withResponse:(id)a6;
- (void)responseInstanceID:(id)a3 error:(id)a4 transactionID:(id)a5 priority:(id)a6;
- (void)responseInstanceID:(id)a3 value:(id)a4 transactionID:(id)a5 priority:(id)a6;
- (void)responseTransactionID:(id)a3 error:(id)a4 priority:(id)a5;
- (void)sendCommand:(id)a3 error:(id)a4 transactionID:(id)a5 priority:(id)a6;
- (void)sendCommand:(id)a3 errors:(id)a4 transactionID:(id)a5 priority:(id)a6;
- (void)sendCommand:(id)a3 values:(id)a4 errors:(id)a5 error:(id)a6 transactionID:(id)a7 priority:(id)a8 withResponse:(id)a9;
- (void)sendCommand:(id)a3 values:(id)a4 priority:(id)a5 withResponse:(id)a6;
- (void)sendCommand:(id)a3 values:(id)a4 transactionID:(id)a5 priority:(id)a6;
- (void)setCachedValues:(id)a3;
- (void)setClientDelegate:(id)a3;
- (void)setPluginID:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setTransactions:(id)a3;
- (void)unregisterAllWithPriority:(id)a3 withResponse:(id)a4;
- (void)unregisterInstanceIDs:(id)a3 priority:(id)a4 withResponse:(id)a5;
- (void)writeValues:(id)a3 priority:(id)a4 withResponse:(id)a5;
@end

@implementation CarDataClient

- (CarDataClient)initWithPluginID:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CarDataClient;
  v6 = [(CarDataClient *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pluginID, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    transactions = v7->_transactions;
    v7->_transactions = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cachedValues = v7->_cachedValues;
    v7->_cachedValues = v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.caraccessoryd.CarDataClient.Processing", v13);
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v14;
  }
  return v7;
}

- (void)sendCommand:(id)a3 errors:(id)a4 transactionID:(id)a5 priority:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_queue_t v14 = CAFDClientLogging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = [(CarDataClient *)self pluginID];
    *(_DWORD *)buf = 138413314;
    objc_super v17 = v15;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2048;
    id v25 = [v11 count];
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ errors with %ld entries", buf, 0x34u);
  }
  [(CarDataClient *)self sendCommand:v10 values:0 errors:v11 error:0 transactionID:v12 priority:v13 withResponse:0];
}

- (void)sendCommand:(id)a3 error:(id)a4 transactionID:(id)a5 priority:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_queue_t v14 = CAFDClientLogging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = [(CarDataClient *)self pluginID];
    *(_DWORD *)buf = 138413314;
    objc_super v17 = v15;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2112;
    id v25 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ error: %@", buf, 0x34u);
  }
  [(CarDataClient *)self sendCommand:v10 values:0 errors:0 error:v11 transactionID:v12 priority:v13 withResponse:0];
}

- (void)sendCommand:(id)a3 values:(id)a4 transactionID:(id)a5 priority:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      dispatch_queue_t v14 = CAFDClientLogging();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = [(CarDataClient *)self pluginID];
        *(_DWORD *)buf = 138413314;
        __int16 v22 = v15;
        __int16 v23 = 2112;
        id v24 = v10;
        __int16 v25 = 2112;
        id v26 = v12;
        __int16 v27 = 2112;
        id v28 = v13;
        __int16 v29 = 2048;
        id v30 = [v11 count];
        v16 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ values array with %ld entries";
LABEL_12:
        objc_super v17 = v14;
        uint32_t v18 = 52;
        goto LABEL_13;
      }
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      dispatch_queue_t v14 = CAFDClientLogging();
      BOOL v20 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
      if (isKindOfClass)
      {
        if (v20)
        {
          v15 = [(CarDataClient *)self pluginID];
          *(_DWORD *)buf = 138413314;
          __int16 v22 = v15;
          __int16 v23 = 2112;
          id v24 = v10;
          __int16 v25 = 2112;
          id v26 = v12;
          __int16 v27 = 2112;
          id v28 = v13;
          __int16 v29 = 2048;
          id v30 = [v11 count];
          v16 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ values dictionary with %ld entries";
          goto LABEL_12;
        }
      }
      else if (v20)
      {
        v15 = [(CarDataClient *)self pluginID];
        *(_DWORD *)buf = 138413314;
        __int16 v22 = v15;
        __int16 v23 = 2112;
        id v24 = v10;
        __int16 v25 = 2112;
        id v26 = v12;
        __int16 v27 = 2112;
        id v28 = v13;
        __int16 v29 = 2112;
        id v30 = v11;
        v16 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ values: %@";
        goto LABEL_12;
      }
    }
  }
  else
  {
    dispatch_queue_t v14 = CAFDClientLogging();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = [(CarDataClient *)self pluginID];
      *(_DWORD *)buf = 138413058;
      __int16 v22 = v15;
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v13;
      v16 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ without values";
      objc_super v17 = v14;
      uint32_t v18 = 42;
LABEL_13:
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, v16, buf, v18);
    }
  }

  [(CarDataClient *)self sendCommand:v10 values:v11 errors:0 error:0 transactionID:v12 priority:v13 withResponse:0];
}

- (void)sendCommand:(id)a3 values:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!RandomBytes())
  {
    dispatch_queue_t v14 = +[NSNumber numberWithLongLong:0];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = CAFDClientLogging();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v16 = [(CarDataClient *)self pluginID];
          *(_DWORD *)buf = 138413314;
          __int16 v23 = v16;
          __int16 v24 = 2112;
          id v25 = v10;
          __int16 v26 = 2112;
          __int16 v27 = v14;
          __int16 v28 = 2112;
          id v29 = v12;
          __int16 v30 = 2048;
          id v31 = [v11 count];
          objc_super v17 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ values array with %ld entries";
LABEL_15:
          uint32_t v18 = v15;
          uint32_t v19 = 52;
          goto LABEL_16;
        }
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v15 = CAFDClientLogging();
        BOOL v21 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
        if (isKindOfClass)
        {
          if (v21)
          {
            v16 = [(CarDataClient *)self pluginID];
            *(_DWORD *)buf = 138413314;
            __int16 v23 = v16;
            __int16 v24 = 2112;
            id v25 = v10;
            __int16 v26 = 2112;
            __int16 v27 = v14;
            __int16 v28 = 2112;
            id v29 = v12;
            __int16 v30 = 2048;
            id v31 = [v11 count];
            objc_super v17 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ values dictionary with %ld entries";
            goto LABEL_15;
          }
        }
        else if (v21)
        {
          v16 = [(CarDataClient *)self pluginID];
          *(_DWORD *)buf = 138413314;
          __int16 v23 = v16;
          __int16 v24 = 2112;
          id v25 = v10;
          __int16 v26 = 2112;
          __int16 v27 = v14;
          __int16 v28 = 2112;
          id v29 = v12;
          __int16 v30 = 2112;
          id v31 = v11;
          objc_super v17 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ values: %@";
          goto LABEL_15;
        }
      }
    }
    else
    {
      v15 = CAFDClientLogging();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = [(CarDataClient *)self pluginID];
        *(_DWORD *)buf = 138413058;
        __int16 v23 = v16;
        __int16 v24 = 2112;
        id v25 = v10;
        __int16 v26 = 2112;
        __int16 v27 = v14;
        __int16 v28 = 2112;
        id v29 = v12;
        objc_super v17 = "Send pluginID: %@ command: %@ transactionID: %@ with priority: %@ without values";
        uint32_t v18 = v15;
        uint32_t v19 = 42;
LABEL_16:
        _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, v17, buf, v19);
      }
    }

    [(CarDataClient *)self sendCommand:v10 values:v11 errors:0 error:0 transactionID:v14 priority:v12 withResponse:v13];
    goto LABEL_18;
  }
  dispatch_queue_t v14 = CAFDClientLogging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CarDataClient sendCommand:values:priority:withResponse:]();
  }
LABEL_18:
}

- (void)sendCommand:(id)a3 values:(id)a4 errors:(id)a5 error:(id)a6 transactionID:(id)a7 priority:(id)a8 withResponse:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  __int16 v22 = [(CarDataClient *)self processingQueue];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke;
  v30[3] = &unk_100035080;
  id v31 = v15;
  id v32 = v19;
  id v33 = v16;
  id v34 = v17;
  id v35 = v18;
  v36 = self;
  id v37 = v20;
  id v38 = v21;
  id v23 = v21;
  id v24 = v20;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v19;
  id v29 = v15;
  dispatch_async(v22, v30);
}

void __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:kCarDataProtocolKeyCommand];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    [v2 setObject:v3 forKeyedSubscript:kCarDataProtocolKeyTransactionID];
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    [v2 setObject:v4 forKeyedSubscript:kCarDataProtocolKeyValues];
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    [v2 setObject:v5 forKeyedSubscript:kCarDataProtocolKeyErrors];
  }
  v6 = *(void **)(a1 + 64);
  if (v6)
  {
    v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
    [v2 setObject:v7 forKeyedSubscript:kCarDataProtocolKeyError];
  }
  id v37 = 0;
  v8 = +[NSData CAF_encodeCarDataFrom:v2 error:&v37];
  id v9 = v37;
  if (v9)
  {
    id v10 = CAFDClientLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v27 = [*(id *)(a1 + 72) pluginID];
      uint64_t v28 = *(void *)(a1 + 40);
      uint64_t v29 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 138413058;
      v39 = v27;
      __int16 v40 = 2112;
      uint64_t v41 = v28;
      __int16 v42 = 2112;
      uint64_t v43 = v29;
      __int16 v44 = 2112;
      id v45 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unable to serialize command for pluginID: %@ transactionID: %@ with priority: %@ with error: %@", buf, 0x2Au);
    }
    uint64_t v11 = *(void *)(a1 + 88);
    if (v11)
    {
      id v12 = [objc_alloc((Class)CAFResponse) initWithError:v9];
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v12);
    }
  }
  else if (v8)
  {
    id v13 = [*(id *)(a1 + 72) clientDelegate];

    if (!v13)
    {
      dispatch_queue_t v14 = CAFDClientLogging();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v30 = [*(id *)(a1 + 72) pluginID];
        uint64_t v31 = *(void *)(a1 + 40);
        uint64_t v32 = *(void *)(a1 + 80);
        *(_DWORD *)buf = 138412802;
        v39 = v30;
        __int16 v40 = 2112;
        uint64_t v41 = v31;
        __int16 v42 = 2112;
        uint64_t v43 = v32;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Client delegate for pluginID: %@ transactionID: %@ with priority: %@ missing", buf, 0x20u);
      }
      uint64_t v15 = *(void *)(a1 + 88);
      if (v15)
      {
        id v16 = objc_alloc((Class)CAFResponse);
        id v17 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:3 userInfo:0];
        id v18 = [v16 initWithError:v17];
        (*(void (**)(uint64_t, id))(v15 + 16))(v15, v18);
      }
    }
    id v19 = [*(id *)(a1 + 72) clientDelegate];
    id v20 = [*(id *)(a1 + 72) pluginID];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_29;
    v33[3] = &unk_100035058;
    uint64_t v21 = *(void *)(a1 + 80);
    v33[4] = *(void *)(a1 + 72);
    id v34 = *(id *)(a1 + 40);
    id v35 = *(id *)(a1 + 80);
    id v36 = *(id *)(a1 + 88);
    [v19 sendToPluginID:v20 payload:v8 priority:v21 completion:v33];
  }
  else
  {
    __int16 v22 = CAFDClientLogging();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_cold_1();
    }

    uint64_t v23 = *(void *)(a1 + 88);
    if (v23)
    {
      id v24 = objc_alloc((Class)CAFResponse);
      id v25 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:3 userInfo:0];
      id v26 = [v24 initWithError:v25];
      (*(void (**)(uint64_t, id))(v23 + 16))(v23, v26);
    }
  }
}

void __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_2;
  block[3] = &unk_100034DD8;
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  dispatch_async(v4, block);
}

void __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = CAFDClientLogging();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_2_cold_1(a1);
    }

    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      id v4 = [objc_alloc((Class)CAFResponse) initWithError:*(void *)(a1 + 32)];
      (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
    }
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 64);
    if (v5)
    {
      id v7 = objc_retainBlock(v5);
      v6 = [*(id *)(a1 + 40) transactions];
      [v6 setObject:v7 forKeyedSubscript:*(void *)(a1 + 48)];
    }
  }
}

- (id)parseValues:(id)a3 errors:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __36__CarDataClient_parseValues_errors___block_invoke;
  v15[3] = &unk_1000350A8;
  v15[4] = self;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v16 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v15];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __36__CarDataClient_parseValues_errors___block_invoke_35;
  v13[3] = &unk_1000350A8;
  v13[4] = self;
  id v9 = v8;
  id v14 = v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v13];

  uint64_t v10 = v14;
  id v11 = v9;

  return v11;
}

void __36__CarDataClient_parseValues_errors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  id v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = +[NSNull null];
    if ([v6 isEqual:v8]) {
      id v9 = 0;
    }
    else {
      id v9 = v6;
    }
    id v10 = v9;

    id v11 = [objc_alloc((Class)CAFCharacteristicValue) initWithValue:v10 error:0];
    [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v7];

    id v12 = v7;
  }
  else
  {

    id v12 = CAFDLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __36__CarDataClient_parseValues_errors___block_invoke_cold_1();
    }
  }
}

void __36__CarDataClient_parseValues_errors___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  id v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    id v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v9 = [v8 integerValue];
      if (v9)
      {
        id v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v9 userInfo:0];
        id v11 = CAFDLogging();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v17 = [*(id *)(a1 + 32) pluginID];
          int v18 = 138412802;
          id v19 = v17;
          __int16 v20 = 2112;
          uint64_t v21 = v7;
          __int16 v22 = 2112;
          id v23 = v8;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Received characteristic value from pluginID: %@ instanceID: %@ with error %@", (uint8_t *)&v18, 0x20u);
        }
      }
      else
      {
        id v10 = 0;
      }
      id v14 = [objc_alloc((Class)CAFCharacteristicValue) initWithValue:0 error:v10];
      [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v7];
    }
    else
    {

      id v13 = CAFDLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = [*(id *)(a1 + 32) pluginID];
        int v18 = 138412802;
        id v19 = v15;
        __int16 v20 = 2112;
        uint64_t v21 = v7;
        __int16 v22 = 2112;
        id v23 = (id)objc_opt_class();
        id v16 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Parsing characteristic value from pluginID: %@ instanceID: %@ failed with wrong error data type %@", (uint8_t *)&v18, 0x20u);
      }
      id v8 = v13;
    }

    id v12 = v7;
  }
  else
  {

    id v12 = CAFDLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __36__CarDataClient_parseValues_errors___block_invoke_cold_1();
    }
  }
}

- (void)cacheValues:(id)a3
{
  if (self->_cachedValues)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = __29__CarDataClient_cacheValues___block_invoke;
    v3[3] = &unk_1000350D0;
    v3[4] = self;
    [a3 enumerateKeysAndObjectsUsingBlock:v3];
  }
}

void __29__CarDataClient_cacheValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 cachedValues];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    id v9 = [v11 value];
    [v8 setValue:v9];

    id v10 = [v11 error];
    [v8 setError:v10];
  }
}

- (void)addRegistrationFromCache:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CarDataClient *)self processingQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __64__CarDataClient_addRegistrationFromCache_priority_withResponse___block_invoke;
  v15[3] = &unk_100034FC8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __64__CarDataClient_addRegistrationFromCache_priority_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cachedValues];
  if (v2
    && (uint64_t v3 = (void *)v2,
        [*(id *)(a1 + 32) clientDelegate],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __64__CarDataClient_addRegistrationFromCache_priority_withResponse___block_invoke_2;
    v26[3] = &unk_1000350F8;
    id v7 = *(void **)(a1 + 40);
    v26[4] = *(void *)(a1 + 32);
    id v8 = v6;
    id v27 = v8;
    id v9 = v5;
    id v28 = v9;
    [v7 enumerateObjectsUsingBlock:v26];
    id v10 = CAFDClientLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [*(id *)(a1 + 32) pluginID];
      id v20 = [*(id *)(a1 + 40) count];
      id v21 = [v8 count];
      id v22 = [v9 count];
      *(_DWORD *)buf = 138413058;
      __int16 v30 = v19;
      __int16 v31 = 2048;
      id v32 = v20;
      __int16 v33 = 2048;
      id v34 = v21;
      __int16 v35 = 2048;
      id v36 = v22;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Add registration from cache pluginID: %@ total: %ld cached: %ld missing: %ld", buf, 0x2Au);
    }
    uint64_t v11 = *(void *)(a1 + 56);
    if (v11)
    {
      id v12 = [objc_alloc((Class)CAFResponse) initWithValues:v8];
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v12);
    }
    if ([v9 count])
    {
      id v13 = CAFDClientLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v23 = [*(id *)(a1 + 32) pluginID];
        id v24 = [v9 count];
        id v25 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        __int16 v30 = v23;
        __int16 v31 = 2048;
        id v32 = v24;
        __int16 v33 = 2112;
        id v34 = v25;
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Add registration pluginID: %@ instanceID count: %ld with priority: %@", buf, 0x20u);
      }
      [*(id *)(a1 + 32) sendCommand:kCarDataProtocolCmdKeyRegisterRequest values:v9 priority:*(void *)(a1 + 48) withResponse:*(void *)(a1 + 56)];
    }
  }
  else
  {
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = kCarDataProtocolCmdKeyRegisterRequest;
    [v14 sendCommand:v18 values:v15 priority:v16 withResponse:v17];
  }
}

void __64__CarDataClient_addRegistrationFromCache_priority_withResponse___block_invoke_2(id *a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [a1[4] cachedValues];
  id v4 = [v3 objectForKeyedSubscript:v8];

  if (v4)
  {
    [a1[5] setObject:v4 forKeyedSubscript:v8];
  }
  else
  {
    id v5 = [objc_alloc((Class)CAFCharacteristicValue) initWithValue:0 error:0];
    id v6 = [a1[4] cachedValues];
    [v6 setObject:v5 forKeyedSubscript:v8];

    id v7 = +[NSNull null];
    [a1[5] setObject:v7 forKeyedSubscript:v8];

    [a1[6] addObject:v8];
  }
}

- (void)removeRegistrationFromCache:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CarDataClient *)self processingQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __67__CarDataClient_removeRegistrationFromCache_priority_withResponse___block_invoke;
  v15[3] = &unk_100034FC8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __67__CarDataClient_removeRegistrationFromCache_priority_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) cachedValues];
  if (v3
    && (id v4 = (void *)v3,
        [*v2 clientDelegate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = CAFDClientLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __67__CarDataClient_removeRegistrationFromCache_priority_withResponse___block_invoke_cold_1();
    }

    id v7 = *(void **)(a1 + 40);
    if (v7 && [v7 count])
    {
      id v8 = CAFDClientLogging();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v17 = [*(id *)(a1 + 32) pluginID];
        id v18 = [*(id *)(a1 + 40) count];
        uint64_t v19 = *(void *)(a1 + 48);
        int v20 = 138412802;
        id v21 = v17;
        __int16 v22 = 2048;
        id v23 = v18;
        __int16 v24 = 2112;
        uint64_t v25 = v19;
        _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Remove registration pluginID: %@ instanceID count: %ld with priority: %@", (uint8_t *)&v20, 0x20u);
      }
      id v9 = [*(id *)(a1 + 32) cachedValues];
      [v9 removeObjectsForKeys:*(void *)(a1 + 40)];

      [*(id *)(a1 + 32) sendCommand:kCarDataProtocolCmdKeyUnregisterRequest values:*(void *)(a1 + 40) priority:*(void *)(a1 + 48) withResponse:*(void *)(a1 + 56)];
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 56);
      if (v15)
      {
        id v16 = [objc_alloc((Class)CAFResponse) initWithValuesAndError:0 error:0];
        (*(void (**)(uint64_t, id))(v15 + 16))(v15, v16);
      }
    }
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = kCarDataProtocolCmdKeyUnregisterRequest;
    [v10 sendCommand:v14 values:v11 priority:v12 withResponse:v13];
  }
}

- (void)readFromCache:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(CarDataClient *)self processingQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __53__CarDataClient_readFromCache_priority_withResponse___block_invoke;
  v15[3] = &unk_100034FC8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __53__CarDataClient_readFromCache_priority_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cachedValues];
  if (v2
    && (uint64_t v3 = (void *)v2,
        [*(id *)(a1 + 32) clientDelegate],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    id v5 = [objc_alloc((Class)NSMutableArray) initWithArray:*(void *)(a1 + 40)];
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __53__CarDataClient_readFromCache_priority_withResponse___block_invoke_2;
    v26[3] = &unk_1000350F8;
    id v7 = *(void **)(a1 + 40);
    v26[4] = *(void *)(a1 + 32);
    id v8 = v6;
    id v27 = v8;
    id v9 = v5;
    id v28 = v9;
    [v7 enumerateObjectsUsingBlock:v26];
    id v10 = CAFDClientLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = [*(id *)(a1 + 32) pluginID];
      id v20 = [*(id *)(a1 + 40) count];
      id v21 = [v8 count];
      id v22 = [v9 count];
      *(_DWORD *)buf = 138413058;
      __int16 v30 = v19;
      __int16 v31 = 2048;
      id v32 = v20;
      __int16 v33 = 2048;
      id v34 = v21;
      __int16 v35 = 2048;
      id v36 = v22;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Read values pluginID: %@ total: %ld from cache: %ld missing: %ld", buf, 0x2Au);
    }
    if ([v8 count])
    {
      uint64_t v11 = CAFDClientLogging();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v23 = [*(id *)(a1 + 32) pluginID];
        id v24 = [*(id *)(a1 + 40) count];
        uint64_t v25 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412802;
        __int16 v30 = v23;
        __int16 v31 = 2048;
        id v32 = v24;
        __int16 v33 = 2112;
        id v34 = v25;
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Read values pluginID: %@ instanceID count: %ld with priority: %@", buf, 0x20u);
      }
      uint64_t v12 = *(void *)(a1 + 56);
      if (v12)
      {
        id v13 = [objc_alloc((Class)CAFResponse) initWithValues:v8];
        (*(void (**)(uint64_t, id))(v12 + 16))(v12, v13);
      }
    }
    if ([v9 count]) {
      [*(id *)(a1 + 32) sendCommand:kCarDataProtocolCmdKeyReadRequest values:v9 priority:*(void *)(a1 + 48) withResponse:*(void *)(a1 + 56)];
    }
  }
  else
  {
    id v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v18 = kCarDataProtocolCmdKeyReadRequest;
    [v14 sendCommand:v18 values:v15 priority:v16 withResponse:v17];
  }
}

void __53__CarDataClient_readFromCache_priority_withResponse___block_invoke_2(id *a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [a1[4] cachedValues];
  id v4 = [v3 objectForKeyedSubscript:v5];

  if (v4)
  {
    [a1[5] setObject:v4 forKeyedSubscript:v5];
    [a1[6] removeObject:v5];
  }
}

- (int64_t)handleCommand:(id)a3 transactionID:(id)a4 values:(id)a5 errors:(id)a6 priority:(unint64_t)a7
{
  os_signpost_id_t v12 = 0xEEEEB0B5B2B2EEEELL;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = CARSignpostLogForCategory();
  os_signpost_id_t v18 = 0xEEEEB0B5B2B2EEEELL;
  if (!self
    || (CARSignpostLogForCategory(),
        uint64_t v19 = objc_claimAutoreleasedReturnValue(),
        os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v19, self),
        v19,
        v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
  {
    if (os_signpost_enabled(v17))
    {
      id v20 = [(CarDataClient *)self pluginID];
      *(_DWORD *)buf = 138543874;
      id v115 = v13;
      __int16 v116 = 2114;
      id v117 = v20;
      __int16 v118 = 2112;
      id v119 = v14;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, v18, "CAFd-RecieveCommand", "%{public}@ plugin: %{public}@ transactionID: %@", buf, 0x20u);
    }
  }

  if ([v13 isEqualToString:kCarDataProtocolCmdKeyUpdateNotify])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v22 = CAFDClientLogging();
    id v23 = v22;
    if (isKindOfClass)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v66 = [(CarDataClient *)self pluginID];
        id v67 = [v15 count];
        *(_DWORD *)buf = 138412802;
        id v115 = v66;
        __int16 v116 = 2112;
        id v117 = v14;
        __int16 v118 = 2048;
        id v119 = v67;
        _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ update values count: %lu", buf, 0x20u);
      }
      id v24 = self;
      id v25 = v15;
      id v26 = 0;
LABEL_18:
      id v28 = [(CarDataClient *)v24 parseValues:v25 errors:v26];
      [(CarDataClient *)self cacheValues:v28];
      id WeakRetained = objc_loadWeakRetained((id *)&self->clientDelegate);

      if (!WeakRetained)
      {
LABEL_21:

LABEL_22:
        int64_t v32 = 0;
        goto LABEL_142;
      }
      __int16 v30 = objc_loadWeakRetained((id *)&self->clientDelegate);
      __int16 v31 = [(CarDataClient *)self pluginID];
      [v30 didReceiveUpdateFromPluginID:v31 values:v28];

LABEL_20:
      goto LABEL_21;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v33 = [(CarDataClient *)self pluginID];
      id v34 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      id v115 = v33;
      __int16 v116 = 2112;
      id v117 = v14;
      __int16 v118 = 2112;
      id v119 = v34;
      id v35 = v34;
      id v36 = "Error pluginID: %@ transactionID: %@ wrong update data type %@";
LABEL_60:
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v36, buf, 0x20u);

      goto LABEL_141;
    }
    goto LABEL_141;
  }
  if ([v13 isEqualToString:kCarDataProtocolCmdKeyRegisterResponse])
  {
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v23 = CAFDClientLogging();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        __int16 v33 = [(CarDataClient *)self pluginID];
        id v45 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        id v115 = v33;
        __int16 v116 = 2112;
        id v117 = v14;
        __int16 v118 = 2112;
        id v119 = v45;
        id v35 = v45;
        id v36 = "Error pluginID: %@ transactionID: %@ wrong register repsonse values type %@";
        goto LABEL_60;
      }
    }
    else
    {
      if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v27 = CAFDClientLogging();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v75 = [(CarDataClient *)self pluginID];
          id v76 = [v15 count];
          id v77 = [v16 count];
          *(_DWORD *)buf = 138413058;
          id v115 = v75;
          __int16 v116 = 2112;
          id v117 = v14;
          __int16 v118 = 2048;
          id v119 = v76;
          __int16 v120 = 2048;
          id v121 = v77;
          _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ register response values count: %ld errors count: %ld", buf, 0x2Au);
        }
        id v24 = self;
        id v25 = v15;
        id v26 = v16;
        goto LABEL_18;
      }
      id v23 = CAFDClientLogging();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        __int16 v33 = [(CarDataClient *)self pluginID];
        v52 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        id v115 = v33;
        __int16 v116 = 2112;
        id v117 = v14;
        __int16 v118 = 2112;
        id v119 = v52;
        id v35 = v52;
        id v36 = "Error pluginID: %@ transactionID: %@ wrong register repsonse errors type %@";
        goto LABEL_60;
      }
    }
LABEL_141:

    int64_t v32 = 8;
    goto LABEL_142;
  }
  if ([v13 isEqualToString:kCarDataProtocolCmdKeyUnregisterResponse])
  {
    id v37 = CAFDClientLogging();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[CarDataClient handleCommand:transactionID:values:errors:priority:]();
    }
    goto LABEL_28;
  }
  if ([v13 isEqualToString:kCarDataProtocolCmdKeyReadResponse])
  {
    if (v14)
    {
      if (v15)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v23 = CAFDClientLogging();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            goto LABEL_141;
          }
          __int16 v33 = [(CarDataClient *)self pluginID];
          v68 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          id v115 = v33;
          __int16 v116 = 2112;
          id v117 = v14;
          __int16 v118 = 2112;
          id v119 = v68;
          id v35 = v68;
          id v36 = "Error pluginID: %@ transactionID: %@ wrong read response values type %@";
          goto LABEL_60;
        }
      }
      if (v16)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v23 = CAFDClientLogging();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            goto LABEL_141;
          }
          __int16 v33 = [(CarDataClient *)self pluginID];
          v70 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          id v115 = v33;
          __int16 v116 = 2112;
          id v117 = v14;
          __int16 v118 = 2112;
          id v119 = v70;
          id v35 = v70;
          id v36 = "Error pluginID: %@ transactionID: %@ wrong read repsonse errors type %@";
          goto LABEL_60;
        }
      }
      uint64_t v41 = CARSignpostLogForCategory();
      if (!self
        || (CARSignpostLogForCategory(),
            __int16 v42 = objc_claimAutoreleasedReturnValue(),
            os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v42, self),
            v42,
            v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
      {
        if (os_signpost_enabled(v41))
        {
          uint64_t v43 = [(CarDataClient *)self pluginID];
          *(_DWORD *)buf = 138543618;
          id v115 = v43;
          __int16 v116 = 2114;
          id v117 = v14;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_EVENT, v12, "Get", "Receive plugin read response pluginID: %{public}@ transactionID: %{public}@", buf, 0x16u);
        }
      }

      __int16 v44 = CAFDClientLogging();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        v91 = [(CarDataClient *)self pluginID];
        id v92 = [v15 count];
        id v93 = [v16 count];
        *(_DWORD *)buf = 138413058;
        id v115 = v91;
        __int16 v116 = 2112;
        id v117 = v14;
        __int16 v118 = 2048;
        id v119 = v92;
        __int16 v120 = 2048;
        id v121 = v93;
        _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ read response values count: %ld errors count: %ld", buf, 0x2Au);
      }
      id v28 = [(CarDataClient *)self parseValues:v15 errors:v16];
      [(CarDataClient *)self cacheValues:v28];
      goto LABEL_75;
    }
    v60 = CAFDClientLogging();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      -[CarDataClient handleCommand:transactionID:values:errors:priority:](self);
    }
LABEL_121:

    int64_t v32 = 6;
    goto LABEL_142;
  }
  if ([v13 isEqualToString:kCarDataProtocolCmdKeyWriteResponse])
  {
    if (!v14)
    {
      v60 = CAFDClientLogging();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        -[CarDataClient handleCommand:transactionID:values:errors:priority:](self);
      }
      goto LABEL_121;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v23 = CAFDClientLogging();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_141;
      }
      __int16 v33 = [(CarDataClient *)self pluginID];
      v69 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      id v115 = v33;
      __int16 v116 = 2112;
      id v117 = v14;
      __int16 v118 = 2112;
      id v119 = v69;
      id v35 = v69;
      id v36 = "Error pluginID: %@ transactionID: %@ wrong write response errors type %@";
      goto LABEL_60;
    }
    v46 = CARSignpostLogForCategory();
    if (!self
      || (CARSignpostLogForCategory(),
          v47 = objc_claimAutoreleasedReturnValue(),
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v47, self),
          v47,
          v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
    {
      if (os_signpost_enabled(v46))
      {
        v48 = [(CarDataClient *)self pluginID];
        *(_DWORD *)buf = 138543618;
        id v115 = v48;
        __int16 v116 = 2114;
        id v117 = v14;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_EVENT, v12, "Set", "Receive plugin write response pluginID: %{public}@ transactionID: %{public}@", buf, 0x16u);
      }
    }

    v49 = CAFDClientLogging();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      v96 = [(CarDataClient *)self pluginID];
      id v97 = [v16 count];
      *(_DWORD *)buf = 138412802;
      id v115 = v96;
      __int16 v116 = 2112;
      id v117 = v14;
      __int16 v118 = 2048;
      id v119 = v97;
      _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ write response result count: %ld", buf, 0x20u);
    }
    v50 = self;
    id v51 = 0;
LABEL_74:
    id v28 = [(CarDataClient *)v50 parseValues:v51 errors:v16];
LABEL_75:
    v57 = [(CarDataClient *)self transactions];
    v58 = [v57 objectForKeyedSubscript:v14];

    if (v58)
    {
      id v59 = [objc_alloc((Class)CAFResponse) initWithValues:v28];
      ((void (**)(void, id))v58)[2](v58, v59);
    }
    goto LABEL_77;
  }
  if ([v13 isEqualToString:kCarDataProtocolCmdKeyControlResponse])
  {
    if (!v14)
    {
      v60 = CAFDClientLogging();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        -[CarDataClient handleCommand:transactionID:values:errors:priority:].cold.4(self);
      }
      goto LABEL_121;
    }
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v23 = CAFDClientLogging();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          goto LABEL_141;
        }
        __int16 v33 = [(CarDataClient *)self pluginID];
        v82 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        id v115 = v33;
        __int16 v116 = 2112;
        id v117 = v14;
        __int16 v118 = 2112;
        id v119 = v82;
        id v35 = v82;
        id v36 = "Error pluginID: %@ transactionID: %@ wrong control response errors type %@";
        goto LABEL_60;
      }
    }
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v23 = CAFDClientLogging();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          goto LABEL_141;
        }
        __int16 v33 = [(CarDataClient *)self pluginID];
        v86 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        id v115 = v33;
        __int16 v116 = 2112;
        id v117 = v14;
        __int16 v118 = 2112;
        id v119 = v86;
        id v35 = v86;
        id v36 = "Error pluginID: %@ transactionID: %@ wrong control response values type %@";
        goto LABEL_60;
      }
    }
    v53 = CARSignpostLogForCategory();
    if (!self
      || (CARSignpostLogForCategory(),
          v54 = objc_claimAutoreleasedReturnValue(),
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v54, self),
          v54,
          v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
    {
      if (os_signpost_enabled(v53))
      {
        v55 = [(CarDataClient *)self pluginID];
        *(_DWORD *)buf = 138543618;
        id v115 = v55;
        __int16 v116 = 2114;
        id v117 = v14;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v53, OS_SIGNPOST_EVENT, v12, "Control", "Receive plugin control response pluginID: %{public}@ transactionID: %{public}@", buf, 0x16u);
      }
    }

    v56 = CAFDClientLogging();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      v99 = [(CarDataClient *)self pluginID];
      id v100 = [v15 count];
      id v101 = [v16 count];
      *(_DWORD *)buf = 138413058;
      id v115 = v99;
      __int16 v116 = 2112;
      id v117 = v14;
      __int16 v118 = 2048;
      id v119 = v100;
      __int16 v120 = 2048;
      id v121 = v101;
      _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ control response values count: %ld errors count: %ld", buf, 0x2Au);
    }
    v50 = self;
    id v51 = v15;
    goto LABEL_74;
  }
  if ([v13 isEqualToString:kCarDataProtocolCmdKeyControlRequest])
  {
    if (!v14)
    {
      v60 = CAFDClientLogging();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        -[CarDataClient handleCommand:transactionID:values:errors:priority:].cold.5(self);
      }
      goto LABEL_121;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v61 = CARSignpostLogForCategory();
      if (!self
        || (CARSignpostLogForCategory(),
            v62 = objc_claimAutoreleasedReturnValue(),
            os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v62, self),
            v62,
            v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
      {
        if (os_signpost_enabled(v61))
        {
          v63 = [(CarDataClient *)self pluginID];
          *(_DWORD *)buf = 138543618;
          id v115 = v63;
          __int16 v116 = 2114;
          id v117 = v14;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v61, OS_SIGNPOST_EVENT, v12, "Control", "Receive plugin control request pluginID: %{public}@ transactionID: %{public}@", buf, 0x16u);
        }
      }

      v64 = CAFDClientLogging();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        v102 = [(CarDataClient *)self pluginID];
        id v103 = [v15 count];
        *(_DWORD *)buf = 138412802;
        id v115 = v102;
        __int16 v116 = 2112;
        id v117 = v14;
        __int16 v118 = 2048;
        id v119 = v103;
        _os_log_debug_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ control request values count: %ld", buf, 0x20u);
      }
      id v65 = objc_loadWeakRetained((id *)&self->clientDelegate);

      if (v65)
      {
        v111[0] = _NSConcreteStackBlock;
        v111[1] = 3221225472;
        v111[2] = __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke;
        v111[3] = &unk_100035148;
        v111[4] = self;
        id v112 = v14;
        unint64_t v113 = a7;
        [v15 enumerateKeysAndObjectsUsingBlock:v111];

        goto LABEL_22;
      }
      id v28 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:10 userInfo:0];
      __int16 v30 = +[NSNumber numberWithUnsignedInteger:a7];
      [(CarDataClient *)self responseTransactionID:v14 error:v28 priority:v30];
      goto LABEL_20;
    }
    v83 = CAFDClientLogging();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      v104 = [(CarDataClient *)self pluginID];
      v105 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      id v115 = v104;
      __int16 v116 = 2112;
      id v117 = v14;
      __int16 v118 = 2112;
      id v119 = v105;
      id v106 = v105;
      _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "Error pluginID: %@ transactionID: %@ wrong control request values type %@", buf, 0x20u);
    }
    int64_t v32 = 8;
    v84 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:8 userInfo:0];
    v85 = +[NSNumber numberWithUnsignedInteger:a7];
    [(CarDataClient *)self responseTransactionID:v14 error:v84 priority:v85];
  }
  else
  {
    if (![v13 isEqualToString:kCarDataProtocolCmdKeyControlNotify])
    {
      if ([v13 isEqualToString:kCarDataProtocolCmdKeyConfigResponse])
      {
        objc_opt_class();
        char v78 = objc_opt_isKindOfClass();
        v79 = CAFDClientLogging();
        id v23 = v79;
        if ((v78 & 1) == 0)
        {
          if (!os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
            goto LABEL_141;
          }
          __int16 v33 = [(CarDataClient *)self pluginID];
          v94 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          id v115 = v33;
          __int16 v116 = 2112;
          id v117 = v14;
          __int16 v118 = 2112;
          id v119 = v94;
          id v35 = v94;
          id v36 = "Error pluginID: %@ transactionID: %@ wrong config response values type %@";
          goto LABEL_60;
        }
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG)) {
          -[CarDataClient handleCommand:transactionID:values:errors:priority:].cold.6();
        }

        id v80 = objc_loadWeakRetained((id *)&self->clientDelegate);
        if (!v80)
        {
LABEL_29:
          if (v14)
          {
            id v38 = [(CarDataClient *)self transactions];
            v39 = [v38 objectForKeyedSubscript:v14];

            if (v39)
            {
              id v40 = [objc_alloc((Class)CAFResponse) initWithValuesAndError:0 error:0];
              ((void (**)(void, id))v39)[2](v39, v40);
            }
          }
          goto LABEL_22;
        }
        id v37 = objc_loadWeakRetained((id *)&self->clientDelegate);
        v81 = [(CarDataClient *)self pluginID];
        [v37 didReceiveConfigFromPluginID:v81 config:v15];

LABEL_28:
        goto LABEL_29;
      }
      if (![v13 isEqualToString:kCarDataProtocolCmdKeyConfigNotify])
      {
        id v23 = CAFDClientLogging();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v95 = [(CarDataClient *)self pluginID];
          *(_DWORD *)buf = 138412802;
          id v115 = v95;
          __int16 v116 = 2112;
          id v117 = v14;
          __int16 v118 = 2112;
          id v119 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Error pluginID: %@ transactionID: %@ unknown command %@", buf, 0x20u);
        }
        goto LABEL_141;
      }
      objc_opt_class();
      char v88 = objc_opt_isKindOfClass();
      v89 = CAFDClientLogging();
      id v23 = v89;
      if ((v88 & 1) == 0)
      {
        if (!os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
          goto LABEL_141;
        }
        __int16 v33 = [(CarDataClient *)self pluginID];
        v109 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        id v115 = v33;
        __int16 v116 = 2112;
        id v117 = v14;
        __int16 v118 = 2112;
        id v119 = v109;
        id v35 = v109;
        id v36 = "Error pluginID: %@ transactionID: %@ wrong config notify values type %@";
        goto LABEL_60;
      }
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG)) {
        -[CarDataClient handleCommand:transactionID:values:errors:priority:].cold.7();
      }

      id v90 = objc_loadWeakRetained((id *)&self->clientDelegate);
      if (!v90) {
        goto LABEL_22;
      }
      id v28 = objc_loadWeakRetained((id *)&self->clientDelegate);
      v58 = [(CarDataClient *)self pluginID];
      [v28 didReceiveConfigFromPluginID:v58 config:v15];
LABEL_77:

      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v23 = CAFDClientLogging();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_141;
      }
      __int16 v33 = [(CarDataClient *)self pluginID];
      v87 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      id v115 = v33;
      __int16 v116 = 2112;
      id v117 = v14;
      __int16 v118 = 2112;
      id v119 = v87;
      id v35 = v87;
      id v36 = "Error pluginID: %@ transactionID: %@ wrong control notify values type %@";
      goto LABEL_60;
    }
    v71 = CARSignpostLogForCategory();
    if (!self
      || (CARSignpostLogForCategory(),
          v72 = objc_claimAutoreleasedReturnValue(),
          os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v72, self),
          v72,
          v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
    {
      if (os_signpost_enabled(v71))
      {
        v73 = [(CarDataClient *)self pluginID];
        *(_DWORD *)buf = 138543362;
        id v115 = v73;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v71, OS_SIGNPOST_EVENT, v12, "Control", "Receive plugin control notify pluginID: %{public}@", buf, 0xCu);
      }
    }

    v74 = CAFDClientLogging();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      v107 = [(CarDataClient *)self pluginID];
      id v108 = [v15 count];
      *(_DWORD *)buf = 138412802;
      id v115 = v107;
      __int16 v116 = 2112;
      id v117 = v14;
      __int16 v118 = 2048;
      id v119 = v108;
      _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "Received pluginID: %@ transactionID: %@ control notify values count: %lu", buf, 0x20u);
    }
    int64_t v32 = (int64_t)objc_loadWeakRetained((id *)&self->clientDelegate);

    if (v32)
    {
      v110[0] = _NSConcreteStackBlock;
      v110[1] = 3221225472;
      v110[2] = __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_41;
      v110[3] = &unk_100035170;
      v110[4] = self;
      [v15 enumerateKeysAndObjectsUsingBlock:v110];
      goto LABEL_22;
    }
  }
LABEL_142:

  return v32;
}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  id v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = +[NSNull null];
    unsigned __int8 v9 = [v6 isEqual:v8];

    if (v9)
    {
      id v10 = 0;
LABEL_13:
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      uint64_t v17 = [*(id *)(a1 + 32) pluginID];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_39;
      v24[3] = &unk_100035120;
      v24[4] = *(void *)(a1 + 32);
      id v14 = v7;
      id v25 = v14;
      id v18 = *(id *)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      id v26 = v18;
      uint64_t v27 = v19;
      [WeakRetained didReceiveRequestFromPluginID:v17 instanceID:v14 value:v10 withResponse:v24];

      goto LABEL_14;
    }
    objc_opt_class();
    id v15 = v6;
    if (v15 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v10 = v15;
    }
    else {
      id v10 = 0;
    }

    if (v10) {
      goto LABEL_13;
    }
    id v20 = CAFDLogging();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_cold_2();
    }

    id v21 = *(void **)(a1 + 32);
    id v10 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:8 userInfo:0];
    uint64_t v22 = *(void *)(a1 + 40);
    id v23 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v21 responseInstanceID:v7 error:v10 transactionID:v22 priority:v23];

    id v14 = v7;
  }
  else
  {

    uint64_t v11 = CAFDLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_cold_1();
    }

    os_signpost_id_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:7 userInfo:0];
    id v10 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v12 responseTransactionID:v13 error:v14 priority:v10];
  }
LABEL_14:
}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_39(void *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  unsigned __int8 v9 = +[NSNumber numberWithUnsignedInteger:a1[7]];
  if (v5) {
    [v6 responseInstanceID:v7 error:v5 transactionID:v8 priority:v9];
  }
  else {
    [v6 responseInstanceID:v7 value:v10 transactionID:v8 priority:v9];
  }
}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_41(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  uint64_t v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v8 = +[NSNull null];
    unsigned __int8 v9 = [v6 isEqual:v8];

    if (v9)
    {
      id v10 = 0;
    }
    else
    {
      objc_opt_class();
      id v12 = v6;
      if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
        id v10 = v12;
      }
      else {
        id v10 = 0;
      }

      if (!v10)
      {
        id v10 = CAFDLogging();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_41_cold_2();
        }
        goto LABEL_13;
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    id v14 = [*(id *)(a1 + 32) pluginID];
    [WeakRetained didReceiveNotificationFromPluginID:v14 instanceID:v7 value:v10];

LABEL_13:
    uint64_t v11 = v7;
    goto LABEL_14;
  }

  uint64_t v11 = CAFDLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_41_cold_1();
  }
LABEL_14:
}

- (void)receiveData:(id)a3 priority:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(CarDataClient *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __38__CarDataClient_receiveData_priority___block_invoke;
  block[3] = &unk_100035198;
  id v10 = v6;
  uint64_t v11 = self;
  unint64_t v12 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __38__CarDataClient_receiveData_priority___block_invoke(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = *(void **)(a1 + 32);
  id v27 = 0;
  uint64_t v3 = [v2 CAF_decodeCarData:&v27];
  id v4 = v27;
  id v5 = v3;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (!v4)
  {
    objc_opt_class();
    id v8 = [v6 objectForKeyedSubscript:kCarDataProtocolKeyTransactionID];
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    objc_opt_class();
    id v10 = [v6 objectForKeyedSubscript:kCarDataProtocolKeyCommand];
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    if (!v11)
    {
      uint64_t v7 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:5 userInfo:0];
      if (v7)
      {
LABEL_30:
        uint64_t v19 = CAFDClientLogging();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v26 = [*(id *)(a1 + 40) pluginID];
          *(_DWORD *)buf = 138412802;
          uint64_t v29 = v26;
          __int16 v30 = 2112;
          id v31 = v9;
          __int16 v32 = 2112;
          __int16 v33 = v7;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Received pluginID: %@ transactionID: %@ error: %@", buf, 0x20u);
        }
        if ([v11 isEqualToString:kCarDataProtocolCmdKeyGeneralError])
        {
          id v20 = [*(id *)(a1 + 40) clientDelegate];
          id v21 = [*(id *)(a1 + 40) pluginID];
          [v20 didReceiveErrorFromPluginID:v21 error:v7];
        }
        if (!v9) {
          goto LABEL_39;
        }
        uint64_t v22 = [*(id *)(a1 + 40) transactions];
        id v23 = [v22 objectForKeyedSubscript:v9];

        if (v23)
        {
          id v24 = [objc_alloc((Class)CAFResponse) initWithError:v7];
          ((void (**)(void, id))v23)[2](v23, v24);
        }
LABEL_38:
        id v25 = [*(id *)(a1 + 40) transactions];
        [v25 removeObjectForKey:v9];

LABEL_39:
        goto LABEL_40;
      }
LABEL_24:
      if (!v9) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
    objc_opt_class();
    id v12 = [v6 objectForKeyedSubscript:kCarDataProtocolKeyError];
    if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    if (v13)
    {
      id v14 = [v13 integerValue];
      CFStringRef v15 = (const __CFString *)NSOSStatusErrorDomain;
    }
    else
    {
      id v16 = *(void **)(a1 + 40);
      uint64_t v17 = [v6 objectForKeyedSubscript:kCarDataProtocolKeyValues];
      id v18 = [v6 objectForKeyedSubscript:kCarDataProtocolKeyErrors];
      uint64_t v7 = [v16 handleCommand:v11 transactionID:v9 values:v17 errors:v18 priority:*(void *)(a1 + 48)];

      if (!v7) {
        goto LABEL_29;
      }
      CFStringRef v15 = @"com.apple.caraccessoryframework.cardata";
      id v14 = v7;
    }
    uint64_t v7 = +[NSError errorWithDomain:v15 code:v14 userInfo:0];
LABEL_29:

    if (v7) {
      goto LABEL_30;
    }
    goto LABEL_24;
  }
  uint64_t v7 = CAFDClientLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __38__CarDataClient_receiveData_priority___block_invoke_cold_1();
  }
LABEL_40:
}

- (void)requestConfigurationWithPriority:(id)a3 withResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CAFDClientLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CarDataClient requestConfigurationWithPriority:withResponse:]();
  }

  [(CarDataClient *)self sendCommand:kCarDataProtocolCmdKeyConfigRequest values:0 priority:v6 withResponse:v7];
}

- (void)registerAllWithPriority:(id)a3 withResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CAFDClientLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CarDataClient registerAllWithPriority:withResponse:]();
  }

  [(CarDataClient *)self sendCommand:kCarDataProtocolCmdKeyRegisterRequest values:kCarDataProtocolValueWildcard priority:v6 withResponse:v7];
}

- (void)unregisterAllWithPriority:(id)a3 withResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CAFDClientLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CarDataClient unregisterAllWithPriority:withResponse:]();
  }

  [(CarDataClient *)self sendCommand:kCarDataProtocolCmdKeyUnregisterRequest values:kCarDataProtocolValueWildcard priority:v6 withResponse:v7];
}

- (void)registerInstanceIDs:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v11 = CAFDClientLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [(CarDataClient *)self pluginID];
    int v14 = 138412802;
    CFStringRef v15 = v13;
    __int16 v16 = 2048;
    id v17 = [v8 count];
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Request pluginID: %@ add registration for instanceIDs count: %ld with priority: %@", (uint8_t *)&v14, 0x20u);
  }
  if (v8 && [v8 count])
  {
    [(CarDataClient *)self addRegistrationFromCache:v8 priority:v9 withResponse:v10];
  }
  else if (v10)
  {
    id v12 = [objc_alloc((Class)CAFResponse) initWithValues:&__NSDictionary0__struct];
    v10[2](v10, v12);
  }
}

- (void)unregisterInstanceIDs:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v11 = CAFDClientLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [(CarDataClient *)self pluginID];
    int v14 = 138412802;
    CFStringRef v15 = v13;
    __int16 v16 = 2048;
    id v17 = [v8 count];
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Request pluginID: %@ remove registration for instanceIDs count: %ld with priority: %@", (uint8_t *)&v14, 0x20u);
  }
  if (v8 && [v8 count])
  {
    [(CarDataClient *)self removeRegistrationFromCache:v8 priority:v9 withResponse:v10];
  }
  else if (v10)
  {
    id v12 = [objc_alloc((Class)CAFResponse) initWithValuesAndError:0 error:0];
    v10[2](v10, v12);
  }
}

- (void)readInstanceIDs:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v11 = CAFDClientLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [(CarDataClient *)self pluginID];
    int v14 = 138412802;
    CFStringRef v15 = v13;
    __int16 v16 = 2048;
    id v17 = [v8 count];
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Request pluginID: %@ read for instanceIDs count: %ld with priority: %@", (uint8_t *)&v14, 0x20u);
  }
  if (v8 && [v8 count])
  {
    [(CarDataClient *)self readFromCache:v8 priority:v9 withResponse:v10];
  }
  else if (v10)
  {
    id v12 = [objc_alloc((Class)CAFResponse) initWithValues:&__NSDictionary0__struct];
    v10[2](v10, v12);
  }
}

- (void)writeValues:(id)a3 priority:(id)a4 withResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v11 = CAFDClientLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = [(CarDataClient *)self pluginID];
    int v17 = 138412802;
    __int16 v18 = v14;
    __int16 v19 = 2048;
    id v20 = [v8 count];
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Request pluginID: %@ write for values count: %ld with priority: %@", (uint8_t *)&v17, 0x20u);
  }
  if (v8 && [v8 count])
  {
    id v12 = CAFDClientLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v15 = [(CarDataClient *)self pluginID];
      id v16 = [v8 count];
      int v17 = 138412802;
      __int16 v18 = v15;
      __int16 v19 = 2048;
      id v20 = v16;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Write values pluginID: %@ instanceID count: %ld with priority: %@", (uint8_t *)&v17, 0x20u);
    }
    [(CarDataClient *)self sendCommand:kCarDataProtocolCmdKeyWriteRequest values:v8 priority:v9 withResponse:v10];
  }
  else if (v10)
  {
    id v13 = [objc_alloc((Class)CAFResponse) initWithValues:&__NSDictionary0__struct];
    v10[2](v10, v13);
  }
}

- (void)requestInstanceID:(id)a3 value:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = CAFDClientLogging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __int16 v21 = [(CarDataClient *)self pluginID];
    CFStringRef v22 = @"YES";
    *(_DWORD *)buf = 138413058;
    id v31 = v21;
    if (!v11) {
      CFStringRef v22 = @"NO";
    }
    __int16 v32 = 2112;
    id v33 = v10;
    __int16 v34 = 2112;
    CFStringRef v35 = v22;
    __int16 v36 = 2112;
    id v37 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Request pluginID: %@ instanceID: %@ with value: %@ and priority: %@", buf, 0x2Au);
  }
  uint64_t v15 = kCarDataProtocolCmdKeyControlRequest;
  id v28 = v10;
  id v16 = v11;
  if (!v11)
  {
    id v16 = +[NSNull null];
  }
  uint64_t v29 = v16;
  int v17 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __63__CarDataClient_requestInstanceID_value_priority_withResponse___block_invoke;
  v23[3] = &unk_1000351C0;
  id v24 = v10;
  id v25 = self;
  id v26 = v12;
  id v27 = v13;
  id v18 = v12;
  id v19 = v10;
  id v20 = v13;
  [(CarDataClient *)self sendCommand:v15 values:v17 priority:v18 withResponse:v23];

  if (!v11) {
}
  }

void __63__CarDataClient_requestInstanceID_value_priority_withResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(void *)(a1 + 56)) {
    goto LABEL_12;
  }
  uint64_t v5 = [v3 error];
  if (v5)
  {
    id v6 = (void *)v5;
  }
  else
  {
    id v6 = [v4 values];

    if (v6)
    {
      id v8 = [v4 values];
      id v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 32)];

      if (v9)
      {
        id v6 = [v9 error];
        id v7 = [v9 value];
      }
      else
      {
        id v6 = 0;
        id v7 = 0;
      }

      goto LABEL_10;
    }
  }
  id v7 = 0;
LABEL_10:
  id v10 = CAFDClientLogging();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [*(id *)(a1 + 40) pluginID];
    id v12 = (void *)v11;
    uint64_t v13 = *(void *)(a1 + 32);
    CFStringRef v14 = @"YES";
    uint64_t v15 = *(void *)(a1 + 48);
    int v16 = 138413314;
    if (!v7) {
      CFStringRef v14 = @"NO";
    }
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    __int16 v20 = 2112;
    CFStringRef v21 = v14;
    __int16 v22 = 2112;
    id v23 = v6;
    __int16 v24 = 2112;
    uint64_t v25 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Response pluginID: %@ instanceID: %@ control with value: %@ error: %@ and priority: %@", (uint8_t *)&v16, 0x34u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));

LABEL_12:
}

- (void)notifyInstanceID:(id)a3 value:(id)a4 priority:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = CAFDClientLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [(CarDataClient *)self pluginID];
    CFStringRef v16 = @"YES";
    *(_DWORD *)buf = 138413058;
    __int16 v20 = v15;
    if (!v9) {
      CFStringRef v16 = @"NO";
    }
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    CFStringRef v24 = v16;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Notify pluginID: %@ instanceID: %@ with value: %@ and priority: %@", buf, 0x2Au);
  }
  uint64_t v12 = kCarDataProtocolCmdKeyControlNotify;
  id v17 = v8;
  uint64_t v13 = v9;
  if (!v9)
  {
    uint64_t v13 = +[NSNull null];
  }
  __int16 v18 = v13;
  CFStringRef v14 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [(CarDataClient *)self sendCommand:v12 values:v14 priority:v10 withResponse:0];

  if (!v9) {
}
  }

- (void)responseInstanceID:(id)a3 value:(id)a4 transactionID:(id)a5 priority:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  CFStringRef v14 = CAFDClientLogging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __int16 v18 = [(CarDataClient *)self pluginID];
    *(_DWORD *)buf = 138413314;
    CFStringRef v19 = @"YES";
    __int16 v23 = v18;
    if (!v11) {
      CFStringRef v19 = @"NO";
    }
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 2112;
    CFStringRef v29 = v19;
    __int16 v30 = 2112;
    id v31 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Response pluginID: %@ instanceID: %@ transactionID: %@ with value: %@ and priority: %@", buf, 0x34u);
  }
  uint64_t v15 = kCarDataProtocolCmdKeyControlResponse;
  id v20 = v10;
  CFStringRef v16 = v11;
  if (!v11)
  {
    CFStringRef v16 = +[NSNull null];
  }
  __int16 v21 = v16;
  id v17 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [(CarDataClient *)self sendCommand:v15 values:v17 transactionID:v12 priority:v13];

  if (!v11) {
}
  }

- (void)responseInstanceID:(id)a3 error:(id)a4 transactionID:(id)a5 priority:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  CFStringRef v14 = CAFDClientLogging();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v19 = [(CarDataClient *)self pluginID];
    *(_DWORD *)buf = 138413314;
    __int16 v23 = v19;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 2112;
    id v31 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Response pluginID: %@ instanceID: %@ transactionID: %@ with error: %@ and priority: %@", buf, 0x34u);
  }
  int64_t v15 = +[CarDataClient osStatusFromCarDataError:](CarDataClient, "osStatusFromCarDataError:", [v11 code]);
  uint64_t v16 = kCarDataProtocolCmdKeyControlResponse;
  id v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15, v10);
  __int16 v21 = v17;
  __int16 v18 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [(CarDataClient *)self sendCommand:v16 errors:v18 transactionID:v12 priority:v13];
}

- (void)responseTransactionID:(id)a3 error:(id)a4 priority:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CAFDClientLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [(CarDataClient *)self pluginID];
    int v14 = 138413058;
    int64_t v15 = v13;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Response pluginID: %@ transactionID: %@ with error: %@ and priority: %@", (uint8_t *)&v14, 0x2Au);
  }
  id v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, +[CarDataClient osStatusFromCarDataError:](CarDataClient, "osStatusFromCarDataError:", [v9 code]), 0);
  [(CarDataClient *)self sendCommand:kCarDataProtocolCmdKeyControlResponse error:v12 transactionID:v8 priority:v10];
}

- (id)cachedValueForInstanceID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int64_t v15 = __Block_byref_object_copy_;
  __int16 v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v5 = [(CarDataClient *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __42__CarDataClient_cachedValueForInstanceID___block_invoke;
  block[3] = &unk_1000351E8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __42__CarDataClient_cachedValueForInstanceID___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) cachedValues];
  uint64_t v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 value];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (int64_t)osStatusFromCarDataError:(unint64_t)a3
{
  if (a3 > 0xA) {
    return -6700;
  }
  else {
    return qword_100029C90[a3];
  }
}

- (CarDataClientDelegate)clientDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->clientDelegate);

  return (CarDataClientDelegate *)WeakRetained;
}

- (void)setClientDelegate:(id)a3
{
}

- (NSNumber)pluginID
{
  return self->_pluginID;
}

- (void)setPluginID:(id)a3
{
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (NSMutableDictionary)cachedValues
{
  return self->_cachedValues;
}

- (void)setCachedValues:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_cachedValues, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_pluginID, 0);

  objc_destroyWeak((id *)&self->clientDelegate);
}

- (void)sendCommand:values:priority:withResponse:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  v1 = [v0 pluginID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v2, v3, "Failed to generate transactionID for pluginID: %@ command: %@", v4, v5, v6, v7, v8);
}

void __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  v1 = [*(id *)(v0 + 72) pluginID];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0((void *)&_mh_execute_header, v2, v3, "Unable to package command for pluginID: %@ transactionID: %@ with priority: %@", v4, v5, v6, v7, v8);
}

void __85__CarDataClient_sendCommand_values_errors_error_transactionID_priority_withResponse___block_invoke_2_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 40) pluginID];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_9_0((void *)&_mh_execute_header, v2, v3, "Unable to send command for pluginID: %@ transactionID: %@ with priority: %@", v4, v5, v6, v7, v8);
}

void __36__CarDataClient_parseValues_errors___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  [(id)OUTLINED_FUNCTION_7_0(v1) pluginID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_8_0();
  id v3 = OUTLINED_FUNCTION_2_1(v2);
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v4, v5, "Parsing characteristic value from pluginID: %@ failed with wrong instanceID data type %@", v6, v7, v8, v9, v10);
}

void __67__CarDataClient_removeRegistrationFromCache_priority_withResponse___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v2 = [*v1 pluginID];
  [*(id *)(v0 + 40) count];
  OUTLINED_FUNCTION_3_1((void *)&_mh_execute_header, v3, v4, "Remove registration from cache pluginID: %@ instanceID count: %ld", v5, v6, v7, v8, 2u);
}

- (void)handleCommand:transactionID:values:errors:priority:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v1 = [v0 pluginID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_1((void *)&_mh_execute_header, v2, v3, "Received pluginID: %@ transactionID: %@ unregister response result: OK", v4, v5, v6, v7, v8);
}

- (void)handleCommand:(void *)a1 transactionID:values:errors:priority:.cold.2(void *a1)
{
  uint64_t v1 = [a1 pluginID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13((void *)&_mh_execute_header, v2, v3, "Error pluginID: %@ read response missing transactionID", v4, v5, v6, v7, v8);
}

- (void)handleCommand:(void *)a1 transactionID:values:errors:priority:.cold.3(void *a1)
{
  uint64_t v1 = [a1 pluginID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13((void *)&_mh_execute_header, v2, v3, "Error pluginID: %@ write response missing transactionID", v4, v5, v6, v7, v8);
}

- (void)handleCommand:(void *)a1 transactionID:values:errors:priority:.cold.4(void *a1)
{
  uint64_t v1 = [a1 pluginID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13((void *)&_mh_execute_header, v2, v3, "Error pluginID: %@ control response missing transactionID", v4, v5, v6, v7, v8);
}

- (void)handleCommand:(void *)a1 transactionID:values:errors:priority:.cold.5(void *a1)
{
  uint64_t v1 = [a1 pluginID];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13((void *)&_mh_execute_header, v2, v3, "Error pluginID: %@ control request missing transactionID", v4, v5, v6, v7, v8);
}

- (void)handleCommand:transactionID:values:errors:priority:.cold.6()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v1 = [v0 pluginID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_1((void *)&_mh_execute_header, v2, v3, "Received pluginID: %@ transactionID: %@ config response", v4, v5, v6, v7, v8);
}

- (void)handleCommand:transactionID:values:errors:priority:.cold.7()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v1 = [v0 pluginID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_1((void *)&_mh_execute_header, v2, v3, "Received pluginID: %@ transactionID: %@ config notify", v4, v5, v6, v7, v8);
}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  [(id)OUTLINED_FUNCTION_7_0(v1) pluginID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_8_0();
  id v3 = OUTLINED_FUNCTION_2_1(v2);
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v4, v5, "Parsing control request value from pluginID: %@ failed with wrong instanceID data type %@", v6, v7, v8, v9, v10);
}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  [(id)OUTLINED_FUNCTION_7_0(v1) pluginID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_8_0();
  id v3 = OUTLINED_FUNCTION_2_1(v2);
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v4, v5, "Parsing control request value from pluginID: %@ failed with wrong request data type %@", v6, v7, v8, v9, v10);
}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_41_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  [(id)OUTLINED_FUNCTION_7_0(v1) pluginID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_8_0();
  id v3 = OUTLINED_FUNCTION_2_1(v2);
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v4, v5, "Parsing control notify value from pluginID: %@ failed with wrong instanceID data type %@", v6, v7, v8, v9, v10);
}

void __68__CarDataClient_handleCommand_transactionID_values_errors_priority___block_invoke_41_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  [(id)OUTLINED_FUNCTION_7_0(v1) pluginID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (void *)OUTLINED_FUNCTION_8_0();
  id v3 = OUTLINED_FUNCTION_2_1(v2);
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v4, v5, "Parsing control notify value from pluginID: %@ failed with wrong notification data type %@", v6, v7, v8, v9, v10);
}

void __38__CarDataClient_receiveData_priority___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v1 = [*(id *)(v0 + 40) pluginID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v2, v3, "Error parsing pluginID: %@ data with error: %@", v4, v5, v6, v7, v8);
}

- (void)requestConfigurationWithPriority:withResponse:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v1 = [v0 pluginID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_1((void *)&_mh_execute_header, v2, v3, "Request pluginID: %@ config with priority: %@", v4, v5, v6, v7, v8);
}

- (void)registerAllWithPriority:withResponse:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v1 = [v0 pluginID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_1((void *)&_mh_execute_header, v2, v3, "Request pluginID: %@ to register all with priority: %@", v4, v5, v6, v7, v8);
}

- (void)unregisterAllWithPriority:withResponse:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v1 = [v0 pluginID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_1((void *)&_mh_execute_header, v2, v3, "Request pluginID: %@ to unregister all with priority: %@", v4, v5, v6, v7, v8);
}

@end