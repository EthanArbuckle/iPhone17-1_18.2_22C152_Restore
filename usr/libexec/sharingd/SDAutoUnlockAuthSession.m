@interface SDAutoUnlockAuthSession
- (BOOL)aksSuccess;
- (BOOL)inRange;
- (BOOL)isAcceptor;
- (BOOL)isAuthenticatingForSiri;
- (BOOL)rangingDisabled;
- (BOOL)rangingTimedOut;
- (BOOL)shouldUnlock;
- (BOOL)skipMotionCheck;
- (BOOL)useAKSToken;
- (BOOL)useEncryption;
- (BOOL)useRealRangingKey;
- (NSArray)wifiRangingResults;
- (NSData)appIcon;
- (NSData)awdlInfoData;
- (NSData)rangingKey;
- (NSData)sessionRangingKey;
- (NSDate)awdlStart;
- (NSDate)lastLocalUnlockDate;
- (NSDate)rangingStart;
- (NSDictionary)localAWDLInfo;
- (NSDictionary)remoteAWDLInfo;
- (NSError)attemptError;
- (NSError)startAWDLError;
- (NSNumber)distance;
- (NSString)appName;
- (NSString)navBarTitle;
- (NSString)rangingErrorString;
- (NSString)wifiErrorDomain;
- (SDAutoUnlockAuthSession)initWithDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5;
- (SDAutoUnlockWiFiRequest)wifiRequest;
- (SFBLEDevice)bleDevice;
- (double)awdlInterval;
- (double)rangingInterval;
- (id)awdlNetwork;
- (id)getAppName;
- (id)peerListFromAWDLInfo:(id)a3;
- (int64_t)attemptType;
- (int64_t)errorType;
- (int64_t)wifiRangingErrorCode;
- (unint64_t)protocol;
- (void)_start;
- (void)invalidate;
- (void)sendAWDLInfo;
- (void)sendAWDLInfo:(BOOL)a3;
- (void)sendData:(id)a3 bleDevice:(id)a4 completionHandler:(id)a5;
- (void)sendData:(id)a3 bleDevice:(id)a4 direct:(BOOL)a5 completionHandler:(id)a6;
- (void)sendData:(id)a3 type:(unsigned __int16)a4 completionHandler:(id)a5;
- (void)sendData:(id)a3 type:(unsigned __int16)a4 errorHandler:(id)a5;
- (void)setAcceptor:(BOOL)a3;
- (void)setAksSuccess:(BOOL)a3;
- (void)setAppIcon:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAttemptError:(id)a3;
- (void)setAttemptType:(int64_t)a3;
- (void)setAwdlInfoData:(id)a3;
- (void)setAwdlInterval:(double)a3;
- (void)setAwdlNetwork:(id)a3;
- (void)setAwdlStart:(id)a3;
- (void)setBleDevice:(id)a3;
- (void)setDistance:(id)a3;
- (void)setErrorType:(int64_t)a3;
- (void)setInRange:(BOOL)a3;
- (void)setIsAuthenticatingForSiri:(BOOL)a3;
- (void)setLastLocalUnlockDate:(id)a3;
- (void)setLocalAWDLInfo:(id)a3;
- (void)setNavBarTitle:(id)a3;
- (void)setProtocol:(unint64_t)a3;
- (void)setRangingErrorString:(id)a3;
- (void)setRangingInterval:(double)a3;
- (void)setRangingKey:(id)a3;
- (void)setRangingStart:(id)a3;
- (void)setRangingTimedOut:(BOOL)a3;
- (void)setRemoteAWDLInfo:(id)a3;
- (void)setSessionRangingKey:(id)a3;
- (void)setShouldUnlock:(BOOL)a3;
- (void)setSkipMotionCheck:(BOOL)a3;
- (void)setStartAWDLError:(id)a3;
- (void)setUseAKSToken:(BOOL)a3;
- (void)setUseEncryption:(BOOL)a3;
- (void)setWifiErrorDomain:(id)a3;
- (void)setWifiRangingErrorCode:(int64_t)a3;
- (void)setWifiRangingResults:(id)a3;
- (void)setWifiRequest:(id)a3;
- (void)start;
@end

@implementation SDAutoUnlockAuthSession

- (SDAutoUnlockAuthSession)initWithDevice:(id)a3 sessionID:(id)a4 bleDevice:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SDAutoUnlockAuthSession;
  v10 = [(SDAutoUnlockPairingSession *)&v13 initWithDevice:a3 sessionID:a4];
  v11 = v10;
  if (v10)
  {
    v10->_useAKSToken = 0;
    objc_storeStrong((id *)&v10->_bleDevice, a5);
    v11->_protocol = 1;
  }

  return v11;
}

- (void)invalidate
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockAuthSession;
  [(SDAutoUnlockPairingSession *)&v7 invalidate];
  v3 = [(SDAutoUnlockPairingSession *)self aksSession];
  unsigned int v4 = [v3 resetSession];

  v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v4) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reset Session: %@", buf, 0xCu);
  }
}

- (id)getAppName
{
  return 0;
}

- (void)start
{
  v3 = [(SDAutoUnlockPairingSession *)self sessionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C4D48;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_start
{
}

- (void)sendData:(id)a3 type:(unsigned __int16)a4 errorHandler:(id)a5
{
  uint64_t v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001C4E04;
  v8[3] = &unk_1008CFDD8;
  CFStringRef v9 = self;
  id v10 = a5;
  id v7 = v10;
  [(SDAutoUnlockAuthSession *)v9 sendData:a3 type:v5 completionHandler:v8];
}

- (void)sendData:(id)a3 type:(unsigned __int16)a4 completionHandler:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v10 = [(SDAutoUnlockPairingSession *)self wrapPayload:a3 withType:v5];
  CFStringRef v9 = [(SDAutoUnlockAuthSession *)self bleDevice];
  [(SDAutoUnlockAuthSession *)self sendData:v10 bleDevice:v9 completionHandler:v8];
}

- (void)sendAWDLInfo
{
}

- (void)sendAWDLInfo:(BOOL)a3
{
  uint64_t v5 = [(SDAutoUnlockAuthSession *)self awdlInfoData];
  CFStringRef v6 = auto_unlock_log();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockAWDLInfo", buf, 2u);
    }

    id v8 = objc_alloc_init(SDAutoUnlockAWDLInfo);
    [(SDAutoUnlockAWDLInfo *)v8 setVersion:4];
    [(SDAutoUnlockAWDLInfo *)v8 setAwdlInfo:v5];
    [(SDAutoUnlockAWDLInfo *)v8 setUseToken:[(SDAutoUnlockAuthSession *)self useAKSToken]];
    CFStringRef v9 = [(SDAutoUnlockAuthSession *)self lastLocalUnlockDate];
    [v9 timeIntervalSinceReferenceDate];
    -[SDAutoUnlockAWDLInfo setPhoneUnlockDate:](v8, "setPhoneUnlockDate:");

    [(SDAutoUnlockAWDLInfo *)v8 setSkipMotionCheck:[(SDAutoUnlockAuthSession *)self skipMotionCheck]];
    [(SDAutoUnlockAWDLInfo *)v8 setIsAuthenticatingForSiri:[(SDAutoUnlockAuthSession *)self isAuthenticatingForSiri]];
    int64_t v10 = [(SDAutoUnlockAuthSession *)self attemptType];
    [(SDAutoUnlockAWDLInfo *)v8 setAuthPrompt:v10 == 2];
    if (v10 == 2)
    {
      v11 = [(SDAutoUnlockAuthSession *)self getAppName];
      if (v11) {
        [(SDAutoUnlockAWDLInfo *)v8 setAppName:v11];
      }
    }
    v12 = [(SDAutoUnlockAWDLInfo *)v8 data];
    if (!a3)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1001C523C;
      v17[3] = &unk_1008CA5A8;
      v17[4] = self;
      [(SDAutoUnlockAuthSession *)self sendAWDLInfoData:v12 type:301 completionHandler:v17];

      goto LABEL_15;
    }
    objc_super v13 = [(SDAutoUnlockPairingSession *)self wrapPayload:v12 withType:301];

    v14 = [(SDAutoUnlockAuthSession *)self bleDevice];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001C537C;
    v16[3] = &unk_1008CA5A8;
    v16[4] = self;
    [(SDAutoUnlockAuthSession *)self sendData:v13 bleDevice:v14 completionHandler:v16];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001C63BC(v7);
    }

    uint64_t v15 = SFAutoUnlockErrorDomain;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    CFStringRef v20 = @"AWDL info retrieval failed";
    id v8 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    objc_super v13 = +[NSError errorWithDomain:v15 code:103 userInfo:v8];
    [(SDAutoUnlockPairingSession *)self notifyDelegateWithError:v13];
  }

LABEL_15:
}

- (NSData)awdlInfoData
{
  v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 awdlInfo];

  uint64_t v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    CFStringRef v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Using AWDL info %@", (uint8_t *)&v8, 0xCu);
  }

  [(SDAutoUnlockAuthSession *)self setLocalAWDLInfo:v4];
  CFStringRef v6 = sub_1000D1EEC(v4);

  return (NSData *)v6;
}

- (void)sendData:(id)a3 bleDevice:(id)a4 completionHandler:(id)a5
{
}

- (void)sendData:(id)a3 bleDevice:(id)a4 direct:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(SDAutoUnlockAuthSession *)self useEncryption])
  {
    objc_super v13 = [(SDAutoUnlockPairingSession *)self deviceID];

    v14 = auto_unlock_log();
    uint64_t v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Encryption start", buf, 2u);
      }

      v16 = +[SDAutoUnlockAKSManager sharedManager];
      v17 = [(SDAutoUnlockPairingSession *)self deviceID];
      id v31 = 0;
      id v32 = 0;
      id v30 = 0;
      unsigned int v18 = [v16 encryptMessageData:v10 deviceID:v17 encryptedMessage:&v32 authTag:&v31 nonce:&v30];
      uint64_t v15 = v32;
      id v29 = v31;
      id v19 = v30;

      if (v18 && v15 && v29 && v19)
      {
        CFStringRef v20 = objc_opt_new();
        [v20 setVersion:2];
        [v20 setEncryptedPayload:v15];
        [v20 setAuthTag:v29];
        [v20 setNonce:v19];
        v21 = [(SDAutoUnlockPairingSession *)self sessionID];
        v22 = +[NSString stringWithFormat:@" with wrapper %@ sessionID: %@", v20, v21];

        v23 = auto_unlock_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          id v36 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Using encryption%{private}@", buf, 0xCu);
        }

        v24 = +[SDNearbyAgent sharedNearbyAgent];
        v25 = [v20 data];
        if (v7) {
          [v24 sendUnlockDataDirect:v25 toBLEDevice:v11 completion:v12];
        }
        else {
          [v24 sendUnlockData:v25 toBLEDevice:v11 completion:v12];
        }
      }
      else
      {
        v27 = auto_unlock_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v36 = v10;
          __int16 v37 = 2112;
          id v38 = v29;
          __int16 v39 = 2112;
          id v40 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Error encrypting message (data: %@, authTag: %@, nonce: %@)", buf, 0x20u);
        }

        uint64_t v28 = SFAutoUnlockErrorDomain;
        NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
        CFStringRef v34 = @"Encryption failed";
        CFStringRef v20 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        v22 = +[NSError errorWithDomain:v28 code:189 userInfo:v20];
        [(SDAutoUnlockPairingSession *)self notifyDelegateWithError:v22];
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      sub_1001C6400(v15);
    }
  }
  else
  {
    v26 = auto_unlock_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Using BLE encryption", buf, 2u);
    }

    uint64_t v15 = +[SDNearbyAgent sharedNearbyAgent];
    [v15 sendUnlockData:v10 toBLEDevice:v11 completion:v12];
  }
}

- (id)peerListFromAWDLInfo:(id)a3
{
  unsigned int v4 = [a3 objectForKeyedSubscript:@"AWDL_IF_MAC_ADDRESS"];
  if (v4
    && (uint64_t v5 = [_NIRangingPeer alloc],
        [(SDAutoUnlockAuthSession *)self rangingKey],
        CFStringRef v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = [(_NIRangingPeer *)v5 initWithMacAddressAsData:v4 secureRangingKeyID:v6], v6, v7))
  {
    id v10 = v7;
    int v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (NSData)rangingKey
{
  if ([(SDAutoUnlockAuthSession *)self useRealRangingKey])
  {
    if ((id)[(SDAutoUnlockAuthSession *)self protocol] == (id)1
      && ([(SDAutoUnlockAuthSession *)self sessionRangingKey],
          v3 = objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      unsigned int v4 = [(SDAutoUnlockAuthSession *)self sessionRangingKey];
    }
    else
    {
      CFStringRef v6 = +[SDAutoUnlockAKSManager sharedManager];
      BOOL v7 = [(SDAutoUnlockPairingSession *)self deviceID];
      unsigned int v4 = [v6 rangingKeyForDeviceID:v7];
    }
    id v5 = [objc_alloc((Class)NSMutableData) initWithData:v4];
    int v8 = auto_unlock_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = @"YES";
      if (!v5) {
        CFStringRef v9 = @"NO";
      }
      int v20 = 138412290;
      v21[0] = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ranging key exists %@", (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    id v5 = [objc_alloc((Class)NSMutableData) initWithCapacity:64];
  }
  unsigned int v10 = [v5 length];
  if (v10 <= 0x3F)
  {
    unsigned int v11 = v10 - 64;
    do
    {
      LOBYTE(v20) = 48;
      [v5 appendBytes:&v20 length:1];
    }
    while (!__CFADD__(v11++, 1));
  }
  objc_super v13 = auto_unlock_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [v5 length];
    unsigned int v15 = [(SDAutoUnlockAuthSession *)self useRealRangingKey];
    CFStringRef v16 = @"NO";
    if (v15) {
      CFStringRef v16 = @"YES";
    }
    int v20 = 67109378;
    LODWORD(v21[0]) = v14;
    WORD2(v21[0]) = 2112;
    *(void *)((char *)v21 + 6) = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Using ranging key (size: %d, realKey %@)", (uint8_t *)&v20, 0x12u);
  }

  v17 = auto_unlock_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_1001C6444((uint64_t)v5, v17);
  }

  id v18 = [v5 copy];

  return (NSData *)v18;
}

- (BOOL)useRealRangingKey
{
  return sub_1000D9060(@"AUUseRangingKey", 1) != 0;
}

- (BOOL)rangingDisabled
{
  return sub_1000D9060(@"DisableRanging", 0) != 0;
}

- (BOOL)useAKSToken
{
  return self->_useAKSToken;
}

- (void)setUseAKSToken:(BOOL)a3
{
  self->_useAKSToken = a3;
}

- (BOOL)inRange
{
  return self->_inRange;
}

- (void)setInRange:(BOOL)a3
{
  self->_inRange = a3;
}

- (BOOL)shouldUnlock
{
  return self->_shouldUnlock;
}

- (void)setShouldUnlock:(BOOL)a3
{
  self->_shouldUnlock = a3;
}

- (SFBLEDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
}

- (int64_t)attemptType
{
  return self->_attemptType;
}

- (void)setAttemptType:(int64_t)a3
{
  self->_attemptType = a3;
}

- (void)setAwdlInfoData:(id)a3
{
}

- (BOOL)isAcceptor
{
  return self->_acceptor;
}

- (void)setAcceptor:(BOOL)a3
{
  self->_acceptor = a3;
}

- (NSDate)awdlStart
{
  return self->_awdlStart;
}

- (void)setAwdlStart:(id)a3
{
}

- (double)awdlInterval
{
  return self->_awdlInterval;
}

- (void)setAwdlInterval:(double)a3
{
  self->_awdlInterval = a3;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
}

- (void)setRangingKey:(id)a3
{
}

- (BOOL)rangingTimedOut
{
  return self->_rangingTimedOut;
}

- (void)setRangingTimedOut:(BOOL)a3
{
  self->_rangingTimedOut = a3;
}

- (NSString)rangingErrorString
{
  return self->_rangingErrorString;
}

- (void)setRangingErrorString:(id)a3
{
}

- (BOOL)aksSuccess
{
  return self->_aksSuccess;
}

- (void)setAksSuccess:(BOOL)a3
{
  self->_aksSuccess = a3;
}

- (NSDate)rangingStart
{
  return self->_rangingStart;
}

- (void)setRangingStart:(id)a3
{
}

- (double)rangingInterval
{
  return self->_rangingInterval;
}

- (void)setRangingInterval:(double)a3
{
  self->_rangingInterval = a3;
}

- (NSError)attemptError
{
  return self->_attemptError;
}

- (void)setAttemptError:(id)a3
{
}

- (NSDictionary)remoteAWDLInfo
{
  return self->_remoteAWDLInfo;
}

- (void)setRemoteAWDLInfo:(id)a3
{
}

- (NSDictionary)localAWDLInfo
{
  return self->_localAWDLInfo;
}

- (void)setLocalAWDLInfo:(id)a3
{
}

- (NSData)sessionRangingKey
{
  return self->_sessionRangingKey;
}

- (void)setSessionRangingKey:(id)a3
{
}

- (unint64_t)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(unint64_t)a3
{
  self->_protocol = a3;
}

- (BOOL)useEncryption
{
  return self->_useEncryption;
}

- (void)setUseEncryption:(BOOL)a3
{
  self->_useEncryption = a3;
}

- (NSString)wifiErrorDomain
{
  return self->_wifiErrorDomain;
}

- (void)setWifiErrorDomain:(id)a3
{
}

- (int64_t)wifiRangingErrorCode
{
  return self->_wifiRangingErrorCode;
}

- (void)setWifiRangingErrorCode:(int64_t)a3
{
  self->_wifiRangingErrorCode = a3;
}

- (NSArray)wifiRangingResults
{
  return self->_wifiRangingResults;
}

- (void)setWifiRangingResults:(id)a3
{
}

- (NSError)startAWDLError
{
  return self->_startAWDLError;
}

- (void)setStartAWDLError:(id)a3
{
}

- (int64_t)errorType
{
  return self->_errorType;
}

- (void)setErrorType:(int64_t)a3
{
  self->_errorType = a3;
}

- (SDAutoUnlockWiFiRequest)wifiRequest
{
  return (SDAutoUnlockWiFiRequest *)objc_getProperty(self, a2, 248, 1);
}

- (void)setWifiRequest:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSData)appIcon
{
  return self->_appIcon;
}

- (void)setAppIcon:(id)a3
{
}

- (BOOL)skipMotionCheck
{
  return self->_skipMotionCheck;
}

- (void)setSkipMotionCheck:(BOOL)a3
{
  self->_skipMotionCheck = a3;
}

- (NSDate)lastLocalUnlockDate
{
  return self->_lastLocalUnlockDate;
}

- (void)setLastLocalUnlockDate:(id)a3
{
}

- (NSString)navBarTitle
{
  return self->_navBarTitle;
}

- (void)setNavBarTitle:(id)a3
{
}

- (BOOL)isAuthenticatingForSiri
{
  return self->_isAuthenticatingForSiri;
}

- (void)setIsAuthenticatingForSiri:(BOOL)a3
{
  self->_isAuthenticatingForSiri = a3;
}

- (id)awdlNetwork
{
  return objc_getProperty(self, a2, 288, 1);
}

- (void)setAwdlNetwork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_awdlNetwork, 0);
  objc_storeStrong((id *)&self->_navBarTitle, 0);
  objc_storeStrong((id *)&self->_lastLocalUnlockDate, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_wifiRequest, 0);
  objc_storeStrong((id *)&self->_startAWDLError, 0);
  objc_storeStrong((id *)&self->_wifiRangingResults, 0);
  objc_storeStrong((id *)&self->_wifiErrorDomain, 0);
  objc_storeStrong((id *)&self->_sessionRangingKey, 0);
  objc_storeStrong((id *)&self->_localAWDLInfo, 0);
  objc_storeStrong((id *)&self->_remoteAWDLInfo, 0);
  objc_storeStrong((id *)&self->_attemptError, 0);
  objc_storeStrong((id *)&self->_rangingStart, 0);
  objc_storeStrong((id *)&self->_rangingErrorString, 0);
  objc_storeStrong((id *)&self->_rangingKey, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_awdlStart, 0);
  objc_storeStrong((id *)&self->_awdlInfoData, 0);

  objc_storeStrong((id *)&self->_bleDevice, 0);
}

@end