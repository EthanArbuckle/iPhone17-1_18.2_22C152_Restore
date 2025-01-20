@interface NRBabelInterface
- (BOOL)dtlsEnabled;
- (BOOL)isLocalAddressEqualTo:(const in6_addr *)a3;
- (BOOL)setupLocalAddressCheckAgainst:(const in6_addr *)a3;
- (BOOL)viable;
- (NRBabelInstance)instance;
- (NRBabelInterface)initWithInstance:(id)a3;
- (OS_dispatch_source)outgoingPublicHelloTimer;
- (in6_addr)localAddress;
- (in6_addr)localAddressInner;
- (unsigned)mtu;
- (unsigned)outgoingPublicHelloSeqno;
- (void)dealloc;
- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5;
- (void)setDtlsEnabled:(BOOL)a3;
- (void)setInstance:(id)a3;
- (void)setLocalAddress:(in6_addr *)a3;
- (void)setLocalAddressInner:(in6_addr)a3;
- (void)setMtu:(unsigned __int16)a3;
- (void)setOutgoingPublicHelloSeqno:(unsigned __int16)a3;
- (void)setOutgoingPublicHelloTimer:(id)a3;
- (void)setViable:(BOOL)a3;
@end

@implementation NRBabelInterface

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_instance);

  objc_storeStrong((id *)&self->_outgoingPublicHelloTimer, 0);
}

- (void)setDtlsEnabled:(BOOL)a3
{
  self->_dtlsEnabled = a3;
}

- (BOOL)dtlsEnabled
{
  return self->_dtlsEnabled;
}

- (void)setViable:(BOOL)a3
{
  self->_viable = a3;
}

- (BOOL)viable
{
  return self->_viable;
}

- (void)setMtu:(unsigned __int16)a3
{
  self->_mtu = a3;
}

- (unsigned)mtu
{
  return self->_mtu;
}

- (void)setLocalAddressInner:(in6_addr)a3
{
  self->_localAddressInner = a3;
}

- (in6_addr)localAddressInner
{
  uint64_t v2 = *(void *)&self->_localAddressInner.__u6_addr32[2];
  uint64_t v3 = *(void *)self->_localAddressInner.__u6_addr8;
  *(void *)&result.__u6_addr32[2] = v2;
  *(void *)result.__u6_addr8 = v3;
  return result;
}

- (void)setInstance:(id)a3
{
}

- (NRBabelInstance)instance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_instance);

  return (NRBabelInstance *)WeakRetained;
}

- (void)setOutgoingPublicHelloTimer:(id)a3
{
}

- (OS_dispatch_source)outgoingPublicHelloTimer
{
  return self->_outgoingPublicHelloTimer;
}

- (void)setOutgoingPublicHelloSeqno:(unsigned __int16)a3
{
  self->_outgoingPublicHelloSeqno = a3;
}

- (unsigned)outgoingPublicHelloSeqno
{
  return self->_outgoingPublicHelloSeqno;
}

- (BOOL)isLocalAddressEqualTo:(const in6_addr *)a3
{
  return *(void *)self->_localAddressInner.__u6_addr8 == *(void *)a3->__u6_addr8
      && *(void *)&self->_localAddressInner.__u6_addr32[2] == *(void *)&a3->__u6_addr32[2];
}

- (void)sendPacket:(iovec *)a3 iovLen:(unsigned int)a4 toAddr:(const in6_addr *)a5
{
  v5 = &unk_1001F4000;
  if (qword_1001F4A58 != -1) {
    goto LABEL_7;
  }
  while (1)
  {
    if (_NRLogIsLevelEnabled())
    {
      if (v5[331] != -1) {
        dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
      }
      _NRLogWithArgs();
    }
    v5 = (void *)_os_log_pack_size();
    __chkstk_darwin(v5);
    __error();
    uint64_t v6 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v6 = 136446210;
    *(void *)(v6 + 4) = "-[NRBabelInterface sendPacket:iovLen:toAddr:]";
    sub_1000B9E04();
    _NRLogAbortWithPack();
LABEL_7:
    dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
  }
}

- (BOOL)setupLocalAddressCheckAgainst:(const in6_addr *)a3
{
  return 1;
}

- (void)dealloc
{
  outgoingPublicHelloTimer = self->_outgoingPublicHelloTimer;
  if (outgoingPublicHelloTimer)
  {
    dispatch_source_cancel(outgoingPublicHelloTimer);
    v4 = self->_outgoingPublicHelloTimer;
    self->_outgoingPublicHelloTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NRBabelInterface;
  [(NRBabelInterface *)&v5 dealloc];
}

- (NRBabelInterface)initWithInstance:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NRBabelInterface;
  objc_super v5 = [(NRBabelInterface *)&v20 init];
  if (!v5)
  {
    id v12 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v14 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    uint64_t v15 = _os_log_pack_size();
    __chkstk_darwin(v15);
    __error();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136446210;
    *(void *)(v16 + 4) = "-[NRBabelInterface initWithInstance:]";
    sub_1000B9E04();
    _NRLogAbortWithPack();
  }
  uint64_t v6 = v5;
  [(NRBabelInterface *)v5 setInstance:v4];
  v6->_outgoingPublicHelloSeqno = arc4random_uniform(0x10000u);
  v6->_mtu = 1452;
  v7 = [v4 queue];
  dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v7);
  outgoingPublicHelloTimer = v6->_outgoingPublicHelloTimer;
  v6->_outgoingPublicHelloTimer = (OS_dispatch_source *)v8;

  dispatch_source_set_timer((dispatch_source_t)v6->_outgoingPublicHelloTimer, 0x8000000000000000, 0xEE6B2800uLL, 0x989680uLL);
  objc_initWeak(&location, v6);
  v10 = v6->_outgoingPublicHelloTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000BA344;
  handler[3] = &unk_1001C7FF0;
  objc_copyWeak(&v18, &location);
  dispatch_source_set_event_handler(v10, handler);
  dispatch_activate((dispatch_object_t)v6->_outgoingPublicHelloTimer);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v6;
}

- (void)setLocalAddress:(in6_addr *)a3
{
  self->_localAddressInner = *a3;
}

- (in6_addr)localAddress
{
  return &self->_localAddressInner;
}

@end