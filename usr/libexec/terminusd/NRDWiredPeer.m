@interface NRDWiredPeer
- (NRDWiredPeer)init;
- (NSMutableDictionary)interfaceToPeerAddressDictionary;
- (id)description;
- (void)setInterfaceToPeerAddressDictionary:(id)a3;
@end

@implementation NRDWiredPeer

- (void).cxx_destruct
{
}

- (void)setInterfaceToPeerAddressDictionary:(id)a3
{
}

- (NSMutableDictionary)interfaceToPeerAddressDictionary
{
  return self->_interfaceToPeerAddressDictionary;
}

- (id)description
{
  return [(NSMutableDictionary *)self->_interfaceToPeerAddressDictionary description];
}

- (NRDWiredPeer)init
{
  v11.receiver = self;
  v11.super_class = (Class)NRDWiredPeer;
  v2 = [(NRDWiredPeer *)&v11 init];
  if (!v2)
  {
    id v7 = sub_1000CFBB4();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v9 = sub_1000CFBB4();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v10 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v10 = 136446210;
    *(void *)(v10 + 4) = "-[NRDWiredPeer init]";
    sub_1000CFBB4();
    _NRLogAbortWithPack();
  }
  v3 = v2;
  v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  interfaceToPeerAddressDictionary = v3->_interfaceToPeerAddressDictionary;
  v3->_interfaceToPeerAddressDictionary = v4;

  return v3;
}

@end