@interface SDAutoUnlockAKSSession
- (BOOL)confirmSession;
- (BOOL)ltkNeedsFixing;
- (BOOL)originator;
- (BOOL)resetSession;
- (BOOL)sessionIsValid;
- (BOOL)stepSessionWithData:(id)a3 outputData:(id *)a4;
- (BOOL)usingEscrow;
- (NSData)escrowSecret;
- (NSData)externalACMContext;
- (NSData)localLTK;
- (NSData)remoteLTK;
- (NSString)deviceID;
- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7;
- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 escrowSecret:(id)a8;
- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 escrowSecret:(id)a8 usingEscrow:(BOOL)a9 externalACMContext:(id)a10;
- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 externalACMContext:(id)a8;
- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 usingEscrow:(BOOL)a8;
- (id)generateACMContextData;
- (id)generateEscrowSecret;
- (id)generateSessionToken;
- (int64_t)aksSessionID;
- (int64_t)finalizeEscrowPairing:(id)a3;
- (int64_t)finalizeRegistration;
- (int64_t)sessionType;
- (void)fixRemoteLTK;
- (void)setAksSessionID:(int64_t)a3;
- (void)setDeviceID:(id)a3;
- (void)setEscrowSecret:(id)a3;
- (void)setExternalACMContext:(id)a3;
- (void)setLocalLTK:(id)a3;
- (void)setLtkNeedsFixing:(BOOL)a3;
- (void)setOriginator:(BOOL)a3;
- (void)setRemoteLTK:(id)a3;
- (void)setSessionType:(int64_t)a3;
- (void)setUsingEscrow:(BOOL)a3;
- (void)setupAuthorizationSession;
- (void)setupSession;
@end

@implementation SDAutoUnlockAKSSession

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7
{
  LOBYTE(v8) = 0;
  return [(SDAutoUnlockAKSSession *)self initWithLocalLTK:a3 remoteLTK:a4 sessionType:a5 originator:a6 deviceID:a7 escrowSecret:0 usingEscrow:v8 externalACMContext:0];
}

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 externalACMContext:(id)a8
{
  LOBYTE(v9) = 0;
  return [(SDAutoUnlockAKSSession *)self initWithLocalLTK:a3 remoteLTK:a4 sessionType:a5 originator:a6 deviceID:a7 escrowSecret:0 usingEscrow:v9 externalACMContext:a8];
}

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 usingEscrow:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return [(SDAutoUnlockAKSSession *)self initWithLocalLTK:a3 remoteLTK:a4 sessionType:a5 originator:a6 deviceID:a7 escrowSecret:0 usingEscrow:v9 externalACMContext:0];
}

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 escrowSecret:(id)a8
{
  LOBYTE(v9) = 0;
  return [(SDAutoUnlockAKSSession *)self initWithLocalLTK:a3 remoteLTK:a4 sessionType:a5 originator:a6 deviceID:a7 escrowSecret:a8 usingEscrow:v9 externalACMContext:0];
}

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 escrowSecret:(id)a8 usingEscrow:(BOOL)a9 externalACMContext:(id)a10
{
  id v28 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a10;
  v29.receiver = self;
  v29.super_class = (Class)SDAutoUnlockAKSSession;
  v20 = [(SDAutoUnlockAKSSession *)&v29 init];
  if (v20)
  {
    v21 = (NSData *)[v28 copy];
    localLTK = v20->_localLTK;
    v20->_localLTK = v21;

    v23 = (NSData *)[v16 copy];
    remoteLTK = v20->_remoteLTK;
    v20->_remoteLTK = v23;

    v20->_sessionType = a5;
    v20->_originator = a6;
    v25 = (NSData *)[v18 copy];
    escrowSecret = v20->_escrowSecret;
    v20->_escrowSecret = v25;

    v20->_usingEscrow = a9;
    objc_storeStrong((id *)&v20->_deviceID, a7);
    objc_storeStrong((id *)&v20->_externalACMContext, a10);
    v20->_aksSessionID = -1;
    v20->_acmContext = 0;
    [(SDAutoUnlockAKSSession *)v20 setupSession];
  }

  return v20;
}

- (void)setupSession
{
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v41 = 0;
  switch([(SDAutoUnlockAKSSession *)self sessionType])
  {
    case 1:
      v3 = [(SDAutoUnlockAKSSession *)self localLTK];
      v4 = [(SDAutoUnlockAKSSession *)self remoteLTK];
      int v5 = [(SDAutoUnlockAKSSession *)self originator];
      [(SDAutoUnlockAKSSession *)self setAksSessionID:sub_10001E314(v3, v4, v5, (_DWORD *)v39 + 6, 1)];

      uint64_t v6 = *((int *)v39 + 6);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10002FE08;
      v37[3] = &unk_1008CA6D0;
      v37[4] = self;
      v37[5] = &v38;
      [(SDAutoUnlockAKSSession *)self fixRemoteLTKWithStatus:v6 retryBlock:v37];
      goto LABEL_19;
    case 2:
      v7 = [(SDAutoUnlockAKSSession *)self localLTK];
      uint64_t v8 = [(SDAutoUnlockAKSSession *)self remoteLTK];
      int v9 = [(SDAutoUnlockAKSSession *)self originator];
      int v10 = [(SDAutoUnlockAKSSession *)self usingEscrow];
      v11 = [(SDAutoUnlockAKSSession *)self escrowSecret];
      [(SDAutoUnlockAKSSession *)self setAksSessionID:sub_10001E924(v7, v8, v9, v10, 0, v11, (_DWORD *)v39 + 6)];

      uint64_t v12 = *((int *)v39 + 6);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10002FF30;
      v36[3] = &unk_1008CA6D0;
      v36[4] = self;
      v36[5] = &v38;
      [(SDAutoUnlockAKSSession *)self fixRemoteLTKWithStatus:v12 retryBlock:v36];
      goto LABEL_19;
    case 3:
      if (![(SDAutoUnlockAKSSession *)self originator]) {
        goto LABEL_15;
      }
      v13 = [(SDAutoUnlockAKSSession *)self localLTK];
      v14 = [(SDAutoUnlockAKSSession *)self remoteLTK];
      int v15 = [(SDAutoUnlockAKSSession *)self originator];
      int v16 = [(SDAutoUnlockAKSSession *)self usingEscrow];
      id v17 = [(SDAutoUnlockAKSSession *)self escrowSecret];
      [(SDAutoUnlockAKSSession *)self setAksSessionID:sub_10001E924(v13, v14, v15, v16, 1, v17, (_DWORD *)v39 + 6)];
      goto LABEL_17;
    case 4:
      v13 = [(SDAutoUnlockAKSSession *)self localLTK];
      v14 = [(SDAutoUnlockAKSSession *)self remoteLTK];
      int v18 = [(SDAutoUnlockAKSSession *)self originator];
      [(SDAutoUnlockAKSSession *)self setAksSessionID:sub_10001E314(v13, v14, v18, (_DWORD *)v39 + 6, 0)];
      goto LABEL_18;
    case 5:
      v13 = [(SDAutoUnlockAKSSession *)self localLTK];
      v14 = [(SDAutoUnlockAKSSession *)self remoteLTK];
      int v19 = [(SDAutoUnlockAKSSession *)self originator];
      [(SDAutoUnlockAKSSession *)self setAksSessionID:sub_10001E908(v13, v14, v19, (_DWORD *)v39 + 6)];
      goto LABEL_18;
    case 6:
      v13 = [(SDAutoUnlockAKSSession *)self localLTK];
      v14 = [(SDAutoUnlockAKSSession *)self remoteLTK];
      int v20 = [(SDAutoUnlockAKSSession *)self originator];
      [(SDAutoUnlockAKSSession *)self setAksSessionID:sub_10001E314(v13, v14, v20, (_DWORD *)v39 + 6, 1)];
      goto LABEL_18;
    case 7:
      v21 = [(SDAutoUnlockAKSSession *)self localLTK];
      v22 = [(SDAutoUnlockAKSSession *)self remoteLTK];
      int v23 = [(SDAutoUnlockAKSSession *)self originator];
      int v24 = [(SDAutoUnlockAKSSession *)self usingEscrow];
      v25 = [(SDAutoUnlockAKSSession *)self escrowSecret];
      [(SDAutoUnlockAKSSession *)self setAksSessionID:sub_10001EB08(v21, v22, v23, v24, 0, v25, 0, (_DWORD *)v39 + 6)];

      uint64_t v26 = *((int *)v39 + 6);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10003008C;
      v35[3] = &unk_1008CA6D0;
      v35[4] = self;
      v35[5] = &v38;
      [(SDAutoUnlockAKSSession *)self fixRemoteLTKWithStatus:v26 retryBlock:v35];
      goto LABEL_19;
    case 8:
      v13 = [(SDAutoUnlockAKSSession *)self localLTK];
      v14 = [(SDAutoUnlockAKSSession *)self remoteLTK];
      int v27 = [(SDAutoUnlockAKSSession *)self originator];
      int v28 = [(SDAutoUnlockAKSSession *)self usingEscrow];
      id v17 = [(SDAutoUnlockAKSSession *)self escrowSecret];
      [(SDAutoUnlockAKSSession *)self setAksSessionID:sub_10001EC98(v13, v14, v27, v28, 0, v17, 0, (_DWORD *)v39 + 6)];
      goto LABEL_17;
    case 9:
      if ([(SDAutoUnlockAKSSession *)self originator])
      {
        objc_super v29 = [(SDAutoUnlockAKSSession *)self externalACMContext];

        [(SDAutoUnlockAKSSession *)self localLTK];
        if (v29) {
          v13 = {;
        }
          v14 = [(SDAutoUnlockAKSSession *)self remoteLTK];
          int v30 = [(SDAutoUnlockAKSSession *)self originator];
          int v31 = [(SDAutoUnlockAKSSession *)self usingEscrow];
          id v17 = [(SDAutoUnlockAKSSession *)self externalACMContext];
          [(SDAutoUnlockAKSSession *)self setAksSessionID:sub_10001E958(v13, v14, v30, v31, 1, 1, v17, 0, (_DWORD *)v39 + 6)];
        }
        else {
          v13 = {;
        }
          v14 = [(SDAutoUnlockAKSSession *)self remoteLTK];
          int v33 = [(SDAutoUnlockAKSSession *)self originator];
          int v34 = [(SDAutoUnlockAKSSession *)self usingEscrow];
          id v17 = [(SDAutoUnlockAKSSession *)self escrowSecret];
          [(SDAutoUnlockAKSSession *)self setAksSessionID:sub_10001E924(v13, v14, v33, v34, 1, v17, (_DWORD *)v39 + 6)];
        }
LABEL_17:

LABEL_18:
      }
      else
      {
LABEL_15:
        [(SDAutoUnlockAKSSession *)self setupAuthorizationSession];
      }
LABEL_19:
      _Block_object_dispose(&v38, 8);
      return;
    case 0xALL:
      v13 = [(SDAutoUnlockAKSSession *)self localLTK];
      v14 = [(SDAutoUnlockAKSSession *)self remoteLTK];
      int v32 = [(SDAutoUnlockAKSSession *)self originator];
      [(SDAutoUnlockAKSSession *)self setAksSessionID:sub_10001E924(v13, v14, v32, 0, 0, 0, (_DWORD *)v39 + 6)];
      goto LABEL_18;
    default:
      goto LABEL_19;
  }
}

- (void)setupAuthorizationSession
{
  uint64_t v16 = 0;
  externalACMContext = self->_externalACMContext;
  p_acmContext = &self->_acmContext;
  if (externalACMContext)
  {
    sub_10001CCF4(externalACMContext, &self->_acmContext);
    if (!*p_acmContext)
    {
      int v5 = [(SDAutoUnlockAKSSession *)self localLTK];
      uint64_t v6 = [(SDAutoUnlockAKSSession *)self remoteLTK];
      [(SDAutoUnlockAKSSession *)self setAksSessionID:sub_10001EE24(v5, v6, self->_externalACMContext, 0)];
    }
  }
  else
  {
    sub_10001CCA0((uint64_t *)&self->_acmContext);
  }
  if (*p_acmContext)
  {
    v7 = self->_externalACMContext;
    uint64_t v8 = auto_unlock_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        int v10 = self->_externalACMContext;
        *(_DWORD *)buf = 138477827;
        int v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AKS session using provided context: %{private}@", buf, 0xCu);
      }

      v11 = self->_externalACMContext;
    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AKS session creating new context", buf, 2u);
      }

      v14 = *p_acmContext;
      id v15 = 0;
      sub_10001CD84(v14, &v15, &v16);
      v11 = (NSData *)v15;
      if (v16)
      {
        uint64_t v12 = auto_unlock_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_100030918(&v16, v12);
        }
        goto LABEL_16;
      }
    }
    uint64_t v12 = [(SDAutoUnlockAKSSession *)self localLTK];
    v13 = [(SDAutoUnlockAKSSession *)self remoteLTK];
    [(SDAutoUnlockAKSSession *)self setAksSessionID:sub_10001EE24(v12, v13, v11, 0)];

LABEL_16:
  }
}

- (void)fixRemoteLTK
{
  v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to fix remote LTK", v9, 2u);
  }

  v4 = +[SDAutoUnlockAKSManager sharedManager];
  int v5 = [(SDAutoUnlockAKSSession *)self deviceID];
  [v4 resignRemoteLTKForDeviceID:v5];

  uint64_t v6 = +[SDAutoUnlockAKSManager sharedManager];
  v7 = [(SDAutoUnlockAKSSession *)self deviceID];
  uint64_t v8 = [v6 remoteLTKForDeviceID:v7];
  [(SDAutoUnlockAKSSession *)self setRemoteLTK:v8];
}

- (BOOL)sessionIsValid
{
  return [(SDAutoUnlockAKSSession *)self aksSessionID] >= 0;
}

- (BOOL)stepSessionWithData:(id)a3 outputData:(id *)a4
{
  id v6 = a3;
  if (![(SDAutoUnlockAKSSession *)self sessionIsValid]) {
    goto LABEL_5;
  }
  if (!sub_10001F034((int)[(SDAutoUnlockAKSSession *)self aksSessionID], v6, a4))
  {
    uint64_t v8 = [(SDAutoUnlockAKSSession *)self remoteLTK];
    sub_10001D790(v8);

LABEL_5:
    BOOL v7 = 0;
    goto LABEL_6;
  }
  BOOL v7 = 1;
LABEL_6:

  return v7;
}

- (id)generateEscrowSecret
{
  if ([(SDAutoUnlockAKSSession *)self sessionIsValid])
  {
    [(SDAutoUnlockAKSSession *)self aksSessionID];
    v3 = sub_10001F19C();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (int64_t)finalizeEscrowPairing:(id)a3
{
  id v4 = a3;
  if ([(SDAutoUnlockAKSSession *)self sessionIsValid])
  {
    int64_t v5 = sub_10001F254([(SDAutoUnlockAKSSession *)self aksSessionID], v4);
    id v6 = [(SDAutoUnlockAKSSession *)self remoteLTK];
    sub_10001D790(v6);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)finalizeRegistration
{
  if (![(SDAutoUnlockAKSSession *)self sessionIsValid]) {
    return 0;
  }
  [(SDAutoUnlockAKSSession *)self aksSessionID];

  return sub_10001F3F4();
}

- (BOOL)confirmSession
{
  BOOL v3 = [(SDAutoUnlockAKSSession *)self sessionIsValid];
  if (v3)
  {
    int v4 = [(SDAutoUnlockAKSSession *)self aksSessionID];
    LOBYTE(v3) = sub_10001F464(v4);
  }
  return v3;
}

- (BOOL)resetSession
{
  BOOL v3 = [(SDAutoUnlockAKSSession *)self sessionIsValid];
  if (v3)
  {
    BOOL v4 = sub_10001F53C((int)[(SDAutoUnlockAKSSession *)self aksSessionID]);
    [(SDAutoUnlockAKSSession *)self setAksSessionID:-1];
    LOBYTE(v3) = v4;
  }
  return v3;
}

- (id)generateSessionToken
{
  if ([(SDAutoUnlockAKSSession *)self sessionIsValid])
  {
    [(SDAutoUnlockAKSSession *)self aksSessionID];
    BOOL v3 = sub_10001EE38();
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)generateACMContextData
{
  uint64_t v7 = 0;
  acmContext = self->_acmContext;
  if (acmContext)
  {
    if (sub_10001D0A0(acmContext))
    {
      BOOL v4 = self->_acmContext;
      id v6 = 0;
      sub_10001CD84(v4, &v6, &v7);
      acmContext = (__ACMHandle *)v6;
      if (!v7) {
        goto LABEL_6;
      }
    }
    acmContext = 0;
  }
LABEL_6:

  return acmContext;
}

- (int64_t)aksSessionID
{
  return self->_aksSessionID;
}

- (void)setAksSessionID:(int64_t)a3
{
  self->_aksSessionID = a3;
}

- (BOOL)ltkNeedsFixing
{
  return self->_ltkNeedsFixing;
}

- (void)setLtkNeedsFixing:(BOOL)a3
{
  self->_ltkNeedsFixing = a3;
}

- (NSData)localLTK
{
  return self->_localLTK;
}

- (void)setLocalLTK:(id)a3
{
}

- (NSData)remoteLTK
{
  return self->_remoteLTK;
}

- (void)setRemoteLTK:(id)a3
{
}

- (int64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(int64_t)a3
{
  self->_sessionType = a3;
}

- (BOOL)originator
{
  return self->_originator;
}

- (void)setOriginator:(BOOL)a3
{
  self->_originator = a3;
}

- (NSData)escrowSecret
{
  return self->_escrowSecret;
}

- (void)setEscrowSecret:(id)a3
{
}

- (BOOL)usingEscrow
{
  return self->_usingEscrow;
}

- (void)setUsingEscrow:(BOOL)a3
{
  self->_usingEscrow = a3;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
}

- (NSData)externalACMContext
{
  return self->_externalACMContext;
}

- (void)setExternalACMContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalACMContext, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_escrowSecret, 0);
  objc_storeStrong((id *)&self->_remoteLTK, 0);

  objc_storeStrong((id *)&self->_localLTK, 0);
}

@end