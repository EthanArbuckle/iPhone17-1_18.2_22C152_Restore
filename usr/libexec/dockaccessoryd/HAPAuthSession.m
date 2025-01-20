@interface HAPAuthSession
+ (id)logCategory;
- (BOOL)getToken:(id *)a3 uuid:(id *)a4;
- (HAPAuthSession)initWithRole:(int64_t)a3 instanceId:(id)a4 delegate:(id)a5;
- (HAPAuthSessionDelegate)delegate;
- (NSData)token1;
- (NSData)token2;
- (NSNumber)instanceId;
- (NSUUID)provisionUUID;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (int64_t)role;
- (unint64_t)currentState;
- (unsigned)currentTID;
- (void)_handleAuthExchangeData:(id)a3 withHeader:(BOOL)a4;
- (void)_handleTokenResponse:(id)a3 withHeader:(BOOL)a4;
- (void)_handleTokenUpdateResponse:(id)a3 withHeader:(BOOL)a4;
- (void)_reportAuthFailure;
- (void)_resetSession;
- (void)_sendTokenRequest;
- (void)_sendTokenUpdateRequest:(id)a3;
- (void)continueAuthAfterValidation:(BOOL)a3;
- (void)handleAuthExchangeData:(id)a3 withHeader:(BOOL)a4;
- (void)resetSession;
- (void)sendTokenUpdateRequest:(id)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setCurrentTID:(unsigned __int8)a3;
- (void)setInstanceId:(id)a3;
- (void)setProvisionUUID:(id)a3;
- (void)setToken1:(id)a3;
- (void)setToken2:(id)a3;
@end

@implementation HAPAuthSession

- (HAPAuthSession)initWithRole:(int64_t)a3 instanceId:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v10)
  {
    if ([v10 conformsToProtocol:&OBJC_PROTOCOL___HAPAuthSessionDelegate])
    {
      v27.receiver = self;
      v27.super_class = (Class)HAPAuthSession;
      v12 = [(HAPAuthSession *)&v27 init];
      v13 = v12;
      if (v12)
      {
        v14 = (const char *)sub_100017B60(v12, 0);
        v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v16 = dispatch_queue_create(v14, v15);
        workQueue = v13->_workQueue;
        v13->_workQueue = (OS_dispatch_queue *)v16;

        v13->_role = a3;
        objc_storeStrong((id *)&v13->_instanceId, a4);
        objc_storeWeak((id *)&v13->_delegate, v11);
        v13->_currentState = 0;
        [(HAPAuthSession *)v13 _resetSession];
      }
      v18 = v13;
    }
    else
    {
      v23 = self;
      v24 = sub_100083F74();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = sub_100083FD0(v23);
        *(_DWORD *)buf = 138543362;
        v29 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@Delegate must confirm to the HAPAuthSessionDelegate protocol", buf, 0xCu);
      }
      v18 = v23;
    }
    v19 = v18;
    v22 = v18;
  }
  else
  {
    v19 = self;
    v20 = sub_100083F74();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = sub_100083FD0(v19);
      *(_DWORD *)buf = 138543362;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@A valid delegate is required.", buf, 0xCu);
    }
    v22 = 0;
  }

  return v22;
}

- (void)_resetSession
{
  [(HAPAuthSession *)self setToken2:0];
  [(HAPAuthSession *)self setToken1:0];
  int64_t v3 = [(HAPAuthSession *)self role];
  if (v3 == 1)
  {
    v4 = self;
    uint64_t v5 = 2;
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = self;
    uint64_t v5 = 1;
LABEL_5:
    [(HAPAuthSession *)v4 setCurrentState:v5];
    return;
  }
  v6 = self;
  v7 = sub_100083F74();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = sub_100083FD0(v6);
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2048;
    int64_t v12 = [(HAPAuthSession *)v6 role];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@Invalid auth session role: %tu", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_reportAuthFailure
{
  [(HAPAuthSession *)self _resetSession];
  int64_t v3 = [(HAPAuthSession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v9 = [(HAPAuthSession *)self delegate];
    uint64_t v5 = +[NSError errorWithDomain:@"HAPErrorDomain" code:17 userInfo:0];
    [v9 authSession:self authComplete:v5];
  }
  else
  {
    v6 = self;
    v7 = sub_100083F74();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = sub_100083FD0(v6);
      *(_DWORD *)buf = 138543362;
      __int16 v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement authComplete:", buf, 0xCu);
    }
  }
}

- (void)resetSession
{
  int64_t v3 = [(HAPAuthSession *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021998;
  block[3] = &unk_100273018;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleAuthExchangeData:(id)a3 withHeader:(BOOL)a4
{
  id v6 = a3;
  v7 = [(HAPAuthSession *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021A5C;
  block[3] = &unk_100273150;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_handleAuthExchangeData:(id)a3 withHeader:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  switch([(HAPAuthSession *)self currentState])
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 9uLL:
      v7 = self;
      id v8 = sub_100083F74();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = sub_100083FD0(v7);
        int v10 = 138543618;
        BOOL v11 = v9;
        __int16 v12 = 2048;
        unint64_t v13 = [(HAPAuthSession *)v7 currentState];
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@Unhandled state: %tu", (uint8_t *)&v10, 0x16u);
      }
      break;
    case 1uLL:
      [(HAPAuthSession *)self _sendTokenRequest];
      break;
    case 4uLL:
      [(HAPAuthSession *)self _handleTokenResponse:v6 withHeader:v4];
      break;
    case 8uLL:
      [(HAPAuthSession *)self _handleTokenUpdateResponse:v6 withHeader:v4];
      break;
    default:
      break;
  }
}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  uint64_t v5 = [(HAPAuthSession *)self workQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100021C84;
  v6[3] = &unk_100273178;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)_sendTokenRequest
{
  unsigned __int8 v15 = 0;
  int64_t v3 = [(HAPAuthSession *)self instanceId];
  BOOL v4 = +[HAPProtocolMessages constructTokenRequest:v3 outTID:&v15];

  if (!v4)
  {
    BOOL v11 = self;
    __int16 v12 = sub_100083F74();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unint64_t v13 = sub_100083FD0(v11);
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      v14 = "%{public}@Failed constructing token request";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
    }
LABEL_11:

    [(HAPAuthSession *)v11 _reportAuthFailure];
    goto LABEL_12;
  }
  [(HAPAuthSession *)self setCurrentState:4];
  [(HAPAuthSession *)self setCurrentTID:v15];
  uint64_t v5 = self;
  id v6 = sub_100083F74();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL v7 = sub_100083FD0(v5);
    *(_DWORD *)buf = 138543618;
    v17 = v7;
    __int16 v18 = 2112;
    v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@Sending Token Request: %@", buf, 0x16u);
  }
  id v8 = [(HAPAuthSession *)v5 delegate];
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0)
  {
    BOOL v11 = v5;
    __int16 v12 = sub_100083F74();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unint64_t v13 = sub_100083FD0(v11);
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      v14 = "%{public}@Delegate does not implement sendAuthExchangeData:";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  int v10 = [(HAPAuthSession *)v5 delegate];
  [v10 authSession:v5 sendAuthExchangeData:v4];

LABEL_12:
}

- (void)_handleTokenResponse:(id)a3 withHeader:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = self;
  id v8 = sub_100083F74();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    char v9 = sub_100083FD0(v7);
    CFStringRef v10 = @"No";
    *(_DWORD *)buf = 138543874;
    v26 = v9;
    __int16 v27 = 2112;
    if (v4) {
      CFStringRef v10 = @"Yes";
    }
    id v28 = v6;
    __int16 v29 = 2112;
    CFStringRef v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Received Token Response: %@ withHeader: %@", buf, 0x20u);
  }
  id v23 = 0;
  id v24 = 0;
  unsigned int v11 = +[HAPProtocolMessages parseTokenResponse:v6 expectedTID:[(HAPAuthSession *)v7 currentTID] withHeader:v4 outToken:&v24 outUUID:&v23];
  id v12 = v24;
  id v13 = v23;
  if (!v11)
  {
    v19 = v7;
    v20 = sub_100083F74();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = sub_100083FD0(v19);
      *(_DWORD *)buf = 138543362;
      v26 = v21;
      v22 = "%{public}@Failed to parse token response";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v22, buf, 0xCu);
    }
LABEL_13:

    [(HAPAuthSession *)v19 _reportAuthFailure];
    goto LABEL_14;
  }
  [(HAPAuthSession *)v7 setCurrentState:5];
  [(HAPAuthSession *)v7 setToken1:v12];
  [(HAPAuthSession *)v7 setProvisionUUID:v13];
  v14 = [(HAPAuthSession *)v7 delegate];
  char v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) == 0)
  {
    v19 = v7;
    v20 = sub_100083F74();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = sub_100083FD0(v19);
      *(_DWORD *)buf = 138543362;
      v26 = v21;
      v22 = "%{public}@Delegate does not implement validateUUID:token:";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  dispatch_queue_t v16 = [(HAPAuthSession *)v7 delegate];
  v17 = [(HAPAuthSession *)v7 provisionUUID];
  __int16 v18 = [(HAPAuthSession *)v7 token1];
  [v16 authSession:v7 validateUUID:v17 token:v18];

LABEL_14:
}

- (void)sendTokenUpdateRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPAuthSession *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022428;
  v7[3] = &unk_100273040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_sendTokenUpdateRequest:(id)a3
{
  id v4 = a3;
  unsigned __int8 v16 = 0;
  uint64_t v5 = [(HAPAuthSession *)self instanceId];
  id v6 = +[HAPProtocolMessages constructTokenUpdateRequest:v5 token:v4 outTID:&v16];

  if (!v6)
  {
    char v9 = self;
    unsigned int v11 = sub_100083F74();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = sub_100083FD0(v9);
      *(_DWORD *)buf = 138543362;
      __int16 v18 = v14;
      char v15 = "%{public}@Failed constructing token request";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
    }
LABEL_11:

    [(HAPAuthSession *)v9 _reportAuthFailure];
    goto LABEL_12;
  }
  [(HAPAuthSession *)self setToken1:v4];
  [(HAPAuthSession *)self setCurrentTID:v16];
  [(HAPAuthSession *)self setCurrentState:8];
  BOOL v7 = [(HAPAuthSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  char v9 = self;
  CFStringRef v10 = sub_100083F74();
  unsigned int v11 = v10;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = sub_100083FD0(v9);
      *(_DWORD *)buf = 138543362;
      __int16 v18 = v14;
      char v15 = "%{public}@[HAPAuthSession] Delegate does not implement sendAuthExchangeData:";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v12 = sub_100083FD0(v9);
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v12;
    __int16 v19 = 2112;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@Sending Token Update Request: %@", buf, 0x16u);
  }
  id v13 = [(HAPAuthSession *)v9 delegate];
  [v13 authSession:v9 sendAuthExchangeData:v6];

LABEL_12:
}

- (BOOL)getToken:(id *)a3 uuid:(id *)a4
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100022858;
  v25 = sub_100022868;
  id v26 = 0;
  uint64_t v15 = 0;
  unsigned __int8 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = sub_100022858;
  __int16 v19 = sub_100022868;
  id v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  BOOL v7 = [(HAPAuthSession *)self workQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100022870;
  v10[3] = &unk_1002731A0;
  v10[4] = self;
  v10[5] = &v21;
  v10[6] = &v15;
  v10[7] = &v11;
  dispatch_sync(v7, v10);

  if (a3) {
    *a3 = (id) v22[5];
  }
  if (a4) {
    *a4 = (id) v16[5];
  }
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v8;
}

- (void)_handleTokenUpdateResponse:(id)a3 withHeader:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  LODWORD(v4) = +[HAPProtocolMessages parseTokenUpdateResponse:v6 expectedTID:[(HAPAuthSession *)self currentTID] withHeader:v4];

  if (v4)
  {
    BOOL v7 = [(HAPAuthSession *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v17 = [(HAPAuthSession *)self delegate];
      char v9 = [(HAPAuthSession *)self provisionUUID];
      CFStringRef v10 = [(HAPAuthSession *)self token1];
      [v17 authSession:self confirmUUID:v9 token:v10];
    }
    else
    {
      char v14 = self;
      uint64_t v15 = sub_100083F74();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v16 = sub_100083FD0(v14);
        *(_DWORD *)buf = 138543362;
        __int16 v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement confirmUUID:token:", buf, 0xCu);
      }
      [(HAPAuthSession *)v14 _resetSession];
    }
  }
  else
  {
    uint64_t v11 = self;
    id v12 = sub_100083F74();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = sub_100083FD0(v11);
      *(_DWORD *)buf = 138543362;
      __int16 v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing token update response", buf, 0xCu);
    }
    [(HAPAuthSession *)v11 _reportAuthFailure];
  }
}

+ (id)logCategory
{
  if (qword_1002AD658 != -1) {
    dispatch_once(&qword_1002AD658, &stru_1002731C0);
  }
  v2 = (void *)qword_1002AD660;

  return v2;
}

- (id)logIdentifier
{
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(HAPAuthSession *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  BOOL v7 = [v6 identifier];

  char v8 = +[NSString stringWithFormat:@"%@ %@", v3, v7];

  return v8;
}

- (HAPAuthSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPAuthSessionDelegate *)WeakRetained;
}

- (int64_t)role
{
  return self->_role;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (unsigned)currentTID
{
  return self->_currentTID;
}

- (void)setCurrentTID:(unsigned __int8)a3
{
  self->_currentTID = a3;
}

- (NSNumber)instanceId
{
  return self->_instanceId;
}

- (void)setInstanceId:(id)a3
{
}

- (NSData)token1
{
  return self->_token1;
}

- (void)setToken1:(id)a3
{
}

- (NSData)token2
{
  return self->_token2;
}

- (void)setToken2:(id)a3
{
}

- (NSUUID)provisionUUID
{
  return self->_provisionUUID;
}

- (void)setProvisionUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisionUUID, 0);
  objc_storeStrong((id *)&self->_token2, 0);
  objc_storeStrong((id *)&self->_token1, 0);
  objc_storeStrong((id *)&self->_instanceId, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end