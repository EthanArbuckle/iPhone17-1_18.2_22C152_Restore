@interface SOSKVSCircleStorageTransport
- (BOOL)expireRetirementRecords:(__CFDictionary *)a3 err:(__CFError *)a4;
- (BOOL)flushChanges:(__CFError *)a3;
- (BOOL)kvsAppendDebugKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6;
- (BOOL)kvsAppendKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6;
- (BOOL)kvsAppendRingKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6;
- (BOOL)kvsRingFlushChanges:(__CFError *)a3;
- (BOOL)kvsRingPostRing:(__CFString *)a3 ring:(__CFData *)a4 err:(__CFError *)a5;
- (BOOL)kvsSendOfficialDSID:(__CFString *)a3 err:(__CFError *)a4;
- (BOOL)kvsSendPendingChanges:(__CFError *)a3;
- (BOOL)kvssendDebugInfo:(__CFString *)a3 debug:(void *)a4 err:(__CFError *)a5;
- (BOOL)postCircle:(__CFString *)a3 circleData:(__CFData *)a4 err:(__CFError *)a5;
- (BOOL)postRetirement:(__CFString *)a3 peer:(__OpaqueSOSPeerInfo *)a4 err:(__CFError *)a5;
- (NSMutableDictionary)pending_changes;
- (NSString)circleName;
- (SOSKVSCircleStorageTransport)init;
- (SOSKVSCircleStorageTransport)initWithAccount:(id)a3 andCircleName:(id)a4;
- (__CFArray)handleCircleMessagesAndReturnHandledCopy:(__CFDictionary *)a3 err:(__CFError *)a4;
- (__CFDictionary)handleRetirementMessages:(__CFDictionary *)a3 err:(__CFError *)a4;
- (int64_t)getTransportType;
- (void)kvsAddToPendingChanges:(__CFString *)a3 data:(__CFData *)a4;
- (void)setCircleName:(id)a3;
- (void)setPending_changes:(id)a3;
@end

@implementation SOSKVSCircleStorageTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->circleName, 0);

  objc_storeStrong((id *)&self->pending_changes, 0);
}

- (void)setCircleName:(id)a3
{
}

- (NSString)circleName
{
  return self->circleName;
}

- (void)setPending_changes:(id)a3
{
}

- (NSMutableDictionary)pending_changes
{
  return self->pending_changes;
}

- (BOOL)postRetirement:(__CFString *)a3 peer:(__OpaqueSOSPeerInfo *)a4 err:(__CFError *)a5
{
  uint64_t v6 = SOSPeerInfoCopyEncodedData();
  if (v6)
  {
    v7 = (const void *)v6;
    v8 = [(SOSKVSCircleStorageTransport *)self circleName];
    SOSPeerInfoGetPeerID();
    v9 = (const void *)SOSRetirementKeyCreateWithCircleNameAndPeer();

    if (v9)
    {
      [(SOSKVSCircleStorageTransport *)self kvsAddToPendingChanges:v9 data:v7];
      CFRelease(v9);
    }
    CFRelease(v7);
  }
  return 1;
}

- (BOOL)kvsSendOfficialDSID:(__CFString *)a3 err:(__CFError *)a4
{
  if (a3)
  {
    CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(kCFAllocatorDefault, a3, 0x8000100u, 0x3Fu);
    [(SOSKVSCircleStorageTransport *)self kvsAddToPendingChanges:kSOSKVSOfficialDSIDKey data:ExternalRepresentation];
    if (ExternalRepresentation) {
      CFRelease(ExternalRepresentation);
    }
  }
  return 1;
}

- (BOOL)kvsRingFlushChanges:(__CFError *)a3
{
  return [(SOSKVSCircleStorageTransport *)self kvsSendPendingChanges:a3];
}

- (BOOL)kvsRingPostRing:(__CFString *)a3 ring:(__CFData *)a4 err:(__CFError *)a5
{
  uint64_t v7 = SOSRingKeyCreateWithName();
  if (v7)
  {
    v8 = (const void *)v7;
    [(SOSKVSCircleStorageTransport *)self kvsAddToPendingChanges:v7 data:a4];
    CFRelease(v8);
  }
  return 1;
}

- (BOOL)kvssendDebugInfo:(__CFString *)a3 debug:(void *)a4 err:(__CFError *)a5
{
  uint64_t v6 = (const void *)SOSDebugInfoKeyCreateWithTypeName();
  v9 = v6;
  v10 = a4;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  if (v6) {
    CFRelease(v6);
  }
  sub_1002133C0();

  return 1;
}

- (BOOL)kvsAppendDebugKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6
{
  uint64_t v7 = (const void *)SOSDebugInfoKeyCreateWithTypeName();
  CFArrayAppendValue(a3, v7);
  if (v7) {
    CFRelease(v7);
  }
  return 1;
}

- (BOOL)kvsAppendRingKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6
{
  v8 = [(SOSCircleStorageTransport *)self account];
  id v9 = sub_1001EEC4C(v8);

  if (!v9)
  {
LABEL_9:
    LOBYTE(account) = 1;
    return (char)account;
  }
  account = self->super.account;
  if (account)
  {
    v11 = [(SOSAccount *)account trust];
    if ([v11 trustedCircle])
    {
      v12 = self->super.account;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v18 = sub_1002136B0;
      v19 = &unk_100308FD8;
      v20 = a5;
      v13 = v17;
      if ([(SOSAccount *)v12 peerInfo])
      {
        CFSetRef v14 = (const __CFSet *)SOSViewCopyViewSet();
        context[0] = _NSConcreteStackBlock;
        context[1] = 3221225472;
        context[2] = sub_1001E9CF8;
        context[3] = &unk_100307BD0;
        v15 = v13;
        id v22 = v15;
        CFSetApplyFunction(v14, (CFSetApplierFunction)sub_1001E9CE0, context);
        if (v14) {
          CFRelease(v14);
        }
        ((void (*)(void *, const __CFString *))v18)(v15, @"RecoveryRing");
      }
      goto LABEL_9;
    }

    LOBYTE(account) = 0;
  }
  return (char)account;
}

- (BOOL)kvsAppendKeyInterest:(__CFArray *)a3 firstUnlock:(__CFArray *)a4 unlocked:(__CFArray *)a5 err:(__CFError *)a6
{
  v8 = [(SOSCircleStorageTransport *)self account];
  id v9 = sub_1001EEC4C(v8);

  if (!v9) {
    goto LABEL_9;
  }
  v10 = [(SOSKVSCircleStorageTransport *)self circleName];

  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = SOSCircleKeyCreateWithName();
  if (v11)
  {
    v12 = (const void *)v11;
    account = self->super.account;
    if (account)
    {
      CFSetRef v14 = [(SOSAccount *)account trust];
      if ([v14 trustedCircle])
      {
        Name = (const void *)SOSCircleGetName();
        if (Name)
        {
          if (CFEqual(v10, Name))
          {
            SOSCircleForEachActivePeer();
            CFArrayAppendValue(a5, v12);
            CFRelease(v12);

LABEL_9:
            LOBYTE(v11) = 1;
            return v11;
          }
        }
      }
    }
    CFRelease(v12);
LABEL_12:
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (__CFArray)handleCircleMessagesAndReturnHandledCopy:(__CFDictionary *)a3 err:(__CFError *)a4
{
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100213980;
  v8[3] = &unk_100309C30;
  v8[4] = self;
  v8[5] = Mutable;
  CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)sub_100213F24, v8);
  return Mutable;
}

- (__CFDictionary)handleRetirementMessages:(__CFDictionary *)a3 err:(__CFError *)a4
{
  id v6 = [(SOSCircleStorageTransport *)self account];
  uint64_t v7 = [v6 trust];
  [v7 trustedCircle];
  Name = (const void *)SOSCircleGetName();
  CFArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if ([v7 trustedCircle]
    && (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a3, Name)) != 0
    && (CFDictionaryRef v18 = Value, v19 = CFGetTypeID(Value), v19 == CFDictionaryGetTypeID()))
  {
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472;
    context[2] = sub_1001F6C90;
    context[3] = &unk_100307F70;
    v40 = a4;
    id v20 = v7;
    id v38 = v20;
    id v21 = v6;
    id v39 = v21;
    CFArrayRef v41 = Mutable;
    CFDictionaryApplyFunction(v18, (CFDictionaryApplierFunction)sub_1001F6508, context);
    id v22 = [v21 peerInfo];
    if (v22)
    {
      id v23 = v22;
      v24 = [v20 retirees];
      LODWORD(v23) = [v24 containsObject:v23];

      if (v23)
      {
        v25 = [v21 trust];
        [v25 purgeIdentity];

        [v20 setDepartureCode:6];
      }
    }
    if (CFArrayGetCount(Mutable)) {
      CFDictionaryRef v33 = sub_100139704(kCFAllocatorDefault, v26, v27, v28, v29, v30, v31, v32, (uint64_t)Name, (uint64_t)Mutable);
    }
    else {
      CFDictionaryRef v33 = sub_100139704(kCFAllocatorDefault, v26, v27, v28, v29, v30, v31, v32, 0, v36);
    }
    v34 = v33;
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    v34 = sub_100139704(kCFAllocatorDefault, v10, v11, v12, v13, v14, v15, v16, 0, v36);
  }

  return v34;
}

- (BOOL)postCircle:(__CFString *)a3 circleData:(__CFData *)a4 err:(__CFError *)a5
{
  uint64_t v7 = SOSCircleKeyCreateWithName();
  if (v7)
  {
    v8 = (const void *)v7;
    [(SOSKVSCircleStorageTransport *)self kvsAddToPendingChanges:v7 data:a4];
    CFRelease(v8);
  }
  return 1;
}

- (BOOL)flushChanges:(__CFError *)a3
{
  return [(SOSKVSCircleStorageTransport *)self kvsSendPendingChanges:a3];
}

- (BOOL)expireRetirementRecords:(__CFDictionary *)a3 err:(__CFError *)a4
{
  CFDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472;
  context[2] = sub_100214284;
  context[3] = &unk_100308F10;
  void context[4] = Mutable;
  CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)sub_100213F24, context);
  if (CFDictionaryGetCount(Mutable)) {
    sub_1002133C0();
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return 1;
}

- (void)kvsAddToPendingChanges:(__CFString *)a3 data:(__CFData *)a4
{
  uint64_t v7 = [(SOSKVSCircleStorageTransport *)self pending_changes];

  if (!v7)
  {
    v8 = +[NSMutableDictionary dictionary];
    [(SOSKVSCircleStorageTransport *)self setPending_changes:v8];
  }
  id v9 = [(SOSKVSCircleStorageTransport *)self pending_changes];
  id v11 = v9;
  if (a4)
  {
    [v9 setObject:a4 forKey:a3];
  }
  else
  {
    int v10 = +[NSNull null];
    [v11 setObject:v10 forKey:a3];
  }
}

- (BOOL)kvsSendPendingChanges:(__CFError *)a3
{
  uint64_t v4 = [(SOSKVSCircleStorageTransport *)self pending_changes];
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = [(SOSKVSCircleStorageTransport *)self pending_changes];
    id v7 = [v6 count];

    if (v7)
    {
      CFStringRef v8 = sub_1001E4B34(self->super.account);
      if (v8) {
        CFNullRef v9 = (CFNullRef)v8;
      }
      else {
        CFNullRef v9 = kCFNull;
      }
      int v10 = [(SOSKVSCircleStorageTransport *)self pending_changes];
      [v10 setObject:v9 forKey:kSOSKVSRequiredKey];

      id v11 = [(SOSKVSCircleStorageTransport *)self pending_changes];
      sub_1002133C0();

      int v12 = [(SOSKVSCircleStorageTransport *)self pending_changes];
      [v12 removeAllObjects];
    }
  }
  return 1;
}

- (int64_t)getTransportType
{
  return 1;
}

- (SOSKVSCircleStorageTransport)initWithAccount:(id)a3 andCircleName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SOSKVSCircleStorageTransport;
  CFStringRef v8 = [(SOSCircleStorageTransport *)&v12 init];
  if (v8)
  {
    CFNullRef v9 = +[NSMutableDictionary dictionary];
    [(SOSKVSCircleStorageTransport *)v8 setPending_changes:v9];

    id v10 = [objc_alloc((Class)NSString) initWithString:v7];
    [(SOSKVSCircleStorageTransport *)v8 setCircleName:v10];

    [(SOSCircleStorageTransport *)v8 setAccount:v6];
    sub_10020C938(v8);
  }

  return v8;
}

- (SOSKVSCircleStorageTransport)init
{
  v3.receiver = self;
  v3.super_class = (Class)SOSKVSCircleStorageTransport;
  return [(SOSCircleStorageTransport *)&v3 init];
}

@end