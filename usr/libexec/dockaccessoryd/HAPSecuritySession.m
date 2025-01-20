@interface HAPSecuritySession
+ (id)logCategory;
- (BOOL)_initializeSetupSession:(unint64_t)a3;
- (BOOL)enhancedEncryption;
- (BOOL)isOpen;
- (BOOL)isOpening;
- (HAPSecuritySession)initWithRole:(unint64_t)a3 resumeSessionID:(unint64_t)a4 enhancedEncryption:(BOOL)a5 delegate:(id)a6;
- (HAPSecuritySessionDelegate)delegate;
- (HAPSecuritySessionEncryption)encryption;
- (NSData)broadcastKey;
- (NSDictionary)additionalDerivedKeys;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (PairingSessionPrivate)pairingSession;
- (id)_broadcastInfo;
- (id)_handleLocalPairingIdentityRequestWithStatus:(int *)a3;
- (id)_handlePeerPairingIdentityRequestWithIdentifier:(id)a3 status:(int *)a4;
- (id)_inputInfo;
- (id)_outputInfo;
- (id)decryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5;
- (id)encryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5;
- (id)logIdentifier;
- (unint64_t)resumeSessionID;
- (unint64_t)role;
- (unint64_t)sessionStartTime;
- (unint64_t)state;
- (void)_closeWithError:(id)a3;
- (void)_handleSetupExchangeComplete;
- (void)_initiateClientSessionSetupExchange;
- (void)_notifyOpened;
- (void)_notifyOpening;
- (void)_processSetupExchangeData:(id)a3 error:(id)a4;
- (void)close;
- (void)closeWithError:(id)a3;
- (void)dealloc;
- (void)open;
- (void)reallyOpen;
- (void)receivedSetupExchangeData:(id)a3 error:(id)a4;
- (void)setAdditionalDerivedKeys:(id)a3;
- (void)setBroadcastKey:(id)a3;
- (void)setEncryption:(id)a3;
- (void)setEnhancedEncryption:(BOOL)a3;
- (void)setPairingSession:(PairingSessionPrivate *)a3;
- (void)setResumeSessionID:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation HAPSecuritySession

- (HAPSecuritySession)initWithRole:(unint64_t)a3 resumeSessionID:(unint64_t)a4 enhancedEncryption:(BOOL)a5 delegate:(id)a6
{
  id v10 = a6;
  if (v10)
  {
    v24.receiver = self;
    v24.super_class = (Class)HAPSecuritySession;
    v11 = [(HAPSecuritySession *)&v24 init];
    v12 = v11;
    if (v11)
    {
      v13 = (const char *)sub_100017B60(v11, 0);
      v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
      queue = v12->_queue;
      v12->_queue = (OS_dispatch_queue *)v15;

      objc_storeWeak((id *)&v12->_delegate, v10);
      v12->_role = a3;
      v17 = objc_alloc_init(HAPSecuritySessionEncryption);
      encryption = v12->_encryption;
      v12->_encryption = v17;

      v12->_enhancedEncryption = a5;
      [(HAPSecuritySession *)v12 _initializeSetupSession:a4];
      v12->_state = 0;
    }
    v19 = v12;
    v20 = v19;
  }
  else
  {
    v19 = self;
    v21 = sub_100083F74();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = sub_100083FD0(v19);
      *(_DWORD *)buf = 138543362;
      v26 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@A valid delegate is required", buf, 0xCu);
    }
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  v2 = self;
  pairingSession = v2->_pairingSession;
  if (pairingSession)
  {
    CFRelease(pairingSession);
    v2->_pairingSession = 0;
  }
  v4 = objc_alloc_init(HAPSecuritySessionEncryption);
  [(HAPSecuritySession *)v2 setEncryption:v4];

  v2->_resumeSessionID = 0;
  v5.receiver = v2;
  v5.super_class = (Class)HAPSecuritySession;
  [(HAPSecuritySession *)&v5 dealloc];
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (void)setState:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t state = a3;

  os_unfair_lock_unlock(p_lock);
}

- (NSData)broadcastKey
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_broadcastKey;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setBroadcastKey:(id)a3
{
  v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  broadcastKey = self->_broadcastKey;
  self->_broadcastKey = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDictionary)additionalDerivedKeys
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_additionalDerivedKeys;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setAdditionalDerivedKeys:(id)a3
{
  v4 = (NSDictionary *)a3;
  os_unfair_lock_lock_with_options();
  additionalDerivedKeys = self->_additionalDerivedKeys;
  self->_additionalDerivedKeys = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)resumeSessionID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t resumeSessionID = self->_resumeSessionID;
  os_unfair_lock_unlock(p_lock);
  return resumeSessionID;
}

- (void)setResumeSessionID:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_unint64_t resumeSessionID = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isOpen
{
  return (id)[(HAPSecuritySession *)self state] == (id)2;
}

- (BOOL)isOpening
{
  return (id)[(HAPSecuritySession *)self state] == (id)1;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(HAPSecuritySession *)self role];
  CFStringRef v5 = @"unknown";
  v6 = @"server";
  if (v4 != 1) {
    v6 = @"unknown";
  }
  if (!v4) {
    v6 = @"client";
  }
  v7 = v6;
  unint64_t v8 = [(HAPSecuritySession *)self state];
  if (v8 <= 3) {
    CFStringRef v5 = off_100273690[v8];
  }
  v9 = +[NSString stringWithFormat:@"<%@: %p, Role = %@, State = %@>", v3, self, v7, v5];

  return (NSString *)v9;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(HAPSecuritySession *)self role];
  CFStringRef v5 = @"unknown";
  v6 = @"server";
  if (v4 != 1) {
    v6 = @"unknown";
  }
  if (!v4) {
    v6 = @"client";
  }
  v7 = v6;
  unint64_t v8 = [(HAPSecuritySession *)self state];
  if (v8 <= 3) {
    CFStringRef v5 = off_100273690[v8];
  }
  v9 = +[NSString stringWithFormat:@"<%@, Role = %@, State = %@>", v3, v7, v5];

  return (NSString *)v9;
}

- (BOOL)_initializeSetupSession:(unint64_t)a3
{
  uint64_t v3 = self;
  if (a3)
  {
    [(HAPSecuritySession *)self role];
    if (!PairingSessionCreate())
    {
      uint64_t v3 = v3;
      v11 = sub_100083F74();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = sub_100083FD0(v3);
        *(_DWORD *)buf = 138543618;
        v14 = v12;
        __int16 v15 = 2048;
        unint64_t v16 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@Created pairing session with resumeSessionID: %llu", buf, 0x16u);
      }
      PairingSessionSetResumeInfo();
      goto LABEL_10;
    }
  }
  [(HAPSecuritySession *)v3 role];
  int v5 = PairingSessionCreate();
  if (!v5)
  {
LABEL_10:
    [(HAPSecuritySession *)v3 pairingSession];
    PairingSessionSetFlags();
    return 1;
  }
  int v6 = v5;
  v7 = v3;
  unint64_t v8 = sub_100083F74();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = sub_100083FD0(v7);
    *(_DWORD *)buf = 138543618;
    v14 = v9;
    __int16 v15 = 2048;
    unint64_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to create pairing session with error: %ld", buf, 0x16u);
  }
  return 0;
}

- (id)_handleLocalPairingIdentityRequestWithStatus:(int *)a3
{
  unint64_t v4 = self;
  int v5 = sub_100083F74();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = sub_100083FD0(v4);
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Received request for local pairing identity", buf, 0xCu);
  }
  v7 = [(HAPSecuritySession *)v4 delegate];
  unint64_t v8 = v7;
  if (v7)
  {
    id v18 = 0;
    v9 = [v7 securitySession:v4 didReceiveLocalPairingIdentityRequestWithError:&v18];
    id v10 = v18;
    if (!v9)
    {
      v11 = v4;
      v12 = sub_100083F74();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = sub_100083FD0(v11);
        *(_DWORD *)buf = 138543618;
        v20 = v13;
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@The delegate failed to retreive the lcoal pairing identity with error: %@", buf, 0x16u);
      }
      if (a3) {
        *a3 = -6727;
      }
      [(HAPSecuritySession *)v11 closeWithError:v10];
    }
  }
  else
  {
    v14 = v4;
    __int16 v15 = sub_100083F74();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unint64_t v16 = sub_100083FD0(v14);
      *(_DWORD *)buf = 138543362;
      v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get local pairing identity, the delegate is missing", buf, 0xCu);
    }
    id v10 = +[NSError hapErrorWithcode:9 description:@"Failed to get local pairing identity." reason:@"The delegate is mising." suggestion:0 underlyingError:0];
    [(HAPSecuritySession *)v14 closeWithError:v10];
    v9 = 0;
    if (a3) {
      *a3 = -6705;
    }
  }

  return v9;
}

- (id)_handlePeerPairingIdentityRequestWithIdentifier:(id)a3 status:(int *)a4
{
  id v6 = a3;
  v7 = self;
  unint64_t v8 = sub_100083F74();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = sub_100083FD0(v7);
    *(_DWORD *)buf = 138543618;
    v23 = v9;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Received request for peer pairing identity with identifier: %@", buf, 0x16u);
  }
  id v10 = [(HAPSecuritySession *)v7 delegate];
  v11 = v10;
  if (v10)
  {
    id v21 = 0;
    v12 = [v10 securitySession:v7 didReceiveRequestForPeerPairingIdentityWithIdentifier:v6 error:&v21];
    id v13 = v21;
    if (!v12)
    {
      v14 = v7;
      __int16 v15 = sub_100083F74();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        unint64_t v16 = sub_100083FD0(v14);
        *(_DWORD *)buf = 138543618;
        v23 = v16;
        __int16 v24 = 2112;
        id v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@The delegate failed to retreive the peer pairing identity with error: %@", buf, 0x16u);
      }
      if (a4) {
        *a4 = -6727;
      }
      [(HAPSecuritySession *)v14 closeWithError:v13];
    }
  }
  else
  {
    v17 = v7;
    id v18 = sub_100083F74();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_100083FD0(v17);
      *(_DWORD *)buf = 138543362;
      v23 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get peer pairing identity, the delegate is missing", buf, 0xCu);
    }
    id v13 = +[NSError hapErrorWithcode:9 description:@"Failed to get peer pairing identity." reason:@"The delegate is mising." suggestion:0 underlyingError:0];
    [(HAPSecuritySession *)v17 closeWithError:v13];
    v12 = 0;
    if (a4) {
      *a4 = -6705;
    }
  }

  return v12;
}

- (void)_initiateClientSessionSetupExchange
{
  v2 = self;
  uint64_t v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t v4 = sub_100083FD0(v2);
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@Sending initial client exchange", (uint8_t *)&v5, 0xCu);
  }
  [(HAPSecuritySession *)v2 _notifyOpening];
  [(HAPSecuritySession *)v2 _processSetupExchangeData:0 error:0];
}

- (void)receivedSetupExchangeData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(HAPSecuritySession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042940;
  block[3] = &unk_100273418;
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)_processSetupExchangeData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(HAPSecuritySession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042BC4;
  block[3] = &unk_100273418;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (id)_inputInfo
{
  v2 = [(HAPSecuritySession *)self role];
  if (v2 == (void *)1)
  {
    uint64_t v3 = "Control-Write-Encryption-Key";
    uint64_t v4 = 28;
  }
  else
  {
    if (v2) {
      goto LABEL_6;
    }
    uint64_t v3 = "Control-Read-Encryption-Key";
    uint64_t v4 = 27;
  }
  v2 = +[NSData dataWithBytes:v3 length:v4];
LABEL_6:

  return v2;
}

- (id)_outputInfo
{
  v2 = [(HAPSecuritySession *)self role];
  if (v2 == (void *)1)
  {
    uint64_t v3 = "Control-Read-Encryption-Key";
    uint64_t v4 = 27;
  }
  else
  {
    if (v2) {
      goto LABEL_6;
    }
    uint64_t v3 = "Control-Write-Encryption-Key";
    uint64_t v4 = 28;
  }
  v2 = +[NSData dataWithBytes:v3 length:v4];
LABEL_6:

  return v2;
}

- (id)_broadcastInfo
{
  return +[NSData dataWithBytes:"Broadcast-Encryption-Key" length:24];
}

- (void)_handleSetupExchangeComplete
{
  v2 = self;
  uint64_t v3 = sub_100083F74();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = sub_100083FD0(v2);
    *(_DWORD *)buf = 138543362;
    v54 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@Deriving session keys", buf, 0xCu);
  }
  int v5 = [(HAPSecuritySession *)v2 _inputInfo];
  [(HAPSecuritySession *)v2 pairingSession];
  id v6 = v5;
  [v6 bytes];
  [v6 length];
  int v7 = PairingSessionDeriveKey();
  int v44 = v7;
  if (v7)
  {
    id v8 = +[NSError errorWithDomain:@"HAPErrorDomain" code:v7 userInfo:0];
    id v9 = v2;
    id v10 = sub_100083F74();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = sub_100083FD0(v9);
      *(_DWORD *)v49 = 138543618;
      v50 = v11;
      __int16 v51 = 2112;
      id v52 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create input key with error: %@", v49, 0x16u);
    }
    [(HAPSecuritySession *)v9 _closeWithError:v8];
  }
  else
  {
    id v12 = [(HAPSecuritySession *)v2 _outputInfo];
    [(HAPSecuritySession *)v2 pairingSession];
    id v8 = v12;
    [v8 bytes];
    [v8 length];
    int v13 = PairingSessionDeriveKey();
    int v44 = v13;
    if (v13)
    {
      v14 = +[NSError errorWithDomain:@"HAPErrorDomain" code:v13 userInfo:0];
      __int16 v15 = v2;
      unint64_t v16 = sub_100083F74();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = sub_100083FD0(v15);
        *(_DWORD *)v45 = 138543618;
        v46 = v17;
        __int16 v47 = 2112;
        v48 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create output key with error: %@", v45, 0x16u);
      }
      [(HAPSecuritySession *)v15 _closeWithError:v14];
    }
    else
    {
      v43 = 0;
      [(HAPSecuritySession *)v2 pairingSession];
      if (!PairingSessionGetResumeInfo())
      {
        id v18 = v2;
        v19 = sub_100083F74();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = sub_100083FD0(v18);
          *(_DWORD *)v45 = 138543618;
          v46 = v20;
          __int16 v47 = 2048;
          v48 = v43;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@Got resumeSessionID: %llu", v45, 0x16u);
        }
        [(HAPSecuritySession *)v18 setResumeSessionID:v43];
      }
      id v21 = [(HAPSecuritySession *)v2 _broadcastInfo];
      id v22 = [(HAPSecuritySession *)v2 _handleLocalPairingIdentityRequestWithStatus:&v44];
      v23 = &_sSayxGSEsSERzlMc_ptr;
      if (v44) {
        goto LABEL_19;
      }
      if ([(HAPSecuritySession *)v2 pairingSession])
      {
        [(HAPSecuritySession *)v2 pairingSession];
        v40 = [v22 publicKey];
        id v39 = [v40 data];
        [v39 bytes];
        __int16 v24 = [v22 publicKey];
        id v25 = [v24 data];
        [v25 length];
        id v26 = v21;
        [v26 bytes];
        [v26 length];
        v23 = &_sSayxGSEsSERzlMc_ptr;
        int v44 = PairingSessionDeriveKey();
      }
      if (v44)
      {
LABEL_19:
        [(HAPSecuritySession *)v2 setBroadcastKey:0];
      }
      else
      {
        v38 = [v23[136] dataWithBytes:v45 length:32];
        [(HAPSecuritySession *)v2 setBroadcastKey:v38];
      }
      v27 = [(HAPSecuritySession *)v2 delegate];
      char v28 = objc_opt_respondsToSelector();

      if (v28)
      {
        v29 = [(HAPSecuritySession *)v2 delegate];
        v30 = [v29 securitySessionDidRequestAdditionalDerivedKeyTuples:v2];

        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_100043720;
        v41[3] = &unk_100273628;
        v41[4] = v2;
        id v42 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:objc_msgSend(v30, "count")];
        id v31 = v42;
        [v30 enumerateObjectsUsingBlock:v41];
        id v32 = [v31 copy];
        [(HAPSecuritySession *)v2 setAdditionalDerivedKeys:v32];
      }
      pairingSession = v2->_pairingSession;
      if (pairingSession) {
        CFRelease(pairingSession);
      }
      v2->_pairingSession = 0;
      v34 = [HAPSecuritySessionEncryption alloc];
      v35 = [v23[136] dataWithBytes:buf length:32];
      v36 = [v23[136] dataWithBytes:v49 length:32];
      v37 = [(HAPSecuritySessionEncryption *)v34 initWithInputKey:v35 outputKey:v36 enhancedEncryption:v2->_enhancedEncryption];
      [(HAPSecuritySession *)v2 setEncryption:v37];

      [(HAPSecuritySession *)v2 setState:2];
      [(HAPSecuritySession *)v2 _notifyOpened];
    }
  }
}

- (void)open
{
  if ([(HAPSecuritySession *)self state])
  {
    uint64_t v3 = self;
    uint64_t v4 = sub_100083F74();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = sub_100083FD0(v3);
      *(_DWORD *)buf = 138543362;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to open security session, a security session can only be opened once.", buf, 0xCu);
    }
  }
  else
  {
    id v6 = [(HAPSecuritySession *)self delegate];

    if (v6)
    {
      [(HAPSecuritySession *)self setState:1];
      [(HAPSecuritySession *)self reallyOpen];
    }
    else
    {
      id v7 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6705 userInfo:0];
      -[HAPSecuritySession closeWithError:](self, "closeWithError:");
    }
  }
}

- (void)reallyOpen
{
  uint64_t v3 = [(HAPSecuritySession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043B64;
  block[3] = &unk_100273018;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_notifyOpening
{
  uint64_t v3 = [(HAPSecuritySession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(HAPSecuritySession *)self delegate];
    [v5 securitySessionIsOpening:self];
  }
}

- (void)_notifyOpened
{
  uint64_t v3 = [(HAPSecuritySession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(HAPSecuritySession *)self delegate];
    [v5 securitySessionDidOpen:self];
  }
}

- (void)close
{
  uint64_t v3 = [(HAPSecuritySession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043DA0;
  block[3] = &unk_100273018;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)closeWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HAPSecuritySession *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100043E60;
  v7[3] = &unk_100273040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_closeWithError:(id)a3
{
  id v12 = a3;
  BOOL v4 = (id)[(HAPSecuritySession *)self state] == (id)3;
  id v5 = v12;
  if (!v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    id v7 = self;
    pairingSession = v7->_pairingSession;
    if (pairingSession)
    {
      CFRelease(pairingSession);
      v7->_pairingSession = 0;
    }
    id v9 = objc_alloc_init(HAPSecuritySessionEncryption);
    [(HAPSecuritySession *)v7 setEncryption:v9];

    v7->_unint64_t resumeSessionID = 0;
    os_unfair_lock_unlock(p_lock);
    [(HAPSecuritySession *)v7 setState:3];
    id v10 = [(HAPSecuritySession *)v7 delegate];
    LOBYTE(v9) = objc_opt_respondsToSelector();

    id v5 = v12;
    if (v9)
    {
      v11 = [(HAPSecuritySession *)v7 delegate];
      [v11 securitySession:v7 didCloseWithError:v12];

      id v5 = v12;
    }
  }
}

- (id)encryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    id v21 = sub_100044160;
    id v22 = sub_100044170;
    id v23 = 0;
    id v10 = [(HAPSecuritySession *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100044178;
    block[3] = &unk_100273650;
    unint64_t v16 = &v18;
    v17 = a5;
    void block[4] = self;
    id v14 = v8;
    id v15 = v9;
    dispatch_sync(v10, block);

    id v11 = (id)v19[5];
    _Block_object_dispose(&v18, 8);
  }
  else if (a5)
  {
    +[NSError errorWithDomain:@"HAPErrorDomain" code:-6705 userInfo:0];
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)decryptData:(id)a3 additionalAuthenticatedData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    if ((unint64_t)[v8 length] > 0xF)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v23 = sub_100044160;
      __int16 v24 = sub_100044170;
      id v25 = 0;
      id v15 = [(HAPSecuritySession *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000444F8;
      block[3] = &unk_100273650;
      uint64_t v20 = buf;
      id v21 = a5;
      void block[4] = self;
      id v18 = v8;
      id v19 = v9;
      dispatch_sync(v15, block);

      id v14 = *(id *)(*(void *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);

      goto LABEL_12;
    }
    id v10 = self;
    id v11 = sub_100083F74();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = sub_100083FD0(v10);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v8 length];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@The encrypted data has an invalid length of %tu bytes", buf, 0x16u);
    }
    if (a5)
    {
      id v13 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6743 userInfo:0];
LABEL_9:
      id v14 = 0;
      *a5 = v13;
      goto LABEL_12;
    }
  }
  else if (a5)
  {
    id v13 = +[NSError errorWithDomain:@"HAPErrorDomain" code:-6705 userInfo:0];
    goto LABEL_9;
  }
  id v14 = 0;
LABEL_12:

  return v14;
}

+ (id)logCategory
{
  if (qword_1002AD688 != -1) {
    dispatch_once(&qword_1002AD688, &stru_100273670);
  }
  v2 = (void *)qword_1002AD690;

  return v2;
}

- (id)logIdentifier
{
  uint64_t v3 = [(HAPSecuritySession *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  uint64_t v5 = objc_opt_class();
  if (v4)
  {
    id v6 = [(HAPSecuritySession *)self delegate];
    id v7 = [v6 shortDescription];
    id v8 = +[NSString stringWithFormat:@"%@ %@", v5, v7];
  }
  else
  {
    unint64_t v9 = [(HAPSecuritySession *)self state];
    if (v9 > 3) {
      CFStringRef v10 = @"unknown";
    }
    else {
      CFStringRef v10 = off_100273690[v9];
    }
    id v8 = +[NSString stringWithFormat:@"%@ %@", v5, v10];
  }

  return v8;
}

- (unint64_t)sessionStartTime
{
  return self->_sessionStartTime;
}

- (HAPSecuritySessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPSecuritySessionDelegate *)WeakRetained;
}

- (unint64_t)role
{
  return self->_role;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PairingSessionPrivate)pairingSession
{
  return self->_pairingSession;
}

- (void)setPairingSession:(PairingSessionPrivate *)a3
{
  self->_pairingSession = a3;
}

- (HAPSecuritySessionEncryption)encryption
{
  return self->_encryption;
}

- (void)setEncryption:(id)a3
{
}

- (BOOL)enhancedEncryption
{
  return self->_enhancedEncryption;
}

- (void)setEnhancedEncryption:(BOOL)a3
{
  self->_enhancedEncryption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryption, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_additionalDerivedKeys, 0);

  objc_storeStrong((id *)&self->_broadcastKey, 0);
}

@end