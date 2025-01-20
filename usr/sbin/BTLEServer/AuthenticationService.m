@interface AuthenticationService
+ (id)UUID;
+ (void)initialize;
- (AuthenticationService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (BOOL)verifyCertificateIsUnique;
- (CBCharacteristic)certificate1Characteristic;
- (CBCharacteristic)certificate2Characteristic;
- (CBCharacteristic)challengeResponseCharacteristic;
- (CBCharacteristic)versionCharacteristic;
- (NSTimer)authTimer;
- (__CFDictionary)authInfo;
- (id)authStateString;
- (id)certificateSerialNumber;
- (int64_t)authState;
- (void)authTimeout;
- (void)authenticationDidFail;
- (void)authenticationDidSucceed;
- (void)dealloc;
- (void)issueChallenge;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setAuthInfo:(__CFDictionary *)a3;
- (void)setAuthState:(int64_t)a3;
- (void)setAuthTimer:(id)a3;
- (void)setCertificate1Characteristic:(id)a3;
- (void)setCertificate2Characteristic:(id)a3;
- (void)setChallengeResponseCharacteristic:(id)a3;
- (void)setVersionCharacteristic:(id)a3;
- (void)start;
- (void)stop;
- (void)verifyChallenge;
@end

@implementation AuthenticationService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:@"8341F2B4-C013-4F04-8197-C4CDB42E26DC"];
}

- (AuthenticationService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)AuthenticationService;
  v5 = [(ClientService *)&v8 initWithManager:a3 peripheral:a4 service:a5];
  v6 = v5;
  if (v5)
  {
    [(ClientService *)v5 setIsPrimary:1];
    [(ClientService *)v6 setPriority:4];
    [(ClientService *)v6 setStartTimeout:0.0];
    v6->_authState = 0;
    v6->_authInfo = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  return v6;
}

- (void)start
{
  v12.receiver = self;
  v12.super_class = (Class)AuthenticationService;
  [(ClientService *)&v12 start];
  [(id)qword_1000CD158 addObject:self];
  v3 = +[CBUUID UUIDWithString:@"9FBF120D-6301-42D9-8C58-25E699A21DBD"];
  v13[0] = v3;
  v4 = +[CBUUID UUIDWithString:@"0188BF66-463A-405D-91FD-0B8940B92254"];
  v13[1] = v4;
  v5 = +[CBUUID UUIDWithString:@"2BDCAEBE-8746-45DF-A841-96B840980FB7"];
  v13[2] = v5;
  v6 = +[CBUUID UUIDWithString:@"2BDCAEBE-8746-45DF-A841-96B840980FB8"];
  v13[3] = v6;
  v7 = +[CBUUID UUIDWithString:@"30E69638-3752-4FEB-A3AA-3226BCD05ACE"];
  v13[4] = v7;
  objc_super v8 = +[NSArray arrayWithObjects:v13 count:5];

  v9 = [(ClientService *)self peripheral];
  v10 = [(ClientService *)self service];
  [v9 discoverCharacteristics:v8 forService:v10];

  [(AuthenticationService *)self setAuthState:1];
  v11 = +[NSTimer scheduledTimerWithTimeInterval:self target:"authTimeout" selector:0 userInfo:0 repeats:90.0];
  [(AuthenticationService *)self setAuthTimer:v11];
}

- (void)stop
{
  v3 = [(AuthenticationService *)self authTimer];
  [v3 invalidate];

  [(id)qword_1000CD158 removeObject:self];
  v4.receiver = self;
  v4.super_class = (Class)AuthenticationService;
  [(ClientService *)&v4 stop];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_1000CD158 = (uint64_t)objc_alloc_init((Class)NSMutableSet);
    _objc_release_x1();
  }
}

- (void)dealloc
{
  CFRelease(self->_authInfo);
  v3.receiver = self;
  v3.super_class = (Class)AuthenticationService;
  [(AuthenticationService *)&v3 dealloc];
}

- (void)issueChallenge
{
  id v35 = [(AuthenticationService *)self versionCharacteristic];
  uint64_t v3 = [v35 value];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    v5 = [(AuthenticationService *)self certificate1Characteristic];
    uint64_t v6 = [v5 value];
    if (v6)
    {
      v7 = (void *)v6;
      objc_super v8 = [(AuthenticationService *)self certificate2Characteristic];
      v9 = [v8 value];

      if (!v9) {
        return;
      }
      v10 = [(AuthenticationService *)self versionCharacteristic];
      v11 = [v10 value];
      objc_super v12 = +[DataInputStream inputStreamWithData:v11 byteOrder:1];

      __int16 v37 = 0;
      if (([v12 readUint16:&v37] & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_100075680();
        }
        goto LABEL_27;
      }
      if (v37 == 512)
      {
        int v13 = 2;
      }
      else
      {
        if (v37 != 768)
        {
          v34 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_100075368(v34, self);
          }
          goto LABEL_27;
        }
        int v13 = 3;
      }
      int valuePtr = v13;
      Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
      v15 = [(AuthenticationService *)self certificate1Characteristic];
      id v16 = [v15 value];
      v17 = (const UInt8 *)[v16 bytes];
      v18 = [(AuthenticationService *)self certificate1Characteristic];
      v19 = [v18 value];
      CFDataAppendBytes(Mutable, v17, (CFIndex)[v19 length]);

      v20 = [(AuthenticationService *)self certificate2Characteristic];
      id v21 = [v20 value];
      v22 = (const UInt8 *)[v21 bytes];
      v23 = [(AuthenticationService *)self certificate2Characteristic];
      v24 = [v23 value];
      CFDataAppendBytes(Mutable, v22, (CFIndex)[v24 length]);

      v25 = [(AuthenticationService *)self authInfo];
      CFDictionarySetValue(v25, kAuthCertBufferKey, Mutable);
      CFRelease(Mutable);
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
        sub_1000755B8();
      }
      if (VerifyCertSerialNumber()
        && VerifyCertAuthority()
        && [(AuthenticationService *)self verifyCertificateIsUnique])
      {
        GetRandomDigest();
        v26 = [(AuthenticationService *)self authInfo];
        CFDictionarySetValue(v26, kAuthNonceBufferKey, 0);
        CFRelease(0);
        CFNumberRef v27 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCharType, &valuePtr);
        v28 = [(AuthenticationService *)self authInfo];
        CFDictionarySetValue(v28, kAuthVersionKey, v27);
        CFRelease(v27);
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
          sub_100075448();
        }
        v29 = [(ClientService *)self peripheral];
        v30 = [(AuthenticationService *)self challengeResponseCharacteristic];
        [v29 setNotifyValue:1 forCharacteristic:v30];

        v31 = [(ClientService *)self peripheral];
        v32 = [(AuthenticationService *)self challengeResponseCharacteristic];
        [v31 writeValue:0 forCharacteristic:v32 type:0];

        [(AuthenticationService *)self setAuthState:2];
        [(ClientService *)self notifyDidStart];
        goto LABEL_28;
      }
      v33 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100075510(v33);
      }
LABEL_27:
      [(AuthenticationService *)self authenticationDidFail];
LABEL_28:

      return;
    }
  }
}

- (void)verifyChallenge
{
  if ((id)[(AuthenticationService *)self authState] == (id)2)
  {
    uint64_t v3 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
      sub_1000756B4(v3);
    }
    objc_super v4 = [(ClientService *)self peripheral];
    v5 = [(AuthenticationService *)self challengeResponseCharacteristic];
    [v4 readValueForCharacteristic:v5];

    [(AuthenticationService *)self setAuthState:3];
  }
  else if ((id)[(AuthenticationService *)self authState] == (id)3)
  {
    uint64_t v6 = [(AuthenticationService *)self authInfo];
    v7 = (const void *)kAuthResponseBufferKey;
    objc_super v8 = [(AuthenticationService *)self challengeResponseCharacteristic];
    v9 = [v8 value];
    CFDictionarySetValue(v6, v7, v9);

    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
      sub_100075814();
    }
    v10 = [(AuthenticationService *)self authTimer];
    [v10 invalidate];

    [(AuthenticationService *)self setAuthState:4];
    v11 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v12 = v11;
      int v18 = 138412290;
      v19 = [(AuthenticationService *)self authInfo];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "About to verify nonce with dictionary %@", (uint8_t *)&v18, 0xCu);
    }
    [(AuthenticationService *)self authInfo];
    int v13 = VerifyNonceSigned();
    v14 = (void *)qword_1000CD178;
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        id v16 = [(ClientService *)self peripheral];
        v17 = [v16 name];
        int v18 = 138412290;
        v19 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Authentication has succeeded on peripheral \"%@\"", (uint8_t *)&v18, 0xCu);
      }
      [(AuthenticationService *)self authenticationDidSucceed];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10007576C(v14);
      }
      [(AuthenticationService *)self authenticationDidFail];
    }
  }
}

- (void)authTimeout
{
  int64_t v3 = [(AuthenticationService *)self authState];
  objc_super v4 = (void *)qword_1000CD178;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR);
  if (v3 == 2)
  {
    if (v5) {
      sub_1000758DC(v4);
    }
    uint64_t v6 = [(ClientService *)self peripheral];
    v7 = [(AuthenticationService *)self challengeResponseCharacteristic];
    [v6 readValueForCharacteristic:v7];

    [(AuthenticationService *)self setAuthState:3];
  }
  else
  {
    if (v5) {
      sub_100075984(v4, self);
    }
    [(AuthenticationService *)self authenticationDidFail];
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v39 = a3;
  if (!a5)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = [a4 characteristics];
    id v8 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v42;
      v38 = self;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(obj);
          }
          objc_super v12 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v11);
          int v13 = [(AuthenticationService *)self versionCharacteristic];
          if (v13)
          {
          }
          else
          {
            id v15 = v9;
            id v16 = [v12 UUID];
            v17 = +[CBUUID UUIDWithString:@"9FBF120D-6301-42D9-8C58-25E699A21DBD"];
            if ([v16 isEqual:v17])
            {

              id v9 = v15;
LABEL_22:
              [(AuthenticationService *)self setVersionCharacteristic:v12];
              goto LABEL_23;
            }
            v26 = [v12 UUID];
            CFNumberRef v27 = +[CBUUID UUIDWithString:@"0188BF66-463A-405D-91FD-0B8940B92254"];
            unsigned int v28 = [v26 isEqual:v27];

            self = v38;
            id v9 = v15;
            if (v28) {
              goto LABEL_22;
            }
          }
          v14 = [(AuthenticationService *)self certificate1Characteristic];
          if (v14)
          {
          }
          else
          {
            int v18 = [v12 UUID];
            v19 = +[CBUUID UUIDWithString:@"2BDCAEBE-8746-45DF-A841-96B840980FB7"];
            unsigned int v20 = [v18 isEqual:v19];

            if (v20)
            {
              [(AuthenticationService *)self setCertificate1Characteristic:v12];
              goto LABEL_23;
            }
          }
          id v21 = [(AuthenticationService *)self certificate2Characteristic];
          if (v21)
          {

LABEL_19:
            v25 = [(AuthenticationService *)self challengeResponseCharacteristic];
            if (v25)
            {
            }
            else
            {
              v30 = [v12 UUID];
              v31 = +[CBUUID UUIDWithString:@"30E69638-3752-4FEB-A3AA-3226BCD05ACE"];
              unsigned int v32 = [v30 isEqual:v31];

              if (v32) {
                [(AuthenticationService *)self setChallengeResponseCharacteristic:v12];
              }
            }
            goto LABEL_27;
          }
          v22 = [v12 UUID];
          v23 = +[CBUUID UUIDWithString:@"2BDCAEBE-8746-45DF-A841-96B840980FB8"];
          unsigned int v24 = [v22 isEqual:v23];

          if (!v24) {
            goto LABEL_19;
          }
          [(AuthenticationService *)self setCertificate2Characteristic:v12];
LABEL_23:
          v29 = [v12 value];

          if (!v29) {
            [v39 readValueForCharacteristic:v12];
          }
LABEL_27:
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v9);
    }

    [(AuthenticationService *)self issueChallenge];
    v33 = [(AuthenticationService *)self versionCharacteristic];

    if (!v33 && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100075AB0();
    }
    uint64_t v34 = [(AuthenticationService *)self certificate1Characteristic];
    if (!v34
      || (id v35 = (void *)v34,
          [(AuthenticationService *)self certificate2Characteristic],
          v36 = objc_claimAutoreleasedReturnValue(),
          v36,
          v35,
          !v36))
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100075A7C();
      }
    }
    __int16 v37 = [(AuthenticationService *)self challengeResponseCharacteristic];

    if (!v37 && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100075A48();
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [(AuthenticationService *)self challengeResponseCharacteristic];

    if (v11 == v9)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100075AE4();
      }
      [(AuthenticationService *)self authenticationDidFail];
    }
    goto LABEL_14;
  }
  uint64_t v12 = [(AuthenticationService *)self versionCharacteristic];
  int v13 = v9;
  if ((id)v12 == v9) {
    goto LABEL_12;
  }
  v14 = (void *)v12;
  uint64_t v15 = [(AuthenticationService *)self certificate1Characteristic];
  if ((id)v15 == v9)
  {

    int v13 = v14;
LABEL_12:

    goto LABEL_13;
  }
  id v16 = (void *)v15;
  id v17 = [(AuthenticationService *)self certificate2Characteristic];

  if (v17 == v9)
  {
LABEL_13:
    [(AuthenticationService *)self issueChallenge];
    goto LABEL_14;
  }
  id v18 = [(AuthenticationService *)self challengeResponseCharacteristic];

  if (v18 == v9) {
    [(AuthenticationService *)self verifyChallenge];
  }
LABEL_14:
}

- (id)certificateSerialNumber
{
  v2 = [(AuthenticationService *)self authInfo];
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v2, kAuthCertBufferKey);
  if (Value)
  {
    CFDataRef v4 = Value;
    v7[0] = 0;
    v7[1] = 0;
    CFDataGetBytePtr(Value);
    CFDataGetLength(v4);
    int v5 = IapAuthCertSerial();
    CFDataRef Value = 0;
    if (v5)
    {
      CFDataRef Value = +[NSData dataWithBytes:v7 length:16];
    }
  }

  return Value;
}

- (BOOL)verifyCertificateIsUnique
{
  int64_t v3 = [(AuthenticationService *)self certificateSerialNumber];
  char v4 = v3 != 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)qword_1000CD158;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(AuthenticationService **)(*((void *)&v14 + 1) + 8 * i);
        if (v10 != self)
        {
          uint64_t v11 = [(AuthenticationService *)v10 certificateSerialNumber];
          uint64_t v12 = (void *)v11;
          if (v11) {
            LOBYTE(v11) = [v3 isEqualToData:v11];
          }
          v4 &= v11 ^ 1;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4 & 1;
}

- (void)authenticationDidSucceed
{
  int64_t v3 = [(AuthenticationService *)self authInfo];
  char v4 = [(__CFDictionary *)v3 objectForKeyedSubscript:kAuthVersionKey];
  int v5 = [v4 intValue];
  uint64_t CertClass = 0x7FFFFFFFLL;
  if (v5 <= 2
    && (id v7 = [(AuthenticationService *)self authInfo],
        CFDictionaryGetValue(v7, kAuthCertBufferKey),
        uint64_t CertClass = GetCertClass(),
        CertClass == 0x7FFFFFFF))
  {
    [(AuthenticationService *)self authenticationDidFail];
  }
  else
  {
    v12[0] = @"AuthenticationServiceCertClassUserInfoKey";
    uint64_t v8 = +[NSNumber numberWithUnsignedInt:CertClass];
    v12[1] = @"AuthenticationServiceAuthVersionKey";
    v13[0] = v8;
    v13[1] = v4;
    id v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

    id v10 = +[NSNotificationCenter defaultCenter];
    uint64_t v11 = [(ClientService *)self peripheral];
    [v10 postNotificationName:@"AuthenticationServiceAuthDidSucceedNotification" object:v11 userInfo:v9];
  }
}

- (void)authenticationDidFail
{
  id v4 = +[NSNotificationCenter defaultCenter];
  int64_t v3 = [(ClientService *)self peripheral];
  [v4 postNotificationName:@"AuthenticationServiceAuthDidFailNotification" object:v3];
}

- (id)authStateString
{
  int64_t v2 = [(AuthenticationService *)self authState];
  if ((unint64_t)(v2 - 1) > 3) {
    return @"Invalid";
  }
  else {
    return off_1000B2368[v2 - 1];
  }
}

- (CBCharacteristic)versionCharacteristic
{
  return self->_versionCharacteristic;
}

- (void)setVersionCharacteristic:(id)a3
{
}

- (CBCharacteristic)certificate1Characteristic
{
  return self->_certificate1Characteristic;
}

- (void)setCertificate1Characteristic:(id)a3
{
}

- (CBCharacteristic)certificate2Characteristic
{
  return self->_certificate2Characteristic;
}

- (void)setCertificate2Characteristic:(id)a3
{
}

- (CBCharacteristic)challengeResponseCharacteristic
{
  return self->_challengeResponseCharacteristic;
}

- (void)setChallengeResponseCharacteristic:(id)a3
{
}

- (int64_t)authState
{
  return self->_authState;
}

- (void)setAuthState:(int64_t)a3
{
  self->_authState = a3;
}

- (__CFDictionary)authInfo
{
  return self->_authInfo;
}

- (void)setAuthInfo:(__CFDictionary *)a3
{
  self->_authInfo = a3;
}

- (NSTimer)authTimer
{
  return self->_authTimer;
}

- (void)setAuthTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authTimer, 0);
  objc_storeStrong((id *)&self->_challengeResponseCharacteristic, 0);
  objc_storeStrong((id *)&self->_certificate2Characteristic, 0);
  objc_storeStrong((id *)&self->_certificate1Characteristic, 0);

  objc_storeStrong((id *)&self->_versionCharacteristic, 0);
}

@end