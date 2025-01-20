@interface RCSAssetWriter
- (NSXPCConnection)xpcConnection;
- (RCSSavedRecordingAccessToken)accessToken;
- (void)setAccessToken:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation RCSAssetWriter

- (RCSSavedRecordingAccessToken)accessToken
{
  return self->_accessToken;
}

- (void)setAccessToken:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
}

@end