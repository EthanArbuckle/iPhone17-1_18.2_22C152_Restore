@interface NRBabelLinkFake
- (NRBabelLinkFake)initWithName:(id)a3;
- (NSMutableArray)fakeInterfaces;
- (NSString)name;
- (unsigned)fakeLinkIndex;
- (void)setFakeInterfaces:(id)a3;
- (void)setFakeLinkIndex:(unsigned __int16)a3;
- (void)setName:(id)a3;
@end

@implementation NRBabelLinkFake

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_fakeInterfaces, 0);
}

- (void)setFakeLinkIndex:(unsigned __int16)a3
{
  self->_fakeLinkIndex = a3;
}

- (unsigned)fakeLinkIndex
{
  return self->_fakeLinkIndex;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setFakeInterfaces:(id)a3
{
}

- (NSMutableArray)fakeInterfaces
{
  return self->_fakeInterfaces;
}

- (NRBabelLinkFake)initWithName:(id)a3
{
  v4 = (NSString *)a3;
  v16.receiver = self;
  v16.super_class = (Class)NRBabelLinkFake;
  v5 = [(NRBabelLinkFake *)&v16 init];
  if (!v5)
  {
    id v12 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v14 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v15 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v15 = 136446210;
    *(void *)(v15 + 4) = "-[NRBabelLinkFake initWithName:]";
    sub_1000B9E04();
    _NRLogAbortWithPack();
  }
  v6 = v5;
  name = v5->_name;
  v5->_name = v4;
  v8 = v4;

  v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  fakeInterfaces = v6->_fakeInterfaces;
  v6->_fakeInterfaces = v9;

  v6->_fakeLinkIndex = atomic_fetch_add_explicit(word_1001F3ED8, 1u, memory_order_relaxed);
  return v6;
}

@end