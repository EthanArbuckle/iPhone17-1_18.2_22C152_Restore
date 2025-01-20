@interface CSDCallDataSource
+ (Class)callClass;
- (BOOL)shouldRegisterCall:(id)a3;
- (BOOL)shouldTrackCall:(id)a3;
- (CSDCallDataSource)init;
- (CSDCallDataSource)initWithCallStateController:(id)a3 queue:(id)a4;
- (CSDCallStateController)callStateController;
- (NSArray)calls;
- (NSMapTable)uniqueProxyIdentifierToCallTable;
- (NSMutableOrderedSet)currentCallSet;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)uniqueProxyIdentifierToCallTableSemaphore;
- (id)callWithUniqueProxyIdentifier:(id)a3;
- (void)_postClientNotificationName:(id)a3 forCall:(id)a4 userInfo:(id)a5;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingActiveCalls:(id)a5;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingCalls:(id)a5 andHoldingCalls:(id)a6;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingHeldCalls:(id)a5 andHoldingCalls:(id)a6;
- (void)answerCall:(id)a3 withRequest:(id)a4 whileHoldingActiveCalls:(id)a5;
- (void)disconnectAllCalls:(id)a3 withReason:(int)a4;
- (void)disconnectCall:(id)a3 whileUngroupingCall:(id)a4;
- (void)disconnectCalls:(id)a3 whileHoldingCalls:(id)a4 andUnholdingCalls:(id)a5 andUngroupingCalls:(id)a6;
- (void)disconnectCalls:(id)a3 withReason:(int)a4 whileHoldingCalls:(id)a5 andUnholdingCalls:(id)a6 andUngroupingCalls:(id)a7;
- (void)groupCalls:(id)a3 withCalls:(id)a4;
- (void)handleBytesOfDataUsedChanged:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4 callHistoryIdentifier:(id)a5;
- (void)handleCallStatusChanged:(id)a3;
- (void)handleFrequencyDataChanged:(id)a3 inDirection:(int)a4 forCalls:(id)a5;
- (void)handleMeterLevelChanged:(float)a3 inDirection:(int)a4 forCalls:(id)a5;
- (void)holdCalls:(id)a3 whileUnholdingCalls:(id)a4;
- (void)postClientNotificationName:(id)a3;
- (void)postClientNotificationName:(id)a3 forCall:(id)a4;
- (void)postClientNotificationName:(id)a3 forCall:(id)a4 userInfo:(id)a5;
- (void)registerCall:(id)a3;
- (void)setCurrentCallSet:(id)a3;
- (void)setTTYType:(int)a3 forCalls:(id)a4;
- (void)setUniqueProxyIdentifierToCallTable:(id)a3;
- (void)setUniqueProxyIdentifierToCallTableSemaphore:(id)a3;
- (void)setUplinkMuted:(BOOL)a3 forCalls:(id)a4;
- (void)startTrackingCall:(id)a3;
- (void)stopTrackingCall:(id)a3;
- (void)ungroupCall:(id)a3 fromOtherCallsInGroup:(id)a4;
@end

@implementation CSDCallDataSource

- (CSDCallDataSource)init
{
  return [(CSDCallDataSource *)self initWithCallStateController:0 queue:&_dispatch_main_q];
}

- (CSDCallDataSource)initWithCallStateController:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CSDCallDataSource;
  v8 = [(CSDCallDataSource *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    objc_storeWeak((id *)&v9->_callStateController, v6);
    uint64_t v10 = +[NSMapTable strongToWeakObjectsMapTable];
    uniqueProxyIdentifierToCallTable = v9->_uniqueProxyIdentifierToCallTable;
    v9->_uniqueProxyIdentifierToCallTable = (NSMapTable *)v10;

    dispatch_semaphore_t v12 = dispatch_semaphore_create(1);
    uniqueProxyIdentifierToCallTableSemaphore = v9->_uniqueProxyIdentifierToCallTableSemaphore;
    v9->_uniqueProxyIdentifierToCallTableSemaphore = (OS_dispatch_semaphore *)v12;

    uint64_t v14 = +[NSMutableOrderedSet orderedSet];
    currentCallSet = v9->_currentCallSet;
    v9->_currentCallSet = (NSMutableOrderedSet *)v14;
  }
  return v9;
}

- (NSArray)calls
{
  v2 = [(CSDCallDataSource *)self currentCallSet];
  v3 = [v2 array];
  id v4 = [v3 copy];

  return (NSArray *)v4;
}

+ (Class)callClass
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"CSDCallDataSource.m" lineNumber:52 description:@"All CSDCallDataSource subclasses must override +callClass"];

  return 0;
}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallDataSource *)self uniqueProxyIdentifierToCallTableSemaphore];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = [(CSDCallDataSource *)self uniqueProxyIdentifierToCallTable];
  id v7 = [v6 objectForKey:v4];

  v8 = [(CSDCallDataSource *)self uniqueProxyIdentifierToCallTableSemaphore];
  dispatch_semaphore_signal(v8);

  return v7;
}

- (BOOL)shouldTrackCall:(id)a3
{
  id v3 = a3;
  if ([v3 status] == 6 || !objc_msgSend(v3, "status"))
  {
    char isKindOfClass = 0;
  }
  else
  {
    [(id)objc_opt_class() callClass];
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)shouldRegisterCall:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallDataSource *)self currentCallSet];
  BOOL v6 = ([v5 containsObject:v4] & 1) != 0
    || [(CSDCallDataSource *)self shouldTrackCall:v4]
    || [v4 disconnectedReason] == 21;

  return v6;
}

- (void)registerCall:(id)a3
{
  id v9 = a3;
  if (-[CSDCallDataSource shouldTrackCall:](self, "shouldTrackCall:"))
  {
    id v4 = [(CSDCallDataSource *)self callStateController];
    [v4 setCallDelegatesIfNeeded:v9];

    v5 = [(CSDCallDataSource *)self currentCallSet];
    unsigned __int8 v6 = [v5 containsObject:v9];

    if ((v6 & 1) == 0) {
      [(CSDCallDataSource *)self startTrackingCall:v9];
    }
  }
  else
  {
    id v7 = [(CSDCallDataSource *)self currentCallSet];
    unsigned int v8 = [v7 containsObject:v9];

    if (v8) {
      [(CSDCallDataSource *)self stopTrackingCall:v9];
    }
  }
}

- (void)startTrackingCall:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallDataSource *)self currentCallSet];
  [v5 addObject:v4];

  unsigned __int8 v6 = [(CSDCallDataSource *)self uniqueProxyIdentifierToCallTableSemaphore];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  id v7 = [(CSDCallDataSource *)self uniqueProxyIdentifierToCallTable];
  unsigned int v8 = [v4 uniqueProxyIdentifier];
  [v7 setObject:v4 forKey:v8];

  id v9 = [(CSDCallDataSource *)self uniqueProxyIdentifierToCallTableSemaphore];
  dispatch_semaphore_signal(v9);

  uint64_t v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Started tracking call: %@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)stopTrackingCall:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCallDataSource *)self currentCallSet];
  [v5 removeObject:v4];

  unsigned __int8 v6 = [(CSDCallDataSource *)self uniqueProxyIdentifierToCallTableSemaphore];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  id v7 = [(CSDCallDataSource *)self uniqueProxyIdentifierToCallTable];
  unsigned int v8 = [v4 uniqueProxyIdentifier];
  [v7 removeObjectForKey:v8];

  id v9 = [(CSDCallDataSource *)self uniqueProxyIdentifierToCallTableSemaphore];
  dispatch_semaphore_signal(v9);

  uint64_t v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Stopped tracking call: %@", (uint8_t *)&v11, 0xCu);
  }
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingCalls:(id)a5 andHoldingCalls:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = sub_100008DCC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v35 = v9;
    __int16 v36 = 2112;
    id v37 = v11;
    __int16 v38 = 2112;
    id v39 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Asked to answer call %@ while disconnecting calls %@ and holding calls %@", buf, 0x20u);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * (void)v18) hold];
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v16);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v19 = v11;
  id v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)v23), "disconnect", (void)v24);
        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v21);
  }

  [v9 answerWithRequest:v10];
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingHeldCalls:(id)a5 andHoldingCalls:(id)a6
{
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileDisconnectingActiveCalls:(id)a5
{
}

- (void)answerCall:(id)a3 withRequest:(id)a4 whileHoldingActiveCalls:(id)a5
{
}

- (void)holdCalls:(id)a3 whileUnholdingCalls:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v5;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asked to hold calls %@ while unholding calls %@", buf, 0x16u);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * (void)v12) hold];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v6;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v17), "unhold", (void)v18);
        uint64_t v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void)groupCalls:(id)a3 withCalls:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v5;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asked to group calls %@ with calls %@", buf, 0x16u);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v14 = [v6 firstObject];
        [v13 groupWithOtherCall:v14];

        if ([v13 isOnHold]) {
          [v13 unhold];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v15 = v6;
  id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
        if (objc_msgSend(v20, "isOnHold", (void)v21)) {
          [v20 unhold];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }
}

- (void)ungroupCall:(id)a3 fromOtherCallsInGroup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v5;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asked to ungroup call %@ from other calls in group %@", buf, 0x16u);
  }

  [v5 ungroup];
  if ([v5 isOnHold]) {
    [v5 unhold];
  }
  if ([v6 count] == (id)1)
  {
    id v8 = [v6 firstObject];
    [v8 ungroup];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isOnHold", (void)v15) & 1) == 0) {
          [v14 hold];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)disconnectCall:(id)a3 whileUngroupingCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asked to disconnect call %@ while ungrouping call %@", buf, 0x16u);
  }

  id v12 = v6;
  id v9 = +[NSArray arrayWithObjects:&v12 count:1];
  id v11 = v7;
  id v10 = +[NSArray arrayWithObjects:&v11 count:1];
  [(CSDCallDataSource *)self disconnectCalls:v9 withReason:0 whileHoldingCalls:&__NSArray0__struct andUnholdingCalls:&__NSArray0__struct andUngroupingCalls:v10];
}

- (void)disconnectAllCalls:(id)a3 withReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asked to disconnect all calls %@", (uint8_t *)&v8, 0xCu);
  }

  [(CSDCallDataSource *)self disconnectCalls:v6 withReason:v4 whileHoldingCalls:&__NSArray0__struct andUnholdingCalls:&__NSArray0__struct andUngroupingCalls:&__NSArray0__struct];
}

- (void)disconnectCalls:(id)a3 whileHoldingCalls:(id)a4 andUnholdingCalls:(id)a5 andUngroupingCalls:(id)a6
{
}

- (void)disconnectCalls:(id)a3 withReason:(int)a4 whileHoldingCalls:(id)a5 andUnholdingCalls:(id)a6 andUngroupingCalls:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  __int16 v15 = sub_100008DCC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v57 = v11;
    __int16 v58 = 2048;
    uint64_t v59 = (int)v10;
    __int16 v60 = 2112;
    id v61 = v12;
    __int16 v62 = 2112;
    id v63 = v13;
    __int16 v64 = 2112;
    id v65 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Asked to disconnect calls %@ reason: %lu, while holding calls %@ and unholding calls %@ and ungrouping calls %@", buf, 0x34u);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v16 = v11;
  id v17 = [v16 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v49;
    do
    {
      long long v20 = 0;
      do
      {
        if (*(void *)v49 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v48 + 1) + 8 * (void)v20) disconnectCallWithReason:v10];
        long long v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v18);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v21 = v12;
  id v22 = [v21 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v45;
    do
    {
      long long v25 = 0;
      do
      {
        if (*(void *)v45 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v44 + 1) + 8 * (void)v25) hold];
        long long v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v23);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v26 = v13;
  id v27 = [v26 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v41;
    do
    {
      __int16 v30 = 0;
      do
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v40 + 1) + 8 * (void)v30) unhold];
        __int16 v30 = (char *)v30 + 1;
      }
      while (v28 != v30);
      id v28 = [v26 countByEnumeratingWithState:&v40 objects:v53 count:16];
    }
    while (v28);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v31 = v14;
  id v32 = [v31 countByEnumeratingWithState:&v36 objects:v52 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v37;
    do
    {
      id v35 = 0;
      do
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(v31);
        }
        objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * (void)v35), "ungroup", (void)v36);
        id v35 = (char *)v35 + 1;
      }
      while (v33 != v35);
      id v33 = [v31 countByEnumeratingWithState:&v36 objects:v52 count:16];
    }
    while (v33);
  }
}

- (void)setTTYType:(int)a3 forCalls:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v18 = v4;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Asked to set TTY type to %d for calls %@", buf, 0x12u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "setTtyType:", v4, (void)v12);
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)setUplinkMuted:(BOOL)a3 forCalls:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v18 = v4;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Asked to set uplink muted to %d for calls %@", buf, 0x12u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v11), "setUplinkMuted:", v4, (void)v12);
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)handleCallStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "handleCallStatusChanged %@", (uint8_t *)&v6, 0xCu);
  }

  if ([v4 status] == 6) {
    [v4 updateForDisconnection];
  }
  [v4 propertiesChanged];
  [(CSDCallDataSource *)self registerCall:v4];
}

- (void)handleBytesOfDataUsedChanged:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4 callHistoryIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218242;
    int64_t v14 = a3;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "bytesOfDataUsed: %ld callHistoryIdentifier: %@", (uint8_t *)&v13, 0x16u);
  }

  id v11 = [(CSDCallDataSource *)self callStateController];
  long long v12 = [v11 recentsController];

  [v12 updateBytesOfDataUsed:a3 forCallWithUniqueProxyIdentifier:v9 callHistoryIdentifier:v8];
}

- (void)handleFrequencyDataChanged:(id)a3 inDirection:(int)a4 forCalls:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CSDCallDataSource *)self callStateController];
  [v10 updateClientsWithFrequency:v9 inDirection:v5 forCalls:v8];
}

- (void)handleMeterLevelChanged:(float)a3 inDirection:(int)a4 forCalls:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v10 = [(CSDCallDataSource *)self callStateController];
  *(float *)&double v9 = a3;
  [v10 updateClientsWithMeterLevel:v5 inDirection:v8 forCalls:v9];
}

- (void)postClientNotificationName:(id)a3
{
}

- (void)postClientNotificationName:(id)a3 forCall:(id)a4
{
}

- (void)postClientNotificationName:(id)a3 forCall:(id)a4 userInfo:(id)a5
{
}

- (void)_postClientNotificationName:(id)a3 forCall:(id)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CSDCallDataSource *)self callStateController];
  [v11 sendClientsNotificationName:v10 forCall:v9 userInfo:v8];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDCallStateController)callStateController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callStateController);

  return (CSDCallStateController *)WeakRetained;
}

- (NSMapTable)uniqueProxyIdentifierToCallTable
{
  return self->_uniqueProxyIdentifierToCallTable;
}

- (void)setUniqueProxyIdentifierToCallTable:(id)a3
{
}

- (OS_dispatch_semaphore)uniqueProxyIdentifierToCallTableSemaphore
{
  return self->_uniqueProxyIdentifierToCallTableSemaphore;
}

- (void)setUniqueProxyIdentifierToCallTableSemaphore:(id)a3
{
}

- (NSMutableOrderedSet)currentCallSet
{
  return self->_currentCallSet;
}

- (void)setCurrentCallSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCallSet, 0);
  objc_storeStrong((id *)&self->_uniqueProxyIdentifierToCallTableSemaphore, 0);
  objc_storeStrong((id *)&self->_uniqueProxyIdentifierToCallTable, 0);
  objc_destroyWeak((id *)&self->_callStateController);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end