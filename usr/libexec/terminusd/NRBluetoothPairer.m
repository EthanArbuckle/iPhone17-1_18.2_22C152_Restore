@interface NRBluetoothPairer
+ (BOOL)hasPairerForNRUUID:(id)a3;
+ (void)removePairerForNRUUID:(id)a3;
- (BOOL)isUnpairRequest;
- (NRBluetoothPairer)initWithNRUUID:(id)a3;
- (NRBluetoothPairerParameters)parameters;
- (NSUUID)nrUUID;
- (OS_dispatch_queue)completionQueue;
- (id)completionBlock;
- (id)description;
- (int64_t)pairingType;
- (unint64_t)identifier;
- (void)dealloc;
- (void)pairWithParameters:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5;
- (void)setCompletionBlock:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setIsUnpairRequest:(BOOL)a3;
- (void)setNrUUID:(id)a3;
- (void)setPairingType:(int64_t)a3;
- (void)setParameters:(id)a3;
- (void)unpairWithCompletionQueue:(id)a3 completionBlock:(id)a4;
@end

@implementation NRBluetoothPairer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_nrUUID, 0);
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionQueue:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setIsUnpairRequest:(BOOL)a3
{
  self->_isUnpairRequest = a3;
}

- (BOOL)isUnpairRequest
{
  return self->_isUnpairRequest;
}

- (void)setParameters:(id)a3
{
}

- (NRBluetoothPairerParameters)parameters
{
  return self->_parameters;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setPairingType:(int64_t)a3
{
  self->_pairingType = a3;
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setNrUUID:(id)a3
{
}

- (NSUUID)nrUUID
{
  return self->_nrUUID;
}

- (void)unpairWithCompletionQueue:(id)a3 completionBlock:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (v16)
  {
    if (v6)
    {
      v7 = [(NRBluetoothPairer *)self nrUUID];
      v8 = sub_10013DC5C((uint64_t)NRDLocalDevice, v7);

      if (v8) {
        v9 = (void *)v8[5];
      }
      else {
        v9 = 0;
      }
      id v10 = v9;

      if (v10)
      {
        [(NRBluetoothPairer *)self setIsUnpairRequest:1];
        [(NRBluetoothPairer *)self setCompletionQueue:v16];
        [(NRBluetoothPairer *)self setCompletionBlock:v6];
        id v11 = +[NRBluetoothPairingManager copySharedManager];
        [v11 enqueuePairer:self];
      }
      else
      {
        if (qword_1001F4858 != -1) {
          dispatch_once(&qword_1001F4858, &stru_1001C6358);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4858 != -1) {
            dispatch_once(&qword_1001F4858, &stru_1001C6358);
          }
          _NRLogWithArgs();
        }
        (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
      }
      goto LABEL_14;
    }
    id v14 = sub_10001A9CC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
LABEL_21:
      v8 = sub_10001A9CC();
      _NRLogWithArgs();
LABEL_14:
    }
  }
  else
  {
    id v12 = sub_10001A9CC();
    int v13 = _NRLogIsLevelEnabled();

    if (v13) {
      goto LABEL_21;
    }
  }
}

- (void)pairWithParameters:(id)a3 completionQueue:(id)a4 completionBlock:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void (**)(void, void, void))v9;
  if (!v8)
  {
    id v13 = sub_10001A9CC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_13;
    }
LABEL_21:
    id v19 = sub_10001A9CC();
    _NRLogWithArgs();

    goto LABEL_13;
  }
  if (!v9)
  {
    id v15 = sub_10001A9CC();
    int v16 = _NRLogIsLevelEnabled();

    if (!v16) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
  if (!v20)
  {
    id v17 = sub_10001A9CC();
    int v18 = _NRLogIsLevelEnabled();

    if (!v18) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
  if ([v20 pairingType])
  {
    if (qword_1001F4858 != -1) {
      dispatch_once(&qword_1001F4858, &stru_1001C6358);
    }
    if (_NRLogIsLevelEnabled())
    {
      if (qword_1001F4858 != -1) {
        dispatch_once(&qword_1001F4858, &stru_1001C6358);
      }
      id v11 = (id)qword_1001F4850;
      [v20 pairingType];
      _NRLogWithArgs();
    }
    v10[2](v10, 0, 0);
  }
  else
  {
    -[NRBluetoothPairer setPairingType:](self, "setPairingType:", [v20 pairingType]);
    [(NRBluetoothPairer *)self setParameters:v20];
    [(NRBluetoothPairer *)self setCompletionQueue:v8];
    [(NRBluetoothPairer *)self setCompletionBlock:v10];
    id v12 = +[NRBluetoothPairingManager copySharedManager];
    [v12 enqueuePairer:self];
  }
LABEL_13:
}

- (void)dealloc
{
  if (qword_1001F4858 != -1) {
    dispatch_once(&qword_1001F4858, &stru_1001C6358);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F4858 != -1) {
      dispatch_once(&qword_1001F4858, &stru_1001C6358);
    }
    uint64_t v5 = 64;
    id v6 = self;
    v3 = "";
    v4 = "-[NRBluetoothPairer dealloc]";
    _NRLogWithArgs();
  }
  v7.receiver = self;
  v7.super_class = (Class)NRBluetoothPairer;
  [(NRBluetoothPairer *)&v7 dealloc];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  unint64_t identifier = self->_identifier;
  unsigned int v5 = [(NRBluetoothPairer *)self isUnpairRequest];
  id v6 = "pairing";
  if (v5) {
    id v6 = "unpairing";
  }
  id v7 = [v3 initWithFormat:@"NRBTPairer[%llu %s %@]", identifier, v6, self->_nrUUID];

  return v7;
}

- (NRBluetoothPairer)initWithNRUUID:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NRBluetoothPairer;
  id v6 = [(NRBluetoothPairer *)&v15 init];
  if (!v6)
  {
    id v10 = sub_10001A9CC();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v12 = sub_10001A9CC();
      _NRLogWithArgs();
    }
    id v5 = (id)_os_log_pack_size();
    id v7 = (NRBluetoothPairer *)((char *)&v14 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0));
    __error();
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136446210;
    *(void *)(v13 + 4) = "-[NRBluetoothPairer initWithNRUUID:]";
    sub_10001A9CC();
    _NRLogAbortWithPack();
LABEL_14:
    dispatch_once(&qword_1001F4858, &stru_1001C6358);
    goto LABEL_4;
  }
  id v7 = v6;
  if (!_NRIsAppleInternal())
  {
    id v8 = 0;
    goto LABEL_10;
  }
  v7->_unint64_t identifier = atomic_fetch_add_explicit(&qword_1001F3C00, 1uLL, memory_order_relaxed);
  objc_storeStrong((id *)&v7->_nrUUID, v3);
  id v3 = &unk_1001F4000;
  if (qword_1001F4858 != -1) {
    goto LABEL_14;
  }
LABEL_4:
  if (_NRLogIsLevelEnabled())
  {
    if (v3[267] != -1) {
      dispatch_once(&qword_1001F4858, &stru_1001C6358);
    }
    _NRLogWithArgs();
  }
  id v8 = v7;
LABEL_10:

  return v8;
}

+ (void)removePairerForNRUUID:(id)a3
{
  id v3 = a3;
  id v4 = +[NRBluetoothPairingManager copySharedManager];
  [v4 removePairerForNRUUID:v3];
}

+ (BOOL)hasPairerForNRUUID:(id)a3
{
  id v3 = a3;
  id v4 = +[NRBluetoothPairingManager copySharedManager];
  unsigned __int8 v5 = [v4 hasPairerForNRUUID:v3];

  return v5;
}

@end