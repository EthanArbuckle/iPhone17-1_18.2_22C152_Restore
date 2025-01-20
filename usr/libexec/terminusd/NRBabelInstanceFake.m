@interface NRBabelInstanceFake
- (NRBabelInstanceFake)initWithName:(id)a3;
- (NSString)name;
- (id)description;
- (void)setName:(id)a3;
@end

@implementation NRBabelInstanceFake

- (void).cxx_destruct
{
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"{%@} ", self->_name];

  return v2;
}

- (NRBabelInstanceFake)initWithName:(id)a3
{
  v3 = a3;
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NRBabelInstanceFake;
  v6 = [(NRBabelInstance *)&v24 init];
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)&v6->_name, v3);
    [(NRBabelInstance *)v7 setRouterID:bswap64(atomic_fetch_add_explicit(&qword_1001F3EE0, 1uLL, memory_order_relaxed))];
    [(NRBabelInstance *)v7 setNodeSeqno:0];
    v3 = &unk_1001F4000;
    if (qword_1001F4A58 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    id v19 = sub_1000B9E04();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v21 = sub_1000B9E04();
      _NRLogWithArgs();
    }
    id v5 = (id)_os_log_pack_size();
    v7 = (NRBabelInstanceFake *)((char *)&v23 - ((__chkstk_darwin(v5) + 15) & 0xFFFFFFFFFFFFFFF0));
    __error();
    uint64_t v22 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v22 = 136446210;
    *(void *)(v22 + 4) = "-[NRBabelInstanceFake initWithName:]";
    sub_1000B9E04();
    _NRLogAbortWithPack();
  }
  dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
LABEL_3:
  if (_NRLogIsLevelEnabled())
  {
    if (v3[331] != -1) {
      dispatch_once(&qword_1001F4A58, &stru_1001C71C0);
    }
    id v8 = (id)qword_1001F4A50;
    unint64_t v9 = [(NRBabelInstance *)v7 routerID];
    unint64_t v10 = bswap64(v9);
    if (v10 > 0xFFFE)
    {
      unsigned int v12 = v9;
      unint64_t v13 = HIWORD(v9);
      unint64_t v14 = HIDWORD(v9);
      id v15 = objc_alloc((Class)NSString);
      unsigned int v16 = bswap32(v12);
      id v11 = [v15 initWithFormat:@"<%x:%x:%x:%x>", HIWORD(v16), (unsigned __int16)v16, bswap32(v14) >> 16, __rev16(v13)];
    }
    else
    {
      id v11 = [objc_alloc((Class)NSString) initWithFormat:@"<%llx>", v10];
    }
    v17 = v11;
    _NRLogWithArgs();
  }
  return v7;
}

@end