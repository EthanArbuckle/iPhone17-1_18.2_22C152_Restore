@interface NRLinkManager
- (BOOL)endpointsAreCompatible:(id)a3 remoteEndpoint:(id)a4;
- (BOOL)shouldCreateLinkForNRUUID:(id)a3;
- (id)copyName;
- (id)copyStatusString;
- (id)initManagerWithQueue:(id)a3 managerDelegate:(id)a4;
- (void)invalidateManager;
- (void)reportEvent:(unsigned int)a3;
- (void)reportEvent:(unsigned int)a3 details:(id)a4;
- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4;
@end

@implementation NRLinkManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_managerDelegate);
}

- (BOOL)endpointsAreCompatible:(id)a3 remoteEndpoint:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 addressFamily];
  if (v7 != [v6 addressFamily]) {
    goto LABEL_3;
  }
  v8 = [v5 hostname];
  v9 = [v6 hostname];
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if (v10) {
    goto LABEL_3;
  }
  v13 = [v5 address];
  v14 = [v6 address];
  if ([v5 addressFamily] != (id)2)
  {
    if ([v5 addressFamily] == (id)30)
    {
      BOOL v15 = v13[8] == 254 && (v13[9] & 0xC0) == 128;
      if (v14[8] == 254)
      {
        if (v15 == ((v14[9] & 0xC0) == 128)) {
          goto LABEL_16;
        }
        goto LABEL_3;
      }
      if (v15) {
        goto LABEL_3;
      }
    }
LABEL_16:
    BOOL v11 = 1;
    goto LABEL_4;
  }
  if ((*((__int16 *)v13 + 2) != -343) != (*((__int16 *)v14 + 2) == -343)) {
    goto LABEL_16;
  }
LABEL_3:
  BOOL v11 = 0;
LABEL_4:

  return v11;
}

- (BOOL)shouldCreateLinkForNRUUID:(id)a3
{
  id v4 = a3;
  if (self)
  {
    if (self->_type)
    {
      id v5 = sub_10013DC5C((uint64_t)NRDLocalDevice, v4);
      id v6 = v5;
      if (v5) {
        id v7 = (void *)*((void *)v5 + 16);
      }
      else {
        id v7 = 0;
      }
      id v8 = v7;

      if (v8)
      {
        if (v6) {
          v9 = (void *)v6[16];
        }
        else {
          v9 = 0;
        }
        id v10 = v9;
        BOOL v11 = [v10 allowedLinkTypes];
        v12 = +[NSNumber numberWithUnsignedChar:self->_type];
        LOBYTE(self) = [v11 containsObject:v12];
      }
      else
      {
        LOBYTE(self) = 1;
      }
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (void)invalidateManager
{
}

- (void)reportEvent:(unsigned int)a3
{
}

- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:&v8];

  [(NRLinkManager *)self reportEvent:v4 details:v7];
}

- (void)reportEvent:(unsigned int)a3 details:(id)a4
{
  id v6 = a4;
  id v7 = [(NRLinkManager *)self copyName];
  sub_10012F648(0, a3, v7, v6);
}

- (id)copyName
{
  return 0;
}

- (id)copyStatusString
{
  return @"No status";
}

- (id)initManagerWithQueue:(id)a3 managerDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = sub_1000D49C8();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled) {
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  dispatch_assert_queue_V2(v7);
  if (!v8)
  {
    id v15 = sub_1000D49C8();
    int v16 = _NRLogIsLevelEnabled();

    if (v16)
    {
LABEL_9:
      id v17 = sub_1000D49C8();
      _NRLogWithArgs();

      BOOL v11 = 0;
      goto LABEL_5;
    }
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_5;
  }
  v22.receiver = self;
  v22.super_class = (Class)NRLinkManager;
  v9 = [(NRLinkManager *)&v22 init];
  if (!v9)
  {
    id v18 = sub_1000D49C8();
    int v19 = _NRLogIsLevelEnabled();

    if (v19)
    {
      id v20 = sub_1000D49C8();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v21 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v21 = 136446210;
    *(void *)(v21 + 4) = "-[NRLinkManager initManagerWithQueue:managerDelegate:]";
    sub_1000D49C8();
    _NRLogAbortWithPack();
  }
  p_isa = (id *)&v9->super.isa;
  v9->_type = 0;
  v9->_state = 1001;
  objc_storeWeak((id *)&v9->_managerDelegate, v8);
  objc_storeStrong(p_isa + 3, a3);
  self = p_isa;
  BOOL v11 = self;
LABEL_5:

  return v11;
}

@end