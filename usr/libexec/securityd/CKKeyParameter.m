@interface CKKeyParameter
- (BOOL)SOSTransportKeyParameterHandleKeyParameterChanges:(id)a3 data:(__CFData *)a4 err:(__CFError *)a5;
- (BOOL)SOSTransportKeyParameterKVSAppendKeyInterests:(id)a3 ak:(__CFArray *)a4 firstUnLock:(__CFArray *)a5 unlocked:(__CFArray *)a6 err:(__CFError *)a7;
- (BOOL)SOSTransportKeyParameterPublishCloudParameters:(id)a3 data:(__CFData *)a4 err:(__CFError *)a5;
- (CKKeyParameter)initWithAccount:(id)a3;
- (SOSAccount)account;
- (id)SOSTransportKeyParameterGetAccount:(id)a3;
- (int64_t)SOSTransportKeyParameterGetTransportType:(id)a3 err:(__CFError *)a4;
- (void)setAccount:(id)a3;
@end

@implementation CKKeyParameter

- (void).cxx_destruct
{
}

- (void)setAccount:(id)a3
{
}

- (SOSAccount)account
{
  return (SOSAccount *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)SOSTransportKeyParameterPublishCloudParameters:(id)a3 data:(__CFData *)a4 err:(__CFError *)a5
{
  v8 = sub_10000B070("circleOps");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Publishing Cloud Parameters", buf, 2u);
    }

    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, @"[");
    double Current = CFAbsoluteTimeGetCurrent();
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1002149D0;
    v34[3] = &unk_100308FD8;
    v34[4] = MutableCopy;
    sub_100026140((uint64_t)v34, Current);
    CFStringAppend(MutableCopy, @"]");
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, MutableCopy, 0x8000100u, 0x3Fu);
    CFIndex Length = CFDataGetLength(ExternalRepresentation);
    CFIndex v14 = CFDataGetLength(a4);
    Mutable = CFDataCreateMutable(kCFAllocatorDefault, v14 + Length);
    BytePtr = CFDataGetBytePtr(ExternalRepresentation);
    CFIndex v17 = CFDataGetLength(ExternalRepresentation);
    CFDataAppendBytes(Mutable, BytePtr, v17);
    v18 = CFDataGetBytePtr(a4);
    CFIndex v19 = CFDataGetLength(a4);
    CFDataAppendBytes(Mutable, v18, v19);
    CFDataRef Copy = CFDataCreateCopy(kCFAllocatorDefault, Mutable);
    v21 = [(SOSAccount *)self->account peerID];

    if (v21) {
      uint64_t v22 = SOSLastKeyParametersPushedKeyCreateWithPeerID();
    }
    else {
      uint64_t v22 = SOSLastKeyParametersPushedKeyCreateWithAccountGestalt();
    }
    v30 = (const void *)v22;
    CFDictionaryRef v31 = sub_100139704(kCFAllocatorDefault, v23, v24, v25, v26, v27, v28, v29, kSOSKVSKeyParametersKey, (uint64_t)a4);
    if (v30) {
      CFRelease(v30);
    }
    v32 = dispatch_get_global_queue(-2, 0);
    SOSCloudKeychainPutObjectsInCloud();

    sub_10021D758(1);
    if (v31) {
      CFRelease(v31);
    }
    if (ExternalRepresentation) {
      CFRelease(ExternalRepresentation);
    }
    if (Copy) {
      CFRelease(Copy);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Tried to publish nil Cloud Parameters", buf, 2u);
    }

    sub_1000297D0(0, (CFTypeRef *)a5, @"Tried to publish nil Cloud Parameters");
  }
  return a4 != 0;
}

- (BOOL)SOSTransportKeyParameterKVSAppendKeyInterests:(id)a3 ak:(__CFArray *)a4 firstUnLock:(__CFArray *)a5 unlocked:(__CFArray *)a6 err:(__CFError *)a7
{
  return 1;
}

- (CKKeyParameter)initWithAccount:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKKeyParameter;
  v5 = [(CKKeyParameter *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(CKKeyParameter *)v5 setAccount:v4];
    v7 = v6;
    v8 = (__CFArray *)sub_10020C6EC();
    CFArrayAppendValue(v8, v7);
  }
  return v6;
}

- (int64_t)SOSTransportKeyParameterGetTransportType:(id)a3 err:(__CFError *)a4
{
  return 1;
}

- (id)SOSTransportKeyParameterGetAccount:(id)a3
{
  return self->account;
}

- (BOOL)SOSTransportKeyParameterHandleKeyParameterChanges:(id)a3 data:(__CFData *)a4 err:(__CFError *)a5
{
  v6 = self->account;
  v7 = v6;
  if (v6)
  {
    if ([(SOSAccount *)v6 accountIsChanging])
    {
      v8 = sub_10000B070("circleOps");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SOSAccountHandleParametersChange called before signing in to new account", buf, 2u);
      }

      BOOL v9 = 1;
      goto LABEL_60;
    }
    CFTypeRef cf2 = 0;
    if (!sub_1001EC5D4((int)&cf2, a4)) {
      goto LABEL_17;
    }
  }
  else
  {
    CFTypeRef cf2 = 0;
    if (!sub_1001EC5D4((int)&cf2, a4))
    {
LABEL_17:
      BOOL v9 = 0;
      goto LABEL_58;
    }
  }
  sub_1001EB124(@"SOSAccountHandleParametersChange got new user key parameters:", 0);
  objc_super v10 = (__SecKey *)SOSCopyIDOfKeyWithLength();
  v11 = sub_10000B070("circleOps");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SOSAccountHandleParametersChange got new public key: %@", buf, 0xCu);
  }

  if (v10) {
    CFRelease(v10);
  }
  v12 = [(SOSAccount *)v7 accountKey];
  if (v12 && cf2)
  {
    if (CFEqual(v12, cf2)) {
      goto LABEL_14;
    }
  }
  else if (v12 == cf2)
  {
LABEL_14:
    v13 = sub_10000B070("circleOps");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      CFIndex v14 = "Got same public key sent our way. Ignoring.";
LABEL_45:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
      goto LABEL_46;
    }
    goto LABEL_46;
  }
  v15 = [(SOSAccount *)v7 previousAccountKey];
  CFTypeRef v16 = cf2;
  if (v15 && cf2)
  {
    if (!CFEqual(v15, cf2))
    {
      CFTypeRef v16 = cf2;
      goto LABEL_24;
    }
  }
  else if (v15 != cf2)
  {
LABEL_24:
    CFIndex v17 = v7;
    if ([(SOSAccount *)v17 accountKeyIsTrusted] && [(SOSAccount *)v17 accountKey])
    {
      v18 = sub_10000B070("circleOps");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        CFIndex v19 = [(SOSAccount *)v17 accountKey];
        *(_DWORD *)buf = 138412290;
        v35 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Moving : %@ to previousAccountKey", buf, 0xCu);
      }

      [(SOSAccount *)v17 setPreviousAccountKey:[(SOSAccount *)v17 accountKey]];
    }
    [(SOSAccount *)v17 setAccountKey:v16];
    [(SOSAccount *)v17 setAccountKeyIsTrusted:0];
    if (![(SOSAccount *)v17 previousAccountKey]) {
      [(SOSAccount *)v17 setPreviousAccountKey:[(SOSAccount *)v17 accountKey]];
    }
    [(SOSAccount *)v17 accountKey];
    v20 = (__SecKey *)SOSCopyIDOfKeyWithLength();
    v21 = sub_10000B070("circleOps");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "not trusting new public key: %@", buf, 0xCu);
    }

    if (v20) {
      CFRelease(v20);
    }

    CFTypeRef v22 = cf2;
    if (cf2)
    {
      CFTypeRef cf2 = 0;
      CFRelease(v22);
    }
    [(SOSAccount *)v17 setAccountKeyDerivationParameters:0];
    int v23 = v17;
    int v24 = [(SOSAccount *)v23 _password_tmp];

    if (!v24)
    {
      int v25 = sub_10000B070("circleOps");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Password cache expired", buf, 2u);
      }
    }
    int v26 = [(SOSAccount *)v23 _password_tmp];

    if (v26)
    {
      CFRetain(v26);
      int v27 = sub_1001EF92C(v23, 0, (const __CFData *)v26, 0);
      CFRelease(v26);
    }
    else
    {
      int v27 = 0;
    }

    int v28 = sub_10000B070("circleOps");
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v27)
    {
      if (v29)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Successfully used cached password with new parameters", buf, 2u);
      }

      sub_1001EE498(v23);
    }
    else
    {
      if (v29)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Got new parameters for public key - could not find or use cached password", buf, 2u);
      }

      sub_1001EE564(v23);
    }
    v30 = sub_10000B070("circleop");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Setting account.key_interests_need_updating to true in SOSAccountHandleParametersChange", buf, 2u);
    }

    BOOL v9 = 1;
    [(SOSAccount *)v23 setCircle_rings_retirements_need_attention:1];
    [(SOSAccount *)v23 setKey_interests_need_updating:1];
    goto LABEL_58;
  }
  v13 = sub_10000B070("circleOps");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    CFIndex v14 = "Got previous public key repeated. Ignoring.";
    goto LABEL_45;
  }
LABEL_46:

  BOOL v9 = 1;
LABEL_58:
  CFTypeRef v31 = cf2;
  if (cf2)
  {
    CFTypeRef cf2 = 0;
    CFRelease(v31);
  }
LABEL_60:

  return v9;
}

@end