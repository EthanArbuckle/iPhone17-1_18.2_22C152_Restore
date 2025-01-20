@interface UAPairedSFActivityAdvertiser
- (SFActivityAdvertiserDelegate)delegate;
- (SFPeerDevice)peer;
- (UAPairedSFActivityAdvertiser)initWithDelegate:(id)a3;
- (UAPairedSFActivityScanner)pairedScanner;
- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4;
- (void)fetchLoginIDWithCompletionHandler:(id)a3;
- (void)fetchPeerForUUID:(id)a3 withCompletionHandler:(id)a4;
- (void)fetchSFPeerDevicesWithCompletionHandler:(id)a3;
- (void)payloadRequestFromPeer:(id)a3 advertisementPayload:(id)a4 command:(id)a5 completionHandler:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setPairedScanner:(id)a3;
@end

@implementation UAPairedSFActivityAdvertiser

- (UAPairedSFActivityAdvertiser)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UAPairedSFActivityAdvertiser;
  v5 = [(UAPairedSFActivityAdvertiser *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(UAPairedSFActivityAdvertiser *)v5 setDelegate:v4];
    uint64_t v7 = +[SFPeerDevice peerForSelf];
    peer = v6->_peer;
    v6->_peer = (SFPeerDevice *)v7;

    v9 = [(UAPairedSFActivityAdvertiser *)v6 peer];
    [v9 setName:@"PairedAdvertiser"];
  }
  return v6;
}

- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(UAPairedSFActivityAdvertiser *)self pairedScanner];

  if (v8)
  {
    v9 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100041F68;
    block[3] = &unk_1000C4F10;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

- (void)fetchSFPeerDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000420AC;
  v7[3] = &unk_1000C5328;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)fetchPeerForUUID:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004228C;
  block[3] = &unk_1000C58F8;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)fetchLoginIDWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004243C;
  block[3] = &unk_1000C4E78;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)payloadRequestFromPeer:(id)a3 advertisementPayload:(id)a4 command:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000425BC;
  block[3] = &unk_1000C5948;
  void block[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v14, block);
}

- (UAPairedSFActivityScanner)pairedScanner
{
  return (UAPairedSFActivityScanner *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPairedScanner:(id)a3
{
}

- (SFActivityAdvertiserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SFActivityAdvertiserDelegate *)a3;
}

- (SFPeerDevice)peer
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peer, 0);

  objc_storeStrong((id *)&self->_pairedScanner, 0);
}

@end