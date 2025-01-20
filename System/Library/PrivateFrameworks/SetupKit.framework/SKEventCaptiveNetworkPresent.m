@interface SKEventCaptiveNetworkPresent
- (NSString)captiveInterfaceIdentifier;
- (NSString)captiveSSID;
- (NSURL)captiveURL;
- (SKEventCaptiveNetworkPresent)initWithCaptiveURL:(id)a3 interfaceIdentifier:(id)a4 ssid:(id)a5;
- (id)descriptionWithLevel:(int)a3;
@end

@implementation SKEventCaptiveNetworkPresent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captiveURL, 0);
  objc_storeStrong((id *)&self->_captiveSSID, 0);

  objc_storeStrong((id *)&self->_captiveInterfaceIdentifier, 0);
}

- (NSURL)captiveURL
{
  return self->_captiveURL;
}

- (NSString)captiveSSID
{
  return self->_captiveSSID;
}

- (NSString)captiveInterfaceIdentifier
{
  return self->_captiveInterfaceIdentifier;
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v3 = 0;
  }
  else
  {
    v10 = [(id)objc_opt_class() description];
    CUAppendF();
    id v3 = 0;
  }
  CUAppendF();
  id v4 = v3;

  CUAppendF();
  id v5 = v4;

  CUAppendF();
  v6 = (__CFString *)v5;

  v7 = &stru_26D1CA560;
  if (v6) {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (SKEventCaptiveNetworkPresent)initWithCaptiveURL:(id)a3 interfaceIdentifier:(id)a4 ssid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SKEvent *)self initWithEventType:200];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    captiveInterfaceIdentifier = v11->_captiveInterfaceIdentifier;
    v11->_captiveInterfaceIdentifier = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    captiveSSID = v11->_captiveSSID;
    v11->_captiveSSID = (NSString *)v14;

    uint64_t v16 = [v8 copy];
    captiveURL = v11->_captiveURL;
    v11->_captiveURL = (NSURL *)v16;

    v18 = v11;
  }

  return v11;
}

@end