@interface NRDevicePairingDirector
- (NRDevicePairingDirector)init;
@end

@implementation NRDevicePairingDirector

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_managerOwningBTConnections);
  objc_storeStrong((id *)&self->_devicePairingConnections, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (NRDevicePairingDirector)init
{
  v13.receiver = self;
  v13.super_class = (Class)NRDevicePairingDirector;
  v2 = [(NRDevicePairingDirector *)&v13 init];
  if (!v2)
  {
    id v9 = sub_1001071DC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v11 = sub_1001071DC();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136446210;
    *(void *)(v12 + 4) = "-[NRDevicePairingDirector init]";
    sub_1001071DC();
    _NRLogAbortWithPack();
  }
  v3 = v2;
  v4 = (OS_dispatch_queue *)sub_10015BD9C();
  queue = v3->_queue;
  v3->_queue = v4;

  v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  devicePairingConnections = v3->_devicePairingConnections;
  v3->_devicePairingConnections = v6;

  return v3;
}

@end