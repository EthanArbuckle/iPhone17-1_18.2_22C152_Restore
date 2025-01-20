@interface UAPairedSFActivityScanner
- (BOOL)sendFoundDevice;
- (SFActivityScannerDelegate)delegate;
- (SFPeerDevice)peer;
- (UAPairedSFActivityAdvertiser)pairedAdvertiser;
- (UAPairedSFActivityScanner)initWithDelegate:(id)a3;
- (void)activityPayloadFromDevice:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(unint64_t)a6 withCompletionHandler:(id)a7;
- (void)receiveAdvertisement:(id)a3 options:(id)a4 fromPeer:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setPairedAdvertiser:(id)a3;
- (void)setSendFoundDevice:(BOOL)a3;
@end

@implementation UAPairedSFActivityScanner

- (UAPairedSFActivityScanner)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UAPairedSFActivityScanner;
  v5 = [(UAPairedSFActivityScanner *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(UAPairedSFActivityScanner *)v5 setDelegate:v4];
    uint64_t v7 = +[SFPeerDevice peerForSelf];
    peer = v6->_peer;
    v6->_peer = (SFPeerDevice *)v7;

    v9 = [(UAPairedSFActivityScanner *)v6 peer];
    [v9 setName:@"PairedAdvertiser"];
  }
  return v6;
}

- (void)receiveAdvertisement:(id)a3 options:(id)a4 fromPeer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = dispatch_get_global_queue(0, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000428DC;
  v15[3] = &unk_1000C5970;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)activityPayloadFromDevice:(id)a3 forAdvertisementPayload:(id)a4 command:(id)a5 timeout:(unint64_t)a6 withCompletionHandler:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a7;
  id v13 = dispatch_get_global_queue(0, 0);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100042AC4;
  v17[3] = &unk_1000C5998;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);
}

- (UAPairedSFActivityAdvertiser)pairedAdvertiser
{
  return (UAPairedSFActivityAdvertiser *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPairedAdvertiser:(id)a3
{
}

- (SFActivityScannerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SFActivityScannerDelegate *)a3;
}

- (SFPeerDevice)peer
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)sendFoundDevice
{
  return self->_sendFoundDevice;
}

- (void)setSendFoundDevice:(BOOL)a3
{
  self->_sendFoundDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peer, 0);

  objc_storeStrong((id *)&self->_pairedAdvertiser, 0);
}

@end