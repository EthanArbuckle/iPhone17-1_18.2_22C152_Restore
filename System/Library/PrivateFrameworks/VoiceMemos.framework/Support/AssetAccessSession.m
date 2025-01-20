@interface AssetAccessSession
- (AssetAccessSession)initWithAccessToken:(id)a3 compositionAVURL:(id)a4 xpcConnection:(id)a5 xpcTransaction:(id)a6;
- (BOOL)isCaptureActive;
- (NSURL)compositionAVURL;
- (NSXPCConnection)xpcConnection;
- (OS_os_transaction)xpcTransaction;
- (RCSSavedRecordingAccessToken)accessToken;
- (id)debugDescription;
- (void)setIsCaptureActive:(BOOL)a3;
- (void)setXpcTransaction:(id)a3;
@end

@implementation AssetAccessSession

- (AssetAccessSession)initWithAccessToken:(id)a3 compositionAVURL:(id)a4 xpcConnection:(id)a5 xpcTransaction:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AssetAccessSession;
  v15 = [(AssetAccessSession *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accessToken, a3);
    objc_storeStrong((id *)&v16->_compositionAVURL, a4);
    objc_storeStrong((id *)&v16->_xpcConnection, a5);
    objc_storeStrong((id *)&v16->_xpcTransaction, a6);
  }

  return v16;
}

- (id)debugDescription
{
  v7.receiver = self;
  v7.super_class = (Class)AssetAccessSession;
  v3 = [(AssetAccessSession *)&v7 debugDescription];
  v4 = [(RCSSavedRecordingAccessToken *)self->_accessToken debugDescription];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (RCSSavedRecordingAccessToken)accessToken
{
  return self->_accessToken;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (BOOL)isCaptureActive
{
  return self->_isCaptureActive;
}

- (void)setIsCaptureActive:(BOOL)a3
{
  self->_isCaptureActive = a3;
}

- (NSURL)compositionAVURL
{
  return self->_compositionAVURL;
}

- (OS_os_transaction)xpcTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 40, 1);
}

- (void)setXpcTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcTransaction, 0);
  objc_storeStrong((id *)&self->_compositionAVURL, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
}

@end