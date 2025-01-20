@interface SOSMessageKVS
- (BOOL)SOSTransportMessageCleanupAfterPeerMessages:(id)a3 peers:(__CFDictionary *)a4 err:(__CFError *)a5;
- (BOOL)SOSTransportMessageKVSAppendKeyInterest:(id)a3 ak:(__CFArray *)a4 firstUnlock:(__CFArray *)a5 unlocked:(__CFArray *)a6 err:(__CFError *)a7;
- (BOOL)SOSTransportMessageSendMessages:(id)a3 pm:(__CFDictionary *)a4 err:(__CFError *)a5;
- (BOOL)SOSTransportMessageSyncWithPeers:(id)a3 p:(__CFSet *)a4 err:(__CFError *)a5;
- (SOSMessageKVS)initWithAccount:(id)a3 andName:(id)a4;
- (__CFDictionary)SOSTransportMessageHandlePeerMessageReturnsHandledCopy:(id)a3 peerMessages:(__CFDictionary *)a4 err:(__CFError *)a5;
- (__CFDictionary)pending_changes;
- (__CFString)SOSTransportMessageGetCircleName;
- (int64_t)SOSTransportMessageGetTransportType;
- (int64_t)SOSTransportMessageGetTransportType:(id)a3 err:(__CFError *)a4;
- (void)SOSTransportMessageGetEngine;
- (void)dealloc;
- (void)setPending_changes:(__CFDictionary *)a3;
@end

@implementation SOSMessageKVS

- (void)setPending_changes:(__CFDictionary *)a3
{
  self->_pending_changes = a3;
}

- (__CFDictionary)pending_changes
{
  return self->_pending_changes;
}

- (BOOL)SOSTransportMessageSendMessages:(id)a3 pm:(__CFDictionary *)a4 err:(__CFError *)a5
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 1;
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472;
  context[2] = sub_1002320E4;
  context[3] = &unk_100309C80;
  id v7 = a3;
  v11 = v13;
  v12 = a5;
  id v10 = v7;
  CFDictionaryApplyFunction(a4, (CFDictionaryApplierFunction)sub_100232264, context);

  _Block_object_dispose(v13, 8);
  return 1;
}

- (BOOL)SOSTransportMessageSyncWithPeers:(id)a3 p:(__CFSet *)a4 err:(__CFError *)a5
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  context[0] = _NSConcreteStackBlock;
  context[1] = 3221225472;
  context[2] = sub_100232434;
  context[3] = &unk_100309C58;
  v11 = &v13;
  id v7 = a3;
  id v10 = v7;
  v12 = a5;
  CFSetApplyFunction(a4, (CFSetApplierFunction)sub_10023251C, context);
  LOBYTE(a5) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)a5;
}

- (__CFDictionary)SOSTransportMessageHandlePeerMessageReturnsHandledCopy:(id)a3 peerMessages:(__CFDictionary *)a4 err:(__CFError *)a5
{
  id v6 = a3;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v8 = [v6 circleName];
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a4, v8);

  CFMutableArrayRef v10 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (Value)
  {
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    uint64_t v15 = sub_100232688;
    char v16 = &unk_100309C30;
    id v17 = v6;
    CFMutableArrayRef v18 = v10;
    CFDictionaryApplyFunction(Value, (CFDictionaryApplierFunction)sub_100232264, &v13);
  }
  v11 = [v6 circleName:v13, v14, v15, v16];
  CFDictionaryAddValue(Mutable, v11, v10);

  if (v10) {
    CFRelease(v10);
  }

  return Mutable;
}

- (BOOL)SOSTransportMessageCleanupAfterPeerMessages:(id)a3 peers:(__CFDictionary *)a4 err:(__CFError *)a5
{
  id v7 = a3;
  v8 = [v7 SOSTransportMessageGetEngine];
  BOOL v9 = -[OTSOSActualAdapter sosEnabled]_0();
  uint64_t v10 = 0;
  if (v8 && v9) {
    uint64_t v10 = v8[10];
  }
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  char v16 = sub_1002328D4;
  id v17 = &unk_100309C30;
  id v18 = v7;
  uint64_t v19 = v10;
  id v11 = v7;
  CFDictionaryApplyFunction(a4, (CFDictionaryApplierFunction)sub_100232264, &v14);
  unsigned __int8 v12 = [v11 SOSTransportMessageFlushChanges:v11 a5:v14 v15:v16 v17:v17];

  return v12;
}

- (int64_t)SOSTransportMessageGetTransportType:(id)a3 err:(__CFError *)a4
{
  return 1;
}

- (BOOL)SOSTransportMessageKVSAppendKeyInterest:(id)a3 ak:(__CFArray *)a4 firstUnlock:(__CFArray *)a5 unlocked:(__CFArray *)a6 err:(__CFError *)a7
{
  id v10 = a3;
  id v11 = [(SOSMessage *)self engine];
  if (v11)
  {
    id v12 = [(SOSMessageKVS *)self SOSTransportMessageGetAccount];
    uint64_t v13 = [v12 trust];
    [v13 fullPeerInfo];
    uint64_t PeerInfo = SOSFullPeerInfoGetPeerInfo();
    if (PeerInfo) {
      uint64_t PeerInfo = SOSPeerInfoGetPeerID();
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001F1394;
    v25[3] = &unk_100307CC0;
    id v26 = v12;
    uint64_t v27 = PeerInfo;
    id v15 = v12;
    CFArrayRef v16 = sub_1001F112C(v15, (uint64_t)a7, v25);

    if (v16)
    {
      id v17 = [(SOSMessage *)self account];
      id v18 = [v17 peerID];

      context[0] = _NSConcreteStackBlock;
      context[1] = 3221225472;
      context[2] = sub_100232DF0;
      context[3] = &unk_100309C08;
      id v22 = v10;
      id v23 = v18;
      v24 = a6;
      id v19 = v18;
      v28.length = CFArrayGetCount(v16);
      v28.location = 0;
      CFArrayApplyFunction(v16, v28, (CFArrayApplierFunction)sub_10023251C, context);
      CFRelease(v16);
    }
  }

  return v11 != 0;
}

- (void)SOSTransportMessageGetEngine
{
  if (![(SOSMessage *)self engine])
  {
    v3 = [(SOSMessage *)self account];
    v4 = (uint64_t (**)(id, void *, void))[v3 factory];
    v5 = [(SOSMessage *)self circleName];
    if (v4 && (uint64_t v6 = v4[1](v4, v5, 0)) != 0)
    {
      id v7 = *(const void **)v6;
      (*(void (**)(uint64_t, void))(v6 + 72))(v6, 0);

      if (v7) {
        CFRetain(v7);
      }
    }
    else
    {

      id v7 = 0;
    }
    [(SOSMessage *)self setEngine:v7];
  }

  return [(SOSMessage *)self engine];
}

- (__CFString)SOSTransportMessageGetCircleName
{
  v2 = [(SOSMessage *)self circleName];

  return v2;
}

- (int64_t)SOSTransportMessageGetTransportType
{
  return 1;
}

- (void)dealloc
{
  pending_changes = self->_pending_changes;
  if (pending_changes)
  {
    self->_pending_changes = 0;
    CFRelease(pending_changes);
  }
  v4.receiver = self;
  v4.super_class = (Class)SOSMessageKVS;
  [(SOSMessage *)&v4 dealloc];
}

- (SOSMessageKVS)initWithAccount:(id)a3 andName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SOSMessageKVS;
  v8 = [(SOSMessageKVS *)&v18 init];
  BOOL v9 = v8;
  if (v8)
  {
    [(SOSMessage *)v8 setAccount:v6];
    id v10 = [objc_alloc((Class)NSString) initWithString:v7];
    [(SOSMessage *)v9 setCircleName:v10];

    id v11 = (uint64_t (**)(id, void *, void))[v6 factory];
    id v12 = [(SOSMessage *)v9 circleName];
    if (v11 && (uint64_t v13 = v11[1](v11, v12, 0)) != 0)
    {
      uint64_t v14 = *(const void **)v13;
      (*(void (**)(uint64_t, void))(v13 + 72))(v13, 0);

      if (v14) {
        CFRetain(v14);
      }
    }
    else
    {

      uint64_t v14 = 0;
    }
    [(SOSMessage *)v9 setEngine:v14];
    v9->_pending_changes = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    id v15 = v9;
    CFArrayRef v16 = (__CFArray *)sub_10020C614();
    CFArrayAppendValue(v16, v15);
  }
  return v9;
}

@end