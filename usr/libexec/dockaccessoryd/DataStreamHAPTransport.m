@interface DataStreamHAPTransport
- (BOOL)_isRunning;
- (BOOL)isWriteInProgress;
- (BOOL)lastAccessoryRequestToSendFlag;
- (DataStreamFrameReader)byteReader;
- (DataStreamHAPTransport)initWithAccessory:(id)a3 sessionIdentifier:(int64_t)a4 maxControllerTransportMTU:(unint64_t)a5 workQueue:(id)a6 logIdentifier:(id)a7;
- (DataStreamTransportDelegate)delegate;
- (HAPAccessory)accessory;
- (HAPCharacteristic)interruptCharacteristic;
- (HAPCharacteristic)transportCharacteristic;
- (NSMutableArray)pendingWrites;
- (NSNumber)sessionIdentifier;
- (NSString)logIdentifier;
- (NSString)notificationClientIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_buildWriteRequestWithError:(id *)a3 shouldForceClose:(BOOL)a4;
- (id)_getPendingWritesUpToLength:(unint64_t)a3;
- (unint64_t)maxControllerTransportMTU;
- (void)_cancelAllPendingWritesWithError:(id)a3;
- (void)_doNextWriteOperation;
- (void)_handleCompletionWithResponseTuples:(id)a3;
- (void)_handleInterruptCharacteristicValue:(id)a3;
- (void)_handleReceivedData:(id)a3;
- (void)_notifyDelegateDidClose;
- (void)_notifyDelegateDidFailWithError:(id)a3;
- (void)_notifyDelegateDidOpen;
- (void)_notifyDelegateDidReceiveFrame:(id)a3;
- (void)_notifyWriteOperation:(id)a3 didCompleteWithError:(id)a4;
- (void)_registerForMessages;
- (void)_removeAndMarkCompleteAllCompletedWrites;
- (void)_stopWithError:(id)a3;
- (void)_teardownSessionWithError:(id)a3;
- (void)_writeCharacteristicRequests:(id)a3 completion:(id)a4;
- (void)close;
- (void)connect;
- (void)dealloc;
- (void)invalidate;
- (void)sendRawFrame:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setInterruptCharacteristic:(id)a3;
- (void)setIsWriteInProgress:(BOOL)a3;
- (void)setLastAccessoryRequestToSendFlag:(BOOL)a3;
- (void)setTransportCharacteristic:(id)a3;
@end

@implementation DataStreamHAPTransport

- (DataStreamHAPTransport)initWithAccessory:(id)a3 sessionIdentifier:(int64_t)a4 maxControllerTransportMTU:(unint64_t)a5 workQueue:(id)a6 logIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v26.receiver = self;
  v26.super_class = (Class)DataStreamHAPTransport;
  v15 = [(DataStreamHAPTransport *)&v26 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a6);
    objc_storeWeak((id *)&v16->_accessory, v12);
    uint64_t v17 = +[NSNumber numberWithInteger:a4];
    sessionIdentifier = v16->_sessionIdentifier;
    v16->_sessionIdentifier = (NSNumber *)v17;

    v16->_maxControllerTransportMTU = a5;
    uint64_t v19 = objc_opt_new();
    byteReader = v16->_byteReader;
    v16->_byteReader = (DataStreamFrameReader *)v19;

    v21 = (NSString *)[v14 copy];
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = v21;

    uint64_t v23 = +[NSMutableArray array];
    pendingWrites = v16->_pendingWrites;
    v16->_pendingWrites = (NSMutableArray *)v23;
  }
  return v16;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)DataStreamHAPTransport;
  [(DataStreamHAPTransport *)&v2 dealloc];
}

- (BOOL)_isRunning
{
  objc_super v2 = [(DataStreamHAPTransport *)self transportCharacteristic];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)connect
{
  if ([(DataStreamHAPTransport *)self _isRunning])
  {
    BOOL v3 = self;
    v4 = sub_100083F74();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = sub_100083FD0(v3);
      int v19 = 138543362;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}@Connect called on an already-running transport", (uint8_t *)&v19, 0xCu);
LABEL_19:
    }
  }
  else
  {
    v6 = [(DataStreamHAPTransport *)self accessory];
    BOOL v3 = v6;
    if (v6)
    {
      v4 = [(DataStreamHAPTransport *)v6 characteristicOfType:@"00000138-0000-1000-8000-4D69736D6574" serviceType:@"00000129-0000-1000-8000-4D69736D6574"];
      if (v4)
      {
        v5 = [(DataStreamHAPTransport *)v3 characteristicOfType:@"00000139-0000-1000-8000-4D69736D6574" serviceType:@"00000129-0000-1000-8000-4D69736D6574"];
        v7 = self;
        v8 = sub_100083F74();
        v9 = v8;
        if (v5)
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            v10 = sub_100083FD0(v7);
            int v19 = 138543362;
            v20 = v10;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@[Connect] All good; connected!",
              (uint8_t *)&v19,
              0xCu);
          }
          [(DataStreamHAPTransport *)v7 setTransportCharacteristic:v4];
          [(DataStreamHAPTransport *)v7 setInterruptCharacteristic:v5];
          [(DataStreamHAPTransport *)v7 _registerForMessages];
          [(DataStreamHAPTransport *)v7 _notifyDelegateDidOpen];
        }
        else
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = sub_100083FD0(v7);
            int v19 = 138543362;
            v20 = v17;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@[Connect] Missing characteristics to create transport for HDS over HAP (Interrupt Characteristic does not exist)", (uint8_t *)&v19, 0xCu);
          }
          v18 = +[NSError dkErrorWithCode:4];
          [(DataStreamHAPTransport *)v7 _teardownSessionWithError:v18];
        }
      }
      else
      {
        id v14 = self;
        v15 = sub_100083F74();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = sub_100083FD0(v14);
          int v19 = 138543362;
          v20 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@[Connect] Missing characteristics to create transport for HDS over HAP (Transport Characteristic does not exist)", (uint8_t *)&v19, 0xCu);
        }
        v5 = +[NSError dkErrorWithCode:4];
        [(DataStreamHAPTransport *)v14 _teardownSessionWithError:v5];
      }
      goto LABEL_19;
    }
    v11 = self;
    id v12 = sub_100083F74();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = sub_100083FD0(v11);
      int v19 = 138543362;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@Connect called but accessory is no longer valid", (uint8_t *)&v19, 0xCu);
    }
    v4 = +[NSError errorWithDomain:@"DKErrorDomain" code:38 userInfo:0];
    [(DataStreamHAPTransport *)v11 _teardownSessionWithError:v4];
  }
}

- (void)invalidate
{
}

- (void)close
{
  unsigned int v3 = [(DataStreamHAPTransport *)self _isRunning];
  v4 = self;
  v5 = sub_100083F74();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v6)
    {
      v7 = sub_100083FD0(v4);
      int v9 = 138543362;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@DataStream transport closing.", (uint8_t *)&v9, 0xCu);
    }
    [(DataStreamHAPTransport *)v4 _teardownSessionWithError:0];
  }
  else
  {
    if (v6)
    {
      v8 = sub_100083FD0(v4);
      int v9 = 138543362;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket invoked closed but nothing to clean up.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_stopWithError:(id)a3
{
  id v4 = a3;
  if ([(DataStreamHAPTransport *)self _isRunning]) {
    [(DataStreamHAPTransport *)self _deregisterForMessages];
  }
  [(DataStreamHAPTransport *)self setTransportCharacteristic:0];
  [(DataStreamHAPTransport *)self setInterruptCharacteristic:0];
  id v5 = v4;
  id v6 = v5;
  if (!v5)
  {
    id v5 = +[NSError errorWithDomain:@"DKErrorDomain" code:39 userInfo:0];
  }
  [(DataStreamHAPTransport *)self _cancelAllPendingWritesWithError:v5];
  [(DataStreamHAPTransport *)self setIsWriteInProgress:0];
  if (v6) {
    [(DataStreamHAPTransport *)self _notifyDelegateDidFailWithError:v6];
  }
  else {
    [(DataStreamHAPTransport *)self _notifyDelegateDidClose];
  }
}

- (void)_teardownSessionWithError:(id)a3
{
  id v4 = a3;
  if ([(DataStreamHAPTransport *)self _isRunning])
  {
    id v13 = 0;
    id v5 = [(DataStreamHAPTransport *)self _buildWriteRequestWithError:&v13 shouldForceClose:1];
    id v6 = v13;
    if (v5)
    {
      objc_initWeak((id *)location, self);
      id v14 = v5;
      v7 = +[NSArray arrayWithObjects:&v14 count:1];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10002E6C4;
      v11[3] = &unk_1002733A0;
      objc_copyWeak(&v12, (id *)location);
      [(DataStreamHAPTransport *)self _writeCharacteristicRequests:v7 completion:v11];

      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v8 = self;
      int v9 = sub_100083F74();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = sub_100083FD0(v8);
        *(_DWORD *)location = 138543618;
        *(void *)&location[4] = v10;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: Closing after session force close failed; error=%@",
          location,
          0x16u);
      }
      [(DataStreamHAPTransport *)v8 _stopWithError:v4];
    }
  }
  else
  {
    [(DataStreamHAPTransport *)self _stopWithError:v4];
  }
}

- (void)_registerForMessages
{
  unsigned int v3 = [(DataStreamHAPTransport *)self accessory];
  id v4 = [v3 server];

  id v5 = [(DataStreamHAPTransport *)self interruptCharacteristic];
  int v9 = v5;
  id v6 = +[NSArray arrayWithObjects:&v9 count:1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002E868;
  v8[3] = &unk_1002733C8;
  v8[4] = self;
  v7 = [(DataStreamHAPTransport *)self workQueue];
  [v4 enableEvents:1 forCharacteristics:v6 withCompletionHandler:v8 queue:v7];
}

- (void)_notifyDelegateDidOpen
{
  unsigned int v3 = [(DataStreamHAPTransport *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EA90;
  block[3] = &unk_100273018;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_notifyDelegateDidClose
{
  unsigned int v3 = [(DataStreamHAPTransport *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EB6C;
  block[3] = &unk_100273018;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_notifyDelegateDidFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(DataStreamHAPTransport *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002EC74;
  v7[3] = &unk_100273040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_notifyDelegateDidReceiveFrame:(id)a3
{
  id v4 = a3;
  id v5 = [(DataStreamHAPTransport *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002ED7C;
  v7[3] = &unk_100273040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)sendRawFrame:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v9 = [[DataStreamHAPPendingWrite alloc] initWithData:v7 completion:v6];

  id v8 = [(DataStreamHAPTransport *)self pendingWrites];
  [v8 addObject:v9];

  [(DataStreamHAPTransport *)self _doNextWriteOperation];
}

- (id)_getPendingWritesUpToLength:(unint64_t)a3
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(DataStreamHAPTransport *)self pendingWrites];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    id v8 = 0;
    uint64_t v9 = *(void *)v18;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v4);
        }
        v11 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v10) popNextFrameUpToMaxLength:a3];
        if (![v11 length]) {
          goto LABEL_13;
        }
        if (v7)
        {
          id v12 = v7;
LABEL_11:
          [v12 appendData:v11];
          goto LABEL_12;
        }
        if (v8)
        {
          id v12 = +[NSMutableData dataWithData:v8];
          id v7 = v12;
          goto LABEL_11;
        }
        id v8 = v11;
        id v7 = 0;
LABEL_12:
        a3 -= (unint64_t)[v11 length];
        if (!a3)
        {

          goto LABEL_20;
        }
LABEL_13:

        v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      id v13 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v6 = v13;
      if (!v13) {
        goto LABEL_20;
      }
    }
  }
  id v7 = 0;
  id v8 = 0;
LABEL_20:

  if (v7) {
    id v14 = v7;
  }
  else {
    id v14 = v8;
  }
  id v15 = v14;

  return v15;
}

- (id)_buildWriteRequestWithError:(id *)a3 shouldForceClose:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4)
  {
    id v7 = 0;
    goto LABEL_5;
  }
  id v7 = [(DataStreamHAPTransport *)self _getPendingWritesUpToLength:[(DataStreamHAPTransport *)self maxControllerTransportMTU]];
  if ([v7 length]
    || [(DataStreamHAPTransport *)self lastAccessoryRequestToSendFlag])
  {
LABEL_5:
    id v8 = [HAPTLVUnsignedNumberValue alloc];
    uint64_t v9 = [(DataStreamHAPTransport *)self sessionIdentifier];
    v10 = [(HAPTLVNumberValueBase *)v8 initWithValue:v9];

    if (v4)
    {
      v11 = [HAPTLVUnsignedNumberValue alloc];
      id v12 = +[NSNumber numberWithBool:1];
      id v13 = [(HAPTLVNumberValueBase *)v11 initWithValue:v12];
    }
    else
    {
      id v13 = 0;
    }
    id v14 = [[HAPDataStreamHAPControllerPayload alloc] initWithPayload:v7 sessionIdentifier:v10 forceClose:v13];
    id v15 = [(HAPDataStreamHAPControllerPayload *)v14 serializeWithError:a3];
    id v16 = *a3;
    long long v17 = self;
    long long v18 = sub_100083F74();
    long long v19 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v20 = sub_100083FD0(v17);
        int v25 = 138543362;
        objc_super v26 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@Error: failed to serialize Controller Payload; should not happen!",
          (uint8_t *)&v25,
          0xCu);
      }
      v21 = 0;
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v22 = sub_100083FD0(v17);
        int v25 = 138543874;
        objc_super v26 = v22;
        __int16 v27 = 1024;
        unsigned int v28 = [v7 length];
        __int16 v29 = 1024;
        unsigned int v30 = [(DataStreamHAPTransport *)v17 lastAccessoryRequestToSendFlag];
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}@Writing: %u bytes (rts=%d)", (uint8_t *)&v25, 0x18u);
      }
      long long v17 = [(DataStreamHAPTransport *)v17 transportCharacteristic];
      v21 = +[HAPCharacteristicWriteRequestTuple writeRequestTupleForCharacteristic:v17 value:v15 authorizationData:0 timedWrite:0 responseValue:1 type:0];
    }

    goto LABEL_16;
  }
  v10 = self;
  id v13 = sub_100083F74();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v24 = sub_100083FD0(v10);
    int v25 = 138543362;
    objc_super v26 = v24;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@Writing: nothing to write", (uint8_t *)&v25, 0xCu);
  }
  v21 = 0;
LABEL_16:

  return v21;
}

- (void)_writeCharacteristicRequests:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(DataStreamHAPTransport *)self accessory];
  id v8 = [(DataStreamHAPTransport *)self workQueue];
  [v9 writeCharacteristicValues:v7 timeout:v8 completionQueue:v6 completionHandler:0.0];
}

- (void)_doNextWriteOperation
{
  if (![(DataStreamHAPTransport *)self isWriteInProgress])
  {
    unsigned int v3 = [(DataStreamHAPTransport *)self pendingWrites];
    if (objc_msgSend(v3, "hmf_isEmpty"))
    {
      unsigned __int8 v4 = [(DataStreamHAPTransport *)self lastAccessoryRequestToSendFlag];

      if ((v4 & 1) == 0) {
        return;
      }
    }
    else
    {
    }
    if ([(DataStreamHAPTransport *)self _isRunning])
    {
      id v5 = [(DataStreamHAPTransport *)self accessory];
      if (v5)
      {
        [(DataStreamHAPTransport *)self setIsWriteInProgress:1];
        id v20 = 0;
        id v6 = [(DataStreamHAPTransport *)self _buildWriteRequestWithError:&v20 shouldForceClose:0];
        id v7 = v20;
        if (v7)
        {
          id v8 = self;
          id v9 = sub_100083F74();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v10 = sub_100083FD0(v8);
            *(_DWORD *)buf = 138543362;
            uint64_t v23 = v10;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: building next payload failed and should not do that; closing.",
              buf,
              0xCu);
          }
          [(DataStreamHAPTransport *)v8 _stopTransportForWriteFailureError:v7];
        }
        else if (v6)
        {
          objc_initWeak((id *)buf, self);
          v21 = v6;
          long long v17 = +[NSArray arrayWithObjects:&v21 count:1];
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_10002F79C;
          v18[3] = &unk_1002733A0;
          objc_copyWeak(&v19, (id *)buf);
          [(DataStreamHAPTransport *)self _writeCharacteristicRequests:v17 completion:v18];

          objc_destroyWeak(&v19);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          [(DataStreamHAPTransport *)self _removeAndMarkCompleteAllCompletedWrites];
          [(DataStreamHAPTransport *)self _doNextWriteOperation];
        }
      }
      else
      {
        id v14 = self;
        id v15 = sub_100083F74();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = sub_100083FD0(v14);
          *(_DWORD *)buf = 138543362;
          uint64_t v23 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: HAPAccessory is no longer active; closing.",
            buf,
            0xCu);
        }
        id v7 = +[NSError dkErrorWithCode:40];
        [(DataStreamHAPTransport *)v14 _stopTransportForWriteFailureError:v7];
      }
    }
    else
    {
      v11 = self;
      id v12 = sub_100083F74();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = sub_100083FD0(v11);
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: transport already closed.", buf, 0xCu);
      }
      id v5 = +[NSError errorWithDomain:@"DKErrorDomain" code:39 userInfo:0];
      [(DataStreamHAPTransport *)v11 _cancelAllPendingWritesWithError:v5];
    }
  }
}

- (void)_handleCompletionWithResponseTuples:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(DataStreamHAPTransport *)self isWriteInProgress];
  id v6 = self;
  id v7 = sub_100083F74();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v9 = sub_100083FD0(v6);
      *(_DWORD *)buf = 138543618;
      v50 = v9;
      __int16 v51 = 2112;
      id v52 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@[Transport] Handling responses: %@", buf, 0x16u);
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v42 = v4;
    id v10 = v4;
    id v11 = [v10 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v45;
LABEL_6:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v44 + 1) + 8 * v14);
        id v16 = [v15 characteristic:v42];
        long long v17 = [v16 type];
        unsigned __int8 v18 = [v17 isEqualToString:@"00000138-0000-1000-8000-4D69736D6574"];

        if (v18) {
          break;
        }
        if (v12 == (id)++v14)
        {
          id v12 = [v10 countByEnumeratingWithState:&v44 objects:v48 count:16];
          if (v12) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      id v20 = v15;

      if (!v20) {
        goto LABEL_21;
      }
      v21 = [(DataStreamHAPTransport *)v20 error];

      if (v21)
      {
        v22 = v6;
        uint64_t v23 = sub_100083F74();
        id v4 = v42;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = sub_100083FD0(v22);
          int v25 = [(DataStreamHAPTransport *)v20 error];
          *(_DWORD *)buf = 138543618;
          v50 = v24;
          __int16 v51 = 2112;
          id v52 = v25;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Write response errored out: %@", buf, 0x16u);
        }
        objc_super v26 = [(DataStreamHAPTransport *)v20 error];
        [(DataStreamHAPTransport *)v22 _stopTransportForWriteFailureError:v26];
      }
      else
      {
        unsigned int v30 = [(DataStreamHAPTransport *)v20 value];
        id v43 = 0;
        v31 = +[HAPDataStreamHAPAccessoryPayload parsedFromData:v30 error:&v43];
        id v32 = v43;

        if (v32 || !v31)
        {
          v36 = v6;
          v37 = sub_100083F74();
          id v4 = v42;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = sub_100083FD0(v36);
            *(_DWORD *)buf = 138543618;
            v50 = v38;
            __int16 v51 = 2112;
            id v52 = v32;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply could not be parsed (error=%@)", buf, 0x16u);
          }
          v39 = +[NSError dkErrorWithCode:36];
          [(DataStreamHAPTransport *)v36 _stopTransportForWriteFailureError:v39];
        }
        else
        {
          v33 = [v31 accessoryRequestToSend];

          id v4 = v42;
          if (v33)
          {
            v34 = [v31 accessoryRequestToSend];
            v35 = [v34 value];
            -[DataStreamHAPTransport setLastAccessoryRequestToSendFlag:](v6, "setLastAccessoryRequestToSendFlag:", [v35 BOOLValue]);
          }
          else
          {
            [(DataStreamHAPTransport *)v6 setLastAccessoryRequestToSendFlag:0];
          }
          [(DataStreamHAPTransport *)v6 _removeAndMarkCompleteAllCompletedWrites];
          v40 = [v31 payload];

          if (v40)
          {
            v41 = [v31 payload];
            [(DataStreamHAPTransport *)v6 _handleReceivedData:v41];
          }
          [(DataStreamHAPTransport *)v6 _doNextWriteOperation];
        }
      }
      id v6 = v20;
    }
    else
    {
LABEL_12:

LABEL_21:
      __int16 v27 = v6;
      unsigned int v28 = sub_100083F74();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        __int16 v29 = sub_100083FD0(v27);
        *(_DWORD *)buf = 138543362;
        v50 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Write-response contained no response; weird. Erroring out.",
          buf,
          0xCu);
      }
      id v6 = +[NSError dkErrorWithCode:1];
      [(DataStreamHAPTransport *)v27 _stopTransportForWriteFailureError:v6];
      id v4 = v42;
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v19 = sub_100083FD0(v6);
      *(_DWORD *)buf = 138543362;
      v50 = v19;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Write-response returned but nothing in progress; stale reply? Ignoring",
        buf,
        0xCu);
    }
  }
}

- (void)_removeAndMarkCompleteAllCompletedWrites
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v3 = [(DataStreamHAPTransport *)self pendingWrites];
  id v4 = (char *)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v4) {
    goto LABEL_13;
  }
  unsigned __int8 v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v12;
  while (2)
  {
    id v8 = 0;
    id v9 = &v5[(void)v6];
    do
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v3);
      }
      id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
      if (![v10 isComplete])
      {
        id v9 = &v8[(void)v6];
        goto LABEL_11;
      }
      [(DataStreamHAPTransport *)self _notifyWriteOperation:v10 didCompleteWithError:0];
      ++v8;
    }
    while (v5 != v8);
    unsigned __int8 v5 = (char *)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    id v6 = v9;
    if (v5) {
      continue;
    }
    break;
  }
LABEL_11:

  if (v9)
  {
    unsigned int v3 = [(DataStreamHAPTransport *)self pendingWrites];
    [v3 removeObjectsInRange:0, v9];
LABEL_13:
  }
  [(DataStreamHAPTransport *)self setIsWriteInProgress:0];
}

- (void)_cancelAllPendingWritesWithError:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned __int8 v5 = [(DataStreamHAPTransport *)self pendingWrites];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [(DataStreamHAPTransport *)self _notifyWriteOperation:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9) didCompleteWithError:v4];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  id v10 = [(DataStreamHAPTransport *)self pendingWrites];
  [v10 removeAllObjects];
}

- (void)_notifyWriteOperation:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a4;
  id v7 = [a3 completion];
  uint64_t v8 = [(DataStreamHAPTransport *)self workQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000300E8;
  v11[3] = &unk_1002733F0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, v11);
}

- (void)_handleReceivedData:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  dispatch_data_t v7 = dispatch_data_create([v6 bytes], (size_t)[v6 length], 0, 0);
  uint64_t v8 = [(DataStreamHAPTransport *)self byteReader];
  [v8 pushFrameData:v7];

  id v9 = [(DataStreamHAPTransport *)self byteReader];
  unsigned __int8 v10 = [v9 hasFailed];

  if (v10)
  {
    long long v11 = self;
    id v12 = sub_100083F74();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = sub_100083FD0(v11);
      int v21 = 138543362;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@DataStream has encountered irrecoverable framing issue. Closing stream.", (uint8_t *)&v21, 0xCu);
    }
    long long v14 = +[NSError errorWithDomain:@"DKErrorDomain" code:27 userInfo:0];
    [(DataStreamHAPTransport *)v11 _teardownSessionWithError:v14];
  }
  else
  {
    id v15 = [(DataStreamHAPTransport *)self byteReader];
    unsigned int v16 = [v15 hasCompleteFrame];

    if (v16)
    {
      do
      {
        long long v17 = [(DataStreamHAPTransport *)self byteReader];
        unsigned __int8 v18 = [v17 popRawFrame];

        if (v18) {
          [(DataStreamHAPTransport *)self _notifyDelegateDidReceiveFrame:v18];
        }

        id v19 = [(DataStreamHAPTransport *)self byteReader];
        unsigned __int8 v20 = [v19 hasCompleteFrame];
      }
      while ((v20 & 1) != 0);
    }
  }
}

- (void)_handleInterruptCharacteristicValue:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(DataStreamHAPTransport *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    dispatch_data_t v7 = v6;
  }
  else {
    dispatch_data_t v7 = 0;
  }
  id v8 = v7;

  if (!v8)
  {
    unsigned __int8 v10 = self;
    id v9 = sub_100083F74();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    sub_100083FD0(v10);
    unsigned __int8 v18 = (DataStreamHAPTransport *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    objc_super v26 = v18;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@[Interrupt] Received interrupt value but it was not of the expected type; IGNORING.",
      buf,
      0xCu);
LABEL_18:

    goto LABEL_19;
  }
  id v24 = 0;
  id v9 = +[HAPDataStreamTransportInterruptPayload parsedFromData:v8 error:&v24];
  unsigned __int8 v10 = (DataStreamHAPTransport *)v24;
  if (v10 || !v9)
  {
    unsigned __int8 v18 = self;
    unsigned __int8 v20 = sub_100083F74();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      sub_100083FD0(v18);
      v22 = (DataStreamHAPTransport *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      objc_super v26 = v22;
      __int16 v27 = 2112;
      unsigned int v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@[Interrupt] The interrupt value could not be parsed (error=%@)", buf, 0x16u);
    }
    goto LABEL_17;
  }
  id v11 = [v9 requestToSendIdentifiers];
  id v12 = [v11 bytes];

  id v13 = [v9 requestToSendIdentifiers];
  id v14 = [v13 length];

  id v15 = [(DataStreamHAPTransport *)self sessionIdentifier];
  int v16 = [v15 intValue];

  long long v17 = memchr(v12, v16, (size_t)v14);
  unsigned __int8 v18 = self;
  id v19 = sub_100083F74();
  unsigned __int8 v20 = v19;
  if (!v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      sub_100083FD0(v18);
      uint64_t v23 = (DataStreamHAPTransport *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      objc_super v26 = v23;
      __int16 v27 = 1024;
      LODWORD(v28) = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}@[Interrupt] The interrupt value does not contain any Request To Send (0x%x)", buf, 0x12u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    sub_100083FD0(v18);
    int v21 = (DataStreamHAPTransport *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    objc_super v26 = v21;
    __int16 v27 = 1024;
    LODWORD(v28) = v16;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@[Interrupt] The interrupt value contains valid accessory Request To Send (0x%x)", buf, 0x12u);
  }
  [(DataStreamHAPTransport *)v18 setLastAccessoryRequestToSendFlag:1];
  [(DataStreamHAPTransport *)v18 _doNextWriteOperation];
LABEL_19:
}

- (DataStreamTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (DataStreamTransportDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);

  return (HAPAccessory *)WeakRetained;
}

- (HAPCharacteristic)transportCharacteristic
{
  return (HAPCharacteristic *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransportCharacteristic:(id)a3
{
}

- (HAPCharacteristic)interruptCharacteristic
{
  return (HAPCharacteristic *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInterruptCharacteristic:(id)a3
{
}

- (NSNumber)sessionIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)maxControllerTransportMTU
{
  return self->_maxControllerTransportMTU;
}

- (DataStreamFrameReader)byteReader
{
  return (DataStreamFrameReader *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)notificationClientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableArray)pendingWrites
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isWriteInProgress
{
  return self->_isWriteInProgress;
}

- (void)setIsWriteInProgress:(BOOL)a3
{
  self->_isWriteInProgress = a3;
}

- (BOOL)lastAccessoryRequestToSendFlag
{
  return self->_lastAccessoryRequestToSendFlag;
}

- (void)setLastAccessoryRequestToSendFlag:(BOOL)a3
{
  self->_lastAccessoryRequestToSendFlag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingWrites, 0);
  objc_storeStrong((id *)&self->_notificationClientIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_byteReader, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_interruptCharacteristic, 0);
  objc_storeStrong((id *)&self->_transportCharacteristic, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end