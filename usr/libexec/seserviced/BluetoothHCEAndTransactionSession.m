@interface BluetoothHCEAndTransactionSession
+ (void)startFirstApproachForKeyWithIdentifier:(id)a3;
- (BluetoothHCEAndTransactionSession)initWithDelegate:(id)a3;
- (id)readAPDU;
- (id)sendAPDU:(id)a3;
- (void)dealloc;
- (void)endSession;
- (void)pairingEndedWithResult:(id)a3;
- (void)startHceEmulation;
- (void)startTransactionEmulationForKeyWithIdentifier:(id)a3;
- (void)stopHceEmulation;
- (void)stopTransactionEmulation;
@end

@implementation BluetoothHCEAndTransactionSession

- (BluetoothHCEAndTransactionSession)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BluetoothHCEAndTransactionSession;
  v5 = [(BluetoothHCEAndTransactionSession *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->delegate, v4);
  }

  return v6;
}

- (void)dealloc
{
  v3 = +[AlishaPairingExternal shared];
  [v3 stopOwnerPairing];

  v4.receiver = self;
  v4.super_class = (Class)BluetoothHCEAndTransactionSession;
  [(BluetoothHCEAndTransactionSession *)&v4 dealloc];
}

- (void)startHceEmulation
{
  int64_t token = self->token;
  p_int64_t token = &self->token;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063194;
  block[3] = &unk_10040B880;
  block[4] = self;
  if (token != -1) {
    dispatch_once(p_token, block);
  }
  v5 = +[AlishaPairingExternal shared];
  [v5 startHceEmulation];
}

- (void)stopHceEmulation
{
  id v2 = +[AlishaPairingExternal shared];
  [v2 stopHceEmulation];
}

- (void)startTransactionEmulationForKeyWithIdentifier:(id)a3
{
  id v3 = a3;
  id v5 = +[AlishaPairingExternal shared];
  objc_super v4 = [v3 hexStringAsData];

  [v5 startTransactionEmulationFor:v4];
}

- (void)stopTransactionEmulation
{
  id v2 = +[AlishaPairingExternal shared];
  [v2 stopTransactionEmulation];
}

- (void)pairingEndedWithResult:(id)a3
{
  id v3 = a3;
  id v4 = +[AlishaPairingExternal shared];
  [v4 pairingEndedWithError:v3];
}

- (void)endSession
{
  id v2 = +[AlishaPairingExternal shared];
  [v2 endSession];
}

- (id)readAPDU
{
  id v2 = +[AlishaPairingExternal shared];
  id v3 = [v2 readAPDU];

  return v3;
}

- (id)sendAPDU:(id)a3
{
  id v3 = a3;
  id v4 = +[AlishaPairingExternal shared];
  id v5 = [v4 sendAPDU:v3];

  return v5;
}

+ (void)startFirstApproachForKeyWithIdentifier:(id)a3
{
  id v3 = a3;
  id v5 = +[AlishaPairingExternal shared];
  id v4 = [v3 hexStringAsData];

  [v5 startFirstApproachFor:v4];
}

- (void).cxx_destruct
{
}

@end