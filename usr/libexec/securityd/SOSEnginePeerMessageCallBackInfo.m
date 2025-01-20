@interface SOSEnginePeerMessageCallBackInfo
- (SOSEnginePeerMessageCallBackInfo)initWithEngine:(__OpaqueSOSEngine *)a3 peer:(__OpaqueSOSPeer *)a4 localManifest:(__OpaqueSOSManifest *)a5 proposedManifest:(__OpaqueSOSManifest *)a6 confirmedManifest:(__OpaqueSOSManifest *)a7 andMessage:(__OpaqueSOSMessage *)a8;
- (__OpaqueSOSCoder)coder;
- (__OpaqueSOSEngine)engine;
- (__OpaqueSOSManifest)confirmed;
- (__OpaqueSOSManifest)local;
- (__OpaqueSOSManifest)proposed;
- (__OpaqueSOSMessage)message;
- (__OpaqueSOSPeer)peer;
- (id)callbackBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (void)callCallback:(BOOL)a3;
- (void)dealloc;
- (void)setCallback:(id)a3;
- (void)setCallbackBlock:(id)a3;
- (void)setCoder:(__OpaqueSOSCoder *)a3;
- (void)setConfirmed:(__OpaqueSOSManifest *)a3;
- (void)setEngine:(__OpaqueSOSEngine *)a3;
- (void)setLocal:(__OpaqueSOSManifest *)a3;
- (void)setMessage:(__OpaqueSOSMessage *)a3;
- (void)setPeer:(__OpaqueSOSPeer *)a3;
- (void)setProposed:(__OpaqueSOSManifest *)a3;
@end

@implementation SOSEnginePeerMessageCallBackInfo

- (void).cxx_destruct
{
}

- (void)setMessage:(__OpaqueSOSMessage *)a3
{
  self->_message = a3;
}

- (__OpaqueSOSMessage)message
{
  return self->_message;
}

- (void)setConfirmed:(__OpaqueSOSManifest *)a3
{
  self->_confirmed = a3;
}

- (__OpaqueSOSManifest)confirmed
{
  return self->_confirmed;
}

- (void)setProposed:(__OpaqueSOSManifest *)a3
{
  self->_proposed = a3;
}

- (__OpaqueSOSManifest)proposed
{
  return self->_proposed;
}

- (void)setLocal:(__OpaqueSOSManifest *)a3
{
  self->_local = a3;
}

- (__OpaqueSOSManifest)local
{
  return self->_local;
}

- (__OpaqueSOSCoder)coder
{
  return self->_coder;
}

- (void)setPeer:(__OpaqueSOSPeer *)a3
{
  self->_peer = a3;
}

- (__OpaqueSOSPeer)peer
{
  return self->_peer;
}

- (void)setEngine:(__OpaqueSOSEngine *)a3
{
  self->_engine = a3;
}

- (__OpaqueSOSEngine)engine
{
  return self->_engine;
}

- (void)setCallbackBlock:(id)a3
{
}

- (id)callbackBlock
{
  return self->_callbackBlock;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (qword_10035D088 != -1) {
    dispatch_once(&qword_10035D088, &stru_100303A98);
  }
  if (!byte_10035BC68) {
    return 0;
  }
  v4 = objc_opt_new();
  if (v4)
  {
    engine = self->_engine;
    if (engine) {
      CFRetain(self->_engine);
    }
    [v4 setEngine:engine];
    peer = self->_peer;
    if (peer) {
      CFRetain(self->_peer);
    }
    [v4 setPeer:peer];
    local = self->_local;
    if (local) {
      CFRetain(self->_local);
    }
    [v4 setLocal:local];
    proposed = self->_proposed;
    if (proposed) {
      CFRetain(self->_proposed);
    }
    [v4 setProposed:proposed];
    confirmed = self->_confirmed;
    if (confirmed) {
      CFRetain(self->_confirmed);
    }
    [v4 setConfirmed:confirmed];
    message = self->_message;
    if (message) {
      CFRetain(self->_message);
    }
    [v4 setMessage:message];
    [v4 setCoder:self->_coder];
    [v4 setCallbackBlock:self->_callbackBlock];
  }
  return v4;
}

- (void)dealloc
{
  if (qword_10035D088 != -1) {
    dispatch_once(&qword_10035D088, &stru_100303A98);
  }
  if (byte_10035BC68)
  {
    engine = self->_engine;
    if (engine)
    {
      self->_engine = 0;
      CFRelease(engine);
    }
    peer = self->_peer;
    if (peer)
    {
      self->_peer = 0;
      CFRelease(peer);
    }
    local = self->_local;
    if (local)
    {
      self->_local = 0;
      CFRelease(local);
    }
    proposed = self->_proposed;
    if (proposed)
    {
      self->_proposed = 0;
      CFRelease(proposed);
    }
    confirmed = self->_confirmed;
    if (confirmed)
    {
      self->_confirmed = 0;
      CFRelease(confirmed);
    }
    message = self->_message;
    if (message)
    {
      self->_message = 0;
      CFRelease(message);
    }
    coder = self->_coder;
    if (coder) {
      CFRelease(coder);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)SOSEnginePeerMessageCallBackInfo;
  [(SOSEnginePeerMessageCallBackInfo *)&v10 dealloc];
}

- (void)setCoder:(__OpaqueSOSCoder *)a3
{
  if (qword_10035D088 != -1) {
    dispatch_once(&qword_10035D088, &stru_100303A98);
  }
  if (byte_10035BC68)
  {
    if (a3) {
      CFRetain(a3);
    }
    self->_coder = a3;
  }
}

- (void)setCallback:(id)a3
{
  id v4 = a3;
  if (qword_10035D088 != -1)
  {
    id v8 = v4;
    dispatch_once(&qword_10035D088, &stru_100303A98);
    id v4 = v8;
  }
  if (byte_10035BC68)
  {
    id v7 = v4;
    id v5 = objc_retainBlock(v4);
    id callbackBlock = self->_callbackBlock;
    self->_id callbackBlock = v5;

    id v4 = v7;
  }
}

- (void)callCallback:(BOOL)a3
{
  if (qword_10035D088 != -1) {
    dispatch_once(&qword_10035D088, &stru_100303A98);
  }
  if (byte_10035BC68)
  {
    id v4 = (void (*)(void))*((void *)self->_callbackBlock + 2);
    v4();
  }
}

- (SOSEnginePeerMessageCallBackInfo)initWithEngine:(__OpaqueSOSEngine *)a3 peer:(__OpaqueSOSPeer *)a4 localManifest:(__OpaqueSOSManifest *)a5 proposedManifest:(__OpaqueSOSManifest *)a6 confirmedManifest:(__OpaqueSOSManifest *)a7 andMessage:(__OpaqueSOSMessage *)a8
{
  if (qword_10035D088 != -1) {
    dispatch_once(&qword_10035D088, &stru_100303A98);
  }
  if (byte_10035BC68)
  {
    v20.receiver = self;
    v20.super_class = (Class)SOSEnginePeerMessageCallBackInfo;
    v15 = [(SOSEnginePeerMessageCallBackInfo *)&v20 init];
    v16 = v15;
    if (v15)
    {
      id callbackBlock = v15->_callbackBlock;
      v15->_id callbackBlock = 0;

      if (a3) {
        CFRetain(a3);
      }
      v16->_engine = a3;
      if (a4) {
        CFRetain(a4);
      }
      v16->_peer = a4;
      if (a5) {
        CFRetain(a5);
      }
      v16->_local = a5;
      if (a6) {
        CFRetain(a6);
      }
      v16->_proposed = a6;
      if (a7) {
        CFRetain(a7);
      }
      v16->_confirmed = a7;
      if (a8) {
        CFRetain(a8);
      }
      v16->_message = a8;
    }
    self = v16;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end