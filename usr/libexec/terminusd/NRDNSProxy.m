@interface NRDNSProxy
- (NRDNSProxy)initWithQueue:(id)a3 nrUUID:(id)a4 delegate:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)start;
@end

@implementation NRDNSProxy

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nrUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serverCertificateData, 0);

  objc_storeStrong((id *)&self->_serverEndpoint, 0);
}

- (void)cancel
{
  v3 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    v5 = (void *)_NRCopyLogObjectForNRUUID();
    _NRLogWithArgs();
  }
  if (self) {
    self->_cancelled = 1;
  }
}

- (void)dealloc
{
  v3 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    if (self) {
      nrUUID = self->_nrUUID;
    }
    else {
      nrUUID = 0;
    }
    v6 = nrUUID;
    v7 = (void *)_NRCopyLogObjectForNRUUID();
    uint64_t v10 = 90;
    v11 = self;
    v8 = "";
    v9 = "-[NRDNSProxy dealloc]";
    _NRLogWithArgs();
  }
  if (!self || !self->_cancelled) {
    [(NRDNSProxy *)self cancel];
  }
  v12.receiver = self;
  v12.super_class = (Class)NRDNSProxy;
  [(NRDNSProxy *)&v12 dealloc];
}

- (void)start
{
  if (!self || !self->_started)
  {
    v3 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      v5 = (void *)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();
    }
    if (self) {
      self->_started = 1;
    }
  }
}

- (NRDNSProxy)initWithQueue:(id)a3 nrUUID:(id)a4 delegate:(id)a5
{
  v8 = (OS_dispatch_queue *)a3;
  v9 = (NSUUID *)a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NRDNSProxy;
  v11 = [(NRDNSProxy *)&v21 init];
  if (!v11)
  {
    id v17 = sub_10001E14C();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v19 = sub_10001E14C();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v20 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v20 = 136446210;
    *(void *)(v20 + 4) = "-[NRDNSProxy initWithQueue:nrUUID:delegate:]";
    sub_10001E14C();
    _NRLogAbortWithPack();
  }
  objc_super v12 = v11;
  v11->_identifier = atomic_fetch_add_explicit(&qword_1001F3C68, 1uLL, memory_order_relaxed);
  queue = v11->_queue;
  v11->_queue = v8;
  v14 = v8;

  nrUUID = v12->_nrUUID;
  v12->_nrUUID = v9;

  objc_storeWeak((id *)&v12->_delegate, v10);
  v12->_state = 0;

  return v12;
}

@end