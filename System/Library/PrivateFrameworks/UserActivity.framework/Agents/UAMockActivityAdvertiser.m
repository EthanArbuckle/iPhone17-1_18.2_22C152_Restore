@interface UAMockActivityAdvertiser
- (SFActivityAdvertiserDelegate)delegate;
- (UAActivityReplay)controller;
- (UAMockActivityAdvertiser)initWithController:(id)a3;
- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4;
- (void)fetchLoginIDWithCompletionHandler:(id)a3;
- (void)fetchPeerForUUID:(id)a3 withCompletionHandler:(id)a4;
- (void)fetchSFPeerDevicesWithCompletionHandler:(id)a3;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation UAMockActivityAdvertiser

- (UAMockActivityAdvertiser)initWithController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UAMockActivityAdvertiser;
  v6 = [(UAMockActivityAdvertiser *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_controller, a3);
  }

  return v7;
}

- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UAMockActivityAdvertiser *)self controller];
  [v8 doAdvertiseAdvertisementPayload:v7 options:v6];
}

- (void)fetchSFPeerDevicesWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  id v5 = [(UAMockActivityAdvertiser *)self controller];
  id v6 = [v5 pairedPeer];

  if (v6)
  {
    id v9 = [(UAMockActivityAdvertiser *)self controller];
    uint64_t v7 = [v9 pairedPeer];
    id v8 = +[NSSet setWithObject:v7];
    v4[2](v4, v8, 0);

    v4 = (void (**)(id, void *, void))v7;
  }
  else
  {
    id v9 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-1 userInfo:0];
    ((void (*)(void (**)(id, void *, void), void))v4[2])(v4, 0);
  }
}

- (void)fetchPeerForUUID:(id)a3 withCompletionHandler:(id)a4
{
  id v16 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  if (v16)
  {
    uint64_t v7 = [(UAMockActivityAdvertiser *)self controller];
    uint64_t v8 = [v7 pairedPeer];
    if (v8)
    {
      id v9 = (void *)v8;
      v10 = [(UAMockActivityAdvertiser *)self controller];
      v11 = [v10 pairedPeer];
      v12 = [v11 uniqueID];
      unsigned int v13 = [v12 isEqual:v16];

      if (v13)
      {
        v14 = [(UAMockActivityAdvertiser *)self controller];
        v15 = [v14 pairedPeer];
        v6[2](v6, v15, 0);

        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v14 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-1 userInfo:0];
  ((void (**)(id, void *, void *))v6)[2](v6, 0, v14);
LABEL_7:
}

- (void)fetchLoginIDWithCompletionHandler:(id)a3
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

- (UAActivityReplay)controller
{
  return (UAActivityReplay *)objc_getProperty(self, a2, 16, 1);
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end